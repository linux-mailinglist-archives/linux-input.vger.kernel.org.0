Return-Path: <linux-input+bounces-13751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AFFB17F73
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 11:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 383AA1C24563
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FB02288EA;
	Fri,  1 Aug 2025 09:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+pxXfmZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6C78F58;
	Fri,  1 Aug 2025 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041058; cv=none; b=Wrcp6TaXq7gGoO+cegNe8kf/50Eix6CxIeHtSj/TvfIVXy3y/cxsQW6YW/tY+XKzXTjRp8OmWO1nuenplz9TagalPziTQMYT6fBvHuTioNPsbBIKAglHHDiBanLKMcVpfoStpQyBl7QX/jN5E8m/UEmgEVSINCOgqZ32J+Ooc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041058; c=relaxed/simple;
	bh=K8IidkAxx7b6OjhfuXgrnbfygKnQsttvwOIbqsG4EIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KnEJLIzQ2NABSQYCeUKcI2Xl5zcq27w1TOJ2HGeDW/TedlX45/9DgDWULdhs++g5ovrTOzIXHScPUAcADyFzk4jqQsqXMOiZISsrbYCUrgoeEL7ckYA2oO1KAtgA4rtISZuVa3/Vp9vxDhSnxD+/mKn0cT1Qxz4CKxQc1Nua9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+pxXfmZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so1103530a12.1;
        Fri, 01 Aug 2025 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041055; x=1754645855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOlOpSizB2wUtysPUMys+O2uMZJzVajxOlsjXd0pMWU=;
        b=e+pxXfmZPYeHUUfRWg1i8dBYJmtEN2kArrUPlCTZ9mnVP7hs/WTKP06vY20Cibly3O
         93298Vu/awyh2rRGgjGqIpwIlyQkP3pLTUsVG3ZNXl7u42c7lHD1kV3EXuEk3iCLQMkS
         6w6YpuSMoKKuSD2jDMJI35nmzeR3ECvphknKv0uRq4gFvStcfA4ZvI58Rtr/wYsRTKyU
         y+y42KXvsepi2j6GTliWSRdrUj2r7iLluk4TsoOQLsGwspYdhrgXGmNNx8IcB+bJ0gqq
         oc//5ILkXiGkHv8R0dIvLB3OB8HhlIZkxuLLdTRU6AmxCUY6u87Z2Q/JAAGGPFbHfNu8
         jzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041055; x=1754645855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOlOpSizB2wUtysPUMys+O2uMZJzVajxOlsjXd0pMWU=;
        b=kiaGgLO5W20WwV2uHni+oI21velko3lPJ/bMhGSmD9QQJMHvatKXJ8vxNtNwIGmp3l
         slcherFDfseIkcs34X1BS6SxTo5BtegwRBD3dhjnPDLW/A0hyA3FZ3XtvNi/Eb76VvdS
         Gh51fEg1k636NEMjBhz6BBP7I4iyMa0O5FQuEJoac2xV15axBzQ0xOVJVEjdRrkJ34fv
         OuKkK+Q9+BUdm/1fKsfLt17o9JhIDXuONA8+sWV1Hjb5ClUF5Qyw6LgFxt6LfDXtVkD2
         xZtxCYT40CJFqiqEVItyCF7NWrfFNgCyJNHwHKpksqo8KVmS0WPp5qdCjp5yAk+AqaeQ
         32Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUu5i9++dwtcr0oe3ZmyX1t7eWrdyi74Tysa1N2YJSWllw6iaEtMtI7eG0e4CR6aI80yUoDcWC3Ic63T9Q=@vger.kernel.org, AJvYcCWeDxNeUbnPJq2ek+8RQHVG7y43CNsFIiIoHu0gr+w5ZxLThREJT4G+KFs4I8zdA11/xkTrcXJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBY+HkqVIpGr13c9TC6Z0NE0EMlX86P+TDsrzTleU5UEKhYFS
	2dBNlRaKD15W7yLpWjknYgyu8w4Wcp4oI0i6Q9zCGv/BpTkKQkOM5JUWsmTx8BaG
