Return-Path: <linux-input+bounces-13129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8623AEB5AA
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 13:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC151C27E75
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 11:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359932C1594;
	Fri, 27 Jun 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuhdNEOI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F829B8FE;
	Fri, 27 Jun 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022098; cv=none; b=Bt6gACFbR8tCQ3H0Hsiix4c2xgTV3ZUyql0B+pthoU9ql4ZsL7TS6UpsPYik6YlIT/meYK/2hsTEqUYCXQlIlaczPg/iuiwaDyGsdpPp3yR0yHpR2cvHIi/h64GG54r3mC2Q/PWdeNbkFIMalW6mHM1tRB0o/7DhQGglbLWEgJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022098; c=relaxed/simple;
	bh=3dExj16ujw0S0QYOUPAHLTgpEZAJVtVkMwlrNFXYVeo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPoii4UgTvqLsvRCIXMtuZPufzouPF4y6a0tNp52nMN+W6WUB7W/LT96COQJFWiH92t5YC68vHNUK43jCGU7SQ+YnMijrL22xjw1TIS/zSDvlCCT07RhA74f6+eWorQ3W1RON1RL9Bz4zOR+PfGosV6cuXOflL2MJAoG/y4YKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuhdNEOI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1574351f8f.1;
        Fri, 27 Jun 2025 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751022094; x=1751626894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwvj1O48c3DVNQHDKsP5lCweSM9mM09cc5anRD1gkPk=;
        b=GuhdNEOI/xUr3zLgjgA8lJRwg/OfL1bhBs/I50LgA7sUeLlZF3BPUPrCXFegogHzDx
         bZiG9483ZxvqJTNawV6iTtXaKCEr0LrJhzTLmq5UvzGQ1ryTSWvjrjKAmVmMsMsmtmzK
         pt2Vii9mPnh5k9uib1U5sWtIG755/i9B3QVjswuXDu0P7nBt3Nu1ZNXQUEKLrbgZheBI
         57m5JLJv8gbKp3InuVvZa37KMf7SqvEuL2HzmPZbcjom1vrcV4AoB2VcW6JJrb+qgCrv
         oYn8LbN0Be5LwBkr3WD7Dl35+klM+SEW6jSnjv8yGkLWcH0qdujm8znqywHq+gDJEE68
         B0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022094; x=1751626894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rwvj1O48c3DVNQHDKsP5lCweSM9mM09cc5anRD1gkPk=;
        b=VBu0wJUiBsyGc3ezNcM6OrnaGIc0p3tnwsnZDWohdEgRnyKGB64xP54dLp2nSXybsy
         v77TqKo8tJRa4X8Opn8Npn43FKRVujdTV6D+WEikxB15OkUh0wzitzJncN/Tb/x9ZiHJ
         eyy57QwyE49+W8MczY+F76Mi2/LM+wF1ykLPrL0zJ7zQ33VjjexZsbOQRLm3/tRBE4qM
         0zAmGT47ZpB9sTRsxRkRPJv1WipwnG+XXh0ZDj34kCR4tjhY2USSMLWbYb9E28WiZP5Z
         U1Z7gMA0/ch7o/lcbIvvHu6C0yMvFvVrfCjaouXHYdy+Ew7dwCialRddZLssP55lzEDU
         0HFA==
X-Forwarded-Encrypted: i=1; AJvYcCVEsyVfh5E7yPw/GcookeMNJD6sJttxWNI+pwEjlC2WRFhgJNUpPXFE+m5QJKHLwyHREK/oQB39@vger.kernel.org, AJvYcCWI2nxysK7qlh76jWwxSVONdEVc2TIG8U7c1dnRyaAS0CbMgmLcEfQH8K9bCeql/xktYv3hJXj20M4D+6Ok@vger.kernel.org, AJvYcCXvbhWQyA7idocOAOvEJ0YhwzR9f5Y1wpK/+VcPXj7C68IyXJX4MKXnakqw7ZXblzXO7hb1SZdFdH1SJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiFd886IamcVO0moShSKto8Enbpk0T2HKNq+bnlcPI+ci5qylZ
	Eco5Ad6Gp3nWPn/uOqBcNNiexKkFtJ0UkDzEy5Xgo6g54125Mq07CJyAJV019Q==
