var util = require('./util');

module.exports = function(app) {
	app.get('/collections', function (req, res) {
		var query = util.dbQuery(req.query || {});

		app.settings.db.collections.find(query, function(err, collections) {
			var response = {
				data: collections,
				count: collections.length
			};

			res.status(200).send(response);
		});
	});

	app.get('/collections/:collectionId', function (req, res) {
		var id = parseInt(req.params.collectionId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.collections.findOne(id, function(err, collection) {
			if(!collection){
				res.status(404).send({error:'collection with id ' + id + ' does must exists'})
			}
			res.status(200).send(collection);
		});

	});

	app.post('/collections', function (req, res) {
		var collection = req.body;

		//name validation
		if(!collection.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(collection.name.length < 4){
			res.status(404).send({error:'collection name must have at least 4 characters'});
			return;
		}
		if(collection.name.length > 100){
			res.status(404).send({error:'collection name must have less than 100 characters'});
			return;
		}

		//description validation
		if(collection.description.length < 4){
			res.status(404).send({error:'collection description must have at least 4 characters'});
			return;
		}
		if(collection.description.length > 500){
			res.status(404).send({error:'collection description must have less than 500 characters'});
			return;
		}

		//photo_collection validation
		if(!collection.image_url){
			res.status(400).send({error:'collection photo is required'});
			return;
		}
		if(collection.image_url.length > 255){
			res.status(404).send({error:'collection name must have less than 255 characters'});
			return;
		}

		app.settings.db.collections.save(collection, function(err, result) {

			res.status(200).send(result);
		});
	});

	app.put('/collections/:collectionId', function (req, res) {
		var collection = req.body;

		//id validation
		var id = parseInt(req.params.collectionId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		//name validation
		if(!collection.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(collection.name.length < 4){
			res.status(404).send({error:'collection name must have at least 4 characters'});
			return;
		}
		if(collection.name.length > 100){
			res.status(404).send({error:'collection name must have less than 100 characters'});
			return;
		}

		//description validation
		if(collection.description.length < 4){
			res.status(404).send({error:'collection description must have at least 4 characters'});
			return;
		}
		if(collection.description.length > 500){
			res.status(404).send({error:'collection description must have less than 500 characters'});
			return;
		}

		//photo_collection validation
		if(!collection.image_url){
			res.status(400).send({error:'collection photo is required'});
			return;
		}
		if(collection.image_url.length > 255){
			res.status(404).send({error:'collection name must have less than 255 characters'});
			return;
		}

		app.settings.db.collections.update(collection, function(err, result) {

			res.status(200).send(result);
		});
		
	});

	app.delete('/collections/:collectionId', function (req, res) {
		//id validation
		var id = parseInt(req.params.collectionId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.collections.destroy({id: id}, function(err, result) {
		res.status(200).send({status: "ok"});

		});

	});
};