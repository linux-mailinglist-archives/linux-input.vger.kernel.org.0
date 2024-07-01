Return-Path: <linux-input+bounces-4772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761BA91E54C
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 18:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B0228487B
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334FE16DC15;
	Mon,  1 Jul 2024 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md7NaaRh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3EB16DC0C;
	Mon,  1 Jul 2024 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851190; cv=none; b=ZLD6LoR1jjKDTgVjxkX0s+oEr9hth8GjmKKgJCjszWHfIz+vNRqyFpd+aWEbpoDVgIUStITNDDR4EB1jHCM3z8WgvNCYLM8Gw+9OLAVvYQDN69JsnXk1XbLYAESQTX7LucOpjladk7W1ODUVAs3ZcgXpem6qqLHqfw0TDhf05q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851190; c=relaxed/simple;
	bh=g62J3ghLSU83ZjRf8U9liODIDidlf4TTjuOEPWU5dSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwW9XIEkc2avo+czauVXfCNPi89wJr3M+6JbSPmXpvswtKSlOLxQGM/+8/CK3SzxV3lJDDaZdMZVAMBM8P4Aj1b2Yw6Lt4wF67flJp/o3bWqKZWIla8i0+n0vmfILCwqSBqxDMvjAkAXIoTyXgzmpWHDtdSY5oHXnZ25+S2pXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md7NaaRh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2056968b3a.3;
        Mon, 01 Jul 2024 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719851188; x=1720455988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTyWuWSkEHwzUBnhhxqdaCXPQrbnPURmhmOZGLjwIn0=;
        b=md7NaaRhwDwS/v/3zlycS+tjho3AyUZAb90kGy0py2L9EAWOBoQHPOScH2cJbCZTbK
         LRIqRM2KCRl+ndJlVGCVua4IGLaG+b10Ga8UtXMKz5IBovO+k0NH+pkTD3vfRyUQge7o
         cLkVBwO9oCF9qXMq+os56H/7h1nwN0whoa8NoJj2Q2bMfyvvxjnIDdI/Ahg56IBT1qK2
         i1XTMKpHkVawUlZb6isXT9WyMmHk6lKtvpe2S/k/3G3Zok2JfyuZGg3V7P9TFnV6V5C0
         4HqAbDMdFly34HifOSimnmBaTyX+b1hKL+JLqbisVSmnZL18danqaHIPbAcfGGGWCkfh
         JSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719851188; x=1720455988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTyWuWSkEHwzUBnhhxqdaCXPQrbnPURmhmOZGLjwIn0=;
        b=gdP1R+yn+mA/OMukqkdzbK5mCa8xfQ103C7EhXbDoWpfwHj0U97PseBzG8ouQ7Ln+p
         x9zxaDKyIX0ypzuALwD03r3DN/0hsP8d3pi7aUuhU5mKbvLmqCg2mdzg1EyDZ63oR1Q6
         fQ6u0C496U4VlAXzFJsikQzyxEhR+p/coPN+ocDqmqzACU9xVXLAZgIW2IViVULDbeRC
         mhdnUFDsC+OQETF/uRLvdRN9QGP1ZA2xthUlfoGnHRzl1X6susVs//f9y6Zqt2iq1VzB
         G+Bi5lG77eSgbL0SQTaVo3aTT8DefCKqY71r6Lyn0kMjYckdhfe0q40QRb8sequcBuI3
         tPsg==
X-Forwarded-Encrypted: i=1; AJvYcCXy8sPuHRovFtwz3hKy7WCOH7A18x4z/nJLF590VOvL24bKaiT9SWIendxsO9I5eubRMzsezeaWNCitBIbasTVe+SSMmGjT9jWRIrGN
X-Gm-Message-State: AOJu0YyjeIx0tFbQFpg/BrlMHkVdm8bzLLs8ZnvSoSUhM8ip/gfEgIxY
	S7dNfKVxeUVRAVQbjyfavkvkS0AKEhdceJ2Hy6Kfp0ZPb8CpW6M9
X-Google-Smtp-Source: AGHT+IFNGSk8O62VtGKVDTM/rBexHBJb0IVvaX8vlQDnRehXf7WcZziJ4uE46olL0j+CGyi7H90ePg==
X-Received: by 2002:a05:6a20:c113:b0:1be:bfd1:8272 with SMTP id adf61e73a8af0-1bef6283fd2mr4134972637.58.1719851187853;
        Mon, 01 Jul 2024 09:26:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1596d55sm66847915ad.277.2024.07.01.09.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:26:27 -0700 (PDT)
Date: Mon, 1 Jul 2024 09:26:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: make sure input handlers define only one
 processing method
Message-ID: <ZoLYscmmUR7Fu76F@google.com>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-2-dmitry.torokhov@gmail.com>
 <cg35cp36opttnr2jgsqda2gsgqdn6vplc2pq3n3of3e356igua@vei6pdsw25si>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cg35cp36opttnr2jgsqda2gsgqdn6vplc2pq3n3of3e356igua@vei6pdsw25si>

Hi Benjamin,

On Mon, Jul 01, 2024 at 09:36:08AM +0200, Benjamin Tissoires wrote:
> Hi Dmitry,
> 
> On Jun 30 2024, Dmitry Torokhov wrote:
> > Input core expects input handlers to be either filters, or regular
> > handlers, but not both. Additionally, for regular handlers it does
> > not make sense to define both single event method and batch method.
> > 
> > Refuse registering handler if it defines more than one method.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/input.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index fd4997ba263c..8434348faeac 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -2517,6 +2517,26 @@ void input_unregister_device(struct input_dev *dev)
> >  }
> >  EXPORT_SYMBOL(input_unregister_device);
> >  
> > +static int input_handler_check_methods(const struct input_handler *handler)
> > +{
> > +	int count = 0;
> > +
> > +	if (handler->filter)
> > +		count++;
> > +	if (handler->events)
> > +		count++;
> > +	if (handler->event)
> > +		count++;
> > +
> > +	if (count != 1) {
> 
> Am I missing some upstream commit? I have the following:

Thank you for the thorough review!

> 
> in drivers/input/evdev.c:
> 
> static struct input_handler evdev_handler = {
> 	.event		= evdev_event,
> 	.events		= evdev_events,
> 	.connect	= evdev_connect,
> 	.disconnect	= evdev_disconnect,
> 	.legacy_minors	= true,
> 	.minor		= EVDEV_MINOR_BASE,
> 	.name		= "evdev",
> 	.id_table	= evdev_ids,
> };
> 
> So here count should be 2 and evdev would be rejected?

Uh, it looks like I had a patch buried that removed evdev_event as not
needed - if a handler has ->events() then input core would favor it even
before my patches.

> 
> And in drivers/tty/serial/kgdboc.c:
> 
> static struct input_handler kgdboc_reset_handler = {
> 	.connect	= kgdboc_reset_connect,
> 	.disconnect	= kgdboc_reset_disconnect,
> 	.name		= "kgdboc_reset",
> 	.id_table	= kgdboc_reset_ids,
> };
> 
> here count would be 0 and kgdboc would also be rejected.

Yes, you are totally right. It looks like we need to allow the "no methods"
case.

> 
> I agree on the intent of the patch, but these couple of input handlers
> should be fixed if they are not already.

Yep, I will address your other comments and resend in a few.

Thanks again!

-- 
Dmitry

