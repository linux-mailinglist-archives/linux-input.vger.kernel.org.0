Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90DDF76D
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 23:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfJUV1P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 17:27:15 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35230 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUV1P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 17:27:15 -0400
Received: by mail-pl1-f196.google.com with SMTP id c3so7273543plo.2;
        Mon, 21 Oct 2019 14:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CsG0qtU75qANh+JmSz+X7f1M3a6+v5CwAhxfgSNLNOs=;
        b=eWMZ45+DbJdfmr6eYQmOV5wQUWxdgznoh9Lh2qWA359EwSdwSjR7ltRQ+nvxDM9An3
         H3YLFYF17YcbugVcNRO7ZC6aPMGsN3Gr9uoWsjxW/lzVxKiZW70a+8O0ZwkyJJNRWZNU
         crykr3kDWAbLpFLWWIS96VtYIPD/jEn3KPe8s07lQJJSpw+zRUCvO6p0BNPitkw1EOmn
         myDMsVH4IsYAf8HsXzIuWuAPPVHmUQVjYRkZE48W/xKBIYrpxvjGzI93BuWRo9L/UJc0
         qau4dSu5OX63eGPP3LCeiGYz17QtUkaJE6oPmAU6zW7tzI9F1C7h3qZuJLR44Ie/yPLR
         jJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CsG0qtU75qANh+JmSz+X7f1M3a6+v5CwAhxfgSNLNOs=;
        b=SzNpAApCgrS6aJT+tk4bf3ZtAbrzltxGdWc7dzPX69MxAoFylqPsOkI2D8P03xflob
         mo91B+VCo9HvAya6t93kFQuh7n4Duyxcz2L2HM8FmrHF5/xtVQknSxUeVT8uPtmu79s0
         25A6ALDG7q1sbXn04STAJ5lrbAYSu08fe4/P+IP1sxUkoAGlO+CGS47zDGF6QHP8lNvj
         DZSgFUhIXX0v2ZCQHWF5wGZE2DebsW3oMcpwNThLBSFnI47HbHaOT2G71cOZ4RMgA3ke
         5lNtH+az6TACpN/8j/xsNIfQOaYFagl9WsZ/Rfmpa3YLYLzs6Bg4KfgQKUxTVXHi+SIa
         9bsw==
X-Gm-Message-State: APjAAAWxehDvwXNt7P2QX+tHKqf8m+B4ek0mv0Wb3SVhgxKiVuXEWw1l
        dci1UYbjjDWWCjKFxa0AqIc=
X-Google-Smtp-Source: APXvYqxIEc1BPrRpmgTM5/ABkOC+Yi/ljI4/mgA3i0YxRg5hrNCiCGgbnFDcy3a0VBUPcWCR5TFZ4g==
X-Received: by 2002:a17:902:8f92:: with SMTP id z18mr93753plo.230.1571693233662;
        Mon, 21 Oct 2019 14:27:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e7sm62815pgr.25.2019.10.21.14.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 14:27:12 -0700 (PDT)
Date:   Mon, 21 Oct 2019 14:27:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Enrico Weigelt <info@metux.net>, Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/22] Input: apanel - switch to using polled mode of
 input devices
Message-ID: <20191021212710.GU35946@dtor-ws>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
 <20191017204217.106453-10-dmitry.torokhov@gmail.com>
 <CAGngYiWq9Xw1MMh6eoFjX0rB8utusK8jNrho59BgHpwUV31e+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiWq9Xw1MMh6eoFjX0rB8utusK8jNrho59BgHpwUV31e+g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sven,

On Mon, Oct 21, 2019 at 04:05:40PM -0400, Sven Van Asbroeck wrote:
> Hi Dmitry, a few minor nags below, inline.

Thanks for taking a look.

