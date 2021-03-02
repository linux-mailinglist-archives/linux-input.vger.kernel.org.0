Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7B832B4A5
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhCCFXm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30281 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1448529AbhCBPFa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Mar 2021 10:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614697441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EsUc/Ed7Lsx++wgNeKgQfgE8siLiEuhexMK/0EZZiuY=;
        b=POe3PTGTIjxzGJAeSOKcNs3iVNYzHl9B10nOIUk2D7ZqhloQy7afZ+8zWCWTOdXjAh4b57
        w7dRM6sYsGWoxRMM3R+3hpl8VScfK1+jk0Cpg5EkR463G0M13oNe54tdLT8LNcNRfsekgS
        BHh5mivTcYmDxWc+xqZyGOZO+8EaaLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-faZYZmYgMvSBH95vO7dUog-1; Tue, 02 Mar 2021 09:51:09 -0500
X-MC-Unique: faZYZmYgMvSBH95vO7dUog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4272880402C;
        Tue,  2 Mar 2021 14:51:08 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-7.ams2.redhat.com [10.36.115.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C75185DEC1;
        Tue,  2 Mar 2021 14:50:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: elants_i2c - Do not bind to i2c-hid compatible ACPI instantiated devices
Date:   Tue,  2 Mar 2021 15:50:57 +0100
Message-Id: <20210302145057.112437-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/elants_i2c.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 4c2b579f6c8b..510638e5ba5a 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1334,6 +1334,12 @@ static void elants_i2c_power_off(void *_data)
 	}
 }
 
+static const struct acpi_device_id i2c_hid_ids[] = {
+	{"ACPI0C50", 0 },
+	{"PNP0C50", 0 },
+	{ },
+};
+
 static int elants_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
@@ -1342,6 +1348,25 @@ static int elants_i2c_probe(struct i2c_client *client,
 	unsigned long irqflags;
 	int error;
 
+#ifdef CONFIG_ACPI
+	/* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
+	if (acpi_match_device_ids(ACPI_COMPANION(&client->dev), i2c_hid_ids) == 0) {
+		static const guid_t i2c_hid_guid =
+			GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
+				  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
+		acpi_handle handle = ACPI_HANDLE(&client->dev);
+		union acpi_object *obj;
+
+		obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
+					      ACPI_TYPE_INTEGER);
+		if (obj) {
+			dev_warn(&client->dev, "elants_i2c: This device appears to be an I2C-HID device, not binding\n");
+			ACPI_FREE(obj);
+			return -ENODEV;
+		}
+	}
+#endif
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev,
 			"%s: i2c check functionality error\n", DEVICE_NAME);
-- 
2.30.1

