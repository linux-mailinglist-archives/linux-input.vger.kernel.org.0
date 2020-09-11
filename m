Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A9B26679F
	for <lists+linux-input@lfdr.de>; Fri, 11 Sep 2020 19:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgIKRpz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 13:45:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46224 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgIKM3e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 08:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599827361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4cmK+jEtDKKanHKXe6ISW6QcXLS9lq2MRljBnTGtLZE=;
        b=baBw5RB6zj1trvhGXQLMiBTnKo4ZcYZaeqNZiVeImaz8GDtPPq634OIfZCs5405mAblDpv
        DfVC8NC1EIHPtHieOiZGhRnGNbn8dWpL8GrVq03sLCSUzZlaJ082vjSC874o4q0uWCZQrR
        763ZYvR14Gt+Q3y4haSHfFLLb3yA9lM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-9o1mXPSrOeSL0kd5fIbC_A-1; Fri, 11 Sep 2020 08:29:16 -0400
X-MC-Unique: 9o1mXPSrOeSL0kd5fIbC_A-1
Received: by mail-pf1-f197.google.com with SMTP id i128so6860820pfg.22
        for <linux-input@vger.kernel.org>; Fri, 11 Sep 2020 05:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4cmK+jEtDKKanHKXe6ISW6QcXLS9lq2MRljBnTGtLZE=;
        b=GU5v+r0zkZ3aEcMugpNHZuE+rwfKC2MdPfNUi8CezTCDbznY9bruBPi2hzGTJI1t3E
         ixozVBIERAwQsadcEOQeEW1bI9zbNcHKy7ODOxZF1E2Ax28QoFYLNzRA50mDNiJFufBX
         J+9MolLw6wGHGrhqpt8DlOkW0PW6sRYiKgny5UxVmsE2aRhhMv8oNQFKsTkvTcIgL6Qv
         TcD2OmX6TgxYfM2s8n6LasaD4pLjXpqymF+A54CvqsvVY6Ab0eWNQVL3ho2TEfS2puIv
         2lk0fsMLcdTh5NHzUWIYEHg1dgL5IkJMeuHuJZTOhW/1TLhV545xZmgUweJsuQysx6mF
         70lA==
X-Gm-Message-State: AOAM5311qGPEF1llYVxTRrGGzqc9d4XiX8LzX/JGnPuk0iwdOtyyasrX
        Ajm+Ak+WBlA3LZ/gd1q6wkoOT74OdpvcxUpHhFWVBWnY4+dULQlIq/sMrGqg4EUaI9ubMA5jmTF
        Er7RjspxIxMBQmnQ9/zG1rdN7XS6anyP7JueeOpw=
X-Received: by 2002:a62:ce8c:: with SMTP id y134mr1937608pfg.125.1599827355046;
        Fri, 11 Sep 2020 05:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHtQ2PhSKhNtF2SRjYFsQM1aCgLkHVRKm8wUJCdiOX0Eqy1uyc0iEZF3DY5GzMMF8OG0zvCsfKHOJTAcCD9eU=
X-Received: by 2002:a62:ce8c:: with SMTP id y134mr1937575pfg.125.1599827354501;
 Fri, 11 Sep 2020 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200811091445.erp2b23xmx3ceyzp@Rk> <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk> <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
 <20200910163729.z6gmpeg7x2ocjvpt@Rk>
