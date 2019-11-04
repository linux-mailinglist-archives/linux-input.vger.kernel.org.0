Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0C8ED689
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 01:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfKDAQ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Nov 2019 19:16:27 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:39882 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbfKDAQ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Nov 2019 19:16:27 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 475td40s7Xz1rGRv;
        Mon,  4 Nov 2019 01:16:24 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 475td40Dj4z1qqkH;
        Mon,  4 Nov 2019 01:16:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id dcYjG6feI1ua; Mon,  4 Nov 2019 01:16:22 +0100 (CET)
X-Auth-Info: I/L9RVBnAf0HtVe+VPMywJe3DswH5gvYMLM+kWyCQr4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  4 Nov 2019 01:16:22 +0100 (CET)
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Adam Ford <aford173@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190302141704.32547-1-marex@denx.de>
 <20191101204801.16328-1-TheSven73@gmail.com>
 <CAHCN7xL4aNDf+4TiStSp4PMiA_FKj9VOmCpe-o42WBhMdoj_Ew@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <af0b175c-ced0-1a01-9a19-7e49fdb3386d@denx.de>
Date:   Mon, 4 Nov 2019 01:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xL4aNDf+4TiStSp4PMiA_FKj9VOmCpe-o42WBhMdoj_Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/4/19 12:55 AM, Adam Ford wrote:
> On Fri, Nov 1, 2019 at 3:48 PM Sven Van Asbroeck wrote:
>>
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
>>         touch = ili210x_report_events(priv, touchdata);
>>         if (touch || chip->continue_polling(touchdata))
>>                 schedule_delayed_work(&priv->dwork,
>>                                       msecs_to_jiffies(priv->poll_period));
>>
>> but this is not exactly equivalent to the original. Because in the original,
>> the 210X's decision to kick off delayed work is completely independent of
>> the value of touch.
>>
> 
> If anyone is interested, I posted a patch to add ili2117A.
> https://patchwork.kernel.org/patch/10849877/
> 
> I am not sure if it's compatible with the non-A version.

This patch could've gone in as-is, the rework was not necessary (and
indeed, didn't work). I don't know why this patch wasn't applied in the
end, maybe it was just missed.
