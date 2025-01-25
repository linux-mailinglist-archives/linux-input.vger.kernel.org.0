Return-Path: <linux-input+bounces-9534-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DCAA1C510
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 20:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23204167736
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 19:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC1784D2B;
	Sat, 25 Jan 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SysfePrV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B22CA4E;
	Sat, 25 Jan 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737834647; cv=none; b=CZ5D+8F/k1k4GhyI3T43pITFRykOIggPnRLvbB1x4YwbK0h82sUt67vkF3P0u2w0+20iJR+67plJx8SXnMjxQDhpSGpZoZ41m/C4dHVQzl2o/RP2ONy6U6fQZqYzz6BE3QtEqHeD+OucAVfYQ3FBLy7Dyoe6rNJ43mHzpGadrxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737834647; c=relaxed/simple;
	bh=2DV7ipFVJAo5BwfOATxbRlHsWZ4EgVzuQ40Dqp98Mzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paoZQNSJUfhB9ehjCSw1sw0Bm43fYIC4cardhMcRKLdMGsIi4fRlrWRySsaiAXRtD92JJP+8/bdsc79I4S71jjKhgUB602FvHbwfpSgI3x/fvel2m0IxdeVUdfIMLX2gS2fi29+eyPYb9JHn6q8UDMOS4M7dkwQBMNjoqdhPaPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SysfePrV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so3537214e87.0;
        Sat, 25 Jan 2025 11:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737834644; x=1738439444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DfQNAVQ5X6FOvaxOt/5yahgNhF+LUKk1iq8QFLj4eg=;
        b=SysfePrVew2OQvN+XZmAAS4Hbzt46v3I29rIKRMnpYQsNuD2Rm8AAFMHBEzJQJv0PU
         rUzdx+49XIhaDwlKpALVhvXYG7j53UfeBinaWC1ufm5zAiQeVncO7OfqvHyyaso4ghML
         kzzMO5X04E6rW5OQVodK3xL4pL2AoQTUJo0km2TeaOR/ivKMO9AyitN5/hS1+NwzHteJ
         /V/nO+YYEm3EBvWQeoEbHP56Q5UwcAW5BpLiPFu0x7JRXLoHheTwcbuajgHRE82kXbXC
         RHrUUxtkcnCBcuaoSo2INKj73kxFsHrUKPY2LNCcIVYmQXGWFEBz/zaY/eES5mdA/5vv
         eFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737834644; x=1738439444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DfQNAVQ5X6FOvaxOt/5yahgNhF+LUKk1iq8QFLj4eg=;
        b=Iw4nh0/FRFVnKb7Uw52zd6z3HOkzTNXa2YvYmwuVqiGon9QXjuaeQ9+S05fHddNWf9
         2WLBNdYzHC8VeM49PwjigqVWwUvJDWi1K4p1xsyc55ZIyFsHMBWUao+9TUUQX9Roo32d
         nk1EE6Ysu2V9Jcu1kIlKR2n14WwjZ8vLwdw8n5DoEw3oS+id/y3x5Xz9Vs/Egit7ZimX
         PMaQDPaE+FtpO88pF2aD88v+93wpxyrGDiLFyqW88dPquof/avCJAUbMd4PEZIYeedfm
         l4ceZQHsRqhmWV7yCTrYPt97AY78DjhobdoSynsTXCp0vkYUYaDMQmEN3SQX03AqG7rK
         M4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWGM4t26dG8v9J2xhlEwePhWsptn7tMnu9SfP+BhAvyCn6lZ0xGe4LUj9wnzPoz+H/jiJe1inNqQSbbdQ==@vger.kernel.org, AJvYcCX5oPMTRFXYym9791fSZRtCNUXJ2tSUSf563GZSpgkU7s+btTVLPZV8NNkLvKK/O3XgiXWk0lf444OX@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ20w6Hv3A9QEhhryyyOxPiRID1THG8b+w5cwRRHfYABsgp0Hs
	KT+Arw83DLYAgvh0K1NqOyjPDAAro1znsfRSsS7FfQjifKEp999d
X-Gm-Gg: ASbGncu+cBzaqnv6iGb6+DxNMpMxLQZMMv73Akn8kWf6G12DPY+7+hdVpRJ7TIbH2n+
	B61xTAZZ3JGtTgXb9dEW42Y+Ff1mEuhvgp+tj8aRsz0cKoWKVWIin+gLiqKjS+qjTW4MudLytkf
	/mZM8jAPJgvxnTPg3chmj426CvbSsh3ljF9icKDg5ubR/DbdiC7YNTo4Vg0IRwwDX00JCrT3Gr8
	zqVt9BZqT/S8K+YQhHAnzY51tUhHbQJBkJi/tjjvIHbZZqnezwCynsDrlbbYrJp0k+0CSWvtBN8
	x4DYb8EmD0AZU4xlPYHnm6PJK8ba9QollhldlzWmCpjarWjSRfGVMdd2cbMWXA==
X-Google-Smtp-Source: AGHT+IG/E8nVj91llQFn1ibAdGcid+blAFUMchJrcWClwZNd8qI+FhyRoTSemn+Ciw51ticial9fQA==
X-Received: by 2002:a05:6512:1154:b0:540:17ac:b379 with SMTP id 2adb3069b0e04-5439c241580mr10035927e87.25.1737834643524;
        Sat, 25 Jan 2025 11:50:43 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:46a2:e803:3ce0:a304:e347:ed8e? ([2a00:1fa0:46a2:e803:3ce0:a304:e347:ed8e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822728asm706749e87.27.2025.01.25.11.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 11:50:42 -0800 (PST)
Message-ID: <7e44473b-4390-4dd1-9beb-386a2648f36f@gmail.com>
Date: Sat, 25 Jan 2025 22:50:39 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/17] MAINTAINERS: Add entry for hid-universal-pidff
 driver
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: anssi.hannula@gmail.com, oleg@makarenk.ooo, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
 <20250125125439.1428460-12-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250125125439.1428460-12-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/25/25 3:54 PM, Tomasz Pakuła wrote:

> Add the MAINTAINERS entries for the driver
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0fa7c5728f1e..c416ba133ea5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10209,6 +10209,13 @@ F:	drivers/hid/hid-sensor-*
>  F:	drivers/iio/*/hid-*
>  F:	include/linux/hid-sensor-*
>  
> +HID UNIVERSAL PIDFF DRIVER
> +M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +B:      https://github.com/Lawstorant/linux/issues

   This one should be indented with a tab like the others, no?

> +F:	drivers/hid/hid-universal-pidff.c
> +
>  HID VRC-2 CAR CONTROLLER DRIVER
>  M:	Marcus Folkesson <marcus.folkesson@gmail.com>
>  L:	linux-input@vger.kernel.org

MBR, Sergey


