Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F2F74EA3
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 14:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfGYM6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 08:58:06 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:49086 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfGYM6G (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 08:58:06 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id AE3E2A3CD9;
        Thu, 25 Jul 2019 14:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1564059482;
        bh=68daOPyjaZe5jHQxTnjrsqntXBfcVQucW8Dc6gfEfIk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EcQZs7ELiLyWg0R8oIeBFdoMgDR9YFdcNjokOZWkyDYAZKtmZJzQKSGmX8Wp6TEud
         e8Ffh7zjR5MFSk1ECdESI+CPO3T1Fx9mhv3EVyapg9fzbUjNeL0XP6t+ANzjBY1HH5
         j1SwQHY1slvSB9ddN8+f7D9ytw/dL1uHbv9sIags=
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
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <ac436c3c-fa89-f777-85b2-f38adf842e10@ysoft.com>
Date:   Thu, 25 Jul 2019 14:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190725085753.GA26665@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25. 07. 19 10:57, Dmitry Torokhov wrote:
> Hi Michal,
> 
> On Tue, May 21, 2019 at 08:51:17AM +0200, Michal Vokáč wrote:
>> On 21. 05. 19 7:37, Dmitry Torokhov wrote:
>>> Hi Michal,
>>>
>>> On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
>>>> Hi,
>>>>
>>>> I have to deal with a situation where we have a custom i.MX6 based
>>>> platform in production that uses the MPR121 touchkey controller.
>>>> Unfortunately the chip is connected using only the I2C interface.
>>>> The interrupt line is not used. Back in 2015 (Linux v3.14), my
>>>> colleague modded the existing mpr121_touchkey.c driver to use polling
>>>> instead of interrupt.
>>>>
>>>> For quite some time yet I am in a process of updating the product from
>>>> the ancient Freescale v3.14 kernel to the latest mainline and pushing
>>>> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
>>>> already made it into v5.1-rc.
>>>>
>>>> I rebased and updated our mpr121 patch to the latest mainline.
>>>> It is created as a separate driver, similarly to gpio_keys_polled.
>>>>
>>>> The I2C device is quite susceptible to ESD. An ESD test quite often
>>>> causes reset of the chip or some register randomly changes its value.
>>>> The [PATCH 3/4] adds a write-through register cache. With the cache
>>>> this state can be detected and the device can be re-initialied.
>>>>
>>>> The main question is: Is there any chance that such a polled driver
>>>> could be accepted? Is it correct to implement it as a separate driver
>>>> or should it be done as an option in the existing driver? I can not
>>>> really imagine how I would do that though..
>>>>
>>>> There are also certain worries that the MPR121 chip may no longer be
>>>> available in nonspecifically distant future. In case of EOL I will need
>>>> to add a polled driver for an other touchkey chip. May it be already
>>>> in mainline or a completely new one.
>>>
>>> I think that my addition of input_polled_dev was ultimately a wrong
>>> thing to do. I am looking into enabling polling mode for regular input
>>> devices as we then can enable polling mode in existing drivers.
>>
>> OK, that sounds good. Especially when one needs to switch from one chip
>> to another that is already in tree, the need for a whole new polling
>> driver is eliminated.
> 
> Could you please try the patch below and see if it works for your use
> case? Note that I have not tried running it, but it compiles so it must
> be good ;)

