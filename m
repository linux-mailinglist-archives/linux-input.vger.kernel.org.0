Return-Path: <linux-input+bounces-13512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 137CEB03372
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 01:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611A11762FB
	for <lists+linux-input@lfdr.de>; Sun, 13 Jul 2025 23:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B236E1F463C;
	Sun, 13 Jul 2025 23:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl+jGQ90"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E0386340;
	Sun, 13 Jul 2025 23:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752449466; cv=none; b=b07tt00cm6bEX4ZI2vsNYJg2JBNUcIEKCs/H0naKlvT/DIN5jsy+jVGjyyyXenI7Ijqe6useUql8ocKG58bfoXeaupo2CLzVCIq1kEATpkucI6C2ALNIGg6iXFpv0sAu1n8Gef0KZ70mS/CK9yrB+dG6t4Ah6gNySRb/UdZi9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752449466; c=relaxed/simple;
	bh=bJo8xxjcE1lTfLcGzMb3T/rRcaK4egKjQlWJDWN+OR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UBehOf/BtXmj2X5tcK3So3NieOk2C7w9nF11W9VGwese4Vs3DwmqQYCte/PaKZcCTwGuRDCNzzXsMEgttaGe8Fjt2xUZU5/GXgu65Yd6yRQ4udixIcQ2pLt9Di4IkiiaqumZCxEXrSRx3BCaa9aiQpv1XsAPxJ1YxMTFxV5IYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl+jGQ90; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a510432236so2760642f8f.0;
        Sun, 13 Jul 2025 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752449463; x=1753054263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/GY2/dE+mO5MryruF4BoK/v2xcVkd9rBBGX0ZUv8DE=;
        b=fl+jGQ90Yc5zN2z/aO+B+SEuPkUnYoV/kVtKkaKBHmAwlu2gbtSRJHK069fQsgP9TX
         5cnvkb1FJcv9tByyG18GDTImFdTV+ExhhrrLp6iAvfIf6fxLOpZAzLUhHcKaj+Q1phvW
         KMRSB61b4jiagLrqq1NpiAAJoJMIGZ/Wbb5KhhluGgoieKjzjwEgveHgFhPK16+Nhus2
         1rr2Mc0YezT3UxvnHvUA3EhH0+g19M1nWcG7TCMj5e9rcKWjmpmJYGaJ3qavjBYOYN1d
         XhtHfF+kptXX8+jV9m+iHu/Vh1gKZRHHNB+wUTAOtpkcNc+l57w+fVTH40MUKG1Czp8K
         b6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752449463; x=1753054263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/GY2/dE+mO5MryruF4BoK/v2xcVkd9rBBGX0ZUv8DE=;
        b=bxS7uKw9dCkXrWAb25sv5v29Y4swD7D1TlLzHiKmQquN7iiSgc1EalA4BIKYAJQmrs
         0PwPD3iOj2OePTgS9LO9y8Is0CcqGzeh+jtZxTtz7/3OWHpDp2h5hiYENm03Fm35JVM4
         1qNqmBiUUaoAP2aJf/73orVTo/cHi9xpGZlepAmXrcNb3QxspyfShMM3TUxlWMywiGSC
         qbK72J3s/VDsq/4uGYY+IvXXaCdeRm44h0VcoBnhXLztoR6/J4VkzFx7q4COoZO63wD/
         lrh5ozhGxHup/9Wojp+knlrnPHBfxVsVYC787LYty3CtHGO4fFr3A0ZX8k76Ki1xHzb4
         YrUw==
X-Forwarded-Encrypted: i=1; AJvYcCVDJEHZkVQcsqzyKmU2BkwrLE+01nkjX2ZSG1r3FTthXKhLeFDXERDjBXAdqnWwmj/EMtFxC5W/@vger.kernel.org, AJvYcCW7SHohvKAEAilC8St4RzFHUtsTF2BOm74dhMLwyVPmF6viZ7HXHOWvj+WNFe+FA91PdrN+cduqCuXvKw==@vger.kernel.org, AJvYcCXjBI0TUj+TEtCyz3hz+JxD5v9Z3NkFbzeCAQyC0+J1+6VVWX6JNb5Z8L4HTBVkxcfkAqQliFUMYiY40KUV@vger.kernel.org
X-Gm-Message-State: AOJu0YzFaQJYl4Vz+oZPEFDpRfCMRSHvQmFUBbNzt5IOtnyoQFZR91M8
	SyqgHNy6fgjRQF/C5uT862xnZgDQAYyoL67F82Xs9BHyVOa7Hkd3zEOT
