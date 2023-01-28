import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoapp/colors.dart';
import 'package:todoapp/todo.dart';
import 'package:todoapp/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key}); 

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Creamos el objetoo todoList , eh invocamos el metodo
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15,),
          child: Column(
            children: [
              searchBox(),
              Expanded(child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: Text('All ToDos' ,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),),
                  ) ,
                  for(ToDo todo in todosList)
                  //Obtenemos los mensajes de los objetos creados dentro de la clase todo 
                  ToDoItem(todo: todo,onToDoChanged: _handleToDoChange , 
                  onDeleteItem: () {},),
                  
                  
          
                ],
              )),
            ],


          ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child: Container(margin: EdgeInsets.only(
              bottom: 20 ,
              right: 20 , 
              left: 20,),
              padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5 ),
              decoration: BoxDecoration(
                color: Colors.white ,
                boxShadow: const [BoxShadow(
                  color: Colors.grey , 
                  offset: Offset(0.0, 0.0) , 
                  blurRadius: 10.0 ,
                  spreadRadius: 0.0,
                ) ,] ,
                borderRadius: BorderRadius.circular(10) ,
              ),
              child: TextField(
                
                decoration: InputDecoration(
                  hintText: 'Agregar una nueva tarea' , 
                  border:  InputBorder.none
                ),
              ),)) , 
              //Creacion del boton agregar

            //Inico del botton
            Container(
              margin: EdgeInsets.only(
                bottom: 20 , 
                right: 20,
              ),
              child: ElevatedButton(
                child: Text('+' , style: TextStyle(fontSize: 40 ,),),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: tdBlue,
                  minimumSize: Size(60, 60) , 
                  elevation: 10,
                ),
                ),
            )
            //Fin del boton
            ],),
          ),
        ],
      ),
    );
  }

void _handleToDoChange(ToDo todo){
  setState(() {
    todo.isDone = !todo.isDone;
  });

}


Widget searchBox(){
  return Container(
            //Separando un poco del borde de izquierda a derecha
            padding: EdgeInsets.symmetric(horizontal: 15),
            //Dandole estilo al textField
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            //Personalizando el txtField
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0), 
                //Agregando el boton de la lupa
                prefixIcon: Icon(
                  Icons.search ,
                  color: tdBlack,
                  size: 20,),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20 , 
                    minWidth: 25,) ,
                    //Linea azul que aparece debajo del txtField , desactivado
                    border: InputBorder.none , 
                    hintText: 'Buscar...' ,
                    hintStyle: TextStyle(color: tdGrey),
              ),
            ),
          );
}

//Personalizacion del AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(
          Icons.menu , 
          color: tdBlack , 
          size: 30,
        ) , 
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/rayitosfondo.png'),
          ),
        )
      ],) 
      );
  }
}