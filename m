Return-Path: <linux-input+bounces-4035-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF648D7AD0
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 06:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B791F21F01
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB62712E5E;
	Mon,  3 Jun 2024 04:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSStG0Ql"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE45364A0;
	Mon,  3 Jun 2024 04:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717389552; cv=none; b=PEms67LYKO1cOPP7QxALi5ADXggdlFUAjz2Gvg1uf5Q+4sQFMCrz9u06JAKwrjbEqRlL2NzNFDQNrrHE/QEVcWKWbjkI7/ReeyQxoZK84SuWpOIuRBqvaETjEVtLY+nLC+gmK/6ey0HpOoSoE513tYg8VcwlVM1Ah1OkdpzjNEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717389552; c=relaxed/simple;
	bh=h/TKQnIZT/nSWCuRNLIp99nVLXmmJM7T9t3dEywEhFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBfNF9/sbqCr4QN9dNu+FPG6dodhpFhHRWlOAYqyTlTRMb19hOapt+joDX3PTiId943JCmvBnIZZZB4vV8b+XhOWXg2M8o9djA5VLmKqiMXbt9RK9F9vnF6sT/pPsgisfsddThN4bJwc9SHeQl0criKIs2LYNLlIbh0W+7VXEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSStG0Ql; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7024426c75dso2333388b3a.1;
        Sun, 02 Jun 2024 21:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717389551; x=1717994351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VTRRLrmnYrgYHx8qS0ANVtZywCtqmZbEI0owI7KnwSo=;
        b=dSStG0QlisQreCq61UCB+/I2OE5rVLMv+0db0IqhptjduDqPYHMJzoJto8p1Vj5e3B
         VIFDLGAYFdZ4WHVbbSueJWbQAPlLLRiG3C2sIFpV5Oo7e3PaMrUq/j4i8NIXv30vGBTK
         pTG7DdtlsDJbLxFEy5PnVp53P7z7OiwlcD21BhAn2sWtR5NKcr6YLF8GX6mgKtDoYzOS
         pR50DZgXC3T/pQ4zuXxQ6BTwVBF+b2tHfIsmcu3MQ4SNoKSEa++xCGCQOgug9fjKOOpD
         WCIp+Mo1wuNf4/q14uFUbdAyja0H0UIWFkoXcPfY2NNsgYGJ1Obx5DG7doOZhpWrej+2
         cQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717389551; x=1717994351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTRRLrmnYrgYHx8qS0ANVtZywCtqmZbEI0owI7KnwSo=;
        b=PH4euMbhxg7Tks6LVbGBduNbnVkAecE3koxpJOAfbloXBZ22FgpWpQkcINFcEVVmnS
         Tv7XlL6DN8t/0gxY0m1urLvV/nYHKHYtGquX+AD5H3YyOigiu6e9XJw0EBE5J/FMTmIA
         kRhCJkSQUXcHbY2KLQ8XJXs1oyVMyv8ls5zFhK+WoAfwsR3G4ogxsU+q25R01LfqWFQ8
         cjQzNqIRUY3Vjn29dXhIq/nATwpGH2xN1jpsw6ickDlVMh8S6U56jgUOAoy+TgnUJNvu
         59UYgeEBk6kG/Hs67A9qY80rWZxbbKdem2ixq56LFeQTp3hCyB2B+7VyZLQU7iIirAqC
         YR1w==
X-Forwarded-Encrypted: i=1; AJvYcCVEuFKQKKUtFv6+w7/t7SHJzYzeAqAn/bBAvwATMvxrDO2Cs2H8YeX4uF37X2FcKgbKCFSEFwEjCxDMG0vjTyR7/cLMN2+XlkPVC9pPf8CjXrJeq5Y88wYZCz/LO3cV7/YVgRteBJPbq6nIhgbsbn0doEKBYQYiO7LZOv6Nkx5U15Yrt8lpmKJWWbg=
X-Gm-Message-State: AOJu0YxpQY4/AHz71AiLl0NfJDvH1jtln9Hv1QLjMmvKe1z9pdeQI3fh
	TulBrg4ao8PZAaxrfBMHPdQxwX8GYvhW1oXOwvX9/5KtEyRToyIz
X-Google-Smtp-Source: AGHT+IGd9W54LZFqyFtmfzcwE7FWvO0kxVoHTxXGpbDjDJ3DynZCuOP6f+DFp8TV/lH56JMRVUJ0XA==
X-Received: by 2002:a05:6a00:22cf:b0:6f3:c10a:7bdd with SMTP id d2e1a72fcca58-7024780a631mr12144068b3a.18.1717389550398;
        Sun, 02 Jun 2024 21:39:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17fd:ad4d:2690:4ce2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70255bf1f29sm2891662b3a.94.2024.06.02.21.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:39:09 -0700 (PDT)
Date: Sun, 2 Jun 2024 21:39:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeffery Miller <jefferymiller@google.com>,
	=?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: mouse - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <Zl1I65i4CkCHzdJ7@google.com>
References: <AS8PR02MB7237FB736DBF67A58798FDF38BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237FB736DBF67A58798FDF38BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sun, Jun 02, 2024 at 06:59:01PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter). This patch has no effect
> on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

