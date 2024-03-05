Return-Path: <linux-input+bounces-2245-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F58872560
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 18:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FC7F1F270DE
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 17:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAA514286;
	Tue,  5 Mar 2024 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTN3fsN3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2BDDAE
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658709; cv=none; b=pyjkWsz1qRIUwMC/2TaiAeY2LcYEmPRs3XGyeGUugf6Vwo9fnuqi9K35hqWeWIF0sEQofEHlzZs11n8VnWimrX3dkUYa3BXJA5HWF7fX68VfRbltOIgkJq8eeZXdrsf1Z3FJ8XZCIdhhIlWThH+7CQI0cFqBc/n3T6e8Xi1/Wso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658709; c=relaxed/simple;
	bh=WEd3q5UweGHRoF7IeGwlZCIh4O3BOv2Amjl+v6QxFYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qy4aGOTuhU9zApDL7hZPuHZ4KVv6eUDT0H3XXOQjKsq5S6g5tpi2/CJ5oY9G70UyAjiLik2Es4cgWwLmi+92a37S017zcjVAI/YE3yEAbxQxGVNEiK8QACQvTm4RcDbnE60soAYG0G3H2NuUeYPUILtoQkhy6VlPwdcaX+rSBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTN3fsN3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc29f1956cso46639325ad.0
        for <linux-input@vger.kernel.org>; Tue, 05 Mar 2024 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658707; x=1710263507; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ajgf8X4sf14BT3W9iuZf3u74xUKiXuDCzWzRgZcBh1w=;
        b=UTN3fsN3OE4wBz3/R3RyZQICgmHqWxnQGe2PTFG0O2XltOqz3x0I8wDNXkXg89uh7H
         heCi1RQQhETICNWhCkHxpvSnDNLWHcqDN1b3BYWuK9NteDQYCwuIfWv0w5xYGCEFP0z+
         7P8HVOlvwtNn2BB4Wv935VHEvHMeeghobwp8+CYmaMwqtRQteJ0GXOv7ZvFU05/20vfD
         RvJWjkSqrUa8KRSTaUtxdGUue0uKRmtNH4gmMssmRniffZN9jQpWp7j6kZASMgOB2Lku
         RnK+UHtP6S0R3eMWEn5DXqaDr68BiVrGTexaw8GPydwkUj+vPEDDlaTsln1UTj2fub4W
         7VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658707; x=1710263507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajgf8X4sf14BT3W9iuZf3u74xUKiXuDCzWzRgZcBh1w=;
        b=l45SQgMLKTtCTiRSjx7N5+Mc9jGJDw2zEFdF4KXaqQ8aXU0QV8f5MpFfjH791gFUI2
         wCmbRpih8kRi7PuD6pMi1uDb9ZOlgfD/+6BOKm/CFLItplOruFV/R+1ROr9M28kjy9sz
         EIfBiCy6jLtMPajGotQMYv+j5bbJ7FP0zLv0qsJT4MujnfJmn3LdFKY+lxs7sFfxbv8w
         Qj2eJsjtKC7/rdJl3GWqlKm+Zklkz+1LmRqMqmM9FB4C5Oxf2p2a05MW5a8kWLhMkOL3
         59kmCXZLxFyFTsAEL+++gAd7uaIVYGnjf5rbkm+PS9aOmY6y9Ttgox81IrUs1ddw8gYv
         qKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbYzq7Oo2PkQwbIDQWeaOoP1iYnoFoVTihvL/NzCRDEnsWYACu4sxvXKW3GAMMjvUTdTnjH52vZYMZ8iI6Xq1uSerGM8KvjzKkEME=
X-Gm-Message-State: AOJu0Yyj2MxTdhgljxOLFKZA4ptqOZPGMxp647clNrBfVes92/udrIep
	66ChTqTC2ZX32rv+sq8xPuXO+dFoX1cD85Hu4uteY7KKujhFmp3a
X-Google-Smtp-Source: AGHT+IEQYIpqmwdXR2So7iKcewSj+fjU03GGzG/2V0gUOHKZzluKOxc5LFza7XyQMkL5uAIYxeWqRA==
X-Received: by 2002:a17:903:2349:b0:1d7:4353:aba5 with SMTP id c9-20020a170903234900b001d74353aba5mr2451847plh.58.1709658707331;
        Tue, 05 Mar 2024 09:11:47 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902f28500b001db4b3769f6sm10813447plc.280.2024.03.05.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 09:11:46 -0800 (PST)
Date: Tue, 5 Mar 2024 09:11:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] Input: gpio_keys_polled - Suppress deferred probe error
 for gpio
Message-ID: <ZedSUJ8PyyQx2r-c@google.com>
References: <20240305101042.10953-2-u.kleine-koenig@pengutronix.de>
 <CAHp75Vc2CePCjwvgwNNkccS6fYV1dZam25Rq__6wW1BUr5CFSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc2CePCjwvgwNNkccS6fYV1dZam25Rq__6wW1BUr5CFSQ@mail.gmail.com>

On Tue, Mar 05, 2024 at 07:01:02PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 5, 2024 at 12:10 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> 
> ...
> 
> > there are a few other exit paths that could use dev_err_probe(), but IIRC
> > Dmitry isn't a fan of using dev_err_probe() where the return value cannot be
> > EPROBE_DEFER, so I'm only changing this one error path.
> 
> It's not true anymore. He is fine with that API, and please use it.

I would not get ahead of ourselves ;) I still think we could have done
this better by:

1. Having a format option for printing symbolic errors
2. Recording deferral source at supplier level

But yes, I am accepting patches and new drivers using dev_err_probe().

Thanks.

-- 
Dmitry

