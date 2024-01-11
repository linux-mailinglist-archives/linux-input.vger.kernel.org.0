Return-Path: <linux-input+bounces-1213-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E882AC70
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 11:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62BF4B22008
	for <lists+linux-input@lfdr.de>; Thu, 11 Jan 2024 10:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3945F15480;
	Thu, 11 Jan 2024 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Er1W2pFb"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593E14F6F
	for <linux-input@vger.kernel.org>; Thu, 11 Jan 2024 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704970099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb635P6D37dItnS5Lkxshet4VrgKfKXqIRdta0HuSAg=;
	b=Er1W2pFbjqnxDif+KXD7FZZKv5WfOOb8/bCZ8D+PuSoBCGZ1w31DnbRortTSGFnz6K09cu
	ObuBz0tf/slUvjliSmYTAZsFWdpLzUIsTlpe4vO4o+fFZ4Kor1YxC79DYRh9bVN6mu+AaD
	p5y8hhUu8sS9NFCIRv5ODW1/BYtphnM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-hjHe0jP8PS-MyICjjraTmw-1; Thu, 11 Jan 2024 05:48:16 -0500
X-MC-Unique: hjHe0jP8PS-MyICjjraTmw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50e7b2ac430so4079455e87.1
        for <linux-input@vger.kernel.org>; Thu, 11 Jan 2024 02:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704970093; x=1705574893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gb635P6D37dItnS5Lkxshet4VrgKfKXqIRdta0HuSAg=;
        b=GNIJS/Coy0VvC/VLDRpkvakUbUt5BhwNQzRR5TRD5Sn4STRAwAuXQHceiAxNrMBKHu
         Ylw9JtxNo3nvWMnyp+08j7SYyWvrN905+41Ag5sRzkk5jXUqV/1u7nUAVLKsHNT2nQDl
         GU/uDBiFQvhiTsxUxD6oZ2wd76fd0CEIKAsSupErfa7BnXS3ucEZ41x/CkxkdVcfJH+n
         xzHyd83/F77RXYAPzYVVhylhvQ3kdo+4NxDAYuPe2hxG4sW02USu3WAP0aZtYvaYFYbc
         ru3zCa2WKKJ9aaBYB7XjoPkb+ziqJ2x2v8M4dGJS7rLN5OzJIj83b1U0qVFEn0/P+0PC
         4Kcg==
X-Gm-Message-State: AOJu0YyH9ttaqiIcsbDLzbeIAVcOg0N1rMiAlekYIBD+U6ClpT/SH7q0
	wks7kQbAW8lDNN40dCw83T3Tyc7WD+Zm3DuiqF8jDMNE6zZltthoXAov9O4DE0XbZ40O3z4x864
	taXV4prrANHA5tNw7s5FlpYqsBk5JsRlDpVf5oPQ=
X-Received: by 2002:ac2:4da3:0:b0:50e:7b67:b86e with SMTP id h3-20020ac24da3000000b0050e7b67b86emr502140lfe.76.1704970093237;
        Thu, 11 Jan 2024 02:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpI/1ITPTuh47uDUhlVWVfLk3ya78VXSjq3aPivPmgdPHI0oxnUORDi/kZxb10DteXW077mw==
X-Received: by 2002:ac2:4da3:0:b0:50e:7b67:b86e with SMTP id h3-20020ac24da3000000b0050e7b67b86emr502126lfe.76.1704970092845;
        Thu, 11 Jan 2024 02:48:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906541800b00a26f0f49dd2sm430461ejo.11.2024.01.11.02.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 02:48:12 -0800 (PST)
Message-ID: <005a6d3c-ffba-45df-bdc0-cb2d32e6b676@redhat.com>
Date: Thu, 11 Jan 2024 11:48:11 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - add quirk for Lenovo ThinkPad T14 Gen 1
Content-Language: en-US, nl
To: Jonathan Denose <jdenose@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jonathan Denose <jdenose@google.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Takashi Iwai
 <tiwai@suse.de>, Werner Sembach <wse@tuxedocomputers.com>,
 linux-kernel@vger.kernel.org
References: <20230925163313.1.I55bfb5880d6755094a995d3ae44c13810ae98be4@changeid>
 <ZWF76ALANQwP_9b1@google.com>
 <CALNJtpUHHaq6g0wSuyaNBxtOE9kt6vDzdAGGu6j=JJdJmerDWQ@mail.gmail.com>
 <ZZ2eduF_h7lcBrSL@google.com>
 <CALNJtpWr0h+r3=R2scxyCGzgbZ1C6FiYrCGWW1_aSVPBdmNc3Q@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALNJtpWr0h+r3=R2scxyCGzgbZ1C6FiYrCGWW1_aSVPBdmNc3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jonathan,

