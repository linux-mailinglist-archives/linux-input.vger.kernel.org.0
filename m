Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6657D299160
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 16:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1784387AbgJZPqS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 11:46:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34707 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1784386AbgJZPqS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 11:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603727177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=h+MN+S3y/X02EuGHRW8Xk0aI6rRHm+EdzE3SdDpAGt4=;
        b=J5+3Iu5z+KDMlK8p+ubifZ3wqd9hCm5O3/j85KSMDsh1eMvg5kaOCF9KIs45wrjw27ygF2
        fK2PDEB0imi0liRtddN/yp0D8+q5AcTIMERj7cz9m922zV5cd4pkOngqqEvVMcdEaAEM5J
        hkx/mnXMg3dKFtzVaWpubN2CI9frv20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-kEcCx6o7PRiXFZeUkn9ZXQ-1; Mon, 26 Oct 2020 11:46:13 -0400
X-MC-Unique: kEcCx6o7PRiXFZeUkn9ZXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2305818B9F0B;
        Mon, 26 Oct 2020 15:46:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-200.ams2.redhat.com [10.36.112.200])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4FA6B5D9E4;
        Mon, 26 Oct 2020 15:46:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        linux-input@vger.kernel.org
Subject: [PATCH v2] HID: i2c-hid: Put ACPI enumerated devices in D3 on shutdown
Date:   Mon, 26 Oct 2020 16:46:06 +0100
Message-Id: <20201026154606.10409-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Changes in v2:
-Rebase on 5.10-rc1
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 786e3e9af1c9..aeff1ffb0c8b 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -943,6 +943,11 @@ static void i2c_hid_acpi_enable_wakeup(struct device *dev)
 	}
 }
 
+static void i2c_hid_acpi_shutdown(struct device *dev)
+{
+	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
+}
+
 static const struct acpi_device_id i2c_hid_acpi_match[] = {
 	{"ACPI0C50", 0 },
 	{"PNP0C50", 0 },
@@ -959,6 +964,8 @@ static inline int i2c_hid_acpi_pdata(struct i2c_client *client,
 static inline void i2c_hid_acpi_fix_up_power(struct device *dev) {}
 
 static inline void i2c_hid_acpi_enable_wakeup(struct device *dev) {}
+
+static inline void i2c_hid_acpi_shutdown(struct device *dev) {}
 #endif
 
 #ifdef CONFIG_OF
@@ -1175,6 +1182,8 @@ static void i2c_hid_shutdown(struct i2c_client *client)
 
 	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
 	free_irq(client->irq, ihid);
+
+	i2c_hid_acpi_shutdown(&client->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.28.0

