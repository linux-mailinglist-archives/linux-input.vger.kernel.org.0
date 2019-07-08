Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 462066194C
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2019 04:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfGHCZM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Jul 2019 22:25:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53365 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbfGHCZM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Jul 2019 22:25:12 -0400
Received: from [113.5.7.228] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hkJL1-0002JG-Vn; Mon, 08 Jul 2019 02:25:09 +0000
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     pali.rohar@gmail.com, xiaoxiao.liu-1@cn.alps.com,
        sliuuxiaonxiao@gmail.com, zhangfp1@lenovo.com,
        hui.wang@canonical.com
Subject: [PATCH v5 RESEND] Input: alps - Don't handle ALPS cs19 trackpoint-only device
Date:   Mon,  8 Jul 2019 10:24:58 +0800
Message-Id: <20190708022458.2585-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On a latest Lenovo laptop, the trackpoint and 3 buttons below it
don't work at all, when we move the trackpoint or press those 3
buttons, the kernel will print out:
"Rejected trackstick packet from non DualPoint device"

This device is identified as an alps touchpad but the packet has
trackpoint format, so the alps.c drops the packet and prints out
the message above.

According to XiaoXiao's explanation, this device is named cs19 and
is trackpoint-only device, its firmware is only for trackpoint, it
is independent of touchpad and is a device completely different from
DualPoint ones.

To drive this device with mininal changes to the existing driver, we
just let the alps driver not handle this device, then the trackpoint.c
will be the driver of this device if the trackpoint driver is enabled.
(if not, this device will fallback to a bare PS/2 device)

With the trackpoint.c, this trackpoint and 3 buttons all work well,
they have all features that the trackpoint should have, like
scrolling-screen, drag-and-drop and frame-selection.

Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
---
Resend this patch to add the Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Hello Dmitry,
please take look at this patch and give some comment, Thanks. Our project
is waiting for this patch to be upstreamed.

Many Thanks.

 drivers/input/mouse/alps.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 8996323ce8d9..39e53a8f4fb1 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -21,6 +21,7 @@
 
 #include "psmouse.h"
 #include "alps.h"
+#include "trackpoint.h"
 
 /*
  * Definitions for ALPS version 3 and 4 command mode protocol
@@ -2861,6 +2862,34 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
 	return NULL;
 }
 
+static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
+{
+	u8 param[2] = { 0 };
+
+	if (ps2_command(&psmouse->ps2dev,
+			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
+		return false;
+
+	/*
+	 * param[0] contains the trackpoint device variant_id while param[1]
+	 * contains the firmware_id, so far for all alps trackpoint-only
+	 * devices, their variant_ids equal TP_VARIANT_ALPS and their
+	 * firmware_ids are 0x20~0x2f, so here we check param[0] as well as
+	 * param[1] to detect an ALPS trackpoint-only device.
+	 */
+	if ((param[0] == TP_VARIANT_ALPS) && (param[1] & 0x20)) {
+		if (IS_ENABLED(MOUSE_PS2_TRACKPOINT))
+			psmouse_dbg(psmouse,
+				    "ALPS CS19 trackpoint-only device detected, not using ALPS touchpad driver\n");
+		else
+			psmouse_warn(psmouse,
+				     "ALPS CS19 trackpoint-only device detected but MOUSE_PS2_TRACKPOINT not enabled, fallback to bare PS/2 mouse\n");
+		return true;
+	}
+
+	return false;
+}
+
 static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
 {
 	const struct alps_protocol_info *protocol;
@@ -3161,6 +3190,18 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
 	if (error)
 		return error;
 
+	/*
+	 * ALPS cs19 is a trackpoint-only device, it is completely independent
+	 * of touchpad. So it is a device different from DualPoint ones, if it
+	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
+	 * let trackpoint.c to drive this device, if the trackpoint driver is
+	 * not enabled, the device will fallback to a bare PS/2 mouse.
+	 * If ps2_command() fails here, we depend on the immediate followed
+	 * psmouse_reset() to reset the device to normal state.
+	 */
+	if (alps_is_cs19_trackpoint(psmouse))
+		return -EINVAL;
+
 	/*
 	 * Reset the device to make sure it is fully operational:
 	 * on some laptops, like certain Dell Latitudes, we may
-- 
2.17.1

