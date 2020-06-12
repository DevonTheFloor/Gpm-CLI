const express = require('express');
const router = express.Router();
const multer = require('../middleware/multer-config');
const auth = require('../middleware/auth');
const marketCtrl = require('../controllers/market');

router.post('/post',auth, multer, marketCtrl.postOne);
router.post('/classeur',auth, marketCtrl.selectCat);
router.get('/see/:id', auth, multer, marketCtrl.getOne);
router.get('/all',auth, marketCtrl.getAll);
router.get('/marketStat',auth,marketCtrl.statMarket);
router.delete('/deleteone/:id',auth, marketCtrl.deleteOne);
//router.put('modifier',auth,multer,marketCtrl.modifyOne);

module.exports = router;