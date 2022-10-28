Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C56611B52
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 22:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiJ1UB6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 16:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiJ1UB6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 16:01:58 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595921CE3EF;
        Fri, 28 Oct 2022 13:01:53 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id y4so5764168plb.2;
        Fri, 28 Oct 2022 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnCSSRTFA2NmNqJEJNferfulIVkEVxF3XvwvQoKem68=;
        b=GsK84XY/X115nlZfA0opiLeDhBVA4tzfs0HEl1Xtfu+PGLzyOMsFMBhLPAYBXJTwwd
         skbDOqX3BDvAdG4zr5P8cOi1vmmgA45B7sqPp3qKIKeHM2ikavdcXCtsJLe9RB6Z06Cj
         2s7SeZkbUXGZcy3Haul2MR5vCGkHxrUp/cH+U0vW9n2XvoTOpngODe5GCZUd0BAwkIWW
         oWYBQnKQbsxV0M/vCFqsROmcpL7nOznOGMTCkyBONepXEg7nNCMmU/0bfX+Gv6zkwe9t
         jviqrlpJzIxTqmLexylQ+/KINjEUzSAs3E56PADntg7huFyilVW1/GuOQkh1lxT+pwYQ
         Dnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnCSSRTFA2NmNqJEJNferfulIVkEVxF3XvwvQoKem68=;
        b=Nn2IFKvhdXYXJAxjkcv+YdqsKDE8ImJF2Lq9UHjvLRScW7f939xRkhM8wsGXq/xABg
         xP6mS62LsJDKC8ffV/FcRIt9oNtRCuSi+ZKv5rB4aRimyzNUwn+MmGOLiBvZkSz0tr/A
         yb61OIKqQmGEBv23eS4YWpnh9JwTXuyABJNe8acxdkFGymjT/kV448H7IMlcF9Pf4qQA
         Mxensz8M+qZibLXrxRmzks1r9nxJ8NqRiXgaux2KO64AFhBV/Ng8UvTf36xGO+pFLg64
         zFGLcTAVwNyl95jGUZ0Fa6bVDJdT+i9XQHEjpgTyrV/kY7QdAxQjyiID+FfPTz/UNGOZ
         rvbg==
X-Gm-Message-State: ACrzQf1B6AUakTfsgAc7NNhjdDtUFIuoJWwcD6SI1VJnUKXKNcIxh358
        cnwPkmSMsOmAk9JZLS/DyNc=
X-Google-Smtp-Source: AMsMyM7SqLzJgPFpAd9tytoWwPRm9TWgCPyYlP3MSJrQ0jQTjhEkgs/bMmWfVAR58V9wJK7m3Wjv4A==
X-Received: by 2002:a17:902:eb8c:b0:186:de22:9117 with SMTP id q12-20020a170902eb8c00b00186de229117mr658483plg.41.1666987312454;
        Fri, 28 Oct 2022 13:01:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea9a:801b:ed52:2db1])
        by smtp.gmail.com with ESMTPSA id n1-20020a17090a2c8100b0021301a63e86sm4582215pjd.18.2022.10.28.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 13:01:51 -0700 (PDT)
Date:   Fri, 28 Oct 2022 13:01:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com, neil.armstrong@linaro.org, arnd@arndb.de,
        robert.jarzmik@free.fr, Jonathan.Cameron@huawei.com,
        christianshewitt@gmail.com, stano.jakubek@gmail.com,
        rydberg@bitmath.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v3 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <Y1w1LFZz08bKb6jU@google.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
 <20221010153522.17503-4-macroalpha82@gmail.com>
 <87sfjhp9f6.fsf@baylibre.com>
 <SN6PR06MB5342B4732AF2C08686E312B0A5309@SN6PR06MB5342.namprd06.prod.outlook.com>
 <87edut7kfz.fsf@baylibre.com>
 <SN6PR06MB5342910C69D1CE159245C95DA5329@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342910C69D1CE159245C95DA5329@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 28, 2022 at 02:49:18PM -0500, Chris Morgan wrote:
> On Thu, Oct 27, 2022 at 10:13:52AM +0200, Mattijs Korpershoek wrote:
> > On Wed, Oct 26, 2022 at 14:24, Chris Morgan <macromorgan@hotmail.com> wrote:
> > 
> > > On Fri, Oct 21, 2022 at 03:56:29PM +0200, Mattijs Korpershoek wrote:
> > >> Hi Chris,
> > >> 
> > >> Thank you for your patch.
> > >> 
> > >> On Mon, Oct 10, 2022 at 10:35, Chris Morgan <macroalpha82@gmail.com> wrote:
> > >> 
> > >> > From: Chris Morgan <macromorgan@hotmail.com>
> > >> >
> > >> > Add support for the Hynitron cst3xx controller found on devices such
> > >> > as the Anbernic RG353P and RG353V (the Hynitron CST340). This driver
> > >> > was built from sources provided by Hynitron to Anbernic (possibly
> > >> > via Rockchip as an intermediary) and marked as GPLv2 in the code.
> > >> > This driver was written strictly for the cst3xx series, but in
> > >> > most places was left somewhat generic so support could be easily
> > >> > added to other devices in the future.
> > >> >
> > >> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > >> > ---
> > >> >  drivers/input/touchscreen/Kconfig           |  12 +
> > >> >  drivers/input/touchscreen/Makefile          |   1 +
> > >> >  drivers/input/touchscreen/hynitron_cstxxx.c | 508 ++++++++++++++++++++
> > >> >  3 files changed, 521 insertions(+)
> > >> >  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
> > >> >
> > >> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> > >> > index 2d70c945b20a..9a9528e59c36 100644
> > >> > --- a/drivers/input/touchscreen/Kconfig
> > >> > +++ b/drivers/input/touchscreen/Kconfig
> > >> > @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
> > >> >  	  To compile this driver as a module, choose M here: the
> > >> >  	  module will be called hycon-hy46xx.
> > >> >  
> > >> > +config TOUCHSCREEN_HYNITRON_CSTXXX
> > >> > +	tristate "Hynitron touchscreen support"
> > >> > +	depends on I2C
> > >> 
> > >> Since we include linux/of.h, I think we should also add:
> > >> depends on OF
> > >
> > > Thank you, will do and resubmit.
> > >
> > >> 
> > >> There are some small nitpicks below as well.
> > >> 
> > >> With those addressed, please add:
> > >> 
> > >> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> > >> 
> > >> > +	help
> > >> > +	  Say Y here if you have a touchscreen using a Hynitron
> > >> > +	  touchscreen controller.
> > >> > +
> > >> > +	  If unsure, say N.
> > >> > +
> > >> > +	  To compile this driver as a module, choose M here: the
> > >> > +	  module will be called hynitron-cstxxx.
> > >> > +
> > >> >  config TOUCHSCREEN_ILI210X
> > >> >  	tristate "Ilitek ILI210X based touchscreen"
> > >> >  	depends on I2C
> > >> > diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> > >> > index 557f84fd2075..43860ca19b98 100644
> > >> > --- a/drivers/input/touchscreen/Makefile
> > >> > +++ b/drivers/input/touchscreen/Makefile
> > >> > @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> > >> > +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> > >> >  obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
> > >> > diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
> > >> > new file mode 100644
> > >> > index 000000000000..11701ff39eb1
> > >> > --- /dev/null
> > >> > +++ b/drivers/input/touchscreen/hynitron_cstxxx.c
> > >> > @@ -0,0 +1,508 @@
> > >> > +// SPDX-License-Identifier: GPL-2.0-only
> > >> > +/*
> > >> > + *  Driver for Hynitron cstxxx Touchscreen
> > >> > + *
> > >> > + *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
> > >> > + *
> > >> > + *  This code is based on hynitron_core.c authored by Hynitron.
> > >> > + *  Note that no datasheet was available, so much of these registers
> > >> > + *  are undocumented. This is essentially a cleaned-up version of the
> > >> > + *  vendor driver with support removed for hardware I cannot test and
> > >> > + *  device-specific functions replated with generic functions wherever
> > >> > + *  possible.
> > >> > + */
> > >> > +
> > >> > +#include <asm/unaligned.h>
> > >> > +#include <linux/delay.h>
> > >> > +#include <linux/gpio.h>
> > >> > +#include <linux/i2c.h>
> > >> > +#include <linux/input.h>
> > >> > +#include <linux/input/mt.h>
> > >> > +#include <linux/input/touchscreen.h>
> > >> > +#include <linux/module.h>
> > >> > +#include <linux/of.h>
> > >> > +#include <linux/of_device.h>
> > >> > +
> > >> > +/* Per chip data */
> > >> > +struct hynitron_ts_chip_data {
> > >> > +	unsigned int max_touch_num;
> > >> > +	u32 ic_chkcode;
> > >> > +	int (*firmware_info)(struct i2c_client *client);
> > >> > +	int (*bootloader_enter)(struct i2c_client *client);
> > >> > +	int (*init_input)(struct i2c_client *client);
> > >> > +	void (*report_touch)(struct i2c_client *client);
> > >> > +};
> > >> > +
> > >> > +/* Data generic to all (supported and non-supported) controllers. */
> > >> > +struct hynitron_ts_data {
> > >> > +	const struct hynitron_ts_chip_data *pdata;
> > >> > +	struct i2c_client *client;
> > >> > +	struct input_dev *input_dev;
> > >> > +	struct touchscreen_properties prop;
> > >> > +	struct gpio_desc *reset_gpio;
> > >> > +	struct gpio_desc *irq_gpio;
> > >> > +};
> > >> > +
> > >> > +/*
> > >> > + * Since I have no datasheet, these values are guessed and/or assumed
> > >> > + * based on observation and testing.
> > >> > + */
> > >> > +#define CST3XX_FIRMWARE_INFO_START_CMD		0x01d1
> > >> > +#define CST3XX_FIRMWARE_INFO_END_CMD		0x09d1
> > >> > +#define CST3XX_FIRMWARE_CHK_CODE_REG		0xfcd1
> > >> > +#define CST3XX_FIRMWARE_VERSION_REG		0x08d2
> > >> > +#define CST3XX_FIRMWARE_VER_INVALID_VAL		0xa5a5a5a5
> > >> > +
> > >> > +#define CST3XX_BOOTLDR_PROG_CMD			0xaa01a0
> > >> > +#define CST3XX_BOOTLDR_PROG_CHK_REG		0x02a0
> > >> > +#define CST3XX_BOOTLDR_CHK_VAL			0xac
> > >> > +
> > >> > +#define CST3XX_TOUCH_DATA_PART_REG		0x00d0
> > >> > +#define CST3XX_TOUCH_DATA_FULL_REG		0x07d0
> > >> > +#define CST3XX_TOUCH_DATA_CHK_VAL		0xab
> > >> > +#define CST3XX_TOUCH_DATA_TOUCH_VAL		0x03
> > >> > +#define CST3XX_TOUCH_DATA_STOP_CMD		0xab00d0
> > >> > +#define CST3XX_TOUCH_COUNT_MASK			GENMASK(6, 0)
> > >> > +
> > >> > +
> > >> > +/*
> > >> > + * Hard coded reset delay value of 20ms not IC dependent in
> > >> > + * vendor driver.
> > >> > + */
> > >> > +static void hyn_reset_proc(struct i2c_client *client, int delay)
> > >> > +{
> > >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > >> > +
> > >> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> > >> > +	mdelay(20);
> > >> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> > >> > +	if (delay)
> > >> > +		mdelay(delay);
> > >> > +}
> > >> > +
> > >> > +static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
> > >> > +{
> > >> > +	struct i2c_client *client = dev_id;
> > >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > >> > +
> > >> > +	ts_data->pdata->report_touch(client);
> > >> > +
> > >> > +	return IRQ_HANDLED;
> > >> > +}
> > >> > +
> > >> > +/*
> > >> > + * The vendor driver would retry twice before failing to read or write
> > >> > + * to the i2c device.
> > >> > + */
> > >> > +
> > >> > +static int cst3xx_i2c_write(struct i2c_client *client,
> > >> > +			    unsigned char *buf, int len)
> > >> > +{
> > >> > +	int ret;
> > >> > +	int retries = 0;
> > >> > +
> > >> > +	while (retries < 2) {
> > >> > +		ret = i2c_master_send(client, buf, len);
> > >> > +		if (ret == len)
> > >> > +			return 0;
> > >> > +		if (ret <= 0)
> > >> > +			retries++;
> > >> > +		else
> > >> > +			break;
> > >> > +	}
> > >> > +
> > >> > +	return ret < 0 ? ret : -EIO;
> > >> > +}
> > >> > +
> > >> > +static int cst3xx_i2c_read_register(struct i2c_client *client, u16 reg,
> > >> > +				    u8 *val, u16 len)
> > >> > +{
> > >> > +	__le16 buf = cpu_to_le16(reg);
> > >> > +	struct i2c_msg msgs[] = {
> > >> > +		{
> > >> > +			.addr = client->addr,
> > >> > +			.flags = 0,
> > >> > +			.len = 2,
> > >> > +			.buf = (u8 *)&buf,
> > >> > +		},
> > >> > +		{
> > >> > +			.addr = client->addr,
> > >> > +			.flags = I2C_M_RD,
> > >> > +			.len = len,
> > >> > +			.buf = val,
> > >> > +		}
> > >> > +	};
> > >> > +	int ret;
> > >> > +
> > >> > +	ret = i2c_transfer(client->adapter, msgs, 2);
> > >> > +	if (ret >= 0)
> > >> > +		ret = (ret == ARRAY_SIZE(msgs) ? 0 : -EIO);
> > >> > +
> > >> > +	if (ret)
> > >> > +		dev_err(&client->dev,
> > >> > +			"Error reading %d bytes from 0x%04x: %d\n",
> > >> > +			len, reg, ret);
> > >> 
> > >> This could be a single line, since column limit is 100chars now. This
> > >> applies for a lot of other wrapped lines in this file.
> > >> 
> > >> Please consider joining such lines to reduce the overall line count.
> > >
> > > I want to confirm everyone else is okay with this change. While the
> > > column limit was changed to 100, some subsystems still prefer the old
> > > 80 limit. If everyone is okay with 100 I can do that, I just want to
> > > be sure.
> > 
> > I think it's fine:
> > $ find drivers/input -name '*.c' -exec wc -L {} + | sort -rh
> >  198 total
> >     198 drivers/input/mouse/synaptics.c
> >     182 drivers/input/serio/i8042.c
> >     167 drivers/input/keyboard/applespi.c
> >     152 drivers/input/mouse/alps.c
> >     151 drivers/input/mouse/elantech.c
> >     133 drivers/input/mouse/elan_i2c_core.c
> >     133 drivers/input/joystick/grip.c
> >     133 drivers/input/joystick/adi.c
> >     132 drivers/input/joystick/gf2k.c
> >     132 drivers/input/joystick/gamecon.c
> >     131 drivers/input/joystick/a3d.c
> >     130 drivers/input/joystick/cobra.c
> > // ... snipp ...
> > 
> > I've also had some review on this on a previous driver i submitted here:
> > https://lore.kernel.org/all/YfK4UcuCfF7JfI7H@smile.fi.intel.com/
> > 
> > But let's wait for others to chime in. Again, this is more of a nitpick
> > so if you'd prefer to keep at 80chars that's fine to me as well.
> > 
> 
> I'll keep it at 80 for now,

Yes, please, I am not quite ready to venture into the new world of
100-character lines. The examples of exceeding 80 columns in the drivers
are pretty much limited to the message strings which we normally do not
break so that they can be grepped for easily.

Thanks.

-- 
Dmitry
