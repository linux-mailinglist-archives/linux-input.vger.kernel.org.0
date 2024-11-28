Return-Path: <linux-input+bounces-8299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F28229DB3E2
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 09:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62F34B20FBF
	for <lists+linux-input@lfdr.de>; Thu, 28 Nov 2024 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D25914BF92;
	Thu, 28 Nov 2024 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="fJMgSEF7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oJjmSH2U"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216414AD0E;
	Thu, 28 Nov 2024 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732783074; cv=none; b=KV2w57S6/t43fJQ9kXiITh9L9Sqk6vl+J/1SlLuT37rbnb56cSwolUjmn/Rh2d4CPu5uUc/J+nBtceuMKqY4HyW+H8aV2NZMxCk/LszJaj4ziCxWi8KZYDT+/Ua30cf8UkZUuLNqJZ+P/g08EiQX8QPBD37ohyJAs3geQ0+mZKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732783074; c=relaxed/simple;
	bh=EITsOYhGCkSl2HkBvSDK9NRXeGTI124s3/oQysoJO5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxbKrGt3uFfwqStpfcEE/jS9uU1C3ZOuLrC2d70Ynzd+8yVEsiugzUrFFVWkbzjZS1jaiBlQHNI4qzbB9duy5T03UIY9p8RMYIuLTCjn+Cxt0rkl2Z1VUyfboJKjs3tcT9aWtfH3nNNc92rf1BinwR8Od3W+iFK+0iwx1WkvQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=fJMgSEF7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oJjmSH2U; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 52B491140214;
	Thu, 28 Nov 2024 03:37:51 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 28 Nov 2024 03:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1732783071; x=1732869471; bh=46hNflVp2j
	+I4D9so2RIss0CrD+H/bB82TUjb66XMME=; b=fJMgSEF7tmmQnNxlSxaZOszaRT
	PH7uh/1HA61ACBFMh0IARR2U23wrxvRrVv+57Rwl5FMAF1BIVo4P2i1NUY+SmyNj
	QT3DkH41ud++tpM4CD6Y7C/2+tyxxhN8hGrPCRA2eR6xu2Z0Aghqt55WGGxo68DH
	Ju6NHQW6Vt8/6KoHDqIC0Bvuq48CSr8CBsICXvBdGFV9mv+/ExAjcFJJM6di/OnJ
	OYsXDij0RAByyCtwqhL49wHpgTE3WdJZaxRHJpfkgBIv0nX+w7WKamFkQ+PRFNmu
	/PKBeqbHhpsDbVWCUj8XDamxy4hTzccl57HLwK+jwx4vPE5x6x0XYAV7/nZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732783071; x=1732869471; bh=46hNflVp2j+I4D9so2RIss0CrD+H/bB82TU
	jb66XMME=; b=oJjmSH2Un/DuQ4yoQM2gdQ/taznaoqQV2n9hb5SJwDacVCV0/xt
	eOFocC4CT2R4JmpZTP/l8ozqC2jhMaYNvFrsVtu2lRiu3N+nSaks+OF0Wqiz2E0y
	Bk1BA7BYjFJuz6H0QOWSmCtTnTEbtwPKco2FhZkpwIXz3KTw1V17bhdw3+qHPqRO
	f05wYmqDVqMpdI80AmsYjt6IVulsVN6KIo6nKBDrEIYci6ueZVhue/2Edh3yyKeP
	MPpvFx5htKHsrxJp4ZAFkoMvOx/BM97AueRrcncxqhfA3kqWp+d/xJaTi699VNry
	UZERJNL9t97Shx0OhJ/h8ulF7lJpWuXHUfQ==
X-ME-Sender: <xms:3itIZz5jE6xs6QX7jOjfmK48yWSZfPKQMdKtR3Tei8s_fqNSw1tt8g>
    <xme:3itIZ44RiTg-AdEFxy6llExy1XT4rsF9j2gpHILQOclL52WPyStnbsM1qt1f3Vcuw
    wD7ifbJoBJbQijfApY>
