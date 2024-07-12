Return-Path: <linux-input+bounces-4991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FD92F4EC
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4B71F2271D
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3647D3C099;
	Fri, 12 Jul 2024 05:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1Og2Rkp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E02744E;
	Fri, 12 Jul 2024 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761548; cv=none; b=Mpz/sit3Us4tiGiUzemvYC6KK6tCuhYXwvvevEGv+CwhkwsKfprVyfLOe9ort30iFggH9ewX+v08byTyCuei1sVGcV0vBYbr7Y4/xGwQxeB7g3UQyeVlmsh7mo5n3uDsTybAm59vFl9pEN7VpErvZN22PI1CDz2ED3E/xRRMFCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761548; c=relaxed/simple;
	bh=fTcLjuZPxcAF/chYZp3qpmVvmgMoeulkbrhYgOBsWvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgAwBxUvni242rcr2CyXSk4UnMUfeBwEbNn4FXFLMpjMbHuHhMFlCW3yq7xog/SB4OmpkH7goax0qPv2y/nd6ZRIcuCMy6K/Fg65BiFlO39ZhdZe9HJ62HQIuihVpJUG27ZR6+uOyk4d5CJtNWGh/WzS0UlWJBGOfxitfXXjT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1Og2Rkp; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9cc681ee4so832321b6e.0;
        Thu, 11 Jul 2024 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761544; x=1721366344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/BRz+lp5JToKR2qecU6LCfvsua/98uDjuU+S8tlz78=;
        b=F1Og2Rkp/1M1o2lbpubZTR7O/eYUuZJfFCGZPucWPDwYKi50nTERRlp5RSy4CY3nXM
         WvzwICvDbb/0VwTimUV37DN/2U+rAhiE6TqUMM8lianw7/DQo1arEcA1arqG2vQ07OFk
         z0Xey0OM1dZGbu17GcplM4KFu3NVCx3Qmf/s/TpILZW7WI9AoIUhQYh1iMz5mj/o4ksG
         ZPesZVDxkxt3jIG8IQs8m7H4HOC7EGBeMSBErWjO0KvaCVlpZQgBMYCdoL1Y56UQQLWS
         SxU7z8n5aLbiflExsPlOeOidzF8Rf1TuUZRR8Ze0OhiRZN/oExVDijdgpulxTlzF66w4
         dmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761544; x=1721366344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/BRz+lp5JToKR2qecU6LCfvsua/98uDjuU+S8tlz78=;
        b=Z9bluBgfGE99b0au/GM+1p1GewQVVfpYWvxzeEP90PYnkrS+TLhof1x/Okrqyel7c2
         t2NB71shfPcSQgngVAMPzR9eEHTsaHY0nRrZAu4U6yZgJkQv5fOaF7hE4LuGev8XIM0L
         ZKKej52bMUgqk1xYpB3dl6RXhzuuMTro+BY5c3xrSQrv2EbVA1fA384KVamrNhIBw8RL
         rW/e4O9GrVi33crrsKLMa9w9vMpcM/LQ1gWZousxYGiLVmbY7Jh1dM9LFachMK8jCvXh
         AivKR/L9EGRsH6NIddtIT2I1ebiIJPhHskq/zBCkpYJz/G573aOlwNQIpxEyVBOKn1g+
         YeTg==
X-Forwarded-Encrypted: i=1; AJvYcCXlx/seYF0UM7P4IfmDPYsC0TdWnpNbFPyM/dGgyU/+2Csdg0gXWisGyk2jGLqb6Gp7um6eViZ8yGIqQK6YNbyaniLCps7xic3kC3fN
X-Gm-Message-State: AOJu0YzCB/Z80VM9O+gqrJW96WuoL6ICJsI/EY9Ma/YINw34N69k6G+h
	rDWXU7bkE3mbrUFutvrfHdtdvtLrS9zabXxofWi6FYuaZzsZzKydZmLIWw==
X-Google-Smtp-Source: AGHT+IEFjvPvMtRn+5IjKcQEa+UMjWng75hFyUhIL74WR7WmEw9TfNW4vLZirRPCCkyAlhB7nKCvlA==
X-Received: by 2002:a54:4094:0:b0:3d9:dabc:7b76 with SMTP id 5614622812f47-3d9dabc7fe4mr6655462b6e.23.1720761544176;
        Thu, 11 Jul 2024 22:19:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Input: usbtouchscreen - split device info table into individual pieces