> 
> On Thu, Oct 17, 2019 at 4:42 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > We have added polled mode to the normal input devices with the intent of
> > retiring input_polled_dev. This converts apanel driver to use the polling
> > mode of standard input devices and removes dependency on INPUT_POLLDEV.
> >
> > While at it, let's convert the driver to use devm.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >
> >  drivers/input/misc/Kconfig  |   1 -
> >  drivers/input/misc/apanel.c | 153 +++++++++++++++---------------------
> >  2 files changed, 64 insertions(+), 90 deletions(-)
> >
> > diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> > index 7d9ae394e597..a6b8af69915d 100644
> > --- a/drivers/input/misc/Kconfig
> > +++ b/drivers/input/misc/Kconfig
> > @@ -257,7 +257,6 @@ config INPUT_MMA8450
> >  config INPUT_APANEL
> >         tristate "Fujitsu Lifebook Application Panel buttons"
> >         depends on X86 && I2C && LEDS_CLASS
> > -       select INPUT_POLLDEV
> >         select CHECK_SIGNATURE
> >         help
> >          Say Y here for support of the Application Panel buttons, used on
> > diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
> > index 53ec40d1b90d..de0deb432fe3 100644
> > --- a/drivers/input/misc/apanel.c
> > +++ b/drivers/input/misc/apanel.c
> > @@ -17,7 +17,7 @@
> >  #include <linux/module.h>
> >  #include <linux/ioport.h>
> >  #include <linux/io.h>
> > -#include <linux/input-polldev.h>
> > +#include <linux/input.h>
> >  #include <linux/i2c.h>
> >  #include <linux/leds.h>
> >
> > @@ -51,19 +51,28 @@ static enum apanel_chip device_chip[APANEL_DEV_MAX];
> >  #define MAX_PANEL_KEYS 12
> >
> >  struct apanel {
> > -       struct input_polled_dev *ipdev;
> > +       struct input_dev *idev;
> >         struct i2c_client *client;
> >         unsigned short keymap[MAX_PANEL_KEYS];
> > -       u16    nkeys;
> > +       u16 nkeys;
> >         struct led_classdev mail_led;
> >  };
> >
> > +static unsigned short apanel_keymap[MAX_PANEL_KEYS] = {
> 
> Could this be const?

Yes, I believe so.

> 
> > +       [0] = KEY_MAIL,
> > +       [1] = KEY_WWW,
> > +       [2] = KEY_PROG2,
> > +       [3] = KEY_PROG1,
> >
> > -static int apanel_probe(struct i2c_client *, const struct i2c_device_id *);
> > +       [8] = KEY_FORWARD,
> > +       [9] = KEY_REWIND,
> > +       [10] = KEY_STOPCD,
> > +       [11] = KEY_PLAYPAUSE,
> > +};
> >
> >  static void report_key(struct input_dev *input, unsigned keycode)
> >  {
> > -       pr_debug(APANEL ": report key %#x\n", keycode);
> > +       dev_dbg(input->dev.parent, "report key %#x\n", keycode);
> >         input_report_key(input, keycode, 1);
> >         input_sync(input);
> >
> > @@ -79,10 +88,9 @@ static void report_key(struct input_dev *input, unsigned keycode)
> >   * CD keys:
> >   * Forward (0x100), Rewind (0x200), Stop (0x400), Pause (0x800)
> >   */
> > -static void apanel_poll(struct input_polled_dev *ipdev)
> > +static void apanel_poll(struct input_dev *idev)
> >  {
> > -       struct apanel *ap = ipdev->private;
> > -       struct input_dev *idev = ipdev->input;
> > +       struct apanel *ap = input_get_drvdata(idev);
> >         u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
> >         s32 data;
> >         int i;
> > @@ -112,126 +120,93 @@ static int mail_led_set(struct led_classdev *led,
> >         return i2c_smbus_write_word_data(ap->client, 0x10, led_bits);
> >  }
> >
> > -static int apanel_remove(struct i2c_client *client)
> > -{
> > -       struct apanel *ap = i2c_get_clientdata(client);
> > -
> > -       if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
> > -               led_classdev_unregister(&ap->mail_led);
> > -
> > -       input_unregister_polled_device(ap->ipdev);
> > -       input_free_polled_device(ap->ipdev);
> > -
> > -       return 0;
> > -}
> > -
> > -static void apanel_shutdown(struct i2c_client *client)
> > -{
> > -       apanel_remove(client);
> > -}
> > -
> > -static const struct i2c_device_id apanel_id[] = {
> > -       { "fujitsu_apanel", 0 },
> > -       { }
> > -};
> > -MODULE_DEVICE_TABLE(i2c, apanel_id);
> > -
> > -static struct i2c_driver apanel_driver = {
> > -       .driver = {
> > -               .name = APANEL,
> > -       },
> > -       .probe          = &apanel_probe,
> > -       .remove         = &apanel_remove,
> > -       .shutdown       = &apanel_shutdown,
> > -       .id_table       = apanel_id,
> > -};
> > -
> > -static struct apanel apanel = {
> > -       .keymap = {
> > -               [0] = KEY_MAIL,
> > -               [1] = KEY_WWW,
> > -               [2] = KEY_PROG2,
> > -               [3] = KEY_PROG1,
> > -
> > -               [8] = KEY_FORWARD,
> > -               [9] = KEY_REWIND,
> > -               [10] = KEY_STOPCD,
> > -               [11] = KEY_PLAYPAUSE,
> > -
> > -       },
> > -       .mail_led = {
> > -               .name = "mail:blue",
> > -               .brightness_set_blocking = mail_led_set,
> > -       },
> > -};
> > -
> > -/* NB: Only one panel on the i2c. */
> >  static int apanel_probe(struct i2c_client *client,
> >                         const struct i2c_device_id *id)
> >  {
> >         struct apanel *ap;
> > -       struct input_polled_dev *ipdev;
> >         struct input_dev *idev;
> >         u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
> > -       int i, err = -ENOMEM;
> > +       int i, err;
> >
> > -       ap = &apanel;
> > +       ap = devm_kzalloc(&client->dev, sizeof(*ap), GFP_KERNEL);
> > +       if (!ap)
> > +               return -ENOMEM;
> >
> > -       ipdev = input_allocate_polled_device();
> > -       if (!ipdev)
> > -               goto out1;
> > +       idev = devm_input_allocate_device(&client->dev);
> > +       if (!idev)
> > +               return -ENOMEM;
> >
> > -       ap->ipdev = ipdev;
> > +       ap->idev = idev;
> >         ap->client = client;
> >
> >         i2c_set_clientdata(client, ap);
> >
> >         err = i2c_smbus_write_word_data(client, cmd, 0);
> >         if (err) {
> > -               dev_warn(&client->dev, APANEL ": smbus write error %d\n",
> > -                        err);
> > -               goto out3;
> > +               dev_warn(&client->dev, "smbus write error %d\n", err);
> > +               return err;
> >         }
> >
> > -       ipdev->poll = apanel_poll;
> > -       ipdev->poll_interval = POLL_INTERVAL_DEFAULT;
> > -       ipdev->private = ap;
> > +       input_set_drvdata(idev, ap);
> >
> > -       idev = ipdev->input;
> >         idev->name = APANEL_NAME " buttons";
> >         idev->phys = "apanel/input0";
> >         idev->id.bustype = BUS_HOST;
> > -       idev->dev.parent = &client->dev;
> > -
> > -       set_bit(EV_KEY, idev->evbit);
> >
> > +       memcpy(ap->keymap, apanel_keymap, sizeof(apanel_keymap));
> >         idev->keycode = ap->keymap;
> >         idev->keycodesize = sizeof(ap->keymap[0]);
> >         idev->keycodemax = (device_chip[APANEL_DEV_CDBTN] != CHIP_NONE) ? 12 : 4;
> >
> > +       set_bit(EV_KEY, idev->evbit);
> >         for (i = 0; i < idev->keycodemax; i++)
> >                 if (ap->keymap[i])
> >                         set_bit(ap->keymap[i], idev->keybit);
> >
> > -       err = input_register_polled_device(ipdev);
> > +       err = input_setup_polling(idev, apanel_poll);
> > +       if (err)
> > +               return err;
> > +
> > +       input_set_poll_interval(idev, POLL_INTERVAL_DEFAULT);
> > +
> > +       err = input_register_device(idev);
> >         if (err)
> > -               goto out3;
> > +               return err;
> >
> >         if (device_chip[APANEL_DEV_LED] != CHIP_NONE) {
> > -               err = led_classdev_register(&client->dev, &ap->mail_led);
> > +               ap->mail_led.name = "mail:blue";
> > +               ap->mail_led.brightness_set_blocking = mail_led_set;
> > +               err = devm_led_classdev_register(&client->dev, &ap->mail_led);
> >                 if (err)
> > -                       goto out4;
> > +                       return err;
> >         }
> >
> >         return 0;
> > -out4:
> > -       input_unregister_polled_device(ipdev);
> > -out3:
> > -       input_free_polled_device(ipdev);
> > -out1:
> > -       return err;
> >  }
> >
> > +static void apanel_shutdown(struct i2c_client *client)
> > +{
> > +       struct apanel *ap = i2c_get_clientdata(client);
> > +
> > +       if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
> > +               led_set_brightness(&ap->mail_led, LED_OFF);
> 
> Is this code required? Doesn't led_class_dev_unregister()
> (automatically called by devm_) switch the led off?
> 
> If it's not required, then the whole shutdown function can
> be removed.

No, it can't as it is not remove() but shutdown() method, the driver is
not being unbound from the device, and devm teardown is not executed
here.

> 
> > +}
> > +
> > +static const struct i2c_device_id apanel_id[] = {
> > +       { "fujitsu_apanel", 0 },
> 
> If the driver_data field of i2c_device_id is unused, would it
> be better to match via apanel_driver.driver.of_match_table ?

This is X86 driver, and the device is instantiated from
drivers/i2c/busses/i2c-i801.c based on DMI match, so using OF is not
really helpful here.

> 
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, apanel_id);
> > +
> > +static struct i2c_driver apanel_driver = {
> > +       .driver = {
> > +               .name = APANEL,
> > +       },
> > +       .probe          = &apanel_probe,
> > +       .shutdown       = &apanel_shutdown,
> 
> The ampersand (&) can be removed.
> I realize that this is just old code that has changed position.

Yeah, I'll drop them.

> 
> > +       .id_table       = apanel_id,
> > +};
> > +
> >  /* Scan the system ROM for the signature "FJKEYINF" */
> >  static __init const void __iomem *bios_signature(const void __iomem *bios)
> >  {
> > --
> > 2.23.0.866.gb869b98d4c-goog
> >

Thanks.

-- 
Dmitry
