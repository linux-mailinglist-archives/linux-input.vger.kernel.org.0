Return-Path: <linux-input+bounces-3533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F068BD950
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 04:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC241F227D5
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 02:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BC94A15;
	Tue,  7 May 2024 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIVC3Ti/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F04C63;
	Tue,  7 May 2024 02:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715048024; cv=none; b=EJSekTzAAeeZrz98dO/vKMTv283Lwucl3q5Vf39NIohDeUsB68HfFSkQng94j7x4wdOm1s/X3YO53I2P4quTFHNJF2tSK6YU7hncsmJFB9AGupY9J+97R/fJD6wol+Ri9xW5Kg1J1IuEmlEuKmAkGZB97NmrvKkloqqumRzrQlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715048024; c=relaxed/simple;
	bh=G7eAzDnjYsUquca5DgYURom3FGxQSVe5uDgKJypFTvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiVb6x4tvHaYg/5QmcT+BFpyehP6x71CEJjDkAzVltXfxm4EsUMGwYT9Gzdkza3Ky0mlHCKtqwPQfIR3jGYcv6CsTsyQeSVYhHf9kq5kgpKSJ8JYmA0/ZIlcgVc88r8R7PkFLu+XAVpAWrt5YWmOmnzeKL6JeGnUzYXHMxEbyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIVC3Ti/; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6f042ff9ddcso1191007a34.1;
        Mon, 06 May 2024 19:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715048022; x=1715652822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JrZ6SuQInLnc2+mgMTN2eZSIdJ1Vd4I7NVA29Tw+mFE=;
        b=cIVC3Ti/cBQ/aciC1PKBHwiCgigXz0pOfihFAGNNpNLLCojegzgCxH9YJYzq0+Sd6u
         ETb6wnaSkaD1T05Z/e5mqEDg59PycRLI8sydatgXcnPhpgpApHJJ2WWZxUaCqcJcXIVm
         +drZgeOh9I0tb+JOigUPbqjr45p3p8FEmajcbrjPDtZP3ImU0TmuA2aGMILihlJAPDcd
         Z9aSvTv7dQEbSIlgM5KdH8+qNRDEcfx6tZI62e5qVp3deP98IE8LD8RfK5C7wEJlCMXy
         DN0XTan2U9BZk/zOjCHbXfhnNQsVPgnTb2ihyTmc3hvQV8cYSAcoz67JNT0m7UY+eWVI
         jD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715048022; x=1715652822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrZ6SuQInLnc2+mgMTN2eZSIdJ1Vd4I7NVA29Tw+mFE=;
        b=U0FMRMelefURSmjQoMxZ90lvL+8brcFuNsQ1i9/oGXLG3UlJyDzvewMytl+g/r27gO
         vy0h9dZNq/SZrecIRxNn3QYVfADIL3tgXqlInwpAmdFS+XVgNQDkJPu9yXR4Br0Yn/q4
         21vmlrtsYjWeMYazPzi8XqF1PE4PuX7PycHsyE0ZZpr96e0Yme4gmV1Hn0HjXjgkwU8V
         SapPXP1EW70IL4QMf7tO1+ziM7CKJEomKcVtch5/jN4X4wrPJ0pNMn1aXIzj0oowF3eb
         tkLH6xhxArsiSkjvc1dto3z3Io9Gj8jmEtmXggDMKH49luex2qHsNcf5spyLSescWbra
         7hhw==
X-Forwarded-Encrypted: i=1; AJvYcCVtonQ4Ufk4eS84lIawxe+4YqsRAeAD88/8udI0oF59c4X1ULw2UrmZ8EJC0h0UOXiYghqHD9eR3XuA62qIyxZnrvi+E/EAg8NhIEKKtRayrKrd68eXaZ4wn0ZnmWpxc6XnEN3Iv2oGE18=
X-Gm-Message-State: AOJu0YwpuUtT6nMtsNQyOpy+uJuG9yy+IzXDH0nB+im/TB0Y3CUdUAB8
	R724f5NSsblfKgZlXZHAJPXzzSs97iqW1OqxE1OmBYtPof/aHo2emLsv9g==
X-Google-Smtp-Source: AGHT+IFx1iTTLqW+a5zy+mrOU7H7PtN2kDBjD+ThTA/QprFo5oW3hrIgZguo6vcbcnI+TrSq5hHtqg==
X-Received: by 2002:a05:6808:10ca:b0:3c9:6e4f:eeec with SMTP id s10-20020a05680810ca00b003c96e4feeecmr5933080ois.37.1715048021894;
        Mon, 06 May 2024 19:13:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:da17:38c8:4449:eb9f])
        by smtp.gmail.com with ESMTPSA id j6-20020aa78d06000000b006ecec1f4b08sm8370854pfe.118.2024.05.06.19.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 19:13:41 -0700 (PDT)
