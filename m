Return-Path: <linux-input+bounces-9791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2662A287B1
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 11:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF7F188A593
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 10:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2D822A80B;
	Wed,  5 Feb 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="LYpuYkPQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bX4KT6Ld"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E602153C4;
	Wed,  5 Feb 2025 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750526; cv=none; b=Gm5zuae+4W+NiIudbQxvuKfOUo7+6hPQGGN6b1NXz5PfEKoVnMmNkBbd81l8A9YxE23QSxZ9AqFjF4FKZkYKSBseXZ4Ml5jGIAoQ4MTfBhxJTdvwAx9DoVpZsspz2pe5+wULwZvMG4r0u96t9DisVaMNPcfonlS37nMfDVozyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750526; c=relaxed/simple;
	bh=At0T4PYsThHB2oQ1wixJoXNJSaMs5u99oN6UY91y+5w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=U9DxWTtb4rJDhJbaVZnsGWgqGK3S+xlJXAn1eXW3Ra4wfwoUKCC3lR2bEpoQ42bNbKSsaNvfkhJvm4bwaUpMZBl2eiZrWag48fBq6EbtpKv+5TZXXn+4VQJ21nnf5HZu6CclcliikhmcJJm8bvPOLaZZQtQBuoI9wRhu/y3rFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=LYpuYkPQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bX4KT6Ld; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 98D0811401AA;
	Wed,  5 Feb 2025 05:15:22 -0500 (EST)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-03.internal (MEProxy); Wed, 05 Feb 2025 05:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1738750522; x=1738836922; bh=cH1qes1tNRdZs6luVmGsEKhzH7iDzl1O
	8N8qsJWQEjw=; b=LYpuYkPQ4VGgzwI4rM/OSSemygteF787IbNKYiRCPAorHVfe
	PIeYPI5ZZy3GbegXDgvCrtRET8Ayb/y8+/b05axdp8DegAV2FLKqWPSExrcDhdsc
	y8KotAWVz3b6OmR0RWVBgoTUFqv3sTOnea3Io/issfbnvHiIlDxHn3WDjMahTRJP
	NwJIUdDuADKHKqtJjyFIMhwvYvNyCW4xYxwBBj4oqPXe2gjD9/We9fkR+jOzX1A7
	Ar68aYGPxXkcjtGfwpSPGqvzIn7BF9qf1XJFhXmKqYRktpX31WZBObqo3R7nRHh+
	tAALhQWURsayejdd7s71KzFNy50CjlVmdwaiSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738750522; x=
	1738836922; bh=cH1qes1tNRdZs6luVmGsEKhzH7iDzl1O8N8qsJWQEjw=; b=b
	X4KT6LdaOQzA4ltsx5tdrTGZheYu01mtAE8P5BpxxQTHxXuXbVCC7BSjNF4MVcA9
	IvFe2YQ4uAtks+CoKwOPMMu75iSKsaVOfg6hZCwBB1QQRdJR6tWq4pAywfx+Jqo/
	fKXnYaYzm+P0yTLJF+OV+oGlcCDKYRfP/y483lp+jtTy+Zo97mDTJMTJivJ1eNpd
	zi/8QZLrvyID05exT87VRyF7jW+wVoVlx05zCJOgedkIRvPfyawZ+WFln3y7hDjq
	E3LzhgKzgqRpfWDFfwfGvSZ/LJiWMWwOJCEheI9hMMkKV8TsqstWJiFDbR4PYPvW
	IrPbMsPKoxJXzi3GAaNQw==
X-ME-Sender: <xms:OTqjZ1ZUJGKJJ1EkU6ErI5oTndcZdPrgY3PdlSQr-0HrfnOnvZtsjQ>
    <xme:OTqjZ8ZIewgC8bkeUOYGt7HaeQiU3tsGyBNCoc1Z1aWz9tufuQgWVjOj9FhuENYql
    vGMHKiCM3yWnKNUaSk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomheptehlihhsthgrihhruceorghlihhsthgrihhrsegrlhhishhtrghirh
    dvfedrmhgvqeenucggtffrrghtthgvrhhnpeehjeffgeellefgfffhteehvedvhfekfeef
    leeuvdehudeitdduveeggfeigfegffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdp
    nhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhihlh
    gvnhgvrdhjohhsshgvrhgrnhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohephhhv
    ihhllhgvnhgvuhhvvgesughimhhonhhofhhfrdgtohhmpdhrtghpthhtohepughmihhtrh
    ihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehhuhhgoheshhhu
    ghhovhhilhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OTqjZ384yCG2ckdOLU1EUi4ovss-1DUDBtP_IhqHvvuoNTJmXLWOzg>
    <xmx:OTqjZzqU-cAW8XZBfNN3_S-_uDYWirbcCl-NNhG6abnSUjf4p4cJWw>
    <xmx:OTqjZwr9K5NyVjSjqpVG5Rxx7f8ZEDD3rHqVDQrwAumRYzzMK3GSjA>
    <xmx:OTqjZ5RVMKGUCbMupvlLUCXOe1gNZisIKqV5-SbiEgWdYyKCI9qNPw>
    <xmx:OjqjZ8c-gpVeqfHQOx2xHG3BluWLUDQ9JnxgH9_9dd2NiWv1rXWKWE49>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 74B8717E006E; Wed,  5 Feb 2025 05:15:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 20:15:21 +1000
From: Alistair <alistair@alistair23.me>
To: "Hugo Villeneuve" <hugo@hugovil.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 linux-input@vger.kernel.org,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Message-Id: <66041e5a-1686-4ee1-9a59-5fbfa21d1cb1@app.fastmail.com>
In-Reply-To: <20250204190100.2210863-1-hugo@hugovil.com>
References: <20250204190100.2210863-1-hugo@hugovil.com>
Subject: Re: [PATCH] Input: cyttsp5 - ensure minimum reset pulse width
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 5 Feb 2025, at 5:01 AM, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> The current reset pulse width is measured to be 5us on a
> Renesas RZ/G2L SOM. The manufacturer's minimum reset pulse width is
> specified as 10us.
> 
> Extend reset pulse width to make sure it is long enough on all platforms.
> 
> Also reword confusing comments about reset pin assertion.
> 
> Fixes: 5b0c03e24a06 ("Input: Add driver for Cypress Generation 5 touchscreen")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Acked-by: Alistair Francis <alistair@alistair23.me>

> ---
> drivers/input/touchscreen/cyttsp5.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> index eafe5a9b8964..bb09e84d0e92 100644
> --- a/drivers/input/touchscreen/cyttsp5.c
> +++ b/drivers/input/touchscreen/cyttsp5.c
> @@ -870,13 +870,16 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
> ts->input->phys = ts->phys;
> input_set_drvdata(ts->input, ts);
>  
> - /* Reset the gpio to be in a reset state */
> + /* Assert gpio to be in a reset state */
> ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> if (IS_ERR(ts->reset_gpio)) {
> error = PTR_ERR(ts->reset_gpio);
> dev_err(dev, "Failed to request reset gpio, error %d\n", error);
> return error;
> }
> +
> + fsleep(1000); /* Ensure long-enough reset pulse (minimum 10us). */
> +
> gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  
> /* Need a delay to have device up */
> 
> base-commit: 0de63bb7d91975e73338300a57c54b93d3cc151c
> -- 
> 2.39.5
> 
> 

