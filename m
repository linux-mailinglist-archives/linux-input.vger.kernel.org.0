Return-Path: <linux-input+bounces-12068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A0AA0888
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 12:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496483ADB45
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 10:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82968219301;
	Tue, 29 Apr 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6tIvyKF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C41F0E58
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922505; cv=none; b=qPjrAIBMPfqj2in84iTGG3Vq5ozOv9Rx4bx4gGLfaySgVAbbzRrqKeZKYDcOBEKMzB47S/01jFbE73oHTe7y2IsUTYfbbBGHDsqkk9Cb+jN61h+1KwPff1Zbosn4OMV8LBsTA4WfLq6Am2H3vGL3V5VuMaEx/SEciqc9fIbiSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922505; c=relaxed/simple;
	bh=AtSxEcOqO+6pRTyABbz9/Kk7e5xfxH4uFwoaG+37V9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpeEVtIWY54rf1yx9q6AvI3UN0p61ym8opixQIwsYzQ9VsM5u2mAF82Jlk5P3ZLV0KIozUF2QKABgsMLURtcLyGArBFR7m9i+p70NVvuPqtpzLGNpVdjr2HFcHVrwlGVzmN8+XTAygg21G3vo9cR0YoIKxcM4Vx49A0evhlW9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6tIvyKF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33e4fdb8so61352485ad.2
        for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745922503; x=1746527303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lgST4Xb59GBz0GhzYuPOXUg1nfXj9r0fqkRuq2yCJgw=;
        b=T6tIvyKF4U/rlncIupQ90tuYRVdXOZmIf6u8X7bQFVVmlddQiCTWkePFYjNb9RXUNb
         y4+4CrG3PLqY8xunodKDOaDpwyR/C/EdoHozHh2lqCL8DzCVMepGvvwCS/IHOEWKP79Q
         1Pa3Tk48yfMxlJf8607KdE9VMSLOpAjhmLXpudCCPp+D5CZZC92p7bHJNS+AI7ia4uqW
         HrGXl3cYWBWw+0vT4byvtFa6Sjxz2zxkTv8vFxHK6i5+JWWdfXM2rql8Ibz+mjWyxR6t
         z/yxN65AUwQpOAFBh6zAsFa86bvKDMZftmoUjLZ9tZ0L8Noqxr2zXXAeUg4lK7W8AW2h
         StkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922503; x=1746527303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgST4Xb59GBz0GhzYuPOXUg1nfXj9r0fqkRuq2yCJgw=;
        b=Atza92v5WfHox/84oP7mebwZAlqEw+RVwcZ6td65TvnIv1lFcH8hs5dfOryV+cc6hB
         nu8YMMl+fjoHmXG7nDCDNGAicAPOpD4yMiepz9GmmPqJ/ULQ+OECoF0bsL5mUTTdDiq0
         RiehQHYNYGiwpdZMkUjuVdH1+n8QAqCaDMAhW76rXSpbLKqjhMa878L07JpKf92lKrKI
         2YYVVfgeIkILvD/7uVLL7WxZWWSDUgDg9uvroaszcbGTt6Xs/1xOTsOPWilqnc+jLLY/
         RgPLbqpZ6rB3NAoLHAkd7TJZXpYmBw9ISF6iKXnHwChNJwtI0pSV+853U/IL6+hNTeZl
         EFVw==
X-Gm-Message-State: AOJu0YypoCRtYBp+G/rpj6kBGjfQf/mVfhGIQ4t+n+7cJwruV9Vp+JBm
	aaDtGWBiXKdK+SZZu3xEk5u+VDWmfyL0sH1jMuWEumMuaO6zxShd
X-Gm-Gg: ASbGnctyMeZzGou6gxZoWKkiL+2xgND0AkmdEr+iIdpGl6jeR1l///Ps9HI1AWji9WN
	9uP8cerCirqLRqP8gDm4ivs1uL+IVj74V9mUno/zW5/Rc2sfw93+BfqqcXhe3o3cnxF+d/dAeav
	4tceVDLmvXAsAaCP3pzLCo9G9clUUvi2AYjLd+/mXHESMlNrgA9SIcHl0suTzmQmpM0KKmBRW12
	V5iHbRb2qZ4YzmdbMdT1qiv0IxcU0db9vLrcJ+ew6pJA1BFZiMFZeQCRH4PiGZbAbinxzJXaD/H
	wtuRLm5F+6KfHd9W7o9mtd4nhlet4cn4p9cFmHXpD6rQbUGK/+oRNKId3DN68YSdkrWDHZDAl7C
	erdYff/RQ7a/VII4zIaSxdSdG
X-Google-Smtp-Source: AGHT+IHaN3RWS4M8hvQi1zCNk+VpL1Zre7UzIsPRf+erKwA3P/GG2l3oGCjmSCrKyADMep9GM6K0SA==
X-Received: by 2002:a17:902:e745:b0:224:249f:9734 with SMTP id d9443c01a7336-22de5eca422mr42629275ad.4.1745922503057;
        Tue, 29 Apr 2025 03:28:23 -0700 (PDT)
Received: from ?IPV6:2804:d51:49ad:6800:cba:6188:b870:6d39? ([2804:d51:49ad:6800:cba:6188:b870:6d39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm18194645ad.123.2025.04.29.03.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:28:22 -0700 (PDT)
Message-ID: <a13e82a2-31f0-4466-bf72-1e36a996a7fe@gmail.com>
Date: Tue, 29 Apr 2025 07:28:19 -0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add keycode to Dell G-Mode key
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <20250419113132.36504-1-marcoshalano@gmail.com>
 <c332518c-f997-49bd-a2cd-4612def52b81@gmail.com>
 <vyyy42prkuhvaqxhcuy42v3viwb4t63ptoxu6etopy7kh5shcu@cq3354ua7fqu>
Content-Language: en-US
From: Marcos Alano <marcoshalano@gmail.com>
In-Reply-To: <vyyy42prkuhvaqxhcuy42v3viwb4t63ptoxu6etopy7kh5shcu@cq3354ua7fqu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 22:44, Dmitry Torokhov wrote:
> Hi Marcos,
>
Hi Dmitry,

> 
> Could you please tell me more about the performance mode? What does it
> do and how it differs from normal (?) mode, and also whether it is
> something Dell-specific or whether it is also available on other
> devices.
This is the performance mode related to power consumption. I think 
kernel calls this "performance profile".
When you don't need to save power, you can improve performance by 
increasing the clock.
For some machines this G-Mode is already enabled when selecting the 
performance profile: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/dell/alienware-wmi-wmax.c#n51
> 
> What input device emits this key code? atkbd? Something
> platform-specific?
atkbd, I think. It parts of the regular keyboard, scan code 0x68.
> 
> My inclination would be to use KEY_VENDOR for this functionality, at
> least for now, as the feature seems very vendor-specific.
Yes, it's very vendor-specific. Dell uses for some Dell and Alienware 
machines.
I don't think we can use KEY_VENDOR because that could have another 
KEY_VENDOR in the keyboard, I think. The idea is to be a very exclusive 
keycode, that when detected, it would indicate that you want to activate 
the "performance profile" and don't do anything else.
An alternative would be create a new keycode called KEY_PERF or 
KEY_PERF_MODE. That would activate the performance profile, but it would 
be vendor-agnostic and if any other vendors, like HP, Lenovo, Acer, etc. 
want to implement the same feature, that would be possible.
> 
> Thanks.
> 
No, thank you. Please let me know what you think. :)

-- 
Marcos Alano


