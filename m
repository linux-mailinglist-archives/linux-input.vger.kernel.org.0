Return-Path: <linux-input+bounces-13845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA1B1C8B8
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 17:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C8106271AC
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 15:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A476293B5F;
	Wed,  6 Aug 2025 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7P08CXk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE8292B54
	for <linux-input@vger.kernel.org>; Wed,  6 Aug 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494139; cv=none; b=jBqK5cTGMx6EXqbx2FqrhQEDKFIGyss+13il+GTPCwI4rFrJBumuvYkUbxiBVBhWPf3y433hZAAB1Xz3S/Mg4t2ndMvWW4d6QX6po6Zgl/9vz3LRK86yY5puPB7nbCRJYxqOc+rwR17V+I6CM1G7LRoJEavSItt1Z4YUqkwwyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494139; c=relaxed/simple;
	bh=njnkMeXbBDfv59fZU5JyPP1/vQsmLknJZSUpgVpQIic=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bSS3uu/elkvUFT9h6M/WAIe1hkn9JzB+2QmE9e9OM5hu6yTzoC8VAleQpAOGDOcdr1wonSnZIhrDuU9aiUZLiOBqjaPLBfJ5YaOk2RtHyeAOu9YdVFYrb3FZ3ASRK76SsppCp9swEQbsVt10mSNlMy/BXp8d9IGXRWlCzywvIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7P08CXk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so3813636f8f.3
        for <linux-input@vger.kernel.org>; Wed, 06 Aug 2025 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754494136; x=1755098936; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ASSxJEQXfE633CevXWqyyh5f9WPRpCDbV8wTQIWfMY=;
        b=u7P08CXklqtrakIE7WQtSZt9fTEh9XfBYF0vu9B6liWJjyNQ5Wef+qDfYQQUnHl7E3
         qrdIp7Uo9nBrQ9VP2ldUknh2jA88XN/TPUqu0sfePGGNMQDAhGrVaMLEZaCF9yK7KL+F
         Fb2f2GxF/eTd3d00nk9Ryji0lqW4vFhO/bT3Rd0Bxs8/jwXj5j+TUvcxTEVWta+pp1qX
         IgTU68NoEA7ABggj0D25BhvBfjhO/8u4j5Tmy7Qpsa21hDrDwZt6BgMJbIFpbms9GPj6
         8667NnK52xUICloHNOtOSOrRRpvBQbt3gwFR/XKuRkqdSpiqEcO+e1zJblVfNZ+z4J5t
         aBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494136; x=1755098936;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ASSxJEQXfE633CevXWqyyh5f9WPRpCDbV8wTQIWfMY=;
        b=NJJO9GbaQoMtwraA4Hqy0znjTuxNQe5jQh53w966OvWVldMDqaHFpfz0YN7urQLNT7
         ZkOwnDC2lpQsoF+Fz43170w4rG5jZkoqwc2Va/9q/iqtAN8p8EyjiQ1i/3YTEQGdXR6G
         C05o+SW+AqjiHUKr9re2bG4vo132INpGrBWOvhaUPmimhNU9SLtk6A4pmf3uIq5Hf6Zm
         jr67Zzn7PEwbRZ237eSRDa5Wk54JKTx/MJLVm7FAuwogDaySTnymh+9tJk8auYXbhoVA
         F2m4SYMv7krxb62qNJovj42AfNHIimfK6/iTD7+XdY/gk0NOBzo4Bk4jEnfN+L4pUBJR
         AzRg==
X-Gm-Message-State: AOJu0YyjJ6pf7O7S2BvmXZ6ycwxBbjeqSYEodcfoEN9hPfqcg5ynvfiJ
	QXuFuaOPmfUMmHvkZ5C6SjjGBQgFdF+dx+mocg0gPXjqK2PE98K4zd0z5t1Z2YWjRwQ=
X-Gm-Gg: ASbGnctdWpA1dDbJ0AGwuushSPBJeaCGo6r2wUqynH/unjLRnBtxPOMjaUo2OkadhOZ
	cCvSHhUci9k3Al8/dBjWaGEnmb6FIGuLHevvLlchd5l2wN54YOCCe3d46lM8fQjS4cmyXJdGN19
	h3uAWvAWYHXSznVDP+qWT62RP/26zGAhvejbjlCmgLHjs/Uy86w7YpefFGBRS4VgB+QPiCyqK2u
	DJIc2lFWTR5LxgDBacpFeKzTfoegLffQuBhYCk/PAZuRMlduZCI1fa//zWrbcG0M1kIQbqKxplX
	pJQJnGRQBPyRE6noqlda7wgse05h4sTW8v7TjqAuk/PxhDgA2U7fZJsLXnMsQmlIqFzY0wsEAgk
	nojBkJ2Oe+ydPJK3qUX1hQqsvRks=
X-Google-Smtp-Source: AGHT+IGms6BpP/B6mpjSuEArIcBP3P6tAGM77/jKb6ok4h3wKMwoMthR/0suEVsblhKxO8hTtm5llg==
X-Received: by 2002:a5d:64e8:0:b0:3b8:d3cc:8dc with SMTP id ffacd0b85a97d-3b8f491cc2emr2641189f8f.28.1754494135791;
        Wed, 06 Aug 2025 08:28:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm23490188f8f.67.2025.08.06.08.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 16:28:54 +0100
Message-Id: <DBVG9ID1KS59.27QTXCZOWJVNM@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] Input: aw86927 - add driver for Awinic AW86927
X-Mailer: aerc 0.20.0
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-2-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-2-23d8a6d0f2b2@fairphone.com>

Hi Griffin,

On Wed Aug 6, 2025 at 4:10 PM BST, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
>
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  drivers/input/misc/Kconfig   |  11 +
>  drivers/input/misc/Makefile  |   1 +
>  drivers/input/misc/aw86927.c | 841 +++++++++++++++++++++++++++++++++++++=
++++++

[...]

> +static int aw86927_probe(struct i2c_client *client)
> +{
> +	struct aw86927_data *haptics;
> +	unsigned int read_buf;
> +	int err;
> +
> +	haptics =3D devm_kzalloc(&client->dev, sizeof(struct aw86927_data), GFP=
_KERNEL);
> +	if (!haptics)
> +		return -ENOMEM;
> +
> +	haptics->dev =3D &client->dev;
> +	haptics->client =3D client;
> +
> +	i2c_set_clientdata(client, haptics);
> +	dev_set_drvdata(&client->dev, haptics);
> +
> +	haptics->regmap =3D devm_regmap_init_i2c(client, &aw86927_regmap_config=
);
> +	if (IS_ERR(haptics->regmap))
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
> +					"Failed to allocate register map\n");
> +
> +	haptics->input_dev =3D devm_input_allocate_device(haptics->dev);
> +	if (!haptics->input_dev)
> +		return -ENOMEM;
> +
> +	haptics->reset_gpio =3D devm_gpiod_get(haptics->dev, "reset", GPIOD_OUT=
_HIGH);
> +	if (IS_ERR(haptics->reset_gpio))
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	/* Hardware reset */
> +	aw86927_hw_reset(haptics);
> +
> +	/* Software reset */
> +	err =3D regmap_write(haptics->regmap, AW86927_RSTCFG, AW86927_RSTCFG_SO=
FTRST);
> +	if (err)
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
> +					"Failed Software reset\n");
> +
> +	/* Wait ~3s until I2C is accessible */
> +	usleep_range(3000, 3500);

3 ms or 3 seconds?

[..]

Best regards,
Alexey

