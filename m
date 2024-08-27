Return-Path: <linux-input+bounces-5909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE568961602
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 19:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECA581C23473
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 17:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711451D1F7D;
	Tue, 27 Aug 2024 17:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBpAz1LH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66711DDF5;
	Tue, 27 Aug 2024 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781224; cv=none; b=J+4f3S96hhCjxIYUnge9y/DVnbSVKlisPUXqBqBw7t3HQ5OUIxRvzJKX2/20/6a1wakeHobWV/4Fp2Fe0H4grvaQU5CeFPZPPl3jWgbDHusQoYg2F+k1zbq4E8++0kms+tXXrZaZqsDTsiP/K/zdaqNC22o+TTZJk2dBYDu9H1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781224; c=relaxed/simple;
	bh=Pg+Vim1QiXzWh8/BMjD6NlHKV5Iur9ofBdvIJuJxl3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVWlksw3VAlEvKRCn0hVQcB2uMA9NYFAJNpdE3HNQYsaJsLA18tgmsFhsj3O2AfZzbqbnmGgSvwwJOOI+i677MXVDdy37/hjcnrz1kgcS6xprk8ljEhPomKLMSzripEmNGqamzAaa5qCbs+53wR/TTS38oUv8le4DXHr4HioVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBpAz1LH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2021c03c13aso43803245ad.1;
        Tue, 27 Aug 2024 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781222; x=1725386022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Bj8+gj6V7QKP757UhUX/hVK4+17oTWH2dqfcY/VtkE=;
        b=fBpAz1LHoB820UUmcrxKEmyq06NXnHUsO+ovuIst36RT3kOlwBwOJ2ySMCe403Q/ND
         4uRs0fO9mREKoQexV/OMCviQ1fe36jIZQqbjb3q2E4t4ckuQ6qKSS9IB5pAvmnyCVTE8
         7vJ+ZHywSN7TYdUX5bJdt2wqilZfp68oMkjiNRsRv3fcswrZKe2IwCy07COap0lMK8SU
         bfO4nLoqpIXDT72mvhK3434Q5IVE1Gnm4GJCRaUeNwSDtSmbGMNFazrjGer8bY8olLQn
         EwopfzQyCsy70YrwiUJWttNSxpYW+6vFb5dL2BWBcaJTOQEsadJNRxv64S9hkCvPZYIV
         qpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781222; x=1725386022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Bj8+gj6V7QKP757UhUX/hVK4+17oTWH2dqfcY/VtkE=;
        b=kEcWnalCIN7PLpxDv/LA/oV93VwodQqXgCh02adrvqTaOKiJG47C7+yLZgZ2CfRP7Z
         SHfivycB4kihcNdbgXJ1aPgBWE6Xcq/XGlYobnkLbGcqO53l0sBsSjeefl707gAx6fsp
         mz305qmEPruu1kFkRyL0jNhOtth8/pX6Sv+DBzzas4ARVYWHXY3GZhW7Z/tla5yeJlYM
         V8oTHqzhJ7M75aNkgOsA82V/prDItfc9GFTtpKIPBK/VfvIGso7TLYgIZkWAte6qDOYO
         5jZIrZGy94t4rY9o0dqAXP0wwbwWLneC3y3Cia8h3OGRti9u+Z2SICyuiS5z3fpim/bJ
         5JPg==
X-Forwarded-Encrypted: i=1; AJvYcCUX4d8/8Ze0SI9YV/AcTf3W/SwdDCmtTj28frl2KkA3vYOeJbalg8KjaNgDKak5XiEBDAi/ldH6W+flvC0=@vger.kernel.org, AJvYcCVQThLWvIAWX+pcRwm1ItNFivBj+/cmrzA2RpSJUSukBoFPV8n9kquXJE6l38bHJN13iPy+IX7vKJgknzOa@vger.kernel.org, AJvYcCVplmv3hkFDog5HGBmwcR2+ce/nXqhidGRYkj622L5Sdlo2YkyUlZx/4wKoKxY76T+kx353YQ9SFWsvaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHYJk9d68NEONt9kLz/GBa7lS5Bvu2tCHtTPYqZcNf2PadKL2s
	8IRhEW/B08NToJlNVduo3ISU4UXaGr4dvMaI+oeOejenp3OXjuCN
X-Google-Smtp-Source: AGHT+IECPfsn+6jxJiuztxOP2GHxu8eXCDY1P6kLy7/kvpDBEBTCKluS4djYvCsE00HFkMkcybHT2Q==
X-Received: by 2002:a17:903:2452:b0:202:3617:d52a with SMTP id d9443c01a7336-204f6793a0emr315175ad.6.1724781221860;
        Tue, 27 Aug 2024 10:53:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:95c4:e75d:161d:a90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385580d38sm85877375ad.93.2024.08.27.10.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 10:53:41 -0700 (PDT)
Date: Tue, 27 Aug 2024 10:53:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
Message-ID: <Zs4SovPgLmlrVOJr@google.com>
References: <20240731201407.1838385-6-robh@kernel.org>
 <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
 <Zs3yfc1pJDkAwhzc@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zs3yfc1pJDkAwhzc@google.com>

