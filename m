Return-Path: <linux-input+bounces-5655-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD3956B34
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15481B2413E
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F8216C69C;
	Mon, 19 Aug 2024 12:51:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE916B732;
	Mon, 19 Aug 2024 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071876; cv=none; b=lFGof9ZJ+IVPbRvKlMg0pLZpiudejJkN92KzbXYl669kV/ONY7FXl+FoJjbX+j4OYG0qrgYxyakg1Qbwr/CcYJjoE2M1oMJWACTbuhE/3G0kLE2FKs6e6W0HcOMB3gW/cwUVLMh9U97UnRtLqGh2wlGgyHr0glN2m3WfEPzfjzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071876; c=relaxed/simple;
	bh=/IH5tDTMVDjFpUzjHKNT/0fRPTiJX9a1ylVmAhJ9EV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmI0AI5pQhBmVeiDeEI/ynYRQmBG2m0Qza5bbd9lLb6Z4do+8lw3laRnS66z0D3+0lwO8pv7UOdtK+Eqm2D9CIOaR4kqXIyAefNy0pirEy7JV6qh5uDAWjYAOXeSoztdUIq8MvZRCv3m1GJ8hR5phhtz35vr7hyiWHU9NioV2RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42812945633so37698185e9.0;
        Mon, 19 Aug 2024 05:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071873; x=1724676673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbEQFwWaHyXzGbFpAlH+akSQvp4xWmKnyzly8gjh4os=;
        b=fBv//SR4zWWC8WN/CCscm6/2fhY8/AIjJDnNjmC6gfuAArj9ZI8Nb8akTDoUYyo396
         olOFXQcobUuTAOUM28xW71Rdq5D//i02eS2PP4McjuFrcjzmdHY//mLANXqFXZIDq+qP
         X8geF5kzZHTP+JP81aGnuFThnkB6AR4SPCfIGRejSPhxk2WSU2X54BOSO7Ugx5uOlu9m
         SIH80QCMOFXpwn7mYFal9S6WuBzJheoGUJr391QOmQiHyozAhuUIbDqoSe2FjSnpVpKc
         ftKaOdckLSZ9ofSshLkmR91OKluz78PANxSRbah2yeEuNPpKRQ5XFCzrR2Ca8fTqfoYB
         Qz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb/cdkfsmYNJzWwLO96FpKwOQCf9pgRlIiUHanhVU5WgsSleIo4VEIVFsTHh7WvAdfgqshx+r2iV7czcrA3LBOXCbV8kYXhL2eCvtazqLEe9IrYKRvSNeo2aBqQa5oTd52MZBX4wiDaCOj0ND6AzpbG2XjcamqBOEB2/zp/F/wKlBR9UFcq54ecQzlzqBny30Kr4DG9hRU/uaOdnlyn/YPsmefQMyi53I=
X-Gm-Message-State: AOJu0Yy+417DIZXTA4WC9Zuut9ZC2YsD2eqDAOMlp9uZdIjdvIv3jZon
	L0mHpP4ANcODiF08olJLr9FmRNEXsKuClXg41nxTbm9uHpEGV7JM
X-Google-Smtp-Source: AGHT+IHmBAF3LQNiic4ymfLmnDMEypJT2xjJaqmfZx+xLQJiUNz+uf/LAM4FAi1A8rOpiXrYHkW8HA==
X-Received: by 2002:a5d:452b:0:b0:371:8c06:82ea with SMTP id ffacd0b85a97d-371943150a3mr6231730f8f.1.1724071873008;
        Mon, 19 Aug 2024 05:51:13 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ded72524sm167013235e9.34.2024.08.19.05.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:51:12 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:51:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/14] Input: samsung-keypad - switch to using
 devm_clk_get_prepared()
Message-ID: <xlbtkevzwcqm2j3xwykyktvpcn776imbijync47ogcnjargmw3@giaklcsa3iai>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-2-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:57:58PM -0700, Dmitry Torokhov wrote:
> Switch to using devm_clk_get_prepared() instead of combining
> devm_clk_get() with clk_prepare(), which simplifies the code and
> ensures that the clock is unprepared at the right time relative to
> releasing other managed resources.

...

>  	device_init_wakeup(&pdev->dev, pdata->wakeup);
> @@ -439,20 +433,12 @@ static int samsung_keypad_probe(struct platform_device *pdev)
>  
>  err_disable_runtime_pm:
>  	pm_runtime_disable(&pdev->dev);
> -err_unprepare_clk:
> -	clk_unprepare(keypad->clk);
>  	return error;
>  }
>  
>  static void samsung_keypad_remove(struct platform_device *pdev)
>  {
> -	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
> -
>  	pm_runtime_disable(&pdev->dev);
> -
> -	input_unregister_device(keypad->input_dev);

This looks unrelated.

Best regards,
Krzysztof


