Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919CC27016B
	for <lists+linux-input@lfdr.de>; Fri, 18 Sep 2020 17:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIRPzL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Sep 2020 11:55:11 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:31468 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIRPzL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Sep 2020 11:55:11 -0400
IronPort-SDR: 88NLjcZ2LU44SCB6G5G/Rm53O76fHqtikVi58AQMI+zKzSEyDsYHLtEFioUhnNXEHT9KcSrQVd
 eZZtbtuRFJw9N37Q/H3QNygZWeSyZ52xxHGcXzgPAAfYznh1zWBIIWFtu6JCr4NdgWimMmQDzi
 MSfn2mOAq4n0FCszfCWySiM3ltHr7OTlhPT5OSLP4UDzCXz6Jw9WfsqbPcQJuz1Nx6XaEvVoB7
 HQFnEElvMyGbQE2+IxqYUCRRwDVIPdx600IRSxILWd4hgvWVpq6hcDX1YL2b+U5vRnV490Fkaf
 faU=
X-IronPort-AV: E=Sophos;i="5.77,274,1596528000"; 
   d="scan'208";a="55268387"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 18 Sep 2020 07:55:10 -0800
IronPort-SDR: LpnePGDtGl7gaSb8r6VuNMfQrs7OS5+o3AOnbhR8HT7nyNYK0IXEiOeWMj6RY30NDH4zA+82wN
 lEF2W1mry2OdNRwnVlg7FVq1j3VIrH/EGfUZCx7nrIPq9vvY6mZ1htG9QWq4TYvMtR02/Yi8iG
 lSgg0vfIotXrBiwy7pKMfj/GMTwiL34vX9Tmzh5AYdgeUW50bhrxnu57Q6yOKIknq0CH2OdCQO
 J+l6XPXio5+0U0iNUzat1Azkn8/Y0UkJ4b2SE7AgJNepsgy7LR8YLT8g2aLVE/Kku3puCQl8iM
 OOM=
Subject: Re: [PATCH v2 2/2] Input: atmel_mxt_ts - wake mXT1386 from deep-sleep
 mode
To:     Dmitry Osipenko <digetx@gmail.com>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andy.shevchenko@gmail.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
References: <20200918125601.8210-1-jiada_wang@mentor.com>
 <20200918125601.8210-2-jiada_wang@mentor.com>
 <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <d0d8dffe-be52-992e-af2b-020d4b159747@mentor.com>
Date:   Sat, 19 Sep 2020 00:55:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2c3e093a-dc75-d315-519d-9b8fbab9b41b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

Thanks for your quick comments

