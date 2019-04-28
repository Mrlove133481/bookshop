package com.mrlove.bookshop.common.domain;

import javax.servlet.http.HttpSession;
import java.net.HttpCookie;

public class SnAndRt {
    private HttpSession httpSession;
   // private HttpCookie httpCookie;

    public SnAndRt() {
    }

    public SnAndRt(HttpSession httpSession) {
        this.httpSession = httpSession;
      //  this.httpCookie = httpCookie;
    }

    public HttpSession getHttpSession() {
        return httpSession;
    }

    public void setHttpSession(HttpSession httpSession) {
        this.httpSession = httpSession;
    }
/*

    public HttpCookie getHttpCookie() {
        return httpCookie;
    }

    public void setHttpCookie(HttpCookie httpCookie) {
        this.httpCookie = httpCookie;
    }
*/

    /*@Override
    public String toString() {
        return "SnAndRt{" +
                "httpSession=" + httpSession +
                ", httpCookie=" + httpCookie +
                '}';
    }*/
}
