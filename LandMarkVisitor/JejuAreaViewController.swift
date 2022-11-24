//
//  JejuDetailViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/19.
//

import UIKit
class JejuAreaCell : UITableViewCell{
    
    @IBOutlet weak var JejuAreaLabel: UILabel!
    
    @IBOutlet weak var lbType: UILabel!
}

class JejuAreaViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{
    struct Place {
        var title: String
        var type : String
        var url: String
    }
    
    @IBOutlet weak var indi: UIActivityIndicatorView!
    
    let Jejucity = [
    Place(title: "미스틱3도", type: "카페", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%AF%B8%EC%8A%A4%ED%8B%B13%EB%8F%84"),
    Place(title: "물", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%97%B0%EB%8F%99+%EC%B9%B4%ED%8E%98+%EB%AC%BC&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%B9%B4%ED%8E%98+%EB%AC%BC&tqi=h24KCwprvN8ssn0XuY8ssssssBC-463101"),
    Place(title: "고요새", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EA%B3%A0%EC%9A%94%EC%83%88&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%97%B0%EB%8F%99+%EC%B9%B4%ED%8E%98+%EB%AC%BC&tqi=h24KElprvh8ssgdcTusssssstdN-118741"),
    Place(title: "커피템플", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%BB%A4%ED%94%BC%ED%83%AC%ED%94%8C&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EA%B3%A0%EC%9A%94%EC%83%88&tqi=h24KxwprvN8ssdKSfkGssssssBZ-456810"),
    Place(title: "빵귿", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%B5%EA%B7%BF&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%B5%EA%B8%8B&tqi=h24LuwprvxZssDRHlCKssssstHl-513203"),
    Place(title: "이에르바", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9D%B4%EC%97%90%EB%A5%B4%EB%B0%94&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EA%B7%B8%EB%9F%AC%EB%AF%80%EB%A1%9C&tqi=h24LLdprvmsssTwtnw0ssssssBw-482612"),
    Place(title: "아라파파", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%95%84%EB%9D%BC%ED%8C%8C%ED%8C%8C&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9D%B4%EC%97%90%EB%A5%B4%EB%B0%94&tqi=h24LfwprvmsssTC9QhKssssssDG-239783"),
    Place(title: "모모제이", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%AA%A8%EB%AA%A8%EC%A0%9C%EC%9D%B4&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9A%B0%EC%A7%84%ED%95%B4%EC%9E%A5%EA%B5%AD&tqi=h24M%2FsprvmsssTxfSB0ssssssJh-478989"),
    Place(title: "우진해장국", type: "향토음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9A%B0%EC%A7%84%ED%95%B4%EC%9E%A5%EA%B5%AD&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%88%99%EC%84%B1%EB%8F%84+%EB%85%B8%ED%98%95%EB%B3%B8%EA%B4%80&tqi=h24MJsprvhGssQwiaDRssssstll-389996"),
    Place(title: "숙성도", type: "돼지고기구이", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%88%99%EC%84%B1%EB%8F%84+%EB%85%B8%ED%98%95%EB%B3%B8%EA%B4%80&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%88%99%EC%84%B1%EB%8F%84&tqi=h24MHwprvOssshENeARssssstLC-331208"),
    Place(title: "자매국수", type: "국수", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9E%90%EB%A7%A4%EA%B5%AD%EC%88%98&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%98%AC%EB%9E%98%EA%B5%AD%EC%88%98&tqi=h24MzdprvmZssPXNnM4ssssst60-022009"),
    Place(title: "올래국수", type: "국수", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%98%AC%EB%9E%98%EA%B5%AD%EC%88%98&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%A0%9C%EC%A3%BC%EA%B9%80%EB%A7%8C%EB%B3%B5+%EB%B3%B8%EC%A0%90&tqi=h24MYdprvh8ssgvg94CssssstvN-496654"),
    Place(title: "제주김만복 본점", type: "분식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%A0%9C%EC%A3%BC%EA%B9%80%EB%A7%8C%EB%B3%B5+%EB%B3%B8%EC%A0%90&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%BD%EB%8B%A4%EB%B0%A9%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%A0%9C%EC%A3%BC%EC%82%AC%EC%88%98%EC%A0%90&tqi=h24MqdprvxZssDRHlEVssssstHl-304433"),
    Place(title: "빽다방 베이커리", type: "테이크아웃커피", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%BD%EB%8B%A4%EB%B0%A9%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%A0%9C%EC%A3%BC%EC%82%AC%EC%88%98%EC%A0%90&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%BD%EB%8B%A4%EB%B0%A9%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC&tqi=h24ModprvmsssTpx0bZssssstLs-183323"),
    Place(title: "카페진정성 본점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%B9%B4%ED%8E%98%EC%A7%84%EC%A0%95%EC%84%B1&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%A0%9C%EC%A3%BC+%ED%95%98%EB%A9%9C&tqi=h24MmwprvmZssPFJe3dssssssr8-011435"),
    Place(title: "제주 하멜", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%A0%9C%EC%A3%BC+%ED%95%98%EB%A9%9C&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%9A%8C%EC%B6%98+%EC%A0%9C%EC%A3%BC%EB%85%B8%ED%98%95%EC%A0%90&tqi=h24MjsprvN8ssdaDLAsssssstGN-212133"),
    Place(title: "회춘 제주노형점", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%9A%8C%EC%B6%98+%EC%A0%9C%EC%A3%BC%EB%85%B8%ED%98%95%EC%A0%90&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C%ED%9A%8C%EC%B6%98&tqi=h24MhlprvmZssPqUOflssssssYC-115661")
    ].sorted { $0.title < $1.title }
    
    let West = [
        Place(title: "우무", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%95%9C%EB%A6%BC%EC%9D%8D+%EC%B9%B4%ED%8E%98+%EC%9A%B0%EB%AC%B4&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%95%9C%EB%A6%BC%EC%9D%8D+%EC%9A%B0%EB%AC%B4&tqi=h24djdprvN8ssdsnGbRssssssGs-071796"),
        Place(title: "비마이게스트", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%B9%84%EB%A7%88%EC%9D%B4%EA%B2%8C%EC%8A%A4%ED%8A%B8&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%95%9C%EB%A6%BC%EC%9D%8D+%EC%B9%B4%ED%8E%98+%EC%9A%B0%EB%AC%B4&tqi=h24dklprvxsssu84P%2FGssssstDC-092703"),
        Place(title: "호텔샌드", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%98%B8%ED%85%94%EC%83%8C%EB%93%9C&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%98%B8%ED%85%94%EC%83%8C%E3%84%B7&tqi=h24dEdprvh8ssfXzzTsssssst%2BV-439332"),
        Place(title: "Anthracite Coffee 한림", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+Anthracite+Coffee+%ED%95%9C%EB%A6%BC&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%98%B8%ED%85%94%EC%83%8C%EB%93%9C&tqi=h24dFsprvmsssTCcjoossssstH8-404758"),
        Place(title: "오리지날로맨스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0%EB%A1%9C%EB%A7%A8%EC%8A%A4&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+Anthracite+Coffee+%ED%95%9C%EB%A6%BC&tqi=h24dplprvxZssD6AniKsssssswV-208889"),
        Place(title: "잔물결", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%9E%94%EB%AC%BC%EA%B2%B0&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%95%9C%EB%A6%BC%EC%9D%8D+%EC%B9%B4%ED%8E%98+%EC%9E%94%EB%AC%BC%EA%B2%B0&tqi=h24d3sprvh8ssfJfTGGssssssgR-431209"),
        Place(title: "카페이면", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EC%9D%B4%EB%A9%B4&oquery=%EC%A0%9C%EC%A3%BC+%EC%9E%94%EB%AC%BC%EA%B2%B0&tqi=h24dJsprvTVss7reZ3VssssssIh-476695"),
        Place(title: "씨리얼", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%B8%8C%EB%9F%B0%EC%B9%98+%EC%94%A8%EB%A6%AC%EC%96%BC&oquery=%EC%A0%9C%EC%A3%BC+%EC%94%A8%EB%A6%AC%EC%96%BC&tqi=h24essprvh8ssf90mzRssssstFl-507177"),
        Place(title: "울트라마린", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%9A%B8%ED%8A%B8%EB%9D%BC%EB%A7%88%EB%A6%B0&oquery=%EC%A0%9C%EC%A3%BC+%EB%B8%8C%EB%9F%B0%EC%B9%98+%EC%94%A8%EB%A6%AC%EC%96%BC&tqi=h24etlprvOssshq9ES0ssssstRh-187527"),
        Place(title: "클랭블루", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%81%B4%EB%9E%AD%EB%B8%94%EB%A3%A8&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%B9%B4%ED%8E%98+3%EC%9D%B8%EC%B9%AD%EA%B4%80%EC%B0%B0%EC%9E%90%EC%8B%9C%EC%A0%90+%EC%B9%B4%ED%8E%98&tqi=h24egdprvh8ssgv78WCssssssvG-430076"),
        Place(title: "애파소", type: "요리주점", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%95%A0%ED%8C%8C%EC%86%8C&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%81%B4%EB%9E%AD%EB%B8%94%EB%A3%A8&tqi=h24eTlprvTVssKuGd88ssssstRs-108584"),
        Place(title: "레이지펌프", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%A0%88%EC%9D%B4%EC%A7%80%ED%8E%8C%ED%94%84&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%95%A0%ED%8C%8C%EC%86%8C&tqi=h24ehlprvhGssQCWo0wsssssszR-393617"),
        Place(title: "마틸다", type: "차", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%A7%88%ED%8B%B8%EB%8B%A4&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%A0%88%EC%9D%B4%EC%A7%80%ED%8E%8C%ED%94%84&tqi=h24eNsprvN8ssnIJQKZssssst%2F4-189344"),
        Place(title: "카페노티드제주", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C%EC%A0%9C%EC%A3%BC&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EB%A7%88%ED%8B%B8%EB%8B%A4&tqi=h24ePsprvhGssQVYgPGssssssG8-457766"),
        Place(title: "인디안 썸머 애월", type: "와인", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9D%B8%EB%94%94%EC%95%88+%EC%8D%B8%EB%A8%B8+%EC%95%A0%EC%9B%94&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C%EC%A0%9C%EC%A3%BC&tqi=h24emsprvmsssTIziIlssssss2C-096810"),
        Place(title: "후카후카", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%ED%9B%84%EC%B9%B4%ED%9B%84%EC%B9%B4&oquery=%EC%A0%9C%EC%A3%BC%EC%8B%9C+%EC%9D%B8%EB%94%94%EC%95%88+%EC%8D%B8%EB%A8%B8+%EC%95%A0%EC%9B%94&tqi=h24eCwprvxZssDggiNdssssssYl-470367")
        ].sorted { $0.title < $1.title }
    
    
    let East = [
        Place(title: "오른", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%98%A4%EB%A5%B8&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%82%B0%EC%9E%A5+%EC%B9%B4%ED%8E%98&tqi=h24gQwprvOssshlYipwssssstko-046291"),
        Place(title: "풀잎들", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%ED%92%80%EC%9E%8E%EB%93%A4&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%98%A4%EB%A5%B8&tqi=h24g2wprvmsssTYt7PNssssssNG-037689"),
        Place(title: "스을", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%8A%A4%EC%9D%84&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%ED%92%80%EC%9E%8E%EB%93%A4&tqi=h24gHwprvOssshystICssssssvV-388461"),
        Place(title: "블루보틀 제주 카페", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80+%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%8A%A4%EC%9D%84&tqi=h24g8sprvmZssPWA74sssssssCV-143725"),
        Place(title: "카페모알보알 제주점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EB%AA%A8%EC%95%8C%EB%B3%B4%EC%95%8C&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80+%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98&tqi=h24g%2Blprvh8ssg4qen4ssssss%2BK-352940"),
        Place(title: "공백", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98+%EA%B3%B5%EB%B0%B1&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B3%B5%EB%B0%B1&tqi=h24Rvdprvxsssu1jtZRssssstxZ-019351"),
        Place(title: "그계절", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B7%B8%EA%B3%84%EC%A0%88&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98+%EA%B3%B5%EB%B0%B1&tqi=h24RZlprvmsssTC3QcwssssssgV-422982"),
        Place(title: "치즈태비", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%98%EC%A6%88%ED%83%9C%EB%B9%84&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B7%B8%EA%B3%84%EC%A0%88&tqi=h24RcdprvmsssT%2B5VD8ssssssXC-472629"),
        Place(title: "그초록", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B7%B8%EC%B4%88%EB%A1%9D&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%98%EC%A6%88%ED%83%9C%EB%B9%84&tqi=h24R5lprvxsssu3y7OVssssstjl-121029"),
        Place(title: "카페구할구 제주", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EA%B5%AC%ED%95%A0%EA%B5%AC+%EC%A0%9C%EC%A3%BC&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EA%B7%B8%EC%B4%88%EB%A1%9D&tqi=h24R7lprvOssshzl5T4ssssssoh-010403"),
        Place(title: "카페 미와", type: "케이크전문", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98+%EB%AF%B8%EC%99%80&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EA%B5%AC%ED%95%A0%EA%B5%AC+%EC%A0%9C%EC%A3%BC&tqi=h24RMlprvxZssDm%2FPLKssssssPd-242682"),
        Place(title: "카페책자국", type: "북카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EC%B1%85%EC%9E%90%EA%B5%AD&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98+%EB%AF%B8%EC%99%80&tqi=h24RelprvxZssDe1eJwssssstWd-218817"),
        Place(title: "여유공간", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%97%AC%EC%9C%A0%EA%B3%B5%EA%B0%84&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EC%B1%85%EC%9E%90%EA%B5%AD&tqi=h24RUlprvmZssP8MLnossssssZN-450881"),
        Place(title: "부이크브루어스", type: "카페", url: "https://search.naver.com/search.naver?where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%B6%80%EC%9D%B4%ED%81%AC%EB%B8%8C%EB%A3%A8%EC%96%B4%EC%8A%A4&sm=tab_org&qvt=0"),
        Place(title: "르토아 베이스먼트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%A5%B4%ED%86%A0%EC%95%84+%EB%B2%A0%EC%9D%B4%EC%8A%A4%EB%A8%BC%ED%8A%B8&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%B6%80%EC%9D%B4%ED%81%AC%EB%B8%8C%EB%A3%A8%EC%96%B4%EC%8A%A4&tqi=h24ROsprvTVss7%2BL2JRssssssMw-026008"),
        Place(title: "카페록록", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EB%A1%9D%EB%A1%9D&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EB%A5%B4%ED%86%A0%EC%95%84+%EB%B2%A0%EC%9D%B4%EC%8A%A4%EB%A8%BC%ED%8A%B8&tqi=h24RlwprvTVss7rlax4ssssst0K-520720"),
        Place(title: "CAFERI 카페리", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC%EB%8F%84+CAFERI+%EC%B9%B4%ED%8E%98&oquery=%EC%A0%9C%EC%A3%BC%EB%8F%84+%EC%B9%B4%ED%8E%98%EB%A1%9D%EB%A1%9D&tqi=h24RBdprvTVss7WkMX4ssssssA0-190587")
        ].sorted { $0.title < $1.title }
    
    let Seoguipo = [
        Place(title: "아줄레주", type: "카페", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%A0%9C%EC%A3%BC+%EC%95%84%EC%A4%84%EB%A0%88%EC%A3%BC"),
        Place(title: "성산해나", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%84%B1%EC%82%B0%ED%95%B4%EB%82%98&oquery=%EC%A0%9C%EC%A3%BC+%EC%95%84%EC%A4%84%EB%A0%88%EC%A3%BC&tqi=h24jgsprvxsssvMtS5VsssssswN-119922"),
        Place(title: "덴드리", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%8D%B4%EB%93%9C%EB%A6%AC&oquery=%EC%A0%9C%EC%A3%BC+%EC%84%B1%EC%82%B0%ED%95%B4%EB%82%98&tqi=h24jUsprvTVss7D2WWKssssssE4-130489"),
        Place(title: "랜딩커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%9E%9C%EB%94%A9%EC%BB%A4%ED%94%BC&oquery=%EC%A0%9C%EC%A3%BC+%EB%8D%B4%EB%93%9C%EB%A6%AC&tqi=h24jidprvmsssTrNJ2VsssssspK-511136"),
        Place(title: "카페애옥", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EC%95%A0%EC%98%A5&oquery=%EC%A0%9C%EC%A3%BC+%EB%9E%9C%EB%94%A9%EC%BB%A4%ED%94%BC&tqi=h24jkdprvh8ssgeGQ6ZssssssLZ-033737"),
        Place(title: "카페미깡", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EB%AF%B8%EA%B9%A1&oquery=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EC%95%A0%EC%98%A5&tqi=h24jOwprvOsssh3RPbNssssstSw-390184"),
        Place(title: "세러데이아일랜드", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%84%B8%EB%9F%AC%EB%8D%B0%EC%9D%B4%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C&oquery=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EB%AF%B8%EA%B9%A1&tqi=h24jlsprvh8ssfG74J0ssssss6K-327627"),
        Place(title: "귤바테", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EA%B7%A4%EB%B0%94%ED%85%8C&oquery=%EC%A0%9C%EC%A3%BC+%EC%84%B8%EB%9F%AC%EB%8D%B0%EC%9D%B4%EC%95%84%EC%9D%BC%EB%9E%9C%EB%93%9C&tqi=h24jmwprvmZssPxVQJ4ssssss8V-387239"),
        Place(title: "베케", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%B2%A0%EC%BC%80&oquery=%EC%A0%9C%EC%A3%BC+%EA%B7%A4%EB%B0%94%ED%85%8C&tqi=h24jBwprvOssshW2Xh8ssssst9h-284150"),
        Place(title: "노바운더리 제주", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%85%B8%EB%B0%94%EC%9A%B4%EB%8D%94%EB%A6%AC+%EC%A0%9C%EC%A3%BC&oquery=%EC%A0%9C%EC%A3%BC+%EB%B2%A0%EC%BC%80&tqi=h24jDwprvOssshFcRHKssssstIV-251901"),
        Place(title: "원앤온리", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%9B%90%EC%95%A4%EC%98%A8%EB%A6%AC&oquery=%EC%A0%9C%EC%A3%BC+%EB%85%B8%EB%B0%94%EC%9A%B4%EB%8D%94%EB%A6%AC+%EC%A0%9C%EC%A3%BC&tqi=h24jowprvh8ssf3%2FcIRssssstTV-203007"),
        Place(title: "뷰스트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%B7%B0%EC%8A%A4%ED%8A%B8&oquery=%EC%A0%9C%EC%A3%BC+%EC%9B%90%EC%95%A4%EC%98%A8%EB%A6%AC&tqi=h24jrsprvh8ssf8MjhKssssstBR-345643"),
        Place(title: "터틀락", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%ED%84%B0%ED%8B%80%EB%9D%BD&oquery=%EC%A0%9C%EC%A3%BC+%EB%B7%B0%EC%8A%A4%ED%8A%B8&tqi=h24jVwprvhGssQ%2FBKNlssssstgC-247324"),
        Place(title: "무로이", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98+%EB%AC%B4%EB%A1%9C%EC%9D%B4&oquery=%EC%A0%9C%EC%A3%BC+%EB%AC%B4%EB%A1%9C%EC%9D%B4&tqi=h24jwlprvTVss7YFh1Gsssssthl-278451"),
        Place(title: "인스밀", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%9D%B8%EC%8A%A4%EB%B0%80&oquery=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98+%EC%9D%B8%EC%8A%A4%EB%B0%80&tqi=h24j0wprvhGssQwzcYossssstCd-161148"),
        Place(title: "카페차롱", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%9C%EC%A3%BC+%EC%B9%B4%ED%8E%98%EC%B0%A8%EB%A1%B1&oquery=%EC%A0%9C%EC%A3%BC+%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC+%EC%9D%B8%EC%8A%A4%EB%B0%80&tqi=h24j2dprvxsssu%2Br5Eossssst6R-160603")
        ].sorted { $0.title < $1.title }
    
    
    
    let sections = ["제주시","서부","동부","남부"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(indi)
        indi.isHidden = true


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
            return Jejucity.count
        }else if section == 1{
            return West.count
        }else if section == 2{
            return East.count
        }else if section == 3{
            return Seoguipo.count
        }
        return 30
    }
    //섹션 내 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JejuAreaCell_ID", for: indexPath) as! JejuAreaCell
    
        if indexPath.section == 0{
            cell.JejuAreaLabel.text = Jejucity[indexPath.row].title
            cell.lbType.text = Jejucity[indexPath.row].type
        }else if indexPath.section == 1{
            cell.JejuAreaLabel.text = West[indexPath.row].title
            cell.lbType.text = West[indexPath.row].type

        }else if indexPath.section == 2{
            cell.JejuAreaLabel.text = East[indexPath.row].title
            cell.lbType.text = East[indexPath.row].type

        }else if indexPath.section == 3{
            cell.JejuAreaLabel.text = Seoguipo[indexPath.row].title
            cell.lbType.text = Seoguipo[indexPath.row].type

        }
        return cell
    }
    //테이블뷰 눌렀을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indi.isHidden = false
        indi.startAnimating()
        
                let showVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
                showVC.modalPresentationStyle = .automatic
                showVC.urlAddress = Jejucity[indexPath.row].url
        showVC.cityType = "Jeju"

        if indexPath.section == 0 {
            showVC.urlAddress = Jejucity[indexPath.row].url
            showVC.areatype = "제주시"
        } else if indexPath.section == 1 {
            showVC.urlAddress = West[indexPath.row].url
            showVC.areatype = "서부"
        } else if indexPath.section == 2 {
            showVC.urlAddress = East[indexPath.row].url
            showVC.areatype = "동부"
        }else if indexPath.section == 3 {
            showVC.urlAddress = Seoguipo[indexPath.row].url
            showVC.areatype = "남부"
        }
        self.present(showVC,animated: true){
            self.indi.stopAnimating()
        }

    }
}
