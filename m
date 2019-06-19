Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2E84B3B3
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 10:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfFSILw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 04:11:52 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45751 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731164AbfFSILw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 04:11:52 -0400
Received: from [125.35.49.90] (helo=[10.0.0.24])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hdVh4-0002uB-7n; Wed, 19 Jun 2019 08:11:46 +0000
Subject: Re: [PATCH v5] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
References: <20190619063756.9714-1-hui.wang@canonical.com>
 <20190619072944.bok36smpg7hphaao@pali>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <4c5fd996-6b19-3767-d8d2-5bf74ea10116@canonical.com>
Date:   Wed, 19 Jun 2019 16:11:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619072944.bok36smpg7hphaao@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/19 下午3:29, Pali Rohár wrote:
> On Wednesday 19 June 2019 14:37:56 Hui Wang wrote:
>> On a latest Lenovo laptop, the trackpoint and 3 buttons below it
>> don't work at all, when we move the trackpoint or press those 3
>> buttons, the kernel will print out:
>> "Rejected trackstick packet from non DualPoint device"
>>
>> This device is identified as an alps touchpad but the packet has
>> trackpoint format, so the alps.c drops the packet and prints out
>> the message above.
>>
>> According to XiaoXiao's explanation, this device is named cs19 and
>> is trackpoint-only device, its firmware is only for trackpoint, it
>> is independent of touchpad and is a device completely different from
>> DualPoint ones.
>>
>> To drive this device with mininal changes to the existing driver, we
>> just let the alps driver not handle this device, then the trackpoint.c
>> will be the driver of this device if the trackpoint driver is enabled.
>> (if not, this device will fallback to a bare PS/2 device)
>>
>> With the trackpoint.c, this trackpoint and 3 buttons all work well,
>> they have all features that the trackpoint should have, like
>> scrolling-screen, drag-and-drop and frame-selection.
>>
>> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> Looks good, you can add my:
>
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
>
> Thanks!
>
Thank you Pali.

And Dmitry, suppose this patch is ok to merge, do I need to send a new 
patch to add "Reviewed-by: Pali Rohár <pali.rohar@gmail.com>" or you 
will add it yourself.

Thanks,

Hui.

>> ---
>> In the v5:
>> change the commit header to add "fallback to a bare PS/2 device if
>
