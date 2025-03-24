Return-Path: <linux-input+bounces-11136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5BA6D9DC
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 13:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39CDF3AA6F2
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC5D25E806;
	Mon, 24 Mar 2025 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S83lU87f"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E1E25E473
	for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818230; cv=none; b=aEE9HsJUSBxUyhGvaY5cQTMf6ipA7eWHtCFSTcl/vL3eS1nNP5O1Bf+Rc3JHuG7adamBQ1IhMSa8bhgfhqrA5DGDF73f4oJKII+11b2nXjzaIuycug6IwoND2RccstA9oVXuFxlN711Bte8lGQJpYdH4aoYv3hpdvq01zAq9Oz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818230; c=relaxed/simple;
	bh=sX6WYXci9m5NJKMn7fA1u3SQ8tQ0O96LPbAPnaiXcHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jph8IWzg0NOae1A0vepQaXDevDwSX1Clv63Ar8HCr2IARdw7hwml2T53YiYowTTgrn5j3KIz2pqsLZHo24p2nEVLhnBFa18YOnuaQLlb20fJjl9WO20SZBb+4pehtstk8IZmln/Wi4wmz+baLyCegui7iB1DgSrC7OPxqOFDGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S83lU87f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742818227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nqBOVDIhTBnh8jh/rMnl7yfv2kJ/jYX8Kgsibw8Kxc=;
	b=S83lU87fghhvcH/lrMx5ABvVfryDBWLD7lR53oF2Vw3xvxO72pTdBFWHYR6nGL/u3VRoUB
	sIiaDP9JrQNSjCkF8h4tzzP3JO7RNqM2PZxIV2/Acz2AcySvtgfQSn3PV5beG6Fubg6ck+
	BiomzO9aSesxYFqmve1puPRLFuPzlI8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-C4Q3ARffN5-Uxho2o0kW2Q-1; Mon, 24 Mar 2025 08:10:14 -0400
X-MC-Unique: C4Q3ARffN5-Uxho2o0kW2Q-1
X-Mimecast-MFC-AGG-ID: C4Q3ARffN5-Uxho2o0kW2Q_1742818213
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3a9c3a8f7so432799966b.1
        for <linux-input@vger.kernel.org>; Mon, 24 Mar 2025 05:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818213; x=1743423013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nqBOVDIhTBnh8jh/rMnl7yfv2kJ/jYX8Kgsibw8Kxc=;
        b=Ikb3TctRpIbU7BmVq9rQGZfmxK8i8lcFBL8wiHNNre41Hi9rxEQxrBIAuy6F3JEgrT
         wA3b1Z2Vtk5tXZxC1i6vB2JPgIAarTkRfK/RWZlzrl1qM2jUhCRrrkcjvRWlCA3bs0Dl
         yONBflDUDE4imJe0Bb64+wjaMKj5kI0tfDuE6QwSdRheVeZrzw2s4eGvfkcH92VgYxyX
         h0G0zceRq4pEYhXbbGtZmpE9SriT9aOq4iDTZbOf67tyCX9Jo/Ll5RlIdRV8LOmq8Gn7
         aIUCKdELtWSIMuckzmG5Ln00oL2igOhI0tuhxn7RC6vIszHa6GKGTNzzi5T2vo+3o2qB
         +FMg==
X-Forwarded-Encrypted: i=1; AJvYcCUyyXIN7xmxAqP8wWg9nJ0pH5aBKCI/mLLDn7cCxImy3dik8Mrtew7u6QgsQai/57ez47RxXaVhTVJS3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOpxD0Izxu/11pH121RgCq+wbkLQLsg9BuickpB2ACrKPiZ9oL
	VbOSJYFkIQdrhtBTtbl3BkrCv6/pVRPKNSXdppyfBt6dQ4aWykw4+Cx9QpieISvbam2X1rWRTj3
	MF2dPV4Alp8aWEk4Oa7PTt1nqtRFcTDmzjLqaxyRttijKWnJzgL1ck6j3OHPU
