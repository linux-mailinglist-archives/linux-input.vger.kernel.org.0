Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F735334BFD
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 23:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233949AbhCJWyV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 17:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhCJWxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 17:53:52 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9602CC061761;
        Wed, 10 Mar 2021 14:53:51 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id dx17so42149616ejb.2;
        Wed, 10 Mar 2021 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G93M+kCW/n2psVsv6lZZY8Um0ORof1Wc2hyGx335/H4=;
        b=lGkPQ7KQxF+MbNpaXRxb6MUAroSRtJUqyOTzKdnyflXSmdtVQQYIG2x+o5bSwfWM6i
         HREIbQ4UUiqBL+B5pgQ7j14h4b5hdnEeRgAjljBjo/Fxg9SZO0jwexwrB/Fm8e7nHyZb
         rgxn2xDt5EYX4MTCZNmdXC5AsD3kjVExjcQPP+dal520kVgPY/7QUaKJn/BY6Pr0nA9G
         Mt2Y+MgeWs6i57SRvtR3lh3yJE8uyHJOD60gmmihnFBo3AWC0otNjeIsgYmOVd7d9flL
         C2mqv4fToff7AO7Fc+Nei8sGRrjxBG0PcIEAWQ+tXOq7rZFZuhsC0xy/ZaBcQfRcH/Wr
         uiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G93M+kCW/n2psVsv6lZZY8Um0ORof1Wc2hyGx335/H4=;
        b=MB/+kfIEj4KZQ0FvSHqEoduvQLhZyPPxhFXaxnlMV1x/fhCDpNAKZsGFJkTSDQVcSo
         4Syf16SmxC5fy2k6uNmrSIx5O/jiVWrJIAxDpchj/+1cL5UcU1eA0KGtZDxW4ldeT27H
         Y0er17exhU53+tA9jqjMVDs1CmEpI2D1oXSMPGouiRjAiOl/yd9GPuxmWeb8FnQksR6e
         52Yt9bhxvXJtYuNaRD9Gmub9u1Z/KEXf6krEULjMHoDt58q0H4BTD/BpCOzaXH4DDgLt
         RuzD5olQXRNeYwruI+wJRYSFcmF8vDhV7c/0YP5tUm0xhRs1G+7zTEhBe61bD5nDV6rY
         50/w==
X-Gm-Message-State: AOAM533QpWidXF/3YMD5i9vEkCvjnhiyvCCLwgkL3FpEKyi649rB6bBW
        gGKdJdJ+ny41AQWoXnk+I8M=
X-Google-Smtp-Source: ABdhPJw57/di/92JIC0EfAgWVIi4Ltd4N42f9c/oZ8HZllVXPU7Vyrg3CxktxjMB6wXLe2i9h2Yo7g==
X-Received: by 2002:a17:907:9858:: with SMTP id jj24mr199097ejc.212.1615416830217;
        Wed, 10 Mar 2021 14:53:50 -0800 (PST)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id lu5sm377286ejb.97.2021.03.10.14.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 14:53:49 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: surface-hid: Add support for legacy keyboard interface
Date:   Wed, 10 Mar 2021 23:53:29 +0100
Message-Id: <20210310225329.2393372-3-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the legacy keyboard (KBD/TC=0x08) HID transport layer of
the Surface System Aggregator Module (SSAM) to the Surface HID driver.
On Surface Laptops 1 and 2, this interface is used to connect the
integrated keyboard.

Note that this subsystem interface essentially provides a limited HID
transport layer. In contrast to the generic HID interface (TC=0x15) used
on newer Surface models, this interface only allows (as far as we know)
for a single device to be connected and is otherwise severely limited in
terms of support for feature- and output-reports. Specifically, only
caps-lock-LED output-reports and a single read-only feature-report are
supported.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

Note: This patch depends on the

    platform/surface: Add Surface Aggregator device registry

series. More specifically patch

    platform/surface: Set up Surface Aggregator device registry

