var Draft = Draft || {}

Draft.postJSON = function(url, data){
	var p = new Promise(function(resolve, reject){

		$.ajax({
			type: 'POST',
			url: url, 
			data: JSON.stringify(data),
			contentType: 'application/json; charset=utf-8', 
			success: function(data){
				resolve(data);
			}, 
			dataType: "json",
			error: function(data){
				reject(data);
			}
		})
	});

	return p;
};