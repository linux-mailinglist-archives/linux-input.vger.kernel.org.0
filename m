Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66174F316D
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2019 15:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbfKGOaL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Nov 2019 09:30:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:60448 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfKGOaL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Nov 2019 09:30:11 -0500
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iSilj-0003Pv-Rb; Thu, 07 Nov 2019 14:28:16 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] HID: i2c-hid: Reset ALPS touchpads on resume
Date:   Thu,  7 Nov 2019 22:28:11 +0800
Message-Id: <20191107142811.5833-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit 52cf93e63ee6 ("HID: i2c-hid: Don't reset device upon system
resume") fixes many touchpads and touchscreens, however ALPS touchpads
start to trigger IRQ storm after system resume.

Since it's total silence from ALPS, let's bring the old behavior back
to ALPS touchpads.

Fixes: 52cf93e63ee6 ("HID: i2c-hid: Don't reset device upon system resume")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 04c088131e04..4bf30b6d4a2e 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -48,6 +48,7 @@
 #define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV	BIT(0)
 #define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(1)
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
+#define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 
 /* flags */
 #define I2C_HID_STARTED		0
@@ -172,6 +173,8 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_BOGUS_IRQ },
+	{ USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
+		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ 0, 0 }
 };
 
@@ -1212,8 +1215,15 @@ static int i2c_hid_resume(struct device *dev)
 	 * solves "incomplete reports" on Raydium devices 2386:3118 and
 	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
 	 * data after a suspend/resume.
+	 *
+	 * However some ALPS touchpads generate IRQ storm without reset, so
+	 * let's still reset them here.
 	 */
-	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
+	if (ihid->quirks & I2C_HID_QUIRK_RESET_ON_RESUME)
+		ret = i2c_hid_hwreset(client);
+	else
+		ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
+
 	if (ret)
 		return ret;
 
-- 
2.17.1

