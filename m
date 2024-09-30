Return-Path: <linux-input+bounces-6914-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233298AD99
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 21:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02D6C1F23D97
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 19:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845981A00DF;
	Mon, 30 Sep 2024 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhmAgtfI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2519EED2;
	Mon, 30 Sep 2024 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727726191; cv=none; b=mC2RUZvGgu6iOjq3Zw4FH3EgJgAXglPAdzS7zqYSPUgS0xrq8G8XoeOyatYMYKN1Tb0OHUcGSo1mPoSEDQptXBzGyC4Y5q6agY6jqLcewxuhy9iljtsXKB1p31yXR4mwDjstC3qi1U74KF56KEkCLdnLZNkzNs2J1N2hPzWleig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727726191; c=relaxed/simple;
	bh=S+V+OBOcA+Ocp/UKO/XRDY6wnJc+UCBAVKW8X85LQIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWC2R5kswN3id8jbzIJ2LLgbbBNQUH31DFVktM1ZtcCGdj73kg7ZqjTTHdh0SCf3Hj+XXrNxdCUjmBL2NKT+xTOe/AQVFXl5Wa3DMGZzXEcjnsUPmnxbzU1kKkgRfz5jOqREhHYQeiN7QnAjcATykCD2pM9z1hSfXqokrWLH1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhmAgtfI; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a0cc384a85so26963615ab.1;
        Mon, 30 Sep 2024 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727726189; x=1728330989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+V+OBOcA+Ocp/UKO/XRDY6wnJc+UCBAVKW8X85LQIQ=;
        b=lhmAgtfIrHv4YODFCYM3Uf0u9YVtsTIHz9pmnfO0B04dpq/V5l/2YH2FQMLvt7bdFK
         8xx3p8G8cYnGaKPe+wtwqcdb8+HISr8IdBKOsPUDsYs9fdQ9cjyAWFHKJ4HC8Obx7rN0
         YKeqkwvV9KbjXjN2kJNnGjPTRa+BFAB4RUh3JVmIuBG84n20HVnloYB6MzbSDgxxDXC7
         /yz3FH35f2uBpSYQu0jfUs3RDQOh9Ka+XxmPGRDkkQWRE8qn3tlj4P/V88yS7v+nqbJ/
         St4uVp44nteFU2WsbPon2F2nJ6wUvNnn5bNs0015+YZyAkU2m0gFBliFt0ig19BhLI4I
         lbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727726189; x=1728330989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+V+OBOcA+Ocp/UKO/XRDY6wnJc+UCBAVKW8X85LQIQ=;
        b=OAB49FbJi19PjSYII54jhMeDHVnrOF6jqTGBHljeLrawMOu+/VDOIrVBysZj/OowhS
         Bbrr+r/WnJatKRScoMZM5uOjdbxPQnIUKijhGDB39WOjVllnMaeLDyt7ZEfQk0ujLJRv
         sjV6LowIe0Y6aBoW0PIpDZKNl/LVXh75VG0dz97xiydLyiM4y9kbu/ckPPcR2sGS6Lod
         58YoQWOEJxGmZ4mbtlD820bBumVQ/uXBoqrytZ2i9S3bnuZXWMr/J3A1AbZt2G3W69Pm
         y3/3SR23DqamrVTp+/kCCTRV1p988CvxRuiFVBdzH/4r16wI3tM/5L9VkZpAz9i2Q42p
         8SEA==
X-Forwarded-Encrypted: i=1; AJvYcCVk0rSATzL9ArUS3s93355PTupsDq4qz5mfO4qLcgdby+T9DeW1r5JceBqd9n9RikECZJEE3K+p+IEu0eZf@vger.kernel.org, AJvYcCWNduUu7ES7Tf0C0uc+S/LVreqdYilp9f8STVKaUFRqA/92PMthGXQbDw1AzuPWALuRyaulzyjdX+Vuqn4=@vger.kernel.org, AJvYcCXCkU8L3VOREHcUDAVLlShhIc0d6J5gVc/gD6y5qu5fjmdWH97UFIMg2dBYhq8vn9z4j2lH+rDH46ScSFdDRxvpCL6rWA==@vger.kernel.org, AJvYcCXcKZOZKsczLkylwBMrqpmilJIj7cuSyBIFLA9jzQngv9BJ9lrXkxKRLqvPpM3L5eJUhwce4AwZSwBv@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgb6A8dpH4RDEFMl1MEfXoR3vNCZ8aGZGGGxwpvDSxRnZ7fHE
	6cqilunI0DEKLSnNEyiDZpeXZZC5146LG4KDZhdGAJ/P4U9kCsyOgfgvnw==
X-Google-Smtp-Source: AGHT+IEzSONXXrb3PGiIzzX2U9aQs/CKtUiQ0dhYmSLNMEw/a/yOAHWt3RMmcnpPrZO4BaZZAowEuA==
X-Received: by 2002:a92:c26d:0:b0:3a3:4122:b56e with SMTP id e9e14a558f8ab-3a3452cc167mr114109975ab.26.1727726189025;
        Mon, 30 Sep 2024 12:56:29 -0700 (PDT)
Received: from ?IPV6:2604:2d80:4022:0:9007:a741:5566:7d2e? ([2604:2d80:4022:0:9007:a741:5566:7d2e])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344de1d5fsm26604385ab.62.2024.09.30.12.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 12:56:28 -0700 (PDT)
Message-ID: <96f90547-933d-48fb-90ea-903aea02360d@gmail.com>
Date: Mon, 30 Sep 2024 14:56:27 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
 <ZvoJjCY5kXfenXgE@google.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <ZvoJjCY5kXfenXgE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Applied the series, it will go in the next merge window. Sorry for the
> delay.

Nice to know. thank you!
- Joel Selvaraj

