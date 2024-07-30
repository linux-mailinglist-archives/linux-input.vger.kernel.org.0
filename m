Return-Path: <linux-input+bounces-5208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35294156D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 17:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5E928542F
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A4A1A38C0;
	Tue, 30 Jul 2024 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYpN4cLg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655219FA91;
	Tue, 30 Jul 2024 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353268; cv=none; b=JIRNvcrbr3b8+dPIZMnlIStwKfoSwfRFOEsY110C10Sx8OV33ynaMf/JD/sAIJSzLbdrH7xWI7cmo/r29/sd8kr2nEjDci5xxby64kSrbThUluzns04TjzDZFiIb7aYdqNOZXUrzuIoIfNs1XygUaacYLT1dJYoSHICupt4NK1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353268; c=relaxed/simple;
	bh=JZw8WwEedVSoAPqbDc8RGAXuCyf+bLo0NDiUMu3dTPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/ZHu+9snx4/AgQf+Sa+7+Xz4EUchlP6hknal1t0GmgQgXa/jYjZrVxA+4mw92lf8B7hkubKRGTalewWWyhFn00WrJQTg6FNaMNA379EqgyPb96DA0CHjg2F3HtuxSAQ5tvWTZkKpdgMx2cEw77mx4ERaaVp4tY7RocewJUUWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYpN4cLg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d333d57cdso3185505b3a.3;
        Tue, 30 Jul 2024 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722353265; x=1722958065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9fB8RPDY0z+oCE/hyzm1c3RzHRC+GlwxeI848w9iZo=;
        b=LYpN4cLg6yPJBuTqajK1NEWW1TupN2oof4JoY8S5xD8p22BoQZ04ta+eWDuuwlyJjk
         Gb/z/ci7miHfEeCkgV1U+fpCQhrrxR9k+ZlYa94xrKaBgmd9ShS52iMiKQun7WsO5v/8
         JG9T+v2uYvdBaRhpMf5KVPLPpMYLQxsB6a0n6WpIg7ATqV+SUil+zpB5cOVVDPQjURid
         9ivFgX7lrWS/FYBTmKv543JIq+FiJlVodZUfjcLp5VjgYW3FbbCE2ZDIT2fTynU+Hbtd
         BgLOkbrYCME1qkev1+z40tmDTW+LIdp4gggPCUzmzMDNEnRyLPAzxKcQHshlpvJNSpre
         L+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722353265; x=1722958065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9fB8RPDY0z+oCE/hyzm1c3RzHRC+GlwxeI848w9iZo=;
        b=mjtyw/aCBrZbKLFFrA0CdOmm1WzbsnACfqpQRBVw23z3+Lk9UNYN34Ducmeu/zIIaa
         6xfT5qM4Wmw/fv8UA70iuuDLwW7p1hTG3cOoWt4zM3iq6n1/9W7t7/YEYhJXTuR9rYsM
         znTNA1FI455qp5P5O0vZd76r1BeFTTR1bHHD08UCpWl6/t3ynp4oNtbdvbm+b4iYlLDw
         DNDIq2tG8y9EgOCvqf2ttuYlIHh2d5BcwTxNYsc1ggssfffdzMeGHdM/U3kAGTz09Z6l
         ZLcRB96ey5KQOkoCW9nZFFJE04vhOz4HMCCU2OluXQlcHhAHNUKwPeXERbRI9jeYimuY
         wbBg==
X-Forwarded-Encrypted: i=1; AJvYcCXtro2saMEhkAn4XR9xHVt1pLyzce26qq0v5UKANpEe8k0wQISPwjl9uBuJWjRyOHBbF3FGm+/oKh+ldmxrlSvTbB2WQ9Wd6Y+ru2Ue6ZMpxpfclri9fQSw6+TE9jqsAIgePyMdHMwGk/On89eW0J8r22J1iKe2LRjZHKfqPUxJgpn04p94ntR3SAtlcOsvZAbaQcJovXr8w5ps6Roio3HAbVYPUMBKFSg4mBmB4+mNVXPYY5rVtWcZ7HkMCO+p
X-Gm-Message-State: AOJu0YxW+AUGIxFBAuVrw1ewEuosjbdZZRmOwiToUEQ2WYLSJg2hoDju
	+gP6nw5mdMowZ9afY/Lj7YoJlTd26GsbLGqMeVL8cQBf0FLNUkNv
X-Google-Smtp-Source: AGHT+IH53uN+ps3K8FG722OlZVH9uQ9lhJBPizHtofyjk7vLzArAEYnaqOOhdbpSqtoFe0xY9sV3lg==
X-Received: by 2002:a05:6a21:6da0:b0:1c2:8ece:97ae with SMTP id adf61e73a8af0-1c4a13afd52mr8779302637.34.1722353265287;
        Tue, 30 Jul 2024 08:27:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead86ff47sm8863987b3a.145.2024.07.30.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:27:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jul 2024 08:27:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, dmitry.torokhov@gmail.com,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 5/7] hwmon: add driver for the hwmon parts of qnap-mcu
 devices
Message-ID: <83226476-8b23-4a11-a100-d01049f6eef2@roeck-us.net>
References: <20240728211751.2160123-1-heiko@sntech.de>
 <20240728211751.2160123-6-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728211751.2160123-6-heiko@sntech.de>

On Sun, Jul 28, 2024 at 11:17:49PM +0200, Heiko Stuebner wrote:
> The MCU can be found on network-attached-storage devices made by QNAP
> and provides access to fan control including reading back its RPM as
> well as reading the temperature of the NAS case.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Minor comment inline, in case you resend, otherwise

Acked-by: Guenter Roeck <linux@roeck-us.net>

> +static int qnap_mcu_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +				u32 attr, int channel, long val)
> +{
> +	struct qnap_mcu_hwmon *hwm = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > 255)
> +			return -EINVAL;
> +
> +		if (val < hwm->pwm_min)
> +			val = hwm->pwm_min;
> +
> +		if (val > hwm->pwm_max)
> +			val = hwm->pwm_max;
> +
		val = clamp_val(val, hwm->pwm_min, hwm->pwm_max);

Guenter

