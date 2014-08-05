	// -----------------------------------------------
	// Author: team  code34 nicolas_boiteux@yahoo.fr
	// warcontext - Create a marker
	// -----------------------------------------------
	
	private [
		"_indexparameters",
		"_nbparameters",
		"_parameters",
		"_marker3",
		"_markername",
		"_markersize",
		"_markerposition",
		"_markercolor",
		"_markershape",
		"_markerbrush",
		"_markertype",
		"_markerdir",
		"_markertext",
		"_protect"
		];

	_parameters = [
		"_markername",
		"_markersize",
		"_markerposition",
		"_markercolor",
		"_markershape",
		"_markerbrush",
		"_markertype",
		"_markerdir",
		"_markertext",
		"_protect"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	if(isnil "_markertype") then { _markertype = "" ;};
	if(isnil "_markerdir") then { _markerdir = 0;};
	if(isnil "_markertext") then { _markertext = "";};
	if(isnil "_protect") then { _protect = false;};

	_tmparray = [_markername, _markersize, _markerposition, _markercolor, _markershape, _markerbrush, _markertype, _markerdir, _markertext, _protect];
	wcarraymarker = wcarraymarker + [_tmparray];
	_marker3 = createMarker[_markername, _markerposition];
	if (!isnil ("_markersize")) then { _marker3 setMarkerSize [_markersize, _markersize]; };
	if (_markershape != "") then { _marker3 setMarkershape _markershape; };
	if (_markercolor != "") then { _marker3 setMarkerColor _markercolor; };
	if (_markerbrush != "") then { _marker3 setMarkerBrush _markerbrush; };
	if (_markertext != "") then { _marker3 setMarkerText _markertext; };
	if (!isnil ("_markerdir")) then { _marker3 setMarkerDir _markerdir; };
	if (!isnil ("_markertype")) then { _marker3 setMarkerType _markertype; };

	_marker3;