Return-Path: <linux-input+bounces-8608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 329719F3776
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39E837A78A0
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 17:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBD3206F19;
	Mon, 16 Dec 2024 17:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXPpFuu6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1B2066DD;
	Mon, 16 Dec 2024 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369742; cv=none; b=IXgsuN/Pp633wBlF8BdeZiJY6Rp+trcLiogRvCD55XIuq3ScoC+v8gn3XwDTnXQm2oY2Pgot2U6KFBk2SoNgrkza1bdgqXcFi236sQginoxaYpZU5qzJsl133rGkjQTxB9YJpDahLvYNhf4l1vpyv4t2vUUcb5J1DwY2P6udEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369742; c=relaxed/simple;
	bh=3AEKNyNKm3hQSLovr0nmn3JnGZLxzZGEUg3dGnIjQQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzA8I68Xdz5O+4aseWXXdGDigYkcZoKlQwC17e6KjgyI0j9rJN8M38p74CjS7SOQ1OfV8r1xK9HXSfYkoe4Ri8Ss3nJSX3x/KkWgoU8Q0FSYo4N9Kjv7p4f3uNGRkdh/+9nXLjbOWVpofiD/912egrRCrLqU7K+bwoakZ3bAiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXPpFuu6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7242f559a9fso5571257b3a.1;
        Mon, 16 Dec 2024 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369739; x=1734974539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5m5xVjPgGSN/6a8xRyiY8jma1+Idk6gDOsB0PEW/Gq4=;
        b=MXPpFuu6drm2iFdr/hyktk7UyNDLC3wJ4Tczb8uQzp19DUZyQM9yc8Oz9FFBwrpnrz
         D1aGcSq9vXiwXZg7QOSsVpQgvkygE2lfAtsHFaIwfAyww+cKe9SHfHxegFsASAIZMUFV
         2auOPaJ68HCN4+5FwN71TyO1JK0nK1U0KJk9uwBzUeHMqedVaJLVq5bVJ2Ok6e/otn7T
         uJ7tGpwaUtSjHyE9SoemHtl5Isrfxa+bUZ0qRg2Yv5o5SGm19Psw1WoP2W9AI65/DMJ+
         Q+MJJ4efz3Nkf+lI+EljWQVLhBf4BQp1FR9INUXmU4CxWVjwmEVElXbycC3/N6awZzNM
         pqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369739; x=1734974539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5m5xVjPgGSN/6a8xRyiY8jma1+Idk6gDOsB0PEW/Gq4=;
        b=c28/3XfW4bQnhXPemnKgVnxl/LmaBdswjmn4MJyz4wuEwsMtIAvF8Emc6WRStYcJJV
         CkahzGSbXPRdTgb9qKMDJIX7lk+p+iE+K8lNHD6XvsYy5QCxNL9rIr1F/7gHH1wUGlsP
         2NBYW9MhdWy+CyOiELoM9ew5cE6GmRc+y4kB/Yj9TjtMsjbAMPRhZVTCRd4uo96vaC/j
         K09BPjVWZT/2nC0qyX9Q0/68TNmhU3r5SilQ1GnCROFNBB6mmwLkQjTvBrbmJgKsB+0I
         +Zs5WDAWKnuNhqL3GWuaI+NPGs5at3seZd2sxi2+d1IAN4zraZy5GbgFEjwMgoR5F33q
         RKCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA3I+rF16AILZEIeVJw5FrBrVBva0TK+hjhkgN4TaK7MnN0DyWUW2ty6F+OEprCGKInfJqUBSmK+emyw==@vger.kernel.org, AJvYcCXWPLXeDDxueIKRTEEpltElDRl4D+5oRFHGTSClasblNpt9IIe+QkdbqxtuwhxMMAhuZsNtsY7L2ZcJmIga@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsOQ6nWHTC/r1obYv8GHcfBkeQI7sPp/4FBiucE0wKeT4a5AN
	uKZpYFJxG/ZMuWpu2AX+OGc2XswgoDaIc3wJGKiXBLKJr+cbHyBvpo3Yzw==
X-Gm-Gg: ASbGncv+iJ0VeqyTYBb9gB5N1dlih4Sj+SZ87fb+55oVTxRdPo7L30SXII1fA9O/dPo
	3L+5xpZ7QnuQZjx4FFX8lKgUtYN+TBvPeX2Z1Rrp6Z031Vh5FTtB0lg4A6ni9W6c0Wmc1dyBGso
	PCEemv6b1sVAoyayAIX2ENbAjVRxP4X1JKEK79/01tzSaIUbyEuEOPeko3WuD+fg88dLahn9hiY
	MEvHoI4V/GyXYaeXnyssVqxdll4GNTy6pL4g1ZUzbqucQkgoHXjiXd3fQ==
X-Google-Smtp-Source: AGHT+IGEY1K+AIJWe4as4D/3JWSg8aE5DVD5GH1TQ+TkrIvwYz/FZzBpuwDaIGunjcPVrJqNvfY+bA==
X-Received: by 2002:a05:6a00:3692:b0:725:e309:7110 with SMTP id d2e1a72fcca58-7290c10fe59mr22441755b3a.5.1734369738785;
        Mon, 16 Dec 2024 09:22:18 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e6c1:cee8:7b58:a395])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bce39csm5173053b3a.189.2024.12.16.09.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:22:18 -0800 (PST)
Date: Mon, 16 Dec 2024 09:22:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] Input: davinci-keyscan: remove leftover header
Message-ID: <Z2BhyKw0A2pCH3ps@google.com>
References: <20241216083218.22926-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216083218.22926-1-brgl@bgdev.pl>

On Mon, Dec 16, 2024 at 09:32:17AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The corresponding driver was removed two years ago but the platform data
> header was left behind. Remove it now.
> 
> Fixes: 3c9cb34939fb ("input: remove davinci keyboard driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Applied, thank you.

-- 
Dmitry

