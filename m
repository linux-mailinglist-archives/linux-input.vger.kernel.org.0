Return-Path: <linux-input+bounces-15981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE9C49D04
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 00:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1E7F188D0A8
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 23:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAF6303CA2;
	Mon, 10 Nov 2025 23:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDZw5qIv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0168257AD1
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 23:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762818552; cv=none; b=Yli9OeRSxCvoO4hZfwixIJZjvUiXZj/KUp421Dggjh+XMDe8YA82fDLRvqhFAPryWGZACV3MMccJKu3ekJ5EYdHF01nP3PA75k2VALhWPSqCXy2rCtxkDSW7cXQIIxvt7egi/sXawjJuJwxbGTcFWMAMgQJOVjsQa5QM0KlLKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762818552; c=relaxed/simple;
	bh=Cpx1MBTp2b+ApnHx7tQ9af9hUs61tCdIGkVmUMS1ivg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDprcrA1cIpeKD1Z/aeVmPT1k2vU7kl3j6dvQXMLLF2noot3YPSyBQX8vuw0+LGAakSadOLO7r29Oz3SIStHcRI1co1c2yVrlIe+abz47zpReryMcGFAHqQkjqzRjJoUmcfITerxQDoKzZoI6GqnPqIKNxhIZNWS56OKthiiO3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDZw5qIv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c7f4f8a2so138803f8f.0
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 15:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762818549; x=1763423349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bld/cS3EZkCvsE25mUIinwj/m0d1kI6qCYYge0fjmts=;
        b=nDZw5qIvonLEa43CUfx3X1sQWQKb2c29UaB5JtGYol+3Oi65ap9oR5CbEjB1LstRkt
         TIGhxc3sScUn40YZm7FmMdr4+mB7P50lXBf8mzXNejhKAM81dMrEnKRiRT6pTo0SII91
         A44N6hDwaXPeASvWM1J755ajg2+cM2FddaA/Es5uG70AyJru1X9JLQ1j12dFXCpPS9wA
         woA85Evv4tpCOYdKFWlbt0NfBosop1huj4vdcHIOEeEd3Ev4Pk/rM2rM+hspg2tVrTH0
         C3BYZF5NL8VrwHi7Khbv2oF6OmMVSlk0QzWLDIhBhOdmBojg6B8/XjsB33glTyNNXMhk
         8/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762818549; x=1763423349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bld/cS3EZkCvsE25mUIinwj/m0d1kI6qCYYge0fjmts=;
        b=h1zI0mbyPFRrJLOxGccyiUmM9oJtjlf5DwkAY5IFBLYwzNVTcD7uKKJOsGBlYvukcb
         hrHW6F1OVUswxICKEwBrMzdY3na1R+Z9MxuS7xishrf9iJdMJteiaswylrEfdfsiVb5I
         l2BemaIqI0ZKIjZyaowwOz1oGKdefaCBDlokSPe9lISEyoGOd6mM0fwQXcvICJ7JO4/y
         PXvZ1ys5r0MTRvATvXkUs1qs1jFhvz/jUlvbUlAqSAHDC7OcWl+JPS5aGfBChWEMOQut
         CZ/hEF+EeZD0Bzcj2n1pEw9n4AnB9dLjogTPXIhEvzz4I8nPABSNvD5FzMy8RTKBFocF
         eSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvs49rpW3sGvo/PH8ORnxbF+SU0LwWg4jfgayR3EKlQGKpqsI95LhYsRif9qsaWezHOEfcTKwCgNoLhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxQJUGmUFxSx0rrWyGHuzJMN1AYFtr2rV3j8e388rKv3mgIoQ
	Q7oXJpMOsQnnO6LIX1zCBT4AAWy4ipX3v8w/Ri71pNQes+rG8t/DbmNaE6VdDfeoxW18ATiyHRG
	7lpOvhTTL0j8N/gPv+H/90hj+aBVaZvw=
X-Gm-Gg: ASbGncsnUKIzLtfuBnLBUkS6p9iuSwmH80nTJMLj6N8L8zV1rZaWoobqflXkDhpJidf
	fxL1Ns1TF03p6tNt5xszT4nWgD7Dz5K/xUfHiUfaRC8KR7BRr9Ww5jrdAoOAo5yhEWtnXH7QP1/
	u/R7J+baTSX2vQVJXX09pa88mPaAPARGMESa75jwZWwH5YWw+QccFIzauELXGX0qFIbAw+FrPRk
	d25fhiWUABQ3AyYbzuBJTBvED7Pkzs9LrqYPzgsJyzVHCvkilKukzoDU2ewgEZ8DPw77hv1jCzl
	dn1PdNYQzey5NRKTldLNA/iqguaHYfpFdrmxn+vuivx9GJsUFL345aPp17dh2Tw7W3oXAkJx00Q
	=
X-Google-Smtp-Source: AGHT+IEzBThrWGXENmMgnfJGSVkl96z0rB9jXWVpmuygiJqcdjoP9Vl7SCqN4zOwOzBFWDxE5eHzR3awFsu6f2AkRUU=
X-Received: by 2002:a05:6000:2084:b0:42b:3dbe:3a37 with SMTP id
 ffacd0b85a97d-42b432b821dmr1129506f8f.10.1762818548948; Mon, 10 Nov 2025
 15:49:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com> <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
