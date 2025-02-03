Return-Path: <linux-input+bounces-9717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90781A2598A
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 13:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8017D7A2379
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 12:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4F82045B7;
	Mon,  3 Feb 2025 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4ZmI1PT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EFB1FFC69;
	Mon,  3 Feb 2025 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586290; cv=none; b=Brphu3a3SszbLzizWEV/HoXDsbgxAGUC9IImpZp6Re70StR0nGfhWspk79/C9QzdGRU1Ei6IgVgTSACIW/7rY9gi8tMzAMtG62IgdshgxGtrtY5+ssF0jRyk/Yhptkv0kRlhJr7BB7Z4WeHjvhLZeBL/LTBJVzDyUOgi17aZKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586290; c=relaxed/simple;
	bh=95zSiarw+ZpYO1scZRyBbxW/PIdZCHPvWMK0AC2GRpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prbJnwlqYdXaDCuLrnf9f10t9MeqnD2M2sW4ZoTYqBUKcaa1/5FepRC0NxFaNplTnSzTA5GDaX1lt4OJGRpHZ/h0awghZXcMVwxLj1fQwfUu7RNZFFwus8kcnpOa3YAXxvsUIk4z6mKTdejFUEnO2MjiXyxoKx6E0Pdhkdz2+js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4ZmI1PT; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2161eb94cceso50597995ad.2;
        Mon, 03 Feb 2025 04:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586288; x=1739191088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2CdPK9mSmhYyTyI9jvKkDvdm2j/cCoWc+2tilMgaC4=;
        b=O4ZmI1PTP62EyhLfQG/lfuERZUeGOVUvW/TdA23HiYp2B04Lo5mwS3NDqsPk3YbqPE
         coMrYrwCixUEVL6n9n3yZH4ofLUe4fhxzwca4goYRGJLbPecTBcdluo+XDtQej417mgQ
         kPQPvZKjfhlpwYUWZU4NUSImCaNbNFDsZWEteFG5hRUtoXVpCzJkfftIGWBpBKoY1pCy
         H0IuYpm20Yp3ES9VtJT+29V9knEAXtZhW1H/Nvn3pJgzawYssjPhW06yIUGwDno+jlaJ
         EabSpZU1FiyqH5ahBecX/e3O/IXxAFtBAtYyRzI0BFLXMQxPhfV4K8oqeHarCuIlLdWZ
         zrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586288; x=1739191088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2CdPK9mSmhYyTyI9jvKkDvdm2j/cCoWc+2tilMgaC4=;
        b=nWNa3lKxqHZrJdiK3g2AKiZCgUTn6C8Z+SaZgD7modp5hRN4ZlxeCRnhq3VKt9Q+07
         nZGgGfIZVdxVpKKgj9DYFG220S646fAaRNpMqxOUFAUD+Hs87ENPU3NCwBvdTM2j2zkU
         EOsmCQJ84RouxVXLdA2rl5Q4Y9+9Yp5Ffk7F4JwsmQ+fzQXc3BkZa4UyTWHohLrkx9Fv
         nvrOQFU/WQw6yi9AFetLRwqQIqENgSFJM49XJodMac3772DRMM0AEAIR7MBHvBpn7fX6
         3zMC9MCejfkfdyhZehtOs07G78Lj4aK5VraAEhhm8YWcwJaeyt3020kZxSTDmXJRVR3k
         ZF2w==
X-Forwarded-Encrypted: i=1; AJvYcCUXL97rrGKZ80qO5g4IC30f3G8LZhagR6oq4fq0DVhWakLfHAWYHM1hIC7Eb/Cg4C9e7LAjXpG/RUcNfC/r@vger.kernel.org, AJvYcCVOJMirNNin3P5Y+pAjuZSTFtQoHwKKnJc1tTmzsDnE8cZw0tuvUxRjyUVGkcsTU9yMf7J57gFu@vger.kernel.org, AJvYcCXCJqF0O2/+4N99SrQ8EgKVQRyURZzJdN4yJyx3Swy5T0zN3Kzj6PHCRUwZJaqUBEvLC4h78UMge+Caqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa/t9e5bsXSY4tRbnpbqE7insSOYvhnAfdUY9o/vQFAk5hURG6
	RyJ8g481HidWyJZu6/4atLnItNyD2/VLFbehNDOrH5u1kD9UI8mY
X-Gm-Gg: ASbGncvLvv6C4qyG1NZ4l9P74y/GNzOUL4WhIEX6+1Q8a0gAztUi1cUjWRWLFnwz28V
	syHi08j2ZSu2uPIHczwCP96tNJT7luEYI0m9X6n2kmqoGsJEP1Id1kzxln4zBkIq4rqXAf4v38B
	TogAhlWeb1ooJeyubGrM/USBD/bt+sHm3/R3EibqzoKCJHvOZKtMpJ5B+ro880sOYwKUKAR+ILc
	qwyi+OxNTGzKKX6kWvqvCQFn94066y7C/TGmweEBc1G8p42wjLVimcLArwDRpakM8bzHwHmG0L3
	hFWheKPsslQSuw1Z
X-Google-Smtp-Source: AGHT+IHLB5k+NQf/3MApmiIEbts83y659X52J6eS68pgCXtvSGPMZVtiEi8Ef66VZtCo58VhfA8gag==
X-Received: by 2002:a17:902:ced2:b0:216:554a:212c with SMTP id d9443c01a7336-21dd7dff3ecmr332857605ad.46.1738586287839;
        Mon, 03 Feb 2025 04:38:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9519:ce7e:a33c:85df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31fcddbsm74929425ad.105.2025.02.03.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:38:07 -0800 (PST)
Date: Mon, 3 Feb 2025 04:38:04 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Marek Vasut <marex@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: ads7846 - fix gpiod allocation
Message-ID: <Z6C4rL4SMbUcAuh0@google.com>
References: <6e9b143f19cdfda835711a8a7a3966e5a2494cff.1738410204.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e9b143f19cdfda835711a8a7a3966e5a2494cff.1738410204.git.hns@goldelico.com>

On Sat, Feb 01, 2025 at 12:43:24PM +0100, H. Nikolaus Schaller wrote:
> commit 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> 
> has simplified the code but accidentially converted a devm_gpiod_get()
> to gpiod_get(). This leaves the gpio reserved on module remove and the
> driver can no longer be loaded again.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Applied, thank you.

-- 
Dmitry

