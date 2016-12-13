<strong> LINK A HEROKU: </strong> <a href="https://wolflist.herokuapp.com/"> Aqui </a><br>


<strong>A TENER EN CUENTA:</strong> <br>
<i>Como recien se crean las tareas, empiezan todas en pendiente</i> <br>

<strong>CORRER:</strong> <br>
bundle install <br>
bundle exec rails db:create db:migrate db:seed <br>
bundle exec rails db:test:prepare <br>
bundle exec rails db:seed RAILS_ENV=test <br>
bundle exec rails server (correr la aplicacion) <br>
bundle exec rails test (correr los tests) <br>

<strong>TAREAS:</strong> <br>
En las tareas temporarias, la fecha de inicio queda fija una vez creada la tarea, por ende no puede modificarse <br>
Las tareas largas, no pueden setear un porcentaje en el estado "pendiente". Para hacer esto deben actualizar la tarea a "en curso" <br>
Las tareas largas con estado  "en curso", pueden pasar al estado "hecha" de forma manual o automaticamente cuando se setea porcentaje en 100% <br>
Las tareas largas en estado "en curso" que pasan manualmente a "hecha", se setea automaticamente procentaje en 100% <br>
Las tareas largas que pasan del estado "en curso" a "pendiente", automaticamente vuelve a tener porcentaje en 0 <br>
Una tarea que esta hecha o expirada no puede modificarse. Las tareas pueden eliminarse sin importar su estado <br>


<strong>TESTS:</strong> <br>
Tiene tests para todo lo que pide el trabajo. El test de actualizar el estado cuando expiro la fecha esta en la carpeta test/jobs/