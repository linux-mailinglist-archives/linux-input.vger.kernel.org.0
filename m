Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA8226A2F8
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 12:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOKPB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 06:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOKPB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 06:15:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F77C06174A
        for <linux-input@vger.kernel.org>; Tue, 15 Sep 2020 03:15:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j34so1728436pgi.7
        for <linux-input@vger.kernel.org>; Tue, 15 Sep 2020 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nmnRuX8kV7zJ4o7yJ1IDcFMMfz90MgXzWwS0ef4V34w=;
        b=W7l5rQIKCpo3292k/cZv0pBEyahePKD0QWZNXVWHoaGLhHRupkA8Dt6qNpY9tTbvqt
         qAD9DS06qDtz1BORmmMslAjo0KPYlOYtskBP5akvp1Vvpo5dno7ZTq2yJx+fkBfrDsFI
         44CFOT6r12INkPMT5uWXc2PRgH+76EYNaJOLSEdkHCNIAVmg92E501YFD1P47boeRgcJ
         EQstCVOLnvbwQsSkSU8WlYPn7lfn+TU6NWNJB1TpBI9Pz+XHrt7gVGkSKhizGqsTILj4
         hBVu2jK9GuQb0ABpfmXM9Gs3l0jIIFPhxu3ByM8CvVgZYepaW9eepH/TPSP8nVIdJCSC
         V1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nmnRuX8kV7zJ4o7yJ1IDcFMMfz90MgXzWwS0ef4V34w=;
        b=XUgte5fC2CzminrdPKOZYlxkAFb+CSBkEnzSXyZMNaM7JYp5ZonkZWZfDpH2bnUmq0
         EyW8t4Xcd7F6ydzmofossXrmMMwnRskhq5iinnvC5ZeQQgeh3U6LZxxiu82VIAODmSSe
         AIbHVcITEGKQDFEYcrabd3c1NAyMeK3vdoilK53IJ0aoytvNRjWZ8y3D3Uv0ClgHaP3T
         abDq+Igx8ojpQvHUySivbghWwWM4Fnvfp1fI8bdiNM4qEGtc+s/2Gm/p8alCbT4xeug9
         +u5alv18TmPRfsDS7hiwxWeKKvaf2RYCikaDaufozLUZzIKeKj/uUVy1P08qXlvJ1WJK
         ErHw==
X-Gm-Message-State: AOAM532Lp+YgfxiG05ts5Yzxl19jQbdW2IE0MS6ZEc+H3+SUt3V8puom
        31CkxKl1dRTg/LacXVjU1gjrwCMt7zf1xA==
X-Google-Smtp-Source: ABdhPJxAIJInR8ZkIB8kjhb1RvnqYJBz70ArcrCTf9vuhP4eWYxoca9DeYyAJrpnGGyqRdkjb5K3Rw==
X-Received: by 2002:a05:6a00:1356:b029:13e:5203:fba3 with SMTP id k22-20020a056a001356b029013e5203fba3mr16879773pfu.3.1600164900061;
        Tue, 15 Sep 2020 03:15:00 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id t15sm5407519pjq.3.2020.09.15.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 03:14:59 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Tue, 15 Sep 2020 18:14:51 +0800
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
Message-ID: <20200915101451.hrqs4aobnwtmo3sm@Rk>
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk>
 <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
 <20200910163729.z6gmpeg7x2ocjvpt@Rk>
 <CAO-hwJ+P3iU87Ra=3bzJ2f53hPPxGKb+v1+kPSNj5TJVy+NqGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+P3iU87Ra=3bzJ2f53hPPxGKb+v1+kPSNj5TJVy+NqGA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 11, 2020 at 02:29:03PM +0200, Benjamin Tissoires wrote:
