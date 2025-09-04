Return-Path: <linux-input+bounces-14483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461AB43E06
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2AC716CCB1
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B182222AC;
	Thu,  4 Sep 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvICIT9I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB31E163
	for <linux-input@vger.kernel.org>; Thu,  4 Sep 2025 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994789; cv=none; b=AI1z3FzJDeKWeVh+g7HIwMHphVCnNf+mzEmGHaYGoo/o5sBhXKqj4wdsdOaHQK21QjIXQmFjIiVcaNvtqg8Bu6aIIIvE+P3YdJAcUIUL9p5dS3g8E7mQ4jED0rcEELHiObSbpSeHC1+ChqB3Iz7c2KSimd0nNgduZpCuraDwVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994789; c=relaxed/simple;
	bh=e7u5z2geXOmINqkIDOhhFeHO5so4W2iVgskRRd7gL5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jccKygy0mbZKsByljkftpdT8eO3ZceJk7gq5blzOjDShinj3z+vVMQ6nt0BoPfKVKzLsdEufMTCAkKtX24Fo6kOv2wTYkh/xBkMoL0qVgE2MB/fCRlkCZ4kANDxZkyauTNVX1hdfuMOKqS8UUZvVkcK6qNeBn8n17Ne18QTLWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvICIT9I; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-772488c78bcso1100420b3a.1
        for <linux-input@vger.kernel.org>; Thu, 04 Sep 2025 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994787; x=1757599587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+3rSnC1ctBUpLC6xRDn/aduZQO5mYlu5dXsw2qKG24=;
        b=jvICIT9Ihfz+waFlpoMo1eo8lJVKoXHw60r6GgTv/SwBg9QOOfYZRXDOWQSWTtTaFg
         YDOn0froKxAmwOEL8PIEHsaJjv9OBJs2U7hbvAvhUMYtt7QCQaPgFTrgGMitjNXptjyB
         DTAQgcqTKCDqqwchFiJECaTXw1cufYfP0QlkrbJwN2Wo3CGteSF5+DEK7kYNKqKUyaVj
         M/ioWfYMXDXku7VH/2iASh6ntRgesCfnZrSQ5McvYo/ly3gtQD6og8jqWFkLlZbRdzBu
         2VGZYpspdh50OItES0M4KtpJOunJ0HCUzMNFBZ/yfnF35dtDDabQ8Zq5APfzJjafncO7
         29dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994787; x=1757599587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+3rSnC1ctBUpLC6xRDn/aduZQO5mYlu5dXsw2qKG24=;
        b=oMrlTsMa6Ih868iNNaMmqTMxoPsxbJclUtnCY0FZfklE80wXz5z8tJEAL1uT2ji3JV
         G5jBZqVqF2eGW7kxrULfUBH7hQ96PJ+bPLkx9ieaH282oy1/aAdIApqU7JjMVEYm99/L
         xS6FPwrFwRbK5IezyHdiLBrdHDCPJPKriHqkiLSc6ZKJ8tQdycf6SndkIdPkaEmKoP1L
         7aVZ4uSq6UwGNBJXULYQalzwUg5CjaejZ+hu2She5TS/ReRr8Ri2ZQoyNXb7mGxfCHwS
         ukz+npeWiLJIwHm8Or/Km7LKbWCkKNZutjJVUFk2QMVMHRoRaIdktw5hP3woqBAoJ4aN
         d37g==
X-Forwarded-Encrypted: i=1; AJvYcCW4BMAemU0iK/4r2e31gjNoWkOYA6Mt8LfBGV4GCcBrVLf5lX2ir46cwFvBe3O+GAeDTY/P6iLwa5R+ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YygpgEpDcksjEVJOYZ3dHUZ1o3wow3AtKM/LdM1NkX2jAKj8aHF
	OUaq0f4MrTcmB39hsBkpEAcwYbdPZuNhssrCn9doiOjzomlSWGtkKRv1
X-Gm-Gg: ASbGncspyUU8KtBkxM1qSzgbgVw2UwtyhhIgggqAZEEOgbbC/vMh8LD1fFBMmAwA9du
	y6IeymLPIuojVrmq0rWcr+4pxoRJIGALuqO3p99u3DCh0lmZymEgd0+qVsi0lKuMcGZK/eSf21r
	GNGB2KQJzKUzCMOtP5HL94mnp+5ITaIfET+URf9eHSpopdJpycF5h8a12GUlc9VfhhKfob7xTaH
	FKXQrsBa3p+Gorbl3W841qWrLn1dfOpm6BO+8NlJWYDxQbdVtfCJzIdfpXR4wQ76EfoAzcaokt+
	YsQJ/d/WoRGaBUI6ze4Cel14dj7BQPHIVoFwwh2gsaC5JqTEAOBrdLgcT67UNhvMeIuoVctap9D
	LvgM8R4qj/mai46bfokPkYRQ=
X-Google-Smtp-Source: AGHT+IFnjbMbw3puYxXAtqTmAfBZ+PbSsGIu/mKvHAuj21P2R2p+8F45+1w7VRRvLnKF54BRxKirTA==
X-Received: by 2002:a05:6300:218a:b0:243:c6d1:776c with SMTP id adf61e73a8af0-243d6e0625bmr25847874637.21.1756994786864;
        Thu, 04 Sep 2025 07:06:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0164c38sm16961113a12.10.2025.09.04.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:06:26 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:06:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLbutygmfjV4AuhZ@tzungbi-laptop>

Hi Tzung-Bi,

On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > probed at the same time.
> > > > 
> > > > Example:
> > > > 
> > > > + -----------------------------------------------------------------+
> > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > + -----------------------------------------------------------------+
> > > > | Probe cros-ec-keyb.            |                                 |
> > > > | - Decide to defer[1].          |                                 |
> > > > |                                | A device bound to a driver[2].  |
> > > > | Probe cros_ec_lpc.             |                                 |
> > > > | - Init the struct[3].          |                                 |
> > > > |                                | Retry cros-ec-keyb from the     |
> > > > |                                | deferred list[4].               |
> > > > |                                | - Won't defer again as [3].     |
> > > > |                                | - Access uninitialized data in  |
> > > > |                                |   the struct.                   |
> > > > | - Register the device.         |                                 |
> > > > + -----------------------------------------------------------------+
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > 
> > > > Note that the device link[5] can't help as in the observed environment,
> > > > the devices are already added via device_add()[6].
> > > > 
> > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > 
> > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > before continuing to probe cros-ec-keyb.
> > > 
> > > Why is the keyboard platform device instantiated before the transport
> > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > issue...
> > 
> > I may misunderstand but it seems to me:
> > 
> > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > 
> > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> >   registered.  It deferred as its parent's drvdata was NULL[1].
> > 
> > - The transport platform device was probed when `cros_ec_lpc_driver`
> >   registered.  It set the drvdata[3].
> > 
> > - The keyboard platform device was probed again from retrying the deferred
> >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> >   wasn't NULL and cros_ec_register() for the transport device weren't
> >   finished.  The race happened.
> 
> Hi Dmitry,
> 
> Does it make sense to you?

I'll have to research how MFD mixes up statically described and
DT-described platform devices and makes sure that children are not
probed before the parent is ready - I think we need to make cros_ec
behave the same way.

Thanks.

-- 
Dmitry

