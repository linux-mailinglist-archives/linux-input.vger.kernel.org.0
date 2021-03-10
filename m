Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F20A334C01
	for <lists+linux-input@lfdr.de>; Wed, 10 Mar 2021 23:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbhCJWyW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Mar 2021 17:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbhCJWxu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Mar 2021 17:53:50 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75126C061760;
        Wed, 10 Mar 2021 14:53:50 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id dm26so201289edb.12;
        Wed, 10 Mar 2021 14:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0rkpeucgoc5EnY6iIm5WDhJ1cpzRhf3iu8MYNLbUIY0=;
        b=l96B0rFwHgoRQzW9TAonggewCbgX7FBH/c+YNB2BCKkAunpxRUPW3UnDRFgC7FC1eG
         8UyneJ2gwuDmxEk2OygvkX1B/81/v8rGmmwpDSzlN3LNjWtz0y2wTUZU9i1x8QmLGmiF
         3bXRxE+YlOlq4bpnsQGk4z8nNDCAulq5ewIiHE74aZYfPCQl2rSTeCOtU38K4oGvcw+l
         egwf+pm1+ciOquhT+H0yLpX5JRgG6SslUm75UAzrKvacjEeNoE+r8l45vpEXhttJeavT
         PVBzbQuIWAtFzE9ym/gHSMPrzU+W4z5BZcSQwVxqOnxVsvtQsffyjV4duDoIWqpufcwR
         B6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0rkpeucgoc5EnY6iIm5WDhJ1cpzRhf3iu8MYNLbUIY0=;
        b=Z1OZFHi5XVB9qWAt7Yg2XT3D5jVKSuxoGFOKVm/crVIa55PnGAradRVFz95+meewXv
         10SUgoLOf/EkErFjynvVqNm4oVt0m2Xa8L8Rmog2kHKZOelsHWPmZ3gZd8wLkiUPIHo2
         H8kAV1+ha/iTZ4vYcSRoOje8zHuBonjKxO5LGNh5BxAMET7SkUIAuqURn1+vrPSk389H
         X1dx5sDejh/6aUtOEfTquUFbQytB7gkkS9+lM3FnLhTjVrFyp95q65PVMZkiO6TUDcoV
         g55+EuEbcR+l6LldYInp1mD+vwvsZP5buuZR1WumINi8jZSVsLbwaHb+W64i+9YQWmGY
         THtQ==
X-Gm-Message-State: AOAM532wBbK7OjQ0ChDwTyGfqQHToSOkJltq3deXhMBI2/GRk4Edy1LA
        KpdAxaYFyG3I6bNtJYz5pZ8D5IGxC6bimg==
X-Google-Smtp-Source: ABdhPJy4WyIj8/Q3QsMVNpvIPtbvqTHM0im2Mk6hXbEYYmisJqM9mikRH9CAdVqy/CozhTg7QyxJqw==
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr5706634edu.350.1615416829155;
        Wed, 10 Mar 2021 14:53:49 -0800 (PST)
Received: from xws.localdomain ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id lu5sm377286ejb.97.2021.03.10.14.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 14:53:48 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: Add support for Surface Aggregator Module HID transport
Date:   Wed, 10 Mar 2021 23:53:28 +0100
Message-Id: <20210310225329.2393372-2-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310225329.2393372-1-luzmaximilian@gmail.com>
References: <20210310225329.2393372-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a HID transport driver to support integrated HID devices on newer
Microsoft Surface models (specifically 7th-generation, i.e. Surface
Laptop 3, Surface Book 3, and later).

On those models, the internal keyboard and touchpad (as well as some
other HID devices with currently unknown function) are connected via the
generic HID subsystem (TC=0x15) of the Surface System Aggregator Module
(SSAM). This subsystem provides a generic HID transport layer, support
for which is implemented by this driver.

