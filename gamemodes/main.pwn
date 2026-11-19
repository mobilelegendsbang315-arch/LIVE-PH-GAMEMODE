
#include <a_samp>

#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_BLUE 0x3399FFFF
#define COLOR_GREEN 0x33CC33FF
#define COLOR_RED 0xFF3333FF

main()
{
    print("================================");
    print("       GRAND CITY ROLEPLAY");
    print("================================");
}

public OnGameModeInit()
{
    SetGameModeText("Grand City RP");
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
    ShowNameTags(1);
    SetWorldTime(12);
    SetWeather(10);

    AddPlayerClass(0, 1481.0, -1771.0, 18.8, 90.0,
        0, 0, 0, 0, 0, 0);

    print("[GRAND CITY] Gamemode initialized.");
    return 1;
}

public OnPlayerConnect(playerid)
{
    SendClientMessage(playerid, COLOR_BLUE,
        "Welcome to GRAND CITY ROLEPLAY!");

    SendClientMessage(playerid, COLOR_WHITE,
        "Type /help to view available commands.");

    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPlayerPos(playerid, 1481.0, -1771.0, 18.8);
    SetPlayerFacingAngle(playerid, 90.0);
    SetCameraBehindPlayer(playerid);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (!strcmp(cmdtext, "/help", true))
    {
        SendClientMessage(playerid, COLOR_BLUE,
            "===== GRAND CITY COMMANDS =====");
        SendClientMessage(playerid, COLOR_WHITE,
            "/help - Show commands");
        SendClientMessage(playerid, COLOR_WHITE,
            "/rules - Server rules");
        SendClientMessage(playerid, COLOR_WHITE,
            "/stats - Player information");
        return 1;
    }

    if (!strcmp(cmdtext, "/rules", true))
    {
        SendClientMessage(playerid, COLOR_GREEN,
            "===== SERVER RULES =====");
        SendClientMessage(playerid, COLOR_WHITE,
            "Respect other players.");
        SendClientMessage(playerid, COLOR_WHITE,
            "No cheating or exploiting.");
        return 1;
    }

    if (!strcmp(cmdtext, "/stats", true))
    {
        new name[MAX_PLAYER_NAME];
        new message[128];

        GetPlayerName(playerid, name, sizeof(name));
        format(message, sizeof(message),
            "Player: %s | ID: %d", name, playerid);

        SendClientMessage(playerid, COLOR_BLUE, message);
        return 1;
    }

    return 0;
}
