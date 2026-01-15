Return-Path: <linux-input+bounces-17111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5C6D24ED5
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01C7D307156E
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 14:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7153327C05;
	Thu, 15 Jan 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxDFF3OV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9783A1CF9
	for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487066; cv=none; b=D3oneD732lNRlq3QFiBOlzkD5Z115U1PvPT1/ehiY5FsZqF0wegiJsLde+WECOw037sVTlr/wnqJ7ETcnYNkSncALlUxV8NPywHOw+Dp1Tg1OQhW81rFZR0PhP5W5+yikZkYGYD3eAPefRVCVYoVYFW6Wq6mrtJvwrvZOtWfIIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487066; c=relaxed/simple;
	bh=YDTfphG9M7s5fXwD2EF3523do6PVYLEQsWkAXMkRqtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqeANRoa6DFHt1zKcz3i1YY6Dcnv74P+zjpplT2qk6bjtKBUyeCOr0yHEk5B+3r57isfIzralNWvtKubbtL42ugqdcVgf1kq/UD1HxHCcStBM9jQhlJfF+e0sbp3uQaaQpoib+0pw9WCCVZOdXLJ46jQyxn63kvBX30FpXryfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxDFF3OV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81ef4b87291so505378b3a.0
        for <linux-input@vger.kernel.org>; Thu, 15 Jan 2026 06:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768487065; x=1769091865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdyg3fxehckQBrnIgZSWZgEEopAWztU8n5zyqQvE2rs=;
        b=PxDFF3OVgG5e+BDBQ8Y+gyMtutZRU8QaEQZ4OQwRTW9d6ZxlGJY70niAayPSL6vNSe
         UsCfC0Rqbtl7Us0bQoO3fgRp/edabkGajUij9TIE17ESCM/MhRSWF+dE4d/MyHtW6QLi
         8Qj2CvVwFRF0YjdRg1FqsbR3BfMI1BMoeOlr9hiiGFzL0dS3Asq6gbCwppD9+l+Md6sM
         Zrb7uWJDcGuH1UP4e7eqtWn5l5d9xZF0mPztn0y8CsJysHS8LjyZqnCSHMDwJtjQ2v4p
         e3hKUTSaNQeJl7/MT3enbqSlrT8VDL4eAgJM/GmkROuHQmrOwRM1fvD6b/S+NxzBJXev
         mXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487065; x=1769091865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdyg3fxehckQBrnIgZSWZgEEopAWztU8n5zyqQvE2rs=;
        b=bcte8eNm/P7c0qr2MYOIBoCsYY4nCDL8z8TC25Tw4KQvVtGEz/2ymZXKRjov5CzyEG
         +euPW4jTNG69b/bYDxRagjRGjyBG9FDz5ScRTkFc5jmiGkHmMobtuO3aNpAOzkpCMOB2
         pGLdbHGUm4DGLxMZaPP6CDvOqd+V92G0u8YCEK5JBnb/DXpdfUbIuRadrbZb8u6S5jga
         3jPQZknbe0rcVc+o8XR9+qU5U1P+eGkNANvcpdyEDaoWkiVCFm8bhrVDnPQjJEbTC0Og
         uFGyBq3zGSAtsAZyNEn8F8LxQ0fjY5ggjXDsXWDDqqxvfY7yQ5G0MszL4WW9EhEjn7P+
         0/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWzShRmlhAOfAAVNYXB0kiob8P1c8Y7Di8Z9EsVscvSXrO3CqYV6WHOK57C2y7x0TJBuCebbCbDZ+r2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYkihUIc9psGiH51gv3x3DAU+wFkQ7wwlco40UyTyNfvdP0guZ
	ILoATQmX4pyg54qkyE+S5fgTAqC6dl9MupSxthI3cZRvGPeKDJzqV1k=