Date: Mon, 6 May 2024 19:13:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjmOUp725QTHrfcT@google.com>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>

On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/6/24 1:47 PM, Charles Wang wrote:
> > Export a sysfs interface that would allow reading and writing touchscreen
> > IC registers. With this interface many things can be done in usersapce
> > such as firmware updates. An example tool that utilizes this interface
> > for performing firmware updates can be found at [1].
> 
> I'm not sure if I'm a fan of adding an interface to export raw register
> access for fwupdate.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/goodix_fwupload.c
> 
> Contains update support for older goodix touchscreens and it is not
> that big. I think it might be better to just have an in kernel fwupdate
> driver for this and have a sysfs file to which to write the new firmware.
> 
> Adding Richard Hughes, fwupd maintainer to the Cc. Richard, do you have
> any input on the suggested method for firmware updating ?
> 
> If raw register access is seen as a good solution, then I think this
> should use regmap + some generic helpers (to be written) to export
> regmap r/w access to userspace.

I think the less code we have in kernel the better, especially if in
cases where firmware flashing is not essential for device to work (i.e.
it the controller has a flash memory). That said IIRC Mark felt very
strongly about allowing regmap writes from userspace... but maybe he
softened the stance or we could have this functionality opt-in?

> 
> > [1] https://github.com/goodix/fwupdate_for_berlin_linux
> 
> Hmm, that tool seems to have some licensing issues there is an Apache License v2.0
> LICENSE file, but the header of fwupdate.c claims it is confidential ...
> 
> Regards,
> 
> Hans
> 
> 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  drivers/input/touchscreen/goodix_berlin.h     |  2 +
> >  .../input/touchscreen/goodix_berlin_core.c    | 52 +++++++++++++++++++
> >  drivers/input/touchscreen/goodix_berlin_i2c.c |  6 +++
> >  drivers/input/touchscreen/goodix_berlin_spi.c |  6 +++
> >  4 files changed, 66 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
> > index 1fd77eb69..1741f2d15 100644
> > --- a/drivers/input/touchscreen/goodix_berlin.h
> > +++ b/drivers/input/touchscreen/goodix_berlin.h
> > @@ -19,6 +19,8 @@ struct regmap;
> >  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> >  			struct regmap *regmap);
> >  
> > +void goodix_berlin_remove(struct device *dev);
> > +
> >  extern const struct dev_pm_ops goodix_berlin_pm_ops;
> >  
> >  #endif
> > diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> > index e7b41a926..e02160841 100644
> > --- a/drivers/input/touchscreen/goodix_berlin_core.c
> > +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> > @@ -672,6 +672,44 @@ static void goodix_berlin_power_off_act(void *data)
> >  	goodix_berlin_power_off(cd);
> >  }
> >  
> > +static ssize_t goodix_berlin_registers_read(struct file *filp, struct kobject *kobj,
> > +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> > +{
> > +	struct goodix_berlin_core *cd;
> > +	struct device *dev;
> > +	int error;
> > +
> > +	dev = kobj_to_dev(kobj);
> > +	cd = dev_get_drvdata(dev);
> > +
> > +	error = regmap_raw_read(cd->regmap, (unsigned int)off,
> > +				buf, count);
> > +
> > +	return error ? error : count;
> > +}
> > +
> > +static ssize_t goodix_berlin_registers_write(struct file *filp, struct kobject *kobj,
> > +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> > +{
> > +	struct goodix_berlin_core *cd;
> > +	struct device *dev;
> > +	int error;
> > +
> > +	dev = kobj_to_dev(kobj);
> > +	cd = dev_get_drvdata(dev);
> > +
> > +	error = regmap_raw_write(cd->regmap, (unsigned int)off,
> > +				 buf, count);
> > +
> > +	return error ? error : count;
> > +}
> > +
> > +static struct bin_attribute goodix_berlin_registers_attr = {
> > +	.attr = {.name = "registers", .mode = 0600},
> > +	.read = goodix_berlin_registers_read,
> > +	.write = goodix_berlin_registers_write,
> > +};
> > +
> >  int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> >  			struct regmap *regmap)
> >  {
> > @@ -743,6 +781,14 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> >  
> >  	dev_set_drvdata(dev, cd);
> >  
> > +	error = sysfs_create_bin_file(&cd->dev->kobj,
> > +				      &goodix_berlin_registers_attr);

If we want to instantiate attributes from the driver please utilize
dev_groups in respective driver structures to create and remove the
attributes automatically.

Thanks.

-- 
Dmitry

