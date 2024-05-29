Return-Path: <linux-input+bounces-3953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8998D3E3E
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 20:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D142855E6
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 18:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5094D15B99D;
	Wed, 29 May 2024 18:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TSf/XFRJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D7815CD4D
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006758; cv=none; b=XfWLFJf+xwBWqo6amyZ/c19vnqlwhxI5jmm4PSkXobiDZA6PlU+58pJydA6As02skOJ2AFsEIzCJ+937LF2b7enifWZNhXibrkeQxu924CV+eOMVFCgh99YISM4v/JSEhj6S7L8jzEPrAokz7qr4Etvm6TuQG3PEHvZvpHoouJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006758; c=relaxed/simple;
	bh=Szd+qwgEVBc/H7WPiyM9OWkEiu1LzzCqxafhPlPcX5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQsiFKpRjSMhjFpNkKk/Xw679ftuopjjX7t8+5H4zDaHd4j2uc7QXZkQqlvCGNvoQV7EYyo19R1/CtoolBlBM7pzexu/ScblVD83h9ryCWs6dYobnRB5XfCSqRdrOxtdxf/nD2i0R8rwTEDcJuWLOr2vuWamWsJL8s0IA8jiKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TSf/XFRJ; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2503cb65a90so100476fac.1
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717006756; x=1717611556; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rb3M8864h8W5eTlqo96+omU63jkjg7ujMwjIFXZ++CU=;
        b=TSf/XFRJugNoiWAa71SAE8yF3fJMy2qLRmTYN+qNfySEdyh+TlCFvwTmydNtA79j1E
         /ODNI3Oy08EKNVUFLpV5m/cFcmrjK1Sm57wzFA3tYPIlu8x/WPAnVKIIeVO+JZwhwl/O
         TioDCQFNLeNUQ/kd2I5nAcdGgyulrwWDVCFtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717006756; x=1717611556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb3M8864h8W5eTlqo96+omU63jkjg7ujMwjIFXZ++CU=;
        b=DGqYSNvS3dXrRhBA/jWQR/uQdHSKgEdlAtTixLHSHNJ3/7jpDeozGlG6c1rEFdDdtj
         lGTWcdL5uVexo3fEkPX8bz96YthsboVz6T+9xCq6NXUMtmtz65BM2Mcyg5EdxBuCBmuF
         Vtxl7Mbj3hiViTpSSmOUq+H9KWKsLiEkHq50O3R/Q/+umDTINDNje9+peRHOMQr/ybNb
         9GFb2B7y5utgiQjeIgR2KnbG6o3xchHDDK3KqaP/PvGMAKqwPBTj1vsDy3iTw7X8YA9g
         TSZuQuNynwfajKA5HW0KeKvYqWJQ8MMqtU67RKc+DIxen6yo/u1XnHzxFX4B2zRw2Iok
         GHZA==
X-Gm-Message-State: AOJu0YxjHAH0oFaePB3a4lDJ3weoJP9XsLG5LG8xLIVgg/kZxW3i6vyU
	caiDyv5iZgWbcCIcS2Fc1pLXf+jzUz8HODCzk1aUudwxZWYeMBM+VHLsIEmAaw==
X-Google-Smtp-Source: AGHT+IGHSyoKnNJiKUg7dVG8MXRruY6aIZgAmfB6CvjTXjxqX59uRvaVKdxVwukYP5wjnrckodQATA==
X-Received: by 2002:a05:6870:f110:b0:22e:7e11:9e73 with SMTP id 586e51a60fabf-2503e2f3b95mr1196701fac.27.1717006755520;
        Wed, 29 May 2024 11:19:15 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25029b1e798sm883163fac.27.2024.05.29.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:19:15 -0700 (PDT)
Date: Wed, 29 May 2024 13:19:13 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [PATCH v3 1/2] input: Add event code for accessibility key
Message-ID: <ZldxNQGXy4zWVPu1@google.com>
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

