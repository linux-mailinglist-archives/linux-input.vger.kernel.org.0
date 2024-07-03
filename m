Return-Path: <linux-input+bounces-4827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAD9269B6
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 22:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10E12813EC
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 20:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED6518F2E6;
	Wed,  3 Jul 2024 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftzkMUl9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107017BA9;
	Wed,  3 Jul 2024 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720039684; cv=none; b=S8NFGqqXVXr2r7wy3esvxlJrk2WDFfEwYWJDJvlYkuJ8VRK3h6FwTubNyyDAGpOYcxtHXaw0Ok7rxHlZqhxHInhV1wHIx2XgXsbabKWXme28lnm5jCNtpOxFH7qUCubPLFdAOhvD4h2Tz405ocE81zLVTtKTyChC1IyFXUdVJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720039684; c=relaxed/simple;
	bh=u8YPpJdPyMZVfJLy680hGenzCrQDiYthznjL49J9LFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5NZxGJ0TBZ05bxZLPjRzZNbFXgWR5Yx1BavQjhtaW+/5JmT9hjLSQ3m/k3og61nEW9kertb9AQNWKnFpe2Sva+Jnbqf5R/GRLOadE6G00+XIv86/D5is8URTHAWln14ixlXRuXv7UNaNEhwgul0AG7u3fhqxjuaWa0WmY92gqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftzkMUl9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c8517aab46so4410730a91.1;
        Wed, 03 Jul 2024 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720039682; x=1720644482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIcDf4piwkhYNsahWQ3l1k++fvU3yvR9XMWeHyb7fys=;
        b=ftzkMUl9NlmbNtuPl/tE6j2iyVdRZrbNgcjIBWyWCXwTwO/aSQqxqN4ZYgEVnOwEzZ
         547CfbleP4eoJTi6I5LTMt4PJVP1U8rZ2Sow46Fq1ZeTLSLHZIA8lA3UaTjmjtLYw8jF
         RBODC9Wm/fLps1cBV9FH+3ouoht4n0UehX64EeejchVn7zMqOIPTWc2H/tEKZjbTCg0h
         uO7xr04qVlbCd6LEtu7bVR7wbc/rwigM/RK+ftdcdyMxsDLhnaoeSeWgrQKO/RIQouko
         qXkVa9HOUGHYvbXEqGXAGmDGjS3XT5I/C6qR1xnt8m90TIS7zjNi8Tsr2wrVz8Nhm8eJ
         7iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720039682; x=1720644482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIcDf4piwkhYNsahWQ3l1k++fvU3yvR9XMWeHyb7fys=;
        b=d6USMfZIV/v2GxZqSet9u53Qcvl8+cBiu5QOtnQ68nsD2+zyxKEnmJN/RiEEHWvB28
         yQaqWQOih8gRbpeh+GOZNFPvuGQbnjNsj0AZ447+3rXBHP9l654k32ja0BUuM+kgisCQ
         eHrspwzXkwupbt8E7xR1UryWZ9StR35UeBwqiuHnylYnJ6k8lGoH3pKFO6N9ov5btKKH
         b1kpzOUfbELWKS52eZxpjeiCiPAVRXbP6z2f322wRl637QU8beGhST79AJSiywDUFp94
         fUGSC4yuoDtDRvDCUWDVW7EZ3NJx2Xvi8s+oK6E4T3VvFe3bAezjIajrJnJcucd1Ny85
         n2BA==
X-Forwarded-Encrypted: i=1; AJvYcCUqh7iGP/CfnbkAUuK9jz08b1ty/VbOAp0NozORVW+AhqlGfgqiphRWomZib+SQ0jZPBLn6C31DJGaG19nNY4ofyWLlOK/POO2mIzjQ/hh3bqJ6TL689BoJg/V9MKwOvGUC5CCva0SuRRIkHAiw3Yy15bsNBivAjoV9NnUOfUg6XqRG3Lcm
X-Gm-Message-State: AOJu0YxNJePS+dw+Lwh2zkoDIv/tiMa4EgswGoWkZCHubOWvvGBKg656
	WT9FRAW3d68C1zEPtX3/nlWOiSA2EQygqc0oOob61p2NMccDtdHe
X-Google-Smtp-Source: AGHT+IFh1NzH6dHZL2J6Kj03C4hvF4fw5PPKK/V0yHEjgGjY7xzuOZN7HP86d/c6sH3NvCwj375yyg==
X-Received: by 2002:a17:90a:ec05:b0:2c9:9199:bf44 with SMTP id 98e67ed59e1d1-2c99199c40dmr696020a91.19.1720039681804;
        Wed, 03 Jul 2024 13:48:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c97cf8fc68sm1773684a91.36.2024.07.03.13.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 13:48:01 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:47:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dan.carpenter@linaro.org, conor@kernel.org, robh@kernel.org,
	dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <ZoW4_hctu_cSiKA5@google.com>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <20240618084455.1451461-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618084455.1451461-2-charles.goodix@gmail.com>