On 1/11/24 00:42, Jonathan Denose wrote:
> Dmitry,
> 
> Sorry I forgot to reply all, so I'm resending my other email.
> 
> On Tue, Jan 9, 2024 at 1:28 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> Hi Jonathan,
>>
>> On Mon, Nov 27, 2023 at 10:38:57AM -0600, Jonathan Denose wrote:
>>> Hi Dmitry
>>>
>>> On Fri, Nov 24, 2023 at 10:45 PM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
>>>>
>>>> Hi Jonathan,
>>>>
>>>> On Mon, Sep 25, 2023 at 04:33:20PM -0500, Jonathan Denose wrote:
>>>>> The ThinkPad T14 Gen 1 touchpad works fine except that clicking
>>>>> and dragging by tapping the touchpad or depressing the touchpad
>>>>> do not work. Disabling PNP for controller setting discovery enables
>>>>> click and drag without negatively impacting other touchpad features.
>>>>
>>>> I would like to understand more on how enabling PnP discovery for i8042
>>>> affects the touchpad. Do you see it using different interrupt or IO
>>>> ports? What protocol does the touchpad use with/without PnP? If the
>>>> protocol is the same, do you see difference in the ranges (pressure,
>>>> etc) reported by the device?
>>>>
>>>> Thanks.
>>>>
>>>> --
>>>> Dmitry
>>>
>>> Without PnP discovery the touchpad is using the SynPS/2 protocol, with
>>> PnP discovery, the touchpad is using the rmi4 protocol. Since the
>>> protocols are different, so are the ranges but let me know if you
>>> still want to see them.
>>
>> Thank you for this information. So it is not PnP discovery that appears
>> harmful in your case, but rather that legacy PS/2 mode appears to be
>> working better than RMI4 for the device in question.
>>
>> I will note that the original enablement of RMI4 for T14 was done by
>> Hans in [1]. Later T14 with AMD were added to the list of devices that
>> should use RMI4 [2], however this was reverted in [3].
>>
>> Could you please tell me what exact device you are dealing with? What's
>> it ACPI ID?
>>
>> [1] https://lore.kernel.org/all/20201005114919.371592-1-hdegoede@redhat.com/
>> [2] https://lore.kernel.org/r/20220318113949.32722-1-snafu109@gmail.com
>> [3] https://lore.kernel.org/r/20220920193936.8709-1-markpearson@lenovo.com
>>
>> Thanks.
>>
>> --
>> Dmitry
> 
> Thanks for your reply!
> 
> I'm not 100% sure which of these is the ACPI ID, but from `udevadm
> info -e` there's:
> N: Name="Synaptics TM3471-020"
> P: Phys=rmi4-00/input0

To get the ACPI ID you need to run e.g. :``

cat /sys/bus/serio/devices/serio1/firmware_id

After reading the original bug report again I take back my
Reviewed-by and I'm tending towards a nack for this.

Jonathan upon re-reading things I think that your problem
is more a case of user space mis-configuration then
a kernel problem.

You mention both tap-n-drag not working as well as click+drag
not working.

tap-n-drag is purely done in userspace and typically only
works if tap-to-click is enabled in the touchpad configuration
of your desktop environment.

Click + drag requires you to use the bottom of the touchpad
(the only part which actually clicks) as if there still were
2 physical buttons there and then click the touchpad down
with 1 finger till it clicks and then drags with another
finger (you can click+drag with one finger but the force
required to keep the touchpad clicked down while dragging
makes this uncomfortable to do).

This will likely also only work if the mouse click emulation
mode is set to "area" and not "fingers" with "fingers" being
the default now. In GNOME you can configure
the "click emulation mode" in the "tweaks" tools under
"mouse & touchpad" (and tap to click is in the normal
settings menu / control panel).

If you have the click emulations set to fingers and
then do the click with 1 finger + drag with another
finger thing, I think the drag will turn into a
right button drag instead of a left button drag which
is likely why this is not working.

You can check which mode you are in by seeing how
you right click. If you right-click by pressing down
in the right bottom corner of the touchpad then
your userspace (libinput) config is set to areas,
if you can right click anywhere by pressing down
with 2 fingers at once then your click emulation
is in fingers mode and this is likely why click-n-drag
is not working.

I have just dug up my T14 gen1 (Intel) and updated it
to kernel 6.6.11 to rule out kernel regressions.

And both click-n-drag and tap-n-drag (double-tap then
drag) both work fine there with a touchpad with
an ACPI id of LEN2068 as shown by
cat /sys/bus/serio/devices/serio1/firmware_id

(with the Desktop Environment configured for bottom
area click emulation and tap-to-click enabled)

As for why changing things back to synps2 works,
I don't know. One guess is that you already configured
the touchpad behavior of your desktop environment to
your liking in the past and your desktop environment
has remembered this only for the input device-name
which is used in SynPS/2 mode and the different
input device-name in RMI4 mode in new (new-ish)
kernels causes the desktop environment to use
default settings which are typically "fingers"
click emulation and tap-to-click disabled.

This can e.g. also happen if you have moved your
disk (contents) over from an older machine. IIRC
the SynPS/2 driver always used the same input
device-name where as with RMI4 the name is tied
to the actual laptop model.

Regards,

Hans



