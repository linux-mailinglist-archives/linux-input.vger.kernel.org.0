Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956B225C31C
	for <lists+linux-input@lfdr.de>; Thu,  3 Sep 2020 16:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729310AbgICOo5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Sep 2020 10:44:57 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:28704 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgICOoh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Sep 2020 10:44:37 -0400
IronPort-SDR: nkWVAQKqUCXjXdJVF0KOn7X/P8AH4A4+9wI69zWZU3zIGWV2djriaGGB0WigwaZqbiCLCE7dFL
 XP+9lmAashYfp4IYGIWQM0YFqSb8T5YfbDx/HxOkAc7p91myExBIjyf67GfCpM/Nwe9g0jI9s4
 d9EOGdlvTuy0EhALv78khIxewiGgYsgt7HB5ep7XnErOEVNbBRNWLsHPgaJF0ZE3w9iuf89WSd
 SuRxstOlvEPNeLdn7J0LEtGXWPV6OgGP96xeGQud1OlwLP9A3q+fGA2vj4qhyh8VIFPBckKpwi
 1U0=
X-IronPort-AV: E=Sophos;i="5.76,387,1592899200"; 
   d="scan'208";a="54728480"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 03 Sep 2020 06:44:30 -0800
IronPort-SDR: Mgmi2Sj3+nlxK/9a28nix/exYFJLpu41rF0jAUMoQX66CtMvBMjTmsnuGDZIH9HRErM/sP7K7+
 VNrT6TbfxCSjcs1cAPcnfdJIdiJgb7dYpNvV7RUKcW15t+QmT17xWc6bog6HJK2tvx8V3fAnpD
 i0JiUYuqpIp9gdxK4puu4tq9wMkN+tD1rW7qR7imz/74ynJGTDlG2Bg3YJ0LXVHHrnHKtVS2rL
 nGDp3E4LRGP12zUXOG/9ySxhvGBn6etQMM2KZrb1s1+xI9o43Khe/06Dpzll8tZ+pn9v3rGBsg
 pV4=
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200821082254.16661-1-jiada_wang@mentor.com>
 <64c77ff9-6d20-abcf-f549-7d5c85fba28d@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <2c8ed5c8-f95b-dce4-f964-ac16f12c3f20@mentor.com>
Date:   Thu, 3 Sep 2020 23:44:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <64c77ff9-6d20-abcf-f549-7d5c85fba28d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/08/28 17:19, Dmitry Osipenko wrote:
> 21.08.2020 11:22, Jiada Wang пишет:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
>> when they are in a sleep state. It must be retried after a delay for the
>> chip to wake up.
>>
>> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
>> Acked-by: Yufeng Shen <miletus@chromium.org>
>> (cherry picked from ndyer/linux/for-upstream commit 63fd7a2cd03c3a572a5db39c52f4856819e1835d)
>> [gdavis: Forward port and fix conflicts.]
>> Signed-off-by: George G. Davis <george_davis@mentor.com>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
>>   1 file changed, 30 insertions(+), 15 deletions(-)
> 
> Hello, Jiada!
> 
> I tested this patch on Acer A500 that has mXT1386 controller which
> requires the I2C retrying and everything working good, no problems
> spotted! Touchscreen doesn't work without this patch!
> 
> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> 
> I have one minor comment, please see it below!
> 
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index a2189739e30f..e93eda1f3d59 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -196,6 +196,7 @@ enum t100_type {
>>   #define MXT_CRC_TIMEOUT		1000	/* msec */
>>   #define MXT_FW_RESET_TIME	3000	/* msec */
>>   #define MXT_FW_CHG_TIMEOUT	300	/* msec */
>> +#define MXT_WAKEUP_TIME		25	/* msec */
>>   
>>   /* Command to unlock bootloader */
>>   #define MXT_UNLOCK_CMD_MSB	0xaa
>> @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>>   	struct i2c_msg xfer[2];
>>   	u8 buf[2];
>>   	int ret;
>> +	bool retry = false;
>>   
>>   	buf[0] = reg & 0xff;
>>   	buf[1] = (reg >> 8) & 0xff;
>> @@ -642,17 +644,22 @@ static int __mxt_read_reg(struct i2c_client *client,
>>   	xfer[1].len = len;
>>   	xfer[1].buf = val;
>>   
>> -	ret = i2c_transfer(client->adapter, xfer, 2);
>> -	if (ret == 2) {
>> -		ret = 0;
>> -	} else {
>> -		if (ret >= 0)
>> -			ret = -EIO;
>> -		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
>> -			__func__, ret);
>> +retry_read:
>> +	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
>> +	if (ret != ARRAY_SIZE(xfer)) {
> 
> Is it really possible to get a positive ret != 2 from i2c_transfer()?
> 
> Maybe it's better to keep the old code behaviour by returning the "ret"
> value directly if it's not equal to ARRAY_SIZE(xfer)?
> 
I think, theoretically i2c_transfer() may return positive value but != 
number to transfer,
original behavior is,
when ret >= 0, it returns -EIO, when ret < 0, it just returns ret,

current behavior is, when ret != 2, it returns -EIO, after retry.

I am OK to change the behavior exactly as same original one.

Thanks,
Jiada
