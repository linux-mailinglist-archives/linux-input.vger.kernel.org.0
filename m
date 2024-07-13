Return-Path: <linux-input+bounces-5019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 187EC9302AC
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 02:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFAD2283373
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 00:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBBFA41;
	Sat, 13 Jul 2024 00:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBuujuG8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A91370;
	Sat, 13 Jul 2024 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720829518; cv=none; b=kwPPGhj4/xvFC9lWVBa1cdLalop5Qf7yaLRdRck4gJkx2wlBYgA84S3mg2kdohu8zaGEsg9wGbpCSETfoOEADlJ+DhspZcAcZWs7E2ueJ0B51TMRSoaZloEk6rmgWnFovg/lFdbznGmj9Q/bql3fUwIY6RoAUsh0fMOnt1z4fqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720829518; c=relaxed/simple;
	bh=Phxk21ZRQHBWO8Fk+3b1KHjGX6RECntBicJRnbKr46U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQtGUBKy4GCxuronPYOoKcRE3BwWnCXelGwuDGq5Fz3JI6rGwXD6yFDGyUrTZhvCc7EeEkazJQvQvAYnLfWWkuB5S7uqGESijPZ0mPjFq/OUZW6/IIk/9o5Ejdwd3NI1k3vqrWvu3+QMJhIPHF0AnIoVoIUUaJG4Av3V7Nd9AhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBuujuG8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fbc09ef46aso21927715ad.3;
        Fri, 12 Jul 2024 17:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720829515; x=1721434315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pphgwh/0pG0XDQwktVo+yWTDf7IpCH6Ju6MKVkTgw=;
        b=VBuujuG8N1JVnx9IxJ8jlO1Nt/xp90u5pQ8ixkfNck87R0ulFix1sYrGIOe2paJuDa
         6OcI65ebydYKd8UQo+nBcdT1S3azrlX2N2IQwX2XspT3bfDqlGMGeXIE4oq9gRVPjYlw
         dhUxbK82VyehrFmdw1m1393/VjbVi4XuBGoR9pvUVVUUtmK7lXSoerbCfKjp/1FL7Ztg
         afkqJekrmF2CeB+ujIAK5agmyl70DgjgxsFsdfQb0wqBd8mN2T/94ArAAlEm6ubS9Ovn
         6vZ8GstyymVG5pWDotArReVBhUHWkXqWiA4ORT86btMx4X04htcBwVsMixxPeARzTRdv
         c/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720829515; x=1721434315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7pphgwh/0pG0XDQwktVo+yWTDf7IpCH6Ju6MKVkTgw=;
        b=Ue+OnmpIgEsUb1va9GrIZ2MCNmb4Y06OrqbfkjgB1gdkZgb/b8rxaLajZ3q67Nxk43
         cgHNm1RvGcy3FX2qQnJH2e1kQu1uFh09UzHMHQRfCKcnDr57F1oah26yJyo9OdKDsZMB
         ugB1uf7tqWOXoQg0f9zFgAp+B77O7R1ornGf46rfsU0aLYfUA1leE9C8nfjbySl0Jekd
         A4jt5p1zXZ7qKf+UvR4XeroWRtAV00uPU1fxPODyRO6KLFoznydENBrdsurRfOI8071Z
         c1QLtY1n3wd+SGj0jRwACcuw6YXAPeXC/CFXF2hhMNPlOfOls2cYTNbw7Hx7BuLq8E9I
         Gv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUb7zn6WnrISJCPPiA9YRQBld4x1o1HixonsEhMNovr9uCQCxBWp3f2orBuP2BduULDCMO4uOI0lARuQTwzjlqGz7heduTb3mL+ah7oupG99Xs6tGesLD2S45BijH7EPctWfNlbfD54OA=
X-Gm-Message-State: AOJu0YzzfjHG/+bSt1DC8vqDkvwuCeOsEveuqVDdIfxIwpE4pzNWJKv1
	EmIHIKi0x4RjvH4J1fngAmm/xckCTfCYbHjK0DP+Qb2SKufvwSt0
X-Google-Smtp-Source: AGHT+IEjh/xpVfdgoQwIz90ulydeyB6ybkbqta+ytUx2VzxoLaOfYGkrxLhV5izrDYes3VNsqaxoXg==
X-Received: by 2002:a17:90b:118:b0:2c4:dcf6:2130 with SMTP id 98e67ed59e1d1-2ca35d4b252mr10162252a91.32.1720829515082;
        Fri, 12 Jul 2024 17:11:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d5437sm20011a12.57.2024.07.12.17.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 17:11:54 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:11:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpHGSCzckXncmeRv@google.com>
References: <20240712224352.82190-1-Frank.Li@nxp.com>
 <ZpG2fNQ9-inLN8-Q@google.com>
 <ZpG5d1/EsOU4eJEj@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpG5d1/EsOU4eJEj@lizhi-Precision-Tower-5810>

On Fri, Jul 12, 2024 at 07:17:11PM -0400, Frank Li wrote:
> On Fri, Jul 12, 2024 at 04:04:28PM -0700, Dmitry Torokhov wrote:
> > Hi Frank,
> > 
> > On Fri, Jul 12, 2024 at 06:43:51PM -0400, Frank Li wrote:
> > > From: Jacky Bai <ping.bai@nxp.com>
> > > 
> > > Report input event directly on wakeup to ensure no press event is missed
> > > when resuming from suspend.
> > > 
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > > 
> > > diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > index 1d99206dd3a8b..9675717ecbdfe 100644
> > > --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
> > >  	int irq;
> > >  	int keycode;
> > >  	int keystate;  /* 1:pressed */
> > > +	bool suspended;
> > >  	struct timer_list check_timer;
> > >  	struct input_dev *input;
> > >  };
> > > @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> > >  {
> > >  	struct platform_device *pdev = dev_id;
> > >  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> > > +	struct input_dev *input = bbnsm->input;
> > >  	u32 event;
> > >  
> > >  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> > > @@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> > >  	mod_timer(&bbnsm->check_timer,
> > >  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> > >  
> > > +	/*
> > > +	 * Directly report key event after resume to make sure key press
> > > +	 * event is never missed.
> > > +	 */
> > 
> > How do you know that wakeup was caused by the key press on this device?
> > As far as I can see the driver requests the interrupt as shared, so we
> > could end up in bbnsm_pwrkey_interrupt() even if button was not pressed.
> > 
> 
> In bbnsm_pwrky_interrupt()
> {	...
> 	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);                                           
>         	if (!(event & BBNSM_BTN_OFF))                                                               
>                 	return IRQ_NONE;
> 
> 	...
> }
> 
> If wakeup was not caused by pwr key,  irq will do nothing, code will not
> reach to here.

OK, so the case you are trying to fix is when interrupt is delayed so
the key is either already released or it will be released by the time
the normal debouncing interval passes?

I think you want to reset ->suspended in the interrupt handler so that
this block fires at most once per suspend/resume cycle. And maybe move
it before calling mod_timer().

Thanks.

-- 
Dmitry

