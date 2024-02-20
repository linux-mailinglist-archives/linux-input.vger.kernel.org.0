Return-Path: <linux-input+bounces-1973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D604285B78C
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 10:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B4B1C211F0
	for <lists+linux-input@lfdr.de>; Tue, 20 Feb 2024 09:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFE75F47D;
	Tue, 20 Feb 2024 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TNdDNsys"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891B5F480
	for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421537; cv=none; b=Otwyg8tvltBO2HYIj5KA6T6eMgFbYY8ck1t6Pa9jg/7aXmdKKlscMC2U6nNU1C8+Q6HIaXP5Gqky9j566+KHIe2w+2LQpiPnihjSdHqywRJjdj2ohyTfgd9nwmyjPdoKr/Lr/opnQ4KP4/cJ+jXAOcpm3p3gEy4vBKzMhWQQGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421537; c=relaxed/simple;
	bh=goefrht0JH8QKHu3jtM+Rmfsru257+PSg0UBzrNOVVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HrCORTZo+VaO+tZ3M7qUun3ZoZ4R9DijLnw5Axc+8s7iWfPLrTDveqiGzBhB1xwxng1UkWo1+tg9gVWbm3WSjuHQ+iDFFCETzhBME8+3rs6+4P0kEBadOXLO1JVc9z2rjG2HCjz1JhsGsQVQ/2jBBbkWj9x2HTMtoeMsenWTH4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TNdDNsys; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708421534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UgQ2TOsHUa28odpvYARLjplwl26hv5UH7grcAVsUCtU=;
	b=TNdDNsysBOLIit9T45R7S+Dd5kR+LfYredgFxVhFoQGcKjgvJeYi2gmuxNxR8UAsrUbc9Z
	0QSoMTzq2PZaJ7LvERNgXLTEN7dQxZubeP1Iu+1emEJmwSTgsrhtQrxP3Y2lv7QTC+UuIN
	Bo+fqmIhK8U1KpZZyFRi2ZceblLX0Ts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-XFYObgWsMXO5NdyCiJccbg-1; Tue, 20 Feb 2024 04:32:12 -0500
X-MC-Unique: XFYObgWsMXO5NdyCiJccbg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-33d66d64ca0so245582f8f.0
        for <linux-input@vger.kernel.org>; Tue, 20 Feb 2024 01:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421531; x=1709026331;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgQ2TOsHUa28odpvYARLjplwl26hv5UH7grcAVsUCtU=;
        b=TuPODQnvfroi6cedKpE8bn/jpFI3xj3Khdli5qnqatzGwSaBkCMlt7DMVuM7mtH9Kg
         FnAVFWdLchkC8Qr3aDefNSQPVSdz2si91gW2SaWNC+ec70jqOVKb/GGapNo52CLIjnQt
         Qw/yEa1wQ54a/OeivFOrelh8Zoia0mHVN62uKhZwcC4ciJVZ3dgQD+x+sJs+CAbppZ47
         e2LL8wV/TfXaWulkC0XSOo4O0mZQswfqlyW/sqM4JYv6BKlij6LBAzFB091FW8LB3E54
         fIr6d4BXFczuLFBCNLPsqvaG+O5zRRvVKqOagApkw19/BYn2OfZQclWAWq+F9AHRaxBC
         dCfw==
X-Forwarded-Encrypted: i=1; AJvYcCU6WHVAuxFZes8M5+yVp+3Bqmt+P5NYbeDFeQwACIOP7o5yGlXcIJyg7MmS9HTE1E65Qu1MiapOjNZYfmFZEvRKpbLirQ2Vi2XJwUE=
X-Gm-Message-State: AOJu0YxDc5KCoQz/6NV/+A6mNTaz2YRZCnh01/DuwWzvoKx3wFkuJUWE
	SdzpOx3HQQ6Ja8FLPQoJLByHbmuNVzJUtXDOorygi58myIArvMIRhd+OuRUdg7SRE5b4HvGAJMt
	5M1xnwx/0IpFmf+IgEZdws/uVasJHVzqUgvjioTpVLv8QXRx73nF2mStzNE4D
X-Received: by 2002:adf:d1ef:0:b0:33d:2198:f2fc with SMTP id g15-20020adfd1ef000000b0033d2198f2fcmr11356574wrd.2.1708421531496;
        Tue, 20 Feb 2024 01:32:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdwptKNJDBk60dmyPKyprwG07LhUuoJDUqZ2pjMagOouw3ZsYtr+PHgpSM/sz1pGEotVfdqg==
X-Received: by 2002:adf:d1ef:0:b0:33d:2198:f2fc with SMTP id g15-20020adfd1ef000000b0033d2198f2fcmr11356555wrd.2.1708421531169;
        Tue, 20 Feb 2024 01:32:11 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r10-20020adfda4a000000b0033d3b8820f8sm7738442wrl.109.2024.02.20.01.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:32:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 08/10] fbdev/ssd1307fb: Init backlight before
 registering framebuffer
In-Reply-To: <20240212162645.5661-9-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-9-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:32:10 +0100
Message-ID: <87r0h7iiqt.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> For drivers that support backlight, LCD and fbdev devices, fbdev has
> to be initialized last. See documentation for struct fbinfo.bl_dev.
>
> The backlight name's index number comes from register_framebuffer(),
> which now happens after initializing the backlight device. So like
> in all other backlight drivers, we now give the backlight device a
> generic name without the fbdev index.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


