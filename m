Return-Path: <linux-input+bounces-10451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2924A4AAAB
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 12:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 334247A6F54
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 11:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED881CEAC3;
	Sat,  1 Mar 2025 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6lpU45i"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70081DE8A2
	for <linux-input@vger.kernel.org>; Sat,  1 Mar 2025 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740829012; cv=none; b=tKZ2NFt5pEyIxGKPX/J5h+W9vx7smJnhdmesyRUmZGtrfeTqpuL8LNs+bOKR1dG7LQfFJTQlsOWmWM2583c1Ka2jAL5Xu7gqlLLW0LhkmQaRnQK8RFSf2rvU0ryg97mXpxbFO0TmCxglI+EdIGdRLm31SRUdWVydQM/J/FJoa4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740829012; c=relaxed/simple;
	bh=1N0XJWm2DllF8RnfekMenla1Kf7ixW0UheHRRT6WGPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOwBI+L7P3F2wOOLceYlPqSej4Pz/mm6a13buy3KDOkqW095mv+OyxPMAZEjBX1/CxPuNLbj8IYeGgFwBVtwQIU/ubNcBTRDNF/XZbAQJkl8df36JvruWYCfWNQ/ldXFESi9cZkovSfQj4hfxRfpar1nGB/q+T+cWC5IUs2Yl+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6lpU45i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740829009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbORu6qgQcd6DUt/THQ0CSEvNH/qSwH/OAlOYxx8xys=;
	b=V6lpU45iQbnVav4OdIV4F2Ffl6Jd5fDAmxIM+jM90nzmaGh0pxkWSOnC3UA5FsQUEPnLzO
	rNlYb3lLNL/PlCe9cfzb8yDMsZ0quskhstwluVh85a6qQdLYFHeLJO/0eApE4+IiAIRUAZ
	mx1q+CyDwpUyBt0++icrwvD6UX/jqGg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-smPxdpSjMCWGVAaCXigm-w-1; Sat, 01 Mar 2025 06:36:43 -0500
X-MC-Unique: smPxdpSjMCWGVAaCXigm-w-1
X-Mimecast-MFC-AGG-ID: smPxdpSjMCWGVAaCXigm-w_1740829002
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abba6d94ae4so355296766b.1
        for <linux-input@vger.kernel.org>; Sat, 01 Mar 2025 03:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829002; x=1741433802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbORu6qgQcd6DUt/THQ0CSEvNH/qSwH/OAlOYxx8xys=;
        b=lKsT3agu5zeh0n/Jd5m68U7T9xKy5Zg9QrctZLyOvuEUc6qeib/1NCyOAF1hyCgJHs
         otWnagTyJ74l+OIBN4IZwXdGDZDyoG/bHkvvF3DqcBCETEmu6WCMlUI3YSsU40K11AE0
         IpwWjIKppd9LVfyTtsUMv2HuWllYyFDZyf4+DO+cIxWzWtMMeMOPReUtI6GaheT/U0QJ
         i8yQ7Ec+sRKVyLkKbjuI3RqvkH/jeiQEVnBHki4qYVYYPPizIkUiCJfLFHQumENfq3NV
         UpUGy/tvNJaRd/htDJsiBOZbXm4kUz4WYNo7aaztTAEIWuFt9ek1tZtyupUwxDW2un0u
         4Rjg==
X-Forwarded-Encrypted: i=1; AJvYcCXMja+xHMbdxvaUtkDxxkMZ4GZijqyrv1OzDtsQpkq308TPDI990lkTl6COoOOUD6E/4xDnQkeGT+XIaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YZVBL50OPt/mOGeQ3bRcsoHK5SWNDD+MI+Id7S41BPk1k+8l
	Skma1M41FymrBUlEVHA4blUYC8xmEve2ZM0MrfdLvoli4+WKUsxytDPNmF8J9VbJvcg9Kn9DVKO
	XbQlh9TNBqxTfrGm5nHHHpE1it1pu1XYbaeHhA7J3SLyrpN0VPk2wOPeRWDjz
