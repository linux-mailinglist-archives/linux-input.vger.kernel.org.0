Return-Path: <linux-input+bounces-11841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1132A94126
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 04:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 258CE461F7D
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 02:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E0E2AEED;
	Sat, 19 Apr 2025 02:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhjgxs7X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB8442C;
	Sat, 19 Apr 2025 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031094; cv=none; b=Nhq0OWKlyjMs6mHXFq5jwk1zG5oHsEm5m+6XpWRDeLiy+gDWy7OoRFEnOmpUKu7QyrdvsFm+UZ99HIU0rqPa/LOlMDvMtZNHA0GTng2UFI7ELYH3+Cs4BKHpNpYimF02GlStlUSKhvXI2ASgvG1o8ObvG2GKpoPpVisGNtUGKKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031094; c=relaxed/simple;
	bh=/X7RU3AFU8hE0bRnO6w/sDEdSaxxRFGjqvlwr/XgzLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYth9xydAGYB3R+DDTX1Llt4sWlmbL4TkkEGSEFvivD4U+a6Wh0J9Y/gkoVCx0bQjS+cawII+tl5NutYX55cWftMb5RcOEmxwB7YpdbRByJosmm6l/2eTrkAVZArYpw/J2iBE4ZOYTyPi/fWvPO7jizj15mLpKVxQZYz79Xmxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhjgxs7X; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30549dacd53so1900871a91.1;
        Fri, 18 Apr 2025 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745031092; x=1745635892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iagA+PnKQSbT+SyE/6B01NsGBcWUX/ZmWhl91APAaCg=;
        b=fhjgxs7XX+UuXJnpBAKlJotCTDXUowBTrhSQlmRMkV+/yPUKAwSC7/tyoSH6FMxjm8
         +uMKYJ+RIyFiGSZEvk3Ye0d1U5hrMwwL0zRw2cYg50jzQbzqbqTFnZNORoTPK51Ou0ry
         qrZeHghaCVAGAa2b97Q6aFchTm/dLbJ2E3olYcwoIyYOiXhZSHCIdFEDI9z8knBnFb4B
         xOr63Xvd6vZs+hGiKkSlNdbwcStYteAGNooHgzixuSO59y92kElz3tSL2hM9iQMu7wNf
         noBcxx+vjQieN8mFL3ZH+/bfr9awptaCISby4HEnzXk49ajQsPyjW5uEtXjlVPGspTdQ
         qJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745031092; x=1745635892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iagA+PnKQSbT+SyE/6B01NsGBcWUX/ZmWhl91APAaCg=;
        b=mQY/gpa90GucWXKXIMzJ9sOIGnvHBFJef9QlS9rE9tXiH92+d+V83PgZ9/n2FBw9D5
         3LwF2ZiJ/18P02FsqSa2WQUq4/L5jNf3FWHrJFqBH5CQ9tH1G7n+e+Za0M1QUfjJ/9i7
         CzM+Zg0Ht8e7zImkgaeHPmhSCMSp177oVCjttP1vsSGUfAnmx+o5U1ZGKG5WYH0uM8CI
         /xnL6TvtKUIMTC8clHcOreg9sLM3Bh81H+GscnU2VLbvWUiZbqjiqiVErPquJZA+oi8E
         noXWvRbrYzqm2rCzrnXtWaTbVBvGa6QTMKWVlutbtIARrvYbDoO6Fe5YtFYev3wlF42j
         35Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW8ve1FADWKFp9UNEVQKdDZGUPvopq7GHpzFDbjjcDhFQ+ulBuBngFimv6b75OKZV6cJpvsUKDUe/O2sA==@vger.kernel.org, AJvYcCWg9enOuN7YEjrA3Mj/I3zURivlvp8NJkYXwog4wTveNhStpdOvaA+awzKgXXTM/14U2dst6dlvVvon2cyh@vger.kernel.org, AJvYcCXT9cb/foIqJCE6B1mTJON0IMk2gyVFw29/6gQlHTST2JoPROPDtWhu4k4CJu+Z/Gq7wSBd+A59@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWW4zOXDXTbyqf3bEBS+zTuvdZDsWvl51T+MTEV5DTH+E242s
	OZ4vi55T3qJ6lB5BOmnCzLeQ6aWsfg3bOs5Q4VtODQySmMQBcYd3
X-Gm-Gg: ASbGnctQRLnsRaJRbdGMCZB69CS1PXMM+6Vl4g/r8Xi/LIu+x7F4O+wBIcxKzpIXLV8
	UWTmDzZd14SEy0qEGMDPpjjwcp9P9QNeOSVbGFNklXuxutxPnL5YCAkKMZErkgCQVFl7E78jSC2
	KOaVWsfWFFxfBx6dxf2A7W7WTDhHZ1q9ehcaMw+i+yr1hWVsXYxik8N5dEsb0Q6UphmZpOcOrgs
	kLALdxwBWK5XZ0d5KeYXtqRE1Pn+0bw/sIyBwL04fYgK2dphcFzU0uq04eVri8A+14EbthpJ4/E
	B3b6PxusD5Wn1eOMvjDUgC5kdud8W3a9UK4GwuOywQ==
X-Google-Smtp-Source: AGHT+IEn7eNcyM6wiIBNgT/VnLfodZTbCikLVEfxcuEFwLHRroZF8Y8DU9r6jATaXU8r2YV8U0Ep8A==
X-Received: by 2002:a17:90b:5824:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-30879c02aa9mr8626213a91.11.1745031092244;
        Fri, 18 Apr 2025 19:51:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eaea:89f0:c84d:941a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e115f01sm2009276a91.43.2025.04.18.19.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 19:51:31 -0700 (PDT)
Date: Fri, 18 Apr 2025 19:51:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	=?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alistair Francis <alistair@alistair23.me>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	stable@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: cyttsp5 - ensure minimum reset pulse width
Message-ID: <vs3vrrsq26q33qyz5o5moer3eiv5lssnm5cmrx6o7wrdsedjrn@dhymxiigvydf>
References: <20250410184633.1164837-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410184633.1164837-1-hugo@hugovil.com>

On Thu, Apr 10, 2025 at 02:46:32PM -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> The current reset pulse width is measured to be 5us on a
> Renesas RZ/G2L SOM. The manufacturer's minimum reset pulse width is
> specified as 10us.
> 
> Extend reset pulse width to make sure it is long enough on all platforms.
> 
> Also reword confusing comments about reset pin assertion.
> 
> Fixes: 5b0c03e24a06 ("Input: Add driver for Cypress Generation 5 touchscreen")
> Cc: <stable@vger.kernel.org>
> Acked-by: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Applied, thank you.

-- 
Dmitry

