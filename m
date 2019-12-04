Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7997112BA6
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 13:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfLDMmT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 07:42:19 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55337 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfLDMmT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 07:42:19 -0500
Received: from [123.118.212.115] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <aaron.ma@canonical.com>)
        id 1icTyx-00038u-5Y; Wed, 04 Dec 2019 12:42:15 +0000
From:   Aaron Ma <aaron.ma@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: Add LG MELF0410 I2C touchscreen support
Date:   Wed,  4 Dec 2019 20:42:07 +0800
Message-Id: <20191204124207.5369-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add multitouch support for LG MELF I2C touchscreen.
Apply the same workaround as LG USB touchscreen.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e1689ef35f5..1664700bde9e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -730,6 +730,7 @@
 #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
 #define USB_DEVICE_ID_LG_MELFAS_MT	0x6007
 #define I2C_DEVICE_ID_LG_8001		0x8001
+#define I2C_DEVICE_ID_LG_7010		0x7010
 
 #define USB_VENDOR_ID_LOGITECH		0x046d
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3cfeb1629f79..f0d4172d5131 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1985,6 +1985,9 @@ static const struct hid_device_id mt_devices[] = {
 	{ .driver_data = MT_CLS_LG,
 		HID_USB_DEVICE(USB_VENDOR_ID_LG,
 			USB_DEVICE_ID_LG_MELFAS_MT) },
+	{ .driver_data = MT_CLS_LG,
+		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
+			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
 
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
-- 
2.24.0