The full series has been merged into the for-next branch of the
platform-drivers-x86 tree [1]. The commit in question can be found at
[2].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=fc622b3d36e6d91330fb21506b9ad1e3206a4dde

---
 drivers/hid/surface-hid/Kconfig       |  14 ++
 drivers/hid/surface-hid/Makefile      |   1 +
 drivers/hid/surface-hid/surface_kbd.c | 300 ++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 drivers/hid/surface-hid/surface_kbd.c

diff --git a/drivers/hid/surface-hid/Kconfig b/drivers/hid/surface-hid/Kconfig
index 642c7f0e64fe..7ce9b5d641eb 100644
--- a/drivers/hid/surface-hid/Kconfig
+++ b/drivers/hid/surface-hid/Kconfig
@@ -21,6 +21,20 @@ config SURFACE_HID
 	  integrated touchpad and keyboard, on 7th generation Microsoft Surface
 	  models.
 
+config SURFACE_KBD
+	tristate "HID keyboard transport driver for Surface System Aggregator Module"
+	select SURFACE_HID_CORE
+	help
+	  Driver to support HID keyboards on Surface Laptop 1 and 2 devices.
+
+	  This driver provides support for the HID transport protocol provided
+	  by the Surface Aggregator Module (i.e. the embedded controller) on
+	  Microsoft Surface Laptops 1 and 2. It is used to connect the
+	  integrated keyboard on those devices.
+
+	  Say M or Y here, if you want support for the integrated keyboard on
+	  Microsoft Surface Laptops 1 and 2.
+
 endmenu
 
 config SURFACE_HID_CORE
diff --git a/drivers/hid/surface-hid/Makefile b/drivers/hid/surface-hid/Makefile
index 62fc04632d3d..4ae11cf09b25 100644
--- a/drivers/hid/surface-hid/Makefile
+++ b/drivers/hid/surface-hid/Makefile
@@ -4,3 +4,4 @@
 #
 obj-$(CONFIG_SURFACE_HID_CORE)	+= surface_hid_core.o
 obj-$(CONFIG_SURFACE_HID)	+= surface_hid.o
