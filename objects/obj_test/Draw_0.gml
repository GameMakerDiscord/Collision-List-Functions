//
//var x1 = mouse_x, y1 = mouse_y;
draw_set_color(c_white);
draw_set_font(fnt_test);
draw_text(5, 5, "Hold Key:"
	+ "\n1 instance_position_list"
	+ "\n2 instance_place_list"
	+ "\n3 collision_point_list"
	+ "\n4 collision_rectangle_list"
	+ "\n5 collision_line_list"
	+ "\n6 collision_circle_list"
	+ "\n7 collision_ellipse_list"
	+ "\n\n" + text
);


var sorton = (mSorted) ? "ON" : "OFF";
var targetName = mObjTargetNames[mObjTarget];
var preciseon = (mPrecise) ? "ON " : "OFF";

draw_text(5, 190,  "S: Sort: " + sorton
	+ "\nO: Object type: " + targetName
	+ "\nP: Precise: " + preciseon );

//
var test = false;
for (var k = 1; k <= 7; k++) {
	if( keyboard_check(ord("0") + k) )
	{
		hold = k;
		test = true;
		x1 = mouse_x;
		y1 = mouse_y;
	}

	if (keyboard_check_pressed(ord("0") + k)) 
	{
		x0 = mouse_x;
		y0 = mouse_y;
	}
}
//
if( keyboard_check_pressed(ord("S")) )
	mSorted = !mSorted; test = true;
if( keyboard_check_pressed(ord("O")) )
	mObjTarget = (mObjTarget+1) % eObjectTarget.Max; test = true;
if( keyboard_check_pressed(ord("P")))
	mPrecise = !mPrecise; test = true;

if( test )
{
	var objTarget = all;
	if(mObjTarget = eObjectTarget.Circle) objTarget = obj_circle;
	else if( mObjTarget = eObjectTarget.Square) objTarget = obj_square;

	draw_set_color(c_red);
	found = 0;
	if (hold=1) found = instance_position_list(x1, y1, objTarget, list, mSorted);
	if (hold=2) {
		//draw_circle(x1, y1, 30, true);
		found = instance_place_list(x1, y1, objTarget, list,mSorted);
	}
	if (hold=3) found = collision_point_list(x1, y1, objTarget, mPrecise, true, list,mSorted);
	if (hold=4) {
		//draw_rectangle(x0, y0, x1, y1, true);
		found = collision_rectangle_list(x0, y0, x1, y1, objTarget, mPrecise, true, list,mSorted);
	}
	if (hold=5) {
		//draw_line(x0, y0, x1, y1);
		found = collision_line_list(x0, y0, x1, y1, objTarget, mPrecise, true, list,mSorted);
	}
	if (hold=6) {
		var r = point_distance(x0, y0, x1, y1);
		//draw_line(x0, y0, x1, y1);
		//draw_circle(x0, y0, r, true);
		found = collision_circle_list(x0, y0, r, objTarget, mPrecise, true, list,mSorted);
	}
	if (hold=7) {
		//draw_ellipse(x0, y0, x1, y1, true);
		found = collision_ellipse_list(x0, y0, x1, y1, objTarget, mPrecise, true, list,mSorted);
	}
}

switch(hold) {
	case 1: break;
	case 2: draw_circle(x1, y1, 30, true); break;
	case 3: break;
	case 4: draw_rectangle(x0, y0, x1, y1, true); break;
	case 5: draw_line(x0, y0, x1, y1); break;
	case 6: var r = point_distance(x0, y0, x1, y1);
			draw_line(x0, y0, x1, y1);
			draw_circle(x0, y0, r, true);
			break;
	case 7: draw_ellipse(x0, y0, x1, y1, true); 
			draw_point( (x0+x1)*0.5, (y0+y1)*0.5 );
			break;
}


//
if (hold > 0) {
	text = string(found) + " instance";
	if (found != 1) text += "s";
	//
	with (obj_base)  {
		image_blend = c_white;
		m_colIndex = -1;
	}
	//with (obj_square)  {
	//	image_blend = c_white;
	//	m_colIndex = -1;
	//}
	var n = ds_list_size(list);
	for (var i = 0; i < n; i++) 
	{
		//list[|i].image_blend = c_black;
		var instId = list[|i];
		instId.image_blend = c_black;
		instId.m_colIndex = i+1;
	}
	ds_list_clear(list);
}