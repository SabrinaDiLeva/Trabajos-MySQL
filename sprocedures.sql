-- 1
delimiter $$
CREATE PROCEDURE sp_calcularEdad(in min_edad int, in max_edad int)
BEGIN
	SELECT apellido, nombre, year(current_timestamp)-year(fechaNacimiento) AS edad FROM empleados
    HAVING edad>min_edad AND edad<max_edad;
END $$
call sp_calcularEdad(50,60);

-- 2
delimiter $$
CREATE PROCEDURE sp_actualizarProd(in porcentaje int, in categoria varchar(100))
BEGIN 
	SELECT ProductoNombre, categoriaNombre, unidadesStock, round(unidadesStock*(porcentaje/100 + 1)) as nuevoStock FROM productos
	INNER JOIN categorias ON categorias.CategoriaID= productos.CategoriaID
	WHERE categoriaNombre=categoria;
END $$


-- 3
delimiter $$
CREATE PROCEDURE sp_actualizarEmpleados(in fecha datetime)
BEGIN 
	SELECT apellido, nombre, telefono, fechaContratacion FROM empleados
    WHERE fechaContratacion<fecha;
END $$
call sp_actualizarEmpleados('1994-01-01 00:00:00');