Date: Thu, 11 Jul 2024 22:18:48 -0700
Message-ID: <20240712051851.3463657-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a single table containing information about various
touchscreens and enums to match the driver ID table data with chip
information define individual per-protocol instances of
usbtouch_device_info structure and reference them directly from
the usbtouch_devices ID table. This is simpler, safer, and uses less
memory in case some protocols are disabled.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 624 ++++++++++-----------
 1 file changed, 293 insertions(+), 331 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 813a04ba75a2..ecde2eaf1f72 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -106,32 +106,6 @@ struct usbtouch_usb {
 };
 
 
-/* device types */
-enum {
-	DEVTYPE_IGNORE = -1,
-	DEVTYPE_EGALAX,
-	DEVTYPE_PANJIT,
-	DEVTYPE_3M,
-	DEVTYPE_ITM,
-	DEVTYPE_ETURBO,
-	DEVTYPE_GUNZE,
-	DEVTYPE_DMC_TSC10,
-	DEVTYPE_IRTOUCH,
-	DEVTYPE_IRTOUCH_HIRES,
-	DEVTYPE_IDEALTEK,
-	DEVTYPE_GENERAL_TOUCH,
-	DEVTYPE_GOTOP,
-	DEVTYPE_JASTEC,
-	DEVTYPE_E2I,
-	DEVTYPE_ZYTRONIC,
-	DEVTYPE_TC45USB,
-	DEVTYPE_NEXIO,
-	DEVTYPE_ELO,
-	DEVTYPE_ETOUCH,
-};
-
-static const struct usbtouch_device_info usbtouch_dev_info[];
-
 /*****************************************************************************
  * e2i Part
  */
@@ -164,6 +138,16 @@ static int e2i_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info e2i_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x7fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x7fff,
+	.rept_size	= 6,
+	.init		= e2i_init,
+	.read_data	= e2i_read_data,
+};
 #endif
 
 
@@ -247,6 +231,17 @@ static int egalax_get_pkt_len(unsigned char *buf, int len)
 
 	return 0;
 }
