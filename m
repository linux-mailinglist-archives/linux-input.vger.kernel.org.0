Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488CD1DFAA0
	for <lists+linux-input@lfdr.de>; Sat, 23 May 2020 21:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgEWTMb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 May 2020 15:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgEWTM3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 May 2020 15:12:29 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA41C061A0E
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 12:12:27 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id r2so4732808ioo.4
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XmbjjpR3KkNWUthne/j00L329uY7GCEFcw7JKzIu2SU=;
        b=IzfA78cHD0SpBE2sgO24h+Nxg7cFX0aHwm02wdLFwWGAjgi0qhtee6W3x+6k6epKTf
         SI3tiXsjfACbwkkd2Jipf4Flb5B8vzBFa7Dsoj+zEy+LhURVqc4OJO+p6fjRI1fsdHpN
         DjbrdyjOkXAX+ntqHu3EbOM3jgghjPpcrgRgv8NKGSh3ZG6TppS6QRdAShy1wgZMdGFe
         y4id6xcJPi94iKOiDHEJ6S3iwfVEA6fTd8coJBx0viTL8yV3Egdmz1jxSkGfxP/CH601
         s/i70rDASdcw0j4b8AAVMcCKphpEuMWbGJCDnZPiF84HdyM318lPxNc03UzJjLgdwUci
         0c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XmbjjpR3KkNWUthne/j00L329uY7GCEFcw7JKzIu2SU=;
        b=sQwqpKc/ybHNBRu4Zzo6dkU0akFKpOCR1gPFKYFxNfyOiOxW1cZZxQJkEHU0q+aERR
         CsMB+OE5aNVuT5QcksoehbzO60GFl6etVKp0BBjochK4BjtaQWFeg8ZJUHDrDVuqDc+q
         iLMWnygNz33dmhsocD+Y5XkNFIacDF7ow/fRQlGNCPuwYYBelmunWbEx8rgo2AlyEHAs
         jo1jdtbznPhUkmp1Z2bVaKN8ilLkGUzcC7qo90wFG+qbRRTuaR2qszebdlR5SZBxMjm3
         X2ZrTmOaWtxM1hVn7iNnFTBhIhO0YXjA0S4DO+PR3g/VMIn79tzoRZbVt/8vOu3RW+9L
         xSCA==
X-Gm-Message-State: AOAM533mT2yRPgjZP6CXDFPIqTqlBpjs+fdOzTafcfeEq3NWEZxrmUzw
        J2+/+n4hBRAfQIVpy5bzeDMr3ng1SfnriSOHxfE=
X-Google-Smtp-Source: ABdhPJydl49ihAQqg6S6yT2lJ3krCQDdwO2OMB2sIkmLs5wiX6V7rOyz0IbFqvHdQFOMVw2/PcEIQ/T+WiLHDkgFtBo=
X-Received: by 2002:a5e:df49:: with SMTP id g9mr4425190ioq.153.1590261146700;
 Sat, 23 May 2020 12:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws> <20200512051925.GA48688@koala>
 <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
 <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com> <20200523183734.GC89269@dtor-ws>
In-Reply-To: <20200523183734.GC89269@dtor-ws>
From:   Yariv <oigevald+kernel@gmail.com>
Date:   Sat, 23 May 2020 22:11:50 +0300
Message-ID: <CAEwx+Qr=nJ0tPcuHhjO4=Mw_OHr17QcqeqTvcEzgZ0EcoNc8GQ@mail.gmail.com>
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery (regression)
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I omitted what looks unrelated, please let me know if you need other
details or the full content.
Also I wasn't sure how to find the relevant driver, so I pasted the
relevant dmesg snippets. If there is a more precise way to identify
the driver please let me know and I'll send the missing items.

Gen1:

dmesg

[   11.307056] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[   11.307060] Bluetooth: HIDP socket layer initialized
[   11.310541] magicmouse 0005:05AC:030E.0005: unknown main item tag 0x0
[   11.310657] input: john=E2=80=99s Trackpad as
/devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hci0/hci0:70/=
0005:05AC:030E.0005/input/input21
[   11.310776] magicmouse 0005:05AC:030E.0005: input,hidraw4:
BLUETOOTH HID v1.60 Mouse [john=E2=80=99s Trackpad] on 00:1a:7d:da:71:09

