Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6C3D0CD3
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfJIK3M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 06:29:12 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:60686 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbfJIK3M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Oct 2019 06:29:12 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id B189EA02CF;
        Wed,  9 Oct 2019 12:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1570616949;
        bh=50Z9iz03hJ2oBnA63oAtg3v/o92mprCNV7tVOEIO5oo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nApnUtTr1HYXDYzMEr94DH/MbYwGxpZz5EMiLivYS8o0zqmj1e9An4XJa02kkhpuh
         IMFuz4PwbdnqvPd7vZU+hpAxoeYRKIAixA5uCgf9qXCLhzocxA4mfp4tWc+K9hM12T
         f4bjEhD5T9fIKrPIuanbxODamXMVTNuR43cy6b/A=
Subject: Re: [PATCH 1/5] Input: pixcir_i2c_ts - Remove unneeded gpio.h header
 file
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Roger Quadros <rogerq@ti.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
        jcbian@pixcir.com.cn
References: <20191007121607.12545-1-festevam@gmail.com>
 <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
 <20191008184408.GG22365@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <c89401dd-14cc-c90a-9ca0-b44bb7d426f8@ysoft.com>
Date:   Wed, 9 Oct 2019 12:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008184408.GG22365@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 08. 10. 19 20:44, Dmitry Torokhov wrote:
> On Tue, Oct 08, 2019 at 01:11:15PM +0300, Roger Quadros wrote:
>> Hi,
>>
>> On 07/10/2019 15:16, Fabio Estevam wrote:
>>> The touchscreen device is a GPIO consumer, not a GPIO controller,
>>> so there is no need to include <linux/gpio.h>.
>>>
>>> Remove the unneeded header file.
>>>
>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>>
>> For all 5 patches,
>>
>> Reviewed-by: Roger Quadros <rogerq@ti.com>
> 
> I guess we can also do this:
> 
> Input: pixcir_i2c_ts - remove platform data
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Previous change moved platform data definition into the driver, making it
> unusable for users. Given that we want to move away from custom platform
> data structures, and always use device properties (DT, ACPI or static) to
> configure devices, let's complete the removal.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/touchscreen/pixcir_i2c_ts.c |  100 +++++++----------------------
>   1 file changed, 25 insertions(+), 75 deletions(-)

Compiled and boot tested the whole series including this patch from Dmitry
on our imx6dl-yapp4-draco with Pixcir Tango C48.

Everything still works for me, thanks!

Tested-by: michal.vokac@ysoft.com
