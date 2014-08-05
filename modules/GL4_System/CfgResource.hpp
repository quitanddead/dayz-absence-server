class RscText;

class RscPicture;

class RscStandardDisplay;

class RscDisplayMain : RscStandardDisplay
{
	idd = 0;

	class controls
	{
		class GL4_System_RscDisplayMain : RscText
		{
			style = 0x01 + 0x100;

			colortext[] = {0.543, 0.5742, 0.4102, 1.0};

			x = "(SafeZoneH + SafeZoneX) - (1 - 0.45)";
			y = "(SafeZoneH + SafeZoneY) - (1 - 0.69)";
			w = 0.5;
			h = 0.05;

			sizeEx = 0.03674;

			text = "Group Link 4 Special FX Edition";
		};

		class GL4_Version_RscDisplayMain : RscText
		{
			style = 0x01 + 0x100;

			colortext[] = {0.543, 0.5742, 0.4102, 1.0};

			x = "(SafeZoneH + SafeZoneX) - (1 - 0.45)";
			y = "(SafeZoneH + SafeZoneY) - (1 - 0.74)";
			w = 0.5;
			h = 0.05;

			sizeEx = 0.02674;

			text = "Version: 1.1.87";
		};
	};
};