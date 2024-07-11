Return-Path: <linux-input+bounces-4974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FE392ED07
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 18:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7612CB20995
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 16:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E90416D4C6;
	Thu, 11 Jul 2024 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3bXjZw8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348E84047;
	Thu, 11 Jul 2024 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720716538; cv=none; b=hWgZ/7MAaAsuwq8DNf13OVMY9FysKnoiTpfF33lg515k06JNaeCrlJIsa3e+Nb7mNG9ZQfQ5yVblgkx9Dg2xGUQLfI+FBkDSkhgwhiPVHDnlWIYODt5Dp8+mCZ+MlS0sI3u3FTNlOUgWmglFDs73jhvvomPpmEpzKbeNvioLvRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720716538; c=relaxed/simple;
	bh=73ZIG9KmkYiAhggQE4JH+gw0xEUz2iC+N+OJETReESc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2J9zka26tS0CfibUDE536HM4wy+T/dv3uTbtzUvyeCkZNpgDbiOz/xLdnGMD+4e3oZgKcH8//4Jx5kJW8WNEjBHHSMn48+SZFGu+1+WSLjz63c2IBMwRyCfgCHDQ5LNDU2OSdC8HSSlqRBa5KrIGnz/HTXxeNaWiKaMz54q3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3bXjZw8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so1394697a12.3;
        Thu, 11 Jul 2024 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720716535; x=1721321335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEZsA+JEWanK57qEMYDbE1caMCR1HD9S3b8hhmYN9Oo=;
        b=B3bXjZw8q5r+qwjrEdDCbhNjya+xxE0sF4rtO6VzxJ98mD3lvg4kHhvklpVepdxjoP
         h1JSx07zuK0jPE15+kS86KlaiCPyia3csEHkneDYDOcakbdnJWqTQZ6Gsyt55Ddm8zGm
         0ppc6ia3VdpI84TxCV2u7sCkf0qJFsG/zNY0sUykMgrGSh3uhPosAK9vJq/coqDxNu52
         q70MoN9VCrLSFeaCiTtz5i62cxrqo0hH7hUddhGAoYnKqu4gQLG0MvBWiDChxlEaQ/G+
         xLeGNgXAFafd4svJCfoPc+/9NsXoRlCcSKffjRZfNf1EeWX/ygdp+ZdEdwgavPVXRdm2
         BQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720716535; x=1721321335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEZsA+JEWanK57qEMYDbE1caMCR1HD9S3b8hhmYN9Oo=;
        b=MIPoL+0dmU+mJIZwa8+LyfqqCoFMtMzMnY4IVLI4CytMKhinaFEwcPjuF19oEXCA8r
         Opl2f99ZtDQ2TQ+fWhKIsWS138d7LaGm5s02rb4ZF0m3NTMkoZsud9Fv1EOm4386FCZk
         ljwTDwLS3+j2XcEjyRFdGwzbkJkRKhjQJJHWqHPZ2pHWYkQ35nLU+q4D1kr/5VGUlMi4
         ePy3zrzZ+6l6M4hrKxbFVKQ33afbYZ14v6SlEgDTrEPnDEYDG2t7yUxDqW1GD6z3moMh
         GD3kqD4UiFOUO++aOrsESMFKyigl+DjU0P1ERcCODhVGdDL/3JmLwOKhBlagjiZXuluq
         KSVw==
X-Forwarded-Encrypted: i=1; AJvYcCWWIsA8EkbXCk6xXiPkoyV5IM6KpCpSp0p4ZM0m0i3u9kHtGe8G90ckz+Itc5wZEsmH1Ja1f8gdQw9JN8pvDIrhUu98AvhYM7Pxni8=
X-Gm-Message-State: AOJu0YwWEwsV3m/efrbHL4LQNAOnvM+vxDxsFdMMZpOIM2ELwGGRKjHi
	XS2Da3zM7hpmgsXzQR51Ht+MpVscbEDj07BcUkwzTitCUZXQLwGO
X-Google-Smtp-Source: AGHT+IFMW06wAwwEUvlp048oJpfkaauaUhl40CXY1F07ftga56DZRibkuT4YWyNJJr0/tYkHk68Rxg==
X-Received: by 2002:a17:906:d29b:b0:a77:c330:ad9d with SMTP id a640c23a62f3a-a780b8826cdmr683873666b.61.1720716534517;
        Thu, 11 Jul 2024 09:48:54 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7ff07esm270724666b.111.2024.07.11.09.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 09:48:54 -0700 (PDT)
Message-ID: <3ac07aff-4ac4-4649-86ec-6175dd516162@gmail.com>
Date: Thu, 11 Jul 2024 18:48:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: twl4030-pwrbutton - fix kernel-doc warning
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <Zo3QE00GqCrA3M9b@google.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <Zo3QE00GqCrA3M9b@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/24 02:04, Dmitry Torokhov wrote:
> Do not use kernel-doc style for comment describing contents of the
> source file, as it trips the script:
> 
>   scripts/kernel-doc -none   drivers/input/misc/twl4030-pwrbutton.c
> drivers/input/misc/twl4030-pwrbutton.c:2: info: Scanning doc for function twl4030
> drivers/input/misc/twl4030-pwrbutton.c:33: warning: expecting prototype for twl4030(). Prototype was for PWR_PWRON_IRQ() instead
> 1 warnings
> 
> Also remove file name from the same comment - it it not the best idea
> to have it as they tend to get stale when sources get moved or renamed.
> 
> Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/twl4030-pwrbutton.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index e3ee0638ffba..f85cc289c053 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -1,5 +1,5 @@
> -/**
> - * twl4030-pwrbutton.c - TWL4030 Power Button Input Driver
> +/*
> + * TWL4030 Power Button Input Driver
>   *
>   * Copyright (C) 2008-2009 Nokia Corporation
>   *

Tested, finally:

  CC      drivers/input/misc/tps65219-pwrbutton.o
  CC      drivers/input/misc/twl4030-pwrbutton.o
  CC      drivers/hwmon/pmbus/max15301.o

Compiled w/o warnings.

Thanks!

Tested-by: Mirsad Todorovac <mtodorovac69@gmail.com>

Best regards,
Mirsad Todorovac

