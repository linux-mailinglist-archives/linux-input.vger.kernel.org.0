Return-Path: <linux-input+bounces-9763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90452A27CC6
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 21:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E401886767
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 20:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41629219E86;
	Tue,  4 Feb 2025 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ784Eoc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC858219A8C;
	Tue,  4 Feb 2025 20:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700845; cv=none; b=MqmfK+WQp+h1wyTSz78bELeKJilAN9uWrX4HQwN7IeNskezOVnCXnZzXTh51+y8gzoEALlfAejblA6I0eOeW1qGbFc5vrxoVDkJR6oNqdODwp2TiUcUGhA8ku5E3sAXUNMoJE8qfN2wrCQsezl4IpD/vx2y03RKMKUX52f2MroU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700845; c=relaxed/simple;
	bh=WFSPDAIUqS5pZVqijiOyWktfMK8r6uga5eMdoFxZ5+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7eX86cHPRBrBRoR/MDk/dUcuHZnaWaBO8/41nt54JbvYOKF/IFHucUMxqQQzHCWiIM96f0vRoxl/+ify7Ypi9JB2xW0tzYIpSnN+Lsj+jqM3B2GWjrllGmdmZtyj5+MsfdH4WVJrPD+hEmFafL3gtHEvt53S0CRJzc6+HVrH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ784Eoc; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso276508a91.0;
        Tue, 04 Feb 2025 12:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738700843; x=1739305643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gv6JiYtlN8kPSpQe7ceWePhqFvcJDCE6EdPDAPJIwCc=;
        b=nQ784EocnUo3aY7w0iudAeoCPBcyNsLgGFTXwbHIx5IeYZf3o9X2j3NP0S49x9eK39
         UrvbHH7DGQIawS6ZYonV9JmgxrOHS+3oW5qEheR9Hf7Pl4LyzhwRkoDI6/dYjjo+3tCP
         3fiumLIBsI7M1c/oCdSfmirkff//UVIbNAEdDdNrmKY9sYmqIDAr9GuBlzlysnedTgQj
         exPJbghmBOZO+PmrHehfaci/e3oA3161EzQ87uE7u5d+s5xYHhuPCZkfvb4lhbOUjeZy
         brPdvXb6dCiMD2KwlIh7a5+Oyd/sR/hz2ENKWuAx4u1FZH2T5WUkQzvoz/etzr9jN0n4
         5Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700843; x=1739305643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv6JiYtlN8kPSpQe7ceWePhqFvcJDCE6EdPDAPJIwCc=;
        b=CMZrjYKtDvUUf/F/eZhUi5/FxuAFrZaUspXVV1IDIHXaZQb0TkvbqKas7RXFyXmX0x
         NxHTUNkQ1BCWmK0oFKx9428U4qH0KhLfrojdTbG21tGYAf3l9OJijinbQT0eLTl3Jaf7
         AUKAiFq8onNspdpov0yKc2md6Bv/5nthaZpm8jzbQEYtyNb3fM/h4qs/ij9ppNPhPjV9
         ZroI654z9hiWIYHciv3P+Cj1tICvJlln6oGhrcOLl/HJQoOACEQuRQ7gQ/Mi4+HW7vYH
         tXwVQOFdO2pqRv0wSIEbXW8X0s8S2kLDjBrya0DEmnVn4SHOx8f/cMoO08LaO1R0PCo0
         8h/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6cGpEROAr8c6+2pTYTC9EaL1yDbFTcGrJiGmF+g5ui7JL05pS8HoyhwU8Lukv4bmzWlWcsTj9rH5q/R8=@vger.kernel.org, AJvYcCUIyeZAwkTFJE0WK5w6xQazblqBh6k+N2+sZXVr2/Effo0jXxU1p16IIeXUso1BUNxuLrKWOWyKN+fy9/bA@vger.kernel.org, AJvYcCWpIkBuEifl5l4N9XMfjMW2q5vJ1IwFKrPIF6M/c8bR+DcBn3JZhywbj01kNPpkmRBkYpUoPMoerCOLbSE=@vger.kernel.org, AJvYcCX1q41tpUfKqgv20knZeB/s/VBpkYjdMcZ8IyKFfscIWZ88Wfw2zbFKmsBuEa9v4MyMpbXH7+MsN4o=@vger.kernel.org, AJvYcCXC/GWsb42Gm+q8tDkGCxUas6xuQrpLbc3n9GOpcDTjnrdZdjCDpUZxLXOBH1445erK/exqzLowbGx+@vger.kernel.org
