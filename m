Return-Path: <linux-input+bounces-8032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6C9C517E
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 10:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E5D3282999
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 09:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8815209F4A;
	Tue, 12 Nov 2024 09:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tz+Bt8QQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D909520BB48
	for <linux-input@vger.kernel.org>; Tue, 12 Nov 2024 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402512; cv=none; b=pOF+DwN/qFeyNFfyVpcUNKMsOI6P2OVOqT7kuPAgT3W53m5Y2BKuB0xuBb9FmqdHCjsmWytuyq4J5zUbgustGOrVtQmJ35x1w8DmfrfdjfMhjw2D3K5rz8Wg7+Hva4BJe1smveasi1tLFRFb8DTC13mrmI93KiBQR8+Jqd/iMTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402512; c=relaxed/simple;
	bh=5cDBb8gHYNhwBa2edGLqvNaJRkceBVDBFGqcn1lzIl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rhw4Xg6MmAwhDBxYfLJBdKx1rylQsQAaxQdz/0tolPTjqag7+8Ceqdoqg5Z6onbcMk0yrqzszmFn4ENg9s7bAQ/O+3hYbUc6buPf7BGvyQ7oue93yIA4loa9zvnnEFnvqr2NZ/yZw2jcfeXPTqdirMX00Z6OZFB0qHDY1Rpy6ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tz+Bt8QQ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso911404066b.2
        for <linux-input@vger.kernel.org>; Tue, 12 Nov 2024 01:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731402509; x=1732007309; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZzzVliE9xmqKKD2cUHeOEG/9iZ9Yii9Ge6KD3dC1E10=;
        b=Tz+Bt8QQzv7kL9y7ZtoO4YocdrPrZsQcHoMul6RfWSBJo9o2f+oLxUPk9JTusAJivu
         +1NOWhaXMFGEQolVVIJbzsYNNEFueYz5kPS5n3OEwjPMCEUiSjIWjS8FOnXxbLgSjIqI
         kinZMfhorfYwoPjb60Rt1Zbgei6ml5VXqwim0d6GkxOG1eH7KcNQ1zSVK+KA26nRzMRK
         Qs2mJ34VuusoRo2oOT1baKFiWc5iWOGp5ptOnir43NOMTAhN0g/GFB6PlCenJaZ9Nsq7
         3so47PLYLCtYpLXlv7bF9LOv5IAJXjJPsQo2ayjO0kfsopZ1GX+eYWorQfp4Ic7Owl+0
         o0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731402509; x=1732007309;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzzVliE9xmqKKD2cUHeOEG/9iZ9Yii9Ge6KD3dC1E10=;
        b=c13fskdfzH36wl6TwqqlV6qCayJzdXtMP21+bZLNokl/ylH7TWxaPNk6R2Nm0Tv0q3
         6nFUcnMYmAJstZgOZ6B7P7aRIAEPBuxayeOWju0dV4jj7cCrs5YocEQJPz1E+twHGdZ1
         oI54JjA4Jx/8H9JU3LJG/7P8UE9ctmDzHgeO8S1kWDnBNYxMwnfiUqldCDMQ+VXvYYVA
         Hq6xHGuq0w+f6eD69gzbG2mx0S4LiKeBAfsx7OCmfzVacDHXbU+QXnFPQ5AhAzE5lbI0
         0ngVaGEcyHL6jFnNWSWnPCSLdpf+BowmupEdJRQjr/TEa0/4rwZ9Nw0E68aQ633IHGAG
         J8ag==
X-Gm-Message-State: AOJu0Yy2J3tKUNmb9WVcmtStd/b+OyKs7tttb+4dlGduXL4qSijWa8m5
	nqKGxn+Wfw/dHASgiPKR1Wx0w92mxykmnfo00t95gfwZ/00psFOVB7bUAs7B784=
X-Google-Smtp-Source: AGHT+IElJjCiHMHLIMZ2P4VaE9/GOUhM1jlWpl5pmhN6HQKT7uxLeNAQgGsGs9uKZE8nMUchS4e19A==
X-Received: by 2002:a17:907:a09:b0:a9e:b5d0:4ab7 with SMTP id a640c23a62f3a-a9ef004ab81mr1611943966b.52.1731402508973;
        Tue, 12 Nov 2024 01:08:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defbdcsm691073766b.159.2024.11.12.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:08:28 -0800 (PST)
Date: Tue, 12 Nov 2024 12:08:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org
Subject: [bug report] Input: ads7846 - add dummy command register clearing
 cycle
