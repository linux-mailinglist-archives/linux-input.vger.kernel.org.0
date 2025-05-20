Return-Path: <linux-input+bounces-12478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B2ABDB4A
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 16:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50EF4C62E2
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7730DEEDE;
	Tue, 20 May 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzLZvvLZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669DE24418D
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749818; cv=none; b=Yal9RZi+Rb9SdsufYRHTWCSze88S0iUHhmTLpliXL6iXqGcyGsWZ2Ii5NLcUWJ98R1w/wkGRYUQmWIoDs596fy2zrSl05Nuuoarg8q6UuPq5gh5WvIYhHybW+b+iquqGd6+O12iH1CBi1M8Xvt5vHAul7YJiXaOVVxfHIQlkqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749818; c=relaxed/simple;
	bh=nRb+Vr/wcgiZfk/iXOgvkRVbsGELVSSoF9d0PzdRYMQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p6x64q39Jc2tYXU9HeCtWHzqYvUZyG4SAAQBLLrFVCC6XTgYWqpeAr3Al8ZPLNE8XJO7qbsqWfDftQHIgKhiAOO3h+HcBcKJ5LQ6kPyRtylqhRbk2OKJISeoLj5DbiNrGW+OpoXoOR+nLzmdfzcB85rQgyBRW6ge/ayr4AuOFig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzLZvvLZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2875585e9.2
        for <linux-input@vger.kernel.org>; Tue, 20 May 2025 07:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747749815; x=1748354615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jDNQp/7VheuD5deGaPQPPQYiQLemybXe7my0qiNnMa0=;
        b=XzLZvvLZ844n8Pg8Xj2GVQf5va4fvUQjk1zKOSIZzxyyph2RLCvdxmQHVk0ro3NrpZ
         a81cfSEZI4hDDKc0x15VWAl9HM7ElKcGTa3DtkXHmgZ23VBAA2ZpWQJ8kissS2HjC+gV
         fyQfV8s8bARa6JE68+RWmfAEjAe819SedsHQItRKuhhHaJ4MdWAKBKMw8vWmSyEH1uEx
         S5L93hoBm14ZidS9TqbMleFrayf5nvf6x0iY7wMocgNIbZJiFKJFqwGohr5fbKs7DYmc
         T8jlcjhWKu7pK01vRyxQ8JJOUcCok5tNeE8xiI7bte2ISgG+Ws6QHmlC0FXmSfIrX2l9
         yOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749815; x=1748354615;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDNQp/7VheuD5deGaPQPPQYiQLemybXe7my0qiNnMa0=;
        b=KjbSRfC8e2lYRFC3r+L4AKwVkI+cf1If90lgHwhsvjX6AHwgrkeCOOCkIJTGm80rz+
         5ysIhKh/En98FeyGWX22q+C57taVLlLoYKx6NmZJwVOAEcWGpw7fn0kDVQvJ4c2NdFCt
         fOTZuvmZhf2Prslgb83WYlYJCybv6V6pp+sEG/EMk1pcuu0eXnPQdhIdKLX3KjNzi2vx
         QXDTT/6EFqiVL6LMvCnqiYUslL5XOnWLAaXhOCpDqYlQRKl0Q4HTGhk2yJAoXWyHZDrN
         ik6jP0qi6aTAuoEFg08rkuMFOk3Mnhg1xrBuW66bobBawn84MhDTQLnGc4BULv69lPyQ
         FxCw==
X-Gm-Message-State: AOJu0YwZgr1B5+OZxrkDAINdJqe6n1UxmBmci7YWvKEtfxrO0LS8HhqQ
	zsSY6bfLl7xaBUXPnmvqy7XHoUrynML5b38y5y9O7t1lbmjEBchaVry4ZdRUlbMHZXFbUtK9dDP
	IvIKG
X-Gm-Gg: ASbGnctvSNnxc+xV/p4tjMsOfYzAxDADnDtqxMg+Pw6mwWfqgJxzS5V7gGMffCRVOjd
	DBTGP2gon+9ASssIwgyahd6MzIjljtkOla2es8FP+txwWHiX6MAP9PurS4MCSK33/SGs9aFQ/mi
	NO/gnkZH9obUSD3E6crqXyPGkzoeYG2v+BIYt0c6UwthIJr0d1rGPlRozCygFHh+VXWvBtCDIEy
	NjjvnDpvgl75a7Uv5p9DIOfb4Z2GkCYz7Otw1mF2ZzjX0g3X28UE4RPhKFqjtAQGmSwo2s4i2Qr
	+AU3NVcyq7OMRXCymmhcPVf21RD/A3a/t2QNwwy9cLAFIGdwafqLxGzD0p+mZc3XChF46Fc=
X-Google-Smtp-Source: AGHT+IG6QVFq9uUri2Chmp7X28lUxaYdZejNMUQnnVVFc1D8+adPy5vsEt9XkBfaASB6y/+OBvcq+w==
X-Received: by 2002:a05:600c:5305:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442fda14a10mr57191185e9.4.1747749814279;
        Tue, 20 May 2025 07:03:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ac6sm33303155e9.15.2025.05.20.07.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:03:33 -0700 (PDT)
Message-ID: <02ec76f4-5072-4247-b64b-289c9da7ec5f@linaro.org>
Date: Tue, 20 May 2025 16:03:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Bauer <mail@david-bauer.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505203847.86714-1-mail@david-bauer.net>
 <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
 <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
 <b6d066ea-e47d-4495-bd0b-17ba184275a1@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <b6d066ea-e47d-4495-bd0b-17ba184275a1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 15:58, Krzysztof Kozlowski wrote:
> On 06/05/2025 12:05, David Bauer wrote:
>> Hi Krzysztof,
>>
>> thanks for the review.
>>
>> On 5/6/25 08:21, Krzysztof Kozlowski wrote:
>>> On 05/05/2025 22:38, David Bauer wrote:
>>>> Add device-tree binding for the Semtech SX9512/SX9513 family of touch
>>>> controllers with integrated LED driver.
>>>>
>>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>>
>>> You CC-ed an address, which suggests you do not work on mainline kernel
>>> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
>>> work on mainline or start using mentioned tools, so correct addresses
>>> will be used.
>> I'm a bit unsure what you are referring to - maybe I've set the options
>> for get_maintainer.pl wrong, but i use
>>
>> get_maintainer.pl --nogit --nogit-fallback --norolestats --nol
>>
>> to determine TO recipients and
>>
>> get_maintainer.pl --nogit --nogit-fallback --norolestats --nom
>>
>> for CC destinations.
>>
>> Granted, my tree was a bit out of date but it was from mainline
> 
> Mainline means latest RC or maintainer tree or linux next. v5.0 is not
> mainline anymoer.
> 
>> and after rebase both commands returned consistent results.
>>
>> Hope you can provide me with some guidance there.
> 
> Well, read full reply. It is impossible to get such email address from
> above commands. Such email address does not exist since long time and it
> easy to prove - just git grep for it. No results, so how could it be
> printed by get_maintainers.pl?
> 
> If you disagree then please paste full output of:
> 
> $ git describe
> $ git status
> $ scripts/get_maintainer.pl 0*
> 
> I provided you extensive guideline exactly to avoid further trivial
> discussions about that triviality, so I would really appreciate if you
> followed it.

Huh, I noticed I responded after two weeks so pretty late... Huh,
exactly because of the reason why I asked to use up2date addresses - the
mailbox used in this patchset is not being used/checked/accessed since
long time and kernel since long time has correct address.

Best regards,
Krzysztof

