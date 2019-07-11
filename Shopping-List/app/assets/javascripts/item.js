$(function(){
	console.log("our js is actually loading!")
	getItems()
})

function listenForClick(){
	$("button#click-me").on('click', function(event){
		event.preventDefault()
		getItem()
	})
}

function getItems(){
	$.ajax({
		url:'http://localhost:3000/items',
		method: 'get',
		dataType: 'json',
	}).done(function (data){
		// console.log("our data is", data)
		// let firstItem = new Item(data[0])
		for (let i = 0; i < data.length; i++){
		let item = new Item(data[i])
		let myItemHTML = item.itemHTML()
		document.getElementById('our-new-item').innerHTML += myItemHTML
		}
	})

	$(document).on('click',".show_link", function(e) {
		e.preventDefault()
		let id = ($(this).attr('data-id'))
		fetch(`/items/${id}.json`)
		.then(res => res.json())
		.then(post => {
				$.ajax({
			url:`http://localhost:3000/items/${id}`,
			method: 'get',
			dataType: 'json',
		}).done(function (data){
			console.log("our data is", data)
			let item = new Item(data)
			let myItemHTML = item.formatShow()
			console.log(myItemHTML)
			document.getElementById('our-show-item').innerHTML += myItemHTML
			
		})
			
		})
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
			<a href="/items/${this.id}" data-id="${this.id}" class="show_link"><h3>${this.name}</h3></a>
		</div>
		`)
}

Item.prototype.formatShow = function() {
	return(`
		<div>
			<h3>${this.name}</h3>
			<p>${this.category}</p>
			<p>${this.price}</p>
		</div>
		`)
}