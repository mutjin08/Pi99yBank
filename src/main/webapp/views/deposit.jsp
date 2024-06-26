<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    $(document).ready(function () {
        $('.ProductFilter_item__PhP2B').click(function () {
            // data-nclicks 속성값을 가져옵니다.
            var nclicksValue = $(this).data('nclicks');

            // data-nclicks 값이 'deposit.benefit'인 경우에만 처리합니다.
            if (nclicksValue === 'deposit.benefit') {
                // 체크박스 디파짓 베네피트 요소를 찾습니다.
                var depositBenefitCheckbox = $('#checkbox-depositBenefit');

                // 체크박스가 보이는 상태인지 확인합니다.
                if (depositBenefitCheckbox.is(":visible")) {
                    // 보이는 상태라면 숨깁니다.
                    depositBenefitCheckbox.hide();
                } else {
                    // 안 보이는 상태라면 보이게 합니다.
                    depositBenefitCheckbox.show();
                }
            }
        });

        // 체크된 체크박스의 값을 저장할 배열을 선언합니다.
        // var checkedValues = [];


    });
        // li 요소를 클릭했을 때
    let checkbox = {
        click : function () {
            $('.ProductButtonBoxFilter_item__RIt_0').click(function () {
                // 해당 li 요소에 ProductButtonBoxFilter_is-checked__OueIY 클래스를 토글합니다.
                $(this).toggleClass('ProductButtonBoxFilter_is-checked__OueIY');

                // 체크된 체크박스의 값을 업데이트합니다.
                checkbox.update();
            });

        },
        update : function(){
            let checkedValues = []; // 배열 초기화

            // 모든 체크박스를 선택합니다.
            $('.ProductButtonBoxFilter_item__RIt_0 input[type="checkbox"]').each(function () {
                // 체크박스가 체크되어 있는지 확인합니다.
                if ($(this).is(':checked')) {
                    // 체크된 체크박스의 값을 가져와서 배열에 추가합니다.
                    var values = $(this).val(); // 해당 체크박스의 value값을 가져옵니다.
                    checkedValues.push(values);
                }
            });

            // 체크된 값들을 출력합니다.
            console.log("체크된 값들:", checkedValues);
            if(checkedValues.length > 0){
                checkbox.get(checkedValues);

            }

        },
        get : function(checkedValues){
            console.log(checkedValues);

            $.ajax({
                url: '/deposit/benefit',
                data: {"termclassList": checkedValues},
                success: function (res) {
                    var dynamicHTML = '';
                    res.forEach(function(product) {
                        dynamicHTML += '<li class="ProductList_item__QXNrf">';
                        dynamicHTML += '<a class="ProductList_link__pMmxO" data-nclicks="deposit.listing" href="#">';
                        dynamicHTML += '<div class="ProductInfo_article__HX1ob">';
                        dynamicHTML += '<span class="ProductInfo_bi-circle__ngPKu">';
                        dynamicHTML += '<span class="sc-dmyCSP hQyNX bi-element" style="width: 42px; height: 42px;">';
                        dynamicHTML += '<img src="" alt="' + product.finPrdtCd + '" width="42" height="42" loading="eager">';
                        dynamicHTML += '</span></span>';
                        dynamicHTML += '<div class="ProductInfo_area-info__LPXq9">';
                        dynamicHTML += '<div class="ProductInfo_info-text__3Bv24">';
                        dynamicHTML += '<div class="ProductInfo_title-box__rhHbP">';
                        dynamicHTML += '<strong class="ProductInfo_title__tomzd">' + product.finPrdtNm + '</strong>';
                        dynamicHTML += '</div>';
                        dynamicHTML += '<p class="ProductInfo_bank-name__UNj3m">' + product.korCoNm + '</p>';
                        dynamicHTML += '</div>';
                        dynamicHTML += '<div class="ProductInfo_info-rates__h8fgP">';
                        dynamicHTML += '<em class="ProductInfo_top-rate__JKyeA">최고 <b class="ProductInfo_number__KjJso">최고금리</b><span class="ProductInfo_percent__3571f">%</span></em>';
                        dynamicHTML += '<span class="ProductInfo_rate__ruWXq">기본금리%</span>';
                        dynamicHTML += '</div></div></div></a></li>';
                    });

                    // 동적 생성된 HTML 코드를 원하는 위치에 삽입
                    $('#depositList').html(dynamicHTML);
                },
                error: function () {
                    console.log(e);
                }
            });
        }
    }

  $(function (){
      checkbox.click();
  })
