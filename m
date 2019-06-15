Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C25B46EFE
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2019 10:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfFOIbi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Jun 2019 04:31:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:32807 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfFOIbi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Jun 2019 04:31:38 -0400
Received: by mail-io1-f65.google.com with SMTP id u13so11019395iop.0
        for <linux-input@vger.kernel.org>; Sat, 15 Jun 2019 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O30vPk03fmPuAkVpkdfLcJdcZFMIIWJDBgdSpMVqhdk=;
        b=dgpL0+XaVJd1GqeCyUv+xCAQ/WgwwFvVhIiVz4AabsI4T0Th5R6OTcoVqUFwmwVxZg
         dgMAmBA9ODJLADOkQY63qjYc/nVU0+xtuKCLy1X3u5RKhOcHorCgLVY+9/91ZeMFAqFv
         vA2PTNdd+EcLwZX4IpjKYk82rBCKRDAeukJ9cAFkMyKsey33VSo2ocFuMnxnfrMc2aGf
         3YjChBDig/sZbVkvtbktdrRzFMJjLUtYQJXIvv+me0oWhL4vJjzW8pVPccM/K1LgwhIT
         M8kzoO6Xwyc/kIiJieg232QQq/yDyH+cX4hKiByXw1LN7oYpRkpDGKKYPHWp1u02aiVd
         wi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O30vPk03fmPuAkVpkdfLcJdcZFMIIWJDBgdSpMVqhdk=;
        b=gE9oZwAVvXRkTE1PN8dyeKQKeo5s6ML8MjXdKyeA4IPXBFXUZlKg7s/lqFLg9VEK/2
         iQz32WuDStvxkMyfYrcMFgdFhRGm+cv0aPlBHkieJGhsQYxI7/pr9vDeP6V6TSlxqkp1
         sE5Aa1gCZLm5yFxtnZ1MNdvpNlS4HGnjNMT2AoZNF5mutdY99rY2VSG6KVFqn+ssM53s
         Lqd40vpQF3tfSox9CB6E1ydfeXwsl8AQN01YNAuvNIoGmB9qxYjm4DW7U19gpU53fjau
         cGbVqEE0ts4G7fZg2CUlwZpOwVYZI1Mp2dNx+sBuCFb8A43yogO3WOGpUqjCbORo+sdl
         VIwg==
X-Gm-Message-State: APjAAAVq47It8sGU7SZqIQAs9KLFwgQamVhnnkaFnBVHuyJZ5Bgktcbq
        LuzGtV/F6L6ww4UdARxRdlFFYYAFYLgaZ0eCLss=
X-Google-Smtp-Source: APXvYqxt3/SPQ+r20xinnjMj4BdU5w3YEwF8pKHm0osdjCvh8bJHBkplUdn1UyLCK7rBnrosXMSFQUqoBgUrLv56s0U=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr9086971jar.2.1560587496779;
 Sat, 15 Jun 2019 01:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190603060644.10338-1-djogorchock@gmail.com> <1601292018.1560461326555.eu.faircode.email@localhost>
 <CAEVj2t=SZz664Si5u3j7JM6ZDEvP_X5P2q6M0G-PE8HJ4zhAeQ@mail.gmail.com>
