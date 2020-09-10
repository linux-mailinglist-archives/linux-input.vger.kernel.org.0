Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80638264AB8
	for <lists+linux-input@lfdr.de>; Thu, 10 Sep 2020 19:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgIJRJI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Sep 2020 13:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgIJQh5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Sep 2020 12:37:57 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7895C0617B1
        for <linux-input@vger.kernel.org>; Thu, 10 Sep 2020 09:37:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v196so5073404pfc.1
        for <linux-input@vger.kernel.org>; Thu, 10 Sep 2020 09:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cxFsB6OrTL+TS3E0TX0SwaN1OqJE9VKpfhJ5yvEzblA=;
        b=hHtb8DlOiWXAqDUlIBCxnl/5irYkudM9nCoc7SyZhO1x/FBvXGd+v/LsAJRNNlVcMM
         N85XBybcYRV6Gn1H0GP8aURa3174Yt/tSyFq/E1IKEW7hZRSoAGA9VLdrva+9lgyNSiU
         EyHuTzpS6xdpe6cg3PpnUgXwnPB6aUK/zRpxLY+F6pn4HI/WMICaoJtypFJr0g6oa20y
         1WORoEKE+I2dqzE4ROQ0AVOwLEVU+A0L5BeB1x//vpfB39Gr7yT8YHREOPP4lSE/A6ZE
         HYoJjOLemqkXA8rLpc3T2M/J8HAqNlrUYhd2krcRlI9bF3nx+GSrbIpyvVPeQEbypiry
         Mwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cxFsB6OrTL+TS3E0TX0SwaN1OqJE9VKpfhJ5yvEzblA=;
        b=PeD6D6yf2Nw25lcQ9NbfMHJGK9aeIcNc7BeAOZhCf7BN8jhUh9bG0lKMZB9ycbBFAa
         hH8ZtC18Nm0vAuOsExhvmjxX87X9OB2WkfsS/YIkg8R7k0MQ2JG70krRruGass3uvoAJ
         3uLckwQHEC8HAF+qmIqrkxoSKRkb0wCPBnjWLo7p3KWkD5TBrFdWn1jU4xuNcUTrKdR2
         KgpKpcFuT6zxL43yoGeiTAkI3IvM0MyRAxOtvGIF15GV9j88oiX+X3YtLMd8E/AhoOQ3
         61Ld0bP/WpQKCVQyPwk4Y75vXxWolFXMaczcL3T7HVPlOmkbcVcdmwdE0TfaWmSpUe9e
         vC0Q==
X-Gm-Message-State: AOAM533lMVAElqy3HUfmMMGEmuKCKSvPeyyWHKmV+gmjc0TgDXAvS5WX
        djIqyFRrdcutLPOVUvQR9Ts=
X-Google-Smtp-Source: ABdhPJxThm9AzoxDVR+lA8YzUQ0Nzz0B8Tu8URFEMD0nKX5CxXGMA2XkYfU1WzPpoZdjj8mrXZuLXw==
X-Received: by 2002:a63:64c2:: with SMTP id y185mr5194527pgb.125.1599755855145;
        Thu, 10 Sep 2020 09:37:35 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
        by smtp.gmail.com with ESMTPSA id ev19sm2379774pjb.42.2020.09.10.09.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:37:34 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 11 Sep 2020 00:37:29 +0800
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
Message-ID: <20200910163729.z6gmpeg7x2ocjvpt@Rk>
References: <20200811091445.erp2b23xmx3ceyzp@Rk>
 <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk>
 <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 04, 2020 at 06:47:42PM +0200, Benjamin Tissoires wrote:
