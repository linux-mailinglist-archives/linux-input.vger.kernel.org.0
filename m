Return-Path: <linux-input+bounces-13667-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE199B0F0A8
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 13:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D27717B136
	for <lists+linux-input@lfdr.de>; Wed, 23 Jul 2025 11:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52542277CB3;
	Wed, 23 Jul 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCkNJQvE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150E8836;
	Wed, 23 Jul 2025 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268455; cv=none; b=ZvX7J1dTzjF0Vl6TGDX4i3D7INp27dx2QbyBu5LLqZq1Qrz9fU2qCGLobTDtK7Q6EE/CCD6T+ftqRinmmOLQkKupvqDhxx7mnG/CHQsADDGY3dbaaFVgIps5yGYMl6+fYuXOrN8kHYqzE/3d/upf7TGHrjZiuvqrqMpiktB1mVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268455; c=relaxed/simple;
	bh=bMahuYUYM6/64hnLQulgIzsZOf3xlVVH4Q9fDdEtIFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pp1VwUatGykJH4pLOJIfAKc2D0lGF0lt5Dd8mdU/fzOKEN5TXm3hLM6akkuhIRELAT9fFFf2Lk6XTvSZGhPMahy81iijSqUbTLcLm/okM3BvUw+Lq6HXxg2liSsvP0i5VUSl6/uAbi4McTdZ8/8Dyb5abQqNBbB2qNTbFgapnLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCkNJQvE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455b00339c8so46958095e9.3;
        Wed, 23 Jul 2025 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753268452; x=1753873252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stallE/vzxsBh3c9kZVq7u8ek21pHjIuCENjScXlQNU=;
        b=mCkNJQvEFXarwNsFprXSUxYoFzoBN5sdUETlIKl2yN0z8dzA+0C3/cTlVqcPoxzCUS
         55JuTh7Gex9iaWlA27JamkilqUh7OEM0azyKnqauYb1QtVANtt7F88OAbR3ZqKKbPt3Q
         XuyjQEHJRH5ZokwyzkPu7r8MVpKcBXeQOvNWUntG1h/WXFbXib0uW/DfWi7AsgOSC+2W
         81zYYkvOWFDeL0ajwFeKchfR10LvPKk3D4WfyFp4GUNFrx+/eGj/biW4cfRPBNNHOHf6
         Ls9b3IoR1mr3L90ukWHRbmxRLTW8yTWEJhRN68lkyQCQJJAQHoNKfjXL97rl8+TJL9tl
         GqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268452; x=1753873252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stallE/vzxsBh3c9kZVq7u8ek21pHjIuCENjScXlQNU=;
        b=mGfehKWYPcBybfeZrZWMBAyvvZkGf7HUKzfvDBfNRwjNIoghfXoS3jAaERccvCEN2F
         d1Zdgkw8I0rOLgmyeQ7r4rtFjHUIpfszEVWqWwwTs7qMiKRhV+F+sUAQQujXY01KWZmo
         lksycLUNGisEc3KtOyXc9lUalwvzhLRAXFkTU38hib09xjbbWaIGNT0H7hZ9Ti2MDcmk
         ZVRdJyZAU6auTJBpCr54SC2jddanX5lwm/Lg5cY4EdidywQGJc/1p106vNlx7uxoUtkz
         seT6LuDVEXubfw7GBdfzXq8wnWtCvudL/aI6zZ2+qjY2sNh1do+zJjjGqndad/c7oBwW
         NbRw==
X-Forwarded-Encrypted: i=1; AJvYcCU+Xk/I7WyXwLdA2dBgaryWvcX1iFs95pTFOeD7QEOvMMfgCUQCguLST0n6LZ03TCGaIalaoHiC@vger.kernel.org, AJvYcCWph+3+3pGGBRfkhyJ24zn7xMlsZgoXdC1Fr6xVBPW1Sqxgb+RUWIqohL2nEv8BOJsckhAUKmMSOe9HfWke@vger.kernel.org, AJvYcCXEqmL6Szn48VjRcVQHjq8e49Gk+HIQX5xyLjR/g7tJrt2T3E8vD7PmlAf7DaYlrJ8WCfwJ1LbHp4POjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsdbtXjwxzrCnlhGShkVbNu0WuZPYNEBXp14nzNsLeRX7T9LKN
	iCd4RxVBuieSr3k1HZWwwxgrcycMD73d+hpkfAIhtFL84ygKTEYwSh+A
X-Gm-Gg: ASbGncu5DORANaaFqbWhKT/Tn7YRMDhlL9aRZNUPg//TE6czComhqIkCyOf7w1rM5vX
	sHeXnH8PsgJ4P1hnvEK4UTBgsCdyP5wne8jtl3QCpbD6ZX6+XMn5j4aG51sIiVOc1QlcyfAcfQl
	YgHXUDIdxIvO867XxMFsm5QllQDk5+8Wuoi1pc862TfCAfQvfsCCAsPuWSrJPPmax0k0N9wKMdQ
	PLoLF7+Ma2AkDpt8r73yhBFzAHpRrGS9VuWfbRqr+622JGc+jJ0dL/0sSVBnY6gKQk8FkC033+H
	2t24laDzEx/XKlZ5c2LCHjcfx8wDaiXq7+Q7tkne9sBct2zMeQWBQySlLYuaVhCog7d4qGY6qQf
	CKc5AgfnNmB9DpLYsarg1Xa31F/w4eFc=
X-Google-Smtp-Source: AGHT+IFeylv5DxY9J/rJ1xIOfkPYVeNtwo6o2ATJVK60KjhMryniQO9VztIJxYyMrYgGrOndtZr1YA==
X-Received: by 2002:a05:600c:4509:b0:456:133f:a02d with SMTP id 5b1f17b1804b1-45868d2dd64mr20531965e9.17.1753268451619;
        Wed, 23 Jul 2025 04:00:51 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:dbce:b6e:fb8b:9dcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458691ab836sm20061245e9.25.2025.07.23.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:00:51 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: envelsavinds@gmail.com,
	jirislaby@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
Date: Wed, 23 Jul 2025 12:00:36 +0100
Message-Id: <20250723110036.24439-1-qasdev00@gmail.com>
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


