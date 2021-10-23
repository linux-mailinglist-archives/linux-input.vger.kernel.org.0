Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD594383EB
	for <lists+linux-input@lfdr.de>; Sat, 23 Oct 2021 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhJWOUS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Oct 2021 10:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhJWOUS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Oct 2021 10:20:18 -0400
Received: from cambridge.shadura.me (cambridge.shadura.me [IPv6:2a00:1098:0:86:1000:13:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3141C061714;
        Sat, 23 Oct 2021 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shadura.me;
         s=a; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
        From:Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
        References; bh=N5g4n8eL/g/FyvTMhUq/0hPBbOaZ+wi8caRZG4Wh/rw=; b=EKGnTMGZn85GyF
        pgPr9oyCjbAjsFJLIzmqgEpR2QsxXKAE9NqE8U9NRoFReTq7aoRvoyjXelX9IPOMujyMzqrky8UEx
        keabzCur5qEz6DiYjl9OVpyzp70d3HSGj0zw4ooN6Qt6kPMh1kEi086uS9lRfbjS5XZwcrK08o2Xa
        aDU=;
Received: from 178-143-43-60.dynamic.orange.sk ([178.143.43.60] helo=localhost)
        by cambridge.shadura.me with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <andrew@shadura.me>)
        id 1meHqN-0002Xi-NY; Sat, 23 Oct 2021 16:17:55 +0200
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
To:     =?UTF-8?q?Ji=C5=99=C3=AD=20Kosina?= <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com, Szczepan Zalega <szczepan@nitrokey.com>
Subject: [PATCH] HID: u2fzero: Support NitroKey U2F revision of the device
Date:   Sat, 23 Oct 2021 16:17:11 +0200
Message-Id: <20211023141710.348341-1-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

NitroKey produced a clone of U2F Zero with a different firmware,
which moved extra commands into the vendor range.
Disambiguate hardware revisions and select the correct configuration in
u2fzero_probe.

Link: https://github.com/Nitrokey/nitrokey-fido-u2f-firmware/commit/a93c16b41f
Signed-off-by: Andrej Shadura <andrew.shadura@collabora.co.uk>
---
 drivers/hid/hid-ids.h     |  3 +++
 drivers/hid/hid-u2fzero.c | 45 +++++++++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..44459be66a5d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -288,6 +288,9 @@
 #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0020	0x0020
 #define USB_DEVICE_ID_CJTOUCH_MULTI_TOUCH_0040	0x0040
 
+#define USB_VENDOR_ID_CLAY_LOGIC	0x20a0
+#define USB_DEVICE_ID_NITROKEY_U2F	0x4287
+
 #define USB_VENDOR_ID_CMEDIA		0x0d8c
 #define USB_DEVICE_ID_CM109		0x000e
 #define USB_DEVICE_ID_CMEDIA_HS100B	0x0014
diff --git a/drivers/hid/hid-u2fzero.c b/drivers/hid/hid-u2fzero.c
index 67ae2b18e33a..31ea7fc69916 100644
--- a/drivers/hid/hid-u2fzero.c
+++ b/drivers/hid/hid-u2fzero.c
@@ -26,6 +26,30 @@
 
 #define HID_REPORT_SIZE		64
 
+enum hw_revision {
+	HW_U2FZERO,
+	HW_NITROKEY_U2F,
+};
+
+struct hw_revision_config {
+	u8 rng_cmd;
+	u8 wink_cmd;
+	const char *name;
+};
+
+static const struct hw_revision_config hw_configs[] = {
+	[HW_U2FZERO] = {
+		.rng_cmd  = 0x21,
+		.wink_cmd = 0x24,
+		.name = "U2F Zero",
+	},
+	[HW_NITROKEY_U2F] = {
+		.rng_cmd  = 0xc0,
+		.wink_cmd = 0xc2,
+		.name = "NitroKey U2F",
+	},
+};
+
 /* We only use broadcast (CID-less) messages */
 #define CID_BROADCAST		0xffffffff
 
@@ -52,10 +76,6 @@ struct u2f_hid_report {
 
 #define U2F_HID_MSG_LEN(f)	(size_t)(((f).init.bcnth << 8) + (f).init.bcntl)
 
-/* Custom extensions to the U2FHID protocol */
-#define U2F_CUSTOM_GET_RNG	0x21
-#define U2F_CUSTOM_WINK		0x24
-
 struct u2fzero_device {
 	struct hid_device	*hdev;
 	struct urb		*urb;	    /* URB for the RNG data */
@@ -67,6 +87,7 @@ struct u2fzero_device {
 	u8			*buf_in;
 	struct mutex		lock;
 	bool			present;
+	kernel_ulong_t		hw_revision;
 };
 
 static int u2fzero_send(struct u2fzero_device *dev, struct u2f_hid_report *req)
@@ -154,7 +175,7 @@ static int u2fzero_blink(struct led_classdev *ldev)
 		.report_type = 0,
 		.msg.cid = CID_BROADCAST,
 		.msg.init = {
-			.cmd = U2F_CUSTOM_WINK,
+			.cmd = hw_configs[dev->hw_revision].wink_cmd,
 			.bcnth = 0,
 			.bcntl = 0,
 			.data  = {0},
@@ -182,7 +203,7 @@ static int u2fzero_rng_read(struct hwrng *rng, void *data,
 		.report_type = 0,
 		.msg.cid = CID_BROADCAST,
 		.msg.init = {
-			.cmd = U2F_CUSTOM_GET_RNG,
+			.cmd = hw_configs[dev->hw_revision].rng_cmd,
 			.bcnth = 0,
 			.bcntl = 0,
 			.data  = {0},
@@ -297,6 +318,8 @@ static int u2fzero_probe(struct hid_device *hdev,
 	if (dev == NULL)
 		return -ENOMEM;
 
+	dev->hw_revision = id->driver_data;
+
 	dev->buf_out = devm_kmalloc(&hdev->dev,
 		sizeof(struct u2f_hid_report), GFP_KERNEL);
 	if (dev->buf_out == NULL)
@@ -331,7 +354,7 @@ static int u2fzero_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	hid_info(hdev, "U2F Zero LED initialised\n");
+	hid_info(hdev, "%s LED initialised\n", hw_configs[dev->hw_revision].name);
 
 	ret = u2fzero_init_hwrng(dev, minor);
 	if (ret) {
@@ -339,7 +362,7 @@ static int u2fzero_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	hid_info(hdev, "U2F Zero RNG initialised\n");
+	hid_info(hdev, "%s RNG initialised\n", hw_configs[dev->hw_revision].name);
 
 	return 0;
 }
@@ -359,7 +382,11 @@ static void u2fzero_remove(struct hid_device *hdev)
 
 static const struct hid_device_id u2fzero_table[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL,
-	  USB_DEVICE_ID_U2F_ZERO) },
+	  USB_DEVICE_ID_U2F_ZERO),
+	  .driver_data = HW_U2FZERO },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CLAY_LOGIC,
+	  USB_DEVICE_ID_NITROKEY_U2F),
+	  .driver_data = HW_NITROKEY_U2F },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, u2fzero_table);
-- 
2.33.0

