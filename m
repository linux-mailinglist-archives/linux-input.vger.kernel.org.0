Return-Path: <linux-input+bounces-15793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456BC1CAFD
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 19:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76E9A4E0467
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 18:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C58882F83A7;
	Wed, 29 Oct 2025 18:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.es header.i=@yahoo.es header.b="m85wuHYH"
X-Original-To: linux-input@vger.kernel.org
Received: from sonic311-31.consmr.mail.ir2.yahoo.com (sonic311-31.consmr.mail.ir2.yahoo.com [77.238.176.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7802E304967
	for <linux-input@vger.kernel.org>; Wed, 29 Oct 2025 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761761159; cv=none; b=AsmCRsfrxAfIL/Kmfz/SoNZELkE/0/DJxOX2wDgZNcrBx0FyhwKsrFRRtxwhe2N463bvfDlQMrjbWtVDii2TWv6au0cm7pBX0GBJzX3Wog2FhY87LdzHq0flzyQJvh8eRiM3rzfJQqrJZHpmcSFZWSu8nxR4FlWJW/sH3/q7AiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761761159; c=relaxed/simple;
	bh=/c1SKVT+/sqM24y7+5cf+duOQ9Kmzf+Gs+LYzXJnSr8=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 Content-Type; b=m4e+R0gDW2qW63Fm2rGIAuHrgdaLeKy4iQ7PD1FTv82hyvEpHt/wuVbkXKHD7E4OZcmVapFuBVbNfTDda3vbCfREXuSoVt7AVE+4X/23UIwyVu4m96oE2gVNRiWIL+xrxx+ySZNc63E1M0aQpuRiZ3cl1uk4l6DjC/PztQ36dsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.es; spf=pass smtp.mailfrom=yahoo.es; dkim=pass (2048-bit key) header.d=yahoo.es header.i=@yahoo.es header.b=m85wuHYH; arc=none smtp.client-ip=77.238.176.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.es; s=s2048; t=1761761155; bh=oe0Kv1b4fjnOqql4FKQTzbzKXqF0dLoqMVE7IYGGkeo=; h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To; b=m85wuHYHxk5lAeTcIr+h838sTQaQX6JlYHQS+2RXzJ+c8sCM56u68Z8QFhTCbcwOnJJ3PCMogP6ddFtVzixqLBAUyASx/ajJ57Wf3WYfQo55I47FYwxRDuFNTEcKQx62KLlLfUIKCVD1ov5E6DpAm9EYTn9NstxIgGzYAFeBvolNAHIKJcqIULAAeTW1891BNJAm70ccVtoSW7gBWGweKZlcXH1v4Maufj/wKSgscueCVe8EIuUITOQKfi6yJYNr9DLIPsPVkgyfXQuSmaoLK6YJC+WdIwPk8vZuq67JKOn7eOdwrd2Axg6HGy9qSbSr8QAXthn9QHb5+sWDDwQSYQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1761761155; bh=DzVNnecEQhYrjctOF+Z5wMUfeP7RhGEmqIUoBMxYq/r=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=YeOocdCG7x3DQfauY2jDht9xhhpzyEGbj+dgaaFjfjjJkWoEFb5AD85WAgQAV0TjuhT8HvxwNNeux843j3JisJTwdQrfao9pdK2rBVUD2HxQoNxeRGX54TQZtdmNgKeipH/OuAFMpzQfY9Jeh/6S64vt6grP1YwJ+7kJKORgMqAkxoLTw/m7/ChkuDaMTMmuHGYGRRt5jgRLts2toeXrkIUDniNTA6oVNLXX00uDg5I8/gdiE3OMUWuGu1P2ZvoTmpR4VE/7xynX8KqSBYetipJmEH7JaqlWVDGfYYV+RtXYHAwM6DS8dpfl7kDwWaOsRdLcwe1OKl821fGlUz6oaw==
X-YMail-OSG: KaUStcwVM1kpCrpkWMF2a6Q44HqAxzDSx6VNwLaGPIvPe600NwrB.x3bVNYNcZg
 7qkN9guNrbBj2WwU1DgStMFerq.iNDabi4iPSpiqMFwvTRDBVyu6ptklt5zf2CKzuubZ4C8InxmD
 8d.B.czkfKBvJcf7V2c9kEcvMF3cDUkU8QcMZtzp0oxbMyJ4Q2wN0VVnA1NYWpm8VrZ53ueJVMSV
 GeY80kgVHAT6AVzyP8WEEgM2yZk.QAFevnQtSu3XMSrw3sZY7g_df9AP3on8KrHuPFe_k_JLqyGR
 ul3eJWCymxAeV1NazLsYzfSEy1vhFzePPV9kWNxtbUGxuCQquQGqYGxXyLM3tko3jKGYN73b9cCq
 8d8BpsuMlgrUTrTyV9p8C9nZhiSz7OxoXTrvlqDL23z6mIAzOHYAViw9YWtYYOdLxCMkeIWZ_wcD
 Yo3xAMHtnXEBDdOPL05TnWyxO4q.s3oKfDxBovHnmQOr3ic1IAoArIZlrN8sCysCfb00tDYg2hOQ
 m1tpSLzw3x0XGo0MSdLtRiNR8APFZuyl9zVUwwSqjNlzxAgYqCE8ZHeNd1rYZHbHUn_onl4FSPir
 bjf1aM5TKPyWD62w2lNSHOeTjT6IZiKMSp1R.NwQOu3vFt8NK5xc7MLWfvdoFz6SHsywBcmPzwiI
 k5Wcrvxp2mPGFNaS7iHZLFXvZOWjzqsPTcyUuKXYXslS9sw_MAtyhNCZwCGuzXqTejysKSeqtUxZ
 AhgB7m6MX3UifCrgg8V9IGaiuJeSmW_8A_qydKoDcc22of3Pg1i4G_Js8pRX9GKOapMQr9LyzwoL
 Q.vCP6Lt4eHuRUUCuS9XWdnXzPxQLI_6to5rI2MUE3bfNUZc8inN03_kzYKvcA4UKwnfnyeM7soK
 cbo4wjX0b3OjEtFxp.Xj.2DcrwVND0Mfhf9KyRydzWmVA9sd.YO2qa6ZonPUJZYFH.bsLnvTqHKV
 pYVj_xGJ2Lj_iZwK7ArWnQMz80FuNRbIa9lWy1GciSFSLLZftqIi33GwI_AaxRhikXvMQsFk3XgG
 RvtgVsiXpYjFFGhh1aB8jTIn213KW8Md43P2giiJN3VJgArNd_W3i6bCfObRNXypOxR99UteJrOF
 VRp5o1g4X5OErpYLjNmu8JI16cheDTCs51eKC_h0bbJ6AAWUvJk8PVA6FiyivV5hT.kzNeetBapM
 czVMwwrLvYUGGOT3OD.jIuYO_COfpHUFerbRJDtGziyqMwEXF5xhmLAAOMBOTOIug97J1vT4Moo_
 j7NTXThUQvGG8FkWcD6JHz87RcBL09ze6iI6CYn4pbTiCbZ__7dMQdsGKhjy0ERaejo8WJaRprsN
 GwkLBjzUfz7KDhWVO7KE5z_16W3sOuSOLZf1byKKL6HT_TES9pcLQqZvVLvOL0_XUugxb3lhIs76
 afkBxMPsTdLuyRyLxIASjY4L7s2Wl0UQVjP8TrNiyZqRCRxMWjHaReDRV5OydpyeZrgcvxreozT1
 cvAnk1CME.CZan.quwEBA.fr39bSlMhf45zz4r_qImnRDpOayEYVyiWV65VksnmT8Je.T5KIVLuX
 L52V4DlQq6v1LYXnBY_aPpF8vx61lWK7vwMi23IEnwsBpqYWRQLpU50Ro.LOfRhIedVB24BBmcio
 NBgpAaZ5.f.rFFeLDksyyGUz8mFPL1xILK_E3fYvRe_EIpajZqib4ciOUDKIb0BCik1r12KwTz_P
 .34Sys7RAR9GaHp_PlfcQgNUEiHxa83tDXsOX1_jYM1kYCq7RcyMYR.s9N5VN6sakIc4mlUzT4g7
 aM.2Z9fahyPePU5IEYy7b7o_l0DWEp2dLPMM1Ycgo8kURfdSDRoe.3i2M6ChMudNaif5U9RTyzJ3
 ZXvKhUhdDVX5wdlZ6uFktCdNW2ZjuJ8dyLq_5z8gnnSxtJC6nP91M_UAD_7nZUWq68b5J5aMv1nY
 Qi7skvdwec94dfgaYO2_jNMZz4ZmXAyMpcKenj5LQjUXVrPxxFvTBAQHFepYurnQFEFiDR.GcUm8
 1vQYJApMjqtai2be89c1QBGmskWflETQ9BotaYXPDUXkqBb6T1XxyL5pG2zWzhvvstqbmoPmpbr.
 udEHJOjgV0nHNJoSWHdf8STVnigtBdw63teEsTdvJgDVMu7gLOXiqkYsKgSM0KJuAbkcZr6FC9ln
 ChnEVjj9u75uFBTU5XhRgyqj_SRiaHilL9Enc2py0rm8q37bHaHEU6hG3gqFn_anFQ38yjV8uyDu
 2raSeIs6aCyjw1AFIIyohAjbTo2PCccPqzKAYYbdHLMmj6eWqd6Es6rRCIMkwSXKFE23TXY8koLK
 xQKcT77kiDWKIon21Y3OX
X-Sonic-MF: <melus0@yahoo.es>
X-Sonic-ID: 4c52ce29-fbc8-4ff2-8d03-e1e7cb5f0079
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ir2.yahoo.com with HTTP; Wed, 29 Oct 2025 18:05:55 +0000
Received: by hermes--production-ir2-8c47c9895-t2gzg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7ba0c65d6b2a3ed0948e30debb1863e8;
          Wed, 29 Oct 2025 17:15:12 +0000 (UTC)
Received: from luis2 (luis2.eb7gwl.ampr.org [192.168.1.252])
	by sirius.eb7gwl.ampr.org (8.13.1/8.12.8) with SMTP id 59THFAYe008521;
	Wed, 29 Oct 2025 18:15:10 +0100
Message-ID: <69024A1F.7275@yahoo.es>
Date: Wed, 29 Oct 2025 18:08:47 +0100
From: Luis Yanes <melus0@yahoo.es>
Reply-To: melus0@yahoo.es
X-Mailer: Mozilla 3.04Gold (WinNT; U)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: linux-input@vger.kernel.org
Subject: [PATCH v2] HID: Off-by-one error in CP2112 HID driver affecting SMBus block read output
References: <68F7C063.5049@yahoo.es>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Just following up on this bug report and proposed fix. I would appreciate feedback on
whether this approach is acceptable or if there is a preferred way to handle this quirk.

After thoroughly reviewing the driver code and rereading AN495 I still don't know why
these chips (tried 5 of them so far) are showing the previously stated observed behaviour,
because the driver logic seems compliant with the AN495 CP2112 interface specification.

But performing an SMBus block read using the CP2112 HID USB-to-SMBus bridge with these
chips the last byte of a 32-byte response is consistently incorrect unless an extra byte
was requested.

A flag could be added at driver load time to enable a quirk fix for affected chips but
the end user first would need to notice or know that their adapter is affected.

I have not been able to figure out a way to detect those affected chips that will produce
corrupted output without notice or warning other than directly checking the serial number.

So have written a quirks patch against v5.15.195 that applies to a given serial number
range or device version and can be enabled for those known to be affected with minimal
impact on the rest.

Alternatively I think that at least some sort of warning notice always should be included.

Signed-off-by: Luis Yanes <melus0@yahoo.es>
--- a/drivers/hid-cp2112.c
+++ b/drivers/hid-cp2112.c
@@ -26,6 +26,14 @@
 #include <linux/nls.h>
 #include <linux/usb/ch9.h>
 #include "hid-ids.h"
+#include <linux/usb.h>
+
+#ifndef CP2112_QUIRKS
+#define CP2112_SN_RANGE_QUIRKS_START	"00670000"
+#define CP2112_SN_RANGE_QUIRKS_END	"00670FFF"
+#define CP2112_DEVICE_VERSION_QUIRK	2
+#define CP2112_QUIRK_SMBUS_BLOCK33 BIT(0)
+#endif
 
 #define CP2112_REPORT_MAX_LENGTH		64
 #define CP2112_GPIO_CONFIG_LENGTH		5
@@ -170,6 +178,7 @@
 	struct delayed_work gpio_poll_worker;
 	unsigned long irq_mask;
 	u8 gpio_prev_state;
+	unsigned long quirks;
 };
 
 static int gpio_push_pull = 0xFF;
@@ -642,6 +651,7 @@
 	__le16 word;
 	ssize_t count;
 	size_t read_length = 0;
+	size_t max_length;
 	unsigned int retries;
 	int ret;
 
@@ -702,8 +712,14 @@
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
 		if (I2C_SMBUS_READ == read_write) {
+			read_length = I2C_SMBUS_BLOCK_MAX ;
+			/* Apply quirk: allow one extra byte for CP2112 block read */
+			if (dev->quirks & CP2112_QUIRK_SMBUS_BLOCK33) {
+				read_length += 1;
+				hid_info(hdev, "Quirk: using block read size %lu\n", read_length);
+			}
 			count = cp2112_write_read_req(buf, addr,
-						      I2C_SMBUS_BLOCK_MAX,
+						      read_length,
 						      command, NULL, 0);
 		} else {
 			count = cp2112_write_req(buf, addr, command,
@@ -796,7 +812,14 @@
 		memcpy(data->block + 1, buf, read_length);
 		break;
 	case I2C_SMBUS_BLOCK_DATA:
-		if (read_length > I2C_SMBUS_BLOCK_MAX) {
+		max_length = I2C_SMBUS_BLOCK_MAX;
+
+		if (dev->quirks & CP2112_QUIRK_SMBUS_BLOCK33) {
+			max_length += 1;
+			hid_info(hdev, "Quirk: allowing block read up to %lu bytes\n", max_length);
+		}
+
+		if (read_length > max_length) {
 			ret = -EPROTO;
 			goto power_normal;
 		}
@@ -1235,6 +1258,9 @@
 	struct gpio_irq_chip *girq;
 	int ret;
 
+	struct usb_device *udev;
+	char serial[64] = {0};
+
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
@@ -1282,6 +1308,26 @@
 	hid_info(hdev, "Part Number: 0x%02X Device Version: 0x%02X\n",
 		 buf[1], buf[2]);
 
+	if (buf[2] == CP2112_DEVICE_VERSION_QUIRK) {
+		dev->quirks |= CP2112_QUIRK_SMBUS_BLOCK33;
+		hid_info(hdev, "Enabled SMBus block+1 quirk for device version 0x%02X\n", buf[2]);
+	}
+
+	udev = interface_to_usbdev(to_usb_interface(hdev->dev.parent));
+
+	if (udev->descriptor.iSerialNumber) {
+		ret = usb_string(udev, udev->descriptor.iSerialNumber, serial, sizeof(serial));
+		if (ret > 0)
+			hid_info(hdev, "CP2112 device serial number: %s\n", serial);
+	}
+
+	if (strlen(serial) == 8 &&
+		strncmp(serial, CP2112_SN_RANGE_QUIRKS_START, 8) >= 0 &&
+		strncmp(serial, CP2112_SN_RANGE_QUIRKS_END, 8) <= 0) {
+			dev->quirks |= CP2112_QUIRK_SMBUS_BLOCK33;
+			hid_info(hdev, "Enabled SMBus block+1 quirk for serial %s\n", serial);
+	}
+
 	ret = cp2112_hid_get(hdev, CP2112_SMBUS_CONFIG, (u8 *)&config,
 			     sizeof(config), HID_FEATURE_REPORT);
 	if (ret != sizeof(config)) {

--


