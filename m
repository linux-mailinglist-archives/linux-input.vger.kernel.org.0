Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF0B8A40D
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 19:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfHLRLk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 13:11:40 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37956 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHLRLk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 13:11:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id z14so12575638pga.5;
        Mon, 12 Aug 2019 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NvCqYOkkW81SG841mqw9h/1OS6VYZ8jgEDKSvyZAi3k=;
        b=k0ex6ju0SmEQF3KghHoyPCluhACoZAKBcm0X3Y8YTrwk+aZLAqNnXfDY4fhYFQTP+H
         jd6kEIseFRjVYanoRFAbbXRc7AQ877L+ojxZ0lRrz6UWZXg1uTEe08mlf3U+Hg7IwCpJ
         nSsboSKUWVfeDAOMiVFiAl3fmb4j1h65cgdtJmLbY8N50BPHfySPtVo3oWi8hZbXayiA
         gQC89j3YMpG025p0levFjNy7tlU3uZQJnVDqVtJsB/7lVhNEhOLiTN1xoMfG8WBjQIgL
         icM/ETQqFdHZGIGlZuR8EHwKfNImtLvS0hRPCKkErkD3X3d4f0VJolwUw8PijelD/Bne
         qveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NvCqYOkkW81SG841mqw9h/1OS6VYZ8jgEDKSvyZAi3k=;
        b=UtDrEl6RyhmApegP0B8HZ+CZdkbtfkhpKE26D064rMsPrgzS5qmSAd/vDengjHwe+Z
         12sSlspxzar9zUaSgCgdKxw7Ek87z2o30mxu6Kv1lKn/37S+4PWs5L9iRJuyJH51cX/5
         IxTYDwDZPfQpf9AwoPMA2DTH81aQ0XC3mbfHEfCaAuDb/rbO20gFFls7Bz84kqA97tjW
         wmNjQY0zhrzDqjaR8ijyCelp0TYsl/olWUpuKbDNuCxfi79XzUH2S0elD1zBMddDtAGR
         wPNGe8dZIxB5oO5j3HDSEp8D6g9vWZqPNAei9dNxH3i25eCyA/cM9NaobcSZGN4u6x8C
         noCw==
X-Gm-Message-State: APjAAAWpiap9T2L/LeJ5lr2+YBJQZ1wQRi5+cDQBOQ3I6U3E4qj9QKc7
        ozoe/xKYXV3IAnjwwypXmpk=
X-Google-Smtp-Source: APXvYqyXwW6IV8Y93+Je4CwDTWCCENRCl+DZG1jFN3qfe2s9HMoUSnXDL2fdhXzxDLfqDOjuZEN6og==
X-Received: by 2002:a63:3fc9:: with SMTP id m192mr31566909pga.429.1565629898544;
        Mon, 12 Aug 2019 10:11:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i9sm101139pjj.2.2019.08.12.10.11.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 10:11:37 -0700 (PDT)
Date:   Mon, 12 Aug 2019 10:11:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: add support for polling to input devices
Message-ID: <20190812171135.GA178933@dtor-ws>
References: <20190809173548.GA32693@dtor-ws>
 <CAO-hwJL1Jq5XjqV32fD7+_nMpi3PhUbrB5QQ+EEs3N6=mBy-1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJL1Jq5XjqV32fD7+_nMpi3PhUbrB5QQ+EEs3N6=mBy-1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Mon, Aug 12, 2019 at 06:50:38PM +0200, Benjamin Tissoires wrote:
> Hi Dmitry,
> 
> On Fri, Aug 9, 2019 at 7:35 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Separating "normal" and "polled" input devices was a mistake, as often we
> > want to allow the very same device work on both interrupt-driven and
> > polled mode, depending on the board on which the device is used.
> >
> > This introduces new APIs:
> >
> > - input_setup_polling
> > - input_set_poll_interval
> > - input_set_min_poll_interval
> > - input_set_max_poll_interval
> >
> > These new APIs allow switching an input device into polled mode with sysfs
> > attributes matching drivers using input_polled_dev APIs that will be
> > eventually removed.
> 
> Are you sure that using sysfs is the correct way here?
> I would think using generic properties that can be overwritten by the
> DSDT or by the device tree would make things easier from a driver
> point of view.

Couple of points: I wanted it to be compatible with input-polldev.c so
the sysfs attributes must match (so that we can convert existing drivers
and zap input-polldev). I also am not sure if polling parameters are
property of board, or it is either fundamental hardware limitation or
simply desired system behavior. If Rob is OK with adding device
properties I'd be fine adding them as a followup, otherwise we can have
udev adjust the behavior as needed for given box shortly after boot.

> 
> Also, checkpatch complains about a few octal permissions that are
> preferred over symbolic ones, and there is a possible 'out of memory'
> nessage at drivers/input/input-poller.c:75.

