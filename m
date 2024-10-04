Return-Path: <linux-input+bounces-7070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7629901AA
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 12:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8441F2253A
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655A4146D65;
	Fri,  4 Oct 2024 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="au+yUAWY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF998179BB
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728039281; cv=none; b=jLPliLOoDngt+vaZh6HEWnYPzgtGnUHfx/dYnuXsSYr9RmF4PKrAmm5wVVBJY4pzjlrEHMIakm0QIzHgTO1Ovfeueg94mV4SW7whOVZ/QhUfS53Mj4z39FwjtpqlYGm5W8/oKjCKcm9enKlzE+FHoTDv9VuUWAIrwgrm6bY3O0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728039281; c=relaxed/simple;
	bh=QYGLSt8UrCvUvYimmPNXEZzo+qRE7//Pu+zOURk5xdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aEyDB6IikNS0KsDo325cOqRUaOmVp44m7/Llzzu6OvEUdFfNKqCd8m/P7+U1p4EdJv9Rj9fARQOZSUFt1qJgtPkzz4arEgvGEcKlqJcN9HMoZqoSRGNZYbQTUsmIx0ggrgE1wUr3i0xiKm+jR/7uiTrK8u2ZzYxTIL40BOjq2DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=au+yUAWY; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4zj4SpkTftOxpp+F9za0a5/Cw2BLLNDW362xOwFbYk4=; b=au+yUAWYePikLKoLPgW+RgCffY
	/51OpyciSBXlIlD4UMBf4yoj/GKBxS5RKatDzDU3B9y6D093yympecvkJgs3sHha3ahUHhGyScyBw
	g7HFwRJsnkYhz9KKmSSBXDAeTzVO6vfUIInKkUtQ98jrbNsm6ic/V7bpp/DwSNsBwFArM2aNoytQh
	F977ZX+vic24Y8VoaoN6kHLcRIybcNme+mYk0aP9ec0iPB7BWi2qmM8lOXB877veyzYsIttniaa74
	8mKguXPILFu4Zl2U36GqQp/WAUIDnx5Xrr4RiKhU852K7BG16YCaq62Uxpp672cCTHsjjXd9/Nhyy
	dRCD1tTw==;
Date: Fri, 4 Oct 2024 12:54:35 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren
 <tony@atomide.com>, linux-input@vger.kernel.org, Ilpo =?UTF-8?B?SsOkcnZp?=
 =?UTF-8?B?bmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 20/51] Input: omap4-keypad: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <20241004125435.763c49b3@akair>
In-Reply-To: <Zv_C4vcdgw6lT-Gx@kekkonen.localdomain>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
	<20241004094123.113691-1-sakari.ailus@linux.intel.com>
	<20241004115511.78f021d8@akair>
	<Zv_C4vcdgw6lT-Gx@kekkonen.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 4 Oct 2024 10:26:42 +0000
schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:

> Hi Andreas,
> 
> On Fri, Oct 04, 2024 at 11:55:11AM +0200, Andreas Kemnade wrote:
> > Am Fri,  4 Oct 2024 12:41:23 +0300
> > schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:
> >   
> > > pm_runtime_put_autosuspend() will soon be changed to include a
> > > call to pm_runtime_mark_last_busy(). This patch switches the
> > > current users to __pm_runtime_put_autosuspend() which will
> > > continue to have the functionality of old
> > > pm_runtime_put_autosuspend().
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
> It could, in which case we'd be living with
> pm_runtime_mark_last_busy() called twice, for some time, and for some
> code, possibly even in a release kernel, depending on how well the
> patches "stick". It likely wouldn't be harmful. Still, to avoid
> making functional changes to more than 350 files I know little about,
> I've instead posted this set to prepare for
> pm_runtime_put_autosuspend() functionality change while keeping the
> functionality of the code exactly the same.
> 
> Also added Ilpo who had a similar question.
> 
Ah, ok, I did not get the cover letter.

> Once this conversion is done and pm_runtime_put_autosuspend()
> re-purposed, I'll post another set to merge the calls to
> __pm_runtime_put_autosuspend() and pm_runtime_mark_last_busy()

with that all this makes sense to me. So:

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

