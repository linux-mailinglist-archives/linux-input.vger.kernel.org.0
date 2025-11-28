Return-Path: <linux-input+bounces-16389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C62C911AD
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 09:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A51E43A6BF7
	for <lists+linux-input@lfdr.de>; Fri, 28 Nov 2025 08:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295C82DCF52;
	Fri, 28 Nov 2025 08:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SiVskeq6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52192C0F68
	for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317449; cv=none; b=FzE9gEJIqFYCMCPDYWoQIlUuRplClaTuS++jGaNJlWjXLqAHs9IwC0TqWg26z/nVJv4VlCMcr9wiwelsqEjdrhgio9rRowW8B1PUF23YD/kpYwA5Twms89zEDle8+CUvJyHqPX+Pzn8zrCCeo9XZ0qekl17zk0AO8zb3KgO+fX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317449; c=relaxed/simple;
	bh=BI6d5r9H0oVhcgY7hqM0ujL/0z2q9c72cR3/Pq4ycVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmgLqIqnefC/ZcKjdlRouSoVNOfpw0iAikiSDXGz+HmALhMV3zORaovJgt31Jt8ZRoamGMyKPBBveDSmVFEAU0IIbUiP4AupRy6CYSCjkWfKPq13OHbZVKJh0BAaqARwiSSthMZ84z5ZvAj7PhffuUaYz5Ap3JhTecLoFOAKm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SiVskeq6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b38de7940so738116f8f.3
        for <linux-input@vger.kernel.org>; Fri, 28 Nov 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764317445; x=1764922245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=SiVskeq6fS1FHwAMamNK5PYuedSA93M5Bzg0yrtGs3Vr5Llc40P2NzcfRmz5J66o1k
         m84N4iWTxOtr5b+x3qLpUlRBHt63gzQeDCIGj5jYZgRCLb5RSMFZmIzCasHW4NyPJ+8w
         qy9SeOQrTLcZEfLvmgF2A7uUDuw14KblgaXULzw7pyaOMl9AApiYAmtpQaX9wFf2/IgA
         go9jqHKAiaHvocJYzxJnrhfIdZMaGqmhfahg/7qCKuvy78e/qW2hMB+jdJh1CRvn3+up
         7ynNV8oJz3Ruq+ZLVcJh9as3+qkkL1seDWmmo+gl2x00y7kjuANKol0ocDQVguNQM2fc
         6ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317445; x=1764922245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=nW6Ab5n/a/SBshgS5qziQvH22gWRI/b/HrxzfNqn7/W3L6dc+U1vRZnW0ewiXy2J7c
         uEsQxnqPGA8gzfp++rG5nSC9kSyGSKxBVTDFFxAkyjpelFOFt2Zy94PwUMV/9eUu7yGe
         8eCxUTLgfVQG+SP10eym8JgIYmAA/frrAINst+azAl4LXcPzPIOXgwXEbOOWlNCmQYxX
         v2BYkKOis2k+Y2hiDooCBzQ7bQzVZLmEawQGQwljWv29Z2ui2keQq4tIZBFHqHa+HAsM
         153JbNwDkVBflW0fAnC5Yl27qCse+rc32g+xxF0x0VbR2tAuBI/FM6n1gwzb+I5wQokm
         SPXw==
X-Forwarded-Encrypted: i=1; AJvYcCXT30llQgb5BbPdRb1Ouys/k/0v96jbBtRNj45LDOb7aSChgsKGdyTVzsRqwtTCqSAhTZDbPQ2jqFIGXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzTeU8DS8MhemTiGwLtuNtIfE1LOyGaRrikc+eZFx9N0X3eRP
	KdEAEazXdYnIa9Ze2hf7ZHooCsni4HqhzrS1OUgHbiP0ojVZ+c+nscP3XGiyQLAV8uU=
