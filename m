Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490F44466D
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbfFMQvr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:51:47 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33615 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730142AbfFMDdP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 23:33:15 -0400
Received: from [222.130.132.197] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hbGUA-0004kP-RG; Thu, 13 Jun 2019 03:33:12 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, pali.rohar@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: [PATCH v2] Input: alps - Don't handle ALPS cs19 trackpoint-only device
Date:   Thu, 13 Jun 2019 11:32:49 +0800
Message-Id: <20190613033249.20307-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On a latest Lenovo laptop, the trackpoint and 3 buttons below it
don't work at all, when we move the trackpoint or press those 3
buttons, the kernel will print out:
"Rejected trackstick packet from non DualPoint device"

This device is identified as alps touchpad but the packet has
trackpoint format, so the alps.c drops the packet and prints out
the message above.

According to XiaoXiao's explanation, this device is named cs19 and
is trackpoint-only device, its firmware is only for trackpoint, it
is independent of touchpad and is a completely different device from
DualPoint ones.

To drive this device with mininal changes to the existing driver, we
just let the alps driver not handle this device, then the trackpoint.c
will be the driver of this device.

With the trackpoint.c, this trackpoint and 3 buttons all work well,
they have all features that the trackpoint should have, like
scrolling-screen, drag-and-drop and frame-selection.

Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
In the v2, I move the cs19 checking to alsp_detect(), and
drop the param[1] checking. And because after executing
alps_indetify(), the device is not in the command mode,
i rewrite teh alsp_is_cs19_trackpoint() to add enter/exit_command_mode().

 drivers/input/mouse/alps.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0a6f7ca883e7..6f227e8ddd7e 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -24,6 +24,7 @@
 
 #include "psmouse.h"
 #include "alps.h"
+#include "trackpoint.h"
 
 /*
  * Definitions for ALPS version 3 and 4 command mode protocol
@@ -2864,6 +2865,28 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
 	return NULL;
 }
 
+static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
+{
+	u8 param[2] = { 0 };
+
+	if (alps_enter_command_mode(psmouse))
+		return false;
+
+	if (ps2_command(&psmouse->ps2dev,
+			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
+		return false;
+
+	if (alps_exit_command_mode(psmouse))
+		return false;
+
+	if (param[0] == TP_VARIANT_ALPS) {
+		psmouse_dbg(psmouse, "It is an ALPS trackpoint-only device (CS19)\n");
+		return true;
+	}
+
+	return false;
+}
+
 static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
 {
 	const struct alps_protocol_info *protocol;
@@ -3164,6 +3187,15 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
 	if (error)
 		return error;
 
+	/*
+	 * ALPS cs19 is a trackpoint-only device, it is completely independent
+	 * of touchpad. So it is a different device from DualPoint ones, if it
+	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
+	 * let trackpoint.c to drive this device.
+	 */
+	if (alps_is_cs19_trackpoint(psmouse))
+		return -EINVAL;
+
 	/*
 	 * Reset the device to make sure it is fully operational:
 	 * on some laptops, like certain Dell Latitudes, we may
-- 
2.17.1

