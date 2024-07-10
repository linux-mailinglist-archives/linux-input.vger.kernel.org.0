Return-Path: <linux-input+bounces-4943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876C92CEB7
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 12:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41FA71F22DDD
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 10:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C44F18FA2A;
	Wed, 10 Jul 2024 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8wTDYPn"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAF18FA17
	for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720605595; cv=none; b=b3y00a+ujAUW4RdsZ2CO3SqS5sf3QWDeZ9ctJZkWvKgpgW2PbPjon4mGr6kfScKDz5BeX8jlR3Heg51DV508QeOcyG/A/6V70CF2jCQ1QBWfRfyCi5PJW3Kg7jrtg5RZllkqCpVyAM2nUW9e0EPjFAiZrkO7WUAfKoRypidijFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720605595; c=relaxed/simple;
	bh=ZkE1bV+5dqKs9zBEfCKHUdeXbA/g6X79LkJPlrpjd8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv+EStquYVdY5s5BN+5EafgYTnil1gsr8lUXtT6O8CpwVWaB3UuUII5dNKq2Gl68VHwjsSWOPzXZcNZ5qwdf+khvO2UYr8zc3U/+pV4FpcOGIMQoE4jPQJt7GxBMwFVLVyPnYcvXe53kfHk/13G+wPZ5Uo/2ZAvN9cCitizk+Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8wTDYPn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720605593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLxyb06M9OF7tGSK1sebYwuTJMPMxYQY3JflFoHNWPk=;
	b=i8wTDYPnnUoHAyDBCkRJdFlGdJn4NcZ0CUmQo/r9l0gdNj6Ehg0AnqxE0Lvch1iDEhQzAf
	sJ04aDiVXb/NutSTYl2tltJ/UgLRv0x6Wzvgc7wSHIwgzM6OCZg0w3HwvVQ8vu8mebDGai
	oZMmdAWpqxgljWvt8wOqiMRXaHZYONA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-NZVuI1K8OZaMBW81taJi7Q-1; Wed, 10 Jul 2024 05:59:51 -0400
X-MC-Unique: NZVuI1K8OZaMBW81taJi7Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c5255b1eso441092566b.3
        for <linux-input@vger.kernel.org>; Wed, 10 Jul 2024 02:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720605590; x=1721210390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLxyb06M9OF7tGSK1sebYwuTJMPMxYQY3JflFoHNWPk=;
        b=pdiQJNXPsS6abEQ5jEc1Wl41KqcxZ8cLiJxoDklTIBEynwz1HDgX+upoQUmcmIVzmm
         92ND2Pqh74gYZfunOmhFunITVclcsJqyG4B4BEpuExi67PNbGgkG7t6mT5Sl7+30S3ph
         +LrlK3qHTDsTvIdrgmHrwaj3RCna9p7ntsaqM4buTH+75mMZeuuwZSWzbgvsHUH6qv1F
         jPetNJnIQlevxLUUnH/0flE1LEy4TL3LkwjDR1hfMbCc2VBMpkIP4Fa2Q0oBDBQ6BHvc
         8F0ACeUJT8TMI0eFQ7pRIgVLK3DDNxKuzT/KGSBg9aVl9+mGWlI+ZHIMKKgc49TgVQJG
         kG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrzjFL8dD5vGXaWXWkYj6YFbN4VO2gJMwUkDP+WlvRtqioEYvu2C6ufBC5hd+oFtGpejANYYTczd7Z1m4k+BzPq2nkqeMcwCV4pk8=
X-Gm-Message-State: AOJu0Yx+IVhyV9G9rQt0QIdHKuBF+d/XzpHaaM+pGqF2v79eB1uvgOvZ
	VTdEi34z/H4lbpVNNUgrOJXqpMSqS7LaLfFKvhO0Okydu1eaqkDg89/b645hqFvjFtvC5yEEF3C
	qxipyIR3RKVrl26cHzMAh+bD027nXPzQuhe+Vp2MksBa7jkCk+EH8hITnn1AL
X-Received: by 2002:a17:907:2d2b:b0:a75:2d52:8ca8 with SMTP id a640c23a62f3a-a780b89f457mr432509066b.75.1720605590297;
        Wed, 10 Jul 2024 02:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOVv5tjV+ZXhGBNceewPQ0SKgmJuebVyZTWcQNIYlT/xWngzHd590SoEr9Bq/atGdH5wEU1A==
X-Received: by 2002:a17:907:2d2b:b0:a75:2d52:8ca8 with SMTP id a640c23a62f3a-a780b89f457mr432506866b.75.1720605589935;
        Wed, 10 Jul 2024 02:59:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dfa84sm146172166b.63.2024.07.10.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 02:59:49 -0700 (PDT)
Message-ID: <3fece177-f6b4-41e4-a781-7c4c923ff7d9@redhat.com>
Date: Wed, 10 Jul 2024 11:59:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.1 23/29] Input: silead - Always support 10
 fingers
To: Pavel Machek <pavel@ucw.cz>, Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240618124018.3303162-1-sashal@kernel.org>
 <20240618124018.3303162-23-sashal@kernel.org> <Zo5bML7Q2ke/CsG/@duo.ucw.cz>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zo5bML7Q2ke/CsG/@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pavel,

On 7/10/24 11:58 AM, Pavel Machek wrote:
> Hi!
> 
>> From: Hans de Goede <hdegoede@redhat.com>
>>
>> [ Upstream commit 38a38f5a36da9820680d413972cb733349400532 ]
>>
>> When support for Silead touchscreens was orginal added some touchscreens
>> with older firmware versions only supported 5 fingers and this was made
>> the default requiring the setting of a "silead,max-fingers=10" uint32
>> device-property for all touchscreen models which do support 10 fingers.
>>
>> There are very few models with the old 5 finger fw, so in practice the
>> setting of the "silead,max-fingers=10" is boilerplate which needs to
>> be copy and pasted to every touchscreen config.
>>
>> Reporting that 10 fingers are supported on devices which only support
>> 5 fingers doesn't cause any problems for userspace in practice, since
>> at max 4 finger gestures are supported anyways. Drop the max_fingers
>> configuration and simply always assume 10 fingers.
> 
> This does not fix a serious bug, should not be in stable.

This patch is necessary for clean backporting of new DMI quirks added
to drivers/platform/x86/touchscreen_dmi.c, so IMHO it does make sense
as a stable series patch.

Regards,

Hans