On Tue, Aug 27, 2024 at 08:36:29AM -0700, Dmitry Torokhov wrote:
> On Tue, Aug 27, 2024 at 04:23:48PM +0200, Thierry Reding wrote:
> > On Wed, Jul 31, 2024 at 02:14:01PM GMT, Rob Herring (Arm) wrote:
> > > There's no need to get the length of an DT array property before
> > > parsing the array. of_property_read_variable_u32_array() takes a
> > > minimum and maximum length and returns the actual length (or error
> > > code).
> > > 
> > > This is part of a larger effort to remove callers of of_get_property()
> > > and similar functions. of_get_property() leaks the DT property data
> > > pointer which is a problem for dynamically allocated nodes which may
> > > be freed.
> > > ---
> > >  drivers/input/keyboard/tegra-kbc.c | 72 +++++++++++-------------------
> > >  1 file changed, 27 insertions(+), 45 deletions(-)
> > > 
> > > diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> > > index a1765ed8c825..53f39fc155ea 100644
> > > --- a/drivers/input/keyboard/tegra-kbc.c
> > > +++ b/drivers/input/keyboard/tegra-kbc.c
> > > @@ -491,12 +491,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> > >  	struct device_node *np = kbc->dev->of_node;
> > >  	u32 prop;
> > >  	int i;
> > > -	u32 num_rows = 0;
> > > -	u32 num_cols = 0;
> > > +	int num_rows;
> > > +	int num_cols;
> > >  	u32 cols_cfg[KBC_MAX_GPIO];
> > >  	u32 rows_cfg[KBC_MAX_GPIO];
> > > -	int proplen;
> > > -	int ret;
> > >  
> > >  	if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
> > >  		kbc->debounce_cnt = prop;
> > > @@ -510,56 +508,23 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> > >  	    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
> > >  		kbc->wakeup = true;
> > >  
> > > -	if (!of_get_property(np, "nvidia,kbc-row-pins", &proplen)) {
> > > -		dev_err(kbc->dev, "property nvidia,kbc-row-pins not found\n");
> > > -		return -ENOENT;
> > > -	}
> > > -	num_rows = proplen / sizeof(u32);
> > > -
> > > -	if (!of_get_property(np, "nvidia,kbc-col-pins", &proplen)) {
> > > -		dev_err(kbc->dev, "property nvidia,kbc-col-pins not found\n");
> > > -		return -ENOENT;
> > > -	}
> > > -	num_cols = proplen / sizeof(u32);
> > > -
> > > -	if (num_rows > kbc->hw_support->max_rows) {
> > > -		dev_err(kbc->dev,
> > > -			"Number of rows is more than supported by hardware\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	if (num_cols > kbc->hw_support->max_columns) {
> > > -		dev_err(kbc->dev,
> > > -			"Number of cols is more than supported by hardware\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	if (!of_get_property(np, "linux,keymap", &proplen)) {
> > > +	if (!of_property_present(np, "linux,keymap")) {
> > >  		dev_err(kbc->dev, "property linux,keymap not found\n");
> > >  		return -ENOENT;
> > >  	}
> > >  
> > > -	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> > > -		dev_err(kbc->dev,
> > > -			"keypad rows/columns not properly specified\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > >  	/* Set all pins as non-configured */
> > >  	for (i = 0; i < kbc->num_rows_and_columns; i++)
> > >  		kbc->pin_cfg[i].type = PIN_CFG_IGNORE;
> > >  
> > > -	ret = of_property_read_u32_array(np, "nvidia,kbc-row-pins",
> > > -				rows_cfg, num_rows);
> > > -	if (ret < 0) {
> > > +	num_rows = of_property_read_variable_u32_array(np, "nvidia,kbc-row-pins",
> > > +				rows_cfg, 1, KBC_MAX_GPIO);
> > > +	if (num_rows < 0) {
> > >  		dev_err(kbc->dev, "Rows configurations are not proper\n");
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	ret = of_property_read_u32_array(np, "nvidia,kbc-col-pins",
> > > -				cols_cfg, num_cols);
> > > -	if (ret < 0) {
> > > -		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > > +		return num_rows;
> > > +	} else if (num_rows > kbc->hw_support->max_rows) {
> > > +		dev_err(kbc->dev,
> > > +			"Number of rows is more than supported by hardware\n");
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > @@ -568,11 +533,28 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> > >  		kbc->pin_cfg[rows_cfg[i]].num = i;
> > >  	}
> > >  
> > > +	num_cols = of_property_read_variable_u32_array(np, "nvidia,kbc-col-pins",
> > > +				cols_cfg, 1, KBC_MAX_GPIO);
> > > +	if (num_cols < 0) {
> > > +		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > > +		return num_cols;
> > > +	} else if (num_cols > kbc->hw_support->max_columns) {
> > > +		dev_err(kbc->dev,
> > > +			"Number of cols is more than supported by hardware\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > >  	for (i = 0; i < num_cols; i++) {
> > >  		kbc->pin_cfg[cols_cfg[i]].type = PIN_CFG_COL;
> > >  		kbc->pin_cfg[cols_cfg[i]].num = i;
> > >  	}
> > >  
> > > +	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> > > +		dev_err(kbc->dev,
> > > +			"keypad rows/columns not properly specified\n");
> > > +		return -EINVAL;
> > > +	}
> > 
> > Previously we wouldn't try to initialize the columns when the
> > rows/columns were invalid, so this block could move before the last for
> > loop above.
> > 
> > But it doesn't really matter given that these are exceptions and really
> > shouldn't happen, so:
> > 
> > Acked-by: Thierry Reding <treding@nvidia.com>
> 
> I don't quite like of_property_read_variable_u32_array() because it is
> OF-specific. device_property_count_u32() will return the number of
> elements in an array. But I guess this driver will only be used on an OF
> system... 
> 
> Applied, thank you.

Oh, wait, can I get your SOB please?

-- 
Dmitry

