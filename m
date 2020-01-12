Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA80138866
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2020 23:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbgALWGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 17:06:55 -0500
Received: from orion.archlinux.org ([88.198.91.70]:43436 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgALWGz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 17:06:55 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 81F1818143E1CD;
        Sun, 12 Jan 2020 22:06:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from localhost.localdomain (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Sun, 12 Jan 2020 22:06:51 +0000 (UTC)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Subject: [PATCH v2] HID: logitech-hidpp: add support for the Powerplay mat/receiver
Date:   Sun, 12 Jan 2020 22:06:12 +0000
Message-Id: <20200112220612.3448741-1-lains@archlinux.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Logitech G Powerplay has a lightspeed receiver with a static HID++
device with ID 7 attached to it to. It is used to configure the led on
the mat. For this reason I increased the max number of devices.

I also marked all lightspeed devices as HID++ compatible. As the
internal powerplay device does not have REPORT_TYPE_KEYBOARD or
REPORT_TYPE_MOUSE it was not being marked as HID++ compatible in
logi_hidpp_dev_conn_notif_equad.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-logitech-dj.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index bb50d6e7745b..732380b55b15 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -16,11 +16,11 @@
 #include <asm/unaligned.h>
 #include "hid-ids.h"
 
-#define DJ_MAX_PAIRED_DEVICES			6
+#define DJ_MAX_PAIRED_DEVICES			7
 #define DJ_MAX_NUMBER_NOTIFS			8
 #define DJ_RECEIVER_INDEX			0
 #define DJ_DEVICE_INDEX_MIN			1
-#define DJ_DEVICE_INDEX_MAX			6
+#define DJ_DEVICE_INDEX_MAX			7
 
 #define DJREPORT_SHORT_LENGTH			15
 #define DJREPORT_LONG_LENGTH			32
@@ -971,7 +971,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 	case 0x0c:
 		device_type = "eQUAD Lightspeed 1";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
-		workitem.reports_supported |= STD_KEYBOARD;
+		workitem.reports_supported |= STD_KEYBOARD | HIDPP;
 		break;
 	case 0x0d:
 		device_type = "eQUAD Lightspeed 1_1";
@@ -1850,6 +1850,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech powerplay mat/receiver (0xc539) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		0xc53a),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
 	 .driver_data = recvr_type_27mhz},
-- 
2.24.1
