const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const usersRouter = require('./routes/users');
const forumRouter = require('./routes/forum');
const marketRouter = require('./routes/market');
const rezoRouter = require('./routes/rezo');
const testRouter = require('./routes/test');
const adminRouter = require('./routes/admin');


const app = express();

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });
  

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));


app.use("/api/images/dl",express.static(path.join(__dirname, 'images')));
app.use('/api/auth',usersRouter);
app.use('/api/test',testRouter);
app.use("/api/forum",forumRouter);
app.use('/api/market', marketRouter);
app.use('/api/rezo',rezoRouter);
app.use('/api/admin',adminRouter);


module.exports = app;
