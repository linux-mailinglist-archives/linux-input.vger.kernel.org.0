Return-Path: <linux-input+bounces-5359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC069481D8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB2A1F2240C
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A21163AA7;
	Mon,  5 Aug 2024 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJsdPsHw"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626D161309
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722883254; cv=none; b=oZ/fyQFzqn0SBJuDWCYVXYQhBllzu/nK5Bl3AuqIp/A3rzb/+kLpz3DuiNEoy9DTOki+OiNdk9gpXib3DYm9wYI48n0x7woK4X5i1COP1ywolkBs0aymoCuTkuqqCrhFXBe6gqGLIxGVyhSI3DQRCGSdvMXmQQ0y1GWIPcAacbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722883254; c=relaxed/simple;
	bh=8eMSVy8TISGQC06xHVcaD5x3AWZBGKjgqO80ATHtsmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZY4Hs8TgEVZBIGFMOuWHKobvqmRHYGG6Hyz4Fs7d80YeGLq3P0mZf9+cdiAuRPAJn5XroFwpKyd+0KJPUUPmVEXEhdEUgZ1i+wq1n5W5ahP6LOoL/9ElzZSuBm0jh1mLGIijCEw5lZXzx43OVW4iwwEw7wr+8jYxdle7k9AT4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJsdPsHw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722883250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ9VlHNriNwXpz+dWmAI9BV5/C8X71VSt1kS9x7Tvmw=;
	b=CJsdPsHwLImzglAs+DidXYY2cGM5oS3MYTbP8BL+l3c+ope0GSIc0N1ArqXKjBtnF+PITO
	aZAAxWgP7Uaz3PSjjaOFOHbTYP0ohSW6nviOJQLamz9yVQCariYbDPAd7WPTYL9b1GG07C
	SR1igUUnB+UASYWpBAxiVII7iMemoYo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-VjF7FbJEMImyCrwYx9a_6A-1; Mon, 05 Aug 2024 14:40:49 -0400
X-MC-Unique: VjF7FbJEMImyCrwYx9a_6A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7a97665b8bso908406266b.2
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2024 11:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883248; x=1723488048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ9VlHNriNwXpz+dWmAI9BV5/C8X71VSt1kS9x7Tvmw=;
        b=cJtuFUuIo5Ie+hNk/VJcEYUaGa+IjDdgNKMUmaZBaomhRVOk11jFBWcieHOFni2XQT
         9/zUhQKu0luPIIt80FdmH+sN9a9MSzXD8xUZPiBiiANwwYOZYU+tCOZyjwv2HWoBjZIb
         5ZCAreoQ/bhaLbZnKT1eKTWuqycGLbO9vHua8nfF7zpvENmJvbeou0Qr35GhDElqmaHo
         hwYkeke30TZOyZKWRJ8OIumMsI1xmShHwp9lSG7OJJGbjuhgPfhwjud4BLSh6uJuZ6z8
         YEbpTsMezWHkG2pNi8spCU4uekuvpIFrs6C7awlWgwEAryxw9YtGkCnLr+/T270/Tvdh
         VjVw==
X-Forwarded-Encrypted: i=1; AJvYcCWCLlZBBPTdfe1FpOfLltNOllwE0g0YjTcvYHNUN26jDsOeS9sN/PEBZCaNMQJtYfJJTEgmEyJoPD8rAB9QeTxjCRu0o88mumjs1hs=
X-Gm-Message-State: AOJu0YyyYl4YrmKZx8VqOGSguL/cFQfsSCEGLSEB2+fMS0TOyldE+M7d
	YIe/cGPPM1izZCGTNDQbDaoVPylo+8d2l+eNYc8IavnQcli8DHrzZUxMDYJl60uOemy186ER5Nc
	McVHy9T4Z8BEsb3zteXne3Q09r3RPCi47Pm9tqfSzzVPyooiGuNgCtj41U0mpmxm6GxzJ
X-Received: by 2002:a17:906:f598:b0:a77:d52c:c42d with SMTP id a640c23a62f3a-a7dc4da6163mr777135766b.13.1722883247809;
        Mon, 05 Aug 2024 11:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbyNupPo0MwtzZVQpyUrp3cXOrDfNp5c4Md1gCWW9dENWu5y5zRpQaeRIEIjBHuXXLwiWMZw==
X-Received: by 2002:a17:906:f598:b0:a77:d52c:c42d with SMTP id a640c23a62f3a-a7dc4da6163mr777134166b.13.1722883247223;
        Mon, 05 Aug 2024 11:40:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83ec1sm477328966b.182.2024.08.05.11.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 11:40:46 -0700 (PDT)
Message-ID: <bb2a2e2f-3dd7-4774-9632-76c39bccfb02@redhat.com>
Date: Mon, 5 Aug 2024 20:40:46 +0200
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
 <ZrEFOepmMYoWfyHY@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZrEFOepmMYoWfyHY@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/5/24 7:00 PM, Dmitry Torokhov wrote:
> On Mon, Aug 05, 2024 at 05:45:19PM +0200, Hans de Goede wrote:
>> Hi Maxim,
>>
>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
>>> On Mon, 05 Aug 2024 at 16:16:08 +0200, Hans de Goede wrote:
>>>> Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
>>>> added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
>>>> the ideapad-laptop driver to suppress the touchpad events at the PS/2
>>>> AUX controller level.
>>>>
>>>> Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
>>>> port on/off on select models") limited this to only do this by default
>>>> on the IdeaPad Z570 to replace a growing list of models on which
>>>> the i8042_command() call was disabled by quirks because it was causing
>>>> issues.
>>>>
>>>> A recent report shows that this is causing issues even on the Z570 for
>>>> which it was originally added because it can happen on resume before
>>>> the i8042 controller's own resume() method has run:
>>>>
>>>> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
>>>> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
>>>> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
>>>> [   50.247406] i8042: [49434] a8 -> i8042 (command)
>>>> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
>>>> ...
>>>> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>>> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
>>>> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
>>>> ...
>>>> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
>>>> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
>>>> [   50.248407] i8042: [49435] aa -> i8042 (command)
>>>> [   50.248601] i8042: [49435] 00 <- i8042 (return)
>>>> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
>>>
>>> What exactly is the issue? Is it just a few errors in dmesg, or does
>>> 8042 stop responding completely?
>>
>> When this issue happens at resume the touchpad stops sending events
>> completely because the i8042 driver's resume() method fails and exits
>> early.
> 
> We actually retry up to 5 times so we usually get the right response
> from the controller. Additionally on x86 we do not abort
> initialization/resume even if controller selftest still fails after all
> the retries.
> 
>>
>>>
>>> I've seen something similar when I enabled the touchpad while moving the
>>> cursor, but it was just a matter of a few lines in dmesg and a protocol
>>> resync, both touchpad and keyboard worked after that.
>>
>> Right, the problem is that in this case the i8042's resume() method
>> is failing, which I believe causes the Elan ps/2 driver to not get
>> re-attached to the aux port on resume.
> 
> There's a69ce592cbe0 ("Input: elantech - fix touchpad state on resume
> for Lenovo N24") that sends disable/enable pair as part of Elan touchpad
> resume handling which unwedges the touchpad.
> 
>>
>>
>>>
>>>> Dmitry (input subsys maintainer) pointed out that just sending
>>>> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
>>>> already does should be sufficient and that it then is up to userspace
>>>> to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.
>>>
>>> I believe it's not the case (at least it wasn't back then). The whole
>>> point of my patch in the first place was to make touchpad toggle work
>>> properly on Z570.
>>>
>>> Userspace (GNOME) supports two variants of hardware:
>>>
>>> 1. Laptops that disable touchpad themselves and send out
>>> KEY_TOUCHPAD_ON/OFF to report the status. Upon receiving these keycodes,
>>> GNOME just shows the status pop-up and relies on firmware to disable the
>>> touchpad.
>>>
>>> 2. Laptops that just send KEY_TOUCHPAD_TOGGLE whenever the key is
>>> pressed. GNOME maintains its own touchpad state and disables it in
>>> software (as well as showing the pop-up).
>>
>> You're right I had forgotten about this. There is really no reason
>> why GNOME cannot also suppress events after a TOUCHPAD_OFF event,
>> but atm it indeed does not do this. We could fix this by patching:
>> plugins/media-keys/gsd-media-keys-manager.c of gnome-settings-daemon
>> to also update the TOUCHPAD_ENABLED_KEY setting when receiving
>> KEY_TOUCHPAD_ON/OFF. Something which I think we should do to,
>> but that will not help solve this bug since we cannot rely
>> on users having a fixed g-s-d.
>>
>> So: self-NACK for this patch. (which is a bummer because I really
>> liked being able to just remove this)
>>
>>> That means, userspace is not filtering out events upon receiving
>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
>>> is weird. It maintains the touchpad state in firmware to light up the
>>> status LED, but the firmware doesn't do the actual touchpad disablement.
>>>
>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> 
> Still, poking the touchpad directly at a random time is not something
> that we should be doing. The command may come in the middle of touchpad
> initialization or in the middle of resuming, or at another inopportune
> moment - as you mentioned yourself toggling while using the touchpad
> results in a spew in dmesg.
> 
> We have "inhibit/uninhibit" sysfs controls that allow suppressing input
> events form a device, they should be used instead.

Using those indeed would be better, I guess this requires 2 things:

1. Some helper to find the struct input_dev for the input_dev related
   to the ps/2 aux port
2. In kernel API / functions to do inhibit/uninhibit
   (maybe these already exist?)

Anyways I have to focus on camera stuff for the rest of this week,
so lets continue this discussion next week.

Regards,

Hans