In-Reply-To: <20200910163729.z6gmpeg7x2ocjvpt@Rk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Sep 2020 14:29:03 +0200
Message-ID: <CAO-hwJ+P3iU87Ra=3bzJ2f53hPPxGKb+v1+kPSNj5TJVy+NqGA@mail.gmail.com>
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Sep 10, 2020 at 6:37 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> On Fri, Sep 04, 2020 at 06:47:42PM +0200, Benjamin Tissoires wrote:
> >On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
> >>
> >> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
> >> >Hi,
> >> >
> >> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> I'm working on a touchpad device issue as reported on
> >> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
> >> >>
> >> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
> >> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
> >> >>
> >> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
> >> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
> >> >>         the device.
> >> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
> >> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
> >> >>      3. hid-multitouch.c claims handling devices with the group of
> >> >>         HID_GROUP_MULTITOUCH_WIN_8
> >> >>
> >> >>          static const struct hid_device_id mt_devices[] = {
> >> >>                 /* Generic MT device */
> >> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
> >> >>
> >> >>                 /* Generic Win 8 certified MT device */
> >> >>                 {  .driver_data = MT_CLS_WIN_8,
> >> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> >> >>                                 HID_ANY_ID, HID_ANY_ID) },
> >> >>                 { }
> >> >>          };
> >> >>
> >> >> There are several potential solutions,
> >> >>      - Let the device vendor fix this problem since this device's report
> >> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
> >> >>      - Make it a special case by setting the device's group to
> >> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
> >> >>        are matched.
> >> >>      - hid-quirks.c seems to be designed to handle special cases, is it
> >> >>        suitable for this case?
> >> >
> >> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
> >> >guess the best is to add the VID/PID to hid-quirks.c in
> >> >hid_have_special_driver[], and add it to the hid-rmi driver too.
> >> >This way, you will ensure hid-rmi will pick up the device all the time.
> >> >
> >> >Cheers,
> >> >Benjamin
> >>
> >> Thank you for the advice! I have exactly adopted this approach by looking
> >> at commit e9287099ba6539bccb20cd791269186f3ae28b85
> >> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
> >> as an example.
> >>
> >> My previous email is a bit misleading because 0x04F3 is the vendor code
> >> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
> >> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
> >> touchpads,
> >>
> >> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
> >>    except the clicking is not sensitive enough. I need to let my finger
> >>    linger on the touchpad for a while. I notice when I click on the touchpad,
> >>    an HID report would be received by hid-recorder. But evtest couldn't receive
> >>    any EV_ event. If hid-multitouch is handling the device, the cursor
> >>    won't move but 2-4 finger touching events could still be received by
> >>    evtest.
> >>
> >> - for the ELAN touchpad, only HID reporters can be read and parsed by
> >>    hid-core then two input devices (mouse and touchpad) could created by
> >>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
> >>    could never get any HID report.
> >
> >huh. So in both cases you have a buggy touchpad with hid-multitouch :(
> >
> >Do both touchpads share the same VID/PID? If so, this is going to be
> >interesting to decide how any of those touchpad should be handled.
>
> No, they have different VID/PIDs,
>   - 04F3:3140 (Elan)
>   - 06CB:7F28 (Synaptics)

That's good to know :)

>
> >
> >>
> >> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
> >> Precision Touchpad?
> >
> >yes, it works for most of those. The only ones that are not working
> >are usually because OEM or device makers tend to do "fun" things.
> >
> >>  And since Precision touchpad is mandatory for
> >> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
> >> seem to have been certificated by Windows 10, does it mean by theory
> >> hid-multiouch could handle these two touchpad devices?
> >
> >Well, it should, yes, but it clearly can not. You can try to give a
> >try at hid-recorder from
> >https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
> >is actually exported by the hardware before any processing by the
> >kernel. Maybe there is a new simple thing to do in hid-multitouch to
> >handle those devices.
> >
> >Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
> >of hid-multitouch. Any hid-rmi touchpad should be able to use
> >hid-multitouch, as this is the preferred way on Windows. But sometimes
> >the various teams decide to change the rules.
> >
> >>
> >> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
> >> HID reports to see what's happening. Or do you have any suggestion?
> >
> >Unless it changed recently (I think I have seen something like that
> >recently), I had to write a I2C man-in-the-middle to dump the logs
> >from Windows. Project is at
> >https://github.com/bentiss/SimplePeripheralBusProbe and requires a
> >little bit of manual work to be able to start capturing data :(
> >
> >Cheers,
> >Benjamin
> >
> >>
> >> --
> >> Best regards,
> >> Coiby
> >>
> >
>
> Thank you for developing hid-tools and SimplePeripheralBusProbe!

No worries.

Wow, I am really impressed in how quickly you managed to get all that
data. I think it's the first time I ever point somebody at
SimplePeripheralBusProbe, and I don't have to do anything to get this
up and running, and analyzed :)

>
> The problem with the Synaptics touchpad when it's handled by hid-multiouch
> is the pointer won't move. A few days ago, I took another look at the
> results produced by hid-recorder and evtest and noticed something abnormal
> for the Synaptics touchpad. For a straight continuous motion of one finger,
> the value of ABS_MT_TRACKING_ID kept changing,
>
> $ sudo evtest
> ...
> Event: time 1599651409.969002, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 68
> Event: time 1599651409.969002, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 401
> Event: time 1599651409.969002, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 201
> Event: time 1599651409.969002, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> Event: time 1599651409.969002, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
> Event: time 1599651409.969002, type 3 (EV_ABS), code 0 (ABS_X), value 401
> Event: time 1599651409.969002, type 3 (EV_ABS), code 1 (ABS_Y), value 201
> Event: time 1599651409.969002, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 0
> Event: time 1599651409.969002, -------------- SYN_REPORT ------------
> Event: time 1599651410.070105, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
> Event: time 1599651410.070105, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1599651410.070105, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
> Event: time 1599651410.070105, -------------- SYN_REPORT ------------
> Event: time 1599651410.093740, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 69
> Event: time 1599651410.093740, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> Event: time 1599651410.093740, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
> Event: time 1599651410.093740, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 7200
> Event: time 1599651410.093740, -------------- SYN_REPORT ------------
> Event: time 1599651410.196576, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
> Event: time 1599651410.196576, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1599651410.196576, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
> Event: time 1599651410.196576, -------------- SYN_REPORT ------------
> Event: time 1599651410.219020, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 70
> Event: time 1599651410.219020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 406
> Event: time 1599651410.219020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 204
> Event: time 1599651410.219020, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> Event: time 1599651410.219020, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
> Event: time 1599651410.219020, type 3 (EV_ABS), code 0 (ABS_X), value 406
> Event: time 1599651410.219020, type 3 (EV_ABS), code 1 (ABS_Y), value 204
> Event: time 1599651410.219020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 129000
> Event: time 1599651410.219020, -------------- SYN_REPORT ------------
> Event: time 1599651410.320097, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
> Event: time 1599651410.320097, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1599651410.320097, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
> Event: time 1599651410.320097, -------------- SYN_REPORT ------------
> Event: time 1599651410.343867, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 71
> Event: time 1599651410.343867, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 424
> Event: time 1599651410.343867, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 218
> Event: time 1599651410.343867, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
> Event: time 1599651410.343867, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
> Event: time 1599651410.343867, type 3 (EV_ABS), code 0 (ABS_X), value 424
> Event: time 1599651410.343867, type 3 (EV_ABS), code 1 (ABS_Y), value 218
> Event: time 1599651410.343867, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 250900
> ...
>
> while hid-recorder showed "Tip Switch" remained 1 and the "contact Id"
> remained 0 for this set of reports,
>
> $ sudo hid-recorder
>
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14579 | Contact Count:    1 | Button: 0 | #
> E: 000000.000000 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f3 38 01 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14651 | Contact Count:    1 | Button: 0 | #
> E: 000000.124738 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3b 39 01 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    406 | Y:    204
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  15869 | Contact Count:    1 | Button: 0 | #
> E: 000000.249932 30 03 03 96 01 cc 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fd 3d 01 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    424 | Y:    218
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  17088 | Contact Count:    1 | Button: 0 | #
> E: 000000.374781 30 03 03 a8 01 da 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 42 01 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    449 | Y:    251
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  18379 | Contact Count:    1 | Button: 0 | #
> E: 000000.499704 30 03 03 c1 01 fb 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cb 47 01 00
> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    475 | Y:    281
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  19598 | Contact Count:    1 | Button: 0 | #
>
>
> I managed to let hid-multitouch to send the set of input events with the
> same ABS_MT_TRACKING_ID by disabling the release_timer via commenting out
> the following code,
>
> // drivers/hid/hid-multitouch.c
> static void mt_touch_report(struct hid_device *hid,
>                             struct mt_report_data *rdata)
> {
>      ...
>          * Windows 8 specs says 2 things:
>          * - once a contact has been reported, it has to be reported in each
>          *   subsequent report
>          * - the report rate when fingers are present has to be at least
>          *   the refresh rate of the screen, 60 or 120 Hz
>          *
>          * I interprete this that the specification forces a report rate of
>          * at least 60 Hz for a touchscreen to be certified.
>          * Which means that if we do not get a report whithin 16 ms, either
>          * something wrong happens, either the touchscreen forgets to send
>          * a release. Taking a reasonable margin allows to remove issues
>          * with USB communication or the load of the machine.
>          *
>          * Given that Win 8 devices are forced to send a release, this will
>          * only affect laggish machines and the ones that have a firmware
>          * defect.
>          */
>         /* if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
>                 if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
>                         mod_timer(&td->release_timer,
>                                   jiffies + msecs_to_jiffies(100));
>                 else
>                         del_timer(&td->release_timer);
>         } */
>      ...
> }
>
> Now the pointer can move but there is a noticeable lag as I move my
> finger. evhz shows the report rate is only ~7Hz. While under Windows,
> SimplePeripheralBusProbe shows there are 25+ reports for one finger
> sliding event. This also explains why under Linux release_timer keeping
> inactivating report slots.

Yep, you found the root cause. We don't have enough reports to ensure
a proper reporting mechanism.

>
>
> Comparing the hid commands sent between Windows and Linux, they are
> almost identical. SimplePeripheralBusProbe doesn't record hid commands
> like fetching HID descriptor, report descriptor, resetting the device.
> I haven't yet found a clue about why this Synaptics touchpad operates
> with such a report rate under Linux.
>
> Under Linux, the follow hid commands are sent to the touchpad device.
>
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=20 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 01
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=21 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 37 02 23 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 3d 03 23 00 04 00 0d 00
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 34 03 23 00 04 00 04 03
> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 36 03 23 00 04 00 06 03
>
> whereas under Windows,
>
> [0]0000.0000::09/09/2020-14:41:47.732 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 38 02 23 00
> [0]0000.0000::09/09/2020-14:41:47.740 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 37 02 23 00
> [0]0000.0000::09/09/2020-14:41:47.741 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 3d 03 23 00 04 00 0d 00
> [0]1AB4.3074::09/09/2020-14:41:47.743 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
>

Thanks for comparing the 2. As you noticed, there doesn't seem to be
any differences.
My initial thoughts were that we were wrongly setting the "Latency
mode" [0]. But this should have been shown in the differences. I
*think* we set it in hid-multitouch, but it can't hurt to do a couple
of additional tests on this side.

The other thing that might explain the difference, is at the I2C
level. I see on the dmesg that the touchpad is attached to
AMDI0010:03. I wonder if there is not a misconfiguration on the AMD
I2C adapter driver that prevents the touchpad from using the correct
report rate.

Unfortunately, I don't know much about this driver, but maybe given
all you showed to me you could have a look too? :)

Cheers,
Benjamin

[0] https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#latency-mode-feature-report

