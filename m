Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186143046B2
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 19:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbhAZRV3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 12:21:29 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46909 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390646AbhAZI7F (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jan 2021 03:59:05 -0500
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=[192.168.1.24])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1l4KAf-0002OY-W9; Tue, 26 Jan 2021 08:57:58 +0000
Subject: Re: [PATCH 2/2] HID: i2c-hid: Add a quirk to keep the power in
 shutdown
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
References: <20201204152912.151604-1-hui.wang@canonical.com>
 <20201204152912.151604-2-hui.wang@canonical.com>
 <nycvar.YFH.7.76.2101071011130.13752@cbobk.fhfr.pm>
 <41f85551-96a6-7bac-6dc9-02a66080e900@canonical.com>
 <nycvar.YFH.7.76.2101081600460.13752@cbobk.fhfr.pm>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <ffb34106-ac11-de9f-ef67-5be5e76d2a0d@canonical.com>
Date:   Tue, 26 Jan 2021 16:57:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2101081600460.13752@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 1/8/21 11:01 PM, Jiri Kosina wrote:
> On Thu, 7 Jan 2021, Hui Wang wrote:
>
>>>> On the latest Thinkpad Yoga laptop, the touchscreen module is wacom
>>>> I2C WACF2200 (056a:5276), we found the touchscreen could not work
>>>> after rebooting, needs to poweroff the machine then poweron the
>>>> machine to let it work.
>>>>
>>>> It is highly possible that this is a BIOS issue, but the windows
>>>> doesn't have this problem with the same BIOS.
>>>>
>>>> If keeping the power on when calling shutdown, the touchscreen could
>>>> work after rebooting. Let us add a quirk for it and apply the quirk
>>>> to this machine only.
>>> I wonder what do Windows do differently here. Perhaps they never put the
>>> i2c device to sleep while in shutdown anyway? Is there any downside to
>>> (not) doing the same?
>> It is highly possible the Windows doesn't sleep the i2c device in shutdown.
>> When calling shutdown, it usually means reboot or poweroff the machine, so the
>> sleep is meaningless in this situation. In other situations like users
>> manually unload the i2c driver, maybe it will add a bit power consumption
>> without sleeping the device.
> Agreed, but if windows really don't put the device to sleep before
> shutting down, odds are there will be more devices behaving the same, and
> therefore we'd rather make it the default case instead of growing just
> another quirk list.

Got the feedback from the ODM, the root cause of this issue is the I2C 
device will send clock stretching when changing from PWR_SLEEP to 
PWR_ON, but the driver in the BIOS doesn't handle the clock stretching 
or the timeout is not enough. ODM already provided a testing BIOS and 
this issue is fixed by the testing BIOS.

And ODM captured the I2C data transfer log under Windows, according to 
the log, the Windows also set the I2C touchscreen to PWR_SLEEP before 
rebooting, it is same as the current Linux hid i2c driver.

Regards,

Hui.

>> Anyway, I will try to ask for help from vendor, maybe they could provide
>> how Windows do when shutdown.
> Thank you,
>
