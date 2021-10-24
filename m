Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5724389A5
	for <lists+linux-input@lfdr.de>; Sun, 24 Oct 2021 17:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhJXPKb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Oct 2021 11:10:31 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55764 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231665AbhJXPKa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Oct 2021 11:10:30 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id eeyWmj6mkdfuoeeybmWXwn; Sun, 24 Oct 2021 16:59:58 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635087598; bh=gKMjXidRv+hTtKdP0cTEKHvkvVU5tlKOfJHkhotQeQk=;
        h=From;
        b=xiGAXNMfz1lmVpXXwJHxWy/uYQXqEejEXNRz2v5FZgoTbESpBIuvNycFNKrMIBqId
         EfaiGvavQLF0oX567ihDsjistF0U9A8Ay7B33PZQDl2UK5EBll/xOyWBlmkvk//1kc
         9tDdgHOWNR2u8kXw+7j79B5g14vFbq471WyXcAv/ZXHT+q1zfDbN9jQBSGumddicjV
         SR2ftV6akRsmMGgSETsxwiTf8AqrLHxgaGQPFdjnN+d8SiqPEOTWNCZYehL7DAxdXP
         tBGcnKBKCMgLEpANgjUFqDOpCNVPD9IsUzVOchgK+//gtmyEuDjba5VPPaK2oRdEUD
         AaBQiVXdlWUtA==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=617574ee cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=VZkyjkMPts0tdjHXfkQA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/6] input: ti_am335x_tsc: lower the X and Y sampling time
Date:   Sun, 24 Oct 2021 16:59:27 +0200
Message-Id: <20211024145931.1916-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024145931.1916-1-dariobin@libero.it>
References: <20211024145931.1916-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfMVdhLtfg83vJJELVEZQUgLPfSOCgAeUHPnJ0uqOvaJjSPxdNFDp2mVg89wyZw/5MJmQaxRkxAK6NrM9Wp3n7gcol2YLUtS8+/5k5x9fW1Kmt3L/TOvD
 gq2suAyX5umxpBnzBzNhun+cS3rQlQLqxMEXun6WvgCwBpQ0I9okt8PQ17EWnctg1cOAMsNdVARKlmYh18720z1fOVAffcV5iI5Xl2p/8fKF68oiM6k/Je0R
 +ziuBhvwmEmTXLTwzR1TdNpAA79ZmiSh0y8JpiANAfOcHY3Uxx2ZrGHaaz83syCT0UUe42havssytal4ULd4Ivhg603+HZjco2/yOe5MJqF8ajJoP9JbzzHd
 1T/3tG30
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

