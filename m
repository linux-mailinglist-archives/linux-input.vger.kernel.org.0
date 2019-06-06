Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A5B36908
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 03:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFFBL6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 21:11:58 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:18087 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbfFFBL6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 21:11:58 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 87C5A28B02337AE3EB76;
        Thu,  6 Jun 2019 09:11:55 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.180) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 6 Jun 2019
 09:11:54 +0800
Subject: Re: [PATCH] Input: alps: Drop unlikely before IS_ERR(_OR_NULL)
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
CC:     <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
 <20190605142428.84784-5-wangkefeng.wang@huawei.com>
 <20190605144240.pfrvlgxsdpacpwxf@pali>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
Date:   Thu, 6 Jun 2019 09:08:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190605144240.pfrvlgxsdpacpwxf@pali>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.177.19.180]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/5 22:42, Pali Rohár wrote:
> On Wednesday 05 June 2019 22:24:28 Kefeng Wang wrote:
>> IS_ERR(_OR_NULL) already contain an 'unlikely' compiler flag,
>> so no need to do that again from its callers. Drop it.
> Hi! I already reviewed this patch and rejected it, see:
> https://patchwork.kernel.org/patch/10817475/
OK, please ignore it.
>> Cc: "Pali Rohár" <pali.rohar@gmail.com>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: linux-input@vger.kernel.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  drivers/input/mouse/alps.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
>> index 0a6f7ca883e7..791ef0f826c5 100644
>> --- a/drivers/input/mouse/alps.c
>> +++ b/drivers/input/mouse/alps.c
>> @@ -1478,7 +1478,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
>>  		/* On V2 devices the DualPoint Stick reports bare packets */
>>  		dev = priv->dev2;
>>  		dev2 = psmouse->dev;
>> -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
>> +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
>>  		/* Register dev3 mouse if we received PS/2 packet first time */
>>  		if (!IS_ERR(priv->dev3))
>>  			psmouse_queue_work(psmouse, &priv->dev3_register_work,

