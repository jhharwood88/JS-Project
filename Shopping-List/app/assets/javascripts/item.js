$(function(){
	console.log("our js is actually loading!")
	getItem()
})

function listenForClick(){
	$("button#click-me").on('click', function(event){
		event.preventDefault()
		getItem()
	})
}

function getItem(){
	$.ajax({
		url:'http://localhost:3000/items',
		method: 'get',
		dataType: 'json',
	}).done(function (data){
		console.log("our data is", data)
		// let firstItem = new Item(data[0])
		for (let i = 0; i < data.length; i++){
		let item = new Item(data[i])
		let myItemHTML = item.itemHTML()
		document.getElementById('our-new-item').innerHTML += myItemHTML
		}
	})
}

class Item {
	constructor (object){
		this.id = object.id
		this.name = object.name
		this.category = object.category
		this.price = object.price
	}
}

Item.prototype.itemHTML = function() {
	return(`
		<div>
			<h3>${this.name}</h3>
			<p>${this.category}</p>
			<p>${this.price}</p>
		</div>
		`)
}