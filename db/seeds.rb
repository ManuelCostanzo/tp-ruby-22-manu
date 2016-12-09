# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Status.create! [
{ name: 'Pendiente' },
{ name: 'En curso' },
{ name: 'Hecha' },
{ name: 'Expirada' }
]

Priority.create! [
{ name: 'Alta' },
{ name: 'Media' },
{ name: 'Baja' }
]

List.create! [
{ title: 'Lista 0', url: 'lista-0' }
]

Task.create! [
{ type: 'Simple', description: 'Tengo que terminar estoooooo', list_id: 1, priority_id: 1  },
{ type: 'Simple', description: 'Llegar vivo a fin de año', list_id: 1, priority_id: 2  },
{ type: 'Temporary', description: 'No se me ocurre que hacer', list_id: 1, beginning: '2016-12-09 1:28:12', ending: '2017-12-08 23:41:12', priority_id: 2  },
{ type: 'Temporary', description: 'Descripcion', list_id: 1, beginning: '2016-12-09 1:28:12', ending: '2016-12-09 1:29:00', priority_id: 3 },
{ type: 'Long', description: 'Comprar pan', list_id: 1, priority_id: 3  },
{ type: 'Long', description: 'Estudiar para el final', list_id: 1, priority_id: 1  },
]