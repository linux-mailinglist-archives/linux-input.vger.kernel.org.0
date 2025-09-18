Return-Path: <linux-input+bounces-14832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFBBB82FF8
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 836323AA404
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 05:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B047B288C39;
	Thu, 18 Sep 2025 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUhBsSjK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A3C28467B
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172854; cv=none; b=KknrASYm1VdL8DL99Zo/UILAv4murn6sFkFINkLDKVW6uSZKFH5sS+VJSzdU3yJGImBUlYxl/eG/zLiPLB63j8eYssMJyeZPiQn/98PzzS69zF1jpLXsV2QQ297Z9MyM/bkoruKbuhX0fTeCV9FIUMucd/qrGU+2TpIpDHwM9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172854; c=relaxed/simple;
	bh=mJBu47dNRLOUdwnQdDq7ahHq8KN4rsvXvyAfZf16StA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u96YJIhQhy1cxwo0IEd6bhVtd/LgLWzgFVaYEqevpHeO2IsC8RkoeC9F6wxOMvKhZYQouV8+Rn6tF7AB+4Lij8TrZV/TLz/vf8EBS4fBFcT1MzrZk3LY6tKL+8TZSzWuxifgzIeF44ReTMGNIwBeimyG/J6n18XgpNSvC3W8otY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUhBsSjK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so591414a91.1
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758172852; x=1758777652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddz64abQ+Ip+tKkgy/htEThiGlqI2wjDb/I3daGz3hU=;
        b=IUhBsSjK1nIQeiX0wO3vX8Qx1aBkIYTkl7ZjP0CNoLm5taqHJEUT/RPv55SJRQwaZl
         +QJKO/0nYjkYc9BqRZf2YJ9J2ZMAT/gVaKjhKlYqfMCVh0YT6uLpK4bUiq+RJd10HJ35
         S4PFa9BILcngvg8x4ZIKKHVuPtsU168q5Qpe46c584b66NDKr7yquuPJ/HLvBvo17BGP
         /9+3ycNdgCSaywtpYx0n2+MhXhmv9VMnd3ZNoNFszIGjEJyC+WXMoFdZT6srsXchFRGQ
         8hjiiFGwyyhbUVNsqstrUIC54oIWlX+EmSrVX+Rv6XKNhYhwG32S3PMwm1mMONSobPiB
         DqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758172852; x=1758777652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddz64abQ+Ip+tKkgy/htEThiGlqI2wjDb/I3daGz3hU=;
        b=NyH13VnkZOfJQXZ+sdP/tpgWOvxsQpiFofBrjFWDu2LESDrR3b8iJIq/c2+lxpyTrK
         mIIyDJCF9EZ4/REN9VmfPBp5OXKPCy1bg6U+ya6y3IgmWc7CRRwrFPUreZ1n5pF6HCIp
         RARahj42mZou2BS+XALs2RiT2RUmFSB1JboP52v33BshtdF27wAhUDXkBUfH0W+l7l2x
         ARMmI1QN/dDPdIPbXx3FZL3kKvcjF1BZ5CZ/fb91M/bG1HN3ybaeKDNi+7PtLQVh1oR/
         a10alAbHSNcgM+LBbOdGagxVUIoy9cCNzYMZsV1n9ug/g8VIHx+J+hHSoaQ34XCZ4IzR
         1SEg==
X-Forwarded-Encrypted: i=1; AJvYcCXVGGF2fsX2lphkUzLz0Prpk9riryJ3RtewLZRywcy/BLZDK36xhZP2bXFum88PKwK29R+pxmQDY9tWXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynTFC6Ijsj3fyA8BQwjsh6IPnwJYQFrhhGdKPnv9p3zoixIguH
	fTabc6uEs6OCiLCT4UjXY9qI7qK6+EAg6YDyEI5DW03OPdxDW2mMBDN9
X-Gm-Gg: ASbGnctpwFP41DLVo3EGTs3M8qQipEURAoAwa9GIy1mfDzJnFRVA80NHViSjcPGKV9Z
	5MHemA6UDEnxcObGVugLtQSHHwKz6zew5Vjr6tdlZWdX2PJGwyrzZqtdQ58YPVONTLgtS2t3alo
	ioY+L1NTEWULWeCDCiLyksO519LudKyNCEyX57NGUlN6hc2SUKVLdfbAuowAwPxqCMA6X8D0Wgq
	tGGkQLr7DFRJ0/tFeokgy8guG8mmbo+nRwTmfuCYyZGLMFftA031GrfV3A83snaA2ekGJ8pKA/y
	PccDSe45lKXqeQciR3lIjH5P/ksRuVCrPPwJ+a1IPPKCN/asb5M7UbVmfruZIl+SobJc0tpVT/h
	iOu++4GFnGu1P7xFWIEYKxUv3dY9K/nh6KM9rt4jCaw==
X-Google-Smtp-Source: AGHT+IG8CuXun9cOc4Miy8FKai+xpcWeH+yfmFB+Hb9vuMbp9yZvwClUBTpkB9qN/yr1gkSb+hoYzA==
X-Received: by 2002:a17:902:d502:b0:246:163b:3bb3 with SMTP id d9443c01a7336-268137f273emr60856295ad.35.1758172852491;
        Wed, 17 Sep 2025 22:20:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c098sm12567295ad.33.2025.09.17.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:20:51 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:20:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Jeff LaBundy <jeff@labundy.com>, 
	Jonathan Albrieux <jonathan.albrieux@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v5 2/2] Input: add Himax HX852x(ES) touchscreen driver
Message-ID: <blpydhtx4iqc7izbjaccikwjkeninghdykjndcp4d6d33wbybu@legip3xo2fsr>
References: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
 <20250915-hx852x-v5-2-b938182f1056@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-hx852x-v5-2-b938182f1056@linaro.org>

Hi Stephan,

On Mon, Sep 15, 2025 at 04:19:57PM +0200, Stephan Gerhold wrote:
> +static int hx852x_i2c_read(struct hx852x *hx, u8 cmd, void *data, u16 len)
> +{
> +	struct i2c_client *client = hx->client;
> +	int ret;
> +
> +	struct i2c_msg msg[] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 1,
> +			.buf = &cmd,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = len,
> +			.buf = data,
> +		},
> +	};
> +
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	if (ret != ARRAY_SIZE(msg)) {

Added
		error = ret < 0 ? ret : -EIO;

because theoretically i2c_transfer() can return 0 as number of messages
transferred.


> +
> +err_test_mode:
> +	error = i2c_smbus_write_byte_data(hx->client, HX852X_REG_SRAM_SWITCH, 0) ? : error;

You want to return the first error that happened, not the last one.
Changed to:

	error2 = i2c_smbus_write_byte_data(...);
	error = error ?: error2;

> +
> +static int hx852x_suspend(struct device *dev)
> +{
> +	struct hx852x *hx = dev_get_drvdata(dev);
> +	int error = 0;
> +
> +	mutex_lock(&hx->input_dev->mutex);

Changed to use

	guard(mutex)(&hx->input_dev->mutex);

style and applied.

Thanks.

-- 
Dmitry

