Return-Path: <linux-input+bounces-6333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A092D970B43
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 03:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E3FDB20CA3
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 01:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC9EC156;
	Mon,  9 Sep 2024 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeGIbf/a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6423617BAF;
	Mon,  9 Sep 2024 01:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725845666; cv=none; b=SuZB3UwJzl7WrLRsFWL8ZFhA4Wru2Dj+lLak1fUakto7u556dNgsmMivfB/eM9iw8bNLX1fdejpbyANUg8lCEk7Vt+OOSCXYnYNjdkyObL+ZEL257xPdAAiI+ii72Vq5QY688AGCUX0bR0fFVMy9lpJbIYWMfTkOZeWVBTwh+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725845666; c=relaxed/simple;
	bh=XvDIra9pB5f3TU2zneiyVuV/yGokHJjdkaUWMgFjGV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7PcqIKHJlC3we4WKygq99TsguFjof0JrskshpURTsiZ2uZGfmfxsrFoxzSe3eeR5thrn62Z+ezTh8c9Q4bMBBC/hs9l/0r02sc8eTwl7tinu6+tkbpwfOAvzy/IlTm48jaIgU+zD/Rjb6SHsyBApMV600eM2HKAH/1awTAhGaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeGIbf/a; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d87176316eso3423562a91.0;
        Sun, 08 Sep 2024 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725845665; x=1726450465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7W2zBLYt9fnaVSezdXrLCnx8e6dUclGBys6MZN+Qx/s=;
        b=EeGIbf/aDWztRuNrUy+FFxmycouCG51me6NqqbCdaplATkYlJuMNMp9xhIkQfKN361
         RnBxeQmGyhrRI0lkAeh8H9mNtK53WvoZQWM4b/3ERyjyjh0jE41inXrUJeEtfWlaT+IF
         2u2lCeXAGnG+hhmS4DMoaeWkeaUDpDhVNJMX4KvXTm54smlA4ogAJdEsnl6LssEHB6s0
         9e997J7e9/UnPTHA8SPkTU7Sgml/3v4ndphGZz160IEnusDWYFMsduBbA04jVtaTQ9u5
         VEm1WTRJprK3C9TXEjQRo04L9X/QV8t0c49+eC6ZvyEWpiIqLi7jdNOFXuZJ0SItAGy1
         UbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725845665; x=1726450465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W2zBLYt9fnaVSezdXrLCnx8e6dUclGBys6MZN+Qx/s=;
        b=LF3+I3CghBdmjJcv0Z13RXAa15C9NpejtLdz6txQwS5gAO4E6dyl3qV5MEcxbTlcVv
         AM8/kYyrYOdoxzp606ae4pavOvmnVGD4V3aiLd1/vQQgAjQOj4xERBb9KupLsYxsd0kL
         kTwmjdcYfsk6b+q/N+FmFiHjguWck0f4818umqj5kgddMyuYx1si4yq3xi7/bAS8RPCJ
         SRjmTRRCRepkH701fsb8h+bOpZ+70dKmJO/oE1euFYBVxv9GDOEazj6pf5BnwKF4Qa32
         pMA+81EZCm4XUMJhpHykGeQIcae42fgCTCGBmSlH/2mlFC93c/oT87AgF5Z9G6kgrmpH
         Hv9A==
X-Forwarded-Encrypted: i=1; AJvYcCW35VaHv0ucMh2jNjpGdbP6Y9VNEOh0/LrlWAcRv+2n3PrutB/5uxoEEjWZUXE+zI6vbZVD/1WZXKCwj+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqBgjGJKnlna6UWI6szkOOLai5qjEB33NVYdS6QaAGPup5jsi+
	trTyDUvIE0oOUPwU3sfzojpj9jd72GMoPl2epJlSORUjmrFxTDwt
X-Google-Smtp-Source: AGHT+IFM9bD6v0D1u75QP30Eno60Hv9Ae+0JzFw21ZrhOw+rKyC4uIB6TTZRwgJhfhODbi4u6ffdcA==
X-Received: by 2002:a17:90b:4a83:b0:2d8:d096:3005 with SMTP id 98e67ed59e1d1-2da8eceed2cmr25374791a91.9.1725845664529;
        Sun, 08 Sep 2024 18:34:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:33:e151:4d73:1aa7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d823736208sm2881949a12.19.2024.09.08.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 18:34:24 -0700 (PDT)
Date: Sun, 8 Sep 2024 18:34:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
Message-ID: <Zt5QnS_eM9xt8XNa@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
 <Zt49WnZBar2D822M@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt49WnZBar2D822M@nixie71>

Hi Jeff,

On Sun, Sep 08, 2024 at 07:12:10PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Tue, Sep 03, 2024 at 09:48:25PM -0700, Dmitry Torokhov wrote:
> > Use __free(fwnode_handle) cleanup facility to ensure that references to
> > acquired fwnodes are dropped at appropriate times automatically.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
> >  1 file changed, 14 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > index 9ca5a743f19f..d9b87606ff7a 100644
> > --- a/drivers/input/misc/iqs7222.c
> > +++ b/drivers/input/misc/iqs7222.c
> > @@ -2385,9 +2385,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  	for (i = 0; i < ARRAY_SIZE(iqs7222_kp_events); i++) {
> >  		const char *event_name = iqs7222_kp_events[i].name;
> >  		u16 event_enable = iqs7222_kp_events[i].enable;
> > -		struct fwnode_handle *event_node;
> >  
> > -		event_node = fwnode_get_named_child_node(chan_node, event_name);
> > +		struct fwnode_handle *event_node __free(fwnode_handle) =
> > +			fwnode_get_named_child_node(chan_node, event_name);
> 
> This leaves a newline amongst the declarations, but not in between the
> declarations and code. I don't feel strongly against this, but it's
> opposite of what I understand to be more common; please let me know in
> case I have misunderstood. This comment applies to the other chunks as
> well.

Right, so this is actually combining declaration and initialization case
that I mentioned in the other email, and it is closer in spirit to the
code and the allocation check below. That is why it is separated from
the declaration block.

Thanks.

-- 
Dmitry

