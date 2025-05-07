Return-Path: <linux-input+bounces-12211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B2AAE7C2
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 19:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5F84C806A
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 17:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B812E28C87E;
	Wed,  7 May 2025 17:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEc0Qnke"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6628C870;
	Wed,  7 May 2025 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638623; cv=none; b=VStOQYZnRcUHu4rMYz9MQ1I88OAxjVQzuZfxSW4sfZaaFcycKLFFX3WWGj6eWOHKg6HHsl9LTbY1023VQFbNPcrXLQ/Ur3kDWUr5q6EvFzyqu2p1w3daJqrMBGwCnFnZESy8eQeOLRVglW4Uzs37Qq7GjtnHVBgwAp6IUJptDNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638623; c=relaxed/simple;
	bh=CZIM53V/CACdXHwWvwrn5G/fpdtqWdsu0oHSclRY/Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X76GDIMhkt3hb1oBegW29FDN+TQteSZt65cP4ezk0SvOEz0pD5kWI8dByKmEt/k/nOCEwdoGT20EsV/RSFCXxFfTwPe7iiItuOeEFwQuiI+zk3SAiJpOiLSox85WTu7BWc9F1PBbuaX78wkNJ7ZfrWge0muSodIne7PDQXIABHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEc0Qnke; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e70a9c6bdso2333515ad.3;
        Wed, 07 May 2025 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746638621; x=1747243421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M5Ji+uuxnEpYG8OVr9njO8BnRx81MlfNR+SP9L9ula8=;
        b=KEc0QnkeYH53LEi206iC4Y30QuKnHTWWb5O9kV0S+KKxtgHudHGaFwKWJxbvpx7gyl
         e1CZgLdUXXucc6S624R9rK5GT4MUCet2fIB9ofL6apE2pbzFcb1Ow1QftwfOElnXrug2
         TLlp+r0P4P8bBe5aLRrDT0fVXBu1YHJDegjFR/R8EpbmT4nEWJph590zXq4qyGuHhWDg
         3za8rR1lniQOTzKQ/zYaDJuEJNYnl67zhTTkpLX+WvcBLtF6rDv9oTCfVtsLifuIjMzr
         8DB6YlXLvTidkfVM2MoToMfSZK4+0o80ZRBZSAW974VDqujlxp5BG1OtjlDMt5Jj+ZGP
         L8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638621; x=1747243421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5Ji+uuxnEpYG8OVr9njO8BnRx81MlfNR+SP9L9ula8=;
        b=itvYxpJjuHZdigAMvRURZjG3ncxK5rDKUEffS1RUk+0UyAilpg97emuCOJUNu6fFrl
         rzT62jpf7e8WtPBuf6vCVklANSL489T8cJEIh6qCXo/Gt3thWzvpa/DZg1aWqc4VY5/C
         /XoVPKvy8MYKdBrwwbBIsYHla11D1WIeCVEADXIdyYrs7CeZNpNEpT/ggYsx9h0qKsSC
         Id2CVS6rgHanKWyQjw7HB/XBuTDDLKkfppxBsRldGay3hRhaV++hHNGl2XPWnJDobBZJ
         WP0ME8FU7mR3l9WLH1gfqucM3Nx4tOq45W2NPrZBsrynQzyo1kKt+aL2Jc2x237cyL75
         6CUw==
X-Forwarded-Encrypted: i=1; AJvYcCVdDl0eGFm2qee38bSprbi6IwcoFeu2vttmR6hzUqLG1wyyzCWGMhic0juan4zFiOLN0vPNzGeC87bOVA==@vger.kernel.org, AJvYcCWPbxKsLsnFm4fN6aQsNMijffeYvuxgUBfoV1dh4ZPV9Nfl90vaUJQKLMN7vwy2G5yCbNFvrI0iRV/Pe15+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2bL2tOPnJXfS8BHBsv1+ivQ4jTzXmlvngT5utDGnUXBNaSgz
	ZHy4PwJJIiioEuQQ0+2d7iF9GNwo3uxfKnTFw2lJ4P4dcUzYmLZO
