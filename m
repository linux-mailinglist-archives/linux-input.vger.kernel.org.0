Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9345710A910
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 04:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfK0Dan (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Nov 2019 22:30:43 -0500
Received: from li825-139.members.linode.com ([104.237.157.139]:43434 "EHLO
        smtp.factglobal.ca" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726304AbfK0Dan (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Tue, 26 Nov 2019 22:30:43 -0500
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Nov 2019 22:30:43 EST
Received: by smtp.factglobal.ca (Postfix, from userid 1000)
        id E0B4E7B942; Wed, 27 Nov 2019 03:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kryma.net; s=mail;
        t=1574825061; bh=4P0mAta5oymiKaM313FJPuY56x9qqu2Pv0j6rzLmp04=;
        h=From:To:Cc:Subject:Date:From;
        b=O0xHuoUnvPjM96kd1NIYDEE5x0HM01yzGDTgyZY0sF+tFl2jVCF8fw9w0/ihZykSK
         Yxg6zIdOcy2ljLVfrX11UiHc9P1Sm6TcRA8QrCCb1OqF2VzZ4ONC1IcwLtLftV18+z
         4h+qTDXBJIXsFW5wn7ow9Isc2QOOhJ3X2hB24X4c=
From:   admin@kryma.net
To:     Linux-input@vger.kernel.org, Dmitry.torokhov@gmail.com
Cc:     Pavel Balan <admin@kryma.net>
Subject: [PATCH] Add an I2C HID quirk for incorrect input length.
Date:   Wed, 27 Nov 2019 03:23:29 +0000
Message-Id: <20191127032329.8406-1-admin@kryma.net>
X-Mailer: git-send-email 2.11.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pavel Balan <admin@kryma.net>

Apply it to the Lenovo Y720 gaming laptop I2C peripheral then.

This fixes dmesg being flooded with errors visible on un-suspend
in Linux Mint 19 Cinnamon.

Example of error log:

<...>
[    4.326588] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
[    4.326845] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
[    4.327095] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
[    4.327341] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
[    4.327609] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
<...>

Example of fixed log (debug on)

<...>
[ 3731.333183] i2c_hid i2c-ITE33D1:00: input: 02 00
[ 3731.333581] i2c_hid i2c-ITE33D1:00: input: 02 00
[ 3731.333842] i2c_hid i2c-ITE33D1:00: input: 02 00
[ 3731.334107] i2c_hid i2c-ITE33D1:00: input: 02 00
[ 3731.334367] i2c_hid i2c-ITE33D1:00: input: 02 00
<...>

Signed-off-by: Pavel Balan <admin@kryma.net>
---
 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 76969a22b0f2..ea518daf7435 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -628,6 +628,7 @@
 #define USB_VENDOR_ID_ITE               0x048d
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA   0x8386
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
+#define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
 #define USB_DEVICE_ID_ITE8595		0x8595
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2a7c6e33bb1c..14d964700a7c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -51,6 +51,7 @@
 #define I2C_HID_QUIRK_NO_RUNTIME_PM		BIT(2)
 #define I2C_HID_QUIRK_DELAY_AFTER_SLEEP		BIT(3)
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
+#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(5)
 
 /* flags */
 #define I2C_HID_STARTED		0
@@ -182,6 +183,8 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_NO_RUNTIME_PM },
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_BOGUS_IRQ },
+	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
+		I2C_HID_QUIRK_BAD_INPUT_SIZE },
 	{ 0, 0 }
 };
 
@@ -513,9 +516,15 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
 	}
 
 	if ((ret_size > size) || (ret_size < 2)) {
-		dev_err(&ihid->client->dev, "%s: incomplete report (%d/%d)\n",
-			__func__, size, ret_size);
-		return;
+		if (ihid->quirks & I2C_HID_QUIRK_BAD_INPUT_SIZE) {
+			ihid->inbuf[0] = size & 0xff;
+			ihid->inbuf[1] = size >> 8;
+			ret_size = size;
+		} else {
+			dev_err(&ihid->client->dev, "%s: incomplete report (%d/%d)\n",
+				__func__, size, ret_size);
+			return;
+		}
 	}
 
 	i2c_hid_dbg(ihid, "input: %*ph\n", ret_size, ihid->inbuf);
-- 
2.17.1

