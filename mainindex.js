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

app.get('/', (req, res)=>{
	res.sendFile(path.join(__dirname + '/homepage.html'))
})


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
	res.redirect("/customer")
})



/*app.post('/newbook') {
	customer_i=req.body.cust_id;
}*/



app.get('/customer', (req, res)=>{
	res.sendFile(path.join(__dirname + '/customer.html'))
})

/*app.post('/newbook') {
	customer_i=req.body.cust_id;
}*/

app.post('/newcust', (req, res)=>{
	let cust_id = req.body.cust_id
	let fname = req.body.fname
	let lname = req.body.lname
	let age = req.body.age
	let email = req.body.email
	let phno = req.body.phno
	let time = req.body.time
	let string = `insert into customer values (${cust_id}, '${fname}', '${lname}', ${age}, '${email}', ${phno}, '${time}',${booking_id} )`
	//let sql = "select * from customer"
	console.log(string)	
	//customer_id=0
	con.query(string, (err, result)=>{
		//if(err) throw err
		console.log("inserted form into customer table")
		//console.log(result)
	})
})


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
	res.redirect("/customer")
})

app.get('/events', (req, res)=>{
	res.sendFile(path.join(__dirname + '/event.html'))
})

/*app.post('/newbook') {
	customer_i=req.body.cust_id;
}*/

app.post('/newevent', (req, res)=>{
	let eventid = req.body.eventid
	let eventname = req.body.eventname
	let description = req.body.description
	let duration = req.body.duration
	let rate_per_hour = req.body.rate_per_hours
	let kingdomid = req.body.kingdomid
	let rent=req.body.rent
	let string = `insert into events values (${eventid}, '${eventname}', '${description}', ${duration}, ${rate_per_hour}, ${kingdomid}, ${rent})`
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

app.post('/newemp', (req,res)=>{
	let empid=req.body.empid
	let route=`/employees:${empid}`
	res.redirect(route)
})


app.get('/employee', (req, res)=>{
	res.sendFile(path.join(__dirname + '/employee.html'))
})

app.get('/employees/:id',(req,res)=>{
	let que = `'SELECT * FROM employee WHERE empolyee_id=${req.params.id}`
	con.query(que,(err,row,fields)=>{
		if(!err)
			res.send(htmlpage(row)); //htmlpage
		else
			console.log(err);
	})
});

function htmlpage(row){
	return `<html>
<head>
	<title>Employee imformation display</title>
	<link rel="stylesheet" type="text/css" href="app.css">
</head>
<body background="">
	<h1 align=center><u>EMPLOYEE IMFORMATION</u></h1>
	<form method="post" action="/newemp">
		<p><strong>Employee id: ${row[0].empolyee_id}</strong>
		<p><strong>Employee first name :${row[0].employee_fn}</strong></p>
		<p><strong>Employee last name :${row[0].employee_ln}       </strong></p>
		<p><strong>Hourly Wage :${row[0].hourly_wage}              </strong></p>
		<p><strong>Designation :${row[0].designation}             </strong></p>
		<p><strong>Salary   :${row[0].salary}              </strong></p>	
		<button>Get imformation</button>
		
	</form>
</body>
</html>;`
}