/proc/bus/input/devices

I: Bus=3D0005 Vendor=3D05ac Product=3D030e Version=3D0160
N: Name=3D"john=E2=80=99s Trackpad"
P: Phys=3D00:1a:7d:da:71:09
S: Sysfs=3D/devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hc=
i0/hci0:70/0005:05AC:030E.0005/input/input21
U: Uniq=3Dd0:a6:37:f2:c3:af
H: Handlers=3Dmouse1 event21
B: PROP=3D5
B: EV=3D10001b
B: KEY=3De520 10000 0 0 0 0
B: ABS=3D273800000000003
B: MSC=3D10

Gen2:

dmesg

[13777.762475] magicmouse 0005:004C:0265.0008: unknown main item tag 0x0
[13777.762721] input: Apple Inc. Magic Trackpad 2 as
/devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hci0/hci0:65/=
0005:004C:0265.0008/input/input24
[13777.763419] magicmouse 0005:004C:0265.0008: input,hidraw5:
BLUETOOTH HID v1.00 Mouse [Julo=E2=80=99s Trackpad] on 00:1a:7d:da:71:09

/proc/bus/input/devices

I: Bus=3D0005 Vendor=3D004c Product=3D0265 Version=3D0100
N: Name=3D"Apple Inc. Magic Trackpad 2"
P: Phys=3D00:1a:7d:da:71:09
S: Sysfs=3D/devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hc=
i0/hci0:65/0005:004C:0265.0008/input/input24
U: Uniq=3D04:4b:ed:ec:b3:9c
H: Handlers=3Dmouse2 event22
B: PROP=3D5
B: EV=3Db
B: KEY=3De520 10000 0 0 0 0
B: ABS=3D673810001000003

Best regards,
Yariv

On Sat, May 23, 2020 at 9:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi,
>
> On Fri, May 22, 2020 at 08:27:43AM +0300, Yariv wrote:
> >
> > Some things I noticed: Gen2 didn't send "BTN_TOOL_FINGER" events,
> > while Gen1 did, even though I did not press any button. Note that Gen1
> > still had correct timestamps before the regression, even though it
> > sent these events.
> >
> > Another difference (maybe it's the same one..): if you take a look at
> > the logs from my previous mail, you'll notice that Gen1 Trackpads
> > always send both SYN_REPORT (0) as well as SYN_REPORT (1), while 2nd
> > Gen Trackpads only sends SYN_REPORT (0).
>
> So it looks like for Gen1 touchpads we set autorepeat, and it is that
> autorepeat on BTN_TOOL_FINGER that gives what you consider jitter.
>
>   - evdev:
>     - [  0, 293648,   1, 325,       2] # EV_KEY / BTN_TOOL_FINGER        =
   2
>     - [  0, 293648,   0,   0,       1] # ------------ SYN_REPORT (1) ----=
------ +1ms
>   - evdev:
>     - [  0, 303026,   3,  48,      88] # EV_ABS / ABS_MT_TOUCH_MAJOR     =
  88 (-12)
>     - [  0, 303026,   3,  53,    -232] # EV_ABS / ABS_MT_POSITION_X      =
-232 (-22)
>     - [  0, 303026,   3,  54,     291] # EV_ABS / ABS_MT_POSITION_Y      =
 291 (+60)
>     - [  0, 303026,   3,   0,    -232] # EV_ABS / ABS_X                  =
-232 (-22)
>     - [  0, 303026,   3,   1,     291] # EV_ABS / ABS_Y                  =
 291 (+60)
>     - [  0, 303026,   0,   0,       0] # ------------ SYN_REPORT (0) ----=
------ +10ms
>
> Can you please tell me what drivers are used by the 2 trackpads when they
> are connected via Bluetooth? I think we should stop setting autorepeat in
> the driver that handles Gen 1.
>
> Also, can you post /proc/bus/input/devices?
>
> Thanks.
>
> --
> Dmitry
