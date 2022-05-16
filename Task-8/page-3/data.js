// Returns a json data for chart 
// The data tells about the sale of particular pizza on a random day

function getRandomJson() {
    var cdata = [{
        "_id": "585b544f5c86b6c8537c34d6",
        "pizza": "Pepperoni",
        "sold": Math.floor(Math.random() * (100 - 20 + 1)) + 20,
    }, {/* w w  w . d  em o  2s .c o m*/
        "_id": "585b54505c86b6c8537c34d7",
        "pizza": "Farmhouse",
        "sold": Math.floor(Math.random() * (80 - 1 + 1)) + 1,
    }, {
        "_id": "585b54515c86b6c8537c34d8",
        "pizza": "Veggie Paradise",
        "sold": Math.floor(Math.random() * (90 - 20 + 1)) + 20,
    }, {
        "_id": "585b54525c86b6c8537c34d9",
        "pizza": "Peppy Panner",
        "sold": Math.floor(Math.random() * (50 - 40 + 1)) + 40,
    }, {
        "_id": "585b54535c86b6c8537c34da",
        "pizza": "VEGGIE PARADISE",
        "sold": Math.floor(Math.random() * (85 - 20 + 1)) + 20,
    }];
    return cdata;
}

let data = getRandomJson();
const prize = [0,0,0,0];  
for (let x in data) {
   // console.log(data[x].pizza);
    let pizzaName = data[x].pizza.toLowerCase(); 
    //console.log(pizzaName)
    //console.log(data[x].sold);
    
    if(pizzaName == "pepperoni"){
        prize[0] = prize[0] + data[x].sold;   
    }
    else if(pizzaName =="farmhouse"){
        prize[1] =  prize[1]+data[x].sold;
    }
    else if(pizzaName =="veggie paradise"){
        prize[2] =  prize[2]+data[x].sold;
    }
    else if(pizzaName == "peppy panner"){
        prize[3] =  prize[3]+ data[x].sold;
    }   
} 

for (let x in prize){
    console.log(prize[x]);
}

const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Pepperoni', 'Farmhouse', 'Veggie Paradise', 'Peppy Panner'],
        datasets: [{
            label: 'Pizzas',
            data: prize,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});