Return-Path: <linux-input+bounces-1671-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6898496F2
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 10:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C46D1F2167F
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 09:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FA312B6A;
	Mon,  5 Feb 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOOlc7u7"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0B112B82
	for <linux-input@vger.kernel.org>; Mon,  5 Feb 2024 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126604; cv=none; b=INTuoMfgjJPOrFe1b8Asm7SF5RgaBb5PheQSx2r0jWa3UJYeRiAYYrLan7avYXTUIInfPDB0EMmfamVZfkUjvG/6lPJ/+GrycfucwSCuIUo0R0odd1Pl89UeKzpHi77bVLRahqwYe013VlB6ueYpMuBHIc/iMZqv5h3euHWdZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126604; c=relaxed/simple;
	bh=yLOHnDJYfWXXunRMcnNRB/2zYsfbFLh+SDX09BmLSlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czJI6/xAXfzj65aHUBBXuSj195QmdZcyO1KHhUbbuIKqwU5Eg+kU7l2GaT+3Dg+CYnTDI6EF0xHJaSKo4wZoWof5u6+J5yGUNRkWIv9QmmAjN6zhsfa/638Md2miv0sTvkrzBuUbpQbKJDRgXwCNqNmX6PbcDp/UwE2ASKL/KZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOOlc7u7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707126590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wljrZu1M8di8X9zNwkarV84lE9z+8AL7mHkeTUJg840=;
	b=eOOlc7u7XzmiHiFun393XYtxEsnlDqb8hb75yQEf6cxFT0RRAbYg+4AZR9qzr4L/X7hhDa
	Az/SqBATnHjLAdrgPG28adWqEjhRleEZR+hqGIg9RhhIdkNyb8B/1DvhH8AAMgx2oA5WI4
	5Fh+s0fgd+k1yhFCS5d8hnav2yGk7KM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-ejktXcQfNruYnQ56fBZIig-1; Mon, 05 Feb 2024 04:49:48 -0500
X-MC-Unique: ejktXcQfNruYnQ56fBZIig-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-560127ce17fso1176503a12.0
        for <linux-input@vger.kernel.org>; Mon, 05 Feb 2024 01:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126586; x=1707731386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wljrZu1M8di8X9zNwkarV84lE9z+8AL7mHkeTUJg840=;
        b=Oi3vrDAWEm12QSpN5Ys65BH2LBp8SPk3+Gmdvltmg/Ice4QRuvhP+8Qbf/XxLnP7Ob
         iglT0FOQNHskDlot5Yuf7aKAop9Qxyq9l85LOnFPxyQBVJ4k5wFrIuFvZ+QGsR8ZALwf
         lodUSygTeDB0St0hpLf5eS0oBoG8WgglEe0EdeL3m/fGJnBIURLNU9fJFlAG//CsMm+d
         6CHX1G6sHrdG9d2kO6DSlE9zAG0u2hznN3+le4vBT7abdpTNPr4Tqt6TuyqGhFHAWUVm
         msgAbwtmPKCOTLYpJUKu4Eg2p65xdOqll0BxWOO7xgBrp0tL95vKdQYlcvDDn9oBcUkp
         9wFw==
X-Gm-Message-State: AOJu0YxBv88lETmm7EK+ppfxybdFTXMleH1eKxazhfsk2ZfyVvziEJsZ
	xEnfwYqctswdyGUHvmeUiTVgrV5thSNU8eSm7SBqn1nj0XjARx2X/z7c72ny+rJcrs9Pzz071At
	auF12GoQvKB7dAGDcCNXutilfWsUHkZN7IKYxMUXmiy73CME9eD85ySewOM45E5xOtGdeVBntvB
	jGIp+zgnn9xP8NL0QYHqDArKP3Oz7n96glwywtgUI36JE=
X-Received: by 2002:a05:6402:516c:b0:560:4e74:20a4 with SMTP id d12-20020a056402516c00b005604e7420a4mr2958186ede.34.1707126586513;
        Mon, 05 Feb 2024 01:49:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJaUQ7XgL8Bc4nzGPSgbF5d4H0+gI9Vg6sL0LYQk9OybSEevNPBenfwJ+FPBzCqo+U7qt5Vb1X5iY3RPNTZdI=
