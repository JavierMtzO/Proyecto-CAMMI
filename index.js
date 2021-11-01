const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
//const rutasRoot = require('./routes/root');
const rutasMigrante = require('./routes/migrante');
const rutasAlimentacion = require('./routes/alimentacion');
const rutasComunicacion = require('./routes/comunicacion');
const rutasAlojamiento = require('./routes/alojamiento');



app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(cookieParser());

app.use(session({
    secret: 'a2jwejnirfkmci0j23fewrrmcowssr', 
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));

const multer = require('multer');

const path = require('path');
/*const csrf = require('csurf');
const csrfProtection = csrf();

const csrfMiddleware = require('./util/csrf');*/

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

//Middleware
app.use((request, response, next) => {
    console.log('Middleware!');
    next(); //Le permite a la petición avanzar hacia el siguiente middleware
});

//app.use(csrfProtection); 
//app.use(csrfMiddleware);


app.use('/migrante', rutasMigrante);

app.use('/alimentacion', rutasAlimentacion);

app.use('/comunicacion', rutasComunicacion);

app.use('/alojamiento', rutasAlojamiento);

//app.use('/',rutasRoot);

app.use((request, response, next) => {
	console.log('Error 404');
	response.status(404);
    response.send('<h1>Página no disponible</h1>'); //Manda la respuesta
});

app.listen(3000);