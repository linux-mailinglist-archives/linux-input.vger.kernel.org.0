Return-Path: <linux-input+bounces-16195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4BC6B6CE
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 20:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6DA994E044E
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 19:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C1529B79B;
	Tue, 18 Nov 2025 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omb56ZZQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10F26738D
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493969; cv=none; b=hsYbPoniUbdhZ+0d9yPINyPCWd3IOfdJa7kt9UPokH1AD/Dad24NhazDHUsfW9pz21eFWuxM3zoPaDgoqt6Aaj+VXuxst5HtacEF4QKonsn4hPI4vdhbT6xIhCBh3ET4n+rzailYGJGV7KChp7T/EADfezbJRCO+5xZa/K1zylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493969; c=relaxed/simple;
	bh=hpZ/VnSzLtufEmMXrSA+rCp36DJZspZ43zLADI/3nwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBOPKQWMKX1as3gaMOIJ7lWu1ZGNcF4+ucRABFSY+yFmoi69E3LtTV0vQakzgh9r26NAIMemDGfJzUhrYEUAUpJkdAov9Uv4gsQw61b7Md+jUAXD3TZn5HqnZNHHdBExq4Z2po09cyP6+PgmSCq9q7ThY+Rj/jBzkdv3idiF/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omb56ZZQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-794e300e20dso107707b3a.1
        for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493966; x=1764098766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OluKibch7yAYA0QsHdpbcA89Z98AyRfmNLKTF5GQ8c=;
        b=Omb56ZZQnWYZdhAGeDXkv8AcoaBwJuzcuXPiSa4C9hKeQCIbWCsG2zO99zXcUmv1Ss
         R05Uskx+ldusGQI9AzjJVQrwCFdIRigH3eqTiQQ3Zoq1cKYn6wgvFE61gCUpK5JzYmI1
         Sm/Xc54e8F1gYa3ir4BvfZmoE1J4JXdRZGx52kNlOd3uMPIS5ryJoRvvn1Nrfn/TcJ7Y
         OtKrgE2GdCgEu4lqQQR+QfpNgH8EwytUSZkxX0INRRDyWz99660DZjtBK+xrJ9sIf1uR
         vNQXZJbY6iKclBS4+vlR9OuOuPLQSNtKrjrLZvNOLtHm6nnT9mHGGiu7DJ0Kf1NkTAcX
         esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493966; x=1764098766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OluKibch7yAYA0QsHdpbcA89Z98AyRfmNLKTF5GQ8c=;
        b=uztk6v3XrSfpLF0MoJ9YNNYRrS2K3JrxLH1W0Qut4wFyzWTvmDVPM0EspfzGB4JVED
         gvUxAUJxSZvYW6n1Lcc4pGwoJajfgFpFfq/W7XdC+Le5ghxP8ZpH3wT4NFXywl0oIP3g
         yu7dOarc9dWhm8iEyDklJC/d0WekDdfr3/ppu7G+HZNGIR8Ya5TA2oFNohk47qOCeQ/f
         Fw3BskhRbWXiZlMSZ3o8SDUOhb4O4SFUELAdRim2q2M1cyzR4DtwBoDfpCo27N6TxQwp
         H5JN/8xgBQMNq6BFdW8nhB3snt0uNXGaJNBddQeu+TJ6dK/RKwuURtfjpYaZcCZhIkgC
         8oLg==
X-Gm-Message-State: AOJu0YwQRTUsxapUUHsap0HG+1f6jumWSTbjIUkJNoa4mVyZlBhWMmSj
	JQB4eC/RKJYrvS24DUk4aZtlrqM+hN42KXAmhiHwOcMTzFv+Cveo79jevrkhXg==
X-Gm-Gg: ASbGncv5+aPFI+CaEgTC7HlXkRM08I15P6F43om3C7bYeb5qODgLYhMDEYaotFm7fHC
	nfTWLVt/nY6xT1LdhGYjIRWU0MrJjAHfpNWE80238j8aITZ0l1+NPo/3kFY2/hFJ9yprwrD0kG2
	RhbO/LCwaT5TExi24lDmV/Kd/MBAL3D1aArpIIi4zOR7H0cYo4Fs1zScNkr0BsW6szzb/Xz/Nxd
	O95+k9LI+4UdXtgAUIhXPelrZsJ+vn+a6QhiP6EJPuDVxWVg1K4uTTukv1PpuVtVJlJknqBUjiF
	XtSxQy+Hi7DX4/BIcW8dN6IggzNRzn1O9JLGHxpTKDfI+YVoe/hmSENPQ8VoIzvGLu31iXqQ0Hq
	miCd/PknIgo13e307DftcT72CpVBKEyjyiyKu3k0jXIEFYSYeHDDbBIrmjyPmzl/N0blNkfBERQ
	aiQ+tNzp8goVOIkkdwcRM0wsh+xmMlp45mpinPtFvG5p1wdPsFlreVMlEmYmxE26U=
X-Google-Smtp-Source: AGHT+IEbE505OYxpFM+kx2fEqc8wMRTYJFeXB5NaRiGmKSscaH2J1xA46Zs/7i3NnuV59lflwsXVMQ==
X-Received: by 2002:a05:7022:1b0e:b0:119:e569:f855 with SMTP id a92af1059eb24-11c8d9686bamr7116c88.12.1763493966382;
        Tue, 18 Nov 2025 11:26:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm64661586c88.8.2025.11.18.11.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:26:05 -0800 (PST)
Date: Tue, 18 Nov 2025 11:26:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] Input: pixcir_i2c_ts - add support for one-time total
 calibration
Message-ID: <5uyos6zu74jfro7zsfup4zbkrywf5odi4ytfuwuttslgrus2of@fmopwef7fkme>
References: <20251112130019.1488005-1-michal.vokac@ysoft.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112130019.1488005-1-michal.vokac@ysoft.com>

Hi Michal,

On Wed, Nov 12, 2025 at 02:00:19PM +0100, Michal Vokáč wrote:
> The Pixcir Tango controller has support for a one-time total calibration
> (manual calibration) procedure. Its purpose is to measure the capacitance
> offsets of the electrode system and to store these values into EEPROM.
> 
> During normal operation this calibration data is subtracted from the values
> measured. This calibration should be necessary only once in the product
> lifetime. It should be performed as part of the final adjustment after
> the panel is mounted in the product.
> 
> Add support for the calibration with sysfs interface.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
>  drivers/input/touchscreen/pixcir_i2c_ts.c | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index dad5786e82a4..2215e56b1458 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -24,6 +24,7 @@
>   */
>  #define PIXCIR_REG_POWER_MODE	51
>  #define PIXCIR_REG_INT_MODE	52
> +#define PIXCIR_REG_SPECOP	58
>  
>  /*
>   * Power modes:
> @@ -82,6 +83,7 @@ struct pixcir_i2c_ts_data {
>  	const struct pixcir_i2c_chip_data *chip;
>  	struct touchscreen_properties prop;
>  	bool running;
> +	struct mutex sysfs_mutex;
>  };
>  
>  struct pixcir_report_data {
> @@ -462,6 +464,35 @@ static int pixcir_i2c_ts_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
>  				pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
>  
> +static ssize_t calibrate_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
> +	static const u8 cmd = 0x03;
> +	int error;
> +
> +	error = mutex_lock_interruptible(&ts->sysfs_mutex);
> +	if (error)
> +		return error;

Why do we need this mutex? i2c_smbus_write_byte_data() does take adapter
lock, why do we need this additional locking?

Thanks.

-- 
Dmitry

