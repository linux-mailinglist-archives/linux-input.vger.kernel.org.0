Return-Path: <linux-input+bounces-1974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4185B793
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5109E284246
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2165FDB3;
	Tue, 20 Feb 2024 09:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IP1A277j"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE425F875
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421555; cv=none; b=WdME45Er2wZDjk2YHXhFVT5DefJk7GtKsIpWQp9FiWOtnIFxu9Sh1CC6g5XJRcNZcDOo9i1Mr5f/aKjSKjhJglDf4iM2R/CEsT2vwNBgLkV8japDLIXt6gy+jq/znx/E3UmSYFfhoZarBnhaxE2bcMsYmP9FgVB+fgPSLKceopI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421555; c=relaxed/simple;
	bh=WrnpVBUoYjGoDOOrj0S02mflbU9UnxAKN3MjYxaIOA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=htt+A9HfV2fSk80K4vImRgFDQPxumXQQACyZU/p/y32jWx0Im+kErDC51Z1ntJwu/HfeEXTI/qbPX/KdldMGEemrwtcXi4jkDuAGw1RKslEjFvabYDLJj8tniv5LuHMQOBpfne3/yHD2mnY1WYg4KDL0p1PBdC+EKwRSHuWYsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IP1A277j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
	b=IP1A277jZBxXo4BKK+8NajA700NzNhBGYcBlA12okI1IZGn+ZJLTLJDxng3Aqn220D/FNz
	BSsiRp6fVMzhcHekr74nEWJMg49XynfMourT6eK60UGVimSL8jFvwscyVJW3tnXSIMeOox
	fPHZ5vZsbgfhsxm5pc9BB8NQjy99big=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-mga43PkcMaOIHJ3f59Z5JA-1; Tue, 20 Feb 2024 04:32:31 -0500
X-MC-Unique: mga43PkcMaOIHJ3f59Z5JA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-512a00a2629so2764289e87.1
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421550; x=1709026350;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
        b=oW6NQs+96Yfomz1QsgBQZE5hkfvtFz5o8pwYz2IHRJNMYrW9JYrsrk1bQ31rWVNKQq
         HBxhqp8ocOOp7El6293nobYbLN+Ov+1mHbKGv6wwc94aphlKbr79H0nt52Ct7sQA8//r
         h5pjleJ1/SjpdG15xoLJDsKoLbUPYLK+2f9LE0Uz+ghbkj4AVwW6/NG+eqh6ghoBxc7P
         dKU+FDVIMQkABA6jolrPvBq/2+i3d/tLOwZg8SpL8CGyWJT7Tq334nrdC9ShM92JkxR8
         9duT09kEeUOmiU+0b8Xy8/Nl4t3jiCjtDQcu9NCz4CHRvup90qF9hjsmGyrfao5i4BAU
         5LxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtGmdrsW5tPhUppu/UpTN2j4MvH1lWIGTgDGJ34vSD9tkyNGyRt9Gt6DWrPFI8O+wBNU6dc/toRQpmKiJ+SuFF8z8IxT1ffYZQdhw=
X-Gm-Message-State: AOJu0Yye9Dx+vdXjxr3YkdRXeeuHnUhnZKXK+jFqyDnuPsUUky3I95+n
	6mX6nnRWpwd7dWVpOe7sbkBF6OJOz8G8siw0X3kuXthNvgW4rjwomTXt6Tko/MJSCnOIl9RYTwy
	LeTBHKo8nzaOkPg02xlKI6en3n6I0oxIMBEkEKg4kJ0n2ypCdPj8ImYCCoXl3
X-Received: by 2002:a05:6512:239c:b0:512:ae18:7492 with SMTP id c28-20020a056512239c00b00512ae187492mr5795446lfv.11.1708421550175;
        Tue, 20 Feb 2024 01:32:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFK1ISvscWSiC+8duilezYgsz5C5byx70dEu3G6Io79efRQOyltpTKPLus1FsPEKi437suJg==
X-Received: by 2002:a05:6512:239c:b0:512:ae18:7492 with SMTP id c28-20020a056512239c00b00512ae187492mr5795423lfv.11.1708421549884;
        Tue, 20 Feb 2024 01:32:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm11246103wms.26.2024.02.20.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:32:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 09/10] fbdev/ssd1307fb: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-10-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-10-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:32:29 +0100
Message-ID: <87o7cbiiqa.fsf@minerva.mail-host-address-is-not-set>
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


