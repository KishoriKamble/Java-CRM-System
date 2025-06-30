const customers=[
    {
        id:1,name:"John Doe",email:"john@example.com",phone:"8999527595"
    },
     {
        id:2,name:"Jane Smith",email:"jane@example.com",phone:"7057752379"
    }
];
const tbody=document.getElementById("customerTable");
customers.forEach(c=>{
    const row=document.createElement("tr");
    row.innerHTML=`
    <td>${c.id}</td>
    <td>${c.name}</td>
    <td>${c.email}</td>
    <td>${c.phone}</td>

    <td>
        <a href="#">Edit</a> |<a href="#">Delete</a>
    </td>`;
     
     tbody.appendChild(row);
});