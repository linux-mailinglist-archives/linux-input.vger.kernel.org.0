Return-Path: <linux-input+bounces-169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D77F2CFA
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 13:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4900A281F55
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 12:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97F7495E3;
	Tue, 21 Nov 2023 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dnbfuPlU"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB9E18A
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 04:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700569206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0lxOA43UTP/R6zFUk37R+i+jJVYEbt1d8xZiecNyn/E=;
	b=dnbfuPlU0W/gPa6/yQJH9Gfd5NZ4qLBlK5Cwr1+nCyWx4Gl7KSkUm5sWZM3vzW5MTdycbx
	kKXbUsbXNCzBUDQctLRmzLeoJ8Ay3P//cZD4F/rCO/xlpGEmkrPOuyyUbo9S6Y7Wtdw9ut
	X0rQjnjOWeVqps0A+Lo3zkSsrf3kdxM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-MJ7n3LUyMLqgYJQ67v0mKw-1; Tue, 21 Nov 2023 07:20:05 -0500
X-MC-Unique: MJ7n3LUyMLqgYJQ67v0mKw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a020d91dc93so42471766b.0
        for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 04:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700569204; x=1701174004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lxOA43UTP/R6zFUk37R+i+jJVYEbt1d8xZiecNyn/E=;
        b=i2datsJoQ08mbxBSZDBA/Ias1S04E9ky18el/bvMDip0lqwmEHaFQhiYAIFcvevKod
         ddz5ogLc1lNakZLoPLFqYcTUM7yI/u9QKc7JngKgsfSKIccvhRk9u+HYbch/l13n5Otc
         Nax1+Q5wt1HaGQeCXLj2SWF/317T83aOBwrFsGQ9RSIngZMtDUj0h+/xY4ymQNed9KWz
         32i9rXB8S5KRcPNKbakFb9yZmsgFkmDix2OJu3J+CPXq0tlsM9+9R1UxxdguMwkmluCS
         9wk8Tfua+fugh3KFT2pQ0Xn30tMrzzFB0SHUCfrOILt8owVOe1ks5Xk7vmSg7OYMyUEj
         BrTQ==
X-Gm-Message-State: AOJu0YxD49ODwZpHcmCV2usBRITx+UPA/1F28a3gN9OVIWHQs1yJ32Px
	A9QPFX/xEj6DNj1FYSieBUVASlVPqwsL6e1DaXAY8hwgPknDld51BuwpiR3vJEe/NbBkFJwXLC7
	Nt3F1YF74mHdHE/mnsemT5FM=
X-Received: by 2002:a17:906:2e85:b0:9c7:5667:5643 with SMTP id o5-20020a1709062e8500b009c756675643mr6684056eji.72.1700569203956;
        Tue, 21 Nov 2023 04:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE92EhPr1HPBGhXFRPyS78A/cFsflqXUs5leyf965m9/E+JG/G4eTF6Hlli+Hm2DJ2NWAwGIQ==
X-Received: by 2002:a17:906:2e85:b0:9c7:5667:5643 with SMTP id o5-20020a1709062e8500b009c756675643mr6684039eji.72.1700569203641;
        Tue, 21 Nov 2023 04:20:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709060e1400b009ff783d892esm1938300eji.146.2023.11.21.04.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 04:20:03 -0800 (PST)
Message-ID: <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
Date: Tue, 21 Nov 2023 13:20:01 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Werner Sembach <wse@tuxedocomputers.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 11/21/23 12:33, Werner Sembach wrote:
> Hi,
> 
> Am 20.11.23 um 21:52 schrieb Pavel Machek:
>> Hi!
>>
>>>>> So... a bit of rationale. The keyboard does not really fit into the
>>>>> LED subsystem; LEDs are expected to be independent ("hdd led") and not
>>>>> a matrix of them.
>>>> Makes sense.
>>>>
>>>>> We do see various strange displays these days -- they commonly have
>>>>> rounded corners and holes in them. I'm not sure how that's currently
>>>>> supported, but I believe it is reasonable to view keyboard as a
>>>>> display with slightly weird placing of pixels.
>>>>>
>>>>> Plus, I'd really like to play tetris on one of those :-).
>>>>>
>>>>> So, would presenting them as auxdisplay be acceptable? Or are there
>>>>> better options?
>>>> It sounds like a fair use case -- auxdisplay are typically simple
>>>> character-based or small graphical displays, e.g. 128x64, that may not
>>>> be a "main" / usual screen as typically understood, but the concept is
>>>> a bit fuzzy and we are a bit of a catch-all.
>>>>
>>>> And "keyboard backlight display with a pixel/color per-key" does not
>>>> sound like a "main" screen, and having some cute effects displayed
>>>> there are the kind of thing that one could do in the usual small
>>>> graphical ones too. :)
>>>>
>>>> But if somebody prefers to create new categories (or subcategories
>>>> within auxdisplay) to hold these, that could be nice too (in the
>>>> latter case, I would perhaps suggest reorganizing all of the existing
>>>> ones while at it).
>>> One could also reasonably make the argument that controlling the
>>> individual keyboard key backlights should be part of the input
>>> subsystem. It's not a display per se. (Unless you actually have small
>>> displays on the keycaps, and I think that's a thing too.)
>> While it would not be completely crazy to do that... I believe the
>> backlight is more of a display and less of a keyboard. Plus input
>> subystem is very far away from supporting this, and we had no input
>> from input people here.
>>
>> I don't think LED subsystem is right place for this, and I believe
>> auxdisplay makes slightly more sense than input.
>>
>> Unless someone steps up, I'd suggest Werner tries to implement this as
>> an auxdisplay. [And yes, this will not be simple task. RGB on LED is
>> different from RGB on display. But there are other LED displays, so
>> auxdisplay should handle this. Plus pixels are really funnily
>> shaped. But displays with missing pixels -- aka holes for camera --
>> are common in phones, and I believe we'll get variable pixel densities
>> -- less dense over camera -- too. So displays will have to deal with
>> these in the end.]
> 
> Another idea I want to throw in the mix:
> 
> Maybe the kernel is not the right place to implement this at all. RGB stuff is not at all standardized and every vendor is doing completely different interfaces, which does not fit the kernel userpsace apis desire to be uniformal and fixed. e.g. Auxdisplay might fit static setting of RGB values, but it does not fit the snake-effect mode, or the raindrops mode, or the 4-different-colors-in-the-edges-breathing-and-color-cycling mode.
> 
> So my current idea: Implement these keyboards as a single zone RGB kbd_backlight in the leds interface to have something functional out of the box, but make it runtime disable-able if something like https://gitlab.com/CalcProgrammer1/OpenRGB wants to take over more fine granular control from userspace via hidraw.

That sounds like a good approach to me. We are seeing the same with game controllers where steam and wine/proton also sometimes use hidraw mode to get access to all the crazy^W interesting features.

That would mean that all we need to standardize and the kernel <-> userspace API level is adding a standard way to disable the single zone RGB kbd_backlight support in the kernel.

Regards,

Hans



