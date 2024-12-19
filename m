Return-Path: <linux-input+bounces-8686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C49F8339
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 19:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 913011690B6
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 18:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F331A3BDE;
	Thu, 19 Dec 2024 18:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fd7W7EIs"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618341A2846
	for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734632786; cv=none; b=guGNxhBEAtiwsPZzIVG/jncqynMN2l/RDhz1pdYnfr3A80F1mu6Pq495vZsmD29ECDAF38SRIrYGOh6v5Kr6pHIasw9Nfsr+sgck8Gw1TO9gv3wl9d6pqKgFK3IgFfxo3d2/uMObJTeCM3oAo5d93Uhd9CaExVyjd/VSLhgqnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734632786; c=relaxed/simple;
	bh=izWRPMagB7uPpT03gOm6w+msGz3WHQaRwy4vQFEE+kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO3dKICB7OXCyZGTz2GnAszXA7cA7pxZ860XgtuiWRQdEkHqpUnrwOFUyPkUvjG8ml83MyaHKtENFmnjxsdSUJkyCwdiGWXbit3GxwrLXUzV7DiNIkSItVD+UENdnEEXYykDV5/jPm/BCoovlE6p5IbFOERTdJHJ1LnH5XoaF1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fd7W7EIs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734632783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVz/LdA6aJTxZBS3UuCN9UPs5TtvdmxtE7Uv/fAQ2Zg=;
	b=Fd7W7EIsnBsQL3FCOpeL7TGc/sCSLL3jDwJgRLdoDcf8n/FqY7B7llci2SiZrirbdnbP7U
	jGEKs/PsgSoNXYj97Iweu1TOlaoQDq1IEx+LP1WJq57r/Iz3xFM7UHMTmk5No6XmzVnwJ0
	w2KsMatEw2aqJyM3YUg5lZ9b9WKgqgs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-O2pPczhTPoaQh_RxWmU24Q-1; Thu, 19 Dec 2024 13:26:22 -0500
X-MC-Unique: O2pPczhTPoaQh_RxWmU24Q-1
X-Mimecast-MFC-AGG-ID: O2pPczhTPoaQh_RxWmU24Q
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aabf8e856e2so114011966b.0
        for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 10:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734632781; x=1735237581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FVz/LdA6aJTxZBS3UuCN9UPs5TtvdmxtE7Uv/fAQ2Zg=;
        b=FTA3E6rBEXiMMR0SGR8tm3gzTJ9U60v5DctYP5FIkMuI/MEcHMYa6lZmwNJL4QH29i
         FgPnNymJRNYByoDvia7zscD3eGUYBD5zx2mkb2CDipjecDOhPCJ97bwAcKjlwXYmfaO8
         2p69JxtVmJjeGMZJmOEZ8udlp70AkaAY2SRedzCdyurEMQkQksRHhJ/dqdW+i2SvaKey
         Yo+LkCAFZSeFO9+nMjRc/YRtiAzDljsX0HLC9gMiU8bglpu4qqDr8lOST4WHQtt9yLXU
         mlV6AaTGg07g9VmcuLKojtOzE1AvvjIgSnXuiRA0LQj6zUdSrWdp++dY8lRsIP0iZNR0
         0Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCX8I6NqsbbmHoG4kqQH5pwZOAGela1xzrKPqy3dVp9gpJ6qCE5S4i1yhJd6f9WHHOOMqm4C+jnt9CqdBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0EfS3evxo8xJpbu3YbPkoMhiyd3Hm3fhLrinjuxk/4XxtRu6
	XBv8W+Ff4eMX2X2yrIXf52EJP1RYRGmN2P/YNlCr7+wbY0CTbAP59xtJGgb96FmiNokbfdNrkzg
	P1bU/Tl4duYDaqoLYRa1msxZLdHT5peTLnd18XHKHUom0vV24aATCGed8ewn3
X-Gm-Gg: ASbGnctWmet6bB0YxDdGUh8tZorG2B83XNKukFegnZH7NNUKjGnRUeJ/TkKdc5oIxpd
	7BhCsMkPoYTmOt+r4SGZ1Cw0j5dnH7hGdYeU7oY9dhVMlRHlPCTRz9BdEw3ZDkMdme1rk/q5SvD
	AwNs4QqDmStBviWtaUPD+5fz1yiefetp9N69wLW/Hi2u+WIhP611dHwRP6XSlOZ3hL/6pFNkOrm
	P6Y44Lf51drpYMqwL3FvcF/djb/PBkEeDlv4Tb4IcLFYAl6T9muRt1Civ2meh4uQrwA5Y7b6Acs
	9ZkTafxELVA9Mx2Mwt5mPZlbkCbhDLmmAt7eJdUYa8oCy6S6Y5Q4Xq9ryciRRN6huCRrse7Krsm
	mCrQHLIZZMoiX/Fun4Yvw4ypLdXIBcIo=
X-Received: by 2002:a17:906:3184:b0:aa6:a21b:2aa with SMTP id a640c23a62f3a-aabf47177edmr614749466b.12.1734632780777;
        Thu, 19 Dec 2024 10:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZYxHGKMcEb8/1hDYG8Qs/s9nCWO6i9J/gzZhpRNgA6JsR9U78DHUeIW2hjL60LKmyfrdmzA==
