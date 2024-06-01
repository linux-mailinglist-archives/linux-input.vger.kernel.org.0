Return-Path: <linux-input+bounces-4001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 508878D70C9
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 17:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0717D1F266D5
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 15:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD6115278C;
	Sat,  1 Jun 2024 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBFgqTZI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D8F1CD3D;
	Sat,  1 Jun 2024 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717254534; cv=none; b=mj/PZoThuv8cABshiZWgJs1GtkJDB235JtvLOth3tQdvqxEKuUXJlWKWby8XkwKchZ1kLE8EUepLsSg1OicUb1ZGj09AzsTwpaFDg0rfHXVsZYQLUIFCf8svXUOBG/eH7Qgss9AT8aRbhWfaLwKvZalTmJ/uJ/WvH9CmZM4Mnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717254534; c=relaxed/simple;
	bh=1oVKVqQgdKTr5SQqEoXNfoaiRhZ43/gYviSPxoYVDCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JacTh2GpTep5Tk2nU9SvqWGw9JLkjfEefPWh4zRJ5RZgdR1wRHUtauZTZ6IVJsxJJJUBPfuGSp+FpCNzjDgahnsI98u7TDZBIOU3DtQnasDqQ4iFnX0zHAGOE73twbGRh2s/14DiYoFAZKD/wvGAEGP+dc+27cUddGUfHBu2jNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBFgqTZI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6af538c750eso108006d6.1;
        Sat, 01 Jun 2024 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717254532; x=1717859332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8x4+MRtwD32I6N1x72QTvMbn3LCLaG3WhWmmoOO4kg=;
        b=GBFgqTZIZQGofTs+Ve2jR6ynhIu51hc7aHbHWbvnZs2n+sSR/uofeFW1u5aJ+AQcT7
         8eMf959kqGo/qGItPLOjZ0wHHyrkt2UQiS1A+Tm+C8E6wnjryyi4fHrr/E3AJG0VkB6q
         ZRBBiVY+Vu8r1vGsm8HtOmXjQgIlNNVkbZWTrUOCCWHZ+3JBJ6nl0HEwnXm080Sp/EtY
         hEc4D/6APWTT5A4W30Vntf3wtizviNPVvx5Kw2dBqD4VDcV+m6Nn1yHIBwXhKLRGmWJe
         8Fb3sYiCXRCZd3cJ174YokTCDxMQqjxnbNJJuFxkA+4ePPXFFufv8TGSj0K/ZJig7FOI
         dhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254532; x=1717859332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8x4+MRtwD32I6N1x72QTvMbn3LCLaG3WhWmmoOO4kg=;
        b=fu3vSOE5FhvEyII1mvy0r+E4EeAdoMHz89qMyOOeyW4tD8hNnUD96oLEKIvbHVvEo9
         +5Zz4djQq49c0E+pUocJJoP62l/edmT1JK1yBzIHW9E3+Qbz+kNaX0gllW5KG6PYk1Kr
         11PXm31xgcYRnDWQMqJ3D8YaGyvndh4xY4+c/7pKpQAW5xdLL+H8MEn3tO+Q6nu8iB/w
         FyT9Pes7g8hcwaeaRUX68+3nQIOo4/vrH4o+OEBmARkKeoBMia+mAdIB8vyS00FoFvEM
         Ax0nB04byg+g1XR1wWToo3etkJk4uUuJqGhwH6mHutqwKP1aLwZTicVqa/WaO3ay1Q7i
         rxPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWslet6s0DIY5N8oq3zzNGKKDmeEJlRNiauGhHwZYJt8p6Nor688q24bh4u9U0PZwTuPf0z6Efz3+/shCycnh5df3XzCMUjxcU6mViqNpIIPP77juZxyl7PiEL6mthHh1HgJAIZkmhrv+WiRBud8u4kWC/iAO3mv/ikzp/AKOwVTwUH9FaQuG6O6tBdPIY=
X-Gm-Message-State: AOJu0YyROA5zv5kb57rGw5ZmghS1um0CRa9iaUVwK/aRG/qROBCxiiS9
	DBI1yoViMrkvMvlDQ2gJqcenLr81CBv73JiL+mRT7pKMxQfmD/qf
X-Google-Smtp-Source: AGHT+IG1T/hp6o7zkkb5+oFcjirqY1NXo+A6couRFfEo2eooW4Dbt+1SecgfOPduKlbcqakOYQFEGg==
X-Received: by 2002:ac8:574e:0:b0:43f:edee:9219 with SMTP id d75a77b69052e-43ff4f79747mr51031171cf.0.1717254526665;
        Sat, 01 Jun 2024 08:08:46 -0700 (PDT)
Received: from [192.168.0.98] ([67.6.32.220])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23a18e3sm19794811cf.10.2024.06.01.08.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 08:08:46 -0700 (PDT)
Message-ID: <f9e26fac-5ab0-4cfb-a721-8290656c11a9@gmail.com>
Date: Sat, 1 Jun 2024 10:08:44 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
 <20240526-nvt-ts-devicetree-regulator-support-v3-3-aa88d10ccd9a@gmail.com>
 <55272a3b-575d-4212-a40b-7245beed5d80@redhat.com>
 <a2f68c56-e6d6-4626-8d05-b5e808da60da@gmail.com>
 <cbc86440-5065-448d-b83c-83602de6651c@redhat.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <cbc86440-5065-448d-b83c-83602de6651c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans de Goede,

On 6/1/24 09:07, Hans de Goede wrote:
> Sounds good.
> 
> It is great to see people working on getting mainline
> kernels to work on phones like the work you are doing here.
> Thank you for doing this work!

Thanks! :)

Regards,
Joel Selvaraj

