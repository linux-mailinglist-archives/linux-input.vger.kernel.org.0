Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC832502D
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbfEUN1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40510 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726995AbfEUN1f (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3DE30C05D3F4;
        Tue, 21 May 2019 13:27:35 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3740B610A3;
        Tue, 21 May 2019 13:27:32 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 02/10] Input: elantech - add helper function elantech_is_buttonpad()
Date:   Tue, 21 May 2019 15:27:04 +0200
Message-Id: <20190521132712.2818-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 21 May 2019 13:27:35 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We check for this bit all over the code, better have it defined once
for all.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

changes in v2:
- updated with latest upstream
---
 drivers/input/mouse/elantech.c | 93 ++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 5953c21774d7..34b96b96fc96 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -229,6 +229,52 @@ static void elantech_packet_dump(struct psmouse *psmouse)
 		       psmouse->pktsize, psmouse->packet);
 }
 
+/*
+ * Advertise INPUT_PROP_BUTTONPAD for clickpads. The testing of bit 12 in
+ * fw_version for this is based on the following fw_version & caps table:
+ *
+ * Laptop-model:           fw_version:     caps:           buttons:
+ * Acer S3                 0x461f00        10, 13, 0e      clickpad
+ * Acer S7-392             0x581f01        50, 17, 0d      clickpad
+ * Acer V5-131             0x461f02        01, 16, 0c      clickpad
+ * Acer V5-551             0x461f00        ?               clickpad
+ * Asus K53SV              0x450f01        78, 15, 0c      2 hw buttons
+ * Asus G46VW              0x460f02        00, 18, 0c      2 hw buttons
+ * Asus G750JX             0x360f00        00, 16, 0c      2 hw buttons
+ * Asus TP500LN            0x381f17        10, 14, 0e      clickpad
+ * Asus X750JN             0x381f17        10, 14, 0e      clickpad
+ * Asus UX31               0x361f00        20, 15, 0e      clickpad
+ * Asus UX32VD             0x361f02        00, 15, 0e      clickpad
+ * Avatar AVIU-145A2       0x361f00        ?               clickpad
+ * Fujitsu CELSIUS H760    0x570f02        40, 14, 0c      3 hw buttons (**)
+ * Fujitsu CELSIUS H780    0x5d0f02        41, 16, 0d      3 hw buttons (**)
+ * Fujitsu LIFEBOOK E544   0x470f00        d0, 12, 09      2 hw buttons
+ * Fujitsu LIFEBOOK E546   0x470f00        50, 12, 09      2 hw buttons
+ * Fujitsu LIFEBOOK E547   0x470f00        50, 12, 09      2 hw buttons
+ * Fujitsu LIFEBOOK E554   0x570f01        40, 14, 0c      2 hw buttons
+ * Fujitsu LIFEBOOK E557   0x570f01        40, 14, 0c      2 hw buttons
+ * Fujitsu T725            0x470f01        05, 12, 09      2 hw buttons
+ * Fujitsu H730            0x570f00        c0, 14, 0c      3 hw buttons (**)
+ * Gigabyte U2442          0x450f01        58, 17, 0c      2 hw buttons
+ * Lenovo L430             0x350f02        b9, 15, 0c      2 hw buttons (*)
+ * Lenovo L530             0x350f02        b9, 15, 0c      2 hw buttons (*)
+ * Samsung NF210           0x150b00        78, 14, 0a      2 hw buttons
+ * Samsung NP770Z5E        0x575f01        10, 15, 0f      clickpad
+ * Samsung NP700Z5B        0x361f06        21, 15, 0f      clickpad
+ * Samsung NP900X3E-A02    0x575f03        ?               clickpad
+ * Samsung NP-QX410        0x851b00        19, 14, 0c      clickpad
+ * Samsung RC512           0x450f00        08, 15, 0c      2 hw buttons
+ * Samsung RF710           0x450f00        ?               2 hw buttons
+ * System76 Pangolin       0x250f01        ?               2 hw buttons
+ * (*) + 3 trackpoint buttons
+ * (**) + 0 trackpoint buttons
+ * Note: Lenovo L430 and Lenovo L530 have the same fw_version/caps
+ */
+static inline int elantech_is_buttonpad(struct elantech_device_info *info)
+{
+	return info->fw_version & 0x001000;
+}
+
 /*
  * Interpret complete data packets and report absolute mode input events for
  * hardware version 1. (4 byte packets)
@@ -526,7 +572,7 @@ static void elantech_report_absolute_v3(struct psmouse *psmouse,
 	input_report_key(dev, BTN_TOOL_TRIPLETAP, fingers == 3);
 
 	/* For clickpads map both buttons to BTN_LEFT */
