Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F59FBE8D
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 05:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfKNEbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 23:31:55 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47704 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbfKNEbz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 23:31:55 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2953160D96; Thu, 14 Nov 2019 04:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573705914;
        bh=1mnno7V8hbNstT1qSUss+lOiVaXQRdb+5ZIeKo2cB8E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=OcrhaMw/UTV0aQ8VHy5QLkahlC1F7LTcpZNPtnH1KgKPqUL7YM61FyD0qVZ0VG6OG
         +KT0q7bMiqzPEJkazSMUx04cKzKf9Us1+eZAkEYRJBbqH9P3e/GkoBPAOjCAnwbZMS
         O1sCGo1PRlNr2ltODlJuUeyheOnbLURhg6GUOiQU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.204.79.8] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA4EA60D78;
        Thu, 14 Nov 2019 04:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573705911;
        bh=1mnno7V8hbNstT1qSUss+lOiVaXQRdb+5ZIeKo2cB8E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CW0v7YQeMt35xuMtycNnMd5lmklNU52+j6sYbPOSZBHjOIx3iwzzLoIwgy32hZXYX
         j82VbkmO598j1u4M2xyRBf4EJ5eR/xC8lN8hL97RVJGQUWI2AQ5wVI45FXHzmMmP80
         XtmzSRwvuOybPpzA2a08Ux99ZbfdgvkgQPBDfL3g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA4EA60D78
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
Subject: Re: Query regarding hid-multitouch.c driver in 4.14/4.19
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, prsood@codeaurora.org,
        gkohli@codeaurora.org
References: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
 <CAO-hwJLdz1sA4tNsLLgZKGA7Ko6dqt9VF5T2nh5uczHxU532HA@mail.gmail.com>
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
Message-ID: <4eecbd2a-9d19-c6a2-a95b-656e3fce05a4@codeaurora.org>
Date:   Thu, 14 Nov 2019 10:01:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLdz1sA4tNsLLgZKGA7Ko6dqt9VF5T2nh5uczHxU532HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Sorry for the delay, was waiting for the required information from our team.

On 11/13/2019 3:00 PM, Benjamin Tissoires wrote:
> Hi Neeraj,
>
> On Wed, Nov 13, 2019 at 4:11 AM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
>> Hi,
>>
>> I have one query regarding hid-multitouch.c driver and need your guidance on
>> how hid-multitouchc can restore/support the original behaviour, where, for
>> devices, for which application is not
>> HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD, and has
>> HID_DG_CONTACTID usage in its report, can still use generic input mappings.
>>
>> We are using kernel versions 4.14 , 4.19 respectively in 2 different
>> projects:
>>
>> 4.14:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.14.153
>> 4.19:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.19.83
>>
>> I checked the application for our hid device, it's HID_DG_PEN, device
>> also has a HID_DG_CONTACTID usage defined in
>>
>> its report.
>>
>> In 4.19, is_mt_collection is set to 'true'. All multitouch code paths or
>> input mapping is configured
>>
>> mt_allocate_report_data()
>>           ...
>>           for (n = 0; n < field->report_count; n++) {
>>                           if (field->usage[n].hid == HID_DG_CONTACTID)
>>                                   rdata->is_mt_collection = true;   //
>> is_mt_collection is set to 'true'
>>                   }
>>           }
>>
>> mt_input_mapping()
>>           ...
>>           if (rdata->is_mt_collection)
>>               return mt_touch_input_mapping(...)  //
>> mt_touch_input_mapping() is called
>>
>> mt_event()
>>           if (rdata && rdata->is_mt_collection)
>>               return mt_touch_event();  // mt_touch_event() is called
>>
>> However, in 4.14, the behaviour was different, mt input mapping was done
>> only
>> for HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD , and because our hid device is
>> HID_DG_PEN, generic mappings were applied for it; with these settings,
>> device
>> responds to events.
>>
>> static int mt_input_mapping()
>>           if (field->application == HID_DG_TOUCHSCREEN ||
>>               field->application == HID_DG_TOUCHPAD)
>>               return mt_touch_input_mapping();  // This is not called.
>>
>>
>> mt_touch_input_mapping()
>>           case HID_DG_CONTACTID:
>>                           mt_store_field(usage, td, hi);
>>                           td->touches_by_report++;
>>                           td->mt_report_id = field->report->id; //
>> mt_report_id is not set.
>>                           return 1;
>>
>>
>> Looks like this behaviour changed, with below commits:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=8dfe14b3b47ff832cb638731f9fc696a3a84f804
>> 8dfe14b3b47f    HID: multitouch: ditch mt_report_id
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=ba6b055e0f3b4ff4942e4ab273260affcfad9bff
>> ba6b055e0f3b     HID: input: enable Totem on the Dell Canvas 27
>>
>> Can you please suggest on how we can support/preserve the original
>> behaviour?
> Hmm, I would initially say that a firmware that exports Contact ID for
> a Pen is definitely wrong. The Contact ID usage has been introduced in
> https://www.usb.org/sites/default/files/hutrr34.pdf and is
> specifically for multi-touch, not multi pen.
>
> Anyway, couple of questions:
> - does the device supports multi-pen?

