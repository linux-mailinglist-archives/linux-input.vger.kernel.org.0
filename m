Return-Path: <linux-input+bounces-13755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3BB181A0
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 14:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52C8D4E6F15
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 12:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7138247295;
	Fri,  1 Aug 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="jpYMM14m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="R1uV2J65";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="PY7pz7Mq"
X-Original-To: linux-input@vger.kernel.org
Received: from sender8.mail.selcloud.ru (sender8.mail.selcloud.ru [5.8.75.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FEE246BB0;
	Fri,  1 Aug 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050836; cv=none; b=defvKf4NOJmY3xVYal/gia/8DS7vNcLS1QJiZRj327S4TeFfcGjMmg5smK0Tu0E/7JMe0otvN6fapPyALU9SqM5B28rgbLFJ5fv69KTJ1X9xMv3NsRRgBLq4nu/SkVsEYveelpPL/ar2sKx/cN4fKDZVCK3PcCDlOuzPldS/WO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050836; c=relaxed/simple;
	bh=HKl5cOQxTneNMHfsJgLASkkCf4AZvUuw1cqZRoN7XH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIzFGi+MVHXeZ8ydg09B0Bdvdmz9QLNgWY2zhYAld8CZiXcKUVdvZCByitXhkbmsZJ/UKbBiWVdW4p8rX9laqiGGru+DOPhyb+UIwmp5l7a8y3nqHJZTSZf84kRofVxNCdww0DmAQtiRAgzhjSD7jruZTK0OMjqx38Xh0SU27qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=jpYMM14m; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=R1uV2J65; dkim=fail (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=PY7pz7Mq reason="signature verification failed"; arc=none smtp.client-ip=5.8.75.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vhgdrzrS51GUEazezk2kAwd9BPkJfnpoB3zPUZ1XBlY=; t=1754050833; x=1754223633;
	 b=jpYMM14mww1S6bSjwooD6FQrNROcWu1u6nWmkygJ4dlKo5n7hur1L4Xjpe4WRRGju+WGF5DGdS
	ohN6yLDje09fsV+1NkEg+MCy3BO0qDXbDMzMfGPjzLpyazF/9Y4lNegM/s7weKxR91WoWwBf7yIS6
	ZYSwwDl8v7+7o/GO2xfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Help:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=vhgdrzrS51GUEazezk2kAwd9BPkJfnpoB3zPUZ1XBlY=;
	t=1754050833; x=1754223633; b=R1uV2J65GlTjefoojWLC+Ll3GLXnEJg7A+F4ONsgTiqzr6U
	cklHvP8hhGdOyC/p6lbxofImZTms8QOJBcay81hujP9mZ/l+SKTnk0Y8/a/09755DDQ/grVI2aOix
	BKUu2+eEaoXHn8JzhEyiGWUBfphPwlVQJpt/u5ntH8Bs6vE=;
Precedence: bulk
X-Issuen: 1123207
X-User: 280060488
X-Postmaster-Msgtype: 3849
Feedback-ID: 1123207:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250728.224157
X-SMTPUID: mlgnr62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxido.dev; s=dkim;
	t=1754049848; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=erZmOTtVHeVswZvcm5o5pYqL6T+U+P8rOEJ4fElpoZE=;
	b=PY7pz7MqAIxWo8AKUSlHLWlm57sVt46VK6Kl/k/Ypso369jewNFtchcFxKNBnHgJyOweOA
	Kt/nbnnybHsQBaL9TUfO8/kwnvleP6stL5QlW2VUvimWcU0tkc9okRdvJLdb570cIluFxt
	1nknH0QO3DxdJKDUyTpVczeZB5X0z7OkhJAC+TT+6oCa1kzgLIV5RFxBjUfa/QY3SjpJ1V
	r469S+bSiJaLPe79Jo+y5SGdqmFh6af3cnm2iPDcSodoHGBvGKVgBZlFP15CA7sJqSOLeB
	LjPc3/UseEWs9NCPgPrayCQH4m05NWvTPQHmU66a40DXrV00xkJWyuOITORu0Q==
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
Subject: [PATCH v4] platform/x86: Add WMI driver for Redmibook keyboard.
Date: Fri,  1 Aug 2025 15:03:10 +0300
Message-ID: <20250801120321.9742-1-foxido@foxido.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable

This driver implements support for various Fn keys (like Cut) and Xiaomi
specific AI button.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
---
Changes from v3:
- Optimize mutex scope
- Stylistic changes
- Pull Reviewed-by

Link to v3: https://lore.kernel.org/platform-driver-x86/20250730185619.87=
25-1-foxido@foxido.dev/
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
=20
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
=20
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
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
index bea87a85ae75..406dd0807ba7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+=3D huawei-wmi.o
 obj-$(CONFIG_MXM_WMI)			+=3D mxm-wmi.o
 obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
+obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
=20
 # Acer
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redm=
i-wmi.c
new file mode 100644
index 000000000000..27f5674a2513
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
+#define WMI_REDMIBOOK_KEYBOARD_EVENT_GUID "46C93E13-EE9B-4262-8488-563BC=
A757FEF"
+
+#define AI_KEY_VALUE_MASK 0x00000100
+
+static const struct key_entry redmi_wmi_keymap[] =3D {
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
+	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, data);
+
+	err =3D devm_mutex_init(&wdev->dev, &data->key_lock);
+	if (err)
+		return err;
+
+	/* Setup input device */
+	data->input_dev =3D devm_input_allocate_device(&wdev->dev);
+	if (!data->input_dev)
+		return -ENOMEM;
+
+	data->input_dev->name =3D "Redmibook WMI keys";
+	data->input_dev->phys =3D "wmi/input0";
+
+	err =3D sparse_keymap_setup(data->input_dev, redmi_wmi_keymap, NULL);
+	if (err)
+		return err;
+
+	return input_register_device(data->input_dev);
+}
+
+static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object =
*obj)
+{
+	struct redmi_wmi *data =3D dev_get_drvdata(&wdev->dev);
+	bool autorelease =3D true;
+	int value =3D 1;
+
+	if (obj->type !=3D ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
+		return;
+	}
+
+	if (obj->buffer.length < 32) {
+		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
+		return;
+	}
+
+	u32 payload =3D get_unaligned_le32(obj->buffer.pointer);
+	struct key_entry *entry =3D sparse_keymap_entry_from_scancode(data->inp=
ut_dev, payload);
+
+	if (!entry) {
+		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
+		return;
+	}
+
+	/* AI key quirk */
+	if (entry->keycode =3D=3D KEY_ASSISTANT) {
+		value =3D !(payload & AI_KEY_VALUE_MASK);
+		autorelease =3D false;
+	}
+
+	/* For linearizability */
+	guard(mutex)(&data->key_lock);
+	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
+}
+
+static const struct wmi_device_id redmi_wmi_id_table[] =3D {
+	{ WMI_REDMIBOOK_KEYBOARD_EVENT_GUID, NULL },
+	{ }
+};
+
+static struct wmi_driver redmi_wmi_driver =3D {
+	.driver =3D {
+		.name =3D "redmi-wmi",
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS
+	},
+	.id_table =3D redmi_wmi_id_table,
+	.probe =3D redmi_wmi_probe,
+	.notify =3D redmi_wmi_notify,
+	.no_singleton =3D true,
+};
+module_wmi_driver(redmi_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, redmi_wmi_id_table);
+MODULE_AUTHOR("Gladyshev Ilya <foxido@foxido.dev>");
+MODULE_DESCRIPTION("Redmibook WMI driver");
+MODULE_LICENSE("GPL");
--=20
2.50.0


