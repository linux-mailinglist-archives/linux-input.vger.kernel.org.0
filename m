Return-Path: <linux-input+bounces-13004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB7AE57AC
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 01:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6534B4C7775
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 23:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E6E225762;
	Mon, 23 Jun 2025 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxCnmcfm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7961A2630;
	Mon, 23 Jun 2025 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720222; cv=none; b=h53KAQvgPR7fANqscu3QTNCy5Mp1YR54J8M5pC0Vn1SpBkafw+6Fh4BRhpdWP98A35gx1xOvMIMR84AOhgtPW/yhRdf8GADYtfNPDCM4yrOpeMI0vnRo54R4ZOg7VbjuxL+QXg9eb5VuDqYCOt4MRzEQT53eeCnR5hFbsfooxC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720222; c=relaxed/simple;
	bh=rOUm22/yW0LwLkb1Ps66HKzlHHAdGQ7NT1emVa9hi0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vGrFnHq3JxmQ1poMD1FoH8taB8eQMq4WzR5VEwS+nRoe1U6edcAt4QqcyYW7rMrWMynshft9rFumCQPxmV+mLl8uGk6800WOeAvS7nRVptfFdDuQXpM8F4pS4mk61j8fGSMQ9Y0Ouboq7fsfcorxsc9eOVs9+L3lpZVPB5+8nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxCnmcfm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45365b1a897so24109265e9.0;
        Mon, 23 Jun 2025 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720217; x=1751325017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpdMl98PvcpLIduTbEa6wyxA0JY/GEfTE8S4djNR00U=;
        b=FxCnmcfmXcapbSSCIZckEOygUbiQC/EiDIVNDTR/hC3LUmiwGfffbSCNxzQtT+ETGk
         JueA1xBAlz+zza4YhlYzSRslTVKHw3SQtM3u6/Pm6U1W5IOKjSq+ObdLKqxBwZX3UluM
         mo81e/3PAKCl8nYCgo4lhITqBDYIW6O1HzgVwQGAEqF238xsI/knFGIsDiVnzkC1du6q
         MPjIOBIbNed6dNhChXB6BFsi2BOkm61ZYxx2YogFbeqEiLp6X+YJGUZXm8Jkhox23ya+
         IP8VtfrW6LC5eA9aoCpRHlUzIosB7lUbvLFAuwC0ZbIoeODJ6a0cmdwLoy8qaHW+Wkc2
         EBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720217; x=1751325017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpdMl98PvcpLIduTbEa6wyxA0JY/GEfTE8S4djNR00U=;
        b=AlFuiutKC6+sJnCU59Y1kmKM+O+KUhv46EEzX/tzWHCJXPmPUAqGdVhnZ+8xpBR2eJ
         8D2lFlMP4EBZLGrqQikhGFPHXQ9pHeN0wrFKCeaHJh/uN5Yc6wgdMC24laW1AIbyDqxO
         +kllssXj7PG8j+0XBpXNNNun8LVNPIiUOVo+7Vlp1SftvNVZaLS7GZ4FS/0jd13MPNm9
         6clHZFHNG4CTYKfkr1EAuV0lT2zkaELds4OAU/6Z5HY7YJ+v7nok3X87QzM1bMheazzP
         t22CgV9j9eUMGMlG613ejB3O2G814JX067yh2UoVRYrm4wOldFA4CT0tld+6kNAHekws
         QtYA==
X-Forwarded-Encrypted: i=1; AJvYcCURmsbnlZyb8HBSgCf8dASZF2rOk/5UMRs3WuTxipVqFLccTn/oBddq68DChXe8CHdJCvZJN0OeBMc9QRVZ@vger.kernel.org, AJvYcCWJgUVEPs8WoM/tHXEk0G/c45PzWbPoCTbcc/5lvk0ZDvRJ3mkSYrUdIdTJ7Vi+TctAKRIwTXNA@vger.kernel.org, AJvYcCWUJfCdFjQduEUwPuajJ67Nh2TBq/DcnzdUBY7b+zs/S3K9mXAT0FT+jte4LQ1z2sK22LkxT1bv/T8V+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyz/0L/ZRDLxJMZXe6RdRlRJNzr5NfG6/Ru02j0JSTF34qXPvK
	AjRpIq8UQQb6ANCQzI5PxmxMz3j0w8+YvKwAdjw8xGOg32scrd24sH8i
X-Gm-Gg: ASbGncuXz9bw+izsWdOBZ2CYlzN8BT4bThPFsu9Cl1GrsUXc+pBe0kDYo9EQcKalHTC
	Dn8sgYjfWaHqSUpj0mNLmP72HgbAq/St2FF2/kQOp3IZxWuBVC+cE9ePFW9Et/RI2hwEKGq+3aF
	R5ol0e9rg0kyzUKRjc+QOKqeXJZyVFyYey4nLtvjb4h78N8d+BnY64cwSYR58I5GluRlRCpQEuU
	Jlp2vTzQQF6xOds81+FclIrC4TGdS5HRWtWo+bzTd6XbYSje5QHdz2Ps+b1/esIsBNRbwnG85M4
	JzTaoY71WxDf7lxmF4eSw/LdzA8OtMjXNvDFT1g2k7HaNdi5RgEbCvI544tYIw==