In-Reply-To: <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 20:48:57 -0300
X-Gm-Features: AWmQ_bnKj3OL9zFTHpNVhhmhojXeNUNSUjyqiacX0laSHqhRJXHE76Au8FS8WWs
Message-ID: <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > Are you sure?
> >
> > HID_QUIRK_ALWAYS_POLL = 0x400
> > would stop suspending the device.
>
> Actually, it forces the kernel to poll the device's IN endpoints even
> when no program is holding the device file open (see where
> usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).
> This is exactly what the speaker seems to need.
>
> As a side effect, it prevents the device from being suspended.  But that
> doesn't seem to be the important thing here.

From: https://github.com/torvalds/linux/blob/master/include/linux/hid.h

#define HID_QUIRK_ALWAYS_POLL          BIT(10)    ->  2^10=1024=#400
#define HID_QUIRK_NO_IGNORE            BIT(30)    ->  2^30=1073741824=#40000000

Sorry about that. I'm still learning and the documentation was not
very clear on this.

Trying the 0x40000000: `usbhid.quirks=0x2d99:0xa101:0x40000000`  the
usbmon stays silent when changing volume/button and reboots when
changing brightness.

With HID_QUIRK_ALWAYS_POLL: `usbhid.quirks=0x2d99:0xa101:0x400`
(reboot does not happen).

Is there a different quirk to try?

Off-topic:
I was trying to decode this protocol... and did it with volume control.

I can control my speaker directly with:

Full volume:
`echo \
 "2eaaec670001100e000000000000000000000000000000000000000000000000" \
| xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`

muted:
`echo \
"2eaaec67000100fe0000000000000000000000000000000000000000000000000" \
| xxd -r -p | dd bs=64 count=1 conv=sync | sudo tee /dev/hidraw1`

I renamed the steps to be similar to the audio stack where 0 is very
low but not muted.

ad it stays consistent on this full range. (tested)

volume muted
2eaaec670001 00fe 00000000000000000000000000000000000000000000000000
volume 0
2eaaec670001 01ff 00000000000000000000000000000000000000000000000000
volume 1
2eaaec670001 0200 00000000000000000000000000000000000000000000000000
volume 2
2eaaec670001 0301 00000000000000000000000000000000000000000000000000
volume 3
2eaaec670001 0402 00000000000000000000000000000000000000000000000000
volume 4
2eaaec670001 0503 00000000000000000000000000000000000000000000000000
volume 5
2eaaec670001 0604 00000000000000000000000000000000000000000000000000
volume 6
...
volume 14
2eaaec670001 0f0d 00000000000000000000000000000000000000000000000000
Volume 15 (max)
2eaaec670001 100e 00000000000000000000000000000000000000000000000000



And I also decoded the speaker volume it outputs by rotating the knob:

volume muted
2fbbec660002 1000 1f00 00000000000000000000000000000000000000000000
volume 0
2fbbec660002 1001 2000 00000000000000000000000000000000000000000000
volume 1
2fbbec660002 1002 2100 00000000000000000000000000000000000000000000
volume 2
2fbbec660002 1003 2200 00000000000000000000000000000000000000000000
volume 3
2fbbec660002 1004 2300 00000000000000000000000000000000000000000000
...
volume 14
2fbbec660002 100f 2e00 00000000000000000000000000000000000000000000
Volume 15 (max)
2fbbec660002 1010 2f00 00000000000000000000000000000000000000000000

When sending the volume change command to hidraw. The device outputs
the volume it was set to go like the knob on that value:

ffff8d49f36b3680 206654552 S Io:3:002:4 -115:1 64 = 2eaaec67 0001100e
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d49f36b3680 206654840 C Io:3:002:4 0:1 64 >
ffff8d494c8ee0c0 206655831 C Ii:3:002:4 0:1 64 = 2fbbec66 00021010
2f000000 00000000 00000000 00000000 00000000 00000000
ffff8d494c8ee0c0 206655832 S Ii:3:002:4 -115:1 64 <
ffff8d494c8ee0c0 206656830 C Ii:3:002:4 0:1 64 = 2fbbec67 00010110
00000000 00000000 00000000 00000000 00000000 00000000
ffff8d494c8ee0c0 206656831 S Ii:3:002:4 -115:1 64 <

If, I mean it's a very big IF. I wanted to have this device with
hardware volume control working with alsa/pipewire/wireplumber/etc.
What would be needed?

Maybe this vendor uses the same method of communication for other devices?

Maybe related: https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/thread/CYSG6A62JJID5N2V5YUDW43CELEZDF36/

The decibel range is bogus:

lugathe wireplumber[1231]: spa.alsa: The decibel volume range for
element 'PCM' (-2837 dB - -94 dB) has negative maximum. Disabling the
decibel range.

The RGB/Equalizer/profiles/etc. I don't think it's really important in
the kernel context except with the reboot apparently solved with
always poll quirk.

Before this I really *knew nothing* and I am having a really good time
and happy with this challenge. Thank you all for the wonderful work
and knowledge you are sharing.

