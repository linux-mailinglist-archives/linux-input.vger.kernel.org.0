Return-Path: <linux-input+bounces-3919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA28D28BE
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6410EB25120
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 23:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813DC13C3CC;
	Tue, 28 May 2024 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ovig8Y3W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDCE3AC0F
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716939069; cv=none; b=FXlDVzuanrvBiEcTc/U5umU6El1R50GVfRxDhuKueHBgqQdDIJPZ2Q0I86ksoY6HBjIKpS8Yb7FhTNyA/a8WFfNhx30zU5HVGpTE9i7+M0XMjLnMrd0Lkw9C26ou0YpMz9Mw/Ca1+YppK7sBXVqKlMdojOXYidSgeG9aCk1sIoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716939069; c=relaxed/simple;
	bh=VNwvtQTC1R0VtzC3KWtqAFm5cNmCLs3MpWk53UtwznM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVwKrg4mooidty5VT07qdgflDMrqqaEmDytGNpqFpwRABuYa+en9HTgnPbWAo1v7BR7n7EfQcQky62uYd8nkbqPT++sKSYgwUESOaEUIbDks+xxYP4MZmfgOIduD2T/vqeOA/oy5d5rKt7mw6EIf/xDs/DUDapbZSPG6CC6Alrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ovig8Y3W; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df7713445d3so1634048276.0
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716939067; x=1717543867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOQuiY27XcI9EzjDKCPEAJDtyrM9CTOkKxkmWpogNkw=;
        b=Ovig8Y3We/B8SIVuOxSW0IEDJ9+OFjsUptjVZdgkRWTdMqgbzT4b7TAtf8wFBI5CFM
         3TdK2Kj9P84KF4yARFuVPu5VkUSHnP4TZ95k5D1pGwm1ZWPhCw48kDeX6NMgJqSWLRYR
         KH5ZpMrOPsKHylO7f4wpW7dtyhXdHzcON2ncZ9bcFtdcct0swbJ3Z7z97FCt+XCHWgfW
         K1TGQh386BUyQ3DFtA4SZIZ22YIgVBmqeiLRBF3YiKDlXMAKlvQq+wWqEXVUStY+V4bA
         M1kMtss95OraAn1uJ9tEMXkzqY81dMCjIA29DuQYr5Ja2TaTjK6YBH0qbm8ohOCqFmXU
         lI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716939067; x=1717543867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOQuiY27XcI9EzjDKCPEAJDtyrM9CTOkKxkmWpogNkw=;
        b=K/shIfcpL++vw1K28rFXEdQs52T5Lnp0Onll/VvLvhWag0buVKSjvvYBkVUHbLcToB
         spNTLJCRlCWCjrJrRGTqBresFQWYP3nx8yj5MXw5XxeB+Dghboh/YHVm5qv9PvZDACNR
         4SBbtMFRJKb145LVWzX5sIZwW1hEjjDDQXfoXhEXNEgvU3Y76UmmjGletYLOIxe3JdD8
         8FmfREmmkLMWXX4v8H34eccaYhkoGDjvLQDFIQ+cnGuagEeBAzgaClI4B8n2EDHaA9tE
         xg1YttCu8IMS4KPAc9bmWvgYWnaOt81eH6oGGgW+ePvsCPRgnvDlPWgPQ4BXZ+bA57oX
         5fkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfxCTN61I513aFb7o3YAYB+mGt3NbI2vbtqXwQb42xjdtS+/Pgo6qfgxvQ00Lgma9mp27u1X1dHEBLgvrbf+7vOYLrnLUFMdqB2kU=
X-Gm-Message-State: AOJu0YzaxRfOr5Z2ym/16FZyfcprB0UM+WObkmA7D8vMJecJNPCwuvzN
	JzcB8uOSoxtbIrAVTBwarK4yQrWrGRnwQnffOAmo0G826KLOvPvJ
X-Google-Smtp-Source: AGHT+IHhDSTdqxvUAVrKwPXC10Wkms1KEzUSgy4a6jCIC6z/J5QGRYq6LKRMs8EwfFb05EiRVfXwSA==
X-Received: by 2002:a25:a343:0:b0:de5:4a6d:96f9 with SMTP id 3f1490d57ef6-df772222d70mr12190435276.51.1716939066817;
        Tue, 28 May 2024 16:31:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1181:b338:a9d5:263e])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-dfa482bd39fsm37332276.37.2024.05.28.16.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 16:31:06 -0700 (PDT)
Date: Tue, 28 May 2024 16:31:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] input: Add event code for accessibility key
Message-ID: <ZlZpN9ohRY-Qx7E4@google.com>
References: <ZlZeMVHsquYbQzGG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlZeMVHsquYbQzGG@google.com>

On Tue, May 28, 2024 at 05:44:01PM -0500, Aseda Aboagye wrote:
> HUTRR116 added support for a new usage titled "System Accessibility
> Binding" which toggles a system-wide bound accessibility UI or command.
> This commit simply adds a new event code for the usage.
> 
> Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> ---
> Changes from v1:
>  - Modified formatting to match existing code, ignoring checkpatch.pl.
> 
>  drivers/hid/hid-debug.c                | 1 +
>  drivers/hid/hid-input.c                | 1 +
>  include/uapi/linux/input-event-codes.h | 1 +
>  3 files changed, 3 insertions(+)
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
> index 851ee86eff32..1ecc5ad57b56 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -829,6 +829,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
>                         switch (usage->hid & 0xf) {
>                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> +                       case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
>                         default: goto ignore;
>                         }
>                         break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 022a520e31fc..7ff6eeef1af0 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -617,6 +617,7 @@
>  #define KEY_CAMERA_ACCESS_ENABLE       0x24b   /* Enables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
> +#define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge through HID tree.

Thanks.

-- 
Dmitry

