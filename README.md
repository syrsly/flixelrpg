flixelrpg
=========

Framework for building an action RPG dungeon crawler in ActionScript 3 on top of a customized and stripped-down copy of Flixel 2.55.

Graphics all come from my OGA submissions gallery at http://opengameart.org/users/tap and are licensed under CC-By-SA 3.0.

You can contact me via syrsly.com (social links at bottom of every page) if you need assistance or have any questions about this project.

Noteworthy features
=========
Note: These features may not yet be implemented on GitHub version. Some features are broken outside of demo build.

1. Visual character customization using blitting technique.
2. Clothing color customization using color matrix transformation.
3. Scrolling tile-based world utilizing Ogmo for map editor. Fully functional.
4. Optionally plays .mod files instead of mp3 music. Fully functional.
5. Sign posts readable when player character is in proximity. Only works in demo project, not in source.
6. Dialogue subsystem supports both NPC dialogue and area name announcements. Fully functional.
7. Day/night toggle with different lighting styles for each mode. Functional but not implemented in demo.
8. NPC AI with XML-based scripting and dialogue. Partially functional. Needs a lot of work.
9. Shop and inventory and save/load system. Not functional but laid some groundwork.

Compilation requirements
=========
Flixel library is included because it has been modified greatly.  All you have to do is load the project file into FlashDevelop and target the latest version of Air.  Do not target Flash!  This game engine is designed using external data files and is intended for desktop use rather than web-based gaming.  However, if you remove a few of the features, the game engine should work for Flash Player 11+. Some commented out code exists for saving data for web game purposes.

Current status of engine
=========
Initial version.  Very barebones and incomplete.  Check the demo folder for a demonstration of what's possible with this engine.

Version 0.0.2

No longer planning any updates for this framework as I have moved on to other projects. If you need support, I'm available for paid consulting, but otherwise, if someone else wants to fork and continue this project, you have my blessing.
