Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D29542507E
	for <lists+linux-input@lfdr.de>; Thu,  7 Oct 2021 11:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhJGJ72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Oct 2021 05:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhJGJ72 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Oct 2021 05:59:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FB6C061762
        for <linux-input@vger.kernel.org>; Thu,  7 Oct 2021 02:57:34 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mYQ9a-0001oY-EZ; Thu, 07 Oct 2021 11:57:30 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1mYQ9Z-0007hx-Gq; Thu, 07 Oct 2021 11:57:29 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Jander <david@protonic.nl>
Subject: [PATCH v1] Input: resistive-adc-touch - fix division by zero error on z1 == 0
Date:   Thu,  7 Oct 2021 11:57:27 +0200
Message-Id: <20211007095727.29579-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For proper pressure calculation we need at least x and z1 to be non
zero. Even worse, in case z1 we may run in to division by zero
error.

Fixes: 60b7db914ddd ("Input: resistive-adc-touch - rework mapping of channels")
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../input/touchscreen/resistive-adc-touch.c   | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/resistive-adc-touch.c b/drivers/input/touchscreen/resistive-adc-touch.c
index 744544a723b7..6f754a8d30b1 100644
--- a/drivers/input/touchscreen/resistive-adc-touch.c
+++ b/drivers/input/touchscreen/resistive-adc-touch.c
@@ -71,19 +71,22 @@ static int grts_cb(const void *data, void *private)
 		unsigned int z2 = touch_info[st->ch_map[GRTS_CH_Z2]];
 		unsigned int Rt;
 
-		Rt = z2;
-		Rt -= z1;
-		Rt *= st->x_plate_ohms;
-		Rt = DIV_ROUND_CLOSEST(Rt, 16);
-		Rt *= x;
-		Rt /= z1;
-		Rt = DIV_ROUND_CLOSEST(Rt, 256);
-		/*
-		 * On increased pressure the resistance (Rt) is decreasing
-		 * so, convert values to make it looks as real pressure.
-		 */
-		if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
-			press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
+		if (likely(x && z1)) {
+			Rt = z2;
+			Rt -= z1;
+			Rt *= st->x_plate_ohms;
+			Rt = DIV_ROUND_CLOSEST(Rt, 16);
+			Rt *= x;
+			Rt /= z1;
+			Rt = DIV_ROUND_CLOSEST(Rt, 256);
+			/*
+			 * On increased pressure the resistance (Rt) is
+			 * decreasing so, convert values to make it looks as
+			 * real pressure.
+			 */
+			if (Rt < GRTS_DEFAULT_PRESSURE_MAX)
+				press = GRTS_DEFAULT_PRESSURE_MAX - Rt;
+		}
 	}
 
 	if ((!x && !y) || (st->pressure && (press < st->pressure_min))) {
-- 
2.30.2

