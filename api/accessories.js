var util = require('./util');

module.exports = function(app) {
	app.get('/accessories', function (req, res) {
		var query = util.dbQuery(req.query || {});

		app.settings.db.accessories.find(query, function(err, accessories) {
			var response = {
				data: accessories,
				count: accessories.length
			};

			res.status(200).send(response);
		});
	});

	app.get('/accessories/:accessoryId', function (req, res) {
		var id = parseInt(req.params.accessoryId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.accessories.findOne(id, function(err, accessory) {
			if(!accessory){
				res.status(404).send({error:'accessory with id ' + id + ' does must exists'})
			}

			accessory.collection_id = { id: accessory.collection_id };

			res.status(200).send(accessory);
		});

	});

	app.post('/accessories', function (req, res) {
		var accessory = req.body;

		//name validation
		if(!accessory.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(accessory.name.length < 4){
			res.status(404).send({error:'accessory name must have at least 4 characters'});
			return;
		}
		if(accessory.name.length > 100){
			res.status(404).send({error:'accessory name must have less than 100 characters'});
			return;
		}

		//description validation
		if(accessory.description.length < 4){
			res.status(404).send({error:'accessory description must have at least 4 characters'});
			return;
		}
		if(accessory.description.length > 500){
			res.status(404).send({error:'accessory description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!accessory.image_url){
			res.status(400).send({error:'accessory photo is required'});
			return;
		}
		if(accessory.image_url.length > 255){
			res.status(404).send({error:'accessory name must have less than 255 characters'});
			return;
		}

		accessory.collection_id = accessory.collection_id.id;
		delete accessory.id;

		app.settings.db.accessories.insert(accessory, function(err, result) {
      if(err) {
        res.status(503).send({error:err});
      }

			res.status(200).send(result);
		});
	});

	app.put('/accessories/:accessoryId', function (req, res) {
		var accessory = req.body;

		//id validation
		var id = parseInt(req.params.accessoryId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		//name validation
		if(!accessory.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(accessory.name.length < 4){
			res.status(404).send({error:'accessory name must have at least 4 characters'});
			return;
		}
		if(accessory.name.length > 100){
			res.status(404).send({error:'accessory name must have less than 100 characters'});
			return;
		}

		//description validation
		if(accessory.description.length < 4){
			res.status(404).send({error:'accessory description must have at least 4 characters'});
			return;
		}
		if(accessory.description.length > 500){
			res.status(404).send({error:'accessory description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!accessory.image_url){
			res.status(400).send({error:'image_url accessory is required'});
			return;
		}
		if(accessory.image_url.length > 255){
			res.status(404).send({error:'accessory name must have less than 255 characters'});
			return;
		}

    accessory.collection_id = accessory.collection_id.id;

		app.settings.db.accessories.update(accessory, function(err, result) {

			res.status(200).send(result);
		});

	});

	app.delete('/accessories/:accessoryId', function (req, res) {
		var accessory = req.body;

		//id validation
		var id = parseInt(req.params.accessoryId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.accessories.destroy({id: id}, function(err, result) {
		res.status(200).send({status: "ok"});

		});

	});
};