X-Received: by 2002:a05:6402:516c:b0:560:4e74:20a4 with SMTP id
 d12-20020a056402516c00b005604e7420a4mr2958147ede.34.1707126586027; Mon, 05
 Feb 2024 01:49:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
 <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
 <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com>
 <CAEQPD4TNkGn-xjLqNiNb5c2Hc9P-4Hpeq-92tBSPJiJ=4-dsZw@mail.gmail.com> <CAEQPD4TBPsh0At4Eqmox++AiGes3q16O5qva6KNQMwzmRPySOQ@mail.gmail.com>
In-Reply-To: <CAEQPD4TBPsh0At4Eqmox++AiGes3q16O5qva6KNQMwzmRPySOQ@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 5 Feb 2024 10:49:33 +0100
Message-ID: <CAO-hwJJKmFFt2YkenJ0RxsH_nFCu1oPGMvgbF4Tz0CsyKGZB2A@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Taco Jerkface <tacodog311@gmail.com>
Cc: Siarhei Vishniakou <svv@google.com>, linux-input@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:26=E2=80=AFAM Taco Jerkface <tacodog311@gmail.com>=
 wrote:
>
> FYI,
>
> I believe your hunch was correct, and the controller is using hidraw
> with root and evdev without root.

Hah! I'm not overly surprised otherwise, but that pretty much sums up
the state of joysticks/gamepads on the linux world. There is no single
stack to handle it which leads to confusion. Sigh.

>
> The program evemu-record does read output without root permissions.I
> recorded the output to here:
>
> https://pastebin.com/uTMSLkfw
>
> It looks like Event code 240 (KEY_UNKNOWN) is used for all of the
> paddles, reporting 1,2,4,8 for each paddle.  It reports 0 when a
> paddle is released, and the sum when multiple are pressed
> simultaneously.

This pretty much means that the value of "KEY_UNKNOWN" should be 4
individual bits, and they should be fixed in the kernel, assuming
someone wants to fix them.

>
> I'm not experienced enough to know the next steps in debugging the
> driver, but let me know if there's anything else I can try.

