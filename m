Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BCE14290B
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2020 12:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgATLQd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 06:16:33 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40513 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgATLQc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 06:16:32 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1itV2k-0003Ko-Cm; Mon, 20 Jan 2020 12:16:30 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Date:   Mon, 20 Jan 2020 12:16:28 +0100
Message-Id: <20200120111628.18376-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When the distance thresholds are set the controller must be in reduced
reporting mode for them to have any effect on the interrupt generation.
This has a potentially large impact on the number of events the host
needs to process.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
I'm not sure if we want a separate DT property to allow the use of
reduced reporting mode, as this change might lead to problems for
controllers with unreasonably large threshold values. I'm not sure if
any controller with bogus threshold values exist in the wild.
---
 drivers/input/rmi4/rmi_f11.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
index bbf9ae9f3f0c..6adea8a3e8fb 100644
--- a/drivers/input/rmi4/rmi_f11.c
+++ b/drivers/input/rmi4/rmi_f11.c
@@ -412,6 +412,10 @@ struct f11_2d_sensor_queries {
 
 /* Defs for Ctrl0. */
 #define RMI_F11_REPORT_MODE_MASK        0x07
+#define RMI_F11_REPORT_MODE_CONTINUOUS  (0 << 0)
+#define RMI_F11_REPORT_MODE_REDUCED     (1 << 0)
+#define RMI_F11_REPORT_MODE_FS_CHANGE   (2 << 0)
+#define RMI_F11_REPORT_MODE_FP_CHANGE   (3 << 0)
 #define RMI_F11_ABS_POS_FILT            (1 << 3)
 #define RMI_F11_REL_POS_FILT            (1 << 4)
 #define RMI_F11_REL_BALLISTICS          (1 << 5)
@@ -1195,6 +1199,16 @@ static int rmi_f11_initialize(struct rmi_function *fn)
 		ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD] =
 			sensor->axis_align.delta_y_threshold;
 
+	/*
+	 * If distance threshold values are set, switch to reduced reporting
+	 * mode so they actually get used by the controller.
+	 */
+	if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
+	    ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
+		ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
+		ctrl->ctrl0_11[0] |= RMI_F11_REPORT_MODE_REDUCED;
+	}
+
 	if (f11->sens_query.has_dribble) {
 		switch (sensor->dribble) {
 		case RMI_REG_STATE_OFF:
-- 
2.20.1

