Return-Path: <linux-input+bounces-13116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD79FAEA9F7
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 00:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851D77A2AFA
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 22:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7404815990C;
	Thu, 26 Jun 2025 22:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoEAxJxP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE020487E;
	Thu, 26 Jun 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978051; cv=none; b=Mhvzqa+mIPrRU44GCb2Q4RwqwhAmjG8uJHma9r7BRdVo4YIODhkpLQ1lnOhLf3yIq9Ug3B3h99o+nvJ84wfLZhwF9ar3Rp2HlHCN3V1BHbQ87yxTvoXUQ6IUZ/nh08/RCK4cU6CZOJ5GrI55qtj+vqYhssl9hxrr+yPEvYxGhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978051; c=relaxed/simple;
	bh=xwvOQG2Fp0TnncUh059mBhuoX370Uy0jlkDeTFTw6LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JY4QNwUqkBk5B8WGWJqHT1TH0iv7mVWTU+EXTxBiTIfh0Q3TOoWVnUkBH6wKDh73DXh/z+7FFE/SdQueQNzjAmlFWh81BJ7i0coDAcf96LO/Cwe9sp/IvPyFY/MFz4GVJBJkBHFd3UgcJUZtu3IEtmkm/acF6qTfh+UODwrg/5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoEAxJxP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so934955f8f.0;
        Thu, 26 Jun 2025 15:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750978048; x=1751582848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LE46Fd5THhoMQbQ1yaquPpZV06WccRBMPXqa1f4i6Rg=;
        b=DoEAxJxPGaNjqmmeHP6RjVeGf9oV18/6sX32hAMUJG8wdf8GDH2V1PS1eMYMUZT0C4
         DWOwGbH/bTFBzC4YYzayqcpO2ZuZ52Lpr6JGijvg75osn+u4p0qmHBBwUNG4JfuqOWOW
         b6WnztyJXrxgw5nnj6yO67yUTdkt9Sb19hK6Dkap/gN2Goqpe1Rtwawhoy8oUoVjlIIl
         HRl/4sRnM4wbLo9ZKHl17Uz+S+ijxvAn/Wa927tqmrBuVsen5OMRZ2UFBUa2UDfxIUAO
         MFt/4gAoWXg/HX7DuVOR1i4FgqJoGu/URu+CwAiwfI/iCUYqwSSQEkblphMFFPHoZGzh
         O+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750978048; x=1751582848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE46Fd5THhoMQbQ1yaquPpZV06WccRBMPXqa1f4i6Rg=;
        b=qz//F/ieQYZ2AO6AumpWqUTEP+MBgQTfa6w/QKy9vv92LFuaTB107z3e9yHAGUBt56
         L7Z0IkepBfTdDZzJXiHrY4GErSOgv5DP3ixF9HxtX1b44d/wuEK/HDALAFzTIc4Vot4W
         VITQk6tDYeEvhx2RsAGiVemHQ0chcRSwsVM8Fr4MImjqDfaJKYI/K6mGvMnPiyYo7Da4
         TEhfTh37AZdAs9FIRDvhwbofW9tp6xM7P4TU9zKi8h70EqYDJsMNDM74N2GD46gZZP13
         cCXyGaBL0HRLGHT0mblhSKsZ8PEZTrSW8q80hDgURYKyID6qfv89cv8OCx2EcmvcZYDB
         CqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3AJ9iFHXFFnL4CKDhxOAz9w3FQkqzbmAmnnBP4Fg/VahkNxT7ZjMqU6JgS9J/8H+ZVQJkAnu+OQeI6VJd@vger.kernel.org, AJvYcCW7Jeii2f/ZJdGCSVamNkxx7DnuS+vnGkM10NOzfAXnwAVzam/3ykc6ApHVDM1RvIeqGmIef5WzQtZeHQ==@vger.kernel.org, AJvYcCX/A+ZFH94Ga988TmgLVvPC2UK6VUmGyifdrytIB3NfE+h4+nB5mNUzxVcnTrB7sD5fHBkEH/wB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTC7TLm6auiAqsO5PTY4HYrNDsmZSV01vGJ3RwMSpAky59bHDa
	qQwlFMokb06YKSkeevvGUon+LBbnFUaMJgE1GVaxw5nMVb3tZF9xeT0+
