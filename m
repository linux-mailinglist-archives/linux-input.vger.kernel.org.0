Return-Path: <linux-input+bounces-12721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A0ACEAEE
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 09:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E64B189B401
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 07:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A0D1FECCD;
	Thu,  5 Jun 2025 07:35:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E461ACEDC;
	Thu,  5 Jun 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108933; cv=none; b=aBPJWv/N72SvS4PGx3DQYvA865KVmMRiBsxIc+pQxq2sVuq3PmP/rgzX3rYRoav+lYhC15yaIENt/QNBm0Q9BNJSbldcOnDpzW47TZQKjRW53DUAFAgHFQHH00G/yhF19WcuZBfK1olznCxET7n4aFkc/3RNXbC5PR3gTQYs0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108933; c=relaxed/simple;
	bh=JiPjZpPszKvce3bAitOvkf5ocNgd1DZGGqYRlad1oWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMzj3aF5l0B1FW8dkCPQJz2M+pIyOB4c+fhdXsPs62CN+46Fqf+JL9st+znWboM3AXiu4MXf1B/oFFNUge7nXSbMHiSpmu83GDg56QwAAaCY3xY65vUA79OASMRHhiiX2Dcw+ugd9I0vhRvvePYom6UgU9QgYWgqfe9YqA3bADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: eac0473241de11f0b29709d653e92f7d-20250605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:5f0b65d3-5033-4296-8fe1-3298b09a26ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:bbfc68758d43e42d124c0b08258bac5d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eac0473241de11f0b29709d653e92f7d-20250605
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangheng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1051063951; Thu, 05 Jun 2025 15:30:12 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 5A0B1E00891C;
	Thu,  5 Jun 2025 15:30:12 +0800 (CST)
X-ns-mid: postfix-68414784-21522215
Received: from localhost.localdomain (unknown [172.25.120.77])
	by mail.kylinos.cn (NSMail) with ESMTPA id BF327E00891B;
	Thu,  5 Jun 2025 15:30:11 +0800 (CST)
From: Zhang Heng <zhangheng@kylinos.cn>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Heng <zhangheng@kylinos.cn>
Subject: [PATCH] HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY
Date: Thu,  5 Jun 2025 15:29:59 +0800
Message-Id: <20250605072959.91625-1-zhangheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

MARTLINKTECHNOLOGY is a microphone device, when the HID interface in an
audio device is requested to get specific report id, the following error
may occur.

[  562.939373] usb 1-1.4.1.2: new full-speed USB device number 21 using x=
hci_hcd
[  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=3D4c4a, idPr=
oduct=3D4155, bcdDevice=3D 1.00
[  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=3D1, Product=3D=
2, SerialNumber=3D3
[  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
[  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
[  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001
[  563.229499] input: SmartlinkTechnology USB Composite Device as /device=
s/pci0000:00/0000:00:07.1/0000:04:00.3/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1.2/1=
-1.4.1.2:1.2/0003:4C4A:4155.000F/input/input35
[  563.291505] hid-generic 0003:4C4A:4155.000F: input,hidraw2: USB HID v2=
.01 Keyboard [SmartlinkTechnology USB Composite Device] on usb-0000:04:00=
.3-1.4.1.2/input2
[  563.291557] usbhid 1-1.4.1.2:1.3: couldn't find an input interrupt end=
point
[  568.506654] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  573.626656] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  578.746657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  583.866655] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)
[  588.986657] usb 1-1.4.1.2: 1:1: usb_set_interface failed (-110)

Ignore HID interface. The device is working properly.

Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>
---

I also tried adding HID_QUIRK_NOGET, but it didn't work.

 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e3fb4e2fe911..83d731c9fcd2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1525,4 +1525,7 @@
 #define USB_VENDOR_ID_SIGNOTEC			0x2133
 #define USB_DEVICE_ID_SIGNOTEC_VIEWSONIC_PD1011	0x0018
=20
+#define USB_VENDOR_ID_SMARTLINKTECHNOLOGY              0x4c4a
+#define USB_DEVICE_ID_SMARTLINKTECHNOLOGY_4155         0x4155
+
 #endif
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 7fefeb413ec3..78db734c3f6f 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -904,6 +904,7 @@ static const struct hid_device_id hid_ignore_list[] =3D=
 {
 #endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YEALINK, USB_DEVICE_ID_YEALINK_P1K_P4K_B=
2K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_QUANTA, USB_DEVICE_ID_QUANTA_HP_5MP_CAME=
RA_5473) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SMARTLINKTECHNOLOGY, USB_DEVICE_ID_SMART=
LINKTECHNOLOGY_4155) },
 	{ }
 };
=20
--=20
2.25.1


