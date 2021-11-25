Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DF145E31F
	for <lists+linux-input@lfdr.de>; Thu, 25 Nov 2021 23:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345426AbhKYXBF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Nov 2021 18:01:05 -0500
Received: from smtp-16.italiaonline.it ([213.209.10.16]:53571 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345311AbhKYW7F (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Nov 2021 17:59:05 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.92.113])
        by smtp-16.iol.local with ESMTPA
        id qNWimq44e7VizqNWpmmHcG; Thu, 25 Nov 2021 23:47:43 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1637880463; bh=yDq7jasZU5HMk6BC4zVUZaRjCjXETEu9kLJD5UINvX8=;
        h=From;
        b=hR3vmXg85++7k7iJVFNJgSH5gF9MESrrkMyQ5T67Bm2ZNWt5H4xXbIWaWZZgXah1/
         iPuqJlQTje6FNXHMhL3zaSsOx7GEUj4hZSOIj1CTsMYLgPi8bXZ50w8l/ht9CoKAX6
         yikEprHM+LHTwFJRTZI435HFy6Y+/QHjFjvkFCRMwA7aZu7ch+AHEV/MOZu+qI6kiw
         K04tu0oQZstW0EgTer3+D3+zJii/tqP+3/4K5OWnZEuoNM3tLakF/5MDomv3QXsPV4
         q83o9LAinfr/ojfWVxbYSmJ/ux3nhxP4J5kNHqxyye3Wlz8EfTp+szmP+nfgqi04V2
         ESk8kdOh4AeiQ==
X-CNFS-Analysis: v=2.4 cv=ftYZ2H0f c=1 sm=1 tr=0 ts=61a0128f cx=a_exe
 a=GpwmefRDj0jp2XoEX/Ct1w==:117 a=GpwmefRDj0jp2XoEX/Ct1w==:17
 a=FZ5NTl4HROsS6fjUIwUA:9
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
Subject: [PATCH v2 3/4] input: ti_am335x_tsc: lower the X and Y sampling time
Date:   Thu, 25 Nov 2021 23:46:41 +0100
Message-Id: <20211125224642.21011-4-dariobin@libero.it>
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

The open delay time has to be applied only on the first sample of the
X/Y coordinates because on the following samples the ADC channel is not
changed. Removing this time from the samples after the first one,
"ti,coordinate-readouts" greater than 1, decreases the total acquisition
time, allowing to increase the number of acquired coordinates in the time
unit.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

 drivers/input/touchscreen/ti_am335x_tsc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index cfc943423241..f4ef218bc1b8 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -126,7 +126,7 @@ static int titsc_config_wires(struct titsc *ts_dev)
 static void titsc_step_config(struct titsc *ts_dev)
 {
 	unsigned int	config;
-	int i;
+	int i, n;
 	int end_step, first_step, tsc_steps;
 	u32 stepenable;
 
@@ -151,9 +151,11 @@ static void titsc_step_config(struct titsc *ts_dev)
 	first_step = TOTAL_STEPS - tsc_steps;
 	/* Steps 16 to 16-coordinate_readouts is for X */
 	end_step = first_step + tsc_steps;
+	n = 0;
 	for (i = end_step - ts_dev->coordinate_readouts; i < end_step; i++) {
 		titsc_writel(ts_dev, REG_STEPCONFIG(i), config);
-		titsc_writel(ts_dev, REG_STEPDELAY(i), STEPCONFIG_OPENDLY);
+		titsc_writel(ts_dev, REG_STEPDELAY(i),
+			     n++ == 0 ? STEPCONFIG_OPENDLY : 0);
 	}
 
 	config = 0;
@@ -175,9 +177,11 @@ static void titsc_step_config(struct titsc *ts_dev)
 
 	/* 1 ... coordinate_readouts is for Y */
 	end_step = first_step + ts_dev->coordinate_readouts;
+	n = 0;
 	for (i = first_step; i < end_step; i++) {
 		titsc_writel(ts_dev, REG_STEPCONFIG(i), config);
-		titsc_writel(ts_dev, REG_STEPDELAY(i), STEPCONFIG_OPENDLY);
+		titsc_writel(ts_dev, REG_STEPDELAY(i),
+			     n++ == 0 ? STEPCONFIG_OPENDLY : 0);
 	}
 
 	/* Make CHARGECONFIG same as IDLECONFIG */
-- 
2.17.1

