Return-Path: <linux-input+bounces-6835-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AB988DEA
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70F3282D7A
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 05:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389A014B087;
	Sat, 28 Sep 2024 05:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ+DM20r"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C07B27442;
	Sat, 28 Sep 2024 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727502341; cv=none; b=tebztYFiIwFxTkkJh/qoV+DUiwr0hfjMrG4UhTnhWyl7yuMSdpR86azRMFeQnPSCrgHETp1NEUzHka2HLF4W0J4oV3V87zm8U4IiVrwUASgfJAb1Us44IuL14m+Lzv2UOZjHrs75QVAYBALf8hr72CS3s2o6zHCoEPLjcavhsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727502341; c=relaxed/simple;
	bh=OMydpLK0PY+Yh18OZc5/cuq9AjTJ/jM8OBP0Hopy1Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooxDNhZFo0ZkF04Qmtyh5R3o14lVkxlpUHd+p8yEv2iHOaMJHk8oKRFeOQdk9QEs9uHkvIeCl56pqUBzeU8wZqr/5us+Bz5dMY6/D8dlX27fTr6Jdsd5T0Y/SPf1Q46oc3BM0zpkNh83YufgQby3DIXukp3Z6iaI1QOyi4/htdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ+DM20r; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso2610124276.1;
        Fri, 27 Sep 2024 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727502338; x=1728107138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4n59r0MQ2lceVoqhaUy5pddzOLHa+DfJWD8ZO0fKyc=;
        b=ZZ+DM20rZZdzG808CSqgNNno67fLdOAOB16J+ZwgX5vBwF6MFac2D+dvs/DaVi4l5s
         AX0w/HPmYOl223xOOQjGGIgd/cVH0pcPxArdb5/bTpntf88klNgea5VOCM7m3mUQibAK
         bCeq5EbeAlYYRRzMrv6gxyEC7BUmrxsuNW5Er6DNSdl8yrVOv6NTkySzPHvgljigDfT+
         Taj01/POMQQz1z3bvcN6pScIuYbTA0fnYVUJDOS1vapAjlxS13QonecPMzSox+a2QjjW
         sLIOFW0Jx17vHhl1HlSJ+mAHEDI5eXj5fFg2aOIeH2EJKGQSKgNKtF1zVpOc9ejGxIm0
         OXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727502338; x=1728107138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4n59r0MQ2lceVoqhaUy5pddzOLHa+DfJWD8ZO0fKyc=;
        b=Jf9P0OatLfME587NhZ0laC3oweTLuUYJkthkztX3SmDVHXaD8fI2VkzTAVYzXjTDlD
         WuwegW3Dc8+pDRfCNJrfF/RAz3HjLwdBqt1jPlc//WwDXXFwXnR4aPHyWVSrjE3sNupe
         YGMXICOPhdOvRR4wIGc/0t6jitaCLW9dIN56SUtxI9gbUDQ/za7LVOmznuwPxrIxCwA5
         xoc5K0YNdFc6r1sNk0cKTOv0tLI4LvZZ0kUK313TMNUQMKaKXt8baTc+udOsItlaO+xm
         npyG+SKXTbAIYUCYmgIymPAQfzHFkCaYPvViGfItUPEVxQZu2SSqrmq8KrfadCGYl1fE
         B5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY2W8E4JB/LWRAebyaTM1FzsMYGJcfVZVjrVdw6AQ5fDEnKNtHCSHnUe7C+fFmvCR+MEm4Qx8H3IqAJynL@vger.kernel.org, AJvYcCWh6jJaugyw+7qAtdnB6EDCtEP+gz4q+cuRcC5nqqF2bYvbzQbTma83mvgEdddiNQEP8j+rdidro9eX@vger.kernel.org, AJvYcCXkFlYKPGoaxl5We0iPivL2Yg8poBNxHldc8q8Jil7qFhSkrnlEy/DIvTqEtcx85Mrm6UGuYXefaOS/DTXact+r/VLp3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZEKa0+ko7IEJMagiPM2vqcGVpxI9iW3cPFeEAIM9815j1p0M
	3D7POBn+DI6gL28v/VDLqsax/y5W3pLBKIb8Qz4A0wTxBGTjOYi646Dcww==
