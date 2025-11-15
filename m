Return-Path: <linux-input+bounces-16121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37773C608CB
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 17:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1720C4E1836
	for <lists+linux-input@lfdr.de>; Sat, 15 Nov 2025 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0074B40855;
	Sat, 15 Nov 2025 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSLAgFGv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C752FE56B
	for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763224859; cv=none; b=HV4GkHjMVRK/W6TQ/SkwuK9Y01N+0tWgp/wbB3ElztjRne8nXQsltc3Q+Nqvmg32knaBDUojZVRaWKmNlkw7iByUwj8E9WT1Je3FrBdrzM9t5wArKU7zMU/evfRF8XzFTAbu6LWaZ0TCW1BsJaiAH1Z2PBzkw90TOQE1wDkgjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763224859; c=relaxed/simple;
	bh=Mg6pytyLgu+q3qEP1ITgoVOovDv/N/RDqspqOIzRu1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+jZe2AurYnvbB+Mh2yFQpfukoldDyUQSvJk+vVI0fPTeDB6Cc9pmQTUyWzibyHdgNdUfOghbAzsX+COQF6UkOSbI4nPkrBia2/2UJ6grG+lS8DH8ns45zIP8Z6CzxtRrANqHrAgq/5N8Eqnmd2LY5ECCMeW0ggW2I7LMr6xYAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSLAgFGv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b32a5494dso1747202f8f.2
        for <linux-input@vger.kernel.org>; Sat, 15 Nov 2025 08:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763224856; x=1763829656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DS9aPj0ndAVmAPHONVC0xtBXZ0rE17V/GydzsinKmr4=;
        b=KSLAgFGvTBDqfTtwDlLCO7dC8CKqVgQan7VAfn8ewovW/7JqLYiVZUaLiTAs32Mwh1
         z22OZSTmvFZV9xC6De7Zhv+3HLnvn+iRVaiJ8TjI0hJQ0GGunO2/yybXRQTY04pCWOZi
         G5Sn9CbWMyBZxx9nF3v6mpAWcRMUd83tufvkuQRm6GNgjRl35ya15WmTJNYmkiw3v+py
         F/fEDCGUfxgGj4KyIVJHAsxox6aYN5JOUfxq4jCgNzMjn4wv1tIGoqTIDBP41U0yDPvV
         APUZuMJWKO7VojN8iqAP3TfOjuNPM646xv/7rNuRNKLUm0E1YZ2UANgwqAqOQ8i9hsc7
         2t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763224856; x=1763829656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DS9aPj0ndAVmAPHONVC0xtBXZ0rE17V/GydzsinKmr4=;
        b=ZT67KAhE4ddI0Ev8zK5BF0ZHPq5462PQvjw9JceqObv/ZqjvCj8byd2TuxfEcJyJUG
         t3GYTzpjBOrhjMxf08xr2EwAxJILiPakaK+nbfZneAXhEZgjw3nf8w7cuoP+dFb2rVFT
         /i5xgnhkoF23VuY/9bfOUowVYf6Jnggs+Ogq3UTz0Vbdx0feyFxFrZY6JNevU7d0vr11
         v8E14JK4REy+pWxrug7G3LMQS4shtSwQT0Pkd4IHxHTBtrmGPRg7EAEHk3Ll6Bh9q+mz
         H3dFZcCEfaQvZWRo9HJ78EXkp8MbI83Xw/zywXVp5c+khPqy4Jh6JZ16MIqP0ipn6MMB
         ZqZQ==
X-Gm-Message-State: AOJu0Yw6L4PHeXBIG/ABXFmHIUDzDChSSWwJC++83TVRyc/4QnhZIPNm
	jVJAJiILWyeHi3f+Lxs8zyeEmqOk1WuQ5PnIeGIdLZ1oaCBRciKEreHO
X-Gm-Gg: ASbGncuUqwQYWzu8uuqw1/ACsgOVIcaks/mafn3jqZrgb5D7E/xpkLqJE98XkkyrX8/
	/cxMqS4v2dsRFWAi4cRWFLkpCftRZ4epQUX+ZCfuCmKS6VfVY8U+uiTm+sjMm/3Y/UEtfhm0wv6
	9ovBYDjvLqpDq5DmSlSEMmCjFIq2wZIWctI9NmYLWKa2Odsc8XEd9WZuUty8EAbnOCk4IiG6t2/
	GmbV+hEbEZDOe4K+9sbDC5g0bx8kjsRWMDMz+8t/NrZqCg3M7R22cqX710bTqrd4HDhAbpccAsp
	APkteZZoGUTDwCA/fwcS0Xl1n/GasjQ8uyc3PvunxaMNP4Gy2Vc6erK198aaW+Dp3JhxnZp87Ma
	jszqcF7okwHxMOu+8QbZzJ+CJwgccAExwlqaKc38lW36poKrS2q9p9VrtIhX17ktVp3p0x78u2i
	XEEobHU2yM3KZpr6dzPE3w
X-Google-Smtp-Source: AGHT+IFoyI7HV1MxgNk1GpFW4X8a2ASsqmj4ET/ev/Sci4R+8AlnKAc1iwsaMv3WEDRtNCkZhlFgUQ==
X-Received: by 2002:a05:6000:2509:b0:429:c774:dbfc with SMTP id ffacd0b85a97d-42b59324a17mr6718322f8f.12.1763224856281;
        Sat, 15 Nov 2025 08:40:56 -0800 (PST)
Received: from [192.168.1.12] ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206e2sm16769849f8f.41.2025.11.15.08.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Nov 2025 08:40:55 -0800 (PST)
Message-ID: <7625e716-c36c-4467-b318-b7b4a421a1a4@gmail.com>
Date: Sat, 15 Nov 2025 18:40:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: memory leak in dualshock4_get_calibration_data
To: Max Staudt <max@enpas.org>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251115022323.1395726-1-eslam.medhat1993@gmail.com>
 <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <3aca217a-4cf3-4793-855a-39ed99eb81d2@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/15/25 15:22, Max Staudt wrote:
> Thank you Eslam for catching this!
>
> That mistake was mine, and your fix looks good to me.
>
>
> Reviewed-by: Max Staudt <max@enpas.org>
>
>
>
> I think your patch may be a candidate for the -stable tree:
>
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst 
>
>
sure, will submit a backport there too.
>
>
> Thank you for your help :)
No thank you :)
>
> Max
>
>