So we have several options:
1. (easiest) tune your udev rule to also give user access to the
hidraw subsystem on this device. SDL should be able to read it
directly, and handle it properly, but this won't solve for future
users
2. (no kernel compilation required) we can try to fix the report
descriptor of the device through HID-BPF. Assuming you have
CONFIG_HID_BPF enabled in your kernel, we can relatively easily change
the way the device is exported/handled by the kernel, to make it
useful hopefully
3. (hardest IMO as you'll have to recompile your kernel for the tests)
we can try to tune hid-microsoft.c to properly export these buttons

For 2 and 3, I'll need some events from your device with hid-recorder.
You only gave me the report descriptor, but no events which are hard
to deduce based on the long report descriptor.

Also for 2 and 3 we need to have a BTN_* button code to use, and I
don't know which ones should be used from the top of my head. HID-BPF
would be easiest to use as we can let the user decide of it, while
we'll need to have a more formal usage in case we fix hid-microsoft.

For 1, maybe SDL (or Steam) already ships some udev rules, and
submitting a fix there would make things working for everybody.

Anyway, depending on how much you want this to be fixed and what you
can do (is CONFIG_HID_BPF enabled in your distro? and can you
recompile a kernel module?) we can figure out the next step.

Cheers,
Benjamin

>
> Cheers
>
> On Wed, Jan 31, 2024 at 12:27=E2=80=AFPM Taco Jerkface <tacodog311@gmail.=
com> wrote:
> >
> > Thanks for the response!
> > I put some diagnostic info below, but please let me know if I can do
> > anything else to help.
> > Thank you.
> >
> > hid-recorder does not see the controller when connected with USB.
> >
> > sudo hid-recorder
> > Available devices:
> > /dev/hidraw0:   DLL07D1:01 044E:120B
> > Select the device event number [0-0]:
> >
> >
> > When connected with Bluetooth, hid-recorder sees the device as "Xbox
> > Wireless Controler" and the dump is below:
> >
> > sudo hid-recorder
> > Available devices:
> > /dev/hidraw0:   DLL07D1:01 044E:120B
> > /dev/hidraw1:   Xbox Wireless Controller
> > Select the device event number [0-1]: 1
> > # Xbox Wireless Controller
> > # 0x05, 0x01,                    // Usage Page (Generic Desktop)       =
 0
> > # 0x09, 0x05,                    // Usage (Game Pad)                   =
 2
> > # 0xa1, 0x01,                    // Collection (Application)           =
 4
> > # 0x85, 0x01,                    //  Report ID (1)                     =
 6
> > # 0x09, 0x01,                    //  Usage (Pointer)                   =
 8
> > # 0xa1, 0x00,                    //  Collection (Physical)             =
 10
> > # 0x09, 0x30,                    //   Usage (X)                        =
 12
> > # 0x09, 0x31,                    //   Usage (Y)                        =
 14
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 16
> > # 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)          =
 18
> > # 0x95, 0x02,                    //   Report Count (2)                 =
 23
> > # 0x75, 0x10,                    //   Report Size (16)                 =
 25
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 27
> > # 0xc0,                          //  End Collection                    =
 29
> > # 0x09, 0x01,                    //  Usage (Pointer)                   =
 30
> > # 0xa1, 0x00,                    //  Collection (Physical)             =
 32
> > # 0x09, 0x32,                    //   Usage (Z)                        =
 34
> > # 0x09, 0x35,                    //   Usage (Rz)                       =
 36
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 38
> > # 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)          =
 40
> > # 0x95, 0x02,                    //   Report Count (2)                 =
 45
> > # 0x75, 0x10,                    //   Report Size (16)                 =
 47
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 49
> > # 0xc0,                          //  End Collection                    =
 51
> > # 0x05, 0x02,                    //  Usage Page (Simulation Controls)  =
 52
> > # 0x09, 0xc5,                    //  Usage (Brake)                     =
 54
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 56
> > # 0x26, 0xff, 0x03,              //  Logical Maximum (1023)            =
 58
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 61
> > # 0x75, 0x0a,                    //  Report Size (10)                  =
 63
> > # 0x81, 0x02,                    //  Input (Data,Var,Abs)              =
 65
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 67
> > # 0x25, 0x00,                    //  Logical Maximum (0)               =
 69
> > # 0x75, 0x06,                    //  Report Size (6)                   =
 71
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 73
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 75
> > # 0x05, 0x02,                    //  Usage Page (Simulation Controls)  =
 77
> > # 0x09, 0xc4,                    //  Usage (Accelerator)               =
 79
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 81
> > # 0x26, 0xff, 0x03,              //  Logical Maximum (1023)            =
 83
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 86
> > # 0x75, 0x0a,                    //  Report Size (10)                  =
 88
> > # 0x81, 0x02,                    //  Input (Data,Var,Abs)              =
 90
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 92
> > # 0x25, 0x00,                    //  Logical Maximum (0)               =
 94
> > # 0x75, 0x06,                    //  Report Size (6)                   =
 96
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 98
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 100
> > # 0x05, 0x01,                    //  Usage Page (Generic Desktop)      =
 102
> > # 0x09, 0x39,                    //  Usage (Hat switch)                =
 104
> > # 0x15, 0x01,                    //  Logical Minimum (1)               =
 106
> > # 0x25, 0x08,                    //  Logical Maximum (8)               =
 108
> > # 0x35, 0x00,                    //  Physical Minimum (0)              =
 110
> > # 0x46, 0x3b, 0x01,              //  Physical Maximum (315)            =
 112
> > # 0x66, 0x14, 0x00,              //  Unit (EnglishRotation: deg)       =
 115
> > # 0x75, 0x04,                    //  Report Size (4)                   =
 118
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 120
> > # 0x81, 0x42,                    //  Input (Data,Var,Abs,Null)         =
 122
> > # 0x75, 0x04,                    //  Report Size (4)                   =
 124
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 126
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 128
> > # 0x25, 0x00,                    //  Logical Maximum (0)               =
 130
> > # 0x35, 0x00,                    //  Physical Minimum (0)              =
 132
> > # 0x45, 0x00,                    //  Physical Maximum (0)              =
 134
> > # 0x65, 0x00,                    //  Unit (None)                       =
 136
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 138
> > # 0x05, 0x09,                    //  Usage Page (Button)               =
 140
> > # 0x19, 0x01,                    //  Usage Minimum (1)                 =
 142
> > # 0x29, 0x0f,                    //  Usage Maximum (15)                =
 144
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 146
> > # 0x25, 0x01,                    //  Logical Maximum (1)               =
 148
> > # 0x75, 0x01,                    //  Report Size (1)                   =
 150
> > # 0x95, 0x0f,                    //  Report Count (15)                 =
 152
> > # 0x81, 0x02,                    //  Input (Data,Var,Abs)              =
 154
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 156
> > # 0x25, 0x00,                    //  Logical Maximum (0)               =
 158
> > # 0x75, 0x01,                    //  Report Size (1)                   =
 160
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 162
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 164
> > # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)     =
 166
> > # 0x0a, 0xb2, 0x00,              //  Usage (Record)                    =
 168
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 171
> > # 0x25, 0x01,                    //  Logical Maximum (1)               =
 173
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 175
> > # 0x75, 0x01,                    //  Report Size (1)                   =
 177
> > # 0x81, 0x02,                    //  Input (Data,Var,Abs)              =
 179
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 181
> > # 0x25, 0x00,                    //  Logical Maximum (0)               =
 183
> > # 0x75, 0x07,                    //  Report Size (7)                   =
 185
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 187
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 189
> > # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)     =
 191
> > # 0x09, 0x01,                    //  Usage (Consumer Control)          =
 193
> > # 0xa1, 0x01,                    //  Collection (Application)          =
 195
> > # 0x0a, 0x85, 0x00,              //   Usage (Order Movie)              =
 197
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 200
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 202
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 205
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 207
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 209
> > # 0x0a, 0x99, 0x00,              //   Usage (Media Select Security)    =
 211
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 214
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 216
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 219
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 221
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 223
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 225
> > # 0x25, 0x00,                    //   Logical Maximum (0)              =
 227
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 229
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 231
> > # 0x81, 0x03,                    //   Input (Cnst,Var,Abs)             =
 233
> > # 0x0a, 0x81, 0x00,              //   Usage (Assign Selection)         =
 235
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 238
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 240
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 243
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 245
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 247
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 249
> > # 0x25, 0x00,                    //   Logical Maximum (0)              =
 251
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 253
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 255
> > # 0x81, 0x03,                    //   Input (Cnst,Var,Abs)             =
 257
> > # 0xc0,                          //  End Collection                    =
 259
> > # 0x05, 0x0f,                    //  Usage Page (Vendor Usage Page 0x0f=
) 260
> > # 0x09, 0x21,                    //  Usage (Vendor Usage 0x21)         =
 262
