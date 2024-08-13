Return-Path: <linux-input+bounces-5545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A909505C7
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 14:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1B71F2133C
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 12:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268A619AD89;
	Tue, 13 Aug 2024 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfni97DO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F719306B;
	Tue, 13 Aug 2024 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553948; cv=none; b=CSwA64NUSSB1omy9g9+mhtTZncqk8bmcL+Rr6IQQuC/dZn1gi3EZ+y+JNFLhnNiIivcag7luQZbQsTo1e4AtEnzzr//ieJSXYOFiKGakaNJJsEZUu9kQLcfW8QjUcPCmB2Qa2a0i93+VFt4CkjG6r+1Z6WgjhXxfvMfblOCw2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553948; c=relaxed/simple;
	bh=NGUqAKZu7DbGbw+/v1pFdfDF0SzIy+ywwsTgmpUIUjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVvbIZ3ovOOaK5sJC5HbQbEMyu3cvfp7ctJ6ct+GT1v3Wki6cq/txv4ho8OaCMSmPw9lPSeaobyp1fb3URg73JrdMrrCs9miX3fA7H/PER5nFPxxBjzKpk8YEdDkdY6GHCRHxtONOtYPBCuoTm1oRw4WWb6mqi+0vn+MwX3irUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfni97DO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ff1cd07f56so45538915ad.2;
        Tue, 13 Aug 2024 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723553946; x=1724158746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zyM7uUMkVEtSceI4fLuBD9geFf80chSs9I9VRFpXMCo=;
        b=Cfni97DOexWL/5w+mwCnjmTidZB2r2zwTkmDvHEX1DudTE+dSIMzXatjffeK1v3ydg
         0iq7z18OLeIoogreLE0ltL3vdmoulkjtf1O/OInweJvut67nrCLmExGOtHFs+x6UhfBz
         ZAUEkz8IcMDzTpaEHSY0Wd/oc2Vr7+mXtesXUFa1OFbhDl3TLSJxdMdGfuKUNTI+G9j5
         tTFW4EX4QYKYczCiGON8ZwXLz7g7UvGhvnbLfMn5u0UWu6JnNA+wf8o+FMp3AJtO/CZL
         YqEWei4dZxteOCGdHahZpX8wdHvHZ1R5pXXcM7ydg/3jxnuqJgWY7uPZbhZxaDmmyOD2
         3/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553946; x=1724158746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyM7uUMkVEtSceI4fLuBD9geFf80chSs9I9VRFpXMCo=;
        b=tOyd2j1CY5aFmpgZchZJ7F+l/a2YYDA9AZp8PR3g9Hu9ClRugeLB0NuJPBHYxXoqSX
         2IPeujfsqkCB+Onjh49aX4ajqZuVQWQxeBbV2thHmpsdc+rSzwfmttVbS0FRinXCEXzH
         /MmE3YqfLLAS/EFheQE3P0C9VAHQAXyMP7sSddSAV5zxQAVpaz4W1N5gQZoMWejxRDjm
         m/h8FyIIlUwDs1+7AkCwAwOUXUuctizBUIVE57vHQJoTfCDcl04mMvw4t66Ah7PAGgp3
         lBJ9GkPm8S/C5XShWzXVdB1JDYP3KKu2yVRXzAMsegLwJTpbcEzhIjiH6hrVbkmptg73
         5BjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKS+3mMAFj1at846kniIzNEd4mslrTRNFMg+zPyT+MwH301+oH8oh3Ojo9JZJScVhfMD2q00aqNlWST8axMjHv1y6hFUcJW1fKf84hqKQFHXj6M+on9AvUi/Dwv1NdbY3YFUi8WpAigrVeoXSPsWtRcik0uFDLdNxwPD4v/JjxAPdzb+9b
X-Gm-Message-State: AOJu0Yxu9pH7PsAcJAsovu3hFE97rUomm2lNwhMnEamvlCTe8sEzyc6P
	DGWhPcC/0HH8iryuM92Cqbn1EUjXDyZ4QVv4d7vk36TErIxIPiX9
X-Google-Smtp-Source: AGHT+IHsLXixF1Z01gC11YIoIEf4DqKXDmlKx2EHh+PXchfkK9XFpIz+m95p5vWk89Jg8pswMucdOg==
X-Received: by 2002:a17:902:d488:b0:1fb:a2c0:53b4 with SMTP id d9443c01a7336-201ca1382e2mr41376875ad.18.1723553945468;
        Tue, 13 Aug 2024 05:59:05 -0700 (PDT)
