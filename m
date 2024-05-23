Return-Path: <linux-input+bounces-3788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 048188CCBF0
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 08:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADD421F21C18
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 06:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADC322EE5;
	Thu, 23 May 2024 06:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lETRAvlM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208F224DC
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716444020; cv=none; b=FoCE+JJcCBoADeO0yn3y5zjQns6Mc0dHSHpTXe5x/cIDE6bVNZ57/ecFr6Lmxx8rGl8+XCSxz9c2wDPLcXkdsPqfDYXC+kNcW1Vt9WfNoCfISwqK6OvtBnCfzvbMfSJBN4cPmcFxiIaTvLEXi+6Jwg44dIQgdr8dLoqR2s1D9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716444020; c=relaxed/simple;
	bh=IVzYbnXqgC2hgWnERPIj3gNoowcDMAMQ5Bx2Q7UeE+w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hW+vSfn9tzNVJD0rNNNwINpGhHuuCL6oMpFxkgKxAF1n271A56RiI7LFHhJoaSpPDXW65xGVqTOwVxeTHK7olv3TH/Qlx6LLyuUt/2tYs3TEnawnpnz2WhC4KIusLKW1HjYfT580MtK7w6ue2HPdd9o1B2RdQrjLvU/cY1DGhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lETRAvlM; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6f0f5633a45so2804352a34.3
        for <linux-input@vger.kernel.org>; Wed, 22 May 2024 23:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716444017; x=1717048817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzPY4PVXGrJ2peAqskmKS8iC8kM/MnWKeceZhGbyUL4=;
        b=lETRAvlME2y3kOQZr3WCWAdPv23K57CILhx6goVSzb3Ewc/2774AjJvLnb0Aogd36s
         DclAQpQlEfwnawD7KGbfDWl+EYD/EXiFId+sR4ldp/NR1Xi5iBVfIiz01/iHMCiVEvvB
         8O8zFpsRB9MidQK+Kk2yPFUIgFKaOEE+BaWiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444017; x=1717048817;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzPY4PVXGrJ2peAqskmKS8iC8kM/MnWKeceZhGbyUL4=;
        b=LfxeuW69Hxxs9BW30mT3mgQ47zUcSUL4RECABJHzd2KWCwbLKz01zQXj4Z6hMyP4RD
         mNjsYCHsPNNGmlgQiyhUUL9iDg054u5ImZLMKC8F+BHmgzk8r5n13SIaD13mlECyufvI
         gVH1A6faG3P0/qYY3g6Lm6+3guqBylVgIR/dSApqzw8XZ8oDtzGAAR7839kuYV6RI/x8
         XzFlcLStuUHqzmb5JJTfhGn7qBLzndc7K+YtT6iSDmBvH+ycO7F3RNDXztYq4oI8MFK5
         OZgIIW7kKYWGjq6FftoAG1FZldEubxxWNi93/rZ1Mx8shucDtJoG4wPW1pJUrueHl6Bt
         2xnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5cV3j8xpfjgBLTnu9JrwfvSxZO4t1pNgMS8eSFxli4k+VP+/b+g1QeRcFdYth8f2DxKjRHSPPvy7K9uPAFchu6tFC3x546zZtOkk=
X-Gm-Message-State: AOJu0YyqyblfoAtrSfn1njaXdCSB1/dUofOJfFqOK31VrBtOowKneXXU
	/L+HUMcQY3sG1hwn46f3U7rZsHyqjWGYjGo/aOLFJWKd6ohaR2+sA4XD3HCgmQ==
X-Google-Smtp-Source: AGHT+IF5lwbGvmTnyA3p45yRkE2EZAeHy4QehRkjoHJEUP+NUxegZL0/I3bHhf0bPwAZ8/geTEWEQg==
X-Received: by 2002:a05:6830:438f:b0:6f0:6679:c902 with SMTP id 46e09a7af769-6f665c2a6cdmr5154229a34.10.1716444017546;
        Wed, 22 May 2024 23:00:17 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0e010f3adsm5316794a34.0.2024.05.22.23.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 23:00:16 -0700 (PDT)
Date: Thu, 23 May 2024 01:00:14 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 1/2] input: Add event code for accessibility key
Message-ID: <Zk7bbiOwF4ODEE6H@google.com>
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
 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 3 +++
 include/uapi/linux/input-event-codes.h | 2 ++
 3 files changed, 6 insertions(+)

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
index 851ee86eff32..6d2dbb75ba65 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -829,6 +829,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
                if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
                        switch (usage->hid & 0xf) {
                        case 0x9: map_key_clear(KEY_MICMUTE); break;
+                       case 0xa:
+                               map_key_clear(KEY_ACCESSIBILITY);
+                               break;
                        default: goto ignore;
                        }
                        break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 022a520e31fc..980ef7fefd2b 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -617,6 +617,8 @@
 #define KEY_CAMERA_ACCESS_ENABLE       0x24b   /* Enables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
 #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
+/* Toggles the system bound accessibility UI/command (HUTRR116) */
+#define KEY_ACCESSIBILITY              0x24e
 
 #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */

base-commit: 5128de84d8fc849400d00f7a6982711f129699ea
-- 
2.45.1.288.g0e0cd299f1-goog

