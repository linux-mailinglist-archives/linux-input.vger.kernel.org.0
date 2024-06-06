Return-Path: <linux-input+bounces-4169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B99F18FE381
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5846E1F21DD7
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBD317E8F5;
	Thu,  6 Jun 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHc6iWWD"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA6B17E8E9
	for <linux-input@vger.kernel.org>; Thu,  6 Jun 2024 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667629; cv=none; b=tPM5ByXCEnKrns7GGbdg8ZmkJRcurkui2rlHryGFpjWeJr83VjzqnMWZSPLCh9XtLRlDnG3YVwe+NcZ1mwq3p365qNY/AB3iS2SV50UIy75flzLJxTpdjCgmvLyANKIJN8aBAzJV+WBUzho2YisvjoHoBbCM0+snkkfXhxzV24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667629; c=relaxed/simple;
	bh=OKrWD4tOdXVJBlVFBMqDGcjT1rYT3HlZVNBKuy96eA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dht2EzaZz4Jj9XpkUItcwI2qXsbhr+Tx6G4beBmBcWuPL8gwf+Oa5G337wK4rDWu4ojPdbxBltRF/wk1Nk7yrOSzPznLn2T5sFkzCncfXdzj5niUqX4pZ4J8ONXpipN2vWFMy05y8ZLYT24gKeu0wobw7T4xt6WdpxbFtVSUozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHc6iWWD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717667626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9rUrzJjZko2Iw3f3+zK1QF9Mdz370vXHXH1MDphNK8=;
	b=WHc6iWWDOTN+k+W0hzFzN9tg+KuYkNqhkOMciRmYZMEgkYNTLOOhMiRHqnmXfnh+5zqgQv
	9Q6nl8B6QzJZat7++uBH//F5KYccljLFi4o76V6yuNfjMknF2Hr6pQBJVq4WhXUIzSi44K
	Qs8vXmZdMV2REEu4LXmIBff3ZaBEVgw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661--bE6jl5dOT6PaKRBwXUwjQ-1; Thu, 06 Jun 2024 05:53:45 -0400
X-MC-Unique: -bE6jl5dOT6PaKRBwXUwjQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-35dc0949675so641282f8f.3
        for <linux-input@vger.kernel.org>; Thu, 06 Jun 2024 02:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667624; x=1718272424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9rUrzJjZko2Iw3f3+zK1QF9Mdz370vXHXH1MDphNK8=;
        b=SoHTsnInlck9EgzPkVTw10UjRzZNOuAy1n7Yvq6HQ8cRjyy2d0MAFR5/qcVhUigI7D
         3WFc1JXJLgSXv0b1vr1B+OmlKxLRo3mpPtikHm4UlXOjrqNl0JW1+yIRbLJgwwl6Mx8d
         tmJAg4JUBra1L1Ji6axg/9oSGOnR2ULhrFOYV+vLEotrL6Z3egzjjHD8Wjh1DcoZsjqw
         4kEvtGlAKk++JyxmxzuPGPgQywu7GYxAynEoTK6o948bwxRvQYqzDSW/lrW7CdLiyNoK
         zMly9GAboTPTqVky8XzePu6QZwHi3KLwO0LigKG59bI58azuk+4cFDfiwg3sIbKS4Vj3
         bc/w==
X-Forwarded-Encrypted: i=1; AJvYcCUz2Y/p+An8fPMZTnLrVCFgxyCuvJ6q5jMjyj5cO5yFmHzr1TkEvZoh6hgFxEYwOvwt46pf1octoCoSAGp58fqm5CWCWFPqXEpzmUY=
X-Gm-Message-State: AOJu0YzBgp7au96UoQbhRnMb+vG2K5m+LNST8Ma2XYL3AQmtfDF7QVhv
	vIKoXbB+1+NNe8gDgOh+YyPbWNW8CyQZs7JecpB54vRdru1ZmjaKrO64JRdJGUXBQkNyP38PXml
	pfIVPepEZVRj7AKKGTaJqdC1OLDPVeuHvtZVKFcuSKrqO/f/57Tf8BVA1UHGAVY1s1JbO
X-Received: by 2002:a05:6000:b41:b0:354:f8a9:351 with SMTP id ffacd0b85a97d-35e8406dd83mr4727365f8f.3.1717667624201;
        Thu, 06 Jun 2024 02:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF5gfi1+scnkAQWAZIkTvX0i5PmX29J29SdadoblzycAnzsfmoVfewxnuf+86GgbXImXCwgQ==
X-Received: by 2002:a05:6000:b41:b0:354:f8a9:351 with SMTP id ffacd0b85a97d-35e8406dd83mr4727337f8f.3.1717667623783;
        Thu, 06 Jun 2024 02:53:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8072a101sm72627566b.201.2024.06.06.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:53:43 -0700 (PDT)
Message-ID: <fc03506c-210f-4d79-9a99-8bc9b0587d25@redhat.com>
Date: Thu, 6 Jun 2024 11:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: "Luke D. Jones" <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>,
 ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
 <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
 <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dflqwdl4fo3wv4zjj4jl6sbot6cotscksgpyrbiu3j77lyrwal@s6nomonx4gv6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

On 6/6/24 10:49 AM, Benjamin Tissoires wrote:
> On May 29 2024, Hans de Goede wrote:
>> Hi all,
>>
>> On 5/29/24 3:28 AM, Luke D. Jones wrote:
>>> Changelog:
>>> - v1
>>>   - Split the patch in two
>>>   - Move function body to asus-wmi and export
>>>   - Use array of names and for loops
>>>
>>> History:
>>> - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
>>>
>>> Luke D. Jones (2):
>>>   hid-asus: use hid for brightness control on keyboard
>>>   hid-asus: change the report_id used for HID LED control
>>>
>>>  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
>>>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
>>>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
>>>  3 files changed, 75 insertions(+), 2 deletions(-)
>>
>> Jiri, Benjamin since the first patch now also touches pdx86 files
>> we need to coordinate merging this.
>>
>> There also is a long list of patches pending for
>> drivers/platform/x86/asus-wmi.c
>>
>> So I would prefer to take this series (both patches) upstream through
>> the pdx86 tree to avoid conflicts.
>>
>> May we have an ack from one of you for merging this through pdx86/for-next ?
> 
> Sure:
> Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Thank you for the ack.

> But I haven't seen the v2. Are you sure you want to take this series as
> it is?

No I plan to wait for v2, I just thought it would be good to have
an ack to merge this through the pdx86 tree beforehand.

Regards,

Hans