X-Gm-Gg: AY/fxX4DVPPIqPiaWBa6pwKy4ExuI6Xkv+bcpyVrrzndJcCSEWu1GGLrTpfq3XUN6Is
	wfoRvHm57T2HRytj3HZMzzx1cvL0NBNRqDoLQ71M+gKp7RhusrUGWYGv4ZdaD0GXVnGvZKfqTF9
	DSAo/4zCrleL6vIGHfnZW7zS96jtoM1ws1em7zgCKRy5+LUBJGJbHrIXqAJNzOcePCeCN3BXoof
	uTB0kE+/yoDjoYhviVt0riRTnf2QJ2b0b77JDcKKGEpxs9XVrdeJ12+DpVjaFuOcBmn02LUdQWc
	h/5eqprEwexDPjKed1r7t6Og+mLJ4uO2kn3h7LhKZgmJJpuC67zd+sul9/aiAgodb22gArT0sPh
	qOBwJVI38DOH9IVKoA553m2FbUgiWBUSCpul3qYa34CdQOPtWmXqwjuP04OC3uWzgIIHpUsCDWI
	ilHmnPC8H6VFE4f6/tleH519cIuhWK5Ly+A7+L0UflNCI=
X-Received: by 2002:a05:6a00:1da1:b0:81d:a1b1:7313 with SMTP id d2e1a72fcca58-81f83d477bamr5201620b3a.53.1768487064699;
        Thu, 15 Jan 2026 06:24:24 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([159.226.94.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e679ecesm2668007b3a.55.2026.01.15.06.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:24:24 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: lains@riseup.net,
	hadess@hadess.net,
	hansg@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in hidpp_get_report_length()
Date: Thu, 15 Jan 2026 22:24:16 +0800
Message-ID: <20260115142417.243-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add validation for report->maxfield and report->field[0] before
dereferencing to prevent NULL pointer dereference.

The HID report descriptor is provided by the USB device firmware via
USB control transfer (GET_DESCRIPTOR). A malicious device can craft
a descriptor that defines an OUTPUT report without any usages
(padding fields). When the HID subsystem parses such a descriptor:

1. hid_add_field() calls hid_register_report() to create the report
   object and stores it in report_id_hash[id]
2. Since parser->local.usage_index is 0, hid_add_field() returns early
   without calling hid_register_field() to add any fields
3. Result: report exists with maxfield=0 and field[0]=NULL

When hidpp_probe() is called for a device matching this driver:
  - hidpp_validate_device() calls hidpp_get_report_length()
  - hidpp_get_report_length() retrieves the report from hash (not NULL)
  - It then dereferences report->field[0]->report_count
  - Since field[0] is NULL, this triggers a kernel NULL pointer
    dereference

Data flow from attacker to crash:
  Malicious USB Device
       |
       v (USB GET_DESCRIPTOR control transfer)
  hid_get_class_descriptor() -- reads HID report descriptor from device
       |
       v
  hid_parse_report() -- stores descriptor in hid->dev_rdesc
       |
       v
  hid_open_report() -> hid_add_field()
       |                    |
       |                    v
       |              hid_register_report() -- creates report, maxfield=0
       |                    |
       |                    v
       |              returns early if usage_index==0, no field added
       |
       v
  hidpp_validate_device() -> hidpp_get_report_length()
       |
       v
  report->field[0]->report_count -- NULL pointer dereference!

This is triggerable by an attacker with physical access using a
malicious USB device (e.g., BadUSB, programmable USB development
boards).

Fixes: d71b18f7c7999 ("HID: logitech-hidpp: do not hardcode very long report length")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d5011a5d0890..02ddbd658e89 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4314,7 +4314,7 @@ static int hidpp_get_report_length(struct hid_device *hdev, int id)
 
 	re = &(hdev->report_enum[HID_OUTPUT_REPORT]);
 	report = re->report_id_hash[id];
-	if (!report)
+	if (!report || report->maxfield < 1 || !report->field[0])
 		return 0;
 
 	return report->field[0]->report_count + 1;
-- 
2.34.1