X-Gm-Gg: ASbGncuHxn7spzHVJ3bFFV9C/oNeHnVs/yrmvQCZS5TrTLBT0kng6jOFPg5o7cbJt7O
	G1Q877+gXr69I+IUYomtQiIm+tIP1beYOoMfydCIQTfbbDW1hfyIRAznIKupoDiizLGLPvvN6lK
	nMyIuZ70jqJnUTbLUmI/v0MkBAFIhrYJToqQQ0iZgdiu9A5rDsfWgaapLL0EIc271y3Fz4+F11v
	VshLHsqVmqfb6tuY5ypJJanUS28Tyg8d/spyuo4lv8NVkBALblgIUEIZWQaikQ4QJ3fKa3pL8v8
	WjgzZtVT080QXaMYSvV6nx93l79+P2jWp5PMB8TuetHVwLBh4NucKkIC26koF7ztyBZrdNoV9a9
	dS1BYRiem9A+OPDjzo3LormO5ZTL7wKRG0Xsccs6tfIkwNm/ocF2U+cHeIMHeJYPurA==
X-Received: by 2002:a17:907:7285:b0:abf:2b4:c6fb with SMTP id a640c23a62f3a-abf2686a09amr843681666b.57.1740829002234;
        Sat, 01 Mar 2025 03:36:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPCf2wWBViuMG6idxiK+1QfLm7qmZEGg/zDdM1CgqlrIMVKlaPktbzXdcY8xCu+LIzOF/c0g==
X-Received: by 2002:a17:907:7285:b0:abf:2b4:c6fb with SMTP id a640c23a62f3a-abf2686a09amr843679466b.57.1740829001798;
        Sat, 01 Mar 2025 03:36:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b92d3sm463900866b.12.2025.03.01.03.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 03:36:41 -0800 (PST)
Message-ID: <72619870-bf83-47f9-9b66-6678e245364c@redhat.com>
Date: Sat, 1 Mar 2025 12:36:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen
 Driver
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Bastien Nocera <hadess@hadess.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
 <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
 <CAOm6qnmYSQz_YVaWw1c-fMm3NCVV9MoQhLQ0XGzK9o2RybLHmw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOm6qnmYSQz_YVaWw1c-fMm3NCVV9MoQhLQ0XGzK9o2RybLHmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi WeiKang,

On 27-Feb-25 12:36 PM, Weikang Guo wrote:
> Hi, Hans
> 
> On Tue, 25 Feb 2025 at 20:09, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi WeiKang,
>>
>> On 25-Feb-25 3:04 AM, Weikang Guo wrote:
>>> Hi Bastien, Hans, Dmitry,
>>>
>>> I am currently working on the Ayaneo Flip DS device, which I installed Kali
>>> Linux with kernel version 6.8.11-amd. This device has two touchscreens,
>>> but only one is functional. After investigating, I found that the second
>>> touchscreen has the device ID GDIX1003(confirmed by exporting the results
>>> through acpidump), and upon comparing with the current driver, I noticed
>>> that only GDIX1001, GDIX1002, and GDX9110 are supported.
>>>
>>> I have also reviewed the ACPI description and can provide the details if
>>> needed. Any guidance or updates on this would be greatly appreciated.
>>
>> I think this might just work with the existing goodix driver, just
>> add the new GDIX1003 HID to the goodix_acpi_match table:
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index a3e8a51c9144..4b497540ed2d 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
>>  static const struct acpi_device_id goodix_acpi_match[] = {
>>         { "GDIX1001", 0 },
>>         { "GDIX1002", 0 },
>> +       { "GDIX1003", 0 },
>>         { "GDX9110", 0 },
>>         { }
>>  };
>>
>> Note I'm not sure this will work, but is worth a try.
>>
> 
> It works, thank you very much.

Thank you for testing.

I've submitted a patch upstream to add this new hardware-ID
to the kernel:

https://lore.kernel.org/linux-input/20250301113525.6997-1-hdegoede@redhat.com/

Regards,

Hans




