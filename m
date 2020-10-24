Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11BB297C82
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761653AbgJXM5m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 08:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33976 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1761652AbgJXM53 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 08:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603544247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gY6nxF6D69YYbbi8jJl1XX8/TD5XM0jzforV4QGjRvc=;
        b=Ik50iFFiMzgKsPLxSC988WTbQ78rjTTkZ6r9jayegqWaCqyRAwLmZPTTCq8y/DdRs1/3Tc
        5Ux1MjZnV8VXq9g9taMe31C6Wkvm54Ndo8+XDrY/PExysuelNgnooSH6UEU3M1d4MGyrkq
        3DDfDu0QQENGF0eGtyVEQ+Pfn2Vo0iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-V_v0JFzJOv2GoluPTgQuWw-1; Sat, 24 Oct 2020 08:57:22 -0400
X-MC-Unique: V_v0JFzJOv2GoluPTgQuWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D5F1842175;
        Sat, 24 Oct 2020 12:57:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-23.ams2.redhat.com [10.36.112.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AED67277DA;
        Sat, 24 Oct 2020 12:57:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: Put ACPI enumerated devices in D3 on shutdown
Date:   Sat, 24 Oct 2020 14:57:15 +0200
Message-Id: <20201024125715.16683-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i2c-hid driver would quietly fail to probe the i2c-hid sensor-hub
with an ACPI device-id of SMO91D0 every other boot.

Specifically, the i2c_smbus_read_byte() "Make sure there is something at
this address" check would fail every other boot.

It seems that the BIOS does not properly reset/power-cycle the device
leaving it in a confused state where it refuses to respond to i2c-xfers.
On boots where probing the device failed, the driver-core puts the device
in D3 after the probe-failure, which causes the probe to succeed the next
boot.

Putting the device in D3 from the shutdown-handler fixes the sensors not
working every other boot.

This has been tested on both a Lenovo Miix 2-10 and a Dell Venue 8 Pro 5830
both of which use an i2c-hid sensor-hub with an ACPI id of SMO91D0.

Note that it is safe to call acpi_device_set_power() with a NULL pointer
as first argument, so on none ACPI enumerated devices this change is a
no-op.

Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index dbd04492825d..b303a1dd0e3f 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -935,6 +935,11 @@ static void i2c_hid_acpi_fix_up_power(struct device *dev)
 		acpi_device_fix_up_power(adev);
 }
 
+static void i2c_hid_acpi_shutdown(struct device *dev)
+{
+	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
+}
+
 static const struct acpi_device_id i2c_hid_acpi_match[] = {
 	{"ACPI0C50", 0 },
 	{"PNP0C50", 0 },
@@ -949,6 +954,7 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
 }
 
 static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
+static inline void i2c_hid_acpi_shutdown(struct device *dev) {}
 #endif
 
 #ifdef CONFIG_OF
@@ -1163,6 +1169,8 @@ static void i2c_hid_shutdown(struct i2c_client *client)
 
 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
 	free_irq(client->irq, ihid);
+
+	i2c_hid_acpi_shutdown(&client->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.28.0

