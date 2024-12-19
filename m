Return-Path: <linux-input+bounces-8672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F499F7EC5
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 17:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD6016E7CE
	for <lists+linux-input@lfdr.de>; Thu, 19 Dec 2024 16:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6E522578A;
	Thu, 19 Dec 2024 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JQhfvjPH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B437F156968
	for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 16:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624077; cv=none; b=WNnEQEM904nD08mEUUvbzj4fmP0WZvm/JQ5HBA7j6Q2ijJJ0xP/9SyATL5g/x82EiUfOvWBmqTv692YSaHMcyybzOMPonlXztPdZlOhBf4PKpjRg8OY9l9uwv0nb/B98jCwffSRMdlt12vXStximmlkh1CYi1d1L5lPslpZyvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624077; c=relaxed/simple;
	bh=gkBSIvlclYZebUHa0tU3uN0hiPeBegG6xbDwB+KmSyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9zsiSR7AUy30PDeOxMQDqA924cSvej77v0Mngpm2GgqS/9MJmXzEgW+R+NWTpEJCv1QValoVXDDD1IIZJS4sPZuZdlmX+wI6OMQeqDV7GqMmbbxDr9wCqL/Ti+7nnYHvvcNZNyL8F3b35TTk8eiKz3fFE17ArWvbhyCaDu2wwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JQhfvjPH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734624074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3PS97DWanpLVn11jCVp26zYmWP/CARzArjE++9wPOCY=;
	b=JQhfvjPH4vJbRnXL2ntfO8EAmxyp3aNFhhXXSd2nMiT9fDMf4EI40jS8rqY2ttg6LIP5pf
	E/8hFPfxNrqjT1Mg2Fvwoui/EIwQZDpSuEaUIj8FsThINAx9zV2Jr5D+3v9gEgS7J/DHNq
	/PDMx1ZJte2rmZTQIv/H3IaZyD9ZkNM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-VMUNGaoRN3SIid3NghDlUA-1; Thu, 19 Dec 2024 11:01:13 -0500
X-MC-Unique: VMUNGaoRN3SIid3NghDlUA-1
X-Mimecast-MFC-AGG-ID: VMUNGaoRN3SIid3NghDlUA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa66f6ce6bfso70768666b.2
        for <linux-input@vger.kernel.org>; Thu, 19 Dec 2024 08:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624072; x=1735228872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PS97DWanpLVn11jCVp26zYmWP/CARzArjE++9wPOCY=;
        b=Ayu/tiQq/78kgT4WWg3lT2pv7uvpJ/qhexxOONPnUwvQZl6M91IibCjdpsl7kYdZtn
         pkp2sFmMpq4M024+cHAvs36NQnD6LjbcPFMfcUZm2vXkvvoWoua1vgKq+Of2LoAwKNCL
         Eg0lnVStXMHfGXwyL+Cp4a+X1E5ktFEAhmM4BMEXOhaCa74D3mibxHehC9EZyAebuLF7
         j+1EDAZprmJq8WhBBAZouEqk0gwkbxua4C/Ne7Fn7PolswkI6dGDsSZpyC/4+oq3zyS+
         FKpj8Nc3T7/NN+iP4l2KHPt4ZUk+0PdAY9uj2cAOsf06EsJh1Df4xyzykmRXKhqElLEZ
         /Nig==
X-Forwarded-Encrypted: i=1; AJvYcCUELhVX8ncxdbPbNXflXU4jzf9jUmdjCGMB/8r2hPaXZrIBv+VkXGakNNEmICs3lU4gFi5z4QXPEYKG8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7EMdmADe4d47aVk1sIiXjraP/N0T/o93VMvKzw47yM4sqB2xu
	tYHmOR0FALznJIlYTPZQEj2MKaVrToUubqNQkvcp2SAOocRAzDX9SoOoZZx8h2Ig7E8ml/p9RIM
	Yc0CAdGsKITG1G/nz4OSKLOs9USObbMjHoew0SfimZFgCcaxceuk3XGP7UMxk
X-Gm-Gg: ASbGnctkHkB6j781doQkQbARIKZI6FnFFdaqeeWzwJOd+S//ih6iNT01/6lMsjStvS/
	mILoREff705H8sUFD1kb63FXKuNnx4TWqjwTKzXwGKbOiDqw0r7dAmwznZb1DM2idn6kwn+/yPp
	pBhNFjLtx9/XoAze0HE/YlRXzdiD6ZEguJrXxlQJ+NWTBEIoAJfHkXOmbLuuOYJIbWlAV6GfgMf
	5ysDa+2RIAqfvkYGJCa58+nNpjRjNpGiFBbeMiK0HUEVYy/TVQXx3chG4ZsWAUgCGhBsR8O0M26
	88dMqjs1OJ2YIo9sVJQjKsEEcHY6A+fz2KesDyOshUFIPRkZRO0gLYrNLamwZ0NOu/VDfDolcig
	AU20x5vvn1fK3E1y5kaQq5fTYJ/tXkCA=
X-Received: by 2002:a17:907:6d04:b0:aa6:7165:504b with SMTP id a640c23a62f3a-aabf47c376emr675077266b.31.1734624071677;
        Thu, 19 Dec 2024 08:01:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWK5Zs0c5IaL27lseAapqHv3hKyzVy90SNMnVdQE9HllRYJ4+XMEhTIGAwuV3H43UWZyzZYQ==
