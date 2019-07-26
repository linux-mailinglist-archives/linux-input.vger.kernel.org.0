Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E49AA76490
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2019 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfGZLbf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jul 2019 07:31:35 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:42400 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfGZLbe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jul 2019 07:31:34 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 2C8E8A2536;
        Fri, 26 Jul 2019 13:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1564140691;
        bh=zRs4ConriXfESmaC5+3ZmOaU35JUrHZdPz+39redIfM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bhVBOdqgxEaL6viGU35gcAiweLhHecJRxJdARbSlWZfC/qHUU1ni1VEX9M6pfVGrL
         T6pK7sXqkCrgOaUH7g88BFtsoYPzBC+v7uo2Jwiq/4uTkrRAWwAVNPnjQ1P4E/GDj7
         jrlk5nFdA/91lt3YGqykR9NCgjVWjo0SW8BkTjq4=
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
 <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
 <20190725085753.GA26665@penguin>
 <ac436c3c-fa89-f777-85b2-f38adf842e10@ysoft.com>
 <20190725144009.GA27432@penguin>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <dcee1139-c53f-5ea0-f387-a3aa5a9bf39f@ysoft.com>
Date:   Fri, 26 Jul 2019 13:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190725144009.GA27432@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25. 07. 19 16:40, Dmitry Torokhov wrote:
> On Thu, Jul 25, 2019 at 02:58:02PM +0200, Michal Vokáč wrote:
>> On 25. 07. 19 10:57, Dmitry Torokhov wrote:
>>> Hi Michal,
>>>
>>> On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
>>>> On 21. 05. 19 7:37, Dmitry Torokhov wrote:
>>>>> Hi Michal,
>>>>>
>>>>> On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I have to deal with a situation where we have a custom i.MX6 based
>>>>>> platform in production that uses the MPR121 touchkey controller.
>>>>>> Unfortunately the chip is connected using only the I2C interface.
>>>>>> The interrupt line is not used. Back in 2015 (Linux v3.14), my
>>>>>> colleague modded the existing mpr121_touchkey.c driver to use polling
>>>>>> instead of interrupt.
>>>>>>
>>>>>> For quite some time yet I am in a process of updating the product from
>>>>>> the ancient Freescale v3.14 kernel to the latest mainline and pushing
>>>>>> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
>>>>>> already made it into v5.1-rc.
>>>>>>
>>>>>> I rebased and updated our mpr121 patch to the latest mainline.
>>>>>> It is created as a separate driver, similarly to gpio_keys_polled.
>>>>>>
>>>>>> The I2C device is quite susceptible to ESD. An ESD test quite often
>>>>>> causes reset of the chip or some register randomly changes its value.
>>>>>> The [PATCH 3/4] adds a write-through register cache. With the cache
>>>>>> this state can be detected and the device can be re-initialied.
>>>>>>
>>>>>> The main question is: Is there any chance that such a polled driver
>>>>>> could be accepted? Is it correct to implement it as a separate driver
>>>>>> or should it be done as an option in the existing driver? I can not
>>>>>> really imagine how I would do that though..
>>>>>>
>>>>>> There are also certain worries that the MPR121 chip may no longer be
>>>>>> available in nonspecifically distant future. In case of EOL I will need
>>>>>> to add a polled driver for an other touchkey chip. May it be already
>>>>>> in mainline or a completely new one.
>>>>>
>>>>> I think that my addition of input_polled_dev was ultimately a wrong
>>>>> thing to do. I am looking into enabling polling mode for regular input
>>>>> devices as we then can enable polling mode in existing drivers.
>>>>
>>>> OK, that sounds good. Especially when one needs to switch from one chip
>>>> to another that is already in tree, the need for a whole new polling
>>>> driver is eliminated.
>>>
>>> Could you please try the patch below and see if it works for your use
>>> case? Note that I have not tried running it, but it compiles so it must
>>> be good ;)
>>
>> Hi Dmitry,
>> Thank you very much for the patch!
>> I gave it a shot and it seems you forgot to add the input-poller.h file
>> to the patch.. it does not compile on my side :(
> 
> Oops ;) Please see the updated patch below.

Thank you, now it is (almost) good as you said :D

>>
>>> Input: add support for polling to input devices
>>>
>>> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>
>>> Separating "normal" and "polled" input devices was a mistake, as often we want
>>> to allow the very same device work on both interrupt-driven and polled mode,
>>> depending on the board on which the device is used.
>>>
>>> This introduces new APIs:
>>>
>>> - input_setup_polling
>>> - input_set_poll_interval
>>> - input_set_min_poll_interval
>>> - input_set_max_poll_interval
>>>
>>> These new APIs allow switching an input device into polled mode with sysfs
>>> attributes matching drivers using input_polled_dev APIs that will be eventually
>>> removed.
>>
>> After reading this I am not really sure what else needs to be done
>> to test/use the poller. I suspect I need to modify the input device
>> driver (mpr121_touchkey.c in my case) like this:
>>
>> If the interrupt gpio is not provided in DT, the device driver probe
>> function should:
>>   - not request the threaded interrupt
>>   - call input_setup_polling and provide it with poll_fn
>>     Can the mpr_touchkey_interrupt function be used as is for this
>>     purpose? The only problem I see is it returns IRQ_HANDLED.
> 
> I'd factor out code suitable for polling from mpr_touchkey_interrupt()
> and then do
> 
> static irqreturn_t mpr_touchkey_interrupt(...)
> {
> 	mpr_touchkey_report(...);
> 	return IRQ_HANDLED;
> }
> 