On 2020/09/18 22:32, Dmitry Osipenko wrote:
> 18.09.2020 15:56, Jiada Wang пишет:
>> According to datasheet, mXT1386 chip has a WAKE line, it is used
>> to wake the chip up from deep sleep mode before communicating with
>> it via the I2C-compatible interface.
>>
>> if the WAKE line is connected to a GPIO line, the line must be
>> asserted 25 ms before the host attempts to communicate with the mXT1386.
>> If the WAKE line is connected to the SCL pin, the mXT1386 will send a
>> NACK on the first attempt to address it, the host must then retry 25 ms
>> later.
>>
>> This patch introduces mxt_wake() which does a dummy i2c read, follows
>> with a 25 ms sleep for mXT1386 chip. mxt_wake() is added to
>> mxt_initialize(), mxt_load_fw() and mxt_start() to ensure before any
>> actual i2c transfer, mxt_wake() can be executed.
>>
>> Added new compatible string "atmel,mXT1386".
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> 
> Hello, Jiada!
> 
> This not critical, but yours suggested-by tag always should be the last
> line of the commit message. It's like you're signing all the words that
> were written by you.
> 
>> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/input/touchscreen/atmel_mxt_ts.c | 27 ++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
>> index a2189739e30f..d580050a237f 100644
>> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>> @@ -196,6 +196,7 @@ enum t100_type {
>>   #define MXT_CRC_TIMEOUT		1000	/* msec */
>>   #define MXT_FW_RESET_TIME	3000	/* msec */
>>   #define MXT_FW_CHG_TIMEOUT	300	/* msec */
>> +#define MXT_WAKEUP_TIME     25  /* msec */
>>   
>>   /* Command to unlock bootloader */
>>   #define MXT_UNLOCK_CMD_MSB	0xaa
>> @@ -2099,12 +2100,33 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
>>   	release_firmware(cfg);
>>   }
>>   
>> +static void mxt_wake(struct mxt_data *data)
>> +{
>> +	struct i2c_client *client = data->client;
>> +	struct device *dev = &data->client->dev;
>> +	struct device_node *np = dev->of_node;
>> +	union i2c_smbus_data dummy;
>> +
>> +	if (!of_device_is_compatible(np, "atmel,mXT1386"))
>> +		return;
> I'm not sure whether you misses the previous answers from Dmitry
> Torokhov and Rob Herring, but they suggested to add a new device-tree
> property which should specify the atmel,wakeup-method.
> 
I think Rob Herring prefers for the compatible solution than property.

> There are 3 possible variants:
> 
>    - NONE
>    - GPIO
>    - I2C-SCL
> 
> Hence we should bail out from mxt_wake() if method is set to NONE or GPIO.
> 
for "GPIO", we still need 25 ms sleep. but rather than a dummy read, 
WAKE line need to be asserted before sleep.

> Perhaps we could even skip the GPIO method entirely by not mentioning it
> anywhere, since this method isn't needed for now.
> 
> Nevertheless, I think it will be good to add DT compatible for the
> "atmel,mXT1386", hence this part is good to me.
>
>> +	/* TODO: add WAKE-GPIO support */
>> +
>> +	i2c_smbus_xfer(client->adapter, client->addr,
>> +		       0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
>> +		       &dummy);
>> +
> 
> There is no need to sleep if there was no I2C error, meaning that device
> wasn't in a deep-sleep mode. Please add a check for the value returned
> by i2c_smbus_xfer() and invoke the msleep() only in a case of the I2C
> error condition.
> 
OK. will do this

>> +	msleep(MXT_WAKEUP_TIME);
>> +}
>> +
>>   static int mxt_initialize(struct mxt_data *data)
>>   {
>>   	struct i2c_client *client = data->client;
>>   	int recovery_attempts = 0;
>>   	int error;
>>   
>> +	mxt_wake(data);
>> +
>>   	while (1) {
> 
> I assume the mxt_wake() should be placed here, since there is a 3
> seconds timeout in the end of the while-loop, meaning that device may
> get back into deep-sleep on a retry.
> 
Can you elaborate a little more why exit from bootload mode after sleep 
for 3 second could enter deep-sleep mode.

>>   		error = mxt_read_info_block(data);
>>   		if (!error)
>> @@ -2787,6 +2809,8 @@ static int mxt_load_fw(struct device *dev, const char *fn)
>>   	if (ret)
>>   		goto release_firmware;
>>   
>> +	mxt_wake(data);
>> +
>>   	if (!data->in_bootloader) {
>>   		/* Change to the bootloader mode */
>>   		data->in_bootloader = true;
>> @@ -2928,6 +2952,7 @@ static const struct attribute_group mxt_attr_group = {
>>   
>>   static void mxt_start(struct mxt_data *data)
>>   {
>> +	mxt_wake(data);
> 
> Shouldn't the mxt_wake() be under the MXT_SUSPEND_DEEP_SLEEP switch? The
> wake-up should be needed only for waking from deep-sleep mode.
OK, I will move it under MXT_SUSPEND_DEEP_SLEEP

Thanks,
Jiada
> 
>>   	switch (data->suspend_mode) {
>>   	case MXT_SUSPEND_T9_CTRL:
>>   		mxt_soft_reset(data);
>> @@ -3185,6 +3210,7 @@ static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
>>   
>>   static const struct of_device_id mxt_of_match[] = {
>>   	{ .compatible = "atmel,maxtouch", },
>> +	{ .compatible = "atmel,mXT1386", },
>>   	/* Compatibles listed below are deprecated */
>>   	{ .compatible = "atmel,qt602240_ts", },
>>   	{ .compatible = "atmel,atmel_mxt_ts", },
>> @@ -3209,6 +3235,7 @@ static const struct i2c_device_id mxt_id[] = {
>>   	{ "atmel_mxt_tp", 0 },
>>   	{ "maxtouch", 0 },
>>   	{ "mXT224", 0 },
>> +	{ "mXT1386", 0 },
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(i2c, mxt_id);
>>
> 