>Hi,
>
>On Thu, Sep 10, 2020 at 6:37 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> On Fri, Sep 04, 2020 at 06:47:42PM +0200, Benjamin Tissoires wrote:
>> >On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>> >>
>> >> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
>> >> >Hi,
>> >> >
>> >> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>> >> >>
>> >> >> Hi,
>> >> >>
>> >> >> I'm working on a touchpad device issue as reported on
>> >> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>> >> >>
>> >> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
>> >> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>> >> >>
>> >> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>> >> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>> >> >>         the device.
>> >> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>> >> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>> >> >>      3. hid-multitouch.c claims handling devices with the group of
>> >> >>         HID_GROUP_MULTITOUCH_WIN_8
>> >> >>
>> >> >>          static const struct hid_device_id mt_devices[] = {
>> >> >>                 /* Generic MT device */
>> >> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>> >> >>
>> >> >>                 /* Generic Win 8 certified MT device */
>> >> >>                 {  .driver_data = MT_CLS_WIN_8,
>> >> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>> >> >>                                 HID_ANY_ID, HID_ANY_ID) },
>> >> >>                 { }
>> >> >>          };
>> >> >>
>> >> >> There are several potential solutions,
>> >> >>      - Let the device vendor fix this problem since this device's report
>> >> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>> >> >>      - Make it a special case by setting the device's group to
>> >> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>> >> >>        are matched.
>> >> >>      - hid-quirks.c seems to be designed to handle special cases, is it
>> >> >>        suitable for this case?
>> >> >
>> >> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
>> >> >guess the best is to add the VID/PID to hid-quirks.c in
>> >> >hid_have_special_driver[], and add it to the hid-rmi driver too.
>> >> >This way, you will ensure hid-rmi will pick up the device all the time.
>> >> >
>> >> >Cheers,
>> >> >Benjamin
>> >>
>> >> Thank you for the advice! I have exactly adopted this approach by looking
>> >> at commit e9287099ba6539bccb20cd791269186f3ae28b85
>> >> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
>> >> as an example.
>> >>
>> >> My previous email is a bit misleading because 0x04F3 is the vendor code
>> >> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
>> >> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
>> >> touchpads,
>> >>
>> >> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
>> >>    except the clicking is not sensitive enough. I need to let my finger
>> >>    linger on the touchpad for a while. I notice when I click on the touchpad,
>> >>    an HID report would be received by hid-recorder. But evtest couldn't receive
>> >>    any EV_ event. If hid-multitouch is handling the device, the cursor
>> >>    won't move but 2-4 finger touching events could still be received by
>> >>    evtest.
>> >>
>> >> - for the ELAN touchpad, only HID reporters can be read and parsed by
>> >>    hid-core then two input devices (mouse and touchpad) could created by
>> >>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
>> >>    could never get any HID report.
>> >
>> >huh. So in both cases you have a buggy touchpad with hid-multitouch :(
>> >
>> >Do both touchpads share the same VID/PID? If so, this is going to be
>> >interesting to decide how any of those touchpad should be handled.
>>
>> No, they have different VID/PIDs,
>>   - 04F3:3140 (Elan)
>>   - 06CB:7F28 (Synaptics)
>
>That's good to know :)
>
>>
>> >
>> >>
>> >> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
>> >> Precision Touchpad?
>> >
>> >yes, it works for most of those. The only ones that are not working
>> >are usually because OEM or device makers tend to do "fun" things.
>> >
>> >>  And since Precision touchpad is mandatory for
>> >> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
>> >> seem to have been certificated by Windows 10, does it mean by theory
>> >> hid-multiouch could handle these two touchpad devices?
>> >
>> >Well, it should, yes, but it clearly can not. You can try to give a
>> >try at hid-recorder from
>> >https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
>> >is actually exported by the hardware before any processing by the
>> >kernel. Maybe there is a new simple thing to do in hid-multitouch to
>> >handle those devices.
>> >
>> >Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
>> >of hid-multitouch. Any hid-rmi touchpad should be able to use
>> >hid-multitouch, as this is the preferred way on Windows. But sometimes
>> >the various teams decide to change the rules.
>> >
>> >>
>> >> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
>> >> HID reports to see what's happening. Or do you have any suggestion?
>> >
>> >Unless it changed recently (I think I have seen something like that
>> >recently), I had to write a I2C man-in-the-middle to dump the logs
>> >from Windows. Project is at
>> >https://github.com/bentiss/SimplePeripheralBusProbe and requires a
>> >little bit of manual work to be able to start capturing data :(
>> >
>> >Cheers,
>> >Benjamin
>> >
>> >>
>> >> --
>> >> Best regards,
>> >> Coiby
>> >>
>> >
>>
>> Thank you for developing hid-tools and SimplePeripheralBusProbe!
>
>No worries.
>
>Wow, I am really impressed in how quickly you managed to get all that
>data. I think it's the first time I ever point somebody at
>SimplePeripheralBusProbe, and I don't have to do anything to get this
>up and running, and analyzed :)

Thank you! The instructions of setting up SimplePeripheralBusProbe
are well-documented so it's quite a straightforward process:)

>
>>
>> The problem with the Synaptics touchpad when it's handled by hid-multiouch
>> is the pointer won't move. A few days ago, I took another look at the
>> results produced by hid-recorder and evtest and noticed something abnormal
>> for the Synaptics touchpad. For a straight continuous motion of one finger,
>> the value of ABS_MT_TRACKING_ID kept changing,
>>
>> $ sudo evtest
>> ...
>> Event: time 1599651409.969002, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 68
>> Event: time 1599651409.969002, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 401
>> Event: time 1599651409.969002, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 201
>> Event: time 1599651409.969002, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>> Event: time 1599651409.969002, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>> Event: time 1599651409.969002, type 3 (EV_ABS), code 0 (ABS_X), value 401
>> Event: time 1599651409.969002, type 3 (EV_ABS), code 1 (ABS_Y), value 201
>> Event: time 1599651409.969002, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 0
>> Event: time 1599651409.969002, -------------- SYN_REPORT ------------
>> Event: time 1599651410.070105, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>> Event: time 1599651410.070105, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>> Event: time 1599651410.070105, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>> Event: time 1599651410.070105, -------------- SYN_REPORT ------------
>> Event: time 1599651410.093740, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 69
>> Event: time 1599651410.093740, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>> Event: time 1599651410.093740, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>> Event: time 1599651410.093740, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 7200
>> Event: time 1599651410.093740, -------------- SYN_REPORT ------------
>> Event: time 1599651410.196576, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>> Event: time 1599651410.196576, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>> Event: time 1599651410.196576, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>> Event: time 1599651410.196576, -------------- SYN_REPORT ------------
>> Event: time 1599651410.219020, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 70
>> Event: time 1599651410.219020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 406
>> Event: time 1599651410.219020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 204
>> Event: time 1599651410.219020, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>> Event: time 1599651410.219020, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>> Event: time 1599651410.219020, type 3 (EV_ABS), code 0 (ABS_X), value 406
>> Event: time 1599651410.219020, type 3 (EV_ABS), code 1 (ABS_Y), value 204
>> Event: time 1599651410.219020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 129000
>> Event: time 1599651410.219020, -------------- SYN_REPORT ------------
>> Event: time 1599651410.320097, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
>> Event: time 1599651410.320097, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
>> Event: time 1599651410.320097, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
>> Event: time 1599651410.320097, -------------- SYN_REPORT ------------
>> Event: time 1599651410.343867, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 71
>> Event: time 1599651410.343867, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 424
>> Event: time 1599651410.343867, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 218
>> Event: time 1599651410.343867, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
>> Event: time 1599651410.343867, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
>> Event: time 1599651410.343867, type 3 (EV_ABS), code 0 (ABS_X), value 424
>> Event: time 1599651410.343867, type 3 (EV_ABS), code 1 (ABS_Y), value 218
>> Event: time 1599651410.343867, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 250900
>> ...
>>
>> while hid-recorder showed "Tip Switch" remained 1 and the "contact Id"
>> remained 0 for this set of reports,
>>
>> $ sudo hid-recorder
>>
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14579 | Contact Count:    1 | Button: 0 | #
>> E: 000000.000000 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f3 38 01 00
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14651 | Contact Count:    1 | Button: 0 | #
>> E: 000000.124738 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3b 39 01 00
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    406 | Y:    204
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  15869 | Contact Count:    1 | Button: 0 | #
>> E: 000000.249932 30 03 03 96 01 cc 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fd 3d 01 00
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    424 | Y:    218
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  17088 | Contact Count:    1 | Button: 0 | #
>> E: 000000.374781 30 03 03 a8 01 da 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 42 01 00
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    449 | Y:    251
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  18379 | Contact Count:    1 | Button: 0 | #
>> E: 000000.499704 30 03 03 c1 01 fb 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cb 47 01 00
>> # ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    475 | Y:    281
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
>> #             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  19598 | Contact Count:    1 | Button: 0 | #
>>
>>
>> I managed to let hid-multitouch to send the set of input events with the
>> same ABS_MT_TRACKING_ID by disabling the release_timer via commenting out
>> the following code,
>>
>> // drivers/hid/hid-multitouch.c
>> static void mt_touch_report(struct hid_device *hid,
>>                             struct mt_report_data *rdata)
>> {
>>      ...
>>          * Windows 8 specs says 2 things:
>>          * - once a contact has been reported, it has to be reported in each
>>          *   subsequent report
>>          * - the report rate when fingers are present has to be at least
>>          *   the refresh rate of the screen, 60 or 120 Hz
>>          *
>>          * I interprete this that the specification forces a report rate of
>>          * at least 60 Hz for a touchscreen to be certified.
>>          * Which means that if we do not get a report whithin 16 ms, either
>>          * something wrong happens, either the touchscreen forgets to send
>>          * a release. Taking a reasonable margin allows to remove issues
>>          * with USB communication or the load of the machine.
>>          *
>>          * Given that Win 8 devices are forced to send a release, this will
>>          * only affect laggish machines and the ones that have a firmware
>>          * defect.
>>          */
>>         /* if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
>>                 if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
>>                         mod_timer(&td->release_timer,
>>                                   jiffies + msecs_to_jiffies(100));
>>                 else
>>                         del_timer(&td->release_timer);
>>         } */
>>      ...
>> }
>>
>> Now the pointer can move but there is a noticeable lag as I move my
>> finger. evhz shows the report rate is only ~7Hz. While under Windows,
>> SimplePeripheralBusProbe shows there are 25+ reports for one finger
>> sliding event. This also explains why under Linux release_timer keeping
>> inactivating report slots.
>
>Yep, you found the root cause. We don't have enough reports to ensure
>a proper reporting mechanism.
>
>>
>>
>> Comparing the hid commands sent between Windows and Linux, they are
>> almost identical. SimplePeripheralBusProbe doesn't record hid commands
>> like fetching HID descriptor, report descriptor, resetting the device.
>> I haven't yet found a clue about why this Synaptics touchpad operates
>> with such a report rate under Linux.
>>
>> Under Linux, the follow hid commands are sent to the touchpad device.
>>
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=20 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 01
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=21 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 37 02 23 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 3d 03 23 00 04 00 0d 00
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 34 03 23 00 04 00 04 03
>> Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 36 03 23 00 04 00 06 03
>>
>> whereas under Windows,
>>
>> [0]0000.0000::09/09/2020-14:41:47.732 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 38 02 23 00
>> [0]0000.0000::09/09/2020-14:41:47.740 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 37 02 23 00
>> [0]0000.0000::09/09/2020-14:41:47.741 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
>> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
>> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
>> [0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 3d 03 23 00 04 00 0d 00
>> [0]1AB4.3074::09/09/2020-14:41:47.743 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
>>
>
>Thanks for comparing the 2. As you noticed, there doesn't seem to be
>any differences.
>My initial thoughts were that we were wrongly setting the "Latency
>mode" [0]. But this should have been shown in the differences. I
>*think* we set it in hid-multitouch, but it can't hurt to do a couple
>of additional tests on this side.

I think "latency mode" has been correctly set based on the following
tests,

- When HID_LATENCY_NORMAL is replaced with HID_LATENCY_HIGH when calling
   mt_set_modes, the cursor would never move even with release_timer
   disabled.

- hid-generic could take over this device if hid-multitouch is
   blacklisted. evhz shows the report rate is still only ~7Hz.

- hid-rmi could also handle the device and the report rate is also
   ~7Hz. According to "Synaptics RMI4 Specification", the control
   registers has the ReportRate (F01_RMI_Ctrl0, bit 6),
   > This field sets the report rate for the device. It applies in common to all functions on the
    device that have a natural report rate.

   When this bit is set, there is no change observed.

I also did some tests on power setting because according to
"HID Over I2C Protocol Specification" [1], the device's sensing
frequency could drop to 10Hz in sleep mode,
> DEVICE reduces its sensing frequency: The DEVICE reduces the frequency
> at which it scans for data (e.g. if the digitizer does not sense a human
> finger is present, it samples at 10Hz as compared to 100Hz. However once
> user interaction is detected, it increases its sensing interval).

- Not power managing the device doesn't work when hid-multitouch
   handles the device,
   $ echo "on" | sudo tee /sys/bus/i2c/devices/i2c-MSFT0001:00/power/control

- Set NoSleep (F01_RMI_Ctrl0, bit 2) when hid-rmi handles this device

Unfortunately the above changes didn't bring any improvement. The report rate stays at
~7Hz.

>
>The other thing that might explain the difference, is at the I2C
>level. I see on the dmesg that the touchpad is attached to
>AMDI0010:03. I wonder if there is not a misconfiguration on the AMD
>I2C adapter driver that prevents the touchpad from using the correct
>report rate.
>
>Unfortunately, I don't know much about this driver, but maybe given
>all you showed to me you could have a look too? :)
>
>Cheers,
>Benjamin
>
>[0] https://docs.microsoft.com/en-us/windows-hardware/design/component-guidelines/windows-precision-touchpad-required-hid-top-level-collections#latency-mode-feature-report
>

Thank you for pointing me to another direction!

AMDI0010 is handled by i2c-designware (drivers/i2c/busses/i2c-designware-platdrv.c),

     $ sudo i2cdetect -l
     i2c-0   i2c             Synopsys DesignWare I2C adapter         I2C adapter

The crucial set parameters when configuring the I2C adapter seems to
be the I2C related timing parameters. Firmware doesn't provide the
values (i2c_parse_fw_timings doesn't find any device properties). The
I2C adapter uses the following set of values,

     clock-frequency: 400000
     i2c-scl-rising-time-ns: 0
     i2c-scl-falling-time-ns: 0
     i2c-scl-internal-delay-ns: 0
     i2c-sda-falling-time-ns: 0
     i2c-sda-hold-time-ns: 0
     i2c-digital-filter-width-ns: 0
     i2c-analog-filter-cutoff-frequency: 0

For now I don't have sufficent knowledge to tell what may be wrong.
So I studied several cases of I2C adapter configuration causing touchpad
issues,
  - i2c: designware: Do not use parameters from ACPI on Dell Inspiron 7348 - Patchwork [2]
  - [BUG] i2c-hid: ELAN Touchpad does not work on ASUS X580GD - Patchwork [3]
  - LKML: Chris Chiu: Tweak I2C SDA hold time on GemniLake to make touchpad work

But I couldn't find a similar case to touchpad having low report rate
due to a misconfiguration of I2C adapter.

Some unsuccessful attempts are
  - Set acpi_osi to Windows like "Windows 2015"
  - Set I2C bus speed to the standard mode (clock-frequency: 100000)
    doesn't change anything and set it to high speed mode make cause
    touchpad to be not recognized.

I'll try another expedient way of finding out what are the values of
I2C related timing parameters under Windows and setting the same values
under Linux. If this fails, it seems I need to try the hard way to
understand how I2C bus work by reading materials like NXP
Semiconductors's I2C manual.

I'm not sure if it's worth looking at yet another direction, i.e., to check
if there's something wrong with the touchpad device's interrupt setting
up. Here's the ACPI dump of the I2C controller and the touchpad device,

         Device (I2CD)
         {
             Name (_HID, "AMDI0010")  // _HID: Hardware ID
             Name (_UID, 0x03)  // _UID: Unique ID
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 IRQ (Edge, ActiveHigh, Exclusive, )
                     {6}
                 Memory32Fixed (ReadWrite,
                     0xFEDC5000,         // Address Base
                     0x00001000,         // Address Length
                     )
             })

         }

     Scope (_SB.I2CD)
     {
         Device (TPDD)
         {
             Name (_HID, "XXXX0000")  // _HID: Hardware ID
             Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
             Name (_SUB, "XXXX0000")  // _SUB: Subsystem ID
             Method (_INI, 0, NotSerialized)  // _INI: Initialize
             {
                 If ((TPTY == One))
                 {
                     _HID = "MSFT0001"
                     _SUB = "ELAN0001"
                 }

                 If ((TPTY == 0x02))
                 {
                     _HID = "MSFT0001"
                     _SUB = "SYNA0001"
                 }

                 Return (Zero)
             }

             Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
             {
                 If ((TPTY == One))
                 {
                     Name (SBFB, ResourceTemplate ()
                     {
                         I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                             AddressingMode7Bit, "\\_SB.I2CD",
                             0x00, ResourceConsumer, , Exclusive,
                             )
                     })
                 }

                 If ((TPTY == 0x02))
                 {
                     Name (SBFS, ResourceTemplate ()
                     {
                         I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                             AddressingMode7Bit, "\\_SB.I2CD",
                             0x00, ResourceConsumer, , Exclusive,
                             )
                     })
                 }

                 Name (SBFI, ResourceTemplate ()
                 {
                     GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                         "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                         )
                         {   // Pin list
                             0x0082
                         }
                 })
                 If ((TPTY == One))
                 {
                     Return (ConcatenateResTemplate (SBFB, SBFI))
                 }

                 If ((TPTY == 0x02))
                 {
                     Return (ConcatenateResTemplate (SBFS, SBFI))
                 }
             }

         }
     }


Best regards,
Coiby

[1] https://docs.microsoft.com/en-us/previous-versions/windows/hardware/design/dn642101(v=vs.85)?redirectedfrom=MSDN
[2] https://lore.kernel.org/patchwork/patch/601043/
[3] https://lore.kernel.org/patchwork/patch/903152/
[4] https://lkml.org/lkml/2019/9/3/191
