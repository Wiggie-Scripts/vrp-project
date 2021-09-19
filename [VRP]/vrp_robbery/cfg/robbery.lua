cfg = {}

cfg.blips = false -- enable blips

cfg.seconds = 900 -- seconds to rob

cfg.cooldown = 3600 -- time between robbaries

cfg.cops = 4 -- minimum cops online
cfg.permission = "police.robbery" -- permission given to cops

cfg.banks = { -- list of banks
	["fleeca"] = { 
	  position = {['x']=0.04908752441,['y']=0.9448242188,['z']=0.36802482605}, 
	  nameofbank = "Fleeca Bank (Centrum)",
	  reward = 30000 + math.random(200000,400000),
		lastrobbed = 0
	},
	["fleeca2"] = { 
	  position = {['x'] = 0.6674804688,['y']=0.45776367188,['z']=0.697026252747}, 
	  nameofbank = "Fleeca Bank (Motorvej)", 
	  reward = 15000 + math.random(200000,400000),
		lastrobbed = 0
	},
	["fleeca3"] = {
      position = {['x'] = 0.99548,['y']=-0.12524,['z']=0.79077},
      nameofbank = "Fleeca Bank (Vinewood Hills)",  
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
    ["fleeca4"] = {
      position = {['x'] = 0.452575683594,['y']=0.8204879760742,['z']=0.0463104248047},
      nameofbank = "Fleeca Bank (Burton)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
    ["fleeca5"] = {
      position = {['x'] = 0.967376708984,['y']=0.033660888672,['z']=0.1745223999023},
      nameofbank = "Fleeca Bank (Alta)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
	["fleeca6"] = {
      position = {['x'] = 0.86865234375,['y']=0.91357421875,['z']=0.097785949707},
      nameofbank = "Fleeca Bank (Desert)",
      reward = 17500 + math.random(200000,400000),
      lastrobbed = 0
	},
	["blainecounty"] = { 
	  position = {['x'] = 0.06505584717,['y']=0.8012695313,['z']=0.62670135498}, 
	  nameofbank = "Blaine County Savings (Paleto Bay)", 
	  reward = 17500 + math.random(200000,400000),
	  lastrobbed = 0
	},
	["pacific"] = { 
	  position = {['x']=0.15411376953,['y']=0.57843017578,['z']=0.68337249756}, 
	  nameofbank = "Nationalbanken", 
	  reward = 100000 + math.random(500000,1500000),
	  lastrobbed = 0
	}
}