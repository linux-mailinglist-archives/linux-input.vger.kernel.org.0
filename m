Return-Path: <linux-input+bounces-5525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6F294F687
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 20:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57BE1F251A9
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 18:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8B1187870;
	Mon, 12 Aug 2024 18:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbTNrvQn"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755EE18787B
	for <linux-input@vger.kernel.org>; Mon, 12 Aug 2024 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723486772; cv=none; b=VnjZkE0NMOwnNcxBKzn8wF+C52OwA/YttO5iKTsA0PRf/0E/CRbfo42I5Kk0bQtqluIVMQY1uYeBnE7IVsDVN9dwJSnia14Q4LE+51YNZBwCX00EJIXmpeMxpuok8w0R7/+PG6GOGhhSrM/oLyAq2S1hbuMG2/fgb9WeACG9dJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723486772; c=relaxed/simple;
	bh=UNWN6v8LRr6MgLlcl1eYlm9ex07JvufVV8x0BSy0UYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAPbDV66JV5ViW0DUQw4Z9pIjAFBovecyvNqJXbNVrUkubSLkwnU5tAeDQpQ18tUcIT4jAmQZ4mmrVMAgbMFJlXleOPa/gM1KVttLhEyvdgJme4Zw0TzQU25IvhYTYFt8prWq+bBns3RlezPBetbLxBAsFNS143RheiR9pvsYEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbTNrvQn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGjBkRdEii3MabWinJrviRdaG1B1/+RoFDK1lY7spAo=;
	b=AbTNrvQnHf1Of7bZwAxix5GBPoSc3tJ5KZqLaBmKZ6KUa2YZ9zMRJ/tkydCvb5uzMOgqnt
	OrFAKYHbzfxcrFUBhBBeATOD8p0Dd0jp3Typn/+F3tgGOg/06ubZ9FQA2VehCtJAeyXm/C
	AgpozFwFI9yzFPMmikw2ClBlQFiA12U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-7VayaWnpP8m684txJ1woAA-1; Mon, 12 Aug 2024 14:18:27 -0400
X-MC-Unique: 7VayaWnpP8m684txJ1woAA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7d63fbf4afso471519566b.2
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2024 11:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486706; x=1724091506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGjBkRdEii3MabWinJrviRdaG1B1/+RoFDK1lY7spAo=;
        b=xJPzk7nxmLd5GwX+txAvwqPtsngMmyy09ZEAN2pozmjgMxGFMx4aEikBwPvposLA1L
         hP+4s7NCxjHDjSUEAKu7rNgqkgL7iSy1MN8TQFcVAzDfxZq0FGc7d9VWu4bKyReAjlQ2
         t8aSxJmT45QGE/CRXA29WRYqfqDVQxgp9S9xbLz/oEPGzwm4hD6q3RHOOBAb7ezHiUFT
         jWeI0922OIeJooWbn2eXt+NYsp36IQGI/gIyGyvzG3cvK3Swh3a+i/M6CrcVuWVuEMgb
         oqS8wdbVCHDlnXdUs5Vuf6zbtlLIFLud86WSL55XvrzahpccXJSWS3ShorKe4tAGFvPL
         t8tg==
X-Forwarded-Encrypted: i=1; AJvYcCXvZr8aYpyKV5qTIfFY+otFlmkTjH8XbkXtfvBAIht4B2AZhO2FSLVvvnoll6Y8eRXziqKQGlsfEuw85CE/xbUTuATf7oJbFTrtyug=
X-Gm-Message-State: AOJu0YxHMLeZN+qV6mPZo3v5LHc87AuaTF7HNhJlKv1eKKhuMCK66UXp
	WBxylucdOuo5wXj4beeKfJoKmmWEaNcpolOwmhFMJmWx7+24cGVFUBfMsRWCmMi14QARl8o4g/R
	Efc+Da55YPGtDgQ0QOz3hs0VEnfBl2DxfhaNmUb630njA8sDs9s2C0GcNOjpp
X-Received: by 2002:a17:906:bc24:b0:a7a:9447:3e8c with SMTP id a640c23a62f3a-a80ed1bcd95mr84952466b.3.1723486705909;
        Mon, 12 Aug 2024 11:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHtWszbYS7sCVbmsLaL3jKmkKeaLYh4FWst/8luFI92uXffwAUs+BR9bxDLdqCQzKMgW68Q==
X-Received: by 2002:a17:906:bc24:b0:a7a:9447:3e8c with SMTP id a640c23a62f3a-a80ed1bcd95mr84950566b.3.1723486705371;
        Mon, 12 Aug 2024 11:18:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb212fd9sm247516866b.151.2024.08.12.11.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 11:18:25 -0700 (PDT)
Message-ID: <2d5be262-3bfd-4b66-bee4-97c89a9a4707@redhat.com>
Date: Mon, 12 Aug 2024 20:18:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>,
 Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Jonathan Denose <jdenose@chromium.org>,
 stable@vger.kernel.org
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
 <ZrpFSnCQ0T4_7zAB@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZrpFSnCQ0T4_7zAB@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 8/12/24 7:24 PM, Dmitry Torokhov wrote:
> On Mon, Aug 12, 2024 at 04:41:50PM +0200, Hans de Goede wrote:
>> Hi Maxim,
>>
>> On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
>>> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
>>>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
>>>>> That means, userspace is not filtering out events upon receiving
>>>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
>>>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
>>>>> is weird. It maintains the touchpad state in firmware to light up the
>>>>> status LED, but the firmware doesn't do the actual touchpad disablement.
>>>>>
>>>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
>>>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
>>>>
>>>> Ack.
>>>>
>>>> So how about this instead:
>>>>
>>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>>>> index 1ace711f7442..b7fa06f793cb 100644
>>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>>>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>>>  	 */
>>>> -	if (priv->features.ctrl_ps2_aux_port)
>>>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
>>>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>>>  
>>>>  	/*
>>>>
>>>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
>>>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
>>>
>>> *Maxim
>>
>> Oops, sorry.
>>
>>> Just a heads-up, my Z570 now belongs to a family member, we'll test what
>>> you asked, but right now there is a btrfs corruption on that laptop that
>>> we need to fix first, it interferes with kernel compilation =/
>>
>> Note as discussed in another part of the thread the original bug report
>> actually was not on a Z570, so the whole usage of i8042_command() on
>> suspend/resume was a bit of a red herring. And the suspend/resume issue
>> has been fixed in another way in the mean time.
>>
>> So there really is no need to test this change anymore. At the moment
>> there are no planned changes to ideapad-laptop related to this.
> 
> I think we still need to stop ideapad-laptop poking into 8042,
> especially ahead of time.

I agree. I think your suggestion of using the new(ish) [un]inhibit
support in the input subsystem for this instead of poking at the i8042
is a good idea.

As I mentioned when you first suggested this, I guess this requires 2 things:

1. Some helper to find the struct input_dev for the input_dev related
   to the ps/2 aux port
2. In kernel API / functions to do inhibit/uninhibit
   (maybe these already exist?)

> If we do not want to wait for userspace to
> handle this properly, I wonder if we could not create an
> input_handler that would attach to the touchpad device and filter out
> all events coming from the touchpad if touchpad is supposed to be off.

I think using the inhibit stuff would be better no?

The biggest problems with trying to fix this are:

1. Finding time to work on this
2. Finding someone willing to test the patches

Finding the time is going to be an issue for me since the i8042_command()
calls are only still done on a single model laptop (using a DMI quirk)
inside ideapad-laptop now, so this is pretty low priority IMHO. Which
in practice means that I will simply never get around to this, sorry...

Regards,

Hans



