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

app.use(express.static(path.join(__dirname,'public')))

app.get('/', (req, res)=>{
	res.sendFile(path.join(__dirname + '/public/homepage.html'))
})


app.get('/booking', (req, res)=>{
	res.sendFile(path.join(__dirname + '/public/booking.html'))
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
	res.sendFile(path.join(__dirname + '/public/customer.html'))
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
	let book_id =req.body.book_id
	let string = `insert into customer values (${cust_id}, '${fname}', '${lname}', ${age}, '${email}', ${phno}, '${time}',${book_id} )`
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
	res.sendFile(path.join(__dirname + '/public/booking.html'))
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
	res.sendFile(path.join(__dirname + '/public/event.html'))
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
	let route=`/employees/${empid}/`
	res.redirect(route)
})


app.get('/employee', (req, res)=>{
	res.sendFile(path.join(__dirname + '/public/employee.html'))
})

app.get('/employees/:id',(req,res)=>{
	let que = `SELECT * FROM employee WHERE empolyee_id=${req.params.id}`
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
		<input type="submit">
		
	</form>
</body>
</html>;`
}



app.post('/newpay', (req,res)=>{
	let custpay_id=req.body.custpay_id
	let route=`/payments/${custpay_id}/`
	res.redirect(route)
})


app.get('/payment', (req, res)=>{
	res.sendFile(path.join(__dirname + '/public/payment.html'))
})

app.get('/payments/:id',(req,res)=>{
	let que = `SELECT * FROM payment WHERE payment_id=${req.params.id}`
	con.query(que,(err,row,fields)=>{
		if(!err)
			res.send(htmlpage1(row)); //htmlpage
		else
			console.log(err);
	})
});

function htmlpage1(row){
	return `<html>
<head>
	<title>Customer payment invoice</title>
	<link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
	<h1 align=center><u>CUSTOMER PAYMENT INVOICE</u></h1>
	<form method="post" action="/newpay">
		<p><strong>payment_id  :${row[0].payment_id}                              </strong></p>
			
		<p><strong>Event_id :${row[0].event_id}                                 </strong></p>
		<p><strong>Parking_id :${row[0].parking_id}                                </strong></p>
		<p><strong>Booking_id :${row[0].booking_id}                               </strong></p>
		<p><strong>Parking_id :${row[0].parking_id}                               </strong></p>
		<p><strong>Payment method :${row[0].payment_method}                           </strong></p>
		<p><strong>Payment date :${row[0].payment_date}                             </strong></p>
		<p><strong>Income through event :${row[0].income_event}                     </strong></p>
		<p><strong>Income through parking :${row[0].income_parking}                    </strong></p>
		<p><strong>Income through booking :${row[0].income_booking}                    </strong></p>
		<p><strong>Income through maintaince :${row[0].income_maintenance}                 </strong></p>
		<input type="submit">
		
	</form>
</body>
</html>`
}



app.post('/newfinpay', (req,res)=>{
	let payid=req.body.payid
	let route=`/finalpayments/${payid}/`
	res.redirect(route)
})


app.get('/finalpayment', (req, res)=>{
	res.sendFile(path.join(__dirname + '/public/finalpayment.html'))
})

app.get('/finalpayments/:id',(req,res)=>{
	let que = `SELECT * FROM final_payment WHERE payment_id=${req.params.id}`
	con.query(que,(err,row,fields)=>{
		if(!err)
			res.send(htmlpage2(row)); //htmlpage
		else
			console.log(err);
	})
});

function htmlpage2(row){
	return `<html>
<head>
	<title>Customer Final Payment</title>
	<link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body background="a10.jpg" style="background-repeat: no-repeat; background-size: cover;">
	<h1 align=center><u>CUSTOMER FINAL PAYMENT </u></h1>
	<form method="post" action="/newfinpay">
		<p><strong>Payment id: ${row[0].payment_id}</strong>
			
		<p><strong>Final payment: ${row[0].grand_tatal}                                 </strong></p>
		
		<input type="submit">
		
	</form>
</body>
</html>`
}