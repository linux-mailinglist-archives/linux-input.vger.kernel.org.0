Return-Path: <linux-input+bounces-1924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024DC8562A2
	for <lists+linux-input@lfdr.de>; Thu, 15 Feb 2024 13:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3514F1C23511
	for <lists+linux-input@lfdr.de>; Thu, 15 Feb 2024 12:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ADB12BF05;
	Thu, 15 Feb 2024 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmppVu+M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC2E12BF0C
	for <linux-input@vger.kernel.org>; Thu, 15 Feb 2024 12:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707998970; cv=none; b=SUznOMp411o7gy/JIPbRdpMydIfjG6zXXR31Wl+6XRydX0QiPeU3aIkoStPBGXYz5PmbdvKD6ZuGB+saMtNJbu+ZjtCoZu+nF8WCPFDBl38Ofuv4FS25ofJ4lfGIxet3CxJSLJEuCivCdFGYkV0b4ClMKp5XIbWysmi5sFmm2D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707998970; c=relaxed/simple;
	bh=oD1Kge1MAKO3hFilPPdHPuunG9YKQPJxbOfsT7xxHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkqKBub2TIPA7ZgoqKwOrW8vPaAD81C3n5FmQw59z6S7m0Ods5jQEutEXoj32lq9EusBLdYVff6lRtv+LFRhr8J/1QZJ511SrAU0Nh7kUxnJdvGwv1VHyB8IyTtEK1Ys2n3kANxRXUh5N1P/g63fKsHj6J4iXduvBfsxU4IClOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmppVu+M; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4122a8566e4so1137435e9.2
        for <linux-input@vger.kernel.org>; Thu, 15 Feb 2024 04:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707998963; x=1708603763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oD1Kge1MAKO3hFilPPdHPuunG9YKQPJxbOfsT7xxHI8=;
        b=tmppVu+MZHIi9teIivUDFJToVRQAYDpsBBQfHWTKbnMVVoRzM9w2jzrti1NPThzPMX
         tPCraPh0AeqTKkzk0Trn3BqLqwitv9aVN+FyXrn/ixI+XfEG7RSj4mvh6KnL2fLYQDpf
         J2zxuQ7GyHkBg+4/01srwJFcMQFhZnx44t5WeuLjFXMis8CIl7+33AyBqRGkp15zRTFD
         7Qpvdl2jl4hNk127EIcY5UQWYRQGHZvu+I2kPZPJAWou7HSpBOGG0n1+q5JWeEe2DJmt
         rcE07ndPN82MzKlq9QVd5uGABNPEQBoGJWNnnwaIrgDSv+e8Pt9AVOXszFGT6GPqF4VC
         J5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707998963; x=1708603763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD1Kge1MAKO3hFilPPdHPuunG9YKQPJxbOfsT7xxHI8=;
        b=L156c9OX7HkmHiAJSe+jEwbX9ZRrE6Jf9nd/a0evUg2d3ZLHSLawx9qvdl67Cl8Ikl
         23y5bXJUIe3TPxhWE+4juYy28dv8lGMyxocmNy31QitZTyGDpXeahq9FqQgoziGPgkk0
         0r0oiAJoBZqRGC3idbff0wf/oYTSWdveCpAP+v5mNoGqQyKchZq0Dx6CQeVu4ikCggDP
         lfTZoazKb59teDHH/U5BfLFqEoh7kafTRkWodAA+LINCAoHGGbj/lyFYTEC0byuAi8sP
         sOPe7Kdx279T8ukHlc2sscdeHJo++i2jZSEYh+9Zgnypb5LYKeTSpwyDScDcFrQHT8Th
         Az6g==
X-Forwarded-Encrypted: i=1; AJvYcCWCvJaDX/ABio4mnOHKQPQWHVn5KYdAgk6Lw5AdxKymXMgsE7bbtS2fVkKh2+kh/T1TuuXk68zVrAtrBO4+Kbxob3Jv7Hx6lNPMa3c=
X-Gm-Message-State: AOJu0YyLZ75yx9WPhZT3FvZ0SICufMAzrZEMPuRMezkPs4fCCE5NE74e
	HO7xDvJITK/6SOjW2LBVG23AnuglTdwJrWYgTCj3Vft2z+3cNtexDApg18heV7M=
X-Google-Smtp-Source: AGHT+IG2RWNKEhhSg5HPPp/aSl+Iy5VHARrddXWKFyyt57h+xu5XyxV2XCipKx1e6muRaSLbb7hNeA==
X-Received: by 2002:a05:600c:b87:b0:410:1da3:2ccf with SMTP id fl7-20020a05600c0b8700b004101da32ccfmr1211452wmb.21.1707998962990;
        Thu, 15 Feb 2024 04:09:22 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c46d100b00411e3cc0e0asm1772092wmo.44.2024.02.15.04.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:09:22 -0800 (PST)
Date: Thu, 15 Feb 2024 12:09:20 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 10/10] backlight: Add controls_device callback to struct
 backlight_ops
Message-ID: <20240215120920.GK9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-11-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-11-tzimmermann@suse.de>

On Mon, Feb 12, 2024 at 05:16:43PM +0100, Thomas Zimmermann wrote:
> Replace check_fb with controls_device in struct backlight_ops. The
> new callback interface takes a Linux device instead of a framebuffer.
> Resolves one of the dependencies of backlight.h on fb.h.
>
> The few drivers that had custom implementations of check_fb can easily
> use the framebuffer's Linux device instead. Update them accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

