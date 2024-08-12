Return-Path: <linux-input+bounces-5526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849194F77A
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 21:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CC251C21B29
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 19:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5916F190079;
	Mon, 12 Aug 2024 19:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuNtdG58"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6118E02B;
	Mon, 12 Aug 2024 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723490813; cv=none; b=cW7q9GMdAUvtqWi00LQMJLC7ShmgYo2nzay1p+M3rs6WIstzMTIkK5ng7/vwmEbgawVnh0bcdsa+v1kWoz7JGvF+A5xLfK6HkZ1XAWcvbL/ys1BpuNML2fvjvRcE20/iVAqUwhC1GlOSyTLNbg4gN839txkyA8A/rB3E81s9+f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723490813; c=relaxed/simple;
	bh=uIJfRtWkFSCZfBqJXdbuS2aaiGoyAbZN9R9l1N3Q9pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktc7d6/NQsJCxBYZCgg5Wn7+gALtZSBopGfPylAYk8Ky0C/B4P5kOM5kerOUxUkyZPZr79zOjmuWKb4FG01huYA44PYcGZ6QB2yC81ay2DIUHPTWeIoCQN4SJ2/tCaBIcg6TP1EKQhSf1m5noNTuvbX3Wl4Jx4MrB9v5X4482TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuNtdG58; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fdd6d81812so46584815ad.1;
        Mon, 12 Aug 2024 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723490811; x=1724095611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DuuARyTjiTVjiG6wOVuFeasndbAWPj5DCbWrovI8x+A=;
        b=VuNtdG58WFlaSPNshvcm8HKcUZaSRcoYrGyKL5gkRw3iAfVygOcik5zxP9JuQeAO0s
         ROrtKGqJ9LvG2OvX5GnbIIzvWDup0U0+PaFG48uvEwi3ASF/4JKz8Txt4Idijm0/s0bh
         sO9cNAf7p3PTTTL0APyNo2k7RyIQgXnUJP4LZIG4xuS77ck7dvKvDhMC5UeNZZ3APGKF
         +1aBFxJUlCG3/GW+ax27DKGnZEZ+CUJm6vvvRFMGoKSAbUaIfcvVQ1DfbLju892cEANY
         8pbuHNopX4b4BhDyrTOmf28JEZ9Xbtjq0QHouNUBklAKlpEg2t+NdEiyEGagYsm4KZxP
         omXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723490811; x=1724095611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuuARyTjiTVjiG6wOVuFeasndbAWPj5DCbWrovI8x+A=;
        b=G3JR1n2GTJAHGnquE6gdgvNXvx0zOsy9OIDVIxt6zRECL2D1xcrrM35wl/wC1bdsZn
         a9ExxOKMaUwBYtFE4BzZH+jaVznN81b9OKZ5sIg0NDde9ffdAS8EYLBlpAmTIHhcTXOC
         AvLk9QElP4Ehdq7rnBUnlhOCSeh4TtPkQH6BNnhGWDV+ayp49hPk/vrPHwa4EXRmJj+3
         fF9OxRxdcHA9m57Lfap7dBdxIKNOirfFMk4eEtukv+7WxxYu9JkSf2JlJgb9g3JhY7cg
         txg6V1PzYCg6KRjaRBZe4fC/Gxs5fC9wYlRiz1/AqmciB1M9xcTpSpdDosKsHXczHcF/
         BvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvINqQO/JWkpHWaDUyYPoj9/7qSiGWXn4BhmxhstI4svPHlMnOX/sYhYLN+lSbxNz9jueJyr3XLXgbJ0RovS/W35gHCLO6tZQzNxU6s52iXGIpIqJSIxt297Egv/wP0gHh/gJ3GiY23NYwwKCbF22S15vzIzFVOXTi1tlfPDWYy7LVp8Ri9WTz
X-Gm-Message-State: AOJu0YzlDdSWdnK/uDwkNo0ZF3v4djuc31G49UplmOtI0RFEgXmDd8qU
	pW7GOBeePPkk5unCd3uAQ7lUpL8drPpDC68qgQdmMJ3IUj9qvn2p
