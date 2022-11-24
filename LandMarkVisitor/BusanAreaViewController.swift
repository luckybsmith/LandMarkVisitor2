//
//  BusanAreaViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit

class BusanAreaCell : UITableViewCell {
    
    @IBOutlet weak var BusanAreaLabel: UILabel!
    
    @IBOutlet weak var lbType: UILabel!
}
class BusanAreaViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var indi: UIActivityIndicatorView!
    
    struct Place {
        var title: String
        var type : String
        var url: String
    }
    
    
    let Haeundae = [
        Place(title: "딥플로우", type: "카페",url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%94%A5%ED%94%8C%EB%A1%9C%EC%9A%B0&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98&tqi=h2cAswp0JXoss771q6NssssssTs-411641"),
        Place(title: "듀플릿해리단길", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%93%80%ED%94%8C%EB%A6%BF&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%94%A5%ED%94%8C%EB%A1%9C%EC%9A%B0&tqi=h2cAKsp0JXVssMuFR38ssssss5C-099432"),
        Place(title: "마비스해리단길", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%A7%88%EB%B9%84%EC%8A%A4%ED%95%B4%EB%A6%AC%EB%8B%A8%EA%B8%B8&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%93%80%ED%94%8C%EB%A6%BF&tqi=h2cAFsp0Jy0ssOhnMm8ssssssDN-315611"),
        Place(title: "히얼이즈커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%9E%88%EC%96%BC%EC%9D%B4%EC%A6%88%EC%BB%A4%ED%94%BC&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%A7%88%EB%B9%84%EC%8A%A4%ED%95%B4%EB%A6%AC%EB%8B%A8%EA%B8%B8&tqi=h2cAwlp0J14ssZHMKd8ssssstlh-065620"),
        Place(title: "로우앤스윗", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%A1%9C%EC%9A%B0%EC%95%A4%EC%8A%A4%EC%9C%97&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%9E%88%EC%96%BC%EC%9D%B4%EC%A6%88%EC%BB%A4%ED%94%BC&tqi=h2cAIwp0YiRssDDUZJRssssstCC-097666"),
        Place(title: "하브커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%95%98%EB%B8%8C%EC%BB%A4%ED%94%BC&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%A1%9C%EC%9A%B0%EC%95%A4%EC%8A%A4%EC%9C%97&tqi=h2cBuwp0Jy0ssOaXjvossssstB4-140995"),
        Place(title: "홈라운지 해리단길점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%99%88%EB%9D%BC%EC%9A%B4%EC%A7%80&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%99%88%EB%9D%BC%EC%9A%B4%EC%A7%80%EC%BB%A4%ED%94%BC&tqi=h2cBfwp0YihssAN18YNssssssAR-402776"),
        Place(title: "라이프커피앤티", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%9D%BC%EC%9D%B4%ED%94%84%EC%BB%A4%ED%94%BC%EC%95%A4%ED%8B%B0&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%99%88%EB%9D%BC%EC%9A%B4%EC%A7%80&tqi=h2cBglp0YiRssDOZs74ssssst98-252623"),
        Place(title: "타이드", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%83%80%EC%9D%B4%EB%93%9C&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%9D%BC%EC%9D%B4%ED%94%84%EC%BB%A4%ED%94%BC%EC%95%A4%ED%8B%B0&tqi=h2cBjdp0Jy0ssOR7tjhssssssLK-330689"),
        Place(title: "오션브리즈", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EC%98%A4%EC%85%98%EB%B8%8C%EB%A6%AC%EC%A6%88&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EC%95%A8%EB%A6%AC%EC%8A%A4&tqi=h2cBWlp0YiRssDDRZx4ssssstTR-393149"),
        Place(title: "금송덕미", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EA%B8%88%EC%86%A1%EB%8D%95%EB%AF%B8&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EC%98%A4%EC%85%98%EB%B8%8C%EB%A6%AC%EC%A6%88&tqi=h2cBzsp0J14ssZrgeICsssssthC-523987"),
        Place(title: "비비비당", type: "차", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%B9%84%EB%B9%84%EB%B9%84%EB%8B%B9&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EA%B8%88%EC%86%A1%EB%8D%95%EB%AF%B8&tqi=h2cB9lp0J14ssZ8fk0sssssstBZ-119331"),
        Place(title: "오디너리핏 부산", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EC%98%A4%EB%94%94%EB%84%88%EB%A6%AC%ED%95%8F&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EB%B9%84%EB%B9%84%EB%B9%84%EB%8B%B9&tqi=h2cz2wprvh8ssb%2BR7YVssssssU4-234660"),
        Place(title: "프라한", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%94%84%EB%9D%BC%ED%95%9C&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%EC%98%A4%EB%94%94%EB%84%88%EB%A6%AC%ED%95%8F&tqi=h2c0tlprvmsss6V86sZssssstuZ-026332"),
        Place(title: "상국이네", type: "분식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%83%81%EA%B5%AD%EC%9D%B4%EB%84%A4&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98+%ED%94%84%EB%9D%BC%ED%95%9C&tqi=h2c0MwprvTVssFD2aWCssssssiN-059588"),
        Place(title: "나가하마만게츠", type: "일본식라멘", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%82%98%EA%B0%80%ED%95%98%EB%A7%88%EB%A7%8C%EA%B2%8C%EC%B8%A0&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%83%81%EA%B5%AD%EC%9D%B4%EB%84%A4&tqi=h2c0iwprvxZssiN9OcCssssstns-250073"),
        Place(title: "류센소 본점", type: "일본식라멘", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%A5%98%EC%84%BC%EC%86%8C&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%82%98%EA%B0%80%ED%95%98%EB%A7%88%EB%A7%8C%EA%B2%8C%EC%B8%A0&tqi=h2c0CsprvxZssiln66dsssssssh-019674"),
        Place(title: "무겐", type: "퓨전음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%AC%B4%EA%B2%90&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%A5%98%EC%84%BC%EC%86%8C&tqi=h2c0rwprvxsssPDZnsZssssssEK-327822"),
        Place(title: "타이가덴뿌라", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%ED%83%80%EC%9D%B4%EA%B0%80%EB%8D%B4%EB%BF%8C%EB%9D%BC&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%ED%83%80%EC%9D%B4%EA%B0%80%E3%85%94%E3%84%B7%E3%84%B4%EB%BF%8C%EB%9D%BC&tqi=h2c0%2BlprvxsssPYBt8Cssssss0w-375383"),
        Place(title: "호랑이젤라떡", type: "아이스크림", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%ED%98%B8%EB%9E%91%EC%9D%B4%EC%A0%A4%EB%9D%BC%EB%96%A1&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%8C%80%EB%A6%BC%EB%A7%A8%EC%85%98&tqi=h2c1gdprvTVssFJom28ssssssOd-455184"),
        Place(title: "카페노티드", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%ED%98%B8%EB%9E%91%EC%9D%B4%EC%A0%A4%EB%9D%BC%EB%96%A1&tqi=h2c1BwprvTVssFYhYMdssssssBV-378297"),
        Place(title: "부산바다샌드", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%B6%80%EC%82%B0%EB%B0%94%EB%8B%A4%EC%83%8C%EB%93%9C&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C&tqi=h2c1psprvTVssFryQ6hssssssMV-270042"),
        Place(title: "라이옥", type: "베트남음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EC%9A%B4%EB%8C%80+%EC%A4%91%EB%8F%99+%EB%9D%BC%EC%9D%B4%EC%98%A5&oquery=%ED%95%B4%EC%9A%B4%EB%8C%80+%EB%9D%BC%EC%9D%B4%EC%98%A5&tqi=h2c1YlprvN8ssvBAeI4ssssss8N-358481")
        
        
        
    ].sorted { $0.title < $1.title }
    
    let Gwanganri = [
        Place(title: "톤쇼우 광안점", type: "돈가스", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%86%A4%EC%87%BC%EC%9A%B0+%EB%8F%88%EA%B0%80%EC%8A%A4&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%86%A4%EC%87%BC%EC%9A%B0&tqi=h2c1HwprvOsssKFWJZwssssss7Z-073911"),
        Place(title: "부산댁", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B6%80%EC%82%B0%EB%8C%81&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%86%A4%EC%87%BC%EC%9A%B0+%EB%8F%88%EA%B0%80%EC%8A%A4&tqi=h2c1JwprvOsssKJgYbGssssst3V-457597"),
        Place(title: "다이도코로", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8B%A4%EC%9D%B4%EB%8F%84%EC%BD%94%EB%A1%9C&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B6%80%EC%82%B0%EB%8C%81&tqi=h2c2uwprvh8sscgAbqKssssssCd-180881"),
        Place(title: "마이페이보릿쿠키", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EB%B3%B4%EB%A6%BF%EC%BF%A0%ED%82%A4&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8B%A4%EC%9D%B4%EB%8F%84%EC%BD%94%EB%A1%9C&tqi=h2c24dprvxZssihiaVKssssss2s-338136"),
        Place(title: "요이쿠마", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%9A%94%EC%9D%B4%EC%BF%A0%EB%A7%88&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A7%88%EC%9D%B4%ED%8E%98%EC%9D%B4%EB%B3%B4%EB%A6%BF%EC%BF%A0%ED%82%A4&tqi=h2c3elprvxZssihUaoGsssssszV-191437"),
        Place(title: "다리집", type: "종합분식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8B%A4%EB%A6%AC%EC%A7%91&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%9A%94%EC%9D%B4%EC%BF%A0%EB%A7%88&tqi=h2c3Rwprvh8sscSTeSZssssstgs-116667"),
        Place(title: "할매재첩국", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%95%A0%EB%A7%A4%EC%9E%AC%EC%B2%A9%EA%B5%AD&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8B%A4%EB%A6%AC%EC%A7%91&tqi=h2c3UlprvhGssgNitp4sssssse4-041578"),
        Place(title: "소연옥", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%86%8C%EC%97%B0%EC%98%A5&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%95%A0%EB%A7%A4%EC%9E%AC%EC%B2%A9%EA%B5%AD&tqi=h2c3kdprvmZssgvZZ1CssssssPK-338432"),
        Place(title: "덴", type: "이자카야", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%9D%B4%EC%9E%90%EC%B9%B4%EC%95%BC+%EB%8D%B4&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8D%B4&tqi=h2c3AwprvmZssf%2BQUQ0ssssss4l-479685"),
        Place(title: "플렌터", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B8%8C%EB%9F%B0%EC%B9%98+%ED%94%8C%EB%A0%8C%ED%84%B0&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%94%8C%EB%A0%8C%ED%84%B0&tqi=h2c3odprvh8ssbG1g%2Fdssssss0N-215322"),
        Place(title: "끄티집", type: "요리주점", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%81%84%ED%8B%B0%EC%A7%91&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B8%8C%EB%9F%B0%EC%B9%98+%ED%94%8C%EB%A0%8C%ED%84%B0&tqi=h2c3pwprvmsss6Ohmx8ssssssl4-032515"),
        Place(title: "료미", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A3%8C%EB%AF%B8&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%81%84%ED%8B%B0%EC%A7%91&tqi=h2c3VlprvTVssFoinY8ssssssoC-456561"),
        Place(title: "모치플레지르", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%AA%A8%EC%B9%98%ED%94%8C%EB%A0%88%EC%A7%80%EB%A5%B4&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A3%8C%EB%AF%B8&tqi=h2c3wlprvxsssPp5mjwssssstQd-079586"),
        Place(title: "동경밥상", type: "덮밥", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8F%99%EA%B2%BD%EB%B0%A5%EC%83%81&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%AA%A8%EC%B9%98%ED%94%8C%EB%A0%88%EC%A7%80%EB%A5%B4&tqi=h2c30lprvTVssFOKH2wssssss4h-016049"),
        Place(title: "난파센", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%82%9C%ED%8C%8C%EC%84%BC&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%8F%99%EA%B2%BD%EB%B0%A5%EC%83%81&tqi=h2cGZdprvOsssKD7YnlssssstJo-116220"),
        Place(title: "슈발츠발트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%8A%88%EB%B0%9C%EC%B8%A0%EB%B0%9C%ED%8A%B8&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%82%9C%ED%8C%8C%EC%84%BC&tqi=h2cG4lprvh8sscKu7QossssstxC-222836"),
        Place(title: "로옹", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A1%9C%EC%98%B9&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%8A%88%EB%B0%9C%EC%B8%A0%EB%B0%9C%ED%8A%B8&tqi=h2cG7wprvN8ssv059URssssstX4-336093"),
        Place(title: "리틀오스", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A6%AC%ED%8B%80%EC%98%A4%EC%8A%A4&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%A1%9C%EC%98%B9&tqi=h2cGMdprvh8sscb%2F0ChssssstZh-333915"),
        Place(title: "베이스먼트", type: "바", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B2%A0%EC%9D%B4%EC%8A%A4%EB%A8%BC%ED%8A%B8&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%ED%91%9C%EB%A5%98+%EB%B0%94&tqi=h2cGkdprvxsssPwebsdssssstnG-350015"),
        Place(title: "유일한식탁", type: "돈가스", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%9C%A0%EC%9D%BC%ED%95%9C%EC%8B%9D%ED%83%81&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%9C%A0%EC%9D%BC%ED%95%9C%EC%8B%9D%ED%83%81.&tqi=h2cGAdprvh8ssckuzY0ssssst%2Fd-101138"),
        Place(title: "코류", type: "이자카야", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%BD%94%EB%A5%98&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%BF%84%EB%A5%98&tqi=h2cGDwprvN8ssvH0T3KssssstzN-054409"),
        Place(title: "부센동", type: "초밥", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%BD%94%EB%A5%98&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EC%BF%84%EB%A5%98&tqi=h2cGDwprvN8ssvH0T3KssssstzN-054409")
        
    ].sorted { $0.title < $1.title }
    
    
    let Kijang = [
        Place(title: "아틀리에 은유재", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%95%84%ED%8B%80%EB%A6%AC%EC%97%90+%EC%9D%80%EC%9C%A0%EC%9E%AC&oquery=%EA%B8%B0%EC%9E%A5+%EB%A1%AF%EB%8D%B0%EC%9B%94%EB%93%9C&tqi=h2cHYdprvh8ssc4pJWsssssstUG-493922"),
        Place(title: "웨이브온 커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%9B%A8%EC%9D%B4%EB%B8%8C%EC%98%A8+%EC%BB%A4%ED%94%BC&oquery=%EA%B8%B0%EC%9E%A5+%EC%9B%A8%EC%9D%B4%EB%B8%8C%EC%98%A8&tqi=h2cH%2BsprvxZssieHEQGssssst%2FG-256765"),
        Place(title: "덕미", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%8D%95%EB%AF%B8&oquery=%EA%B8%B0%EC%9E%A5+%EC%9B%A8%EC%9D%B4%EB%B8%8C%EC%98%A8+%EC%BB%A4%ED%94%BC&tqi=h2cH%2FdprvTVsss4CWdNssssssYd-297166"),
        Place(title: "칠암사계", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%B9%A0%EC%95%94%EC%82%AC%EA%B3%84&oquery=%EA%B8%B0%EC%9E%A5+%EB%8D%95%EB%AF%B8&tqi=h2cIulprvmZssfGy9t8ssssst6V-014795"),
        Place(title: "피크스퀘어", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%ED%94%BC%ED%81%AC%EC%8A%A4%ED%80%98%EC%96%B4&oquery=%EA%B8%B0%EC%9E%A5+%EC%B9%A0%EC%95%94%EC%82%AC%EA%B3%84&tqi=h2cIasprvN8ssvoiZ4Zssssss7N-279574"),
        Place(title: "하녹", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%ED%95%98%EB%85%B9&oquery=%EA%B8%B0%EC%9E%A5+%ED%94%BC%ED%81%AC%EC%8A%A4%ED%80%98%EC%96%B4&tqi=h2cIcdprvN8ssv2hc7Cssssstlw-472612"),
        Place(title: "제이엠커피로스터스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%A0%9C%EC%9D%B4%EC%97%A0%EC%BB%A4%ED%94%BC%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4+%EB%B6%80%EC%82%B0+%EB%B3%B8%EC%A0%90&oquery=%EA%B8%B0%EC%9E%A5+%EC%A0%9C%EC%9D%B4%EC%97%A0%EC%BB%A4%ED%94%BC%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4&tqi=h2cI7dprvOsssKW0TLsssssss1d-432417"),
        Place(title: "두루미 베이커리 카페", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%91%90%EB%A3%A8%EB%AF%B8+%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%B9%B4%ED%8E%98&oquery=%EA%B8%B0%EC%9E%A5+%EC%A0%9C%EC%9D%B4%EC%97%A0%EC%BB%A4%ED%94%BC%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4+%EB%B6%80%EC%82%B0+%EB%B3%B8%EC%A0%90&tqi=h2cIKlprvTVssF2LnylssssstFw-484043"),
        Place(title: "시랑이랑", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%8B%9C%EB%9E%91%EC%9D%B4%EB%9E%91&oquery=%EA%B8%B0%EC%9E%A5+%EB%91%90%EB%A3%A8%EB%AF%B8+%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%B9%B4%ED%8E%98&tqi=h2cIndprvxZssiUPsyVssssssQo-353583"),
        Place(title: "웨스턴챔버", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%9B%A8%EC%8A%A4%ED%84%B4%EC%B1%94%EB%B2%84&oquery=%EA%B8%B0%EC%9E%A5+%EC%8B%9C%EB%9E%91%EC%9D%B4%EB%9E%91&tqi=h2cIedprvhGssg1Ah%2BwssssssdN-402367"),
        
        Place(title: "더가마", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%8D%94%EA%B0%80%EB%A7%88&oquery=%EA%B8%B0%EC%9E%A5+%EC%9B%A8%EC%8A%A4%ED%84%B4%EC%B1%94%EB%B2%84&tqi=h2cIgwprvxZssiDPkdKssssst8l-236341"),
        
        Place(title: "로와맨션", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%A1%9C%EC%99%80%EB%A7%A8%EC%85%98&oquery=%EA%B8%B0%EC%9E%A5+%EB%8D%94%EA%B0%80%EB%A7%88&tqi=h2cISwprvTVssFDduICssssssWh-467092"),
        Place(title: "메르데쿠르", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%A9%94%EB%A5%B4%EB%8D%B0%EC%BF%A0%EB%A5%B4&oquery=%EA%B8%B0%EC%9E%A5+%EB%A1%9C%EC%99%80%EB%A7%A8%EC%85%98&tqi=h2cIhsprvxsssPomPH0ssssssmV-288024"),
        Place(title: "카페공지", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%B9%B4%ED%8E%98%EA%B3%B5%EC%A7%80&oquery=%EA%B8%B0%EC%9E%A5+%EB%A9%94%EB%A5%B4%EB%8D%B0%EC%BF%A0%EB%A5%B4&tqi=h2cIjsprvTVssF3qSJ4ssssstIR-298919"),
        Place(title: "수백당", type: "순대", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%88%98%EB%B0%B1%EB%8B%B9+%EA%B8%B0%EC%9E%A5%EC%A0%90&oquery=%EA%B8%B0%EC%9E%A5+%EC%88%98%EB%B0%B1%EB%8B%B9&tqi=h2cIPdprvxZssio0r7sssssstKC-217975"),
        Place(title: "고향연화", type: "돈가스", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EA%B3%A0%ED%96%A5%EC%97%B0%ED%99%94&oquery=%EA%B8%B0%EC%9E%A5+%EC%88%98%EB%B0%B1%EB%8B%B9+%EA%B8%B0%EC%9E%A5%EC%A0%90&tqi=h2cIQdprvh8sscLTflVssssstiR-362842"),
        Place(title: "롯데월드 어드벤처 부산", type: "테마파크", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%A1%AF%EB%8D%B0%EC%9B%94%EB%93%9C&oquery=%EA%B4%91%EC%95%88%EB%A6%AC+%EB%B6%80%EC%84%BC%EB%8F%99&tqi=h2cGrlprvmsss6jaeD0ssssssRG-035156"),
        Place(title: "얼크니손칼국수", type: "칼국수", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EC%96%BC%ED%81%AC%EB%8B%88%EC%86%90%EC%B9%BC%EA%B5%AD%EC%88%98&oquery=%EA%B8%B0%EC%9E%A5+%EA%B3%A0%ED%96%A5%EC%97%B0%ED%99%94&tqi=h2cImwprvhGssgqYFMKssssss%2Bw-382359"),
        Place(title: "해진횟집", type: "생선회", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%ED%95%B4%EC%A7%84%ED%9A%9F%EC%A7%91&oquery=%EA%B8%B0%EC%9E%A5+%EC%96%BC%ED%81%AC%EB%8B%88%EC%86%90%EC%B9%BC%EA%B5%AD%EC%88%98&tqi=h2cIDsprvh8sscObJoossssssgh-341977"),
        Place(title: "탐복", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%ED%83%90%EB%B3%B5&oquery=%EA%B8%B0%EC%9E%A5+%ED%95%B4%EC%A7%84%ED%9A%9F%EC%A7%91&tqi=h2cIpsprvN8ssvI5hjKssssstHG-409193"),
        Place(title: "로아누", type: "고기요리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%EB%A1%9C%EC%95%84%EB%88%84&oquery=%EA%B8%B0%EC%9E%A5+%ED%83%90%EB%B3%B5&tqi=h2cIVdprvTVssFDatIlssssstwG-407203"),
        Place(title: "풍원장시골밥상집", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EA%B8%B0%EC%9E%A5+%ED%92%8D%EC%9B%90%EC%9E%A5%EC%8B%9C%EA%B3%A8%EB%B0%A5%EC%83%81%EC%A7%91&oquery=%EA%B8%B0%EC%9E%A5+%EB%A1%9C%EC%95%84%EB%88%84&tqi=h2cIYdprvOsssKGomQwssssssD0-229844")
        
    ].sorted { $0.title < $1.title }
    
    let Seomyeon = [
        Place(title: "로우앤스윗", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EB%A1%9C%EC%9A%B0%EC%95%A4%EC%8A%A4%EC%9C%97&oquery=%EA%B8%B0%EC%9E%A5+%ED%92%8D%EC%9B%90%EC%9E%A5%EC%8B%9C%EA%B3%A8%EB%B0%A5%EC%83%81%EC%A7%91&tqi=h2cIzsprvmsss6pMjK0ssssst94-077342"),
        Place(title: "얼룩", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EC%96%BC%EB%A3%A9&oquery=%EC%84%9C%EB%A9%B4+%EB%A1%9C%EC%9A%B0%EC%95%A4%EC%8A%A4%EC%9C%97&tqi=h2c%2Fowp0YihssAWLAzwssssstZR-233744"),
        Place(title: "블랙업커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EB%B8%94%EB%9E%99%EC%97%85%EC%BB%A4%ED%94%BC&oquery=%EC%84%9C%EB%A9%B4+%EC%96%BC%EB%A3%A9&tqi=h2c%2FVlp0JywsslnJfKZssssss0C-497872"),
        Place(title: "33게이트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+33%EA%B2%8C%EC%9D%B4%ED%8A%B8&oquery=%EC%84%9C%EB%A9%B4+%EB%B8%94%EB%9E%99%EC%97%85%EC%BB%A4%ED%94%BC&tqi=h2c%2Fxsp0JywssQ%2FFESGssssst94-316187"),
        Place(title: "인터스페이스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EC%9D%B8%ED%84%B0%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4&oquery=%EC%84%9C%EB%A9%B4+33%EA%B2%8C%EC%9D%B4%ED%8A%B8&tqi=h2c%2F0wp0JXoss7CT%2FoGssssssCC-282593"),
        Place(title: "레레", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EB%A0%88%EB%A0%88&oquery=%EC%84%9C%EB%A9%B4+%EC%9D%B8%ED%84%B0%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4&tqi=h2c%2FIdp0JXoss7MGIAossssstiV-164741"),
        Place(title: "녹아들다 녹카페", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EB%85%B9%EC%95%84%EB%93%A4%EB%8B%A4&oquery=%EC%84%9C%EB%A9%B4+%EB%A0%88%EB%A0%88&tqi=h24sudp0YihssARtfpwssssssA8-428437"),
        Place(title: "페이퍼투콘크리트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%ED%8E%98%EC%9D%B4%ED%8D%BC%ED%88%AC%EC%BD%98%ED%81%AC%EB%A6%AC%ED%8A%B8&oquery=%EC%84%9C%EB%A9%B4+%EB%85%B9%EC%95%84%EB%93%A4%EB%8B%A4&tqi=h24sasp0YihssAMhhGwssssstD4-246877"),
        Place(title: "연화림", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EB%A9%B4+%EC%97%B0%ED%99%94%EB%A6%BC&oquery=%EC%84%9C%EB%A9%B4+%ED%8E%98%EC%9D%B4%ED%8D%BC%ED%88%AC%EC%BD%98%ED%81%AC%EB%A6%AC%ED%8A%B8&tqi=h24scdp0JywsslnRnhVssssssSN-244141"),
        Place(title: "롱드라이버스", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EB%A1%B1%EB%93%9C%EB%9D%BC%EC%9D%B4%EB%B2%84%EC%8A%A4&oquery=%EC%A0%84%ED%8F%AC+%EB%B0%94%EC%9D%B4%EC%82%AC%EB%B2%8C+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C&tqi=h24sMdp0JXoss7hfaoossssstts-088723"),
        Place(title: "스트럿커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%8A%A4%ED%8A%B8%EB%9F%BF%EC%BB%A4%ED%94%BC&oquery=%EC%A0%84%ED%8F%AC+%EB%A1%B1%EB%93%9C%EB%9D%BC%EC%9D%B4%EB%B2%84%EC%8A%A4&tqi=h24sdwp0J14ssasXfswssssss1h-191012"),
        Place(title: "연의양과", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%97%B0%EC%9D%98%EC%96%91%EA%B3%BC&oquery=%EC%A0%84%ED%8F%AC+%EC%8A%A4%ED%8A%B8%EB%9F%BF%EC%BB%A4%ED%94%BC&tqi=h24sRdp0Jy0ssOFFJthsssssseh-307624"),
        Place(title: "데이오프데이", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EB%8D%B0%EC%9D%B4%EC%98%A4%ED%94%84%EB%8D%B0%EC%9D%B4&oquery=%EC%A0%84%ED%8F%AC+%EC%97%B0%EC%9D%98%EC%96%91%EA%B3%BC&tqi=h24sTsp0J1ZssBN146GssssstPs-352902"),
        Place(title: "꾸오이아노", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EA%BE%B8%EC%98%A4%EC%9D%B4%EC%95%84%EB%85%B8&oquery=%EC%A0%84%ED%8F%AC+%EB%8D%B0%EC%9D%B4%EC%98%A4%ED%94%84%EB%8D%B0%EC%9D%B4&tqi=h24shlp0Jy0ssOjyjP0ssssstp0-480767"),
        Place(title: "구프", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EA%B5%AC%ED%94%84&oquery=%EC%A0%84%ED%8F%AC+%EA%BE%B8%EC%98%A4%EC%9D%B4%EC%95%84%EB%85%B8&tqi=h24sjlp0J1ZssBtfFUNssssst9R-514214"),
        Place(title: "노캡", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EB%85%B8%EC%BA%A1&oquery=%EC%A0%84%ED%8F%AC+%EA%B5%AC%ED%94%84&tqi=h24sNsp0Jy0ssOm0kC4ssssstbR-243503"),
        Place(title: "칸다소바", type: "일본식라멘", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%B9%B8%EB%8B%A4%EC%86%8C%EB%B0%94&oquery=%EC%A0%84%ED%8F%AC+%EB%85%B8%EC%BA%A1&tqi=h24sPdp0YidssQSiX%2BZssssssDd-488919"),
        Place(title: "우리마키", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%9A%B0%EB%A6%AC%EB%A7%88%ED%82%A4&oquery=%EC%A0%84%ED%8F%AC+%EC%B9%B8%EB%8B%A4%EC%86%8C%EB%B0%94&tqi=h24sllp0JXVssMdpMWGssssst90-120385"),
        Place(title: "야키야", type: "이자카야", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%95%BC%ED%82%A4%EC%95%BC&oquery=%EC%A0%84%ED%8F%AC+%EC%9A%B0%EB%A6%AC%EB%A7%88%ED%82%A4&tqi=h24sClp0Jy0ssOP86JZssssssoh-209202"),
        Place(title: "수림식당", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%88%98%EB%A6%BC%EC%8B%9D%EB%8B%B9&oquery=%EC%A0%84%ED%8F%AC+%EC%95%BC%ED%82%A4%EC%95%BC&tqi=h24sFdp0JXoss7Ssh4GssssssIK-174996"),
        Place(title: "양산도 본점", type: "장어요리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%84%ED%8F%AC+%EC%96%91%EC%82%B0%EB%8F%84+%EB%B3%B8%EC%A0%90&oquery=%EC%A0%84%ED%8F%AC+%EC%88%98%EB%A6%BC%EC%8B%9D%EB%8B%B9&tqi=h24srlp0YidssPJOPTsssssssgw-492295")
        
    ].sorted { $0.title < $1.title }
    
    let sections = ["해운대","광안리","기장","전포/서면"]
    override func viewDidLoad() {
        super.viewDidLoad()
        indi.isHidden = true
        self.view.bringSubviewToFront(indi)

        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    //섹션출력
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    //row갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return Haeundae.count
        }else if section == 1{
            return Gwanganri.count
        }else if section == 2{
            return Kijang.count
        }else if section == 3{
            return Seomyeon.count
        }
        return 30
    }
    //섹션 내 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusanAreaCell_ID", for: indexPath) as! BusanAreaCell
        
        if indexPath.section == 0{
            cell.BusanAreaLabel.text = Haeundae[indexPath.row].title
            cell.lbType.text = Haeundae[indexPath.row].type
        }else if indexPath.section == 1{
            cell.BusanAreaLabel.text = Gwanganri[indexPath.row].title
            cell.lbType.text = Gwanganri[indexPath.row].type
            
        }else if indexPath.section == 2{
            cell.BusanAreaLabel.text = Kijang[indexPath.row].title
            cell.lbType.text = Kijang[indexPath.row].type
            
        }else if indexPath.section == 3{
            cell.BusanAreaLabel.text = Seomyeon[indexPath.row].title
            cell.lbType.text = Seomyeon[indexPath.row].type
            
        }
        return cell
    }
    //테이블뷰 눌렀을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indi.isHidden = false
        indi.startAnimating()
        let showVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        showVC.modalPresentationStyle = .automatic
        showVC.urlAddress = Haeundae[indexPath.row].url
        showVC.cityType = "Busan"
        
        if indexPath.section == 0 {
            showVC.urlAddress = Haeundae[indexPath.row].url
            showVC.areatype = "해운대"
        } else if indexPath.section == 1 {
            showVC.urlAddress = Gwanganri[indexPath.row].url
            showVC.areatype = "광안리"
        } else if indexPath.section == 2 {
            showVC.urlAddress = Kijang[indexPath.row].url
            showVC.areatype = "기장"
        }else if indexPath.section == 3 {
            showVC.urlAddress = Seomyeon[indexPath.row].url
            showVC.areatype = "전포/서면"
        }
        self.present(showVC,animated: true){
            self.indi.stopAnimating()
        }
        
    }
    
}