X-Gm-Gg: ASbGnctxeVYFN3IbJQ7vOJchbX95JWXx6rD3wrPGm2S1xsjOfXPyvij4SMwC2aSni44
	/ax7Q+4FSR8OujRl887pJizaqjzdBUv+lzG8KpQPglf4CBnqbQFSv/ChcfjhQxK0CrLzysWQr8O
	MKeYeKKk8jeCXSbGBenyrbODe6bHHPjsxfB05/zCMj84Qokr4vRU9tuXOLWuNO8ojwTnoVCZeke
	dffBqm6iU0fpTgkVcW1D3plPUVIvkGGu/hCqcyN7PmgRNie3pmzciQ7g2t+0IYVskxx8DBfhafC
	ksnEf1mK6H+hn7qxgANhbT5Yy7ysxwyk+YK+n8f/FkOAZBi8Fil9Q3h9UF1JRQ==
X-Google-Smtp-Source: AGHT+IEcrHyyu/uHxQjOZPheS8C9RZstqQixiusL6ry75Kz6CMmuK/parE3RArKSUGVcZJo+P7ZfJg==
X-Received: by 2002:a5d:6a07:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3a90d0d6ef2mr2281703f8f.3.1751022093976;
        Fri, 27 Jun 2025 04:01:33 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:e68e:2662:b817:f55e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4235cbsm47747135e9.38.2025.06.27.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:01:33 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: gargaditya08@live.com,
	jirislaby@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: appletb-kbd: fix memory corruption of input_handler_list
Date: Fri, 27 Jun 2025 12:01:21 +0100
Message-Id: <20250627110121.7802-1-qasdev00@gmail.com>
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
[   63.192094]  kasan_report+0xce/0x100
[   63.192094]  input_attach_handler.isra.0+0x1a9/0x1e0
[   63.192094]  input_register_device+0x76c/0xd00
[   63.192094]  hidinput_connect+0x686d/0xad60
[   63.192094]  hid_connect+0xf20/0x1b10
[   63.192094]  hid_hw_start+0x83/0x100
[   63.192094]  hid_device_probe+0x2d1/0x680
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  hid_add_device+0x30b/0x910
[   63.192094]  usbhid_probe+0x920/0xe00
[   63.192094]  usb_probe_interface+0x363/0x9a0
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  usb_set_configuration+0xd14/0x1880
[   63.192094]  usb_generic_driver_probe+0x78/0xb0
[   63.192094]  usb_probe_device+0xaa/0x2e0
[   63.192094]  really_probe+0x1c3/0x690
[   63.192094]  __driver_probe_device+0x247/0x300
[   63.192094]  driver_probe_device+0x49/0x210
[   63.192094]  __device_attach_driver+0x160/0x320
[   63.192094]  bus_for_each_drv+0x10f/0x190
[   63.192094]  __device_attach+0x18e/0x370
[   63.192094]  bus_probe_device+0x123/0x170
[   63.192094]  device_add+0xd4d/0x1460
[   63.192094]  usb_new_device+0x7b4/0x1000
[   63.192094]  hub_event+0x234d/0x3fa0
[   63.192094]  process_one_work+0x5bf/0xfe0
[   63.192094]  worker_thread+0x777/0x13a0
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

Fixes: 7d62ba8deacf ("HID: hid-appletb-kbd: add support for fn toggle between media and function mode")
Cc: stable@vger.kernel.org
Reviewed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Use correct "Fixes" tag
- clean up backtrace by removing "?" entries and a few lower level calls

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


