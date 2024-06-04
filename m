Return-Path: <linux-input+bounces-4094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30A8FBFBE
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 01:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A57282845
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 23:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6025914D443;
	Tue,  4 Jun 2024 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QX7AxJf7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7B145B05
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542997; cv=none; b=jjb9Lb9R4qxj3GrmshLSDqzyvTSfuDAvvV+NjF/nTuAVAUKl/Zi2TMFaJK+2XKxenqDpBceClnslMXAsEZU+3ohvIZ3VfZgG2jpaD80qSkb91i7ogWxTVhCkjWcdGUPMg84m1A6H1uWa/kl8opm1JFI45zdyn4saVhRFgKU/HxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542997; c=relaxed/simple;
	bh=Uq4EvBE43Ls9FjiY64JJfAUXK/Z8L+xBloyLZ6j0o3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8v5qWNSt1b1j1ZcXIZxA7pwDueJNsNs4bzROZJvENzsIu3XLjv0MhaDp513+iKlDBqm1XQhTXJTn/lBYsSHNMzpgJEe71sLZ1bceOxjxigvwboRVljY4cEW78Ar5fF/nlmOTgnILMUQ7+E6ItQVD/nS+/3gysF4/uW/zOQVUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QX7AxJf7; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-702442afa7dso4080869b3a.2
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 16:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717542995; x=1718147795; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=txSNnaaUTRW26/z2nDdNpXI7SxmEqIlx5R3jWxZeE3k=;
        b=QX7AxJf7Lwv6ITOn8fB/pRpleLgUJoFuHhNO3dq9EAc1zi+C40pqt3TY2gUxeVa9mD
         7cLpvKuuIYXy1nWlj9tygkHSdHiz3nwju2Np9ELIm4CITIqJrrFui7Uw8bpItc8XHD37
         fP9OJWcvp6If6nk7TfWct8FjWUwesb6xhKCRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717542995; x=1718147795;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=txSNnaaUTRW26/z2nDdNpXI7SxmEqIlx5R3jWxZeE3k=;
        b=Vk2GyDCogkRv/GTUnpNhzHOhdBFcKmCWMyDO9PxUd5na2pqmvrIE1BTwgSZsV58VJJ
         fLS5MKGhwYDVJ7ZfF9XSY9/+yi0qV56ZRSM/efVnMI37OM/jsUcbjft3otYMTFNyCnXX
         5TwhVzaH68EoDx9BJqeUv5SaGlbFeO7sfXabIelXESsLr/+AIYeMyqDI/YReh64VxwUI
         /vgSSXbmstkhgg4KDggnYX0t+65/dmsNgmi0dSgALhlcqxqMMLU4gi/tvXX+H13W/on8
         lE1RWGHL6ysgd7gWqNZAiLO1m69oHtX4ZaHrvHxGylZM4xvTnbWb0Nh7KJzaTIuNtldR
         7Ryg==
X-Forwarded-Encrypted: i=1; AJvYcCWOaWIF51nn8+OxiKEl7WtaOVGSG0oOSpWKPdMHGxKV9yu5cq7FICjSLx5iH5D+9sqdbw1GwWuQ1u/t+njMEyvhmcOUiKLEDZaVJSY=
X-Gm-Message-State: AOJu0YyzEQYJVClZ0WCBkmzIgtSBLjZyb0G9l4zlZ6lMlMnQ6oUl8HlD
	I2lerG9tf7XZQc/WgcvlZP7WOmTJ7YmJW1cwrsFplwxnT8JkZx6junHovBqhlPhV16x1DMUQQZU
	=
X-Google-Smtp-Source: AGHT+IFhPl7aj3AkQk9zUjDMLf84f4x6eeLytaleRwOat2vwUHfqeBZiEIJtBIpDhKTb/FkDcjvWMA==
X-Received: by 2002:a05:6a21:6d9a:b0:1af:dd77:86ab with SMTP id adf61e73a8af0-1b2b715e5b8mr1242179637.54.1717542994813;
        Tue, 04 Jun 2024 16:16:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:200:72e1:5805:701a:f116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbf2csm7529291b3a.51.2024.06.04.16.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 16:16:34 -0700 (PDT)
Date: Tue, 4 Jun 2024 23:16:32 +0000
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH v4 2/2] input: Add support for "Do Not Disturb"
Message-ID: <Zl-gUHE70s7wCAoB@google.com>
Reply-To: Zl-e97O9nvudco5z@google.com
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

HUTRR94 added support for a new usage titled "System Do Not Disturb"
which toggles a system-wide Do Not Disturb setting. This commit simply
adds a new event code for the usage.

Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Changes from v3:
 - Fixed patch sending workflow to not muck with whitespace.

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
+	[KEY_DO_NOT_DISTURB] = "DoNotDisturb",
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
 
+		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
+			switch (usage->hid & 0xf) {
+			case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
+			default: goto ignore;
+			}
+			break;
+		}
+
 		if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
 			switch (usage->hid & 0xf) {
 			case 0x9: map_key_clear(KEY_MICMUTE); break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 7ff6eeef1af0..07038fd9682d 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -618,6 +618,7 @@
 #define KEY_CAMERA_ACCESS_DISABLE	0x24c	/* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE	0x24d	/* Toggles the current state of the camera access control. (HUTRR72) */
 #define KEY_ACCESSIBILITY		0x24e	/* Toggles the system bound accessibility UI/command (HUTRR116) */
+#define KEY_DO_NOT_DISTURB		0x24f	/* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
-- 
2.45.1.288.g0e0cd299f1-goog


