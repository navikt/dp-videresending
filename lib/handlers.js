const { send } = require("micro");
const redirect = require("micro-redirect");
const hostname = require("micro-hostname").default;
const { URLPattern } = require("urlpattern-polyfill");

function baseURL(req) {
  return `https://${req.hostname}`;
}

function isEmpty(urlParts) {
  return Object.keys(urlParts).length === 0;
}

function makeHandlers(redirects) {
  return redirects.map(({ hostname, target, method, ...urlParts }) => {
    const destination = new URL(target);
    const pattern = new URLPattern({ ...urlParts });

    return (req, res) => {
      if (method && req.method !== method) return;
      if (hostname && req.hostname !== hostname) return;
      if (!pattern.test(req.url, baseURL(req))) return;

      const original = new URL(req.url, baseURL(req));
      destination.search = original.search;
      destination.pathname = isEmpty(urlParts)
        ? destination.pathname + original.pathname
        : destination.pathname;

      return redirect(res, 301, destination);
    };
  });
}

const healthchecks = new URLPattern({
  pathname: "/(isalive|isready)",
});

module.exports = function handler(redirects) {
  const handlers = makeHandlers(redirects);
  return hostname((req, res) => {
    if (healthchecks.test(req.url, baseURL(req)))
      return send(res, 200, "healthy");

    let i = 0;
    while (!res.headersSent && i < handlers.length) {
      handlers[i++](req, res);
    }

    if (!res.headersSent) return send(res, 404, "No matching redirects found");
  });
};
