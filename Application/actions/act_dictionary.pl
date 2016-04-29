<%
// ----------------------------------------------------------------------------------------------------------------
// Random Word Generator for CAPTCHA
// ----------------------------------------------------------------------------------------------------------------
	
	WordString = "Airport,Album,Apple,Arm,Army,Ball,Bank,Bath,Bed," & _
	             "Bed,Bee,Bird,Book,Boss,Bottle,Bowl,Box,Boy,Brain,Bridge,Butter,Button,Car," & _
							 "Carpet,Carrot,Cave,Chair,Chief,Child,Chisel,Church,Circle,Circus,Clock,Clown," & _
							 "Coffee,Comet,Crystal,Cup,Cycle,Desk,Diamond,Dress,Drill,Drink,Drum,Dung,Ears,Earth,Egg," & _
							 "Eraser,Eyes,Family,Fan,Film,Finger,Fire,Flower,Foot,Fork," & _
							 "Fruit,Fungus,Game,Garden,Gas,Gate,Gem,Girl,Gloves,Grapes,Guitar,Hammer,Hat," & _
							 "Horse,Hose,Ice,Insect,Junk,Kitchen,Knife,Leg,Library,Liquid,Magnet,Man,Map,Maze,Meat,Meteor," & _
							 "Milk,Mist,Monster,Mouth,Nail,Navy,Neck,Needle,Onion,Pebble," & _
							 "Pepper,Perfume,Pillow,Plane,Planet,Pocket,Potato,Printer,Radar,Record,Rifle," & _
							 "Ring,Robot,Rock,Rocket,Roof,Room,Rope,Saddle,Salt,Sand,School,Ship,Shoes,Shop,Shower," & _
							 "Skeleton,Snail,Software,Solid,Spectrum,Sphere,Spice,Spiral,Spoon,Square," & _
							 "Star,Stomach,Sun,Surveyor,Sword,Table,Tapestry,Teeth,Tennis," & _
							 "Tiger,Toilet,Tongue,Torch,Torpedo,Train,Triangle,Tunnel,Type,Umbrella,Vacuum,Vampire,Video,Vulture,Water,Weapon,Web," & _
							 "Wheel,Window,Woman,Worm"
							 
	WordArray = Split(WordString,",")
	Randomize
	
	RandomWord1 = WordArray(Int(Rnd * UBound(WordArray)))
	RandomWord2 = WordArray(Int(Rnd * UBound(WordArray)))
	
// ----------------------------------------------------------------------------------------------------------------
%>