Yes, there is. It is there so we would know what device we were trying
to set up when OOM happened. You can probable decipher the driver from
the stack trace, but figuring particular device instance is harder.

Thanks.

> 
> Cheers,
> Benjamin
> 
> >
> > Tested-by: Michal Vokáč <michal.vokac@ysoft.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/Makefile       |   2 +-
> >  drivers/input/input-poller.c | 208 +++++++++++++++++++++++++++++++++++
> >  drivers/input/input-poller.h |  18 +++
> >  drivers/input/input.c        |  36 ++++--
> >  include/linux/input.h        |  12 ++
> >  5 files changed, 268 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/input/Makefile b/drivers/input/Makefile
> > index 40de6a7be641..e35650930371 100644
> > --- a/drivers/input/Makefile
> > +++ b/drivers/input/Makefile
> > @@ -6,7 +6,7 @@
> >  # Each configuration option enables a list of files.
> >
> >  obj-$(CONFIG_INPUT)            += input-core.o
> > -input-core-y := input.o input-compat.o input-mt.o ff-core.o
> > +input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
> >
> >  obj-$(CONFIG_INPUT_FF_MEMLESS) += ff-memless.o
> >  obj-$(CONFIG_INPUT_POLLDEV)    += input-polldev.o
> > diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
> > new file mode 100644
> > index 000000000000..e041adb04f5a
> > --- /dev/null
> > +++ b/drivers/input/input-poller.c
> > @@ -0,0 +1,208 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Support for polling mode for input devices.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/input.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +#include "input-poller.h"
> > +
> > +struct input_dev_poller {
> > +       void (*poll)(struct input_dev *dev);
> > +
> > +       unsigned int poll_interval; /* msec */
> > +       unsigned int poll_interval_max; /* msec */
> > +       unsigned int poll_interval_min; /* msec */
> > +
> > +       struct input_dev *input;
> > +       struct delayed_work work;
> > +};
> > +
> > +static void input_dev_poller_queue_work(struct input_dev_poller *poller)
> > +{
> > +       unsigned long delay;
> > +
> > +       delay = msecs_to_jiffies(poller->poll_interval);
> > +       if (delay >= HZ)
> > +               delay = round_jiffies_relative(delay);
> > +
> > +       queue_delayed_work(system_freezable_wq, &poller->work, delay);
> > +}
> > +
> > +static void input_dev_poller_work(struct work_struct *work)
> > +{
> > +       struct input_dev_poller *poller =
> > +               container_of(work, struct input_dev_poller, work.work);
> > +
> > +       poller->poll(poller->input);
> > +       input_dev_poller_queue_work(poller);
> > +}
> > +
> > +void input_dev_poller_finalize(struct input_dev_poller *poller)
> > +{
> > +       if (!poller->poll_interval)
> > +               poller->poll_interval = 500;
> > +       if (!poller->poll_interval_max)
> > +               poller->poll_interval_max = poller->poll_interval;
> > +}
> > +
> > +void input_dev_poller_start(struct input_dev_poller *poller)
> > +{
> > +       /* Only start polling if polling is enabled */
> > +       if (poller->poll_interval > 0) {
> > +               poller->poll(poller->input);
> > +               input_dev_poller_queue_work(poller);
> > +       }
> > +}
> > +
> > +void input_dev_poller_stop(struct input_dev_poller *poller)
> > +{
> > +       cancel_delayed_work_sync(&poller->work);
> > +}
> > +
> > +int input_setup_polling(struct input_dev *dev,
> > +                       void (*poll_fn)(struct input_dev *dev))
> > +{
> > +       struct input_dev_poller *poller;
> > +
> > +       poller = kzalloc(sizeof(*poller), GFP_KERNEL);
> > +       if (!poller) {
> > +               dev_err(dev->dev.parent ?: &dev->dev,
> > +                       "%s: unable to allocate poller structure\n", __func__);
> > +               return -ENOMEM;
> > +       }
> > +
> > +       INIT_DELAYED_WORK(&poller->work, input_dev_poller_work);
> > +       poller->input = dev;
> > +       poller->poll = poll_fn;
> > +
> > +       dev->poller = poller;
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(input_setup_polling);
> > +
> > +static bool input_dev_ensure_poller(struct input_dev *dev)
> > +{
> > +       if (!dev->poller) {
> > +               dev_err(dev->dev.parent ?: &dev->dev,
> > +                       "poller structure has not been set up\n");
> > +               return false;
> > +       }
> > +
> > +       return true;
> > +}
> > +
> > +void input_set_poll_interval(struct input_dev *dev, unsigned int interval)
> > +{
> > +       if (input_dev_ensure_poller(dev))
> > +               dev->poller->poll_interval = interval;
> > +}
> > +EXPORT_SYMBOL(input_set_poll_interval);
> > +
> > +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval)
> > +{
> > +       if (input_dev_ensure_poller(dev))
> > +               dev->poller->poll_interval_min = interval;
> > +}
> > +EXPORT_SYMBOL(input_set_min_poll_interval);
> > +
> > +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval)
> > +{
> > +       if (input_dev_ensure_poller(dev))
> > +               dev->poller->poll_interval_max = interval;
> > +}
> > +EXPORT_SYMBOL(input_set_max_poll_interval);
> > +
> > +/* SYSFS interface */
> > +
> > +static ssize_t input_dev_get_poll_interval(struct device *dev,
> > +                                          struct device_attribute *attr,
> > +                                          char *buf)
> > +{
> > +       struct input_dev *input = to_input_dev(dev);
> > +
> > +       return sprintf(buf, "%d\n", input->poller->poll_interval);
> > +}
> > +
> > +static ssize_t input_dev_set_poll_interval(struct device *dev,
> > +                                          struct device_attribute *attr,
> > +                                          const char *buf, size_t count)
> > +{
> > +       struct input_dev *input = to_input_dev(dev);
> > +       struct input_dev_poller *poller = input->poller;
> > +       unsigned int interval;
> > +       int err;
> > +
> > +       err = kstrtouint(buf, 0, &interval);
> > +       if (err)
> > +               return err;
> > +
> > +       if (interval < poller->poll_interval_min)
> > +               return -EINVAL;
> > +
> > +       if (interval > poller->poll_interval_max)
> > +               return -EINVAL;
> > +
> > +       mutex_lock(&input->mutex);
> > +
> > +       poller->poll_interval = interval;
> > +
> > +       if (input->users) {
> > +               cancel_delayed_work_sync(&poller->work);
> > +               if (poller->poll_interval > 0)
> > +                       input_dev_poller_queue_work(poller);
> > +       }
> > +
> > +       mutex_unlock(&input->mutex);
> > +
> > +       return count;
> > +}
> > +
> > +static DEVICE_ATTR(poll, S_IRUGO | S_IWUSR,
> > +                  input_dev_get_poll_interval, input_dev_set_poll_interval);
> > +
> > +static ssize_t input_dev_get_poll_max(struct device *dev,
> > +                                     struct device_attribute *attr, char *buf)
> > +{
> > +       struct input_dev *input = to_input_dev(dev);
> > +
> > +       return sprintf(buf, "%d\n", input->poller->poll_interval_max);
> > +}
> > +
> > +static DEVICE_ATTR(max, S_IRUGO, input_dev_get_poll_max, NULL);
> > +
> > +static ssize_t input_dev_get_poll_min(struct device *dev,
> > +                                    struct device_attribute *attr, char *buf)
> > +{
> > +       struct input_dev *input = to_input_dev(dev);
> > +
> > +       return sprintf(buf, "%d\n", input->poller->poll_interval_min);
> > +}
> > +
> > +static DEVICE_ATTR(min, S_IRUGO, input_dev_get_poll_min, NULL);
> > +
> > +static umode_t input_poller_attrs_visible(struct kobject *kobj,
> > +                                         struct attribute *attr, int n)
> > +{
> > +       struct device *dev = kobj_to_dev(kobj);
> > +       struct input_dev *input = to_input_dev(dev);
> > +
> > +       return input->poller ? attr->mode : 0;
> > +}
> > +
> > +static struct attribute *input_poller_attrs[] = {
> > +       &dev_attr_poll.attr,
> > +       &dev_attr_max.attr,
> > +       &dev_attr_min.attr,
> > +       NULL
> > +};
> > +
> > +struct attribute_group input_poller_attribute_group = {
> > +       .is_visible     = input_poller_attrs_visible,
> > +       .attrs          = input_poller_attrs,
> > +};
> > diff --git a/drivers/input/input-poller.h b/drivers/input/input-poller.h
> > new file mode 100644
> > index 000000000000..e3fca0be1d32
> > --- /dev/null
> > +++ b/drivers/input/input-poller.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _INPUT_POLLER_H
> > +#define _INPUT_POLLER_H
> > +
> > +/*
> > + * Support for polling mode for input devices.
> > + */
> > +#include <linux/sysfs.h>
> > +
> > +struct input_dev_poller;
> > +
> > +void input_dev_poller_finalize(struct input_dev_poller *poller);
> > +void input_dev_poller_start(struct input_dev_poller *poller);
> > +void input_dev_poller_stop(struct input_dev_poller *poller);
> > +
> > +extern struct attribute_group input_poller_attribute_group;
> > +
> > +#endif /* _INPUT_POLLER_H */
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index 7494a0dede79..c08aa3596144 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -24,6 +24,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/rcupdate.h>
> >  #include "input-compat.h"
> > +#include "input-poller.h"
> >
> >  MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
> >  MODULE_DESCRIPTION("Input core");
> > @@ -603,20 +604,31 @@ int input_open_device(struct input_handle *handle)
> >
> >         handle->open++;
> >
> > -       if (!dev->users++ && dev->open)
> > -               retval = dev->open(dev);
> > +       if (dev->users++) {
> > +               /*
> > +                * Device is already opened, so we can exit immediately and
> > +                * report success.
> > +                */
> > +               goto out;
> > +       }
> >
> > -       if (retval) {
> > -               dev->users--;
> > -               if (!--handle->open) {
> > +       if (dev->open) {
> > +               retval = dev->open(dev);
> > +               if (retval) {
> > +                       dev->users--;
> > +                       handle->open--;
> >                         /*
> >                          * Make sure we are not delivering any more events
> >                          * through this handle
> >                          */
> >                         synchronize_rcu();
> > +                       goto out;
> >                 }
> >         }
> >
> > +       if (dev->poller)
> > +               input_dev_poller_start(dev->poller);
> > +
> >   out:
> >         mutex_unlock(&dev->mutex);
> >         return retval;
> > @@ -655,8 +667,13 @@ void input_close_device(struct input_handle *handle)
> >
> >         __input_release_device(handle);
> >
> > -       if (!--dev->users && dev->close)
> > -               dev->close(dev);
> > +       if (!--dev->users) {
> > +               if (dev->poller)
> > +                       input_dev_poller_stop(dev->poller);
> > +
> > +               if (dev->close)
> > +                       dev->close(dev);
> > +       }
> >
> >         if (!--handle->open) {
> >                 /*
> > @@ -1502,6 +1519,7 @@ static const struct attribute_group *input_dev_attr_groups[] = {
> >         &input_dev_attr_group,
> >         &input_dev_id_attr_group,
> >         &input_dev_caps_attr_group,
> > +       &input_poller_attribute_group,
> >         NULL
> >  };
> >
> > @@ -1511,6 +1529,7 @@ static void input_dev_release(struct device *device)
> >
> >         input_ff_destroy(dev);
> >         input_mt_destroy_slots(dev);
> > +       kfree(dev->poller);
> >         kfree(dev->absinfo);
> >         kfree(dev->vals);
> >         kfree(dev);
> > @@ -2175,6 +2194,9 @@ int input_register_device(struct input_dev *dev)
> >         if (!dev->setkeycode)
> >                 dev->setkeycode = input_default_setkeycode;
> >
> > +       if (dev->poller)
> > +               input_dev_poller_finalize(dev->poller);
> > +
> >         error = device_add(&dev->dev);
> >         if (error)
> >                 goto err_free_vals;
> > diff --git a/include/linux/input.h b/include/linux/input.h
> > index e95a439d8bd5..94f277cd806a 100644
> > --- a/include/linux/input.h
> > +++ b/include/linux/input.h
> > @@ -21,6 +21,8 @@
> >  #include <linux/timer.h>
> >  #include <linux/mod_devicetable.h>
> >
> > +struct input_dev_poller;
> > +
> >  /**
> >   * struct input_value - input value representation
> >   * @type: type of value (EV_KEY, EV_ABS, etc)
> > @@ -71,6 +73,8 @@ enum input_clock_type {
> >   *     not sleep
> >   * @ff: force feedback structure associated with the device if device
> >   *     supports force feedback effects
> > + * @poller: poller structure associated with the device if device is
> > + *     set up to use polling mode
> >   * @repeat_key: stores key code of the last key pressed; used to implement
> >   *     software autorepeat
> >   * @timer: timer for software autorepeat
> > @@ -156,6 +160,8 @@ struct input_dev {
> >
> >         struct ff_device *ff;
> >
> > +       struct input_dev_poller *poller;
> > +
> >         unsigned int repeat_key;
> >         struct timer_list timer;
> >
> > @@ -372,6 +378,12 @@ void input_unregister_device(struct input_dev *);
> >
> >  void input_reset_device(struct input_dev *);
> >
> > +int input_setup_polling(struct input_dev *dev,
> > +                       void (*poll_fn)(struct input_dev *dev));
> > +void input_set_poll_interval(struct input_dev *dev, unsigned int interval);
> > +void input_set_min_poll_interval(struct input_dev *dev, unsigned int interval);
> > +void input_set_max_poll_interval(struct input_dev *dev, unsigned int interval);
> > +
> >  int __must_check input_register_handler(struct input_handler *);
> >  void input_unregister_handler(struct input_handler *);
> >
> > --
> > 2.23.0.rc1.153.gdeed80330f-goog
> >
> >
> > --
> > Dmitry

-- 
Dmitry
