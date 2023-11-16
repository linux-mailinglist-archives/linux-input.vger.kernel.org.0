Return-Path: <linux-input+bounces-78-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83F77EDE71
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 11:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54A48B20A88
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 10:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607F329428;
	Thu, 16 Nov 2023 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cBoDovwe"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D0F109
	for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 02:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700130479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlHlGuIFKBdR7Fli1C8w7UyO4Sn2DZFiv8/q8c7YdBo=;
	b=cBoDovwebWYO2cSFQoHO11ryonmM3kbgj7yWOiCChm2U4e78YDqc+d9yxsAEGtSn1Cs1uU
	rp5Pb9SW0VJlmqVo7PpM0DccbrcsJWzno1SEreMbTJ6pzwjEWgXzM5IJKgBNZ6Ql2pGVZj
	8Psln9tSXHiNjil02zr5WVcI4WYCl4I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-ZQZZPkuWMECm5q7YGw3OZw-1; Thu, 16 Nov 2023 05:27:57 -0500
X-MC-Unique: ZQZZPkuWMECm5q7YGw3OZw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-32db6a28e24so311148f8f.0
        for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 02:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700130476; x=1700735276;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlHlGuIFKBdR7Fli1C8w7UyO4Sn2DZFiv8/q8c7YdBo=;
        b=wiN2OKES7IMLvjxZa+gT0Jv7VXq5ElZC6iymBTcatnrHWA+/qkul7RL0+jJbC3P6jL
         kGAwdR+kIlA+3TP0OfpL88CqUV4cQKs8QbMQT0Z0rvmStsmWrj8XPu81JpWajXEJCkG0
         lpxXPHIm9V/HWLkhlzCFF8MTBekPGOG52C4a+ixVnbBSuat3B3y8BZNMvs5FKrk1Qh8b
         ptIrN2sMp4PcbQdBZloKyktP+xqtU+CeMnEVKs1K65gwo8JgpGa/CYkGwZNXlOyZZaXg
         /LqmkhZNe7IIKxw9TmAVtIxuV/GQdm2BgltnIfx4N7hKyxE10BTCic2+tyrntUbZ0ywN
         BVyA==
X-Gm-Message-State: AOJu0YyoHTfvuNstmJ0kPT3WmDP4cTAKfsao8EUPoHb+OTVLSp1uctHG
	Dofs0wbt4LdiEvm4OOn9II0hv5wDSVqto4oqEnDxnjRnlI1DEgqQC/lm7uy3HxY/SeechHYf7hA
	ZERQBA8MBwqwDbAN074J9+YnIL8OWQ4U=
X-Received: by 2002:a05:6000:2c1:b0:32f:7f65:8f3e with SMTP id o1-20020a05600002c100b0032f7f658f3emr11490926wry.7.1700130476320;
        Thu, 16 Nov 2023 02:27:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVowa78+7DuIt1O2CluTlGpgTtzZ/Y0J9eR+J6IQbq1Imn9LSMs1Gu9C++CQRfYKUKXpQNgg==
X-Received: by 2002:a05:6000:2c1:b0:32f:7f65:8f3e with SMTP id o1-20020a05600002c100b0032f7f658f3emr11490908wry.7.1700130475998;
        Thu, 16 Nov 2023 02:27:55 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m3-20020adffe43000000b0032d8354fb43sm13119242wrs.76.2023.11.16.02.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 02:27:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Bruno =?utf-8?Q?Pr=C3=A9mont?=
 <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 11/32] hid/picolcd_fb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-12-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-12-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:27:55 +0100
Message-ID: <87o7fu3sd0.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The picolcd_fb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test
> for the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Bruno Pr=C3=A9mont" <bonbons@linux-vserver.org>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> ---
>  drivers/hid/hid-picolcd_fb.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


