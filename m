Return-Path: <linux-input+bounces-9411-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB8A17AEA
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 11:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E104F3A2FFF
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 10:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F40C1E9B19;
	Tue, 21 Jan 2025 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3640H/t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AA1E3DD0
	for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453594; cv=none; b=ANRF68h72amfd8RD2+/rmzh7Fpg2YzRoXqCQjSgUMy6IWxNCviL2gbxADEUpjhovA0ftghJxdyE5hfh1C02jTOXA1wprcHY3P4xTcW0DJxfGju21hETeFPbrBd9tvunMNDKiajrfMcU71X+mm885pTJMJ+0kjRIr1kofX0HHhUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453594; c=relaxed/simple;
	bh=Tq6Kc9ck77Rmeb34qVgNL53GEmmxyuSYDvRcFIJAUXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hW/0vb5ghpH2VqXutresindEDuP660uhKc+n8yG6U9Hz9nQ7NjiWIzSaCqucT5eR+Vw+knVljGEaAVJJrbjb4WE6K5P9kAFuGELikZT94V4KANNoNWVMEjCCsCDYHnZjO7zb2yke9EDF7LFga8s7s++BpTq3nyb8F5TeSasixPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3640H/t; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaedd529ba1so713295966b.1
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737453588; x=1738058388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxizKwXLPt253QGt7e/f/qZ5dmeGax9KtzPaKUOb0x8=;
        b=D3640H/t/iHp1cjK6Q5G7p6qzd9EM1qbpAyHLPiLZZSX+S4Z0waO9YcslgcUvHv8SZ
         yfhDAL5OBc+cbYKL8YkWF243ndHpnWzs6KyQ4lCqFgbk2z3a5NKUDC7YkD/y3DkOhyFH
         9WXvMWEpcLNGfGBeMsEKuCD2kURPmgkdiTnZWonE4WJo/rkgjikQqW/z+4MdPdbw7l5G
         VhZK8Df1XmrqsHRWiLA00Vi+ipSaokhvz5nBcWjPhbO6nyOC7IJFUIb3wQ2FLwzuXecW
         z2iobyx2BslTh3JYQAXRiugGXizKsPgoX+O6OoemYvNItpfdTTDDlVmYNx0Jn0sm06XM
         /NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453588; x=1738058388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxizKwXLPt253QGt7e/f/qZ5dmeGax9KtzPaKUOb0x8=;
        b=u+wB87uGXfF1yh0L+ioH5P8tYk5ZckPHghMuO80EojT48qpMKe71J/OTQWHQ2giaHC
         wZ9roniHONLhj85fbqCGVnGVSVECMFeN91hpuhYkry8/FEa3hYdki1ULcU0l2LEYwwhe
         NQI9E79IBq6hF882HcsjltfLZs6EMykhc/zOnZeFdkMtob2HTqub6wSPECwo6yB8qHqd
         1CmSx8MaHsYbn023MbtEDrW/l+ajYSzboMMojC4kGByo4VWxelq4xZh3jLPOi4Ld9PbQ
         VcWRCKcDRR5dS3tWBaTPnKl+E7VgN3zXhtFFpU4mp9g9WTQyR3xA2gkJyJmHZxoLKAQ6
         bhwg==
X-Forwarded-Encrypted: i=1; AJvYcCWCFvWxDoKdqz/NxqaFFSr+7ZMldRM1AC5Gg+xeUxhhYTUUMlXaPSzUpKipN1BMK3pTUrSbt4DBr1pRNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxfnOAHMBHMHc8xWqd3xhfMxQjlhgxSTZ5Mn0+AGiuTUHnsYF/
	VKD0rPzt27eYrPtZat2ZogbJaJCgmGWs8N/YZI41eNe45RwIf6wQuhC3JUv/ysY=
X-Gm-Gg: ASbGnctUyzdeqrLXIj9N5ONPzjGoa7weVBV47c2UXpk4Qg+VkLkhG6Y4Le3+IdfAKBS
	twDCVLE2TTkrIoB770qn5VFFMN7e299dZJkm45lzD/FDxTQKPQA1RofZnvZ0IWJtS45Nm9PFtZq
	n2IgwOJClqnHnHuNbIVOtY6xTyaVz75OtSI3oEJKvXUQNiZrovh8iz6FklYMLTcZnTIy1rcIXA0
	0lg0HRuwhSEUi1C1Ixw6nHxz/EYsBc7FUDzFkwUFf0QU/C1J3SLHYyNht3KhJ1VioctSPRNyZ5G
	o+NDef8svYGtMFftTKJHN7I93LN8ZKlYY7oWyw==
X-Google-Smtp-Source: AGHT+IEsZoq7t/ZQbOJiUR9gGGlTg3qCaYqmm6ZsPZFmi0d/VLkco5ePkVbSndbh/UYWndkJ91FZ+Q==
X-Received: by 2002:a05:6402:849:b0:5d9:857e:b259 with SMTP id 4fb4d7f45d1cf-5db7db2becemr34207441a12.31.1737453587732;
        Tue, 21 Jan 2025 01:59:47 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:9701:41e3:e368:740f:c4a0? ([2001:a61:137c:9701:41e3:e368:740f:c4a0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d3dcsm722643366b.81.2025.01.21.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:59:47 -0800 (PST)
Message-ID: <a7df5090-ff71-44d9-83e3-442876522c74@suse.com>
Date: Tue, 21 Jan 2025 10:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] HID: pidff: Do not send effect envelope if it's
 empty
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: anssi.hannula@gmail.com, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.01.25 14:12, Tomasz Pakuła wrote:
> Envelope struct is always initialized, but the envelope itself is
> optional as described in USB PID Device class definition 1.0.
> 
> 5.1.1.1 Type Specific Block Offsets
> ...
> 4) Effects that do not use Condition Blocks use 1 Parameter Block and
> an *optional* Envelope Block.
> 
> Sending out "empty" envelope breaks force feedback on some devices with
> games that use SINE effect + offset to emulate constant force effect, as
> well as generally breaking Constant/Periodic effects. One of the affected
> brands is Moza Racing.

[..]
> @@ -261,10 +261,19 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
>   static int pidff_needs_set_envelope(struct ff_envelope *envelope,
>   				    struct ff_envelope *old)
>   {
> -	return envelope->attack_level != old->attack_level ||
> -	       envelope->fade_level != old->fade_level ||
> +	bool needs_new_envelope;
> +	needs_new_envelope = envelope->attack_level  != 0 ||
> +		             envelope->fade_level    != 0 ||
> +		             envelope->attack_length != 0 ||
> +		             envelope->fade_length   != 0;
> +
> +	if (!needs_new_envelope || !old)
> +		return needs_new_envelope;

I am afraid this is the most convoluted piece of boolean algebra I've seen
in a long time. In particular because it mixes things that do not belong together.

	Regards
		Oliver



