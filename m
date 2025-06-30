Return-Path: <linux-input+bounces-13176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D73AED23B
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 03:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D49633AEB49
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 01:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A1D2AE6C;
	Mon, 30 Jun 2025 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoqQHwMZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AACD3D69
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 01:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247230; cv=none; b=WxKBtyPhHebT9KJoVYtviFYa08wjuCMaTw6o6y16kW/sETQmui2OMYS5JrpR2lDjPGsUQX7Q8bKaEdQr8pIf2u2g0G7kzAutMBPKu6BF9w6RlhDIWMm6er0jk+hLpA28GLk+swQlyQ29PDOUg6IBkRXELtqXOLE4wCUuCuaahYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247230; c=relaxed/simple;
	bh=a4tG1IgHb+K/y793jvw2N8odbMOKNSF4BdU436DSffo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qkf2jtSnZ80vh+F1PNAGkhYQeHOUEPUctV6RVwao52fZjZeUOg+/ugIKfNwNtdSdt6HrvCCMaIV2PaxYcxqaFpoSE2A83hMo4ARTzettrCMJTjINzvd1zyPV5xr8q9e6lDygaFqOITYZNCSLj9zJVPxrdVV/rX6lhgmEUREN618=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoqQHwMZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so2932675a91.2
        for <linux-input@vger.kernel.org>; Sun, 29 Jun 2025 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751247228; x=1751852028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTL3//A+FFbACv3PcJb3YF4ncBsYrz4STKO59ymReaE=;
        b=KoqQHwMZyo9056aBLmUI6f+IlGaPRuBYu9Rg5kp7/5a/qhq/ikLx0ceS4PidaDP0Kb
         Tyt+/A/gWyHJ7HYYY2bRDBH9RZHd7o/WwkmhnYZldCOPp1ieSRwmJK7Uk2VK+i8ErlNL
         ZHqMn4aqPBB6Md8J2YgfHu0XkUMwJsiOB0Ved2uRr3WIrQGeBYDwfom9Tbfgb2ADxw2y
         x5Y4okrbl/4RJNCmNTAiLYnWS5zfDRJk9422wKsUiVtZi48O0Fo2KGWchVFsEVC6ofte
         nj1pnv/47uubRaw+laCTuiqj8f6KTkpp1NMAzOIaAvmgBx43/okL+WHmgi99DHybZS1e
         Yrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247228; x=1751852028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTL3//A+FFbACv3PcJb3YF4ncBsYrz4STKO59ymReaE=;
        b=a8E24zyJvKIKLWDi7pxEtMlGnCzI8SgfliSuWCnltfo1Iwur9yCwI8ZHwdJktrux5O
         3JOOFFE8HO3+fEeWu2tRlOD9Jrh8jrnWPzDCzHMEZB0OeMzE6YZ3O18vYCK79n48XkYJ
         fMqFtmvOqtKmUQVUiPPyuTiL1U8kL53/eld9T4T/VEOyYNQ8BWUvLsVwDq0qMBCX/Ene
         5HPyXDHfJgLrORdVCu5JLBB80HAD43RJlu1ovknDBIDhCyU6LIuMLRw/NbutkZoVJOz1
         VEEWjS7QJWMtIkMHADsHj++5aBbzNwV6pN1mujwkNrBlXA8m3vpIMArkGhnrz6XPvfic
         7E6g==
X-Gm-Message-State: AOJu0Yxob6nFNdf6Kt/R0mleNMP5W2P5ps5CwLpvXiKGTMyZjK/gJ3u3
	Ms3ES7BpUsGMLwvn5kCvjYBNXOHax+Nu+nJk4sjQDKXo69jboZfZlRFP
X-Gm-Gg: ASbGncsffnDPhctvSLxqVlIPwqdvtQOgIX+W/8hfA0RtPd3uIQm37KDovPYToc0pppX
	+PjCzFPAd8qYKm/ayf8MbYizMYqj9oipCqAZwJAqTsOAUYFfaAM17WWgy3HE5DQ8gqaSaW8HEaB
	NJVXlUMGucU50ceWOOlejhXIvtoUcLZuuK2bPPJS9ktS8KofIVHErLyxkBJ/9fV/DvbwSGRE/g0
	MuidlCeVTtREHzMZxwn/tzDTYMQ7G8wzDbq6p0Lvxa6cYkgOEPj5UZx/c5Hs8lNflCMseRucM2K
	A23NfKn7+PMvjWO3DnlMEkKx7xJvG6k1CZAPqgmZAlUxhae+w7Ms1Dn2p6Bigug=
X-Google-Smtp-Source: AGHT+IGs9iGG2QZRFta55426nrfP8oT+K+cTu4GKVN0ZVVRe4+mljUH6EHslg0s52yluwXMNEV1XjQ==
X-Received: by 2002:a17:90b:586e:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-318c9231255mr17460433a91.17.1751247228486;
        Sun, 29 Jun 2025 18:33:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d8da:e3e0:2b93:2315])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c5a31sm70252795ad.219.2025.06.29.18.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 18:33:48 -0700 (PDT)
Date: Sun, 29 Jun 2025 18:33:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeff LaBundy <jeff@labundy.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - explicitly define number of external
 channels
Message-ID: <v6zz53bcihzmi62lnrr4dhgrc2tajqnzvvwvwgkmhtiiirurod@xlodeyrrstzn>
References: <aGHVf6HkyFZrzTPy@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGHVf6HkyFZrzTPy@nixie71>

On Sun, Jun 29, 2025 at 07:08:31PM -0500, Jeff LaBundy wrote:
> The number of external channels is assumed to be a multiple of 10,
> but this is not the case for IQS7222D. As a result, some CRx pins
> are wrongly prevented from being assigned to some channels.
> 
> Address this problem by explicitly defining the number of external
> channels for cases in which the number of external channels is not
> equal to the total number of available channels.
> 
> Fixes: dd24e202ac72 ("Input: iqs7222 - add support for Azoteq IQS7222D")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry

