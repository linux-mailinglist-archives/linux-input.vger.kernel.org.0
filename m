Return-Path: <linux-input+bounces-7280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF6D9994F3
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0707228603D
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 22:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B471E47BE;
	Thu, 10 Oct 2024 22:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTX+HMHh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069C91E1027;
	Thu, 10 Oct 2024 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728598147; cv=none; b=h4oWbqRHb1J4xfpb86+/5xfJPJrnkVou/UhEBKH9toTrWWfMVpH15s5CCmYaorpPlppF6XNNB7A8NxjYf0R0CAz9ChGJhNycH/flLK3abSgyg9BhUYR9Uv14XxztgbmZgXJHG2T8XiiDmkEoFAqRtOrbE+cADA3nlz43e3jBH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728598147; c=relaxed/simple;
	bh=VUlBSWfqgFUu7aGU1pR2gowp/JZI8VAcfhNV6QFmISQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZVOD67/hNmc01mFNwddSTs7f0/CfDsBJsP/9YUQ7QwSOZu9HIn6HYNRD6RCSgHtQe5Q/D3fb/75IpHkBPYjj59jBszh0dTxcgcMqkjd4a4dpu7ixYinBwmlNiNVTffpnNqBtgjdnSA966Aju8qOqVNRaDkNNC0jYH8RK8fePMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTX+HMHh; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-431160cdbd0so8738555e9.1;
        Thu, 10 Oct 2024 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728598144; x=1729202944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=VTX+HMHhUrlq961MAdIlHGPULna5sByia4oupswgXhK0Ec6fkZmjaFvca7yJSHr7zf
         dPJHBJubN7LU0jBfmQ0SpLVELvFa9VsBiNy41WnoW3K5AvP0lLOfr46pByZDhbQctf3u
         l7hrddvFot1hBFeDOK8VCN1OoT3M/NW+1rm2pVQDLlpatlsgUSHMsMLFDMedSsB1ZH5X
         1/worRlV7DsjlAk2GeIArD1yoeHcS8qXp80QPPkCEWOTP8rTadtRs/Q+jqKAjLEuIEzw
         7ttMCi3H4661+rCkaOm0oYrL03whPYtIMo+giL0jfz3H6mS7Ioxf4Gpv7tPMlvH+I3a0
         v9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728598144; x=1729202944;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttbGIV1OtP6Y+L+hzzhjHcgo4Ic64lUH6bhnz6qvucM=;
        b=HkmS7qM8BaIpBCDLWWUa1Ar2uBIyyLIzvsdwIyTvcImw8mU8nfKoU4RiUC0d/7rkCT
         5FDFkE/Usd5ak2oWPwbyB38Yiz1mmlA317/NNm2YgwAolrU1Zonx9EXvQ9K4CbeG47c6
         A/4HBHhGlguUy83NlOIAiC/NJNgRy1EGot/k1PaOJaY+PORXuj57q9ItoMCEnP65BwmB
         d37oWxrfp9sG+UAJaYGFUkZtIKCQjX9d/rm0l7uHFyfWDGDDPOoja7NgsHlW02dpz9oW
         nDUY93wSdRqKD0Gw+g5zjmm4O7Py1irwuSQYDBmXWnjWWv3ql/VGv57/irDnMEUqiAJy
         Y2kg==
X-Forwarded-Encrypted: i=1; AJvYcCVoKgkp0xHtfuWzCiImONn3oXNovg7I27fhRg5LVTYvADWVjNZTD51QflD7hPlDzQNGcsmvB143ueSH4uvT@vger.kernel.org, AJvYcCWQxdWd2Yy2fRMgsTIsBkE/DPmr653nKE70LILMehwHcIzcSIv27bIw/RO3aBZg+HORKJoH9tlk+t6ufw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/t20XvxGwua7ss2+Jt0Ft2y8ORoDHccifSUm9kkyvA4fKUv/
	zmvBrxdz2y1fsGThPffyS4L+I0vL3K7f9HnyqMEXwFnzc5yzM9mb
X-Google-Smtp-Source: AGHT+IHeSJFBVDM1SbcoY464K/ygl3HCvWV7h/IxMrNG/Ut2dgNjnOJVa/rz3Jta9HcTAJ32IG2XeQ==
X-Received: by 2002:adf:cf03:0:b0:37c:c9bc:1be6 with SMTP id ffacd0b85a97d-37d48194896mr3864214f8f.16.1728598144208;
        Thu, 10 Oct 2024 15:09:04 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd3dcsm2451217f8f.42.2024.10.10.15.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:09:03 -0700 (PDT)
Message-ID: <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
Date: Fri, 11 Oct 2024 00:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Language: en-US, de-AT
In-Reply-To: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 00:01, Javier Carrasco wrote:
> On 10/10/2024 23:43, Al Viro wrote:
>> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>>
>>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>>> index 20020cbc0752..bb1c732c8f95 100644
>>> --- a/drivers/input/misc/sparcspkr.c
>>> +++ b/drivers/input/misc/sparcspkr.c
>>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  {
>>>  	struct sparcspkr_state *state;
>>>  	struct bbc_beep_info *info;
>>> -	struct device_node *dp;
>>>  	int err = -ENOMEM;
>>>  
>>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>>  	state->event = bbc_spkr_event;
>>>  	spin_lock_init(&state->lock);
>>>  
>>> -	dp = of_find_node_by_path("/");
>>>  	err = -ENODEV;
>>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>>  	if (!dp)
>>>  		goto out_free;
>>
>> Sigh...  See that
>>         state = kzalloc(sizeof(*state), GFP_KERNEL);
>> 	if (!state)
>> 		goto out_err;
>> above?
>>
>> IOW, this will quietly generate broken code if built with gcc (and refuse to
>> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
>> of a goto), but...
>>
>> __cleanup() can be useful, but it's really *not* safe for blind use; you
>> need to watch out for changed scopes (harmless in case of device_node)
>> and for gotos (broken here).
> 
> Hi Al Viro,
> 
> sorry, but I think I don't get you. First, I don't see sparc64 as a
> supported architecture for clang in the Linux documentation. Maybe the
> documentation is not up-to-date, but I tried to compile with clang and
> it seems to be true that it is not supported. Anyway, that is not the
> issue here.
> 
> Second, I might be missing something about the scopes you are
> mentioning. 'state' gets allocated before the device_node is declared,
> and when the device_node is declared and its initialization fails, it
> should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
> overlooked something here.
> 
> Thank your for your feedback and best regards,
> Javier Carrasco
> 


I think that the issue you are talking about is that the goto will
trigger the cleanup function of the device_node, which will not be
initialized at that point.

Yes, the goto before the device_node declaration hurts, and a return as
you said would be better.

Thanks and best regards,
Javier Carrasco