X-Gm-Message-State: AOJu0YzHi+/NiiQlunwKG/ltHEesE0wLtQQ2iVc6o0nNNNFsAqHkpafM
	HZp7Oylgq9vv8GxUenJAg8FuSazDiZYTWAaxu+VaP3uo4hu/ZZum
X-Gm-Gg: ASbGnctVoq2RS3UKTXgtDCBvq6znK6xH3swzNWAG8r7jwonjHyqads+eEjE49H6EvgZ
	1PFBOX6FkHOjrMTajVeFr3D/IFm5y61Ts7Tl/qm14GeTnA5yKaV1esXfrxK+xOnU33LB3C2vCFV
	qU7ds6GbuEEAoMbuYOyqMURibTOLeduAY6+VP74vlgxwgP8nealGcon975vUNM7r/uV56v5jl8k
	jTdOyK0onXCuQio86Dwz5QDsJx89/OhGEOp081GoUS7U7YnlbgX70Kt+0qVL2wIkOyCurK4U8ue
	XST3kQdt9zkXeHtXMfzZ//ny1K8vlbqREsws8Bo/R83uRlHWFT1EMTZ6q4SfWktGhGw=
X-Google-Smtp-Source: AGHT+IE/LiNt4CD0Wt99K/4gS/5c/Id9sEeiaRaIir6gHMcBT4NgaW1uF3HWqKgHWrAKbkzMcThx2A==
X-Received: by 2002:a17:90b:53ce:b0:2f5:5bc6:a78d with SMTP id 98e67ed59e1d1-2f9ba1f71c3mr6958077a91.3.1738700842816;
        Tue, 04 Feb 2025 12:27:22 -0800 (PST)
Received: from ?IPV6:2409:40c0:1019:6a4a:444:3a1c:6970:6cad? ([2409:40c0:1019:6a4a:444:3a1c:6970:6cad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320256sm100738405ad.244.2025.02.04.12.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:27:22 -0800 (PST)
Message-ID: <e961ef03-b4bf-4f7b-8a6c-2fd61bb2d8f6@gmail.com>
Date: Wed, 5 Feb 2025 01:57:15 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix spelling and grammatical issues
To: Guenter Roeck <linux@roeck-us.net>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, jdelvare@suse.com
Cc: skhan@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20250204134806.28218-1-purvayeshi550@gmail.com>
 <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
Content-Language: en-US
From: Purva Yeshi <purvayeshi550@gmail.com>
In-Reply-To: <1b32dfcb-5966-495a-ad48-903650888ee9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/02/25 20:09, Guenter Roeck wrote:
> On 2/4/25 05:48, Purva Yeshi wrote:
>> Fix several spelling and grammatical errors across multiple
>> documentation files.
>>
>> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>> ---
>>   Documentation/hid/hiddev.rst                | 4 ++--
>>   Documentation/hid/intel-ish-hid.rst         | 2 +-
>>   Documentation/hid/uhid.rst                  | 2 +-
>>   Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
>>   Documentation/hwmon/abituguru.rst           | 2 +-
>>   5 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/hid/hiddev.rst b/Documentation/hid/hiddev.rst
>> index 9b82c7f896aa..073485f84793 100644
>> --- a/Documentation/hid/hiddev.rst
>> +++ b/Documentation/hid/hiddev.rst
>> @@ -15,10 +15,10 @@ To support these disparate requirements, the Linux 
>> USB system provides
>>   HID events to two separate interfaces:
>>   * the input subsystem, which converts HID events into normal input
>>   device interfaces (such as keyboard, mouse and joystick) and a
>> -normalised event interface - see Documentation/input/input.rst
>> +normalized event interface - see Documentation/input/input.rst
> 
> Is US spelling now mandated in the Linux kernel ?
> 
> Either case, this should be  multiple patches, at least one per subsystem
> or even better one per driver.
> 
> Guenter
> 

Thank you for the feedback. I'll split the changes per driver and resend 
them as separate patches.

