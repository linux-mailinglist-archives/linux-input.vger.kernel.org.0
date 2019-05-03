Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0604C12AC7
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 11:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfECJgm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 May 2019 05:36:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35146 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfECJgm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 May 2019 05:36:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id z26so4690676ljj.2;
        Fri, 03 May 2019 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DG6/t7HmnFfa+6CRvfcSLTCArt9ZNpEuKq06GvwE8fE=;
        b=E6Ocuv0TC6NS9qH8m6RdpDaCwuOXxPrWsFBPKMEQB87fb4mdvJ6enHum12ngbykA1E
         kANbiUvmL1aHl6EYQlekDCkufGdlNOdaqXzK5Utlqsu+k4rt4xCucTqp0zI9Dfl+9sMP
         +UPsYWaiM5hb5S5YT4aGrC6reicVrH+Bc/f4TtCLVbApG/b6oHFgGuhpkHWK0GAOUAF8
         pAf+QgJj+ie9m0+2NitK0q11DvYMNHB5JlOEwwqF0SDdUgcCJ0tEliEgUW/ZFU6M+4kL
         9wlSjrNx8jM7Gdb9jOqkD5q48b8TWtVidwGJpxPg4S3kspL7iw+dIgKod2EyC1b/Z9CR
         WhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DG6/t7HmnFfa+6CRvfcSLTCArt9ZNpEuKq06GvwE8fE=;
        b=VDl2mryVyY5C8vMybRd/NyLfVxjkqOyWOgCVLW9ydSNeF3N0cB3q3mYQtFNK3sJkuS
         SK6toz8UttjAPraXF40kN9qxNWRoTJvPqqPv+2CO3m4iC08fFsFITErkOceAGAlV1nBh
         bpmd1X8WPAUDbwrctZ5NAuJodsc1uk5E0xSF37zLosIcQHECHb3eBMzHH2a4EM/W/5Ge
         KZYNvRNFWpb2daLE7pAoE+kILCQhgyRBCD7Hjf8mBNkLCwvIWlT5weGV/JIJ5ZXy2VSG
         ntprHss+XtJG2jui8olx4IKIDw/ZI3OM4IEq4Su6Z3J2EJquVRaEOksAzXMajzk/MYZR
         IuaQ==
X-Gm-Message-State: APjAAAXMkh9vnQNBKU+rGUJ4jcyHdRsWbtXL13B6DR17hbaoLJXyn+zn
        BZsSW6ZgYq4ipfqKItze3lnLPLST3jk=
X-Google-Smtp-Source: APXvYqyjONGBXbpDlTYkbrm3t3cSAdWkJ1oVUeQ9HuYD3GTh14wqkY//fOWoVL1OVYlFdL+w8PZUdw==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr1767391ljg.100.1556876198641;
        Fri, 03 May 2019 02:36:38 -0700 (PDT)
Received: from [192.168.1.111] ([77.123.15.14])
        by smtp.googlemail.com with ESMTPSA id n10sm332778ljh.36.2019.05.03.02.36.37
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 02:36:37 -0700 (PDT)
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190502213639.7632-1-spaz16@wp.pl>
 <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
From:   Igor Kushnir <igorkuo@gmail.com>
Message-ID: <1a40ea07-368a-93f6-8335-dec7ae50bbf4@gmail.com>
Date:   Fri, 3 May 2019 12:36:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On 5/3/19 10:36 AM, Benjamin Tissoires wrote:
> Hi,
> 
> On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
>>
>> Since recent high resolution scrolling changes the A4Tech driver must
>> check for the "REL_WHEEL_HI_RES" usage code.
>>
>> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
>> Resolution Multiplier for high-resolution scrolling)
>>
>> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> 
> Thanks for the patch. I do not doubt this fixes the issues, but I
> still wonder if we should not export REL_HWHEEL_HI_RES instead of
> REL_HWHEEL events.


If you mean exporting REL_HWHEEL_HI_RES instead of REL_HWHEEL from
hid-a4tech.c, then it makes sense to me, though I do not know the code
well enough to be certain.

Błażej and I have discussed the bug and the patch here:
https://bugzilla.kernel.org/show_bug.cgi?id=203369

In summary: the patch fixes the bug for both our mice;
the documentation in input/event-codes.rst states that
REL_WHEEL, REL_HWHEEL "are legacy codes and REL_WHEEL_HI_RES and
REL_HWHEEL_HI_RES should be preferred where available."

> Also, I can not figure out how the events are processed by the kernel.
> Could you attach a hid-recorder dump of the mouse wheels with
> hid-recorder from https://gitlab.freedesktop.org/libevdev/hid-tools ?
> 
> This should give me a better view of the mouse, and I could also add
> it to the regression tests I am running for each commit.
> 
> Cheers,
> Benjamin

