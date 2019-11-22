Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D413E1068C9
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 10:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfKVJZd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 04:25:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44116 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726563AbfKVJZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 04:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574414731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CXUUpsyWDU2cM+cLUQA59TfrNDN+V8AzlITcV72K0sY=;
        b=dG+CJPnYIzTSyqr+cW5+HInaSS9v24lz0cn8TUTAZNgYCmu2goKDTJJaUsc8oD9A+5xJ0r
        fSuRik8aX76yAasQibnktlHclZBd35L6O9golO4laLVnj6OwrZoP1ftST0EiEi5taedVW+
        QPgHB5G5J01yCqHPQdl8HgvkOS/Esyo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-SGbT6JxiOuOP1taCk-eGew-1; Fri, 22 Nov 2019 04:25:29 -0500
Received: by mail-qv1-f69.google.com with SMTP id q2so4245978qvo.23
        for <linux-input@vger.kernel.org>; Fri, 22 Nov 2019 01:25:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8Fu7I27sg+o3llq8fP65oxlC1QYK1v+B/6fffBIWf8=;
        b=Kljo9EQvtT5n4jHfM/qogoXpHhzSkVMf/XLqQcpvFJ/8fsJ3x2fsZkhA6mHgReFtnu
         1DaOA84DAR2/1U4yWSw0qiUDS1C+RPdFAfmr0xcQyw0EH/zw6Jc0KU+ALLiOgkoSf9IE
         Dz7ysy5VnZlcoRO7NSaa+MQOXQ3IYJkOcYn75HJ7snfpqVq/+B9hxgxieqGph3W8nstG
         dmvCvzBL9TRz6JCNlPNKquoI27gisEm+vbz9FV/vRGTE3eYUR6pRP4+xBQq+30Borm1u
         f4zlcHJXsdxWfi4aTZXDanu/vxgzllO0TKsrDj6KQsebSzblY5oUCZyq98CDdEHHJ5ER
         YpdQ==
X-Gm-Message-State: APjAAAU8x/Cnp9Rku5Dxi6eTN4s38EqGNAWJGzA8UEimUnsS+fqjwpya
        lL7YzQU2JQbqn+E+9DrcT2uTlX3x+WefsrZ6xcR1m5sPKGLmPdXIJcwi1ApFmHwS/ZYJ3F/4qNg
        O7FabOHDh+9Q8hun5qhDpYJexBO3rEedVAy8e/24=
X-Received: by 2002:aed:36a1:: with SMTP id f30mr13265392qtb.154.1574414728592;
        Fri, 22 Nov 2019 01:25:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyD37BLMlqnPOCX8i6ROdXzmtyW9EeZ7JDJ5JAHnSGaVnVpukZ6YHiBldF7Bg5sWuyrWfNns/8JSOlSAb/Kh9Y=
X-Received: by 2002:aed:36a1:: with SMTP id f30mr13265368qtb.154.1574414728151;
 Fri, 22 Nov 2019 01:25:28 -0800 (PST)
MIME-Version: 1.0
References: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
 <CAO-hwJLdz1sA4tNsLLgZKGA7Ko6dqt9VF5T2nh5uczHxU532HA@mail.gmail.com>
 <4eecbd2a-9d19-c6a2-a95b-656e3fce05a4@codeaurora.org> <0101016e916ab42c-fbc61178-9bdd-42ba-b111-722c46db5dc1-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e916ab42c-fbc61178-9bdd-42ba-b111-722c46db5dc1-000000@us-west-2.amazonses.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 22 Nov 2019 10:25:16 +0100
Message-ID: <CAO-hwJLDtz7mjWDdqoMKtFjAoweUFq3bAJ2ovbtg0_Gji1nW1w@mail.gmail.com>
Subject: Re: Query regarding hid-multitouch.c driver in 4.14/4.19
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, prsood@codeaurora.org,
        gkohli@codeaurora.org
X-MC-Unique: SGbT6JxiOuOP1taCk-eGew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Neeraj,

On Fri, Nov 22, 2019 at 5:42 AM Neeraj Upadhyay <neeraju@codeaurora.org> wr=
ote:
>
> Hi Benjamin,
>
> Can you please provide guidance on how to workaround this problem? Is it
> possible to support the 4.14 kernel behaviour again, so that existing
> clients are not impacted?

Hmm, hard to say. Both evdev outputs from 4.14 and 4.19 are
technically valid. So I guess the issue is more that the android
version you are using is not interpreting correctly the 4.19 event
stream and probably requires some more events (like pressure or
width/height).