Actually the device is a selfie stick device: 
https://item.jd.com/33082497741.html

It does not support multi-pen.

> - can you share the report descriptor and a few events when triggering
> this particular report (ideally with hid-recorder from
> https://gitlab.freedesktop.org/libevdev/hid-tools/

Report descriptor is below:

05 0d 09 02 a1 01 85 01 09 22 a1 02 09 42 15 00 25 01 75 01 95 01 81 02 
09 32 81 02 95 06 81 03 75 08 09 51 95 01 81 02 05 01 26 ff 0f 75 10 55 
0e 65 33 09 30 35 00 46 b5 04 81 02 46 8a 03 09 31 81 02 c0 05 0d 09 54 
95 01 75 08 81 02 85 08 09 55 25 05 b1 02 c0 05 0c 09 01 a1 01 85 02 09 
e9 09 ea 0a ae 01 09 e2 09 30 15 01 25 0c 75 10 95 01 81 00 c0

Events were collected using getevent call in adb shell in android:

On 4.19

# getevent -l

add device 7: /dev/input/event6
   name:     "BLE-M1 UNKNOWN"

/dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000000
/dev/input/event6: EV_ABS       ABS_MT_POSITION_X    00000800
/dev/input/event6: EV_ABS       ABS_MT_POSITION_Y    00000d60
/dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
/dev/input/event6: EV_SYN       SYN_REPORT           00000000
/dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
/dev/input/event6: EV_KEY       BTN_TOUCH            UP
/dev/input/event6: EV_SYN       SYN_REPORT           00000000
/dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   00000001
/dev/input/event6: EV_KEY       BTN_TOUCH            DOWN
/dev/input/event6: EV_SYN       SYN_REPORT           00000000
/dev/input/event6: EV_ABS       ABS_MT_TRACKING_ID   ffffffff
/dev/input/event6: EV_KEY       BTN_TOUCH            UP
/dev/input/event6: EV_SYN       SYN_REPORT           00000000

On 4.14

add device 2: /dev/input/event5
   name:     "BLE-M1 UNKNOWN"

/dev/input/event5: EV_MSC       MSC_SCAN             000d0042
/dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
/dev/input/event5: EV_KEY       BTN_DIGI             DOWN
/dev/input/event5: EV_ABS       ABS_MISC             00000001
/dev/input/event5: EV_ABS       ABS_X                00000800
/dev/input/event5: EV_ABS       ABS_Y                00000d60
/dev/input/event5: EV_ABS       0029                 00000001
/dev/input/event5: EV_SYN       SYN_REPORT           00000000

/dev/input/event5: EV_MSC       MSC_SCAN             000d0042
/dev/input/event5: EV_KEY       BTN_TOUCH            UP
/dev/input/event5: EV_KEY       BTN_DIGI             UP
/dev/input/event5: EV_ABS       0029                 00000000
/dev/input/event5: EV_SYN       SYN_REPORT           00000000

/dev/input/event5: EV_MSC       MSC_SCAN             000d0042
/dev/input/event5: EV_KEY       BTN_TOUCH            DOWN
/dev/input/event5: EV_KEY       BTN_DIGI             DOWN
/dev/input/event5: EV_ABS       0029                 00000001
/dev/input/event5: EV_SYN       SYN_REPORT           00000000

/dev/input/event5: EV_MSC       MSC_SCAN             000d0042
/dev/input/event5: EV_KEY       BTN_TOUCH            UP
/dev/input/event5: EV_KEY       BTN_DIGI             UP
/dev/input/event5: EV_ABS       0029                 00000000
/dev/input/event5: EV_SYN       SYN_REPORT           00000000


As I have little understanding of the framework, use cases and of the 
flow, I am sorry, if the information provided above is

incomplete (w.r.t. what you were expecting).


Thanks

Neeraj

> Cheers,
> Benjamin
>
>>
>> Thanks
>> Neeraj
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation

