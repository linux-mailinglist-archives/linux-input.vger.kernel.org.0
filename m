Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4A76A31F
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 09:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfGPHmH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 03:42:07 -0400
Received: from orion.archlinux.org ([88.198.91.70]:47232 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfGPHmH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 03:42:07 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jul 2019 03:42:06 EDT
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 12BC013D942FA2;
        Tue, 16 Jul 2019 07:36:25 +0000 (UTC)
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
        Tue, 16 Jul 2019 07:36:24 +0000 (UTC)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Cc:     nlopezcasad@logitech.com,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hid-logitech-dj: rename "gaming" receiver to "lightspeed"
Date:   Tue, 16 Jul 2019 08:36:21 +0100
Message-Id: <20190716073621.4290-1-lains@archlinux.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

this should help people identify the receiver. there are several
receivers used in gaming mice. the "lightspeed" technology is pretty
well advertise so this won't just be an obscure name.

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-ids.h         | 2 +-
 drivers/hid/hid-logitech-dj.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0d695f8e1b2c..ab9d382b067d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -768,7 +768,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER		0xc52f
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2	0xc532
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
-#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_GAMING	0xc539
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED	0xc539
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6196217a7d93..4334acb49129 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1832,9 +1832,9 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 			 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2),
 	 .driver_data = recvr_type_hidpp},
-	{ /* Logitech gaming receiver (0xc539) */
+	{ /* Logitech lightspeed receiver (0xc539) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
-		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_GAMING),
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
 	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
-- 
2.22.0
