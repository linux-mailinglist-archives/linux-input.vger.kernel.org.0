Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801DE38E82D
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 15:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhEXOAl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 10:00:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5686 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbhEXOAg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 10:00:36 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpdzM5WNlz1BQD3;
        Mon, 24 May 2021 21:56:15 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 21:59:06 +0800
Received: from [127.0.0.1] (10.40.188.252) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 24 May
 2021 21:59:05 +0800
Subject: Re: [PATCH RESEND] Input: misc - use the correct HiSilicon copyright
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <xuezhiliang@hisilicon.com>
References: <1621677987-11009-1-git-send-email-fanghao11@huawei.com>
 <YKsWGjy/0u/T8iO2@google.com>
CC:     <xuezhiliang@huawei.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <prime.zeng@hisilicon.com>
From:   "fanghao (A)" <fanghao11@huawei.com>
Message-ID: <17af7a73-7a9f-2587-3529-bca5a7b775a2@huawei.com>
Date:   Mon, 24 May 2021 21:59:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <YKsWGjy/0u/T8iO2@google.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.188.252]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 2021/5/24 10:57, Dmitry Torokhov wrote:
> Hi Hao,
>
> On Sat, May 22, 2021 at 06:06:27PM +0800, Hao Fang wrote:
>> s/Hisilicon/HiSilicon/g.
>> It should use capital S, according to
>> https://www.hisilicon.com/en.
>>
>> Signed-off-by: Hao Fang <fanghao11@huawei.com>
>> ---
>>  drivers/input/misc/hisi_powerkey.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
>> index d3c293a..54cbfdf 100644
>> --- a/drivers/input/misc/hisi_powerkey.c
>> +++ b/drivers/input/misc/hisi_powerkey.c
>> @@ -1,7 +1,7 @@
>>  /*
>>   * Hisilicon PMIC powerkey driver
>>   *
>> - * Copyright (C) 2013 Hisilicon Ltd.
>> + * Copyright (C) 2013 HiSilicon Ltd.
>
> I see there are various versions of "Hisilicon" in copyright notices. I
> do not know if capitalization here matters and which form is correct.
> If this is important I'd rather HiSilicon folks submitted such
> patch(es).
>

Xuezhiliang, can you help to review this patch and add an Acked-by? Or you can resubmit it.
I found out you're the author of this driver, maybe you changed your email address.

Thanks.
Hao

>

