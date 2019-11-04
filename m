Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C10EDBA1
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 10:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfKDJYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 04:24:14 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:47573 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfKDJYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 04:24:14 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4766n63ZTJz1rfM7;
        Mon,  4 Nov 2019 10:24:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4766n635jhz1qqkT;
        Mon,  4 Nov 2019 10:24:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id lWokg1vpsxzD; Mon,  4 Nov 2019 10:24:09 +0100 (CET)
X-Auth-Info: 6SEblH5duY4H5FnCc2Lxk/wUoobqaES8TSy+g3b5acc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  4 Nov 2019 10:24:09 +0100 (CET)
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190302141704.32547-1-marex@denx.de>
 <20191101204801.16328-1-TheSven73@gmail.com> <20191104070116.GM57214@dtor-ws>
From:   Marek Vasut <marex@denx.de>
Message-ID: <f4390226-055b-3667-e156-78695ae911e5@denx.de>
Date:   Mon, 4 Nov 2019 10:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104070116.GM57214@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/4/19 8:01 AM, Dmitry Torokhov wrote:
> Hi Sven,
> 
> On Fri, Nov 01, 2019 at 04:48:01PM -0400, Sven Van Asbroeck wrote:
>> Dmitry / Marek,
>>
>> There have been two attempts to add ILI2117 touch controller support.
>> I was about to add a third, but luckily I checked the mailing list
>> before writing any code :)
>>
>> Adding this support would clearly be beneficial for the common good.
>> What can we do to get this in motion again?
>>
>> Last time I checked, Marek posted a patch which added the 2117, but Dmitry
>> objected, because the code became too unwieldy. Dmitry then posted a cleanup
>> patch, which did not work for Marek. So everything came to a halt.
>> See:
>> https://patchwork.kernel.org/patch/10836651/
>> https://www.spinics.net/lists/linux-input/msg62670.html
>>
>> Dmitry, would you perhaps be willing to accept Marek's patch, and perform the
>> cleanup later?
>>
>> Marek, would you perhaps be willing to invest some time to debug Dmitry's
>> cleanup patch?
>>
>> On my end, I've reviewed Dmitry's patch and it looks mostly ok. I saw one
>> difference with ILI210X which could explain Marek's results, but I can't be
>> sure - because I could not locate the 210X's register layout on the web.
>>
>> In Dmitry's patch, we see:
>>
>> 	touch = ili210x_report_events(priv, touchdata);
>> 	if (touch || chip->continue_polling(touchdata))
>> 		schedule_delayed_work(&priv->dwork,
>> 				      msecs_to_jiffies(priv->poll_period));
>>
>> but this is not exactly equivalent to the original. Because in the original,
>> the 210X's decision to kick off delayed work is completely independent of
>> the value of touch.
> 
> No, it is not independent really. Bits 0 and 1 in the first byte
> correspond to touches with first and 2nd finger, so checking for touch
> in addition to 0xf3 mask is not incorrect.
> 
> Can you please tell me what device you have? Do the patches work for
> you?
> 
> Marek, sorry for letting the patches linger. Can you please tell me what
> touch controller did you test with that failed for you?

See Message-ID <20190917032842.GL237523@dtor-ws> . I tested the ILI2117
with these two patches and it works. With the additional two patches
from you on top, it failed, unless I reverted:
Input: ili210x - define and use chip operations structure

> I think I see at
> least one issue in ili251x_read_touch_data() - the check whether we
> should read the second part of the packet should check if data[0] == 2,
> not 0.

But that's not a problem of this particular patch, so maybe this patch
can finally be applied and then we can debug the subsequent patches ?
