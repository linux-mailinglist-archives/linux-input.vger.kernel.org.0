Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D65745E32A
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 00:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbhKYXGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 18:06:10 -0500
Received: from smtp-16.italiaonline.it ([213.209.10.16]:59014 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236157AbhKYXEK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 18:04:10 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.92.113])
        by smtp-16.iol.local with ESMTPA
        id qNWimq44e7VizqNWpmmHco; Thu, 25 Nov 2021 23:47:44 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1637880464; bh=I9nLUTq/N/FwQwyX4ZdYepYccPs/T7kCUn7G3ZT1WTI=;
        h=From;
        b=XEfLFo2XD0ciWZgau0NXhJBGI2Dc9yzdobxclUFpzZYYQ+ULTdtLT5T8Jvmd0QOJJ
         kTl9Nn7eCLpUL6729ZDcv/UDjLNNwKjLuZxjRDQ8qz+ZI8kkc2HiDUaOVQ6gsijBSV
         L+08tYbzW0pnEs/ySqaZYiBvZ7/mu6r65DfNDNNu1xZfuqIi3qjehZD0dKGNUYn+le
         rA1LrmAWkYnfX/NOhLQArF2E3QSba+WIog7HfCGaYrdLQSI9KxeR47aqZNmQ+aIl1w
         Nzji3lN4EqOgWAy0nlDf++jEfzF7mMOGz1umZap62oE9L9SHJQaB5+jaOpGtbsOBGc
         YCrEALU3IwKdA==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61a01290 cx=a_exe
 a=GpwmefRDj0jp2XoEX/Ct1w==:117 a=GpwmefRDj0jp2XoEX/Ct1w==:17
 a=HJ_RBZq0nG6KkHQLv6MA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-input@vger.kernel.org, Felipe Balbi <balbi@ti.com>,
        Zubair Lutfullah <zubair.lutfullah@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        "Andrew F . Davis" <afd@ti.com>, Vignesh R <vigneshr@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Brad Griffis <bgriffis@ti.com>,
        Jeff Lance <j-lance1@ti.com>, Rachna Patil <rachna@ti.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [PATCH v2 4/4] mfd: ti_am335x_tscadc: drop the CNTRLREG_TSC_8WIRE macro
Date:   Thu, 25 Nov 2021 23:46:42 +0100
Message-Id: <20211125224642.21011-5-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125224642.21011-1-dariobin@libero.it>
References: <20211125224642.21011-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfGVLr6ntdTCgx6VsGugYMeHKd/kIF2rMD544U4L/6quwm911CIAwT/kRVuu7QxCSClksUcQo6y7PWNCwAW6Xx8GVqxiQ+joMWzbp/hdip0vCApJUBWQE
 VobOKE/72HsMs5u/LJ7x25+dxRkv7sx+kkTy65sWITlGPLjxjqhN55oOUHIsY72aHHnOF+iKXSD/mibWOGN+jNwEfT7GG6Y24k51GJY7cuYAYznAj8NerB+9
 5UQqtycd/8EBSX1jUvyxT1Vb+y7Bkwu6vhGjGX3EGXqxPXvjL99K0kQ4DKuSfx+SaNWK8ajRsYynqHClKbZD7mxaxLgZRaDdubXljN4B2TEpXX+yJCsDNbiS
 pAS3XA1IdbH/VjwwW7tSSW+WtKucVRNWasJUbpQW2zhR8tCsYPMTe5H6DFMyw5uHDgHnmjXcbITPJuLMhi9gfYgWuJ1A0aUaiAeqENt0dT2obkPt60E9yex3
 kPErwH5OpjC68PWNXvQRlWNNVuJmJZ3ybs/6lbH6CBrreW94YvE3hZn3oZydSiry+DDsRQmOwILd+TjseD4Q+FfoK2pVR0YrUgtdrn8sU0tTrZkGM6gNiYCr
 pFo0FfTw5D8DjsrtZQUIFn/sDvRSP1yWySbJxteEf1VBYGgSjKs1+52wAqC/uMIDOG4bedPMqR4hEPvdJFqUGqXns83DwZYIaw9o4mL/eCvpbg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In TI's reference manual description for the `AFE_Pen_Ctrl' bit-field
of the TSC's CTRL register, there is no mention of 8-wire touchscreens.
Even commit f0933a60d190 ("mfd: ti_am335x_tscadc: Update logic in CTRL
register for 5-wire TS") says that the value of this bit-field must be
the same for 4-wire and 8-wire touchscreens. So let's remove the
CNTRLREG_TSC_8WIRE macro to avoid misunderstandings.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v2:
- Replace CNTRLREG_8WIRE with CNTRLREG_TSC_8WIRE. In the meantime, the
  file ti_am335x_tscadc.h has been modified, so the patch must be
  updated.

 include/linux/mfd/ti_am335x_tscadc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mfd/ti_am335x_tscadc.h b/include/linux/mfd/ti_am335x_tscadc.h
index ba13e043d910..4063b0614d90 100644
--- a/include/linux/mfd/ti_am335x_tscadc.h
+++ b/include/linux/mfd/ti_am335x_tscadc.h
@@ -103,7 +103,6 @@
 #define CNTRLREG_TSC_AFE_CTRL(val) FIELD_PREP(GENMASK(6, 5), (val))
 #define CNTRLREG_TSC_4WIRE	CNTRLREG_TSC_AFE_CTRL(1)
 #define CNTRLREG_TSC_5WIRE	CNTRLREG_TSC_AFE_CTRL(2)
-#define CNTRLREG_TSC_8WIRE	CNTRLREG_TSC_AFE_CTRL(3)
 #define CNTRLREG_TSC_ENB	BIT(7)
 
 /*Control registers bitfields  for MAGADC IP */
-- 
2.17.1

