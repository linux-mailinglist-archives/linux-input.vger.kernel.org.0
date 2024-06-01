Return-Path: <linux-input+bounces-4000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2BF8D7062
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 16:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AEA1B22340
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2024 14:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E828715218C;
	Sat,  1 Jun 2024 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DBAXU9ZF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2514F9D4
	for <linux-input@vger.kernel.org>; Sat,  1 Jun 2024 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717250829; cv=none; b=qiyHGq3cl87qLr2s76SjO0n1Y62t/BE2384pwyQMmUwcgcKT6mz0nGWys2heU6n/VT0FrVfBHfs4k/T0Ic9uRcpyCKFeha54ewQ+Xb6+SwMh9U0/K8NtpVLtPkzTUzYaiiy+iI7/Q3SJQoHYtDtsa5ztNUby1xFN10hsdu3l/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717250829; c=relaxed/simple;
	bh=ikkENPlE2slpeWboaluDXajcTZxGD7or68aJOfcGkEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmJahC6B3kkO723QPtRdm1qqpgSCXNCh3lTqkV3x2XucRax4U2LIQXYxdCjIOezOKidHK26MgNAhVY0mBeJRBozC/D5No9NUSSRq9I10IzYbKQN9xmL4lNknVsDYHq4fUCT51+Rb0SD2POdphGBireEvkb3QXwbh7O3dBN5b7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DBAXU9ZF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717250826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdunc1MOwifq0Pj2t9CMUd8sizubraQCUNmNNEjHAsA=;
	b=DBAXU9ZFa0bXt1DYc2kSJwYKp2OBI184RMgc8nfFbVJQPa94rYNKjeyQy9+teqIYR7VBw4
	rTJWg0PwBeq75a28ipaUzySuO1Y2EUNK4NppEyo6DbXjg6aS1Ws1adWw2ZEkpbupuDJoFX
	r+BINZhe12gFkFgOD6JV7kdk6gEk1VA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-ObI4KTCJNh2Wm2MCIXED-Q-1; Sat, 01 Jun 2024 10:07:05 -0400
X-MC-Unique: ObI4KTCJNh2Wm2MCIXED-Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a66007bb7b2so114165466b.3
        for <linux-input@vger.kernel.org>; Sat, 01 Jun 2024 07:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717250824; x=1717855624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdunc1MOwifq0Pj2t9CMUd8sizubraQCUNmNNEjHAsA=;
        b=SIfDrFe7AO5gB2dIAl+7Lrups7R7As/YBaoc2Gfw8CZ0nlumtxNsNAWQwigWwtQAEa
         fh9BhwlNJrghn65o4xz+JL6ujwG4PkslXA6DeLd275/GoTxjZfykeqr2kU0xPogLvcT4
         vd/30C/pJzPrUTYjT7q+eHSotgAGjDli46j9hZmzZfny+tuNWVYXSQb43PtkC+z+rfYs
         jTpiilj4enz3it5lU+vmnXQmIpVE49rCNAhIIwGpTTCTsKNZVkALu94JJfKzpHi+3YhY
         NX15XmpHh7UB6MAGetAO93P2ykAkucmvySM5Kz18FY86lnVi28bHj688arSf65m/FiID
         DZBQ==
X-Gm-Message-State: AOJu0Yx62uS2MBRKoaScgC9ym0o/f4ee8Ign7eFou1tEgLXSiCc+1Vyx
	LyKaD1y3OR9VaGqAmr8HnxSCWVROYA1sK6xPdCD86ta2P/hRLI/aN36jSOlFMk7+v7De7IxGF8+
	67vBujOcDPlW+3dR8NcoXGs1yUwbCCrO1B75JqQa75sgg793AewaCqBbxp0+9
X-Received: by 2002:a17:906:7717:b0:a66:c041:e5fc with SMTP id a640c23a62f3a-a681fe4e225mr333041066b.5.1717250824041;
        Sat, 01 Jun 2024 07:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnukBzFfefT9QR5IBCC8a8HuaV7SiThNcod633slL2ixYxhj+mh/gMufDwzD04FZFjX9cAfg==
X-Received: by 2002:a17:906:7717:b0:a66:c041:e5fc with SMTP id a640c23a62f3a-a681fe4e225mr333039866b.5.1717250823477;
        Sat, 01 Jun 2024 07:07:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6861da5e24sm171765866b.136.2024.06.01.07.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 07:07:02 -0700 (PDT)
Message-ID: <cbc86440-5065-448d-b83c-83602de6651c@redhat.com>
Date: Sat, 1 Jun 2024 16:07:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
To: Joel Selvaraj <joelselvaraj.oss@gmail.com>,
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a2f68c56-e6d6-4626-8d05-b5e808da60da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/1/24 2:10 AM, Joel Selvaraj wrote:
> Hi Hans de Goede,
> 
> On 5/27/24 03:42, Hans de Goede wrote:
>> Hi Joel,
>>
>> On 5/27/24 5:26 AM, Joel Selvaraj via B4 Relay wrote:
>>> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
>>>
>>> ---
>>>   drivers/input/touchscreen/novatek-nvt-ts.c | 78 +++++++++++++++++++++++++++---
>>>   1 file changed, 72 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
>>> index 224fd112b25a9..7a82a1b09f9d5 100644
>>> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
>>> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
>>> @@ -139,9 +143,23 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
>>>       return IRQ_HANDLED;
>>>   }
>>>   +static void nvt_ts_disable_regulators(void *_data)
>>> +{
>>> +    struct nvt_ts_data *data = _data;
>>> +
>>> +    regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
>>> +}
>>> +
>>>   static int nvt_ts_start(struct input_dev *dev)
>>>   {
>>>       struct nvt_ts_data *data = input_get_drvdata(dev);
>>> +    int error;
>>> +
>>> +    error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
>>> +    if (error) {
>>> +        dev_err(&data->client->dev, "failed to enable regulators\n");
>>> +        return error;
>>> +    }
>>>   
>>
>> This is weird, you already enable the regulators in probe() and
>> those get disabled again on remove() by the devm action you add.
>>
>> So there is no need to enable / disable the regulators on start/stop .
>>
>> If you want the regulators to only be enabled when the touchscreen
>> is on then you should disable the regulators again in probe()
>> after the nvt_ts_read_data() call there (and drop the devm action).
> 
> Yes, I want the regulators to be enabled only when the touchscreen is on/active. I will disable the regulators in probe and remove the devm action in v4.

Sounds good.

It is great to see people working on getting mainline
kernels to work on phones like the work you are doing here.
Thank you for doing this work!

Regards,

Hans






