Return-Path: <linux-input+bounces-12074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83355AA10C4
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 17:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2C997B520E
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8644B22B5AC;
	Tue, 29 Apr 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dXeBSUws"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1722A7E2
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941377; cv=none; b=PJuLLuEEVceczgniaNIkqnHN/8s2MHLbTD7F2yRvxnKh9LFtdCvl0tD9LLapjJhCh0EXk3lBxLqfSNHagCDMspFADcrKJNO1I3LBtjqCi8A1t7Botq+Gr0mgaERo1bKf52xWp+T0mJxXytFJzwdBHm44zmWmJssGXaJF5aTV4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941377; c=relaxed/simple;
	bh=oh3lGHnfxIaGYpsahYhO0cIoVjRi9G3OXpSZP1EDW0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kToTT/2sZggwE1aTXX60yaxp1kvsgQefvWD/l/23oyEAku4kgac5+Gqbx47yxXBjSjWtofL05q4HWbfp53MFiZIJ3EQDnHRt1xzIyxb05wrQ7OQxft7LXWHQVer3/HU4knVXGbrFHY5+aVNKXJvYbJz5k1QN/yChLk3iadexwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dXeBSUws; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745941373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7ryve8rTEMKbXeLpNAkgCd/B515QSjLpqJy/LG9vjA=;
	b=dXeBSUwsP6XkW3RXW9StHQKtMgBz3YJy9Lmpf3E+xztWR2PfDm5HlBLCyyxiKDLj9i1Sqp
	gafgePJJauj3lGJPD6Ge9AYXll8/YKGx9WHuQa8bzj4vRDNFJca6UmoXM+WrOQOiB44yDz
	uP3Gf2NP1nA2RNTfWqnCvrilrF7odNM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-LQsEDq7tMoq3zNAH2TO30w-1; Tue, 29 Apr 2025 11:42:50 -0400
X-MC-Unique: LQsEDq7tMoq3zNAH2TO30w-1
X-Mimecast-MFC-AGG-ID: LQsEDq7tMoq3zNAH2TO30w_1745941368
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac31adc55e4so503661066b.3
        for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 08:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941368; x=1746546168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7ryve8rTEMKbXeLpNAkgCd/B515QSjLpqJy/LG9vjA=;
        b=lvlkVOFobSBs/1VimGIWVbncFWGQNAKaR+24MLpW7mRSzfT6W1CclTe1Od8qE9O+ZP
         PqAgd6nRSqE44TZTvRZ4m6jI7aSBb+lZAkZoyi9yiTsaexB7fXMPmrkqZ/zRL9KAYsws
         D1kIID800ylKBWpU/rVVIh2jOr3YpTkp6Ubw2qKJAbT91ThNIoOKvt3TIpt4HAjV15EF
         Lmf6epB+DfFg4U2wmryzeWt6mxwmALqu60ekIasLSWuTmGO1VvLwRqKtSJ2IWPd4l8Un
         p47nkqnXqY+UhYCZsDIzNGJQ1IeTf3i7tO7LvWKwWpbkaQT3HWVco1u6/D0vjS6Pr6mC
         La1w==
X-Forwarded-Encrypted: i=1; AJvYcCUbEH/4KIUtohDQiIuor6j/uYs3UvQ2mWbxF2lfrD5OreRvlTCVJe/c7j5GuxNT5ZjZs5zmcRPdzMv0Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6BJNUb6WDCR6qlpZHVkBSW6OmJRe0lN58eAdhcy6zG7zhQIs
	IYIgXnKMYU92VJxTmPMUgveg2/08sW13qsEaY6TlZAx7vD+bbjB/qZVm6OrL0eaAVjzztRMp8ta
	OE43IVQLrRH04Gyihfti8yGG4/kfOn4fZeXYgbjfCBoE7Ih76CWdW4NV9KJry
X-Gm-Gg: ASbGnct6Uvoy7P/McMnAy6EPBJwdm8q90L8f96FtX1X0ToGyc6RAp9SSzeLegXYp1Po
	XxRxnKzPH9bYyawyht87mTVm79tnDNfdrPT1V65UMMOxvyWrlr9Azld3NdlD80RZKj/O5IA5w5n
	L5JQUBtx8kyXA1FajC/gJnzxx4eDIGEE9BehaBHPWNDdbzHjmuVHyyBvyZTthJ4OjJbuBNGnEuk
	Hq1T+klAnRUV6UnZDdAHu1M79vqxOABQDB8DHCmK9uRbwLmDuV9BfG/F4NXgKaVKO39+xjH3UKw
	CCQiWVRT5vFJJ+CEQpghNRhTmvI5Y6v5CM3WqXnNUgHNmaqbsG6WL+PHS7/XKWJTKjDOfDyBiyB
	EVX9blGGFatvOxA34CmSja4pPJzcfl+nKxYTIjJPZ0EP5WxKDRbN8E3Gs+nWttAvm
X-Received: by 2002:a17:907:9706:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-acec6ab33e8mr329705066b.47.1745941368350;
        Tue, 29 Apr 2025 08:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFubXpfW+kmfgKJfs0fMd64miCv7/wDMCUb2jCA1Md4rCnEWoTksuSovTaTvJNXVE8SKU/8Kw==
X-Received: by 2002:a17:907:9706:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-acec6ab33e8mr329702866b.47.1745941367987;
        Tue, 29 Apr 2025 08:42:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed64fc5sm794100366b.129.2025.04.29.08.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:42:47 -0700 (PDT)
Message-ID: <67e9e989-b3e2-4a2c-9332-760b79f4fb15@redhat.com>
Date: Tue, 29 Apr 2025 17:42:46 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
To: Conor Dooley <conor@kernel.org>, Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
 <20250429-effects-subscript-58eb41737816@spud>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250429-effects-subscript-58eb41737816@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Apr-25 17:31, Conor Dooley wrote:
> On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
>> This should be added for boards where there is no pull-up on the reset pin,
>> as the driver will otherwise switch the reset signal to high-impedance to
>> save power, which obviously not safe without pull-up.
>>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> @@ -45,6 +45,10 @@ properties:
>>    reset-gpios:
>>      maxItems: 1
>>  
>> +  goodix,no-reset-pull-up:
>> +    type: boolean
>> +    description: There is no pull-up on reset pin
> 
> I have to wonder, why are these system using the reset property if the
> reset is not usable? Shouldn't the property be omitted?

The reset is usable, but it lacks an external pull-up resistor, so
the driver cannot switch the gpio output on the CPU going to
the touchscreen controller to input to save power as it does by default.

Regards,

Hans




> 
>> +
>>    AVDD28-supply:
>>      description: Analog power supply regulator on AVDD28 pin
>>  
>>
>> -- 
>> 2.49.0
>>


