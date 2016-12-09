A TENER EN CUENTA:
ANTES de correr rails db:seed, modificar en seed.rb, en la parte donde se crean las tareas temporarias, y modificar el beginning por una fecha posterior a este minuto y el ending por una fecha posterior al beginning.
Para verificar que ande el job poner un rango de fechas cortito y pasada la fecha del ending entrar a la lista

Como recien se crean las tareas, empiezan todas en pendiente



CORRER:

bundle install
rails db:migrate
rails db:seed

TESTS:
Tiene tests para todo lo que pide el trabajo. El test de actualizar el estado cuando expiro la fecha esta en la carpeta test/jobs/