X-Google-Smtp-Source: AGHT+IHtQ4ZYfCMXNguDgi4IMRivpGnLLphO2Un30od8V9AgdC3fZT7SxwTnsVEow9QhaZlftMhZkg==
X-Received: by 2002:a17:902:ec85:b0:1fb:9cbf:b4cd with SMTP id d9443c01a7336-201ca1d9297mr14329765ad.63.1723490810882;
        Mon, 12 Aug 2024 12:26:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1baf03sm389755ad.204.2024.08.12.12.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 12:26:50 -0700 (PDT)
Date: Mon, 12 Aug 2024 12:26:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>,
	Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <Zrph94r8haR_nbj7@google.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
 <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>

On Mon, Aug 12, 2024 at 08:18:24PM +0200, Hans de Goede wrote:
> Hi Dmitry,
> 
> On 8/12/24 7:24 PM, Dmitry Torokhov wrote:
> > On Mon, Aug 12, 2024 at 04:41:50PM +0200, Hans de Goede wrote:
> >> Hi Maxim,
> >>
> >> On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> >>> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
> >>>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> >>>>> That means, userspace is not filtering out events upon receiving
> >>>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> >>>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> >>>>> is weird. It maintains the touchpad state in firmware to light up the
> >>>>> status LED, but the firmware doesn't do the actual touchpad disablement.
> >>>>>
> >>>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
> >>>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> >>>>
> >>>> Ack.
> >>>>
> >>>> So how about this instead:
> >>>>
> >>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> >>>> index 1ace711f7442..b7fa06f793cb 100644
> >>>> --- a/drivers/platform/x86/ideapad-laptop.c
> >>>> +++ b/drivers/platform/x86/ideapad-laptop.c
> >>>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
> >>>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> >>>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> >>>>  	 */
> >>>> -	if (priv->features.ctrl_ps2_aux_port)
> >>>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
> >>>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> >>>>  
> >>>>  	/*
> >>>>
> >>>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> >>>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> >>>
> >>> *Maxim
> >>
> >> Oops, sorry.
> >>
> >>> Just a heads-up, my Z570 now belongs to a family member, we'll test what
> >>> you asked, but right now there is a btrfs corruption on that laptop that
> >>> we need to fix first, it interferes with kernel compilation =/
> >>
> >> Note as discussed in another part of the thread the original bug report
> >> actually was not on a Z570, so the whole usage of i8042_command() on
> >> suspend/resume was a bit of a red herring. And the suspend/resume issue
> >> has been fixed in another way in the mean time.
> >>
> >> So there really is no need to test this change anymore. At the moment
> >> there are no planned changes to ideapad-laptop related to this.
> > 
> > I think we still need to stop ideapad-laptop poking into 8042,
> > especially ahead of time.
> 
> I agree. I think your suggestion of using the new(ish) [un]inhibit
> support in the input subsystem for this instead of poking at the i8042
> is a good idea.
> 
> As I mentioned when you first suggested this, I guess this requires 2 things:
> 
> 1. Some helper to find the struct input_dev for the input_dev related
>    to the ps/2 aux port
> 2. In kernel API / functions to do inhibit/uninhibit
>    (maybe these already exist?)
> 
> > If we do not want to wait for userspace to
> > handle this properly, I wonder if we could not create an
> > input_handler that would attach to the touchpad device and filter out
> > all events coming from the touchpad if touchpad is supposed to be off.
> 
> I think using the inhibit stuff would be better no?

The issue with inhibit/uninhibit is that they are only exposed to
userpsace via sysfs. And as you mentioned we need to locate the input
device corresponding to the touchpad.

With input handler we are essentially getting both - psmouse does not do
anything special in inhibit so it is just the input core dropping
events, the same as with the filter handler, and we can use hanlder's
match table to limit it to the touchpad and input core will find the
device for us.

> 
> The biggest problems with trying to fix this are:
> 
> 1. Finding time to work on this
> 2. Finding someone willing to test the patches
> 
> Finding the time is going to be an issue for me since the i8042_command()
> calls are only still done on a single model laptop (using a DMI quirk)
> inside ideapad-laptop now, so this is pretty low priority IMHO. Which
> in practice means that I will simply never get around to this, sorry...

Yeah, I can see that ;) Maybe I will find a couple of hours to waste...

Thanks.

-- 
Dmitry

