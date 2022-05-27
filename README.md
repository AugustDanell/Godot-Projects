# Godot-Projects
The idea of this repo is to have a collection of different smaller projects done in Godot so that I can easily extend upon it for more advanced projects. Here is a list of items:

- Tower Defence: Just a normal Tower Defence (TD) game. This game makes use of the Path 2D and Path 2D Follow Nodes. Both are easy to use and makes a lot of sense to use in TD games. In this implementation I set up a map and I set up a Path 2D as a parent node to all paths. For each enemy that spawns they are attached to an instance of a Path 2D Follow node, that is also created in the same go. The player can put out cannons which are scences that have a 2D area that can find any nearby enemy instances (Traversing down the Path 2D). 
