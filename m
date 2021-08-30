Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015F13FB2EA
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 11:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbhH3JMg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 05:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbhH3JMg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 05:12:36 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D6CC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 02:11:43 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id gf5so7860812qvb.9
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 02:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cG/bz18/rNq8FFUj4gfbo6g0Na7vsesPBJdEUQklQuQ=;
        b=X29/s40PpzuSbr6sG1Belj2XdgwtCv9UyezJmr1Aq7yt6q6i5kgA3mPA2XuCCBsHiN
         4m7KThO5htA8DYVeflo31ZJonkpakEULA5FfS2TOz0yEJ6ZadfogkRGLf/8RM115iAZ/
         C4EuzDEBFUiekIv4ZICGe3xCvKbeFqmvydVmTzOJbLO+iTyjD9OYYgbmK+2mbhYXmZq/
         RUcgK1WAo15XJBkegB5Be9qc/MscoEjbdGyeCSysS3C+J5kflSDJWZiYtmRgnP5A/eYn
         Qhn/yYYrSofnSsgayoWWIe0hVlgImmZV9LlgKZSLvkM8Z4r+iiDfnAvnMDR65nUZf/Qw
         rohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cG/bz18/rNq8FFUj4gfbo6g0Na7vsesPBJdEUQklQuQ=;
        b=sRP7gDGkiCp0N/TY14G2AGqh4bkJ+DD3EEyatWqivdBEKHJpvtDGxhC3Eo2dFTwFNi
         HluNZ5LLl5MwJxfIgMtr8vdWFbWAFAfJUinVfSpCWjg/ZCXQu6gIJJ2MWZTeUC2Qzt0O
         ml5gGw2l041b6Vu7Z3q6F84KaD8INIrqPUODajakhmOP4Xvo94S+ygtZtL9OcduDB7tw
         qMk26oUEY7n3EN4gCP+eKinJraByQvQ6FpQLkkK5rWrMN4pqncSGE50RmwVkAN9/B3Tx
         ShBcJa0V6Mu8XSAOC5CXGLoh7MGvtpseYYTrZHXoCxGqbieU/L367esJUZ+Aon0Kkn1D
         BYdw==
X-Gm-Message-State: AOAM532OZRPfgXfO8EC7wZxfRHQp/lu+CeoWu2VIu1so+yk+6toFpQQY
        CmwDqmiHUTvENP2NhTkF9qEhaDVm1f/6beLMFfU=
X-Google-Smtp-Source: ABdhPJy5pOq79L4uVJcHMzlH5F+J2aYYmDOeVj1oCtt/g5EI0Fz9STv9SaOCHF6B/8ssFSyKkvIvqiNLZGtDJjfQGlw=
X-Received: by 2002:a05:6214:3008:: with SMTP id ke8mr13951418qvb.17.1630314701097;
 Mon, 30 Aug 2021 02:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210818152743.163929-1-tobias.junghans@inhub.de>
 <20210818152743.163929-2-tobias.junghans@inhub.de> <CALUj-gtmN70HwzvtsO7rss0LXboFC0h9Dgfakt6UEvC_6FdAwA@mail.gmail.com>
 <3135482.aeNJFYEL58@306e6e011c15>
In-Reply-To: <3135482.aeNJFYEL58@306e6e011c15>
From:   rishi gupta <gupt21@gmail.com>
Date:   Mon, 30 Aug 2021 14:41:29 +0530
Message-ID: <CALUj-gt65tjukmJpuqQL5_L7MgewUmstp68MhuSa53FCaf1Few@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
To:     Tobias Junghans <tobias.junghans@inhub.de>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tobias,

To me it sounds like we are discussing about commercial product
(predefined internal flash fw) v/s prototype (we want to play with
settings at runtime with ease).

Let us assume a GPx pin is configured as input and pulled up in
hardware board originally. A microcontroller's GPIO is configured as
output and connected to this GPx on MCP2221.
MCP2221 (GPx, input, pulled up) <----------- (output, no pull up/down)
STM32 Microcontroller

