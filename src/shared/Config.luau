--!strict

-- Shared settings used by both the server and the client.
export type Config = {
	GameName: string,
	StartingCoins: number,
}

local Config: Config = {
	GameName = "rblxStart",
	StartingCoins = 0,
}

return Config
