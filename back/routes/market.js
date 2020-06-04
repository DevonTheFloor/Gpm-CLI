const express = require('express');
const router = express.Router();
const multer = require('../middleware/multer-config');
const auth = require('../middleware/auth');
const marketCtrl = require('../controllers/market');

router.post('/post',multer, marketCtrl.postOne);
router.get('/all',auth, marketCtrl.getAll);
router.get('/marketStat',auth,marketCtrl.statMarket);

module.exports = router;