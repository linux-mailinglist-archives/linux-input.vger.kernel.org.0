Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40640298E3C
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 14:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1780361AbgJZNjH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 09:39:07 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33907 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1773077AbgJZNjH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 09:39:07 -0400
X-Greylist: delayed 1063 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 09:39:07 EDT
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kX2R6-0007Kr-9q; Mon, 26 Oct 2020 14:21:20 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kX2R5-0005Rj-4O; Mon, 26 Oct 2020 14:21:19 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     David Jander <david@protonic.nl>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v1] Input: touchscreen: ads7846.c: Fix race that causes missing releases
Date:   Mon, 26 Oct 2020 14:21:17 +0100
Message-Id: <20201026132117.20887-1-o.rempel@pengutronix.de>
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
 drivers/input/touchscreen/ads7846.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index ea31956f3a90..0236a119c52d 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -211,10 +211,26 @@ static void ads7846_stop(struct ads7846 *ts)
 	}
 }
 
+static int get_pendown_state(struct ads7846 *ts);
+
 /* Must be called with ts->lock held */
 static void ads7846_restart(struct ads7846 *ts)
 {
+	unsigned int pdstate;
+
 	if (!ts->disabled && !ts->suspended) {
+		/* Check if pen was released since last stop */
+		if (ts->pendown && !get_pendown_state(ts)) {
+			struct input_dev *input = ts->input;
+
+			input_report_key(input, BTN_TOUCH, 0);
+			input_report_abs(input, ABS_PRESSURE, 0);
+			input_sync(input);
+
+			ts->pendown = false;
+			dev_vdbg(&ts->spi->dev, "UP\n");
+		}
+
 		/* Tell IRQ thread that it may poll the device. */
 		ts->stopped = false;
 		mb();
-- 
2.28.0

