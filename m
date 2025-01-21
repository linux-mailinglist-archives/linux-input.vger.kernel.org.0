Return-Path: <linux-input+bounces-9408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2767A176F8
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 06:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 926E87A2892
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 05:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8B319E819;
	Tue, 21 Jan 2025 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arNiaPkw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F5B195FE8;
	Tue, 21 Jan 2025 05:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737437123; cv=none; b=VU7WZIEVkM88qNB0wlT4X+Z+AAP4yA19R/vGRV3J9/R8VeJqE50E2K/DWmqSov0yQsE7TYnBKf4my+FnkGqUaLg4CcQ/BjqfEQPGdprYWa4Y5n7CpweXxrVDAclCIYc2+sGwIZ7KsAqRqQc5fARBTXqbouQKXxa+tcTzE/WkIF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737437123; c=relaxed/simple;
	bh=WbxisHH150RzHnO/WnQaqm+JFFzZyQuk/oPh2LhzWLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5CzPJjkrnrm2MyYVv1JNLgRlWgvF4ygOcSCMQgpa/nA+SR/CZeJn7f4AeUFeedbtMHZy+QlJUGxvlgPQb4QNMKd/hHImuE+4EB7ny30XopBpHzPqlF5klOUtjQjAznsi6piSa+9iHp83BXzD/fZlIBmPRTac9clNpxggBUSuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arNiaPkw; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2efb17478adso8930992a91.1;
        Mon, 20 Jan 2025 21:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737437122; x=1738041922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVl9NuQyKh40ymuwpNz39qGi7osmSYeSTdcejZBalIs=;
        b=arNiaPkwvYQQTckPL2DSyDRBxTU12X3D0Qq4qbJuphLX2PS2Q4oHR5GerAf4NgCmfz
         jvBrCoztRE0XRzY6jHyt+DSyluZ5E1pRQLQg7VcfForosnP1ChXgSIcHYi1JIZZNqfTq
         gtgwgK/iXxND0ysaoVanv+DERY6ZEjEc3jNM5P/nkyLhYlbzDUcTt6YQ0J4gtB790wAK
         XBXNobekZKAdXVmbb+mtAJHzLrweDlJmkLZ9kXOL4jrvb2ldE7bIZSjNl9i6tf6XnQLe
         tyFMAryM8f74WE6S98L67t7MQAzsKmXuc2qmydrMn/+nyJlOr+iOP87Y45xlT3GgVxd9
         PiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737437122; x=1738041922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVl9NuQyKh40ymuwpNz39qGi7osmSYeSTdcejZBalIs=;
        b=awxXV3jgJzS5wIk9r8P9lmBBWXpMmszX/BZ0OwrIGTW7ozCbc5gQDolGYfKehaLWLl
         QAeArlTk63IuGrVajOzvYKsRcnuA5g+59Q9xaj0X0/lbbeoCBSJTQilL3RuAGqJ5YvtP
         O9K4cO1/dH4GH5h2pl+jWe8LczoHbhTBXl93fxXpyK/hkX3/d99I04sUs76dYuX4clbO
         FLP28PtO04PDB34Fst8oXhsI9d2owhP0dt+GlUEZ2hcycZs1NI+syeL63R9fmhgFqSGY
         fxjKofOz01jHUvbZ8MLtKJ51GAvh7GxdPy52SIojMRKCidp8HeGyk/bEr7qVMN3egTZC
         Ff6w==
X-Forwarded-Encrypted: i=1; AJvYcCXdUW4Bh6tDuPAFwbE8MwAXOsgxs1ykdb0c4Ykks9mGMfyzpXTTDyto414kGrzNI7vfqAGMJ/6o4oOA4xI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6NOWP9XjaympLAiOFMJVfqdLI/EUbXbAOJswZYS5XMwVGM2J
	7eRSktjiRjzlsPacFN0EKXnOSlMHK2b1dFODgvMlCaac9sr3g6TS
X-Gm-Gg: ASbGncvsg5A+Yql6ILc5IgfoYTXPzfEauSTAumfREqzjYDYI7+vtya9sTheAJgJlqCr
	rdpltSbU8sFU9ZWWubD46YgAgbpSBMwQKVHYkChMLhnqlcVHotyeq+Zg/taxvR71K9UKpJo7BZy
	8x6zGSNg3mCYSZ2Flv5GHkEUrJ0t7y/9f4iwWVxNvANIlsRPOv7kopaZV4etW3qTuGU/GWVxXkJ
	98wEbxbb/8ADPsOzIxa3Unf7Fd5Ub3ItWDgcj9PZtqsolLVtYF5AQtF51CKh7BySbLM95I=
X-Google-Smtp-Source: AGHT+IFwTBs5ig96GjcZbwhqgVg636xMOqS5yeFg46XXfxofSOYMMsHoR/Lr+hUq9OYKfYUyeDhx1g==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f782d323a6mr22529939a91.25.1737437121544;
        Mon, 20 Jan 2025 21:25:21 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9fc4:f41e:933e:403a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7762b1888sm8561565a91.49.2025.01.20.21.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 21:25:21 -0800 (PST)
Date: Mon, 20 Jan 2025 21:25:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - fix crash when enabling pass-through
 port
Message-ID: <Z48vvnjs3qtoPqqY@google.com>
References: <Z4qSHORvPn7EU2j1@google.com>
 <87o704qzkq.wl-tiwai@suse.de>
 <87ldv8qxdz.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldv8qxdz.wl-tiwai@suse.de>

On Sat, Jan 18, 2025 at 10:33:44AM +0100, Takashi Iwai wrote:
> On Sat, 18 Jan 2025 09:46:29 +0100,
> Takashi Iwai wrote:
> > 
> > On Fri, 17 Jan 2025 18:23:40 +0100,
> > Dmitry Torokhov wrote:
> > > 
> > > When enabling a pass-through port an interrupt might come before psmouse
> > > driver binds to the pass-through port. However synaptics sub-driver
> > > tries to access psmouse instance presumably associated with the
> > > pass-through port to figure out if only 1 byte of response or entire
> > > protocol packet needs to be forwarded to the pass-through port and may
> > > crash if psmouse instance has not been attached to the port yet.
> > > 
> > > Fix the crash by introducing open() and close() methods for the port and
> > > check if the port is open before trying to access psmouse instance.
> > > Because psmouse calls serio_open() only after attaching psmouse instance
> > > to serio port instance this prevents the potential crash.
> > > 
> > > Reported-by: Takashi Iwai <tiwai@suse.de>
> > > Fixes: 100e16959c3c ("Input: libps2 - attach ps2dev instances as serio port's drvdata")
> > > Link: https://bugzilla.suse.com/show_bug.cgi?id=1219522
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>

Thank you for the review.

> 
> BTW, backporting this patch to stable kernels wouldn't be trivial; it
> needs the recent changes for guard(), too.

It is as simple as changing it to pairs of
serio_pause_rx()/serio_continue_rx() so pretty trivial.

Thanks.

-- 
Dmitry

