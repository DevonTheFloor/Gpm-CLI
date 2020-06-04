const express = require('express');
const router = express.Router();
const multer = require('../middleware/multer-config')
const adminCtrl = require('../controllers/forum');
const auth = require('../middleware/auth');

//router.get('/forumStat',auth, adminCtrl.statForum);
//router.get('/chatStat',auth, adminCtrl.getAll);
//router.get('/marketstat',auth, adminCtrl.getAll);

module.exports = router;