> > # 0x85, 0x03,                    //  Report ID (3)                     =
 264
> > # 0xa1, 0x02,                    //  Collection (Logical)              =
 266
> > # 0x09, 0x97,                    //   Usage (Vendor Usage 0x97)        =
 268
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 270
> > # 0x25, 0x01,                    //   Logical Maximum (1)              =
 272
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 274
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 276
> > # 0x91, 0x02,                    //   Output (Data,Var,Abs)            =
 278
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 280
> > # 0x25, 0x00,                    //   Logical Maximum (0)              =
 282
> > # 0x75, 0x04,                    //   Report Size (4)                  =
 284
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 286
> > # 0x91, 0x03,                    //   Output (Cnst,Var,Abs)            =
 288
> > # 0x09, 0x70,                    //   Usage (Vendor Usage 0x70)        =
 290
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 292
> > # 0x25, 0x64,                    //   Logical Maximum (100)            =
 294
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 296
> > # 0x95, 0x04,                    //   Report Count (4)                 =
 298
> > # 0x91, 0x02,                    //   Output (Data,Var,Abs)            =
 300
> > # 0x09, 0x50,                    //   Usage (Vendor Usage 0x50)        =
 302
> > # 0x66, 0x01, 0x10,              //   Unit (SILinear: s)               =
 304
> > # 0x55, 0x0e,                    //   Unit Exponent (-2)               =
 307
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 309
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 311
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 314
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 316
> > # 0x91, 0x02,                    //   Output (Data,Var,Abs)            =
 318
> > # 0x09, 0xa7,                    //   Usage (Vendor Usage 0xa7)        =
 320
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 322
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 324
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 327
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 329
> > # 0x91, 0x02,                    //   Output (Data,Var,Abs)            =
 331
> > # 0x65, 0x00,                    //   Unit (None)                      =
 333
> > # 0x55, 0x00,                    //   Unit Exponent (0)                =
 335
> > # 0x09, 0x7c,                    //   Usage (Vendor Usage 0x7c)        =
 337
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 339
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 341
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 344
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 346
> > # 0x91, 0x02,                    //   Output (Data,Var,Abs)            =
 348
> > # 0xc0,                          //  End Collection                    =
 350
> > # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)     =
 351
> > # 0x09, 0x01,                    //  Usage (Consumer Control)          =
 353
> > # 0x85, 0x0c,                    //  Report ID (12)                    =
 355
> > # 0xa1, 0x01,                    //  Collection (Application)          =
 357