X-Gm-Gg: ASbGnctZgO8dU1lJQRKW+BLJHQctr+kWV3oUwqi+sClPYomLTmE1YzxZ9onp0NQXcMi
	ngzWf73G7CuTsZ2l8O7JVxJ8vNOXiN0T4SrMuBlzh5eDNyAMTWGgtPYuAlOkko5QVvvJ5zNJUnS
	ykbkGcZ14rnbJFh1GI0svmDziCimkZ+JbegJYHiJMuBXAhSrI6620HkCsMrfPBinvwJmzSvgpdB
	cAY5nX2lQmxi0MrW/MjIJYO5bJMekPo531y1RrTs/jUkO8WbUgdnlNfcNapzoFH+vDXRzZCqbGW
	vYq93RngZ8QQ/lDvxb756+lVa6qVgVsEGzbQLniNuvLHF0Poob2BwCGHePsN6LBwM2pZlrciDEH
	PS6II54qWXib7lVBKGvGP3Q==
X-Google-Smtp-Source: AGHT+IGCP9p4QYP5SRA9YCVbSRg9d+gvPcHbKXec0egiN+Ad0ekd4msTCPwzNoabooADvXVCdvgPbw==
X-Received: by 2002:a05:6000:2f84:b0:3a4:f70d:a65e with SMTP id ffacd0b85a97d-3b5f2e1bb53mr7805557f8f.37.1752449462880;
        Sun, 13 Jul 2025 16:31:02 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:20f4:6eb9:1d8b:99cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc21e7sm10865512f8f.36.2025.07.13.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 16:31:02 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: gargaditya08@live.com,
	orlandoch.dev@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: apple: validate feature-report field count to prevent NULL pointer dereference 
Date: Mon, 14 Jul 2025 00:30:08 +0100
Message-Id: <20250713233008.15131-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A malicious HID device with quirk APPLE_MAGIC_BACKLIGHT can trigger a NULL
pointer dereference whilst the power feature-report is toggled and sent to
the device in apple_magic_backlight_report_set(). The power feature-report
is expected to have two data fields, but if the descriptor declares one
field then accessing field[1] and dereferencing it in
apple_magic_backlight_report_set() becomes invalid
since field[1] will be NULL.

An example of a minimal descriptor which can cause the crash is something
like the following where the report with ID 3 (power report) only
references a single 1-byte field. When hid core parses the descriptor it
will encounter the final feature tag, allocate a hid_report (all members
of field[] will be zeroed out), create field structure and populate it,
increasing the maxfield to 1. The subsequent field[1] access and
dereference causes the crash.

  Usage Page (Vendor Defined 0xFF00)
  Usage (0x0F)
  Collection (Application)
    Report ID (1)
    Usage (0x01)
    Logical Minimum (0)
    Logical Maximum (255)
    Report Size (8)
    Report Count (1)
    Feature (Data,Var,Abs)

    Usage (0x02)
    Logical Maximum (32767)
    Report Size (16)
    Report Count (1)
    Feature (Data,Var,Abs)

    Report ID (3)
    Usage (0x03)
    Logical Minimum (0)
    Logical Maximum (1)
    Report Size (8)
    Report Count (1)
    Feature (Data,Var,Abs)
  End Collection

Here we see the KASAN splat when the kernel dereferences the
NULL pointer and crashes:

  [   15.164723] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000006: 0000 [#1] SMP KASAN NOPTI
  [   15.165691] KASAN: null-ptr-deref in range [0x0000000000000030-0x0000000000000037]
  [   15.165691] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.15.0 #31 PREEMPT(voluntary) 
  [   15.165691] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
  [   15.165691] RIP: 0010:apple_magic_backlight_report_set+0xbf/0x210
  [   15.165691] Call Trace:
  [   15.165691]  <TASK>
  [   15.165691]  apple_probe+0x571/0xa20
  [   15.165691]  hid_device_probe+0x2e2/0x6f0
  [   15.165691]  really_probe+0x1ca/0x5c0
  [   15.165691]  __driver_probe_device+0x24f/0x310
  [   15.165691]  driver_probe_device+0x4a/0xd0
  [   15.165691]  __device_attach_driver+0x169/0x220
  [   15.165691]  bus_for_each_drv+0x118/0x1b0
  [   15.165691]  __device_attach+0x1d5/0x380
  [   15.165691]  device_initial_probe+0x12/0x20
  [   15.165691]  bus_probe_device+0x13d/0x180
  [   15.165691]  device_add+0xd87/0x1510
  [...]

To fix this issue we should validate the number of fields that the
backlight and power reports have and if they do not have the required
number of fields then bail.

Fixes: 394ba612f941 ("HID: apple: Add support for magic keyboard backlight on T2 Macs")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index ed34f5cd5a91..183229ae5f02 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -890,7 +890,8 @@ static int apple_magic_backlight_init(struct hid_device *hdev)
 	backlight->brightness = report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_BRIGHTNESS];
 	backlight->power = report_enum->report_id_hash[APPLE_MAGIC_REPORT_ID_POWER];
 
-	if (!backlight->brightness || !backlight->power)
+	if (!backlight->brightness || backlight->brightness->maxfield < 2 ||
+	    !backlight->power || backlight->power->maxfield < 2)
 		return -ENODEV;
 
 	backlight->cdev.name = ":white:" LED_FUNCTION_KBD_BACKLIGHT;
-- 
2.39.5


