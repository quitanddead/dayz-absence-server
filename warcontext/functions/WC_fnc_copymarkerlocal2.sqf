	// -----------------------------------------------
	// Author: team  code34 nicolas_boiteux@yahoo.fr
	// warcontext - Description: 
	// create a marker
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
		"_marker3"
		];

	_indexparameters = 0;
	_nbparameters = count _this;
	{
		if (_indexparameters <= _nbparameters) then {
		call compile format["%1 = _this select %2;", _x, _indexparameters];
		};
		_indexparameters = _indexparameters + 1;
	}foreach _parameters;

	_markersize = (getmarkersize _marker3) select 0;
	_markerposition = markerpos _marker3;
	_markercolor 	= markercolor _marker3;
	_markershape	= markershape _marker3;
	_markerbrush 	= markerbrush _marker3;
	_markertype 	= markertype _marker3;
	_markerdir 	= markerdir _marker3;
	_markertext 	= _markername;

	if(isnil "_markertype") then { _markertype = "" ;};
	if(isnil "_markerdir") then { _markerdir = 0;};
	if(isnil "_markertext") then { _markertext = "";};
	if(isnil "_protect") then { _protect = false;};

	_marker3 = createMarkerlocal[_markername, _markerposition];
	if (!isnil ("_markersize")) then { _marker3 setMarkerSizelocal [_markersize, _markersize]; };
	if (_markershape != "") then { _marker3 setMarkershapelocal _markershape; };
	if (_markercolor != "") then { _marker3 setMarkerColorlocal _markercolor; };
	if (_markerbrush != "") then { _marker3 setMarkerBrushlocal _markerbrush; };
	if (_markertext != "") then { _marker3 setMarkerTextlocal _markertext; };
	if (!isnil ("_markerdir")) then { _marker3 setMarkerDirlocal _markerdir; };
	if (!isnil ("_markertype")) then { _marker3 setMarkerTypelocal _markertype; };

	_marker3;