+
+static const struct usbtouch_device_info egalax_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x07ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x07ff,
+	.rept_size	= 16,
+	.get_pkt_len	= egalax_get_pkt_len,
+	.read_data	= egalax_read_data,
+	.init		= egalax_init,
+};
 #endif
 
 /*****************************************************************************
@@ -293,6 +288,16 @@ static int etouch_get_pkt_len(unsigned char *buf, int len)
 
 	return 0;
 }
+
+static const struct usbtouch_device_info etouch_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x07ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x07ff,
+	.rept_size	= 16,
+	.get_pkt_len	= etouch_get_pkt_len,
+	.read_data	= etouch_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -307,6 +312,15 @@ static int panjit_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info panjit_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 8,
+	.read_data	= panjit_read_data,
+};
 #endif
 
 
@@ -340,39 +354,6 @@ struct mtouch_priv {
 	u8 fw_rev_minor;
 };
 
-static ssize_t mtouch_firmware_rev_show(struct device *dev,
-				struct device_attribute *attr, char *output)
-{
-	struct usb_interface *intf = to_usb_interface(dev);
-	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
-	struct mtouch_priv *priv = usbtouch->priv;
-
-	return sysfs_emit(output, "%1x.%1x\n",
-			  priv->fw_rev_major, priv->fw_rev_minor);
-}
-static DEVICE_ATTR(firmware_rev, 0444, mtouch_firmware_rev_show, NULL);
-
-static struct attribute *mtouch_attrs[] = {
-	&dev_attr_firmware_rev.attr,
-	NULL
-};
-
-static bool mtouch_group_visible(struct kobject *kobj)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct usb_interface *intf = to_usb_interface(dev);
-	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
-
-	return usbtouch->type == &usbtouch_dev_info[DEVTYPE_3M];
-}
-
-DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
-
-static const struct attribute_group mtouch_attr_group = {
-	.is_visible = SYSFS_GROUP_VISIBLE(mtouch),
-	.attrs = mtouch_attrs,
-};
-
 static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
 {
 	struct usb_device *udev = interface_to_usbdev(usbtouch->interface);
@@ -467,6 +448,51 @@ static void mtouch_exit(struct usbtouch_usb *usbtouch)
 
 	kfree(priv);
 }
+
+static struct usbtouch_device_info mtouch_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x4000,
+	.min_yc		= 0x0,
+	.max_yc		= 0x4000,
+	.rept_size	= 11,
+	.read_data	= mtouch_read_data,
+	.alloc		= mtouch_alloc,
+	.init		= mtouch_init,
+	.exit		= mtouch_exit,
+};
+
+static ssize_t mtouch_firmware_rev_show(struct device *dev,
+				struct device_attribute *attr, char *output)
+{
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
+	struct mtouch_priv *priv = usbtouch->priv;
+
+	return sysfs_emit(output, "%1x.%1x\n",
+			  priv->fw_rev_major, priv->fw_rev_minor);
+}
+static DEVICE_ATTR(firmware_rev, 0444, mtouch_firmware_rev_show, NULL);
+
+static struct attribute *mtouch_attrs[] = {
+	&dev_attr_firmware_rev.attr,
+	NULL
+};
+
+static bool mtouch_group_visible(struct kobject *kobj)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
+
+	return usbtouch->type == &mtouch_dev_info;
+}
+
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
+
+static const struct attribute_group mtouch_attr_group = {
+	.is_visible = SYSFS_GROUP_VISIBLE(mtouch),
+	.attrs = mtouch_attrs,
+};
 #endif
 
 
@@ -501,6 +527,16 @@ static int itm_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info itm_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.max_press	= 0xff,
+	.rept_size	= 8,
+	.read_data	= itm_read_data,
+};
 #endif
 
 
@@ -535,6 +571,16 @@ static int eturbo_get_pkt_len(unsigned char *buf, int len)
 		return 3;
 	return 0;
 }
+
+static const struct usbtouch_device_info eturbo_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x07ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x07ff,
+	.rept_size	= 8,
+	.get_pkt_len	= eturbo_get_pkt_len,
+	.read_data	= eturbo_read_data,
+};
 #endif
 
 
@@ -553,6 +599,15 @@ static int gunze_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info gunze_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 4,
+	.read_data	= gunze_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -636,6 +691,16 @@ static int dmc_tsc10_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info dmc_tsc10_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x03ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x03ff,
+	.rept_size	= 5,
+	.init		= dmc_tsc10_init,
+	.read_data	= dmc_tsc10_read_data,
+};
 #endif
 
 
@@ -651,6 +716,24 @@ static int irtouch_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info irtouch_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 8,
+	.read_data	= irtouch_read_data,
+};
+
+static const struct usbtouch_device_info irtouch_hires_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x7fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x7fff,
+	.rept_size	= 8,
+	.read_data	= irtouch_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -665,6 +748,15 @@ static int tc45usb_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info tc45usb_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 5,
+	.read_data	= tc45usb_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -704,6 +796,16 @@ static int idealtek_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 		return 0;
 	}
 }
+
+static const struct usbtouch_device_info idealtek_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 8,
+	.get_pkt_len	= idealtek_get_pkt_len,
+	.read_data	= idealtek_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -719,6 +821,15 @@ static int general_touch_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info general_touch_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x7fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x7fff,
+	.rept_size	= 7,
+	.read_data	= general_touch_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -733,6 +844,15 @@ static int gotop_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info gotop_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x03ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x03ff,
+	.rept_size	= 4,
+	.read_data	= gotop_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -747,6 +867,15 @@ static int jastec_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
+
+static const struct usbtouch_device_info jastec_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.rept_size	= 4,
+	.read_data	= jastec_read_data,
+};
 #endif
 
 /*****************************************************************************
@@ -783,6 +912,16 @@ static int zytronic_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 0;
 }
+
+static const struct usbtouch_device_info zytronic_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x03ff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x03ff,
+	.rept_size	= 5,
+	.read_data	= zytronic_read_data,
+	.irq_always     = true,
+};
 #endif
 
 /*****************************************************************************
@@ -1019,6 +1158,15 @@ static int nexio_read_data(struct usbtouch_usb *usbtouch, unsigned char *pkt)
 	}
 	return 0;
 }
+
+static const struct usbtouch_device_info nexio_dev_info = {
+	.rept_size	= 1024,
+	.irq_always	= true,
+	.read_data	= nexio_read_data,
+	.alloc		= nexio_alloc,
+	.init		= nexio_init,
+	.exit		= nexio_exit,
+};
 #endif
 
 
@@ -1037,232 +1185,17 @@ static int elo_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 
 	return 1;
 }
-#endif
-
-
-/*****************************************************************************
- * the different device descriptors
- */
-static const struct usbtouch_device_info usbtouch_dev_info[] = {
-#ifdef CONFIG_TOUCHSCREEN_USB_ELO
-	[DEVTYPE_ELO] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.max_press	= 0xff,
-		.rept_size	= 8,
-		.read_data	= elo_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_EGALAX
-	[DEVTYPE_EGALAX] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x07ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x07ff,
-		.rept_size	= 16,
-		.get_pkt_len	= egalax_get_pkt_len,
-		.read_data	= egalax_read_data,
-		.init		= egalax_init,
-	},
-#endif
 
