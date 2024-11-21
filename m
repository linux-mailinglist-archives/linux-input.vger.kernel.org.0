Return-Path: <linux-input+bounces-8182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 174619D465F
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 04:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A8E7B21697
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 03:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5ED3B796;
	Thu, 21 Nov 2024 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfCX7t9W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B910A3E;
	Thu, 21 Nov 2024 03:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732161173; cv=none; b=Ul892YNJBQBDisdZ2Oo64Jl0T2zlvx0/UC5xhRino5ozPlkWs2rWnvqyMYTmxNwK9KQwJZfjbzsvU3vCtyt1R5il63cvZhHsmMqW6lQlvDXl+ripYqfZPOOdKV8AhRrNW5ojF7cL+6jatMthr/adUK/S3ZOH4guW9U9f4jaenFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732161173; c=relaxed/simple;
	bh=q0k2YCp8z++rwKPiwDiQl0ztFqn2wSYeVugXkk8lIaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smrCQkh4WllQGD2EHwGD3Kv84nRgXhhZQE/HdTDBxbylvHyhaUem+oGPne41JUEjQNXLQy3Czr4isV1/oafPkEMLj6nGahS9ZZHzD1M7M0pujDWlSasawD1EQADDXfeLDDBCRs00CrZPOxaNFa0vY4y8fne4I79yutv4lM2GfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfCX7t9W; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7240fa50694so447177b3a.1;
        Wed, 20 Nov 2024 19:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732161171; x=1732765971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=grsgBrJIyl0KbZ1rmpSs1CTdGEN1wfeqKjgjn/6rgcQ=;
        b=RfCX7t9WY+F6MEgEJW633YDegFKdM3Woh2vzZnt50GI/vjQCZYaUQKdLzJm5fgyDqM
         lQ0K7brukipw/rushaSJSIngT3380tqqWUWsMs3LAbz4Z9cw2mztnsBD0ff8nk2T+Pny
         IVLZ1Th6SYOyR7NkJ8KXgrcNZGpiInNGVKeXuzIMVkS8onqbhMXih6CQLGDlV9X78FuU
         8GVlW8mltm2yEUZBYxsgMXHf923vSwZAElGEB2lzU25ShC2AgCFJlaZECXzJaSVThlVb
         Iw3okc3Sz9rk7b4aqaSEzj+9SOsvluhM19jTURzNgQqBLQGOJAPzeEmfILnYdwLDRvky
         PSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732161171; x=1732765971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grsgBrJIyl0KbZ1rmpSs1CTdGEN1wfeqKjgjn/6rgcQ=;
        b=AmeOmbtnnmUxotzZAtdAimmHYirDoomC4dLhS0rilzxanstyXhCAYFRGhjxDuXwJpp
         W3w/wgHP9mOqJdVEfRR+3Ep41jpzYswXm+EAlyG8dPEO+oLezmgkt8vz3fnVyNejmURC
         lspe0ntvc+LvSf1Yk9zCt/9VVEwMSZaYNJeZuR1MXZEE7P0oU2qOsWD8YntJb2h1WCZi
         fQRFHKBu+orsbdrVxE2IE3YKkyyGKHfwx4w4RINxnf6S+K2ZoBBR+Sf5tvhaSgM2HQpf
         0nYorUlLqjLYlaWglqZvTPJDNnHBxK43smi9ehg3sbos5POJO2f8mwZ0lSJTfdu1bGwg
         xB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo47KkKQmeoNK2Sgg3Bj18QbGzBf8AOib7cF5EwMF8IYUDvPI9XKLftIZgX5+UtfCO8F9w8djxMCB9zFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZfRmgjqXk9A0ci89FWFqlJUtVQHoBs/pVpuaLwRMry5cdQXjP
	kBMoZne4ZDscfeExYrZYS6/1R9atJoUi3urVpcZHnrlTQZ8v9FoR
X-Google-Smtp-Source: AGHT+IFrced5Qg0nl8jSAiQ16k7AMl+hWepAwFTUNNEwUhfgceMR0AU3erTiEnzCye2nMI5f7qxS9w==
X-Received: by 2002:a05:6a20:72a2:b0:1db:d8fe:9d4 with SMTP id adf61e73a8af0-1ddaedce5a5mr7467257637.16.1732161171362;
        Wed, 20 Nov 2024 19:52:51 -0800 (PST)
Received: from google.com ([2401:fa00:8f:201:4bb5:180f:3c88:3602])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beeb8f58sm2508699b3a.36.2024.11.20.19.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 19:52:50 -0800 (PST)
Date: Thu, 21 Nov 2024 03:52:45 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-input@vger.kernel.org, Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] Input: db9 - use guard notation when acquiring mutex
Message-ID: <Zz6ujWxy5Gyhx7oj@google.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
 <20240904043104.1030257-2-dmitry.torokhov@gmail.com>
 <47ea20d8-444b-4c72-97d3-b04a6918b121@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47ea20d8-444b-4c72-97d3-b04a6918b121@baylibre.com>

On Wed, Nov 20, 2024 at 12:33:36PM -0600, David Lechner wrote:
> On 9/3/24 11:30 PM, Dmitry Torokhov wrote:
> > Using guard notation makes the code more compact and error handling
> > more robust by ensuring that mutexes are released in all code paths
> > when control leaves critical section.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/joystick/db9.c | 30 ++++++++++++++----------------
> >  1 file changed, 14 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/db9.c b/drivers/input/joystick/db9.c
> > index 682a29c27832..7ac0cfc3e786 100644
> > --- a/drivers/input/joystick/db9.c
> > +++ b/drivers/input/joystick/db9.c
> > @@ -505,24 +505,22 @@ static int db9_open(struct input_dev *dev)
> >  {
> >  	struct db9 *db9 = input_get_drvdata(dev);
> >  	struct parport *port = db9->pd->port;
> > -	int err;
> >  
> > -	err = mutex_lock_interruptible(&db9->mutex);
> > -	if (err)
> > -		return err;
> > -
> > -	if (!db9->used++) {
> > -		parport_claim(db9->pd);
> > -		parport_write_data(port, 0xff);
> > -		if (db9_modes[db9->mode].reverse) {
> > -			parport_data_reverse(port);
> > -			parport_write_control(port, DB9_NORMAL);
> > +	scoped_guard(mutex_intr, &db9->mutex) {
> > +		if (!db9->used++) {
> > +			parport_claim(db9->pd);
> > +			parport_write_data(port, 0xff);
> > +			if (db9_modes[db9->mode].reverse) {
> > +				parport_data_reverse(port);
> > +				parport_write_control(port, DB9_NORMAL);
> > +			}
> > +			mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
> >  		}
> > -		mod_timer(&db9->timer, jiffies + DB9_REFRESH_TIME);
> > +
> > +		return 0;
> >  	}
> >  
> > -	mutex_unlock(&db9->mutex);
> > -	return 0;
> > +	return -EINTR;
> 
> This patch and any others like it are potentially introducing a bug.
> 
> From inspecting the source code, it looks like
> mutex_lock_interruptible() can return -EINTR, -EALREADY, or -EDEADLK.
> 
> Before this patch, the return value of mutex_lock_interruptible() was
> passed to the caller. Now, the return value is reduced to pass/fail
> and only -EINTR is returned on failure when the reason could have
> been something else.

It is documented that mutex_lock_interruptible() only returns 0 or
-EINTR. These additional errors only returned from __mutex_lock_common()
for WW mutexes.

If there is another form of scoped_cond_guard() that would make
available error code returned by the constructor of the locking
primitive we can switch to it later.

Thanks.

-- 
Dmitry