</script>
<div class="ProductFilterSection_article__0nJDV">
    <ul>
        <li data-nclicks="deposit.benefit" class="ProductFilter_item__PhP2B">
            <button type="button"
                    class="ProductFilter_button___BQM5 ProductFilter_type-expand___jUS2">우대조건
                <svg width="10" height="6" viewBox="0 0 10 6" fill="none">
                    <path d="m1 1 4 4 4-4" stroke="#bbbbb0" stroke-width="1.2"
                          stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
            </button>
        </li>
    </ul>
    <div class="ProductFilter_pc-scroll-button-wrapper__wtani">
        <div class="PcScrollButton_article__R0n47 PcScrollButton_left__Vwio6">
            <button type="button" class="PcScrollButton_button__8YJq3">
                <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <path d="m3 1.2 4 3.828-4 3.809" stroke="#1e1e23" stroke-width="1.2"
                          stroke-linejoin="round"></path>
                </svg>
                <span class="blind">왼쪽 스크롤</span></button>
        </div>
        <div class="PcScrollButton_article__R0n47 PcScrollButton_right__dDmM_">
            <button type="button" class="PcScrollButton_button__8YJq3">
                <svg width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <path d="m3 1.2 4 3.828-4 3.809" stroke="#1e1e23" stroke-width="1.2"
                          stroke-linejoin="round"></path>
                </svg>
                <span class="blind">오른쪽 스크롤</span></button>
        </div>
    </div>
</div>
<div id="checkbox-depositBenefit" class="ProductButtonBoxFilter_article__Jetia" style="display: none;">
    <div class="ProductButtonBoxFilter_inner__G7UCr">
        <ul class="ProductButtonBoxFilter_list__hkcbi">
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-online" value="9"><label
                    for="checkbox-online" class="ProductButtonBoxFilter_label__OOSMj">비대면가입<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-bankApp" value="2"><label
                    for="checkbox-bankApp" class="ProductButtonBoxFilter_label__OOSMj">은행앱사용<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-usingSalaryAccount" value="4"><label
                    for="checkbox-usingSalaryAccount" class="ProductButtonBoxFilter_label__OOSMj">급여연동<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-pension" value="6"><label
                    for="checkbox-pension" class="ProductButtonBoxFilter_label__OOSMj">연금<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-usingUtilityBill" value="5"><label
                    for="checkbox-usingUtilityBill" class="ProductButtonBoxFilter_label__OOSMj">공과금연동<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-usingCard" value="8"><label
                    for="checkbox-usingCard" class="ProductButtonBoxFilter_label__OOSMj">카드사용<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-firstBanking" value="1"><label
                    for="checkbox-firstBanking" class="ProductButtonBoxFilter_label__OOSMj">첫거래<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-depositAccount" value="7"><label
                    for="checkbox-depositAccount"
                    class="ProductButtonBoxFilter_label__OOSMj">입출금통장<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
            <li class="ProductButtonBoxFilter_item__RIt_0"><input type="checkbox"
                                                                  name="product_type" class="hidden"
                                                                  id="checkbox-depositAgain" value="3"><label
                    for="checkbox-depositAgain" class="ProductButtonBoxFilter_label__OOSMj">재예치<span
                    class="ProductButtonBoxFilter_icon__cz1Fg" aria-hidden="true"><svg width="10"
                                                                                       height="10"
                                                                                       viewBox="0 0 10 10"><path
                    fill="#dcdee0" d="M0 4.616h10v1H0z"></path><path fill="#dcdee0"
                                                                     d="M4.615 0h1v10h-1z"></path></svg></span></label>
            </li>
        </ul>
    </div>
    <p class="ProductButtonBoxFilter_guide__a8Csp">*신협 상품에는 적용되지 않습니다</p>