Also, the report descriptor is crap:

0x05, 0x0d,                    // Usage Page (Digitizers)             0
0x09, 0x02,                    // Usage (Pen)                         2
0xa1, 0x01,                    // Collection (Application)            4
0x85, 0x01,                    //  Report ID (1)                      6
0x09, 0x22,                    //  Usage (Finger)                     8
0xa1, 0x02,                    //  Collection (Logical)               10
0x09, 0x42,                    //   Usage (Tip Switch)                12
0x15, 0x00,                    //   Logical Minimum (0)               14
0x25, 0x01,                    //   Logical Maximum (1)               16
0x75, 0x01,                    //   Report Size (1)                   18
0x95, 0x01,                    //   Report Count (1)                  20
0x81, 0x02,                    //   Input (Data,Var,Abs)              22
0x09, 0x32,                    //   Usage (In Range)                  24
0x81, 0x02,                    //   Input (Data,Var,Abs)              26
0x95, 0x06,                    //   Report Count (6)                  28
0x81, 0x03,                    //   Input (Cnst,Var,Abs)              30
0x75, 0x08,                    //   Report Size (8)                   32
0x09, 0x51,                    //   Usage (Contact Id)                34
0x95, 0x01,                    //   Report Count (1)                  36
0x81, 0x02,                    //   Input (Data,Var,Abs)              38
0x05, 0x01,                    //   Usage Page (Generic Desktop)      40
0x26, 0xff, 0x0f,              //   Logical Maximum (4095)            42
0x75, 0x10,                    //   Report Size (16)                  45
0x55, 0x0e,                    //   Unit Exponent (-2)                47
0x65, 0x33,                    //   Unit (Inch^3,EngLinear)           49
0x09, 0x30,                    //   Usage (X)                         51
0x35, 0x00,                    //   Physical Minimum (0)              53
0x46, 0xb5, 0x04,              //   Physical Maximum (1205)           55
0x81, 0x02,                    //   Input (Data,Var,Abs)              58
0x46, 0x8a, 0x03,              //   Physical Maximum (906)            60
0x09, 0x31,                    //   Usage (Y)                         63
0x81, 0x02,                    //   Input (Data,Var,Abs)              65
0xc0,                          //  End Collection                     67
0x05, 0x0d,                    //  Usage Page (Digitizers)            68
0x09, 0x54,                    //  Usage (Contact Count)              70
0x95, 0x01,                    //  Report Count (1)                   72
0x75, 0x08,                    //  Report Size (8)                    74
0x81, 0x02,                    //  Input (Data,Var,Abs)               76
0x85, 0x08,                    //  Report ID (8)                      78
0x09, 0x55,                    //  Usage (Contact Max)                80
0x25, 0x05,                    //  Logical Maximum (5)                82
0xb1, 0x02,                    //  Feature (Data,Var,Abs)             84
0xc0,                          // End Collection                      86
0x05, 0x0c,                    // Usage Page (Consumer Devices)       87
0x09, 0x01,                    // Usage (Consumer Control)            89
0xa1, 0x01,                    // Collection (Application)            91
0x85, 0x02,                    //  Report ID (2)                      93
0x09, 0xe9,                    //  Usage (Volume Up)                  95
0x09, 0xea,                    //  Usage (Volume Down)                97
0x0a, 0xae, 0x01,              //  Usage (AL Keyboard Layout)         99
0x09, 0xe2,                    //  Usage (Mute)                       102
0x09, 0x30,                    //  Usage (Power)                      104
0x15, 0x01,                    //  Logical Minimum (1)                106
0x25, 0x0c,                    //  Logical Maximum (12)               108
0x75, 0x10,                    //  Report Size (16)                   110
0x95, 0x01,                    //  Report Count (1)                   112
0x81, 0x00,                    //  Input (Data,Arr,Abs)               114
0xc0,                          // End Collection                      116

It declares right at the beginning a Pen application collection then a
Finger logical application. This should never happen as you can not
use a pen with a bare finger.

Anyway, there are a few things you could do to solve the issue,
depending on what you are allowed to do:
- if you can tweak the kernel, then maybe adding an extra kernel
module that just binds to the device without changing anything in
probe or in events might do the trick. For extra safety you should
probably fix the report descriptor in this new kernel module
- if you can tweak bluez or the device itself, at least change the
ContactID usage to 00 (byte offset 35 above: change 0x51 to 0x00). It
would be best to actually change the whole report descriptor with the
correct applications, but, meh, this seems to be working.
- if you can tweak android, then ensure it can understand this
particular event stream

