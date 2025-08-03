Return-Path: <linux-input+bounces-13767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE6B192F0
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 08:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC079173E86
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 06:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD06B280CF1;
	Sun,  3 Aug 2025 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MbPmYNxT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7F3258CD4
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 06:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754204274; cv=none; b=uJOQP3yqf4T0KaZf1pO54q4gu0g5MSUPwseoax/6yPl0uqOdSAvI7VwEvlq0McbGKM9hIIm4NVxzXIJ/sdgBpbcDk8l5v5MaKzhEEb0SZIaq4Niaed0sd1TOSV74hTkkif+Dpb9R6oIx3RdaPQ+4lPzCKFzMNPDeR+qNHsQmyGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754204274; c=relaxed/simple;
	bh=aJhTI2wz0NdW+1CBMVp5haVOHSK1IrFWQonK8IhMrfw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdfTnx8DlYtGE49Jar9x4ipZR3Zty+hvvwxF43CcwsSSQIqdF64DILR+Mg6j6sDxblaUy9d0Iw6i986tRQFDDwwI6PzhamFjKEHoJnDYUPTlqt8EMfkTqLHR/xQD7EnRAO7FjfloIVZVQ2MeeuETmtHn0lV2Pw/WCGNVsBu78A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=MbPmYNxT; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 209423F47C
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1754204271;
	bh=bYOCbe3jmheNvUzTCkbMMv5WCzqy7swAQBzFbs0+du0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=MbPmYNxT6/hsGTu3d7TzwjwdZZ9VlXt/LSgylBktxa0Kgx+P+gO5vTYa7jOH8/b5H
	 CTVaq9TfavXDRZDx5OxEH05iCfvHcRj89HP9IJbM7JtPMXHDN37w14qfJY3qot9YXT
	 YqixmUdxExbCzgTiXaIIigy2I1fbj9F5FWNy2Sy2gMFl65whRaKUsgSoylS4Xh5RLz
	 65NQLvaX38gTFOwGpvOnJ+8kCDcF+oEpjiXGcnuqbunAdH8VTwdeYnIh/dIiGzywk8
	 ghkJndmnh8LICMUuZ4d1cBYfUUdEG8L4gKmWH4jcD2dDIc6YS/qyOehfspzmAEQKY/
	 FD9/Yud2CDNBw==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-55b8bd4846aso1281823e87.2
        for <linux-input@vger.kernel.org>; Sat, 02 Aug 2025 23:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754204270; x=1754809070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYOCbe3jmheNvUzTCkbMMv5WCzqy7swAQBzFbs0+du0=;
        b=AjRDVMHWPY04tcOpEjM99cHWj9dKbDyKZsa6B5Wg0W8uuFX3kCaej8UE6+xqD1/f8v
         jElC+YiaODr31EmrurWFxh1aHMk/TAY+7GfonZtvsp3MKDTqvf7wNZt//v57ZmXAOsNr
         lU5FeHRXrx/VMKR2bZIW4JQdZ/iVWCPekpyyqbT8wItQ+mLZBdyUx2vbEjFQdanvFI5y
         q/Uj9LJmGgah7BT4MuMjHyDbBzDi/T7rxUIjYWIAYmXqY3EsyXP6xJWrAya/n2UezS5l
         OQDi+XruM5MlBaVtYJFD3C+BmzqHXMMHUXBGGOJx1F/jDh62tnwj51VMwAAOS6yu5MFy
         eJOg==
X-Forwarded-Encrypted: i=1; AJvYcCWAMNqUvv5lvZIiAfnGjuGweKbLTO6OHjOb3PB5TH3A/sJ3Mh86pDy78+BRsAGjhuBLhwSlvQl9BYB/dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyR/MvHTmiSNPAb00iSKvRAjTK1RO75n1Kw1qdhhyXHiTo7Ep
	P7WNPQWEosGRZYNhgUDjlh7Vg0SyReQJAb/UIHJI+9AXh6PkVE4U8OlmJj4O5KvqKC8RNv3q9bi
	3RQ20awnn+vmFxXKmmb4AVosd3Vy/em8w3u7SFAk3GGwyM5rorsOM0JV+DHDL3CGVPgOGlrQX+k
	xa4XM+PvGkJnI4
