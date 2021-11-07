Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F444472B1
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhKGL1T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:27:19 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55594 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234628AbhKGL1T (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:27:19 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgGomjsRY; Sun, 07 Nov 2021 12:23:36 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284216; bh=gKMjXidRv+hTtKdP0cTEKHvkvVU5tlKOfJHkhotQeQk=;
        h=From;
        b=YwIXf9wJjMtTIBb+87KE/0YFUYQfotTISc6OlABtKnH3Jgray7OfUW6Zak1P6RUja
         1g2Q0PDLVkbA/Fsj7WEVHDvzGUy6rW6U69ZpCl4nK3gyQDM7bqgrgBXyyUXQXpuFdg
         fLC0I/CN7q3d2DpGUimHwxACHsw3LAEy+8/YQdSDMVXPr3L/LO4gjEUJlWP25iV+x3
         4c26p0pFrMJCA0TaR2vc/0duOhgSE+up3fcYkte/pdtFTqI8O+IKKxfDpL1vCJ4Hcc
         aww+oyg+x/phOi359CiX0BatIDTS8nrM/NLz1SBgTE72uPoR4fIU3yMofC5ZCjC1dG
         BRvDj5zfsXYEw==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b738 cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=VZkyjkMPts0tdjHXfkQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [RESEND PATCH 3/6] input: ti_am335x_tsc: lower the X and Y sampling time
Date:   Sun,  7 Nov 2021 12:22:33 +0100
Message-Id: <20211107112236.7969-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfHIfLyoeARe7sVqFZzLANFZI79BfN07+a5RpAlTOxwcYM1OUaxGCLePLWxax2lPBeXeQBcd5OUmbF0C7SKw3bwvMqH6Q6kaSjfjf0C9fdbGUY5CFKf+b
 lrqsVLWYR/BR+yubMBX20sbtR4a3vLm2g95nC08AYKC6oxahN1bf2nmx/ZXg78zVpghsY8GunZr9P2Ct+EI3WlqzG0O21RnMdmIQxlRuyXqTvBXf3QyNyCQQ
 K4Q+qEuHBtPyS9FQEKHNGec4XmS7TJZblG62iTM1jBo8XncZOJC7Xe39+PQHT5qKu6QeFxYqVmFz9hK3sPz7SIO/sj2RCMaw/9hjNixBaaarB4dSfY+QxF/Y
 tqRI4O2Xz3QRR6x7yvt+518kImD7l4UiZpTn+dhHADDwPzvc3cRow7hmDLGN/VeEIm+UXFrGXXTq4FAbL0fnmfmgfV1CeQ==
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

