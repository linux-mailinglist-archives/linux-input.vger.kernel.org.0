Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51935324F94
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 12:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhBYL6m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 06:58:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40289 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229566AbhBYL6l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 06:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614254235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PlpP66rrJoRIY4iyALJK22qDoNrTypmhVlQOBKlOwMA=;
        b=Yc1yIV9LgjaiE2U+UpcU0vfA2uZJNl5Bo5khhezTRJHOVX6LhlXacaM5C+Q6L5N0GQub5K
        ML4Gmsex0YpV6etnKKuPuZW9SSJsyaYXQNw3QyOTXTE+YR44tY2EnA3x0DQ6tqpDBdTuU8
        ko2RQBJ/kQ5//OwSCUkIBQ2SQpVtMrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-N15z1z05PPyg87OaFjTwyQ-1; Thu, 25 Feb 2021 06:57:13 -0500
X-MC-Unique: N15z1z05PPyg87OaFjTwyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 064B350743;
        Thu, 25 Feb 2021 11:57:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-2.ams2.redhat.com [10.36.112.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8BD95C224;
        Thu, 25 Feb 2021 11:57:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [RFC 1/1] Input: elants_i2c - Do not bind to i2c-hid compatible ACPI instantiated devices
Date:   Thu, 25 Feb 2021 12:57:05 +0100
Message-Id: <20210225115705.83031-2-hdegoede@redhat.com>
In-Reply-To: <20210225115705.83031-1-hdegoede@redhat.com>
References: <20210225115705.83031-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Add a check if the ACPI-fwnode for the touchscreen contains one of
the i2c-hid compatiblity-id strings, and if it does make elants_i2c
not bind, so that the i2c-hid driver can bind.

This assumes that non of the (older) elan touchscreens which actually
need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
string in their ACPI-fwnodes. If some of them actually do have this
false advertising, then this change may lead to regressions.

Note this change is a no-op for none ACPI instantiated i2c-clients
or when ACPI support is not enabled in the kernel.

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/elants_i2c.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index d51cb910fba1..becb32397e6d 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1228,6 +1228,12 @@ static void elants_i2c_power_off(void *_data)
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
@@ -1236,6 +1242,10 @@ static int elants_i2c_probe(struct i2c_client *client,
 	unsigned long irqflags;
 	int error;
 
+	/* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
+	if (acpi_match_device_ids(ACPI_COMPANION(&client->dev), i2c_hid_ids) == 0)
+		return -ENODEV;
+
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev,
 			"%s: i2c check functionality error\n", DEVICE_NAME);
-- 
2.30.1

