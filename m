Return-Path: <linux-input+bounces-3789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 172EE8CCC0A
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 08:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2831F22791
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 06:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7E122EE5;
	Thu, 23 May 2024 06:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PHU77/6u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EA13B299
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 06:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716444343; cv=none; b=YDQac5hRfA4BiM+CKvd8sz0QJVsofXgqaVJqjYE37t41c4XKVQYUtkUN1X9XW9V+mzEuMJNEKEEMXw3UOwHybWdl3CRAE5bA0mY5bdj66Y/dA+XxUMLSTAo9XweNe4inMa4GaHLuf91qeQmrtKuA7aRoxdMpIkbod8AKQgDBSgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716444343; c=relaxed/simple;
	bh=tx736NeVJFzFyykavHq1opL0K9PktBB4rU9u9AQL81o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXZRWaR5T5HPsXuE6dbX9DXSJA08LyUpFWNrzIxymK440nxdu7Jmo43JB8HEAVuuTPrmJi7rlzQxPuQhqedjOT16YjDRMxBukIYnWceKB2xUu3T5NMCThvOKjhW6m13tV8f86q2WU8noaq0D21Ty0hjDPhwV1d+Ee2bF7snyLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PHU77/6u; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f144141608so2036918a34.0
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716444341; x=1717049141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TUs6o7cOfoOCBm4KBKLlwZG41hWOePQfH4QYvfUo/l8=;
        b=PHU77/6u855im1R1hLT2buyXnu5B7em7kTbm9v0elItaL8r2llJ+8S+09SVfCgmOBZ
         4kU+4/CwkUncC1HMGNY0PzoeMZi44or9J25QYe8WT4y5bkSQDmal6PmTU6rS2AtT6HpD
         isG4Y68JLuosldcatSFyPFQDIHaCOUxYAC/Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444341; x=1717049141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUs6o7cOfoOCBm4KBKLlwZG41hWOePQfH4QYvfUo/l8=;
        b=IRnqCUXDdjf3MwTWF2NXKsPLmDfrgeD89q4KTgfUA9nvClWYRqUhj2SqxQAnNw1Rux
         xyjZ9hWJ99GP90Dgy1PHtdAjlKz0RMUsawQKxEbI5Y10hJlS6FjWvYKzxpM/Jp3bhnYz
         5R/J8jmUvFBH0j2gOEN/0JF+6BiIny3LDo2lnm/DJ7aQwUmXDTI2Nal7Js0mhxomtndy
         Nhgv3wveGBzX35ryD0a/pAZGSpriWse/2vxCdqvNTN6kB5nf2cNv+Tp0mIEzCLjiu7iS
         U3b30y1AdU9HpInqMD2ZbCeHVHD82gQuZM+I6yqD2SEBQTjIDs6lhbOukzjvbizmQaUg
         45Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUZcVpvEh3ergc7Ki1u5Ic+JfziWUo31iPrHoeW9Bf62X5fTn79Me2DCveScwPpA4ha3Ro2YoknyZyZbTGLDmwsD4yI7Z5s+CnoeS4=
X-Gm-Message-State: AOJu0YwzD+pvjd5AlJIC1eIogPR+qCWYAvKfz8+W8iuXMsoqdhn7KTym
	qenzhSk8QZd9GFy0aYCWy+bBEgHbTIMEov74FgMVAUwy0HpVilDhcRMnAsNK1g==
X-Google-Smtp-Source: AGHT+IEjqBbWS18GHj/bgFot9rJTeQMYAsjTofE1pweaMfuSE20Ph+jGmOGl9Oxo8Zqi34y2wpSOxQ==
X-Received: by 2002:a05:6830:25d2:b0:6f1:1955:fc97 with SMTP id 46e09a7af769-6f665a3d713mr5028659a34.5.1716444341128;
        Wed, 22 May 2024 23:05:41 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0f9d37e62sm4413769a34.39.2024.05.22.23.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 23:05:40 -0700 (PDT)
Date: Thu, 23 May 2024 01:05:38 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 2/2] input: Add support for "Do Not Disturb"
Message-ID: <Zk7csk3RHEqCruWU@google.com>
References: <Zk7bbiOwF4ODEE6H@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk7bbiOwF4ODEE6H@google.com>

HUTRR94 added support for a new usage titled "System Do Not Disturb"
which toggles a system-wide Do Not Disturb setting. This commit simply
adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
---
 drivers/hid/hid-debug.c                |  1 +
 drivers/hid/hid-input.c                | 11 +++++++++++
 include/uapi/linux/input-event-codes.h |  2 ++
 3 files changed, 14 insertions(+)

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
index 6d2dbb75ba65..7fda66f7b437 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -826,6 +826,17 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
                        break;
                }
 
+               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
+                       switch (usage->hid & 0xf) {
+                       case 0xb:
+                               map_key_clear(KEY_DONOTDISTURB);
+                               break;
+                       default:
+                               goto ignore;
+                       }
+                       break;
+               }
+
                if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
                        switch (usage->hid & 0xf) {
                        case 0x9: map_key_clear(KEY_MICMUTE); break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 980ef7fefd2b..b8abc239d660 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -619,6 +619,8 @@
 #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
 /* Toggles the system bound accessibility UI/command (HUTRR116) */
 #define KEY_ACCESSIBILITY              0x24e
+/* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
+#define KEY_DONOTDISTURB               0x24f
 
 #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */
-- 
2.45.1.288.g0e0cd299f1-goog

