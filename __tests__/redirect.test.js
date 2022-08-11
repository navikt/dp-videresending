const http = require("http");
const serve = require("micro");
const listen = require("test-listen");
const fetch = require("node-fetch");
const handlers = require("../lib/handlers");

const fetcher = (url) => fetch(url, { redirect: "manual" });

let server;

async function redirects(redirects) {
  server = new http.Server(serve(handlers(redirects)));
  const _url = await listen(server);
  return (url) => {
    const test = new URL(url, _url);
    return test;
  };
}

afterEach(() => server.close());

test("returns 404 URLs without matches", async () => {
  const url = await redirects([]);
  const response = await fetcher(url("/not/mapped/url"));

  expect(response.status).toBe(404);
});

test("matches url", async () => {
  const url = await redirects([
    { pathname: "/hello", target: "http://localhost/foo" },
  ]);
  const response = await fetcher(url("/hello"));

  expect(response.status).toBe(301);
  expect(response.headers.get("location")).toBe("http://localhost/foo");
});

test("carries over path with hostname matches", async () => {
  const url = await redirects([
    { hostname: "localhost", target: "http://localhost/foo" },
  ]);
  const response = await fetcher(url("/hello?foo=bar"));

  expect(response.status).toBe(301);
  expect(response.headers.get("location")).toBe(
    "http://localhost/foo/hello?foo=bar"
  );
});

test("does not carry over path with hostname + path", async () => {
  const url = await redirects([
    {
      hostname: "localhost",
      pathname: "/foobar",
      target: "http://localhost/foo",
    },
  ]);
  const response = await fetcher(url("/foobar?foo=bar"));
  expect(response.status).toBe(301);
  expect(response.headers.get("location")).toBe("http://localhost/foo?foo=bar");
});

test("carries over query params", async () => {
  const url = await redirects([
    { pathname: "/hello", target: "http://localhost/foo" },
  ]);
  const response = await fetcher(url("/hello?foo=bar"));

  expect(response.status).toBe(301);
  expect(response.headers.get("location")).toBe("http://localhost/foo?foo=bar");
});

test("replies to health checks", async () => {
  const url = await redirects([]);
  expect((await fetcher(url("/isalive"))).status).toBe(200);
  expect((await fetcher(url("/isready"))).status).toBe(200);
});

test("throws if target is missing", async () => {
  await expect(() => redirects([{ pathname: "/hello" }])).rejects.toThrow(
    "Invalid URL"
  );
});
