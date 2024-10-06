/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//state = 1;
transfer = function(_x)
{
	return(max(0,2*_x-power(_x,2)))
}

play_sound = true;
sound_asset = snd_intro;

time = 0.5;

figure = function(_x, _y, _spr, _time, ) constructor {
	sprite = _spr;
	time = _time;
	x = _x;
	y = _y;
}

state = function(_n)
{
	if(_n == 3)
	{
		figure_star = new figure(view_wport/2,view_hport/2-32-8,spr_star,1);
		figure_star2 = new figure(view_wport/2-24,view_hport/2-32,spr_star,1);
		figure_star3 = new figure(view_wport/2+24,view_hport/2-32,spr_star,1);
		figure_samurai = new figure(view_wport/2,view_hport/2,spr_samurai,1);
		//figure_bandit1 = new figure(view_wport/3,view_hport/2,spr_bandit,1.2);
		//figure_bandit2 = new figure(view_wport/3,view_hport/2-32,spr_bandit,1.2);
		//figure_bandit3 = new figure(view_wport/3,view_hport/2+32,spr_bandit,1.2);
		figures = [figure_star, figure_samurai, figure_star2, figure_star3];
		sound_asset = snd_perfect;
	}
	else
	if(_n == 2)
	{
		sound_asset = snd_end;
		figure_star = new figure(view_wport/2,view_hport/2-32,spr_star,1);
		figure_samurai = new figure(view_wport/2,view_hport/2,spr_samurai,1);
		figure_bandit1 = new figure(view_wport/3,view_hport/2,spr_bandit,1.2);
		figure_bandit2 = new figure(view_wport/3,view_hport/2-32,spr_bandit,1.2);
		figure_bandit3 = new figure(view_wport/3,view_hport/2+32,spr_bandit,1.2);
		figures = [figure_star, figure_samurai, figure_bandit1, figure_bandit2, figure_bandit3];
	}
	else
	{
	
		figures = [figure_star, figure_samurai, figure_bandit1, figure_bandit2, figure_bandit3];
	}
}

figure_star = new figure(view_wport/2,view_hport/2,spr_star,0.8);
figure_samurai = new figure(view_wport/2,view_hport/2,spr_samurai,1.7);
figure_bandit1 = new figure(view_wport/3,view_hport/2,spr_bandit,2.1);
figure_bandit2 = new figure(view_wport/3,view_hport/2-32,spr_bandit,2.15);
figure_bandit3 = new figure(view_wport/3,view_hport/2+32,spr_bandit,2.2);


figures = [figure_star, figure_samurai, figure_bandit1, figure_bandit2, figure_bandit3];


