Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A45B7A858
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 14:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbfG3M0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 08:26:01 -0400
Received: from orion.archlinux.org ([88.198.91.70]:52584 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbfG3M0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 08:26:01 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 6D46E141B492A8;
        Tue, 30 Jul 2019 12:25:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from saetre.corp.logitech.com?044 (unknown [154.53.1.40])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Tue, 30 Jul 2019 12:25:58 +0000 (UTC)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Cc:     nlopezcasad@logitech.com,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] hid-logitech-dj: add the new Lightspeed receiver
Date:   Tue, 30 Jul 2019 13:24:57 +0100
Message-Id: <20190730122458.5275-1-lains@archlinux.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchs adds the new Lightspeed receiver. Currently it seems to only
be used in the G305.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-ids.h         |  3 ++-
 drivers/hid/hid-logitech-dj.c | 13 +++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index fb19eefbc0b3..61b954fcfc2e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -768,7 +768,8 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER		0xc52f
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2	0xc532
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
-#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED	0xc539
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 4a68960b131f..d718f01f56d3 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -968,7 +968,12 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
 		break;
 	case 0x0c:
-		device_type = "eQUAD Lightspeed";
+		device_type = "eQUAD Lightspeed 1";
+		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
+		workitem.reports_supported |= STD_KEYBOARD;
+		break;
+	case 0x0d:
+		device_type = "eQUAD Lightspeed 1_1";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
@@ -1832,7 +1837,11 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	 .driver_data = recvr_type_hidpp},
 	{ /* Logitech lightspeed receiver (0xc539) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1),
+	 .driver_data = recvr_type_gaming_hidpp},
+	{ /* Logitech lightspeed receiver (0xc53f) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
 	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
-- 
2.22.0