1. The STM32 Microcontroller drives this pin and set it to logic low
2. Driver using this patch configure this GPIO on mcp2221 end as
output and drives it to logic high
It is like two devices trying to drive same (physical wire) GPIO pin
at the same time. How we plan to handle this.

Will the GPx side will fuse or malfunction because of infinite current flow ?

Regards,
Rishi


On Fri, Aug 20, 2021 at 12:48 PM Tobias Junghans
<tobias.junghans@inhub.de> wrote:
>
> Hi Rishi,
>
> the use case is to use/control the GPIOs of the MCP2221 without the need to
> previously configure the GP pins manually by reprogramming the internal flash
> (what tool would you use for this BTW?). Here we initially had a hard time to
> make the GPIOs of the MCP2221 work (besides the missing HIDRAW support causing
> a NULL pointer dereference, see my previous patch). All we got was "no such
> file or directory" when trying to use/control the GPIOs, no matter whether via
> gpioset or through sysfs. Only after diving into the source code and the
> datasheet we realized -ENOENT was coming from a missing configuration of the GP
> pins so that's why I started implementing the missing pieces.
>
> Long story short: as a user I expect that a pin acts as a GPIO as soon as the
> corresponding GPIO line is actively requested (via libgpiod or sysfs export).
> There's no reason to keep the settings for a GP pin at an alternate function
> if the user wishes to use it as a GPIO. If the user does not request the GPIO
> line, all settings remain unchanged when using the driver (e.g. for I2C
> access).
>
> Best regards
>
> Tobias
>
>
> On 2021/08/19 17:29:14 CEST rishi gupta wrote:
> > Thanks Tobias for the patch.
> > I am just wondering what is the use case for this.
> >
> > On Wed, Aug 18, 2021, 8:58 PM Tobias Junghans <tobias.junghans@inhub.de>
> >
> > wrote:
> > > Per default the GP pins of an MCP2221 are designated to a certain
> > > dedicated or alternate function. While it's possible to change these
> > > defaults by manually updating the internal flash, it's much more
> > > convenient and safe to configure the GP pins as GPIOs automatically
> > > at runtime whenever the corresponding GPIO line is requested. The
> > > previous setting is restored as soon as the GPIO line is freed again.
> > >
> > > Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
> > > ---
> > >
> > >  drivers/hid/hid-mcp2221.c | 142 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 142 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > > index 8e54173b195c..0f2345bd065f 100644
> > > --- a/drivers/hid/hid-mcp2221.c
> > > +++ b/drivers/hid/hid-mcp2221.c
> > > @@ -30,6 +30,8 @@ enum {
> > >
> > >         MCP2221_I2C_CANCEL = 0x10,
> > >         MCP2221_GPIO_SET = 0x50,
> > >         MCP2221_GPIO_GET = 0x51,
> > >
> > > +       MCP2221_SRAM_SETTINGS_SET = 0x60,
> > > +       MCP2221_SRAM_SETTINGS_GET = 0x61,
> > >
> > >  };
> > >
> > >  /* Response codes in a raw input report */
> > >
> > > @@ -56,6 +58,7 @@ enum {
> > >
> > >  };
> > >
> > >  #define MCP_NGPIO      4
> > >
> > > +#define MCP_PASSWD_LEN 8
> > >
> > >  /* MCP GPIO set command layout */
> > >  struct mcp_set_gpio {
> > >
> > > @@ -79,6 +82,49 @@ struct mcp_get_gpio {
> > >
> > >         } gpio[MCP_NGPIO];
> > >
> > >  } __packed;
> > >
> > > +/* MCP GP settings */
> > > +enum {
> > > +       MCP2221_GP_FUNC_GPIO = 0x00, /* GPIO operation */
> > > +       MCP2221_GP_FUNC_DEDICATED = 0x01, /* dedicated function operation
> > > */
> > > +       MCP2221_GP_FUNC_ALT0 = 0x02, /* alternate function 0 */
> > > +       MCP2221_GP_FUNC_ALT1 = 0x03, /* alternate function 1 */
> > > +       MCP2221_GP_FUNC_ALT2 = 0x04, /* alternate function 2 */
> > > +       MCP2221_GP_GPIO_DIR_IN = 0x08, /* GPIO input mode */
> > > +       MCP2221_GP_GPIO_OUT_VALUE = 0x10, /* GPIO output value */
> > > +};
> > > +
> > > +/* MCP SRAM settings set command layout */
> > > +struct mcp_set_sram_settings {
> > > +       u8 cmd;
> > > +       u8 dummy;
> > > +       u8 clk_out_div;
> > > +       u8 dac_voltage_ref;
> > > +       u8 dac_output_value;
> > > +       u8 adc_voltage_ref;
> > > +       u8 interrupt_detection;
> > > +       u8 alter_gp_settings;
> > > +       u8 gp_settings[MCP_NGPIO];
> > > +} __packed;
> > > +
> > > +/* MCP SRAM settings set command layout */
> > > +struct mcp_get_sram_settings {
> > > +       u8 cmd;
> > > +       u8 dummy;
> > > +       u8 len_chip_settings;
> > > +       u8 len_gp_settings;
> > > +       u8 init_values;
> > > +       u8 clk_out_div;
> > > +       u8 dac_settings;
> > > +       u8 interrupt_adc_settings;
> > > +       u16 usb_vid;
> > > +       u16 usb_pid;
> > > +       u8 usb_pwr_attrs;
> > > +       u8 usb_req_current;
> > > +       u8 password[MCP_PASSWD_LEN];
> > > +       u8 gp_settings[MCP_NGPIO];
> > > +} __packed;
> > > +
> > > +
> > >
> > >  /*
> > >
> > >   * There is no way to distinguish responses. Therefore next command
> > >   * is sent only after response to previous has been received. Mutex
> > >
> > > @@ -97,6 +143,8 @@ struct mcp2221 {
> > >
> > >         struct gpio_chip *gc;
> > >         u8 gp_idx;
> > >         u8 gpio_dir;
> > >
> > > +       u8 gp_default_settings[MCP_NGPIO];
> > > +       u8 gp_runtime_settings[MCP_NGPIO];
> > >
> > >  };
> > >
> > >  /*
> > >
> > > @@ -668,6 +716,63 @@ static int mcp_gpio_get_direction(struct gpio_chip
> > > *gc,
> > >
> > >         return GPIO_LINE_DIRECTION_OUT;
> > >
> > >  }
> > >
> > > +static int mcp_get_gp_default_settings(struct mcp2221 *mcp)
> > > +{
> > > +       int ret;
> > > +
> > > +       mcp->txbuf[0] = MCP2221_SRAM_SETTINGS_GET;
> > > +
> > > +       mutex_lock(&mcp->lock);
> > > +       ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
> > > +       mutex_unlock(&mcp->lock);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int mcp_configure_gp(struct mcp2221 *mcp, unsigned int offset, u8
> > > val)
> > > +{
> > > +       int ret;
> > > +
> > > +       memset(mcp->txbuf, 0, sizeof(struct mcp_set_sram_settings));
> > > +
> > > +       mcp->txbuf[0] = MCP2221_SRAM_SETTINGS_SET;
> > > +       mcp->txbuf[offsetof(struct mcp_set_sram_settings,
> > > alter_gp_settings)] = 0x80;
> > > +
> > > +       mcp->gp_runtime_settings[offset] = val;
> > > +       mcp->gp_idx = offsetof(struct mcp_set_sram_settings,
> > > gp_settings[0]);
> > > +       memcpy(&mcp->txbuf[mcp->gp_idx], mcp->gp_runtime_settings,
> > > +                       sizeof(mcp->gp_runtime_settings));
> > > +
> > > +       mutex_lock(&mcp->lock);
> > > +       ret = mcp_send_data_req_status(mcp, mcp->txbuf, sizeof(struct
> > > mcp_set_sram_settings));
> > > +       mutex_unlock(&mcp->lock);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int mcp_gpio_request(struct gpio_chip *gc, unsigned int offset)
> > > +{
> > > +       int ret;
> > > +       struct mcp2221 *mcp = gpiochip_get_data(gc);
> > > +
> > > +       ret = mcp_configure_gp(mcp, offset, MCP2221_GP_FUNC_GPIO |
> > > +                                       MCP2221_GP_GPIO_DIR_IN);
> > > +       if (ret) {
> > > +               hid_err(mcp->hdev, "failed to set GP function\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static void mcp_gpio_free(struct gpio_chip *gc, unsigned int offset)
> > > +{
> > > +       struct mcp2221 *mcp = gpiochip_get_data(gc);
> > > +
> > > +       if (mcp_configure_gp(mcp, offset,
> > > mcp->gp_default_settings[offset]))
> > > +               hid_warn(mcp->hdev, "failed to restore GP function\n");
> > > +}
> > > +
> > >
> > >  /* Gives current state of i2c engine inside mcp2221 */
> > >  static int mcp_get_i2c_eng_state(struct mcp2221 *mcp,
> > >
> > >                                 u8 *data, u8 idx)
> > >
> > > @@ -813,6 +918,28 @@ static int mcp2221_raw_event(struct hid_device *hdev,
> > >
> > >                 complete(&mcp->wait_in_report);
> > >                 break;
> > >
> > > +       case MCP2221_SRAM_SETTINGS_GET:
> > > +               if (data[1] == MCP2221_SUCCESS) {
> > > +                       int offset = offsetof(struct
> > > mcp_get_sram_settings, gp_settings[0]);
> > > +
> > > +                       memcpy(mcp->gp_default_settings, &data[offset],
> > > +
> > >
> > >  sizeof(mcp->gp_default_settings));
> > >
> > > +                       mcp->status = 0;
> > > +               } else {
> > > +                       mcp->status = -EIO;
> > > +               }
> > > +               complete(&mcp->wait_in_report);
> > > +               break;
> > > +
> > > +       case MCP2221_SRAM_SETTINGS_SET:
> > > +               if (data[1] == MCP2221_SUCCESS)
> > > +                       mcp->status = 0;
> > > +               else
> > > +                       mcp->status = -EIO;
> > > +
> > > +               complete(&mcp->wait_in_report);
> > > +               break;
> > > +
> > >
> > >         default:
> > >                 mcp->status = -EIO;
> > >                 complete(&mcp->wait_in_report);
> > >
> > > @@ -890,6 +1017,8 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >
> > >         mcp->gc->get_direction = mcp_gpio_get_direction;
> > >         mcp->gc->set = mcp_gpio_set;
> > >         mcp->gc->get = mcp_gpio_get;
> > >
> > > +       mcp->gc->request = mcp_gpio_request;
> > > +       mcp->gc->free = mcp_gpio_free;
> > >
> > >         mcp->gc->ngpio = MCP_NGPIO;
> > >         mcp->gc->base = -1;
> > >         mcp->gc->can_sleep = 1;
> > >
> > > @@ -902,6 +1031,19 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >
> > >         if (ret)
> > >
> > >                 goto err_gc;
> > >
> > > +       hid_device_io_start(hdev);
> > > +       ret = mcp_get_gp_default_settings(mcp);
> > > +       hid_device_io_stop(hdev);
> > > +
> > > +       if (ret) {
> > > +               hid_err(mcp->hdev, "failed to get GP default settings\n");
> > > +               ret = -EIO;
> > > +               goto err_gc;
> > > +       }
> > > +
> > > +       memcpy(mcp->gp_runtime_settings, mcp->gp_default_settings,
> > > +                                       sizeof(mcp->gp_default_settings));
> > > +
> > >
> > >         return 0;
> > >
> > >  err_gc:
> > > --
> > > 2.25.1
>
>
>
