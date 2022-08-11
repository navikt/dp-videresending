const handlers = require("./lib/handlers");

if (typeof process.env.REDIRECTS === "undefined")
  throw new Error("Requires REDIRECTS to be set up");

const redirects = JSON.parse(process.env.REDIRECTS);

const redirectHandlers = handlers(redirects);

module.exports = redirectHandlers;
