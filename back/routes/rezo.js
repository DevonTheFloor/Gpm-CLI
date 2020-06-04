const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const rezoCtrl = require('../controllers/rezo');

router.post('/post',auth,rezoCtrl.postOne);
router.get('/posts',auth, rezoCtrl.getAll);
router.get('/chatStat',auth,rezoCtrl.statChat);

module.exports = router;