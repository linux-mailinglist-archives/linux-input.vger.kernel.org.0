Return-Path: <linux-input+bounces-3793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E28CD00F
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07FCC1C21946
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 10:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D7613DDD0;
	Thu, 23 May 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auLBdOuO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B147E13CF82;
	Thu, 23 May 2024 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459085; cv=none; b=JyNH3GxMdHl5oWoP9H8BE657hNQVS5EXUpwe6DQ/3mobiJEDP7O6UXZVL3Taw7TLHxDDPjt56QeisGA6KP2SOVORHbhC+k0jBM5fhb/mC/lFAnASiG83wpezerRVtOC0JiSspnNxTFXaxJ1QSFoXMXYs+hRS2qRQfQ40CX0rTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459085; c=relaxed/simple;
	bh=tf9bVY5D0PDbVrh+9jtGS5BTPVHKnIka5631UqSSHiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5OFvnccW+qAG6vU7dHJD0upFYCJCOV78LQrDPkn8FEpGPf7twyVXr0JtQHrTwA5Rf9EVf9RKMUr8/dCS9Iom6TRzAvpQu8oNm1bjmCOuoxAiVVqRP/yHS9iTaKwJsXo9mUZmyfce4rOeDUfGLwtB+HV3+7aVf3akKeGsezC6mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auLBdOuO; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b281f0d06dso799194eaf.0;
        Thu, 23 May 2024 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716459083; x=1717063883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rm3eG/bDkeO6dcSIObDU3K0ffm6D2WZJf0O5xZU7Jhw=;
        b=auLBdOuOkUgVBn9znl7DurydmNJG7j2yA62fhgv0phiWkcjyjUnseo1PVd62SCItVp
         L0pgLWBQ4zjcEKwJL4opNg3jCYS4YHINqeCKKypehhcj8VncgG7hycgfXSZIjc+IBtML
         zL5sWxzuSa44+2/gSdoMWpwowx1c39QPXba3qK2Q98sGlNEZw/VXGYI104ExyslUA8ox
         I+yVaPamgV7tXk8wyvEB8u3GiQxVdfbyI1Elf6Gj4zez1obcmc1ezkSsjQNFMnlmilmm
         7zkTdujf4gGVrk/dM0Tv3wkU7nuwWF125De0aFOY2/DlherjX8CUfHKh1YwuNQOE1+St
         tEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459083; x=1717063883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rm3eG/bDkeO6dcSIObDU3K0ffm6D2WZJf0O5xZU7Jhw=;
        b=gKxKWjbyMJFrqla8JOylvUQ1ci5YrXB7eMx2FPbDflYXbWAm9K+3UQ2lpaoRq6ewW2
         3cNAVyUaafMX1NgmUWw7V4JHbuHXVTY4g4vFKyGrsmKn5QW0iucPBbl4bgrA2r3/lSGB
         AUdCO0EDKzP6neOQXmgng7SZPoriQnvaqRuSbiySzB7qjJs9jidWYXjbkgpa32P8ViKL
         ojr2HneyU8GyaGg3jbZBCpbgXTbEduxbV3dKxPFNG62T8+wo4inuUYDnuaYsKmZ1Xy1U
         vBXOcpsQmYyBZWFOrSLUXAI7cuaP8r3nfcGoBCx3XoCfIDhtYB6qQcOPy1whfQpfkVk2
         moUw==
X-Forwarded-Encrypted: i=1; AJvYcCWd5flapyBrD8sXwZYYXDV1T4E1C73QM5yKwtp/dm9e3wgzBg9uprK20PDkJiGqVUXFRmugzSxrkvVTpm6aUQ1d0Movfxzz6p5GW2Klr4LdTS1X2aY7UsoQeyoS99jVKI4lw8C9iuq8sA==
X-Gm-Message-State: AOJu0YwbCYzB3i1Go8OFxf+5ClCFypIZQYSU7kqxIKIY1f2xd/bITp79
	6QjOEPGi4hp1C6D170D0oVp1hq0aKxIaObEiSRvEIolv2OKiK0iY
X-Google-Smtp-Source: AGHT+IG1LR4o8EeBn4RLbcnZTHgwZRhS8Lj8EtU5Vgce+HuHfXvww62MCp0pPm2kTXhKlDPgniqFCQ==
X-Received: by 2002:a05:6808:14ca:b0:3c8:4dcb:1e75 with SMTP id 5614622812f47-3cdbb05c330mr4627529b6e.5.1716459082670;
        Thu, 23 May 2024 03:11:22 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf27591bsm1480868785a.16.2024.05.23.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 03:11:22 -0700 (PDT)
Message-ID: <1c412f00-dbad-4f3f-8f94-300df546d6c7@gmail.com>
Date: Thu, 23 May 2024 05:11:21 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: document Novatek NVT touchscreen
 controller
To: Hans de Goede <hdegoede@redhat.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com>
 <20240521-nvt-ts-devicetree-regulator-support-v1-1-8d766c639dca@gmail.com>
 <6f22e42d-8a06-4c24-93bd-25b6ac141cea@kernel.org>
 <3aef46dc-ab15-4f29-909e-bb7500b32cf9@redhat.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <3aef46dc-ab15-4f29-909e-bb7500b32cf9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans de Goede

On 5/22/24 11:00, Hans de Goede wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - novatek,nvt-ts
>>
>> That's too generic. Looking at your driver change, it is not even needed.
> 
> I wrote the novatek-nvt-ts driver for an Acer Iconia One 7 B1-750 tablet,
> this is a x86 tablet which ships with Android as factory OS and because
> Android OS images use kernels where everything is hardcoded the ACPI tables
> do not describe this touchscreen. Instead the i2c_client for the touchscreen
> is manually instantiated by some x86 platform glue code. Since it is
> manually instantiated it uses i2c_device_id binding rather then OF/ACPI.
> 
> The generic "NVT-ts" i2c_device_id comes from me not knowing the controller
> panel type back then. In the mean time I have learned that the B1-750 uses
> NVT-NT11205 controller.
> 
> So what I think needs to happen here is add a preparation patch as first
> patch to this series which basically does this:
> 
> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
> index 1a797e410a3f..224fd112b25a 100644
> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -278,7 +278,7 @@ static int nvt_ts_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id nvt_ts_i2c_id[] = {
> -	{ "NVT-ts" },
> +	{ "NT11205-ts" },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index eb0e55c69dfe..5ecee6e66fb4 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -40,7 +40,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
>   	{
>   		/* Novatek NVT-ts touchscreen */
>   		.board_info = {
> -			.type = "NVT-ts",
> +			.type = "NT11205-ts",
>   			.addr = 0x34,
>   			.dev_name = "NVT-ts",
>   		},
> 
> This solves the too-generic ID problema nd can then be merged
> together with the rest of the series through the input tree.
> I'll give my ack as drivers/platform/x86 subsys maintainer for
> merging the x86-android-tablets change this way.

Ok, will do so in v2. Thanks.

> 
>>> +      - novatek,nt36672a-ts
>>
>> Eh, we have already panel. Why there is a need for touchscreen binding
>> (binding, not driver)?
> 
> I believe that the nt36672a identifier is an identifier for
> a novatek display assembly which contains both a DSI display
> panel as well as an I2C touchscreen. Since I2C devices need

Yeah.

> to be children of the I2C controller we need a separate node
> in the device tree for the I2c touchscreen-controller and since
> it is a separate node it needs it own compatible I believe ? >
> Regards,
> 
> Hans
> 

Regards,
Joel Selvaraj

