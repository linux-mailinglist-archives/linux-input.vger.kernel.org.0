Return-Path: <linux-input+bounces-7562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A189A5231
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B28283EA1
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47BF8831;
	Sun, 20 Oct 2024 04:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lpt2BBS+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED54431;
	Sun, 20 Oct 2024 04:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396951; cv=none; b=NPtILIMVZuow1IpFqH04RW06tH2AeR/VrshLW0P5vYk/dEXizXf8hhDL2t6VyL4zw2Vyi+oHqaDt6QA8owWsarpqwVTZV4qH/0fDlmLv1ZwAZJrFunLxwLz3l0GpaPeEEm+Em6Nl00e9EPyyMpB0yLPz8q9jVPVBER3lj12uFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396951; c=relaxed/simple;
	bh=87GUOWtGFJL4r8wkrlY7qHZioHY2givk4h9dhgi19xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQXaSvQM/rPG17ClxPMCA/eY9R0P/cqU2nSf3UFz55BWOlBBhEOjyBSQ4Fp90KbHt0DaELPomTJrSun47oi7bovonRFsH2gpqek4trzPYUF9bf7QFfqHWaogsPqa8h2vPKVapYIfVq+SHoSUNGO3Uppg+74FTlpijqcrxunERG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lpt2BBS+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cdb889222so34042655ad.3;
        Sat, 19 Oct 2024 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396948; x=1730001748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=Lpt2BBS+FMcQaWlznjZfapRje9jDZpxZe4ko3GFth0oweXNpuzWecB1Q+lyuYF2e2s
         NYd7kAUVyvIPS6/Fpcw0JrBqFIt7LfEiFz+ygg7QmsdwiiC7sHnsuLSvyp0z1Af6e0pO
         iNWiwtDIFtKC4H/geEyxTLNl+5HBiQHGHE+c09v32XqbqV/J25l9pArLQ45aY6BWRTes
         2pMZSoX96++sOn+zRjEbsBjfFaITGEPs0X8rEChvFbSUlgL2rz18v4pPtfWt90R5yQW8
         XVpm36wWd8GOb1AbtXJC90hIwlqwwAWoKJOXEQBFqmYF7VJdqN5ZikAZdED7GCeqp5ML
         2VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396948; x=1730001748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=R9IBizh0mAECkRCz0e70Vx9Wfa/lxTrPRAVG0kEKSljUDgeyJGDFEo/xzonEZLI5Op
         RdqA1wPBh2VFdkM6XVmn2LPM+TjF4Gq/o1NdHSJgM0z7MkDH8D4MBWBAgYm+K6aZol28
         IyV+VlwOa8KeVDCimfhJ8T7EkPmELBltVCT70C67dVQxx19kdTZRGORe+sxp6z/4b5FE
         6x6O8XmunS3hq6e9R5pAmzJZrB5fwl77vQRtyaKGkO04TbtZfSougN9ettu1iIPYEgJa
         1iUND14fsDMnXNPpGtFCTZHdupnsJuNfwj36JksoC5XtOjHRS7wI7YFdIkBYjfR/vWW6
         a0Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWlabEmfTl53V9kc4TBbhj9DHUxM0VXvV0thhuMSMaYxup+Hr8BsXMeDYldJiejSdHboMVIPglbAKqbZOMm@vger.kernel.org, AJvYcCXaOsmr5yiBA5LOegRqPu1gLQEjWw0cy7pdPb65o5cp+s2htfC5yzq1Cxl5rO1HpqBV8XMSUWoQYfu2Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNmym9z5S34RmwuvX/M6jhkkXms3+k2MD5r9f1+DrktIPvpdX7
	VmXpneZU5c60UmrX0w6sf2qAovJRkj3DK4Bg2C5f40pg/QE3Sz0/
X-Google-Smtp-Source: AGHT+IGmRe4gQ21zX8zFRCJZgS26LdpMMQu5DBpW8q3ltXUlMNmmTnmFWbMA1K68qw41N+h09JW/dg==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr92035705ad.18.1729396948526;
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab581b1sm519692a12.45.2024.10.19.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:02:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSA0YF3f7Q86pRV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:53PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index f304cab0ebdb..f1e269605f05 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
>  static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  				      struct sun4i_lradc_data *lradc)
>  {
> -	struct device_node *np, *pp;
> +	struct device_node *np;
>  	int i;
>  	int error;
>  
> @@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(np, pp) {
> +	for_each_child_of_node_scoped(np, pp) {
>  		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
>  		u32 channel;
>  
>  		error = of_property_read_u32(pp, "channel", &channel);
>  		if (error || channel != 0) {
>  			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "voltage", &map->voltage);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;

I wonder if it would not be better to return the real error rather than
clobber it with -EINVAL, but I guess this should be a separate patch.

Applied, thank you.

-- 
Dmitry

