Return-Path: <linux-input+bounces-5519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00694EFD6
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 16:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B6C61C21FEC
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 14:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC591836E2;
	Mon, 12 Aug 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SW/KMQzA"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66098183092
	for <linux-input@vger.kernel.org>; Mon, 12 Aug 2024 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473716; cv=none; b=gShTBJLQ/SgZ7o+jYCbFepB3xjVgSceJyGZVqQWWAUx2yi0zpoSq/JRf5OeV/IDXcNywELO5IzFjlHVXYuxy6xC9f6fkjZn6HZB8sSlRZI+NvmlbKKB1zLxhcwNlNvWsLP/ht8NNWgJmPPHiaiiasDcuidMfCAWBXQIU9tL0+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473716; c=relaxed/simple;
	bh=AI6spKZhz4JWrlNyXuIgItaquR7eJd+58DceIHTXTs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGg6flluoeq66lOu1ZcioDrBKSMzPouYntWscZ1pLT9QOtL3rgT4CUmfz/QVivdEopziuiA9o9tPRLv8Tum+S8A1PNaz5CJvHf8QOasE/plWtp8nWcCFr4uApQj1AjrSS2doJ5yqJPNwf2l7AwYem+MRym2VUplDd3lMvyGf9Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SW/KMQzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723473714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7/View+4l3ph9qWoSqlnR+2ecSNu4xsS9euEQ7PTY=;
	b=SW/KMQzAQtBNr7p96aBYu4Q4d6aGOuVO3V1CKErG/Fckxb57BRu7ltgBlsnuAnFkjEcmEl
	gfJ2HLQWiSwndxZHrfmqh6sLGpSt+0ZWfssZXk0KmXtLgT8/7z2Upo0cPbdzc157c/KZMg
	pfrqGDQjnIPbkcUW7WuTLgtEXdom9HE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-H9GdijpwOSOkvlV9VsgTZg-1; Mon, 12 Aug 2024 10:41:52 -0400
X-MC-Unique: H9GdijpwOSOkvlV9VsgTZg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5af786d643aso3993296a12.3
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2024 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723473712; x=1724078512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct7/View+4l3ph9qWoSqlnR+2ecSNu4xsS9euEQ7PTY=;
        b=IYqyV7zb9dK6GY7ul9zms6EpDZuw0w/gRrLaFv4OSinMuApuW74YKxYa8Y6XFjrHby
         65WKAMq7u7Rxxg5OfcTGE61LrmCxE/x+EQNGq12K0UYdL0eGKs1Y8hNncCZ68HuYkfbY
         CcBhyLSoCAOfsHCcB7pf9s+DJ66qT4QYnd/xjs7Q7ZQV2AXqBMuFjsz4GYwt99LXVhS+
         GBL40BKmPnacU0N0CUHKEquKQ6IZ0FrfaC0len7oAQ2jP+i7hkMwDf++uHWoYJoGCR49
         yynRykT2TfIIqi7reYt68X4vpjedxYMCz4TXmEyrU188/6LgGwuBhyNW8wXQPrInRs6l
         kwyw==
X-Forwarded-Encrypted: i=1; AJvYcCU6YfuuknQoXFmv1iLACdYeCeJ8gQ8/mbS76FPKnYsTlZfXDDWOvMl7/UXIPovK/Dmd514KrIxiZ7P6mZ86BnXb0psbYtBZsV/858s=
X-Gm-Message-State: AOJu0Yxke7asmcJrBBQfQ0NL5+No3NBd3arkFBKQ5Yvqd1xYOvHzY+rZ
	Ahoahtnth+rKK0YUUOxqh/wcQAQjW06tmce6Oc9tZrYh+9vhW32i1JP0zhIs1ONBT1Fm6Oa6kh4
	sgDgNPyJSRrYK0hEMeaAB5a1I+UAvCSqMpDB4y0RFfsgEQV3nai9vPH3aTMhV
X-Received: by 2002:a17:906:7953:b0:a7d:4dc4:3d8 with SMTP id a640c23a62f3a-a80ed2cc78amr32944466b.54.1723473711659;
        Mon, 12 Aug 2024 07:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pYDoPxHKF0JtU+KsXm6QfsnfgvBOvGxMFko4h6mu7vuViWNqYCE9tPtEA3SMKi5lL4X/DA==
X-Received: by 2002:a17:906:7953:b0:a7d:4dc4:3d8 with SMTP id a640c23a62f3a-a80ed2cc78amr32943066b.54.1723473711186;
        Mon, 12 Aug 2024 07:41:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb213782sm234549566b.156.2024.08.12.07.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 07:41:50 -0700 (PDT)
Message-ID: <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
Date: Mon, 12 Aug 2024 16:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Jonathan Denose <jdenose@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, stable@vger.kernel.org
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZroaE5Q6OdGe6ewz@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxim,

On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
>>> That means, userspace is not filtering out events upon receiving
>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
>>> is weird. It maintains the touchpad state in firmware to light up the
>>> status LED, but the firmware doesn't do the actual touchpad disablement.
>>>
>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
>>
>> Ack.
>>
>> So how about this instead:
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index 1ace711f7442..b7fa06f793cb 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>  	 */
>> -	if (priv->features.ctrl_ps2_aux_port)
>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>  
>>  	/*
>>
>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> 
> *Maxim

Oops, sorry.

> Just a heads-up, my Z570 now belongs to a family member, we'll test what
> you asked, but right now there is a btrfs corruption on that laptop that
> we need to fix first, it interferes with kernel compilation =/

Note as discussed in another part of the thread the original bug report
actually was not on a Z570, so the whole usage of i8042_command() on
suspend/resume was a bit of a red herring. And the suspend/resume issue
has been fixed in another way in the mean time.

So there really is no need to test this change anymore. At the moment
there are no planned changes to ideapad-laptop related to this.

Good luck with the BTRFS problem.

Regards,

Hans



