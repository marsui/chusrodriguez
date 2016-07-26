var util = require('./util');

module.exports = function(app) {
  var that = this;

  this.savePhoto = function(photo, callback) {
    app.settings.db.photos.insert(photo, function(err, result) {
      callback(err, result);
    });
  };

	app.get('/photos', function (req, res) {
		var query = util.dbQuery(req.query || {});

		app.settings.db.photos.find(query, function(err, photos) {
			var response = {
				data: photos,
				count: photos.length
			};

			res.status(200).send(response);
		});
	});

	app.get('/photos/:photoId', function (req, res) {
		var id = parseInt(req.params.photoId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.photos.findOne(id, function(err, photo) {
			if(!photo){
				res.status(404).send({error:'photo with id ' + id + ' does must exists'})
			}
			res.status(200).send(photo);
		});

	});

	app.post('/photos', function (req, res) {
		var photo = req.body;

		//name validation
		if(!photo.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(photo.name.length < 4){
			res.status(404).send({error:'photo name must have at least 4 characters'});
			return;
		}
		if(photo.name.length > 100){
			res.status(404).send({error:'photo name must have less than 100 characters'});
			return;
		}

		//description validation
		if(photo.description.length < 4){
			res.status(404).send({error:'photo description must have at least 4 characters'});
			return;
		}
		if(photo.description.length > 500){
			res.status(404).send({error:'photo description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!photo.image_url){
			res.status(400).send({error:'image_url photo is required'});
			return;
		}
		if(photo.image_url.length > 255){
			res.status(404).send({error:'image_url photo name must have less than 255 characters'});
			return;
		}

		//item_id verification
		if (req.params.item_id) {
			var item_id = parseInt(req.params.item_id);
			if(isNaN(item_id)){
		        res.status(400).send({error:'item_id must be numeric'});
		        return;
			}
		}

		//source verification
		if(photo.source.length > 20){
			res.status(404).send({error:'source photo must have less than 20 characters'});
			return;
		}

		var valid_sources = ['dress','accessory'];
		if (valid_sources.indexOf(photo.source) === -1) {
			res.status(400).send({error:'source photo not valid'});
			return;
		}

		that.savePhoto(photo);
	});

	app.put('/photos/:photoId', function (req, res) {
		var photo = req.body;

		//id validation
		var id = parseInt(req.params.photoId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		//name validation
		if(!photo.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(photo.name.length < 4){
			res.status(404).send({error:'photo name must have at least 4 characters'});
			return;
		}
		if(photo.name.length > 100){
			res.status(404).send({error:'photo name must have less than 100 characters'});
			return;
		}

		//description validation
		if(photo.description.length < 4){
			res.status(404).send({error:'photo description must have at least 4 characters'});
			return;
		}
		if(photo.description.length > 500){
			res.status(404).send({error:'photo description must have less than 500 characters'});
			return;
		}

		//image_url validation
		if(!photo.image_url){
			res.status(400).send({error:'image_url photo is required'});
			return;
		}
		if(photo.image_url.length > 255){
			res.status(404).send({error:'image_url photo name must have less than 255 characters'});
			return;
		}

		app.settings.db.photos.update(photo, function(err, result) {

			res.status(200).send(result);
		});

	});

	app.delete('/photos/:photoId', function (req, res) {
		var photo = req.body;

		//id validation
		var id = parseInt(req.params.photoId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.photos.destroy({id: id}, function(err, result) {
			res.status(200).send({status: "ok"});

		});

	});
};
