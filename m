Return-Path: <linux-input+bounces-5374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2A948B49
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 821FF1C20B6B
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 08:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D565D1BCA1B;
	Tue,  6 Aug 2024 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXLFizCS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7D3C092;
	Tue,  6 Aug 2024 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932817; cv=none; b=nfk3YijQ+ICxooI9tm+wWvpmEGH6rv87hZkHWNpCUqovWRPEmtTYJly6HR3vYvact5jufuz7fWaISi91IM3tLRlMwU/46LWJrG6I7JGR/SXRsDNQeet3dTYFuXA8bwut04uzT+EfvkasEe+ULkjgRh4cSdRCtXODCZyci5Su69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932817; c=relaxed/simple;
	bh=QJkh28dfaTpLjVEIV2Nz8NvUIGeG3YYvhCkbDyeVoJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBmPQhkMCXDj8YfQ3AXOp2SOxTgWQStPYV8/i/rNTjqoKKaM+Muh5A2duX6BSCtl3wcqyVBiARrx5Jy4FFmorSelfsI+oFJCyd6dvYdOOefW39l89BvPk1Yic9+DbguqIJ3zl2Mc72WZI/L+ef3xSGYoGvZGWR6bcpq6s+1u6uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXLFizCS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc4fccdd78so2332445ad.2;
        Tue, 06 Aug 2024 01:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722932816; x=1723537616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=21cCqT5PRweYK70/48x7Kh3qRL476Uhp78KESvWeohE=;
        b=QXLFizCSpMo3TohhAtGiWUMt8pJjpm+2y1tS7Mij21GIbxBbgarpkQBrVhWFX5RRH7
         kDQ3uUcY9vhbtERPRIWNNpr4hgvFziSPTsecsZ93IWlsvcjz5MPv30p9vogi7xUA2JKU
         iRnZk0KRxGGPewZl+lqJU4m0RrxJEdxx9fdOHcBRA9ntXXHI8lq+cw+jL7orsSzt1TQC
         y6dsjAZwY6lHGXoBJtkjAxTzwFdif+p1hcrHT4S7kh274raeffUcKMxjTPV+Yit9XEdL
         T5N/bGB5yMJ7TS4XkG+ErVeEngf8UjGlOwOurFTTc5dkjj6GdSR2rLLGJrUT2G0BLLLJ
         Z50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722932816; x=1723537616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21cCqT5PRweYK70/48x7Kh3qRL476Uhp78KESvWeohE=;
        b=V57y3OwWo0adEgfj8OupllJuPyYaypf9EwZKesKFMD6YFB9a3rJXcdz4/S/Asoz5MX
         xU7l/nh7sKjxyfxguqTjonjKAOS97TV4yJhloxvdKILcH0o/vKzfprp0VYIJ6EmGmDyq
         IntSP+4CYRvUMaUoyx1NnoMRYbEvXf3QA7USpFder7fOm7UPMCW6ZrTISt3LL63tJhl5
         KEu2AcBHg0rPA4EMrTTxFTRrWW8NkiXQmZOj2LK9sFqx8kbSMULNORUdgZMvYDChsU6U
         BAtQip/5SWDdXkf9RewFy0q8COirEJPAYF6UmBm8v5LvY2SxdTX8Ufnk7uv3lyjzc8AF
         JUkg==
X-Forwarded-Encrypted: i=1; AJvYcCXLv+m/O3l5x6NKjki3ZAH25GHZ8zVIdoj4yGXKPvXWIqi3wGcwkH2TCOrchFiYJDTwIPyIu5gyiz2ekto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIWpUYH+jVbcAxsGMvPKyTkTDDuaQXZrNmPVCfRQmSCF9wpw2
	l0K3ldkrUp5fnsNl1sVbqjrB6ySS0/QdCuQEhK/JiAgdFn68RB7f
X-Google-Smtp-Source: AGHT+IEq9/4drMN7kIJagyt6lrlCSWgHiibKxIIRqUq2p5mmi0bXPHTGWSPyacFRkErrEli/VAB2LA==
X-Received: by 2002:a17:903:22d1:b0:1fd:7097:af58 with SMTP id d9443c01a7336-1ff5727d560mr147468455ad.11.1722932815585;
        Tue, 06 Aug 2024 01:26:55 -0700 (PDT)
Received: from sis-tammy.. ([2402:7500:587:98f5:915f:607f:a35b:7990])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff591764ebsm82106985ad.197.2024.08.06.01.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 01:26:55 -0700 (PDT)
From: tammy tseng <tammy0524@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tammy_tseng@sis.com,
	tammy tseng <tammy0524@gmail.com>
Subject: [PATCH RESEND] hid: add patch for sis multitouch format
Date: Tue,  6 Aug 2024 16:25:32 +0800
Message-ID: <20240806082531.1353207-2-tammy0524@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch is to add proper quirks for sis multitouch format

Signed-off-by: tammy tseng <tammy0524@gmail.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841f24..9f49bc7a157c 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -212,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -396,6 +397,11 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_SIS,
+		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
+			MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_CONTACT_CNT_ACCURATE,
+	},
 	{ }
 };
 
@@ -1787,6 +1793,9 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
+	if (hdev->vendor == USB_VENDOR_ID_SIS_TOUCH)
+		hdev->quirks |= HID_QUIRK_NOGET;
+
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	if (ret)
 		return ret;
@@ -2243,6 +2252,11 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8, USB_VENDOR_ID_GOOGLE,
 			USB_DEVICE_ID_GOOGLE_WHISKERS) },
 
+	/* sis */
+	{ .driver_data = MT_CLS_SIS,
+		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_SIS_TOUCH,
+			HID_ANY_ID) },
+
 	/* Generic MT device */
 	{ HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
 
-- 
2.43.0


