Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF64F2ECEF5
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 12:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbhAGLrk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 06:47:40 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38776 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbhAGLrj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 06:47:39 -0500
Received: from [114.252.213.174] (helo=[192.168.0.106])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1kxTkn-00082y-Bc; Thu, 07 Jan 2021 11:46:57 +0000
Subject: Re: [PATCH 2/2] HID: i2c-hid: Add a quirk to keep the power in
 shutdown
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
References: <20201204152912.151604-1-hui.wang@canonical.com>
 <20201204152912.151604-2-hui.wang@canonical.com>
 <nycvar.YFH.7.76.2101071011130.13752@cbobk.fhfr.pm>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <41f85551-96a6-7bac-6dc9-02a66080e900@canonical.com>
Date:   Thu, 7 Jan 2021 19:46:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2101071011130.13752@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 1/7/21 5:12 PM, Jiri Kosina wrote:
> On Fri, 4 Dec 2020, Hui Wang wrote:
>
>> On the latest Thinkpad Yoga laptop, the touchscreen module is wacom
>> I2C WACF2200 (056a:5276), we found the touchscreen could not work
>> after rebooting, needs to poweroff the machine then poweron the
>> machine to let it work.
>>
>> It is highly possible that this is a BIOS issue, but the windows
>> doesn't have this problem with the same BIOS.
>>
>> If keeping the power on when calling shutdown, the touchscreen could
>> work after rebooting. Let us add a quirk for it and apply the quirk
>> to this machine only.
> I wonder what do Windows do differently here. Perhaps they never put the
> i2c device to sleep while in shutdown anyway? Is there any downside to
> (not) doing the same?

It is highly possible the Windows doesn't sleep the i2c device in 
shutdown. When calling shutdown, it usually means reboot or poweroff the 
machine, so the sleep is meaningless in this situation. In other 
situations like users manually unload the i2c driver, maybe it will add 
a bit power consumption without sleeping the device.

Anyway, I will try to ask for help from vendor, maybe they could provide 
how Windows do when shutdown.

Thanks.

> Thanks,
>
