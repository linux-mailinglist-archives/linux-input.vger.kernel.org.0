Return-Path: <linux-input+bounces-6332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C18E8970B3D
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 03:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D2C1F216B0
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 01:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0E1BA42;
	Mon,  9 Sep 2024 01:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyghEpJr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12712E75;
	Mon,  9 Sep 2024 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725845492; cv=none; b=qkCEun0OxviKdFyWrpjB43OoG6rTAe6zXpWBE3wW7SjD9jfInBEvjyXi+ttLh3ZIGYvZ9qPxY7vDaNOGa82MErk6WJSF02fqiQKXEvGU92kX/C5p1Hm/Hf8oGAN8TU5Tx6aoxSwrnSo89VmiJSPguHK9xjrNEQ/wn+B8+tMzYf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725845492; c=relaxed/simple;
	bh=bnaigO9qi7VOENv6qOORQzcdulMA57bYtrmKZ4ngcd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOTRcpBV/jSvml6+z2knt9rmukWgMbA9DfRRp6ZFlhPHgXvZ1lOGqbUGClI6LaAuCmJJJjK/bRDq2VR4jg9U2kvy8c6JY8MMbXZsUs+bv1QJmgBJnXxeclTPc4/Gxb0bEjuCwFM5jpHqxEMOZylyjLcF/+PvvmmGSdD8EubRgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyghEpJr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718816be6cbso2373841b3a.1;
        Sun, 08 Sep 2024 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725845490; x=1726450290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1G6NznUd8tvil9HDGLund5Jsk5xX7QfPpNeHwJyevK0=;
        b=RyghEpJrNRy7T34sxOg52dmpxkgTWis91SwEwFbiucuJP+yVMaUMlqEiBWpKfc2u1Z
         lKAmEjCtKqj/IAPAa9ckYdNXei+iq2uafF9ARoHnCDNCoHDpCgS1vryTXfDgVUnBQYKN
         sxiWw6WCCumQRgi+ExL+k35hIF7WZbJqt8+2cAoc7+Io42onrj4A0iaOu10VPhgcqWj4
         1aqGL1UwUpv5INVGhsbXUqNJHc8p3goprSzYkdsZI1pO7ntVLmFa77ASNMql5S9KTMcw
         HD0LQ2L9zYzmMpmF7nonnHMXNy/dDO/hJ9w6Tm6zhzhPd3zRQ1ac+DQL+o2aqCaK8tWt
         fRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725845490; x=1726450290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G6NznUd8tvil9HDGLund5Jsk5xX7QfPpNeHwJyevK0=;
        b=EAdi/8o01Yo3LP0lfR4u7PGeIIbRLcNC/PrHSc61KslwEXTQbrEMOnUGVGhshJX6ye
         B+8ksoygdEsBuhDjlFgoNpk9+xTdcH/sydd9YaOhKrd1QWanjXcamNtfHTqyV7X8G/tB
         ezduWjNP3KMidqIMisHDfJCUh8N6OwwxhByVQ4fv0DXyzs2AsaNLNKYNoIPNJLcj5wKq
         j0JYLl7Ak1oLVtiBBpsvE/XqfHGU8cwCKtbgBm/MGGknWLRoRnLT7oINtR/hJA0SCUvl
         2kuDtMQ0TFgzjotnX1ut2LMvxG7DRYletjBjy1ZMqckpddJ8+RSWWPMLEBOtV9U+8lN5
         03fA==
X-Forwarded-Encrypted: i=1; AJvYcCXQL8NvXG5BjkLdf66SkARFgZNjlpmV7lTMnoAwVDwyDQGSQ93ki9bDsVKo4LbongN9Nt4ZB0O6zWKudbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxb5YAiYiWO8toX7hradSTL2wItBHsoEr0WjJkw6e4PdxxcVD8
	sp1PInpcaXwFrWqHICDyu6IjjIVQE6jWP1sVPtdRrE6o8ec2nE5E
X-Google-Smtp-Source: AGHT+IF/SLy7Apo/hBUKShmEsPjroC+JII7bcD5FP5mFYDry9nFWsazgWO8Y8J1OoGV6bQhDDPkGlQ==
X-Received: by 2002:a05:6a00:1489:b0:717:9754:4ade with SMTP id d2e1a72fcca58-718e404ba42mr10020934b3a.22.1725845490222;
        Sun, 08 Sep 2024 18:31:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:33:e151:4d73:1aa7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e58cd003sm2529213b3a.73.2024.09.08.18.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 18:31:29 -0700 (PDT)
