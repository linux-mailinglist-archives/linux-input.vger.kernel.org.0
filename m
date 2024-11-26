Return-Path: <linux-input+bounces-8253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B99D9EB0
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 22:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A396B210B2
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 21:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC391DF742;
	Tue, 26 Nov 2024 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="lBu2E4/z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rtkRwH0d"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8211B87D0;
	Tue, 26 Nov 2024 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732655694; cv=none; b=KIHsvC8us77xyhhVzuBLfbxJjL4uZXwHzvO8Oov9XTxGAGPzx+B2dH605knb6x8U6YaZU7BjQ/GIzPm9aFhuzcgXyatpDXuUJrIROnHuoWg4kBAiDLN5TqWHhf/iA1MfOPzLrUYbPW8NgtarxaQ3zKcx+ks2wrIHr3eiDHk5QRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732655694; c=relaxed/simple;
	bh=ZB7Q8EEDQ5v9izbjOswDLmoKdV8o6G2P6LvqbjXJHSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzCCwarLZ7NUYHwuu2jVeuhcYc9lHvHUW3BSoRrYXUJ2XbjOgoYZEzsLCRhCEqy5n9yv+Nu2a9pltI2XzfpY2Tm5dGc3B5vDXLektNWH+6NbdWUZhG+Fw7SF1WBKuTmLgytzerw/zYV+at4s1VvKTrYNejIEAu8zDR4Gc628ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=lBu2E4/z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rtkRwH0d; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id DB14B11401E0;
	Tue, 26 Nov 2024 16:14:50 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 26 Nov 2024 16:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1732655690; x=1732742090; bh=MaXb4heZ4E
	PnEKRXMD9E8/ioruljb7zXBz5GaHOjAgc=; b=lBu2E4/zs0WgHUJoQajbt+gZuE
	yqjTlQ4rQR4Y3+bjRLp3GtmBtnNE5mzAbET4DSQIU7QxeTU5bSyGnGkA9m2GGBxQ
	iJbxdPQnkfRVStL74ulUtxv4SJINwh8AsvWd6cmdg2YAImUjaedxLHUsoNEcNVT4
	ZW230QDCDF3voT746WIm9CM+qO9SiC0+T6SuxRTx+ySo7KcrT5y+jEAyR+oYM8Dz
	sLm/Kw5fBvJeNgiUDQLZ/x0b568T3jEIdaKX9spIrQhpKDitcV3K0HjjvaQu54Md
	bBNQ5e/9rMtxjMrlffAwF9DCMIEmvkOm9cHujCC+3AMcVcWTEEUBiTBj6G9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732655690; x=1732742090; bh=MaXb4heZ4EPnEKRXMD9E8/ioruljb7zXBz5
	GaHOjAgc=; b=rtkRwH0dtRSFGOsJepoew66M3vMRe7ZB80Us9I5IHnMMuY3RI2T
	RSsjjjkjCkwWh7Yl98yXST1sOcfwGXw8zUm+sPyfJu8qwLTN3HL0UBDZ3anNyQHD
	XQe133SkGIzlNhPPUzjUqY7aMofvba45jwYzf17oAXU4mzqqqbgf7qSoQKu8p295
	a3e3R81mk7enM6uje8wIcIEYGAvFLA7neB/FPdFqGnxKC5aFvV8pAsZfIlO2Jj7+
	B7b8zshClGjBNWpQnM5yj29oZ3VBHARoq1pk/NxgRcZspr06HKl7lyYpHjqyp0A6
	DwBgXmGPfoiqjX/noQoPzzsNeWrttRzH57A==
X-ME-Sender: <xms:STpGZygne0mCYayUw16B08xX97doriCb8l2xJGLNgpEZN1HAaMNvzA>
    <xme:STpGZzC4c_-5idzsWIEuBaNvCp6KpqqmPymGi2M3oYyCps8vrdYKPEKmMsmGZ956f
    ZBkIaldho37a6SqElM>
X-ME-Received: <xmr:STpGZ6HkYB9sM6kTxTubh13I0MnNCl1JlvwdvHDyYcKSo1uZjuM7NsKPgEjuy2iQ_NcuGxr2AK-2Cjlsv5MMiOg4tTmkgfYgQX0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeejgddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgudeuffelfeekgeeukedtheekjeettdfftddujefhvdehtefg
    iefgledtueefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvght
    pdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfh
    hnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehmrghrtggrnhes
    mhgrrhgtrghnrdhsthdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
    dprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthho
    pegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprh
    hosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrgh
X-ME-Proxy: <xmx:SjpGZ7Rq-RBSf09Ib4ULSHmIxrbx_bj_eHcVdiKAcmth01EgkKknbQ>
    <xmx:SjpGZ_zqQwIVwyWJpWBVa6inzMm3faUMvqQTNkcE5qKuGeXdPpYSng>
    <xmx:SjpGZ54RQKUb6QuBu5Us9q-yBTctgFRCpDPE4q5Zrtr98iDCQaeDQQ>
    <xmx:SjpGZ8wFYaBNKgwtefQA8bZIfAARZHMet2pCc-1i0wpoGgA0BUgFNg>
    <xmx:SjpGZ0KSsMX1BWZR0TMY8r_z3ZpRt1RWRqfrUxYcqySUndNuBUjgchjq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Nov 2024 16:14:49 -0500 (EST)
Date: Tue, 26 Nov 2024 22:14:47 +0100
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Message-ID: <20241126211447.GA3782493@robin.jannau.net>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-3-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-3-c43c4cc6200d@gmail.com>

On Tue, Nov 26, 2024 at 09:48:01PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Adds device tree entries for the touchbar digitizer
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t8103-j293.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi     | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112-j493.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi     | 14 ++++++++++++++

The changes in t8103.dtsi and t8112.dtsi conflict with my "Add Apple SPI
controller and spi-nor dt nodes" in
https://lore.kernel.org/asahi/20241102-asahi-spi-dt-v1-0-7ac44c0a88f9@jannau.net/

I think it makes more sense to add the spi controller nodes in one go
instead of piece by piece based on device support.

Janne