Received: from ux-UP-WHL01 ([113.84.82.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd14ac7csm12908785ad.108.2024.08.13.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:59:04 -0700 (PDT)
Date: Tue, 13 Aug 2024 20:58:50 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: dan.carpenter@linaro.org, conor@kernel.org, robh@kernel.org,
	dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <ZrtXwr6HWF64akUP@ux-UP-WHL01>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <20240618084455.1451461-2-charles.goodix@gmail.com>
 <ZoW4_hctu_cSiKA5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoW4_hctu_cSiKA5@google.com>

Hi Dmitry,

On Wed, Jul 03, 2024 at 01:47:58PM -0700, Dmitry Torokhov wrote:
> Hi Charles,
> 
> On Tue, Jun 18, 2024 at 04:44:53PM +0800, Charles Wang wrote:
> > This patch introduces a new driver to support the Goodix GT7986U
> > touch controller. This device is not compatible with Microsoft's
> > HID-over-SPI protocol and therefore needs to implement its own
> > flavor. The data reported is packaged according to the HID
> > protocol but uses SPI for communication to improve speed. This
> > enables the device to transmit not only coordinate data but also
> > corresponding raw data that can be accessed by user-space programs
> > through the hidraw interface. The raw data can be utilized for
> > functions like palm rejection, thereby improving the touch experience.
> > 
> > Key features:
> > - Device connection confirmation and initialization
> > - IRQ-based event reporting to the input subsystem
> > - Support for HIDRAW operations (GET_REPORT and SET_REPORT)
> 
> This looks reasonable good, so:
> 
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> A couple of suggestions/nits below:
> 
> > +static int goodix_spi_probe(struct spi_device *spi)
> > +{
> > +	struct device *dev = &spi->dev;
> > +	struct goodix_ts_data *ts;
> > +	int error;
> > +
> > +	/* init spi_device */
> > +	spi->mode            = SPI_MODE_0;
> > +	spi->bits_per_word   = 8;
> > +	error = spi_setup(spi);
> > +	if (error)
> > +		return error;
> > +
> > +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> > +	if (!ts)
> > +		return -ENOMEM;
> > +
> 
> If you do:
> 
> 	ts->event_buf = devm_kmalloc(dev, <some nominal size>, GFP_KERNEL);
> 
> here and use devm_krealloc() once you figure the true size of event
> buffer you can stop calling kfree() by hand on remove.
>

Ack,

> > +	mutex_init(&ts->hid_request_lock);
> > +	spi_set_drvdata(spi, ts);
> > +	ts->spi = spi;
> > +	ts->dev = dev;
> > +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(ts->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
> > +				     "failed to request reset gpio\n");
> > +
> > +	error = device_property_read_u32(dev, "goodix,hid-report-addr",
> > +					 &ts->hid_report_addr);
> > +	if (error)
> > +		return dev_err_probe(dev, error,
> > +				     "failed get hid report addr\n");
> > +
> > +	error = goodix_dev_confirm(ts);
> > +	if (error)
> > +		return error;
> > +
> > +	/* Waits 150ms for firmware to fully boot */
> > +	msleep(GOODIX_NORMAL_RESET_DELAY_MS);
> > +
> > +	error = goodix_hid_init(ts);
> > +	if (error) {
> > +		dev_err(dev, "failed init hid device");
> > +		return error;
> > +	}
> > +
> > +	error = devm_request_threaded_irq(&ts->spi->dev, ts->spi->irq,
> > +					  NULL, goodix_hid_irq, IRQF_ONESHOT,
> > +					  "goodix_spi_hid", ts);
> > +	if (error) {
> > +		dev_err(ts->dev, "could not register interrupt, irq = %d, %d",
> > +			ts->spi->irq, error);
> > +		goto err_destroy_hid;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_destroy_hid:
> > +	hid_destroy_device(ts->hid);
> > +	return error;
> > +}
> > +
> > +static void goodix_spi_remove(struct spi_device *spi)
> > +{
> > +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> > +
> > +	disable_irq(spi->irq);
> > +	hid_destroy_device(ts->hid);
> > +	kfree(ts->event_buf);
> > +}
> > +
> > +static void goodix_spi_shutdown(struct spi_device *spi)
> > +{
> > +	struct goodix_ts_data *ts = spi_get_drvdata(spi);
> > +
> > +	disable_irq(spi->irq);
> > +	hid_destroy_device(ts->hid);
> 
> Do we really need shutdown() method? It is very rarely that it is
> needed.
>

After testing on the machine, we found that this method is only invoked
during system shutdown. Since the device doesn't require any special
operations at shutdown, so I think it can be removed.

> > +}
> > +
> > +static int goodix_spi_set_power(struct goodix_ts_data *ts, int power_state)
> > +{
> > +	u8 power_control_cmd[] = {0x00, 0x00, 0x00, 0x87, 0x02, 0x00, 0x08};
> > +	int error;
> > +
> > +	/* value 0 for power on, 1 for power sleep */
> > +	power_control_cmd[5] = power_state;
> > +
> > +	guard(mutex)(&ts->hid_request_lock);
> > +	error = goodix_spi_write(ts, ts->hid_report_addr, power_control_cmd,
> > +				 sizeof(power_control_cmd));
> > +	if (error) {
> > +		dev_err(ts->dev, "failed set power mode: %s",
> > +			power_state == GOODIX_SPI_POWER_ON ? "on" : "sleep");
> > +		return error;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int goodix_spi_suspend(struct device *dev)
> > +{
> > +	struct goodix_ts_data *ts = dev_get_drvdata(dev);
> > +	int error;
> > +
> > +	error = goodix_spi_set_power(ts, GOODIX_SPI_POWER_SLEEP);
> > +	disable_irq(ts->spi->irq);
> 
> Can disable_irq() be called first?
> 

Ack, calling this first seems better.

Thanks,

Charles