-#ifdef CONFIG_TOUCHSCREEN_USB_PANJIT
-	[DEVTYPE_PANJIT] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 8,
-		.read_data	= panjit_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_3M
-	[DEVTYPE_3M] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x4000,
-		.min_yc		= 0x0,
-		.max_yc		= 0x4000,
-		.rept_size	= 11,
-		.read_data	= mtouch_read_data,
-		.alloc		= mtouch_alloc,
-		.init		= mtouch_init,
-		.exit		= mtouch_exit,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ITM
-	[DEVTYPE_ITM] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.max_press	= 0xff,
-		.rept_size	= 8,
-		.read_data	= itm_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ETURBO
-	[DEVTYPE_ETURBO] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x07ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x07ff,
-		.rept_size	= 8,
-		.get_pkt_len	= eturbo_get_pkt_len,
-		.read_data	= eturbo_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GUNZE
-	[DEVTYPE_GUNZE] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 4,
-		.read_data	= gunze_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_DMC_TSC10
-	[DEVTYPE_DMC_TSC10] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x03ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x03ff,
-		.rept_size	= 5,
-		.init		= dmc_tsc10_init,
-		.read_data	= dmc_tsc10_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
-	[DEVTYPE_IRTOUCH] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 8,
-		.read_data	= irtouch_read_data,
-	},
-
-	[DEVTYPE_IRTOUCH_HIRES] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x7fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x7fff,
-		.rept_size	= 8,
-		.read_data	= irtouch_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_IDEALTEK
-	[DEVTYPE_IDEALTEK] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 8,
-		.get_pkt_len	= idealtek_get_pkt_len,
-		.read_data	= idealtek_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH
-	[DEVTYPE_GENERAL_TOUCH] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x7fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x7fff,
-		.rept_size	= 7,
-		.read_data	= general_touch_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GOTOP
-	[DEVTYPE_GOTOP] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x03ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x03ff,
-		.rept_size	= 4,
-		.read_data	= gotop_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_JASTEC
-	[DEVTYPE_JASTEC] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 4,
-		.read_data	= jastec_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_E2I
-	[DEVTYPE_E2I] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x7fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x7fff,
-		.rept_size	= 6,
-		.init		= e2i_init,
-		.read_data	= e2i_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ZYTRONIC
-	[DEVTYPE_ZYTRONIC] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x03ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x03ff,
-		.rept_size	= 5,
-		.read_data	= zytronic_read_data,
-		.irq_always     = true,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC45USB
-	[DEVTYPE_TC45USB] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x0fff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x0fff,
-		.rept_size	= 5,
-		.read_data	= tc45usb_read_data,
-	},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_NEXIO
-	[DEVTYPE_NEXIO] = {
-		.rept_size	= 1024,
-		.irq_always	= true,
-		.read_data	= nexio_read_data,
-		.alloc		= nexio_alloc,
-		.init		= nexio_init,
-		.exit		= nexio_exit,
-	},
-#endif
-#ifdef CONFIG_TOUCHSCREEN_USB_EASYTOUCH
-	[DEVTYPE_ETOUCH] = {
-		.min_xc		= 0x0,
-		.max_xc		= 0x07ff,
-		.min_yc		= 0x0,
-		.max_yc		= 0x07ff,
-		.rept_size	= 16,
-		.get_pkt_len	= etouch_get_pkt_len,
-		.read_data	= etouch_read_data,
-	},
-#endif
+static const struct usbtouch_device_info elo_dev_info = {
+	.min_xc		= 0x0,
+	.max_xc		= 0x0fff,
+	.min_yc		= 0x0,
+	.max_yc		= 0x0fff,
+	.max_press	= 0xff,
+	.rept_size	= 8,
+	.read_data	= elo_read_data,
 };
+#endif
 
 
 /*****************************************************************************
@@ -1540,10 +1473,8 @@ static int usbtouch_probe(struct usb_interface *intf,
 	int err = -ENOMEM;
 
 	/* some devices are ignored */