X-Gm-Gg: ASbGncs/lGh12uIUeBmT9b/Nnud57Ya+3A/hRE0jsoXpgM8FGXGwQh7XUn7bsvb4cQo
	fF0u3aJcMG++GjyIeBv+WcCqlPcdFM0Qn2k2issyfiOwIbCh3j2qJH/IokfW4d+lImM85dr0lo9
	NuW0CWmTYu9WCecrPwFw0eSAN4oPNWq1H+21LR3PUF5+FuHtOtRJj0WjW4ul9+667F44AVaHl+1
	C0LWuTnhTG6Ia7xOLyTEkMbyr3a1jZLhbd8ZE+v/cf+MeK1G3qYmNExIOtG7u3LMG6T/U2CEkkJ
	1mJs9ffEQQgGXPdoCvKeJq8df4AucfL8aYqmygl/07rjFjA1RXTSjCs63ucQTxfWXWBK+tzpK9O
	fBc2XQ5qDwuO8it3iyfT3DI5qtWjCU6uqEYg=
X-Google-Smtp-Source: AGHT+IEZgrkv+ynSFqDmCZjFIwig05Tuq1icb4e8qAENs85ADc/+UvhkSzLmLfYvxrqeHE+JSMKtVQ==
X-Received: by 2002:a17:906:c14f:b0:aec:65a0:b60a with SMTP id a640c23a62f3a-af8fd7390d6mr1333093266b.17.1754041054788;
        Fri, 01 Aug 2025 02:37:34 -0700 (PDT)
Received: from localhost.localdomain ([193.138.218.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93b4d4c27sm6824366b.66.2025.08.01.02.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:37:34 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 RESEND] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
Date: Fri,  1 Aug 2025 10:36:19 +0100
Message-Id: <20250801093619.4918-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malicious HID device can trigger a slab out-of-bounds during
mt_report_fixup() by passing in report descriptor smaller than
607 bytes. mt_report_fixup() attempts to patch byte offset 607
of the descriptor with 0x25 by first checking if byte offset
607 is 0x15 however it lacks bounds checks to verify if the
descriptor is big enough before conducting this check. Fix
this bug by ensuring the descriptor size is at least 608
bytes before accessing it.

Below is the KASAN splat after the out of bounds access happens:

[   13.671954] ==================================================================
[   13.672667] BUG: KASAN: slab-out-of-bounds in mt_report_fixup+0x103/0x110
[   13.673297] Read of size 1 at addr ffff888103df39df by task kworker/0:1/10
[   13.673297]
[   13.673297] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0-00005-gec5d573d83f4-dirty #3
[   13.673297] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/04
[   13.673297] Call Trace:
[   13.673297]  <TASK>
[   13.673297]  dump_stack_lvl+0x5f/0x80
[   13.673297]  print_report+0xd1/0x660
[   13.673297]  kasan_report+0xe5/0x120
[   13.673297]  __asan_report_load1_noabort+0x18/0x20
[   13.673297]  mt_report_fixup+0x103/0x110
[   13.673297]  hid_open_report+0x1ef/0x810
[   13.673297]  mt_probe+0x422/0x960
[   13.673297]  hid_device_probe+0x2e2/0x6f0
[   13.673297]  really_probe+0x1c6/0x6b0
[   13.673297]  __driver_probe_device+0x24f/0x310
[   13.673297]  driver_probe_device+0x4e/0x220
[   13.673297]  __device_attach_driver+0x169/0x320
[   13.673297]  bus_for_each_drv+0x11d/0x1b0
[   13.673297]  __device_attach+0x1b8/0x3e0
[   13.673297]  device_initial_probe+0x12/0x20
[   13.673297]  bus_probe_device+0x13d/0x180
[   13.673297]  device_add+0xe3a/0x1670
[   13.673297]  hid_add_device+0x31d/0xa40
[...]

Fixes: c8000deb6836 ("HID: multitouch: Add support for GT7868Q")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
v2:
- Simplify fix with a if-size check after discussion with Jiri Slaby
- Change explanation of bug to reflect inclusion of a if-size check

 drivers/hid/hid-multitouch.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 294516a8f541..22c6314a8843 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1503,6 +1503,14 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
 	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
 	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
+		if (*size < 608) {
+			dev_info(
+				&hdev->dev,
+				"GT7868Q fixup: report descriptor is only %u bytes, skipping\n",
+				*size);
+			return rdesc;
+		}
+
 		if (rdesc[607] == 0x15) {
 			rdesc[607] = 0x25;
 			dev_info(
-- 
2.39.5