X-Gm-Gg: ASbGncuzaWOeVmDxDge00Cw425q5Z78E1c1iWpMnG1So3AF/OyDq43+2VxmPrIBdizi
	QXgRdd/fzqfd8PitwXj9E/WwUqs1uIfneVW49QltCk+Qs3QVse864gPN3xnIoq5xInkGN0ybLE0
	V32icqTvZL7PWilmef26EIdhm++1n1Ru31mHIY7OoPmD38saEerHpPiiyPtvT8t7GlmbNOo6gib
	MWqMyqkQsCqLKP1EBE6cwVB2P54qL/Gc1qPjM1g4kSYZbNIL/sDi22RhaGzaifwr9b8u7M+tNCp
	fwTQCLM/S5cEnvFvIc0=
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr717525566b.31.1742818213246;
        Mon, 24 Mar 2025 05:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgz3PLqoJVIqA3YdGTCcfWS8RjV46kIfynQphC2N1ZVOQL/wploYLzgDJQ24oF86+2An1DfQ==
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr717521266b.31.1742818212663;
        Mon, 24 Mar 2025 05:10:12 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64911sm675847266b.93.2025.03.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:10:12 -0700 (PDT)
Message-ID: <dac78c3d-9ba2-4721-9fb2-06dd2589bc72@redhat.com>
Date: Mon, 24 Mar 2025 13:10:11 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight
 unification, Z13 QOL improvements
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Antheas,

On 19-Mar-25 20:13, Antheas Kapenekakis wrote:
> This is a three part series that does the following: first, it cleans up
> the hid-asus driver initialization, preventing excess renames and dmesg
> errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
> key. Finally, the bigger piece of this series is the unification of the
> backlight controls between hid-asus and asus-wmi.

Thank you for your work on this.

> This requires some context. First, some ROG devices expose both WMI and
> HID controls for RGB. In addition, some ROG devices (such as the Z13)
> have two AURA devices where both have backlight controls (lightbar and
> keyboard). Under Windows, Armoury Crate exposes a single brightness control
> for all Aura devices.
> 
> However, currently in the linux kernel this is not the case, with asus-wmi
> and hid-asus relying on a quirk system to figure out which should control
> the backlight. But what about the other one? There might be silent
> regressions such as part of the RGB of the device not responding properly.
> 
> In the Z13, this is the case, with a race condition causing the lightbar
> to control the asus::kbd_backlight device most of the time, with the
> keyboard being renamed to asus::kbd_backlight_1 and not doing anything
> under KDE controls.
> 
> Here, we should note that most backlight handlers are hardcoded to check
> for backlight once, and for one backlight, during boot, so any other
> solution would require a large rewrite of userspace.

Note that work is actually ongoing to add support for multiple kbd
backlights to upower:

https://gitlab.freedesktop.org/upower/upower/-/merge_requests/258

But that is intended for when there are 2 kbds with a controllable backlight,
e.g. a docked laptop with a gaming kbd with RGB backlight connected to the dock.

Where as here we seem to have 2 controls which ideally should be set to
the same value if I understand things correctly ?

> Even when brightness controls are fixed, we still have the problem of the
> backlight key being on/off when controlled by KDE and 0/33/66/100 when
> the device has a WMI keyboard. Ideally, we would like the 0/33/66/100 to
> be done under hid as well, regardless of whether the backlight of the
> device is controlled by WMI or HID.

Hmm, ideally we want this sort of policy to be in userspace, this sounds
more like it is a keycode problem and we maybe need KEY_KBDILLUMCYCLE next
to the existing KEY_KBDILLUMTOGGLE. For the existing toggle doing on/off
obviously is the correct userspace behavior.

Anyways I can see how Asus is special here and on laptops the cycling is
typically handled by the EC and we have chosen to emulate EC behavior in
the kernel before to keep things consistent amongst models.

Still generally speaking we do prefer to just send keypresses when possible
and let userspace set the policy, but I guess we can make an exception here.

> Therefore, this is what the third part of this series does. It sets up
> asus-wmi to expose accepting listeners for the asus::kbd_backlight device
> and being the one that sets it up. Then, it makes hid-asus devices
> register a listener there, so that all of them are controlled by
> asus::kbd_backlight. Finally, it adds an event handler for keyboard keys,
> so that HID led controls are handled by the kernel instead of userspace.
> This way, even when userspace is not active the key works, and we get the
> desired behavior of 0/33/66/100 across all Aura devices (currently, that
> is keyboards, and embedded devices such as lightbars). This results
> removing the quirk system as well, eliminating a point of failure.

I've taken a quick look at the new API between asus-wmi and asus-hid and
this looks good to me, thank you for your work on this.

Regards,

Hans



