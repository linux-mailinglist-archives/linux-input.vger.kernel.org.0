Return-Path: <linux-input+bounces-2507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A388A8E5
	for <lists+linux-input@lfdr.de>; Mon, 25 Mar 2024 17:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98B721FA1604
	for <lists+linux-input@lfdr.de>; Mon, 25 Mar 2024 16:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43264DA0C;
	Mon, 25 Mar 2024 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5roYG+g"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAF12E1CE
	for <linux-input@vger.kernel.org>; Mon, 25 Mar 2024 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376287; cv=none; b=I7LkGW7l1mIVbAQ6ePns31laMllS6a9M85d8zXyId8lY0Qo0ZC5sSSjnkZKas5EIjfN89rj+3iNuGmi2X72tG3L9E0o5VgHGHxbGMnS10OamNtCzm+3djqJl1jos0EpsE0aYBOY/opPhMOvqkIUigYp/4/UmXOKhL78M0stkTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376287; c=relaxed/simple;
	bh=/pJ9Tz+VL0u78yYSyiX5nSimANGSN3eigRcOOer8uWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Av4EmUoK+lLZ/88tOmiwJhBi/rkmVYgwk6Z1wtYcfK71i2EEdSgotYs+VySN0R7FOPrvonMq33sbQpWNPH3pFxw826Oykahy7PcpVX76lUAu2OciLi6ZlX2Lmmwf2cob8tvJ81L9wXEb/uVpLhpMxXGVdxCi1z11B/FzV1O1a98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b5roYG+g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711376285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNtX5yAkkt8k9VBgHWUC/ykg5bc+/xilFSnEjQF3IZA=;
	b=b5roYG+gbWD7nHzK7/GXLBHm1uqv1wi+4yThIgVYVNFSVJTRap3ZWCsQoK/V+TOkrwpsmj
	3i6Asyarxq1bV/FgLdZcCQenVvljOSF9CvlyEXPKRtXGCB7o/EoTB9kWZX0Bj+qgj7McYa
	YJMCtTR17S9vRQPgnwEldgmOhPXR74s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-cKIFBmXFMYy-869VAV2NUQ-1; Mon, 25 Mar 2024 10:18:03 -0400
X-MC-Unique: cKIFBmXFMYy-869VAV2NUQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a474ac232e9so80537766b.2
        for <linux-input@vger.kernel.org>; Mon, 25 Mar 2024 07:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376282; x=1711981082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNtX5yAkkt8k9VBgHWUC/ykg5bc+/xilFSnEjQF3IZA=;
        b=U6a0PfF5ydgidrwtJvGMFfjMYN34VeipTRvnVrq88Qkf12z/nTvq1Rjagq8JRpQy0K
         F8atkVwmeEfemUqGZbE6sLlLI3BXMMp8+dYLVpSYcgmBlVxdr3JMMS0K9v9FVrEesqD3
         S7vB635AY6e1ob2PGB9ybfyQHPgtfy3bsN933mqaGfVGnw1E5p5P2fX9fkWk1nv9dqns
         XEW8UdL9nR+2iWa0jM9MUr01UKBI1K2hd+mIixKcQjJMGoIWFXJoJpu27T70dgbXABrp
         omzFT8lHUZikI0nuSiHte61YEmXuX+wc4zmhvNZNKyUlbrs/mNwSYklr6ng6+yIblEkp
         Vihw==
X-Forwarded-Encrypted: i=1; AJvYcCUeL6V1VtZ/KohSfSIDIM1CbQS3oml1CJcoLTj/tI/+nsvG3jIl/6wptd51bpgAYV0MBqEOCgP6u8ZIQNiQo4y4f3jjf6udGdH5L5Q=
X-Gm-Message-State: AOJu0YyKKXTwLYFlPnrYQBA6DxrwcDNoIQ+ZxnyLUdOjEkMZWvKkjPBf
	x6irchrUm5mZfTS10/UDSPu+6jV4RhBfGFW9ZaDhe809Z0xsv0o78TB3o4vcO6ek46nhEqvokht
	s8jLO0UWhgw4VFPZXeKfKqCJSaNJy4/uAPT4H0sJzm/GQbFJJ0k+mAtP08EoF
X-Received: by 2002:a17:907:7288:b0:a4a:3955:460e with SMTP id dt8-20020a170907728800b00a4a3955460emr2087399ejc.58.1711376282439;
        Mon, 25 Mar 2024 07:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW0YWck1DWw8Dv5EVQKUHP4XBaO0+niUWuB7OcyHAKltXPcN/qGoPKNNrjuxrBHLNCPgrHTQ==
X-Received: by 2002:a17:907:7288:b0:a4a:3955:460e with SMTP id dt8-20020a170907728800b00a4a3955460emr2087369ejc.58.1711376282067;
        Mon, 25 Mar 2024 07:18:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id zh20-20020a170906881400b00a47531764fdsm1691993ejb.65.2024.03.25.07.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:18:01 -0700 (PDT)