> > # 0x0a, 0x9e, 0x00,              //   Usage (Media Select SAP)         =
 359
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 362
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 364
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 367
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 369
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 371
> > # 0x0a, 0xa1, 0x00,              //   Usage (Once)                     =
 373
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 376
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 378
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 381
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 383
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 385
> > # 0x0a, 0xa2, 0x00,              //   Usage (Daily)                    =
 387
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 390
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 392
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 395
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 397
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 399
> > # 0x0a, 0xa3, 0x00,              //   Usage (Weekly)                   =
 401
> > # 0x15, 0x00,                    //   Logical Minimum (0)              =
 404
> > # 0x26, 0xff, 0x00,              //   Logical Maximum (255)            =
 406
> > # 0x95, 0x01,                    //   Report Count (1)                 =
 409
> > # 0x75, 0x08,                    //   Report Size (8)                  =
 411
> > # 0x81, 0x02,                    //   Input (Data,Var,Abs)             =
 413
> > # 0xc0,                          //  End Collection                    =
 415
> > # 0xc0,                          // End Collection                     =
 416
> > # 0x05, 0x01,                    // Usage Page (Generic Desktop)       =
 417
> > # 0x09, 0x06,                    // Usage (Keyboard)                   =
 419
> > # 0xa1, 0x01,                    // Collection (Application)           =
 421
> > # 0x85, 0x05,                    //  Report ID (5)                     =
 423
> > # 0x05, 0x07,                    //  Usage Page (Keyboard)             =
 425
> > # 0x19, 0xe0,                    //  Usage Minimum (224)               =
 427
> > # 0x29, 0xe7,                    //  Usage Maximum (231)               =
 429
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 431
> > # 0x25, 0x01,                    //  Logical Maximum (1)               =
 433
> > # 0x75, 0x01,                    //  Report Size (1)                   =
 435
> > # 0x95, 0x08,                    //  Report Count (8)                  =
 437
> > # 0x81, 0x02,                    //  Input (Data,Var,Abs)              =
 439
> > # 0x95, 0x01,                    //  Report Count (1)                  =
 441
> > # 0x75, 0x08,                    //  Report Size (8)                   =
 443
> > # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)              =
 445
> > # 0x95, 0x06,                    //  Report Count (6)                  =
 447
> > # 0x75, 0x08,                    //  Report Size (8)                   =
 449
> > # 0x15, 0x00,                    //  Logical Minimum (0)               =
 451
> > # 0x25, 0x65,                    //  Logical Maximum (101)             =
 453
> > # 0x05, 0x07,                    //  Usage Page (Keyboard)             =
 455
> > # 0x19, 0x00,                    //  Usage Minimum (0)                 =
 457
> > # 0x29, 0x65,                    //  Usage Maximum (101)               =
 459
> > # 0x81, 0x00,                    //  Input (Data,Arr,Abs)              =
 461
> > # 0xc0,                          // End Collection                     =
 463
