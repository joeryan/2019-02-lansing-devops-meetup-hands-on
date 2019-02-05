'use strict';
var express = require('express');
var router = express.Router();
const envName = process.env['NODE_ENV'] || 'development';
const users = require(`../../data/${envName}.users.json`)

/* GET users listing. */
router.get('/', function (req, res) {
  res.send(users);
});

module.exports = router;
