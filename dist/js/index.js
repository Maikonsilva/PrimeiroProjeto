"use strict";
// string, boolen, number, ...
let x = 10;
x = 20;
console.log(x);
// inferencia x annotation
let z = 12;
let y = 12;
// tipos básicos
let firstName = "Maikon";
let age = 38;
const isAdmin = true;
// String != string (Em JSC objetos letra maiúscula e tipos em letra minúscula)
console.log(typeof firstName);
firstName = "Jaqueline";
console.log(firstName);
// object
const myNumbers = [1, 2, 3, 4];
console.log(myNumbers);
console.log(myNumbers.length);
console.log(firstName.toUpperCase());
myNumbers.push(15);
console.log(myNumbers);
// depois que se coloca o "." o tsc sugere os tipos aceitos;
// TUPLAS - Determina com a array vai ser
let myTuple;
myTuple = [3, "teste", ["a", "b"]];
//myTuple = [true, false, true] - aparece o erro pois antes foi definido o tipo de cada um na sequência.
//object literals -> {prop; value}
const user = {
    name: "Maikon",
    age: 35
};
console.log(user);
console.log(user.age);
