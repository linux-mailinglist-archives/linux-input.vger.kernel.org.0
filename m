Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882E726A92C
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 17:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgIOP4I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 11:56:08 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:27871 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbgIOPzo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 11:55:44 -0400
IronPort-SDR: aWuggq7saDB4dCzxTdl7hIeZ3CS9cmzAmx3PKznMhJmrXga5wo+OBdvgEqI69mtKBdtiDzub1R
 5Pvie2Do6SGiBBMYu2DjHhm9jONaZRDAZM5YlHROYquEJ7UIN/PmTtFxpEq8SPxA3ifMB610af
 oGeevpcmJ2bdLGSqNE1EK3nb/PVjJbigC6lh4IGllmW+ET7mWbDNs3ZI6wR0eRNxzKooJIQrUB
 Wk8hqxiIquqG4Wz+ebih5qbsbl/vBoIQgcMp55uOtooLXUQHsDT8BfkhFv7kxd95c5FyCcXRhq
 dsk=
X-IronPort-AV: E=Sophos;i="5.76,430,1592899200"; 
   d="scan'208";a="53045835"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 15 Sep 2020 07:55:19 -0800
IronPort-SDR: VbsX45tek/EebeSfqEIQRCpew1b8Md1SID/+lcBER4COCcOHwtwwiVx2onegCEuobLbrMVhngb
 24L1W8PwykVrvuEeZXngBQDfqiP1+5+T3F02JCFnFNwc13UC5EfNA5kl4O52VfWl7Ms9jtthSF
 /5bgjXYKTuaLbsg+F+tD0AQcJpsvINcBrkvIoweaCKKKw+f05WQFLDeLnbiHNVpE3uf5s6OeoP
 rCQrBYFO6BgkCfg2C7QdmLTtfKZy9ss2r5R2Tzbn2FTdwmzPTQR/36lecYmYa1KIpIo2q8lYn7
 /WA=
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <andy.shevchenko@gmail.com>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
 <20200914193340.GV1665100@dtor-ws> <20200914193603.GW1665100@dtor-ws>
 <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <b451e91a-ed9f-51cb-1765-e68867e0a86f@mentor.com>
Date:   Wed, 16 Sep 2020 00:55:13 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2020/09/15 6:33, Dmitry Osipenko wrote:
> 14.09.2020 22:36, Dmitry Torokhov пишет:
>> On Mon, Sep 14, 2020 at 12:33:40PM -0700, Dmitry Torokhov wrote:
>>> On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
>>>> 13.09.2020 19:56, Dmitry Torokhov пишет:
>>>>> Hi Jiada,
>>>>>
>>>>> On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
>>>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>>>>>
>>>>>> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
>>>>>> when they are in a sleep state. It must be retried after a delay for the
>>>>>> chip to wake up.
>>>>>
>>>>> Do we know when the chip is in sleep state? Can we do a quick I2C
>>>>> transaction in this case instead of adding retry logic to everything? Or
>>>>> there is another benefit for having such retry logic?
>>>>
>>>> Hello!
>>>>
>>>> Please take a look at page 29 of:
>>>>
>>>> https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
>>>>
>>>> It says that the retry is needed after waking up from a deep-sleep mode.
>>>>
>>>> There are at least two examples when it's needed:
>>>>
>>>> 1. Driver probe. Controller could be in a deep-sleep mode at the probe
>>>> time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
>>>> hardware info.
>>>>
>>>> 2. Touchscreen input device is opened. The touchscreen is in a
>>>> deep-sleep mode at the time when input device is opened, hence first
>>>> __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
>>>>
>>>> I think placing the retries within __mxt_read() / write_reg() should be
>>>> the most universal option.
>>>>
>>>> Perhaps it should be possible to add mxt_wake() that will read out some
>>>> generic register
>>>
>>> I do not think we need to read a particular register, just doing a quick
>>> read:
>>>
>>> 	i2c_smbus_xfer(client->adapter, client->addr,
>>> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)
>>>
>>> should suffice.
>>>
>>>> and then this helper should be invoked after HW
>>>> resetting (before mxt_read_info_block()) and from mxt_start() (before
>>>> mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.
>>>>
>>>
>>> Actually, reading the spec, it all depends on how the WAKE pin is wired
>>> up on a given board. In certain setups retrying transaction is the right
>>> approach, while in others explicit control is needed. So indeed, we need
>>> a "wake" helper that we should call in probe and resume paths.
> 
> The WAKE-GPIO was never supported and I'm not sure whether anyone
> actually needs it. I think we could ignore this case until anyone would
> really need and could test it.
> 
>> By the way, I would like to avoid the unnecessary retries in probe paths
>> if possible. I.e. on Chrome OS we really keep an eye on boot times and
>> in case of multi-sourced touchscreens we may legitimately not have
>> device at given address.
> 
> We could add a new MXT1386 DT compatible and then do:
> 
> static void mxt_wake(struct mxt_data *data)
> {
> 	struct i2c_client *client = data->client;
> 	struct device *dev = &data->client->dev;
> 	union i2c_smbus_data dummy;
> 
> 	if (!of_device_is_compatible(dev, "atmel,mXT1386"))
> 		return;
> 
> 	/* TODO: add WAKE-GPIO support */
> 
> 	i2c_smbus_xfer(client->adapter, client->addr,
> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
> 			&dummy);
> 
> 	msleep(MXT_WAKEUP_TIME);
> }
> 
> Jiada, will you be able to re-work this patch? Please note that the new
> "atmel,mXT1386" DT compatible needs to be added into the
> atmel,maxtouch.txt binding.

Yes, I can re-work this patch, and add one more change to dts-binding.

to summarize long discussion in this thread,
I think what I need to do are:
1) since the change will be different from current one, I will need to 
start a new patch
2) call mxt_wake() in mxt_probe() and mxt_resume()
3) update atmel,maxtouch.txt binding

please correct me if I am wrong.

Thanks,
Jiada
> 
