Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593E0309842
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 21:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbhA3Ue6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 15:34:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41435 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230168AbhA3Ue6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 15:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612038811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XgQ285qP+1pYe/INeZUehQVgCg50ML1ExRiCXYnkNjI=;
        b=G1EpWcX3jce8X2674RZ39OYKQ0qWHCu4zJDN/gd29dJ55UGiCB33I/rgmWxgpNcO3ii7p1
        cMS5SjCfeW7YzZVMgP5WZdpvkuPHBhY+582m0wBopCIFsQIDz9THGwDTCWakA/IapGxZts
        pOKoMoCkSWEatmTPAGjiwcMZsLJL+4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-EqweL17yO8ehtZ6As5BJhQ-1; Sat, 30 Jan 2021 15:33:29 -0500
X-MC-Unique: EqweL17yO8ehtZ6As5BJhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF89E1842143;
        Sat, 30 Jan 2021 20:33:28 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DEC6860C17;
        Sat, 30 Jan 2021 20:33:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: Add I2C_HID_QUIRK_NO_IRQ_AFTER_RESET for ITE8568 EC on Voyo Winpad A15
Date:   Sat, 30 Jan 2021 21:33:23 +0100
Message-Id: <20210130203323.88405-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ITE8568 EC on the Voyo Winpad A15 presents itself as an I2C-HID
attached keyboard and mouse (which seems to never send any events).

This needs the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk, otherwise we get
the following errors:

[ 3688.770850] i2c_hid i2c-ITE8568:00: failed to reset device.
[ 3694.915865] i2c_hid i2c-ITE8568:00: failed to reset device.
[ 3701.059717] i2c_hid i2c-ITE8568:00: failed to reset device.
[ 3707.205944] i2c_hid i2c-ITE8568:00: failed to reset device.
[ 3708.227940] i2c_hid i2c-ITE8568:00: can't add hid device: -61
[ 3708.236518] i2c_hid: probe of i2c-ITE8568:00 failed with error -61

Which leads to a significant boot delay.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ids.h              | 2 ++
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7f0522cd67db..4f788a3b98d6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -641,6 +641,8 @@
 #define USB_DEVICE_ID_INNEX_GENESIS_ATARI	0x4745
 
 #define USB_VENDOR_ID_ITE               0x048d
+#define I2C_VENDOR_ID_ITE		0x103c
+#define I2C_DEVICE_ID_ITE_VOYO_WINPAD_A15	0x184f
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA   0x8386
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index bfe716d7ea44..c586acf2fc0b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -171,6 +171,8 @@ static const struct i2c_hid_quirks {
 		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
 	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
+	{ I2C_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_VOYO_WINPAD_A15,
+		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ I2C_VENDOR_ID_RAYDIUM, I2C_PRODUCT_ID_RAYDIUM_3118,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
-- 
2.29.2

