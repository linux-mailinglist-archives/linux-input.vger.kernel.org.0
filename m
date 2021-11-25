Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BA445E31E
	for <lists+linux-input@lfdr.de>; Thu, 25 Nov 2021 23:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348464AbhKYXBF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 18:01:05 -0500
Received: from smtp-16.italiaonline.it ([213.209.10.16]:35207 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345426AbhKYW7F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 17:59:05 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.92.113])
        by smtp-16.iol.local with ESMTPA
        id qNWimq44e7VizqNWommHba; Thu, 25 Nov 2021 23:47:42 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1637880462; bh=hjJJ1fZhVpUryCS9ibJFEx4dC0BCjRfmiHs1Thqyd/Q=;
        h=From;
        b=Q/Nd6NNdkDKg/qUlKlxBz3gz644CmxFdR/wfOCCXCiqdWNCPQO+qwSVewsDIHZyS1
         dxalD7JjKZEcrXtbwRkJ4AzeCH2mjCVLNc6bMRpxZajMHz3zK/7fZqu0c1JNGmzIXo
         EzC4s6/fVmS5VXtENJTpembCV8IsdigFwftuE95diNM0Ut+UXbzQy+LHXuzegLkhPJ
         re/aGbfABZlqlOuIBE6pSLL7XwKRA49jTmQtrC7G+ZXm14itwERGysV4wEB1g9gkSE
         lwbd5Oe0x56Sz3t65qSZ98+pDzjsP9HFA5RSSNsp2MwVcj5Cmf10jYLU8SdsxOjSQy
         XVPbTpmYsr/Kw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61a0128e cx=a_exe
 a=GpwmefRDj0jp2XoEX/Ct1w==:117 a=GpwmefRDj0jp2XoEX/Ct1w==:17
 a=Lf7JvCFZlXs7EqoJDM0A:9
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
Subject: [PATCH v2 1/4] input: ti_am335x_tsc: set ADCREFM for X configuration
Date:   Thu, 25 Nov 2021 23:46:39 +0100
Message-Id: <20211125224642.21011-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125224642.21011-1-dariobin@libero.it>
References: <20211125224642.21011-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfIjIJBF/EBkAIXJbRbYZN5XV7GEYgt8vdiL520FiRRjFv9tibxNSGzUqCbp9gzfblihuHK9iHi7gARfzHRA78fj+agUcNzdp16aYOBzZ1iXOdVMIbN3N
 3zRe+Opp+HIwlO0FlCToRgmTBg8Iy7EUylpoob6V/F1M6kAuKZ5eUnY9zR4/8epmH+O4jHU9wnj/yF2l8gqNtl4F+T6Yo9Ok3D1VyrjT3wycmfQ+NtksjKuA
 4oAzhJ1nuiJHMig0/ZzpALkKI/TiE+sjEW7JMZdVnnbZ3VJGAUBzR3tla7fLZd17YSBkGLoxj7vT7zMUloWrhH5G8EPdBZhonAhk3j2y2E55TYY87pThYRmZ
 Mu2vWKhzsOaLDHDtpFOMtQksgSGK07HNHWv8sGQlgnYOI3hiyd6R7vvNioY7kydUwqf7SI/mWmgf3jcJklSeLW9tHR+4cKQfgK5ErXzg6fXcsW6DR+SxOqw4
 JwV5XGsDiTR6OnVPPkJsPZRQueA3PF/jAgPbQljiFCXu8UEzgs13els2hBk/ovkXwM6FlvyrFuAn6yazXQBfPjH14+d0NChh4MNjm/ZCnMLXiZ/uMteJpotO
 HurRszGCRUB6X7dIdliwX+OtxFFpj6E4Lbcd6pg9V9RrVIT2xUQiMHkULJgf1ddXtH5HJicwh5l8UWh5u4jjijT24gKhEfiVs5yzGHi3KjS80A==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As reported by the STEPCONFIG[1-16] registered field descriptions of the
TI reference manual, for the ADC "in single ended, SEL_INM_SWC_3_0 must
be 1xxx".

Unlike the Y and Z coordinates, this bit has not been set for the step
configuration registers used to sample the X coordinate.

Fixes: 1b8be32e691 ("Input: add support for TI Touchscreen controller")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

 drivers/input/touchscreen/ti_am335x_tsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 83e685557a19..fd3ffdd23470 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -131,7 +131,8 @@ static void titsc_step_config(struct titsc *ts_dev)
 	u32 stepenable;
 
 	config = STEPCONFIG_MODE_HWSYNC |
-			STEPCONFIG_AVG_16 | ts_dev->bit_xp;
+			STEPCONFIG_AVG_16 | ts_dev->bit_xp |
+			STEPCONFIG_INM_ADCREFM;
 	switch (ts_dev->wires) {
 	case 4:
 		config |= STEPCONFIG_INP(ts_dev->inp_yp) | ts_dev->bit_xn;
-- 
2.17.1

