Return-Path: <linux-input+bounces-8856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A852DA000B2
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 22:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EDAA7A100D
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 21:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026851B415A;
	Thu,  2 Jan 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGN1QV3Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193A61AD418
	for <linux-input@vger.kernel.org>; Thu,  2 Jan 2025 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853534; cv=none; b=TgKOZ2ZBZTzi6ioKJd6w0H3DUzoc9Gs2KIw/yxe/T0LmU940mQY8PnF8hT+Whbg/O4RUDK9lsKWhFTM5VFTp2HsDT1KLaBu/9w/yoaRlwULOG3T8RKjKuCvJuh2HZemNVeOlIWfsE7Bd3u3U7iP6Gmar6PLf5RGV+8fYNiqBBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853534; c=relaxed/simple;
	bh=Wtxk84fUxHeb9OopHDTm5hClINIiEiJ8Jkjyo0bNZEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIvp9EdKjlGS/alInAYYnG6A01XpDTLnJAve9vRtpIUjXXi1UFsA7cyt+sIsEZWHPtCyTNFNFrXomhx5s/yqmlOVFF2wwDMarVlrNJkTdGJ8VGAZTt35yQ5xpX8Mcg3GCI1GO3ElZojtkFdH6HuOQQbtgRS0S6uPMHk6YueY9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGN1QV3Y; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e3a90336eso12808536e87.3
        for <linux-input@vger.kernel.org>; Thu, 02 Jan 2025 13:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853531; x=1736458331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjY1FusYh1YryKHAN4zvFm2UZSdXvuV/zDLKxw4TcA8=;
        b=EGN1QV3YYDljyw1O14pYN3vIpmQE9XgnQDFXy2vj3ZuaYrhO5qdOJUCZQR0/Cy5sL2
         k+nKDglR2vfWJt5kd8gDjzr4zlSyB66Tzc+uLem8vlSw40OMJ4YqyGHoLv3RKh5Zg6/Q
         0U/eEH7PpO49saSyqFOEHAsXLB5qUTXhWBl4LkV+0gmsiTMxCr+tQ1nlZKXto+kqRCI4
         Gei5oW7zGm08+/nrbvm8jIRV+MoAFmmfq3oAc5pp1IsmescVEiD0+oeRGV0U/UbCwpat
         ShAenP2j9PFTewYwCURtnz8hu6IuCZq36qTvybOkvHkRiFg69ciPHh3j3QePp+7tGA1X
         bPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853531; x=1736458331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjY1FusYh1YryKHAN4zvFm2UZSdXvuV/zDLKxw4TcA8=;
        b=jbsG/YzsCtLeSUkEFMui7BDIi1HHyV286YhCSP87PHbjc+hmNrW8j/BRYm9kTVM4UV
         sOxXAyTvwV2FN+W+iM8cYz5mXye0BnbVCDKC7mj/LABKFX/r8CiAx35pz4NUzfhlSJcA
         oHGQNiR57uemipzoEYtMdNXya+9/IJsF1owvH1vzxzFOuGMj2CGIC7EDADH9A7Jiq350
         yyy5euZsWDE7c8exhrI/mwxjJqxSRsAguwK2gfaumg++rcnqEPpmxZZpi7J5OZobXDwV
         LMCksQ8CP0t5TqU/iDy5W+nIFucr8MtKBrw8V+0HY/hpDJqM5oPFdnSS3CcKv3RL0qVg
         G+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUqKZo66pJXqr9Mw0NNhZZst+3YwGYH/rD5Puq5IjnzJXQ9TuAS0mx1BDLXtLhXC5qE9/hiwhrLiHbwSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTpQOhjBXFUvM6pC5r6piMK+D0Pljz4tAEVJQj7o4/DQWNnMLg
	sCsyk/CsNo7dNvAp8CtrjO9VcrE+cn/OdVQGUQjOXj+FsygdNpQ3OG1BDiaS+2zvfno0a06IngA
	o8tzBzqQQyaDNKol2zFZyMGc1OfAFWGuSnRakGGErOQH2CMtS
X-Gm-Gg: ASbGncugazC1+bO1i11tgjlsqblGWPXM8OIyWfsWnjk4nZgpkyVJW6R16rinmMzOXDU
	/jzNJvLbxrRdjc3X0aY2YEMPpEVmWFtep/yWe
X-Google-Smtp-Source: AGHT+IFlli5v1Leswr5mSGgujdwQIN4FjO+4y/Gz8GAuOwdSl6akwXzEIS6HSR/IZ1Qe161dv3tbI4KcYzqniYCjvoA=
X-Received: by 2002:a05:6512:1283:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-5422956bf40mr12610797e87.52.1735853531271; Thu, 02 Jan 2025
 13:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi> <20250102181953.1020878-3-aaro.koskinen@iki.fi>
In-Reply-To: <20250102181953.1020878-3-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:32:00 +0100
Message-ID: <CACRpkdbfuQuTQ028=hZgRhOPiw5AbPLyoZTbRCbvNDQ-e8UajQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: ads7846 - fix up the pendown GPIO setup on
 Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Helge Deller <deller@gmx.de>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:20=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> The GPIO is set up as an IRQ, so request it as non-exclusive. Otherwise t=
he
> probe fails on Nokia 770 with:
>
>     ads7846 spi2.0: failed to request pendown GPIO
>     ads7846: probe of spi2.0 failed with error -16
>
> Also the polarity is wrong. Fix it.
>
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

