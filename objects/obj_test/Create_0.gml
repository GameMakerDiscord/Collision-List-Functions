gpu_set_tex_filter(true);
for( var i=0; i < 50; ++i )
{
	var obj = (i&1) ? obj_square : obj_circle;
	var q = instance_create_depth(random_range(175, room_width - 25), random_range(25, room_height - 25), 1, obj);
    //q.sprite_index = spr_test;
	q.image_angle = random(360);
}
sprite_index = spr_test;
text = "";
list = ds_list_create();
x0 = 0;
y0 = 0;
mSorted = true;
mPrecise = true;
hold = -1;

enum eObjectTarget
{
	All,
	Circle,
	Square,
	Max
}
mObjTarget = eObjectTarget.All;
mObjTargetNames = ["All","Circle","Square"];