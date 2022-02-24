Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28574C2A23
	for <lists+linux-input@lfdr.de>; Thu, 24 Feb 2022 12:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbiBXLDd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Feb 2022 06:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbiBXLDb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Feb 2022 06:03:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5CA528F963
        for <linux-input@vger.kernel.org>; Thu, 24 Feb 2022 03:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645700581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rRkJ1z7UVhdgcetxxaQa79a5Xp/GW7oPOCKLGNK+Qrs=;
        b=KCS2YejYfZLzidk7FX5ClmOrLgHA9DTVLiczclOWrRdCT7SBrKvUD5BVDDS+mgy44bzeZQ
        hVxmrLGdwHpQn9wp27mOGmQUQGDio7sNbW3w5eVzCyZ+opxsb9JleNPG8aIQpjNOdYQMYt
        YotI5j6/d0lOQ4FO8VGxljgpZn3i8XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-9ZMYFj9nO9aDqBAtiJi0NQ-1; Thu, 24 Feb 2022 06:02:55 -0500
X-MC-Unique: 9ZMYFj9nO9aDqBAtiJi0NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B45FD1006AA5;
        Thu, 24 Feb 2022 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.207])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 05BBE7B6E7;
        Thu, 24 Feb 2022 11:02:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] Input: soc_button_array - add support for Microsoft Surface 3 (MSHW0028) buttons
Date:   Thu, 24 Feb 2022 12:02:40 +0100
Message-Id: <20220224110241.9613-2-hdegoede@redhat.com>
In-Reply-To: <20220224110241.9613-1-hdegoede@redhat.com>
References: <20220224110241.9613-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The drivers/platform/surface/surface3_button.c code is alsmost a 1:1 copy
of the soc_button_array code.

The only big difference is that it binds to an i2c_client rather then to
a platform_device. The cause of this is the ACPI resources for the MSHW0028
device containing a bogus I2cSerialBusV2 resource which causes the kernel
to instantiate an i2c_client for it instead of a platform_device.

Add "MSHW0028" to the ignore_serial_bus_ids[] list in drivers/apci/scan.c,
so that a platform_device will be instantiated and add support for
the MSHW0028 HID to soc_button_array.

This fully replaces surface3_button, which will be removed in a separate
commit (since it binds to the now no longer created i2c_client it no
longer does anyyhing after this commit).

Note the MSHW0028 id is used by Microsoft to describe the tablet buttons on
both the Surface 3 and the Surface 3 Pro and the actual API/implementation
for the Surface 3 Pro is quite different. The changes in this commit should
not impact the separate surfacepro3_button driver:

1. Because of the bogus I2cSerialBusV2 resource problem that driver binds
   to the acpi_device itself, so instantiating a platform_device instead of
   an i2c_client does not matter.

2. The soc_button_array driver will not bind to the MSHW0028 device on
   the Surface 3 Pro, because it has no GPIO resources.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/scan.c                   |  5 +++++
 drivers/input/misc/soc_button_array.c | 24 +++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 4463c2eda61e..e993c8b253f5 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1749,6 +1749,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"INT3515", },
 		/* Non-conforming _HID for Cirrus Logic already released */
 		{"CLSA0100", },
+	/*
+	 * Some ACPI devs contain SerialBus resources even though they are not
+	 * attached to a serial bus at all.
+	 */
+		{"MSHW0028", },
 	/*
 	 * HIDs of device with an UartSerialBusV2 resource for which userspace
 	 * expects a regular tty cdev to be created (instead of the in kernel
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index cb6ec59a045d..cbb1599a520e 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -469,6 +469,27 @@ static const struct soc_device_data soc_device_INT33D3 = {
 	.button_info = soc_button_INT33D3,
 };
 
+/*
+ * Button info for Microsoft Surface 3 (non pro), this is indentical to
+ * the PNP0C40 info except that the home button is active-high.
+ *
+ * The Surface 3 Pro also has a MSHW0028 ACPI device, but that uses a custom
+ * version of the drivers/platform/x86/intel/hid.c 5 button array ACPI API
+ * instead. A check() callback is not necessary though as the Surface 3 Pro
+ * MSHW0028 ACPI device's resource table does not contain any GPIOs.
+ */
+static const struct soc_button_info soc_button_MSHW0028[] = {
+	{ "power", 0, EV_KEY, KEY_POWER, false, true, true },
+	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true, false },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false, true },
+	{ "volume_down", 3, EV_KEY, KEY_VOLUMEDOWN, true, false, true },
+	{ }
+};
+
+static const struct soc_device_data soc_device_MSHW0028 = {
+	.button_info = soc_button_MSHW0028,
+};
+
 /*
  * Special device check for Surface Book 2 and Surface Pro (2017).
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
@@ -535,7 +556,8 @@ static const struct acpi_device_id soc_button_acpi_match[] = {
 	{ "ID9001", (unsigned long)&soc_device_INT33D3 },
 	{ "ACPI0011", 0 },
 
-	/* Microsoft Surface Devices (5th and 6th generation) */
+	/* Microsoft Surface Devices (3th, 5th and 6th generation) */
+	{ "MSHW0028", (unsigned long)&soc_device_MSHW0028 },
 	{ "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
 
 	{ }
-- 
2.35.1

