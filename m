Return-Path: <linux-input+bounces-2945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0048A2AA7
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 11:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654A4285E2F
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 09:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C6C3D3BC;
	Fri, 12 Apr 2024 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="bQLyD9fJ";
	dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b="tyaIgkyC"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay4-3.pub.mailoutpod3-cph3.one.com (mailrelay4-3.pub.mailoutpod3-cph3.one.com [46.30.212.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D9814006
	for <linux-input@vger.kernel.org>; Fri, 12 Apr 2024 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712913111; cv=none; b=fgOBBzeG1V2OO7G9vinDy7kQ6R2SqVTcLUOn+lGWbOIYfaB38dr1scoc/KvEwG28zQkOXgDpYLv/4XFD5BxkdP5IsSZ+oprk8tlLkrDZnKEtibs60770k0F7pr5NYEVwxS/jVA7x95YEGbXFensQI/I3cbzuyqjjOTyL80qMJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712913111; c=relaxed/simple;
	bh=1ZVVC1pA6j6cTkrWftg2ePBFwgpPv5lTulpalSZt0Qg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PY9OS/Y4fBiVB8B1FdH6L3ltWddcBee/khM+Fn3YhPB3ghQuh+X242cSEcWc+Kce/Wn5Q2BNfI7lfxgycPtP2f6xoJmAIFhMiP2rV4qeT/2jDc4zNQLekzofvg3npnE0BvJPyG1faXCxbTi+NzOF9fE6v7cRpiBWPjz1QdGmcxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com; spf=none smtp.mailfrom=carewolf.com; dkim=pass (2048-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=bQLyD9fJ; dkim=permerror (0-bit key) header.d=carewolf.com header.i=@carewolf.com header.b=tyaIgkyC; arc=none smtp.client-ip=46.30.212.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=carewolf.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=carewolf.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=rsa2;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 to:from:from;
	bh=XzeOYiSi4w8ZLcha4Lq29J7a8rgNrSvDd98s7pvkXKE=;
	b=bQLyD9fJYDZ64KYa51tZv71A6c5eZSRNuLSgvkQwhfQNwOQbFX7koiAtNZc99iJpmseuJ3FSEWSWI
	 F+aHOmO4lZzZtjxYnmL5hVX7AeuOV7BK2nnStDBwTnJ2K4lKoit0mkfY31Yny+RcN7v+lskQcTHVRT
	 lgTCX1NElItyOTTzoqqm84XjS3f+TRnIZDeCFvGzJlFNXdNywavSuUfVnNlFmTKMPqzkdw/6LeCYsV
	 6FDmSttd/Ia9PxRC0Zl0SsjGFQRYPmGG8OYGKezXTNeDoTzEnFdzn4+JOyBOLpUbBc3pnPaRV3rotQ
	 L88dMUdOufcf30In2dr4anE/CUPDvPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=carewolf.com; s=ed2;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 to:from:from;
	bh=XzeOYiSi4w8ZLcha4Lq29J7a8rgNrSvDd98s7pvkXKE=;
	b=tyaIgkyCQH2AOS7U+yqKlzbzJ6+vluL63m+P734zelcrUIXnopn2nNmn7wuPVQ2BY7L0jaJ3EQceL
	 w9fkeh5AA==
X-HalOne-ID: 84c8934d-f8ac-11ee-a62d-9f04b458b84a
Received: from twilight.localnet (dynamic-2a02-3103-004c-5300-8ad6-eae4-4835-57f0.310.pool.telefonica.de [2a02:3103:4c:5300:8ad6:eae4:4835:57f0])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 84c8934d-f8ac-11ee-a62d-9f04b458b84a;
	Fri, 12 Apr 2024 09:10:35 +0000 (UTC)
From: Allan Sandfeld Jensen <kde@carewolf.com>
To: Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
 linux-input@vger.kernel.org
Subject: hid-logitech-dj support for Anywhere 3SB
Date: Fri, 12 Apr 2024 11:10:35 +0200
Message-ID: <4887001.GXAFRqVoOG@twilight>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1887162.tdWV9SEqCh"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart1887162.tdWV9SEqCh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

I am writing because you are listed as author of the hid-logitech-dj driver. I 
recently bought a Logitech Anywhere 3SB mouse, and found Linux didn't 
recognize it. Thinking it was a simple case of new IDs not recognized, I 
quickly added them to the logitch HID++ drivers (patch attached), both for USB 
with the new receiver and for the Bluetooth direct connection.

I have noticed however that the patch while causing them to be recognized and 
interacted with as HID++ devices, it has a flaw. The scroll wheel events are 
reported by the linux kernel as being in hires mode, while haven't actually 
enabled it on the mouse. You can fix that using Solaar, but some piece is 
missing to enable it correctly in the driver.  Since this is no longer a 
trivial fix. I wanted to reach out. Do you have any suggestions?

Best regards
Allan
--nextPart1887162.tdWV9SEqCh
Content-Disposition: attachment;
 filename="0001-Logitech-Anywhere-3SB-support.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="utf-8";
 name="0001-Logitech-Anywhere-3SB-support.patch"

From 7bbe473e227ae1a16e604a3b94fa168db27fed1a Mon Sep 17 00:00:00 2001
From: Allan Sandfeld Jensen <allan.jensen@qt.io>
Date: Wed, 10 Apr 2024 15:23:40 +0200
Subject: [PATCH] Logitech Anywhere 3SB support

---
 Makefile                         |  2 +-
 arch/x86/boot/Makefile           |  2 +-
 drivers/hid/hid-ids.h            |  1 +
 drivers/hid/hid-logitech-dj.c    | 10 +++++++++-
 drivers/hid/hid-logitech-hidpp.c |  2 ++
 5 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e00c12240191..ae2e6b53ebdf 100644
--- a/Makefile
+++ b/Makefile
@@ -2131,7 +2131,7 @@ kernelversion:
 	@echo $(KERNELVERSION)
 
 image_name:
-	@echo $(KBUILD_IMAGE)
+	@$(PERL) -e 'print "$(KBUILD_IMAGE)"'
 
 quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files)))
       cmd_rmfiles = rm -rf $(rm-files)
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9e38ffaadb5d..d1043cd635dd 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -83,7 +83,7 @@ cmd_image = $(obj)/tools/build $(obj)/setup.bin $(obj)/vmlinux.bin \
 
 $(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin $(obj)/tools/build FORCE
 	$(call if_changed,image)
-	@$(kecho) 'Kernel: $@ is ready' ' (#'$(or $(KBUILD_BUILD_VERSION),`cat .version`)')'
+	$(PERL) -e 'print "Kernel: $@ is ready"'
 
 OBJCOPYFLAGS_vmlinux.bin := -O binary -R .note -R .comment -S
 $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 2235d78784b1..4b79c4578d32 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -849,6 +849,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER		0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index c358778e070b..92b41ae5a47c 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -120,6 +120,7 @@ enum recvr_type {
 	recvr_type_27mhz,
 	recvr_type_bluetooth,
 	recvr_type_dinovo,
+	recvr_type_bolt,
 };
 
 struct dj_report {
@@ -1068,6 +1069,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
 		workitem.reports_supported |= STD_KEYBOARD;
 		break;
 	case 0x0f:
+	case 0x10:
 	case 0x11:
 		device_type = "eQUAD Lightspeed 1.2";
 		logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
@@ -1430,7 +1432,8 @@ static int logi_dj_ll_parse(struct hid_device *hid)
 		dbg_hid("%s: sending a mouse descriptor, reports_supported: %llx\n",
 			__func__, djdev->reports_supported);
 		if (djdev->dj_receiver_dev->type == recvr_type_gaming_hidpp ||
-		    djdev->dj_receiver_dev->type == recvr_type_mouse_only)
+		    djdev->dj_receiver_dev->type == recvr_type_mouse_only ||
+		    djdev->dj_receiver_dev->type == recvr_type_bolt)
 			rdcat(rdesc, &rsize, mse_high_res_descriptor,
 			      sizeof(mse_high_res_descriptor));
 		else if (djdev->dj_receiver_dev->type == recvr_type_27mhz)
@@ -1773,6 +1776,7 @@ static int logi_dj_probe(struct hid_device *hdev,
 	case recvr_type_dj:		no_dj_interfaces = 3; break;
 	case recvr_type_hidpp:		no_dj_interfaces = 2; break;
 	case recvr_type_gaming_hidpp:	no_dj_interfaces = 3; break;
+	case recvr_type_bolt:		no_dj_interfaces = 4; break;
 	case recvr_type_mouse_only:	no_dj_interfaces = 2; break;
 	case recvr_type_27mhz:		no_dj_interfaces = 2; break;
 	case recvr_type_bluetooth:	no_dj_interfaces = 2; break;
@@ -1950,6 +1954,10 @@ static const struct hid_device_id logi_dj_receivers[] = {
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
 		USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2),
 	 .driver_data = recvr_type_dj},
+	{ /* Logitech bolt receiver (0xc548) */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
+		USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER),
+	 .driver_data = recvr_type_bolt},
 
 	{ /* Logitech Nano mouse only receiver (0xc52f) */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3c00e6ac8e76..509142982daa 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4380,6 +4380,8 @@ static const struct hid_device_id hidpp_devices[] = {
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023) },
 	{ /* MX Master 3S mouse over Bluetooth */
 	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb034) },
+	{ /* MX Anywhere 3SB mouse over Bluetooth */
+	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb038) },
 	{}
 };
 
-- 
2.39.2


--nextPart1887162.tdWV9SEqCh--