X-Gm-Gg: ASbGncs/zFwhm9mQMuWMjDtNhuYbNO7L9aC7RX6rwNd302YwfNjawDR7IkRU9ayDWeG
	lXn3RV9fliveit2CQ5uthOom8N7tEz5kCmLu8cqXTOPYajQb0apItcpYO7+E4Rpq5RKcJeDi8ZG
	G3SNNKFtfw7FktQ8l7piZc0YHA7Pw2V4DrW8Nr7TQzWzhyCbJAnDgACIPgU5vLhbwLavxVqJnfI
	B7GUckNpX4DgpgG/bhzja0YfAlMhtzQwPDHDCboFw22JV2wyHnMNyrO6NmjwjNRz9MB5V5PVDX1
	oxplDz9RcCr0QprQpk+aj3dhuRzPyEAtHHPkKTALVO4XgCsy9ZraafwaXyKzrg==
X-Google-Smtp-Source: AGHT+IFwipZp2Pjk5ukJPmpYYTY/v+746EDrD277Jlqx8l55LVTn+g4jCs/j/d1Nyv4X7BoU3d7O4g==
X-Received: by 2002:a05:6000:2183:b0:3a6:d967:380c with SMTP id ffacd0b85a97d-3a8fe5b1d42mr829669f8f.36.1750978047488;
        Thu, 26 Jun 2025 15:47:27 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:7feb:1539:4323:a45e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52be0sm1016554f8f.64.2025.06.26.15.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:47:27 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: gargaditya08@live.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: appletb-kbd: fix memory corruption of input_handler_list
Date: Thu, 26 Jun 2025 23:47:11 +0100
Message-Id: <20250626224711.13980-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In appletb_kbd_probe an input handler is initialised and then registered
with input core through input_register_handler(). When this happens input
core will add the input handler (specifically its node) to the global
input_handler_list. The input_handler_list is central to the functionality
of input core and is traversed in various places in input core. An example
of this is when a new input device is plugged in and gets registered with
input core.

The input_handler in probe is allocated as device managed memory. If a
probe failure occurs after input_register_handler() the input_handler
memory is freed, yet it will remain in the input_handler_list. This
effectively means the input_handler_list contains a dangling pointer
to data belonging to a freed input handler.

This causes an issue when any other input device is plugged in - in my
case I had an old PixArt HP USB optical mouse and I decided to
plug it in after a failure occurred after input_register_handler().
This lead to the registration of this input device via
input_register_device which involves traversing over every handler
in the corrupted input_handler_list and calling input_attach_handler(),
giving each handler a chance to bind to newly registered device.

The core of this bug is a UAF which causes memory corruption of
input_handler_list and to fix it we must ensure the input handler is
unregistered from input core, this is done through
input_unregister_handler().

