Return-Path: <linux-input+bounces-13726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FFB16699
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 20:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 107B317A605
	for <lists+linux-input@lfdr.de>; Wed, 30 Jul 2025 18:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0652E0409;
	Wed, 30 Jul 2025 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b="LFOuNDOm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="Uyx5C+55";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b="IzefgpgP"
X-Original-To: linux-input@vger.kernel.org
Received: from sender6.mail.selcloud.ru (sender6.mail.selcloud.ru [5.8.75.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E7B2E040D;
	Wed, 30 Jul 2025 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.8.75.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753901849; cv=none; b=Z7lxab2O+d2x53Xo+hn3ajRVtjoXiTHmCAvOlDDmgfIzE5ebI84peoBNJcY1wFNm2mO8HGWukpPXKzFi3bOiermg+89m5KeeCG9y1t+vMm28aHdQ9QeMS3Vy6Rz/+z/DBOUb/98vqKDCBJX9aOpT/MDzMawwTB2qVFgSJjPqvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753901849; c=relaxed/simple;
	bh=046a63qWt97W4qUsw19vK9WvukUJj/1gstAKzeftaWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxyC+mLDaO6lOsGd1gNlszUY+VhyIqKWROSKcaFd6rdQHfMpI83R+Bc3eWRfO55jKz8Eg9BxvWMcvAQVKuF5B42t5F7jVCZ8FFry2W22431T4np1XdW+bQ/lwkuDbTVTva9Fk1heGrHJ1y0i28kRJdjSpHxNkFQInKqgwHZgZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev; spf=pass smtp.mailfrom=mail.selcloud.ru; dkim=pass (1024-bit key) header.d=mail.selcloud.ru header.i=@mail.selcloud.ru header.b=LFOuNDOm; dkim=pass (1024-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=Uyx5C+55; dkim=fail (2048-bit key) header.d=foxido.dev header.i=@foxido.dev header.b=IzefgpgP reason="signature verification failed"; arc=none smtp.client-ip=5.8.75.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxido.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.selcloud.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.selcloud.ru; s=selcloud; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Help:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EAWk/VZVT6FtLIzp7yLEpQc/s81hLBk2+uT6GH2SPck=; t=1753901845; x=1754074645;
	 b=LFOuNDOmflcGvp28RdMcMUJ04OdqPVYSxYYYb5a60/C0O2FfXA+Qyrd/l0yFzd+NU9v30+efyp
	LblaEn/RghqCpui5Itc3BWk/UayLoSFAcrmiKx+qsDBCaX9b0mdGU7e0L7BvVPmlM7dUgR9HxkXIx
	dkT41Ii8AcYjw06+mKBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=foxido.dev;
	 s=selcloud; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject
	:Cc:To:From:List-id:List-Unsubscribe:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Help:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=EAWk/VZVT6FtLIzp7yLEpQc/s81hLBk2+uT6GH2SPck=;
	t=1753901845; x=1754074645; b=Uyx5C+55o7sgROraXTbYZhrUZX+C0Tfr9eMlAawQ34JvUYb
	3VkL+ykQMOUy3SOgl85maJKIAFDMSaB4h0DZOs0795T5jbGQpzvdXwNRIr+f3/BJ0Kl1e3tkfPPoL
	MYfFys7XR7E3wQi21wa6BVLeK8/WA4XeoFdA/G9Y7iJOgGA=;
Precedence: bulk
X-Issuen: 1120529
X-User: 280060488
X-Postmaster-Msgtype: 3849
Feedback-ID: 1120529:15965:3849:samotpravil
X-From: foxido.dev
X-from-id: 15965
X-MSG-TYPE: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-blist-id: 3849
X-Gungo: 20250728.224157
X-SMTPUID: mlgnr60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxido.dev; s=dkim;
	t=1753901836; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=IxgYNAMOATuJkMUPc2HzQecFSd+a8bOZ5WucgUpaVSw=;
	b=IzefgpgPfIcUei49/BJt235d8H57LQe3qGdqp2Ws6KIAM144mvRRVQhego5UOBtWmHoE8E
	m5X6nR//Dk/fX3pYaW572M3dX0RWjRrpjePns+1CW0zVnO1l3efb6CiQ0pPZazdDfoqZBd
	nVeqSsQurSfy9I0s+HjQBDFvD6jkwj88yMcOm7KciVyoYtZAH4OXjvj/wMDXvLPMfs2ul8
	I6jETXIlWedJN5dlKYgX9iLjzlgYaGsQnxMLrpIrZHIrlO47n3uAFql0ew6axalpqyf4no
	V1SxujtQfjskyROb8cDSPu0RAzY2o2uNdhPMgzvyA+46aR6kBW4dBYfSRaNTHw==
From: Gladyshev Ilya <foxido@foxido.dev>
To: foxido@foxido.dev
Cc: w_armin@gmx.de,
	linux-input@vger.kernel.org,
	nikita.nikita.krasnov@gmail.com,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] platform/x86: Add WMI driver for Redmibook keyboard.
Date: Wed, 30 Jul 2025 21:56:09 +0300
Message-ID: <20250730185619.8725-1-foxido@foxido.dev>
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

Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
---
Changes since v2:
- Fix Kconfig dependencies
- Accept WMI buffers that are bigger than expected

Link to v2: https://lore.kernel.org/platform-driver-x86/20250729190528.84=
46-1-foxido@foxido.dev/
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
index 000000000000..3dbf4a40a4ff
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
+	/* For linearizability */
+	guard(mutex)(&data->key_lock);
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
+	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
+}
+
+static const struct wmi_device_id redmi_wmi_id_table[] =3D {
+	{ .guid_string =3D WMI_REDMIBOOK_KEYBOARD_EVENT_GUID },
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


