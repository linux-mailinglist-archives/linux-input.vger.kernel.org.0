Return-Path: <linux-input+bounces-1666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D99848F8C
	for <lists+linux-input@lfdr.de>; Sun,  4 Feb 2024 18:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996FF1C212FA
	for <lists+linux-input@lfdr.de>; Sun,  4 Feb 2024 17:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50B82377E;
	Sun,  4 Feb 2024 17:04:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F18E2421C
	for <linux-input@vger.kernel.org>; Sun,  4 Feb 2024 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707066246; cv=none; b=mNLu8itMl6NiTBbneZRly9Hrd+gPrKup9zAyq6lt99vb/l8xOdpTtsu5Sro+lgKlS6OEAuRAcfY34vKP/zUmp1Bl88VwmpuxnBiLBOP8P5DfsEEpu3urnDZuCAvOS6qlHyr70wK5xLDvkhKXwSme5lZVW1F4eCqU0scLWs1JvNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707066246; c=relaxed/simple;
	bh=Hc9tUiOGoKDix4zY3uj/vZxzd566MMLdtIeaQ+DJ8F0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsO6FteQYwgypRtnW4o2FQ8/0eAKu8bCliEOlqCsK+drKxD73zEtIToRe1lBFNnT3Iyxv5GI0l9TrknLhVB5ibw3okovEANcGsdiuOWUyNKutiCH1MtjbZHU9A+EvfRt1L1EQhuT7RwfTEGuHtcRIdCWe0D2tz+Kk27PZOu2GW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-30.elisa-laajakaista.fi [88.113.26.30])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 61aa5fc3-c37f-11ee-b3cf-005056bd6ce9;
	Sun, 04 Feb 2024 19:03:58 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Sun, 4 Feb 2024 19:03:56 +0200
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	"Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>,
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 00/39] ep93xx device tree conversion
Message-ID: <Zb_DfISgoNyTKWMp@surfacebook.localdomain>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>

Thu, Jan 18, 2024 at 11:20:43AM +0300, Nikita Shubin kirjoitti:
> The goal is to recieve ACKs for all patches in series to merge it via Arnd branch.
> 
> No major changes since last version (v6) all changes are cometic.
> 
> Following patches require attention from Stephen Boyd, as they were converted to aux_dev as suggested:
> 
> - ARM: ep93xx: add regmap aux_dev
> - clk: ep93xx: add DT support for Cirrus EP93xx
> 
> Following patches require attention from Vinod Koul:
> 
> - dma: cirrus: Convert to DT for Cirrus EP93xx
> - dma: cirrus: remove platform code
> 
> Following patches are dropped:
> - dt-bindings: wdt: Add ts72xx (pulled requested by Wim Van Sebroeck)
> 
> Big Thanks to Andy Shevchenko once again.

You're welcome!

I have a few minor comments, I believe if you send a new version it will be
final (at least from my p.o.v.).

-- 
With Best Regards,
Andy Shevchenko



