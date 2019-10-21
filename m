Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99ECEDF67C
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 22:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfJUUFz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 16:05:55 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41121 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbfJUUFy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 16:05:54 -0400
Received: by mail-ot1-f67.google.com with SMTP id g13so12120968otp.8;
        Mon, 21 Oct 2019 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dqqp7bbA2MQ6v89VSpq+VcDZdSvK0PDO/oPI5vZ7MdE=;
        b=BdOSuzoyMWyofnalHXt7ZN2nibr50akBow62HkFXXdwjTGVolTMeIhIebNYP/Ayzvf
         K8KSsGbxln8PRq3b3tT+ItH8sG784zhJjz7B11f7R+NNMaC18q58CE8XSR9LwHxLYypV
         FkTMkXTcMQ0HYMCejsnb6slcpwzLT+iYyCMQY7w4LFPDS1m+guaXfmpaqEl2t+E5ex9g
         LppkEMjm79hHn1rSFiqiCB7358XR7pgYWcju81AxfB5FfhwNhHOlnzrqFt/vUNeHEUNw
         VEfYkybEHb/zaj9YQp1HbTX0mVCPe7xMRFhWbg1rdiaMehpXxlTFibozOnSWRmT73ch9
         N4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dqqp7bbA2MQ6v89VSpq+VcDZdSvK0PDO/oPI5vZ7MdE=;
        b=HBmzVyq4iH121whe8qmEZ1x3nwusns7SbliQHOs2okJkRUvFs79hQRICPXFV7EQFsM
         nNL2CxmFGfc7PlMgkb62mA87TM6m3yORFyYdJFZuXJDqyvXWmzhQrf56UFTy59S+19Vh
         uFEezzDr0O94/7uHdsLkPQdM57/V9UE7wp9tlpRqi84vx4/4OwgCrZ2cB7XdR3WfSSQj
         KhB0u3EZpG7PcEEuD8Pd4Ms+WBeIjIe4sCJXbB8XsuILe80On65zZqClP91jIyYyN9zx
         D9h7DMIzq0wWx9YDy7pyewE+faMVdfnK+Bzi4L7LN2iX0PIaec5uMTKfFdEwWcdjv8/U
         A4CQ==
X-Gm-Message-State: APjAAAUDaypoSy4VIqoN/eMdUlAJBqBVbquEprxq63nqUoVPsj2gE/XV
        nJjc+SQp7vm1kNsoXhCXw8q/0pQSV+7qOf0NxsY=
X-Google-Smtp-Source: APXvYqx6MAgAQTCeR5NcJy1NLWG5pp31hE700Nr3X5Cj1QplWIyKIc7+5OppnMkaxoEM4Nvi8PIT+dIRpGiWcWMk6oc=
X-Received: by 2002:a9d:630c:: with SMTP id q12mr19789648otk.332.1571688352726;
 Mon, 21 Oct 2019 13:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com> <20191017204217.106453-10-dmitry.torokhov@gmail.com>
In-Reply-To: <20191017204217.106453-10-dmitry.torokhov@gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 21 Oct 2019 16:05:40 -0400
Message-ID: <CAGngYiWq9Xw1MMh6eoFjX0rB8utusK8jNrho59BgHpwUV31e+g@mail.gmail.com>
Subject: Re: [PATCH 09/22] Input: apanel - switch to using polled mode of
 input devices
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Enrico Weigelt <info@metux.net>, Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, a few minor nags below, inline.

On Thu, Oct 17, 2019 at 4:42 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We have added polled mode to the normal input devices with the intent of
> retiring input_polled_dev. This converts apanel driver to use the polling
> mode of standard input devices and removes dependency on INPUT_POLLDEV.
>
> While at it, let's convert the driver to use devm.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
>  drivers/input/misc/Kconfig  |   1 -
>  drivers/input/misc/apanel.c | 153 +++++++++++++++---------------------
>  2 files changed, 64 insertions(+), 90 deletions(-)
>
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 7d9ae394e597..a6b8af69915d 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -257,7 +257,6 @@ config INPUT_MMA8450
>  config INPUT_APANEL
>         tristate "Fujitsu Lifebook Application Panel buttons"
>         depends on X86 && I2C && LEDS_CLASS
> -       select INPUT_POLLDEV
>         select CHECK_SIGNATURE
>         help
>          Say Y here for support of the Application Panel buttons, used on
> diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
> index 53ec40d1b90d..de0deb432fe3 100644
> --- a/drivers/input/misc/apanel.c
> +++ b/drivers/input/misc/apanel.c
> @@ -17,7 +17,7 @@
>  #include <linux/module.h>
>  #include <linux/ioport.h>
>  #include <linux/io.h>
> -#include <linux/input-polldev.h>
> +#include <linux/input.h>
>  #include <linux/i2c.h>
>  #include <linux/leds.h>
>
> @@ -51,19 +51,28 @@ static enum apanel_chip device_chip[APANEL_DEV_MAX];
>  #define MAX_PANEL_KEYS 12
>
>  struct apanel {
> -       struct input_polled_dev *ipdev;
> +       struct input_dev *idev;
>         struct i2c_client *client;
>         unsigned short keymap[MAX_PANEL_KEYS];
> -       u16    nkeys;
> +       u16 nkeys;
>         struct led_classdev mail_led;
>  };
>
> +static unsigned short apanel_keymap[MAX_PANEL_KEYS] = {

Could this be const?

> +       [0] = KEY_MAIL,
> +       [1] = KEY_WWW,
> +       [2] = KEY_PROG2,
> +       [3] = KEY_PROG1,
>
> -static int apanel_probe(struct i2c_client *, const struct i2c_device_id *);
> +       [8] = KEY_FORWARD,
> +       [9] = KEY_REWIND,
> +       [10] = KEY_STOPCD,
> +       [11] = KEY_PLAYPAUSE,
> +};
>
>  static void report_key(struct input_dev *input, unsigned keycode)
>  {
> -       pr_debug(APANEL ": report key %#x\n", keycode);
> +       dev_dbg(input->dev.parent, "report key %#x\n", keycode);
>         input_report_key(input, keycode, 1);
>         input_sync(input);
>
> @@ -79,10 +88,9 @@ static void report_key(struct input_dev *input, unsigned keycode)
>   * CD keys:
>   * Forward (0x100), Rewind (0x200), Stop (0x400), Pause (0x800)
>   */
> -static void apanel_poll(struct input_polled_dev *ipdev)
> +static void apanel_poll(struct input_dev *idev)
>  {
> -       struct apanel *ap = ipdev->private;
> -       struct input_dev *idev = ipdev->input;
> +       struct apanel *ap = input_get_drvdata(idev);
>         u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
>         s32 data;
>         int i;
> @@ -112,126 +120,93 @@ static int mail_led_set(struct led_classdev *led,
>         return i2c_smbus_write_word_data(ap->client, 0x10, led_bits);
>  }
>
> -static int apanel_remove(struct i2c_client *client)
> -{
> -       struct apanel *ap = i2c_get_clientdata(client);
> -
> -       if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
> -               led_classdev_unregister(&ap->mail_led);
> -
> -       input_unregister_polled_device(ap->ipdev);
> -       input_free_polled_device(ap->ipdev);
> -
> -       return 0;
> -}
> -
> -static void apanel_shutdown(struct i2c_client *client)
> -{
> -       apanel_remove(client);
> -}
> -
> -static const struct i2c_device_id apanel_id[] = {
> -       { "fujitsu_apanel", 0 },
> -       { }
> -};
> -MODULE_DEVICE_TABLE(i2c, apanel_id);
> -
> -static struct i2c_driver apanel_driver = {
> -       .driver = {
> -               .name = APANEL,
> -       },
> -       .probe          = &apanel_probe,
> -       .remove         = &apanel_remove,
> -       .shutdown       = &apanel_shutdown,
> -       .id_table       = apanel_id,
> -};
> -
> -static struct apanel apanel = {
> -       .keymap = {
> -               [0] = KEY_MAIL,
> -               [1] = KEY_WWW,
> -               [2] = KEY_PROG2,
> -               [3] = KEY_PROG1,
> -
> -               [8] = KEY_FORWARD,
> -               [9] = KEY_REWIND,
> -               [10] = KEY_STOPCD,
> -               [11] = KEY_PLAYPAUSE,
> -
> -       },
> -       .mail_led = {
> -               .name = "mail:blue",
> -               .brightness_set_blocking = mail_led_set,
> -       },
> -};
> -
> -/* NB: Only one panel on the i2c. */
>  static int apanel_probe(struct i2c_client *client,
>                         const struct i2c_device_id *id)
>  {
>         struct apanel *ap;
> -       struct input_polled_dev *ipdev;
>         struct input_dev *idev;
>         u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
> -       int i, err = -ENOMEM;
> +       int i, err;
>
> -       ap = &apanel;
> +       ap = devm_kzalloc(&client->dev, sizeof(*ap), GFP_KERNEL);
> +       if (!ap)
> +               return -ENOMEM;
>
> -       ipdev = input_allocate_polled_device();
> -       if (!ipdev)
> -               goto out1;
> +       idev = devm_input_allocate_device(&client->dev);
> +       if (!idev)
> +               return -ENOMEM;
>
> -       ap->ipdev = ipdev;
> +       ap->idev = idev;
>         ap->client = client;
>
>         i2c_set_clientdata(client, ap);
>
>         err = i2c_smbus_write_word_data(client, cmd, 0);
>         if (err) {
> -               dev_warn(&client->dev, APANEL ": smbus write error %d\n",
> -                        err);
> -               goto out3;
> +               dev_warn(&client->dev, "smbus write error %d\n", err);
> +               return err;
>         }
>
> -       ipdev->poll = apanel_poll;
> -       ipdev->poll_interval = POLL_INTERVAL_DEFAULT;
> -       ipdev->private = ap;
> +       input_set_drvdata(idev, ap);
>
> -       idev = ipdev->input;
>         idev->name = APANEL_NAME " buttons";
>         idev->phys = "apanel/input0";
>         idev->id.bustype = BUS_HOST;
> -       idev->dev.parent = &client->dev;
> -
> -       set_bit(EV_KEY, idev->evbit);
>
> +       memcpy(ap->keymap, apanel_keymap, sizeof(apanel_keymap));
>         idev->keycode = ap->keymap;
>         idev->keycodesize = sizeof(ap->keymap[0]);
>         idev->keycodemax = (device_chip[APANEL_DEV_CDBTN] != CHIP_NONE) ? 12 : 4;
>
> +       set_bit(EV_KEY, idev->evbit);
>         for (i = 0; i < idev->keycodemax; i++)
>                 if (ap->keymap[i])
>                         set_bit(ap->keymap[i], idev->keybit);
>
> -       err = input_register_polled_device(ipdev);
> +       err = input_setup_polling(idev, apanel_poll);
> +       if (err)
> +               return err;
> +
> +       input_set_poll_interval(idev, POLL_INTERVAL_DEFAULT);
> +
> +       err = input_register_device(idev);
>         if (err)
> -               goto out3;
> +               return err;
>
>         if (device_chip[APANEL_DEV_LED] != CHIP_NONE) {
> -               err = led_classdev_register(&client->dev, &ap->mail_led);
> +               ap->mail_led.name = "mail:blue";
> +               ap->mail_led.brightness_set_blocking = mail_led_set;
> +               err = devm_led_classdev_register(&client->dev, &ap->mail_led);
>                 if (err)
> -                       goto out4;
> +                       return err;
>         }
>
>         return 0;
> -out4:
> -       input_unregister_polled_device(ipdev);
> -out3:
> -       input_free_polled_device(ipdev);
> -out1:
> -       return err;
>  }
>
> +static void apanel_shutdown(struct i2c_client *client)
> +{
> +       struct apanel *ap = i2c_get_clientdata(client);
> +
> +       if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
> +               led_set_brightness(&ap->mail_led, LED_OFF);

Is this code required? Doesn't led_class_dev_unregister()
(automatically called by devm_) switch the led off?

If it's not required, then the whole shutdown function can
be removed.

> +}
> +
> +static const struct i2c_device_id apanel_id[] = {
> +       { "fujitsu_apanel", 0 },

If the driver_data field of i2c_device_id is unused, would it
be better to match via apanel_driver.driver.of_match_table ?

> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, apanel_id);
> +
> +static struct i2c_driver apanel_driver = {
> +       .driver = {
> +               .name = APANEL,
> +       },
> +       .probe          = &apanel_probe,
> +       .shutdown       = &apanel_shutdown,

The ampersand (&) can be removed.
I realize that this is just old code that has changed position.

> +       .id_table       = apanel_id,
> +};
> +
>  /* Scan the system ROM for the signature "FJKEYINF" */
>  static __init const void __iomem *bios_signature(const void __iomem *bios)
>  {
> --
> 2.23.0.866.gb869b98d4c-goog
>