> > #
> > R: 464 05 01 09 05 a1 01 85 01 09 01 a1 00 09 30 09 31 15 00 27 ff ff
> > 00 00 95 02 75 10 81 02 c0 09 01 a1 00 09 32 09 35 15 00 27 ff ff 00
> > 00 95 02 75 10 81 02 c0 05 02 09 c5 15 00 26 ff 03 95 01 75 0a
> > 81 02 15 00 25 00 75 06 95 01 81 03 05 02 09 c4 15 00 26 ff 03 95 01
> > 75 0a 81 02 15 00 25 00 75 06 95 01 81 03 05 01 09 39 15 01 25 08 35
> > 00 46 3b 01 66 14 00 75 04 95 01 81 42 75 04 95 01 15 00 25 00
> > 35 00 45 00 65 00 81 03 05 09 19 01 29 0f 15 00 25 01 75 01 95 0f 81
> > 02 15 00 25 00 75 01 95 01 81 03 05 0c 0a b2 00 15 00 25 01 95 01 75
> > 01 81 02 15 00 25 00 75 07 95 01 81 03 05 0c 09 01 a1 01 0a 85
> > 00 15 00 26 ff 00 95 01 75 08 81 02 0a 99 00 15 00 26 ff 00 95 01 75
> > 04 81 02 15 00 25 00 95 01 75 04 81 03 0a 81 00 15 00 26 ff 00 95 01
> > 75 04 81 02 15 00 25 00 95 01 75 04 81 03 c0 05 0f 09 21 85 03
> > a1 02 09 97 15 00 25 01 75 04 95 01 91 02 15 00 25 00 75 04 95 01 91
> > 03 09 70 15 00 25 64 75 08 95 04 91 02 09 50 66 01 10 55 0e 15 00 26
> > ff 00 75 08 95 01 91 02 09 a7 15 00 26 ff 00 75 08 95 01 91 02
> > 65 00 55 00 09 7c 15 00 26 ff 00 75 08 95 01 91 02 c0 05 0c 09 01 85
> > 0c a1 01 0a 9e 00 15 00 26 ff 00 95 01 75 08 81 02 0a a1 00 15 00 26
> > ff 00 95 01 75 08 81 02 0a a2 00 15 00 26 ff 00 95 01 75 08 81
> > 02 0a a3 00 15 00 26 ff 00 95 01 75 08 81 02 c0 c0 05 01 09 06 a1 01
> > 85 05 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81 02 95 01 75 08 81
> > 03 95 06 75 08 15 00 25 65 05 07 19 00 29 65 81 00 c0
> > N: Xbox Wireless Controller
> > I: 5 045e 0b22
> >
> > On Wed, Jan 31, 2024 at 2:57=E2=80=AFAM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Hi,
> > >
> > > [Adding Siarhei who added support for those controllers in the kernel=
]
> > >
> > > On Wed, Jan 31, 2024 at 7:27=E2=80=AFAM Taco Jerkface <tacodog311@gma=
il.com> wrote:
> > > >
> > > > Resending without HTML:
> > > >
> > > > Hi,
> > > >
> > > > I hope this is the correct contact for this report, I found you as =
the
> > > > maintainer in the hid-microsoft.c.
> > > >
> > > > I believe there is a bug in the microsoft bluetooth driver for the
> > > > Xbox Elite Series 2 controller.  I have been experiencing issues wi=
th
> > > > it that I initially thought were SDL related.  However the SDL team
> > > > seems to think this is driver related. My SDL bug report informatio=
n
> > > > is here:
> > > >
> > > > https://github.com/libsdl-org/SDL/issues/8907
> > >
> > > Hard to say anything with that bug report because we don't know what
> > > those tools are supposed to do, and how they access the device (hidra=
w
> > > or evdev).
> > >
> > > Note that the bluetooth version is using uhid because it's a BLE cont=
roller.
> > > Basically when there is a BLE controller, bluez handles the transport
> > > layer from userspace, and injects the events through uhid so that it'=
s
> > > handled as a normal kernel device.
> > >
> > > So there is no "uhid userspace driver", bluez just blindly forwards
> > > the events/reports/commands as it is told.
> > >
> > > >
> > > > Basically, SDL reads the controller correctly when connected by USB=
,
> > > > and if I run "controllermap" with root permission, but with user
> > > > permissions it misreads
> > >
> > > Using root or not shouldn't change the way your program sees the
> > > device: if you are capable of opening it, then you should get the sam=
e
> > > output.
> > >
> > > However, the immediate explanation that would come to my mind is that
> > > you are not using the "same" controller in both cases:
> > > - maybe that when you use it with root you are talking to the device
> > > through hidraw
> > > - maybe when you are not root you are talking to the device through e=
vdev
> > >
> > > Again, not knowing the tools doesn't help me here :(
> > >
> > > >  the number of buttons as 122, the first paddle
> > > > button on the back seems to act like the "screenshot" button from t=
he
> > > > 1914 controller, and the other paddle buttons are not read.  All
> > > > buttons read fine with evites, but the paddle buttons "KEY_UNKNOWN"
> > > >
> > > > type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 0
> > > >
> > > > Please let me know if there is a better contact for this, or if the=
re
> > > > is anything I can do to help identify the problem.
> > > >
> > >
> > > Ideally I'd like Siarhei to answer here. But in the meantime, we coul=
d
> > > fetch some logs from the device itself which would allow me to better
> > > understand the issue:
> > > please use hid-recorder from hid-tools[1] to get the logs, and attach
> > > the whole output, with a recording of the events that are problematic=
:
> > > $> pip3 install hid-tools
> > > $> sudo hid-recorder
> > >
> > > Please dump 2 hid-recorder outputs, one with USB, and one with
> > > Bluetooth, with the same event sequence if possible so we can compare
> > > between the 2.
> > >
> > > Cheers,
> > > Benjamin
> > >
> > > [1] https://gitlab.freedesktop.org/libevdev/hid-tools
> > >
>


