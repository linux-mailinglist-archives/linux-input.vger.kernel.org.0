Return-Path: <linux-input+bounces-3572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2B8BEEAF
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 23:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0402C286453
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 21:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948D14B96D;
	Tue,  7 May 2024 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WircKXb/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AF14B967;
	Tue,  7 May 2024 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715116205; cv=none; b=CJn+e1/F18Q0w/bGcUSPrqYT/Y/ItRLkPU4raIjOx/1PoZhEm7LX6e062a7tt7gOzptH6tUje3JmEsggrDh+3KGSiJMngPHVaL+BxMBZL3LA8hl3tgqpWZZFMhhHMe1O3e0grdRTMF4Cn9gepqcipk9liXix3ngFz0J6NGasI14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715116205; c=relaxed/simple;
	bh=UkN/SrysJMI919GTZn7sd9Zmy+BrfsQuffkKs9xMyZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpXMIt14e26yGFRdQw2r4BkS23MO+Yux5jnI8y/Zwm4ce1TL01+1/m2YsyiqiYv+niiuJUkMzq1QMgDRclPi7N0PaV7oXwAjZ+AaEE/MC+qvVlJfkdqrzDU3PjC+wAQbLKRrA7xAOzTjUJ+4N6UJ0UvNODkz4G9QKVgR4Tm9xg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WircKXb/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f44d2b3130so3154216b3a.2;
        Tue, 07 May 2024 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715116203; x=1715721003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qQRrXFq5F8dShnYwEEg5RGcp0KdPkiW9FT2NeUeB+/0=;
        b=WircKXb/rn9UuMrdeLHQSbBhzyjsTcntojt6tfaMdP9ggXUCrwYa6RVuGE69K1D4lM
         AEQlZqiPQGRviupcon+b8OfDpRGw2v5/1g3otvJ1JiHGaeL3PxkU2XhCgVY2CoifzLEP
         m75O4dJXHRSO9CmdhTUFkfRqOf67PJVyMrWQTcwtycOREk8TN7hhj3d+3pHcHjATzmYm
         4J0uvT3nvmBDXoUfn8y9BuCuAOPZvEZqHvTb3/gWwHUSWC61Z7Fr0NUY+LbcCrlVzOU6
         zpxuYemsOPDtd++8FOvr1CjkgzoHsZ8yDIjTOmDJk/7dOCB8k3BD0K3iovJ6s2QwViUS
         rImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715116203; x=1715721003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQRrXFq5F8dShnYwEEg5RGcp0KdPkiW9FT2NeUeB+/0=;
        b=J4xi7SWI0oPCHEnVd4+R3eUe4NKoC27WuAiNYTa+d4jFqn3a4bCKHTwrZgZ/s298aF
         74NUZYVw9BqUx736pz4AqJW/rQTjZjZpN7O1mTEDeAylivl/GLJFlD3sKCJEe+PMa2bN
         R/H4AHw24ukuirc/e08Ud0jP/Jj/EGePaYNwnKg0MFSI/cGQ5KL+kl1WJy5VRnH55nvX
         W497C+rfmoyG6DKQe4GFLCs5K0uAc583SrVe0QjmB+T03c+hHM0x81gK8UvVfJI7pQEH
         MGL9xpM+cNV9r/R881K8Aguvg0rxeevKNBXEesVZHgkrB54Hgs8kmQyqd1+/sUTffmkz
         +rkg==
X-Forwarded-Encrypted: i=1; AJvYcCWUGBLmRGQvbHTUhksE/4tpjqFup0m5VYOYjNXEUKMuj6FFXC5Iz+Bs6lFe5WtgnVIYbEZISwS7crqB/5CLQtbRpMO4DLHFiMtFQAaYsYTU+1aB1dwPsOnBunwuLpdODrZsxA0yemyNwD4=
X-Gm-Message-State: AOJu0Ywd7tlXHKiBge6TeAyxuQhK11FEEa45p0Tjz0DSx1sE6w5NIjHX
	3WvqGKMsvPxNPbeJSfzmFC4EMFm8W0aEW+z5LlOuFlYho+OxKSBv