X-Gm-Gg: ASbGnctlaLzgr95xVoGd1H9NRnU06udzswJfGI4eVGc3VW5anOi3o6S0aQAI0HUpdIK
	GfHOxm5w+4sfkAI5g/lRwId2pwCP9a18ffUeAdhhTgpPnkZjevh2qCBXAOHc8dnZ1S9PlBIlfA7
	R+AwYpkJKn8mEPSpQYYZktym1045h0NgxjTFf4QsxpifOKQQXdTQVIEH4bas0TqciTDR0HBIS/K
	tdooJYehT4BlKlTuIsE5JKMDD7RJlo4/MQ9qit1dMRvdSC2kZPQ8PISoEhFHKVvlygIUbPbHNql
	VPeDFpnXwzRdyzYU1whUYFipALdPvahxv47advJB
X-Google-Smtp-Source: AGHT+IFGGcC8gJZOJrW9zJod6Xu84e7M4v0QbiHjX7vT8FG0WI6hIpkTKSh2B0g5annuZNKE4+pLrA==
X-Received: by 2002:a17:902:e888:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-22e5ea42275mr62946885ad.1.1746638621285;
        Wed, 07 May 2025 10:23:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fe5b:f2b0:d1f:f5ac])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e6612e8e1sm17328025ad.132.2025.05.07.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:23:40 -0700 (PDT)
Date: Wed, 7 May 2025 10:23:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Woojung Huh <woojung.huh@microchip.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] Stuck key syndrome (was: Re: [PATCH net-next v2] net: dsa:
 microchip: Add SGMII port support to KSZ9477 switch)
Message-ID: <im4cvmgjmdztjsvhorxt77t43o4a7rixoqyawp67jwijsg4vpn@jdl7m75ts2pc>
References: <20250507000911.14825-1-Tristram.Ha@microchip.com>
 <20250507094449.60885752@fedora.home>
 <aBsadO2IB_je91Jx@shell.armlinux.org.uk>
 <20250507105457.25a3b9cb@fedora.home>
 <aBsmhfI45zMltjcy@shell.armlinux.org.uk>
 <aBsu-WBlPQy5g-Jn@shell.armlinux.org.uk>
 <20250507153236.5303be86@fedora.home>
 <aBtHmNGRTVP9SttE@shell.armlinux.org.uk>
 <20250507135126.7d34d18f@fedora.home>
 <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wipkOP939yPWroH_u+CQGsJQRSa_BHsg4cLNPRPq86sAQ@mail.gmail.com>

On Wed, May 07, 2025 at 07:46:03AM -0700, Linus Torvalds wrote:
> On Wed, 7 May 2025 at 04:51, Maxime Chevallier
> <maxime.chevallier@bootlin.com> wrote:
> >
> > So, same as you, it'll take a long time for me to say with some amount
> > of certainty that 'i8042_unlock=1' has a beneficial effect, of
> > course unless I see the problem happen again in the meantime.
> 
> Christ. You'd expect that any i8042 issues had been fixed long ago,
> but the problem is that the chip doesn't necessarily even exist in
> modern platforms, and everybody just fakes it.

It has not existed as a real chip for more than 20 years I believe. It's
all faked in firmware and embedded controllers that fake it in their
firmwares.

And newer firmware tend to implement less and less of it, just what OS
that devices that ship with it needs.

> 
> So the platform presumably still has hardware support for it, but it's
> mostly in the form of "take a trap when accessing the legacy keyboard
> ports, and fake it in firmware".
> 
> Although it doesn't help that there are literally decades of clone
> chips and hacky real hardware that extended on the i8042 in various
> more-or-less compatible ways.
> 
> Which makes all of these things almost entirely undebuggable.
> 
> I'm surprised the XPS9510 would be particularly troublesome - I've had
> an XPS for years (older version, obviously) with no issues outside of
> WiFi sometimes acting up. But random firmware...
> 
> I doubt it's "keylock active", but who knows. I get that on my xps
> too, it's a random bit that doesn't really mean much. But - because of
> all the reasons above - who knows...

It is typically harmless and whats more trying to "unlock" 8042 when it
reports being locked might confuse 8042 emulation.

Thanks.

-- 
Dmitry

