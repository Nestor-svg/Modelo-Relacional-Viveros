# Modelo-Relacional-Viveros

## Tablas de la base de datos Viveros
### Tabla Cliente
![Tabla Cliente](cliente.png)
### Tabla Vivero
![Tabla Vivero](vivero.png)
### Tabla Zona
![Tabla Zona](zona.png)
### Tabla Productos
![Tabla Productos](productos.png)
### Tabla Asignado
![Tabla Asignado](asignado.png)
### Tabla Empleado
![Tabla Empleado](empleado.png)
### Tabla Compra
![Tabla Compra](compra.png)
### Tabla Control de pedidos
![Tabla Control de pedidos](control_pedido.png)
### Tabla Trabaja
![Tabla Trabaja](trabaja.png)
### Tabla Tiene
![Tabla Tiene](tiene.png)


## Ejemplos de DELETE
### Eliminar un cliente y todas sus compras
- DELETE FROM cliente WHERE cliente_id=1;
### Eliminar una zona y todos los productos asignados a ella
- DELETE FROM zona WHERE zona_id=2;
