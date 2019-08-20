Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E72795E05
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 13:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfHTL45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 07:56:57 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:55342 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbfHTL44 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 07:56:56 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 6A792A41D4;
        Tue, 20 Aug 2019 13:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1566302213;
        bh=m1yS2A85UaYq0UwqWVTxA71k63U/QvlyjC5BFy22e9Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ee+dbV/bjyFwH/gGoPJAlluFpvjiG6biLzL7XcQeRLCnmDKeCLNFJOHk7dD8b27pd
         b1vdP3yHXb8pL/qFmFz0KQRKse9gcAq2QRYu8dxjIK9PrwwyKmFG6Pk0qGsOuYuqTG
         Jo6+DjcnIsZ57oX+bDGU4c9ahMRJ8bebZ2AkTQJ0=
Subject: Re: [PATCH] Input: add support for polling to input devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20190809173548.GA32693@dtor-ws>
 <CAO-hwJL1Jq5XjqV32fD7+_nMpi3PhUbrB5QQ+EEs3N6=mBy-1g@mail.gmail.com>
 <20190812171135.GA178933@dtor-ws>
 <CAO-hwJKfHCwLkEDWrzJHejjaB+vY=0RsfY-=xfdRUSQPpeUVAg@mail.gmail.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <8624c907-6d7e-3301-1044-113bb108ba9e@ysoft.com>
Date:   Tue, 20 Aug 2019 13:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKfHCwLkEDWrzJHejjaB+vY=0RsfY-=xfdRUSQPpeUVAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 13. 08. 19 16:04, Benjamin Tissoires wrote:
> On Mon, Aug 12, 2019 at 7:11 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> Hi Benjamin,
>>
>> On Mon, Aug 12, 2019 at 06:50:38PM +0200, Benjamin Tissoires wrote:
>>> Hi Dmitry,
>>>
>>> On Fri, Aug 9, 2019 at 7:35 PM Dmitry Torokhov
>>> <dmitry.torokhov@gmail.com> wrote:
>>>>
>>>> Separating "normal" and "polled" input devices was a mistake, as often we
>>>> want to allow the very same device work on both interrupt-driven and
>>>> polled mode, depending on the board on which the device is used.
>>>>
>>>> This introduces new APIs:
>>>>
>>>> - input_setup_polling
>>>> - input_set_poll_interval
>>>> - input_set_min_poll_interval
>>>> - input_set_max_poll_interval
>>>>
>>>> These new APIs allow switching an input device into polled mode with sysfs
>>>> attributes matching drivers using input_polled_dev APIs that will be
>>>> eventually removed.
>>>
>>> Are you sure that using sysfs is the correct way here?
>>> I would think using generic properties that can be overwritten by the
>>> DSDT or by the device tree would make things easier from a driver
>>> point of view.
>>
>> Couple of points: I wanted it to be compatible with input-polldev.c so
>> the sysfs attributes must match (so that we can convert existing drivers
>> and zap input-polldev).
> 
> Oh, I missed that. Good point.
> 
>> I also am not sure if polling parameters are
>> property of board, or it is either fundamental hardware limitation or
>> simply desired system behavior.
> 
> I think it's a combination of everything: sometimes the board misses
> the capability to not do IRQs for that device, and using properties
> would be better here: you can define them where you need (board,
> platform or device level), and have a working platfrom from the kernel
> description entirely.
> However, it doesn't solve the issue of input-polldev, so maybe
> properties should be added on top of this sysfs.
> 
>> If Rob is OK with adding device
>> properties I'd be fine adding them as a followup, otherwise we can have
>> udev adjust the behavior as needed for given box shortly after boot.
> 
> Fair enough.
> 
>>
>>>
>>> Also, checkpatch complains about a few octal permissions that are
>>> preferred over symbolic ones, and there is a possible 'out of memory'
>>> nessage at drivers/input/input-poller.c:75.
>>
>> Yes, there is. It is there so we would know what device we were trying
>> to set up when OOM happened. You can probable decipher the driver from
>> the stack trace, but figuring particular device instance is harder.
> 
> Could you add a comment there explaining this choice? I have a feeling
> you'll have to refuse a few patches of people running coccinelle
> scripts and be too happy to send a kernel patch.
> 
> Other than that:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 

