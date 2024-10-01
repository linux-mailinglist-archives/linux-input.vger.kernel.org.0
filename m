Return-Path: <linux-input+bounces-6975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F098C0DB
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 16:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 354E81C23CD9
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E6A1C3F01;
	Tue,  1 Oct 2024 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr2xGSxL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8651C57BE;
	Tue,  1 Oct 2024 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794524; cv=none; b=lRtf2xULtBXwYEfadmXvyDIrli3dz8++BK7jcm3vuue1YID8E1ha56ixyy414FVw+WtrZfoi3LT4dPeEE7ljusU4YXfgvl0V+gNox9D0jf17QHGndGz5Y84dUpogf14zp8NE3YG+QNYJICcvKrZ8xBRZ+bJ+4P+jy6MQ5FCoDiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794524; c=relaxed/simple;
	bh=xPvLZqaKfrGAXRCDgmtRUeJQTVDSFCPwpDyenqTtAB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SoQ/1Ar05TVu8MBXpS7XjJ6MmBjCR0UlFE/2uXMS7cN6Qdeiz5nPob06fpOTykJYxrLrTA7GXa+ao+OoqoFHaLnUvO9PRbpcn5mZRiCazBgeoHobRU94xaHOub+Fm3Jmr3l3H8qxByJlOFKr+RvDg8TGP1WbiBjB0wba2BVK+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr2xGSxL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db4c1a54easo3563952a12.1;
        Tue, 01 Oct 2024 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727794522; x=1728399322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cKRuyeWBuuOQUlotVfU5C9rCSepU2nPjV2NNxuZMvo=;
        b=Sr2xGSxLYtMfDjbXHMsUNQB/AXO1M/8ItAJWdKDnHINlbpCkeNK5l7azYS049TwQ7Z
         mBLhtLQNETO+aJTAdAF0ac/lhrtxzFerqLdcU+jp6z+IuTZSMTJY+A4RxRxTxPlUSBSo
         nkgQU3TCWjsHo/DdZJrQ45S4VW4GnI1392UN1zGH2w4m9+rMAU3YaFyG3LCeRlYc1jZE
         Xk+T12anGaT27ChfGOH1GLtre3+jOtt/NsXu3IWc39b4FuiBaA9HOK15tHr0sUyJ8IVE
         eS6gjF1rDl+MIPutvegfhC2WADyJfskPQJqis/jiYKdunZB2nJrj7yG6/bsT9dhWx7OH
         dT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794522; x=1728399322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cKRuyeWBuuOQUlotVfU5C9rCSepU2nPjV2NNxuZMvo=;
        b=VYMCctFQqkoRffWkaeOLZv2EDL1dmMM6SEFfT5uOY5j2m4easQuuMlBzf5RP8oUxOE
         ZcW0Oqlj9bnAoWxXQ3l5iqY3naxGM9GMt0xPDhrqbtNczm3CxRrqz4z5++mr8zsr+X5s
         aoU98TJBw6Tcod0qUVaOmHO4bv512mZAJ8j+UvE8+jG9+8Tr8mSthg4Jh9WSrKyGqNMw
         bTY9B/Vw6DuIzyQ3jQKJ9jfRgoOm0Vcpxg9Bo7MeXRNxrb7b3GM0si2w8BV+R7HYj2t+
         oRXjLRXjtD90Uz/rqDVpK3k1E9J2YauvcZF3tdVFxPZu9HTKrWSn3N7pMcnOmOfU0RLD
         L9cA==
X-Forwarded-Encrypted: i=1; AJvYcCUlEKWOeRBxFgFe4m5MNaT8Bz1NHV2UVJ2xFvnhFLii7TqkiNCFkpulnruSbNYYOLJjC9eqlqgl5mz0@vger.kernel.org, AJvYcCX2XPbX6U7VcH66SU0Sd/IbesCnHx8y6MeweDNtudf9Q9Y/EhSwGnxzvWmc9FN4lCR+8uz7xnT/ly/2IZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzmbih1pYEz5yUFV1zwFSwDBloQFEunGlJU1MQZlgXvo9tido9
	UELaTpT5Mgq43ydnpcjReajtiMXoDdF2Y/kEtn6tizbCFj55uyNK
X-Google-Smtp-Source: AGHT+IHOqgNhWgGDHh6Qd+iMrUzE+MY6OBRxtL8lj196+BVRwkc5vacIW6UH9dRFww3RQPX71jiivw==
X-Received: by 2002:a17:90a:600f:b0:2d8:a350:683a with SMTP id 98e67ed59e1d1-2e0b8b1db71mr16916114a91.19.1727794522083;
        Tue, 01 Oct 2024 07:55:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1ae741sm13803342a91.15.2024.10.01.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:55:21 -0700 (PDT)
Date: Tue, 1 Oct 2024 07:55:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 03/13] Input: adp5589-keys: add chip_info structure
Message-ID: <ZvwNV4zor-MTKigP@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-3-fca0149dfc47@analog.com>

On Tue, Oct 01, 2024 at 03:41:34PM +0200, Nuno Sa wrote:
> Add a more natural chip_info structure and add it to the i2c id table
> driver data so that we do not need an enum a switch() to get the
> specific bits of each device.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  drivers/input/keyboard/adp5589-keys.c | 181 ++++++++++++++++++----------------
>  1 file changed, 95 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> index 922d3ab998f3a5dfbaf277f10eb19e5cd1b35415..eaa5440d4f9e14352409dd880cd254354612bf3e 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -228,16 +228,20 @@ struct adp_constants {
>  	u8 (*reg) (u8 reg);
>  };
>  
> +struct adp5589_info {
> +	const struct adp_constants *var;
> +	bool support_row5;

Is it possible to derive "row5" data from keymap information to avoid
having this fake "adp5585-02-keys" device?

Thanks.

-- 
Dmitry

