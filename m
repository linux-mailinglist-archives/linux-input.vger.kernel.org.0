Return-Path: <linux-input+bounces-3913-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C08D259E
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 22:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B031E285CB6
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 20:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032F631A89;
	Tue, 28 May 2024 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUkPPK2w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABAA770E0
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927425; cv=none; b=CbtXZWFHEGX9g0P8g8h/Lf0pb0Rj2NVrq1bujSmbboT493nwT/C6bHyFMjRCyLGCikViia99/R6gFHWzMx05nQH2SKbxIL6FVcyT7sjGBo06FhqY3uGIdMo2MKU033oHtB4Z+PVxiyk9bCm9vavIuZ+PcxQay7mIF4flbV7texs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927425; c=relaxed/simple;
	bh=rLeWtW045sLpx/mPqUmhQVthJudvZScgVXU3ooNVRYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbUwuWs8tfKWJLY+fqTaxTcgSgMUCYAtMv854tjdj7/uVaZYRlGwtxN6tgPSz2J5hIsEFXFV6MI/2+G1xEusk2PHCOa9xsJ+ierkTFsliTvVJ+j6WtJEjJ4rh2fZAx0gID2t1UdeuvVy2uu4Xc2gwwNtkrV/dR1I8rOVC83oT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUkPPK2w; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f480624d10so10489625ad.1
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 13:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716927424; x=1717532224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyRsbbGzDBW5R94wWpnVigosTE14stXTYGGztfGTmsE=;
        b=aUkPPK2wqckmT/jMaFPU5LCYZuTNSsJikrYBSih3tXYPpNLcAw2+FBndAvp8S7oGYh
         3x9cHslw8CCrfO2FmO6R2CU5GAud8igpkmauUGKErhnoHj1cCI9AXKHYs9PYestxHHh8
         j3LN6x2B5dPh6O0zInoaAKX3A1UzStn9aOKNRQH/Kmbv4CbPlHQ8Alk0mt0ScBaF074M
         LESgFuSx6jWiuInGHhlH6p193u161AUx7zS2d+i9wovnVbdMbCBs6UeZP3tfNTtSFeaW
         LHkYYCY8w8Njq3alPq0YbRNqDc/INsZHicXAGalnlVm9HY8bQPiSWK/0p7fMkJ2M2p1F
         cs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716927424; x=1717532224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyRsbbGzDBW5R94wWpnVigosTE14stXTYGGztfGTmsE=;
        b=ZosdW+T4VSmtGR0d82r6rHYwvUm9DMrj6k9rAMHs1vMQJeWxu/KvA7o8L2WJgwvFlE
         m6qNCbK6Igrvn+v+VtCL5PH5HS/rlXhBoQlv9Z4ra65CkS0NElu0X+mOxG/KMxI2Nbfz
         JoXjSb4KPKNAEW42q4+FnL43JyeG1uL90ZWvrGdY1ztxrxzpF9K2hYdH6/2k9MH7tBSo
         0HTvVjclBKQP4GoJDLXE014y1w8K/K2+WbiCxCTm06jrOGBJyOBlMLTaE1M8lusLM6E0
         KcDtCO1Z+V4Ee2jdLW0OAEW/zAfgVOBsKu/40Ujdk6t0nn/xYrQd8ty7fITmKH3xgKBv
         fYBw==
X-Forwarded-Encrypted: i=1; AJvYcCWeFdHGT/1yexyKg+FQFCd1gxzAkYEyYhYFqLv4ZGzV7a5qoq2xHUNEorTndHUoBcLPoTsPmGZvLuW/lmhD+ayEpre7sfk4CCivnAs=
X-Gm-Message-State: AOJu0YzunKAYvh1N+5YzHizs5yUCRe7LqST1SeOCRrhtxxB2g7UH814a
	t6GG/9UaT6qq9gKzMGFfaQG+XQo/ix7WT3uG7jpm15xxHhxkV8FS
X-Google-Smtp-Source: AGHT+IFCZE9nw5xYAXbCKonYV3Vo8WbjzQJ4M0EHbASkKpfJZL89te8P74zQ3Tp/a1DK/KTV0zo7dw==
X-Received: by 2002:a17:902:fa10:b0:1eb:7081:3e23 with SMTP id d9443c01a7336-1f4498e1e62mr106617085ad.66.1716927423684;
        Tue, 28 May 2024 13:17:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1181:b338:a9d5:263e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c758112sm84139915ad.59.2024.05.28.13.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:17:03 -0700 (PDT)
Date: Tue, 28 May 2024 13:17:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] input: Add event code for accessibility key
Message-ID: <ZlY7vdoDLTjzOU3n@google.com>
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

On Thu, May 23, 2024 at 01:00:14AM -0500, Aseda Aboagye wrote:
> HUTRR116 added support for a new usage titled "System Accessibility
> Binding" which toggles a system-wide bound accessibility UI or command.
> This commit simply adds a new event code for the usage.
> 
> Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> ---
>  drivers/hid/hid-debug.c                | 1 +
>  drivers/hid/hid-input.c                | 3 +++
>  include/uapi/linux/input-event-codes.h | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index e7ef1ea107c9..7749c81b6227 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -974,6 +974,7 @@ static const char *keys[KEY_MAX + 1] = {
>         [KEY_CAMERA_ACCESS_ENABLE] = "CameraAccessEnable",
>         [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
>         [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
> +       [KEY_ACCESSIBILITY] = "Accessibility",
>         [KEY_DICTATE] = "Dictate",
>         [KEY_MICMUTE] = "MicrophoneMute",
>         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 851ee86eff32..6d2dbb75ba65 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -829,6 +829,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
>                         switch (usage->hid & 0xf) {
>                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> +                       case 0xa:
> +                               map_key_clear(KEY_ACCESSIBILITY);
> +                               break;

Please keep the style to match with the rest of the file.

>                         default: goto ignore;
>                         }
>                         break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 022a520e31fc..980ef7fefd2b 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -617,6 +617,8 @@
>  #define KEY_CAMERA_ACCESS_ENABLE       0x24b   /* Enables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
> +/* Toggles the system bound accessibility UI/command (HUTRR116) */
> +#define KEY_ACCESSIBILITY              0x24e

Please have the comment after the value to match with the rest of the
file (even though it results in a long line).

>  
>  #define KEY_BRIGHTNESS_MIN             0x250   /* Set Brightness to Minimum */
>  #define KEY_BRIGHTNESS_MAX             0x251   /* Set Brightness to Maximum */
> 
> base-commit: 5128de84d8fc849400d00f7a6982711f129699ea
> -- 
> 2.45.1.288.g0e0cd299f1-goog

Thanks.

-- 
Dmitry