Co-developed-by: Blaž Hrastnik <blaz@mxxn.io>
Signed-off-by: Blaž Hrastnik <blaz@mxxn.io>
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
 MAINTAINERS                                |   7 +
 drivers/hid/Kconfig                        |   2 +
 drivers/hid/Makefile                       |   2 +
 drivers/hid/surface-hid/Kconfig            |  28 +++
 drivers/hid/surface-hid/Makefile           |   6 +
 drivers/hid/surface-hid/surface_hid.c      | 253 +++++++++++++++++++
 drivers/hid/surface-hid/surface_hid_core.c | 272 +++++++++++++++++++++
 drivers/hid/surface-hid/surface_hid_core.h |  77 ++++++
 8 files changed, 647 insertions(+)
 create mode 100644 drivers/hid/surface-hid/Kconfig
 create mode 100644 drivers/hid/surface-hid/Makefile
 create mode 100644 drivers/hid/surface-hid/surface_hid.c
 create mode 100644 drivers/hid/surface-hid/surface_hid_core.c
 create mode 100644 drivers/hid/surface-hid/surface_hid_core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 240e8a739fd1..bb6a796dc537 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11817,6 +11817,13 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
 F:	drivers/platform/surface/
 
+MICROSOFT SURFACE HID TRANSPORT DRIVER
+M:	Maximilian Luz <luzmaximilian@gmail.com>
+L:	linux-input@vger.kernel.org
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/surface-hid/
+
 MICROSOFT SURFACE HOT-PLUG DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 786b71ef7738..26e06097ba08 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1206,4 +1206,6 @@ source "drivers/hid/intel-ish-hid/Kconfig"
 
 source "drivers/hid/amd-sfh-hid/Kconfig"
 