X-Gm-Gg: ASbGncurmZqJU7VF2G0taY/BA+33n5NPd90w0+jkDdGKMANNQd/2bHKOyQ6WbUuOEXF
	2b7BJZhvLbyumfQSn7ED1cRlg0gV2PLdzR/eAca/UjPrQFZ8PGuWac3YQFLm5fYiGw8PY0Jf8rM
	0MNDWEuQtEZNV7nPKwpczjvHkuDSYx7orDT4ViqHP0s0ie7aGJ5/dku5BxhmSY0oKMUdaQlBJ5q
	DVlPh9b+hv4MR5r9kKQz+5d6l5hm2N1p5E+cSNkfTSiwnWlVDMW5DsdrxzDbX5CAaw8TqvM76tl
	Ph9kBFAbEEWLvGajNNJMzHjctfU8+ndwg/qhJsukOhDoojz7S2vSrVfmNK590ofSmFa767eXo2o
	gb/iCRe3g7nKFmxAa2GbHAXNow0QrQ7QadwM0n2/bM1Ng4ojV3AH1Q4Xp6PwPo6Vzda5N5HSfgO
	e8OiZMYznW5vlN/ezj
X-Google-Smtp-Source: AGHT+IHVNGxLHdQSfNonRBBq78f347/I8I+ulkCPlaTONnGVXYiUFj038obXmFsDqBT8iAGXzvuP8A==
X-Received: by 2002:a05:600c:1d1d:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-477c01ec3f5mr247354265e9.33.1764317445111;
        Fri, 28 Nov 2025 00:10:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47911143bb6sm83247115e9.3.2025.11.28.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:10:43 -0800 (PST)
Date: Fri, 28 Nov 2025 11:10:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <aSlY_w-nXA38PrBO@stanley.mountain>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> +static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
> +					 struct device_node *hwmon_node)
> +{
> +	struct device_node *key_node __maybe_unused;

The for_each_child_of_node_with_prefix() macros declare key_node so this
declaration is never used so far as I can see.  I thought Sparse had a
warning where we declared shadow variables where two variables have the
same name but it doesn't complain here. #strange

> +	struct macsmc_hwmon_sensor *sensor;
> +	u32 n_current = 0, n_fan = 0, n_power = 0, n_temperature = 0, n_voltage = 0;
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
                                                       ^^^^^^^^

regards,
dan carpenter

> +		n_current++;
> +	}
> +
> +	if (n_current) {
> +		hwmon->curr.sensors = devm_kcalloc(hwmon->dev, n_current,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->curr.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
> +			sensor = &hwmon->curr.sensors[hwmon->curr.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_C_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_C_LABEL;
> +
> +				hwmon->curr.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +		n_fan++;
> +	}
> +
> +	if (n_fan) {
> +		hwmon->fan.fans = devm_kcalloc(hwmon->dev, n_fan,
> +					       sizeof(struct macsmc_hwmon_fan), GFP_KERNEL);
> +		if (!hwmon->fan.fans)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +			if (!macsmc_hwmon_create_fan(hwmon->dev, hwmon->smc, key_node,
> +						     &hwmon->fan.fans[hwmon->fan.count]))
> +				hwmon->fan.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +		n_power++;
> +	}
> +
> +	if (n_power) {
> +		hwmon->power.sensors = devm_kcalloc(hwmon->dev, n_power,
> +						    sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->power.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +			sensor = &hwmon->power.sensors[hwmon->power.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_P_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_P_LABEL;
> +
> +				hwmon->power.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +		n_temperature++;
> +	}
> +
> +	if (n_temperature) {
> +		hwmon->temp.sensors = devm_kcalloc(hwmon->dev, n_temperature,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->temp.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_T_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_T_LABEL;
> +
> +				hwmon->temp.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
> +		n_voltage++;
> +	}
> +
> +	if (n_voltage) {
> +		hwmon->volt.sensors = devm_kcalloc(hwmon->dev, n_voltage,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->volt.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_I_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_I_LABEL;
> +
> +				hwmon->volt.count++;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}


