Return-Path: <linux-input+bounces-10352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C5CA445FE
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB3A19E0298
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 16:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0759A191F83;
	Tue, 25 Feb 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ts+5z7ME";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="7IMscJv+"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5A18FDAA;
	Tue, 25 Feb 2025 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500730; cv=none; b=c5ebHC0ufS9G28muSX0jnNW5ggZ+I4XBrE8le3Ewt09CclbUawyABh5r3FK9kxUc7ruthjoHOlehZX72NDvPU9V39MC8ft9t8cR9rEKRcj9ZXLN/pawcA0gCf0VbgSiwTSoaKHpuWYoptm8wfBUvUb2O+LDWIp+Nd8wElc0ZRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500730; c=relaxed/simple;
	bh=W7vDGYr9AWUHy42wWnsHFFo2msgoho242tXHNbm/1zg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Xl07VIl51eU62+y+UV6nJKDNsLrAPudl7D+uy9ktp+yf6LUOdcIeLSmM/bWkPFfhrL2vs/F6gbCRKM6wDEcHcE8r/6W0gRExgfMN4k2NDMMyMDdVWq7W9TSlU24sgCWP2kAryVe89/jUiz24f42uDJCa28AMJlJ8oPe+KaPwFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ts+5z7ME; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=7IMscJv+; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 6204311400FF;
	Tue, 25 Feb 2025 11:25:27 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 11:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740500727;
	 x=1740587127; bh=NgNWJz4/ej91tUlb/G6+Viw2nzrffwayT6pC5YFAhO8=; b=
	Ts+5z7ME5Q8OC30nbJVhSMKsOdYysD4nm6jTVI4jooMa2+sO/0wBLKqZZ5V5bbdG
	LxgOcxD/iZCSCmj6NPcMvNaToFkyCe7hPLhDw685n4CzTBChKu9j8QYfS1Opp1ZR
	y/kS2NdLPJEFoODJI4bAMhfoeAp3BcvqlgX2wmILD5LO+WW6fa5Rt0wCsPrR2Fkt
	mPtzfb5E4OApxqwkMp8ZlYej3DAxTnDNIzt9uPlhSOzgTxKmw+a5BRcDhcUo+bv9
	ffySlOeAQLneC0mPDWxBJg7ioHDmWCtUx1qEZpwfuArf3+SoLHqWVGH1bwFDV3zu
	yBPKhWjqFBIrh08VnspmoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740500727; x=
	1740587127; bh=NgNWJz4/ej91tUlb/G6+Viw2nzrffwayT6pC5YFAhO8=; b=7
	IMscJv+4prsSX8+62EfnIXjp33+Cap/59Fm7j9L6MPjVCg1h9+D2tV5f+mnsi+Iw
	yrkpybyHb8IL70gX5I5c5bL9xRAduilaZUnyBBYKH4LmrXxFosBzgqCr8eyTqTsq
	MQCYnjBQ5TZ9V1LN3vgGD1do4Pxji+vMWREjvNlr8TYVX6YwrDowUT1zQFOipd3H
	hbXSjuEg0vfrndit2+/op2bgFYQ/1vQh6/rOx9KB7SsUi2a7sGsgx41VmqMRZ7aD
	BbgAwlMKUr/JxtBQRJFxlJZvLmrzYct2trhc4zyUeUcQKYtwUBDhrjcLixQlQ6Xz
	RrKUOPLyhMPcOoaIbFH9g==
X-ME-Sender: <xms:9e69Z07XuZLCb2mg1ZRkabdFDyqSIvS9qkpiGvKb-qNtTP-YVf06Pg>
    <xme:9e69Z17cbtisUffNy5O8_ocMYcYeIGrPXdt-Jl3BL51QGh8OjQVoCzS4WSRnXdsoc
    Dv5akB7NOyD5O3KBQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
    highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthho
    rhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhroh
    hkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhm
    fedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeholhhivhgvrhdrghhrrghuthgvsehkohgtohgtohhnnhgvtghtohhr
    rdgtohhmpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinh
    grrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvd
    esshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:9e69ZzegOGN6bUlJD2UGbVzh35QPUiFSoFF3xeY7tCxHjW-lGUaYEg>
    <xmx:9e69Z5INpchUfssxhI6lz-Fnuj6gjsNMslOX57YqjYGZ_w8yg9x_KQ>
    <xmx:9e69Z4K3UxN9cBGMVc8Aq2knw8HXcPrwkI6mnDOYjnS0aPPpW82qOg>
    <xmx:9e69Z6yKQtoTIfgtx_8LGs0EDnXR_l7EzCykHIjUAyOttInnOdpBWA>
    <xmx:9-69Z2yggIQFeBrIjCRTyRbAFT6agWMy-ansv0zzLMebHgySR2eqe0QQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B96FD2220072; Tue, 25 Feb 2025 11:25:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 17:25:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Yu Jiaoliang" <yujiaoliang@vivo.com>,
 "Oliver Graute" <oliver.graute@kococonnector.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
In-Reply-To: 
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025, at 16:47, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
>> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/tou=
chscreen/
>
> With=20
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 30e5b19bafa9..014f033ef1ba 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -250,7 +250,8 @@ extern void cleanup_module(void);
>  extern typeof(name) __mod_device_table__##type##__##name		\
>    __attribute__ ((unused, alias(__stringify(name))))
>  #else  /* !MODULE */
> -#define MODULE_DEVICE_TABLE(type, name)
> +#define MODULE_DEVICE_TABLE(type, name)					\
> +static const typeof(name) *__mod_device_table__##type##__##name##_ptr=20
> __attribute__((unused)) =3D &(name)
>  #endif
>=20
>  /* Version of form [<epoch>:]<version>[-<extra-version>].
>
> the warning goes away and stmpe_ts_ids isn't included in the .o file
> without having to add __maybe_unused to the driver.
>
> I would consider that a superior approach.

Not sure, I can see how this avoids some warnings, but this is
currently the only remaining instance of this problem (I fixed
another two recently), and in most cases a MODULE_DEVICE_TABLE()
entry that is completely unused ends up pointing to a real bug,
where there is a table but it's not also part of the
device_driver definition.

      Arnd