+source "drivers/hid/surface-hid/Kconfig"
+
 endmenu
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index c4f6d5c613dc..1044ed238856 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -145,3 +145,5 @@ obj-$(CONFIG_INTEL_ISH_HID)	+= intel-ish-hid/
 obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+= intel-ish-hid/
 
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
+
+obj-$(CONFIG_SURFACE_HID_CORE)  += surface-hid/
diff --git a/drivers/hid/surface-hid/Kconfig b/drivers/hid/surface-hid/Kconfig
new file mode 100644
index 000000000000..642c7f0e64fe
--- /dev/null
+++ b/drivers/hid/surface-hid/Kconfig
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0+
+menu "Surface System Aggregator Module HID support"
+	depends on SURFACE_AGGREGATOR
+	depends on INPUT
+
+config SURFACE_HID
+	tristate "HID transport driver for Surface System Aggregator Module"
+	depends on SURFACE_AGGREGATOR_REGISTRY
+	select SURFACE_HID_CORE
+	help
+	  Driver to support integrated HID devices on newer Microsoft Surface
+	  models.
+
+	  This driver provides support for the HID transport protocol provided
+	  by the Surface Aggregator Module (i.e. the embedded controller) on
+	  7th-generation Microsoft Surface devices, i.e. Surface Book 3 and
+	  Surface Laptop 3. On those models, it is mainly used to connect the
+	  integrated touchpad and keyboard.
+
+	  Say M or Y here, if you want support for integrated HID devices, i.e.
+	  integrated touchpad and keyboard, on 7th generation Microsoft Surface
+	  models.
+
+endmenu
+
+config SURFACE_HID_CORE
+	tristate
+	select HID
diff --git a/drivers/hid/surface-hid/Makefile b/drivers/hid/surface-hid/Makefile
new file mode 100644
index 000000000000..62fc04632d3d
--- /dev/null
+++ b/drivers/hid/surface-hid/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Makefile - Surface System Aggregator Module (SSAM) HID transport driver.
+#
+obj-$(CONFIG_SURFACE_HID_CORE)	+= surface_hid_core.o
+obj-$(CONFIG_SURFACE_HID)	+= surface_hid.o
diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
new file mode 100644
index 000000000000..3477b31611ae
--- /dev/null
+++ b/drivers/hid/surface-hid/surface_hid.c
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Surface System Aggregator Module (SSAM) HID transport driver for the
+ * generic HID interface (HID/TC=0x15 subsystem). Provides support for
+ * integrated HID devices on Surface Laptop 3, Book 3, and later.
+ *
+ * Copyright (C) 2019-2021 Blaž Hrastnik <blaz@mxxn.io>,
+ *                         Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/hid.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+
+#include <linux/surface_aggregator/controller.h>
+#include <linux/surface_aggregator/device.h>
+
+#include "surface_hid_core.h"
+
+
+/* -- SAM interface. -------------------------------------------------------- */
+
+struct surface_hid_buffer_slice {
+	__u8 entry;
+	__le32 offset;
+	__le32 length;
+	__u8 end;
+	__u8 data[];
+} __packed;
+
+static_assert(sizeof(struct surface_hid_buffer_slice) == 10);
+
+enum surface_hid_cid {
+	SURFACE_HID_CID_OUTPUT_REPORT      = 0x01,
+	SURFACE_HID_CID_GET_FEATURE_REPORT = 0x02,
+	SURFACE_HID_CID_SET_FEATURE_REPORT = 0x03,
+	SURFACE_HID_CID_GET_DESCRIPTOR     = 0x04,
+};
+
+static int ssam_hid_get_descriptor(struct surface_hid_device *shid, u8 entry, u8 *buf, size_t len)
+{
+	u8 buffer[sizeof(struct surface_hid_buffer_slice) + 0x76];
+	struct surface_hid_buffer_slice *slice;
+	struct ssam_request rqst;
+	struct ssam_response rsp;
+	u32 buffer_len, offset, length;
+	int status;
+
+	/*
+	 * Note: The 0x76 above has been chosen because that's what's used by
+	 * the Windows driver. Together with the header, this leads to a 128
+	 * byte payload in total.
+	 */
+
+	buffer_len = ARRAY_SIZE(buffer) - sizeof(struct surface_hid_buffer_slice);
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.command_id = SURFACE_HID_CID_GET_DESCRIPTOR;
+	rqst.instance_id = shid->uid.instance;
+	rqst.flags = SSAM_REQUEST_HAS_RESPONSE;
+	rqst.length = sizeof(struct surface_hid_buffer_slice);
+	rqst.payload = buffer;
+
+	rsp.capacity = ARRAY_SIZE(buffer);
+	rsp.pointer = buffer;
+
+	slice = (struct surface_hid_buffer_slice *)buffer;
+	slice->entry = entry;
+	slice->end = 0;
+
+	offset = 0;
+	length = buffer_len;
+
+	while (!slice->end && offset < len) {
+		put_unaligned_le32(offset, &slice->offset);
+		put_unaligned_le32(length, &slice->length);
+
+		rsp.length = 0;
+
+		status = ssam_retry(ssam_request_sync_onstack, shid->ctrl, &rqst, &rsp,
+				    sizeof(*slice));
+		if (status)
+			return status;
+
+		offset = get_unaligned_le32(&slice->offset);
+		length = get_unaligned_le32(&slice->length);
+
+		/* Don't mess stuff up in case we receive garbage. */
+		if (length > buffer_len || offset > len)
+			return -EPROTO;
+
+		if (offset + length > len)
+			length = len - offset;
+
+		memcpy(buf + offset, &slice->data[0], length);
+
+		offset += length;
+		length = buffer_len;
+	}
+
+	if (offset != len) {
+		dev_err(shid->dev, "unexpected descriptor length: got %u, expected %zu\n",
+			offset, len);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int ssam_hid_set_raw_report(struct surface_hid_device *shid, u8 rprt_id, bool feature,
+				   u8 *buf, size_t len)
+{
+	struct ssam_request rqst;
+	u8 cid;
+
+	if (feature)
+		cid = SURFACE_HID_CID_SET_FEATURE_REPORT;
+	else
+		cid = SURFACE_HID_CID_OUTPUT_REPORT;
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.instance_id = shid->uid.instance;
+	rqst.command_id = cid;
+	rqst.flags = 0;
+	rqst.length = len;
+	rqst.payload = buf;
+
+	buf[0] = rprt_id;
+
+	return ssam_retry(ssam_request_sync, shid->ctrl, &rqst, NULL);
+}
+
+static int ssam_hid_get_raw_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	struct ssam_request rqst;
+	struct ssam_response rsp;
+
+	rqst.target_category = shid->uid.category;
+	rqst.target_id = shid->uid.target;
+	rqst.instance_id = shid->uid.instance;
+	rqst.command_id = SURFACE_HID_CID_GET_FEATURE_REPORT;
+	rqst.flags = 0;
+	rqst.length = sizeof(rprt_id);
+	rqst.payload = &rprt_id;
+
+	rsp.capacity = len;
+	rsp.length = 0;
+	rsp.pointer = buf;
+
+	return ssam_retry(ssam_request_sync_onstack, shid->ctrl, &rqst, &rsp, sizeof(rprt_id));
+}
+
+static u32 ssam_hid_event_fn(struct ssam_event_notifier *nf, const struct ssam_event *event)
+{
+	struct surface_hid_device *shid = container_of(nf, struct surface_hid_device, notif);
+
+	if (event->command_id != 0x00)
+		return 0;
+
+	hid_input_report(shid->hid, HID_INPUT_REPORT, (u8 *)&event->data[0], event->length, 0);
+	return SSAM_NOTIF_HANDLED;
+}
+
+
+/* -- Transport driver. ----------------------------------------------------- */
+
+static int shid_output_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	int status;
+
+	status = ssam_hid_set_raw_report(shid, rprt_id, false, buf, len);
+	return status >= 0 ? len : status;
+}
+
+static int shid_get_feature_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	int status;
+
+	status = ssam_hid_get_raw_report(shid, rprt_id, buf, len);
+	return status >= 0 ? len : status;
+}
+
+static int shid_set_feature_report(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len)
+{
+	int status;
+
+	status = ssam_hid_set_raw_report(shid, rprt_id, true, buf, len);
+	return status >= 0 ? len : status;
+}
+
+
+/* -- Driver setup. --------------------------------------------------------- */
+
+static int surface_hid_probe(struct ssam_device *sdev)
+{
+	struct surface_hid_device *shid;
+
+	shid = devm_kzalloc(&sdev->dev, sizeof(*shid), GFP_KERNEL);
+	if (!shid)
+		return -ENOMEM;
+
+	shid->dev = &sdev->dev;
+	shid->ctrl = sdev->ctrl;
+	shid->uid = sdev->uid;
+
+	shid->notif.base.priority = 1;
+	shid->notif.base.fn = ssam_hid_event_fn;
+	shid->notif.event.reg = SSAM_EVENT_REGISTRY_REG;
+	shid->notif.event.id.target_category = sdev->uid.category;
+	shid->notif.event.id.instance = sdev->uid.instance;
+	shid->notif.event.mask = SSAM_EVENT_MASK_STRICT;
+	shid->notif.event.flags = 0;
+
+	shid->ops.get_descriptor = ssam_hid_get_descriptor;
+	shid->ops.output_report = shid_output_report;
+	shid->ops.get_feature_report = shid_get_feature_report;
+	shid->ops.set_feature_report = shid_set_feature_report;
+
+	ssam_device_set_drvdata(sdev, shid);
+	return surface_hid_device_add(shid);
+}
+
+static void surface_hid_remove(struct ssam_device *sdev)
+{
+	surface_hid_device_destroy(ssam_device_get_drvdata(sdev));
+}
+
+static const struct ssam_device_id surface_hid_match[] = {
+	{ SSAM_SDEV(HID, 0x02, SSAM_ANY_IID, 0x00) },
+	{ },
+};
+MODULE_DEVICE_TABLE(ssam, surface_hid_match);
+
+static struct ssam_device_driver surface_hid_driver = {
+	.probe = surface_hid_probe,
+	.remove = surface_hid_remove,
+	.match_table = surface_hid_match,
+	.driver = {
+		.name = "surface_hid",
+		.pm = &surface_hid_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_ssam_device_driver(surface_hid_driver);
+
+MODULE_AUTHOR("Blaž Hrastnik <blaz@mxxn.io>");
+MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
+MODULE_DESCRIPTION("HID transport driver for Surface System Aggregator Module");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
new file mode 100644
index 000000000000..7b27ec392232
--- /dev/null
+++ b/drivers/hid/surface-hid/surface_hid_core.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Common/core components for the Surface System Aggregator Module (SSAM) HID
+ * transport driver. Provides support for integrated HID devices on Microsoft
+ * Surface models.
+ *
+ * Copyright (C) 2019-2021 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/hid.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/usb/ch9.h>
+
+#include <linux/surface_aggregator/controller.h>
+
+#include "surface_hid_core.h"
+
+
+/* -- Device descriptor access. --------------------------------------------- */
+
+static int surface_hid_load_hid_descriptor(struct surface_hid_device *shid)
+{
+	int status;
+
+	status = shid->ops.get_descriptor(shid, SURFACE_HID_DESC_HID,
+			(u8 *)&shid->hid_desc, sizeof(shid->hid_desc));
+	if (status)
+		return status;
+
+	if (shid->hid_desc.desc_len != sizeof(shid->hid_desc)) {
+		dev_err(shid->dev, "unexpected HID descriptor length: got %u, expected %zu\n",
+			shid->hid_desc.desc_len, sizeof(shid->hid_desc));
+		return -EPROTO;
+	}
+
+	if (shid->hid_desc.desc_type != HID_DT_HID) {
+		dev_err(shid->dev, "unexpected HID descriptor type: got %#04x, expected %#04x\n",
+			shid->hid_desc.desc_type, HID_DT_HID);
+		return -EPROTO;
+	}
+
+	if (shid->hid_desc.num_descriptors != 1) {
+		dev_err(shid->dev, "unexpected number of descriptors: got %u, expected 1\n",
+			shid->hid_desc.num_descriptors);
+		return -EPROTO;
+	}
+
+	if (shid->hid_desc.report_desc_type != HID_DT_REPORT) {
+		dev_err(shid->dev, "unexpected report descriptor type: got %#04x, expected %#04x\n",
+			shid->hid_desc.report_desc_type, HID_DT_REPORT);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int surface_hid_load_device_attributes(struct surface_hid_device *shid)
+{
+	int status;
+
+	status = shid->ops.get_descriptor(shid, SURFACE_HID_DESC_ATTRS,
+			(u8 *)&shid->attrs, sizeof(shid->attrs));
+	if (status)
+		return status;
+
+	if (get_unaligned_le32(&shid->attrs.length) != sizeof(shid->attrs)) {
+		dev_err(shid->dev, "unexpected attribute length: got %u, expected %zu\n",
+			get_unaligned_le32(&shid->attrs.length), sizeof(shid->attrs));
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+
+/* -- Transport driver (common). -------------------------------------------- */
+
+static int surface_hid_start(struct hid_device *hid)
+{
+	struct surface_hid_device *shid = hid->driver_data;
+
+	return ssam_notifier_register(shid->ctrl, &shid->notif);
+}
+
+static void surface_hid_stop(struct hid_device *hid)
+{
+	struct surface_hid_device *shid = hid->driver_data;
+
+	/* Note: This call will log errors for us, so ignore them here. */
+	ssam_notifier_unregister(shid->ctrl, &shid->notif);
+}
+
+static int surface_hid_open(struct hid_device *hid)
+{
+	return 0;
+}
+
+static void surface_hid_close(struct hid_device *hid)
+{
+}
+
+static int surface_hid_parse(struct hid_device *hid)
+{
+	struct surface_hid_device *shid = hid->driver_data;
+	size_t len = get_unaligned_le16(&shid->hid_desc.report_desc_len);
+	u8 *buf;
+	int status;
+
+	buf = kzalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	status = shid->ops.get_descriptor(shid, SURFACE_HID_DESC_REPORT, buf, len);
+	if (!status)
+		status = hid_parse_report(hid, buf, len);
+
+	kfree(buf);
+	return status;
+}
+
+static int surface_hid_raw_request(struct hid_device *hid, unsigned char reportnum, u8 *buf,
+				   size_t len, unsigned char rtype, int reqtype)
+{
+	struct surface_hid_device *shid = hid->driver_data;
+
+	if (rtype == HID_OUTPUT_REPORT && reqtype == HID_REQ_SET_REPORT)
+		return shid->ops.output_report(shid, reportnum, buf, len);
+
+	else if (rtype == HID_FEATURE_REPORT && reqtype == HID_REQ_GET_REPORT)
+		return shid->ops.get_feature_report(shid, reportnum, buf, len);
+
+	else if (rtype == HID_FEATURE_REPORT && reqtype == HID_REQ_SET_REPORT)
+		return shid->ops.set_feature_report(shid, reportnum, buf, len);
+
+	return -EIO;
+}
+
+static struct hid_ll_driver surface_hid_ll_driver = {
+	.start       = surface_hid_start,
+	.stop        = surface_hid_stop,
+	.open        = surface_hid_open,
+	.close       = surface_hid_close,
+	.parse       = surface_hid_parse,
+	.raw_request = surface_hid_raw_request,
+};
+
+
+/* -- Common device setup. -------------------------------------------------- */
+
+int surface_hid_device_add(struct surface_hid_device *shid)
+{
+	int status;
+
+	status = surface_hid_load_hid_descriptor(shid);
+	if (status)
+		return status;
+
+	status = surface_hid_load_device_attributes(shid);
+	if (status)
+		return status;
+
+	shid->hid = hid_allocate_device();
+	if (IS_ERR(shid->hid))
+		return PTR_ERR(shid->hid);
+
+	shid->hid->dev.parent = shid->dev;
+	shid->hid->bus = BUS_HOST;
+	shid->hid->vendor = cpu_to_le16(shid->attrs.vendor);
+	shid->hid->product = cpu_to_le16(shid->attrs.product);
+	shid->hid->version = cpu_to_le16(shid->hid_desc.hid_version);
+	shid->hid->country = shid->hid_desc.country_code;
+
+	snprintf(shid->hid->name, sizeof(shid->hid->name), "Microsoft Surface %04X:%04X",
+		 shid->hid->vendor, shid->hid->product);
+
+	strscpy(shid->hid->phys, dev_name(shid->dev), sizeof(shid->hid->phys));
+
+	shid->hid->driver_data = shid;
+	shid->hid->ll_driver = &surface_hid_ll_driver;
+
+	status = hid_add_device(shid->hid);
+	if (status)
+		hid_destroy_device(shid->hid);
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(surface_hid_device_add);
+
+void surface_hid_device_destroy(struct surface_hid_device *shid)
+{
+	hid_destroy_device(shid->hid);
+}
+EXPORT_SYMBOL_GPL(surface_hid_device_destroy);
+
+
+/* -- PM ops. --------------------------------------------------------------- */
+
+#ifdef CONFIG_PM_SLEEP
+
+static int surface_hid_suspend(struct device *dev)
+{
+	struct surface_hid_device *d = dev_get_drvdata(dev);
+
+	if (d->hid->driver && d->hid->driver->suspend)
+		return d->hid->driver->suspend(d->hid, PMSG_SUSPEND);
+
+	return 0;
+}
+
+static int surface_hid_resume(struct device *dev)
+{
+	struct surface_hid_device *d = dev_get_drvdata(dev);
+
+	if (d->hid->driver && d->hid->driver->resume)
+		return d->hid->driver->resume(d->hid);
+
+	return 0;
+}
+
+static int surface_hid_freeze(struct device *dev)
+{
+	struct surface_hid_device *d = dev_get_drvdata(dev);
+
+	if (d->hid->driver && d->hid->driver->suspend)
+		return d->hid->driver->suspend(d->hid, PMSG_FREEZE);
+
+	return 0;
+}
+
+static int surface_hid_poweroff(struct device *dev)
+{
+	struct surface_hid_device *d = dev_get_drvdata(dev);
+
+	if (d->hid->driver && d->hid->driver->suspend)
+		return d->hid->driver->suspend(d->hid, PMSG_HIBERNATE);
+
+	return 0;
+}
+
+static int surface_hid_restore(struct device *dev)
+{
+	struct surface_hid_device *d = dev_get_drvdata(dev);
+
+	if (d->hid->driver && d->hid->driver->reset_resume)
+		return d->hid->driver->reset_resume(d->hid);
+
+	return 0;
+}
+
+const struct dev_pm_ops surface_hid_pm_ops = {
+	.freeze   = surface_hid_freeze,
+	.thaw     = surface_hid_resume,
+	.suspend  = surface_hid_suspend,
+	.resume   = surface_hid_resume,
+	.poweroff = surface_hid_poweroff,
+	.restore  = surface_hid_restore,
+};
+EXPORT_SYMBOL_GPL(surface_hid_pm_ops);
+
+#else /* CONFIG_PM_SLEEP */
+
+const struct dev_pm_ops surface_hid_pm_ops = { };
+EXPORT_SYMBOL_GPL(surface_hid_pm_ops);
+
+#endif /* CONFIG_PM_SLEEP */
+
+MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
+MODULE_DESCRIPTION("HID transport driver core for Surface System Aggregator Module");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/surface-hid/surface_hid_core.h b/drivers/hid/surface-hid/surface_hid_core.h
new file mode 100644
index 000000000000..4b1a7b57e035
--- /dev/null
+++ b/drivers/hid/surface-hid/surface_hid_core.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Common/core components for the Surface System Aggregator Module (SSAM) HID
+ * transport driver. Provides support for integrated HID devices on Microsoft
+ * Surface models.
+ *
+ * Copyright (C) 2019-2021 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#ifndef SURFACE_HID_CORE_H
+#define SURFACE_HID_CORE_H
+
+#include <linux/hid.h>
+#include <linux/pm.h>
+#include <linux/types.h>
+
+#include <linux/surface_aggregator/controller.h>
+#include <linux/surface_aggregator/device.h>
+
+enum surface_hid_descriptor_entry {
+	SURFACE_HID_DESC_HID    = 0,
+	SURFACE_HID_DESC_REPORT = 1,
+	SURFACE_HID_DESC_ATTRS  = 2,
+};
+
+struct surface_hid_descriptor {
+	__u8 desc_len;			/* = 9 */
+	__u8 desc_type;			/* = HID_DT_HID */
+	__le16 hid_version;
+	__u8 country_code;
+	__u8 num_descriptors;		/* = 1 */
+
+	__u8 report_desc_type;		/* = HID_DT_REPORT */
+	__le16 report_desc_len;
+} __packed;
+
+static_assert(sizeof(struct surface_hid_descriptor) == 9);
+
+struct surface_hid_attributes {
+	__le32 length;
+	__le16 vendor;
+	__le16 product;
+	__le16 version;
+	__u8 _unknown[22];
+} __packed;
+
+static_assert(sizeof(struct surface_hid_attributes) == 32);
+
+struct surface_hid_device;
+
+struct surface_hid_device_ops {
+	int (*get_descriptor)(struct surface_hid_device *shid, u8 entry, u8 *buf, size_t len);
+	int (*output_report)(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len);
+	int (*get_feature_report)(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len);
+	int (*set_feature_report)(struct surface_hid_device *shid, u8 rprt_id, u8 *buf, size_t len);
+};
+
+struct surface_hid_device {
+	struct device *dev;
+	struct ssam_controller *ctrl;
+	struct ssam_device_uid uid;
+
+	struct surface_hid_descriptor hid_desc;
+	struct surface_hid_attributes attrs;
+
+	struct ssam_event_notifier notif;
+	struct hid_device *hid;
+
+	struct surface_hid_device_ops ops;
+};
+
+int surface_hid_device_add(struct surface_hid_device *shid);
+void surface_hid_device_destroy(struct surface_hid_device *shid);
+
+extern const struct dev_pm_ops surface_hid_pm_ops;
+
+#endif /* SURFACE_HID_CORE_H */
-- 
2.30.1