</div>
<div class="ProductFilterTags_article__LS1Oc">
    <div class="ProductFilterTags_area-keyword__AmEYF">
        <button type="button" class="ProductFilterTags_button__6cYTY"
                data-nclicks="deposit.selectfilterdelete">1금융권
            <svg width="10" height="9" viewBox="0 0 10 9">
                <path d="m1.152.653 7.784 7.784M8.936.653 1.152 8.437" stroke="#f6f8fa"></path>
            </svg>
            <span class="blind">삭제</span></button>
        <button type="button" class="ProductFilterTags_button__6cYTY"
                data-nclicks="deposit.selectfilterdelete">누구나가입
            <svg width="10" height="9" viewBox="0 0 10 9">
                <path d="m1.152.653 7.784 7.784M8.936.653 1.152 8.437" stroke="#f6f8fa"></path>
            </svg>
            <span class="blind">삭제</span></button>
    </div>
    <button type="button" class="ProductFilterTags_button-reset__2MVZg"
            data-nclicks="deposit.filterrefresh">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
             xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M3.28857 12.0112C3.28857 7.20918 7.14749 3.29985 11.9268 3.29985C15.7892 3.29985 19.0514 5.85403 20.1602 9.36711L18.4436 9.90886C17.5616 7.11406 14.972 5.09985 11.9268 5.09985C8.15775 5.09985 5.08857 8.18707 5.08857 12.0112L3.28857 12.0112Z"
                  fill="#767678"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M20.3171 4.89256C20.5691 4.64057 21 4.81904 21 5.1754V9.92297C21 10.1439 20.8209 10.323 20.6 10.323H15.8524C15.496 10.323 15.3176 9.89211 15.5696 9.64012L20.3171 4.89256Z"
                  fill="#767678"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M20.7114 12.3511C20.7114 17.1531 16.8525 21.0625 12.0732 21.0625C8.21085 21.0625 4.94859 18.5083 3.83984 14.9952L5.55638 14.4534C6.43844 17.2482 9.02801 19.2625 12.0732 19.2625C15.8422 19.2625 18.9114 16.1752 18.9114 12.3511H20.7114Z"
                  fill="#767678"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
                  d="M3.68287 19.4697C3.43089 19.7217 3.00003 19.5433 3.00003 19.1869L3.00003 14.4393C3.00003 14.2184 3.17912 14.0393 3.40003 14.0393L8.1476 14.0393C8.50396 14.0393 8.68242 14.4702 8.43044 14.7222L3.68287 19.4697Z"
                  fill="#767678"></path>
        </svg>
        <span class="blind">검색어 초기화</span></button>
</div>


