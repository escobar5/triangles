# triangles
A simple generative exercise with a grid of triangles

The triangles are distributed on a grid, the background is generated with perlin noise.

There are three modes (`int mode = 0; //0: Normal, 1: Triangles circling, 2: Triangles pointing`):

In `int mode = 0;` all triangles are drawn at equal angles, and one triangle is marked (white).
<p align="center">
  <img alt="Triangles" src="https://github.com/jse-co/triangles/blob/master/images/triangles_1.png?raw=true" width="600" />
</p>

In `int mode = 1;` the triangles are circling the marked triangle.
<p align="center">
  <img alt="Triangles" src="https://github.com/jse-co/triangles/blob/master/images/triangles_2.png?raw=true" width="600" />
</p>

In `int mode = 2;` the triangles are facing the marked triangle.
<p align="center">
  <img alt="Triangles" src="https://github.com/jse-co/triangles/blob/master/images/triangles_3.png?raw=true" width="600" />
</p>