Message-ID: <43cbfdfb-766b-4640-997e-2e731c8f6875@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Marek Vasut,

Commit 781a07da9bb9 ("Input: ads7846 - add dummy command register
clearing cycle") from Mar 20, 2024 (linux-next), leads to the
following Smatch static checker warning:

drivers/input/touchscreen/ads7846.c:412 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 6
drivers/input/touchscreen/ads7846.c:413 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 6
drivers/input/touchscreen/ads7846.c:416 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
drivers/input/touchscreen/ads7846.c:417 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
drivers/input/touchscreen/ads7846.c:418 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
drivers/input/touchscreen/ads7846.c:418 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7
drivers/input/touchscreen/ads7846.c:419 ads7846_read12_ser() error: buffer overflow 'req->xfer' 6 <= 7

drivers/input/touchscreen/ads7846.c
    353 static int ads7846_read12_ser(struct device *dev, unsigned command)
    354 {
    355         struct spi_device *spi = to_spi_device(dev);
    356         struct ads7846 *ts = dev_get_drvdata(dev);
    357         struct ser_req *req;
    358         int status;
    359 
    360         req = kzalloc(sizeof *req, GFP_KERNEL);
    361         if (!req)
    362                 return -ENOMEM;
    363 
    364         spi_message_init(&req->msg);
    365 
    366         /* maybe turn on internal vREF, and let it settle */
    367         if (ts->use_internal) {
    368                 req->ref_on = REF_ON;
    369                 req->xfer[0].tx_buf = &req->ref_on;
    370                 req->xfer[0].len = 1;
    371                 spi_message_add_tail(&req->xfer[0], &req->msg);
    372 
    373                 req->xfer[1].rx_buf = &req->scratch;
    374                 req->xfer[1].len = 2;
    375 
    376                 /* for 1uF, settle for 800 usec; no cap, 100 usec.  */
    377                 req->xfer[1].delay.value = ts->vref_delay_usecs;
    378                 req->xfer[1].delay.unit = SPI_DELAY_UNIT_USECS;
    379                 spi_message_add_tail(&req->xfer[1], &req->msg);
    380 
    381                 /* Enable reference voltage */
    382                 command |= ADS_PD10_REF_ON;
    383         }
    384 
    385         /* Enable ADC in every case */
    386         command |= ADS_PD10_ADC_ON;
    387 
    388         /* take sample */
    389         req->command = (u8) command;
    390         req->xfer[2].tx_buf = &req->command;
    391         req->xfer[2].len = 1;
    392         spi_message_add_tail(&req->xfer[2], &req->msg);
    393 
    394         req->xfer[3].rx_buf = &req->sample;
    395         req->xfer[3].len = 2;
    396         spi_message_add_tail(&req->xfer[3], &req->msg);
    397 
    398         /* REVISIT:  take a few more samples, and compare ... */
    399 
    400         /* converter in low power mode & enable PENIRQ */
    401         req->ref_off = PWRDOWN;
    402         req->xfer[4].tx_buf = &req->ref_off;
    403         req->xfer[4].len = 1;
    404         spi_message_add_tail(&req->xfer[4], &req->msg);
    405 
    406         req->xfer[5].rx_buf = &req->scratch;
    407         req->xfer[5].len = 2;
    408         spi_message_add_tail(&req->xfer[5], &req->msg);
    409 
    410         /* clear the command register */
    411         req->scratch = 0;
--> 412         req->xfer[6].tx_buf = &req->scratch;
                     ^^^^^^^
The ->xfer[] array only has 6 elements.  Should we bump this to 8 elements?

    413         req->xfer[6].len = 1;
    414         spi_message_add_tail(&req->xfer[6], &req->msg);
    415 
    416         req->xfer[7].rx_buf = &req->scratch;
    417         req->xfer[7].len = 2;
    418         CS_CHANGE(req->xfer[7]);
    419         spi_message_add_tail(&req->xfer[7], &req->msg);
    420 
    421         mutex_lock(&ts->lock);
    422         ads7846_stop(ts);
    423         status = spi_sync(spi, &req->msg);
    424         ads7846_restart(ts);
    425         mutex_unlock(&ts->lock);
    426 
    427         if (status == 0) {
    428                 /* on-wire is a must-ignore bit, a BE12 value, then padding */
    429                 status = be16_to_cpu(req->sample);
    430                 status = status >> 3;
    431                 status &= 0x0fff;
    432         }
    433 
    434         kfree(req);
    435         return status;
    436 }

regards,
dan carpenter

