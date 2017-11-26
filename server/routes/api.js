var express = require('express');
var router = express.Router();

var data = {
  "houses": [
    {
      "name": "House Stark",
      "sigil": "https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101103142",
      "word": "Winter Is Coming",
      "regions": [
        "The North"
      ],
      "allegiances": "<ul>\n  <li>Targaryen </li>\n  <li>Baratheon (formerly)</li>\n  <li>Sovereign (formerly)</li>\n</ul>",
      "quote": "<p>\n<em>\"You were born in the long summer, you've never known anything else. But now winter is truly coming. In the winter, we must protect ourselves, look after one another.\"</em>\n</p>\n<p>\n— Lord Eddard Stark.\n</p>",
      "id": "stark"
    },
    {
      "name": "House Lannister",
      "sigil": "https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Lannister-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101095357",
      "word": "A Lannister Always Pays His Debts",
      "regions": [
        "The Crownlands",
        "The Westerlands"
      ],
      "allegiances": "<ul>\n  <li>Targaryen (formerly)</li>\n  <li>Baratheon (formerly)</li>\n  <li>Sovereign</li>\n</ul>",
      "quote": "<p>\n<em>\"You have to give it to the Lannisters – they may be the most pompous, ponderous cunts the gods ever suffered to walk the world, but they do have outrageous amounts of money.\"</em>\n</p>\n<p>\n―Renly Baratheon\n</p>",
      "id": "lannister"
    }
  ]
};


router.get("/houses/", function (req, res) {
    res.json(data);
  }
);

router.get("/houses/:id", function (req, res) {
    res.json(data.houses[req.params["id"]]);
  }
);

module.exports = router;
