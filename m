Return-Path: <linux-input+bounces-3738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4EB8C9486
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 13:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 550C61F215D8
	for <lists+linux-input@lfdr.de>; Sun, 19 May 2024 11:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F0331A89;
	Sun, 19 May 2024 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1ri1xvM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145FE8BEA
	for <linux-input@vger.kernel.org>; Sun, 19 May 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716119380; cv=none; b=TeqxIhZoqXeLabEUeDKGJOfPoVebnhDTtENxyCQlRJNMr3T3mPQvZXkATDB4A7gt8BX9/EEDsxBX9zD/K1kgLDRTy1DuHGAFeCMVDije0v/nghR6s/2XD7jkydHvPNqJrJpxbzaZMqg74PpPpg0U76nynKYl/5mTWLc+1hFmHdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716119380; c=relaxed/simple;
	bh=HlRrCIn6H3MAivbwI3riFvrtsBJOVeQNSluihl1ct3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMUkfNlIJbHbiYMPxV/+8a7m6dTurfnIHBC8UmGeE/Jj7AytEvwYp0U1k3T/prdy8Tyw23qTpKfvNgi68KUD0orD8HJXJ4IMRRj5bDs60RJoPdMqAjSGnsXql1W/dTDD5JZN7XICSU1l3a6kj36EYfd6X9Kk/zKpGT9illbXoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1ri1xvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2943C32781;
	Sun, 19 May 2024 11:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716119379;
	bh=HlRrCIn6H3MAivbwI3riFvrtsBJOVeQNSluihl1ct3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R1ri1xvMCeMSUx8W1wEmAgASfXt2rt+aUlfRejld91JePx9xNAuz6Rx0QLGSw+C38
	 GUw6VoWPcVAL17m3y7B2k/sjjt8qwBcTtAk4azJndt+Bu2mYWoNF/LtglnL+6U0KBd
	 g+Hpt2IqI8Y7rThe/hMZexVsjkbySymQRDom1UR3a5MOnvPo17a6WzvijB8IYWTvNP
	 Xpckvp5A9Ly8gLfBt2oSq+bf4OJP05naNUNLMAgigxU7Na3453Qt2KVLcN/E6NxHli
	 d6cAI6shq0eiUgXasTgCUEi/Yo773oTlc1UZUiG0FfnQRgsCDEvi/oBs+ya2ZOybwY
	 R6RtyGh8aWbpQ==
Message-ID: <c7f43a40-40ab-4029-9446-84e46c4fb5ab@kernel.org>
Date: Sun, 19 May 2024 13:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] input: add driver for Hynitron CST816X touchscreen
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>, linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com, artur.serhiienko@gmail.com,
 igor.opaniuk@gmail.com
References: <20240517092732.47715-1-kuzhylol@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240517092732.47715-1-kuzhylol@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/05/2024 11:27, Oleh Kuzhylnyi wrote:
> Introduce support for the Hynitron CST816X touchscreen controller
> used for 240×240 1.28-inch Round LCD Display Module manufactured
> by Waveshare Electronics. The driver is designed based on an Arduino
> implementation marked as under MIT License. This driver is written
> for a particular round display based on the CST816S controller, which
> is not compatiable with existing driver for Hynitron controllers.
> 


...

> +static int cst816x_process_touch(struct cst816x_priv *priv)
> +{
> +	u8 *raw;
> +	int rc;
> +
> +	rc = cst816x_i2c_read_reg(priv, CST816X_FRAME);
> +	if (!rc) {
> +		raw = priv->rxtx;
> +
> +		priv->info.gesture = raw[0];
> +		priv->info.x = ((raw[2] & 0x0F) << 8) | raw[3];
> +		priv->info.y = ((raw[4] & 0x0F) << 8) | raw[5];
> +
> +		dev_dbg(priv->dev, "x: %d, y: %d, gesture: 0x%x\n",
> +			priv->info.x, priv->info.y, priv->info.gesture);
> +	} else {
> +		dev_warn(priv->dev, "request was dropped\n");

Not a warn. First, it feels like really spamming the log, second,
drivers should be moderately quiet.

> +	}
> +
> +	return rc;
> +}
> +
> +static int cst816x_register_input(struct cst816x_priv *priv)
> +{
> +	int rc;
> +
> +	priv->input = devm_input_allocate_device(priv->dev);
> +	if (!priv->input) {
> +		rc = -ENOMEM;
> +		dev_err(priv->dev, "input device alloc err: %d\n", rc);

Memory allocation errors are *never* printk'ed by drivers.

> +		goto err;
> +	}

...


> +static int cst816x_resume(struct device *dev)
> +{
> +	struct cst816x_priv *priv = i2c_get_clientdata(to_i2c_client(dev));
> +	int rc;
> +
> +	cst816x_reset(priv);
> +	rc = cst816x_regs_setup(priv);
> +	if (!rc)
> +		enable_irq(priv->irq);
> +
> +	return rc;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(cst816x_pm_ops, cst816x_suspend, cst816x_resume);
> +
> +static int cst816x_probe(struct i2c_client *client)
> +{
> +	struct cst816x_priv *priv;
> +	struct device *dev = &client->dev;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		rc = -ENOMEM;

No, just return.

> +		dev_err(dev, "devm alloc failed: %d\n", rc);

No, drop. This is some ancient, downstream code. Do you see anything
like this anywhere else?

> +		goto err;
> +	}
> +
> +	INIT_DELAYED_WORK(&priv->dw, cst816x_dw_cb);
> +	timer_setup(&priv->timer, cst816x_timer_cb, 0);
> +
> +	priv->dev = dev;
> +	priv->client = client;
> +
> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (priv->reset == NULL) {
> +		rc = -EIO;

Syntax is return dev_err_probe().

Same everywhere else.



Best regards,
Krzysztof