Date: Sun, 8 Sep 2024 18:31:26 -0700
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
Subject: Re: [PATCH 14/22] Input: iqs626a - use cleanup facility for fwnodes
Message-ID: <Zt5P7hlg-uhRHnCc@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
 <Zt47Ic059YbOSbGy@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt47Ic059YbOSbGy@nixie71>

Hi Jeff,

On Sun, Sep 08, 2024 at 07:02:41PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Tue, Sep 03, 2024 at 09:48:13PM -0700, Dmitry Torokhov wrote:
> > Use __free(fwnode_handle) cleanup facility to ensure that references to
> > acquired fwnodes are dropped at appropriate times automatically.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/iqs626a.c | 22 ++++++----------------
> >  1 file changed, 6 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> > index 0dab54d3a060..7a6e6927f331 100644
> > --- a/drivers/input/misc/iqs626a.c
> > +++ b/drivers/input/misc/iqs626a.c
> > @@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  {
> >  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
> >  	struct i2c_client *client = iqs626->client;
> > -	struct fwnode_handle *ev_node;
> >  	const char *ev_name;
> >  	u8 *thresh, *hyst;
> >  	unsigned int val;
> > @@ -501,6 +500,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  		if (!iqs626_channels[ch_id].events[i])
> >  			continue;
> >  
> > +		struct fwnode_handle *ev_node __free(fwnode_handle) = NULL;
> 
> This seems to deviate from what I understand to be a more conventional
> style of declaring variables at the top of the scope, and separate from
> actual code, like below:

This is follows Linus' guidance on combining declaration and
initialization for variables using __free() cleanup annotations (where
possible). These annotations are the reason for dropping
-Wdeclaration-after-statement from our makefiles. See b5ec6fd286df
("kbuild: Drop -Wdeclaration-after-statement") and discussion in
https://lore.kernel.org/all/CAHk-=wi-RyoUhbChiVaJZoZXheAwnJ7OO=Gxe85BkPAd93TwDA@mail.gmail.com

> 
> 
> 	for (i = 0; i < ARRAY_SIZE(iqs626_events); i++) {
> 		struct fwnode_handle *ev_node __free(fwnode_handle);
> 
> 		if (!iqs626_channels[ch_id].events[i])
> 			continue;

This will result in attempt to "put" a garbage pointer if we follow
"continue" code path. In general __free() pointers have to be
initialized, either to NULL or to a valid object (assuming that cleanup
function can deal with NULLs).

> 
> I also did not see any reason to explicitly declare the variable as NULL;
> let me know in case I have misunderstood.

See the above. Yes, in this particular case it will get a value in both
branches, but I feel it is too fragile and may get messed up if someone
refactors code.

> 
> >  		if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3) {
> >  			/*
> >  			 * Trackpad touch events are simply described under the
> > @@ -530,7 +530,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  					dev_err(&client->dev,
> >  						"Invalid input type: %u\n",
> >  						val);
> > -					fwnode_handle_put(ev_node);
> >  					return -EINVAL;
> >  				}
> >  
> > @@ -545,7 +544,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  				dev_err(&client->dev,
> >  					"Invalid %s channel hysteresis: %u\n",
> >  					fwnode_get_name(ch_node), val);
> > -				fwnode_handle_put(ev_node);
> >  				return -EINVAL;
> >  			}
> >  
> > @@ -566,7 +564,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  				dev_err(&client->dev,
> >  					"Invalid %s channel threshold: %u\n",
> >  					fwnode_get_name(ch_node), val);
> > -				fwnode_handle_put(ev_node);
> >  				return -EINVAL;
> >  			}
> >  
> > @@ -575,8 +572,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
> >  			else
> >  				*(thresh + iqs626_events[i].th_offs) = val;
> >  		}
> > -
> > -		fwnode_handle_put(ev_node);
> >  	}
> >  
> >  	return 0;
> > @@ -774,12 +769,12 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
> >  	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
> >  		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
> >  		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
> > -		struct fwnode_handle *tc_node;
> >  		char tc_name[10];
> >  
> >  		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
> >  
> > -		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
> > +		struct fwnode_handle *tc_node __free(fwnode_handle) =
> > +				fwnode_get_named_child_node(ch_node, tc_name);
> 
> Same here.

Yes, combining declaration and initialization is preferred for such
pointers.

Thanks.

-- 
Dmitry

