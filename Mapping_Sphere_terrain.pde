import peasy.*;

import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

PeasyCam cam;

HE_Mesh mesh;
WB_Render render;

void setup() {
  size(800, 800, P3D);
  cam = new PeasyCam(this, 100);
  HEC_Sphere mySphere=new HEC_Sphere();
  mySphere.setRadius(200); 
  mySphere.setUFacets(16);
  mySphere.setVFacets(16);
  mesh = new HE_Mesh(mySphere); 
  HET_Diagnosis.validate(mesh);
  render=new WB_Render(this);
  displace(mesh);
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 100);
  stroke(0);
  render.drawEdges(mesh);
  noStroke();
  render.drawFaces(mesh);
}


public void displace(HE_Mesh m){
	WB_Point3d[] points = m.getVerticesAsPoint();
	WB_Vector3d[] normals = m.getVertexNormals();
	for (int i = 0; i< points.length; i++){
		WB_Point3d current = points[i];
		current.add(normals[i].mult((double)i));
	}
}
