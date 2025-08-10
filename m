Return-Path: <linux-input+bounces-13880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2148B1FB9A
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 20:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3B7816B537
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 18:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB132253939;
	Sun, 10 Aug 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuBqJBq4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533A1E9B08;
	Sun, 10 Aug 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849410; cv=none; b=IM00Nrpyf8tx77C4nP8Rbzv4uH/x5TIeCGrcFf9fr8xDkIDTJqYoJPEimef9G41VN1rd9+Xlnv747CKsJut28gmixVKNLhkD+G3+qOAOfUu3Hw+FmbXXSzgp4ixvBTf5FUFj8ZXsnE5mSU/Lpr1DLScf5YXq4FspukILkEeaK6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849410; c=relaxed/simple;
	bh=K8IidkAxx7b6OjhfuXgrnbfygKnQsttvwOIbqsG4EIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I1ErlHkPgVELpaErSnFdKAnrmJOCZrXRy/99I/RAsyj4gvt2CJmSaN66V2IccCBflMCAMtN4Xw9X1gDUkfX5xmXa3QL+oEpbauyWLzPmFkEOP7wSFs4tCfdAVDMuDyMT9LDpIiHhhDPNd8unnXXBwiiKb5Eli0iOQ+MJ4YUceyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuBqJBq4; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55b847a061dso5190956e87.1;
        Sun, 10 Aug 2025 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754849407; x=1755454207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOlOpSizB2wUtysPUMys+O2uMZJzVajxOlsjXd0pMWU=;
        b=SuBqJBq4myf9YqI8FkqbS5AYsAwHk8isgG5ASnb55+k0zB6ZicBu91ohBnsxbdyPXy
         PqbETzApzQXfnrQkfjdcoaIsDjNyD/z+hjxcyPSNxXkv7KTgXhDZN13dTexwtKfjnhk+
         OT/1LnG6XjyUNMk9BRNt2OO+DtnTeHmc1pemm5urzYoRcpNO3vuPnlzbTR7hG96/ROi6
         Fpi5gNCm9dGAMmnwRmEZWXrixmjOOoiEq/1fO9Z6uWcmclJDDVRak7dL0o6bNi2v3u5R
         qfBj3jfx2LBEi7Mp355UD1XSNrKgsGFHMSv5JZC387LXEmQMou4FNB0CILuLLPa5KU8h
         7ONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754849407; x=1755454207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOlOpSizB2wUtysPUMys+O2uMZJzVajxOlsjXd0pMWU=;
        b=JycRZ3wssnfE3rdT3Dc5DjnU/2g/XOG7V9s5OUQFU7yNo1oDw1cnLDtyqkB9mgN3c+
         WtQDnaSJT4dxPiOa9Xwf+yJ3a4MLf8kmjyAobXhAq5KvEbwNkYPlQiI9vDvNTFyZae0O
         AAMv9Epu4FJlx3quHmIAAOBs1qKDFkoOlM4cFwtepxXKkz+Or74s6bStag4rQh1aSgY/
         z81AE/tYlT2nc+Q34FIxK2j38tHOwMtcC1O80nGxaNaUGdKkzzdIRW5CMQexg/TINoCo
         XZE8txRuwqlizaZQAvV35PpbTm/JRQZLnY2MZZKGkuJS092dVoa2PyVx0KL9yfsq1nYr
         kuFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/OK9y4su2VrNquAK8bpe4jjv6FpnpKJYE2Z6WLGnghA+X9sbiWCJcJPgThpQ6hvx+MZhA9xzNx3Mpw==@vger.kernel.org, AJvYcCXN2IcTeE5lOl/Noj1zmLQbSOTjo/EN+QZvkVmzoe1egCA9X/gbYQd/ujuPOiuI8Rw91P7Lz/PUqYJgJ6YX@vger.kernel.org
X-Gm-Message-State: AOJu0YzrWuyaQPDq78osd4ZMARdn6cFAC7ugZQGgVnpaEZbgIkFnTLBt
	voLVvJo9xRpKc21sVpxAEdVWklLbnITo3pgEiRuAQbAtKNKBBJ9GJxkbYoANjQ==
X-Gm-Gg: ASbGncsUQ/3WfztS9NOABE1tFsAEqfG0GEjdODWRvCopWUno4wsDqvn1wjhe+W2QuPI
	led5TEiPgmoeAMUL2+l6hX6eRECHVd+P0lWVbzAKqlA1cUTg7RLNRoh7TDkES+lIP13RcGgBqVM
	dLVqRbwzsTsq6Jq0S78+gedqr2Rr4oWuFA37UeppYGB3fb3ktApCUPp3127PojfqFi4bFL46vui
	LiGecd9x4qjwbHsB4PHx4k0AcONa5MvEoz2AwfDNvvrIjko4C0QXILSpvSBwP0wHXwGZ8EK0ecf
	pTy/Yrz66KhKIdOWfI/fHWyj/HMpZVMTcZrJWnDx6jKjLiDC0ygVWLf7DSinhCzLdjApR3BZFBo
	qQHd0w4SkZJcoSMMSr5uru37Dsm6ENUgO/xBUJhmQXUuhGA==
X-Google-Smtp-Source: AGHT+IEkQ2olRrK9KtjNmpW/mbSiptv8lGEt5frEYPzMqYqKK19gb7lFnn2CIpRh0grCD5yKe0XBDw==
X-Received: by 2002:a05:6512:4029:b0:54e:780f:3074 with SMTP id 2adb3069b0e04-55cc0033f54mr2637609e87.8.1754849406816;
        Sun, 10 Aug 2025 11:10:06 -0700 (PDT)
Received: from localhost.localdomain ([185.209.199.157])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898c158sm3906836e87.14.2025.08.10.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 11:10:06 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 RESEND] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
Date: Sun, 10 Aug 2025 19:09:24 +0100
Message-Id: <20250810180924.44582-1-qasdev00@gmail.com>
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

