var express = require('express');

module.exports = function(app, logger) {
  var router = express.Router();

  
  router.get('/', function (req, res, next) {
    logger.info("Reporting Health of the application");
    res.json({status: 'Wakey says the service is UP'});
  });

  app.use("/health", router);
}