X-Gm-Gg: ASbGncvdAdhtlObiGAw9thSNfOX8k8xOruvySUGTstTimsMBji3CgSKjRANOjAX1BQl
	6bt2vklLpEaA+KpuftJkqaJ2f6qjbzBMygZzDHIGnOLaY31/4QL3ceDKjcLcZvWNsL7YBVczW35
	L7ygp5o97bxXBdg6Zyv5p0Ftm4F8vLkz3yCIOgNDbY/DMRLRhlvE4cKCGuNlJgfOI5JIRMOlNNb
	8eG/RAz+za7lehLbJ7hlPSwEWaavERDE0NdKIte7l4+LH1sWUD6b8OWzs2BF2P29VYGBfznpxNc
	56RWaz9Y60zceSbhstct0uJHkOZ29APy8RtAL8mNJao+u9Y9WKknqkC4
X-Received: by 2002:ac2:4c45:0:b0:553:a30b:ee0a with SMTP id 2adb3069b0e04-55b97b09d78mr1543956e87.24.1754204270313;
        Sat, 02 Aug 2025 23:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6kiRKRYZIDy4+WGdrbvlB+/Qr18oawhgOWMy4MrNsPLGTkaDZBXtd6y0tmtp/57UMMII2Wg==
X-Received: by 2002:ac2:4c45:0:b0:553:a30b:ee0a with SMTP id 2adb3069b0e04-55b97b09d78mr1543952e87.24.1754204269856;
        Sat, 02 Aug 2025 23:57:49 -0700 (PDT)
Received: from localhost.localdomain ([162.213.32.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b9dbcbad2sm288627e87.56.2025.08.02.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 23:57:48 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: even.xu@intel.com,
	xinpeng.sun@intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aaron.ma@canonical.com
Subject: [PATCH 2/2] HID: intel-thc-hid: intel-thc: Fix incorrect pointer arithmetic in I2C regs save
Date: Sun,  3 Aug 2025 14:57:26 +0800
Message-ID: <20250803065726.2895470-2-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250803065726.2895470-1-aaron.ma@canonical.com>
References: <20250803065726.2895470-1-aaron.ma@canonical.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improper use of secondary pointer (&dev->i2c_subip_regs) caused
kernel crash and out-of-bounds error:

 BUG: KASAN: slab-out-of-bounds in _regmap_bulk_read+0x449/0x510
 Write of size 4 at addr ffff888136005dc0 by task kworker/u33:5/5107

 CPU: 3 UID: 0 PID: 5107 Comm: kworker/u33:5 Not tainted 6.16.0+ #3 PREEMPT(voluntary)
 Workqueue: async async_run_entry_fn
 Call Trace:
  <TASK>
  dump_stack_lvl+0x76/0xa0
  print_report+0xd1/0x660
  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
  ? kasan_complete_mode_report_info+0x26/0x200
  kasan_report+0xe1/0x120
  ? _regmap_bulk_read+0x449/0x510
  ? _regmap_bulk_read+0x449/0x510
  __asan_report_store4_noabort+0x17/0x30
  _regmap_bulk_read+0x449/0x510
  ? __pfx__regmap_bulk_read+0x10/0x10
  regmap_bulk_read+0x270/0x3d0
  pio_complete+0x1ee/0x2c0 [intel_thc]
  ? __pfx_pio_complete+0x10/0x10 [intel_thc]
  ? __pfx_pio_wait+0x10/0x10 [intel_thc]
  ? regmap_update_bits_base+0x13b/0x1f0
  thc_i2c_subip_pio_read+0x117/0x270 [intel_thc]
  thc_i2c_subip_regs_save+0xc2/0x140 [intel_thc]
  ? __pfx_thc_i2c_subip_regs_save+0x10/0x10 [intel_thc]
[...]
 The buggy address belongs to the object at ffff888136005d00
  which belongs to the cache kmalloc-rnd-12-192 of size 192
 The buggy address is located 0 bytes to the right of
  allocated 192-byte region [ffff888136005d00, ffff888136005dc0)

Replaced with direct array indexing (&dev->i2c_subip_regs[i]) to ensure
safe memory access.

Fixes: 4228966def884 ("HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index c105df7f6c873..4698722e0d0a6 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1539,7 +1539,7 @@ int thc_i2c_subip_regs_save(struct thc_device *dev)
 
 	for (int i = 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
 		ret = thc_i2c_subip_pio_read(dev, i2c_subip_regs[i],
-					     &read_size, (u32 *)&dev->i2c_subip_regs + i);
+					     &read_size, &dev->i2c_subip_regs[i]);
 		if (ret < 0)
 			return ret;
 	}
@@ -1562,7 +1562,7 @@ int thc_i2c_subip_regs_restore(struct thc_device *dev)
 
 	for (int i = 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
 		ret = thc_i2c_subip_pio_write(dev, i2c_subip_regs[i],
-					      write_size, (u32 *)&dev->i2c_subip_regs + i);
+					      write_size, &dev->i2c_subip_regs[i]);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.43.0


