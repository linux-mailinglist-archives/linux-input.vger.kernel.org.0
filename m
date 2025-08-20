Return-Path: <linux-input+bounces-14201-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FCB2E42C
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 19:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026675C5097
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 17:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6C32206A6;
	Wed, 20 Aug 2025 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="rzBx5GY7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="o+1ECk73";
	dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="fjfbfNBm";
	dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="Lr+qsxc5"
X-Original-To: linux-input@vger.kernel.org
Received: from sender6.mail.selcloud.ru (sender6.mail.selcloud.ru [5.8.75.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6726CE05;
	Wed, 20 Aug 2025 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755711735; cv=none; b=NcagtZP3d3DppyJkVESyW4xS4Tcmf7P2x5mtlJPGQ36xDu0mgBGK2zKN0qc7puwjqUcCv/KdoZ7uRGFP+VRDvrFpIz9uYdi44aFdFm9uDdZl8DZk1VqJdXV7m9tBx8pHcpLkpoCOUPmqsR4A6WxEO+Wboe3Ig9KrSCY76wOdR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755711735; c=relaxed/simple;
	bh=HO/F+KDY5uSBHM0P+ya7tlVcB5icSVdUk6VMfV/c20Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9MWzzZmiWYnUqTBq6xopd2z/GftN6OS4n1g9SP/Ob/ynD5TTMRqJtHfo/NV0gRpJu0ZyaOeLvg7x+VIJoMfT6v9aQIsHIvqQqj1VyJ07huGZg/qTgU8h3vpQPY6otWDWje3E+9hecSnz8/wjMye2cNcj02eyp12nAT0MGfG4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=rzBx5GY7; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=o+1ECk73; dkim=pass (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=fjfbfNBm; dkim=permerror (0-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=Lr+qsxc5; arc=none smtp.client-ip=5.8.75.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l1M5e4hqK9RtEwLQEKT82tmiZFWJdrx5WWRXSb1C118=; t=1755711731; x=1755884531;
	 b=rzBx5GY7IUQDnKMbQCPl5j78vfGT7ZBLqfBAVLF0VvGbh87dbQDI02eLWT0U4Ba3bk7kgc9NGC
	VworJualckplC3SnO9C6wvStfU6kSjULMAJ12zYATfTUDRcR9xUCAc3Dh+d5hqMbom4Rf3GcgL0io
	ErR5QM4wA9G/fitWdTbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Help:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=l1M5e4hqK9RtEwLQEKT82tmiZFWJdrx5WWRXSb1C118=;
	t=1755711731; x=1755884531; b=o+1ECk73F0SGKsh6EMefXmLTYF5TOOw5eVst0mpI7Xvrup7
	c9v8dEDz9fSLqTb4vDFCTtFz1ujXC4KP5SPPD8KcHeLXV0DIRhqOltnbgQL2lOEmmIZag3MKOxAnE
	dp9HpURnF86X+nI3YQ9cKckl3zwJa/wlX2355wH9izpC7Ng=;
Precedence: bulk
X-Issuen: 1147648
X-User: 95634118
X-Postmaster-Msgtype: 3849
Feedback-ID: 1147648:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250819.223726
X-SMTPUID: mlgnr60
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=foxido.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755711722; bh=l1M5e4hqK9RtEwLQEKT82tm
	iZFWJdrx5WWRXSb1C118=; b=fjfbfNBmBJsNtxAlwr/0j2PrLOLFprzAxa/TIKZwlPMK8qnOg+
	4zt5yhDpetaGKUGXOoqeg+aLVgQME/2JIueOJ0TumkrWSyogbdJIwlOfa/zqdkxrf32ZAUs/t7D
	LX8rPgIbYLuYThlw9YyULSSJX3kqHN4dSKUEZnaPCjys3M3ijgO6d/OZVv1ooGVdMPSN54RtIwh
	nFtMTjqjtGN+SU/A1b2JuB/cmDKCmJRQRl7pki74RENn9HbJOYPrPQqobCF3JKgC2fDk/MGj96X
	1i3cHeXmdNHWiifcfGFcqvPP4JKWO37D+xYU+DdTehTAEMr1SQIUc3oy7HCmaIwgLMg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=foxido.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1755711722; bh=l1M5e4hqK9RtEwLQEKT82tm
	iZFWJdrx5WWRXSb1C118=; b=Lr+qsxc5XEXMwlCFqHtxZ+nnBSxvp8a8tJpwS0IFfFuFnJPVBF
	dWZzGtPAqoFX7GGln2vWczYzp0Jkceu42EBQ==;
From: Gladyshev Ilya <foxido@foxido.dev>
To: foxido@foxido.dev
Cc: w_armin@gmx.de,
	linux-input@vger.kernel.org,
	nikita.nikita.krasnov@gmail.com,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v6] platform/x86: Add WMI driver for Redmibook keyboard.
Date: Wed, 20 Aug 2025 20:41:32 +0300
Message-ID: <20250820174140.41410-1-foxido@foxido.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver implements support for various Fn keys (like Cut) and Xiaomi
specific AI button.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
---
Changes since v5:
- Fix var declaration in the middle of the func

Link to v5: https://lore.kernel.org/platform-driver-x86/20250813153137.18355-1-foxido@foxido.dev/
---
 MAINTAINERS                      |   6 ++
 drivers/platform/x86/Kconfig     |  12 +++
 drivers/platform/x86/Makefile    |   1 +
 drivers/platform/x86/redmi-wmi.c | 129 +++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+)
 create mode 100644 drivers/platform/x86/redmi-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c0b444e5fd5a..eb25fb10e751 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20965,6 +20965,12 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtw89/
 
+REDMIBOOK WMI DRIVERS
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/redmi-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index e5cbd58a99f3..9f98a7042e43 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -109,6 +109,18 @@ config XIAOMI_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called xiaomi-wmi.
 
+config REDMI_WMI
+	tristate "Redmibook WMI key driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y here if you want support for WMI-based hotkey events on
+	  Xiaomi Redmibook devices.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called redmi-wmi.
+
 config GIGABYTE_WMI
 	tristate "Gigabyte WMI temperature driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index bea87a85ae75..406dd0807ba7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
+obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
 
 # Acer
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
new file mode 100644
index 000000000000..cb9f4e639acd
--- /dev/null
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0
+/* WMI driver for Xiaomi Redmibooks */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/unaligned.h>
+#include <linux/wmi.h>
+
+#include <uapi/linux/input-event-codes.h>
+
+#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"
+
+#define AI_KEY_VALUE_MASK 0x00000100
+
+static const struct key_entry redmi_wmi_keymap[] = {
+	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
+	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
+	{KE_KEY, 0x00001b01,	{KEY_SETUP}},
+
+	/* AI button has code for each position */
+	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
+	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
+
+	/* Keyboard backlight */
+	{KE_IGNORE, 0x00000501, {}},
+	{KE_IGNORE, 0x00800501, {}},
+	{KE_IGNORE, 0x00050501, {}},
+	{KE_IGNORE, 0x000a0501, {}},
+
+	{KE_END}
+};
+
+struct redmi_wmi {
+	struct input_dev *input_dev;
+	/* Protects the key event sequence */
+	struct mutex key_lock;
+};
+
+static int redmi_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct redmi_wmi *data;
+	int err;
+
+	/* Init dev */
+	data = devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, data);
+
+	err = devm_mutex_init(&wdev->dev, &data->key_lock);
+	if (err)
+		return err;
+
+	data->input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!data->input_dev)
+		return -ENOMEM;
+
+	data->input_dev->name = "Redmibook WMI keys";
+	data->input_dev->phys = "wmi/input0";
+
+	err = sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
+	if (err)
+		return err;
+
+	return input_register_device(data->input_dev);
+}
+
+static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
+{
+	struct key_entry *entry;
+	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
+	bool autorelease = true;
+	u32 payload;
+	int value = 1;
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
+		return;
+	}
+
+	if (obj->buffer.length < 32) {
+		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
+		return;
+	}
+
+	payload = get_unaligned_le32(obj->buffer.pointer);
+	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
+
+	if (!entry) {
+		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
+		return;
+	}
+
+	/* AI key quirk */
+	if (entry->keycode == KEY_ASSISTANT) {
+		value = !(payload & AI_KEY_VALUE_MASK);
+		autorelease = false;
+	}
+
+	guard(mutex)(&data->key_lock);
+	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
+}
+
+static const struct wmi_device_id redmi_wmi_id_table[] = {
+	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver redmi_wmi_driver = {
+	.driver = {
+		.name = "redmi-wmi",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = redmi_wmi_id_table,
+	.probe = redmi_wmi_probe,
+	.notify = redmi_wmi_notify,
+	.no_singleton = true,
+};
+module_wmi_driver(redmi_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
+MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
+MODULE_DESCRIPTION("Redmibook WMI driver");
+MODULE_LICENSE("GPL");
-- 
2.50.0


