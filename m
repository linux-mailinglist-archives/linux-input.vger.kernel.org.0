Return-Path: <linux-input+bounces-3974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F29298D569F
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 01:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DFFF1F2244B
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 23:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7DB18628C;
	Thu, 30 May 2024 23:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kn7vr8cJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72487186292;
	Thu, 30 May 2024 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113196; cv=none; b=Z2BUJjysfP0cZJ4yivLxsOovUp50vZRDVyMtPnpnqu7sxcgIdzTBTMGaoVLl/9Lj6frlo3x3ST3A96IowRkaTqM9qiLt3Rty+s4PFT47IFL9enEaILzub1fS02wfXYjVF7S6L4miB4h51HEtZu6tDIgdE+U/FBP82pAyQw5rpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113196; c=relaxed/simple;
	bh=n/NnGrJBWUUWrQM+Zg26Zpv5a0cY/fsr9XA3lBuZ1Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHUdm5QOsrvtkmS5E3GA4i7Mwf0YMXscEtM03kO1WFZMH6SWNzXE/bsN8bJ1ik2col+q8YBwq5IzJ7rJt9TPjxFz69swwGPEwa7OybR0DdPmbzvRjV25j24mOsjaVxlZ56+rGnxQyfWxX63B5v2mt85SFcfA64fQfX+Lhx+yWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kn7vr8cJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70223dffaf6so1410066b3a.1;
        Thu, 30 May 2024 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717113195; x=1717717995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2C9CH9vjGU1VMl6SKEc8ZmtzP1GynChiRV91M0ldvbI=;
        b=kn7vr8cJQgK3oqhSIxrSWOcxFsKGCPvrxKPO7qrLHtI9lYW/A82EPOZAZWuGlLucQ0
         AwZbJhG7TfDGSiv1YByNjvPUlAA9zBoH5Q8Md/+oK5QNbJeRWZbREicxh+9ohypIIqRp
         yg+qyAuQY6Nq4ESdVbK1TYUaS3ssqtmhw72Np1ub75v2rsyAR6EfQdTETcQPAiLtTz+w
         WRxesS9bYNtraO56OG3rh2k9X3bzuG8YCjNR8YBJnuzJ4QS5tvO7FCHcn5iZxC8K5Lte
         PJGUzspx1Wxg5DIXpVesXBcYL2js+sm0QB0T4htUgVvEV+sYDst4Ejex4YVTDHG2dzJX
         0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113195; x=1717717995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C9CH9vjGU1VMl6SKEc8ZmtzP1GynChiRV91M0ldvbI=;
        b=ooH/EOoX1ri82OBVA/clW4PbrqK5cbjUZ4ILpo1XPupa7xI7yBVbh69OXizdWBlV7V
         eXb5fm2Ujm24RdKdU780ZPDtYJDZVKXhGeEFyJFJeO1/iYvOHoLOHniHUmzfI5vU5TXh
         ZR11GPRV3CX+9flwQMlEE/Tvo+P+Lk58rA9A9IEAUaInZi9fRk98OlqeAvu40Ak7lqNQ
         rxFRmoEIGLBScAxNTwakuhbXB0L0S3lkPW7T3xL+ZtnDipNJz+g2zz++4ruX6giajmuj
         LE8SqqFblqpNALPyw7kThORIT36IAw7spWTKQp+vXmSAIb3xWFN+hPqMbjtMNnXSc6Zs
         7Yzw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+Id+vaGY61Xpt22VZ7UTuWpu7dZvuW/mrjhDWaOVkFnadNvxFSktCrfmhgrmmL7b9W2bQabJigjWRtLca0ZDyPzAQBmjZki7XnbyqZV5OwTfi1goDYggqRnZkdv+d9rAiXtKDzNsKFg=
X-Gm-Message-State: AOJu0Ywlsu3CujXgYfMN5YgBbrPTIJLC0YuCDAmUXXfz9/aK3M24G4ig
	6yln58DW7/zjPxos34Qa5KX4MHm+J/AX2qEAq27cUqCh48masHPx
X-Google-Smtp-Source: AGHT+IFKn7FlpCpfuEdH7hXdIfX19//1591XTse80CgAHLZPxOaKaqr4ckoF9LpsDszMO3GQh9JArg==
X-Received: by 2002:aa7:8885:0:b0:6f3:854c:dedc with SMTP id d2e1a72fcca58-702478c91d5mr383082b3a.31.1717113194608;
        Thu, 30 May 2024 16:53:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b05dd4sm290860b3a.177.2024.05.30.16.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:53:14 -0700 (PDT)
Date: Thu, 30 May 2024 16:53:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Charles Wang <charles.goodix@gmail.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, neil.armstrong@linaro.org,
	hughsient@gmail.com, broonie@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: goodix-berlin - Add sysfs interface for
 reading and writing touch IC registers
Message-ID: <ZlkRZ7VKNVZSFi0X@google.com>
References: <20240514115135.21410-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240514115135.21410-1-charles.goodix@gmail.com>

Hi Charles,

On Tue, May 14, 2024 at 07:44:43PM +0800, Charles Wang wrote:
> +static ssize_t registers_read(struct file *filp, struct kobject *kobj,
> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> +{
> +	struct regmap *regmap;
> +	int error;
> +
> +	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);

We already have goodix_berlin_core->regmap, going through drvdata should
be cheaper than scanning devres resources for the regmap data, so I'll
change this.

> +	error = regmap_raw_read(regmap, (unsigned int)off,
> +				buf, count);
> +
> +	return error ? error : count;
> +}
> +
> +static ssize_t registers_write(struct file *filp, struct kobject *kobj,
> +	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
> +{
> +	struct regmap *regmap;
> +	int error;
> +
> +	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
> +	error = regmap_raw_write(regmap, (unsigned int)off,
> +				 buf, count);
> +
> +	return error ? error : count;
> +}
> +
> +BIN_ATTR_RW(registers, 0);

I do not think it is a good idea to allow the world read all registers.
Any objection to make it BIN_ATTR_ADMIN_RW()?

Thanks.

-- 
Dmitry

