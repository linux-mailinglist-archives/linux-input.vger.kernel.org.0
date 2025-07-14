Return-Path: <linux-input+bounces-13536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D208EB04B1B
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 00:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A9D3B0970
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 22:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F0277C83;
	Mon, 14 Jul 2025 22:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIiFnyYK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C922A276046;
	Mon, 14 Jul 2025 22:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752533852; cv=none; b=rB7Qw/y9SlwD9dRvwvxZv6aQRriFsZddFnF60SKIxwuhPw9HnuKc1bdg6OEbQrCJxfp77eQZhGNdI3i6WZHiS1YsqpUdWaOopsPb36GUuHvBywTpQQQK4Ulo4SCNJEYMOcR1LGXfVGHzUGL4TefG8ytA2CmNRI8FtHcNkPTZl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752533852; c=relaxed/simple;
	bh=U3p0u+W7VOVd5SMKSUGfHRbU285ZvJjES1SWE+V9mGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mbd8lmCy69JHLtWqfj+6ZZOy8e7awDACM7a38YblTRB66mwUjPEVyn6oMPVmNdXtl5JQXpErYK4WjkD6bRUUOb764xfQ7YA9rcL25wQeEFUSSG7YaPUzfKrPsDXONAbk4YIo8t0FIQ0ijoKiSyx0vZi78MyyJoY/bbHJnP6B1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIiFnyYK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54690d369so4025939f8f.3;
        Mon, 14 Jul 2025 15:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752533849; x=1753138649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nFh6/3W2ncQZaNEowJbLWYMvn01rurp6XyWO06VIjn8=;
        b=cIiFnyYKawk8gXMnS2KQhKKNexNU7xfm+KvbkiSVcu4fEehsle/WmNDi6V/wYZUPvK
         lnFSrZkgUOgz3Vr6Zj6AeTkXMxF6FxCg0ileDYbZtz34tMW3RFBLG1p3lRDunJkUUD6m
         7pLzjqeCXRMrt4AWYgyMZojhfwo5YIa+2lwl9G3wBdVvpVOMOjBtcoIYsY+cuLuVFzSS
         R4rMPVPV8yOkGC4ZcRavM/NpnoB7b1Xm799O1WlxSF4utRuqYgnLFSk05emYj5hhHsOf
         J69ICe1eGMhiEazSxX96CE3BTWRPTK2P+n+LlkujWx4AskJZCbM1QnU2Ig3uB7F6E3Ai
         O76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533849; x=1753138649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFh6/3W2ncQZaNEowJbLWYMvn01rurp6XyWO06VIjn8=;
        b=xIKGiag/ycCpeIQZYAVY9WRQa3TE+5xu3RKbNGbyJttibdgOBhM+LrrSnsVFAGe1a8
         49riNyFq8TUdNMrlTUiDfEFDFh08I31f4e4TSy0fBH/gj8iaGoymzAJjMJ8rvPQTP7DW
         ColVIfiWOQWY6hjAaYXQpHHWkQgzwKkJQUricRFzRMqxhT4MSHWjNyZ9IPajGX1gOfRw
         f0l9avNK7JjcWZJlnGsMMLyFwKUl1HW58MAO6aO3nuNkrkf2dd0TzXO2EHuErRrVTOvw
         DsGOa/M2kJ0HvlwLfZAmOlE7KYb9BdDn+dThsG5klrfZaM8qlm7kkfp4kus7cLjFJe/P
         /Yrw==