X-Google-Smtp-Source: AGHT+IEIf0JHWOFkd9LKf4iZwcHptNpPGNlxOjGNMKqDLMm2eM89GGlPceIk1rv5Hi8N3bv8MqrGhQ==
X-Received: by 2002:a05:600c:35cc:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-453656c29c4mr131155285e9.23.1750720216595;
        Mon, 23 Jun 2025 16:10:16 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:fa4e:392a:1d40:1ef4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805d21fsm332093f8f.23.2025.06.23.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:10:16 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: gargaditya08@live.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: appletb-kbd: fix slab use-after-free bug in appletb_kbd_probe
Date: Tue, 24 Jun 2025 00:08:12 +0100
Message-Id: <20250623230812.31927-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In probe appletb_kbd_probe() a "struct appletb_kbd *kbd" is allocated
via devm_kzalloc() to store touch bar keyboard related data.
Later on if backlight_device_get_by_name() finds a backlight device
with name "appletb_backlight" a timer (kbd->inactivity_timer) is setup
with appletb_inactivity_timer() and the timer is armed to run after
appletb_tb_dim_timeout (60) seconds.

A use-after-free is triggered when failure occurs after the timer is 
armed. This ultimately means probe failure occurs and as a result the 
"struct appletb_kbd *kbd" which is device managed memory is freed. 
After 60 seconds the timer will have expired and __run_timers will 
attempt to access the timer (kbd->inactivity_timer) however the kdb 
structure has been freed causing a use-after free.

[   71.636938] ==================================================================
[   71.637915] BUG: KASAN: slab-use-after-free in __run_timers+0x7ad/0x890
[   71.637915] Write of size 8 at addr ffff8881178c5958 by task swapper/1/0
[   71.637915] 
[   71.637915] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.16.0-rc2-00318-g739a6c93cc75-dirty #12 PREEMPT(voluntary) 
[   71.637915] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   71.637915] Call Trace:
[   71.637915]  <IRQ>
[   71.637915]  dump_stack_lvl+0x53/0x70
[   71.637915]  print_report+0xce/0x670
[   71.637915]  ? __run_timers+0x7ad/0x890
[   71.637915]  kasan_report+0xce/0x100
[   71.637915]  ? __run_timers+0x7ad/0x890
[   71.637915]  __run_timers+0x7ad/0x890
[   71.637915]  ? __pfx___run_timers+0x10/0x10
[   71.637915]  ? update_process_times+0xfc/0x190
[   71.637915]  ? __pfx_update_process_times+0x10/0x10
[   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
[   71.637915]  ? _raw_spin_lock_irq+0x80/0xe0
[   71.637915]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   71.637915]  run_timer_softirq+0x141/0x240
[   71.637915]  ? __pfx_run_timer_softirq+0x10/0x10
[   71.637915]  ? __pfx___hrtimer_run_queues+0x10/0x10
[   71.637915]  ? kvm_clock_get_cycles+0x18/0x30
[   71.637915]  ? ktime_get+0x60/0x140
[   71.637915]  handle_softirqs+0x1b8/0x5c0
[   71.637915]  ? __pfx_handle_softirqs+0x10/0x10
[   71.637915]  irq_exit_rcu+0xaf/0xe0
[   71.637915]  sysvec_apic_timer_interrupt+0x6c/0x80
[   71.637915]  </IRQ>
[   71.637915] 
[   71.637915] Allocated by task 39:
[   71.637915]  kasan_save_stack+0x33/0x60
[   71.637915]  kasan_save_track+0x14/0x30
[   71.637915]  __kasan_kmalloc+0x8f/0xa0
[   71.637915]  __kmalloc_node_track_caller_noprof+0x195/0x420
[   71.637915]  devm_kmalloc+0x74/0x1e0
[   71.637915]  appletb_kbd_probe+0x37/0x3c0
[   71.637915]  hid_device_probe+0x2d1/0x680
[   71.637915]  really_probe+0x1c3/0x690
[   71.637915]  __driver_probe_device+0x247/0x300
[   71.637915]  driver_probe_device+0x49/0x210
[...]
[   71.637915] 
[   71.637915] Freed by task 39:
[   71.637915]  kasan_save_stack+0x33/0x60
[   71.637915]  kasan_save_track+0x14/0x30
[   71.637915]  kasan_save_free_info+0x3b/0x60
[   71.637915]  __kasan_slab_free+0x37/0x50
[   71.637915]  kfree+0xcf/0x360
[   71.637915]  devres_release_group+0x1f8/0x3c0
[   71.637915]  hid_device_probe+0x315/0x680
[   71.637915]  really_probe+0x1c3/0x690
[   71.637915]  __driver_probe_device+0x247/0x300
[   71.637915]  driver_probe_device+0x49/0x210
[...]

The root cause of the issue is that the timer is not disarmed 
on failure paths leading to it remaining active and accessing 
freed memory. To fix this call timer_delete_sync() to deactivate 
the timer.

Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-appletb-kbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index e06567886e50..a70b1c519105 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -438,8 +438,10 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	return 0;
 
 close_hw:
-	if (kbd->backlight_dev)
+	if (kbd->backlight_dev) {
 		put_device(&kbd->backlight_dev->dev);
+		timer_delete_sync(&kbd->inactivity_timer);
+	}
 	hid_hw_close(hdev);
 stop_hw:
 	hid_hw_stop(hdev);
-- 
2.39.5


