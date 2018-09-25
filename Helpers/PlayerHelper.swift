class PlayerHelper {
    
    func GetFeaturedPlayers() -> [Player] {
        var playerFilter = PlayerFilter()
        playerFilter.isFeatured = true
        return Array(GetPlayers(filter: playerFilter).prefix(2))
    }
    
    static func MapPurchasedPlayersToPlayers(purchasedPlayers: [PurchasedPlayer], players: [Player]) -> [Player] {
        var returnPlayers = [Player]()
        for var player in players {
            if let purchasedPlayer = purchasedPlayers.first(where: { $0.playerId == player.id}) {
                player.price = purchasedPlayer.playerPrice
                returnPlayers.append(player)
            }
        }
        return returnPlayers
    }
    
    func GetPlayers(filter: PlayerFilter?) -> [Player] {
        
        var players = GetAllPlayers()
        
        if filter != nil {
            
            if filter?.isFeatured != nil {
                players = players.filter { $0.isFeatured == filter?.isFeatured }
            }
            
            if filter?.club != nil {
                players = players.filter { $0.club == filter?.club }
            }
            
            if filter?.position != nil {
                players = players.filter { $0.position == filter?.position }
            }
            
            if filter?.priceLower != nil {
                players = players.filter { $0.price >= (filter?.priceLower!)! }
            }
            
            if filter?.priceUpper != nil {
                players = players.filter { $0.price <= (filter?.priceUpper!)! }
            }
        }
        return players
    }
    
    private func GetAllPlayers() -> [Player] {
        var player1: Player = Player()
        var player2: Player = Player()
        var player3: Player = Player()
        var player4: Player = Player()
        var player5: Player = Player()
        var player6: Player = Player()
        var player7: Player = Player()
        var player8: Player = Player()
        var player9: Player = Player()
        var player10: Player = Player()
        
        player1.id = 1
        player1.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Collingwood/Player%20Profiles/2017%20-%20Profiles/PENDLEBURY%20Scott.png"
        player1.club = ClubEnum.collingwood
        player1.firstName = "Scott"
        player1.lastName = "Pendlebury"
        player1.isFeatured = false
        player1.position = "Midfield"
        player1.price = 1400000
        player1.age = 35
        player1.weight = 84
        player1.height = 194
        player1.careerGoals = 475
        player1.lastPriceDate = "11/02/2017"
        player1.debut = "2010"
        player1.bio = "<p>Perhaps the prototype of the modern midfielder. Sleek, skillful and slippery, Pendlebury is one of the bona fide stars of the competition. His graceful style of play belies his hardness, for he is a fierce tackler and renowned for his abilities at the bottom of the packs. Pendlebury often appears to be playing at a different tempo to the other players on the field, such is his calmness that stems from playing as a point guard in basketball teams in his youth.</p><p>Pendlebury boasts an imposing trophy cabinet, with his crowning glory a 2010 Norm Smith Medal. He is the captain of the club, a five-time Copeland Trophy winner and a five-time All-Australian. Yet as he approaches his thirties, Pendlebury is still arguably in the peak of his career.</p>"
        
        player2.id = 2
        player2.imageURL = "http://csports.com.au/wp-content/uploads/2016/10/WELLINGHAM-Sharrod-1.png"
        player2.club = ClubEnum.eagles
        player2.firstName = "Sharrod"
        player2.lastName = "Wellingham"
        player2.isFeatured = false
        player2.position = "Follower"
        player2.price = 1150000
        player2.age = 31
        player2.weight = 79
        player2.height = 178
        player2.careerGoals = 298
        player2.lastPriceDate = "10/22/2017"
        player2.debut = "2008"
        player2.bio = "After shifting to the half back line in 2015, Wellingham continued his progression as a running defender in 2016. Missed the start of the year through injury, but is ability to read the play and rebound with pace, dare and skill proved a weapon for the Eagles throughout the year. "
        
        player3.id = 3
        player3.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/SydneySwans/Player%20Profiles/2017%20Profiles/17LanceFranklin_L.png"
        player3.club = ClubEnum.sydney
        player3.firstName = "Lance"
        player3.lastName = "Franklin"
        player3.isFeatured = false
        player3.position = "Half-Forward"
        player3.price = 1900000
        player3.age = 30
        player3.weight = 91
        player3.height = 192
        player3.careerGoals = 987
        player3.lastPriceDate = "11/22/2017"
        player3.debut = "2007"
        player3.bio = "<p>The star forward burst back into the AFL last year after the personal issues that forced him to miss the 2015 final series. Franklin was at his athletic best and more importantly looked like he was thoroughly enjoying his footy again.</p><p>The three-time Coleman Medal winner kicked 81 goals and played every game for the first time since 2008. Added a sixth All-Australian selection his resume and needs just 12 this year to reach 800 career goals and move into the League’s top-10 goal kickers of all time.</p>"
        
        player4.id = 4
        player4.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Richmond/Player%20Profiles/2017%20-%20Profiles/MARTIN%20Dustin.png"
        player4.club = ClubEnum.richmond
        player4.firstName = "Dustin"
        player4.lastName = "Martin"
        player4.isFeatured = false
        player4.position = "Midfield"
        player4.price = 2040000
        player4.age = 26
        player4.weight = 88
        player4.height = 187
        player4.careerGoals = 645
        player4.lastPriceDate = "12/01/2017"
        player4.debut = "2011"
        player4.bio = "<p>One of the game’s biggest stars, Martin won his first Jack Dyer Medal in a career-best season when he finished third in the Brownlow Medal.</p><p>The explosive midfielder focused on the contested side of his game and became a permanent inside midfielder who competed with the best stoppage players in the game.</p><p>His disposals, clearances and contested possessions all rocketed to career-high levels last season and the Tigers still see more improvement in him.</p>"
        
        player5.id = 5
        player5.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Carlton/Player%20Profiles/2017%20-%20Profiles/MURPHY%20Marc.png"
        player5.club = ClubEnum.carlton
        player5.firstName = "Marc"
        player5.lastName = "Murphy"
        player5.isFeatured = false
        player5.position = "Midfield"
        player5.price = 2040000
        player5.age = 26
        player5.weight = 88
        player5.height = 187
        player5.careerGoals = 287
        player5.lastPriceDate = "09/02/2017"
        player5.debut = "2010"
        player5.bio = "The skipper was starting to produce his best last season when he severely injured his ankle against Geelong in Round 10. Despite a valiant effort to return late in the year, he decided to concentrate on having a a full pre-season for 2017. Played a crucial role in the Blues' first win of the season against Fremantle in Round 5. In his fifth season as captain, his experience and guidance will be vital with so many young players around him. Contracted until the end of next season."
        
        player6.id = 6
        player6.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Richmond/Player%20Profiles/2017%20-%20Profiles/RIOLI%20Daniel.png"
        player6.club = ClubEnum.richmond
        player6.firstName = "Daniel"
        player6.lastName = "Rioli"
        player6.isFeatured = true
        player6.position = "Forward"
        player6.price = 1230000
        player6.age = 20
        player6.weight = 75
        player6.height = 179
        player6.careerGoals = 177
        player6.lastPriceDate = "11/25/2017"
        player6.debut = "2015"
        player6.bio = "<p>Rioli is from football royalty but is making a name for himself as a polished small forward capable of exhilarating bursts up the ground.</p><p>He played 18 games in his debut season and was named Richmond’s best first-year player.</p><p>Rioli grew up in the Northern Territory, but moved to Victoria five years ago before being drafted, impressing recruiters with his elite mix of endurance and speed.</p><p>Is the cousin of Hawthorn star and Norm Smith medallist Cyril Rioli</p>"
        
        player7.id = 7
        player7.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Essendon/Player%20Profiles/2017%20-%20Profiles/ZAHARAKIS%20David.png"
        player7.club = ClubEnum.essendon
        player7.firstName = "David"
        player7.lastName = "Zaharakis"
        player7.isFeatured = false
        player7.position = "Half-Back"
        player7.price = 1583000
        player7.age = 27
        player7.weight = 75
        player7.height = 180
        player7.careerGoals = 78
        player7.lastPriceDate = "11/30/2017"
        player7.debut = "2008"
        player7.bio = "An Essendon supporter as he was growing up, David Zaharakis burst on to the AFL scene with a match winning goal against Collingwood on Anzac Day in 2009.</p><p>He is a highly skilled midfielder with a strong aerobic capacity.</p><p>Zaharakis won the Crichton Medal in 2011 and produced some of the best form of his career in the first half 2016. A blistering opening seven weeks of the season saw the 26-year-old average more than 31 possessions per game."
    
        player8.id = 8
        player8.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Essendon/Player%20Profiles/2017%20-%20Profiles/MCDONALD%20TIPUNGWUTI%20Anthony.png"
        player8.club = ClubEnum.essendon
        player8.firstName = "Anthony"
        player8.lastName = "McDonald Tipungwuti"
        player8.isFeatured = false
        player8.position = "Crumber"
        player8.price = 1244000
        player8.age = 24
        player8.weight = 76
        player8.height = 171
        player8.careerGoals = 23
        player8.lastPriceDate = "11/25/2017"
        player8.debut = "2013"
        player8.bio = "<p>McDonald-Tipungwuti was born and raised on the Tiwi Islands, off the coast of Darwin, into an Indigenous Australian family. He played his junior football for the Tiwi Bombers in the Northern Territory Football League before moving to Victoria at the age of 17 to better his chances of an AFL career.</p><p>He was adopted by Jane McDonald in Gippsland and took on her name as recognition of her contribution to his journey. He spent six years playing for the Gippsland Power in the TAC Cup and Essendon's reserves team in the VFL before realising his dream when he was rookie listed by Essendon at the end of 2015.</p>"
        
        player9.id = 9
        player9.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/SydneySwans/Player%20Profiles/2017%20Profiles/17IsaacHeeney_L.png"
        player9.club = ClubEnum.sydney
        player9.firstName = "Isaac"
        player9.lastName = "Heeney"
        player9.isFeatured = true
        player9.position = "Forward"
        player9.price = 1120000
        player9.age = 21
        player9.weight = 85
        player9.height = 185
        player9.careerGoals = 154
        player9.lastPriceDate = "10/04/2017"
        player9.debut = "2014"
        player9.bio = "<p>Heeney had a solid start to the year but it was the second half of the season, following a mid-year refresher in the NEAFL, where the young gun really put his best football together. He kicked 28 goals from 24 games, and while he was dangerous as a forward, his move to the wing during the finals was a masterstroke from coach John Longmire.</p><p>He was a class above in the two finals against Adelaide and Geelong, gathering a total of 60-plus disposals. A permanent move to the midfield may be on the cards given his strong showing and in the wake of Tom Mitchell’s departure in the off-season. He’s a strong overhead mark and classy with the football in hand so could prove an asset in the middle.</p>"
     
        player10.id = 10
        player10.imageURL = "http://s.afl.com.au/staticfile/AFL%20Tenant/Hawthorn/Player%20Profiles/2016%20-%20Profiles/170214-BURTON.png"
        player10.club = ClubEnum.hawthorn
        player10.firstName = "Ryan"
        player10.lastName = "Burton"
        player10.isFeatured = true
        player10.position = "Ruck"
        player10.price = 1230000
        player10.age = 20
        player10.weight = 90
        player10.height = 191
        player10.careerGoals = 68
        player10.debut = "2015"
        player10.lastPriceDate = "09/30/2017"
        player10.bio = "Already shaping as one of the steals of the 2015 NAB AFL Draft, Burton played four games late last season – including a final – after showing promise at Box Hill. Burton has great poise, is a sound mark and an excellent kick and, in his brief taste of AFL football, looked comfortable both deep in defence and up forward. Thought was given to not bringing him back at all last year after he had surgery to remove a plate from his leg – a legacy of a shocking injury late in 2014 – but his rehab went so well the club could not hold him back."
        
        var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10]
        let clubMapper = ClubMapper()
        
        for var index in players.indices {
            players[index].clubData = clubMapper.MapClub(clubEnum: players[index].club)
        }
        
        return players
    }
}