Hi Dmitry,

what is the status of this patch? Are we still waiting for Rob to
comment on the device properties or is this ready to land?

Little bit OT question: what tree/branch do you use to apply patches?
According to the mailing list you recently applied some patches but
I can not find them here [1].

Thank you,
Michal

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/

>>>>
>>>> Tested-by: Michal Vokáč <michal.vokac@ysoft.com>
>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> ---
>>>>   drivers/input/Makefile       |   2 +-
>>>>   drivers/input/input-poller.c | 208 +++++++++++++++++++++++++++++++++++
>>>>   drivers/input/input-poller.h |  18 +++
>>>>   drivers/input/input.c        |  36 ++++--
>>>>   include/linux/input.h        |  12 ++
>>>>   5 files changed, 268 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/input/Makefile b/drivers/input/Makefile
>>>> index 40de6a7be641..e35650930371 100644
>>>> --- a/drivers/input/Makefile
>>>> +++ b/drivers/input/Makefile
>>>> @@ -6,7 +6,7 @@
>>>>   # Each configuration option enables a list of files.
>>>>
>>>>   obj-$(CONFIG_INPUT)            += input-core.o
>>>> -input-core-y := input.o input-compat.o input-mt.o ff-core.o
>>>> +input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
>>>>
>>>>   obj-$(CONFIG_INPUT_FF_MEMLESS) += ff-memless.o
>>>>   obj-$(CONFIG_INPUT_POLLDEV)    += input-polldev.o
>>>> diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
>>>> new file mode 100644
>>>> index 000000000000..e041adb04f5a
>>>> --- /dev/null
>>>> +++ b/drivers/input/input-poller.c
>>>> @@ -0,0 +1,208 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Support for polling mode for input devices.
>>>> + */
>>>> +
>>>> +#include <linux/device.h>
>>>> +#include <linux/input.h>
>>>> +#include <linux/jiffies.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/types.h>
>>>> +#include <linux/workqueue.h>
>>>> +#include "input-poller.h"
>>>> +
>>>> +struct input_dev_poller {
>>>> +       void (*poll)(struct input_dev *dev);
>>>> +
>>>> +       unsigned int poll_interval; /* msec */
>>>> +       unsigned int poll_interval_max; /* msec */
>>>> +       unsigned int poll_interval_min; /* msec */
>>>> +
>>>> +       struct input_dev *input;
>>>> +       struct delayed_work work;
>>>> +};
>>>> +
>>>> +static void input_dev_poller_queue_work(struct input_dev_poller *poller)
>>>> +{
>>>> +       unsigned long delay;
>>>> +
>>>> +       delay = msecs_to_jiffies(poller->poll_interval);
>>>> +       if (delay >= HZ)
>>>> +               delay = round_jiffies_relative(delay);
>>>> +
>>>> +       queue_delayed_work(system_freezable_wq, &poller->work, delay);
>>>> +}
>>>> +
>>>> +static void input_dev_poller_work(struct work_struct *work)
>>>> +{
>>>> +       struct input_dev_poller *poller =
>>>> +               container_of(work, struct input_dev_poller, work.work);
>>>> +
>>>> +       poller->poll(poller->input);
>>>> +       input_dev_poller_queue_work(poller);
>>>> +}
>>>> +
>>>> +void input_dev_poller_finalize(struct input_dev_poller *poller)
>>>> +{
>>>> +       if (!poller->poll_interval)
>>>> +               poller->poll_interval = 500;
>>>> +       if (!poller->poll_interval_max)
>>>> +               poller->poll_interval_max = poller->poll_interval;
>>>> +}
>>>> +
>>>> +void input_dev_poller_start(struct input_dev_poller *poller)
>>>> +{
>>>> +       /* Only start polling if polling is enabled */
>>>> +       if (poller->poll_interval > 0) {
>>>> +               poller->poll(poller->input);
>>>> +               input_dev_poller_queue_work(poller);
>>>> +       }
>>>> +}
>>>> +
>>>> +void input_dev_poller_stop(struct input_dev_poller *poller)
>>>> +{
>>>> +       cancel_delayed_work_sync(&poller->work);
>>>> +}
>>>> +
>>>> +int input_setup_polling(struct input_dev *dev,
>>>> +                       void (*poll_fn)(struct input_dev *dev))
>>>> +{
>>>> +       struct input_dev_poller *poller;
>>>> +
>>>> +       poller = kzalloc(sizeof(*poller), GFP_KERNEL);
>>>> +       if (!poller) {
>>>> +               dev_err(dev->dev.parent ?: &dev->dev,
>>>> +                       "%s: unable to allocate poller structure\n", __func__);
>>>> +               return -ENOMEM;
>>>> +       }
>>>> +
>>>> +       INIT_DELAYED_WORK(&poller->work, input_dev_poller_work);
>>>> +       poller->input = dev;
>>>> +       poller->poll = poll_fn;
>>>> +
>>>> +       dev->poller = poller;
>>>> +       return 0;
>>>> +}
>>>> +EXPORT_SYMBOL(input_setup_polling);
>>>> +
>>>> +static bool input_dev_ensure_poller(struct input_dev *dev)
>>>> +{
>>>> +       if (!dev->poller) {
>>>> +               dev_err(dev->dev.parent ?: &dev->dev,
>>>> +                       "poller structure has not been set up\n");
>>>> +               return false;
>>>> +       }
>>>> +
>>>> +       return true;
>>>> +}
>>>> +
>>>> +void input_set_poll_interval(struct input_dev *dev, unsigned int interval)
>>>> +{
>>>> +       if (input_dev_ensure_poller(dev))
>>>> +               dev->poller->poll_interval = interval;
>>>> +}
>>>> +EXPORT_SYMBOL(input_set_poll_interval);
>>>> +
>>>> +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval)
>>>> +{
>>>> +       if (input_dev_ensure_poller(dev))
>>>> +               dev->poller->poll_interval_min = interval;
>>>> +}
>>>> +EXPORT_SYMBOL(input_set_min_poll_interval);
>>>> +
>>>> +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval)
>>>> +{
>>>> +       if (input_dev_ensure_poller(dev))
>>>> +               dev->poller->poll_interval_max = interval;
>>>> +}
>>>> +EXPORT_SYMBOL(input_set_max_poll_interval);
>>>> +
>>>> +/* SYSFS interface */
>>>> +
>>>> +static ssize_t input_dev_get_poll_interval(struct device *dev,
>>>> +                                          struct device_attribute *attr,
>>>> +                                          char *buf)
>>>> +{
>>>> +       struct input_dev *input = to_input_dev(dev);
>>>> +
>>>> +       return sprintf(buf, "%d\n", input->poller->poll_interval);
>>>> +}
>>>> +
>>>> +static ssize_t input_dev_set_poll_interval(struct device *dev,
>>>> +                                          struct device_attribute *attr,
>>>> +                                          const char *buf, size_t count)
>>>> +{
>>>> +       struct input_dev *input = to_input_dev(dev);
>>>> +       struct input_dev_poller *poller = input->poller;
>>>> +       unsigned int interval;
>>>> +       int err;
>>>> +
>>>> +       err = kstrtouint(buf, 0, &interval);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       if (interval < poller->poll_interval_min)
>>>> +               return -EINVAL;
>>>> +
>>>> +       if (interval > poller->poll_interval_max)
>>>> +               return -EINVAL;
>>>> +
>>>> +       mutex_lock(&input->mutex);
>>>> +
>>>> +       poller->poll_interval = interval;
>>>> +
>>>> +       if (input->users) {
>>>> +               cancel_delayed_work_sync(&poller->work);
>>>> +               if (poller->poll_interval > 0)
>>>> +                       input_dev_poller_queue_work(poller);
>>>> +       }
>>>> +
>>>> +       mutex_unlock(&input->mutex);
>>>> +
>>>> +       return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR(poll, S_IRUGO | S_IWUSR,
>>>> +                  input_dev_get_poll_interval, input_dev_set_poll_interval);
>>>> +
>>>> +static ssize_t input_dev_get_poll_max(struct device *dev,
>>>> +                                     struct device_attribute *attr, char *buf)
>>>> +{
>>>> +       struct input_dev *input = to_input_dev(dev);
>>>> +
>>>> +       return sprintf(buf, "%d\n", input->poller->poll_interval_max);
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR(max, S_IRUGO, input_dev_get_poll_max, NULL);
>>>> +
>>>> +static ssize_t input_dev_get_poll_min(struct device *dev,
>>>> +                                    struct device_attribute *attr, char *buf)
>>>> +{
>>>> +       struct input_dev *input = to_input_dev(dev);
>>>> +
>>>> +       return sprintf(buf, "%d\n", input->poller->poll_interval_min);
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR(min, S_IRUGO, input_dev_get_poll_min, NULL);
>>>> +
>>>> +static umode_t input_poller_attrs_visible(struct kobject *kobj,
>>>> +                                         struct attribute *attr, int n)
>>>> +{
>>>> +       struct device *dev = kobj_to_dev(kobj);
>>>> +       struct input_dev *input = to_input_dev(dev);
>>>> +
>>>> +       return input->poller ? attr->mode : 0;
>>>> +}
>>>> +
>>>> +static struct attribute *input_poller_attrs[] = {
>>>> +       &dev_attr_poll.attr,
>>>> +       &dev_attr_max.attr,
>>>> +       &dev_attr_min.attr,
>>>> +       NULL
>>>> +};
>>>> +
>>>> +struct attribute_group input_poller_attribute_group = {
>>>> +       .is_visible     = input_poller_attrs_visible,
>>>> +       .attrs          = input_poller_attrs,
>>>> +};
>>>> diff --git a/drivers/input/input-poller.h b/drivers/input/input-poller.h
>>>> new file mode 100644
>>>> index 000000000000..e3fca0be1d32
>>>> --- /dev/null
>>>> +++ b/drivers/input/input-poller.h
>>>> @@ -0,0 +1,18 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +#ifndef _INPUT_POLLER_H
>>>> +#define _INPUT_POLLER_H
>>>> +
>>>> +/*
>>>> + * Support for polling mode for input devices.
>>>> + */
>>>> +#include <linux/sysfs.h>
>>>> +
>>>> +struct input_dev_poller;
>>>> +
>>>> +void input_dev_poller_finalize(struct input_dev_poller *poller);
>>>> +void input_dev_poller_start(struct input_dev_poller *poller);
>>>> +void input_dev_poller_stop(struct input_dev_poller *poller);
>>>> +
>>>> +extern struct attribute_group input_poller_attribute_group;
>>>> +
>>>> +#endif /* _INPUT_POLLER_H */
>>>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>>>> index 7494a0dede79..c08aa3596144 100644
>>>> --- a/drivers/input/input.c
>>>> +++ b/drivers/input/input.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include <linux/mutex.h>
>>>>   #include <linux/rcupdate.h>
>>>>   #include "input-compat.h"
>>>> +#include "input-poller.h"
>>>>
>>>>   MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
>>>>   MODULE_DESCRIPTION("Input core");
>>>> @@ -603,20 +604,31 @@ int input_open_device(struct input_handle *handle)
>>>>
>>>>          handle->open++;
>>>>
>>>> -       if (!dev->users++ && dev->open)
>>>> -               retval = dev->open(dev);
>>>> +       if (dev->users++) {
>>>> +               /*
>>>> +                * Device is already opened, so we can exit immediately and
>>>> +                * report success.
>>>> +                */
>>>> +               goto out;
>>>> +       }
>>>>
>>>> -       if (retval) {
>>>> -               dev->users--;
>>>> -               if (!--handle->open) {
>>>> +       if (dev->open) {
>>>> +               retval = dev->open(dev);
>>>> +               if (retval) {
>>>> +                       dev->users--;
>>>> +                       handle->open--;
>>>>                          /*
>>>>                           * Make sure we are not delivering any more events
>>>>                           * through this handle
>>>>                           */
>>>>                          synchronize_rcu();
>>>> +                       goto out;
>>>>                  }
>>>>          }
>>>>
>>>> +       if (dev->poller)
>>>> +               input_dev_poller_start(dev->poller);
>>>> +
>>>>    out:
>>>>          mutex_unlock(&dev->mutex);
>>>>          return retval;
>>>> @@ -655,8 +667,13 @@ void input_close_device(struct input_handle *handle)
>>>>
>>>>          __input_release_device(handle);
>>>>
>>>> -       if (!--dev->users && dev->close)
>>>> -               dev->close(dev);
>>>> +       if (!--dev->users) {
>>>> +               if (dev->poller)
>>>> +                       input_dev_poller_stop(dev->poller);
>>>> +
>>>> +               if (dev->close)
>>>> +                       dev->close(dev);
>>>> +       }
>>>>
>>>>          if (!--handle->open) {
>>>>                  /*
>>>> @@ -1502,6 +1519,7 @@ static const struct attribute_group *input_dev_attr_groups[] = {
>>>>          &input_dev_attr_group,
>>>>          &input_dev_id_attr_group,
>>>>          &input_dev_caps_attr_group,
>>>> +       &input_poller_attribute_group,
>>>>          NULL
>>>>   };
>>>>
>>>> @@ -1511,6 +1529,7 @@ static void input_dev_release(struct device *device)
>>>>
>>>>          input_ff_destroy(dev);
>>>>          input_mt_destroy_slots(dev);
>>>> +       kfree(dev->poller);
>>>>          kfree(dev->absinfo);
>>>>          kfree(dev->vals);
>>>>          kfree(dev);
>>>> @@ -2175,6 +2194,9 @@ int input_register_device(struct input_dev *dev)
>>>>          if (!dev->setkeycode)
>>>>                  dev->setkeycode = input_default_setkeycode;
>>>>
>>>> +       if (dev->poller)
>>>> +               input_dev_poller_finalize(dev->poller);
>>>> +
>>>>          error = device_add(&dev->dev);
>>>>          if (error)
>>>>                  goto err_free_vals;
>>>> diff --git a/include/linux/input.h b/include/linux/input.h
>>>> index e95a439d8bd5..94f277cd806a 100644
>>>> --- a/include/linux/input.h
>>>> +++ b/include/linux/input.h
>>>> @@ -21,6 +21,8 @@
>>>>   #include <linux/timer.h>
>>>>   #include <linux/mod_devicetable.h>
>>>>
>>>> +struct input_dev_poller;
>>>> +
>>>>   /**
>>>>    * struct input_value - input value representation
>>>>    * @type: type of value (EV_KEY, EV_ABS, etc)
>>>> @@ -71,6 +73,8 @@ enum input_clock_type {
>>>>    *     not sleep
>>>>    * @ff: force feedback structure associated with the device if device
>>>>    *     supports force feedback effects
>>>> + * @poller: poller structure associated with the device if device is
>>>> + *     set up to use polling mode
>>>>    * @repeat_key: stores key code of the last key pressed; used to implement
>>>>    *     software autorepeat
>>>>    * @timer: timer for software autorepeat
>>>> @@ -156,6 +160,8 @@ struct input_dev {
>>>>
>>>>          struct ff_device *ff;
>>>>
>>>> +       struct input_dev_poller *poller;
>>>> +
>>>>          unsigned int repeat_key;
>>>>          struct timer_list timer;
>>>>
>>>> @@ -372,6 +378,12 @@ void input_unregister_device(struct input_dev *);
>>>>
>>>>   void input_reset_device(struct input_dev *);
>>>>
>>>> +int input_setup_polling(struct input_dev *dev,
>>>> +                       void (*poll_fn)(struct input_dev *dev));
>>>> +void input_set_poll_interval(struct input_dev *dev, unsigned int interval);
>>>> +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval);
>>>> +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval);
>>>> +
>>>>   int __must_check input_register_handler(struct input_handler *);
>>>>   void input_unregister_handler(struct input_handler *);
>>>>
>>>> --
>>>> 2.23.0.rc1.153.gdeed80330f-goog
>>>>
>>>>
>>>> --
>>>> Dmitry
>>
>> --
>> Dmitry