After launching hid-recorder for my A4Tech WOP-49Z mouse under kernel
5.0.10 patched with Błażej's patch I:
* scrolled the vertical wheel down ("Wheel: -1");
* scrolled the vertical wheel up ("Wheel: 1");
* scrolled the horizontal wheel "left" ("Wheel: -1");
* scrolled the horizontal wheel "right" ("Wheel: 1").
Note that the horizontal wheel is physically scrolled just like the
vertical one in this mouse (forward/back), so "left" and "right" are the
effects these scrollings make in applications when the kernel supports
the mouse properly.

$ sudo ./hid-recorder /dev/hidraw1
# A4Tech PS/2+USB Mouse
# 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
# 0x09, 0x02,                    // Usage (Mouse)                       2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x09, 0x01,                    //  Usage (Pointer)                    6
# 0xa1, 0x00,                    //  Collection (Physical)              8
# 0x05, 0x09,                    //   Usage Page (Button)               10
# 0x19, 0x01,                    //   Usage Minimum (1)                 12
# 0x29, 0x07,                    //   Usage Maximum (7)                 14
# 0x15, 0x00,                    //   Logical Minimum (0)               16
# 0x25, 0x01,                    //   Logical Maximum (1)               18
# 0x75, 0x01,                    //   Report Size (1)                   20
# 0x95, 0x07,                    //   Report Count (7)                  22
# 0x81, 0x02,                    //   Input (Data,Var,Abs)              24
# 0x75, 0x01,                    //   Report Size (1)                   26
# 0x95, 0x01,                    //   Report Count (1)                  28
# 0x81, 0x01,                    //   Input (Cnst,Arr,Abs)              30
# 0x05, 0x01,                    //   Usage Page (Generic Desktop)      32
# 0x09, 0x30,                    //   Usage (X)                         34
# 0x09, 0x31,                    //   Usage (Y)                         36
# 0x09, 0x38,                    //   Usage (Wheel)                     38
# 0x15, 0x81,                    //   Logical Minimum (-127)            40
# 0x25, 0x7f,                    //   Logical Maximum (127)             42
# 0x75, 0x08,                    //   Report Size (8)                   44
# 0x95, 0x03,                    //   Report Count (3)                  46
# 0x81, 0x06,                    //   Input (Data,Var,Rel)              48
# 0xc0,                          //  End Collection                     50
# 0xc0,                          // End Collection                      51
#
R: 52 05 01 09 02 a1 01 09 01 a1 00 05 09 19 01 29 07 15 00 25 01 75 01 
95 07 81 02 75 01 95 01 81 01 05 01 09 30 09 31 09 38 15 81 25 7f 75 08 
95 03 81 06 c0 c0
N: A4Tech PS/2+USB Mouse
I: 3 09da 0006
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000000.000000 4 00 00 00 ff
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000000.071952 4 00 00 00 ff
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000000.159957 4 00 00 00 ff
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
E: 000002.912232 4 00 00 00 01
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
E: 000002.952190 4 00 00 00 01
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
E: 000004.512359 4 00 00 00 01
#  Button: 0  0  0  0  0  0  0 | # | X:    0 | Y:    0 | Wheel:    1
E: 000004.584332 4 00 00 00 01
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000007.528626 4 40 00 00 ff
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000007.568577 4 40 00 00 ff
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000008.256395 4 40 00 00 ff
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000008.336669 4 40 00 00 ff
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:   -1
E: 000008.400649 4 40 00 00 ff
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
E: 000010.936908 4 40 00 00 01
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
E: 000010.984864 4 40 00 00 01
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
E: 000011.056897 4 40 00 00 01
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
E: 000011.528936 4 40 00 00 01
#  Button: 0  0  0  0  0  0  1 | # | X:    0 | Y:    0 | Wheel:    1
E: 000011.616923 4 40 00 00 01

Cheers,
Igor

>> ---
>>   drivers/hid/hid-a4tech.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
>> index 9428ea7cdf8a..fafb9fa558e7 100644
>> --- a/drivers/hid/hid-a4tech.c
>> +++ b/drivers/hid/hid-a4tech.c
>> @@ -38,7 +38,7 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>>   {
>>          struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>>
>> -       if (usage->type == EV_REL && usage->code == REL_WHEEL)
>> +       if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES)
>>                  set_bit(REL_HWHEEL, *bit);
>>
>>          if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
>> @@ -60,7 +60,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>>          input = field->hidinput->input;
>>
>>          if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
>> -               if (usage->type == EV_REL && usage->code == REL_WHEEL) {
>> +               if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>>                          a4->delayed_value = value;
>>                          return 1;
>>                  }
>> @@ -77,7 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>>                  return 1;
>>          }
>>
>> -       if (usage->code == REL_WHEEL && a4->hw_wheel) {
>> +       if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
>>                  input_event(input, usage->type, REL_HWHEEL, value);
>>                  return 1;
>>          }
>> --
>> 2.21.0
>>