-	if (id->driver_info == DEVTYPE_IGNORE)
-		return -ENODEV;
-
-	if (id->driver_info >= ARRAY_SIZE(usbtouch_dev_info))
+	type = (const struct usbtouch_device_info *)id->driver_info;
+	if (!type)
 		return -ENODEV;
 
 	endpoint = usbtouch_get_input_endpoint(intf->cur_altsetting);
@@ -1556,8 +1487,6 @@ static int usbtouch_probe(struct usb_interface *intf,
 		goto out_free;
 
 	mutex_init(&usbtouch->pm_mutex);
-
-	type = &usbtouch_dev_info[id->driver_info];
 	usbtouch->type = type;
 
 	usbtouch->data_size = type->rept_size;
@@ -1741,106 +1670,139 @@ static const struct attribute_group *usbtouch_groups[] = {
 static const struct usb_device_id usbtouch_devices[] = {
 #ifdef CONFIG_TOUCHSCREEN_USB_EGALAX
 	/* ignore the HID capable devices, handled by usbhid */
-	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0001, USB_INTERFACE_CLASS_HID),
-		.driver_info = DEVTYPE_IGNORE},
-	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0002, USB_INTERFACE_CLASS_HID),
-		.driver_info = DEVTYPE_IGNORE},
+	{ USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0001, USB_INTERFACE_CLASS_HID),
+		.driver_info = 0 },
+	{ USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0002, USB_INTERFACE_CLASS_HID),
+		.driver_info = 0 },
 
 	/* normal device IDs */
