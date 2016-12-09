<strong> LINK A HEROKU: </strong> <a href="https://wolflist.herokuapp.com/"> Aqui </a><br>


<strong>A TENER EN CUENTA:</strong> <br>
<i>ANTES de correr rails db:seed, modificar en seed.rb, en la parte donde se crean las tareas temporarias, y modificar el beginning por una fecha posterior a este minuto y el ending por una fecha posterior al beginning.</i> <br>
Para verificar que ande el job poner un rango de fechas cortito y pasada la fecha del ending entrar a la lista

Como recien se crean las tareas, empiezan todas en pendiente



<strong>CORRER:</strong> <br>
bundle install <br>
rails db:migrate <br>
rails db:seed <br>

<strong>TAREAS:</strong> <br>
En las tareas temporarias, la fecha de inicio queda fija una vez creada la tarea, por ende no puede modificarse <br>
Las tareas largas, no pueden setear un porcentaje en el estado "pendiente". Para hacer esto deben actualizar la tarea a "en curso" <br>
Las tareas largas con estado  "en curso", pueden pasar al estado "hecha" de forma manual o automaticamente cuando se setea porcentaje en 100% <br>
Las tareas largas en estado "en curso" que pasan manualmente a "hecha", se setea automaticamente procentaje en 100% <br>
Las tareas largas que pasan del estado "en curso" a "pendiente", automaticamente vuelve a tener porcentaje en 0 <br>
Una tarea que esta hecha o expirada no puede modificarse. Las tareas pueden eliminarse sin importar su estado <br>


<strong>TESTS:</strong> <br>
Tiene tests para todo lo que pide el trabajo. El test de actualizar el estado cuando expiro la fecha esta en la carpeta test/jobs/