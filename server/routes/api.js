var express = require('express');
var router = express.Router();

var knex = require('knex')({
  client: 'sqlite3',
  connection: {
    filename: "./db.sqlite"
  }
});

knex.on('query', function (queryData) {
  console.log(queryData);
});


router.get('/schema/', function (req, res) {
  knex.raw("SELECT name FROM sqlite_master WHERE type='table';")
    .then(function (data) {
      res.send(data);
    });
});

router.get("/create/", function (req, res) {
  knex.schema.createTableIfNotExists(
    'houses', function (table) {
      table.increments();
      table.string('name');
      table.string('sigil');
      table.text('word');
      table.text('regions');
      table.text('allegiances');
      table.text('quote');
      table.timestamps();
    }).then(function (data) {
    res.send(data);
  }).catch(function (error) {
    res.send(error);
  })
});

router.post("/populate/", function (req, res) {
  var json = req.body;

  for (let obj of json.houses) {
    knex("houses").insert(obj)
      .then(function (data) {
        console.log(data);
      })
      .catch(function (error) {
        console.log(error);
      });
  }
  res.send("OK");
});

router.get("/houses/", function (req, res) {
  knex().select().from("houses")
    .then(function (data) {
      res.json({"houses": data});
    });
  }
);

router.get("/houses/:id", function (req, res) {
  const id = req.params["id"];

  console.log(id);
  knex().select().from("houses").where('id', id)
    .then(function (data) {
      console.log(data);
      res.json(data);
    })
    .catch(function (error) {
      console.log(error);
      res.send(error);
    });
  }
);

module.exports = router;
