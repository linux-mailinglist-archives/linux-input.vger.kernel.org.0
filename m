Return-Path: <linux-input+bounces-13347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250EEAF66FC
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 02:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D93167B5FAE
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 00:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AB91DB148;
	Thu,  3 Jul 2025 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfOii2pA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F071BC07A;
	Thu,  3 Jul 2025 00:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503796; cv=none; b=BIcMU3nJaei1sbWT6Z/uUibXVZ8xVThJ4yV328mLhADIbY8Jc0VDx3Aa/pPpop+5cZ4rd5zqMmcfxKVBuATF9tECB9JZygwk47Y9y6QD/q7GTi2pCexZfvLZS/GXosIkZfX566i5vLyr7CBL8nOlK/xlAhMemQqS0Gs53qTt0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503796; c=relaxed/simple;
	bh=bOy995SJyhjRK5/Z/8f1x2x31z5fNp5nxklFZ+Kw+3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdjpZ56SWJlKdcWbKwS3znSBLz0i8QWFKs/NBFa0RdvQ7NovQ5zZ2N668nfzZq90CMa0hWhJdoIrMJ+MPo0QzqgzmDGH0JV0Ehll0T2DZz3DwVUDYpKD0Imx7GF39V+IZxJejrlwB6dDeANV/40hnOQ0klRMhFrkvGSgGIk8D58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfOii2pA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so8036646b3a.0;
        Wed, 02 Jul 2025 17:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503794; x=1752108594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HC06ywZ8LZw2hqsJkACHK+KIbMcHl7fvZJDUy4IJYk=;
        b=LfOii2pAfgpKbWsE+mlf82WwAz4cT4DyIpJpE3YBsIpzwQXtwUA9WpMi6b+Gp675VM
         wUjW6xsGvIkQCizpxullRRLIhOgS238Sgdb7lqnonbOwDEsfzR4iCdDhwATEbX4zTmzO
         136gWeXEu1Qsy1JCNH91QQGKpo+Uawyaw+g6Cg3/VyChpneQmlQErPbtamQsb/itEOEk
         qZhtG1YUi1UV0ZpkO0zMUg3WrN4IG7QKmK7gnd6qAdbcCaxFBjau+OjlbBOK68bMQGp1
         7uHQ4muiVzh+5Fgm4JDwudOEySbH0RgXOeRKFuRHfAdsFu1VC5aZQrcXgLx1hdCbZSsa
         06wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503794; x=1752108594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HC06ywZ8LZw2hqsJkACHK+KIbMcHl7fvZJDUy4IJYk=;
        b=kA19EcpIyebMGu7khMlpiH33umY2tO2J2fETT4+ebRAvr18sxNFwA/iMYl12m1UF2s
         BRHObVqOk2dox8qRuamh26TEuek7VsT/o7DQRJ4snXbV9Fi9Aat6VFL2l4+nWXUtPhmw
         JQfJI9ZYwUAlN/eNUaH06eettVYgW7nz4LFqGuI4ZAN4JRDZRDR/7AGnUOOFIBhlbofy
         ir5kzkEx7RAeyex3G0cxjb39c3YJnJDe188U718742UhbcHuCKswsvVviae7mjJoghHr
         f/nm1vDBX3bVuhQGOVhPth26ZEMYU2CX977gMjrE3h0ApZ92oJgkubDljxoOPHsdPEnL
         drsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI8BAP2jqgRnbArf2fQRDVQ8RGx8h6Cg6/qUkLAyYplMXO0bCo9oSFnAEHiipURlEHCv9zsvTshbsNQyyL@vger.kernel.org, AJvYcCVdAJmRcdcCxaZ6lOFP4whjOCbBiLa0vHII193P3Wv91JUgqg8GTFTX24Z08wptBiFGf/GPn80Jz/U=@vger.kernel.org, AJvYcCWmiufqGBQ0XcnZg4thSAvRUMonhh31f9XlmJE7m1fYbRNN0X+RolAMJixy7KlikHsCkF31Z2f/WFRs7rY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3T0rgV3TYEUFkbJzT14QyD8/bNcnv3T559eFK+xZTAbTYu8ps
	leUrhOsLuIixhibeWkP4is/RN+9WExh8HmPxcuTrD+azKZcRdnsxERag
