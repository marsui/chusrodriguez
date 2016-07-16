module.exports = {

	dbQuery: function(kongaQuery) {
		var query = {};
		var ignore = ['offset', 'limit', 'sortBy', 'sortAs'];


		for(var param in kongaQuery) {
			if(ignore.indexOf(param) === -1) {
				query[param] = kongaQuery[param];
			}
		}

		return query;

	}
}