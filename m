Return-Path: <linux-input+bounces-16339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092AC868E6
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 19:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E358034FA4A
	for <lists+linux-input@lfdr.de>; Tue, 25 Nov 2025 18:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C7430DD2E;
	Tue, 25 Nov 2025 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJjL6Tfk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8162264D3
	for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764094765; cv=none; b=UO2tJ0KJGHRm0kOnqC2NUQqWirv/YEX3x7K/NLs/iHxgs+GuST6GH7XE1D5hdu/pmwHA1UzV3pfOJGZKLY/0yoGn56mdMq21MehhiZhu1ji4oOtAQyNK1iyiJKz9n8WR0zMFmy+PwkF/XiRjR/q/JnbiIHyvH735XXQcEx6/xbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764094765; c=relaxed/simple;
	bh=3FhC+kXH3B5AzVMbeuWeYDSaWr81HEASC/43OOHPKHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiljUj2RljV/iEkEPfenRScpuIo6JFjqQXokKjDd7joJFZMWd4DRu2JMf10o95usorJihqg4t8i+jCj0VrSRyoOUcuJcOGQFrBTOB+u8wCr3u5aS2+xfJqHOojXUGMehGY6GbvgURDNXHxHfsf7aTsADmFiDPw+0RcJq6yXmI80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJjL6Tfk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b379cd896so3258796f8f.3
        for <linux-input@vger.kernel.org>; Tue, 25 Nov 2025 10:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764094762; x=1764699562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QD1CCAPcssLzpZsS6Mj5rvSwQ5nCelYbF5aDvpoGo1o=;
        b=dJjL6TfkgDfu7E+COhTjOmcA3NmQLyspkdKwIyuxvH6JigElOF5NSq2zlxWbFLrdTk
         sE3TeLNCgYAcJjFAGqXK5ltydlWoDM281bH81EwcYq28hXcM5TrP5qjnf/xIxqMmGZtj
         cTjUuC+h/MuCq5JWGGb3lSlz/04TO3GCl0yJnQGtF34FBTjFJdaF2+UqRLS9IyKmh3Xu
         AjeFBkjVJE7L7jxT1zvMabsEH+w15ij7FfZ6GcY1UnlfMWEF+bRMFmHsTCdo5A1fMPu7
         ucdS/F6xvcmWaBl8bzSb/sgZxRdloFSv9QLPzT1q5Teee1rQCZXAXNQg9gqU5cVH6xpW
         Hwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094762; x=1764699562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD1CCAPcssLzpZsS6Mj5rvSwQ5nCelYbF5aDvpoGo1o=;
        b=Le/XuGmrW6WLQiHOPa/u2YHhALwTNj1NOZFM2lQSx3ATVutTiaWfUNW1J4F/4oBa0o
         +n4L2pHwkKbeKmDyZo6ZAIE9C1AEhp8rxcf25akmkahl2t79213kuwrHmQOCI+W7byu1
         81DsCr+zNhd3r65BqFvD2l17qtyHK96iRK+xl7YxW+JP3HTspH2QQxPzcKafLNcBa6dA
         oEjPVo9qWTHWY1cDTk76K4H0C+Xyef2W1NNpT8RcNGECHnN48OwZdsjyDdGwFq2CL784
         smp0ZYd66vh/f98nBki+JfY++9EUdJrjAN3sjDQB3IsLqFxVzLVF8niZm76U3WSXtF3c
         cj2Q==
X-Gm-Message-State: AOJu0YygRe8evpEPlAHtnAe2DfrFGj9TYaC5e8H4wLgcYSsdBv1W58Ew
	rzZqxbXfqQ4pc/P6S0jrgyOzp+bDSNRweSkTw/LIYvq0sazdHECBv565
X-Gm-Gg: ASbGnct5XDoWbmdjWugDlNOkDy8zvclzbSCItgR97YnRK4BX3JC2IIHFQKpbeSa97zd
	Ei5KfWSzhdwVh5r47uE/T4aSyGYAEZ6Q1s0meMLsYwg0FHZEtFy2VPx7ki6js4H7EuYUDjh24dY
	3FkHSiHsuXMvhPoGLCtMxNozvlixmDEzlb8LDH7Deykb3UeFeQrqapA1Qp0ifmu65OxmOovkzB/
	B1k09McYRMzVzrJic4EkQDy60BKz7rIB0g3n4mZerpmhziKSTIWjQKtDYIxB2kOR5LlmIpfg4vs
	SgAvDBK1At4q0RO80h1J0BlkirBVGxfcCtpbZ5Kc8U0OGpC4RHzwecS7XT5K2Nifb6p79uWw/Ox
	3Rss4jY9BswUcGMGDlkBzSSkW/FR9m6qSqWcRix4Bk06ls+0yyc/GeDARCHvgzPn4UbO5jsusec
	N41ouKaz4=
X-Google-Smtp-Source: AGHT+IFHbDwkp2CaWm16Z6NarVIxFHbx8YbHfm4wnApcclc+Vfg/xfl2pHmCg5MNHh57zJw7P8OF0Q==
X-Received: by 2002:a5d:5f44:0:b0:42b:41dc:1b58 with SMTP id ffacd0b85a97d-42cc1d19957mr16662352f8f.45.1764094762096;
        Tue, 25 Nov 2025 10:19:22 -0800 (PST)
Received: from [192.168.1.12] ([41.34.101.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8c47sm37081312f8f.38.2025.11.25.10.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 10:19:21 -0800 (PST)
Message-ID: <f67a5702-4b44-41bb-9538-19063bc28b41@gmail.com>
Date: Tue, 25 Nov 2025 20:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
To: Max Staudt <max@enpas.org>, Jiri Slaby <jirislaby@kernel.org>,
 roderick.colenbrander@sony.com, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
 <6251f6df-d4ac-4681-8e8b-6df2514e655b@kernel.org>
 <44eb6401-e021-4c69-96af-0554f4f31e57@enpas.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <44eb6401-e021-4c69-96af-0554f4f31e57@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/24/25 16:06, Max Staudt wrote:
> On 11/24/25 3:32 PM, Jiri Slaby wrote:
>> Isn't this fixed already by:
>> commit 8513c154f8ad7097653dd9bf43d6155e5aad4ab3
>> Author: Abdun Nihaal <nihaal@cse.iitm.ac.in>
>> Date:   Mon Nov 10 22:45:50 2025 +0530
>>
>>      HID: playstation: Fix memory leak in 
>> dualshock4_get_calibration_data()
>> ?
>
> As far as I can see, that patch does indeed fix the same issue, and it 
> is already upstream.
>
> Thanks for the hint - Abdun's patch has been upstreamed quite 
> recently, hence I guess Eslam missed it by accident. But maybe I'm 
> wrong and Eslam can chime in himself?
Thank's Max & Jiri,
sorry i was sick the past couple of days i missed your replies.
yes. that patch fixes it. I guess i missed it because it wasn't merged 
yet when i submitted v1.
So please ignore this patch.
>
>
>> Anyway, this is a typical use-case for __free(). Why not to use that?
>
> Wow, there's been a lot of interesting stuff happening around 
> cleanup.h. I've been out of the kernel for too long, this looks like 
> fun. Thanks for pointing it out :)
>
>
> Max 
Lastly, One question to max,
at the beginning of the function  dualshock4_get_calibration_data
buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL); if 
(!buf) { ret = -ENOMEM; goto transfer_failed; }
if the allocation fails. can't we just return here . or do we need to go 
the the end of the function and do sanity checks at the end?