X-Received: by 2002:a17:907:6d04:b0:aa6:7165:504b with SMTP id a640c23a62f3a-aabf47c376emr675068366b.31.1734624070995;
        Thu, 19 Dec 2024 08:01:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e98f6bcsm78952866b.77.2024.12.19.08.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:01:10 -0800 (PST)
Message-ID: <877c1672-744a-473f-a4dd-45fd10cfee11@redhat.com>
Date: Thu, 19 Dec 2024 17:01:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atkbd: Fix so copilot key generates F23 keycode
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Hutterer <peter.hutterer@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20241219151910.14235-1-mpearson-lenovo@squebb.ca>
 <d2a2abe2-0739-4277-8803-73220be6fc3a@redhat.com>
 <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <223e3b07-365c-436e-9439-25cd3a490e5e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Really +Cc Peter Hutterer this time.

On 19-Dec-24 4:48 PM, Mark Pearson wrote:
> Hi Hans
> 
> On Thu, Dec 19, 2024, at 10:28 AM, Hans de Goede wrote:
>> +Cc Peter Hutterer
> 
> My bad - I've been discussing this with Peter and should have added him. Thanks for including (sorry Peter!)

Except I forgot to actually add Peter...

>> Hi Mark,
>>
>> Thank you for your patch.
>>
>> On 19-Dec-24 4:18 PM, Mark Pearson wrote:
>>> The copilot key on Lenovo laptops doesn't work as scancode 0x6e, which it
>>> generates is not mapped.
>>> This change lets scancode 0x6e generate keycode 193 (F23 key) which is
>>> the expected value for copilot.
>>>
>>> Tested on T14s G6 AMD.
>>> I've had reports from other users that their ThinkBooks are using the same
>>> scancode.
>>
>> Hmm, I'm not sure mapping this to KEY_F23 is the right thing to do,
>> there are 2 issues with this approach:
>>
>> 1. /usr/share/X11/xkb/symbols/inet currently maps this to
>>    XF86TouchpadOff as F20 - F23 where repurposed to
>>    TouchPad on/off/toggle / micmute to work around X11
>>    not allowing key-codes > 247.
>>
>>    We are actually working on removing this X11 workaround
>>    to make F20-F23 available as normal key-codes again
>>    for keyboards which actually have such keys.
>>
>> 2. There are some keyboards which have an actual F23 key
>>    and mapping the co-pilot key to that and then having
>>    desktop environments grow default keybindings on top
>>    of that will basically mean clobbering the F23 key or
>>    at least making it harder to use.
>>
>> I think was is necessary instead is to add a new
>> KEY_COPILOT to include/uapi/linux/input-event-codes.h
>> and use that instead.
> 
> Sorry, should have been clearer in the commit message.
> I'm doing this just on the Microsoft spec. The co-pilot key is left-shift, Windows/Meta key, F23. Weird combo I know....
> 
> Somewhere I had a MS page...but this Tom's HW page mentions it:
> https://www.tomshardware.com/software/windows/windows-copilot-key-is-secretly-from-the-ibm-era-but-you-can-remap-it-with-the-right-tools
> 
> I'll see if I can find something more formal.
> 
>>
>> Peter, I thought I read somewhere that you were looking
>> into mapping the copilot key to a new  KEY_COPILOT evdev
>> key for some other keyboards?
>>
> 
> Wouldn't this require the kernel catching all three key events and doing the interpretation? I have no idea how this would be done or if it makes sense.

So I guess I got caught off guard by your commit message
which suggests that only scancode 0x6e is generated.

If indeed a left-shift + Windows/Meta key + 0x6e combination
is send them this is a different story, since indeed we
cannot filter on that in the kernel. Although sometimes
I wonder if we should because we are seeing similar things
where left-shift + Windows/Meta key + xxxx is send for
e.g. touchpad on/off toggle.

To workaround this atm GNOME listens for XF86TouchpadToggle
as well as shift + meta + XF86TouchpadToggle, theoretically it
would be nice if we can recognize these special key-combos at
a lower level. But thinking about this that is nasty, because
then we would get an event sequence like this:

Report shift pressed
Report meta pressed
<oops special key, release them>
Report meta released
Report shift released
Report KEY_TOUCHPAD_TOGGLE
<and what do we do with the modifiers now?
 for correctness I guess we report them
 as pressed again until the hw reports them released>
Report shift pressed
Report meta pressed
<hw releases the fake modifiers>
Report meta released
Report shift released

So yeah handling this in the kernel is not going to be pretty.

So I think your right and just mapping this to F23 is probably
best, but I would like to hear what Peter thinks first.

Regards,

Hans




>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> ---
>>>  drivers/input/keyboard/atkbd.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>> index 5855d4fc6e6a..f7b08b359c9c 100644
>>> --- a/drivers/input/keyboard/atkbd.c
>>> +++ b/drivers/input/keyboard/atkbd.c
>>> @@ -89,7 +89,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>  	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>>  	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>>>  	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>> -	  0, 89, 40,  0, 26, 13,  0,  0, 58, 54, 28, 27,  0, 43,  0, 85,
>>> +	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>>  	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>  	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>>>
> 


