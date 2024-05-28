Return-Path: <linux-input+bounces-3917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3328D2831
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 00:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC951283C9C
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 22:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1990B13E052;
	Tue, 28 May 2024 22:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IIBtf2Ne"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712ED13DDD2
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 22:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936247; cv=none; b=D2SWZQehYAaomoT595WTuLjAMcOP0cgeTq18lXgaUCyPiYA/lTspEMCQsDUF8aVu0RnXX43dLnjQIpZLIaPwVc9/94xXmpHvr9hpWIKB5QlOL4ELpLjwFUXNUhHSS1w7DN4VkzVzuRZXBQNR1esgIpJQHWkJAv5MnGtAKe/oEBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936247; c=relaxed/simple;
	bh=BUedMV/ffUVYdfOlu5gTQubihCY332FMLsR3fGqaNoc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rA7nltb1fmzsMKk1g9HHOCxw5y4jZDkX3q/NoeGijEisNgLu8NoF5GmpJqI/LUT5XpV/DBZLMCrecm7a4dCk7hQ43ldjBjfBxmcyjSTm1ZbYk4a8icv5UKXlKSHRHZbL2w0bjDp8RF0JWvtHZnuZeSj544wtpJiAhtYPqtk6aRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IIBtf2Ne; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-24fca68b554so617498fac.1
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 15:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716936244; x=1717541044; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gLJo+owXkIWmYmXeTrpASB4a7vClZ8QpV2WQf0qJ9M=;
        b=IIBtf2NecxzWjJyJnlnqndzxeygik9SphqI1m448PQXXrkMdXieyE+fkNk3lcj5Zir
         ZSbVWeP1K9uaRAE2g5XofSObhFRGVK/uApzfWH5nm4vQE0EfVSYVK1A2tMaDh9fi9LKa
         ATkgPnRaGxQAH54G+E248F4JcLwo2DW/re65Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716936244; x=1717541044;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1gLJo+owXkIWmYmXeTrpASB4a7vClZ8QpV2WQf0qJ9M=;
        b=LZ1BBiZ1r/K9P0+MwkJm+sV0xrReJpKUIpkDxibwn05RrjZJQ6Z76k9fiGixTKCr+o
         lqA+GO2wvxsA8Kkneea0s8JPYi3BNS3Bs3vqTzl0TFei7SylhOITBWZMcssN4QoyF/Se
         6sTN96sC5/zWRwt2wU0OdC+olqpfjEWVoqK7Qg0CwJ31hqWb4/cqCVi1x4xw7ZdUTAgS
         h+gkEjAX/9QnGFBuxX4L0VOiYEvifxd7GvjIhi9lh9aUsKtOynm0psvc8uH2xD0OYVFn
         OLsl0jXBMG2Pil1i9fkyQyLJfpoUsIz+kUO96DSfQmOUffE48NqS5MJHh8YO7NDvIGCS
         GG+g==
X-Forwarded-Encrypted: i=1; AJvYcCUecyB0P5drWgz8x2wAIkV5HgKWovaRmIYKDp02v0BdXk4f7AHvwB7tidtDcavxkKvN+34r67ha7Rc5kpQW8GjSx43hR0l4DLDYtXg=
X-Gm-Message-State: AOJu0YymGl8j99S1aPpNc6cr0drljdNeJy+/gWk41T1dnGGxDTpb9FCB
	VTSRjHHvJ6j+zujgrxX7G7P4ARjBNcNIfWU4tN4ivawaR1Xbpro2mDyqgANkIw==
X-Google-Smtp-Source: AGHT+IF92ID2vbcYQogU4s5HPT9NESWBniUBuCPNzNkI+Z829QUzxx9IW8IsdlQHycmXprs40Ud8kw==
X-Received: by 2002:a05:6870:fbab:b0:24c:4e32:becd with SMTP id 586e51a60fabf-24ca1253e8emr14931759fac.27.1716936244084;
        Tue, 28 May 2024 15:44:04 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-24ca27b2080sm2761853fac.53.2024.05.28.15.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:44:03 -0700 (PDT)
Date: Tue, 28 May 2024 17:44:01 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/2] input: Add event code for accessibility key
Message-ID: <ZlZeMVHsquYbQzGG@google.com>
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
---
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
+       [KEY_ACCESSIBILITY] = "Accessibility",
        [KEY_DICTATE] = "Dictate",
        [KEY_MICMUTE] = "MicrophoneMute",
        [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 851ee86eff32..1ecc5ad57b56 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -829,6 +829,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
                if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
                        switch (usage->hid & 0xf) {
                        case 0x9: map_key_clear(KEY_MICMUTE); break;
+                       case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
                        default: goto ignore;
                        }
                        break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 022a520e31fc..7ff6eeef1af0 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -617,6 +617,7 @@
 #define KEY_CAMERA_ACCESS_ENABLE       0x24b   /* Enables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
+#define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
 
 #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */

base-commit: 5128de84d8fc849400d00f7a6982711f129699ea
-- 
2.45.1.288.g0e0cd299f1-goog

