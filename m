Return-Path: <linux-input+bounces-5906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 159329612EA
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 17:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2871F22967
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 15:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0DE1C6F51;
	Tue, 27 Aug 2024 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0KE2Ohb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37591C1723;
	Tue, 27 Aug 2024 15:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772995; cv=none; b=XuylMp94dKG/bUF2Fj5qVIyaYpMjATtsesgwteOvYdvV5PKrLxD6pB3F7R4TGtLnUbAGD6BhtOOUbzoKpPBWpg9R2krA30U8xNm+WUt2uARtqWa2rJSRU7i+cUBgrfMhZe+NKzFmKJwEJ2/cJyX97AgFbtgs3l65ZFv0ZPbHCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772995; c=relaxed/simple;
	bh=KYrMAoJCt+EV7WoaEnKxjVrsnUTS3xitiFfMxJQdzHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUVjGCZGedfIkIxeZAS+PXCIz7zeh1jpa0E38aPH09waB30shGjoFB5HULF2p+Tnoi9eP00FV35Ub+ukDLcs5LUjrVqYsloFFF2pVvoNAmxqQpc/Oq/T01s6qXchkjw0IhpiN4ACtlZ0T6sz7VVj6zkGtR9dbGw8ZiysNcssyZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0KE2Ohb; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-715c160e231so1006078b3a.0;
        Tue, 27 Aug 2024 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772993; x=1725377793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i06m+lajlNBP6LGt0oGGIooKzG4I9XsfXSKSmv9z5Nk=;
        b=P0KE2Ohb7LIvafcZLCw2FjbHH40MaXONqjohJRicSXYTWfBVixY6bjmYhp6qJD3XDS
         npn+r4/nh4jqdyIsVBm2oiisSFeTs2kBisEzgdih5EAXUPjANCmaykb1KWyoFOJwnm9e
         LM1qU5tekIaOb8Gjn6F6+Ak2eDGZUkq90iUxWXcohMelj23QUowtGGYon110f52DECDU
         T7kVCuZXHMNfEJdo986iJSCO1d5SXMT5HYBrQLrC42QDRqk3Osb+BddYsRiHzdt7KlXR
         PJYj/nHuteO4GBj9UtWu1LEr7l3Wc5FWGVwDaTNLGMhKK7pDCkgA0XajeWeoc6NCY1rC
         nCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772993; x=1725377793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i06m+lajlNBP6LGt0oGGIooKzG4I9XsfXSKSmv9z5Nk=;
        b=wR0Y+j51IgYEkCSDdJ9IU1SKWYav2nSzLB+zzAmtCBX34p+YFpi5ejII/n8H6w1GJV
         rgUE01V5ie8Lq/fEFMDsrtLbkBuhPUILw9u2pnnd3D6asAspT/oLUUovWk0A9YtiBNWn
         1Dq1DigFBuOv164z64jHbzzhPJawwfIOlUj6iy4geXx55/1b3qJbKvoXzEpmD4mqd+J1
         us8G/SMwBUqZmKhgisNB+a7ot+dgqzO2+k2djvIUsI+NN7TX9i9FIh0jSvKSPMJLdTjg
         JAJzRI+mmQRPsXSzBqvHLMTkawIwEc/cuTxux/wAn2A4KiVoEJkVYK5MYtOxJT0E3Nbb
         3keg==
X-Forwarded-Encrypted: i=1; AJvYcCU4Vc4IovNcCR7m9hK+Y6KvaLtninO5G1HuXV5oT6kkU0PUI1//playbWrhDYK20GNQHPVBkvJ2b7/CdiE=@vger.kernel.org, AJvYcCUy30W66Xz7rpEiZ4Fkn1uFA3XpkNVdaa1+RtHKrDTI0SasJC+RHM/d3XIy4KNwaIN0pd/Yxe+6GWNn4w==@vger.kernel.org, AJvYcCVdo6Igs1jLpYHN9iSALvOUkPVeMWeNiGLsh81VxgB+5i5ZskY9ppXtBs/LwqataFtwNXi6fhKFsb/PBkk4@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsGnzqeJHmED2c2KQg7phUbpkLK2AEodhSqYRAk3PCkI7YmzW
	7U2ev7H66Me8mrTu4ooeeGYfEtLQQ0JrNRRbwWY8Un+WMgr6n98F
X-Google-Smtp-Source: AGHT+IEvQGwNNvRjt/gQ3MweAjTwx8USmVtCznICoy0IzZHOhyJB9kgCfh6r6IN+M3mCARs4NX/0eA==
X-Received: by 2002:a05:6a21:3406:b0:1c4:2134:dd54 with SMTP id adf61e73a8af0-1cc8a079e5cmr15672790637.45.1724772992904;
        Tue, 27 Aug 2024 08:36:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715c49aa23dsm1267675b3a.5.2024.08.27.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:36:32 -0700 (PDT)
Date: Tue, 27 Aug 2024 08:36:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-input@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
Message-ID: <Zs3yfc1pJDkAwhzc@google.com>
References: <20240731201407.1838385-6-robh@kernel.org>
 <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>