X-Gm-Gg: ASbGncsoBwIye88q2PVroCRh2mP/mSl+LEdqmt9zPFn9ncZDkz7KxP2BEuQ2BUDojSg
	lQFdpzKUy1zMPqL3e29ceWWykdI9CdGIUhm9cOAeoQcJpSoleOBFkbv1fcYYo58cZ2nmv2NYMAg
	J5pXdDC3f7c1GNd2SyItYqFaC0F/MSn9DnyM5wDt2s/mCXe0EmclOmhwyb84KcJ3hOH26/+ALbe
	LjaqKXe9Yz4tYVfcHKgkjNt4WA/z79KcbYfiolDWh+Ieu4DsyNQCmikHwHvVwaRDby7kR0icI9c
	GKMfZWAFdDliAOi8gzUl2qc4LMHfd3RFkPcGhQiZsRsQLvlj/BYNSjLNC753pE68udyiEzKAjf7
	MMDC86cXJPdZAJaOzBRVzpcgAijwOmhStmmdFHsUhmA==
X-Google-Smtp-Source: AGHT+IEE8mJnRI3HZz0kzto013rZNzNOPylDlTOagfl8qupa09MDNzNfnEHdBA/vZvMXhAnETJABtg==
X-Received: by 2002:a05:6a00:3d52:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74b512c06f2mr6161578b3a.22.1751503794069;
        Wed, 02 Jul 2025 17:49:54 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55c7546sm15369815b3a.111.2025.07.02.17.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:49:53 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <superm1@kernel.org>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] HID: Add lenovo-legos-hid core
Date: Wed,  2 Jul 2025 17:49:42 -0700
Message-ID: <20250703004943.515919-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703004943.515919-1-derekjohn.clark@gmail.com>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds core interface for the lenovo-legos-hid driver. The purpose of core
is to identify each available endpoint for the MCU in the Lenovo Legion
Go S and route each one to the appropriate initialization and event
handling functions. Endpoint specific logic will be implemented in
subsequent patches.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/hid/Kconfig                   |   2 +
 drivers/hid/Makefile                  |   2 +
 drivers/hid/lenovo-legos-hid/Kconfig  |  11 +++
 drivers/hid/lenovo-legos-hid/Makefile |   6 ++
 drivers/hid/lenovo-legos-hid/core.c   | 113 ++++++++++++++++++++++++++
 drivers/hid/lenovo-legos-hid/core.h   |  25 ++++++
 7 files changed, 160 insertions(+)
 create mode 100644 drivers/hid/lenovo-legos-hid/Kconfig
 create mode 100644 drivers/hid/lenovo-legos-hid/Makefile
 create mode 100644 drivers/hid/lenovo-legos-hid/core.c
 create mode 100644 drivers/hid/lenovo-legos-hid/core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 68211d6eb236..aa61be9e5bc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13751,6 +13751,7 @@ M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-legos-hid
