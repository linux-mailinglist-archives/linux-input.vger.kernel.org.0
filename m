Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5FFE333AB7
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 11:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhCJKwb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 05:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26239 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231197AbhCJKwA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 05:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615373519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=PK6cLAAPgMQw1Zo4Xm+z1EqNf/PbzEskbbZATusIkKY=;
        b=EPA/ed7zERY+seZ2RvN8XgOx9+bt/bIGJYO6C85jHlWtA5AZ/oCyIWw1Sm3yt8u/SiMNd0
        CriukhMRIbRH+x4JsXlnNE6dpqPNMa7IbzrnsDj4yddAHtXGzov0URhS82NAkrLvEq2Pun
        QSMFKklE4tbvfOpqVYRNrXD1cCy3uh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-jvU1VAoCNpy_Sc5VMpZXBw-1; Wed, 10 Mar 2021 05:51:57 -0500
X-MC-Unique: jvU1VAoCNpy_Sc5VMpZXBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E6A80432F;
        Wed, 10 Mar 2021 10:51:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-79.ams2.redhat.com [10.36.113.79])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 92A581349A;
        Wed, 10 Mar 2021 10:51:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2] Input: elants_i2c - Do not bind to i2c-hid compatible ACPI instantiated devices
Date:   Wed, 10 Mar 2021 11:51:51 +0100
Message-Id: <20210310105151.80628-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Several users have been reporting that elants_i2c gives several errors
during probe and that their touchscreen does not work on their Lenovo AMD
based laptops with a touchscreen with a ELAN0001 ACPI hardware-id:

[    0.550596] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vcc33 not found, using dummy regulator
[    0.551836] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vccio not found, using dummy regulator
[    0.560932] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
[    0.562427] elants_i2c i2c-ELAN0001:00: software reset failed: -121
[    0.595925] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
[    0.597974] elants_i2c i2c-ELAN0001:00: software reset failed: -121
[    0.621893] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
[    0.622504] elants_i2c i2c-ELAN0001:00: software reset failed: -121
[    0.632650] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (4d 61 69 6e): -121
[    0.634256] elants_i2c i2c-ELAN0001:00: boot failed: -121
[    0.699212] elants_i2c i2c-ELAN0001:00: invalid 'hello' packet: 00 00 ff ff
[    1.630506] elants_i2c i2c-ELAN0001:00: Failed to read fw id: -121
[    1.645508] elants_i2c i2c-ELAN0001:00: unknown packet 00 00 ff ff

Despite these errors, the elants_i2c driver stays bound to the device
(it returns 0 from its probe method despite the errors), blocking the
i2c-hid driver from binding.

Manually unbinding the elants_i2c driver and binding the i2c-hid driver
makes the touchscreen work.

Check if the ACPI-fwnode for the touchscreen contains one of the i2c-hid
compatiblity-id strings and if it has the I2C-HID spec's DSM to get the
HID descriptor address, If it has both then make elants_i2c not bind,
so that the i2c-hid driver can bind.

This assumes that non of the (older) elan touchscreens which actually
need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
+ DSM in their ACPI-fwnodes. If some of them actually do have this
false advertising, then this change may lead to regressions.

While at it also drop the unnecessary DEVICE_NAME prefixing of the
"I2C check functionality error", dev_err already outputs the driver-name.

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Factor out the is this an I2C-HID device check into a new
  elants_acpi_is_hid_device() helper (with an empty stub when !CONFIG_ACPI)
- While at it also drop the unnecessary DEVICE_NAME prefixing of the
  "I2C check functionality error"
---
 drivers/input/touchscreen/elants_i2c.c | 44 ++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 4c2b579f6c8b..36cf5694bfcc 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -38,6 +38,7 @@
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
+#include <linux/uuid.h>
 #include <asm/unaligned.h>
 
 /* Device, Driver information */
@@ -1334,6 +1335,40 @@ static void elants_i2c_power_off(void *_data)
 	}
 }
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id i2c_hid_ids[] = {
+	{"ACPI0C50", 0 },
+	{"PNP0C50", 0 },
+	{ },
+};
+
+static const guid_t i2c_hid_guid =
+	GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
+		  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
+
+static bool elants_acpi_is_hid_device(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+
+	if (acpi_match_device_ids(ACPI_COMPANION(dev), i2c_hid_ids))
+		return false;
+
+	obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL, ACPI_TYPE_INTEGER);
+	if (obj) {
+		ACPI_FREE(obj);
+		return true;
+	}
+
+	return false;
+}
+#else
+static bool elants_acpi_is_hid_device(struct device *dev)
+{
+	return false;
+}
+#endif
+
 static int elants_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
@@ -1342,9 +1377,14 @@ static int elants_i2c_probe(struct i2c_client *client,
 	unsigned long irqflags;
 	int error;
 
+	/* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
+	if (elants_acpi_is_hid_device(&client->dev)) {
+		dev_warn(&client->dev, "This device appears to be an I2C-HID device, not binding\n");
+		return -ENODEV;
+	}
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		dev_err(&client->dev,
-			"%s: i2c check functionality error\n", DEVICE_NAME);
+		dev_err(&client->dev, "I2C check functionality error\n");
 		return -ENXIO;
 	}
 
-- 
2.30.1

