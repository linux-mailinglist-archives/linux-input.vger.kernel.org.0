Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6134E6A331
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 09:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfGPHrI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 03:47:08 -0400
Received: from orion.archlinux.org ([88.198.91.70]:47572 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfGPHrI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 03:47:08 -0400
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id B9F3C13D9582B4;
        Tue, 16 Jul 2019 07:37:51 +0000 (UTC)
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
        Tue, 16 Jul 2019 07:37:51 +0000 (UTC)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>
Cc:     nlopezcasad@logitech.com,
        =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hid-logitech-dj: add the Powerplay receiver
Date:   Tue, 16 Jul 2019 08:37:47 +0100
Message-Id: <20190716073747.7616-1-lains@archlinux.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Filipe Laíns <lains@archlinux.org>
---
 drivers/hid/hid-ids.h         | 1 +
 drivers/hid/hid-logitech-dj.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index ab9d382b067d..884356feb016 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -769,6 +769,7 @@
 #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2	0xc532
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2		0xc534
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED	0xc539
+#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 4334acb49129..d5b47ec1510c 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1839,6 +1839,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
 	 .driver_data = recvr_type_27mhz},
+	{ /* Logitech powerplay receiver (0xc53a) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY),
+	 .driver_data = recvr_type_gaming_hidpp},
 	{ /* Logitech 27 MHz HID++ 1.0 receiver (0xc517) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_S510_RECEIVER_2),
-- 
2.22.0
