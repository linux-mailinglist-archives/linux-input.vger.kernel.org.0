Return-Path: <linux-input+bounces-12208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989FAAE377
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 16:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED531C0142F
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 14:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1446128031D;
	Wed,  7 May 2025 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="G5d1RD5p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA37C204090
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629186; cv=none; b=ktP6I96yyDwXYC/7JSXkrUMMm9a/eBxzgeVRFVbdON7XwfRrUbZh8kJgCLP3gtHe+9ZAlypXs5R+fVBVHC2bbBkXOmRY8a6MrF/b9yXFfMktedrs7ZYYPqWVpgD8jFyHmDdkxBDxtBA+4ajfXc46cr0oR7X6VBqmBVNi0S/zq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629186; c=relaxed/simple;
	bh=k4A+WKVjlKLkBr796A5ZlJVeqnQawkqB30yX4FRlJqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiE5SNX0cm4dtSoOHXV/V/XDic2o+kOUXTo+HNmlCrz62MziOY6IIKe6tZ9cmwrHcKpqgqOo9YbQsNI9xDjGJvMAjX8jtgDfGSpbtaMCBg/tQbeQMDZJ+fyN/Iu4BVbbd/59LF3J2X/2e/mZdpIHvVkmlK91Ea3r7dNsLQY0Iy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=G5d1RD5p; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so4992859a12.1
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 07:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746629182; x=1747233982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g2bMcU6pv7MMr64dYZxULRwXd0JLY8iiMOetVMeWmzs=;
        b=G5d1RD5pbDeBm7PHzhiuSfYGJwGYxbpQbrUTVR7wFbWw/uB6ifG/Ei1TE/uhVuR4yq
         K+NpTfHutZUZEWwReKHpXbNWYtJ8ZtgPMf0AmMoCGtY5r/bmbbNn/U9w33YxsYClI7tK
         GCz6MR23qX2V+1pO8K67oXJU4vjfn3CDXHKQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629182; x=1747233982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2bMcU6pv7MMr64dYZxULRwXd0JLY8iiMOetVMeWmzs=;
        b=oxpRdLlCY/ZTGB9D4lFszRONAhh5qhpRT+5TxXm2Q1Bsqvom4Glw0o3bR68+ih+sB1
         xOicnxRXzPO0ASNMZmtcLbiRAdzbQkfkbTLVQ9huOoDZBf8qVNOadTiPjuygKPWga0aN
         DhUDo7FFVj2LvjIZL8BLU0w2wpQV2UHQXvmOYoSO8J2v2gScl6/uMCet0u6H/3HWsgeR
         n1wwBieg4sxKs9Q4R/tcUgVJ4jz9YMKewNbveDkHeGBA3klLrDbBCTqd4Jd9gQ/8sDE7
         DQV8NK9uTdrC+whu3pRSoOQeppH5SpiUaPIK5VbPWyUFjiWJEXeAl/ESyr3bSP4t73TT
         hGQg==
X-Forwarded-Encrypted: i=1; AJvYcCUxgkjYn8fMhCfL0Ou8K+lqV9NVfSxy42cjU8NwUV/9FSqC7DJYIR1Ym4Qw72aZaM8So3FTFa3AZjCg7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTX+bI5axZPUK1t0H6M6TyAlgC4nCOpjObmq0thCrhOCSypTsj
	wXPjinZcmEqXBUIbwOv7b2BR6Jp9Fbscr4xJVLFfQFLA1bHohuaKAbniAF2U6zLhb0FAooDqKY+
	j0nQ=
X-Gm-Gg: ASbGncsK9NI9v+AxKvlT8tW94bWNMPdf0US84VTnkEmgBD7FV6u3k7K8RjfXiNbvsBQ
	b9kBCfdgsQG+QVHuKCBuNOGO5dg0FErWfIk6TudRuYdHb/k4u7ekZCF/RYCeZfkFUYcQsQgNmMQ
	ARyBw2/hRXgZm8U/Dhf//ERhIkAtboEmSqjv0KH5DheVkpJpXYOigjaoZuvd6jwW0hTBEwydK9/
	qi0IwjgO2XZ2bVK5iCmhYcWijHtYQBBeJ/gJjlRrxwAvvpxq2iayrN7cWhDAjPZszkFmFx1L42W
	CONZ54z4aW4txWrxSbvg4IE2uAUw1LmT6pu4x7DL4MDkY5pj8eaXXEOkAHKyCudw634ZmeovDeQ
	NAI/8Zeqa6lDjJ9Y=
X-Google-Smtp-Source: AGHT+IENhEv0gpS+2xzPFuNXGQ5lqzci5QDE5cxN59tR+r6VML6rSeTM1xWroTncbHsGxBA5qFz52w==
X-Received: by 2002:a05:6402:3548:b0:5fb:dc26:dea3 with SMTP id 4fb4d7f45d1cf-5fbe9fa7ff4mr2790306a12.31.1746629181807;
        Wed, 07 May 2025 07:46:21 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c5c3asm9607848a12.21.2025.05.07.07.46.20
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:46:20 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so12437408a12.0
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 07:46:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvEPdm762xKIDtptYviTd82Jo1nopGr5Lefn3RI+gd029pIYpkDY4rZlth8yIiF4qyfWwr1gqsYyK0wA==@vger.kernel.org
X-Received: by 2002:a05:6402:13d3:b0:5dc:7725:a0c7 with SMTP id
 4fb4d7f45d1cf-5fbe9d8e4edmr3269182a12.3.1746629180115; Wed, 07 May 2025
 07:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home> <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home> <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk> <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk> <20250507135126.7d34d18f@fedora.home>
In-Reply-To: <20250507135126.7d34d18f@fedora.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 May 2025 07:46:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
X-Gm-Features: ATxdqUHqKH7jIA0FPsMKHdgnwYnSCzHeIXsbBOW5JTZ-BTyfnAbDNPcwl30lM2o
Message-ID: <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 04:51, Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> So, same as you, it'll take a long time for me to say with some amount
> of certainty that 'i8042_unlock=1' has a beneficial effect, of
> course unless I see the problem happen again in the meantime.

Christ. You'd expect that any i8042 issues had been fixed long ago,
but the problem is that the chip doesn't necessarily even exist in
modern platforms, and everybody just fakes it.

So the platform presumably still has hardware support for it, but it's
mostly in the form of "take a trap when accessing the legacy keyboard
ports, and fake it in firmware".

Although it doesn't help that there are literally decades of clone
chips and hacky real hardware that extended on the i8042 in various
more-or-less compatible ways.

Which makes all of these things almost entirely undebuggable.

I'm surprised the XPS9510 would be particularly troublesome - I've had
an XPS for years (older version, obviously) with no issues outside of
WiFi sometimes acting up. But random firmware...

I doubt it's "keylock active", but who knows. I get that on my xps
too, it's a random bit that doesn't really mean much. But - because of
all the reasons above - who knows...

One typical problem has been "the interrupt line is wired oddly", but
the fact that it apparently works *most* of the time means that that
is unlikely to be the issue here.

              Linus

