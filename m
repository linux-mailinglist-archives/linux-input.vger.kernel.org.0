Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5C9B52AC
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfIQQOh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:14:37 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35092 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfIQQOh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:14:37 -0400
Received: by mail-io1-f65.google.com with SMTP id q10so9040001iop.2;
        Tue, 17 Sep 2019 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQZSOlhSQncdpMt36At4k33ExBV4mWuYpJ7092roB2Q=;
        b=kbdiipZ1OLyQH+k4chrxxIg5Uc5LyGAHKxKwsyHhC5R7bFF74A72cCg0WKAtKjaBcJ
         XJjNhu6q+z0Dpo95l7kZZm2q+KCr4TKHb2dLjlgawtWZvGzz5Oqa5EAw2XPPloh6gGH+
         E8cOV0SHxcQ8jQCmgsnqtC2Ow4XiObh7C5Z9ce23YJkzmFxtndQ90Pok34oEulX++Mv7
         PZZH5xsnWX43vJ35DnYVo/6WFzCNM4VN64JJVjHrmKWDkWpS0c0nwmDexulP98k5EUzK
         OOt4avF0DUk4iE0Ytlb4WmCSx+9adTuYpaxT3c8Lfd7xS+ZWPLiNOEKRZ7+xFjFCu7bV
         XtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQZSOlhSQncdpMt36At4k33ExBV4mWuYpJ7092roB2Q=;
        b=qeHZh72ohU1zt1a45/gbPELsx3B6blvgpvc9Klpx7Nlr8S+EjWX1ZFgYQ6guPqWFAo
         LcFaNbClEjywXPSUytY+eV17QyvPNjcv7bHAKjOrh937cChscgEFO+nX53flRDn/uuiW
         5B9sddxZshxXNJd94QqgMEtJQHUbSpfpsmiI5wQ6PhtIww6oRknAYYXkb+E33oLSIHm6
         LMEVermBZMY//4NwnIlteGO5+AyNEeBkR1H/S6TX0NtFPOdHGJSIHmzWQY/QQH6z6Jvq
         Xdqwvw+VS9I/lyxNG+wvHfW9vxYjYV5aUdo1I7JnjXQuoKNb1c4qZYtikUuwjLM9DrQg
         I57g==
X-Gm-Message-State: APjAAAWW/IigoNg38YA7NI0QU2TbA6cB+6hDOYprzaI9yYDtp2q9g9Jg
        DjdBbtUNJDLhM4WUNdfN6QEoa73Qixhzb3BGnCUzo462
X-Google-Smtp-Source: APXvYqx+YVRfR8I8K05DruFfhsOvfuLJHoYLNVjNIR0EGpDsWpzshm8OAGYe4DLVo98XKVFWWUe8DpQCk0BgcBZAh3E=
X-Received: by 2002:a6b:cd81:: with SMTP id d123mr4845380iog.78.1568736875835;
 Tue, 17 Sep 2019 09:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190312190137.8138-1-aford173@gmail.com>
In-Reply-To: <20190312190137.8138-1-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 17 Sep 2019 11:14:24 -0500
Message-ID: <CAHCN7xL_65zMNASzystWh_2qhAfhZ558g=-xAJJQEJcbvxR9ew@mail.gmail.com>
Subject: Re: [PATCH] Input: ili2117a - Add support for Ilitek ILI2117A based touchscreens
To:     linux-input@vger.kernel.org
Cc:     Adam Ford <adam.ford@logicpd.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 12, 2019 at 2:01 PM Adam Ford <aford173@gmail.com> wrote:
>
> This driver supports the ILI2117A touch controller.  This is
> different than the ILI210x and it uses different register and
> algorithm so it's a separate driver rather than integrating with
> the other.
>

It's been a few months, and I haven't seen any feedback, but I have
received questions from people.  Is there any chance this can get some
review?

Thank you,

