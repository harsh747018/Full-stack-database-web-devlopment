const mysql = require('mysql')
const express = require('express')
const app = express()
const port = 3000
const path = require('path')
const bodyparser = require('body-parser')
//let customer_id = 0

app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "urmila@123",
  database:"amusementpark",
  insecureAuth: true
});

con.connect((err) => {
  if(err){
    throw err;
  }
  console.log('Connection established');
});

app.get('/', (req, res) => {
	res.send('Hello World')
})

app.get('/customer', (req, res)=>{
	res.sendFile(path.join(__dirname + '/customer.html'))
})

/*app.post('/newbook') {
	customer_i=req.body.cust_id;
}*/

app.post('/newcust', (req, res)=>{
	let fname = req.body.fname
	let lname = req.body.lname
	let age = req.body.age
	let email = req.body.email
	let phno = req.body.phno
	let time = req.body.time
	let string = `insert into customer values (3000, '${fname}', '${lname}', ${age}, '${email}', ${phno}, '${time}', 2000)`
	//let sql = "select * from customer"
	console.log(string)	
	//customer_id=0
	con.query(string, (err, result)=>{
		//if(err) throw err
		console.log("inserted form into table")
		//console.log(result)
	})
})

app.listen(port, ()=> {
	console.log(`Server now running at port ${port}`);
})