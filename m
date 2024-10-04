Return-Path: <linux-input+bounces-7072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BACF9901CB
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 13:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DECAA1F2338C
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C0813B2AF;
	Fri,  4 Oct 2024 11:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OouWkTag"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9971DFFC
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728040116; cv=none; b=HkFZaCahOtbrb1FZj4KUUMvjJkBwOiTQTFf97IZaq7elD1eaPk64MF3iE+s1h0SQaI8rkOfBMj2orY+0r0yGN97KQkT5EBsd5v6OCCNQgB4hwfvSNoGgwgEOVStFEbkf5G3KkGS7zxcVzhu6lP9Oidku2QxTNgFJ0G2ZKh3K7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728040116; c=relaxed/simple;
	bh=wfs0FRXOEiXmE3DRdgW0RDSVlNe/R/b+IGYnbElKjio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz89nYS5j9qnmiJUJqpbHJ18QNHBkLrdoChpkpcLI8Wo/5a3/qWy1b4RAaBAusYDmqd7uzacqNqvHFkBYAjNCwa0qBXm3cRtyAbK7EdT+b2Xj+HU6jV4HEjfKu66uMZ68UAauVy1/a3wRp04dvkQga+yGs4ezOe427rTyTLsi5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OouWkTag; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e9d7960aceso1151341a12.1
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2024 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728040114; x=1728644914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONvUXyLRJSMThFRzThPN1hkkpKOFVP1qyU8QLLJN0Bk=;
        b=OouWkTag2m3DO5b7OynXFJOQsNrWZhBSAXWrpvWxuutAG7z13R6FD6S/WQJLmX+loG
         rza5QOAw8XYoZOD734iu0rLyjogIi6/q2AS9M1qjfe78E8Dlwnx/nIrZOXP8utSmB2GU
         WSWWDGzn/48+BPtuFjkv34z8aI6aiphm5k+zQJ5Wwr5Pml7cwj6f5oqb/ccmG3xjwC3X
         gGd0025hIHibjSd5C/nTZoIfjHnn3UX5LnpqG0uXcjszwg6eXN9gvNiY48iu8Pt0eXqT
         BfNkRy2YPtVTZHNBY91DnPfze5/mI83pt2RGdS7gInKb5qmVH8dCxaM/XWrsvUNxuGy0
         s7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728040114; x=1728644914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONvUXyLRJSMThFRzThPN1hkkpKOFVP1qyU8QLLJN0Bk=;
        b=eAZW1XQvyLYeD2ChQho4Kh09+Povo0ky/wI6iCrJOr2aW6gwW75UrdpY9RiPVo7DA0
         OcCfK2ft9pGNttdmh5/qvF4n3TsFU6TUyvrptGTmSu07HlPr2nsnA+eP4BhMEKC9Xpcm
         SZWxKZk5GA/16sWJVm9fU5bR3e/ejkCnH1xaPDpbuqRh46ZVi4EiZbu8hqP4G8Kj/I1c
         N6Kz2TUOslOMkdmpcbSHwBzPMkZigHRVQHqL9bRzFuIIRqAegfGwSRYSzPf6QJG9mQxy
         nkyEUaF6M2j0uIIrAqyhTDOmba3rNaplbyFGjpYKEtKfUdwptqip34+4qQgbatD+Xx+l
         khyg==
X-Forwarded-Encrypted: i=1; AJvYcCWYOcKZY6nkTIfSQYXEu88VZ3wSnERDAh39inNR2FGAlRqbWQg0YG5YUYy0K6RjwUrVxw5c92vlUDHo9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmd+uBRbSOIbjKZL4icTIHfFpLhfbs1xxJhQMM0spvxIu6eYfe
	+uURF1x5XDmiZJhxAk/sWGHKdEp7/BV4E8FD1HHMc8mUgAI/bgftKTmO2VDz
X-Google-Smtp-Source: AGHT+IEaE94T9rZZ18cKyaOpijT2JyUfTdujDhMv9+963SmJ0/WGvvdhoaj9H0Oziv2H+3Fw52ldEg==
X-Received: by 2002:a05:6a21:394a:b0:1cf:3b22:fec3 with SMTP id adf61e73a8af0-1d6dfa41711mr3790255637.24.1728040114247;
        Fri, 04 Oct 2024 04:08:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1b2:add:2542:c298])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb1d94esm2247608a12.54.2024.10.04.04.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 04:08:34 -0700 (PDT)
Date: Fri, 4 Oct 2024 04:08:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 20/51] Input: omap4-keypad: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <Zv_MrzN-rOLK54me@google.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113691-1-sakari.ailus@linux.intel.com>
 <20241004115511.78f021d8@akair>
 <Zv_C4vcdgw6lT-Gx@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv_C4vcdgw6lT-Gx@kekkonen.localdomain>

Hi Sakari,

On Fri, Oct 04, 2024 at 10:26:42AM +0000, Sakari Ailus wrote:
> Hi Andreas,
> 
> On Fri, Oct 04, 2024 at 11:55:11AM +0200, Andreas Kemnade wrote:
> > Am Fri,  4 Oct 2024 12:41:23 +0300
> > schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:
> > 
> > > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > > pm_runtime_mark_last_busy(). This patch switches the current users to
> > > __pm_runtime_put_autosuspend() which will continue to have the
> > > functionality of old pm_runtime_put_autosuspend().
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/input/keyboard/omap4-keypad.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/input/keyboard/omap4-keypad.c
> > > b/drivers/input/keyboard/omap4-keypad.c index
> > > 040b340995d8..cc8d77601fc7 100644 ---
> > > a/drivers/input/keyboard/omap4-keypad.c +++
> > > b/drivers/input/keyboard/omap4-keypad.c @@ -196,7 +196,7 @@ static
> > > irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
> > > kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS)); 
> > >  	pm_runtime_mark_last_busy(dev);
> > > -	pm_runtime_put_autosuspend(dev);
> > > +	__pm_runtime_put_autosuspend(dev);
> > >  
> > >  	return IRQ_HANDLED;
> > >  }
> > > @@ -234,7 +234,7 @@ static int omap4_keypad_open(struct input_dev
> > > *input) 
> > >  out:
> > >  	pm_runtime_mark_last_busy(dev);
> > > -	pm_runtime_put_autosuspend(dev);
> > > +	__pm_runtime_put_autosuspend(dev);
> > >  
> > hmm, if pm_runtime_put_autosuspend() will include the call to
> > pm_runtime_mark_last_busy(), then why is this change needed?
> > After the change, the mark_last_busy could be removed.
> 
> It could, in which case we'd be living with pm_runtime_mark_last_busy()
> called twice, for some time, and for some code, possibly even in a release
> kernel, depending on how well the patches "stick". It likely wouldn't be
> harmful. Still, to avoid making functional changes to more than 350 files I
> know little about, I've instead posted this set to prepare for
> pm_runtime_put_autosuspend() functionality change while keeping the
> functionality of the code exactly the same.

pm_runtime_mark_last_busy() is pretty cheap (it fetches current time and
stores it in the device power-related structure), so doing it twice
back-to-back should not be a problem.

I would prefer what Andreas suggested in the first place: remove call to
pm_runtime_mark_last_busy() once pm_runtime_put_autosuspend() does it
for us. I'd be OK with such change being merged through the same tree
that changes to pm_runtime_put_autosuspend() will be merged through.

Thanks.

-- 
Dmitry

