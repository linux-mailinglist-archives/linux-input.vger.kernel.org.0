Return-Path: <linux-input+bounces-5399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBD94986C
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 21:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E1A1F22D77
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 19:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ED913C677;
	Tue,  6 Aug 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dgXFt8rq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16D014830D
	for <linux-input@vger.kernel.org>; Tue,  6 Aug 2024 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972986; cv=none; b=YyNP8BmRDc13zpuJfdHIAWsvRktWVG5GUPL1nMT46z5drzbvJYa3t8TWNJmnU5aLcIhKt5qMz7VyevzaDCFakCsfMcNpIQk/et9jxWDP8tmBZ6mTZwOSD/HrLKAoZIsq0SamARk3nHfkwDMS4T6vgf4qWcG2DjG1/6At4cbr8Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972986; c=relaxed/simple;
	bh=iEz7lCKN6LmqkDmIh7w+RAirspZH+Yr49vveXIUCT2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFWLxvS5q+AZgWRkLeT4bIxo6mqtV5Dxo3Xo4vWIeZNB/KRVyJyJrX4+fWyKwPxblv+QzV3BhYw6wO9iimYbnWNX3NsYXMWpX+0GtAS2Tjzc5w/VFU1IGbr9mVHRcEUU1nzQBnTY2PZoe8qN8neLUEScMgYBPPm/dNESWfE3cl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dgXFt8rq; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3989f6acc90so862735ab.3
        for <linux-input@vger.kernel.org>; Tue, 06 Aug 2024 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722972984; x=1723577784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IcNnXdUnkI1mV+s9deswScXVelqj2JzGCxi8Q1hYao=;
        b=dgXFt8rq338v9mNPgwgFpyQeEyP9PhlbTH0gd/5M7tHssveTygnJUSoOPDz1s7zoEE
         vrXqctZJ3rctpjXUVqMPwL6X/tRQnb/2HsOyBqlkjG+8c0fMU5I73PouwXQytmKaxy2b
         I6DfJ98qKJ91h8g816wg/YeFcfIfIoxRJQTdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722972984; x=1723577784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IcNnXdUnkI1mV+s9deswScXVelqj2JzGCxi8Q1hYao=;
        b=FLIaYqJxbA8UZ5LWWclFCHfXbLOk6uYVk8T968W/z4zUs7CBtMjJBE4RCVqgrsdPNQ
         S4OF4V7smKx310dwIgDA1hOYbIR95YqeTXJ0rnZ0uPMncS6DlY8F1aaR3w8SUY5sj+MS
         jtjoUInBE3B4Twg4YrbBA0rC432PK/FrfBh12Gg83SkBR1DxeaYGVRynPtLHtdJHQroG
         byjztr4baV4Ihs21pm0qf+RgcYmm8dsyG+vtL/AyilJvh4i2VyAaXVy1ogbr6vgaxNhu
         MPW9h1iwy5+nf8hRTFhCY02YjShXyUieUCmiB4lqcLCRRQUKvk54WCNmvPtuwb2PZemc
         Em3w==
X-Forwarded-Encrypted: i=1; AJvYcCWNrI9HwOgfgfnlSdMOj3Qs4FdlD7r1PC7dmBO/KJ4IQMlC3ieUMcYOKBM5srFha955LS/44B70nAri5Sv3ml+oUSM2BEQvQMqeJlY=
X-Gm-Message-State: AOJu0Yy1TmtQj8rRuJg63mLnKnVDBZTmlHxDE1kwfDyoOLuQgbuVpGe7
	a+zBUzOcvmcxbGY0/3aLY/Mj9feUckvHUte2aR9cqVibSX4ei8iT+P9rT0YuxWs=
X-Google-Smtp-Source: AGHT+IEZoVlqN5oqC2UZRAj8/ipXO6L3aUE6bBqVulf2yqdJndVbcARXaKrOBMfnhl2rIFv8JufbBQ==
X-Received: by 2002:a6b:7b02:0:b0:81f:a783:e595 with SMTP id ca18e2360f4ac-81fd434de8bmr1018147939f.1.1722972983992;
        Tue, 06 Aug 2024 12:36:23 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81fd4d830afsm267206139f.55.2024.08.06.12.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 12:36:23 -0700 (PDT)
Message-ID: <ed207f8a-893d-489f-8e41-d698292ab918@linuxfoundation.org>
Date: Tue, 6 Aug 2024 13:36:22 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests: harness: refactor __constructor_order
To: Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Jiri Kosina <jikos@kernel.org>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, kvm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240727143816.1808657-1-masahiroy@kernel.org>
 <202408052126.E8A8120C1@keescook>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <202408052126.E8A8120C1@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/24 22:27, Kees Cook wrote:
> On Sat, Jul 27, 2024 at 11:37:35PM +0900, Masahiro Yamada wrote:
>>
>> This series refactors __constructor_order because
>> __constructor_order_last() is unneeded.
>>
>> No code change since v1.
>> I reworded "reverse-order" to "backward-order" in commit description.
>>
>>
>> Masahiro Yamada (2):
>>    selftests: harness: remove unneeded __constructor_order_last()
>>    selftests: harness: rename __constructor_order for clarification
> 
> Thanks for resending this!
> 
> Reviewed-by: Kees Cook <kees@kernel.org>
> 
> Shuah, do you want to take this via kselftest? If not, I can carry it...
> 
> -Kees
> 

Just about to ask you if you want me take it :)

Yes I can take this - I will apply this for Linux 6.12-rc1.

thanks,
-- Shuah