Hi Charles,

On Tue, Jun 18, 2024 at 04:44:53PM +0800, Charles Wang wrote:
> This patch introduces a new driver to support the Goodix GT7986U
> touch controller. This device is not compatible with Microsoft's
> HID-over-SPI protocol and therefore needs to implement its own
> flavor. The data reported is packaged according to the HID
> protocol but uses SPI for communication to improve speed. This
> enables the device to transmit not only coordinate data but also
> corresponding raw data that can be accessed by user-space programs
> through the hidraw interface. The raw data can be utilized for
> functions like palm rejection, thereby improving the touch experience.
> 
> Key features:
> - Device connection confirmation and initialization
> - IRQ-based event reporting to the input subsystem
> - Support for HIDRAW operations (GET_REPORT and SET_REPORT)

This looks reasonable good, so:

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

A couple of suggestions/nits below:

> +static int goodix_spi_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct goodix_ts_data *ts;
> +	int error;
> +
> +	/* init spi_device */
> +	spi->mode            = SPI_MODE_0;
> +	spi->bits_per_word   = 8;
> +	error = spi_setup(spi);
> +	if (error)
> +		return error;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +

If you do:

	ts->event_buf = devm_kmalloc(dev, <some nominal size>, GFP_KERNEL);

here and use devm_krealloc() once you figure the true size of event
buffer you can stop calling kfree() by hand on remove.

> +	mutex_init(&ts->hid_request_lock);
> +	spi_set_drvdata(spi, ts);
> +	ts->spi = spi;
> +	ts->dev = dev;
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ts->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
> +				     "failed to request reset gpio\n");
> +
> +	error = device_property_read_u32(dev, "goodix,hid-report-addr",
> +					 &ts->hid_report_addr);
> +	if (error)
> +		return dev_err_probe(dev, error,
> +				     "failed get hid report addr\n");
> +
> +	error = goodix_dev_confirm(ts);
> +	if (error)
> +		return error;
> +
> +	/* Waits 150ms for firmware to fully boot */
> +	msleep(GOODIX_NORMAL_RESET_DELAY_MS);
> +
> +	error = goodix_hid_init(ts);
> +	if (error) {
> +		dev_err(dev, "failed init hid device");
> +		return error;
> +	}
> +
> +	error = devm_request_threaded_irq(&ts->spi->dev, ts->spi->irq,
> +					  NULL, goodix_hid_irq, IRQF_ONESHOT,
> +					  "goodix_spi_hid", ts);
> +	if (error) {
> +		dev_err(ts->dev, "could not register interrupt, irq = %d, %d",
> +			ts->spi->irq, error);
> +		goto err_destroy_hid;
> +	}
> +
> +	return 0;
> +
> +err_destroy_hid:
> +	hid_destroy_device(ts->hid);
> +	return error;
> +}
> +
> +static void goodix_spi_remove(struct spi_device *spi)
> +{
> +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> +
> +	disable_irq(spi->irq);
> +	hid_destroy_device(ts->hid);
> +	kfree(ts->event_buf);
> +}
> +
> +static void goodix_spi_shutdown(struct spi_device *spi)
> +{
> +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> +
> +	disable_irq(spi->irq);
> +	hid_destroy_device(ts->hid);

Do we really need shutdown() method? It is very rarely that it is
needed.

> +}
> +
> +static int goodix_spi_set_power(struct goodix_ts_data *ts, int power_state)
> +{
> +	u8 power_control_cmd[] = {0x00, 0x00, 0x00, 0x87, 0x02, 0x00, 0x08};
> +	int error;
> +
> +	/* value 0 for power on, 1 for power sleep */
> +	power_control_cmd[5] = power_state;
> +
> +	guard(mutex)(&ts->hid_request_lock);
> +	error = goodix_spi_write(ts, ts->hid_report_addr, power_control_cmd,
> +				 sizeof(power_control_cmd));
> +	if (error) {
> +		dev_err(ts->dev, "failed set power mode: %s",
> +			power_state == GOODIX_SPI_POWER_ON ? "on" : "sleep");
> +		return error;
> +	}
> +	return 0;
> +}
> +
> +static int goodix_spi_suspend(struct device *dev)
> +{
> +	struct goodix_ts_data *ts = dev_get_drvdata(dev);
> +	int error;
> +
> +	error = goodix_spi_set_power(ts, GOODIX_SPI_POWER_SLEEP);
> +	disable_irq(ts->spi->irq);

Can disable_irq() be called first?

Thanks.

-- 
Dmitry

