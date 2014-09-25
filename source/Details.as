package 
{
	import flash.display.Sprite;
	import flash.net.SharedObject;
	import org.flixel.*;
	//import org.flixel.data.FlxGamepad;
	
	/**
	 * Flixel RPG Framework
	 * @author Josh Maines
	 * @site www.joshmaines.com
	 */
	/** This class is never destroyed and never created.  It is static, eternal, just plain immortal.
	 * This is where we store global variables that should never be deleted and should always be accessible.
	 * It is also where we keep useful functions/methods for later use.
	*/
	public class Details 
	{
		public static const UP:int = 1;
		public static const DOWN:int = 0;
		public static const LEFT:int = 2;
		public static const RIGHT:int = 3;
		public static var GUICon:Sprite;
		public static var invWindow:RPGPanel;
		public static var items:Array;
		public static var spells:Array;
		public static var weapons:Array;
		public static var weaponPrefix:Array;
		public static var weaponTypes:Array;
		public static var weaponSuffix:Array;
		public static var player:Player;
		public static var crates:FlxGroup;
		public static var hitEnemies:FlxGroup;
		public static var canHurt:FlxGroup;
		public static var characters:Vector.<RPGChar>;
		public static var targets:Object;
		public static var staticObjects:Object;
		public static var loadError:String;
		public static var gamePaused:Boolean = false;
		public static var testCol:Boolean = true;
		public static var areaName:DialogueBox;
		public static var outside:Boolean = true;
		public static var dialogue:Dialogue;
		public static var chosenOption:int = 0;
		public static var consequence:Function;
		public static var consequences:Vector.<int>;
		public static var choices:Vector.<String>;
		public static var gameResOX:int = 740;
		public static var gameResOY:int = 480;
		public static var gameResX:int = 1024;
		public static var gameResY:int = 768;
		//public static var dynObj:Array = new Array("NPC1":NPC1,"NPC2":NPC2,);
		//public static var dynObj:NPC1 = new NPC1();
		public var sharedObject:SharedObject;
		
		// Temporary storage for methods which may need a global namespace for their shared values. Not sure if necessary but very useful sometimes.
		public static var wName:String = ""; // Weapon name
		public static var wDur:int = 0; // Weapon duration
		public static var wAtt:int = 0; // Weapon attack
		public static var wDef:int = 0; // Weapon defense
		
		public function Details () {
		} // This function is useless but FlashDevelop requires it to compile the project regardless of the static nature of the class.
		
		public static function beginData ():void {
			canHurt = new FlxGroup;
			hitEnemies = new FlxGroup;
			dialogue = new Dialogue(10, 20, true, 610, 120);
			areaName = new DialogueBox(40, 155, true, 560, 50, 60);
			loadError = "";
			invWindow = new RPGPanel();
			// The following Vector is basically a list of NPC names we will use within the game world.
			// The other values are used to associate the names with specific character attributes.
			characters = new Vector.<RPGChar>;
			characters.push(new RPGChar(0,20,"Billy Bob"));
			characters.push(new RPGChar(1,20,"Sally Sob"));
			characters.push(new RPGChar(1,20,"Nibby Nob"));
			characters.push(new RPGChar(1,20,"Drake Fortune"));
			characters.push(new RPGChar(2,20,"Joseph Blank"));
			characters.push(new RPGChar(1,20,"Nobby Nib"));
			characters.push(new RPGChar(1,20,"Valerie"));
			characters.push(new RPGChar(1,20,"Jason Fourleaf"));
			characters.push(new RPGChar(1, 20, "Benny Boss"));
			//trace("details container: "+characters);
			targets = new Object();
			staticObjects = new Object();
			items = new Array;
			//Item types:
			// 0 = quest item
			// 1 = consumable
			// 2 = spell tome
			// 3 = amulet
			// 4 = head
			// 5 = body
			// 6 = legs
			// 7 = feet
			// 8 = left hand
			// 9 = right hand
			// 10 = weapon
			// 11 = ring
			// 12 = pet
			//items[0] = addItem(item type,item number,stack amount);
			items.push(addItem(1,0,5));
			items.push(addItem(10,0));
			spells = new Array;
			//spells[] = new Array(name,description,attack power,mana cost,element);
			// elements:
			// 0 = fire
			// 1 = water
			// 2 = earth
			// 3 = air
			// 4 = spirit
			// 5 = void
			// 6 = alchemy
			spells[0] = new Array("Fireball","Gust of flame from your hands, not very powerful",1,1,0);
			spells[1] = new Array("Flamespout","Jets of flames from your hands",2,1,0);
			spells[2] = new Array("Flare Arrow","Long range attack using the element of fire",3,5,0);
			spells[3] = new Array("Gush","Push water out of the ground to hit enemies from below",1,5,1);
			spells[4] = new Array("Overflow","Flood the ground around you to put out fires",0,5,1);
			spells[5] = new Array("Ice Arrow","Form shards of ice and shoot them",4,10,1);
			//spells[18] = new Array("Liquidation","Sacrifice any item to get mana for spells",0,1,6);
			weapons = new Array;
			//weapons.push(createWeapon(0,0,0,false));
			weaponPrefix = new Array;
			//weaponPrefix.push(name,durability,attackBonus,defendBonus);
			weaponPrefix.push("Iron", 3, 0, 1);
			weaponPrefix.push("Steel", 5, 1, 2);
			weaponPrefix.push("Amazing", 25, 10, 6);
			weaponPrefix.push("Epic", 50, 10, 6);
			weaponPrefix.push("Mythical", 50, 15, 10);
			weaponPrefix.push("Godly", 500, 15, 15);
			weaponTypes = new Array;
			//weapons.push(name,handType,attackBonus,defendBonus,magicBonus);
			// Hand types are 1 for one-handed, 2 for two-handed.
			weaponTypes.push("Sword", 1, 2, 2, 0);
			weaponTypes.push("Dagger", 1, 1, 1, 0);
			weaponTypes.push("Broadsword", 2, 3, 6, 0);
			weaponTypes.push("Rod", 2, 1, 1, 4);
			weaponTypes.push("Sand Blade", 1, 3, 2, 0);
			weaponSuffix = new Array;
			//weaponSuffix.push(name,attackBonus,defendBonus,attackElement,attackElemBonus,defendElement,defendElemBonus);
			weaponSuffix.push("Great Power", 2, 1, 0, 0, 0, 0);
			weaponSuffix.push("Valor", 1, 2, 5, 0, 0, 0);
			weaponSuffix.push("Great Suffering", 3, 0, 6, 1, 0, 0);
			weaponSuffix.push("the Netherworld", 1, 3, 6, 1, 0, 0);
			weaponSuffix.push("Valor", 1, 2, 0, 0, 0, 0);
			weaponSuffix.push("Valor", 1, 2, 0, 0, 0, 0);
			//attack elements:
			// 0 = no element
			// 1 = fire
			// 2 = water
			// 3 = earth
			// 4 = air
			// 5 = spirit
			// 6 = void
		}
		public static function addItem(itemType:int = 0, itemNum:int = 0, stackMax:int = 0):Array {
			//itemType determines how an item can be used and refers to the item array it belongs to
			//if stackMax is 0 or 1, you cannot stack the item into a single inventory slot
			return new Array(itemType,itemNum,stackMax);
		}
		public static function setDialog (name:String,messages:Vector.<String>, funCalled:Function = null):void {
			dialogue.newDialog(name,messages,funCalled);
		}
		public static function setShop (name:String, itemNames:Vector.<String>, itemTypes:Vector.<String>, itemPrices:Vector.<String>, funCalled:Function = null):void {
			//dialogue.newShop(name,itemNames,itemTypes,itemPrices,funCalled);
		}
		public static function setAreaTitle (title:String = "..."):void {
			areaName.showDialog(title);
		}
		public static function listChoice (name:String, title:String,consequence:Function=null):void {
			Details.consequence = consequence;
			var v4d:Vector.<String> = new Vector.<String>;
			v4d.push(title);
			dialogue.newDialog(name,v4d,dialogue.showChoice);
		}
		public static function shop (afterShopping:Function=null):void {
			areaName.showDialog("SHOP SYSTEM GOES HERE");
			if (afterShopping != null) {
				afterShopping();
			}
		}
		public static function randomWeapon():Array {
			return new Array(createWeapon(Math.random()*(weaponPrefix.length-1),Math.random()*(weaponTypes.length-1),Math.random()*(weaponSuffix.length-1)));
		}
		public static function createWeapon(wPrefix:int = 0, wType:int = 0, wSuffix:int = 0, wSuffixB:Boolean = true):Array {
			Details.wName = Details.weaponPrefix[wPrefix][0] + " " + Details.weaponTypes[wType][0];
			Details.wDur = Details.weaponPrefix[wPrefix][1];
			Details.wAtt = Details.weaponPrefix[wPrefix][2]+Details.weaponTypes[wType][2];
			Details.wDef = Details.weaponPrefix[wPrefix][3]+Details.weaponTypes[wType][3];
			if (wSuffixB == true) {
				Details.wName += " of "+Details.weaponSuffix[wSuffix][0];
				Details.wAtt += Details.weaponSuffix[wSuffix][1];
				Details.wDef += Details.weaponSuffix[wSuffix][2];
			}
			return new Array(Details.wName, Details.weaponTypes[wType][1], Details.wDur, Details.wAtt, Details.wDef);
			// Weapon data: name, hand type, durability, attack power, defense power.
		}
		
		public function loadData():Boolean {
			//sharedObject = null;
			//sharedObject = new SharedObject();
			//sharedObject = SharedObject.getLocal("RogueRPG");
			//if (sharedObject.data.settings) {
				//fsmode = sharedObject.data.fullscreen;
			//}
			//if (sharedObject.data.player) {
				//player.health = sharedObject.data.player.hp;
				//load Player class
				//player.characterClass = __;
				//set crates opened
				//crates;
			//} else {
				//loadError = "Save data does not exist to load from.";
				//return false;
			//}
			//sharedObject.flush();
			return true;
		}
		public function saveData():void {
			sharedObject = new SharedObject();
			//save the player stats, inventory, and pet stats
			sharedObject.data.player.hp = player.hp;
			//sharedObject.data.player = player;
			//save the chests opened
		}
		public static function erase():void {
			player = null;
			invWindow = null;
		}
		public static function setResolution(setResX:int = 1024, setResY:int = 768):void {
			
		}
	}
	
}