Message-ID: <8264bce7-eda0-4e1c-8c72-a6a78ee3a7bd@redhat.com>
Date: Mon, 25 Mar 2024 15:18:00 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Future handling of complex RGB devices on Linux v3
Content-Language: en-US, nl
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org,
 linux-kernel@vger.kernel.org, Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Gregor Riepl <onitake@gmail.com>
References: <0cdb78b1-7763-4bb6-9582-d70577781e61@tuxedocomputers.com>
 <7228f2c6-fbdd-4e19-b703-103b8535d77d@redhat.com>
 <730bead8-6e1d-4d21-90d2-4ee73155887a@tuxedocomputers.com>
 <952409e1-2f0e-4d7a-a7a9-3b78f2eafec7@redhat.com>
 <9851a06d-956e-4b57-be63-e10ff1fce8b4@tuxedocomputers.com>
 <1bc6d6f0-a13d-4148-80cb-9c13dec7ed32@redhat.com>
 <b70b2ea8-abfd-4d41-b336-3e34e5bdb8c6@tuxedocomputers.com>
 <477d30ee-247e-47e6-bc74-515fd87fdc13@redhat.com>
 <e21a7d87-3059-4a51-af04-1062dac977d2@tuxedocomputers.com>
 <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <281f9b71-a565-4ff3-8343-ca36d604584d@redhat.com>
 <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <93d70ac3-bb18-4732-abb4-134750a5b50c@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 3/19/24 4:18 PM, Werner Sembach wrote:
> Hi Hans,
> 
> Am 18.03.24 um 12:11 schrieb Hans de Goede:
>> Hi Werner,
>>
>> Sorry for the late reply.
> np
>>
>> On 2/22/24 2:14 PM, Werner Sembach wrote:
>>> Hi,
>>>
>>> Thanks everyone for the exhaustive feedback. And at least this thread is a good comprehesive reference for the future ^^.
>>>
>>> To recap the hopefully final UAPI for complex RGB lighting devices:
>>>
>>> - By default there is a singular /sys/class/leds/* entry that treats the device as if it was a single zone RGB keyboard backlight with no special effects.
>> Ack this sounds good.
>>
>>> - There is an accompanying misc device with the sysfs attributes "name", "device_type",  "firmware_version_string", "serial_number" for device identification and "use_leds_uapi" that defaults to 1.
>> You don't need a char misc device here, you can just make this sysfs attributes on the LED class device's parent device by using device_driver.dev_groups. Please don't use a char misc device just to attach sysfs attributes to it.
>>
>> Also I'm a bit unsure about most of these attributes, "use_leds_uapi" was discussed before
>> and makes sense. But at least for HID devices the rest of this info is already available
>> in sysfs attributes on the HID devices (things like vendor and product id) and since the
>> userspace code needs per device code to drive the kbd anyways it can also have device
>> specific code to retrieve all this info, so the other sysfs attributes just feel like
>> duplicating information. Also there already are a ton of existing hidraw userspace rgbkbd
>> drivers which already get this info from other places.
> The parent device can be a hid device, a wmi device, a platform device etc. so I thought it would be nice to have some unified way for identification.

I think that some shared ioctl for identifying devices which need a misc-device
makes sense. But for existing hidraw supported keyboards there already is existing
userspace support, which already retreives this in a hidraw specific manner.

And I doubt that the existing userspace projects will add support for a new method
which is only available on new kernels, while they will also need to keep the old
method around to keep things working with older kernels.

So at least for the hidraw case I see little value in exporting the same info
in another way.



>>
>>>      - If set to 0 the /sys/class/leds/* entry disappears. The driver should keep the last state the backlight was in active if possible.
>>>
>>>      - If set 1 it appears again. The driver should bring it back to a static 1 zone setting while avoiding flicker if possible.
>> Ack, if this finds it way into some documentation (which it should) please make it
>> clear that this is about the "use_leds_uapi" sysfs attribute.
> Ack
>>
>>> - If the device is not controllable by for example hidraw, the misc device might also implement additional ioctls or sysfs attributes to allow a more complex low level control for the keyboard backlight. This is will be a highly vendor specific UAPI.
>> IMHO this is the only case where actually using a misc device makes sense, so that
>> you have a chardev to do the ioctls on. misc-device-s should really only be used
>> when you need a chardev under /dev . Since you don't need the chardev for the e.g.
>> hidraw case you should not use a miscdev there IMHO.
> 
> My train of thought was that it would be nice to have the use_leds_uapi at a somewhat unified location in sysfs. The parent device can be of any kind, like I mentioned above, and while for deactivating it can easily be found via /sys/class/leds/*/device/. For reactivating, the leds entry doesn't exist.

That is an interesting point. But I would expect any process/daemon which wants to
reactivate the in kernel LED class support to be the same process as which
deactivated it. So that daemon can simply canonicalize the /sys/class/leds/*/device
symlink or canonicalize the entire /sys/class/leds/*/device/use_leds_uapi path
and store the canonicalized version for when the daemon wants to reactivate things.

So I still think that having the miscdevice just for enumeration and
use_leds_uapi purposes is overkill.

Regards,

Hans



