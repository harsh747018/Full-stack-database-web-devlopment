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


app.get('/booking', (req, res)=>{
	res.sendFile(path.join(__dirname + '/booking.html'))
})

/*app.post('/newbook') {
	customer_i=req.body.cust_id;
}*/

app.post('/newbook', (req, res)=>{
	let booking_id = req.body.booking_id
	let customer_id = req.body.customer_id
	let quantity = req.body.quantity
	let cost = req.body.cost
	let total_cost = quantity*cost
	
	let string = `insert into booking values (${booking_id}, ${quantity}, ${cost}, ${total_cost}, ${customer_id})`
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