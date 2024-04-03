Return-Path: <linux-input+bounces-2802-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C318971B3
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 15:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E949E1C25865
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 13:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69B4149018;
	Wed,  3 Apr 2024 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sj+17mbF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1F148FE1
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712152463; cv=none; b=hexCBf/IPXJ87o7QH/EYpqf67GAFOAxNpJFyFtyjjOUsnq/tabsWzTcy10Y3T6HjCOlLHq3pSWPdj/PZvOrIzvHfdosjnRnQ4C7kaU6WXQz2zxhFkkawMWNW2mklu7g3S5ZJs2gF4mLpWViE1/VOXNtrKU0Baxz1Y1y0duo0HGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712152463; c=relaxed/simple;
	bh=RXLoHtHrC8ukxZ2Y2WmnZ8gQy73qnQHVXwwhcK8X7kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJSuVWrUraNbCrnBa0vKm0TGxsqEgqNIcIqDBhZLFJzRCFRbjRF/KPEHzioYyYIlkXeOVG6cqBJHUxFoQZpXrgPhqmzgOhoqkr0GnKs9y7S4OBN9ML5EHXg75wJR8DsUsF60l/FahZmEcoGwueGholo+ZXNIrDHFTDo/kror58U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sj+17mbF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712152460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSiIi4jwkenKcpEhgfsqYcfzBPgshw2+qM6tAw1FbuA=;
	b=Sj+17mbFVdM6oTvirH+5pA7qFlkKuuWsgokWLwyu8hgfmLBv2mDCoDUpVgtd20rWnaBewI
	PHLQ3eJ0mIUsyMArS012WyW95oz7tEs1D4R1jEsBzr8ugWFSpNLp/8Zen/sCjHbByAiCKy
	ALwpxCDXBdv31P+SRyB4PLkDXgkpvUw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-ihgnMESsOoqzwSLfICYIzw-1; Wed, 03 Apr 2024 09:54:19 -0400
X-MC-Unique: ihgnMESsOoqzwSLfICYIzw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4d8e5d6722so455042066b.0
        for <linux-input@vger.kernel.org>; Wed, 03 Apr 2024 06:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152457; x=1712757257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSiIi4jwkenKcpEhgfsqYcfzBPgshw2+qM6tAw1FbuA=;
        b=pR19kq9rc44H/Q3urwHnFmZsXmuhva2pAfrMI58rzjZBqIRyZViGzLZ785xdC6xHk9
         9n9tn/ngKv/RPsSCsIoe5oowlWqK8jmHJFH/PPkStvAIpiqczDWYBsupuxXKPPg9Igdn
         pusRvg5V77BC4/hQ7QeLtTd64bXvAGcBXoEOaObgSUS2Aqg96THlv1Z5n7CyBGUkHby6
         ZV3NOlPhoqYyyD1Hn4lYpWrQQDDnz3RCYyR4VIMnfTAkV+3rzmBCkGJYC4lOCj6gdfbN
         47KmXWeQxuBtWOILPsi4BgSKbDuQVn+Sli01IbRLMLLi2nCkxDDTSZ5SpkL9ExDs1w3P
         iUEw==
X-Forwarded-Encrypted: i=1; AJvYcCXHOj2Q/DPFd6oWqm94VA28px0IkwEcDyA9OCqINj9grDVnryfj3OYDro/7Gv+w/UrHfzMIpNtsO27rnqkXZqVif9ZKK872yUd0WUY=
X-Gm-Message-State: AOJu0YwnczF5dsb96Veo/aOoPxsEAj74xFSPhXswzdaHoGaOuwChvNsw
	SWlXd5ibrvmBzGBOafk6tU8akis5Z783x80mC97UB0xI0An3HER8gRoIvcGef77ATs0PDXS0sA4
	WUKaNjxCt7tcw6iZ1PPcAmmsvi/bnmuNaxqNsSxW+w5XdT4aGZyyC/QX7C7E0LFsKjzN4
X-Received: by 2002:a17:906:6092:b0:a4e:15f9:f167 with SMTP id t18-20020a170906609200b00a4e15f9f167mr9002778ejj.11.1712152457643;
        Wed, 03 Apr 2024 06:54:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoSOvPZGC5BbyN89YHOc2mvItFoWzIrM+d3N35txLH/zQGfd0P54JGQmzF7146oTQlRm28Qg==
X-Received: by 2002:a17:906:6092:b0:a4e:15f9:f167 with SMTP id t18-20020a170906609200b00a4e15f9f167mr9002768ejj.11.1712152457303;
        Wed, 03 Apr 2024 06:54:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x15-20020a170906710f00b00a46cc48ab13sm7769314ejj.62.2024.04.03.06.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 06:54:16 -0700 (PDT)
Message-ID: <7e34dc43-b70b-4a50-86fd-f021f2de4845@redhat.com>
Date: Wed, 3 Apr 2024 15:54:16 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: logitech-dj: allow mice to report multimedia
 keycodes
To: Jiri Kosina <jikos@kernel.org>, Yaraslau Furman <yaro330@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Lucas Zampieri <lzampier@redhat.com>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>,
 "open list:HID LOGITECH DRIVERS" <linux-input@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240130111700.11666-1-yaro330@gmail.com>
 <20240222101811.18921-1-yaro330@gmail.com>
 <nycvar.YFH.7.76.2404031337250.20263@cbobk.fhfr.pm>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <nycvar.YFH.7.76.2404031337250.20263@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 4/3/24 1:38 PM, Jiri Kosina wrote:
> On Thu, 22 Feb 2024, Yaraslau Furman wrote:
> 
>> Multimedia buttons can be bound to the mouse's extra keys in Windows application.
>> Let Linux receive those keycodes.
>>
>> Signed-off-by: Yaraslau Furman <yaro330@gmail.com>
>> ---
>>  drivers/hid/hid-logitech-dj.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
>> index e6a8b6d8eab7..3c3c497b6b91 100644
>> --- a/drivers/hid/hid-logitech-dj.c
>> +++ b/drivers/hid/hid-logitech-dj.c
>> @@ -965,9 +965,7 @@ static void logi_hidpp_dev_conn_notif_equad(struct hid_device *hdev,
>>  		}
>>  		break;
>>  	case REPORT_TYPE_MOUSE:
>> -		workitem->reports_supported |= STD_MOUSE | HIDPP;
>> -		if (djrcv_dev->type == recvr_type_mouse_only)
>> -			workitem->reports_supported |= MULTIMEDIA;
>> +		workitem->reports_supported |= STD_MOUSE | HIDPP | MULTIMEDIA;
>>  		break;
> 
> CCing Hans who introduced this explicit check back in 3ed224e273ac 
> ("HID: logitech-dj: Fix 064d:c52f receiver support").
> Should it be made device-specific?

Jiri, thank you for bringing this to my attention. If mice attached
to other receivers can send multi-media key presses too, then I believe
that dropping the if (djrcv_dev->type == recvr_type_mouse_only) check
is fine.

IOW, the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





