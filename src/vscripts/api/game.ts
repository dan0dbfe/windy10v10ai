
import { ApiClient, HttpMethod } from "./api_client";

class Player {
	teamId!: number;
	steamId!: number;
	heroName!: string;
	points!: number;
	isDisconnect!: boolean;
}

class GameInfo {
	players!: Player[];
	winnerTeamId!: number;
	matchId!: string;
	gameOption!: Object;
	version!: string;
	constructor() {
		print("[Game] constructor in TS");
		this.players = [];
	}
}

export class Game {

	private static VERSION = "v1.46";
	constructor() {
	}

	public SendEndGameInfo(endData: any) {
		const gameInfo = new GameInfo();
		gameInfo.winnerTeamId = endData.winnerTeamId;
		gameInfo.matchId = GameRules.Script_GetMatchID().toString();
		gameInfo.version = Game.VERSION;
		gameInfo.gameOption = endData.gameOption;

		for (let i = 0; i < PlayerResource.GetPlayerCount(); i++) {
			if (PlayerResource.IsValidPlayerID(i)) {
				const player = new Player();
				player.teamId = PlayerResource.GetTeam(i);
				player.steamId = PlayerResource.GetSteamAccountID(i);
				player.heroName = PlayerResource.GetSelectedHeroName(i);
				player.points = endData.players[i]?.points;
				player.isDisconnect = endData.players[i]?.isDisconnect;
				gameInfo.players.push(player);
			}
		}
		const apiParameter = {
			method: HttpMethod.POST,
			path: ApiClient.POST_GAME_URL,
			body: gameInfo,
			successFunc: (data: string) => {
				print(`[Game] end game callback data ${data}`);
			}
		};

		ApiClient.sendWithRetry(apiParameter);
	}

}
