Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44C8FB890
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 20:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfKMTM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 14:12:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42452 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfKMTM7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 14:12:59 -0500
Received: from [111.196.57.226] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <aaron.ma@canonical.com>)
        id 1iUy4V-0001er-Ib; Wed, 13 Nov 2019 19:12:56 +0000
From:   Aaron Ma <aaron.ma@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        aaron.ma@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: fix no irq after reset on raydium 3118
Date:   Thu, 14 Nov 2019 03:12:47 +0800
Message-Id: <20191113191247.1984-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On some ThinkPad L390 some raydium 3118 touchscreen devices
doesn't response any data after reset, but some does.

Add this ID to no irq quirk,
then don't wait for any response alike on these touchscreens.
All kinds of raydium 3118 devices work fine.

BugLink: https://bugs.launchpad.net/bugs/1849721

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/hid/hid-ids.h              | 1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 447e8db21174..8354dd5d0fa3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -959,6 +959,7 @@
 
 #define I2C_VENDOR_ID_RAYDIUM		0x2386
 #define I2C_PRODUCT_ID_RAYDIUM_4B33	0x4b33
+#define I2C_PRODUCT_ID_RAYDIUM_3118	0x3118
 
 #define USB_VENDOR_ID_RAZER            0x1532
 #define USB_DEVICE_ID_RAZER_BLADE_14   0x011D
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 04c088131e04..7608ee053114 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -170,6 +170,8 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
 	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
+	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
+		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_BOGUS_IRQ },
 	{ 0, 0 }
-- 
2.20.1

