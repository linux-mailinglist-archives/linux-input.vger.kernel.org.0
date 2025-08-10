Return-Path: <linux-input+bounces-13881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB64BB1FB9F
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 20:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEBA71735F5
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 18:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93ABA26B759;
	Sun, 10 Aug 2025 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8+vw5DP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B91B3930;
	Sun, 10 Aug 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849669; cv=none; b=GIv+Dzlm2qZ8U17VykwAxSoAyJvfa+uu0ut16qFiyaADQAywqM2aOaTibQHfN+ml5zW593RMXdG4AC4d5TVBlxGMK9DKouBQKDJhyRpitfHA7KUTKsKhtHIf6bZKoH8X/0jgsH1kPLo1C4/nxjNa2y/e5ewYkyxt8rGo/nD1oms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849669; c=relaxed/simple;
	bh=hEug3iKt6+lqE9FFSAj77Oi6Eybay1wZKbpcaw5o3p0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S5LBWYsdRTcn7WtbSta2ApogB5FYO96c3U+C1rmXvJQLRRRr7hBli5ms+APBnuFxHp9p+XovL7QguSc6r7fUo4dIUIr/6AJpqQz8D9NBSdbfD5l4L+8ezBFQbLnokyujtjTSW2ZuvxaiaPlpIGjIM1JXVlK3Bb83yQs0xtx0u78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8+vw5DP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-33253a73769so29921451fa.3;
        Sun, 10 Aug 2025 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754849666; x=1755454466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxkeCmtZT9MST8DfaI8R87oY8Q/h3AVNkFRicZNhOV0=;
        b=R8+vw5DPyOe6mQQ23Ybm0i7msR+8fnXX0jF0ljeM/rD0bAok6npnrRAWyeGirZwBUS
         HNOUftIo9FvWz0MAAIZrixb+Y4HHOT6836ZfvCp4oFxhwdd3arYLBuqI31kanfDC8Iad
         OXG6O9WcFQdMPdJ64c7S/CLGx2dBhLvvaV0+4f5XdDY7d7Jnzm8VyTtAck8TfQtHrqxW
         ljKizVJBjfGL3RIzL+ZSLV+0BlVryT63sm8Do9cGv/HRC/Yy64p5vXYGZ9R1jlNu2pb7
         /rqtK9XPFgLDcBEu0s/Dhtrp/EnRHV7K7FhvWzmWp+EcxRm3ELo/v2364yP4rI2cGZK+
         n+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754849666; x=1755454466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxkeCmtZT9MST8DfaI8R87oY8Q/h3AVNkFRicZNhOV0=;
        b=B76YT0EmCr+SmRj3rUXBdX51qG/IX7caAG753KqnRE0ImlEbJIRktw/V1cYBltips4
         KJzp/j9Iuum9plsXyhn916ROQnRPZue+KPq2ectDVgKL/Hyeb/hSrXEnsxdBvApN3+Rw
         W3X+wJb3xL0gJlguMtX/N0Z7oCTjet/Y1qxrokAwQ8Gm4lzM3JyQAwncKjBvbA59fC6P
         HCcqGCPY6eCAsSobJhMMjOHyUpyjc3/acKJg+Gv1pcQMRi9YlNOHKc8AGUpxQ/Nv6PsJ
         lSgQAkgxVuTmELeRr7cwB4vUJsLzueF+Lb2yQlRnspBx7XJORl3zRakfmz2MnCX4ux0G
         TuJg==
X-Forwarded-Encrypted: i=1; AJvYcCVyOoOWfa8FqwARotfmiv8BAIg3aeSjidIaX6UIDYg3TXk73IrrFMhAsTCbd9NWlerb0mYw5lrHPEJ0xw==@vger.kernel.org, AJvYcCXnOyVI+9kEH7qOm7vBikD65FBgH72r+xRKye7bxdrfcP3QRiHi6f9lUrGz5U8NDZexTDo7giEtewkEc5XQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rtIOmn6XEw2mdK8aCxBMZwJnDZ6iUVXeAaMGF723Po8goPKt
	cGZnJdb1DdUwU8aDdVYMfxwY8nFy8okM/o2C/5x+0akxhIGbKNGmsfi2Z3WFiw==
