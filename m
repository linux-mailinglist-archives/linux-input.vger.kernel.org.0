Return-Path: <linux-input+bounces-4024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F88D75AD
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 15:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF85A1F21831
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 13:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B194D3C6AC;
	Sun,  2 Jun 2024 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lc0P7LwZ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3336E3D0D1
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717334592; cv=none; b=uH+O80kB7dQp9MummgKg0cNe3SlbyxREEvCjXfXB2Ao0kpf8F6LOPAz7snHZ/qlPIVQLIAXpiqmzKet5hnx1aJaUyrOwLAA2euxM10Wa6LbdqJGFcw3G9BxIDYFG7Kcyojfon+VXsJhub67bzLYwOdzB8cvISguJW7CRv2rDYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717334592; c=relaxed/simple;
	bh=vqOvPpShz9c4/2fZ9ulQIq1neCkg/aGM/PXFpXXYXnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/+SfvEygv58gPX1Bee6Zr1IAjV+l5rTeP/qHtzmDUYyhQG0Msn8AMWa6CijwHbhIpRvOjkFp8iRZPMc3gx9myZJzT50372EgNY3pZj67NxlI433dZZ+D3Snsf8Sf4hRFZqSFBn7rEMD0EjjSOuDqN2N1z29mRCznnXwPPQh+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lc0P7LwZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717334590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zm40TjPLoYzCa0pq6+pwu4O/kjQl3e30AsjOxEDak28=;
	b=Lc0P7LwZVV8A3TmE91WjQSfpUTeqrUhiwpBB2CmMQGQ/VUQP1j8o4zTIptFghaiLOKnyPb
	0B5RW9MTjGIwYm314x10dXJ1ST9yQaPWA3Hv0J8/0qBwyKHRX0dOuIT6BixQ9teDvCdsa2
	sRTk2KS9rcTnMtorX1ObXYAcbtcVby0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-R7vFx6RnOXaIQCeagBTwtg-1; Sun, 02 Jun 2024 09:23:07 -0400
X-MC-Unique: R7vFx6RnOXaIQCeagBTwtg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6905050583so11734666b.0
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2024 06:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717334586; x=1717939386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm40TjPLoYzCa0pq6+pwu4O/kjQl3e30AsjOxEDak28=;
        b=q3ihvaBmrDRZrod0mJLpXkchR2nY1B6KATVZfyxe5pXCQUy/aYDXjSSwVv49DnbCrH
         MqwVDjm1fJYm7FSb0fy1YZO/l5DcVEtS642BMXqu0SQsHkU6O5WYQ3KysDn3P3HodwFz
         xOMxcEInwWpIB8YJs7j4LajxrWzcSj8ZZuMkV3CtjWGG/n9J4YOXaEg+Rf1nDaFy6SrX
         2MkR9wfXqKMOXIq+blAveJOw/+Ockl2/qUzlYMxzTZZ6EEmVv7JJoFO4uAolOnshZpgI
         TkaZ4B3CcMOB1Fe/oD1vmrIgFn/I0p1kiMRRJmoxe3DqLNymt5XJvJNwJ7PP8pVLHlZz
         JrMQ==
X-Gm-Message-State: AOJu0YzxjMO2zKwpu6oxVyR8mUkJBAotXika1PsYpJgkT1bzeQZ3BTXB
	Hj/yJ0ch5tPNfMOc7/+OZqGa9/Fa0sJt8lhJsPaqrlt3TzBUwzvqdA0qNBNO091aOCtTa7eA4a/
	1fESYc4o0KAl2QsGoz/XfDW8iXXbexnEF3UU1p5Y9RviweIs9EPtYzZz44KGm
X-Received: by 2002:a17:906:a098:b0:a65:36cd:c7b7 with SMTP id a640c23a62f3a-a682198281dmr408165666b.56.1717334586520;
        Sun, 02 Jun 2024 06:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuyqfIYOG9J9rpYr5XZ8Uec9LHEAnWTSmDXK7waAs/CbXOhMfOQC9Rj6SVHmiLfDu5sov9Ow==
X-Received: by 2002:a17:906:a098:b0:a65:36cd:c7b7 with SMTP id a640c23a62f3a-a682198281dmr408164466b.56.1717334585996;
        Sun, 02 Jun 2024 06:23:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a69018adad6sm46286466b.97.2024.06.02.06.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 06:23:05 -0700 (PDT)
Message-ID: <2bd7e800-5449-4c09-baf3-74af4c9f0065@redhat.com>
Date: Sun, 2 Jun 2024 15:23:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] Input: novatek-nvt-ts: replace generic i2c device
 id with specific IC variant
To: joelselvaraj.oss@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
 <20240601-nvt-ts-devicetree-regulator-support-v5-1-aa9bf986347d@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v5-1-aa9bf986347d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/1/24 10:44 PM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> This is done in preparation to introduce other variants of the Novatek NVT
> touchscreen controller that can be supported by the driver.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Also:

Acked-by: Hans de Goede <hdegoede@redhat.com>

for merging the drivers/platform/x86/x86-android-tablets/other.c change
through the input tree.

Regards,

Hans




> ---
>  drivers/input/touchscreen/novatek-nvt-ts.c       | 2 +-
>  drivers/platform/x86/x86-android-tablets/other.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
> index 1a797e410a3fa..9bee3a0c122fb 100644
> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -278,7 +278,7 @@ static int nvt_ts_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id nvt_ts_i2c_id[] = {
> -	{ "NVT-ts" },
> +	{ "nt11205-ts" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index eb0e55c69dfed..129273df0fdeb 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -40,7 +40,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
>  	{
>  		/* Novatek NVT-ts touchscreen */
>  		.board_info = {
> -			.type = "NVT-ts",
> +			.type = "nt11205-ts",
>  			.addr = 0x34,
>  			.dev_name = "NVT-ts",
>  		},
> 


