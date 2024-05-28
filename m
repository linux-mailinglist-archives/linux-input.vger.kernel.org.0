Return-Path: <linux-input+bounces-3918-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D588D2848
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 00:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20EA61C25050
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 22:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E408013F43E;
	Tue, 28 May 2024 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApruW6M4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2613E41C
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716936716; cv=none; b=EHY9wI5WgU3eqEMD/Fdtv9GPBs1m2f/hyJa2l1+2XJScegkNCDqsS3yg/UAv+3SpYLU9PaQ/BThutaisDb/Jn/SdoacR3RHskOdyz8kfM7HZSWJRjKiO4Vac6igjKzKccj8k/hAuiMvy3ryaCbnNm63pAjjfarX7STOI8Ub8DqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716936716; c=relaxed/simple;
	bh=3rK6kNjebtk6fee/iLjpHONf6H64rEEeLcTEXYAzmVE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=olYGHSKMiqu+DLREooy7LWrdPnBLjrpMS93JUa8NK3oCOKlY2aenyZH+IEq0k9GUtfwz3SBhzaNvykgUt9O6V3tXJYoKgqusnd/zPlx7c67Aft1ZUl9YT/AnWcZtXAPp+qqKWHveITcOYMIqBBh6aj9SSqzck4GjpyRRd2rL/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApruW6M4; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f8e012e51dso823721a34.1
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 15:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716936714; x=1717541514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KM2aITKwb699JxOfN80qsedbqsg8Qp19YmXMKS6P0S4=;
        b=ApruW6M4bPU2zLOaiMi2Bg4yR+YS/wnSRAP1u3AM4iayPVoo9VKknENGK+LT/FGZb2
         1N7JRbrrH8MYUY9sFXACKT4vzCsanuBBJnvTIJsfDD3B9GvpWs6iZ1+H0XNdSMIned7r
         CgERLbBPXEEv7SeMZpq2MHOqVAV8GswI0MRro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716936714; x=1717541514;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KM2aITKwb699JxOfN80qsedbqsg8Qp19YmXMKS6P0S4=;
        b=Zw+6PFe3fL0vR2PajYuEcqgpdLPLLsWxdJM05yFMb5QOA/6kA8ibY8TSCxSZZFbRa8
         S6e0gLZ3d1nmyIGYIWceWWJF9Q8x5nYxiE0qAWmFY2BsPuVYWN6uw64nd7+nR9+05hde
         gVELdjpq2ZBvVhR9i/panqnEk2CoRZIkrSpi9lLXFAau0zpkCpibOh8T65tgtsgwxHcU
         E0DJZ4AsZxs1liTLxJWulk5O8oRwdy8J3T2HingYbs/vcSPy7BcLn13Zx5uLgdEpqD4G
         8M/+jdk446qSy7lkYi55Gx43Hn4ywCzsCDJTiA5+/encX24ImzhMTY/l8voFo5zwFK2l
         VzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyDkamypyCeriJ/Tmj8UTu+T1ciJrfb8DwfxXJNHXkl+yNKSqRJb777b5QI7sfkI6jeKIIDQO7VH+sfVitScA6TBpQOezASS0kN2E=
X-Gm-Message-State: AOJu0Yy7xc3VJPCHqg0WxuSLOCkSEWKPGRKzZj55JnWS82sn+/owJWdb
	Clg6lNxtBB2ZBNJFl0hOxucARliYNliufBRizd9qb8v2yokwgxiEXm/wv+F+eQ==
X-Google-Smtp-Source: AGHT+IFgMDT4bLr/xHWIRgd+rTEbDLQ/hgfSzrvILwxx94TPRnsD1+aWEUxWE3725Tu88oRSc+fCig==
X-Received: by 2002:a05:6830:3494:b0:6f0:e1d0:7d64 with SMTP id 46e09a7af769-6f8d0a86cd9mr16934128a34.20.1716936714109;
        Tue, 28 May 2024 15:51:54 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f8d0e7fef7sm2074523a34.77.2024.05.28.15.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 15:51:53 -0700 (PDT)
Date: Tue, 28 May 2024 17:51:51 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] input: Add support for "Do Not Disturb"
Message-ID: <ZlZgByQ3TlycC-A_@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlZeMVHsquYbQzGG@google.com>

HUTRR94 added support for a new usage titled "System Do Not Disturb"
which toggles a system-wide Do Not Disturb setting. This commit simply
adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
---
Changes from v1:
 - Modified formatting to match existing code, ignoring checkpatch.pl.

 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 8 ++++++++
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7749c81b6227..78b2dd10cba2 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
        [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
        [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
        [KEY_ACCESSIBILITY] = "Accessibility",
+       [KEY_DONOTDISTURB] = "DoNotDisturb",
        [KEY_DICTATE] = "Dictate",
        [KEY_MICMUTE] = "MicrophoneMute",
        [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 1ecc5ad57b56..f023f51b9c08 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -826,6 +826,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
                        break;
                }
 
+               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
+                       switch (usage->hid & 0xf) {
+                       case 0xb: map_key_clear(KEY_DONOTDISTURB); break;
+                       default: goto ignore;
+                       }
+                       break;
+               }
+
                if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
                        switch (usage->hid & 0xf) {
                        case 0x9: map_key_clear(KEY_MICMUTE); break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 7ff6eeef1af0..c971d542e525 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -618,6 +618,7 @@
 #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
 #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
+#define KEY_DONOTDISTURB               0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
 
 #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */
-- 
2.45.1.288.g0e0cd299f1-goog

