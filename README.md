# Modelo-Relacional-Viveros
## Diagrama E/R Viveros
![Diagrama Viveros](Diagrama_Viveros.drawio.png)

## Tablas de la base de datos Viveros
### Tabla Cliente
![Tabla Cliente](Images_Select/cliente.png)
### Tabla Vivero
![Tabla Vivero](Images_Select/vivero.png)
### Tabla Zona
![Tabla Zona](Images_Select/zona.png)
### Tabla Productos
![Tabla Productos](Images_Select/productos.png)
### Tabla Asignado
![Tabla Asignado](Images_Select/asignado.png)
### Tabla Empleado
![Tabla Empleado](Images_Select/empleado.png)
### Tabla Compra
![Tabla Compra](Images_Select/compra.png)
### Tabla Control de pedidos
![Tabla Control de pedidos](Images_Select/control_pedido.png)
### Tabla Trabaja
![Tabla Trabaja](Images_Select/trabaja.png)
### Tabla Tiene
![Tabla Tiene](Images_Select/tiene.png)

## Ejemplos de DELETE
### Eliminar un cliente y todas sus compras
- DELETE FROM cliente WHERE cliente_id=1;
### Eliminar una zona y todos los productos asignados a ella
- DELETE FROM zona WHERE zona_id=2;