Probably a trivial problem for experienced kernel hacker but I can not
wrap my head around this - the interrupt handler takes the mpr121
device id as an argument while the poller poll_fn takes struct input_dev.

I fail to figure out how to get the device id from the input device.

Here is what I have:

diff --git a/drivers/input/keyboard/mpr121_touchkey.c b/drivers/input/keyboard/mpr121_touchkey.c
index e9ceaa16b46a..1124f77ee10a 100644
--- a/drivers/input/keyboard/mpr121_touchkey.c
+++ b/drivers/input/keyboard/mpr121_touchkey.c
@@ -54,6 +54,10 @@
  /* MPR121 has 12 keys */
  #define MPR121_MAX_KEY_COUNT		12
  
+#define MPR121_POLL_INTERVAL		50
+#define MPR121_MIN_POLL_INTERVAL	10
+#define MPR121_MAX_POLL_INTERVAL	200
+
  struct mpr121_touchkey {
  	struct i2c_client	*client;
  	struct input_dev	*input_dev;
@@ -115,9 +119,12 @@ static struct regulator *mpr121_vdd_supply_init(struct device *dev)
  	return vdd_supply;
  }
  
-static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+static void mpr_touchkey_report(struct input_dev *dev)
  {
-	struct mpr121_touchkey *mpr121 = dev_id;
+	/*
+	 * TODO the input_dev dev needs to be converted to mpr121 device id.
+	 */
+	struct mpr121_touchkey *mpr121 = /* TODO */;
  	struct i2c_client *client = mpr121->client;
  	struct input_dev *input = mpr121->input_dev;
  	unsigned long bit_changed;
@@ -127,14 +134,14 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
  	reg = i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_1_ADDR);
  	if (reg < 0) {
  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
  	}
  
  	reg <<= 8;
  	reg |= i2c_smbus_read_byte_data(client, ELE_TOUCH_STATUS_0_ADDR);
  	if (reg < 0) {
  		dev_err(&client->dev, "i2c read error [%d]\n", reg);
-		goto out;
+		return;
  	}
  
  	reg &= TOUCH_STATUS_MASK;
@@ -155,8 +162,17 @@ static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
  
  	}
  	input_sync(input);
+}
+
+static irqreturn_t mpr_touchkey_interrupt(int irq, void *dev_id)
+{
+	/*
+	 * TODO
+	 * mpr_touchkey_report takes struct input_dev as an argument,
+	 * not the device id.
+	 */
+	mpr_touchkey_report(/* TODO */);
  
-out:
  	return IRQ_HANDLED;
  }
  
@@ -232,11 +248,6 @@ static int mpr_touchkey_probe(struct i2c_client *client,
  	int error;
  	int i;
  
-	if (!client->irq) {
-		dev_err(dev, "irq number should not be zero\n");
-		return -EINVAL;
-	}
-
  	vdd_supply = mpr121_vdd_supply_init(dev);
  	if (IS_ERR(vdd_supply))
  		return PTR_ERR(vdd_supply);
@@ -289,13 +300,27 @@ static int mpr_touchkey_probe(struct i2c_client *client,
  		return error;
  	}
  
-	error = devm_request_threaded_irq(dev, client->irq, NULL,
-					  mpr_touchkey_interrupt,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					  dev->driver->name, mpr121);
-	if (error) {
-		dev_err(dev, "Failed to register interrupt\n");
-		return error;
+	if (client->irq) {
+		error = devm_request_threaded_irq(dev, client->irq, NULL,
+						  mpr_touchkey_interrupt,
+						  IRQF_TRIGGER_FALLING |
+						  IRQF_ONESHOT,
+						  dev->driver->name, mpr121);
+		if (error) {
+			dev_err(dev, "Failed to register interrupt\n");
+			return error;
+		}
+	} else {
+		dev_dbg(dev, "invalid IRQ number, using polling mode\n");
+		error = input_setup_polling(input_dev, mpr_touchkey_report);
+		if (error)
+			return error;
+
+		input_set_poll_interval(input_dev, MPR121_POLL_INTERVAL);
+		input_set_min_poll_interval(input_dev,
+					    MPR121_MIN_POLL_INTERVAL);
+		input_set_max_poll_interval(input_dev,
+					    MPR121_MAX_POLL_INTERVAL);
  	}
  
  	error = input_register_device(input_dev);
--
