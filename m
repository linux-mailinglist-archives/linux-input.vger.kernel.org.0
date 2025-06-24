Return-Path: <linux-input+bounces-13007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDFAE65B5
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 14:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DFA24C4886
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 12:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9284298CDD;
	Tue, 24 Jun 2025 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlkxVAui"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54C299A83;
	Tue, 24 Jun 2025 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769669; cv=none; b=QCcw66IQZ4mdGWbRrcxL5yIF1xXRXaw1nDj56sJjI48DQ6AZ5Qy4uJ8va7qmxffxfiJkcujGKYKLntsapQ11q/GIo2AkfGgukBlcG1A4Dd1FI7Ta4J5k2F/f+3QNRxC1nYJSvlM9SVOD7yvhE1nJVjgk289rK1LdkodugvQ3Ank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769669; c=relaxed/simple;
	bh=o5bwHXu/puTAg/XbhhLL34yAqeh4pfB9i35p9mI6s4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F3PJjXh2WKJq4/ydEf0uRABspe84P9v1NVaIuVcs2wLQKg8U/Bj7xIxZh4tw1yncGc3gAv645z1eepSLzw5bSxJUf+QMhU74gaSa7X3wOHEJMRbQXgKtDSTATKvzE2ydG5ntBq/XcE2l66jY6HTdhHDIyv+vM96XhyqPr18Be+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlkxVAui; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so255873f8f.0;
        Tue, 24 Jun 2025 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769666; x=1751374466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp9QFBIPR0BdmPUxtpfFiQoRT8PhFeDr/DVcOU9+PPo=;
        b=WlkxVAuiVpqfECM3JH36Mwc5v4WhRLbRBOHWdiJoShE84MgO6enyRX3IErFcDAY6wE
         BCWnZS6ZrZcM5Cv/TK9/omhfwuLTNbiaEnXODf/ojBdUWG0zthAFebqL4wdA6J4pEeax
         qCtAKC21glHJMPn36hRLUFK4t4KuXcKaemnIDQ9DvvbV/WJ23N7daptfwPTit3W3N8w1
         IXmwg45CmxEwfwZPpjXDQnahmK2FRqU0sytLGEvD66FJoDTg57o8MoTMbhTYLn/teoH8
         RPBSKEBcuyNZmkNxzonZJbORJS2QAod00ZexAl33mEP8UHUBFF6ox6mZEgkh+4/ylTTB
         Q3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769666; x=1751374466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp9QFBIPR0BdmPUxtpfFiQoRT8PhFeDr/DVcOU9+PPo=;
        b=ruNhivlpmoFLTOmAeisfkEIrsLiA8R2ZTlF98gQdEy6h5cV2Bwk5t1IrO4DGojw1vD
         pBrN98/kiCOFJFdsL1lJPHGD4YZhfENnBtGmggv4B6WopR2hFmlDMQiatvTnCAA9lxZl
         0wHY5gAlAbaQlrT1FqeiIc/jD575eaV9LDX5usVSEvLlgD/FqDuHeSkl/aIVMJCg7bYz
         1MaNu4H35P7ci6iU3d0waBdZs/zKIjWpBr8au85O1mY0QG0uLwVLX/vi+3N9iUP93v4/
         zxXUgZcRdb5jkQhYbdkppo6nx1OZZmaQHyoZRejQ5feA+TVG1/gFlIg7H7VCm8PGCMSf
         j02A==
X-Forwarded-Encrypted: i=1; AJvYcCUdicvWJNF/Wkxj+CiaIYZ2hhe923OgrwYl8nQhdi3dP1VdYAWEOp57MHMznoMXDBu8CSawm7nD3dIpxxM=@vger.kernel.org, AJvYcCX+Ahh2UxIPwUVnONDxnhhg8fUC4BNZLfxqXQsaInF6XuivCrWC8bkjuxa4oRU1yXUQ1ebGkhUd@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbmRcjw/hEmRuTTvAgBU13Xekgm6r+I7KVh6ZU+njNWJgL7jc
	ooxMjQFnxcpEVH7kQ1z/XE+nTpljt5mEVGbJN2L9KCEClpup2rusHI6JS8g/9A==
X-Gm-Gg: ASbGnctWslo4YiJg66j+X6gQGydiXtehMthuWRM1e0fJy3IlhyzOxmQkLRAI0AIQIwb
	LO8pkGdHgf/48xq3S1xQBMvt1M3cTR8CVxU2LwgIhybLQvnlgph6NVd/oZp1ckl5jXv7m1K0Do6
	NzHbMDv/1BS6nWc6EZqMjI+m1r87Esf0EgiKTUZ3ahcE11I4Yuo5ucAlKKVobVIx1eyJeuL9J2J
	jetOwfgLgeDDf8ZXkA8vavyaOmjXfKXl7WKqAPMwPd4SEpwUwM3IdkQbGJ5vvTcMXuvdUv/6wzz
	AzvllG6GCp1pWDANioOft9ENkkF6MAVjnfQo2S0YB1V2Iiwir7Nvl/cyVIX0GigvNHHvZRiikg=
	=
X-Google-Smtp-Source: AGHT+IFCsWEsdgSWEp39vgrKNvlr2whV8rQQq3Zn55o+ibXFviHysP/55FXt/BYxd81bP7oGOkL18w==
X-Received: by 2002:a5d:5847:0:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3a6d12eba75mr13674255f8f.54.1750769665855;
        Tue, 24 Jun 2025 05:54:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:f4f0:900:7f3f:914:11c0:78c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm1878419f8f.60.2025.06.24.05.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:54:25 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	gargaditya08@live.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: appletb-kbd: fix slab use-after-free bug in appletb_kbd_probe
Date: Tue, 24 Jun 2025 13:52:56 +0100
Message-Id: <20250624125256.20473-1-qasdev00@gmail.com>
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

Another small issue is that timer_delete_sync is called
unconditionally in appletb_kbd_remove(), fix this by checking
for a valid kbd->backlight_dev before calling timer_delete_sync.

Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
v2:
- Add backlight check in remove() since we don't want to unconditionally call timer_delete_sync

 drivers/hid/hid-appletb-kbd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index e06567886e50..d11c49665147 100644
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
@@ -453,10 +455,10 @@ static void appletb_kbd_remove(struct hid_device *hdev)
 	appletb_kbd_set_mode(kbd, APPLETB_KBD_MODE_OFF);
 
 	input_unregister_handler(&kbd->inp_handler);
-	timer_delete_sync(&kbd->inactivity_timer);
-
-	if (kbd->backlight_dev)
+	if (kbd->backlight_dev) {
 		put_device(&kbd->backlight_dev->dev);
+		timer_delete_sync(&kbd->inactivity_timer);
+	}
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.39.5


