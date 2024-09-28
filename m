Return-Path: <linux-input+bounces-6850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EE989137
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 21:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B161BB23AD9
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 19:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631BA15443B;
	Sat, 28 Sep 2024 19:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxHv9ksx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83321CA80;
	Sat, 28 Sep 2024 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727553033; cv=none; b=no1KTnxYNu6qtc2TjLO1SDC+4ygdt/RK301SQ2HXUo3wQwPmB8HGB8h07LVMhfiKJABa/+jDQLmQgMJmDdGKSk9e9SoKpyH86BmUMJ5/e2mirD+efiYRDzV6e3v6BmotYHYd86bUYhVShk6cf3V17OUB97Rvl7mLvkbp9cpz05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727553033; c=relaxed/simple;
	bh=LQiKpMH/ph7ZUlKx+GoGwWZjBExHGVOCY4oNQxEglf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H73B7SSxlYkOyOG09z6o2a1mg5F+TW3Tbby38Bo7PXg+1s0/FNQIYBhhHu/GCAgvF+DWh/FzOXrb8RxSFYms4XLWU2QD8Nd1fV9EUmDhTvsZnVpdpUTbOuh4msLySlLp9ZFe9VFfrsclcPQ39cIfPPFqg2h4RSQt7KmogzuVnCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxHv9ksx; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6dbbe7e51bbso25754127b3.3;
        Sat, 28 Sep 2024 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727553031; x=1728157831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIHwIoYLONfgdXE36Akj8OIPXg8AMYwd+9WehTb8EVE=;
        b=kxHv9ksx6Ahy77wc7S2ZujSvoTZ0MC4qscbQZV87CG+AcjVLFD3soII0IGCegZwC2f
         N+37rygPwBr16oYqWgVeXNjvHh9cvDbs6jZsASWqNYX2Ce5ad3Z9CvxO2wtjIsgCgyap
         tYJvNFFqwRM/GECzAFv9rfsR8Uscgfii0zwSDOzNbE3TqXfwvVd5IhPiVBP2N7NyPsPF
         wCwnEpV3tPSBLg7sUhe8B2L5KanMZ2z2Caxt9a0MkNk/vm6SAwC2AOhuNK4m6sxmQhyB
         CEMTmp7L0ShxVCm+pV8zvTYovXDPLQRHqmJuVMwh9fKNPtQg3z32/HcZK0m8U7tDJ1WL
         qszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727553031; x=1728157831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIHwIoYLONfgdXE36Akj8OIPXg8AMYwd+9WehTb8EVE=;
        b=h4G49gF8gzQR1dNZuPBLb2efJup1EMBAc2vgv/1VyIZwBozxDn1d6SpH3maeUqWXDa
         wr0US9RYBFC5kDoaiYWjH6UTG3AsRhPPQZo8SpEVHlXM4CxcgKWIOOk/F7xGeFIQnIiQ
         WCZ81oVXLE/akXjOhxS/c2ZZK/h0EMIik4hpCRVtVVvhPSOZl4F710ikihIV0t389/4L
         Vx2zFIerdpYCBujJxbChqC9kBbCH2djXLN936G4Es38FIUqf8SXMe61zdPSxeFhczUxG
         Uz6vHWC6z8lw7u2qKoSqVK5pjF3nSkx1TCDeM6CsklczG7DhYTRZSecyv07fvlNkuGsr
         5MBw==
X-Forwarded-Encrypted: i=1; AJvYcCVnczR0eb1vgkMMXGV/sFZIrTQIgiTIrXMlVj2CwHk84i37noIxIZz4Znc3n02rFtuSvC1+iR4St5oWvMEqRFTkGsVFVg==@vger.kernel.org, AJvYcCWEz+N5MJ2gPtnZbkyh33DYg1dfnbLFWLndkyxsvMH1t7nP0YOTHqWZFvDcAL1SSSkiO1ZxiO9ZQFuCS16I@vger.kernel.org, AJvYcCWoC4B7xXLsVNZJAm7Hlp04U9uRiH4x4xVrdRxoQVFHMgAZFaxpSikSFgUoqir9v3ODSh1J2POi0w7d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu49PFcqSKvCcXT3FqkuCa9/o6C1EEDECsbq5beyIJBUJucWOF
	whyTgEB/YmzGTqtCLGYSkAqMQmq8S8ZX6zhMadPHHk8TbBpD8WWn
X-Google-Smtp-Source: AGHT+IGZe2d8nDDal1LwC8XiKjrlMJJQqMfq0jJhGf1m2tBSSm52enRhK++p0LYFveZJjLXFXogzwA==
X-Received: by 2002:a05:690c:4e02:b0:6dd:b920:6e61 with SMTP id 00721157ae682-6e247603c31mr36070427b3.40.1727553030756;
        Sat, 28 Sep 2024 12:50:30 -0700 (PDT)
Received: from ?IPV6:2604:2d80:4022:0:9007:a741:5566:7d2e? ([2604:2d80:4022:0:9007:a741:5566:7d2e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e245369a20sm7694127b3.85.2024.09.28.12.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 12:50:30 -0700 (PDT)
Message-ID: <11c36b3b-5fc4-45c6-a9d2-3d45d8cca7ee@gmail.com>
Date: Sat, 28 Sep 2024 14:50:28 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
 <a0e00c43-a879-4a4c-a3b4-26c485e0c261@gmail.com>
 <1e43c2e2-4859-4452-a4d3-433aeea1fcef@kernel.org>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <1e43c2e2-4859-4452-a4d3-433aeea1fcef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof Kozlowski,

On 9/28/24 02:49, Krzysztof Kozlowski wrote:
> On 28/09/2024 07:45, Joel Selvaraj wrote:
>> Hi,
>>
>> A gentle ping to the maintainers/reviewers. I was initially hoping this
>> patch would land in 6.11. And it got kind of missed. So I am currently
>> hoping it would land in 6.12. But I haven't seen any update in the
>> patch. There is no hurry and can wait for 6.13 or future. Just don't
>> want the patch to be forgotten/lost/missed. Kindly let me know if any
>> further changes are required! I will be happy to fix them.
> 
> We are still in merge window, so nothing can happen with your patches.
> Pinging during merge window is not welcomed, just unnecessary noise.
> Wait till merge window finishes and then ping, or better resend.

Ah I see. Understood. Sorry for the noise.

> Your patch waited indeed way too long, but if you wanted it to reach
> v6.12, then you should have done something earlier. No one has it in
> their inbox anymore.
> 
> Please resend with accumulated tags, assuming there is no outstanding
> review comments, after the merge window.

Will do. Thanks!
Joel Selvaraj
> 
> Best regards,
> Krzysztof
> 


