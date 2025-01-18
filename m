Return-Path: <linux-input+bounces-9368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A2A15CB3
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 13:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3441C16689E
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7073A18D626;
	Sat, 18 Jan 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="mrx4BB+C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XyvvM3r+"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5180B;
	Sat, 18 Jan 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737203227; cv=none; b=G79jlU6Tm497IA2nOVm+h0kttK4iOvK9VdyqmXaYKfsBIW8Ul/1pQkgY54b+r5K7kFSkG8XQzrPIsGIpFCmygcfUy315hRehjEMVGf9AHND09AEzH3n3OD3I9qQcW59nMQCA75C6brvSwcIi0wcFpu4BzkCkZWjjQ8szLUK5UYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737203227; c=relaxed/simple;
	bh=mSr5i58I7lXZal9qLTgWg1kcI4A8k5DJ/49qJIGM0RU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tVQglySPykYTjMkYlzWMk6Mv1bfoxBLfSsZRBb1SBwH0RXCsqdgv6zIzQcge45xzaGk/yhs4o7PWKkPzk13ftROE1oYykFvuHigPuOmcRt4yEbx65bew1R9DMN30NgadIDMKs2yEzxXtm2j+dfZOKSkp6Dp7I3DJYkYUXGHOQZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=mrx4BB+C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XyvvM3r+; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 43684114016F;
	Sat, 18 Jan 2025 07:27:04 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203224; x=1737289624; bh=WoC4A91iFsIqxL2BMCOUmzr7+gQTh3p7
	d4FX0nmuspQ=; b=mrx4BB+CmssLyUf71Eqo2eu7tVcNAEpzowoyXpw2lk/J8Ir0
	SXP8TsW1lR0pw0aNz8vnm0tkAD5MU4LICWDR03MNQpiKZBmfwCLoQCBrr5wu6sWo
	qFlAI555DMqQ1WQ5ofmTftZ+E94V14k/PiUuKulfjTC4o5+okjjiyRnoKlOMe8PY
	xzA8Y0Ei8xKOJdaQWHI4OV94g/wGucHTV6MRFXfoN6Bqmcg2tPtB/Gic/X28lgnj
	BOwKnhChtFBCr/wkH0bno8zTVivWuA82sw+Rg26H8ShnKI1HJbJk8Rj3xTYveycJ
	xLmDrIN4v2qODW1TktrCg02zMENAjF/TDMZdJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203224; x=
	1737289624; bh=WoC4A91iFsIqxL2BMCOUmzr7+gQTh3p7d4FX0nmuspQ=; b=X
	yvvM3r+LP6WJF2IziGXYIk1RVmI2BSMaQvU/b8soNFY22sIwlqg+mwlyVM2BVyzK
	F1Z5PgmTHDakMk2oXos9PNzWH14icbmfQKpE+PYZS5udy9G02dJp9T+Rv5hcnGjR
	WBJqQitZ99CUQyQFplHJ3wrirdB9Ro36OQmtQ1mm4Jr891n1UR0eidfSCp86qL40
	aGTsa3UGWrfzX9mwF7SCbxxw9nT86cpvnuQa6/6XLc+r9doASZ7wSg6dqr+r/qKr
	WUBtu39bAPHex4QBPDEP29BmKqc0RZ4GEWIzUmEAbDNv8ApVO5XxGaHAQtt3tVTP
	f9Tk88RJZXnZkbhEkYrMg==
X-ME-Sender: <xms:F56LZyaeWD18yhBu8BgFMPfq6SttXnImRIU6SZkgpIN1Obh5T3g_Ew>
    <xme:F56LZ1aWz8NDvKFJBjcWxs0MlP-LDVJNldPgkbkBAsGDBXo7R7WrgrF6lmSdhaLGD
    tMibjXIYThcUpYvR8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihuggsvghrgh
    essghithhmrghthhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilh
    drtghomhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:F56LZ8-eHAM8JgqrGT7RaXuVjbLzvO960cp8y59-vn1BEAtFLtrHzA>
    <xmx:F56LZ0oElTd4FZnoPQhCEbOjC7LnSbNyWYMfOOCCwUFq06v-QVjO7g>
    <xmx:F56LZ9oTyegXG15FuM1mfp8oKr1nzEloMH029wa84NnwFWF9RQklWQ>
    <xmx:F56LZyTsUZ8mgA33eWZGCYOtD8d_uMi2glQprU5eBq4i1q5WNJLI6Q>
    <xmx:GJ6LZ-6M08OjXcWgu5OLwA8dh7wltlw7YEAGUFttWUS_TtpOl3PpIDao>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C9F22BA006F; Sat, 18 Jan 2025 07:27:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:26:42 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Neal Gompa" <neal@gompa.dev>
Message-Id: <b1588d48-fa70-46ec-adde-5981b4031005@app.fastmail.com>
In-Reply-To: <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
Subject: Re: [PATCH v4 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Jan 15, 2025, at 23:46, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add the MAINTAINERS entries for the driver
>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>

>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 
> a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2191,6 +2191,7 @@ 
> F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
>  F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
>  F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
> @@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
>  F:	drivers/irqchip/irq-apple-aic.c
>
> -- 
> 2.48.0

