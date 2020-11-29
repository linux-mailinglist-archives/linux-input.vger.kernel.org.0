Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E4D2C7B21
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 21:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgK2UQX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 15:16:23 -0500
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:32338 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgK2UQX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 15:16:23 -0500
Received: from [192.168.42.210] ([81.185.174.0])
        by mwinf5d59 with ME
        id yLEd2300800t0l503LEdbv; Sun, 29 Nov 2020 21:14:38 +0100
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Nov 2020 21:14:38 +0100
X-ME-IP: 81.185.174.0
Subject: Re: [PATCH] Input: Fix a ref counting issue
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     rydberg@euromail.se, tj@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20201129084516.1456099-1-christophe.jaillet@wanadoo.fr>
 <20201129194918.GL2034289@dtor-ws>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <b10e44bf-d3a6-f2a2-d47b-7a6f561cf6c6@wanadoo.fr>
Date:   Sun, 29 Nov 2020 21:14:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201129194918.GL2034289@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Le 29/11/2020 à 20:49, Dmitry Torokhov a écrit :
> Hi Christophe,
>
> On Sun, Nov 29, 2020 at 09:45:16AM +0100, Christophe JAILLET wrote:
>> In case of a managed resource, 'devm_input_device_release()' already has a
>> 'input_put_device(dev)' call.
>>
>> Avoid a double reference decrement by explicitly calling
>> 'input_put_device()' only on non-managed input device.
> This patch is incorrect, as devres_destroy() that is used in
> input_free_device(), unlike devres_releasde(), does not actually call
> the "release" function. It simply destroys the devres object, but does
> not clear associated resources.

Crystal clear.
Thanks for the explanation and sorry for the noise.

CJ

>> Fixes: 2be975c6d920 ("Input: introduce managed input devices (add devres support)")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This patch is completely speculative and compile tested only.
>> ---
>>   drivers/input/input.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>> index 3cfd2c18eebd..c09c9f020667 100644
>> --- a/drivers/input/input.c
>> +++ b/drivers/input/input.c
>> @@ -1920,7 +1920,8 @@ void input_free_device(struct input_dev *dev)
>>   						devm_input_device_release,
>>   						devm_input_device_match,
>>   						dev));
>> -		input_put_device(dev);
>> +		else
>> +			input_put_device(dev);
>>   	}
>>   }
>>   EXPORT_SYMBOL(input_free_device);
>> -- 
>> 2.27.0
>>
> Thanks.
>
