Return-Path: <linux-input+bounces-5671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B8956DC3
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E6601C2309B
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA6E174EF0;
	Mon, 19 Aug 2024 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B14FTg2q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F6172BDC;
	Mon, 19 Aug 2024 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724078782; cv=none; b=QaJiOZjl122+6OA3JOqq9HVAvmSXEo/teB71s4NriA4VonFmucJfn7nfH5aIvN2rDYP3ppbBQZrjxy941Mqmn6x+oqUZsfWtLL/n6zKgUcOHFZIJDaDB3/3n7cItCWIiG4zhXNnfcAvP8tIWocfV5g+V/wZwy2h0vvQg17b15GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724078782; c=relaxed/simple;
	bh=SkZnuyF0tW5tyjgIM6yWpPVNsrQ0ePYYUfcrMhq4OWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1/lshkcYuSieNwPsKQKvRTUCO7tCzqpuetIB7lyILvxh+d3zzOuNu9Fn9OcH6BPNrrI00zyHZgX8Gqme0e5A2SjX1FQezW++l+KrSMoYVGO4Ak/oPc8WvvB6Fx2Oj/MBAaXTG5f0+G5OoXW3ivwm8So6xnIFNGFB/Q6dvb5Afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B14FTg2q; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2701824beeeso2203011fac.1;
        Mon, 19 Aug 2024 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724078780; x=1724683580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8r8vZX0TLkXlphek2g43KwTQkJU+hOeULw/Z2z2ApCU=;
        b=B14FTg2qNsHAk4DVvReZRKqeDc8fp0c5DXeYCFTpksodC/4RwCfzM2Swg8aNcE0D7X
         8T+zg/Au/d4HfN46Od6GGZQQcr/xki+KUs+wi69sFTsmdmQxq1LGgupVK4wZanbj0fz9
         zBhQqC6QbyIfHBLkkGfSMyGp2VYKZgkj5R6xZKMurTUp/SpUvicD95jCGnwbNa9tfk9a
         lYxRua1Sp/keSgrqEgAiWjgpivq0u0TVEysqORoloAr5cNLAI4C7Ny0jCEXH7+53sGNf
         2UMR41B+jWi8d19vDSFx0fU4EQ2pCRENp3vFP2HP55Ln2bqS1QaqrU5B4UQRk7eKcqSN
         paMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724078780; x=1724683580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r8vZX0TLkXlphek2g43KwTQkJU+hOeULw/Z2z2ApCU=;
        b=QUMlKISJei7xjh4RJ7fnpSZr6k3xYURXTT5ZxiRUUR2FU7Q5eB1rA/BsMF0nq0ZRg0
         iGSUXQHMawrPsTAThYOVtqb6unOU/2WMF/ReGUW6r6XptZJXcaU0U07oM8bt+Ysc6l91
         8+Dgj38MKFAOGxZxJMDIBkXFwDktoUCLWKtEuITXrWrRrLfuDsXjw6kokutoDOfvwa9i
         7cU9ID9auKIRvsurw4Y9kgZKUNz/ofF8eE32oX/+EXgzQG3oPM2qfXx32OCCIPTB5984
         t4np3yhKA78m4pDKFb/TU8DKJu9v+U1Nf2czpOs5GWTGVXrSwMN5GExUdWd+v6TF30JA
         XHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6KI3BSs/QXJ8WBtZgVgeQXaz152lmEkHHyfjyjYk3VdStqY965FHWn7lad8kqkze0+Cjwz8D6jBpllAwwkUakLPuexZalEjI4M77iGIbyqzlo1aOoePnY4KarB7pmEqDYEq8Hai61T9bscf6XmuezifBegGvJFwt9cPsB8bTAbyvSK1rPGFqAirBb445B7AMofOJEQWdDRkAYHDCTq8q/aJu+C9OqwsU=
X-Gm-Message-State: AOJu0YztzVufyV7rPdpsRnGUEdHM0nt6eT9Sab60NpX+hglwyCjcllYx
	zr1VGg1RuAlrqPGEpNJzxPsPXsTQlBEnA1AelHEgRbC9O50eccTJ
X-Google-Smtp-Source: AGHT+IF0xWTeCT0SqOoVl5Lakk1Cl8bdYSIhAbwVApvfvBKG7cJPB+SE5lP+ESdrLNLfqdnSQKJlJQ==
X-Received: by 2002:a05:6870:d185:b0:25e:1edb:5bcf with SMTP id 586e51a60fabf-2701c34553emr12552175fac.6.1724078779582;
        Mon, 19 Aug 2024 07:46:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f80c:1483:bced:7f88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6356c76sm7616998a12.62.2024.08.19.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:46:19 -0700 (PDT)
Date: Mon, 19 Aug 2024 07:46:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/14] Input: samsung-keypad - switch to using
 devm_clk_get_prepared()
Message-ID: <ZsNauAfnX8-PoVAN@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-2-dmitry.torokhov@gmail.com>
 <xlbtkevzwcqm2j3xwykyktvpcn776imbijync47ogcnjargmw3@giaklcsa3iai>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xlbtkevzwcqm2j3xwykyktvpcn776imbijync47ogcnjargmw3@giaklcsa3iai>

On Mon, Aug 19, 2024 at 02:51:09PM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 18, 2024 at 09:57:58PM -0700, Dmitry Torokhov wrote:
> > Switch to using devm_clk_get_prepared() instead of combining
> > devm_clk_get() with clk_prepare(), which simplifies the code and
> > ensures that the clock is unprepared at the right time relative to
> > releasing other managed resources.
> 
> ...
> 
> >  	device_init_wakeup(&pdev->dev, pdata->wakeup);
> > @@ -439,20 +433,12 @@ static int samsung_keypad_probe(struct platform_device *pdev)
> >  
> >  err_disable_runtime_pm:
> >  	pm_runtime_disable(&pdev->dev);
> > -err_unprepare_clk:
> > -	clk_unprepare(keypad->clk);
> >  	return error;
> >  }
> >  
> >  static void samsung_keypad_remove(struct platform_device *pdev)
> >  {
> > -	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
> > -
> >  	pm_runtime_disable(&pdev->dev);
> > -
> > -	input_unregister_device(keypad->input_dev);
> 
> This looks unrelated.

It actually is related: with clk moved to devm we no longer need to
unregister input device by hand to keep the right ordering and we can
rely on devm to clean the input device as well (it already is being
allocated with devm_input_allocate_device()).

Thanks.

-- 
Dmitry