>On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
>> >Hi,
>> >
>> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>> >>
>> >> Hi,
>> >>
>> >> I'm working on a touchpad device issue as reported on
>> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
>> >>
>> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
>> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
>> >>
>> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
>> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
>> >>         the device.
>> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
>> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
>> >>      3. hid-multitouch.c claims handling devices with the group of
>> >>         HID_GROUP_MULTITOUCH_WIN_8
>> >>
>> >>          static const struct hid_device_id mt_devices[] = {
>> >>                 /* Generic MT device */
>> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
>> >>
>> >>                 /* Generic Win 8 certified MT device */
>> >>                 {  .driver_data = MT_CLS_WIN_8,
>> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
>> >>                                 HID_ANY_ID, HID_ANY_ID) },
>> >>                 { }
>> >>          };
>> >>
>> >> There are several potential solutions,
>> >>      - Let the device vendor fix this problem since this device's report
>> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
>> >>      - Make it a special case by setting the device's group to
>> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
>> >>        are matched.
>> >>      - hid-quirks.c seems to be designed to handle special cases, is it
>> >>        suitable for this case?
>> >
>> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
>> >guess the best is to add the VID/PID to hid-quirks.c in
>> >hid_have_special_driver[], and add it to the hid-rmi driver too.
>> >This way, you will ensure hid-rmi will pick up the device all the time.
>> >
>> >Cheers,
>> >Benjamin
>>
>> Thank you for the advice! I have exactly adopted this approach by looking
>> at commit e9287099ba6539bccb20cd791269186f3ae28b85
>> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
>> as an example.
>>
>> My previous email is a bit misleading because 0x04F3 is the vendor code
>> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
>> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
>> touchpads,
>>
>> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
>>    except the clicking is not sensitive enough. I need to let my finger
>>    linger on the touchpad for a while. I notice when I click on the touchpad,
>>    an HID report would be received by hid-recorder. But evtest couldn't receive
>>    any EV_ event. If hid-multitouch is handling the device, the cursor
>>    won't move but 2-4 finger touching events could still be received by
>>    evtest.
>>
>> - for the ELAN touchpad, only HID reporters can be read and parsed by
>>    hid-core then two input devices (mouse and touchpad) could created by
>>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
>>    could never get any HID report.
>
>huh. So in both cases you have a buggy touchpad with hid-multitouch :(
>
>Do both touchpads share the same VID/PID? If so, this is going to be
>interesting to decide how any of those touchpad should be handled.

No, they have different VID/PIDs,
  - 04F3:3140 (Elan)
  - 06CB:7F28 (Synaptics)

>
>>
>> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
>> Precision Touchpad?
>
>yes, it works for most of those. The only ones that are not working
>are usually because OEM or device makers tend to do "fun" things.
>
>>  And since Precision touchpad is mandatory for
>> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
>> seem to have been certificated by Windows 10, does it mean by theory
>> hid-multiouch could handle these two touchpad devices?
>
>Well, it should, yes, but it clearly can not. You can try to give a
>try at hid-recorder from
>https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
>is actually exported by the hardware before any processing by the
>kernel. Maybe there is a new simple thing to do in hid-multitouch to
>handle those devices.
>
>Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
>of hid-multitouch. Any hid-rmi touchpad should be able to use
>hid-multitouch, as this is the preferred way on Windows. But sometimes
>the various teams decide to change the rules.
>
>>
>> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
>> HID reports to see what's happening. Or do you have any suggestion?
>
>Unless it changed recently (I think I have seen something like that
>recently), I had to write a I2C man-in-the-middle to dump the logs
>from Windows. Project is at
>https://github.com/bentiss/SimplePeripheralBusProbe and requires a
>little bit of manual work to be able to start capturing data :(
>
>Cheers,
>Benjamin
>
>>
>> --
>> Best regards,
>> Coiby
>>
>

Thank you for developing hid-tools and SimplePeripheralBusProbe!

The problem with the Synaptics touchpad when it's handled by hid-multiouch
is the pointer won't move. A few days ago, I took another look at the
results produced by hid-recorder and evtest and noticed something abnormal
for the Synaptics touchpad. For a straight continuous motion of one finger,
the value of ABS_MT_TRACKING_ID kept changing,

$ sudo evtest
...
Event: time 1599651409.969002, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 68
Event: time 1599651409.969002, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 401
Event: time 1599651409.969002, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 201
Event: time 1599651409.969002, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
Event: time 1599651409.969002, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
Event: time 1599651409.969002, type 3 (EV_ABS), code 0 (ABS_X), value 401
Event: time 1599651409.969002, type 3 (EV_ABS), code 1 (ABS_Y), value 201
Event: time 1599651409.969002, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 0
Event: time 1599651409.969002, -------------- SYN_REPORT ------------
Event: time 1599651410.070105, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
Event: time 1599651410.070105, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
Event: time 1599651410.070105, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
Event: time 1599651410.070105, -------------- SYN_REPORT ------------
Event: time 1599651410.093740, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 69
Event: time 1599651410.093740, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
Event: time 1599651410.093740, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
Event: time 1599651410.093740, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 7200
Event: time 1599651410.093740, -------------- SYN_REPORT ------------
Event: time 1599651410.196576, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
Event: time 1599651410.196576, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
Event: time 1599651410.196576, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
Event: time 1599651410.196576, -------------- SYN_REPORT ------------
Event: time 1599651410.219020, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 70
Event: time 1599651410.219020, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 406
Event: time 1599651410.219020, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 204
Event: time 1599651410.219020, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
Event: time 1599651410.219020, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
Event: time 1599651410.219020, type 3 (EV_ABS), code 0 (ABS_X), value 406
Event: time 1599651410.219020, type 3 (EV_ABS), code 1 (ABS_Y), value 204
Event: time 1599651410.219020, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 129000
Event: time 1599651410.219020, -------------- SYN_REPORT ------------
Event: time 1599651410.320097, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value -1
Event: time 1599651410.320097, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
Event: time 1599651410.320097, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 0
Event: time 1599651410.320097, -------------- SYN_REPORT ------------
Event: time 1599651410.343867, type 3 (EV_ABS), code 57 (ABS_MT_TRACKING_ID), value 71
Event: time 1599651410.343867, type 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 424
Event: time 1599651410.343867, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 218
Event: time 1599651410.343867, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
Event: time 1599651410.343867, type 1 (EV_KEY), code 325 (BTN_TOOL_FINGER), value 1
Event: time 1599651410.343867, type 3 (EV_ABS), code 0 (ABS_X), value 424
Event: time 1599651410.343867, type 3 (EV_ABS), code 1 (ABS_Y), value 218
Event: time 1599651410.343867, type 4 (EV_MSC), code 5 (MSC_TIMESTAMP), value 250900
...

while hid-recorder showed "Tip Switch" remained 1 and the "contact Id"
remained 0 for this set of reports,

$ sudo hid-recorder

# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14579 | Contact Count:    1 | Button: 0 | #
E: 000000.000000 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f3 38 01 00
# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    401 | Y:    201
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  14651 | Contact Count:    1 | Button: 0 | #
E: 000000.124738 30 03 03 91 01 c9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3b 39 01 00
# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    406 | Y:    204
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  15869 | Contact Count:    1 | Button: 0 | #
E: 000000.249932 30 03 03 96 01 cc 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 fd 3d 01 00
# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    424 | Y:    218
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  17088 | Contact Count:    1 | Button: 0 | #
E: 000000.374781 30 03 03 a8 01 da 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c0 42 01 00
# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    449 | Y:    251
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  18379 | Contact Count:    1 | Button: 0 | #
E: 000000.499704 30 03 03 c1 01 fb 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 cb 47 01 00
# ReportID: 3 / Confidence: 1 | Tip Switch: 1 | Contact Id:  0 | # | X:    475 | Y:    281
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0
#             | Confidence: 0 | Tip Switch: 0 | Contact Id:  0 | # | X:      0 | Y:      0 | Scan Time:  19598 | Contact Count:    1 | Button: 0 | #


I managed to let hid-multitouch to send the set of input events with the
same ABS_MT_TRACKING_ID by disabling the release_timer via commenting out
the following code,

// drivers/hid/hid-multitouch.c
static void mt_touch_report(struct hid_device *hid,
			    struct mt_report_data *rdata)
{
     ...
	 * Windows 8 specs says 2 things:
	 * - once a contact has been reported, it has to be reported in each
	 *   subsequent report
	 * - the report rate when fingers are present has to be at least
	 *   the refresh rate of the screen, 60 or 120 Hz
	 *
	 * I interprete this that the specification forces a report rate of
	 * at least 60 Hz for a touchscreen to be certified.
	 * Which means that if we do not get a report whithin 16 ms, either
	 * something wrong happens, either the touchscreen forgets to send
	 * a release. Taking a reasonable margin allows to remove issues
	 * with USB communication or the load of the machine.
	 *
	 * Given that Win 8 devices are forced to send a release, this will
	 * only affect laggish machines and the ones that have a firmware
	 * defect.
	 */
	/* if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
		if (test_bit(MT_IO_FLAGS_PENDING_SLOTS, &td->mt_io_flags))
			mod_timer(&td->release_timer,
				  jiffies + msecs_to_jiffies(100));
		else
			del_timer(&td->release_timer);
	} */
     ...
}

Now the pointer can move but there is a noticeable lag as I move my
finger. evhz shows the report rate is only ~7Hz. While under Windows,
SimplePeripheralBusProbe shows there are 25+ reports for one finger
sliding event. This also explains why under Linux release_timer keeping
inactivating report slots.


Comparing the hid commands sent between Windows and Linux, they are
almost identical. SimplePeripheralBusProbe doesn't record hid commands
like fetching HID descriptor, report descriptor, resetting the device.
I haven't yet found a clue about why this Synaptics touchpad operates
with such a report rate under Linux.

Under Linux, the follow hid commands are sent to the touchpad device.

Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=20 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 01
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 00 08
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=21 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 38 02 23 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 37 02 23 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 3d 03 23 00 04 00 0d 00
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 34 03 23 00 04 00 04 03
Sep 10 06:54:13 Rk kernel: __i2c_hid_command: cmd=22 00 36 03 23 00 04 00 06 03

whereas under Windows,

[0]0000.0000::09/09/2020-14:41:47.732 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 38 02 23 00
[0]0000.0000::09/09/2020-14:41:47.740 [SimplePeripheralBusProbe]device   1: ##00 write    6 -  0000: 22 00 37 02 23 00
[0]0000.0000::09/09/2020-14:41:47.741 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03
[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 34 03 23 00 04 00 04 03
[0]0000.0000::09/09/2020-14:41:47.742 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 3d 03 23 00 04 00 0d 00
[0]1AB4.3074::09/09/2020-14:41:47.743 [SimplePeripheralBusProbe]device   1: ##00 write   10 -  0000: 22 00 36 03 23 00 04 00 06 03

--
Best regards,
Coiby