[   63.191597] ==================================================================
[   63.192094] BUG: KASAN: slab-use-after-free in input_attach_handler.isra.0+0x1a9/0x1e0
[   63.192094] Read of size 8 at addr ffff888105ea7c80 by task kworker/0:2/54
[   63.192094] 
[   63.192094] CPU: 0 UID: 0 PID: 54 Comm: kworker/0:2 Not tainted 6.16.0-rc2-00321-g2aa6621d 
[   63.192094] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.164
[   63.192094] Workqueue: usb_hub_wq hub_event
[   63.192094] Call Trace:
[   63.192094]  <TASK>
[   63.192094]  dump_stack_lvl+0x53/0x70
[   63.192094]  print_report+0xce/0x670
[   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
[   63.192094]  kasan_report+0xce/0x100
[   63.192094]  ? input_attach_handler.isra.0+0x1a9/0x1e0
[   63.192094]  input_attach_handler.isra.0+0x1a9/0x1e0
[   63.192094]  input_register_device+0x76c/0xd00
[   63.192094]  hidinput_connect+0x686d/0xad60
[   63.192094]  ? __pfx_hidinput_connect+0x10/0x10
[   63.192094]  ? xhci_urb_enqueue+0x523/0x930
[   63.192094]  hid_connect+0xf20/0x1b10
[   63.192094]  ? mutex_unlock+0x7d/0xd0
[   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
[   63.192094]  ? __pm_runtime_idle+0x95/0x1c0
[   63.192094]  ? __pfx_hid_connect+0x10/0x10
[   63.192094]  hid_hw_start+0x83/0x100
[   63.192094]  hid_device_probe+0x2d1/0x680
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  ? __pfx___device_attach+0x10/0x10
[   63.192094]  ? kobject_get+0x50/0xe0
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  ? __pfx_device_add+0x10/0x10
[   63.192094]  ? up_write+0x4d/0x90
[   63.192094]  ? __debugfs_create_file+0x377/0x5a0
[   63.192094]  hid_add_device+0x30b/0x910
[   63.192094]  ? __pfx_hid_add_device+0x10/0x10
[   63.192094]  usbhid_probe+0x920/0xe00
[   63.192094]  ? pm_runtime_enable+0xfa/0x2a0
[   63.192094]  usb_probe_interface+0x363/0x9a0
[   63.192094]  ? sysfs_do_create_link_sd+0x89/0x100
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  ? __pfx___device_attach+0x10/0x10
[   63.192094]  ? kobject_get+0x50/0xe0
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  ? __pfx_device_add+0x10/0x10
[   63.192094]  ? mutex_unlock+0x7d/0xd0
[   63.192094]  ? __pfx_mutex_unlock+0x10/0x10
[   63.192094]  usb_set_configuration+0xd14/0x1880
[   63.192094]  usb_generic_driver_probe+0x78/0xb0
[   63.192094]  usb_probe_device+0xaa/0x2e0
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  ? usb_generic_driver_match+0x58/0x80
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  ? __pfx___device_attach_driver+0x10/0x10
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  ? __pfx_bus_for_each_drv+0x10/0x10
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  ? __pfx___device_attach+0x10/0x10
[   63.192094]  ? kobject_get+0x50/0xe0
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  ? __pfx_device_add+0x10/0x10
[   63.192094]  ? add_device_randomness+0xb2/0xe0
[   63.192094]  usb_new_device+0x7b4/0x1000
[   63.192094]  hub_event+0x234d/0x3fa0
[   63.192094]  ? __pfx_hub_event+0x10/0x10
[   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
[   63.192094]  ? _raw_spin_lock_irqsave+0x85/0xe0
[   63.192094]  ? mutex_unlock+0x7d/0xd0
[   63.192094]  ? _raw_spin_lock_irq+0x80/0xe0
[   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   63.192094]  ? __pm_runtime_suspend+0x74/0x1c0
[   63.192094]  process_one_work+0x5bf/0xfe0
[   63.192094]  worker_thread+0x777/0x13a0
[   63.192094]  ? __kthread_parkme+0x99/0x180
[   63.192094]  ? __pfx_worker_thread+0x10/0x10
[   63.192094]  kthread+0x327/0x630
[   63.192094]  ? __pfx_kthread+0x10/0x10
[   63.192094]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   63.192094]  ? __pfx_kthread+0x10/0x10
[   63.192094]  ? __pfx_kthread+0x10/0x10
[   63.192094]  ret_from_fork+0xff/0x1a0
[   63.192094]  ? __pfx_kthread+0x10/0x10
[   63.192094]  ret_from_fork_asm+0x1a/0x30
[   63.192094]  </TASK>
[   63.192094] 
[   63.192094] Allocated by task 54:
[   63.192094]  kasan_save_stack+0x33/0x60
[   63.192094]  kasan_save_track+0x14/0x30
[   63.192094]  __kasan_kmalloc+0x8f/0xa0
[   63.192094]  __kmalloc_node_track_caller_noprof+0x195/0x420
[   63.192094]  devm_kmalloc+0x74/0x1e0
[   63.192094]  appletb_kbd_probe+0x39/0x440
[   63.192094]  hid_device_probe+0x2d1/0x680
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[...]
[   63.192094] 
[   63.192094] Freed by task 54:
[   63.192094]  kasan_save_stack+0x33/0x60
[   63.192094]  kasan_save_track+0x14/0x30
[   63.192094]  kasan_save_free_info+0x3b/0x60
[   63.192094]  __kasan_slab_free+0x37/0x50
[   63.192094]  kfree+0xcf/0x360
[   63.192094]  devres_release_group+0x1f8/0x3c0
[   63.192094]  hid_device_probe+0x315/0x680
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[...]

Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-appletb-kbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index d11c49665147..271d1b27b8dd 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -430,13 +430,15 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	ret = appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
-		goto close_hw;
+		goto unregister_handler;
 	}
 
 	hid_set_drvdata(hdev, kbd);
 
 	return 0;
 
+unregister_handler:
+	input_unregister_handler(&kbd->inp_handler);
 close_hw:
 	if (kbd->backlight_dev) {
 		put_device(&kbd->backlight_dev->dev);
-- 
2.39.5