Hi Dmitry,
Thank you very much for the patch!
I gave it a shot and it seems you forgot to add the input-poller.h file
to the patch.. it does not compile on my side :(

> Input: add support for polling to input devices
> 
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Separating "normal" and "polled" input devices was a mistake, as often we want
> to allow the very same device work on both interrupt-driven and polled mode,
> depending on the board on which the device is used.
> 
> This introduces new APIs:
> 
> - input_setup_polling
> - input_set_poll_interval
> - input_set_min_poll_interval
> - input_set_max_poll_interval
> 
> These new APIs allow switching an input device into polled mode with sysfs
> attributes matching drivers using input_polled_dev APIs that will be eventually
> removed.

After reading this I am not really sure what else needs to be done
to test/use the poller. I suspect I need to modify the input device
driver (mpr121_touchkey.c in my case) like this:

If the interrupt gpio is not provided in DT, the device driver probe
function should:
  - not request the threaded interrupt
  - call input_setup_polling and provide it with poll_fn
    Can the mpr_touchkey_interrupt function be used as is for this
    purpose? The only problem I see is it returns IRQ_HANDLED.

  - set the poll interval + min/max interval
  - register the input device as usual (input_register_device)
  - What about the device_init_wakeup? It does not make sense for
    polling I think.

Just nitpicking - I also ran checkpatch.pl on the patch and it spits
out some warnings. I am not sure whether some of those should not
be fixed.

Thanks, Michal

> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/Makefile       |    2
>   drivers/input/input-poller.c |  207 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/input/input.c        |   36 ++++++-
>   include/linux/input.h        |   10 ++
>   4 files changed, 247 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/input/input-poller.c
> 
> diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> index 40de6a7be641..e35650930371 100644
> --- a/drivers/input/Makefile
> +++ b/drivers/input/Makefile
> @@ -6,7 +6,7 @@
>   # Each configuration option enables a list of files.
>   
>   obj-$(CONFIG_INPUT)		+= input-core.o
> -input-core-y := input.o input-compat.o input-mt.o ff-core.o
> +input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
>   
>   obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
>   obj-$(CONFIG_INPUT_POLLDEV)	+= input-polldev.o
> diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
> new file mode 100644
> index 000000000000..008d6f362d60
> --- /dev/null
> +++ b/drivers/input/input-poller.c
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Support for polling mode for input devices.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/input.h>
> +#include <linux/jiffies.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include "input-poller.h"
> +
> +struct input_dev_poller {
> +	void (*poll)(struct input_dev *dev);
> +
> +	unsigned int poll_interval; /* msec */
> +	unsigned int poll_interval_max; /* msec */
> +	unsigned int poll_interval_min; /* msec */
> +
> +	struct input_dev *input;
> +	struct delayed_work work;
> +};
> +
> +static void input_dev_poller_queue_work(struct input_dev_poller *poller)
> +{
> +	unsigned long delay;
> +
> +	delay = msecs_to_jiffies(poller->poll_interval);
> +	if (delay >= HZ)
> +		delay = round_jiffies_relative(delay);
> +
> +	queue_delayed_work(system_freezable_wq, &poller->work, delay);
> +}
> +
> +static void input_dev_poller_work(struct work_struct *work)
> +{
> +	struct input_dev_poller *poller =
> +		container_of(work, struct input_dev_poller, work.work);
> +
> +	poller->poll(poller->input);
> +	input_dev_poller_queue_work(poller);
> +}
> +
> +void input_dev_poller_finalize(struct input_dev_poller *poller)
> +{
> +	if (!poller->poll_interval)
> +		poller->poll_interval = 500;
> +	if (!poller->poll_interval_max)
> +		poller->poll_interval_max = poller->poll_interval;
> +}
> +
> +void input_dev_poller_start(struct input_dev_poller *poller)
> +{
> +	/* Only start polling if polling is enabled */
> +	if (poller->poll_interval > 0) {
> +		poller->poll(poller->input);
> +		input_dev_poller_queue_work(poller);
> +	}
> +}
> +
> +void input_dev_poller_stop(struct input_dev_poller *poller)
> +{
> +	cancel_delayed_work_sync(&poller->work);
> +}
> +
> +int input_setup_polling(struct input_dev *dev,
> +			void (*poll_fn)(struct input_dev *dev))
> +{
> +	struct input_dev_poller *poller;
> +
> +	poller = kzalloc(sizeof(*poller), GFP_KERNEL);
> +	if (!poller) {
> +		dev_err(dev->dev.parent ?: &dev->dev,
> +			"%s: unable to allocate poller structure\n", __func__);
> +		return -ENOMEM;
> +	}
> +
> +	INIT_DELAYED_WORK(&poller->work, input_dev_poller_work);
> +	poller->poll = poll_fn;
> +
> +	dev->poller = poller;
> +	return 0;
> +}
> +EXPORT_SYMBOL(input_setup_polling);
> +
> +static bool input_dev_ensure_poller(struct input_dev *dev)
> +{
> +	if (!dev->poller) {
> +		dev_err(dev->dev.parent ?: &dev->dev,
> +			"poller structure has not been set up\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +void input_set_poll_interval(struct input_dev *dev, unsigned int interval)
> +{
> +	if (input_dev_ensure_poller(dev))
> +		dev->poller->poll_interval = interval;
> +}
> +EXPORT_SYMBOL(input_set_poll_interval);
> +
> +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval)
> +{
> +	if (input_dev_ensure_poller(dev))
> +		dev->poller->poll_interval_min = interval;
> +}
> +EXPORT_SYMBOL(input_set_min_poll_interval);
> +
> +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval)
> +{
> +	if (input_dev_ensure_poller(dev))
> +		dev->poller->poll_interval_max = interval;
> +}
> +EXPORT_SYMBOL(input_set_max_poll_interval);
> +
> +/* SYSFS interface */
> +
> +static ssize_t input_dev_get_poll_interval(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct input_dev *input = to_input_dev(dev);
> +
> +	return sprintf(buf, "%d\n", input->poller->poll_interval);
> +}
> +
> +static ssize_t input_dev_set_poll_interval(struct device *dev,
> +					   struct device_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	struct input_dev *input = to_input_dev(dev);
> +	struct input_dev_poller *poller = input->poller;
> +	unsigned int interval;
> +	int err;
> +
> +	err = kstrtouint(buf, 0, &interval);
> +	if (err)
> +		return err;
> +
> +	if (interval < poller->poll_interval_min)
> +		return -EINVAL;
> +
> +	if (interval > poller->poll_interval_max)
> +		return -EINVAL;
> +
> +	mutex_lock(&input->mutex);
> +
> +	poller->poll_interval = interval;
> +
> +	if (input->users) {
> +		cancel_delayed_work_sync(&poller->work);
> +		if (poller->poll_interval > 0)
> +			input_dev_poller_queue_work(poller);
> +	}
> +
> +	mutex_unlock(&input->mutex);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(poll, S_IRUGO | S_IWUSR,
> +		   input_dev_get_poll_interval, input_dev_set_poll_interval);
> +
> +static ssize_t input_dev_get_poll_max(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct input_dev *input = to_input_dev(dev);
> +
> +	return sprintf(buf, "%d\n", input->poller->poll_interval_max);
> +}
> +
> +static DEVICE_ATTR(max, S_IRUGO, input_dev_get_poll_max, NULL);
> +
> +static ssize_t input_dev_get_poll_min(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct input_dev *input = to_input_dev(dev);
> +
> +	return sprintf(buf, "%d\n", input->poller->poll_interval_min);
> +}
> +
> +static DEVICE_ATTR(min, S_IRUGO, input_dev_get_poll_min, NULL);
> +
> +static umode_t input_poller_attrs_visible(struct kobject *kobj,
> +					  struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct input_dev *input = to_input_dev(dev);
> +
> +	return input->poller ? attr->mode : 0;
> +}
> +
> +static struct attribute *input_poller_attrs[] = {
> +	&dev_attr_poll.attr,
> +	&dev_attr_max.attr,
> +	&dev_attr_min.attr,
> +	NULL
> +};
> +
> +struct attribute_group input_poller_attribute_group = {
> +	.is_visible	= input_poller_attrs_visible,
> +	.attrs		= input_poller_attrs,
> +};
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 7f3c5fcb9ed6..6b87c07d5981 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -24,6 +24,7 @@
>   #include <linux/mutex.h>
>   #include <linux/rcupdate.h>
>   #include "input-compat.h"
> +#include "input-poller.h"
>   
>   MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
>   MODULE_DESCRIPTION("Input core");
> @@ -603,20 +604,31 @@ int input_open_device(struct input_handle *handle)
>   
>   	handle->open++;
>   
> -	if (!dev->users++ && dev->open)
> -		retval = dev->open(dev);
> +	if (dev->users++) {
> +		/*
> +		 * Device is already opened, so we can exit immediately and
> +		 * report success.
> +		 */
> +		goto out;
> +	}
>   
> -	if (retval) {
> -		dev->users--;
> -		if (!--handle->open) {
> +	if (dev->open) {
> +		retval = dev->open(dev);
> +		if (retval) {
> +			dev->users--;
> +			handle->open--;
>   			/*
>   			 * Make sure we are not delivering any more events
>   			 * through this handle
>   			 */
>   			synchronize_rcu();
> +			goto out;
>   		}
>   	}
>   
> +	if (dev->poller)
> +		input_dev_poller_start(dev->poller);
> +
>    out:
>   	mutex_unlock(&dev->mutex);
>   	return retval;
> @@ -655,8 +667,13 @@ void input_close_device(struct input_handle *handle)
>   
>   	__input_release_device(handle);
>   
> -	if (!--dev->users && dev->close)
> -		dev->close(dev);
> +	if (!--dev->users) {
> +		if (dev->poller)
> +			input_dev_poller_stop(dev->poller);
> +
> +		if (dev->close)
> +			dev->close(dev);
> +	}
>   
>   	if (!--handle->open) {
>   		/*
> @@ -1502,6 +1519,7 @@ static const struct attribute_group *input_dev_attr_groups[] = {
>   	&input_dev_attr_group,
>   	&input_dev_id_attr_group,
>   	&input_dev_caps_attr_group,
> +	&input_poller_attribute_group,
>   	NULL
>   };
>   
> @@ -1511,6 +1529,7 @@ static void input_dev_release(struct device *device)
>   
>   	input_ff_destroy(dev);
>   	input_mt_destroy_slots(dev);
> +	kfree(dev->poller);
>   	kfree(dev->absinfo);
>   	kfree(dev->vals);
>   	kfree(dev);
> @@ -2135,6 +2154,9 @@ int input_register_device(struct input_dev *dev)
>   	if (!dev->setkeycode)
>   		dev->setkeycode = input_default_setkeycode;
>   
> +	if (dev->poller)
> +		input_dev_poller_finalize(dev->poller);
> +
>   	error = device_add(&dev->dev);
>   	if (error)
>   		goto err_free_vals;
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 510e78558c10..956f32be87cc 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -21,6 +21,8 @@
>   #include <linux/timer.h>
>   #include <linux/mod_devicetable.h>
>   
> +struct input_dev_poller;
> +
>   /**
>    * struct input_value - input value representation
>    * @type: type of value (EV_KEY, EV_ABS, etc)
> @@ -147,6 +149,8 @@ struct input_dev {
>   
>   	struct ff_device *ff;
>   
> +	struct input_dev_poller *poller;
> +
>   	unsigned int repeat_key;
>   	struct timer_list timer;
>   
> @@ -361,6 +365,12 @@ void input_unregister_device(struct input_dev *);
>   
>   void input_reset_device(struct input_dev *);
>   
> +int input_setup_polling(struct input_dev *dev,
> +			void (*poll_fn)(struct input_dev *dev));
> +void input_set_poll_interval(struct input_dev *dev, unsigned int interval);
> +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval);
> +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval);
> +
>   int __must_check input_register_handler(struct input_handler *);
>   void input_unregister_handler(struct input_handler *);
>   
> 

