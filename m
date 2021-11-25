Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C6545E329
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 00:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243366AbhKYXGK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 18:06:10 -0500
Received: from smtp-16.italiaonline.it ([213.209.10.16]:40684 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235233AbhKYXEJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 18:04:09 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.92.113])
        by smtp-16.iol.local with ESMTPA
        id qNWimq44e7VizqNWommHbv; Thu, 25 Nov 2021 23:47:43 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1637880463; bh=ptDwGmR2DomgLZDZAqtkYDJtZBdppEjWzi0O7HBmzb4=;
        h=From;
        b=E7FECExgxpkOdHMAXFNp8lD5ilH0+mLCD8WjBWUaW4nAAhptnUhuwf+Oa4DUzox1O
         pFwuEQj5/r9XIkmt4aMVvcMO0S0R05nV/mL0rn4XE2xRm+1oeqgeqCfHJj/25LVFB1
         25yW9WrT4kXuJdegOyE//tkh/PsycZk8isA9FYWwwXIcmYY5g3JBFbZTMbAv9TM9J1
         WExzGZE6M+bg12syqxn41cJ8+MBrdtCKMMd6SG5Poa4zNLuvRnXa+ixOhJdHpGeBAo
         3bPakALCs+QjeI4PdNzPu3X2t3BAGQs665eoCMX/jAjAW/mptiluWyJPmD8bXv2R+t
         NC07pOc0Ua0Dw==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61a0128f cx=a_exe
 a=GpwmefRDj0jp2XoEX/Ct1w==:117 a=GpwmefRDj0jp2XoEX/Ct1w==:17
 a=Us_wMsjpGDddDCpAM8cA:9
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
Subject: [PATCH v2 2/4] input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
Date:   Thu, 25 Nov 2021 23:46:40 +0100
Message-Id: <20211125224642.21011-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125224642.21011-1-dariobin@libero.it>
References: <20211125224642.21011-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfKSC1wdv22nOeSHLXj1YvP9HArBMlyOK9WeNxSC7/B0VQzryTpF4NqTSQ612WmR1RwH1iKq4AtSdd2Jlg3oB1jV244hGZOhTLmuj4bzjI54R7/pTtfEc
 lZw30fGKxkK1fBQ/kEgxycxSba+epzCwxJutpKFWMicGRfSvvhDP/bUmyqbkDcJRzAEue/hUvh/Wvsjit5quMbq4ERo6Z4XKSwXyq4utiweQDJpyohJj9xad
 Dr9o6VxHbwpbsE7IIH6k4M9uKDzXV6kcjF3LtBJU7BOWjsbsPFT84958k9dE2To4sGPGLYpeBzZUJ0R663+GXw1pf78SYRFQ3qqIapVyMipAoUEZYsNs4BAJ
 QJOgaMq0bj+MMqpg+1njn/Jk8rfuKA+04ZfNJywm3V/eremPbhLG7Kr4rhjf220aMY1KeLq4MctWRDg7lP9Acjh0hMRQQCtzKEHHQc6dhI2VMCGDdt1PAh44
 i0zM/ULL4iW6gFOEgmkXiCNBKvE71od6ufdDKj6YpAZshcCosW8VL2/y5OnT9SbMl1HxRIPwEkTxlCv/O5sFi2ItxabQJqTKDvBa2fN7np9lKBHEHvMvsjmA
 DY82uHAumoq19WSxHEF8/r9k5VrAwaJApNELWza07HWKPU/1Eursepc56bQu8KP8xxurlnoDESK7yoNYa3wmHIVS6DpGxxtfqrBv5pht/6+A8Q==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Z2 step configuration doesn't erase the SEL_INP_SWC_3_0 bit-field
before setting the ADC channel. This way its value could be corrupted by
the ADC channel selected for the Z1 coordinate.

Fixes: 8c896308fea ("input: ti_am335x_adc: use only FIFO0 and clean up a little")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

 drivers/input/touchscreen/ti_am335x_tsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index fd3ffdd23470..cfc943423241 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -196,7 +196,10 @@ static void titsc_step_config(struct titsc *ts_dev)
 			STEPCONFIG_OPENDLY);
 
 	end_step++;
-	config |= STEPCONFIG_INP(ts_dev->inp_yn);
+	config = STEPCONFIG_MODE_HWSYNC |
+			STEPCONFIG_AVG_16 | ts_dev->bit_yp |
+			ts_dev->bit_xn | STEPCONFIG_INM_ADCREFM |
+			STEPCONFIG_INP(ts_dev->inp_yn);
 	titsc_writel(ts_dev, REG_STEPCONFIG(end_step), config);
 	titsc_writel(ts_dev, REG_STEPDELAY(end_step),
 			STEPCONFIG_OPENDLY);
-- 
2.17.1

