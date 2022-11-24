//
//  SeoulAreaViewController.swift
//  LandMarkVisitor
//
//  Created by 이송은 on 2022/08/22.
//

import UIKit

class SeoulAreaCell : UITableViewCell {
    @IBOutlet weak var SeoulAreaLabel: UILabel!
    //self.selectionStyle = .none
    
    @IBOutlet weak var TypeLabel: UILabel!
}
class SeoulAreaViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
//    var placeName: [String]!
//    var url: [String]!
//    var sections : [String]!
    struct Place {
        var title: String
        var type : String
        var url: String
    }
    
    @IBOutlet weak var indi: UIActivityIndicatorView!
    let Sungsu = [
        Place(title: "연무장", type: "카페",url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%B9%B4%ED%8E%98+%EC%97%B0%EB%AC%B4%EC%9E%A5&oquery=%EC%97%B0%EB%AC%B4%EC%9E%A5&tqi=h2viJsprvxZsslo%2F4f8ssssstuw-247188"),
        Place(title: "오우드", type: "카페",url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%98%A4%EC%9A%B0%EB%93%9C&oquery=%EC%98%A4%EC%9A%B0%EB%93%9C&tqi=h2vj7sprvhGssikE75VssssstlK-324405"),
        Place(title: "Scene", type: "카페",url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98+scene&oquery=%EC%84%B1%EC%88%98%EB%8F%99+scene&tqi=h2vjSlprvOsssR5DttsssssstF4-016807"),
        Place(title: "디플렛", type: "카페",url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98+%EB%94%94%ED%94%8C%EB%A0%9B&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98+scene&tqi=h2vjTlprvOsssR7v4d4ssssst2w-240393"),
        Place(title: "어니언 성수", type: "카페", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EC%96%B4%EB%8B%88%EC%96%B8+"),
        Place(title: "LOWIDE", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++lowide&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++lowede&tqi=h2vkUwprvh8ssMx7TDsssssst8s-455631"),
        Place(title: "서울앵무새", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EC%84%9C%EC%9A%B8%EC%95%B5%EB%AC%B4%EC%83%88&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++lowide&tqi=h2vkidprvTVssccO7c0ssssssi8-507968"),
        Place(title: "멜로워 성수 더 플래그쉽", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EB%A9%9C%EB%A1%9C%EC%9B%8C&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EC%84%9C%EC%9A%B8%EC%95%B5%EB%AC%B4%EC%83%88&tqi=h2vkIlprvxZsslXmE6ssssssssl-139900"),
        Place(title: "블루보틀 성수", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EB%A9%9C%EB%A1%9C%EC%9B%8C&tqi=h2vNvsprvxsssCQ8StKssssst88-035653"),
        Place(title: "누데이크", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%88%84%EB%8D%B0%EC%9D%B4%ED%81%AC+%EC%84%B1%EC%88%98%EC%A0%90&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%B9%B4%ED%8E%98++%EB%88%84%EB%8D%B0%EC%9D%B4%ED%81%AC&tqi=h2vNlsprvhGssijZZtZsssssshR-098319"),
        Place(title: "에이투비 Cafe&Ba", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EC%97%90%EC%9D%B4%ED%88%AC%EB%B9%84&oquery=%EC%97%90%EC%9D%B4%ED%88%AC%EB%B9%84&tqi=h2vNplprvOsssg9BnywssssstI8-254081"),
        Place(title: "루프", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EC%B9%B4%ED%8E%98++%EB%A3%A8%ED%94%84&oquery=%EC%84%B1%EC%88%98+%EB%A3%A8%ED%94%84&tqi=h2vOcdprvxsssCe8HQhssssssad-157302"),
        Place(title: "스케쥴 성수", type: "양식", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%8B%9D%EB%8B%B9+%EC%8A%A4%EC%BC%80%EC%A5%B4+%EC%84%B1%EC%88%98"),
        Place(title: "대림국수", type: "국수", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%8B%9D%EB%8B%B9+%EB%8C%80%EB%A6%BC%EA%B5%AD%EC%88%98&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%8B%9D%EB%8B%B9+%EC%8A%A4%EC%BC%80%EC%A5%B4+%EC%84%B1%EC%88%98&tqi=h2ZSDsp0YiRsselKfVZssssstws-077836"),
        Place(title: "소문난성수감자탕", type: "감자탕", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EC%86%8C%EB%AC%B8%EB%82%9C+%EC%84%B1%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95&oquery=%EC%86%8C%EB%AC%B8%EB%82%9C+%EC%84%B1%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95&tqi=h2ZTvdp0Yidss640d4dssssss%2BN-323143"),
        Place(title: "난포", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EB%82%9C%ED%8F%AC&oquery=%EC%84%B1%EC%88%98+%EC%86%8C%EB%AC%B8%EB%82%9C+%EC%84%B1%EC%88%98+%EA%B0%90%EC%9E%90%ED%83%95&tqi=h2ZTblp0J1ZssM5PVNsssssssCw-435560"),
        Place(title: "온량", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EC%98%A8%EB%9F%89&oquery=%EC%84%B1%EC%88%98+%EB%82%9C%ED%8F%AC&tqi=h2ZTfsp0J14sshYjsl4ssssstcZ-010140"),
        Place(title: "소바식당", type: "소바", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EC%86%8C%EB%B0%94%EC%8B%9D%EB%8B%B9&oquery=%EC%84%B1%EC%88%98+%EC%98%A8%EB%9F%89&tqi=h2ZTjsp0Jywss69WvmVssssssrZ-327158"),
        Place(title: "문화식당", type: "요리주점", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98+%EB%AC%B8%ED%99%94%EC%8B%9D%EB%8B%B9&oquery=%EC%84%B1%EC%88%98+%EC%86%8C%EB%B0%94%EC%8B%9D%EB%8B%B9&tqi=h2ZTWwp0Jy0ss5EcpBZssssssj8-003961"),
        Place(title: "송계옥 성수점", type: "닭요리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EC%A0%90+%EC%86%A1%EA%B3%84%EC%98%A5&oquery=%EC%84%B1%EC%88%98+%EC%86%A1%EA%B3%84%EC%98%A5&tqi=h2ZUZlp0JXVssAs%2Fj9GssssstCh-292142"),
        Place(title: "쿠나", type: "이탈리안 양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%BF%A0%EB%82%98+%EC%8B%9D%EB%8B%B9&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%BF%A0%EB%82%98&tqi=h2ZUSdp0J14ssh2uOC0ssssssio-130363"),
        Place(title: "메종 파이프그라운드", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EB%A9%94%EC%A2%85+%ED%8C%8C%EC%9D%B4%ED%94%84%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%BF%A0%EB%82%98+%EC%8B%9D%EB%8B%B9&tqi=h2ZUTlp0Jywss6pnu2wssssstuK-016077"),
        Place(title: "성수명당", type: "요리주점", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%84%B1%EC%88%98%EB%AA%85%EB%8B%B9&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%BF%A0%EB%82%98+%EC%8B%9D%EB%8B%B9&tqi=h2ZUDwp0JXVssALv0PZssssstpC-451973"),
        Place(title: "성수족발", type: "족발", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%84%B1%EC%88%98%EC%A1%B1%EB%B0%9C&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%BF%A0%EB%82%98+%EC%8B%9D%EB%8B%B9&tqi=h2ZUzwp0YihssMwEcL0sssssshR-405189"),
        Place(title: "탐광", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%ED%83%90%EA%B4%91&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%EC%84%B1%EC%88%98%EC%A1%B1%EB%B0%9C&tqi=h2ZUGsp0J14sshWm1Asssssssul-446213"),
        Place(title: "중앙감속기", type: "퓨전음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%B1%EC%88%98%EB%8F%99+%EC%A4%91%EC%95%99%EA%B0%90%EC%86%8D%EA%B8%B0&oquery=%EC%84%B1%EC%88%98%EB%8F%99+%ED%83%90%EA%B4%91&tqi=h2Zhasp0J14sshoPkWwssssss9d-330711")
        
    ].sorted { $0.title < $1.title }
    
    let Hannam = [
        Place(title: "올드페리도넛 한남점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%AC%EB%93%9C%ED%8E%98%EB%A6%AC%EB%8F%84%EB%84%9B+%ED%95%9C%EB%82%A8%EC%A0%90&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%AC%EB%93%9C%ED%8E%98%EB%A6%AC%EB%8F%84%EB%84%9B&tqi=h2ZhEwp0J1ZssLJ7ufZsssssseh-117258"),
        Place(title: "마일스톤커피 한남점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%A7%88%EC%9D%BC%EC%8A%A4%ED%86%A4+%ED%95%9C%EB%82%A8%EC%A0%90&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%AC%EB%93%9C%ED%8E%98%EB%A6%AC%EB%8F%84%EB%84%9B+%ED%95%9C%EB%82%A8%EC%A0%90&tqi=h2ZhFwp0JXVssm33x2ossssst4N-012335"),
        Place(title: "네로우 패스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%84%A4%EB%A1%9C%EC%9A%B0%ED%8C%A8%EC%8A%A4&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%A7%88%EC%9D%BC%EC%8A%A4%ED%86%A4+%ED%95%9C%EB%82%A8%EC%A0%90&tqi=h2Zh%2Flp0JXVssAv4ZB0ssssstwN-114772"),
        Place(title: "오아시스", type: "키페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%A4%EC%95%84%EC%8B%9C%EC%8A%A4&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%84%A4%EB%A1%9C%EC%9A%B0%ED%8C%A8%EC%8A%A4&tqi=h2Zicsp0J14sshxf7KNssssstyN-338011"),
        Place(title: "맥심플랜트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%A7%A5%EC%8B%AC&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%A4%EC%95%84%EC%8B%9C%EC%8A%A4&tqi=h2ZiMsp0Jy0ss5oxymZssssss0w-505278"),
        Place(title: "오지힐", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%A4%EC%A7%80%ED%9E%90&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%A7%A5%EC%8B%AC&tqi=h2ZiSdp0Yidss5IyMb8ssssstUh-194626"),
        Place(title: "카페 노티드 한남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%98%A4%EC%A7%80%ED%9E%90&tqi=h2ZiOwp0J1ZssLzilUlssssstU4-147824"),
        Place(title: "콘하스 한남점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%BD%98%ED%95%98%EC%8A%A4%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%B9%B4%ED%8E%98%EB%85%B8%ED%8B%B0%EB%93%9C%ED%95%9C%EB%82%A8&tqi=h2ZiYwp0YihssMG3fANssssstYo-274603"),
        Place(title: "104", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%B9%B4%ED%8E%98104&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%BD%98%ED%95%98%EC%8A%A4%ED%95%9C%EB%82%A8&tqi=h2Zi8wp0Jywss6Inj6VssssssVw-476635"),
        Place(title: "아키비스트 한남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%95%84%ED%82%A4%EB%B9%84%EC%8A%A4%ED%8A%B8+%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%B9%B4%ED%8E%98104&tqi=h2Zjblp0YiRsseENW3Cssssssoh-500710"),
        Place(title: "스퀘어라인 스페이스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%8A%A4%ED%80%98%EC%96%B4%EB%9D%BC%EC%9D%B8+%EC%8A%A4%ED%8E%98%EC%9D%B4%EC%8A%A4&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%95%84%ED%82%A4%EB%B9%84%EC%8A%A4%ED%8A%B8+%ED%95%9C%EB%82%A8&tqi=h2Zjnwp0JXossPvtHFsssssst20-271405"),
        Place(title: "크레이트 커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%81%AC%EB%A0%88%EC%9D%B4%ED%8A%B8%EC%BB%A4%ED%94%BC&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%82%A8%EB%B2%A0%EB%A5%B4%EA%B7%B8&tqi=h2Zjolp0Jy0ss5meL5dssssssxR-521581"),
        Place(title: "한남작업실", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%82%A8%EC%9E%91%EC%97%85%EC%8B%A4&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%81%AC%EB%A0%88%EC%9D%B4%ED%8A%B8%EC%BB%A4%ED%94%BC&tqi=h2Zjrwp0Jy0ss5TY%2BHlssssss9C-456346"),
        Place(title: "웻커피 한남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%9B%BB%EC%BB%A4%ED%94%BC%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%82%A8%EC%9E%91%EC%97%85%EC%8B%A4&tqi=h2Zj1lp0J1ZssLlLQdRsssssskN-022926"),
        Place(title: "hick", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+hick&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%9B%BB%EC%BB%A4%ED%94%BC%ED%95%9C%EB%82%A8&tqi=h2Zj%2Fsp0J1ZssMUCi7KsssssspG-418414"),
        Place(title: "부자피자 1호점", type: "피자", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B6%80%EC%9E%90%ED%94%BC%EC%9E%90"),
        Place(title: "더테이블키친", type: "와인", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%8D%94%ED%85%8C%EC%9D%B4%EB%B8%94%ED%82%A4%EC%B9%9C&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B6%80%EC%9E%90%ED%94%BC%EC%9E%90&tqi=h2ZkDwp0Jywss60o9hossssstEo-144301"),
        Place(title: "난포한남", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%82%9C%ED%8F%AC%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%8D%94%ED%85%8C%EC%9D%B4%EB%B8%94%ED%82%A4%EC%B9%9C&tqi=h2Zkpwp0J14sshptPmGssssstIV-159576"),
        Place(title: "파이프그라운드", type: "피자", url: "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%8C%8C%EC%9D%B4%ED%94%84%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%82%9C%ED%8F%AC%ED%95%9C%EB%82%A8&tqi=h2ZkYlp0YiRsseTAsyZssssstWh-386678&acq=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%8C%8C%EC%9D%B4%ED%94%84&acr=1&qdt=0"),
        Place(title: "다운타우너 한남", type: "햄버거", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%8B%A4%EC%9A%B4%ED%83%80%EC%9A%B0%EB%84%88&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%8C%8C%EC%9D%B4%ED%94%84%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C&tqi=h2Zk1sp0Jy0ss56Xb9RssssstyR-190818"),
        Place(title: "한남동 한방통닭", type: "치킨", url: "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%B0%A9%ED%86%B5%EB%8B%AD&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%8B%A4%EC%9A%B4%ED%83%80%EC%9A%B0%EB%84%88&tqi=h2ZkIwp0JXossP4giEwssssssWZ-489183&acq=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%B0%A9&acr=1&qdt=0"),
        Place(title: "벽돌해피푸드", type: "중식당", url: "https://search.naver.com/search.naver?sm=tab_sug.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B2%BD%EB%8F%8C%ED%95%B4%ED%94%BC%ED%91%B8%EB%93%9C&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%ED%95%9C%EB%B0%A9%ED%86%B5%EB%8B%AD&tqi=h2ZNtdp0YihssMF9mZ4sssssssC-420448&acq=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B2%BD%EB%8F%8C&acr=1&qdt=0"),
        Place(title: "소와나", type: "소고기", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%86%8C%EC%99%80%EB%82%98&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B2%BD%EB%8F%8C%ED%95%B4%ED%94%BC%ED%91%B8%EB%93%9C&tqi=h2ZNclp0Jywss7bfYENssssst08-202672"),
        Place(title: "부첼리하우스", type: "식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B6%80%EC%B2%BC%EB%A6%AC%ED%95%98%EC%9A%B0%EC%8A%A4&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EC%86%8C%EC%99%80%EB%82%98&tqi=h2ZNLlp0Jy0ss5ly6OsssssssuR-380711"),
        Place(title: "뇨끼바", type: "이탈리안음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%87%A8%EB%81%BC%EB%B0%94&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B6%80%EC%B2%BC%EB%A6%AC%ED%95%98%EC%9A%B0%EC%8A%A4&tqi=h2ZNSdp0JXVssAnLsqdssssstfZ-047501"),
        Place(title: "Gongi", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+gongi&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%B6%80%EC%B2%BC%EB%A6%AC%ED%95%98%EC%9A%B0%EC%8A%A4&tqi=h2ZN3sp0JXVssmyUnNNssssssg0-434924"),
        Place(title: "나리의집", type: "돼지고기구이", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%82%98%EB%A6%AC%EC%9D%98%EC%A7%91&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+gongi&tqi=h2ZNHwp0J1ZssL1WX7VssssssAZ-058580"),
        Place(title: "뮬리노 에스크레소바 한남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%AE%AC%EB%A6%AC%EB%85%B8+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+%EB%AE%AC%EB%A6%AC%EB%85%B8+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%8A%A4%EB%B0%94&tqi=h2ZOEsp0JXossO8ZNyossssssds-222469"),
        Place(title: "HOPE GARDEN HANNAM", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%9C%EB%82%A8%EB%8F%99+hope+garden+%ED%95%9C%EB%82%A8&oquery=%ED%95%9C%EB%82%A8%EB%8F%99+hopegarden+%ED%95%9C%EB%82%A8&tqi=h2ZO2sp0J1ZssLQtd94ssssstSo-224759")

    ].sorted { $0.title < $1.title }
    
    
    let Sinsa = [
        Place(title: "샌드커피 논탄도 신사", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%83%8C%EB%93%9C%EC%BB%A4%ED%94%BC+%EB%85%BC%ED%83%84%ED%86%A0&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%83%8C%EB%93%9C%EC%BB%A4%ED%94%BC&tqi=h2ZQ9wp0JXVssmzwihNssssssIN-076374"),
        Place(title: "웻커피 신사", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%9B%BB%EC%BB%A4%ED%94%BC+%EC%8B%A0%EC%82%AC&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%83%8C%EB%93%9C%EC%BB%A4%ED%94%BC+%EB%85%BC%ED%83%84%ED%86%A0&tqi=h2ZQ%2Fwp0Yidss5oXhcNssssstJN-339397"),
        Place(title: "올드페리도넛 가로수길점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%98%AC%EB%93%9C%ED%8E%98%EB%A6%AC%EB%8F%84%EB%84%9B+%EA%B0%80%EB%A1%9C%EC%88%98%EA%B8%B8%EC%A0%90&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%ED%95%98%ED%94%84%EC%BB%A4%ED%94%BC+%EC%8B%A0%EC%82%AC%EC%A0%90&tqi=h2Zlfsp0Jywss6JuPbossssssNR-213542"),
        Place(title: "프론트서울", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%ED%94%84%EB%A1%A0%ED%8A%B8%EC%84%9C%EC%9A%B8&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%98%AC%EB%93%9C%ED%8E%98%EB%A6%AC%EB%8F%84%EB%84%9B+%EA%B0%80%EB%A1%9C%EC%88%98%EA%B8%B8%EC%A0%90&tqi=h2ZlCwp0YiRsseN%2BtrVssssstA0-523009"),
        Place(title: "마일스톤커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EB%A7%88%EC%9D%BC%EC%8A%A4%ED%86%A4%EC%BB%A4%ED%94%BC&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%ED%94%84%EB%A1%A0%ED%8A%B8%EC%84%9C%EC%9A%B8&tqi=h2ZlXdp0YiRssewOucVssssstuR-368040"),
        Place(title: "RDBK 가로수", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+RDBK+%EA%B0%80%EB%A1%9C%EC%88%98&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%EB%A7%88%EC%9D%BC%EC%8A%A4%ED%86%A4%EC%BB%A4%ED%94%BC&tqi=h2Zl0sp0Jy0ss5DTDUZssssssxZ-028301"),
        Place(title: "식물학", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%8B%9D%EB%AC%BC%ED%95%99&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+RDBK+%EA%B0%80%EB%A1%9C%EC%88%98&tqi=h2Zl%2Fwp0J1ZssLIGsAGssssstO4-189516"),
        Place(title: "청수당갤러리", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%B2%AD%EC%88%98%EB%8B%B9%EA%B0%A4%EB%9F%AC%EB%A6%AC&oquery=%EC%8B%A0%EC%82%AC%EB%8F%99+%EC%8B%9D%EB%AC%BC%ED%95%99&tqi=h2Zm6dp0JXossOyj6rsssssssWN-082302"),
        Place(title: "런던 베이글 뮤지엄 도산점", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%9F%B0%EB%8D%98+%EB%B2%A0%EC%9D%B4%EA%B8%80+%EB%AE%A4%EC%A7%80%EC%97%84+%EB%8F%84%EC%82%B0%EC%A0%90%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%B9%B4%ED%8E%98&tqi=h2ZmRlp0JXossPZb%2FA8ssssstzR-439865"),
        Place(title: "SADDLER HAUS", type: "와플", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+SADDLER+HAUS&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%9F%B0%EB%8D%98+%EB%B2%A0%EC%9D%B4%EA%B8%80+%EB%AE%A4%EC%A7%80%EC%97%84+%EB%8F%84%EC%82%B0%EC%A0%90%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC&tqi=h2Zmjdp0Jy0ss5BDjflssssssAK-121532"),
        Place(title: "카멜커피", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%B9%B4%EB%A9%9C%EC%BB%A4%ED%94%BC&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+SADDLER+HAUS&tqi=h2ZmCwp0JXossPLgdl0ssssssFl-329978"),
        Place(title: "누데이크 하우스 도산", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%88%84%EB%8D%B0%EC%9D%B4%ED%81%AC+%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%8F%84%EC%82%B0&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%88%84%EB%8D%B0%EC%9D%B4%ED%81%AC&tqi=h2Zmzsp0JXossOW71Shsssssts8-130242"),
        Place(title: "이치서울", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%9D%B4%EC%B9%98%EC%84%9C%EC%9A%B8&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%88%84%EB%8D%B0%EC%9D%B4%ED%81%AC+%ED%95%98%EC%9A%B0%EC%8A%A4+%EB%8F%84%EC%82%B0&tqi=h2Zm0sp0Jy0ss5jIRAossssst4Z-312031"),
        Place(title: "꽁티드툴레아", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EA%BD%81%ED%8B%B0%EB%93%9C%EB%A3%B0%EB%A0%88%EC%95%84&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%9D%B4%EC%B9%98%EC%84%9C%EC%9A%B8&tqi=h2Zm9dp0Yidss64SKCKssssssUR-269944"),
        Place(title: "소스윗예스", type: "퓨전음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%86%8C%EC%8A%A4%EC%9C%97%EC%98%88%EC%8A%A4&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EA%BD%81%ED%8B%B0%EB%93%9C%EB%A3%B0%EB%A0%88%EC%95%84&tqi=h2ZAalp0YiRsseYSkfNssssssAw-333358"),
        Place(title: "부베트", type: "프랑스음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%B6%80%EB%B2%A0%ED%8A%B8&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EC%86%8C%EC%8A%A4%EC%9C%97%EC%98%88%EC%8A%A4&tqi=h2ZA7lp0YihssMJMhHossssst5Z-354842"),
        Place(title: "호반족 청담", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%ED%98%B8%EB%B0%98%EC%A1%B1&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%B6%80%EB%B2%A0%ED%8A%B8&tqi=h2ZAelp0J14sshx56i0ssssstxK-165812"),
        Place(title: "달마시안", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%8B%AC%EB%A7%88%EC%8B%9C%EC%95%88&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%ED%98%B8%EB%B0%98%EC%A1%B1&tqi=h2ZAhsp0J14sshFUTPVssssst3K-440838"),
        Place(title: "리틀넥 청담", type: "이탈리안음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%A6%AC%ED%8B%80%EB%84%A5+%EC%B2%AD%EB%8B%B4&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%8B%AC%EB%A7%88%EC%8B%9C%EC%95%88&tqi=h2ZAllp0YihssMDYg9ssssssteZ-496002")

    ].sorted { $0.title < $1.title }
    
    let Bukchon = [
        Place(title: "스미스가좋아하는한옥", type: "이탈리아음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%8A%A4%EB%AF%B8%EC%8A%A4%EA%B0%80%EC%A2%8B%EC%95%84%ED%95%98%EB%8A%94%ED%95%9C%EC%98%A5&oquery=%EC%95%95%EA%B5%AC%EC%A0%95+%EB%A6%AC%ED%8B%80%EB%84%A5+%EC%B2%AD%EB%8B%B4&tqi=h2ZAqdp0YihssMtCQEwssssstbG-400460"),
        Place(title: "삼청동수제비", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%82%BC%EC%B2%AD%EB%8F%99%EC%88%98%EC%A0%9C%EB%B9%84&oquery=%EB%B6%81%EC%B4%8C+%EC%8A%A4%EB%AF%B8%EC%8A%A4%EA%B0%80%EC%A2%8B%EC%95%84%ED%95%98%EB%8A%94%ED%95%9C%EC%98%A5&tqi=h2ZAzsp0JXossPM5hCZsssssssh-362258"),
        Place(title: "도마유즈라멘", type: "라멘", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%8F%84%EB%A7%88%EC%9C%A0%EC%A6%88%EB%9D%BC%EB%A9%98&oquery=%EB%B6%81%EC%B4%8C+%EC%82%BC%EC%B2%AD%EB%8F%99%EC%88%98%EC%A0%9C%EB%B9%84&tqi=h2ZBuwp0Jy0ss5OaiVCssssssKR-277501"),
        Place(title: "런던베이글뮤지엄", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%9F%B0%EB%8D%98%EB%B2%A0%EC%9D%B4%EA%B8%80%EB%AE%A4%EC%A7%80%EC%97%84&oquery=%EB%B6%81%EC%B4%8C+%EB%8F%84%EB%A7%88%EC%9C%A0%EC%A6%88%EB%9D%BC%EB%A9%98&tqi=h2ZB7dp0YihssMp3F%2Flssssssbs-071543"),
        Place(title: "소금집델리", type: "샌드위치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%86%8C%EA%B8%88%EC%A7%91%EB%8D%B8%EB%A6%AC&oquery=%EB%B6%81%EC%B4%8C+%EC%86%8C%EA%B8%88%EC%A7%91&tqi=h2ZBNlp0J14sshxZ6alssssstSd-419641"),
        Place(title: "진작카키", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%A7%84%EC%9E%91%EC%B9%B4%ED%82%A4&oquery=%EB%B6%81%EC%B4%8C+%EC%86%8C%EA%B8%88%EC%A7%91%EB%8D%B8%EB%A6%AC&tqi=h2ZBOlprvxZssaQUh1ossssstrV-246862"),
        Place(title: "어니언 안국", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%96%B4%EB%8B%88%EC%96%B8&oquery=%EB%B6%81%EC%B4%8C+%EB%AF%B8%ED%8A%B8%EB%B3%BC%EB%9D%BC%EC%9A%B4%EC%A7%80&tqi=h2ZB0wprvmZssEGp7JsssssssBR-026107"),
        Place(title: "노티드 안국", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%85%B8%ED%8B%B0%EB%93%9C+%EC%95%88%EA%B5%AD&oquery=%EB%B6%81%EC%B4%8C+%EB%85%B8%ED%8B%B0%EB%93%9C&tqi=h2ZCawprvmZssEEdKI0ssssssaw-028630"),
        Place(title: "콤포타블 안국", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EC%BD%A4%ED%8F%AC%ED%83%80%EB%B8%94&oquery=%EB%B6%81%EC%B4%8C+%EB%85%B8%ED%8B%B0%EB%93%9C+%EC%95%88%EA%B5%AD&tqi=h2ZCbwprvmZssETTaGKssssssbh-231945"),
        Place(title: "데우스 카페 삼청점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%8D%B0%EC%9A%B0%EC%8A%A4+%EC%B9%B4%ED%8E%98&oquery=%EB%B6%81%EC%B4%8C+%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80+%EC%82%BC%EC%B2%AD+%EC%B9%B4%ED%8E%98&tqi=h2ZCksprvh8ssjD%2FKmlssssstXN-049227"),
        Place(title: "토오베", type: "차", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%ED%86%A0%EC%98%A4%EB%B2%A0&oquery=%EB%B6%81%EC%B4%8C+%EB%8D%B0%EC%9A%B0%EC%8A%A4+%EC%B9%B4%ED%8E%98&tqi=h2ZCQdprvmsssOa57ehssssst%2Fd-170843"),
        Place(title: "델픽", type: "차", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%8D%B8%ED%94%BD&oquery=%EB%B6%81%EC%B4%8C+%ED%86%A0%EC%98%A4%EB%B2%A0&tqi=h2ZCplprvh8ssjFqn9lssssstXG-234333"),
        Place(title: "널담은공간 경복궁점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%81%EC%B4%8C+%EB%84%90%EB%8B%B4%EC%9D%80%EA%B3%B5%EA%B0%84&oquery=%EB%B6%81%EC%B4%8C+%EB%8D%B8%ED%94%BD&tqi=h2ZCXwprvTVssgPF2pKssssstYV-345582"),
        Place(title: "스태픽스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%B4%8C+%EC%8A%A4%ED%83%9C%ED%94%BD%EC%8A%A4&oquery=%EB%B6%81%EC%B4%8C+%EB%84%90%EB%8B%B4%EC%9D%80%EA%B3%B5%EA%B0%84&tqi=h2ZCHsprvOssslS4csVssssstqK-060946"),
        Place(title: "오버트서울", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%B4%8C+%EC%98%A4%EB%B2%84%ED%8A%B8%EC%84%9C%EC%9A%B8&oquery=%EC%84%9C%EC%B4%8C+%EC%8A%A4%ED%83%9C%ED%94%BD%EC%8A%A4&tqi=h2ZDKsprvN8ssTU8pelssssstB8-221219"),
        Place(title: "궤도", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%B4%8C+%EC%B9%B4%ED%8E%98+%EA%B6%A4%EB%8F%84&oquery=%EC%84%9C%EC%B4%8C+%EA%B6%A4%EB%8F%84&tqi=h2ZDklprvh8sskdgi%2Bsssssssa4-096868"),
        Place(title: "에스프레소 바 풍", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%B4%8C+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C%EB%B0%94+%ED%92%8D&oquery=%EC%84%9C%EC%B4%8C+%EC%B9%B4%ED%8E%98+%EA%B6%A4%EB%8F%84&tqi=h2ZDNwprvxZssaZHUGCssssssBR-383304"),
        Place(title: "서촌김씨뜨라또리아", type: "이탈리아음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%84%9C%EC%B4%8C+%EC%84%9C%EC%B4%8C%EA%B9%80%EC%94%A8&oquery=%EC%84%9C%EC%B4%8C+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C%EB%B0%94+%ED%92%8D&tqi=h2ZDFwprvhGssDIRvqwssssssrw-371000"),

    ].sorted { $0.title < $1.title }
    
    let Hongdae = [
        Place(title: "프로토콜", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C&oquery=%EC%84%9C%EC%B4%8C+%EC%84%9C%EC%B4%8C%EA%B9%80%EC%94%A8&tqi=h2ZDWlprvmsssOsyyvKsssssstK-351738"),
        Place(title: "궤도 연희", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EA%B6%A4%EB%8F%84+%EC%97%B0%ED%9D%AC&oquery=%EC%97%B0%ED%9D%AC+%EA%B6%A4%EB%8F%84+%EC%97%B0%ED%9D%AC&tqi=h2ZFgsprvOsssljsjSossssstis-366485"),
        Place(title: "콘하스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%EC%BD%98%ED%95%98%EC%8A%A4&oquery=%EC%97%B0%ED%9D%AC+%ED%94%84%EB%A1%9C%ED%86%A0%EC%BD%9C&tqi=h2ZF7wprvmsssNpWUxwssssstTR-285225"),
        Place(title: "앤트러사이트 연희점", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EC%95%A4%ED%8A%B8%EB%9F%AC%EC%82%AC%EC%9D%B4%ED%8A%B8&oquery=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EA%B6%A4%EB%8F%84+%EC%97%B0%ED%9D%AC&tqi=h2ZFRdprvmsssN8dU8wssssstNC-196096"),
        Place(title: "오디너리 핏", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EC%98%A4%EB%94%94%EB%84%88%EB%A6%AC%ED%95%8F&oquery=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EC%95%A4%ED%8A%B8%EB%9F%AC%EC%82%AC%EC%9D%B4%ED%8A%B8&tqi=h2ZFhdprvxsss55z2sdssssstCl-028705"),
        Place(title: "푸어링아웃", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%ED%91%B8%EC%96%B4%EB%A7%81%EC%95%84%EC%9B%83&oquery=%EC%97%B0%ED%9D%AC+%EC%B9%B4%ED%8E%98+%EC%98%A4%EB%94%94%EB%84%88%EB%A6%AC%ED%95%8F&tqi=h2ZFPsprvxsss5KmZmlssssst3h-146820"),
        Place(title: "데스툴", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%B9%B4%ED%8E%98%EB%8D%B0%EC%8A%A4%ED%88%B4&oquery=%EC%97%B0%EB%82%A8+%EC%B9%B4%ED%8E%98+%EB%8D%B0%EC%8A%A4%ED%86%A8&tqi=h2ZFFsprvxZssac4t6CssssstT4-498824"),
        Place(title: "카페 드 댕 연남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%B9%B4%ED%8E%98%EB%93%9C%EB%8C%95%EC%97%B0%EB%82%A8&oquery=%EC%97%B0%EB%82%A8+%EC%B9%B4%ED%8E%98%EB%8D%B0%EC%8A%A4%ED%88%B4&tqi=h2ZFpwprvOssslHXuI4ssssstb8-068172"),
        Place(title: "퀸넬브릴", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%ED%80%B8%EB%84%AC%EB%B8%8C%EB%A6%B4&oquery=%EC%97%B0%EB%82%A8+%EC%B9%B4%ED%8E%98%EB%93%9C%EB%8C%95%EC%97%B0%EB%82%A8&tqi=h2ZFVwprvxZssa7zi2dssssst3V-444036"),
        Place(title: "잼잼", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%9E%BC%EC%9E%BC&oquery=%EC%97%B0%EB%82%A8+%ED%80%B8%EB%84%AC%EB%B8%8C%EB%A6%B4&tqi=h2ZFwdprvOsssleB0YRssssstSK-493762"),
        Place(title: "땡스오트 연남", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EB%95%A1%EC%8A%A4%EC%98%A4%ED%8A%B8&oquery=%EC%97%B0%EB%82%A8+%EC%9E%BC%EC%9E%BC&tqi=h2ZFzdprvTVssgzxJQlssssssK4-071971"),
        Place(title: "요레스트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%9A%94%EB%A0%88%EC%8A%A4%ED%8A%B8&oquery=%EC%97%B0%EB%82%A8+%EB%95%A1%EC%8A%A4%EC%98%A4%ED%8A%B8&tqi=h2ZF2wprvhGssEsYb20sssssszd-176826"),
        Place(title: "초이다이닝", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%B4%88%EC%9D%B4%EB%8B%A4%EC%9D%B4%EB%8B%9D&oquery=%EC%97%B0%EB%82%A8+%EC%9A%94%EB%A0%88%EC%8A%A4%ED%8A%B8&tqi=h2ZFHlprvOssslQeRo8ssssstu4-194843"),
        Place(title: "오뗄드꾸뜨", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%98%A4%EB%97%84%EB%93%9C%EA%BE%B8%EB%9C%A8&oquery=%EC%97%B0%EB%82%A8+%EC%B4%88%EC%9D%B4%EB%8B%A4%EC%9D%B4%EB%8B%9D&tqi=h2ZF8dprvh8ssktcXGNssssstxG-175671"),
        Place(title: "카멜로연남", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%B9%B4%EB%A9%9C%EB%A1%9C%EC%97%B0%EB%82%A8&oquery=%EC%97%B0%EB%82%A8+%EC%98%A4%EB%97%84%EB%93%9C%EA%BE%B8%EB%9C%A8&tqi=h2Zosdprvh8ssj3nmL8ssssssY8-460642"),
        Place(title: "파델라", type: "이탈리아음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%ED%8C%8C%EB%8D%B8%EB%9D%BC&oquery=%EC%97%B0%EB%82%A8+%EC%B9%B4%EB%A9%9C%EB%A1%9C%EC%97%B0%EB%82%A8&tqi=h2Zomsprvh8ssjAnfVGssssstLR-297263"),
        Place(title: "연남토마", type: "퓨전음식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%97%B0%EB%82%A8%ED%86%A0%EB%A7%88&oquery=%EC%97%B0%EB%82%A8+%ED%8C%8C%EB%8D%B8%EB%9D%BC&tqi=h2ZoEwprvmZssE0qG%2FCssssst1C-268865"),
        Place(title: "사루카메", type: "일본식라멘", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%EC%82%AC%EB%A3%A8%EC%B9%B4%EB%A9%94&oquery=%EC%97%B0%EB%82%A8+%EC%97%B0%EB%82%A8%ED%86%A0%EB%A7%88&tqi=h2ZoqlprvxZssa4A4ndssssstSd-021165"),
        Place(title: "해브", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%97%B0%EB%82%A8+%ED%95%B4%EB%B8%8C&oquery=%EC%97%B0%EB%82%A8+%EC%82%AC%EB%A3%A8%EC%B9%B4%EB%A9%94&tqi=h2ZowlprvhGssD8eL0hssssstJd-185140")

    ].sorted { $0.title < $1.title }
    
    let EulJiro = [
        Place(title: "호텔수선화", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%ED%98%B8%ED%85%94%EC%88%98%EC%84%A0%ED%99%94&oquery=%EC%97%B0%EB%82%A8+%ED%95%B4%EB%B8%8C&tqi=h2Zo0wprvxZssavBde4ssssstS0-276959"),
        Place(title: "적당", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%A0%81%EB%8B%B9&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%ED%98%B8%ED%85%94%EC%88%98%EC%84%A0%ED%99%94&tqi=h2Zp%2Bwprvxsss5syKz8ssssssNs-211560"),
        Place(title: "호랑이", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%ED%98%B8%EB%9E%91%EC%9D%B4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%ED%98%B8%EB%9E%91%EC%9D%B4&tqi=h2ZqasprvOsssljoPaCssssssuG-294294"),
        Place(title: "분카샤", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%B6%84%EC%B9%B4%EC%83%A4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%ED%98%B8%EB%9E%91%EC%9D%B4&tqi=h2ZqbwprvhGssDJi56CssssstER-441762"),
        Place(title: "죠지", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%A3%A0%EC%A7%80&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%B6%84%EC%B9%B4%EC%83%A4&tqi=h2Zq6sprvOssslkXuiossssstd8-204024"),
        Place(title: "무네이", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%AC%B4%EB%84%A4%EC%9D%B4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%A3%A0%EC%A7%80&tqi=h2ZqKlprvmZssEDV6slssssssO4-020821"),
        Place(title: "을지빈", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%9D%84%EC%A7%80%EB%B9%88&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%AC%B4%EB%84%A4%EC%9D%B4&tqi=h2ZqnwprvmsssN0ZfIZssssssg8-378376"),
        Place(title: "부스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%B6%80%EC%8A%A4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%9D%84%EC%A7%80%EB%B9%88&tqi=h2Zqflprvxsss5S4d5NssssstMs-391669"),
        Place(title: "스트라다로스터스", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%8A%A4%ED%8A%B8%EB%9D%BC%EB%8B%A4%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%B6%80%EC%8A%A4&tqi=h2ZqRlprvhGssEZiS4wssssssc0-333377"),
        Place(title: "루이스의사물들", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%A3%A8%EC%9D%B4%EC%8A%A4%EC%9D%98%EC%82%AC%EB%AC%BC%EB%93%A4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%A3%A8%EC%9D%B4%EC%8A%A4%EC%99%80%EC%82%AC%EB%AC%BC%EB%93%A4&tqi=h2Zqksprvh8ssjFrdbCssssstIN-211998"),
        Place(title: "4F", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+4f&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EB%A3%A8%EC%9D%B4%EC%8A%A4%EC%9D%98%EC%82%AC%EB%AC%BC%EB%93%A4&tqi=h2ZqNsprvOssslCvwANssssstIl-393894"),
        Place(title: "아트쉬프트", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%95%84%ED%8A%B8%EC%89%AC%ED%94%84%ED%8A%B8&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+4f&tqi=h2ZqPwprvmsssN0eRtwssssstY4-452305"),
        Place(title: "mwm", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+mwm&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%B9%B4%ED%8E%98+%EC%95%84%ED%8A%B8%EC%89%AC%ED%94%84%ED%8A%B8&tqi=h2ZqAdprvmsssN9gPR4ssssssvK-307437"),
        Place(title: "효계", type: "닭요리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%ED%9A%A8%EA%B3%84&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EB%8B%A4%EB%B0%A9+%EC%9D%84%EC%A7%80%EB%8B%A4%EB%B0%A9&tqi=h2ZqqwprvmZssEggenRssssssY4-058011"),
        Place(title: "누공삼", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EB%88%84%EA%B3%B5%EC%82%BC&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%ED%9A%A8%EA%B3%84&tqi=h2ZqYwprvxsss5T8k3Rssssst%2Bo-484934"),
        Place(title: "진작", type: "일식당", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%A7%84%EC%9E%91&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EB%88%84%EA%B3%B5%EC%82%BC&tqi=h2Zq1lprvxZssafp3tsssssssao-235206"),
        Place(title: "을지다락", type: "양식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%9D%84%EC%A7%80%EB%8B%A4%EB%9D%BD&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%A7%84%EC%9E%91&tqi=h2ZqGsprvxZssaPVfV8ssssstIK-434109"),
        Place(title: "산수갑산", type: "순대", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%82%B0%EC%88%98%EA%B0%91%EC%82%B0&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%9D%84%EC%A7%80%EB%8B%A4%EB%9D%BD&tqi=h2ZqJdprvOssslQEToGssssssbC-357390"),
        Place(title: "다케오 호르몬 데판야끼", type: "고기요리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%9D%84%EC%A7%80%EB%A1%9C+%EB%8B%A4%EC%BC%80%EC%98%A4&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EC%82%B0%EC%88%98%EA%B0%91%EC%82%B0&tqi=h2Zq%2BlprvmZssFbhPpVssssstB8-392569")

    ].sorted { $0.title < $1.title }
    
    let yongsan = [
        Place(title: "오잇", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%98%A4%EC%9E%87&oquery=%EC%9D%84%EC%A7%80%EB%A1%9C+%EB%8B%A4%EC%BC%80%EC%98%A4&tqi=h2ZrtdprvN8ssTLOUlVssssst48-184152"),
        Place(title: "쉘터", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%89%98%ED%84%B0+%EC%84%9C%EC%9A%B8%EC%A0%90&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%89%98%ED%84%B0&tqi=h2ZVklprvTVssgmPsMhssssssbZ-301591"),
        Place(title: "빌라커피바", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%B9%8C%EB%9D%BC%EC%BB%A4%ED%94%BC%EB%B0%94&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%89%98%ED%84%B0+%EC%84%9C%EC%9A%B8%EC%A0%90&tqi=h2ZVOsprvOssslSy6PGssssss8w-252519"),
        Place(title: "널담은공간", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%84%90%EB%8B%B4%EC%9D%80%EA%B3%B5%EA%B0%84&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%84%90%EB%8B%B4%EC%9C%BC%EB%86%8D%EA%B0%84&tqi=h2ZVodprvmZssEwCQ1ZsssssttR-337974"),
        Place(title: "홍철책빵", type: "베이커리", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%ED%99%8D%EC%B2%A0%EC%B1%85%EB%B9%B5&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%84%90%EB%8B%B4%EC%9D%80%EA%B3%B5%EA%B0%84&tqi=h2ZVplprvTVssgF%2FlW0sssssso8-497641"),
        Place(title: "hmmmarket", type: "브런치", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+hmmmarket&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%ED%99%8D%EC%B2%A0%EC%B1%85%EB%B9%B5&tqi=h2ZVWdprvxZssa6BgSRssssstv4-430583"),
        Place(title: "더로열푸드앤드링크", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%8D%94%EB%A1%9C%EC%97%B4%ED%91%B8%EB%93%9C%EC%95%A4%EB%93%9C%EB%A7%81%ED%81%AC&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+hmmmarket&tqi=h2ZVysprvmZssEDF5O4ssssstPw-057719"),
        Place(title: "카페타자기", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%B9%B4%ED%8E%98%ED%83%80%EC%9E%90%EA%B8%B0&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%8D%94%EB%A1%9C%EC%97%B4%ED%91%B8%EB%93%9C%EC%95%A4%EB%93%9C%EB%A7%81%ED%81%AC&tqi=h2ZV2dprvxsss5baAZVsssssseC-476463"),
        Place(title: "버터북", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%B2%84%ED%84%B0%EB%B6%81&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%B9%B4%ED%8E%98%ED%83%80%EC%9E%90%EA%B8%B0&tqi=h2ZVIdprvmsssNpWU2RssssstTR-290107"),
        Place(title: "스마비", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%8A%A4%EB%A7%88%EB%B9%84&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%B2%84%ED%84%B0%EB%B6%81&tqi=h2ZV%2BsprvmZssE2LZORssssst9R-034506"),
        Place(title: "오우야 에스프레소바 해방촌", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%98%A4%EC%9A%B0%EC%95%BC+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C%EB%B0%94&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%8A%A4%EB%A7%88%EB%B9%84&tqi=h2ZWtlprvmZssENuO1hssssssco-209800"),
        Place(title: "오르소에스프레소바", type: "카페", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%98%A4%EB%A5%B4%EC%86%8C&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%98%A4%EC%9A%B0%EC%95%BC+%EC%97%90%EC%8A%A4%ED%94%84%EB%A0%88%EC%86%8C%EB%B0%94&tqi=h2ZWcsprvxsss5ouybCssssssSC-500005"),
        Place(title: "해방식당", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%ED%95%B4%EB%B0%A9%EC%8B%9D%EB%8B%B9&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%98%A4%EB%A5%B4%EC%86%8C&tqi=h2ZWKdprvh8ssj9NmKhssssss2G-207222"),
        Place(title: "에그앤플라워", type: "파스타", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%97%90%EA%B7%B8%EC%95%A4%ED%94%8C%EB%9D%BC%EC%9B%8C&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%ED%95%B4%EB%B0%A9%EC%8B%9D%EB%8B%B9&tqi=h2ZWdwprvOssslgM8gZssssstxV-347672"),
        Place(title: "성광태도", type: "요리주점", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%84%AC%EA%B4%91%ED%83%9C%EB%8F%84&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%97%90%EA%B7%B8%EC%95%A4%ED%94%8C%EB%9D%BC%EC%9B%8C&tqi=h2ZWRdprvxZssaa%2FOfGssssssYV-348315"),
        Place(title: "노스트레스버거", type: "햄버거", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%85%B8%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%8A%A4%EB%B2%84%EA%B1%B0&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%84%AC%EA%B4%91%ED%83%9C%EB%8F%84&tqi=h2ZWUwprvmZssETdae0ssssstuZ-041490"),
        Place(title: "차경", type: "와인", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%B0%A8%EA%B2%BD&oquery=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EB%85%B8%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%8A%A4%EB%B2%84%EA%B1%B0&tqi=h2ZWNsprvmsssOs3yPNssssss2h-091421"),
        Place(title: "소월솥밥", type: "한식", url: "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%ED%95%B4%EB%B0%A9%EC%B4%8C+%EC%86%8C%EC%9B%94%EC%86%A5%EB%B0%A5&oquery=%EC%9A%A9%EC%82%B0%EA%B5%AC+%EC%9A%A9%EC%82%B0%EB%8F%992%EA%B0%80+%EC%82%AC%ED%83%9C&tqi=h2ZWEsprvh8ssj0ndxsssssssjo-486977")

    ].sorted { $0.title < $1.title }
    
    let sections = ["성수/서울숲", "한남","입구정/신사","북촌/서촌","홍대/연남동/연희동","을지로","해방촌"] //7개
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //URLData.sharedInstance.placeType = .seoul
//        placeName = URLData.sharedInstance.placeNames()
//        url = URLData.sharedInstance.url()
        indi.isHidden = true
        self.view.bringSubviewToFront(indi)
    }
    
    //섹션갯수
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
            return Sungsu.count
        }else if section == 1{
            return Hannam.count
        }else if section == 2{
            return Sinsa.count
        }else if section == 3{
            return Bukchon.count
        }else if section == 4{
            return Hongdae.count
        }else if section == 5{
            return EulJiro.count
        }else if section == 6{
            return yongsan.count
        }
        return 30
    }
    //섹션 내 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeoulAreaCell_ID", for: indexPath) as! SeoulAreaCell
    
        if indexPath.section == 0{
            cell.SeoulAreaLabel.text = Sungsu[indexPath.row].title
            cell.TypeLabel.text = Sungsu[indexPath.row].type
        }else if indexPath.section == 1{
            cell.SeoulAreaLabel.text = Hannam[indexPath.row].title
            cell.TypeLabel.text = Hannam[indexPath.row].type

        }else if indexPath.section == 2{
            cell.SeoulAreaLabel.text = Sinsa[indexPath.row].title
            cell.TypeLabel.text = Sinsa[indexPath.row].type

        }else if indexPath.section == 3{
            cell.SeoulAreaLabel.text = Bukchon[indexPath.row].title
            cell.TypeLabel.text = Bukchon[indexPath.row].type

        }else if indexPath.section == 4{
            cell.SeoulAreaLabel.text = Hongdae[indexPath.row].title
            cell.TypeLabel.text = Hongdae[indexPath.row].type

        }else if indexPath.section == 5{
            cell.SeoulAreaLabel.text = EulJiro[indexPath.row].title
            cell.TypeLabel.text = EulJiro[indexPath.row].type

        }else if indexPath.section == 6{
            cell.SeoulAreaLabel.text = yongsan[indexPath.row].title
            cell.TypeLabel.text = yongsan[indexPath.row].type

        }
        return cell
    }
    //테이블뷰 눌렀을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indi.isHidden = false
        indi.startAnimating()
        
        let showVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        showVC.modalPresentationStyle = .automatic
        showVC.urlAddress = Sungsu[indexPath.row].url
        showVC.cityType = "Seoul"
        
        if indexPath.section == 0 {
            showVC.urlAddress = Sungsu[indexPath.row].url
            showVC.areatype = "Sungsu"
        } else if indexPath.section == 1 {
            showVC.urlAddress = Hannam[indexPath.row].url
            showVC.areatype = "Hannam"
        } else if indexPath.section == 2 {
            showVC.urlAddress = Sinsa[indexPath.row].url
            showVC.areatype = "Sinsa"
        }else if indexPath.section == 3 {
            showVC.urlAddress = Bukchon[indexPath.row].url
            showVC.areatype = "Bukchon"
        }else if indexPath.section == 4 {
            showVC.urlAddress = Hongdae[indexPath.row].url
            showVC.areatype = "Hongdae"
        }else if indexPath.section == 5 {
            showVC.urlAddress = EulJiro[indexPath.row].url
            showVC.areatype = "EulJiro"
        }else if indexPath.section == 6 {
            showVC.urlAddress = yongsan[indexPath.row].url
            showVC.areatype = "yongsan"
        }
        self.present(showVC,animated: true){
            self.indi.stopAnimating()
        }
    }
 

   
    
}