In-Reply-To: <CAEVj2t=SZz664Si5u3j7JM6ZDEvP_X5P2q6M0G-PE8HJ4zhAeQ@mail.gmail.com>
From:   Billy Laws <blaws05@gmail.com>
Date:   Sat, 15 Jun 2019 09:31:25 +0100
Message-ID: <CAFUUQHPb7vGj0Dnn-mFTuDVhN9HZS-SX5pM8mDy7xPovq2Zw_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] HID: joycon
To:     Daniel Ogorchock <djogorchock@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        jbrandst@2ds.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I had a look and found the mail you were referring to, however the bug
was fixed in 4.8 which should be fine as I am using 4.9.
Testing using v1 of the driver, which uses workqueues resulted in the
same issue. I also tested using HID_CONNECT_DRIVER in probe, then
after init HID_CONNECT_HIDRAW, this didn't work either (here is logcat
https://paste.ee/p/5VHga - len 12 packets are standard input ones and
dmesg https://paste.ee/p/oXVsq).
That driver you probably linked works because it doesn't actually send
anything, just takes in the raw hid events. Would the joycons always
reply to a get calib request?
On Sat, Jun 15, 2019 at 8:41 AM Daniel Ogorchock <djogorchock@gmail.com> wr=
ote:
>
>
> On Thu, Jun 13, 2019, 16:35 billy <blaws05@gmail.com> wrote:
>>
>>
>> Hey,
>>  I am working on android on the nintendo switch (typing this mail on it =
:) and am trying to use this driver to support joycons with their full func=
tionality, however, when trying to connect while this driver is in the kern=
el, the request for calibration times out (err 110) and prevents them from =
working at all. At first i thought it was due to the latency issue android =
has with joycons, but even after applying the fix for that for that it stil=
l doesn't work. Do you have any ideas why this is happening?
>
>
> Hi Billy,
>
> What Android kernel version are you using? I think I recall someone else =
telling me they were getting calibration timeouts on Android. The driver fo=
und here was working for them:
>
> https://gitlab.com/pjranki/joycon-linux-kernel/blob/master/drivers/hid/hi=
d-joycon.c
>
> I think it's because of my driver relying on hid_device_io_start() to all=
ow for retrieving calibration in the probe. I vaguely remember Benjamin des=
cribing somewhat recent changes that made that possible. Maybe moving all t=
he calls after hid_device_io_start into a workqueue would be a good sanity =
check if that's the problem.
>
>>
>>
>> Sun Jun 02 19:06:55 GMT-11:00 2019 Daniel J. Ogorchock :
>>
>> > Version 5 changes:
>>  > - Removed sysfs interface to control motor frequencies.
>>  > - Improved rumble reliability by using subcommands to set it.
>>  > - Changed mapping of the SL/SR triggers on the joy-cons to map to
>>  > whichever triggers they lack (e.g. a left joycon's sl/sr map to
>>  > TR and TR2). This allows userspace to distinguish between the
>>  > normal and S triggers.
>>  > - Minor refactors
>>  > Version 4 changes:
>>  > - Added support for the Home button LED for the pro controller and
>>  > right joy-con
>>  > - Changed name from hid-switchcon to hid-joycon
>>  > - Added rumble support
>>  > - Removed ctlr->type and use hdev->product instead
>>  > - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translatin=
g
>>  > to capacity percentages
>>  > - Misc. minor refactors based on v3 feedback
>>  >
>>  > Version 3 changes:
>>  > - Added led_classdev support for the 4 player LEDs
>>  > - Added power_supply support for the controller's battery
>>  > - Made the controller number mutex static
>>  > - Minor refactoring/style fixes based on Roderick's feedback from v2
>>  >
>>  > Version 2 changes:
>>  > - Switched to using a synchronous method for configuring the
>>  > controller.
>>  > - Removed any pairing/orientation logic in the driver. Every
>>  > controller now corresponds to its own input device.
>>  > - Store controller button data as a single u32.
>>  > - Style corrections
>>  >
>>  > Daniel J. Ogorchock (5):
>>  > HID: joycon: add nintendo switch controller driver
>>  > HID: joycon: add player led support
>>  > HID: joycon: add power supply support
>>  > HID: joycon: add home led support
>>  > HID: joycon: add rumble support
>>  >
>>  > MAINTAINERS | 6 +
>>  > drivers/hid/Kconfig | 24 +
>>  > drivers/hid/Makefile | 1 +
>>  > drivers/hid/hid-ids.h | 3 +
>>  > drivers/hid/hid-joycon.c | 1414 +++++++++++++++++++++++++++++++++++++=
+
>>  > 5 files changed, 1448 insertions(+)
>>  > create mode 100644 drivers/hid/hid-joycon.c
>>  >
>>  > --
>>  > 2.21.0
>>  >
>>  >
>>
>>