X-Received: by 2002:a17:906:3184:b0:aa6:a21b:2aa with SMTP id a640c23a62f3a-aabf47177edmr614747466b.12.1734632780266;
        Thu, 19 Dec 2024 10:26:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895372sm91316466b.58.2024.12.19.10.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:26:19 -0800 (PST)
Message-ID: <25e87314-4524-495f-8313-1c318a8170eb@redhat.com>
Date: Thu, 19 Dec 2024 19:26:19 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Hutterer <peter.hutterer@redhat.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
 <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
 <Z2Ri3cuiRYDap2f6@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z2Ri3cuiRYDap2f6@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Dec-24 7:15 PM, Dmitry Torokhov wrote:
> Hi,
> 
> On Thu, Dec 19, 2024 at 05:01:09PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> Really +Cc Peter Hutterer this time.
>>
>> On 19-Dec-24 4:48 PM, Mark Pearson wrote:
>>> Hi Hans
>>>
>>> On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
>>>> +Cc Peter Hutterer
>>>
>>> My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)
>>
>> Except I forgot to actually add Peter...
>>
>>>> Hi Mark,
>>>>
>>>> Thank you for your patch.
>>>>
>>>> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
>>>>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
>>>>> generates is not mapped.
>>>>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
>>>>> the expected value for copilot.
>>>>>
>>>>> Tested on T14s G6 AMD.
>>>>> I've had reports from other users that their ThinkBooks are using the same
>>>>> scancode.
>>>>
>>>> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
>>>> there are 2 issues with this approach:
>>>>
>>>> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
>>>>    XF86TouchpadOff as F20 - F23 where repurposed to
>>>>    TouchPad on/off/toggle / micmute to work around X11
>>>>    not allowing key-codes > 247.
>>>>
>>>>    We are actually working on removing this X11 workaround
>>>>    to make F20-F23 available as normal key-codes again
>>>>    for keyboards which actually have such keys.
>>>>
>>>> 2. There are some keyboards which have an actual F23 key
>>>>    and mapping the co-pilot key to that and then having
>>>>    desktop environments grow default keybindings on top
>>>>    of that will basically mean clobbering the F23 key or
>>>>    at least making it harder to use.
>>>>
>>>> I think was is necessary instead is to add a new
>>>> KEY_COPILOT to include/uapi/linux/input-event-codes.h
>>>> and use that instead.
> 
> We have discussed this with Peter and came to the conclusion that
> KEY_ASSISTANT should cover this use case.
> 
> Also, this tweak should go into udev rules (/lib/udev/hwdb.d/60-keyboard.hwdb)
> instead of adding a vendor-specific tweak to the main atkbd table.
> 
> For the future releases you may want to add "linux,keymap" device
> property to your ACPI/DSDT to control the scancode->keycode mapping when
> Linux is running.
> 
>>>
>>> Sorry, should have been clearer in the commit message.
>>> I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
>>>
>>> Somewhere I had a MS page...but this Tom's HW page mentions it:
>>> https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
>>>
>>> I'll see if I can find something more formal.
>>>
>>>>
>>>> Peter, I thought I read somewhere that you were looking
>>>> into mapping the copilot key to a new  KEY_COPILOT evdev
>>>> key for some other keyboards?
>>>>
>>>
>>> Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.
>>
>> So I guess I got caught off guard by your commit message
>> which suggests that only scancode 0x6e is generated.
>>
>> If indeed a left-shift + Windows/Meta key + 0x6e combination
>> is send them this is a different story, since indeed we
>> cannot filter on that in the kernel. Although sometimes
>> I wonder if we should because we are seeing similar things
>> where left-shift + Windows/Meta key + xxxx is send for
>> e.g. touchpad on/off toggle.
>>
>> To workaround this atm GNOME listens for XF86TouchpadToggle
>> as well as shift + meta + XF86TouchpadToggle, theoretically it
>> would be nice if we can recognize these special key-combos at
>> a lower level. But thinking about this that is nasty, because
>> then we would get an event sequence like this:
>>
>> Report shift pressed
>> Report meta pressed
> 
> No, you have to delay to see if it is real press or part of sequence.
> 
>> <oops special key, release them>
>> Report meta released
>> Report shift released
>> Report KEY_TOUCHPAD_TOGGLE
>> <and what do we do with the modifiers now?
>>  for correctness I guess we report them
>>  as pressed again until the hw reports them released>
>> Report shift pressed
>> Report meta pressed
>> <hw releases the fake modifiers>
>> Report meta released
>> Report shift released
>>
>> So yeah handling this in the kernel is not going to be pretty.
> 
> Yes, we have a form of this in drivers/tty/sysrq.c and it indeed is not
> pretty.
> 
>>
>> So I think your right and just mapping this to F23 is probably
>> best, but I would like to hear what Peter thinks first.
> 
> So vendor yet again encoded a shortcut sequence into firmware,
> beautiful. I guess you can try to install a 8042 filter
> (via i8042_add_filter()) in drivers/platform/x86/lenovo-<something>.c
> to monitor for this specific scancode sequence and replace it with
> something else (through an auxiliary input device). 

If we want to filter out these in essence fake modifier
events then this needs to be done at some core level,
because AFAIK the shift + meta + F23 key-combo is what
microsoft is telling OEMs to use, so we are going to see this on
laptops from all vendors including whitelabel laptops.

Regards,

Hans



