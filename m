Return-Path: <linux-input+bounces-1975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A285B7AC
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B86121F25A1B
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8C612EE;
	Tue, 20 Feb 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ARZ7NZLW"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AB612CB
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421760; cv=none; b=SmKo/wlahHHM/PlZltMCSPyRRfwUGwkmNgQG3I0A1s1GVZx6VdGucADKQpFpaPU6Saq9ln7XwcgOKaB2bBcmDEnOPwilVO2K8OssnUiFbNjcbrD6RM0+zIK5VM69EIBxaVlVInyFyqyND4xKMv3WcQ0UcXjeaAficZGee+TVT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421760; c=relaxed/simple;
	bh=VnAn8uZAJT5vkIYnj03sUb9gmxZzfSWHD4320ZoQ8KQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JVyaPADfOkM2VXPvKGaHSMbDR6HNCUScX+QmM6q+1bcKmF21fFcpGbtaag9LwZDNiXL6tJ438pLuuO6aFdjBXM1j7aBEaNx0xylrg3Mi2jD0cWmg9vWt6KRaHK5WFWrsNzwghqa3KKPgTU8gjVWLEb2FXZV7mGlr8L3/zEjV0iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ARZ7NZLW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Hgn9WqXu1AhhX6E5+lsbEBu8N0fTK8tYmqmiPGcClA=;
	b=ARZ7NZLWLjH7jyHqKAAa47bNF3PLxCHa2BNGOTlpt6NSBSF0v3ys6Xo0plG0XOmHUew3ng
	0VY/8SbJNo155dWlnXJhoqeTJYyJhbrsYxJs2P7NYwZRKqs+C4KEC7n+ms8ZLkCcHT7AmD
	ETdhCNObVVC+8ofRhnQWnsurcTQ7LdM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-WXEoGB4OMvWb3whxrpFllw-1; Tue, 20 Feb 2024 04:35:56 -0500
X-MC-Unique: WXEoGB4OMvWb3whxrpFllw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-411e1466370so20965315e9.0
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421755; x=1709026555;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Hgn9WqXu1AhhX6E5+lsbEBu8N0fTK8tYmqmiPGcClA=;
        b=YFN0ouFcCoTKbefvLz/D5T3Zyuh6plSCx5frDCAX9ftH1ORraJWPmMXbmzzZEIQXLO
         L7RnLTClevT37S/SJvNyCY3EbYs+dOP6WavIAmaafgLhSWSNSYqz/0BOjChIVa8hYo6P
         Xv5w/iAlR0Fv+xzlWUPQRt90mZwtrxRdvRZUCZwccw1S98eZ8J35Xj2Eptyu8mh7ZF/1
         ftoO4EK2pPfdjWBH4tyO3FV62InlEaYq439zjLwd9UXb2iO9zEwyz29OEXQnNOk06Hye
         x1Aj14Ei2EZgEI1n73orx33qtWK8L3LdTcMuXmD/uOxirXyIfgNpVBkPHxps0TuuCLeE
         yruw==
X-Forwarded-Encrypted: i=1; AJvYcCVb0lexMfYji9BfENqEOPADKKwwCfE7dSVShZjMcGqtUFYymqRKkPXXmsJZ+pt3ZGqqIhRzOUHrWL4vH+KmyQo6e4KWRPFAJ7R5qu8=
X-Gm-Message-State: AOJu0Yx81Z6E2YxyUm6nO0LP8ZDZvBjFhsvGgxgnpEXto5IGsGiZhAjf
	r7xhgO9Wc4sa5+dlMQexq04j5q3Xa+yMb9I8fSKhQWFmlZHgZlDbeaJ5X8DtvM9ea1pyZlCXK6a
	EruwBsMK2XdNYzr1SX2+Wwj9+gfk8NymVD5RAillTBQo/0tdJAo7XP80V64il
X-Received: by 2002:a05:600c:310f:b0:412:68a1:1020 with SMTP id g15-20020a05600c310f00b0041268a11020mr3013469wmo.17.1708421755414;
        Tue, 20 Feb 2024 01:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+JttJJiDku7kTZxlbPK/PYMKWsh61tt639P+Ab793uMc5bDoYOmRxrg62ZITenPVeeiMypg==
X-Received: by 2002:a05:600c:310f:b0:412:68a1:1020 with SMTP id g15-20020a05600c310f00b0041268a11020mr3013458wmo.17.1708421755137;
        Tue, 20 Feb 2024 01:35:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c229500b0041228b2e179sm13843333wmf.39.2024.02.20.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:35:54 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 10/10] backlight: Add controls_device callback to struct
 backlight_ops
In-Reply-To: <20240212162645.5661-11-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-11-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:35:54 +0100
Message-ID: <87le7fiikl.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Replace check_fb with controls_device in struct backlight_ops. The
> new callback interface takes a Linux device instead of a framebuffer.
> Resolves one of the dependencies of backlight.h on fb.h.
>
> The few drivers that had custom implementations of check_fb can easily
> use the framebuffer's Linux device instead. Update them accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Personally, I don't like the "control_device" callback name that much. I
think that check_device or probe_device would be a better one and easier
to understand what it does.

But not strong opinion on that,

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


