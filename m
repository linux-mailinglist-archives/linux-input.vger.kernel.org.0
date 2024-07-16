Return-Path: <linux-input+bounces-5049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C642B931F9F
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 06:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E46F51C20DE3
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 04:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D26823B0;
	Tue, 16 Jul 2024 04:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOvaDk5L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687737B;
	Tue, 16 Jul 2024 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721103461; cv=none; b=jSbZgKFlhHnGQg1vrbGHOEhnQO2AEVX45ZlmmqYTnraDRHVCNSkf+ccdaC4Tz7eG1st5WrPNzCoh69dLwlYHYFzlaQuNvG3a+lzwtwhXFuAQSXQ4RoeFO6PuhWmZJBKF3q6rFSvKXR4H9atgvuR64i2lwO+xtxo5BoCsaj41CA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721103461; c=relaxed/simple;
	bh=qJn8e1i5WLq5UWGU0oBfqjMNX1SJrBxdFucDEfseg04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btcON/FDWg+VQ/gaTRz5UCzjiWfB6vEzRd7AjHLFj+P8dc1pXVlRzAomEzwgYbHc3ro7exdx72MTRaL0H4/6+UqcMoWo4sc8Z2KLZ5MPqpEsbF4Us4Lrt89DriUrsycU+Lqwwm/ZA3p8GkpLxFY/jVkPxC1TZMKViJ/D6N4z16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOvaDk5L; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5957040e32aso3318159a12.2;
        Mon, 15 Jul 2024 21:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721103458; x=1721708258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhFeghLSccQHLDcLSo9e5QnjvRQLxj2zjcsbdhYZSqE=;
        b=hOvaDk5LXJP0WLrR1zCOEtMJgkfoFY/DNrJxfROevICiKoeFPDKoSRe2/1iMYwP1ZA
         EOy7/GnxEyK2xJVal3z2VB1kKRLw+nV6RNLXpBMLMCz7Vfc9HigH78tmArlboAwj76Sv
         yeOQwc6bfoH7DoW2NPCkc5w2g9IUcm68NQ0ls/ADmh7JhVPogX2HMs5ctUy3ZoAegM0p
         Zrxz2AIMI2Y+UYuVKkVXrMMowPng69XwlWonDb5sES8WwrcC/qu3+mx2WcOrZ43mJfkL
         GV33KlXAxeVn7Wd+qag1Itf6PXE6Q2KLBl4dktDOYP4oHF6CDmPAK9oq77XBlB0QWtdP
         AX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721103458; x=1721708258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhFeghLSccQHLDcLSo9e5QnjvRQLxj2zjcsbdhYZSqE=;
        b=S7ZerSWBcjO9GRAgxpXO4x0VE46IxfGcEltHLvlcYQUCcelSRnYrvgVS5ZURDm2TSl
         KniL+IZ9Szy40sIxsnkehafV8SJlhccqtXElpNOBwOeXKn1oVVwx5TciUPwAhc9EjlQ6
         onerSpztvCxcdcL9VpndDeC4tt4x4N2b0r0KREDJTwqwnxeOPfVVuQ6tLePqIhJDC6Yp
         +5JLGEA6Y5maTsdF89uW3ugR3wvznlOTz7dK8jx8X6QWc1wuhzgfZK8nRp00E1yblZU3
         B2c10IA0RsdFakaGkr21PPMUNerf8QPJn7XzjEkb85ozl+coeTVNyhKz5NyehiUpxmrz
         U7tg==
X-Forwarded-Encrypted: i=1; AJvYcCWWIK6AtgYiyUtylxe362bLZhMN43qtFH7X8yTp4fIocRQZFDaOFUrN2E7Ur5DvjNORoVnnGFt+1jVXt37iI0wFoEVXNZ5iNyP+DSP7
X-Gm-Message-State: AOJu0Yx7WueX7u7q6+mP006mPUBRZqt8UbtvMvMTzRLovz9HJsu41kxN
	o04PV29df9OHNyARykG6kLJlPY62580yJpnrgimxcCLebmBVtUddWMaMuw==
X-Google-Smtp-Source: AGHT+IG3SMJScO8ARZP24U9bTJmilJ1G/xzJWovTLCATt8gREEpXnkKf1ea9AMJD/c4BZTzHB8QBZQ==
X-Received: by 2002:a05:6402:13d6:b0:58c:ab6f:8d63 with SMTP id 4fb4d7f45d1cf-59ef09d20b4mr674566a12.39.1721103457271;
        Mon, 15 Jul 2024 21:17:37 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a271fsm4198764a12.78.2024.07.15.21.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 21:17:36 -0700 (PDT)
Message-ID: <5fcf9e51-1fcf-4f51-8870-e709b6c87a55@gmail.com>
Date: Tue, 16 Jul 2024 06:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] input: qt1050: use
 device_for_each_child_node_scoped()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240412-input_device_for_each_child_node_scoped-v1-0-dbad1bc7ea84@gmail.com>
 <20240412-input_device_for_each_child_node_scoped-v1-2-dbad1bc7ea84@gmail.com>
 <ZpXG_TOdvq6SF22s@google.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZpXG_TOdvq6SF22s@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/07/2024 03:03, Dmitry Torokhov wrote:
> Hi Javier,
> 
> On Fri, Apr 12, 2024 at 10:57:31PM +0200, Javier Carrasco wrote:
>> Switch to the _scoped() version introduced in commit 365130fd47af
>> ("device property: Introduce device_for_each_child_node_scoped()")
>> to remove the need for manual calling of fwnode_handle_put() in the
>> paths where the code exits the loop early.
>>
>> In this case the err label was no longer necessary and EINVAL is
>> returned directly.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>  drivers/input/keyboard/qt1050.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
>> index b51dfcd76038..6ac2b9dbdb85 100644
>> --- a/drivers/input/keyboard/qt1050.c
>> +++ b/drivers/input/keyboard/qt1050.c
>> @@ -355,21 +355,21 @@ static int qt1050_parse_fw(struct qt1050_priv *ts)
>>  		if (fwnode_property_read_u32(child, "linux,code",
>>  					     &button.keycode)) {
>>  			dev_err(dev, "Button without keycode\n");
>> -			goto err;
>> +			return -EINVAL;
> 
> It looks like the chunk actually switching to
> device_for_each_child_node_scoped() is missing from the patch. I added
> it and applied, thank you.
> 
> Thanks.
> 


Thank your for adding the missing bit. Did you remove the child variable
at the beginning of the function as well? It will be unused otherwise
(child is defined in the macro itself).

Thanks again and best regards,
Javier Carrasco

