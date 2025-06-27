Return-Path: <linux-input+bounces-13136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8688AEBE30
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 19:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F77189620D
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 17:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4132EA73A;
	Fri, 27 Jun 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRQtHRQX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454652EA162;
	Fri, 27 Jun 2025 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043888; cv=none; b=YYNYcbsI1AC4GJksoUtS+a468VJsq1DoU9+6VgquHa+HIJIJ/k4PylTjZM/gYobJu62LY9NYPhsctvrmALMtx4tYxdoMoJ9Ho6e1GNd316JMBARewivIAwUrVY/HsOASpIaqy13M4gQ9Ymzj2u4G4CxHe9dwFDKf4V3k7SRwMCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043888; c=relaxed/simple;
	bh=No+wuCe/tIjYr5O7xl1ig1e/CPEA7GnvRaS/TCSraIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfg+4Ij3Vg6zRpnksOieyOIhZNDnjw/O5Leb8z0wlwpuaSvNHQYPf1yN2BtNVOz/R8HK9dQQxYBnVSWLm0bCBfYm028/cX1Trf4EZp5q8R2Fb3TPUvi1/p4tGBwYHD1BUdP2FQ+f7br+0Ty2Cw3WS2nRvIO2o1sGkQdfYufZjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRQtHRQX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2540383b3a.2;
        Fri, 27 Jun 2025 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751043885; x=1751648685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/5PezlxnjZrbHkP3cgxpGJy4eDTLe4cMi4EVTPNnAo=;
        b=cRQtHRQX91GWZRXT4OqXuXrmX6DxqbjkLdAE584bcVH8bNSxvI/qlIoiP1rI7dmkTL
         eVBh5ax+wXovgUy6WJB09Q2iUoZEC6kQ8oAzj8tFUuLBrMu0w+xWszODCDCanYgNFWeC
         MI05hMETTLdsiInYqsLhfYWbc3x/3iixd/Cm0ov2eZscP6ymTt5eIc/2AuVy/7qNcQxI
         TRpwGqr2t/AdEBwh7ZRJi3HuqtXuAg3XJtvcYoTLllF1depmSRe+zY+D+ku/DqfPn3NK
         bdeog8Tq29u4tx0subiifgp2X9OeKq4J1Iaw51VJIABEtj5uuzhHHuKCkyvzbApRwKhA
         OFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751043885; x=1751648685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/5PezlxnjZrbHkP3cgxpGJy4eDTLe4cMi4EVTPNnAo=;
        b=ZieOsWH9D5p1qC78RF/XEY+BnMz2j16/Fe5D+fN9mQXFp6nlzAjEvNflVCoN6bwuNp
         l6/opI1y0X4NLR+abBIg7SwRRWKm3QnVIq/Oc6NDAf3qLOXl5MrehZo7EF4Gvdx/r0Q7
         666lwQX+OajtWknp56sT8ZnuT4ACRt2Zrd+MQjNkU6GvLiWM7NPjPm30AM7wviZix3uC
         3FmxwqSatCEKiZZcLA/5ToCKUXBeDjpOV5wWo1aENCClRGw4r2YsRbrFA7heA70LSZf1
         Gq5OU6WI4924bX6FnrQ1NJYFtHgVRlrPvZAIThGT1L90G2uF58SsGR197Mg4GNRvATL3
         LIpw==
X-Forwarded-Encrypted: i=1; AJvYcCXIqakSOgJuM7szE20BtWbdFlFuMSPyl3qoiTQ3AHHxbOPVKnIYEbPdhrTGPJcdoh7vx5LDCeaizJXAVD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGK2T3PHSdPVRw1Pw8fR37464gCqVzM1vD+wp+x2cO7ZopD4Mm
	Ic3ljewlUmOa3vHdp3N3LKoSsH0Q6klh4jGym0wO3l83g5EvErKNF9P0f6LQWu6HZyBRDEn6
X-Gm-Gg: ASbGncsoRixNLyruKi5lJUz7lN+UPC4x6xG/4rREt8LsXRj4n2VIIcHFUAzB3Nhlkn2
	gM9CCc58rZV/yjmuxdLIxDHLnAMo5SApnA7e6iNww7NN63Ya699aVkiC8HUhp00Q4r2n3H/dK30
	9gyOCyUBohGYHK7Qo37ekxDOSzsyvI0OHHLBmb2AgTx9rZwYm3yVygKJSm5+MUg8AhLiVuPLGZQ
	bPn6clsfTcvQzzRTOCzjfmsxgqOt7k3dNgkrDh3rF4qfmZ7arpFMIgXbd0NA+4yEFrWqM+6VUzc
	GKnFJxvvR7DH99+D4PuFYLTeg0O/bBJRItqZv20d+PmTYAzHmLD0ueVMOfmjrZw5UjZ6C9iYduQ
	E94E6grSZYAIaTBG0cdc=
X-Google-Smtp-Source: AGHT+IHtSOboieq26f8FxmQImnoqo69iFml/sbhGorgHggHV/+81pdSqdzA0F8u/YFtciuzcaRUo3g==
X-Received: by 2002:a05:6a00:3d14:b0:748:edf5:95de with SMTP id d2e1a72fcca58-74af6e9f834mr5259526b3a.10.1751043885160;
        Fri, 27 Jun 2025 10:04:45 -0700 (PDT)