-	if (etd->info.fw_version & 0x001000)
+	if (elantech_is_buttonpad(&etd->info))
 		input_report_key(dev, BTN_LEFT, packet[0] & 0x03);
 	else
 		psmouse_report_standard_buttons(dev, packet[0]);
@@ -544,7 +590,7 @@ static void elantech_input_sync_v4(struct psmouse *psmouse)
 	unsigned char *packet = psmouse->packet;
 
 	/* For clickpads map both buttons to BTN_LEFT */
-	if (etd->info.fw_version & 0x001000)
+	if (elantech_is_buttonpad(&etd->info))
 		input_report_key(dev, BTN_LEFT, packet[0] & 0x03);
 	else
 		psmouse_report_standard_buttons(dev, packet[0]);
@@ -1020,53 +1066,12 @@ static int elantech_get_resolution_v4(struct psmouse *psmouse,
 	return 0;
 }
 
-/*
- * Advertise INPUT_PROP_BUTTONPAD for clickpads. The testing of bit 12 in
- * fw_version for this is based on the following fw_version & caps table:
- *
- * Laptop-model:           fw_version:     caps:           buttons:
- * Acer S3                 0x461f00        10, 13, 0e      clickpad
- * Acer S7-392             0x581f01        50, 17, 0d      clickpad
- * Acer V5-131             0x461f02        01, 16, 0c      clickpad
- * Acer V5-551             0x461f00        ?               clickpad
- * Asus K53SV              0x450f01        78, 15, 0c      2 hw buttons
- * Asus G46VW              0x460f02        00, 18, 0c      2 hw buttons
- * Asus G750JX             0x360f00        00, 16, 0c      2 hw buttons
- * Asus TP500LN            0x381f17        10, 14, 0e      clickpad
- * Asus X750JN             0x381f17        10, 14, 0e      clickpad
- * Asus UX31               0x361f00        20, 15, 0e      clickpad
- * Asus UX32VD             0x361f02        00, 15, 0e      clickpad
- * Avatar AVIU-145A2       0x361f00        ?               clickpad
- * Fujitsu CELSIUS H760    0x570f02        40, 14, 0c      3 hw buttons (**)
- * Fujitsu CELSIUS H780    0x5d0f02        41, 16, 0d      3 hw buttons (**)
- * Fujitsu LIFEBOOK E544   0x470f00        d0, 12, 09      2 hw buttons
- * Fujitsu LIFEBOOK E546   0x470f00        50, 12, 09      2 hw buttons
- * Fujitsu LIFEBOOK E547   0x470f00        50, 12, 09      2 hw buttons
- * Fujitsu LIFEBOOK E554   0x570f01        40, 14, 0c      2 hw buttons
- * Fujitsu LIFEBOOK E557   0x570f01        40, 14, 0c      2 hw buttons
- * Fujitsu T725            0x470f01        05, 12, 09      2 hw buttons
- * Fujitsu H730            0x570f00        c0, 14, 0c      3 hw buttons (**)
- * Gigabyte U2442          0x450f01        58, 17, 0c      2 hw buttons
- * Lenovo L430             0x350f02        b9, 15, 0c      2 hw buttons (*)
- * Lenovo L530             0x350f02        b9, 15, 0c      2 hw buttons (*)
- * Samsung NF210           0x150b00        78, 14, 0a      2 hw buttons
- * Samsung NP770Z5E        0x575f01        10, 15, 0f      clickpad
- * Samsung NP700Z5B        0x361f06        21, 15, 0f      clickpad
- * Samsung NP900X3E-A02    0x575f03        ?               clickpad
- * Samsung NP-QX410        0x851b00        19, 14, 0c      clickpad
- * Samsung RC512           0x450f00        08, 15, 0c      2 hw buttons
- * Samsung RF710           0x450f00        ?               2 hw buttons
- * System76 Pangolin       0x250f01        ?               2 hw buttons
- * (*) + 3 trackpoint buttons
- * (**) + 0 trackpoint buttons
- * Note: Lenovo L430 and Lenovo L530 have the same fw_version/caps
- */
 static void elantech_set_buttonpad_prop(struct psmouse *psmouse)
 {
 	struct input_dev *dev = psmouse->dev;
 	struct elantech_data *etd = psmouse->private;
 
-	if (etd->info.fw_version & 0x001000) {
+	if (elantech_is_buttonpad(&etd->info)) {
 		__set_bit(INPUT_PROP_BUTTONPAD, dev->propbit);
 		__clear_bit(BTN_RIGHT, dev->keybit);
 	}
-- 
2.21.0