adam
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 6c16aaeb4191..ff7cd369514e 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -416,6 +416,18 @@ config TOUCHSCREEN_ILI210X
>           To compile this driver as a module, choose M here: the
>           module will be called ili210x.
>
> +config TOUCHSCREEN_ILI2117A
> +       tristate "Ilitek ILI2117A Multi-Touch Controller"
> +       depends on I2C
> +       help
> +         Say Y here if you have a ILI2117A based touchscreen
> +         controller.
> +
> +         If unsure, say N.
> +
> +         To compile this driver as a module, choose M here: the
> +         module will be called ili2117a.
> +
>  config TOUCHSCREEN_IPROC
>         tristate "IPROC touch panel driver support"
>         depends on ARCH_BCM_IPROC || COMPILE_TEST
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index fcc7605fba8d..0290d503bed1 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_TOUCHSCREEN_FUJITSU)     += fujitsu_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX)       += goodix.o
>  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)       += hideep.o
>  obj-$(CONFIG_TOUCHSCREEN_ILI210X)      += ili210x.o
> +obj-$(CONFIG_TOUCHSCREEN_ILI2117A)      += ili2117a.o
>  obj-$(CONFIG_TOUCHSCREEN_IMX6UL_TSC)   += imx6ul_tsc.o
>  obj-$(CONFIG_TOUCHSCREEN_INEXIO)       += inexio.o
>  obj-$(CONFIG_TOUCHSCREEN_IPROC)                += bcm_iproc_tsc.o
> diff --git a/drivers/input/touchscreen/ili2117a.c b/drivers/input/touchscreen/ili2117a.c
> new file mode 100644
> index 000000000000..c47874ee89f4
> --- /dev/null
> +++ b/drivers/input/touchscreen/ili2117a.c
> @@ -0,0 +1,308 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/slab.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/delay.h>
> +#include <linux/workqueue.h>
> +
> +#define MAX_TOUCHES            10
> +#define DEFAULT_POLL_PERIOD    20
> +#define MAX_X                  ((1 << 12) - 1)
> +#define MAX_Y                  ((1 << 12) - 1)
> +
> +/* Touchscreen commands */
> +#define TOUCH_INFO     0x00
> +
> +struct finger {
> +       u8 xy;
> +       u8 x;
> +       u8 y;
> +       u8 c_sum;
> +} __packed;
> +
> +struct touchdata {
> +       u8 packet_id;
> +       struct finger finger[MAX_TOUCHES];
> +       u8 key;
> +       u8 checksum;
> +} __packed;
> +
> +
> +struct ili2117a {
> +       struct i2c_client *client;
> +       struct input_dev *input;
> +       bool (*get_pendown_state)(void);
> +       unsigned int poll_period;
> +       struct delayed_work dwork;
> +       int max_touch;
> +};
> +
> +static int ili2117a_read_reg(struct i2c_client *client, u8 reg, void *buf,
> +                           size_t len)
> +{
> +       struct i2c_msg msg[2] = {
> +               {
> +                       .addr   = client->addr,
> +                       .flags  = 0,
> +                       .len    = 1,
> +                       .buf    = &reg,
> +               },
> +               {
> +                       .addr   = client->addr,
> +                       .flags  = I2C_M_RD,
> +                       .len    = len,
> +                       .buf    = buf,
> +               }
> +       };
> +
> +       if (i2c_transfer(client->adapter, msg, 2) != 2) {
> +               dev_err(&client->dev, "i2c transfer failed\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
> +static bool ili2117a_report_events(struct input_dev *input,
> +                                 const struct touchdata *touchdata,
> +                                 int max_touch)
> +{
> +       int i;
> +       bool touch;
> +       bool pen_down = 0;
> +       u16 x = 0xfff;
> +       u16 y = 0xfff;
> +       const struct finger *finger;
> +
> +       for (i = 0; i < max_touch; i++) {
> +               touch = 0;
> +               input_mt_slot(input, i);
> +               finger = &touchdata->finger[i];
> +
> +               x = finger->x | (((finger->xy & 0xf0) >> 4) << 8);
> +               y = finger->y | ((finger->xy & 0x0f) << 8);
> +
> +               /* This driver returns 0xfff if there is no touch */
> +               if (x != 0xfff && y != 0xfff) {
> +                       touch = 1;
> +                       pen_down = 1;
> +               }
> +
> +               input_mt_report_slot_state(input, MT_TOOL_FINGER, touch);
> +
> +               if (touch) {
> +                       input_report_abs(input, ABS_MT_POSITION_X, x);
> +                       input_report_abs(input, ABS_MT_POSITION_Y, y);
> +               }
> +       }
> +
> +       input_mt_report_pointer_emulation(input, false);
> +       input_sync(input);
> +       return pen_down;
> +}
> +
> +static void ili2117a_work(struct work_struct *work)
> +{
> +       struct ili2117a *priv = container_of(work, struct ili2117a,
> +                                           dwork.work);
> +       struct i2c_client *client = priv->client;
> +       struct touchdata touchdata;
> +       int error;
> +       bool status;
> +
> +       error = ili2117a_read_reg(client, TOUCH_INFO,
> +                                 (uint8_t *) &touchdata, sizeof(touchdata));
> +
> +       if (error) {
> +               dev_err(&client->dev,
> +                       "Unable to get touchdata, err = %d\n", error);
> +               return;
> +       }
> +
> +       status = ili2117a_report_events(priv->input, &touchdata,
> +                                       priv->max_touch);
> +
> +       if (status) {
> +               schedule_delayed_work(&priv->dwork,
> +                                     msecs_to_jiffies(priv->poll_period));
> +       }
> +}
> +
> +static irqreturn_t ili2117a_irq(int irq, void *irq_data)
> +{
> +       struct ili2117a *priv = irq_data;
> +
> +       schedule_delayed_work(&priv->dwork, 0);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static struct attribute *ili2117a_attributes[] = {
> +       NULL,
> +};
> +
> +static const struct attribute_group ili2117a_attr_group = {
> +       .attrs = ili2117a_attributes,
> +};
> +
> +static int ili2117a_i2c_probe(struct i2c_client *client,
> +                                      const struct i2c_device_id *id)
> +{
> +       struct device *dev = &client->dev;
> +       struct ili2117a *priv;
> +       struct input_dev *input;
> +       int error;
> +       int poll_period;
> +       int max_touch;
> +
> +       if (client->irq <= 0) {
> +               dev_err(dev, "No IRQ!\n");
> +               return -EINVAL;
> +       }
> +
> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +       input = input_allocate_device();
> +       if (!priv || !input) {
> +               error = -ENOMEM;
> +               goto err_free_mem;
> +       }
> +
> +       priv->client = client;
> +       priv->input = input;
> +
> +       error = device_property_read_u32(dev, "ili2117a,poll-period",
> +                                        &poll_period);
> +       priv->poll_period = error ? DEFAULT_POLL_PERIOD : poll_period;
> +
> +       error = device_property_read_u32(dev, "ili2117a,max-touch",
> +                                        &max_touch);
> +       if (max_touch > MAX_TOUCHES)
> +               max_touch = MAX_TOUCHES;
> +       priv->max_touch = error ? MAX_TOUCHES : max_touch;
> +
> +       INIT_DELAYED_WORK(&priv->dwork, ili2117a_work);
> +
> +       /* Setup input device */
> +       input->name = "ili2117a Touchscreen";
> +       input->id.bustype = BUS_I2C;
> +       input->dev.parent = dev;
> +
> +       __set_bit(EV_SYN, input->evbit);
> +       __set_bit(EV_KEY, input->evbit);
> +       __set_bit(EV_ABS, input->evbit);
> +       __set_bit(BTN_TOUCH, input->keybit);
> +
> +       /* Single touch */
> +       input_set_abs_params(input, ABS_X, 0, MAX_X, 0, 0);
> +       input_set_abs_params(input, ABS_Y, 0, MAX_Y, 0, 0);
> +
> +       /* Multi touch */
> +       input_mt_init_slots(input, priv->max_touch, 0);
> +       input_set_abs_params(input, ABS_MT_POSITION_X, 0, MAX_X, 0, 0);
> +       input_set_abs_params(input, ABS_MT_POSITION_Y, 0, MAX_Y, 0, 0);
> +
> +       i2c_set_clientdata(client, priv);
> +
> +       error = devm_request_threaded_irq(dev, client->irq, NULL,
> +                                         ili2117a_irq,
> +                                         IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +                                         client->name, priv);
> +
> +       if (error) {
> +               dev_err(dev, "Failed to request irq, err: %d\n", error);
> +               goto err_free_mem;
> +       }
> +
> +       error = sysfs_create_group(&dev->kobj, &ili2117a_attr_group);
> +       if (error) {
> +               dev_err(dev, "Unable to create sysfs attributes, err: %d\n",
> +                       error);
> +               goto err_free_irq;
> +       }
> +
> +       error = input_register_device(priv->input);
> +       if (error) {
> +               dev_err(dev, "Cannot register input device, err: %d\n", error);
> +               goto err_remove_sysfs;
> +       }
> +
> +       device_init_wakeup(dev, 1);
> +       return 0;
> +
> +err_remove_sysfs:
> +       sysfs_remove_group(&dev->kobj, &ili2117a_attr_group);
> +err_free_irq:
> +       free_irq(client->irq, priv);
> +err_free_mem:
> +       input_free_device(input);
> +       kfree(priv);
> +       return error;
> +}
> +
> +static int ili2117a_i2c_remove(struct i2c_client *client)
> +{
> +       struct ili2117a *priv = i2c_get_clientdata(client);
> +
> +       sysfs_remove_group(&client->dev.kobj, &ili2117a_attr_group);
> +       free_irq(priv->client->irq, priv);
> +       cancel_delayed_work_sync(&priv->dwork);
> +       input_unregister_device(priv->input);
> +       kfree(priv);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused ili2117a_i2c_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +
> +       if (device_may_wakeup(&client->dev))
> +               enable_irq_wake(client->irq);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused ili2117a_i2c_resume(struct device *dev)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +
> +       if (device_may_wakeup(&client->dev))
> +               disable_irq_wake(client->irq);
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(ili2117a_i2c_pm,
> +                        ili2117a_i2c_suspend, ili2117a_i2c_resume);
> +
> +static const struct of_device_id ili_match_table[] = {
> +       { .compatible = "ilitek,ili2117a" },
> +       { },
> +};
> +
> +static const struct i2c_device_id ili2117a_i2c_id[] = {
> +       { "ili2117a", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, ili2117a_i2c_id);
> +
> +static struct i2c_driver ili2117a_ts_driver = {
> +       .driver = {
> +               .name = "ili2117a_i2c",
> +               .pm = &ili2117a_i2c_pm,
> +               .of_match_table = of_match_ptr(ili_match_table),
> +       },
> +       .id_table = ili2117a_i2c_id,
> +       .probe = ili2117a_i2c_probe,
> +       .remove = ili2117a_i2c_remove,
> +};
> +
> +module_i2c_driver(ili2117a_ts_driver);
> +
> +MODULE_AUTHOR("Adam Ford <adam.ford@logicpd.com>");
> +MODULE_DESCRIPTION("ili2117a I2C Touchscreen Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>
