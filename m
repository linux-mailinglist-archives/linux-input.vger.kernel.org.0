Return-Path: <linux-input+bounces-13626-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84AEB0D40F
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 10:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA196C030A
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 08:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CFA628983A;
	Tue, 22 Jul 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYocp295"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F431241C89;
	Tue, 22 Jul 2025 08:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753171228; cv=none; b=jb0xAJCi6s6S3FzDJF8xXvePki+V/KuhYo9afDSRijP2YiDVN81yOZCcSo2VDA0BmimalNiefhiPnTPWf2xNizKSeSfvyzZDM+IdzE7W+P8W70HmOleoLmydCu7AfHxpP05GunhxA7ykgitGf3UgRYSp2OEvumL1zQE7d1YMfRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753171228; c=relaxed/simple;
	bh=BvHq5GXTMNnj6Xx5RcptWy7nTCMQ9+nPIXyZI9x357M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GTAXHcYAdp+TaSBLfx1hqBqPYLss8qId/xOltP1peN13mrEIPlYzHQ+glY85OvLuxxyRNIXLIAJYNLz8kzME1DZz7eHv4neh6e7gB6AdXN7NM3cvIHVWTgFJJ4IqHpcyB9Hxl1fm35b50N6PXkRRQXU4CPPLDu1ewksm0FcyTQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYocp295; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so57550685e9.1;
        Tue, 22 Jul 2025 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753171224; x=1753776024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjkE7uD7uLuZDYl3olNEwoxF8mwgFZj795XttbcqyEU=;
        b=YYocp295y30C8XHn4xCh4Oges3skoo6Vgl7Bgonbe/clm2QNIs/VaxwMX2fTbu4dFZ
         U6KwX5fQisc4kyHMRY+YTL1sSSsMSgZ2Jau77pvvDmP+PyJJkeEA+RtRFvIXGfZNhUT2
         cBU4mhJXqsIYbNvqZSlbRqvvIiREGVgsG22ZDYJsHod7sxKuqCqp3u4Vp6selPR5eJYN
         dt8GMiQR7U0S+C3WmGpm4FzzPefTmVdHHxP6TlNwsqV2JQFGzc8TOEiBLIoW8CjMXmKg
         mai0HPyjNUK9QxEosELS4Bf4AyBhxIwNOWEEk+2lpXbQqPRqamYVWy9gJ4byOqfNF+GR
         69CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171224; x=1753776024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjkE7uD7uLuZDYl3olNEwoxF8mwgFZj795XttbcqyEU=;
        b=DTHf2Qq2ud+pxCKPhmI50vIR9JfKJLrKp0BDnFA9VtNzss9uVPemX6cDJLHCGZbr0N
         m03IkXwCYnxKILlzEiGH6SAHBOzZSQ4hg0ebr7NEuuIB4zfcncZvoF+ohntIwwPT5tM+
         XZt7l9pDeedWKakjtGwc2PPH6RbfCu0QOe64oRJ2ql3HerzG6KPFKlNM2PyqwJ4Fv8Ry
         4gZWEUHQ8eAhXLUPTI3gghAjbZPiqBYrC74qisMVL3/UWjQa67QTJKYWOB4KlXN7DRg5
         WbiY3b8muolNG7qak6mf8ObYbfi02vwVjuJY/etQLqazvIZQu3GeRmrmG27D1UBUGzoX
         OruQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqt8+43u2DJotu0erpOo6MQpQXhYG/5m/UAYI40Ls+kdpoHGzNN0bSYX1XAQGx4SCjQ5uZif0e@vger.kernel.org, AJvYcCWvAF+ku+YuTFBGQnAe/QgYZoD1HKhTt7xddGwLrEOD518zAleuIOVogpuw1zGWnxfxjvNeS6jbT5Z2eXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XhkPoAaDJGAZOCcgRHzj5XfYZbof5F1txu2XgHxbZdZ2MCdJ
	CKYwZFdPiPCt+otJHEBUEar73bsrKQEDRfZzEjkVxu+zgO8bvYXD5AnFoyZefA==
X-Gm-Gg: ASbGncuZLYQCVBYu9nuuAmUQaIkbeQvgg6Dq/sy9jacyF+liOWXNutlfwdKQ+MZahkd
	LCU/bAYLheNy0ZVCyT56xF6qKh76C0TweqRdW1N1eo4MWmJNmxG3cndpBjhB30EkQatMPrgBoD3
	UGlt6EDFiqgKCx15BfVmb8VhrM1Xw9IKsQ1EbBN52DXrNetAMhFWVwcNc9ghC8wMpCtiVm8l1Ln
	juZdocWLKu1Ms7sDWXipRbVQlGUgWzLkUc3inwL9tyUdwCw0KrS8Pv959AgQIILn+np7jB+1dL9
	3a6blMYW4quTlNYRHb1VETqHHHwn+Zoc6BznHILNY9kDKtz8ap62qEsqSiRnWKbAzEjMef02Qud
	/j4pQrrJ2YA2ttQ5fEV8zq9U5M/y9EUJ7vQ==
X-Google-Smtp-Source: AGHT+IHqDZUn7Hn59BvnITsvXyFBDUWkkuJexOdUbmB5NsVQNvau2eVBh/4wL6GkDxhxiJBMiv/Wvg==
X-Received: by 2002:a05:600d:9:b0:456:10a8:ff7 with SMTP id 5b1f17b1804b1-456306da0e0mr134037275e9.28.1753171224121;
        Tue, 22 Jul 2025 01:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:f4f0:900:eba3:22c5:bfad:dac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm12680504f8f.39.2025.07.22.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 01:00:23 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Dmitry Savin <envelsavinds@gmail.com>
Subject: [PATCH RESEND] HID: multitouch: fix slab out-of-bounds access in mt_report_fixup()
Date: Tue, 22 Jul 2025 09:00:03 +0100
Message-Id: <20250722080003.3605-1-qasdev00@gmail.com>
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
Reviewed-by: Dmitry Savin <envelsavinds@gmail.com>
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


