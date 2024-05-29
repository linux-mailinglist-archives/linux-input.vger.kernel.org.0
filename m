Return-Path: <linux-input+bounces-3954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 845798D3E52
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 20:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3692887D4
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 18:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED34815CD74;
	Wed, 29 May 2024 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dajPJVbS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF6A15D5A0
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717007285; cv=none; b=EKpXjIT32lYqXRzqsFXI62dXuyCy7zJcUp/XxJrZuxKHP8hrlvuHXqZKxNsMH3U7zUHZ2clZhol5icxLIds1QWGS8JLvbqhbCldidsRdC+j59c2LM5p/ufDOVXws973MAvafAq/OrpHPSt+tpKdK36QO4W93bpdBHQX2ugsUlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717007285; c=relaxed/simple;
	bh=uWX+Ko1i2jOhOsl/QbSP7eJl3uvztLZSkVu/Kcxhzkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hguy/MrweHxUvgoojJfNCN9p30lJm/lgsv16888ejElDtRmGyWzXW+/aeoJ9uEdGwV1BdHWKWH7hb2b1mmQKk6g+Z37QZlRohRwfDfvvNmVxqBBr9DrSdrQT+/lSxhpJcxqp2xxaiZOlhes/bf7gMOB1ivzY07tlXvkH80kSiYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dajPJVbS; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-24c9f6338a4so25142fac.1
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717007283; x=1717612083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fvt0ERXbqMGE3HmDRGSJ2txHk8mZEX0V9/S9QPIIKbk=;
        b=dajPJVbS8RFxusOKt+F+Fb/RDIjBzWP+F3QU/47J39xC7LWyC77QYKPAdGRsi5h25a
         nSo8o38YjMWArfW8z1mRpZNPaBIEEPJ5CeY4iiKTciPE1ChEgAjjr55YmGpmTDFDKA/S
         Z+l3KanJHbxR+OhkwHEkoQAMb2MBXHdaovvUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717007283; x=1717612083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvt0ERXbqMGE3HmDRGSJ2txHk8mZEX0V9/S9QPIIKbk=;
        b=Kvp5NmPJ5u39lUkjldcUI/BoUMM7kVoFbufKfxqXb+B89AXP0X0jd1Q3xmPPPgEkO3
         0qtHoaaz3Pe3x2pJIu2TTSFYL6fytkcHZesuMit3327jOEzczko/cda5YX5Zw+LUGuLw
         TFjh7lKqk8jtGuLlsp86JTj9R3rI6FsyGM4Z2XaGllxnig5RZIF3i6oB9Q/Ja1vLIM37
         ZPmfo+xfDnwbnRQdDYem58zvhVRl0HZpPt+Jb3XUvQynZPpJFI4ndN+7FQzWQB8GZtlc
         J4+DP00uJevtqwBe1hF3cykKklE7p7/0iGXsSXNkckEmzLoWYabWjTpMsXEflOL1900W
         Y+2g==
X-Gm-Message-State: AOJu0YzVjBt8QHC1qIhNsJ/sZh95goTLJFbQx5WshTJNl3OGZgLDwm0f
	56tatMnTxC2GYgo0QAwL6cXz5gEWbggMWFygsx7DJmKiW/ACTvxi9WAbSGbZhg==
X-Google-Smtp-Source: AGHT+IGqOdNd1a2q67HNuoE87pnrWh4IosbiiK5xv8K98QX0LrLeaknXBXmaHugVxX4X3WJyvZX18w==
X-Received: by 2002:a05:6871:3390:b0:24c:b769:3cfe with SMTP id 586e51a60fabf-25060bda4f2mr58711fac.28.1717007283235;
        Wed, 29 May 2024 11:28:03 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-24fd869f532sm2486045fac.57.2024.05.29.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:28:02 -0700 (PDT)
Date: Wed, 29 May 2024 13:28:00 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [PATCH v3 2/2] input: Add support for "Do Not Disturb"
Message-ID: <ZldzsCybMzSWnZaQ@google.com>
References: <ZldxNQGXy4zWVPu1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZldxNQGXy4zWVPu1@google.com>

HUTRR94 added support for a new usage titled "System Do Not Disturb"
which toggles a system-wide Do Not Disturb setting. This commit simply
adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
---
Changes from v2:
 - Added underscores to make `KEY_DO_NOT_DISTURB`.

Changes from v1:
 - Modified formatting to match existing code, ignoring checkpatch.pl.

 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 8 ++++++++
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7749c81b6227..4ccfbd860bbe 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
        [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
        [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
        [KEY_ACCESSIBILITY] = "Accessibility",
+       [KEY_DO_NOT_DISTURB] = "DoNotDisturb",
        [KEY_DICTATE] = "Dictate",
        [KEY_MICMUTE] = "MicrophoneMute",
        [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 1ecc5ad57b56..31feb5e0714f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -826,6 +826,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
                        break;
                }
 
+               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
+                       switch (usage->hid & 0xf) {
+                       case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
+                       default: goto ignore;
+                       }
+                       break;
+               }
+
                if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
                        switch (usage->hid & 0xf) {
                        case 0x9: map_key_clear(KEY_MICMUTE); break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 7ff6eeef1af0..07038fd9682d 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -618,6 +618,7 @@
 #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
 #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
+#define KEY_DO_NOT_DISTURB             0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
 
 #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */
-- 
2.45.1.288.g0e0cd299f1-goog


