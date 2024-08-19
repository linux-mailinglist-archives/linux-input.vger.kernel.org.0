Return-Path: <linux-input+bounces-5672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D7956DCA
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A861F22046
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58551173347;
	Mon, 19 Aug 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGgJdoJB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15616A92B;
	Mon, 19 Aug 2024 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078827; cv=none; b=kD7ofALAGpLX5IpaPyC08PU202geavbYvjXX9V1O5QefFGK6rE50FKakQ+gsyP7gQmL3EhzkWVlxt6O83hMnjeMMxFS+QB+crWXb2yCM0tABla7U4/l4hTRZH0wP/Mp5QYZby3/JGwJw8jtUJZmOAzHMG+xdNMy/Ji4TPPm76n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078827; c=relaxed/simple;
	bh=tcDn4VkGCIffVpO9LcLKalO7ETRk0IZwLygamxw+b58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrRLJeE4gnX3+p5mQ5ENSgvCxENXp4M5upD0etCXGHoPzrwPBwGam14/ecPoVoaBcCbUOyZsBhcZPWxiXB754oqZY5mA/q/U+I0gdSR5HDS9QJ/8Qayq3S+ucbv+deg10UPatUEqESZ9RDnhyvZmtoKMBfVQSEhJrM2KsNH3fTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGgJdoJB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso3672880b3a.0;
        Mon, 19 Aug 2024 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724078825; x=1724683625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgIQHKvxINV8ovUdofvk90SRsFNtQrsv8SYAZXy1GIw=;
        b=MGgJdoJBr5YiND5cbXiIIdwrLYppJ9Oj3F5r/awTD6M3xOyJPVqZgbHTDD8jvMhvo2
         WdoHU4GK42p2P64Nj3YJSJs2skbYGvV8xmwKuNOZl11NU+m1dQak2wtOnoVZxHCPj+Kz
         F+KNejwQOSg7u3qutCQWoxzwfwxtGPEl8n2m7RZ3tFMxwquGQQ3RsjxWCJKgUxPjU9rO
         jHTdbIjthOY2omGS9XDWjIcedxymMb/pZbgLzuhOACWx/NCnd6q+FORZKrH6HvxoSGju
         6lEVCmhcvdGBxMukv+cVZO2XjebJUrq2b6Kgy2IUmIjbg1QHSD0WlemiyB6H4q3Z7DEm
         y/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724078825; x=1724683625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgIQHKvxINV8ovUdofvk90SRsFNtQrsv8SYAZXy1GIw=;
        b=EjbDV51ZBJBuUYg8tEL/qxn0Dv+FzacXikcjreesfbMN/9tYeOXsDn5pCMmqXxRsVl
         7pFIbBQ95a4KwQ8Y35y9eZbkdAUg6zRUCdlFvuIypd8VQh2cW0AofQxPaEFV2R+NFQ1N
         a+Nk1UoBPpFSxEVGNMbjXfNNlKK4op5CSNsqwq7ZQ7jeMvU98J1/TI1S4fVJ8zz8tSE1
         A4VRt8bHNIfVEOvHm2dJzAYuwP+63glLhJGFmX361gBCK+lmdpfV3klQwXMPGncUnpI5
         Bjo+31spG1MM8Lc8jFeA912mVPu0GwSi1XwBDkekwI3irvO8CPwOa/hNEgy4k073YP/g
         IQag==
X-Forwarded-Encrypted: i=1; AJvYcCUdGO99mnHxg+mFX/hh5rTBY6t8RNTn403gxlKWqd57PpeEZQoNZ1miVGblOgr2vvv9lDNgYv54B1Dz/hXvw2GvAde60QNIBF8iy2hcFReMLWFsktq2V4Jdf8vAta8zVs+Gg2zLaBP/I+lhwyCUHq72C9mBWM7EDY6fGetXPC/F4/CbDDhjPl0En9Arg2ZI0ftTiHGXl7gLTrBdVyyu0IVpZwFnHxBiopU=
X-Gm-Message-State: AOJu0YzFqVU8b4lJzig//gP3d94vdR00jYm+cM0Pe025Cs46XZ/dht5H
	Ymr2cynjbq5qKFVr7JsZ1r66YqFVeCq+fyFtCnGImwBnECLgkYFH
X-Google-Smtp-Source: AGHT+IGrCgLg0GXxkzDgwGDOBKGFKORKGgvOeeHFPa54by/bTROcalylrW+u03hvlcCh5NVWpjksHQ==
X-Received: by 2002:a05:6a20:c90e:b0:1c4:c305:121c with SMTP id adf61e73a8af0-1c9050261edmr14517485637.42.1724078824487;
        Mon, 19 Aug 2024 07:47:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af16628sm6884782b3a.144.2024.08.19.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:47:04 -0700 (PDT)
Date: Mon, 19 Aug 2024 07:47:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 05/14] Input: samsung-keypad - use devm to disable
 runtime PM
Message-ID: <ZsNa5SmDyrAo_MXq@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-6-dmitry.torokhov@gmail.com>
 <bkkh2as5v44nldhpnmswt7pssiude6ddci7v5nvzqhba6xxbnj@veoftlgrhu6p>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bkkh2as5v44nldhpnmswt7pssiude6ddci7v5nvzqhba6xxbnj@veoftlgrhu6p>

On Mon, Aug 19, 2024 at 02:54:39PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 18, 2024 at 09:58:02PM -0700, Dmitry Torokhov wrote:
> > To make sure that runtime PM is disabled at the right time relative
> > to all other devm-managed resources use devm_add_action_or_reset()
> > to register a handler that will disable it.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/keyboard/samsung-keypad.c | 24 +++++++++++++-----------
> >  1 file changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
> > index 7adcd2657bca..924327de4d8f 100644
> > --- a/drivers/input/keyboard/samsung-keypad.c
> > +++ b/drivers/input/keyboard/samsung-keypad.c
> > @@ -310,6 +310,13 @@ samsung_keypad_parse_dt(struct device *dev)
> >  }
> >  #endif
> >  
> > +static void samsung_disable_runtime_pm(void *data)
> > +{
> > +	struct samsung_keypad *keypad = data;
> > +
> > +	pm_runtime_disable(&keypad->pdev->dev);
> > +}
> > +
> >  static int samsung_keypad_probe(struct platform_device *pdev)
> >  {
> >  	const struct samsung_keypad_platdata *pdata;
> > @@ -420,11 +427,16 @@ static int samsung_keypad_probe(struct platform_device *pdev)
> >  
> >  	device_init_wakeup(&pdev->dev, pdata->wakeup);
> >  	platform_set_drvdata(pdev, keypad);
> > +
> >  	pm_runtime_enable(&pdev->dev);
> > +	error = devm_add_action_or_reset(&pdev->dev, samsung_disable_runtime_pm,
> > +					 keypad);
> > +	if (error)
> > +		return error;
> 
> I think you are open-coding devm_pm_runtime_enable().

Ah, I didn't realize we had it. Thanks!

-- 
Dmitry

