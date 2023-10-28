package;

import meta.data.*;
import openfl.Lib;
import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.FlxGraphic;
import lime.app.Application;
import meta.state.MusicBeatState;
import meta.state.menus.StoryMenuState;
import meta.state.menus.TitleState;
import meta.CoolUtil;
import meta.data.Discord.DiscordClient;

/*

    SORRY Wednesday's Infedility :pensive:

    Anyways, this is the Initilzation class.

*/

class Init extends FlxState
{
	public override function new()
	{
		super();
	}

    public override function create()
    {
        super.create();

        FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;

        PlayerSettings.init();

		FlxG.save.bind('funkin', 'ninjamuffin99');
		ClientPrefs.loadPrefs();

        if (FlxG.save.data.weekCompleted != null)
		{
			StoryMenuState.weekCompleted = FlxG.save.data.weekCompleted;
		}

		Highscore.load();

		FlxG.mouse.visible = false;

        #if desktop
        DiscordClient.initialize();
        Application.current.onExit.add (function (exitCode) {
            DiscordClient.shutdown();
        });
        #end

        trace('ay bruh we inited ur shit');
        FlxG.switchState(new TitleState());
    }
}