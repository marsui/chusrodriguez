var util = require('./util');

module.exports = function(app) {
	app.get('/dresses', function (req, res) {
		var query = util.dbQuery(req.query || {});

		app.settings.db.dresses.find(query, function(err, dresses) {
			if(err){
				console.log(err);
				res.status(500).send({ error: err });
				return;
			}

			var response = {
				data: dresses,
				count: dresses.length
			};

			res.status(200).send(response);
		});
	});

	app.get('/dresses/:dressId', function (req, res) {

		var id = parseInt(req.params.dressId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.dresses.findOne(id, function(err, dress) {
			if(!dress){
				res.status(404).send({error:'dress with id ' + id + ' does must exists'})
			}

			dress.collection_id = { id: dress.collection_id };

			res.status(200).send(dress);
		});

	});

	app.post('/dresses', function (req, res) {
		var dress = req.body;

		//name validation
		if(!dress.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(dress.name.length < 4){
			res.status(404).send({error:'dress name must have at least 4 characters'});
			return;
		}
		if(dress.name.length > 100){
			res.status(404).send({error:'dress name must have less than 100 characters'});
			return;
		}

		//description validation
		if(dress.description.length < 4){
			res.status(404).send({error:'dress description must have at least 4 characters'});
			return;
		}
		if(dress.description.length > 500){
			res.status(404).send({error:'dress description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!dress.image_url){
			res.status(400).send({error:'image_url dress is required'});
			return;
		}

		if(dress.image_url.length > 255){
			res.status(404).send({error:'image_url name must have less than 255 characters'});
			return;
		}

		dress.collection_id = dress.collection_id.id;
		delete dress.id;

		app.settings.db.dresses.insert(dress, function(err, result) {
		  if(err) {
		    res.status(503).send({error:err});
		  }

			res.status(200).send(result);
		});
	});

	app.put('/dresses/:dressId', function (req, res) {
		var dress = req.body;

		//id validation
		var id = parseInt(req.params.dressId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		//name validation
		if(!dress.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(dress.name.length < 4){
			res.status(404).send({error:'dress name must have at least 4 characters'});
			return;
		}
		if(dress.name.length > 100){
			res.status(404).send({error:'dress name must have less than 100 characters'});
			return;
		}

		//description validation
		if(dress.description.length < 4){
			res.status(404).send({error:'dress description must have at least 4 characters'});
			return;
		}
		if(dress.description.length > 500){
			res.status(404).send({error:'dress description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!dress.image_url){
			res.status(400).send({error:'image_url dress is required'});
			return;
		}
		if(dress.image_url.length > 255){
			res.status(404).send({error:'image_url name must have less than 255 characters'});
			return;
		}

    dress.collection_id = dress.collection_id.id;

		app.settings.db.dresses.update(dress, function(err, result) {
      if(err) {
        res.status(503).send({error:err});
      }

			res.status(200).send(result);
		});

	});

	app.delete('/dresses/:dressId', function (req, res) {
		var dress = req.body;

		//id validation
		var id = parseInt(req.params.dressId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.dresses.destroy({id: id}, function(err, result) {
		res.status(200).send({status: "ok"});

		});

	});
};
