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