Anyway, I don't think this is an upstream problem, as the device
behaves somehow correctly by 5.3, at least it sends me the events I
expect. So I can't really spend a lot of time providing a workaround
for that.

My best bet would be to contact the device maker, and ask them to fix
their device to be working with 4.19 kernel.

Cheers,
Benjamin

>
>
> Thanks
> Neeraj
>
> On 11/14/2019 10:01 AM, Neeraj Upadhyay wrote:
> > Hi Benjamin,
> >
> > Sorry for the delay, was waiting for the required information from our
> > team.
> >
> > On 11/13/2019 3:00 PM, Benjamin Tissoires wrote:
> >> Hi Neeraj,
> >>
> >> On Wed, Nov 13, 2019 at 4:11 AM Neeraj Upadhyay
> >> <neeraju@codeaurora.org> wrote:
> >>> Hi,
> >>>
> >>> I have one query regarding hid-multitouch.c driver and need your
> >>> guidance on
> >>> how hid-multitouchc can restore/support the original behaviour,
> >>> where, for
> >>> devices, for which application is not
> >>> HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD, and has
> >>> HID_DG_CONTACTID usage in its report, can still use generic input
> >>> mappings.
> >>>
> >>> We are using kernel versions 4.14 , 4.19 respectively in 2 different
> >>> projects:
> >>>
> >>> 4.14:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/drivers/hid/hid-multitouch.c?h=3Dv4.14.153
> >>>
> >>> 4.19:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/drivers/hid/hid-multitouch.c?h=3Dv4.19.83
> >>>
> >>>
> >>> I checked the application for our hid device, it's HID_DG_PEN, device
> >>> also has a HID_DG_CONTACTID usage defined in
> >>>
> >>> its report.
> >>>
> >>> In 4.19, is_mt_collection is set to 'true'. All multitouch code paths=
 or