-	{USB_DEVICE(0x3823, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x3823, 0x0002), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0123, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0eef, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0eef, 0x0002), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x1234, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x1234, 0x0002), .driver_info = DEVTYPE_EGALAX},
+	{ USB_DEVICE(0x3823, 0x0001),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x3823, 0x0002),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x0123, 0x0001),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x0eef, 0x0001),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x0eef, 0x0002),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x1234, 0x0001),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
+	{ USB_DEVICE(0x1234, 0x0002),
+		.driver_info = (kernel_ulong_t)&egalax_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_PANJIT
-	{USB_DEVICE(0x134c, 0x0001), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0002), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0003), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0004), .driver_info = DEVTYPE_PANJIT},
+	{ USB_DEVICE(0x134c, 0x0001),
+		.driver_info = (kernel_ulong_t)&panjit_dev_info },
+	{ USB_DEVICE(0x134c, 0x0002),
+		.driver_info = (kernel_ulong_t)&panjit_dev_info },
+	{ USB_DEVICE(0x134c, 0x0003),
+		.driver_info = (kernel_ulong_t)&panjit_dev_info },
+	{ USB_DEVICE(0x134c, 0x0004),
+		.driver_info = (kernel_ulong_t)&panjit_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_3M
-	{USB_DEVICE(0x0596, 0x0001), .driver_info = DEVTYPE_3M},
+	{ USB_DEVICE(0x0596, 0x0001),
+		.driver_info = (kernel_ulong_t)&mtouch_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_ITM
-	{USB_DEVICE(0x0403, 0xf9e9), .driver_info = DEVTYPE_ITM},
-	{USB_DEVICE(0x16e3, 0xf9e9), .driver_info = DEVTYPE_ITM},
+	{ USB_DEVICE(0x0403, 0xf9e9),
+		.driver_info = (kernel_ulong_t)&itm_dev_info },
+	{ USB_DEVICE(0x16e3, 0xf9e9),
+		.driver_info = (kernel_ulong_t)&itm_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_ETURBO
-	{USB_DEVICE(0x1234, 0x5678), .driver_info = DEVTYPE_ETURBO},
+	{ USB_DEVICE(0x1234, 0x5678),
+		.driver_info = (kernel_ulong_t)&eturbo_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_GUNZE
-	{USB_DEVICE(0x0637, 0x0001), .driver_info = DEVTYPE_GUNZE},
+	{ USB_DEVICE(0x0637, 0x0001),
+		.driver_info = (kernel_ulong_t)&gunze_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_DMC_TSC10
-	{USB_DEVICE(0x0afa, 0x03e8), .driver_info = DEVTYPE_DMC_TSC10},
+	{ USB_DEVICE(0x0afa, 0x03e8),
+		.driver_info = (kernel_ulong_t)&dmc_tsc10_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
-	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
+	{ USB_DEVICE(0x255e, 0x0001),
+		.driver_info = (kernel_ulong_t)&irtouch_dev_info },
+	{ USB_DEVICE(0x595a, 0x0001),
+		.driver_info = (kernel_ulong_t)&irtouch_dev_info },
+	{ USB_DEVICE(0x6615, 0x0001),
+		.driver_info = (kernel_ulong_t)&irtouch_dev_info },
+	{ USB_DEVICE(0x6615, 0x0012),
+		.driver_info = (kernel_ulong_t)&irtouch_hires_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_IDEALTEK
-	{USB_DEVICE(0x1391, 0x1000), .driver_info = DEVTYPE_IDEALTEK},
+	{ USB_DEVICE(0x1391, 0x1000),
+		.driver_info = (kernel_ulong_t)&idealtek_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH
-	{USB_DEVICE(0x0dfc, 0x0001), .driver_info = DEVTYPE_GENERAL_TOUCH},
+	{ USB_DEVICE(0x0dfc, 0x0001),
+		.driver_info = (kernel_ulong_t)&general_touch_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_GOTOP
-	{USB_DEVICE(0x08f2, 0x007f), .driver_info = DEVTYPE_GOTOP},
-	{USB_DEVICE(0x08f2, 0x00ce), .driver_info = DEVTYPE_GOTOP},
-	{USB_DEVICE(0x08f2, 0x00f4), .driver_info = DEVTYPE_GOTOP},
+	{ USB_DEVICE(0x08f2, 0x007f),
+		.driver_info = (kernel_ulong_t)&gotop_dev_info },
+	{ USB_DEVICE(0x08f2, 0x00ce),
+		.driver_info = (kernel_ulong_t)&gotop_dev_info },
+	{ USB_DEVICE(0x08f2, 0x00f4),
+		.driver_info = (kernel_ulong_t)&gotop_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_JASTEC
-	{USB_DEVICE(0x0f92, 0x0001), .driver_info = DEVTYPE_JASTEC},
+	{ USB_DEVICE(0x0f92, 0x0001),
+		.driver_info = (kernel_ulong_t)&jastec_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_E2I
-	{USB_DEVICE(0x1ac7, 0x0001), .driver_info = DEVTYPE_E2I},
+	{ USB_DEVICE(0x1ac7, 0x0001),
+		.driver_info = (kernel_ulong_t)&e2i_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_ZYTRONIC
-	{USB_DEVICE(0x14c8, 0x0003), .driver_info = DEVTYPE_ZYTRONIC},
+	{ USB_DEVICE(0x14c8, 0x0003),
+		.driver_info = (kernel_ulong_t)&zytronic_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC45USB
 	/* TC5UH */
-	{USB_DEVICE(0x0664, 0x0309), .driver_info = DEVTYPE_TC45USB},
+	{ USB_DEVICE(0x0664, 0x0309),
+		.driver_info = (kernel_ulong_t)&tc45usb_dev_info },
 	/* TC4UM */
-	{USB_DEVICE(0x0664, 0x0306), .driver_info = DEVTYPE_TC45USB},
+	{ USB_DEVICE(0x0664, 0x0306),
+		.driver_info = (kernel_ulong_t)&tc45usb_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_NEXIO
 	/* data interface only */
-	{USB_DEVICE_AND_INTERFACE_INFO(0x10f0, 0x2002, 0x0a, 0x00, 0x00),
-		.driver_info = DEVTYPE_NEXIO},
-	{USB_DEVICE_AND_INTERFACE_INFO(0x1870, 0x0001, 0x0a, 0x00, 0x00),
-		.driver_info = DEVTYPE_NEXIO},
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x10f0, 0x2002, 0x0a, 0x00, 0x00),
+		.driver_info = (kernel_ulong_t)&nexio_dev_info },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x1870, 0x0001, 0x0a, 0x00, 0x00),
+		.driver_info = (kernel_ulong_t)&nexio_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_ELO
-	{USB_DEVICE(0x04e7, 0x0020), .driver_info = DEVTYPE_ELO},
+	{ USB_DEVICE(0x04e7, 0x0020),
+		.driver_info = (kernel_ulong_t)&elo_dev_info },
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_EASYTOUCH
-	{USB_DEVICE(0x7374, 0x0001), .driver_info = DEVTYPE_ETOUCH},
+	{ USB_DEVICE(0x7374, 0x0001),
+		.driver_info = (kernel_ulong_t)&etouch_dev_info },
 #endif
 
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(usb, usbtouch_devices);
 
-- 
2.45.2.993.g49e7a77208-goog