+F:	drivers/hid/lenovo-legos-hid/*
 
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a57901203aeb..494e8386b598 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1436,4 +1436,6 @@ endif # HID
 
 source "drivers/hid/usbhid/Kconfig"
 
+source "drivers/hid/lenovo-legos-hid/Kconfig"
+
 endif # HID_SUPPORT
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedbd84..bdf3ebaf11e5 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -175,3 +175,5 @@ obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
 obj-$(CONFIG_SURFACE_HID_CORE)  += surface-hid/
 
 obj-$(CONFIG_INTEL_THC_HID)     += intel-thc-hid/
+
+obj-$(CONFIG_LENOVO_LEGOS_HID)  += lenovo-legos-hid/
diff --git a/drivers/hid/lenovo-legos-hid/Kconfig b/drivers/hid/lenovo-legos-hid/Kconfig
new file mode 100644
index 000000000000..6918b25e191c
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/Kconfig
@@ -0,0 +1,11 @@
+config LENOVO_LEGOS_HID
+	tristate "Lenovo Legion Go S HID"
+	depends on USB_HID
+	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR
+	help
+	  Say Y here to include support for the Lenovo Legion Go S Handheld
+	  Console Controller.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-legos-hid.
diff --git a/drivers/hid/lenovo-legos-hid/Makefile b/drivers/hid/lenovo-legos-hid/Makefile
new file mode 100644
index 000000000000..707f1be80c78
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Makefile - Lenovo Legion Go S Handheld Console Controller driver
+#
+lenovo-legos-hid-y := core.o
+obj-$(CONFIG_LENOVO_LEGOS_HID)	:= lenovo-legos-hid.o
diff --git a/drivers/hid/lenovo-legos-hid/core.c b/drivers/hid/lenovo-legos-hid/core.c
new file mode 100644
index 000000000000..9049cbb8bd6c
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/core.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  HID driver for Lenovo Legion Go S series gamepad.
+ *
+ *  Copyright (c) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/hid.h>
+#include <linux/types.h>
+#include <linux/usb.h>
+
+#include "core.h"
+#include "../hid-ids.h"
+
+u8 get_endpoint_address(struct hid_device *hdev)
+{
+	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+	struct usb_host_endpoint *ep;
+
+	if (intf) {
+		ep = intf->cur_altsetting->endpoint;
+		if (ep)
+			return ep->desc.bEndpointAddress;
+	}
+
+	return -ENODEV;
+}
+
+static int lenovo_legos_raw_event(struct hid_device *hdev,
+				  struct hid_report *report, u8 *data, int size)
+{
+	int ep;
+
+	ep = get_endpoint_address(hdev);
+
+	switch (ep) {
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int lenovo_legos_hid_probe(struct hid_device *hdev,
+				  const struct hid_device_id *id)
+{
+	int ret, ep;
+
+	ep = get_endpoint_address(hdev);
+	if (ep <= 0)
+		return ep;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "Parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	if (ret) {
+		hid_err(hdev, "Failed to start HID device\n");
+		return ret;
+	}
+
+	ret = hid_hw_open(hdev);
+	if (ret) {
+		hid_err(hdev, "Failed to open HID device\n");
+		hid_hw_stop(hdev);
+		return ret;
+	}
+
+	switch (ep) {
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static void lenovo_legos_hid_remove(struct hid_device *hdev)
+{
+	int ep = get_endpoint_address(hdev);
+
+	switch (ep) {
+	default:
+		hid_hw_close(hdev);
+		hid_hw_stop(hdev);
+
+		break;
+	}
+}
+
+static const struct hid_device_id lenovo_legos_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_QHE,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO_S_XINPUT) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_QHE,
+			 USB_DEVICE_ID_LENOVO_LEGION_GO_S_DINPUT) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(hid, lenovo_legos_devices);
+static struct hid_driver lenovo_legos_hid = {
+	.name = "lenovo-legos-hid",
+	.id_table = lenovo_legos_devices,
+	.probe = lenovo_legos_hid_probe,
+	.remove = lenovo_legos_hid_remove,
+	.raw_event = lenovo_legos_raw_event,
+};
+module_hid_driver(lenovo_legos_hid);
+
+MODULE_AUTHOR("Derek J. Clark");
+MODULE_DESCRIPTION("HID Driver for Lenovo Legion Go S Series gamepad.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hid/lenovo-legos-hid/core.h b/drivers/hid/lenovo-legos-hid/core.h
new file mode 100644
index 000000000000..efbc50896536
--- /dev/null
+++ b/drivers/hid/lenovo-legos-hid/core.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
+
+#ifndef _LENOVO_LEGOS_HID_CORE_
+#define _LENOVO_LEGOS_HID_CORE_
+
+#include <linux/types.h>
+
+#define GO_S_PACKET_SIZE 64
+
+struct hid_device;
+
+enum legos_interface {
+	LEGION_GO_S_IAP_INTF_IN = 0x81,
+	LEGION_GO_S_TP_INTF_IN = 0x83,
+	LEGION_GO_S_CFG_INTF_IN,
+	LEGION_GO_S_IMU_INTF_IN,
+	LEGION_GO_S_GP_INFT_IN,
+	LEGION_GO_S_UNK_INTF_IN,
+};
+
+u8 get_endpoint_address(struct hid_device *hdev);
+
+#endif /* !_LENOVO_LEGOS_HID_CORE_*/
-- 
2.50.0


