const http = require('http');
const app = require('./app');

app.set('port',process.env.PORT || 4040);
const server = http.createServer(app);
console.log("Groupomania CLI version \n dispo http://localhost:4040");

server.listen(process.env.PORT || 4040);