X-Google-Smtp-Source: AGHT+IEPtVbWEj3J20zn9OOr5c7M1VJ2Cn3t9uZr0rk7uE8E/BPqYddSskW6n50X60JlGko88LUkAg==
X-Received: by 2002:a05:6a20:258f:b0:1a9:8836:ae37 with SMTP id adf61e73a8af0-1afc8d15897mr986301637.12.1715116202746;
        Tue, 07 May 2024 14:10:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e3c:6631:2efa:fee2])
        by smtp.gmail.com with ESMTPSA id gx8-20020a056a001e0800b006edec30bbc2sm9849288pfb.49.2024.05.07.14.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 14:10:02 -0700 (PDT)
Date: Tue, 7 May 2024 14:09:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: Mark Brown <broonie@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjqYp1oxPPWcF3jW@google.com>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
 <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
 <ZjpFVGw6PgjRcZY3@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjpFVGw6PgjRcZY3@nixie71>

On Tue, May 07, 2024 at 10:14:28AM -0500, Jeff LaBundy wrote:
> Hi all,
> 
> On Tue, May 07, 2024 at 11:36:41PM +0900, Mark Brown wrote:
> > On Mon, May 06, 2024 at 07:13:38PM -0700, Dmitry Torokhov wrote:
> > > On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
> > 
> > > > If raw register access is seen as a good solution, then I think this
> > > > should use regmap + some generic helpers (to be written) to export
> > > > regmap r/w access to userspace.
> > 
> > > I think the less code we have in kernel the better, especially if in
> > > cases where firmware flashing is not essential for device to work (i.e.
> > > it the controller has a flash memory). That said IIRC Mark felt very
> > > strongly about allowing regmap writes from userspace... but maybe he
> > > softened the stance or we could have this functionality opt-in?
> > 
> > I think unmediated raw register access is a terrible idea, you can't
> > safely write a driver if userspace can just go in and randomly write to
> > registers with no coordination with the running driver and for some
> > devices the kernel needs to ensure that any writes don't damage or
> > destabalise the system.  If a driver provides an interface that looks
> > like raw register accesses that's of course fine (I mean, a lot of
> > firmware formats basically boil down to register write sequences which
> > is clearly fine) but it should be the driver doing that and it should be
> > looking at what's going on and ensure that it's joined up with the needs
> > of the rest of the system.
> 
> I happen to agree here; especially in the case of writing new FW to a
> flash; this is a very hardware-centric and device-specific function,
> which by definition belongs in a kernel driver.
> 
> For example, many devices must be placed in a bootloader mode during
> the FW update, and may clamp or toggle an interrupt pin during this
> mode switch. If user space initiates this sequence while the driver is
> unaware of this process, it may attempt to read status registers from
> an I2C address that is temporarily offline.

And yet we have i2c-dev and hidraw that are often successfully used to
flash the firmware, do diagnostics, etc. without encumbering the kernel.
They are more likely to work on ACPI systems because such systems have
separation between power management and function pieces (whereas on
non-ACPI systems power management is crammed into the same driver and it
is not possible to properly power up device without wiring up the rest
of it). This is something that I feel we will have to fix in the long
term.

> 
> A much more common design pattern is for the driver to expose one W/O
> sysfs attribute for accepting the FW file name, and one R/O attribute
> for displaying the current FW version in flash. A small script runs at
> start-up to check the version against what is stored on "disk", and if
> what is stored in flash is deemed out of date, the script writes to the
> W/O attribute. This is the extent of user space's involvement.

This however means that code that is not used 99.9999 percent of the
time has to stay in the kernel, occupying precious memory. I agree
that if firmware update is very involved and needs precise control of
interrupts coming from the device and has certain timing restriction,
then in-kernel implementation is preferable, but in many instance
userspace updaters work just fine.

Thanks.

-- 
Dmitry