X-ME-Received: <xmr:3itIZ6dlaoJYmQHlKmuBXqpKrbidflFecV_uq9Cjf80L13ePEBb4z4RA8xD_anZhISYsyrHiM0uId1tMIxprY8jtCCBNC9aO4Gc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedtgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgudeuffelfeekgeeukedtheekjeettdfftddujefhvdehtefg
    iefgledtueefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
    pdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    grrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhes
    ghhmrghilhdrtghomhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhr
    tghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtoheprh
    hosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrgh
X-ME-Proxy: <xmx:3itIZ0K-eOv218NaJNGxYnuqSmcQCJUhezhFW5krh1DlXXFEI_4jSw>
    <xmx:3itIZ3ISdJqupmJlPmKR1ZTd10I9LhK2pFCpln2ep3cCmFKPMRgIzA>
    <xmx:3itIZ9zi_Gm2jlYDMxY5vnIDLO3gKxkpgHv30gwtqhIfiacIDVo3xA>
    <xmx:3itIZzLR67Gk9G1XNHj3CVU7-G0oI-4Us-x7llM7QZAOVpm9IjFIeA>
    <xmx:3ytIZ46GeJhAVbkyyyA6OZK_oG0CbuZhByk6M_61ooitmTYADDPNRwA5>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Nov 2024 03:37:49 -0500 (EST)
Date: Thu, 28 Nov 2024 09:37:48 +0100
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Message-ID: <20241128083748.GC3782493@robin.jannau.net>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <Z0Z7Lrv3rBfzac_e@google.com>
 <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
 <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
 <969b7440-5173-4ecc-af31-c3cd1f3f5acf@marcan.st>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <969b7440-5173-4ecc-af31-c3cd1f3f5acf@marcan.st>

On Thu, Nov 28, 2024 at 01:20:09AM +0900, Hector Martin wrote:
> 
> 
> On 2024/11/28 0:29, Hector Martin wrote:
> > 
> > 
> > On 2024/11/27 17:29, Sasha Finkelstein wrote:
> >> On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >>> I believe this needs to be done at the SPI controller level. See
> >>> "cs-gpiods" property in
> >>> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
> >>> as I understand, allows overriding controller's native CS handling with
> >>> a GPIO when needed.
> >>
> >> I have already tried doing that (adding the relevant gpio as cs-gpios
> >> on the controller)
> >> and for some reason none of my attempts worked. Since there is no hardware
> >> documentation, I can't really tell why, could be possible that we need both
> >> native CS and that gpio, could be memory barrier issues somewhere in
> >> the driver core,
> >> but the method above is the only one i could get to work.
> > 
> > Are you sure this isn't just a pinmux problem, i.e. the bootloader
> > initializes the pinmux for hardware CS only on one device and not the other?
> > 
> > See spi3_pins in the DTS in our downstream tree (and the reference from
> > the SPI controller). If the rest of the SPI pins are already working
> > properly you can just try with the CS pin (same index as on the gpio
> > spec). Ideally we'd list the 4 pins, but someone needs to reverse
> > engineer the mapping with m1n1 gpiola since we don't know what it is.
> > 
> > If it really doesn't work with native CS and proper pinmux then cs-gpios
> > on the controller should work. If it doesn't something weird is going on
> > elsewhere. There's only one CS line, needing both makes no sense.
> > 
> 
> Looked into this. The pins are 67=CLK, 68=MOSI, 69=MISO for spi0 on
> t8103 (they should be added to pinctrl even though they are already
> configured by iBoot, ping Janne).

queued for the next revision of my "Add Apple SPI controller and spi-nor
dt nodes" series [0] and imported in the downstream kernel.

thanks
Janne

[0] https://lore.kernel.org/asahi/20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net/