On Tue, Aug 27, 2024 at 04:23:48PM +0200, Thierry Reding wrote:
> On Wed, Jul 31, 2024 at 02:14:01PM GMT, Rob Herring (Arm) wrote:
> > There's no need to get the length of an DT array property before
> > parsing the array. of_property_read_variable_u32_array() takes a
> > minimum and maximum length and returns the actual length (or error
> > code).
> > 
> > This is part of a larger effort to remove callers of of_get_property()
> > and similar functions. of_get_property() leaks the DT property data
> > pointer which is a problem for dynamically allocated nodes which may
> > be freed.
> > ---
> >  drivers/input/keyboard/tegra-kbc.c | 72 +++++++++++-------------------
> >  1 file changed, 27 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> > index a1765ed8c825..53f39fc155ea 100644
> > --- a/drivers/input/keyboard/tegra-kbc.c
> > +++ b/drivers/input/keyboard/tegra-kbc.c
> > @@ -491,12 +491,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> >  	struct device_node *np = kbc->dev->of_node;
> >  	u32 prop;
> >  	int i;
> > -	u32 num_rows = 0;
> > -	u32 num_cols = 0;
> > +	int num_rows;
> > +	int num_cols;
> >  	u32 cols_cfg[KBC_MAX_GPIO];
> >  	u32 rows_cfg[KBC_MAX_GPIO];
> > -	int proplen;
> > -	int ret;
> >  
> >  	if (!of_property_read_u32(np, "nvidia,debounce-delay-ms", &prop))
> >  		kbc->debounce_cnt = prop;
> > @@ -510,56 +508,23 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> >  	    of_property_read_bool(np, "nvidia,wakeup-source")) /* legacy */
> >  		kbc->wakeup = true;
> >  
> > -	if (!of_get_property(np, "nvidia,kbc-row-pins", &proplen)) {
> > -		dev_err(kbc->dev, "property nvidia,kbc-row-pins not found\n");
> > -		return -ENOENT;
> > -	}
> > -	num_rows = proplen / sizeof(u32);
> > -
> > -	if (!of_get_property(np, "nvidia,kbc-col-pins", &proplen)) {
> > -		dev_err(kbc->dev, "property nvidia,kbc-col-pins not found\n");
> > -		return -ENOENT;
> > -	}
> > -	num_cols = proplen / sizeof(u32);
> > -
> > -	if (num_rows > kbc->hw_support->max_rows) {
> > -		dev_err(kbc->dev,
> > -			"Number of rows is more than supported by hardware\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	if (num_cols > kbc->hw_support->max_columns) {
> > -		dev_err(kbc->dev,
> > -			"Number of cols is more than supported by hardware\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	if (!of_get_property(np, "linux,keymap", &proplen)) {
> > +	if (!of_property_present(np, "linux,keymap")) {
> >  		dev_err(kbc->dev, "property linux,keymap not found\n");
> >  		return -ENOENT;
> >  	}
> >  
> > -	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> > -		dev_err(kbc->dev,
> > -			"keypad rows/columns not properly specified\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	/* Set all pins as non-configured */
> >  	for (i = 0; i < kbc->num_rows_and_columns; i++)
> >  		kbc->pin_cfg[i].type = PIN_CFG_IGNORE;
> >  
> > -	ret = of_property_read_u32_array(np, "nvidia,kbc-row-pins",
> > -				rows_cfg, num_rows);
> > -	if (ret < 0) {
> > +	num_rows = of_property_read_variable_u32_array(np, "nvidia,kbc-row-pins",
> > +				rows_cfg, 1, KBC_MAX_GPIO);
> > +	if (num_rows < 0) {
> >  		dev_err(kbc->dev, "Rows configurations are not proper\n");
> > -		return -EINVAL;
> > -	}
> > -
> > -	ret = of_property_read_u32_array(np, "nvidia,kbc-col-pins",
> > -				cols_cfg, num_cols);
> > -	if (ret < 0) {
> > -		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > +		return num_rows;
> > +	} else if (num_rows > kbc->hw_support->max_rows) {
> > +		dev_err(kbc->dev,
> > +			"Number of rows is more than supported by hardware\n");
> >  		return -EINVAL;
> >  	}
> >  
> > @@ -568,11 +533,28 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
> >  		kbc->pin_cfg[rows_cfg[i]].num = i;
> >  	}
> >  
> > +	num_cols = of_property_read_variable_u32_array(np, "nvidia,kbc-col-pins",
> > +				cols_cfg, 1, KBC_MAX_GPIO);
> > +	if (num_cols < 0) {
> > +		dev_err(kbc->dev, "Cols configurations are not proper\n");
> > +		return num_cols;
> > +	} else if (num_cols > kbc->hw_support->max_columns) {
> > +		dev_err(kbc->dev,
> > +			"Number of cols is more than supported by hardware\n");
> > +		return -EINVAL;
> > +	}
> > +
> >  	for (i = 0; i < num_cols; i++) {
> >  		kbc->pin_cfg[cols_cfg[i]].type = PIN_CFG_COL;
> >  		kbc->pin_cfg[cols_cfg[i]].num = i;
> >  	}
> >  
> > +	if (!num_rows || !num_cols || ((num_rows + num_cols) > KBC_MAX_GPIO)) {
> > +		dev_err(kbc->dev,
> > +			"keypad rows/columns not properly specified\n");
> > +		return -EINVAL;
> > +	}
> 
> Previously we wouldn't try to initialize the columns when the
> rows/columns were invalid, so this block could move before the last for
> loop above.
> 
> But it doesn't really matter given that these are exceptions and really
> shouldn't happen, so:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

I don't quite like of_property_read_variable_u32_array() because it is
OF-specific. device_property_count_u32() will return the number of
elements in an array. But I guess this driver will only be used on an OF
system... 

Applied, thank you.

-- 
Dmitry

