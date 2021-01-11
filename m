Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701F32F0C8F
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 06:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbhAKFl6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 00:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbhAKFl6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 00:41:58 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FFDC061786
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 21:41:17 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id x13so18998971oic.5
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 21:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aaghGwXhwHb6c1OJI6+t9e5vgxL5IhImdtWhkfCHZ3k=;
        b=CJaoYWxIiTAZukX0O2CgZrYhNd2YX8EWUcR4ZKjmU8RvkkyNFDlRfX/Wkoou2B4CEz
         sNiGnvYWglC+oOK2oXRFaAFu6CsN4uWFre4ipXVyQ6+91rzjRqQHN/JWWy8HSn2ns6Rq
         BGdG03g36aesO0X9hngzInKuyS75TM4rVnvV7WnMporN8cj/8ya9V4LQzqz4fBMhonqt
         tIMwVlO9L+2wbSLD/peVe9URNgjS+wdNvTuWdtq6AIcO0ntTJSTIN1OjUYOy3XUDD1ZE
         /onpAnII8NFnBkWzx1YzD7rJO9Flx5SXyO+F60+YxJXNpJtQCpvl3Px8tPp2ZdsTABj3
         E50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aaghGwXhwHb6c1OJI6+t9e5vgxL5IhImdtWhkfCHZ3k=;
        b=p4ABRixLQnp0RjPEyktwYJasnb3YafAw7Qce2zo292MiMXIbnrnplNvyFm8EAgtK1c
         h2gO5HggqH0rMeCtVJR8njHGyCItBOlzdH9g5WZq7TbF0+DilYKskd5wz29dgcMYn1Hb
         t03LmJNKiS2fDiQVC2Qs0o2rVWcMlad/sP8/57N2XNfeX7G7vJNbx1El3+f5kXkNqVu4
         wRGtDUDl+4XfEXmMs5ple0SXZi2VFz+/jDtyAPHIRK3kvlEziHo4y74enf3eBVXiL9O/
         xSajwNYLOJWAuzB7c+nqyfG5kEC47ZRVKKFAi3J3tuZuMKaFcZH26Aj/VMnaM/9i/5Bf
         h3uw==
X-Gm-Message-State: AOAM532vDHNxuAbITOPWyQ8Dyv8tx73QWsOgfRu8Zif+m+Rce4l4D2If
        X3Z46HO2EczVEOtdH4OatpwNDN0RqZrL2x7kwqaG0w==
X-Google-Smtp-Source: ABdhPJyFWicED+hgoVIO8fGyNPqMDRI2l717MIcV0z14dVRrCtGxP51InaswCNPKJ5j7cmEFmsFjlYLdCi2k9uRXqnQ=
X-Received: by 2002:aca:909:: with SMTP id 9mr9041279oij.69.1610343676814;
 Sun, 10 Jan 2021 21:41:16 -0800 (PST)
MIME-Version: 1.0
References: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
 <20201223055540.204685-1-jhp@endlessos.org> <nycvar.YFH.7.76.2101071019010.13752@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2101071019010.13752@cbobk.fhfr.pm>
From:   Jian-Hong Pan <jhp@endlessos.org>
Date:   Mon, 11 Jan 2021 13:40:25 +0800
Message-ID: <CAPpJ_edoMq0dSqOQuiRpV861brBTA8TyRXB=wyVuA=FwokFW9Q@mail.gmail.com>
Subject: Re: [PATCH v2] HID: Add Wireless Radio Control feature for Chicony devices
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chris Chiu <chiu@endlessos.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux@endlessos.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jiri Kosina <jikos@kernel.org> =E6=96=BC 2021=E5=B9=B41=E6=9C=887=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:23=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 23 Dec 2020, Jian-Hong Pan wrote:
>
> > Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> > "Wireless Radio Control" feature. For example, the wireless keyboard
> > [04f2:1236] shipped with ASUS all-in-one desktop.
> >
> > After consulting Chicony for this hotkey, learned the device will send
> > with 0x11 as the report ID and 0x1 as the value when the key is pressed
> > down.
> >
> > This patch maps the event as KEY_RFKILL.
>
> I don't know how exactly does the report descriptor of that device look
> like, but is this not doable from userspace via setkeycode() (udev/system=
d
> is shipping a lot of such mappings already -- see evdev/keyboard
> definitions in hwdb).

Thanks for your suggestion!

I have tested the key with evtest.  But it has no response from all
inputs.  Nor response from xev.

So, I tried usb monitor to see what does it send:

$ lsusb -d 04f2:1236
Bus 001 Device 002: ID 04f2:1236 Chicony Electronics Co., Ltd
$ sudo modprobe usbmon
$ sudo cat /sys/kernel/debug/usb/usbmon/1u
ffff9145e0dea6c0 348311963 C Ii:1:002:1 0:8 8 =3D 00000000 00000000
ffff9145e0dea6c0 348311996 S Ii:1:002:1 -115:8 8 <
ffff9145e0deaf00 352852533 C Ii:1:002:2 0:4 2 =3D 1101
ffff9145e0deaf00 352852547 S Ii:1:002:2 -115:4 3 <

It sends 0x1101 for the hotkey.  The same response from hid events:

$ sudo cat /sys/kernel/debug/hid/0003\:04F2\:1236.0002/events
report (size 2) (numbered) =3D  11 01

Then, I notice there is the RFKILL event listed on the "Chicony USB
Receiver Wireless Radio Control" device:

$ sudo evtest /dev/input/event8
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x4f2 product 0x1236 version 0x111
Input device name: "Chicony USB Receiver Wireless Radio Control"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 103 (KEY_UP)
    Event code 105 (KEY_LEFT)
    Event code 106 (KEY_RIGHT)
    Event code 108 (KEY_DOWN)
    Event code 116 (KEY_POWER)
    Event code 138 (KEY_HELP)
    Event code 139 (KEY_MENU)
    Event code 142 (KEY_SLEEP)
    Event code 143 (KEY_WAKEUP)
    Event code 148 (KEY_PROG1)
    Event code 174 (KEY_EXIT)
    Event code 227 (KEY_SWITCHVIDEOMODE)
    Event code 247 (KEY_RFKILL)
    Event code 314 (BTN_SELECT)
    Event code 315 (BTN_START)
    Event code 353 (KEY_SELECT)
    Event code 356 (KEY_POWER2)
    Event code 408 (KEY_RESTART)
    Event code 438 (KEY_CONTEXT_MENU)
  Event type 2 (EV_REL)
    Event code 9 (REL_MISC)
  Event type 3 (EV_ABS)
...

Also, after debugging, I found its HID application ID is
HID_GD_WIRELESS_RADIO_CTLS 0x0001000c [1].
Then, I searched HID_GD_WIRELESS_RADIO_CTLS in the kernel.  I found
HID_GD_RFKILL_BTN [2] is mapped in hid-input.
However, this key press on the Chicony keyboard maps to nothing, nor
HID_GD_RFKILL_BTN.  Only have the HID report with raw data 0x11 0x00
as mentioned above.
It is more like ignored by the kernel and it even has no scancode.
That's why I try to map it as KEY_RFKILL in the driver.

[1] https://elixir.bootlin.com/linux/v5.10/source/include/linux/hid.h#L181
[2] https://elixir.bootlin.com/linux/v5.10/source/drivers/hid/hid-input.c#L=
743

Regards,
Jian-Hong Pan
