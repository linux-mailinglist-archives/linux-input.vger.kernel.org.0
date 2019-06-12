Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B484E41D2C
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 09:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407262AbfFLHFf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 03:05:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40075 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407185AbfFLHFf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 03:05:35 -0400
Received: from [125.35.49.90] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1haxK7-0001QJ-Ov; Wed, 12 Jun 2019 07:05:32 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, pali.rohar@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: [PATCH] Input: alps - Don't handle ALPS cs19 trackpoint-only device
Date:   Wed, 12 Jun 2019 15:05:17 +0800
Message-Id: <20190612070517.20810-1-hui.wang@canonical.com>
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
 drivers/input/mouse/alps.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0a6f7ca883e7..ff522cd980a0 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -24,6 +24,7 @@
 
 #include "psmouse.h"
 #include "alps.h"
+#include "trackpoint.h"
 
 /*
  * Definitions for ALPS version 3 and 4 command mode protocol
@@ -2864,6 +2865,24 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
 	return NULL;
 }
 
+static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
+{
+	u8 param[2] = { 0 };
+	int error;
+
+	error = ps2_command(&psmouse->ps2dev,
+			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
+	if (error)
+		return false;
+
+	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {
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
@@ -2883,6 +2902,15 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
 	if ((e6[0] & 0xf8) != 0 || e6[1] != 0 || (e6[2] != 10 && e6[2] != 100))
 		return -EINVAL;
 
+	/*
+	 * ALPS cs19 is a trackpoint-only device, it is completely independent
+	 * of touchpad. So it is a different device from DualPoint ones, if it
+	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
+	 * let trackpoint.c drive this device.
+	 */
+	if (alps_is_cs19_trackpoint(psmouse))
+		return -EINVAL;
+
 	/*
 	 * Now get the "E7" and "EC" reports.  These will uniquely identify
 	 * most ALPS touchpads.
-- 
2.17.1

