Return-Path: <linux-input+bounces-13752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85616B17F76
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 11:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D8A1C27131
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 09:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4F52288EA;
	Fri,  1 Aug 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krmeFpW/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9174227B9F;
	Fri,  1 Aug 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041089; cv=none; b=Ne5Vsx7FOxLpuFExmj1cMeYpaxmJ32106etDMb4FtQ6nOa4fAMCJJaNV+rPNmK0Mx4cs0riff9yHirB4sZdKzb6yCzSDo861mBs3i6LMaIdSf0VJxAwBQH1fFdZttywYKO1KRrghGuIA0JBBZmZ+dT+eBhgk96p8wH/R1toLW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041089; c=relaxed/simple;
	bh=hEug3iKt6+lqE9FFSAj77Oi6Eybay1wZKbpcaw5o3p0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dh2/ma5r2Wx+JFe71+KKjgwonEJV7qrCRXvav50zVML/3FYKIkFP1EsiYCnbTZajx5uItPUySOBkHouKxMNPVb+w8TpazuiW+Y4NmpYDpi9Y2lzVrfYBi3FGAZu/Jt4Z2E1JvXWQ1xGwcbi2RRXTbPSoUk2WzwVwgU9c+xhonMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krmeFpW/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af922ab4849so211328066b.3;
        Fri, 01 Aug 2025 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041086; x=1754645886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxkeCmtZT9MST8DfaI8R87oY8Q/h3AVNkFRicZNhOV0=;
        b=krmeFpW/11knDSmm/3TDfqdM8S0UJkVN0vz5uANPdWcB4wFINwHB8/BjuWzZRE/lvd
         VQeDNkU4sVUQb1OufUhL7ccu238KAWLhLb5IT2P2P5pkoGPijrde2xVIAiWx/jCp60l/
         v0TUCfeBUtGO3mhwhzJvDg6ImNiZuZpRiZxPiv9yITIPp1Kmv8kz3sBlJsMKttjlSzB0
         qzI/XdX31ITo4By3E0T26dyH3uK/CFuRFEHxYHWJ/VJCZh2o2/Z+CU3GiyiwVqsOn98N
         opecqDzxM/pdFcwQgFcHjt6hgDq16CwXPSiUgmbSUt3Aabp+2nY4ox6UiV+lYyaF07QW
         uEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041086; x=1754645886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxkeCmtZT9MST8DfaI8R87oY8Q/h3AVNkFRicZNhOV0=;
        b=HE9SVEGQx5FbnvNXednDhUBK1dULdSRu62MllY8CYnvQXgOVL5wuJQ1c/8/W41IC0F
         WUGIhqXTpJpAJ4Hr+G8pry76Yjkqp5s1AJM1Y9h7Nv9oHjjD4ElxZdi5dEqNDofZ66Bh
         zoY8zHANjykxBaQh8ZRloOVNAedI5bQlHSb3ydJmHCmEe2ma5xN0aFeNhhgDeU0T7Adx
         c7BYiT09zTJrqcgOqyheZYAVDxG+eaPbO+QaxGFig7N/gG+nTN+KPcpKlA5GQ7YPCWKL
         zjHWqG4vYNk0ayyRobJac57WEsy2Xz3Zm6h00ryC0diEmqxlMfB6h+A1VGCZz7EtrpnE
         G+6g==
X-Forwarded-Encrypted: i=1; AJvYcCV0VEvSNG4fMflmDBnEClsWKMuWZ3iVEDDO/r3WbevYnnuXJfKtbGLpDK3T1xUj6tT5SD1xcP/KIIylnYs=@vger.kernel.org, AJvYcCVbPLVqh+063hT3vrbWNKOygkwULGIc0BuEXlaoHZO9M+X93H+sl2nohGUKbWhdAZ0eTgQzVaLf@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBItDQzo4bwbYCL/d8Q52Skj0khXcICBozBslAZjWnvCp4SnH
	rbrMSiF8TC0oBw8r5YY6m7PRcsESFW2Ze3le9EWr6dWc/j26tHdgIu6UiZTxWgTY
X-Gm-Gg: ASbGncv9oN+s+n7Bi610/DQ2lEYmXXskuXwjWBn8nnHSxXzIrsHgfcsAD0n65ZTx91j
	pTednltO3ahQoUvlOIhFfHxRGiTtYA6ibc7F8JIZRQnN2CFRwc8wN1jFses7axa7Tc4H9AQ/clr
	KbeXWg5rKwpwRpVkYGJqHcwkzmt1Sfm3ltSqiEjaT1wHg60n03lGb/mAPTbc4Xw/OwoAgzr2B0Z
	RK+ITqV5eMxuSqZCJjnYdA9VJEkGFQsORA2XeSZRgGOSnCPMgNtXLAfo7+ZFH9ote0tnUnghowR
	RnJn0PwFZUzrXNf3P1rnjTPRD6mI4s/d1+8jlZBbuA8WbeJzN+xrxeNa4pYMmtrLJV4pvfqT4es
	gL29YMAfQm2Gf1Om5VPJYohnqYWQHdOTwzLM=
X-Google-Smtp-Source: AGHT+IEtJbIL5AStXZV/BsRZgnc9v1l2MDi6MjoI0HmJp7hAP4UJ+XiETwFKEiWwW/oM0PWv6Rx18A==
X-Received: by 2002:a17:907:96a4:b0:af9:1c73:cefd with SMTP id a640c23a62f3a-af93195679bmr229155266b.52.1754041085813;
        Fri, 01 Aug 2025 02:38:05 -0700 (PDT)
Received: from localhost.localdomain ([193.138.218.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e6cecsm261569766b.70.2025.08.01.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:38:05 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: asus: fix UAF via HID_CLAIMED_INPUT validation
Date: Fri,  1 Aug 2025 10:38:00 +0100
Message-Id: <20250801093800.5234-1-qasdev00@gmail.com>
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


