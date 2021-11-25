Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C86F45E320
	for <lists+linux-input@lfdr.de>; Thu, 25 Nov 2021 23:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345436AbhKYXBG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 18:01:06 -0500
Received: from smtp-16.italiaonline.it ([213.209.10.16]:39221 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345468AbhKYW7F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 17:59:05 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.92.113])
        by smtp-16.iol.local with ESMTPA
        id qNWimq44e7VizqNWmmmHb4; Thu, 25 Nov 2021 23:47:41 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1637880461; bh=C0EMV/lsq5GhT8XslPYkwJKTMpamyTd3jyXd0/hMrDA=;
        h=From;
        b=RT1uQqn+Ozz/QXNREn2SfJqGUUoFb/kozFlSiY/pjn2MVZmlgLnaMKrbn4poUoZWK
         w+6+O4Dt91MogI5Q5CXgJ9s1wWOl19IYYXHKXFxf5RPpVSUia5/OLYIc9S1noQ8GJj
         MQHykON+zjHi6xggozmypd83IZqu1AeL1l7pjAGcocw0aBFiHcMRgrU4qpJZXzBAdH
         q7DwYJ/UmFBoYItmp4nxWXV1ifpuI2GaXYjH9lUvgI3PZ+qVdK0fHf7ahlEOVUNSKA
         EoqnnLPCqmgNQcBt8BHv0LvSayWE3id5b92Q3SWAxtaddPpvYpOmki2xtWMVWuW6M7
         4WJEDkIY3Sebw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61a0128d cx=a_exe
 a=GpwmefRDj0jp2XoEX/Ct1w==:117 a=GpwmefRDj0jp2XoEX/Ct1w==:17
 a=tYUMCb69UOylhIbTagwA:9
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
Subject: [PATCH v2 0/4] input: touchscreen: am335x: fix and improvements
Date:   Thu, 25 Nov 2021 23:46:38 +0100
Message-Id: <20211125224642.21011-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfPMTzI5IDSdWS1dG5FPW60MvJHxNf8Jn69AqmWHdquHfniOK9NSYpqHujCBTY5w8SZ2CSMCCs4pispBp+NgovHCkKi1SYVgcKQH0Dj5BTphegPI0bqez
 Uzp+YFsE0hRyVOfoyzDoN3781zOxHm0CwjL/UuBqrKU0EKL93vKBhXAohbk+o12dn6KnM9jCetVrFFE12lCp87plMBJjWDfslPINDjaQqmW+Cc3wcbcjcvlX
 Qj7j4dXTWYUic12KTrKV0uOT6YzDMpm2mYapf+UDF3kde1z3l/ThdVPcMG4uVBPPgAAk9LoJP8AM5Kgm4FiL8M8cwixf03TKyGTL7n1W5aiQFExn2fbXp7gf
 fHc9Pp8wAyrSZf+UsGq0deWTq08nrJ5cC90sgDdggwCftTOKMV1GdUdp73NkWIPbS+fPwwa+CaH9iXNEr4WjkJ767cpdnhQygx9QFM+aOF5Zrjvsa3V9a8S7
 3u0ESnodQvplSy5PMxuUHeqz1xHq5gn23ltyQnoHJU77lPXe7wzEKD0Md38/cRFoDpbbIlw5KH2CFYDIomQsI7s+VsO09dTzsWh3+G5AxuAb1f9OQhNcwlRB
 f2ZztHDZHR6rM/oHRpe1vagfXH95cRBARFHMNr4gYe4ylDpr8Hx/3+j2yMU9lRI7yFN7z0IstbByY19seMRSejPjn2rthP8n4FIW1Ga7H0gkpg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


This series grew out of a touchscreen validation activity on a custom
board. Oscilloscope measurements and driver source analysis led to these
patches.

Changes in v2:
- Rebase the series onto v5.16-rc2
- Replace CNTRLREG_8WIRE with CNTRLREG_TSC_8WIRE. In the meantime, the
  file ti_am335x_tscadc.h has been modified, so the patch must be
  updated.
- Drop patch 4/6 ("dt-bindings: input: ti-tsc-adc: fix tsc node example")
- Drop patch 5/6 ("mfd: ti_am335x_tscadc: fix reading a tsc property from DT")

Dario Binacchi (4):
  input: ti_am335x_tsc: set ADCREFM for X configuration
  input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
  input: ti_am335x_tsc: lower the X and Y sampling time
  mfd: ti_am335x_tscadc: drop the CNTRLREG_TSC_8WIRE macro

 drivers/input/touchscreen/ti_am335x_tsc.c | 18 +++++++++++++-----
 include/linux/mfd/ti_am335x_tscadc.h      |  1 -
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.17.1

