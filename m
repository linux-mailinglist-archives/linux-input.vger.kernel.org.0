Return-Path: <linux-input+bounces-17098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054ED20AD2
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 18:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C23F53001BF8
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B877E2FE595;
	Wed, 14 Jan 2026 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyya3wAC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E33532D0DE
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413276; cv=none; b=SzVMiVN7pam3HJs6lv4VKSOuRS6WoS1nSqTqs+Pshu3DRuI0/BHDPxOz0p/22OWyruS9ykGSarqPVVUk+VexKnS+gckoTqrYeq7MElUpHKNA+jx1ABz6XvNkuyZOfrtGRQtdXeBkfRAIr5FbkNXUhSTX/GFKA5iEDEvbw9OOZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413276; c=relaxed/simple;
	bh=Mr6ZawFdoY0cJZhJGTVos0y1SL4iN9Lhhnb7hU0Zd8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=LrQeixayomk+c4xAH9effeKNs4gCg3LGFY+N8a8MAzn5VUl8qegr2AloTG2ytweRvKjP8LePhEdgH5ZByBFi8q+qfvMY/PEnhLh8C3tDnQj2Ssp3mHcixLz47KQiOwlOD6fgvGOL5NT8MM3kHxljk6XVeExotlqGygsnh3nCpmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyya3wAC; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50143fe869fso559171cf.1
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768413274; x=1769018074; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TuyOYzoT85INzVMQ5KOj7mLYeVm9dS2xgxTRrKOEpI=;
        b=lyya3wACXUBz5E82n+PHj4P3ARY7FvaaEcpGQlWolmv9AN2OaSKSqnGeVRUWZqhnyr
         7Rk21EB0+y1Z980q+xeR4Q6WP8N0QVDttSTY84bm1KHjacEanBh0AXMhnkUhHYCxZJOo
         1N9ly/oKNGuNxwigVX1b/NYLEVkUeZpKhaQvFXdnnFz/O4d2VIwhdu5S3LkHyC4NviyH
         TdYa36cUMbLtoVrzDGf2AG6AU4GoXr7E0ZC3qiHyJ4UJv51QclmKv0l+FuxdsTvlF8Eq
         WnK+WVulsafHM2CiRQIwvRhKvCiXZN1dHeLy7rjmjaAkD4V9qZEQG2VyvoJRdRjiaDo5
         pBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413274; x=1769018074;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TuyOYzoT85INzVMQ5KOj7mLYeVm9dS2xgxTRrKOEpI=;
        b=lVaCJOrZqvuAswK70AQlpmQz6diDgmQ9ausSZIV09GUlU0pgmgPsjD/huhvS7YnPEv
         j7nz2MgQ6foeJv5P1csG0LYaHMXp/s7pu1A/mtkbNvMs+8PYD/oykdykbFeHsp9NnrEJ
         IytAxwIKR7mSfyQwVHUNPQQJpeiPriflHXBdLpXC4dJqdh6ctn4qOxp4avN7GdZvD4+M
         b/PQgSktSdyCJeHTLkEiCCM2d7Aurjw0bAumuzf/xikvN/reRZjZ8p09duvanIZeNPLl
         kkUWeLvCo8tJD0kqdbnT+oNTZPhIJ8luIHB79qaUeLP+EAc/7L+VWTWktc+zYiq65sxA
         vKaw==
X-Forwarded-Encrypted: i=1; AJvYcCVnZseMzZteaiyL000apKNyRI2V0uXn1xnT7ZCB9gdR+Uo3s49V5sBr1GnXzLFZP/ZqnZBi6bLR1+/Dkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Fvi4wJOeJILPByxA3++DDijf5V5WOxpV9qJioR6iLx06v5Md
	DnD6Gt3trl4xuCgnGMVmQwLe8Kp5gYCHVHdn3Ei0Mw+cCB1dOE9otMQUFKTzBeA83a0Y+cD9Xm2
	BiaDHzeb77YLNz/ah4FxyQRqtRgyNQaYBOAzKuDFK6OYNluZm
X-Gm-Gg: AY/fxX5LqB8wIqLhKdbxW5wSLzfkP+fyRFFefT/P2OtYQz7Zjr2l7S7G4rNHTmxA8I0
	1deI+NfDVjK8kVOyPWTAYFLdOyzkbysxucX2Axv+Lmvkde0b9l79ATgo+E9Co5sKGSafJsJxHrb
	U4RTEV/hqPESZBeS+NmQC2ZeNztGA/Fp5z479q3mtKcQQ/Qsbqtr5vKf39NVXGfQjHtvvdGrKEo
	K0RMWTtOCuuFDeF/lAD8oLE6BnAQnM6i1jlBUJfyXFGpUML6L+V6ZuGEGZokwLpKOyjIg==
X-Received: by 2002:a05:622a:15d1:b0:4ed:67bc:50de with SMTP id
 d75a77b69052e-50148211f20mr42972231cf.24.1768413273894; Wed, 14 Jan 2026
 09:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALEuBa=E1YSo1oVxd67rBf+6bC28zQZi5HBghMmcPFHKQn2+UA@mail.gmail.com>
In-Reply-To: <CALEuBa=E1YSo1oVxd67rBf+6bC28zQZi5HBghMmcPFHKQn2+UA@mail.gmail.com>
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 01:54:23 +0800
X-Gm-Features: AZwV_QieZ6A678e1fB5u8Ijn-XkpOeWWFnmyd1OWnaiDo49gufenY74rN5vDF3k
Message-ID: <CALEuBan0ktNs0df8jJ=F8vtDTV7kdRiadxb75CEt8gPEt+s0AA@mail.gmail.com>
Subject: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in hidpp_get_report_length()
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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

Fixes: d71b18f7c7999 ("HID: logitech-hidpp: do not hardcode very long
report length")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d5011a5d0890..02ddbd658e89 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4314,7 +4314,7 @@ static int hidpp_get_report_length(struct
hid_device *hdev, int id)

        re = &(hdev->report_enum[HID_OUTPUT_REPORT]);
        report = re->report_id_hash[id];
-       if (!report)
+       if (!report || report->maxfield < 1 || !report->field[0])
                return 0;

        return report->field[0]->report_count + 1;
--
2.34.1

