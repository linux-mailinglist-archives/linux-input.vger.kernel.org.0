Return-Path: <linux-input+bounces-4093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D48FBFAA
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 01:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B7D1C21433
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 23:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A8A14D2B8;
	Tue,  4 Jun 2024 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l5Hd08P1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5901D14D2BE
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542652; cv=none; b=gAaSQhBhj+CDoufCuyyK2gh/VG8ENCkyja20YxAdfgFS3fs1rd5DfVCNLQYVOLpt1We4DJ5371JkdzUf9rx8+kBUSZ1KJTjj3uaVy7B7d82MT/IGLpf1HGSqxS2YLwbGwrjq/EnWUYqP7ZBQaQ20Ieodyan/gNySRhGzX9KTTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542652; c=relaxed/simple;
	bh=q6f3+CEmSn/sqvDrtRo134SUJ6qrjd6MtwMfh0xatDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qwb4/UNO4L7nyMUdU8Momf09Ec7pwjur5DAJQST1S06nBFRCWn0DKM5A74r5U3NAiqi4iAnv/miswYiPtN2tPtyHTZtEkikNiIxdmmMnO/Yoxo8KWHQdz5+yAz3+oFAfDlt+ftFvutGpRpKx8iCHxfuT0lFDnGdPzlp4FMcJ/nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l5Hd08P1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f44b42d1caso47523765ad.0
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 16:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717542650; x=1718147450; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F53mgWQuLqtm94K/4iUoD0dBowWP+KqYs30+ZsKPSm8=;
        b=l5Hd08P1SqInpMVDh+E4hnqwkNjyQ8AkgDTvN3sIAJcNGjc6IK6nwAEOweWrHjPJFE
         ITFMGXz6+qwYreIrXfyiW4b3w+6OSCItvALu0j/zHbTZNHgLZhd4Hud7E22OSaoNpCcm
         2HQPeNQpTmFBvYKgBqaZXwPQHSC5acrhoPBLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717542650; x=1718147450;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F53mgWQuLqtm94K/4iUoD0dBowWP+KqYs30+ZsKPSm8=;
        b=H/WXCbTmo0YNqn8otGgaAnAVfqVs588hc2/y9kmpQqd1xEkFdzK6CSzB81c/GWuWEG
         fSKflIZx/Yrb2Tty65eibJjjoO7LXnm4NAD0PwaeC2zumP2w08XO2zLfDs5QFL5daIis
         IGNhZlS7CKUnjTWHciMKt28Z0aYQbGVt4h1oJn06+JFgu0+sZJqw4MnZCeNdPd2B2ulf
         Cr9PRNJlo+MC5Ni2L0Br6Pc1VrfteHIPplpTCa3C3ECSZaNpamCAYGpKK9zz9Dypz3OI
         HSK+dYMocGpgspYg5Ga31XRfLgb/XiLu0zBSVYyEPfVyWLoxB5ZU3lloWxZDESFjoB+/
         FPQA==
X-Forwarded-Encrypted: i=1; AJvYcCU6afZMoQfwHSELURv9svdbGFcjGOFsZx+9LLYEmvY0/6Gp7FoebZDhspFmTZipNocjvlyEs4eJHqYHtYCJKZL67l87r7sIhV6GCG0=
X-Gm-Message-State: AOJu0YyFqbC/joiLwsf6KCwW8llHDgZvY8/2p7lKIunhyHSX7TiVbtZq
	/EKTN/6QlgnYfH0HTgUCFhuTetwr2xHj4eodC2I84m06yb+6UyJFO9kBKHLReQ==
X-Google-Smtp-Source: AGHT+IEtP2AblCN7iPchkTB7bxIFx966aC4UArKxoWIrDxd+EHukHNgD6eq4PaqUz3aJE1Fr63NUOw==
X-Received: by 2002:a17:903:120c:b0:1f6:857b:b5c with SMTP id d9443c01a7336-1f6a5a12db5mr11946905ad.32.1717542650333;
        Tue, 04 Jun 2024 16:10:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:200:72e1:5805:701a:f116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241c39dsm88644665ad.297.2024.06.04.16.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:10:49 -0700 (PDT)
Date: Tue, 4 Jun 2024 23:10:47 +0000
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v4 1/2] input: Add event code for accessibility key
Message-ID: <Zl-e97O9nvudco5z@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

HUTRR116 added support for a new usage titled "System Accessibility
Binding" which toggles a system-wide bound accessibility UI or command.
This commit simply adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes from v3:
 - Fixed patch sending workflow to not muck with whitespace.
Changes from v2:
 - None
Changes from v1:
 - Modified formatting to match existing code, ignoring checkpatch.pl.

 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index e7ef1ea107c9..7749c81b6227 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -974,6 +974,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_CAMERA_ACCESS_ENABLE] = "CameraAccessEnable",
 	[KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
 	[KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
+	[KEY_ACCESSIBILITY] = "Accessibility",
 	[KEY_DICTATE] = "Dictate",
 	[KEY_MICMUTE] = "MicrophoneMute",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 851ee86eff32..1ecc5ad57b56 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -829,6 +829,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
 			switch (usage->hid & 0xf) {
 			case 0x9: map_key_clear(KEY_MICMUTE); break;
+			case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
 			default: goto ignore;
 			}
 			break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 022a520e31fc..7ff6eeef1af0 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -617,6 +617,7 @@
 #define KEY_CAMERA_ACCESS_ENABLE	0x24b	/* Enables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_DISABLE	0x24c	/* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE	0x24d	/* Toggles the current state of the camera access control. (HUTRR72) */
+#define KEY_ACCESSIBILITY		0x24e	/* Toggles the system bound accessibility UI/command (HUTRR116) */
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */

base-commit: 5128de84d8fc849400d00f7a6982711f129699ea
-- 
2.45.1.288.g0e0cd299f1-goog