<div class="ProductListSection_article__kDyT3"><h3 class="blind">은행상품 목록</h3>
    <div class="ProductListHeader_area-filter-info__9YO5n"><strong
            class="ProductListHeader_count__xQGto"><span
            class="ProductListHeader_highlight__V_U8l">114</span>개</strong>
        <div>
            <div class="ProductListHeader_sign-up__WJREC"><input type="checkbox" class="hidden"
                                                                 id="is-brokerage"><label
                    for="is-brokerage" class="ProductListHeader_label__DnQBc"
                    data-nclicks="deposit.easyjoin_filter"><span
                    class="ProductListHeader_icon-check__F3yc3"><svg width="18" height="18"
                                                                     viewBox="0 0 22 22"><g fill="none"
                                                                                            fill-rule="evenodd"><circle
                    cx="11" cy="11" r="10.5" fill="none" stroke="#bbbbbd"></circle><path fill="#bbbbbd"
                                                                                         d="M9.013 15.429c-.18 0-.354-.07-.483-.198L5.2 11.937c-.128-.126-.2-.298-.2-.477 0-.18.072-.351.2-.477.268-.264.698-.264.966 0l2.847 2.814 6.82-6.743c.268-.264.699-.264.966 0 .128.126.2.298.2.478s-.072.351-.2.477l-7.302 7.222c-.13.128-.303.199-.484.198"></path></g></svg></span><span
                    class="ProductListHeader_icon-npay__U1duM"><svg width="45" height="15"
                                                                    viewBox="0 0 66 22" fill="none"
                                                                    xmlns="http://www.w3.org/2000/svg"><path
                    d="M22 11C22 13.1756 21.3549 15.3023 20.1462 17.1113C18.9375 18.9202 17.2195 20.3301 15.2095 21.1627C13.1995 21.9952 10.9878 22.2131 8.85401 21.7886C6.72022 21.3642 4.76021 20.3166 3.22183 18.7782C1.68345 17.2398 0.635805 15.2798 0.211368 13.146C-0.213069 11.0122 0.00476298 8.80047 0.837327 6.79048C1.66989 4.78049 3.07979 3.06253 4.88873 1.85383C6.69768 0.645137 8.82441 0 11 0C13.9174 0 16.7153 1.15893 18.7782 3.22183C20.8411 5.28473 22 8.08262 22 11ZM12.8398 5.83V11.3602L8.98976 5.83H5.83V16.1838H9.1575V10.637L13.0075 16.17H16.1783V5.83H12.8398Z"
                    fill="#767678"></path><path
                    d="M61.4319 5.21944L58.3913 12.1478L54.9518 5.21944H52.3072L57.1783 14.8317L55.1703 19.3358H57.7384L64 5.2331L61.4319 5.21944ZM50.6171 15.9331H48.1037V14.9328C47.1894 15.7342 46.0108 16.1685 44.7953 16.1518C41.7901 16.1518 39.4379 13.692 39.4379 10.5763C39.4379 7.46057 41.7874 5.00079 44.7953 5.00079C46.0104 4.9833 47.189 5.41657 48.1037 6.21701V5.21944H50.6171V15.9331ZM48.3987 10.5899C48.3987 8.57019 46.9891 7.03694 45.1204 7.03694C43.2517 7.03694 41.842 8.57019 41.842 10.5899C41.842 12.6097 43.249 14.1429 45.1204 14.1429C46.9918 14.1429 48.3987 12.596 48.3987 10.5899ZM27.0082 19.3358H29.6309V15.023C30.5282 15.7695 31.6631 16.1699 32.83 16.1518C35.8352 16.1518 38.1901 13.692 38.1901 10.5763C38.1901 7.46057 35.8379 5.00079 32.83 5.00079C31.6117 4.9789 30.429 5.4126 29.5134 6.21701V5.21944H27L27.0082 19.3358ZM32.5186 7.03694C34.3872 7.03694 35.7969 8.57019 35.7969 10.5899C35.7969 12.6097 34.3872 14.1429 32.5186 14.1429C30.6499 14.1429 29.2402 12.6097 29.2402 10.5899C29.2402 8.57019 30.6335 7.03694 32.5186 7.03694Z"
                    fill="#767678"></path></svg><span
                    class="blind">네이버 페이</span></span>간편가입</label><span
                    class="BubbleTooltip_article__HszaS BubbleTooltip_bottom__C1uhc"
                    style="left: 9px; margin-top: 2px;"><span class="BubbleTooltip_tooltip__h3rx4"><span
                    class="BubbleTooltip_inner__h8sgU"><em>네이버 아이디</em>로 간편하게!</span></span></span>
            </div>
            <button class="ProductListHeader_button-select___A4vQ">최고금리순
                <svg width="10" height="6" viewBox="0 0 10 6" fill="none">
                    <path d="m1 1 4 4 4-4" stroke="#767678" stroke-width="1.2" stroke-linecap="round"
                          stroke-linejoin="round"></path>
                </svg>
            </button>
        </div>
    </div>
    <ul id="depositList">
        <c:forEach items="${all}" var="product">
            <li class="ProductList_item__QXNrf">
                    <%--                    --%>
                <a class="ProductList_link__pMmxO" data-nclicks="deposit.listing" href="#">
                    <div class="ProductInfo_article__HX1ob">
                <span class="ProductInfo_bi-circle__ngPKu">
                    <span class="sc-dmyCSP hQyNX bi-element" style="width: 42px; height: 42px;">
                        <img src="" alt="${product.finPrdtCd}" width="42" height="42" loading="eager">
                    </span>
                </span>
                        <div class="ProductInfo_area-info__LPXq9">
                            <div class="ProductInfo_info-text__3Bv24">
                                <div class="ProductInfo_title-box__rhHbP">
                                    <strong class="ProductInfo_title__tomzd">${product.finPrdtNm}</strong>
                                </div>
                                <p class="ProductInfo_bank-name__UNj3m">${product.korCoNm}</p>
                            </div>
                            <div class="ProductInfo_info-rates__h8fgP">
                                <em class="ProductInfo_top-rate__JKyeA">
                                    최고 <b class="ProductInfo_number__KjJso">최고금리</b>
                                    <span class="ProductInfo_percent__3571f">%</span>
                                </em>
                                <span class="ProductInfo_rate__ruWXq">기본 금리%</span>
                            </div>
                        </div>
                            <%--                            <ul class="TagList_article__gRL9O ProductInfo_area-tag__6a4Nt">--%>
                            <%--                                <c:forEach items="${product.tags}" var="tag">--%>
                            <%--                                    <li class="TagList_tag__xQBbK">${tag}</li>--%>
                            <%--                                </c:forEach>--%>
                            <%--                            </ul>--%>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>
    <div class="Pagination_article__Rg8y3">
        <ul class="Pagination_list__XfpSy">
            <li class="Pagination_item__afma0" data-nclicks="deposit.listpage">
                <button type="button"
                        class="Pagination_button-page__fhmTR Pagination_is-current___uUHI">1<span
                        class="blind">페이지로 이동</span></button>
            </li>
            <li class="Pagination_item__afma0" data-nclicks="deposit.listpage">
                <button type="button" class="Pagination_button-page__fhmTR">2<span
                        class="blind">페이지로 이동</span></button>
            </li>
            <li class="Pagination_item__afma0" data-nclicks="deposit.listpage">
                <button type="button" class="Pagination_button-page__fhmTR">3<span
                        class="blind">페이지로 이동</span></button>
            </li>
            <li class="Pagination_item__afma0" data-nclicks="deposit.listpage">
                <button type="button" class="Pagination_button-page__fhmTR">4<span
                        class="blind">페이지로 이동</span></button>
            </li>
            <li class="Pagination_item__afma0" data-nclicks="deposit.listpage">
                <button type="button" class="Pagination_button-page__fhmTR">5<span
                        class="blind">페이지로 이동</span></button>
            </li>
        </ul>
        <div class="Pagination_area-button__4IHU3">
            <button type="button" disabled="" data-nclicks="deposit.listpre"
                    class="Pagination_button__ukte8 Pagination_prev__EUF2_ Pagination_disabled__piP6E">
                <span class="blind">이전페이지</span></button>
            <button type="button" data-nclicks="deposit.listnext"
                    class="Pagination_button__ukte8 Pagination_next__2yfET"><span
                    class="blind">다음페이지</span></button>
        </div>
    </div>
</div>
</div>
<script src="https://financial.pstatic.net/savings/_next/static/chunks/2c27f6e1-3ea448d62dcba154.js"></script>
<script src="https://financial.pstatic.net/savings/_next/static/chunks/pages/detail/%5BproductCode%5D-66d92cc6917edbdf.js"></script>