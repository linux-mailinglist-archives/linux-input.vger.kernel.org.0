Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB37954E9
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 05:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbfHTDOz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Aug 2019 23:14:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57869 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728945AbfHTDOz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Aug 2019 23:14:55 -0400
Received: from [125.35.49.90] (helo=[10.0.0.30])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hzubl-0001zh-1d; Tue, 20 Aug 2019 03:14:53 +0000
Subject: Re: [PATCH] Input: psmouse - drop all unneeded functions from mouse
 headers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20190819135500.3261-1-hui.wang@canonical.com>
 <20190819182634.GN121898@dtor-ws>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <762de72c-2dc8-6fd0-2fa8-081a179a0c4c@canonical.com>
Date:   Tue, 20 Aug 2019 11:14:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819182634.GN121898@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/8/20 上午2:26, Dmitry Torokhov wrote:
> Hi Hui,
>
> On Mon, Aug 19, 2019 at 09:55:00PM +0800, Hui Wang wrote:
>> Recently we had a building error if we enable the MOUSE_PS2_ALPS while
>> disable the MOUSE_PS2_TRACKPOINT, and was fixed by 49e6979e7e92
>> ("Input: psmouse - fix build error of multiple definition").
>>
>> We could improve that fix by dropping all unneeded functions from
>> the header, it is safe to do that since those functions are not
>> directly called by psmouse-base.c anymore.
>>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   drivers/input/mouse/alps.h         |  9 ---------
>>   drivers/input/mouse/byd.h          |  9 ---------
>>   drivers/input/mouse/cypress_ps2.h  |  9 ---------
>>   drivers/input/mouse/elantech.h     | 13 -------------
>>   drivers/input/mouse/hgpk.h         |  8 --------
>>   drivers/input/mouse/lifebook.h     |  8 --------
>>   drivers/input/mouse/logips2pp.h    |  5 -----
>>   drivers/input/mouse/sentelic.h     |  9 ---------
>>   drivers/input/mouse/touchkit_ps2.h |  6 ------
>>   drivers/input/mouse/trackpoint.h   |  6 ------
>>   drivers/input/mouse/vmmouse.h      |  9 ---------
>>   11 files changed, 91 deletions(-)
>>
>> diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
>> index f4bab629739c..74ad10327c48 100644
>> --- a/drivers/input/mouse/alps.h
>> +++ b/drivers/input/mouse/alps.h
>> @@ -326,15 +326,6 @@ struct alps_data {
>>   #ifdef CONFIG_MOUSE_PS2_ALPS
> Do we need to keep the CONFIG_MOUSE_* guards if we are dropping stubs?

No, we don't need to keep them, will drop them all in the v2.

Thanks.

>
>>   int alps_detect(struct psmouse *psmouse, bool set_properties);
>>   int alps_init(struct psmouse *psmouse);
>> -#else
>> -inline int alps_detect(struct psmouse *psmouse, bool set_properties)
>> -{
>> -	return -ENOSYS;
>> -}
>> -inline int alps_init(struct psmouse *psmouse)
>> -{
>> -	return -ENOSYS;
>> -}
>>   #endif /* CONFIG_MOUSE_PS2_ALPS */
> Thanks.
>
> -
> Dmitry
>
