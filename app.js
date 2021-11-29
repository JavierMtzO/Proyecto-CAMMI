const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const rutasMigrante = require('./routes/migrante');
const rutasAlimentacion = require('./routes/alimentacion');
const rutasUsuario = require('./routes/usuarios');
const rutasPanel = require('./routes/panel');
const rutasComunicacion = require('./routes/comunicacion');
const rutasAlojamiento = require('./routes/alojamiento');
const rutasPil = require('./routes/programas_integracion_local');
const rutasAtencionPsicosocial = require('./routes/atencion_psicosocial');
const rutasAsistenciaSocial = require('./routes/asistencia_social');
const rutasDelito = require('./routes/delito');
const rutasPerfilRefugio = require('./routes/perfil_refugio');
const rutasRetornoAsistido = require('./routes/retorno_asistido');
const rutasJuicioAmparo = require('./routes/juicio_amparo');
const rutasReufam = require('./routes/reufam');
const rutasRegularizacionMigratoria = require('./routes/regularizacion_migratoria');


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cookieParser());

app.use(session({
    secret: 'a2jwejnirfkmci0j23fewrrmcowssr',
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));

const multer = require('multer');

const path = require('path');
const csrf = require('csurf');
const csrfProtection = csrf();
const csrfMiddleware = require('./util/csrf');
const rolMiddleware = require('./util/roles');

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

//Middleware
app.use((request, response, next) => {
    next(); //Le permite a la petición avanzar hacia el siguiente middleware
});

app.use(csrfProtection);
app.use(csrfMiddleware);
app.use(rolMiddleware);

app.use('/', rutasMigrante);
app.use('/', rutasAlimentacion);
app.use('/', rutasUsuario);
app.use('/', rutasPanel);
app.use('/', rutasComunicacion);
app.use('/', rutasAlojamiento);
app.use('/', rutasPil);
app.use('/', rutasAtencionPsicosocial);
app.use('/', rutasAsistenciaSocial);
app.use('/', rutasDelito);
app.use('/', rutasPerfilRefugio);
app.use('/', rutasRetornoAsistido);
app.use('/', rutasJuicioAmparo);
app.use('/', rutasReufam);
app.use('/', rutasRegularizacionMigratoria);

app.use((request, response, next) => {
    console.log('Error 404');
    response.status(404);
    response.send('<h1>Página no disponible</h1>'); //Manda la respuesta
});

app.listen(80);