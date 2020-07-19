const mysql=require('mysql');
const express=require('express');
const app =express();
const path = require('path')
const bodyparser = require('body-parser')

//app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())


/*app.get('/',function(request,response){
	fetchData(response);
	console.log('done.displayedd details');

});*/

var db =mysql.createConnection({
	host:'localhost',
	user:'root',
	password:'urmila@123',
	database:'amusementpark'
});

db.connect(function(err){
	if(err){throw err;}
	console.log("connected to database");
})



app.listen(3000,()=>console.log("Express server is running at port no:3000"));


/*app.get('/employee', (req, res)=>{
	res.sendFile(path.join(__dirname + '/employee.html'))
})

app.post('/newemp', (req, res)=>{
	 empid = req.body.empid

})*/



app.get('/employees/:id',(req,res)=>{
	db.query('SELECT * FROM employee WHERE empolyee_id= ?',[req.params.id],(err,row,fields)=>{
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
/*app.get('/employee', (req, res)=>{
	res.sendFile(path.join(__dirname + '/employee.html'))
})

app.post('/newemp', (req, res)=>{
	let empid = req.body.empid

	fetchData(res,empid)
	
})






function executeQuery(sql,cb){
	db.query(sql,function(error,result,feilds){
		if(error) {throw error;}
		cb(result);
	})
}






function fetchData(response, emp_id){
	let query = `select * from employee where employee_id=${emp_id}`
	executeQuery(query,function(result){
		//console.log(result);
		let result1 = JSON.parse(JSON.stringify(result));
		console.log(result1)
		respose.write('<table><tr>');
		for(var colunmn in result1[0]){
			response.write('<td><label>'+column+'</label></tr>');
			response.write('</tr'); 
		}
		for(var row in result1){
			response.write('<tr>');
			for (var column in result1[row]){
				response.write('<td><table>'+result1[row][column]+'</label></td>');

			}
			response.write('</tr>');
		}
		response.end('</table>');

	} );
}

app.listen(3000, ()=> {
	console.log(`Server now running at port 3000`);
})*/