Received: from localhost.localdomain ([2402:800:61b0:46ba:b722:c530:9812:c27c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm2760775b3a.70.2025.06.27.10.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:04:44 -0700 (PDT)
From: Nguyen Dinh Dang Duong <dangduong31205@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Dinh Dang Duong <dangduong31205@gmail.com>
Subject: [PATCH] HID: rapoo: Add support for side buttons on RAPOO 0x2015 mouse
Date: Sat, 28 Jun 2025 00:04:23 +0700
Message-ID: <20250627170425.11166-1-dangduong31205@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for handling the side buttons
on the RAPOO 0x2015 wireless mouse. These buttons were
previously not generating input events due to missing
driver logic.

The new code handles raw HID input report with Report
ID 1 and maps the side buttons to KEY_BACK and KEY_FORWARD
using the input subsystem.

Tested on a RAPOO mouse with USB ID 24AE:2015.

Signed-off-by: Nguyen Dinh Dang Duong <dangduong31205@gmail.com>
---
 drivers/hid/Kconfig     |   6 +++
 drivers/hid/Makefile    |   1 +
 drivers/hid/hid-ids.h   |   3 ++
 drivers/hid/hid-rapoo.c | 101 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+)
 create mode 100644 drivers/hid/hid-rapoo.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 43859fc75..cf58e811e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1004,6 +1004,12 @@ config HID_PXRC
        To compile this driver as a module, choose M here: the
        module will be called hid-pxrc.
 
+config HID_RAPOO
+	tristate "Rapoo non-fully HID-compliant devices"
+	help
+	Support for Rapoo devices that are not fully compliant with the
+	HID standard.
+
 config HID_RAZER
 	tristate "Razer non-fully HID-compliant devices"
 	help
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedb..4a1944184 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_HID_PLANTRONICS)	+= hid-plantronics.o
 obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
 obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
 obj-$(CONFIG_HID_PXRC)		+= hid-pxrc.o
+obj-$(CONFIG_HID_RAPOO) += hid-rapoo.o
 obj-$(CONFIG_HID_RAZER)	+= hid-razer.o
 obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
 obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c6468568a..abfa62041 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1144,6 +1144,9 @@
 #define I2C_PRODUCT_ID_RAYDIUM_4B33	0x4b33
 #define I2C_PRODUCT_ID_RAYDIUM_3118	0x3118
 
+#define USB_VENDOR_ID_RAPOO			0x24ae
+#define USB_DEVICE_ID_RAPOO_2_4G_RECEIVER	0x2015
+
 #define USB_VENDOR_ID_RAZER            0x1532
 #define USB_DEVICE_ID_RAZER_BLACKWIDOW_ULTIMATE   0x010D
 #define USB_DEVICE_ID_RAZER_BLACKWIDOW            0x010e
diff --git a/drivers/hid/hid-rapoo.c b/drivers/hid/hid-rapoo.c
new file mode 100644
index 000000000..4c81f3086
--- /dev/null
+++ b/drivers/hid/hid-rapoo.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <asm-generic/errno-base.h>
+#include <asm-generic/int-ll64.h>
+#include <linux/bitops.h>
+#include <linux/input.h>
+#include <linux/input-event-codes.h>
+#include <linux/module.h>
+#include <linux/hid.h>
+#include <linux/usb.h>
+
+#include "hid-ids.h"
+
+#define RAPOO_BTN_BACK			0x08
+#define RAPOO_BTN_FORWARD		0x10
+
+static const struct hid_device_id rapoo_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_2_4G_RECEIVER) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, rapoo_devices);
+
+static int rapoo_probe(struct hid_device *hdev, const struct hid_device_id *id)
+{
+	int ret;
+	struct input_dev *input;
+
+	ret = hid_parse(hdev);
+	if (ret) {
+		hid_err(hdev, "parse failed\n");
+		return ret;
+	}
+
+	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	if (ret) {
+		hid_err(hdev, "start failed\n");
+		return ret;
+	}
+
+	if (hdev->bus == BUS_USB) {
+		struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
+
+		if (intf->cur_altsetting->desc.bInterfaceNumber != 1)
+			return 0;
+	}
+
+	input = devm_input_allocate_device(&hdev->dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "Rapoo 2.4G Wireless Mouse";
+	input->phys = "rapoo/input1";
+	input->id.bustype = hdev->bus;
+	input->id.vendor = hdev->vendor;
+	input->id.product = hdev->product;
+	input->id.version = hdev->version;
+
+	__set_bit(EV_KEY, input->evbit);
+	__set_bit(KEY_BACK, input->keybit);
+	__set_bit(KEY_FORWARD, input->keybit);
+
+	ret = input_register_device(input);
+	if (ret)
+		return ret;
+
+	hid_set_drvdata(hdev, input);
+
+	return ret;
+}
+
+static int rapoo_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
+{
+	struct input_dev *input = hid_get_drvdata(hdev);
+
+	if (!input)
+		return 0;
+
+	if (report->id == 1 && size >= 2) {
+		u8 btn = data[1];
+
+		input_report_key(input, KEY_BACK, btn & RAPOO_BTN_BACK);
+		input_report_key(input, KEY_FORWARD, btn & RAPOO_BTN_FORWARD);
+		input_sync(input);
+		return 1;
+	}
+
+	return 0;
+}
+
+static struct hid_driver rapoo_driver = {
+	.name = "hid-rapoo",
+	.id_table = rapoo_devices,
+	.probe = rapoo_probe,
+	.raw_event = rapoo_raw_event,
+};
+
+module_hid_driver(rapoo_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Nguyen Dinh Dang Duong <dangduong31205@gmail.com>");
+MODULE_DESCRIPTION("RAPOO 2.4G Wireless Device Driver");
+
-- 
2.50.0