X-Forwarded-Encrypted: i=1; AJvYcCUS90BNX1rOyp1/MDf188u7Dg68jrgiBto0HSjSpDG+EXwQGPLTEtADnDsDGpfgoDDq8x0C/tJ4@vger.kernel.org, AJvYcCVfUoIyXQgobcBlgC95TsYD0aWABKGb7aVpT5ocgeVjRQdMMFKBOtBv5k7h9v23BVQtGjdpOKxEN8UhbQ==@vger.kernel.org, AJvYcCXo0GaR7sptf6cYYZ+fuTg017wF8qNJCg5R8mNzvbjWn72QI/TIycJdPMSg81Gc0bB6V6ywsSleXlQ439MU@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtup1BsXEE706GGYbiKlNzNGeVk/cxe0eBuBky/yAICxm8PKC
	g+Y2X/bGuFf1MjbsXmILfSRJwE3uXueQDTGElctpQ7IDdKpqzk3ZLNGCiNOcCA==
X-Gm-Gg: ASbGnctzzH3IkP1cPW/afawILAzsfEC9lVqmnSJP1mvsUhFz/S2cTrYJvA5wfeccd8d
	BHMpGMJgIlcXORloXuwdnY46qku2KEQ1AWgqAbUbqA/M2CCcPWIprOA3BJrKUCX60YLUZR9NaFr
	bjwWsb1v0IijNQgnw+GvEQi1vSmTcNn1O7r/nVtcIUIdS3LLlvO9YQNKf7wtrUN94p92cMN7D2M
	R1+GLpYtiVjrOVtExWxi9G6zZ3+2b8+SyStCu8HB9UU775V2FgEbi6m+CteG6mXvOxJWYuNAXbM
	MPSLebZy7lwEeXo9CN2sS+Gb3ZzQjwEWVzxDfFIbcwHM0kT/pUWvOdan9+WqS6g+8dpTkCZMguG
	sq7ulOHU4jOqr/+UpovaVDbtxuTbw15Q=
X-Google-Smtp-Source: AGHT+IFTCsguTv3NEycbfa9hxTRT2V0B8dpJKtMPyRdH7Gp/Tcqus2odOaOQERreDf27qiNUs2v2zQ==
X-Received: by 2002:a05:6000:4025:b0:3b4:9721:2b2d with SMTP id ffacd0b85a97d-3b5f2db1723mr11387869f8f.9.1752533848796;
        Mon, 14 Jul 2025 15:57:28 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:bd5:6408:a4f9:a609])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm183508015e9.3.2025.07.14.15.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 15:57:28 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: envelsavinds@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
Date: Mon, 14 Jul 2025 23:57:12 +0100
Message-Id: <20250714225712.17523-1-qasdev00@gmail.com>
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
this vulnerability by ensuring the descriptor size is 
greater than or equal to 608 before accessing it.

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
 drivers/hid/hid-multitouch.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 7ac8e16e6158..af4abe3ba410 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1461,18 +1461,25 @@ static const __u8 *mt_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	if (hdev->vendor == I2C_VENDOR_ID_GOODIX &&
 	    (hdev->product == I2C_DEVICE_ID_GOODIX_01E8 ||
 	     hdev->product == I2C_DEVICE_ID_GOODIX_01E9)) {
-		if (rdesc[607] == 0x15) {
-			rdesc[607] = 0x25;
-			dev_info(
-				&hdev->dev,
-				"GT7868Q report descriptor fixup is applied.\n");
+		if (*size >= 608) {
+			if (rdesc[607] == 0x15) {
+				rdesc[607] = 0x25;
+				dev_info(
+					&hdev->dev,
+					"GT7868Q report descriptor fixup is applied.\n");
+			} else {
+				dev_info(
+					&hdev->dev,
+					"The byte is not expected for fixing the report descriptor. \
+					It's possible that the touchpad firmware is not suitable for applying the fix. \
+					got: %x\n",
+					rdesc[607]);
+			}
 		} else {
 			dev_info(
 				&hdev->dev,
-				"The byte is not expected for fixing the report descriptor. \
-It's possible that the touchpad firmware is not suitable for applying the fix. \
-got: %x\n",
-				rdesc[607]);
+				"GT7868Q fixup: report descriptor only %u bytes, skipping\n",
+				*size);
 		}
 	}
 
-- 
2.39.5


