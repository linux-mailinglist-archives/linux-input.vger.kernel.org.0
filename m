Return-Path: <linux-input+bounces-1972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC7D85B762
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42B251C24624
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C405FDDD;
	Tue, 20 Feb 2024 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAzhLpua"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED56B5FDCC
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421277; cv=none; b=sp9iGzVfawazwh1R0clg5l64XoDqpyHDHhNApxO3Xr4JjBzPKGW2XfjMnbMDl5ok4I1JOGfXcnoS1tc85TYOHWZPi+v9hNZnk1BSvNYbV8wRzbYu7DxdcilOl9gHia51bFrgPb2TBcwHqnu5XgG2aoY5s5ubSOtmS6HEnueHAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421277; c=relaxed/simple;
	bh=WrnpVBUoYjGoDOOrj0S02mflbU9UnxAKN3MjYxaIOA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sUjeRohwIbxknGGi+CiPkbIK/VETfI1qLsaeALFafUltRUu8I+IB3F7daqREsknernZQ0cvC9Nj5tHeZESzX5QALAlNDv7hHBD4oDMHl8GFe0JJO/NCZrPtzZ+yZuIUFQtRAcGjhin7bS83XZDtJXsugUwBT8kHRyAolZbS/5yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAzhLpua; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
	b=RAzhLpuauzcuDQkLMTLPf+YKz5rbrqF98d+prec9yQdOxyswkbjxEW2pdjAsTsZR4+bbub
	Dq+UyqBAyIFZYUHcuXFwlgMMhlhkqB3WkZNJy0vc8B4pQwRhGysw29XWRY1G+l5ifz/DHE
	VlQhhbxnLM9A7aMrUgKQyCvEE+26xHg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-TbzwLu48PbWb2SsBsQXRGw-1; Tue, 20 Feb 2024 04:27:50 -0500
X-MC-Unique: TbzwLu48PbWb2SsBsQXRGw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d2304ba21aso21946351fa.2
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421269; x=1709026069;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
        b=cWX6FUu5FPcoUDAGsgBE5H7dnaVw2deIw0MUxnX/w97GN2INMPvjrcNHHM/ADWg8kW
         cSduYrCyeHFtP00Gn21yl5ooFm8TzCk+wX579s2M00I2r7lEy1L1VUJKW0a1C1TOpVzj
         mGu4D/huNhYjBSPtNT+QJZiQAi448EdwYkIRsraaxEwmwUdS5onNGTQeOWjKtN/eGNdn
         q3WgxbctMozIer+O8s7vsTs7SjXUhYUSD1YtzMR6V4X/1y+Ltmggsk1oT3kUL/M91GVj
         7y8RgSApTRCB02SHDfee7zJy4CLLkKWztCTFm1Kk8o2elceAMtD9yrpc1O9an3t9XQKz
         zc+A==
X-Forwarded-Encrypted: i=1; AJvYcCVJmFzuVpTYBJ4LxJU3Cmabo7b4ldiS8rnW+R2rUNXXGZVyYbsCG2oiE4VTIVu8d12zrM8xJ0cjpprDBVLzUjyYU5nyDx+E1K6GRtI=
X-Gm-Message-State: AOJu0YwASu60mrNERRPlkEIECpwSzz7I2Ip4Es0qPOnbQGEfPPsWRyQq
	hbCV1YuR3rRgtXG4tGQ+uiyqu8LFpuihTCwLKe6kSMRNXAp25oRTIoj8NLrsxSwoHS/ldjUrxyY
	GnuTWTtIXfAEHWAPoW+lP7bnaYQSngBv31hgLIrx9GncBoF9y14yHVnr/Qf1l
X-Received: by 2002:a05:6512:203a:b0:512:b362:e790 with SMTP id s26-20020a056512203a00b00512b362e790mr3016705lfs.34.1708421269259;
        Tue, 20 Feb 2024 01:27:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFa5OX+BOUymJZ7SlIgyg3cW7L8Ltr9UOF5eSo06b5LnwaixDwHdhkSc1ftkjut2C8Il/ElUg==
X-Received: by 2002:a05:6512:203a:b0:512:b362:e790 with SMTP id s26-20020a056512203a00b00512b362e790mr3016699lfs.34.1708421269080;
        Tue, 20 Feb 2024 01:27:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id ci3-20020a5d5d83000000b0033cf2063052sm12834029wrb.111.2024.02.20.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:27:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 07/10] fbdev/sh_mobile_lcdc_fb: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-8-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-8-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:27:48 +0100
Message-ID: <87ttm3iiy3.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


