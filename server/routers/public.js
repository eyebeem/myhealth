var express = require('express');

module.exports = function(app){
    var router = express.Router();
    router.use(express.static(process.cwd() + '/public'));
/*
    router.get('/', function(req, res, next) {

        let explorerUrl = req.protocol + "://" + req.get('host') + '/explorer';

        res.json(
            {
                status: 'This API is UP', 
                msg: 'Welcome to the MyHealth API RODER!',
                explorer: explorerUrl
            }
        );



    });
*/



    app.use("/", router);
}
