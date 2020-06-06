const express = require('express');
const router = express.Router();
const multer = require('../middleware/multer-config');
const auth = require('../middleware/auth');
const marketCtrl = require('../controllers/market');

router.post('/post',auth, multer, marketCtrl.postOne);
router.get('/all',auth, marketCtrl.getAll);
router.get('/marketStat',auth,marketCtrl.statMarket);
//router.put('modifier',auth,multer,marketCtrl.modifyOne);

module.exports = router;