X-Gm-Gg: ASbGnctGdLTrXMCnMKn5TkogNxyvLysawWpGpy9gqQPn3XoEaxRD/j2P1j4ghOKUw8i
	ae4fotOiivB4PzLs+gJ5pY+P7MmA2bFewq1UAJ1j0a6ETd0V4j+kF4cpBTeeG5Rk4eQKk2oWa38
	A8DfuD2W+X4NOou2lmatjFiW8V+OyUwHWz0xjepKcCr2+CYbQkRIAZvMNkiLHa331HAIBN+taah
	WzDElZGbzEDaktmHSzwPpldnJj9Tbdmli9XXch2QmDO+ATInH8OOzjjy56QbCYR+stee0dk+p+L
	bwRQmT2W8ucaQ1QdMtJE5/wtrfs3rsd2yYpD+TAWl1HydyBEKyzFTBI50F32C45RsFpN+kBZBQJ
	ISUwzbNfuN4Qd+5jGLo+mhT+oAwG90LCyvNg=
X-Google-Smtp-Source: AGHT+IELATMjgT4bY9R4UvqZA8GL5XaRhmwJus4SKwnyjDntrPOWefydngds4aRUclSj9chkUBfVnw==
X-Received: by 2002:a05:651c:b22:b0:32a:66e6:9ffe with SMTP id 38308e7fff4ca-333a22836dfmr25414421fa.21.1754849665436;
        Sun, 10 Aug 2025 11:14:25 -0700 (PDT)
Received: from localhost.localdomain ([185.209.199.157])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388d8b96sm38542881fa.49.2025.08.10.11.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 11:14:25 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH RESEND] HID: asus: fix UAF via HID_CLAIMED_INPUT validation
Date: Sun, 10 Aug 2025 19:10:41 +0100
Message-Id: <20250810181041.44874-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After hid_hw_start() is called hidinput_connect() will eventually be 
called to set up the device with the input layer since the 
HID_CONNECT_DEFAULT connect mask is used. During hidinput_connect()
all input and output reports are processed and corresponding hid_inputs
are allocated and configured via hidinput_configure_usages(). This
process involves slot tagging report fields and configuring usages
by setting relevant bits in the capability bitmaps. However it is possible
that the capability bitmaps are not set at all leading to the subsequent
hidinput_has_been_populated() check to fail leading to the freeing of the
hid_input and the underlying input device.

This becomes problematic because a malicious HID device like a 
ASUS ROG N-Key keyboard can trigger the above scenario via a 
specially crafted descriptor which then leads to a user-after-free
when the name of the freed input device is written to later on after
hid_hw_start(). Below, report 93 intentionally utilises the 
HID_UP_UNDEFINED Usage Page which is skipped during usage
configuration, leading to the frees.

0x05, 0x0D,        // Usage Page (Digitizer)
0x09, 0x05,        // Usage (Touch Pad)
0xA1, 0x01,        // Collection (Application)
0x85, 0x0D,        //   Report ID (13)
0x06, 0x00, 0xFF,  //   Usage Page (Vendor Defined 0xFF00)
0x09, 0xC5,        //   Usage (0xC5)
0x15, 0x00,        //   Logical Minimum (0)
0x26, 0xFF, 0x00,  //   Logical Maximum (255)
0x75, 0x08,        //   Report Size (8)
0x95, 0x04,        //   Report Count (4)
0xB1, 0x02,        //   Feature (Data,Var,Abs)
0x85, 0x5D,        //   Report ID (93)
0x06, 0x00, 0x00,  //   Usage Page (Undefined)
0x09, 0x01,        //   Usage (0x01)
0x15, 0x00,        //   Logical Minimum (0)
0x26, 0xFF, 0x00,  //   Logical Maximum (255)
0x75, 0x08,        //   Report Size (8)
0x95, 0x1B,        //   Report Count (27)
0x81, 0x02,        //   Input (Data,Var,Abs)
0xC0,              // End Collection

