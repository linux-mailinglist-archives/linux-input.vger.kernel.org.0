Return-Path: <linux-input+bounces-6184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF996C656
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 20:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECA08B2120E
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 18:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733191E4102;
	Wed,  4 Sep 2024 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHs+raD6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DDF1E2038;
	Wed,  4 Sep 2024 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474400; cv=none; b=INLoQUpukcWv61GWnuPPCKz2Y4ZC6KJyhMTfKNg3a+k8cyKjKpwQHTZHGc9YzaouuCZ7NyZDpjXG4Rd+KUyoEKi3fnCz6Hpr+1yzGF8E+adMf7G+l6mRmnWiqunkGz18Wsv0nkLKZ2uVGY4g/XhqO9CKHHoQlf5MJ2Q5scegcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474400; c=relaxed/simple;
	bh=GRVB4ylcgg9/mUay2Pdg3NlO34qQWNs04a3WzAiGaqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biFKxC9jC12lz8wDIdsARBS7VIyWF3qcgmXiTocFoNNv/3eAJjc9A5isbeP64Tdie/bYRMcU6sn9J4ykqsiesfj22JILFJXdIyvY07qJPhIgLn4QB6Vmk11nTaU2Mr5b+1iaaliCmoqxtYZHeaczLXctepX3wcUZuM5SiY24IGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHs+raD6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc47abc040so10602905ad.0;
        Wed, 04 Sep 2024 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725474397; x=1726079197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jgZYNzspFcELq8lqrXQjZlP6MoRXoKnJTcdyEPkFWpw=;
        b=VHs+raD6oA1oir3B+0ChIU1/QktSX9pGhcNExygIjYCsrbi68SZ8U6ynbR5rfHIwKy
         coNeRdWbtSOwvsTEAlrHhGUVnMh8/jkYuFGEhwfYCQbBrQgLbFylTqoey1H6AfFuesyi
         xQtKythr6rRprn5G0++EXW65RMbXvI7qeCAOjENjYAdP9d/um45ykbVX7WMcehKe6zds
         qpm3KLBxkgHXkDrwFUWUsiBlWPZSlpSMMc8k0fME/7G1d11pLF99IDQQtJSBWhTnqQAq
         d2xA+5Y02uNXRv4TntjpnqCySaRV9CjDFx6CmKHxchGQg7z1yqaVYZnpEpxDS4l/Nep/
         QeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474397; x=1726079197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgZYNzspFcELq8lqrXQjZlP6MoRXoKnJTcdyEPkFWpw=;
        b=FsGH3FYTbKGynEcwsrra/GMCTRKGef12NDEZitFXxYiVWx4wqLZs6z5ZYZkmLW4Zl0
         z2J8l8mriQRzhDF7DMFXv5Z0tAQWpoq5rFZWLpprZEwUNzm2bIZVmecpsw+DuMsgGQoR
         y8DseTIC6K6UyvzTf/CY+/7LtSwmAZCTPjixWE67oxIqN10gA/m6UD0sag7OF2str9qA
         UrzNTV72nBfJ8jWTjlLRJPszFSBAx5YJvsQnvINT3gfYWw8To7+Kz0Jh1dNeJPyAHKk8
         Nrq15LbsczxG8oyTmfxUlvozBxAHarpSrlXZTtOwd+nr0a3LiiszoBotT24oCvHiRAah
         cAnw==
X-Forwarded-Encrypted: i=1; AJvYcCUEucuikL5K5DZmwmcsTGVPm6jFQZNOniKLS7XZa5kn9ZsP3kPIaNId2bjIlWNfRrtGg1SgrbZEUACv67c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PUxZAkKZoXs5yjIvOWt7VkjvE7jYsptAnrC6U5IjevzIyNat
	+y6TdWvvow+yYUCkVCBg7U39TRXLFnZ6FWPHi4Nj1jAOL0Xff3crKHB0Gg==
X-Google-Smtp-Source: AGHT+IHyqsHu7gTH+49N6dlB7DNHAffBIynL/J6yUYRsGbKfEssD4oWoHtJH/E49IvUEOhV6f37DNw==
X-Received: by 2002:a17:902:d4cc:b0:205:701b:22be with SMTP id d9443c01a7336-205701b23e1mr125386045ad.56.1725474396832;
        Wed, 04 Sep 2024 11:26:36 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea534cbsm16363745ad.187.2024.09.04.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:26:36 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:26:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
Message-ID: <ZtimWmQ2B_WlcvTw@google.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
 <f0956e79-8261-4bd5-96ca-3795bbe1faaf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0956e79-8261-4bd5-96ca-3795bbe1faaf@gmail.com>

On Wed, Sep 04, 2024 at 12:50:44PM +0200, Javier Carrasco wrote:
> Hi Dmitry,
> 
> On 04/09/2024 06:48, Dmitry Torokhov wrote:
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
> 
> ...
> 
> > @@ -2818,9 +2813,9 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
> >  				 int reg_grp_index)
> >  {
> >  	struct i2c_client *client = iqs7222->client;
> > -	struct fwnode_handle *reg_grp_node;
> >  	int error;
> >  
> 
> Nit: reg_grp_node could stay at the top (where it used to be), as you
> are assigning it to NULL because there are no sensible assignments at
> this point.
> 
> > +	struct fwnode_handle *reg_grp_node __free(fwnode_handle) = NULL;
> >  	if (iqs7222_reg_grp_names[reg_grp]) {
> >  		char reg_grp_name[16];

I think this follows Linus' guidance (in spirit) to combine declaration
and initialization for objects using __cleanup(). If it was Rust I'd
written it as

	let reg_grp_node = if let Some(...) { ... } else { ... };

so declaration and initialization would be the same, but with C this is
the closest I could come up with.

Thanks.

-- 
Dmitry

