Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A55361A6A
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 09:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbhDPHRR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 03:17:17 -0400
Received: from mail.astralinux.ru ([217.74.38.119]:57484 "EHLO
        mail.astralinux.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbhDPHRR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 03:17:17 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.astralinux.ru (Postfix) with ESMTP id 230C935E7571;
        Fri, 16 Apr 2021 10:16:31 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
        by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id EzC_lXdhUdom; Fri, 16 Apr 2021 10:16:30 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
        by mail.astralinux.ru (Postfix) with ESMTP id 5442835E7573;
        Fri, 16 Apr 2021 10:16:30 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
        by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id a_wrFsdTO1HC; Fri, 16 Apr 2021 10:16:30 +0300 (MSK)
Received: from [192.168.32.67] (unknown [192.168.32.67])
        by mail.astralinux.ru (Postfix) with ESMTPSA id 25EDD35E7570;
        Fri, 16 Apr 2021 10:16:30 +0300 (MSK)
Subject: Re: UPD: hid-multitouch: goodix: hovering works as touch
To:     Hans de Goede <hdegoede@redhat.com>,
        Vitaly Minko <vitaly@minko.me>, linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniele Gobbetti <daniele@gobbetti.name>
References: <ab5ad25b-d39c-83fe-4a88-eebed7f8b23a@minko.me>
 <7b7af64e-8e70-3a9c-eee9-010574adc241@astralinux.ru>
 <8e25e7c4-53bd-98d5-35da-cb596f84e9c4@minko.me>
 <62b7301b-a3a1-d49c-2a60-5640984a404a@redhat.com>
From:   Dmitry Mastykin <dmastykin@astralinux.ru>
Message-ID: <7b988eea-62b5-e799-ae5e-d7fa3ebcb9a1@astralinux.ru>
Date:   Fri, 16 Apr 2021 10:16:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62b7301b-a3a1-d49c-2a60-5640984a404a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

Of course I would like to put a pen patch to upstream, and ready to work 
for that.
Have you taken a look to it? It's seems to be like a workaround. And 
it's difficult to say if pen button part of the patch will work fine 
with all gt7385p firmwares (sequence of tip, barrel and eraser is very 
tricky, but is it stable from version to version?)
Should I rebase my patch, provide with comments and send the series to 
linux-input? Do you have any wishes how I could improve it before?

Thank you very much!
Dmitry Mastykin


On 4/15/21 7:02 PM, Hans de Goede wrote:
> Hi,
> 
> On 4/15/21 3:33 PM, Vitaly Minko wrote:
>> Hello Dmitry,
>>
>>
>> I have tested your patches on the kernel version 5.10.27. I had to add one define for I2C_DEVICE_ID_GOODIX_0113. Everything else was applied successfully.
>>
>> The digitizer works fine now. So the original issue is solved. Both pen buttons also work as expected (right and middle mouse buttons).
>>
>> All tests performed on One-Netbook A1.
>>
>> Thanks a lot for your efforts. Could you please send me a private email with your credentials for sending a tip (I would like to buy you a coffee).
> 
> Although it is nice that these patches fix things for you, I wonder if there
> is any plan to get the fixes for this upstream, so that once distros jump
> to a newer kernel this will just work out of the box for all Linux users ?
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> 15.04.2021 10:13, Dmitry Mastykin wrote:
>>> Hi Vitaly,
>>>
>>> Yes, we made a quirk for separate non-multitouch processing of the HID_DG_PEN application for Goodix gt7385p (I2C_DEVICE_ID_GOODIX_0113 == 0x0113). It works well, BTN_TOOL_PEN and BTN_TOUCH events have right order.
>>> I attach patches for kernel 5.4
>>> Buttons support was very tricky, because the panel tries to imitate eraser usage with combination of tip's and eraser's bits off and on, seems that Windows driver needs this. In second patch we add state-machines for pen buttons to simulate right and middle click. It works also well with this panel/pen, but I'm not sure if it works with other devices.
>>>
>>> Kind regards,
>>> Dmitry Mastykin
>>>
>>>
>>> On 4/14/21 6:35 PM, Vitaly Minko wrote:
>>>> Hello Dmitry,
>>>>
>>>>
>>>> I have faced with exactly the same problem. Have you managed to solve the issue?
>>>>
>>>> If yes, could you please share the patch?
>>>>
>>>> Thanks in advance!
>>>>
>>>>
>>>> Best regards,
>>>>
>>>> Vitaly
>>>>
>>
> 
