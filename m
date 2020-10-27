Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47AF529AA14
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 11:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898734AbgJ0Kz1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 06:55:27 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44781 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898733AbgJ0KzZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 06:55:25 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kXMdM-0003lm-Ej; Tue, 27 Oct 2020 11:55:20 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kXMdL-0006Vj-4U; Tue, 27 Oct 2020 11:55:19 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     David Jander <david@protonic.nl>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v2] Input: touchscreen: ads7846.c: Fix race that causes missing releases
Date:   Tue, 27 Oct 2020 11:54:16 +0100
Message-Id: <20201027105416.18773-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: David Jander <david@protonic.nl>

If touchscreen is released while busy reading HWMON device, the release
can be missed. The IRQ thread is not started because no touch is active
and BTN_TOUCH release event is never sent.

Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
Co-Developed-by: David Jander <david@protonic.nl>
Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/input/touchscreen/ads7846.c | 44 +++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index f2dc2c8ab5ec..4164a9834b59 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -199,6 +199,26 @@ struct ads7846 {
 #define	REF_ON	(READ_12BIT_DFR(x, 1, 1))
 #define	REF_OFF	(READ_12BIT_DFR(y, 0, 0))
 
+static int get_pendown_state(struct ads7846 *ts)
+{
+	if (ts->get_pendown_state)
+		return ts->get_pendown_state();
+
+	return !gpio_get_value(ts->gpio_pendown);
+}
+
+static void ads7846_report_pen_up(struct ads7846 *ts)
+{
+	struct input_dev *input = ts->input;
+
+	input_report_key(input, BTN_TOUCH, 0);
+	input_report_abs(input, ABS_PRESSURE, 0);
+	input_sync(input);
+
+	ts->pendown = false;
+	dev_vdbg(&ts->spi->dev, "UP\n");
+}
+
 /* Must be called with ts->lock held */
 static void ads7846_stop(struct ads7846 *ts)
 {
@@ -215,6 +235,10 @@ static void ads7846_stop(struct ads7846 *ts)
 static void ads7846_restart(struct ads7846 *ts)
 {
 	if (!ts->disabled && !ts->suspended) {
+		/* Check if pen was released since last stop */
+		if (ts->pendown && !get_pendown_state(ts))
+			ads7846_report_pen_up(ts);
+
 		/* Tell IRQ thread that it may poll the device. */
 		ts->stopped = false;
 		mb();
@@ -606,14 +630,6 @@ static const struct attribute_group ads784x_attr_group = {
 
 /*--------------------------------------------------------------------------*/
 
-static int get_pendown_state(struct ads7846 *ts)
-{
-	if (ts->get_pendown_state)
-		return ts->get_pendown_state();
-
-	return !gpio_get_value(ts->gpio_pendown);
-}
-
 static void null_wait_for_sync(void)
 {
 }
@@ -868,16 +884,8 @@ static irqreturn_t ads7846_irq(int irq, void *handle)
 				   msecs_to_jiffies(TS_POLL_PERIOD));
 	}
 
-	if (ts->pendown && !ts->stopped) {
-		struct input_dev *input = ts->input;
-
-		input_report_key(input, BTN_TOUCH, 0);
-		input_report_abs(input, ABS_PRESSURE, 0);
-		input_sync(input);
-
-		ts->pendown = false;
-		dev_vdbg(&ts->spi->dev, "UP\n");
-	}
+	if (ts->pendown && !ts->stopped)
+		ads7846_report_pen_up(ts);
 
 	return IRQ_HANDLED;
 }
-- 
2.28.0

