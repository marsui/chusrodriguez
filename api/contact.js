var util = require('./util');

module.exports = function(app) {
	app.get('/contacts', function (req, res) {
		var query = util.dbQuery(req.query || {});
		app.settings.db.contacts.find(query, function(err, contacts) {

			res.status(200).send(contacts);
		});
	});

	app.get('/contacts/:contactsId', function (req, res) {
		var id = parseInt(req.params.contactId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.contacts.findOne(id, function(err, contact) {
			if(!contact){
				res.status(404).send({error:'contact with id ' + id + ' does must exists'})
			}
			res.status(200).send(contact);
		});

	});

	app.post('/contacts', function (req, res) {
		var contact = req.body;

		//name validation
		if(!contact.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(contact.name.length < 4){
			res.status(404).send({error:'contact name must have at least 4 characters'});
			return;
		}
		if(contact.name.length > 100){
			res.status(404).send({error:'contact name must have less than 100 characters'});
			return;
		}

		//phone validation
		// if (!contact.phone) {
		// 	res.status(400).send({error:'phone is required'});
		// }

		if(contact.phone.length > 20){
			res.status(404).send({error:'contact phone must have less than 20 characters'});
			return;
		}
		//email validation
		if(!contact.email){
			res.status(400).send({error:'contact email is required'});
			return;
		}
		if(contact.email.length > 100){
			res.status(404).send({error:'contact email must have less than 100 characters'});
			return;
		}

		//text validation
		if(!contact.text){
			res.status(400).send({error:'text contact is required'});
			return;
		}

		//ip validation
		if (contact.ip && contact.ip.length < 7) {
			res.status(404).send({error:'contact ip must have at least 7 characters'});
			return;
		}

		if (contact.ip && contact.ip.length > 15) {
			res.status(404).send({error:'contact ip must have less than 15 characters'});
			return;
		}

		app.settings.db.contacts.save(contact, function(err, result) {

			res.status(200).send(result);

			var transporter = nodemailer.createTransport(sesTransport({
				accessKeyId: process.env.AWS_ACCESS_KEY_ID,
				secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
				region: 'eu-west-1'
			}));

	    	// setup e-mail data with unicode symbols
			var mailOptions = {
			    from: '"Contacto Chusrodriguez" <contacto@chusrodriguez.es>', // sender address
			    replyTo: contact.email,
			    to: 'marta.suarez.rgz@gmail.com', // list of receivers
			    subject: 'Solicitud de contacto', // Subject line
			    html: 'El usuario <b>' + contact.name + '</b> te ha escrito un mensaje:<br/><br/><br/>' + contact.text // html body
			};

			// send mail with defined transport object
			transporter.sendMail(mailOptions, function(error, info){
			    if(error){
			        return console.log(error);
			    }
			    console.log('Message sent: ' + info.response);
			});
				
		});
	});

	app.put('/contacts/:contactId', function (req, res) {
		var contact = req.body;

		//id validation
		var id = parseInt(req.params.contactId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		//name validation
		if(!contact.name){
			res.status(400).send({error:'name is required'});
			return;
		}
		if(contact.name.length < 4){
			res.status(404).send({error:'contact name must have at least 4 characters'});
			return;
		}
		if(contact.name.length > 100){
			res.status(404).send({error:'contact name must have less than 100 characters'});
			return;
		}

		//description validation
		if(contact.description.length < 4){
			res.status(404).send({error:'contact description must have at least 4 characters'});
			return;
		}
		if(contact.description.length > 500){
			res.status(404).send({error:'contact description must have less than 500 characters'});
			return;
		}

		//contact_photo validation
		if(!contact.contact_photo){
			res.status(400).send({error:'image_url contact is required'});
			return;
		}
		if(contact.contact_photo.length > 255){
			res.status(404).send({error:'contact name must have less than 255 characters'});
			return;
		}

		app.settings.db.contacts.update(contact, function(err, result) {

			res.status(200).send(result);
		});
		
	});

	app.delete('/contacts/:contactId', function (req, res) {
		var contact = req.body;

		//id validation
		var id = parseInt(req.params.contactId);
		if(isNaN(id)){
	        res.status(400).send({error:'id must be numeric'});
	        return;
		}

		app.settings.db.contacts.destroy({id: id}, function(err, result) {
		res.status(200).send({status: "ok"});

		});

	});
};