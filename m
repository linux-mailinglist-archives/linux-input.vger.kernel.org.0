Return-Path: <linux-input+bounces-3914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7954F8D25A1
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 22:18:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35599282B71
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 20:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1653A1A8;
	Tue, 28 May 2024 20:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEE9O1mx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E09F38DE0
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927509; cv=none; b=JRzzxhQKiV7E+EvOcs+l8CjHP/DdL8tS1ghp5eHiPjbD7fT5wCShyLhjQa39OF3TUTdOnHG9UaJtjKukdl/ghAYqec4BJcfuz8CVwNvIH1rTB1eUZQ56gSYfPD+Bt8BnSuiRbfZ7v71F2P6ROf0sdzJcW/6q2RVPsjm6CVaMK4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927509; c=relaxed/simple;
	bh=WunYGauulfa81tKzxaEG0r2CS07jSQUDvdAz3YcPzHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5RUoDrQQluRIvEPoVAQQuv5KCM07ElzDWErJSJtekkYDZR9echLX5dc/sO0eAB0utJecnUBGliIvbTkDEE6jkCmV/5Jqysitt/x0j2osp8tzGuIDio9p6ynWSxpPhx3lLlt9aIkcWb9pYKz13nMdbqZlRpoHsy6eGnvzNYEDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEE9O1mx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f3469382f2so10256705ad.0
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716927507; x=1717532307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCwffUv+Txy9oQpxyxy6b6DR3cnzz+sISJwiP62qY78=;
        b=kEE9O1mxz7F6ytFZ/qQIoEM235IofqqikhI3/O7Qf8ijLCCjIHHZiVuxk3kwOTLoee
         9piJwMr1l3G/tuqW1/2bOLPXX1/vtH/snHm0jgVAII03sQF9TbMUxAAvM1hVtK/AveJa
         pDnXwaXrE1CZ0OMjEt6aPJWYsLH1BoUGMnP/i1QaeCoXp4LyCmEk4oTBtotdL+I6Gfnr
         CNWiFa7U8VNDDy1pglBh2NMD11R1octLpozXkAG4VmXI5lzzjn2uf4joxkBA9zZucTI9
         tRnq2veeQ568PhewfbiKbp9e1VpVLSiu0l3Q0fcO6xewWnIpWBUwzIRH7YKkNhH7Ka5T
         VziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716927507; x=1717532307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCwffUv+Txy9oQpxyxy6b6DR3cnzz+sISJwiP62qY78=;
        b=Qc6YL7IrXiSBSZ6xbpO7sBcJcXi1ejMz5fIm3yWmKB4krK7tXQRUoBy/LE/tRb/ddk
         SwXNH1c5NI6FoM6C+stRsz1xKtdLd/HGCLZcVBYSJNoo53s1A0sts4F7Ag8QaIeH2VaO
         ewSXrzj3+vRtjppauTkdH8T0H9MEc15GeTlLX018+2MoN+FZF/WZP5sRy9vUcYm/Ey9O
         0263GcWBx46itp3ecVxkxAt+TTxCUgvLQjJPVxUSvoFlY4kNoYK8UdhzhIfljspTgsW4
         rZNzeWnaRMeTwetsZF/5KiPSNMGZ66BoLYAu1mBIL6JOvf7JOY2cm9rRx7kHLsTd8aFa
         TDaA==
X-Forwarded-Encrypted: i=1; AJvYcCXVNpxX3BIoc+OSkblf/czYKUkzjKJjE9frpoODVq6tm6qiBMRyfSPCOg4aJ1LP/RQCR92n2iy7Iao7S8dsOIQ4QEUSJ9tQ+wHwuMw=
X-Gm-Message-State: AOJu0YwzzPIFYvKQjTahxPcmI0ef5OyVDURJsD4TSGh2yA8AmyZtBWh8
	NKfVQMSY0+J+cFOVgX5i3xrCwvTvucJOob9G+doektohvjkCGkl2
X-Google-Smtp-Source: AGHT+IGHCMNPonlPNehWzqZwMu1+KAjutryBKyik/8MQxrN8GxKzflBos2BLsdzPNEOzqg3IJ/aYcg==
X-Received: by 2002:a17:902:c405:b0:1f4:5278:5bed with SMTP id d9443c01a7336-1f45278630emr185373205ad.42.1716927506776;
        Tue, 28 May 2024 13:18:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1181:b338:a9d5:263e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a4e67sm85066215ad.223.2024.05.28.13.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:18:26 -0700 (PDT)
Date: Tue, 28 May 2024 13:18:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] input: Add support for "Do Not Disturb"
Message-ID: <ZlY8EGee1UOWUeua@google.com>
References: <Zk7bbiOwF4ODEE6H@google.com>
 <Zk7csk3RHEqCruWU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zk7csk3RHEqCruWU@google.com>

On Thu, May 23, 2024 at 01:05:38AM -0500, Aseda Aboagye wrote:
> HUTRR94 added support for a new usage titled "System Do Not Disturb"
> which toggles a system-wide Do Not Disturb setting. This commit simply
> adds a new event code for the usage.
> 
> Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> ---
>  drivers/hid/hid-debug.c                |  1 +
>  drivers/hid/hid-input.c                | 11 +++++++++++
>  include/uapi/linux/input-event-codes.h |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 7749c81b6227..78b2dd10cba2 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
>         [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
>         [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
>         [KEY_ACCESSIBILITY] = "Accessibility",
> +       [KEY_DONOTDISTURB] = "DoNotDisturb",
>         [KEY_DICTATE] = "Dictate",
>         [KEY_MICMUTE] = "MicrophoneMute",
>         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 6d2dbb75ba65..7fda66f7b437 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -826,6 +826,17 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                         break;
>                 }
>  
> +               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
> +                       switch (usage->hid & 0xf) {
> +                       case 0xb:
> +                               map_key_clear(KEY_DONOTDISTURB);
> +                               break;
> +                       default:
> +                               goto ignore;
> +                       }
> +                       break;
> +               }
> +
>                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
>                         switch (usage->hid & 0xf) {
>                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 980ef7fefd2b..b8abc239d660 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -619,6 +619,8 @@
>  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
>  /* Toggles the system bound accessibility UI/command (HUTRR116) */
>  #define KEY_ACCESSIBILITY              0x24e
> +/* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
> +#define KEY_DONOTDISTURB               0x24f

Could we have this as KEY_DO_NOT_DISTURB?

Also the same comments as on the previous patch.

Thanks.

-- 
Dmitry

