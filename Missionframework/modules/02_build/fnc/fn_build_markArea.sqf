/*
    KPLIB_fnc_build_markArea

    File: fn_build_markArea.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates sphere indicators around given area (LOCALLY)

    Parameter(s):
        0: ARRAY - Center position of area to mark
        1: STRING - Radius to mark around the center position

    Returns:
    ARRAY - Array with created spheres
*/
params [
    ["_position", nil, [[]]],
    ["_radius", nil, [0]]
];

private _indicatorClass = "Sign_Sphere100cm_F";

// Create spheres array
private _spheres = [];

// Get positions
private _indicatorsPositions = [_position, _radius] call KPLIB_fnc_common_getCirclePositions;

// Create spheres
{
    private _pos = _x select [0, 3];

    private _sphere = _indicatorClass createVehicleLocal [0, 0, 0];
    _sphere setPos _pos;

    _spheres pushBack _sphere;

} forEach _indicatorsPositions;

_spheres