Below is the KASAN splat after triggering the UAF:

[   21.672709] ==================================================================
[   21.673700] BUG: KASAN: slab-use-after-free in asus_probe+0xeeb/0xf80
[   21.673700] Write of size 8 at addr ffff88810a0ac000 by task kworker/1:2/54
[   21.673700] 
[   21.673700] CPU: 1 UID: 0 PID: 54 Comm: kworker/1:2 Not tainted 6.16.0-rc4-g9773391cf4dd-dirty #36 PREEMPT(voluntary) 
[   21.673700] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   21.673700] Call Trace:
[   21.673700]  <TASK>
[   21.673700]  dump_stack_lvl+0x5f/0x80
[   21.673700]  print_report+0xd1/0x660
[   21.673700]  kasan_report+0xe5/0x120
[   21.673700]  __asan_report_store8_noabort+0x1b/0x30
[   21.673700]  asus_probe+0xeeb/0xf80
[   21.673700]  hid_device_probe+0x2ee/0x700
[   21.673700]  really_probe+0x1c6/0x6b0
[   21.673700]  __driver_probe_device+0x24f/0x310
[   21.673700]  driver_probe_device+0x4e/0x220
[...]
[   21.673700] 
[   21.673700] Allocated by task 54:
[   21.673700]  kasan_save_stack+0x3d/0x60
[   21.673700]  kasan_save_track+0x18/0x40
[   21.673700]  kasan_save_alloc_info+0x3b/0x50
[   21.673700]  __kasan_kmalloc+0x9c/0xa0
[   21.673700]  __kmalloc_cache_noprof+0x139/0x340
[   21.673700]  input_allocate_device+0x44/0x370
[   21.673700]  hidinput_connect+0xcb6/0x2630
[   21.673700]  hid_connect+0xf74/0x1d60
[   21.673700]  hid_hw_start+0x8c/0x110
[   21.673700]  asus_probe+0x5a3/0xf80
[   21.673700]  hid_device_probe+0x2ee/0x700
[   21.673700]  really_probe+0x1c6/0x6b0
[   21.673700]  __driver_probe_device+0x24f/0x310
[   21.673700]  driver_probe_device+0x4e/0x220
[...]
[   21.673700] 
[   21.673700] Freed by task 54:
[   21.673700]  kasan_save_stack+0x3d/0x60
[   21.673700]  kasan_save_track+0x18/0x40
[   21.673700]  kasan_save_free_info+0x3f/0x60
[   21.673700]  __kasan_slab_free+0x3c/0x50
[   21.673700]  kfree+0xcf/0x350
[   21.673700]  input_dev_release+0xab/0xd0
[   21.673700]  device_release+0x9f/0x220
[   21.673700]  kobject_put+0x12b/0x220
[   21.673700]  put_device+0x12/0x20
[   21.673700]  input_free_device+0x4c/0xb0
[   21.673700]  hidinput_connect+0x1862/0x2630
[   21.673700]  hid_connect+0xf74/0x1d60
[   21.673700]  hid_hw_start+0x8c/0x110
[   21.673700]  asus_probe+0x5a3/0xf80
[   21.673700]  hid_device_probe+0x2ee/0x700
[   21.673700]  really_probe+0x1c6/0x6b0
[   21.673700]  __driver_probe_device+0x24f/0x310
[   21.673700]  driver_probe_device+0x4e/0x220
[...]

Fixes: 9ce12d8be12c ("HID: asus: Add i2c touchpad support")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-asus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 4b45e31f0bab..9bce9c84ab20 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1212,8 +1212,14 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
 		return ret;
 	}
-
-	if (!drvdata->input) {
+
+	/*
+	 * Check that input registration succeeded. Checking that
+	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
+	 * were freed during registration due to no usages being mapped,
+	 * leaving drvdata->input pointing to freed memory.
+	 */
+	if (!drvdata->input || !(hdev->claimed & HID_CLAIMED_INPUT)) {
 		hid_err(hdev, "Asus input not registered\n");
 		ret = -ENOMEM;
 		goto err_stop_hw;
-- 
2.39.5


