Return-Path: <linux-input+bounces-3920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E43698D28BF
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139AD1C23F87
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 23:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1D83AC0F;
	Tue, 28 May 2024 23:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUm9D5op"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6F42940D
	for <linux-input@vger.kernel.org>; Tue, 28 May 2024 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716939159; cv=none; b=Fnr72FAFkdOconstEgOPjJgL34VF1Uf9qHxslX576OA+G2Y/hno9f6+4ugjkdzHj5MwjhKfqQK6j4rYkteE5lwOS84LXx5dqjf5PETj8Oylsw5F80yhFuakvuItij9gFd94KEEsLTyQc8mt3QpmrkzIjId2P+5xIIvPR4RbyLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716939159; c=relaxed/simple;
	bh=ZuXakEmcWu67DRh77v5wzRMdyF+Ich6CIO7btxyvnfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aD36wjcOAVWw4NZtgX0DP8sIYdUk/7fP9bqA6MLcNkmVbgMq01EIJIhOdLaoBVUJemrY5SmtxhZR6tACollpt88bvewNgehzo3HdawTET/DWrMH706QLwsgtpKxhsQEr1zsZU4e4FaotCWeG3l4Vnb/+oG0k0Sgxb8vi6GTBsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUm9D5op; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-627e3368394so15614737b3.2
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716939157; x=1717543957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XA4I7/no4c5SVbo0gJooK2DPrYzqf+87ovLxfbPDNjw=;
        b=fUm9D5opCSlEl0RgB9/MLJupIPRqaOEZCkpDVeIk4So2ulAbdN58ls1qh+crokmXCs
         TFDHfS42uE6o/TzOLrioy+XMlt+GsE6mTjGaeHeRMe+YB9gUxQhY1WE2fTMyzFBP483v
         X4YR82xA6KVkCN0hKu8afPjtaGdM5Q9UUsx9x8aL9Im+qcWxQNBwzaaFGOlW3i01h/9D
         QIHuAGFZjaEHyA6jFLgBTEuqNsSpMQ3FjcF7rbXQu+U5pLdVxuNGzVfuLCbCKlhUI8XO
         C6kM7p8uz4gugI6nTYjcDBQs+SXCdx0d8hE3G32l+FWmv27u2iK5ctUPtIG+RO/BL9Sp
         h14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716939157; x=1717543957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA4I7/no4c5SVbo0gJooK2DPrYzqf+87ovLxfbPDNjw=;
        b=QKFEMVWb3r2ndZcuG3QZRsI+Xu8OqEvgOFxwx8/O/1ZLLzh93D4TTn9fSFh4pBeUW+
         kap18raSr1fQdAf6pH1zS+eJyX9YZ8OdW2+Fco1EOWe0ZpOsj52zo9f6ftuzEMR/jUi5
         CDcZrUrXeM0k6Xr0dyUzOdDW3dN99HgDNC3pbdeJRB1J/uFTwLdDKzJkipllwC1IMa/U
         hXaDKgg5Dcx1Kka3mYhTL9dbNb/+C8Q6TpzOlciV5JBQ6Y2BJLKYj1h2d8bF9QQnrUcZ
         VClb0do1lkthNyf7KHb9unr/eK9RLsDlgf9cRp2omdVQSCr44Obrh9TVeDjAFXhoV75Q
         H13w==
X-Forwarded-Encrypted: i=1; AJvYcCVzXiFbOSpSfLffCavmbZIu6+wOKMFfuOLqNy7ZXOocIYQi/xvSbtKjch1kF2H7KaGcG/9jlhIVDUsRpFK6hKCqmAP27JSlnh3CdNE=
X-Gm-Message-State: AOJu0YxF+eH9wKmvbz925ooxoGy3AsY4u+lbm0jXdcMFdUau93iXtH+w
	DdzK2zh8EIzB+TjpOb34wK4KMXnQggp1PJccc18tPHsotq8Ti2fy
X-Google-Smtp-Source: AGHT+IGRXrzdLMHZQKYwCJ0UvYSGegJzyZstv3vQVpPs8pXWynpMkotoD3j9BdpWtyfl5dosvhVOMQ==
X-Received: by 2002:a0d:e812:0:b0:620:33dc:8341 with SMTP id 00721157ae682-62a08da80famr127568877b3.25.1716939156914;
        Tue, 28 May 2024 16:32:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1181:b338:a9d5:263e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a4f0205sm22206867b3.84.2024.05.28.16.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 16:32:36 -0700 (PDT)
Date: Tue, 28 May 2024 16:32:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/2] input: Add support for "Do Not Disturb"
Message-ID: <ZlZpkrUuBonHDPaj@google.com>
References: <ZlZeMVHsquYbQzGG@google.com>
 <ZlZgByQ3TlycC-A_@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlZgByQ3TlycC-A_@google.com>

On Tue, May 28, 2024 at 05:51:51PM -0500, Aseda Aboagye wrote:
> HUTRR94 added support for a new usage titled "System Do Not Disturb"
> which toggles a system-wide Do Not Disturb setting. This commit simply
> adds a new event code for the usage.
> 
> Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> ---
> Changes from v1:
>  - Modified formatting to match existing code, ignoring checkpatch.pl.
> 
>  drivers/hid/hid-debug.c                | 1 +
>  drivers/hid/hid-input.c                | 8 ++++++++
>  include/uapi/linux/input-event-codes.h | 1 +
>  3 files changed, 10 insertions(+)
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
> index 1ecc5ad57b56..f023f51b9c08 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -826,6 +826,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                         break;
>                 }
>  
> +               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
> +                       switch (usage->hid & 0xf) {
> +                       case 0xb: map_key_clear(KEY_DONOTDISTURB); break;
> +                       default: goto ignore;
> +                       }
> +                       break;
> +               }
> +
>                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
>                         switch (usage->hid & 0xf) {
>                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 7ff6eeef1af0..c971d542e525 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -618,6 +618,7 @@
>  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
>  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
>  #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> +#define KEY_DONOTDISTURB               0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/

Please spare a few underscores: KEY_DO_NOT_DISTURB.

Thanks.

-- 
Dmitry

