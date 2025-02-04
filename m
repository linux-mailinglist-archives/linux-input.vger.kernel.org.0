Return-Path: <linux-input+bounces-9762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC09A27CBD
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 21:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 772811886768
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 20:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD85621A446;
	Tue,  4 Feb 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmdQstuR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71B219A80;
	Tue,  4 Feb 2025 20:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700662; cv=none; b=YviJBdOGYukaeMQ65ax8tyJBlOyYmk9LGypoUKnwzvQmdoz2lirsX7fRAzxgptLSI+dy1vbbBrFtH3No1QRbfgfbTUKlayKflr1j91AtJH5Dm+jxaq5+CSWt5l5EtnOYac+S/QqiQwQuCqkoaOnK4kpKv0+TVTmQvMMJC62il54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700662; c=relaxed/simple;
	bh=NgystBFVek4rgDALMPoy4tnJt9RIepRqklwo877v7FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZ3VqQ91n1bfPIZ4fxhq74Nyz+wjaST5WrgMXOTieCovD8/Ac+s1IeRgm8AfSHZ2fey9iIzj4GdV3TFQVUoVcrM+Vcns54s5aKQeTliJv2uArB8BG1ulFdao/BSVVFtLZ4mSUc07/QTt7lpU3WaQw2756o4nCqYY+bXOWutw0sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmdQstuR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2167141dfa1so2870595ad.1;
        Tue, 04 Feb 2025 12:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738700660; x=1739305460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmYL3e8nYiPwvOrOQu/ZYZA6EzN4lzKoCHbW66QWa58=;
        b=UmdQstuRddFDEE8RXmTRx7C99kHBLtnDRN9TZnittmd8+A6uxz0yzCdKzE3TkNMCk/
         mXZi8Z5dEVjBin4h8X+oF51hPvCLbqGhZoYCoTrPBbcfAeVoLMavBWE9ajLJVgB/TBVa
         ekciSuMt25Grwpo21TFpUzHC6SqU10XgvfjL1FqMu9DjAwrEq3AUcgvdpATyaFrBDA8X
         iJc1/yYi3KlsC54xbTTDB2MUVs6GqcMGNcfqpKqpylbHZJFKrMY4WYiGe+TmrjwWzk7w
         IKfWj/9qRsw3sQAIdJQlH63hIJ9CY9ZBTalWRryp/HhzJ54gECpEoa0b6XbbaBqLb+tq
         hPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700660; x=1739305460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmYL3e8nYiPwvOrOQu/ZYZA6EzN4lzKoCHbW66QWa58=;
        b=kEU49gL3TIVEUoR6967DtrKz5u4MCpebbqTq7yNAIAnKGhBaS+2+7ZFBjcod5FIsuo
         /aqcTh8l2werGIw759IwN43JlhF1NdyJlhA4JiRj9mun0ZEjXfj3VNKBceLp6bMh029Q
         7+fAgNNaNyMVBf+DqpgIQfF2XzXJJQtS/YxQ96l2tC2Vh+Vf+FVrS1YvcOgU59lIEX1/
         S7vDO/SBkFh5K4N1MEDH/VHnuiMKcTgs30Vupiq9MHw0iEN4ub67wKnTU+P4LghdVamH
         uX6K/M6Ciuqx/BIqff1MzoUnLf0KNf+s/IhhQ0FFAqX+PQUg/SP9+gEKMRtMkR/1Y1fA
         pRAA==
X-Forwarded-Encrypted: i=1; AJvYcCUIX72JWVmV0JokJFsi2lzhMw1BbggOB2bOAhHiNrf/mxD1w8a7uTFPSxHrkNTenfbYCkbxlLwTBhRASWQ=@vger.kernel.org, AJvYcCUe7ByaRn77I6bW/37D8G5h77rSHUzzHZfIAOFTcqQLn8UsoTuS6Ghv6VzlhDsrUrCOtAJNysChX6OKtjZJ@vger.kernel.org, AJvYcCVak2jS7284QI/q5tNL6PFfgex2wIBpUgwoil75yylutGddMKhQG6p5DA1e5dH5Dss3hIP1SwjKqAI=@vger.kernel.org, AJvYcCVi+WlZqfO0/yiU/CdITJRgAhyuknPyIFpP/i2g5RRuGzfpkVBAbSM5r5uCHD/sNuDL+4Y0UfOaHSrvu0E=@vger.kernel.org, AJvYcCXHyPoovCrzv22iy+OMxEGbjeaK8N0IfLLTHg0GcLqi09nmsF+AVHrRCIZHMNNe043cqCwdu7qJOBNf@vger.kernel.org
X-Gm-Message-State: AOJu0YySfIgITkU7LncW8mnOOmFRFlmzPJ5G0kd9r7q+BWNbmgTVg3P0
	97YSfHCgYr1BOiMrHBxWUU+T9XSa/3aljo4Nd5Nt7L2oZnICKQIv
X-Gm-Gg: ASbGncs94Jen/i0t1yXxo1uP+gsk+ScsiCTbUPvyfni6Uvr7CmMUnZD2GcbpfBARQOD
	UqkRlgiYy713nQBI3Ku+K2gG9mpmYsnXUtw7o2izR2Bmm9fFniay+2INLjYSoVm3Gd3RFABa0LL
	oea8AU76AsmiOqB5/rZaiTvg45qq30q/ypWoK3w7b8dhHuP6Aj9hxLB+8qtv5qQoTiRml6nR+UI
	uCLRelell/bK0yXpuRvQtQTL+3kMXnuQGhxyt8+bpEOKcYyeHxXacfjdro9QBP+p6IEaFNDfoXp
	wTz8DQsehNmYJ6WT37RWrPEcVZB1XFbut1ZPgRSKH71ml74ZL3NJQ7ltFbTH4kUYNE8=
X-Google-Smtp-Source: AGHT+IEyVcSQipBCNCsftZmHfqSpmk5D2wno+KimvTtSCQ1lngze1gSouuQw4tUMvdxO3FTOfFDU3Q==
X-Received: by 2002:a17:902:da84:b0:216:3f6e:fabd with SMTP id d9443c01a7336-21f01c17563mr64580695ad.7.1738700660282;
        Tue, 04 Feb 2025 12:24:20 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:444:3a1c:6970:6cad? ([2409:40c0:1019:6a4a:444:3a1c:6970:6cad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acbd99sm11706439a91.46.2025.02.04.12.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:24:19 -0800 (PST)
Message-ID: <ec91ca3b-d348-49b4-88b2-a3ce97ce2a2d@gmail.com>
Date: Wed, 5 Feb 2025 01:54:11 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jikos@kernel.org, bentiss@kernel.org, corbet@lwn.net, jdelvare@suse.com,
 linux@roeck-us.net, skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
 <2025020411-ravine-stand-530a@gregkh>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <2025020411-ravine-stand-530a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/25 19:37, Greg KH wrote:
> On Tue, Feb 04, 2025 at 07:18:06PM +0530, Purva Yeshi wrote:
>> Fix several spelling and grammatical errors across multiple
>> documentation files.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - Your patch did many different things all at once, making it difficult
>    to review.  All Linux kernel patches need to only do one thing at a
>    time.  If you need to do multiple things (such as clean up all coding
>    style issues in a file/driver), do it in a sequence of patches, each
>    one doing only one thing.  This will make it easier to review the
>    patches to ensure that they are correct, and to help alleviate any
>    merge issues that larger patches can cause.
> 
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot

I understand and will split my patch into smaller, logically grouped 
changes to make the review process easier. I will resend the patches 
accordingly.

