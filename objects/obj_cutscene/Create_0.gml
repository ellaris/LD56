/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

//state = 1;
transfer = function(_x)
{
	return(max(0,2*_x-power(_x,2)))
}

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
	}
	else
	if(_n == 2)
	{
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

figure_star = new figure(view_wport/2,view_hport/2,spr_star,1);
figure_samurai = new figure(view_wport/2,view_hport/2,spr_samurai,3);
figure_bandit1 = new figure(view_wport/3,view_hport/2,spr_bandit,3.2);
figure_bandit2 = new figure(view_wport/3,view_hport/2-32,spr_bandit,3.25);
figure_bandit3 = new figure(view_wport/3,view_hport/2+32,spr_bandit,3.3);


figures = [figure_star, figure_samurai, figure_bandit1, figure_bandit2, figure_bandit3];


