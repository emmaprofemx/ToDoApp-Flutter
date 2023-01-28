import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoapp/colors.dart';
import 'package:todoapp/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  final onToDoChanged;
   //Varibale para borrar el Item 
    final onDeleteItem;

  
  const ToDoItem({
    Key? key , required this.todo ,
    required this.onToDoChanged ,
    required this.onDeleteItem ,
    }) :super(key:key);

  @override
  Widget build(BuildContext context) {
    /*
  Dentro del Container se crea la plantilla en la cual , estara
  situada la tarea...
    */
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        //Imprimeros un mensaje en consola para verificar que si este reaccionando
        onTap: () {
        onToDoChanged(todo);
         // print('Clicked on Todo Item,');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
        tileColor: Colors.white,
        //Hasta aqui arriba se esta creando la base
        //Abajo le estamos dando propieidades al boton de la palomita
        leading: Icon(
          //La linea de abajo establecemos lo siguiente
          /*
          Una vezz hecha la tarea , el usuario preciona lo que viene siendo la casilla
          ; la casilla se vuelve true se subraya el texto y el icono cambia , de lo contrario
          el icono se queda en blanco.
          */
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank , 
          color: tdBlue,),
        //Linea para asignar un texto a Container , posteriormente se le agregan mas atributos
        title: Text(
          todo.todoText!,
          //Le damos un estilo al texto que se encuentra en la nota
          style: TextStyle(
            fontSize: 16 , 
            color: tdBlack , 
            /*
            La linea de abajo hace lo sigueinte , si hay una tarea completada
            el texto estara subrayada con una linea; en caso contrario no la tendra.
            */
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          )),
          //Agregamos el boton de eliminar 
          //Lo que estamos agregando de bajo como tal solo es la base del boton
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed , 
              borderRadius: BorderRadius.circular(5),
            ),
            //A continuacion se implementa el logo de eliminar
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                print('Clicked on Delete Item,');
              }, ),
          ),
      ),
    );
  }
}