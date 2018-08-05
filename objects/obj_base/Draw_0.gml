/// @description Insert description here
// You can write your code in this editor
if( obj_test.mPrecise == false )
{
	draw_set_colour(0x00ff00);
	draw_set_alpha(0.35);
	draw_rectangle(bbox_left, bbox_top,bbox_right,bbox_bottom,true);
	draw_set_alpha(1);
}

draw_self();
//if(m_colIndex >0)
//	draw_text(x,y, string(m_colIndex));