+obj-$(CONFIG_SURFACE_KBD)	+= surface_kbd.o
diff --git a/drivers/hid/surface-hid/surface_kbd.c b/drivers/hid/surface-hid/surface_kbd.c
new file mode 100644
index 000000000000..0635341bc517
--- /dev/null
+++ b/drivers/hid/surface-hid/surface_kbd.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Surface System Aggregator Module (SSAM) HID transport driver for the legacy
+ * keyboard interface (KBD/TC=0x08 subsystem). Provides support for the
+ * integrated HID keyboard on Surface Laptops 1 and 2.
+ *
+ * Copyright (C) 2019-2021 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/hid.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include <linux/surface_aggregator/controller.h>
+
+#include "surface_hid_core.h"
+
+
+/* -- SAM interface (KBD). -------------------------------------------------- */
+
+#define KBD_FEATURE_REPORT_SIZE			7  /* 6 + report ID */
+
+enum surface_kbd_cid {
+	SURFACE_KBD_CID_GET_DESCRIPTOR		= 0x00,
+	SURFACE_KBD_CID_SET_CAPSLOCK_LED	= 0x01,
+	SURFACE_KBD_CID_EVT_INPUT_GENERIC	= 0x03,
+	SURFACE_KBD_CID_EVT_INPUT_HOTKEYS	= 0x04,
+	SURFACE_KBD_CID_GET_FEATURE_REPORT	= 0x0b,
+};
+
+static int ssam_kbd_get_descriptor(struct surface_hid_device *shid, u8 entry, u8 *buf, size_t len)
+{
+	struct ssam_request rqst;
+	struct ssam_response rsp;
+	int status;
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.command_id = SURFACE_KBD_CID_GET_DESCRIPTOR;
+	rqst.instance_id = shid->uid.instance;
+	rqst.flags = SSAM_REQUEST_HAS_RESPONSE;
+	rqst.length = sizeof(entry);
+	rqst.payload = &entry;
+
+	rsp.capacity = len;
+	rsp.length = 0;
+	rsp.pointer = buf;
+
+	status = ssam_retry(ssam_request_sync_onstack, shid->ctrl, &rqst, &rsp, sizeof(entry));
+	if (status)
+		return status;
+
+	if (rsp.length != len) {
+		dev_err(shid->dev, "invalid descriptor length: got %zu, expected, %zu\n",
+			rsp.length, len);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int ssam_kbd_set_caps_led(struct surface_hid_device *shid, bool value)
+{
+	struct ssam_request rqst;
+	u8 value_u8 = value;
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.command_id = SURFACE_KBD_CID_SET_CAPSLOCK_LED;
+	rqst.instance_id = shid->uid.instance;
+	rqst.flags = 0;
+	rqst.length = sizeof(value_u8);
+	rqst.payload = &value_u8;
+
+	return ssam_retry(ssam_request_sync_onstack, shid->ctrl, &rqst, NULL, sizeof(value_u8));
+}
+
+static int ssam_kbd_get_feature_report(struct surface_hid_device *shid, u8 *buf, size_t len)
+{
+	struct ssam_request rqst;
+	struct ssam_response rsp;
+	u8 payload = 0;
+	int status;
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.command_id = SURFACE_KBD_CID_GET_FEATURE_REPORT;
+	rqst.instance_id = shid->uid.instance;
+	rqst.flags = SSAM_REQUEST_HAS_RESPONSE;
+	rqst.length = sizeof(payload);
+	rqst.payload = &payload;
+
+	rsp.capacity = len;
+	rsp.length = 0;
+	rsp.pointer = buf;
+
+	status = ssam_retry(ssam_request_sync_onstack, shid->ctrl, &rqst, &rsp, sizeof(payload));
+	if (status)
+		return status;
+
+	if (rsp.length != len) {
+		dev_err(shid->dev, "invalid feature report length: got %zu, expected, %zu\n",
+			rsp.length, len);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static bool ssam_kbd_is_input_event(const struct ssam_event *event)
+{
+	if (event->command_id == SURFACE_KBD_CID_EVT_INPUT_GENERIC)
+		return true;
+
+	if (event->command_id == SURFACE_KBD_CID_EVT_INPUT_HOTKEYS)
+		return true;
+
+	return false;
+}
+
+static u32 ssam_kbd_event_fn(struct ssam_event_notifier *nf, const struct ssam_event *event)
+{
+	struct surface_hid_device *shid = container_of(nf, struct surface_hid_device, notif);
+
+	/*
+	 * Check against device UID manually, as registry and device target
+	 * category doesn't line up.
+	 */
+
+	if (shid->uid.category != event->target_category)
+		return 0;
+
+	if (shid->uid.target != event->target_id)
+		return 0;
+
+	if (shid->uid.instance != event->instance_id)
+		return 0;
+
+	if (!ssam_kbd_is_input_event(event))
+		return 0;
+
+	hid_input_report(shid->hid, HID_INPUT_REPORT, (u8 *)&event->data[0], event->length, 0);
+	return SSAM_NOTIF_HANDLED;
+}
+
+
+/* -- Transport driver (KBD). ----------------------------------------------- */
+
+static int skbd_get_caps_led_value(struct hid_device *hid, u8 rprt_id, u8 *buf, size_t len)
+{
+	struct hid_field *field;
+	unsigned int offset, size;
+	int i;
+
+	/* Get LED field. */
+	field = hidinput_get_led_field(hid);
+	if (!field)
+		return -ENOENT;
+
+	/* Check if we got the correct report. */
+	if (len != hid_report_len(field->report))
+		return -ENOENT;
+
+	if (rprt_id != field->report->id)
+		return -ENOENT;
+
+	/* Get caps lock LED index. */
+	for (i = 0; i < field->report_count; i++)
+		if ((field->usage[i].hid & 0xffff) == 0x02)
+			break;
+
+	if (i == field->report_count)
+		return -ENOENT;
+
+	/* Extract value. */
+	size = field->report_size;
+	offset = field->report_offset + i * size;
+	return !!hid_field_extract(hid, buf + 1, size, offset);
+}
+
+static int skbd_output_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	int caps_led;
+	int status;
+
+	caps_led = skbd_get_caps_led_value(shid->hid, rprt_id, buf, len);
+	if (caps_led < 0)
+		return -EIO;  /* Only caps LED output reports are supported. */
+
+	status = ssam_kbd_set_caps_led(shid, caps_led);
+	if (status < 0)
+		return status;
+
+	return len;
+}
+
+static int skbd_get_feature_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	u8 report[KBD_FEATURE_REPORT_SIZE];
+	int status;
+
+	/*
+	 * The keyboard only has a single hard-coded read-only feature report
+	 * of size KBD_FEATURE_REPORT_SIZE. Try to load it and compare its
+	 * report ID against the requested one.
+	 */
+
+	if (len < ARRAY_SIZE(report))
+		return -ENOSPC;
+
+	status = ssam_kbd_get_feature_report(shid, report, ARRAY_SIZE(report));
+	if (status < 0)
+		return status;
+
+	if (rprt_id != report[0])
+		return -ENOENT;
+
+	memcpy(buf, report, ARRAY_SIZE(report));
+	return len;
+}
+
+static int skbd_set_feature_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	/* Not supported. See skbd_get_feature_report() for details. */
+	return -EIO;
+}
+
+
+/* -- Driver setup. --------------------------------------------------------- */
+
+static int surface_kbd_probe(struct platform_device *pdev)
+{
+	struct ssam_controller *ctrl;
+	struct surface_hid_device *shid;
+
+	/* Add device link to EC. */
+	ctrl = ssam_client_bind(&pdev->dev);
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl) == -ENODEV ? -EPROBE_DEFER : PTR_ERR(ctrl);
+
+	shid = devm_kzalloc(&pdev->dev, sizeof(*shid), GFP_KERNEL);
+	if (!shid)
+		return -ENOMEM;
+
+	shid->dev = &pdev->dev;
+	shid->ctrl = ctrl;
+
+	shid->uid.domain = SSAM_DOMAIN_SERIALHUB;
+	shid->uid.category = SSAM_SSH_TC_KBD;
+	shid->uid.target = 2;
+	shid->uid.instance = 0;
+	shid->uid.function = 0;
+
+	shid->notif.base.priority = 1;
+	shid->notif.base.fn = ssam_kbd_event_fn;
+	shid->notif.event.reg = SSAM_EVENT_REGISTRY_SAM;
+	shid->notif.event.id.target_category = shid->uid.category;
+	shid->notif.event.id.instance = shid->uid.instance;
+	shid->notif.event.mask = SSAM_EVENT_MASK_NONE;
+	shid->notif.event.flags = 0;
+
+	shid->ops.get_descriptor = ssam_kbd_get_descriptor;
+	shid->ops.output_report = skbd_output_report;
+	shid->ops.get_feature_report = skbd_get_feature_report;
+	shid->ops.set_feature_report = skbd_set_feature_report;
+
+	platform_set_drvdata(pdev, shid);
+	return surface_hid_device_add(shid);
+}
+
+static int surface_kbd_remove(struct platform_device *pdev)
+{
+	surface_hid_device_destroy(platform_get_drvdata(pdev));
+	return 0;
+}
+
+static const struct acpi_device_id surface_kbd_match[] = {
+	{ "MSHW0096" },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, surface_kbd_match);
+
+static struct platform_driver surface_kbd_driver = {
+	.probe = surface_kbd_probe,
+	.remove = surface_kbd_remove,
+	.driver = {
+		.name = "surface_keyboard",
+		.acpi_match_table = surface_kbd_match,
+		.pm = &surface_hid_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(surface_kbd_driver);
+
+MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
+MODULE_DESCRIPTION("HID legacy transport driver for Surface System Aggregator Module");
+MODULE_LICENSE("GPL");
-- 
2.30.1

