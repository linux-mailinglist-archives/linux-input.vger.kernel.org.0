Return-Path: <linux-input+bounces-17085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A790D1D473
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 929463062D7C
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDAD37F75A;
	Wed, 14 Jan 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbSIBPTk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6809318EE4
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380578; cv=none; b=LXD3sgfRf9DflRTPHq95a/W+nqUUKOFnWSMJdVG111LtqM9wXtmak0aPmdicpCYDYH71c+FpD97zfW4Yh7qrlcVavKDbFuAIF/yZOvKvFxw7CALMXrvcsiJKRog80ruEJCT6nWFBwqjoh4a4O1auzFh93VVRkp1gzICcqJy5TQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380578; c=relaxed/simple;
	bh=O7wjKPLRscfU0YwsaALqm/qytv2SqY41h87ZOCdgmFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JXrXysDY8FjMkl6hGELiGsqy8qySYhGeoLuWLZYhr1tazk06qqnDidXTVa3q1OAHRtZjkIhwSG2ydEF79S17hAUhcgjJP6ZP9fSHQ2iBDR/VTRjfHOvvmcsGY4cGQCcB+xdiiS1Ov16psQ4Da3vCsdrrygZgCUzyRz2a5kqShHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbSIBPTk; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5014b671367so4642191cf.3
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768380574; x=1768985374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DHzo5vnBquKF32S2JW9TXfWUEIvitY0LZE/EnC1pjcU=;
        b=GbSIBPTkAsY0EDmoKASTxjzf7y+p6KmQZsgFRhaR6t6G8zPoxuPj2ORx3/+U7rXhGh
         sl6HluAZvfxtVX62Seqc12GXa+T8YdlNTnm6D9lLOyvtcQz3arErKEuHHbhHgPTbRJGO
         vnmkt3Po2lRn9Y8HTY8S6VE2aJnl8eXR7OSQUkHUdw6uTUo5s0IZUYXf3OlgXj0/9Jw6
         Y1rCfbhYZAW6xpcxKGDwJbf25VxA4ePurIm0CnhQgi9zyLIgJc5pSh7YrXh9cTtQS224
         8R1wgMb+UIEveVcM2fLxiXsLD7m8hSOvH7nqB27Ydxixji0IRExtL2cKwVSVpdvWfmJ1
         NCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380574; x=1768985374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHzo5vnBquKF32S2JW9TXfWUEIvitY0LZE/EnC1pjcU=;
        b=B3bCic2RxxApGgH3vRYBimO1kC0YvgAPbf5KEUNimsca1QxQXrBf6zWqmKJpnBZEkA
         uEtU56uO3/Y99rlhphTimxBag1W6UuiiaMa9JD7PZW9Q1TguoAImFsQkuxwXmGzJ1ld7
         h3V7f93uBcx5RZKyK+b8soSXcsXWjMJw2TN8DZBG61msJ8yDB7orn6dqHf4YUQeN+QDe
         v1riUtazf7ilSffB3rxwFd791nTIw6vDB9ESKzUab3uCTOleFvQ6SxEJyU1fm9UgtV9N
         YK3H1MESSn2wd3cV3sBvMGkkaz13gn1D5Vam5f2z17SMLL1fa7OOjZVujTy/lK3EUWgt
         O2eA==
X-Forwarded-Encrypted: i=1; AJvYcCUVllAhJzrkBI7GYHXtIjl+ogDIXiKnEUUgS31W/K5Pu8kpRG7OCHRw2tqHrwBR4XhOgdgA0vDgqwlIqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIijK6RME3Ppdf03CobeTtxO/S9QZf7CgAlGkIr+q4ZUT9ZC1k
	8NaDQYV21UqeyBHzpGa1saQUg42oxbdq8RZGXBGt82VXdN3YejVTFMmroeenwA==
X-Gm-Gg: AY/fxX5MJyLxUiQ9AkT8tNl8ckSf7asuxqnADzMI0fPhu8O/3KuDv0RJqU+7hmcPuf9
	b5LzsbpsA6QjGMWK4IycQw57EtT390qy81vY/CNORRMgo7Uo5VL2hxWziH0mDute+xl7l0gP1yB
	HmzrlR+G5P6awmVOsKDtjnH7L7JzrLLaaOxDG79qUpu5CuPRrnfoJ8GLGKL8UhUlNE3rEzIY1um
	p5JJUpHfr1xh9sdHRmaKX0YEhudifpVmtQ5WMVbPdNgjfuYRUshxLcykKjCvnJfBGeSt+6IXZQ8
	/a4lld/yAqScX7sC7HlzW12Mb0sTo98hgSsxVot74jKJ70SIfuuX8q8RwonKt8F2RTMFeRBQbR5
	sbgJVuX9Z5313r4jkHbdn44tgOeSNFdusjvi9zP6pdK+LgzFv9HmHGpuu5Ip7T+Ng2y8l5KKjpE
	ckIylXmNdtDCcOAnZuU24+/xXRCtewyJjBMgpyalD1oJmgsEkS
X-Received: by 2002:a05:622a:a8c:b0:501:49f9:7478 with SMTP id d75a77b69052e-50149f977dfmr10002871cf.72.1768380573946;
        Wed, 14 Jan 2026 00:49:33 -0800 (PST)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm175457696d6.8.2026.01.14.00.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:49:33 -0800 (PST)
Message-ID: <f846343a-49ac-443f-bef3-04e3e08ee20c@gmail.com>
Date: Wed, 14 Jan 2026 04:49:32 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: byd: use %*ph for Z packet dump
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>
References: <20251202033120.2264474-1-vivek.balachandhar@gmail.com>
 <aWdHsalXcjFKmDDK@black.igk.intel.com>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aWdHsalXcjFKmDDK@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Andy — good point. Packet length is fixed here, so |%4ph| is 
better. I’ll follow this pattern in future patches (and can send a small 
follow-up to adjust this one if desired).


Best, Vivek

On 2026-01-14 3:37 a.m., Andy Shevchenko wrote:
> On Tue, Dec 02, 2025 at 03:31:20AM +0000, Vivek BalachandharTN wrote:
>> Replace the hand-rolled %02x formatting of the Z packet warning in the
>> BYD driver with the %*ph format specifier. %*ph is the preferred helper
>> for printing a buffer in hexadecimal and makes the logging clearer and
>> more consistent.
> You probably took one of the oldest examples of such a conversion done in
> the input subsystem.
>
>> +			     "Unrecognized Z: pkt = %*ph\n",
>> +			     4, psmouse->packet);
> The (not-so-critical) problem here is the stack consumption and additional work
> for the printf() to parse '*'. To optimise that, static field widths may be
> embedded in the format strings
>
> 			     "Unrecognized Z: pkt = %4ph\n",
> 			     psmouse->packet);
>