X-Google-Smtp-Source: AGHT+IHdIyudcbZPrMrN50SqMgLgXlXfxqJrLCoxY4NEbKZMEI2AvtFg+xxAKSKoMqFCFcvp7mu8UQ==
X-Received: by 2002:a05:6902:2849:b0:e24:9893:bc5 with SMTP id 3f1490d57ef6-e2604b3bdb5mr4642269276.20.1727502338291;
        Fri, 27 Sep 2024 22:45:38 -0700 (PDT)
Received: from ?IPV6:2604:2d80:4022:0:9007:a741:5566:7d2e? ([2604:2d80:4022:0:9007:a741:5566:7d2e])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e4011e5fsm778643276.25.2024.09.27.22.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 22:45:37 -0700 (PDT)
Message-ID: <a0e00c43-a879-4a4c-a3b4-26c485e0c261@gmail.com>
Date: Sat, 28 Sep 2024 00:45:36 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
Content-Language: en-US
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

A gentle ping to the maintainers/reviewers. I was initially hoping this 
patch would land in 6.11. And it got kind of missed. So I am currently 
hoping it would land in 6.12. But I haven't seen any update in the 
patch. There is no hurry and can wait for 6.13 or future. Just don't 
want the patch to be forgotten/lost/missed. Kindly let me know if any 
further changes are required! I will be happy to fix them.

Thank you,
Joel Selvaraj

On 6/1/24 15:44, Joel Selvaraj via B4 Relay wrote:
> Extend the novatek touchscreen driver to support NT36672A chip which
> is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
> Added devicetree support for the driver and used i2c chip data to handle
> the variation in chip id and wake type. Also added vcc and iovcc
> regulators which are used to power the touchscreen hardware.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
> Changes in v5:
> - Made the chip data a local variable as it is only used during probe.
> - Handle the regulator disable correctly for all exit paths in probe.
> - Link to v4: https://lore.kernel.org/r/20240601-nvt-ts-devicetree-regulator-support-v4-0-e0c0174464c4@gmail.com
> 
> Changes in v4:
> - Use lowercase i2c device id as suggested by Hans de Goede.
> - Disable the regulators after nvt_ts_read_data during probe.
> - Link to v3: https://lore.kernel.org/r/20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com
> 
> Changes in v3:
> - Fix indentation in the binding as suggested by Krzysztof Kozlowski.
> - Picked up Krzysztof Kozlowski's Reviewed-by tag for the binding.
> - Link to v2: https://lore.kernel.org/r/20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com
> 
> Changes in v2:
> - The generic i2c device id is now replaced with the correct IC variant
>    provided by Hans de Goede
> - Updated the bindings to reflect the latest changes and also incorporated
>    the suggestions provided by Krzysztof Kozlowski
> - Link to v1: https://lore.kernel.org/r/20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com
> 
> ---
> Joel Selvaraj (3):
>        Input: novatek-nvt-ts: replace generic i2c device id with specific IC variant
>        dt-bindings: input: document Novatek NVT touchscreen controller
>        Input: novatek-nvt-ts: add support for NT36672A touchscreen
> 
>   .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 ++++++++++++++++++++
>   MAINTAINERS                                        |  1 +
>   drivers/input/touchscreen/novatek-nvt-ts.c         | 67 ++++++++++++++++++++--
>   drivers/platform/x86/x86-android-tablets/other.c   |  2 +-
>   4 files changed, 125 insertions(+), 7 deletions(-)
> ---
> base-commit: 6578aac6a270bd6deb9f9319b991dd430de263dd
> change-id: 20240518-nvt-ts-devicetree-regulator-support-ac9e49b78a16
> 
> Best regards,


