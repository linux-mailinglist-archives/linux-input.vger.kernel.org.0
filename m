Return-Path: <linux-input+bounces-14836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D2B830D0
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D30FC4671EA
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32292D640D;
	Thu, 18 Sep 2025 05:55:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F92D6E7C;
	Thu, 18 Sep 2025 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758174943; cv=none; b=g5GAvd1kNOfehq4N5niLASbExNBYcN6xb34iZynziihnraq9y0rn/9w7DXcfat4UwoR9JX4AMGOaCU6zy3TBKJN05Wg+QOCYiv0u7kl+nvrXzFXpkRB9p89VmfBef7wyztdxdy+OSRgpn4Xoo99YP3qhZjNnjw73fPKTilzYh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758174943; c=relaxed/simple;
	bh=8GGY3tXbNR9dYAJmvF/A9LVH8yv4b0r1mwXSX3KzH8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YSOiPCpU44iN9ZdWkTszkxG27job2TaRIxQNfSj+zxf0i76ro5PRQ/R1X0V9QGuWEswkCXdlKSW0zYI/ERhb/Xv0Dqn/qljEPZGiT9LR1B8z5GhSt4AU+BG65/XJebOK0YKhgJ1FS4J3KUsN/5eAEeyQwOLJY+7zVD5ydhlBI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 15a321f0945411f0b29709d653e92f7d-20250918
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:166848ce-9dd7-41d8-870b-55a9fd003a05,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:02fb88f48475ea19a8990136c2fa5a9d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 15a321f0945411f0b29709d653e92f7d-20250918
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
	(envelope-from <zhangjinpeng@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2086424130; Thu, 18 Sep 2025 13:55:30 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
	by node2.com.cn (NSMail) with SMTP id ADB1FB8258E9;
	Thu, 18 Sep 2025 13:55:30 +0800 (CST)
X-ns-mid: postfix-68CB9ED2-57136037
Received: from localhost.localdomain (unknown [172.25.82.241])
	by node2.com.cn (NSMail) with ESMTPA id E03BCB812916;
	Thu, 18 Sep 2025 05:55:29 +0000 (UTC)
From: zhangjinpeng <zhangjinpeng@kylinos.cn>
To: jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangjinpeng <zhangjinpeng@kylinos.cn>
Subject: [PATCH] hid/usbhid: add reset device for EPROTO
Date: Thu, 18 Sep 2025 13:55:27 +0800
Message-Id: <20250918055527.4157212-1-zhangjinpeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[  792.354988] input: PixArt USB Optical Mouse as /devices/platform/PHYT0=
039:03/usb7/7-1/7-1.2/7-1.2:1.0/0003:093A:2510.0028/input/input53
[  792.355081] hid-generic 0003:093A:2510.0028: input,hidraw1: USB HID v1=
.11 Mouse [PixArt USB Optical Mouse] on usb-PHYT0039:03-1.2/input0
[  792.355137] hub 7-1:1.0: state 7 ports 4 chg 0000 evt 0004
=EF=BC=9A xhci-hcd PHYT0039:03: Transfer error for slot 4 ep 2 on endpoin=
t
[  794.579339] xhci-hcd PHYT0039:03: Giveback URB 00000000ab6c1cac, len =3D=
 0, expected =3D 4, status =3D -71
[  794.596152] xhci-hcd PHYT0039:03: WARN halted endpoint, queueing URB a=
nyway.
[  917.451251] hub 7-1:1.0: state 7 ports 4 chg 0000 evt 0004
[  917.451323] usb 7-1-port2: status 0100, change 0001, 12 Mb/s
[  917.451362] usb 7-1-port2: indicator auto status 0
[  917.451365] usb 7-1.2: USB disconnect, device number 45
[  917.451367] usb 7-1.2: unregistering device
[  917.451369] usb 7-1.2: unregistering interface 7-1.2:1.0
[  917.451429] xhci-hcd PHYT0039:03: Cancel URB 00000000ab6c1cac, dev 1.2=
, ep 0x81, starting at offset 0x2361ea6280
[  917.451432] xhci-hcd PHYT0039:03: // Ding dong!
[  917.451436] xhci-hcd PHYT0039:03: shutdown urb ffffffa2ebc8e400 ep1in-=
intr
[  917.451440] xhci-hcd PHYT0039:03: Removing canceled TD starting at 0x2=
361ea6280 (dma).
[  917.500303] usb 7-1.2: usb_disable_device nuking all URBs
[  917.500310] xhci-hcd PHYT0039:03: xhci_drop_endpoint called for udev 0=
0000000e00ae900
[  917.500324] xhci-hcd PHYT0039:03: drop ep 0x81, slot id 4, new drop fl=
ags =3D 0x8, new add flags =3D 0x0
[  917.500326] xhci-hcd PHYT0039:03: xhci_check_bandwidth called for udev=
 00000000e00ae900
[  917.500330] xhci-hcd PHYT0039:03: // Ding dong!
[  917.500351] xhci-hcd PHYT0039:03: Successful Endpoint Configure comman=
d
[  917.500579] xhci-hcd PHYT0039:03: // Ding dong!
[  917.656189] usb 7-1-port2: debounce total 100ms stable 100ms status 0x=
100

Signed-off-by: zhangjinpeng <zhangjinpeng@kylinos.cn>
---
 drivers/hid/usbhid/hid-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.=
c
index 257dd73e37bf..253f82f33b08 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -306,8 +306,13 @@ static void hid_irq_in(struct urb *urb)
 	case -ESHUTDOWN:	/* unplug */
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		return;
-	case -EILSEQ:		/* protocol error or unplug */
 	case -EPROTO:		/* protocol error or unplug */
+		usbhid_mark_busy(usbhid);
+		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
+		set_bit(HID_CLEAR_HALT, &usbhid->iofl);
+		usb_queue_reset_device(usbhid->intf);
+		return;
+	case -EILSEQ:		/* protocol error or unplug */
 	case -ETIME:		/* protocol error or unplug */
 	case -ETIMEDOUT:	/* Should never happen, but... */
 		usbhid_mark_busy(usbhid);
2.25.1


