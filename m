Return-Path: <linux-input+bounces-10867-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C63A6362D
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 16:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30C73AEF1C
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 15:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EA71AF0A7;
	Sun, 16 Mar 2025 15:13:31 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8849918B494;
	Sun, 16 Mar 2025 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742138011; cv=none; b=nsukDz0//z+FvWB0oslaK5roFU7+B2qQ7sDI3A2zhXHXJPEj08JZV6V3u/RT5Z8uyn5Ij7snnnbOVdheTiLL7lXMdhY/OTgBX3m/65+1Nhk6/AK8VAXzx34HjIu4jrsCiCnZfZMNSTneu5O3C2Abj6Jm4P5Zik5cLdKgNlYU6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742138011; c=relaxed/simple;
	bh=8xBIj0ohP0OxF9nPiLVO1cAieoNZZTn1nW1yoPD0r7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pd5abSKn2/sCwZyWodfkI8Ax6iBDEGbUK+z0rxf5FAeG+i/8fvRN+PLsBJbigvp+Mz/8Onk/EV/hNh24jPVWg/24wzqUjnIx7Qr+U77bzbOmY1wyfuiixf5diKWQF6QIrqMz/Kv1WKa72sgkpP5OQe5Sh5zv0XRkE8/eLIuKjFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [178.76.204.78])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 7DA4F2336B;
	Sun, 16 Mar 2025 18:13:19 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Erick Archer <erick.archer@outlook.com>,
	Xing Wei <weixing@hanwang.com.cn>,
	Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] Input: hanwang - require Interrupt IN endpoint
Date: Sun, 16 Mar 2025 18:13:19 +0300
Message-Id: <20250316151319.1310765-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix binding to compromised USB devices using non-Interrupt endpoint
(e.g., Bulk), which can trigger a system crash with panic_on_warn
enabled. Replace endpoint count check with usb_find_int_in_endpoint()
to enforce Interrupt IN.

Syzbot report:
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 2827 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 2827 Comm: acpid Not tainted 6.14.0-rc3-syzkaller-00071-gb331a3d8097f #0

Call Trace:
 <TASK>
 hanwang_open+0xa8/0xf0 drivers/input/tablet/hanwang.c:284
 input_open_device+0x230/0x390 drivers/input/input.c:600
 evdev_open+0x52d/0x690 drivers/input/evdev.c:478
 chrdev_open+0x237/0x6a0 fs/char_dev.c:414
 do_dentry_open+0x6cb/0x1390 fs/open.c:956
 vfs_open+0x82/0x3f0 fs/open.c:1086
 do_open fs/namei.c:3830 [inline]
 path_openat+0x1e88/0x2d80 fs/namei.c:3989
 do_filp_open+0x20c/0x470 fs/namei.c:4016
 do_sys_openat2+0x17a/0x1e0 fs/open.c:1428
 __x64_sys_openat+0x175/0x210 fs/open.c:1454
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Found by Linux Verification Center (linuxtesting.org) with
"USB Gadget Tests" [1]:

$ make input-tab-hanwang
$ sudo ./src/input-tab-hanwang/input-tab-hanwang --invalid_ep_int_type

Fixes: bba5394ad3bd ("Input: add support for Hanwang tablets")
Cc: stable@vger.kernel.org
[1] Link: https://github.com/kovalev0/usb-gadget-tests
Reported-by: syzbot+9fe8f6caeb5661802ca2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9fe8f6caeb5661802ca2
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/input/tablet/hanwang.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/tablet/hanwang.c b/drivers/input/tablet/hanwang.c
index 42c1e5eaddd50..7315bee4f3fe7 100644
--- a/drivers/input/tablet/hanwang.c
+++ b/drivers/input/tablet/hanwang.c
@@ -319,8 +319,11 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	int error;
 	int i;
 
-	if (intf->cur_altsetting->desc.bNumEndpoints < 1)
+	if (usb_find_int_in_endpoint(intf->cur_altsetting,
+				     &endpoint) != 0) {
+		dev_err(&intf->dev, "int in endpoint not found\n");
 		return -ENODEV;
+	}
 
 	hanwang = kzalloc(sizeof(*hanwang), GFP_KERNEL);
 	input_dev = input_allocate_device();
@@ -387,7 +390,6 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	input_set_abs_params(input_dev, ABS_PRESSURE,
 			     0, hanwang->features->max_pressure, 0, 0);
 
-	endpoint = &intf->cur_altsetting->endpoint[0].desc;
 	usb_fill_int_urb(hanwang->irq, dev,
 			usb_rcvintpipe(dev, endpoint->bEndpointAddress),
 			hanwang->data, hanwang->features->pkg_len,
-- 
2.42.2


