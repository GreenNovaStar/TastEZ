import 'package:tastez/Middleware/API Parsing/WinePairing/WinePairing.dart';
import 'package:tastez/Middleware/API Parsing/WinePairing/ProductMatches.dart';
import 'package:tastez/Middleware/API%20Parsing/Cuisines.dart';

List<Cuisines> winePairingCuisines = [
  //American
  Cuisines(
    hasWines: false,
    name: "American",
    winePairing: WinePairing(),
  ),
  //African
  Cuisines(
    hasWines: true,
    name: "African",
    winePairing: WinePairing(
      pairedWines: [
        "Pinotage",
        "Chenin Blanc",
        "Riesling"
      ],
      pairingText: "Pinotage, Chenin Blanc, and Riesling are my top picks for African. The best wine for African dishes will depend on the dish, but a fruity, aromatic white wine is a safe bet for spicy dishes while pinotage would be a traditional match for South African cuisine. The Beeslaar Pinotage with a 4.8 out of 5 star rating seems like a good match. It costs about 50 dollars per bottle.",
      productMatches: ProductMatches(
          id: 489548,
          title: "Beeslaar Pinotage",
          description: "Offering lifted aromatics with notions of incense and a floral component, there’s a touch of spice and earthiness to the dark cherry and dark plum notes on the nose. Medium fuller bodied this has engaging fruit purity and concentration with a sleek texture and finer tuned tannins to the juicy dark berry fruit flavors. Weighing in at 14.5% alcohol by volume this maintains its freshness and vibrancy and fleshes out with aeration suggesting that this will age beautifully over a good number of years.",
          price: "\$49.99",
          imageUrl: "https://spoonacular.com/productImages/489548-312x231.jpg",
          averageRating: 0.96,
          ratingCount: 10.0,
          score: 0.927741935483871,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fbeeslaar-pinotage-2017%2F539446"
      ),
    ),
  ),
  //Asian
  Cuisines(
    hasWines: true,
    name: "Asian",
    winePairing: WinePairing(
      pairedWines: [
        "Gewurztraminer",
        "Riesling",
        "Chenin Blanc"
      ],
      pairingText: "Gewurztraminer, Riesling, and Chenin Blanc are great choices for Asian. The best wine for Asian food depends on the cuisine and dish - of course - but these acidic whites pair with a number of traditional meals, spicy or not. One wine you could try is Union Sacre Belle de Nuit Dry Gewurztraminer. It has 4.2 out of 5 stars and a bottle costs about 18 dollars.",
      productMatches: ProductMatches(
          id: 487038,
          title: "Standing Stone Vineyards Gewurztraminer",
          description: "Standing Stone Vineyards Gewurztraminer exudes a depth of flavor and a powerful expression of the varietal’s classic spice and floral components. The site’s location on the shale slopes of Seneca Lake is ideal, creating optimal conditions and achieving impressive ripeness.",
          price: "\$16.99",
          imageUrl: "https://spoonacular.com/productImages/487038-312x231.jpg",
          averageRating: 0.82,
          ratingCount: 6.0,
          score: 0.7673684210526315,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fstanding-stone-vineyards-gewurztraminer-2017%2F520601"
      ),
    ),
  ),

  //British
  Cuisines(
    hasWines: false,
    name: "British",
    winePairing: WinePairing(),
  ),

  //Cajun
  Cuisines(
    hasWines: true,
    name: "Cajun",
    winePairing: WinePairing(
      pairedWines: [
        "Albarino",
        "Rose Wine",
        "Sauvignon Blanc",
      ],
      pairingText: "Cajun can be paired with Albarino, rosé Wine, and Sauvignon Blanc. These low-tannin, lower alcohol wines will complement the heat in spicy cajun dishes, instead of making your mouth burn more. One wine you could try is Pazo de Galegos Albarino. It has 4.4 out of 5 stars and a bottle costs about 13 dollars.",
      productMatches: ProductMatches(
          id: 443411,
          title: "Pazo de Galegos Albarinor",
          description: "This 100% Albarino is a truly distinctive and expressive wine coming from low-yielding vines. Through the use of partial malolactic fermentation this wine exhibits greater freshness and aromatic expression. This straw-colored wine boasts aromas of green apple, light citrus, and floral undertones. On the palate this wine is the epitome of freshness with a lightly tart expression of that same green apple and citrus. The somewhat higher acidity is cause for celebration as this wine will pair wonderfully with any number of spicy or richer foods.",
          price: "\$12.98",
          imageUrl: "https://spoonacular.com/productImages/443411-312x231.jpg",
          averageRating: 0.88,
          ratingCount: 6.0,
          score: 0.8273684210526318,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fpazo-de-galegos-albarino-2008%2F102694"
      ),
    ),
  ),
  //Caribbean
  Cuisines(
    hasWines: true,
    name: "Caribbean",
    winePairing: WinePairing(
      pairedWines: [
        "Gewurztraminer"
        "Riesling"
        "Pinot Gris"
      ],
      pairingText: "Caribbean works really well with Gewurztraminer, Riesling, and Pinot Gris. You'll want to opt for wines with a bit of sweetness when dealing with spicy Caribbean dishes. Serve these wines chilled so they're even more refreshing. You could try Lawson's Dry Hills Gewurztraminer. Reviewers quite like it with a 4.2 out of 5 star rating and a price of about 15 dollars per bottle.",
      productMatches: ProductMatches(
          id: 444941,
          title: "Lawson's Dry Hills Gewurztraminer",
          description: "The nose has a lovely array of rose petal, orange blossom and lychee aromas, whilst the palate is rich, round and succulent with a lovely weight and concentration. This wine is off-dry and could be cellared for three to eight years.Enjoy in moderation with strong rich flavours or with something a little spicy.",
          price: "\$14.99",
          imageUrl: "https://spoonacular.com/productImages/444941-312x231.jpg",
          averageRating: 0.84,
          ratingCount: 6.0,
          score: 0.78,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Flawsons-dry-hills-gewurztraminer-2013%2F166258"
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Chinese",
    winePairing: WinePairing(
      pairedWines: [
        "Chenin Blanc",
        "Gewurztraminer",
        "Riesling",
      ],
      pairingText: "Chinese on the menu? Try pairing with Chenin Blanc, Gewurztraminer, and Riesling. The best wine for Asian food depends on the cuisine and dish - of course - but these acidic whites pair with a number of traditional meals, spicy or not. You could try Beaumont Hope Marguerite Chenin Blanc. Reviewers quite like it with a 4.5 out of 5 star rating and a price of about 30 dollars per bottle.",
      productMatches: ProductMatches(
        id: 456096,
        title: "Beaumont Hope Marguerite Chenin Blanc",
        description: "Named after their grandmother, Hope Marguerite Beaumont, this barrel fermented and matured Chenin Blanc is always elegant and complex. Winner of four Platter 5 star ratings, it is seen as one of South Africa’s benchmark Chenin wines.",
        price: "\$29.99",
        imageUrl: "https://spoonacular.com/productImages/456096-312x231.jpg",
        averageRating: 0.9,
        ratingCount: 5.0,
        score: 0.83,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fbeaumont-hope-marguerite-chenin-blanc-2015%2F217056",
      ),
    ),
  ),
  Cuisines(
    hasWines: false,
    name: "Eastern European",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: false,
    name: "European",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: true,
    name: "French",
    winePairing: WinePairing(
      pairedWines: [
        "Bordeaux"
        "Champagne"
        "White Burgundy"
      ],
      pairingText: "French on the menu? Try pairing with Bordeaux, Champagne, and White Burgundy. French wine is just as diverse as French food, but you rarely go wrong with champagne. If your meal calls for a white wine, you might also try a white burgundy. For a red, try a red bordeaux blend. The Chateau Jalousie Beaulieu Bordeaux Superieur with a 4.1 out of 5 star rating seems like a good match. It costs about 15 dollars per bottle.",
      productMatches: ProductMatches(
        id: 490090,
        title: "Chateau Jalousie Beaulieu Bordeaux Superieur",
        description: "Château Jalousie Beaulieu is a fine wine with an elegant nose, marked by red fruits and spices. The palate has a fleshy texture and fine tannins.",
        price: "\$14.99",
        imageUrl: "https://spoonacular.com/productImages/490090-312x231.jpg",
        averageRating: 0.82,
        ratingCount: 13,
        score: 0.79,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fchateau-jalousie-beaulieu-bordeaux-superieur-2016%2F607038",
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "German",
    winePairing: WinePairing(
      pairedWines: [
        "Riesling",
        "Dornfelder",
      ],
      pairingText: "German works really well with Riesling and Dornfelder. Beer might seem like the natural pick for German food, but German riesling pairs wonderfully with seafood and schnitzel, while a German red like Dornfelder goes well with beef and game meat. The Bollig-Lehnert Piesporter Goldtroopfchen Riesling Spatlese with a 4.1 out of 5 star rating seems like a good match. It costs about 22 dollars per bottle.",
      productMatches: ProductMatches(
        id: 474522,
        title: "Bollig-Lehnert Piesporter Goldtroopfchen Riesling Spatlese",
        description: "Piesporter - Goldtröpfchen is one of the best-known individual vineyards (Einzellagen) in the Mosel region of Germany. This vineyard consists of steep, slatey southern-facing slopes arranged in a dramatic amphitheater-like shape for ideal exposure and aspect with the river reflecting much-desired sun directly to the vines. The excellent Rieslings are typically sun-warmed and ripe, with pronounced slate minerality and balancing acidity. Ripe, full of tropical fruit flavors of pineapple, mango, and guava, with pastry accents. Offers a bright finish of kiwifruit and lime, showing a touch of chamomile and cream. A succulent Riesling.A perfect match for strong Indian and Asian spiced dishes. Also fantastic with a spiced duck leg, dishes with acidic sauces, roasted vegetables, and soft cheeses.",
        price: "\$21.99",
        imageUrl: "https://spoonacular.com/productImages/474522-312x231.jpg",
        averageRating: 0.82,
        ratingCount: 5,
        score: 0.75,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fbollig-lehnert-piesporter-goldtroopfchen-riesling-spatlese-2016%2F422585",
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Greek",
    winePairing: WinePairing(
      pairedWines: [
        "Agiorgitiko",
        "Assyrtiko",
        "Moschofilero",
      ],
      pairingText: "Greek works really well with Agiorgitiko, Assyrtiko, and Moschofilero. If you feel like going Greek with your Greek food, assyrtiko and moschofilero are both lovely white wines to pair with chicken, seafood, etc. Agiorgitiko is a full bodied red suitable for roasted meats and lamb. The Skouras Saint George Agiorgitiko with a 4.1 out of 5 star rating seems like a good match. It costs about 18 dollars per bottle.",
      productMatches: ProductMatches(
        id: 451095,
        title: "Skouras Saint George Agiorgitiko",
        description: "The color is bright, deep crimson. The nose reveals aromas of blackberries, black raspberries and ripe strawberries with just a touch of anise and spices such as clove and cinnamon. It is a medium bodied wine with graceful texture, balanced acidity and very ripe elegant tannins. The finish is moderately long, full of red fruits with a touch of sweet vanilla and black pepper.Blend: 100% Agiorgitiko",
        price: "\$17.99",
        imageUrl: "https://spoonacular.com/productImages/451095-312x231.jpg",
        averageRating: 0.82,
        ratingCount: 10,
        score: 0.78,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fskouras-saint-george-agiorgitiko-2011%2F146313",
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Indian",
    winePairing: WinePairing(
      pairedWines: [
        "Gruener Veltliner",
        "Riesling",
        "Sparkling Rose",
      ],
      pairingText: "Indian works really well with Gruener Veltliner, Riesling, and Sparkling rosé. The best wine for Indian food will depending on the dish, of course, but these picks can be served chilled and have some sweetness to complement the spiciness and complex flavors of a wide variety of traditional dishes. The Brundlmayer Kamptaler Terrassen Gruner Veltliner with a 4.1 out of 5 star rating seems like a good match. It costs about 24 dollars per bottle.",
      productMatches: ProductMatches(
        id: 457271,
        title: "Brundlmayer Kamptaler Terrassen Gruner Veltliner",
        description: "Flowery, delicate lime fruit, apple and pine apple with a hint of herbs, spice and yeast, soft at first taste, despite its lively acidity, then straightforward, fresh on the palate, sappy fruit, mineral nuances, good structure and balance, medium body and fine minerals in the spicy finish.A perfect companion to many starters such as smoked trout, ham, cold vegetables, tapas, or fresh marinated goat cheese with herbs; also very good with fish barbecue, sea food, or roasted chicken.",
        price: "\$23.99",
        imageUrl: "https://spoonacular.com/productImages/457271-312x231.jpg",
        averageRating: 0.82,
        ratingCount: 5,
        score: 0.75,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fbrundlmayer-kamptaler-terrassen-gruner-veltliner-2016%2F346441",
      ),
    ),
  ),
  Cuisines(
    hasWines: false,
    name: "Irish",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: true,
    name: "Italian",
    winePairing: WinePairing(
      pairedWines: [
        "Chianti",
        "Trebbiano",
        "Verdicchio",
      ],
      pairingText: "Italian on the menu? Try pairing with Chianti, Trebbiano, and Verdicchio. Italians know food and they know wine. Trebbiano and Verdicchio are Italian white wines that pair well with fish and white meat, while Chianti is a great Italian red for heavier, bolder dishes. One wine you could try is Antinori Peppoli Chianti Classico. It has 4 out of 5 stars and a bottle costs about 23 dollars.",
      productMatches: ProductMatches(
        id: 477136,
        title: "Antinori Peppoli Chianti Classico",
        description: "90% Sangiovese, 10% Merlot and SyrahIntroduced in 1988 with the 1985 vintage, Pèppoli Chianti Classico DOCG is the archetypal modern Chianti Classico. In a departure from traditional Chiantis, Pèppoli combines the complexity and structure of a well-aged riserva with the fruity fragrance of a young wine. This style is made possible by a unique microclimate where east-northeast facing vineyards are planted in a small heat-retaining valley on mineral-rich rocky soils that are perfect for growing very fruity, lively Sangiovese. The wine further benefits from the use of better Sangiovese clones, severe grape bunch selection, delayed and cluster harvest when necessary. The wine is produced on Antinori's Pèppoli Estate, which extends over 100 hectares (247 acres), 55 (136 acres) of which are under vine.Intense red fruit aromas, especially redcurrants and raspberries, are amplified by light hints of vanilla and coffee sensations. This full-bodied wine is pleasantly lingering with soft, sweet tannins. It should be drunk while still young for full expression of the fruit.",
        price: "\$22.99",
        imageUrl: "https://spoonacular.com/productImages/477136-312x231.jpg",
        averageRating: 0.8,
        ratingCount: 90,
        score: 0.79,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fantinori-peppoli-chianti-classico-2016%2F512960",
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Japanese",
    winePairing: WinePairing(
      pairedWines: [
        "Riesling",
        "Sake",
        "Sauvignon Blanc",
      ],
      pairingText: "Riesling, Sake, and Sauvignon Blanc are my top picks for Japanese. Saké is an obvious choice when it comes to Japanese food. If you want to stick to grape wine, though, you might opt for sauvignon blanc or riesling. You could try J.J. Prum Wehlener Sonnenuhr Auslese Riesling. Reviewers quite like it with a 4.4 out of 5 star rating and a price of about 40 dollars per bottle.",
      productMatches: ProductMatches(
        id: 438482,
        title: "J.J. Prum Wehlener Sonnenuhr Auslese Riesling",
        description: "The quality was great in 2011 and thankfully the quantities were also good. The 2011 wines possess an outstanding balance: their ripe acidity is already well integrated, just as the fruit aromas and flavours, and the pronounced fine minerality. The characters of the different vineyard sites are expressed beautifully in this vintage.",
        price: "\$39.99",
        imageUrl: "https://spoonacular.com/productImages/438482-312x231.jpg",
        averageRating: 0.88,
        ratingCount: 5,
        score: 0.81,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fjj-prum-wehlener-sonnenuhr-auslese-riesling-2011%2F121987",
      ),
    ),
  ),
  Cuisines(
    hasWines: false,
    name: "Jewish",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: false,
    name: "Korean",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: false,
    name: "Latin American",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: false,
    name: "Mediterranean",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: true,
    name: "Mexican",
    winePairing: WinePairing(
      pairedWines: [
        "Pinot Noir",
        "Riesling",
        "Sparkling Rose"
      ],
      pairingText: "Pinot Noir, Riesling, and Sparkling rosé are my top picks for Mexican. Acidic white wines like riesling or low-tannin reds like pinot noir can work well with Mexican dishes. Sparkling rosé is a safe pairing too. The The Hilt Estate Pinot Noir with a 4.7 out of 5 star rating seems like a good match. It costs about 50 dollars per bottle.",
      productMatches: ProductMatches(
          id: 493190,
          title: "The Hilt Estate Pinot Noir",
          description: "Dark and seductive. Nose full of vibrant herbs, black pepper and dark chocolate covered cherries. The fresh red fruit on the palate jumps out with subtle notes of black tea and savory smoked meat. Soft and fragrant fruit lingers on the acid-driven finish alongside gentle, chalky tannins. A beautiful and pure pinot noir right out of the gates",
          price: "\$49.97",
          imageUrl: "https://spoonacular.com/productImages/493190-312x231.jpg",
          averageRating: 0.9400000000000001,
          ratingCount: 5.0,
          score: 0.8775000000000001,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fthe-hilt-estate-pinot-noir-2014%2F515607"
      ),
    ),
  ),
  Cuisines(
    hasWines: false,
    name: "Middle Eastern",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: false,
    name: "Nordic",
    winePairing: WinePairing(),
  ),
  Cuisines(
    hasWines: true,
    name: "Southern",
    winePairing: WinePairing(
      pairedWines: [
        "Riesling",
        "Sparkling Wine",
        "Zinfandel"
      ],
      pairingText: "Southern can be paired with Riesling, Sparkling Wine, and Zinfandel. In general, there are a few rules that will help you pair wine with southern food. Food-friendly riesling or sparkling white wine will work with many fried foods, while zinfandel is great with barbecued fare. You could try J.J. Prum Graacher Himmelreich Kabinett Riesling. Reviewers quite like it with a 4.4 out of 5 star rating and a price of about 22 dollars per bottle.",
      productMatches: ProductMatches(
          id: 437965,
          title: "J.J. Prum Graacher Himmelreich Kabinett Riesling",
          description: "",
          price: "\$21.99",
          imageUrl: "https://spoonacular.com/productImages/437965-312x231.jpg",
          averageRating: 0.8800000000000001,
          ratingCount: 19.0,
          score: 0.8627586206896553,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fjj-prum-graacher-himmelreich-kabinett-riesling-1998%2F9594"
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Spanish",
    winePairing: WinePairing(
      pairedWines: [
        "Tempranillo",
        "Albarino",
        "Grenache"
      ],
      pairingText: "Tempranillo, Albarino, and Grenache are my top picks for Spanish. When pairing wine with Spanish dishes, why not follow the rule 'what grows together goes together'? We recommend albariño for white wine and garnachan and tempranillo for red. One wine you could try is Steppe Cellars Tempranillo - Grenache - Mourvedre. It has 5 out of 5 stars and a bottle costs about 28 dollars.",
      productMatches: ProductMatches(
          id: 430068,
          title: "Steppe Cellars Tempranillo - Grenache - Mourvedre",
          description: "Aromas of cassis, clove and black pepper licorice and toast. Medium bodied with lovely fruit intensity of bramble and dark cherry flavors. Long finish with flavors of chocolate and fresh coffee beans.",
          price: "\$27.5",
          imageUrl: "https://spoonacular.com/productImages/430068-312x231.jpg",
          averageRating: 1.0,
          ratingCount: 1.0,
          score: 0.75,
          link: "https://www.amazon.com/2008-Steppe-Cellars-Tempranillo-Mourvedre/dp/B00DVT3TDM?tag=spoonacular-20"
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Thai",
    winePairing: WinePairing(
      pairedWines: [
        "Gewurztraminer",
        "Riesling",
        "Chenin Blanc"
      ],
      pairingText: "Gewurztraminer, Riesling, and Chenin Blanc are my top picks for Thai. The best wine for Asian food depends on the cuisine and dish - of course - but these acidic whites pair with a number of traditional meals, spicy or not. The Pierre Sparr Gewurztraminer with a 4.1 out of 5 star rating seems like a good match. It costs about 23 dollars per bottle.",
      productMatches: ProductMatches(
        id: 434983,
        title: "Pierre Sparr Gewurztraminer",
        description: "Bright yellow highlights in the glass; the Pierre Sparr Gewurztraminer opens slowly with notes of rosewood and licorice. With aeration, floral acacia combines with fruity apricot aromas. On the palate this youthful Gewurztraminer shows a juicy sweetness and delicate acidity that will become more pronounced with maturity. The wine shows a minerality and fullness in the mouth, followed by an almost spicy, crisp and lingering finish.",
        price: "\$22.99",
        imageUrl: "https://spoonacular.com/productImages/434983-312x231.jpg",
        averageRating: 0.82,
        ratingCount: 8.0,
        score: 0.7799999999999999,
        link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fpierre-sparr-gewurztraminer-2012%2F132021",
      ),
    ),
  ),
  Cuisines(
    hasWines: true,
    name: "Vietnamese",
    winePairing: WinePairing(
      pairedWines: [
        "Chenin Blanc",
        "Gewurztraminer",
        "Riesling"
      ],
      pairingText: "Vietnamese on the menu? Try pairing with Chenin Blanc, Gewurztraminer, and Riesling. The best wine for Asian food depends on the cuisine and dish - of course - but these acidic whites pair with a number of traditional meals, spicy or not. The Birichino Jurassic Park Vineyard Old Vines Chenin Blanc with a 4.4 out of 5 star rating seems like a good match. It costs about 18 dollars per bottle.",
      productMatches: ProductMatches(
          id: 478838,
          title: "Birichino Jurassic Park Vineyard Old Vines Chenin Blanc",
          description: "We are delighted to release our third vintage from what are considered old vines in Southern California: 33 year-old vine chenin planted in the Late Disco era on its own roots at 1100’ elevation. This sandy, rocky dinosaur boneyard vineyard has rapidly become one of the more sought-after sites for this noble variety on the Left Coast, and has the unusual atmospheric element of being surrounded by an active oilfield, suggesting deep geologic origins for its focused, mineral aspect. Harvested before dawn on August 27th, this is perhaps the most tightly-wound vintage we’ve yet produced from the site, and we expect it to be drinking beautifully for a number of years. Fermentation with indigenous yeast took place in stainless, and élevage sur lie continued through the spring in stainless and neutral French oak barrels.",
          price: "\$17.99",
          imageUrl: "https://spoonacular.com/productImages/478838-312x231.jpg",
          averageRating: 0.8800000000000001,
          ratingCount: 5.0,
          score: 0.8175000000000001,
          link: "https://click.linksynergy.com/deeplink?id=*QCiIS6t4gA&mid=2025&murl=https%3A%2F%2Fwww.wine.com%2Fproduct%2Fbirichino-jurassic-park-vineyard-old-vines-chenin-blanc-2015%2F400659"
      ),
    ),
  ),

];