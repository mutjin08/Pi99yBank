package com.hana.controller;

import com.hana.app.data.UserDto;
import com.hana.app.service.KakaoService;
import com.hana.app.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/kakao")
public class KakaoController {
    private final KakaoService kakaoService;
    private final UserService userService;

    @RequestMapping("/access")
    public String callback(@RequestParam("code") String code, HttpServletRequest request, HttpSession httpSession) throws Exception {
        log.info("---------------------" + code);
        UserDto userInfo = kakaoService.getKakaoInfo(code);
        // kakaoInfo로 userdto만들어서 db에 바로 저장하게끔 하면 될 듯
//        return ResponseEntity.ok()
//                .body(new MsgEntity("Success", kakaoInfo));
        // return 값 -> ResponseEntity<MsgEntity>

        httpSession.setAttribute("kakaoInfo", userInfo);
        userService.add(userInfo);
        return "redirect:/main";
    }





}