> >>> input mapping is configured
> >>>
> >>> mt_allocate_report_data()
> >>>           ...
> >>>           for (n =3D 0; n < field->report_count; n++) {
> >>>                           if (field->usage[n].hid =3D=3D HID_DG_CONTA=
CTID)
> >>>                                   rdata->is_mt_collection =3D true;  =
 //
> >>> is_mt_collection is set to 'true'
> >>>                   }
> >>>           }
> >>>
> >>> mt_input_mapping()
> >>>           ...
> >>>           if (rdata->is_mt_collection)
> >>>               return mt_touch_input_mapping(...)  //
> >>> mt_touch_input_mapping() is called
> >>>
> >>> mt_event()
> >>>           if (rdata && rdata->is_mt_collection)
> >>>               return mt_touch_event();  // mt_touch_event() is called
> >>>
> >>> However, in 4.14, the behaviour was different, mt input mapping was d=
one
> >>> only
> >>> for HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD , and because our hid device i=
s
> >>> HID_DG_PEN, generic mappings were applied for it; with these settings=
,
> >>> device
> >>> responds to events.
> >>>
> >>> static int mt_input_mapping()
> >>>           if (field->application =3D=3D HID_DG_TOUCHSCREEN ||
> >>>               field->application =3D=3D HID_DG_TOUCHPAD)
> >>>               return mt_touch_input_mapping();  // This is not called=
.
> >>>
> >>>
> >>> mt_touch_input_mapping()
> >>>           case HID_DG_CONTACTID:
> >>>                           mt_store_field(usage, td, hi);
> >>>                           td->touches_by_report++;
> >>>                           td->mt_report_id =3D field->report->id; //
> >>> mt_report_id is not set.
> >>>                           return 1;
> >>>
> >>>
> >>> Looks like this behaviour changed, with below commits:
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/drivers/hid/hid-multitouch.c?h=3Dv4.19.83&id=3D8dfe14b3b47ff832cb638731f=
9fc696a3a84f804
> >>>
> >>> 8dfe14b3b47f    HID: multitouch: ditch mt_report_id
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/drivers/hid/hid-multitouch.c?h=3Dv4.19.83&id=3Dba6b055e0f3b4ff4942e4ab27=
3260affcfad9bff
> >>>
> >>> ba6b055e0f3b     HID: input: enable Totem on the Dell Canvas 27
> >>>
> >>> Can you please suggest on how we can support/preserve the original
> >>> behaviour?
> >> Hmm, I would initially say that a firmware that exports Contact ID for
> >> a Pen is definitely wrong. The Contact ID usage has been introduced in
> >> https://www.usb.org/sites/default/files/hutrr34.pdf and is
> >> specifically for multi-touch, not multi pen.
> >>
> >> Anyway, couple of questions:
> >> - does the device supports multi-pen?
> >
> > Actually the device is a selfie stick device:
> > https://item.jd.com/33082497741.html
> >
> > It does not support multi-pen.
> >
> >> - can you share the report descriptor and a few events when triggering
> >> this particular report (ideally with hid-recorder from
> >> https://gitlab.freedesktop.org/libevdev/hid-tools/
> >
> > Report descriptor is below:
> >
> > 05 0d 09 02 a1 01 85 01 09 22 a1 02 09 42 15 00 25 01 75 01 95 01 81 02
> > 09 32 81 02 95 06 81 03 75 08 09 51 95 01 81 02 05 01 26 ff 0f 75 10 55
> > 0e 65 33 09 30 35 00 46 b5 04 81 02 46 8a 03 09 31 81 02 c0 05 0d 09 54
> > 95 01 75 08 81 02 85 08 09 55 25 05 b1 02 c0 05 0c 09 01 a1 01 85 02 09
> > e9 09 ea 0a ae 01 09 e2 09 30 15 01 25 0c 75 10 95 01 81 00 c0
> >
> > Events were collected using getevent call in adb shell in android:
> >
> > On 4.19
> >
> > # getevent -l
> >
> > add device 7: /dev/input/event6
> >    name:     "BLE-M1 UNKNOWN"
> >
> > /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000000
> > /dev/input/event6: EV_ABS       ABS_MT_POSITION_X    00000800
> > /dev/input/event6: EV_ABS       ABS_MT_POSITION_Y    00000d60
> > /dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
> > /dev/input/event6: EV_SYN       SYN_REPORT           00000000
> > /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
> > /dev/input/event6: EV_KEY       BTN_TOUCH            UP
> > /dev/input/event6: EV_SYN       SYN_REPORT           00000000
> > /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000001
> > /dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
> > /dev/input/event6: EV_SYN       SYN_REPORT           00000000
> > /dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
> > /dev/input/event6: EV_KEY       BTN_TOUCH            UP
> > /dev/input/event6: EV_SYN       SYN_REPORT           00000000
> >
> > On 4.14
> >
> > add device 2: /dev/input/event5
> >    name:     "BLE-M1 UNKNOWN"
> >
> > /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
> > /dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
> > /dev/input/event5: EV_KEY       BTN_DIGI             DOWN
> > /dev/input/event5: EV_ABS       ABS_MISC             00000001
> > /dev/input/event5: EV_ABS       ABS_X                00000800
> > /dev/input/event5: EV_ABS       ABS_Y                00000d60
> > /dev/input/event5: EV_ABS       0029                 00000001
> > /dev/input/event5: EV_SYN       SYN_REPORT           00000000
> >
> > /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
> > /dev/input/event5: EV_KEY       BTN_TOUCH            UP
> > /dev/input/event5: EV_KEY       BTN_DIGI             UP
> > /dev/input/event5: EV_ABS       0029                 00000000
> > /dev/input/event5: EV_SYN       SYN_REPORT           00000000
> >
> > /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
> > /dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
> > /dev/input/event5: EV_KEY       BTN_DIGI             DOWN
> > /dev/input/event5: EV_ABS       0029                 00000001
> > /dev/input/event5: EV_SYN       SYN_REPORT           00000000
> >
> > /dev/input/event5: EV_MSC       MSC_SCAN             000d0042
> > /dev/input/event5: EV_KEY       BTN_TOUCH            UP
> > /dev/input/event5: EV_KEY       BTN_DIGI             UP
> > /dev/input/event5: EV_ABS       0029                 00000000
> > /dev/input/event5: EV_SYN       SYN_REPORT           00000000
> >
> >
> > As I have little understanding of the framework, use cases and of the
> > flow, I am sorry, if the information provided above is
> >
> > incomplete (w.r.t. what you were expecting).
> >
> >
> > Thanks
> >
> > Neeraj
> >
> >> Cheers,
> >> Benjamin
> >>
> >>>
> >>> Thanks
> >>> Neeraj
> >>>
> >>> --
> >>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> >>> member of the Code Aurora Forum, hosted by The Linux Foundation
> >>>
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of the Code Aurora Forum, hosted by The Linux Foundation
>

