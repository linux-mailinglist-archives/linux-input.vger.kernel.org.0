Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3AF60F1F8
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 10:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbiJ0IOA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 04:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiJ0IN6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 04:13:58 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0C612740A
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 01:13:55 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id y10so421803wma.0
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 01:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMZgSQz/93sl+fi4G10+hVGbuc6bSskFuYDA1kMMUZc=;
        b=cN5XtbbiBLoOqt/BddSBmYEKOIHqoh4o8PJpI+bURyBHN5px04VWtGSQZ5gYbqHxzQ
         jIb/45UUL5Y7Jb3wFM8XK77JAkNyqN2MhzCLIf/CJ5k29TyIocGilbxs8jfTgagJX7gV
         PHfRn2cWkv9SNXsxyv3fKu+aE0Rb+PmDaS0iadJYKHHWwfPWu2weFvCKOeu9NHTVwfLN
         Cav/RQQu0r7BnnDnIp/d0hT1USaFdMPjqY1COYe02ENOyUZHc743ISoTKnz2zNRujn9m
         HN+TE1T7WzHHngr7Sb38pe3DVyIKK3VtwAHm0a+EDkrwH/Z6jjexG1OHwt46z3KyxvNK
         QClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMZgSQz/93sl+fi4G10+hVGbuc6bSskFuYDA1kMMUZc=;
        b=DZu4Bm/LIjztrDxhQO0bg9xL6Cj1PByKNHAfNEA8jK3TSx19bQGVGVCCB/ALd9Yx4o
         okDFDMdRkL9d0R44UiK3XuKgONz9eD9o2K1tvgv2J40vy/j0/lSlF+aHjuNXOhAEtQ+E
         OEqTzCazjX9BBijs+43BqYxJQnOfe//THuZVXFxVOyechr/GZTPH2+XpvtLN/nZpKxnK
         4aTrGaaiA9B1Q7uXXGKIwoimX9OV8dD+kj+5lFPewVUWZDBd5Gjx6CANBO/eXuPrtW+D
         KXh9mOyRSUu0tkVnSGvEbYgeGgnqacZdZOnnPC8mxaQddZLzL1FZGh/py6uwKTeUi3Fb
         chPw==
X-Gm-Message-State: ACrzQf0VyUKWfL0wa/SphYWOyKuwC7AxRDYhuT4lP+P3QQ5aGEqEYVKl
        79myib6xdNFx10S+n46q/kokcg==
X-Google-Smtp-Source: AMsMyM4hdDl6+iuP+zGMUye1BooVhK0HP3YJ9IqPPkhDf3ypPd4TalUIffe0m8mqAXtp7KrzbjnGng==
X-Received: by 2002:a7b:c851:0:b0:3c7:84d:57b with SMTP id c17-20020a7bc851000000b003c7084d057bmr5122212wml.40.1666858433765;
        Thu, 27 Oct 2022 01:13:53 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id m18-20020adfe952000000b002368f6b56desm648905wrn.18.2022.10.27.01.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:13:53 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH v3 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
In-Reply-To: <SN6PR06MB5342B4732AF2C08686E312B0A5309@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
 <20221010153522.17503-4-macroalpha82@gmail.com>
 <87sfjhp9f6.fsf@baylibre.com>
 <SN6PR06MB5342B4732AF2C08686E312B0A5309@SN6PR06MB5342.namprd06.prod.outlook.com>
Date:   Thu, 27 Oct 2022 10:13:52 +0200
Message-ID: <87edut7kfz.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 26, 2022 at 14:24, Chris Morgan <macromorgan@hotmail.com> wrote:

> On Fri, Oct 21, 2022 at 03:56:29PM +0200, Mattijs Korpershoek wrote:
>> Hi Chris,
>> 
>> Thank you for your patch.
>> 
>> On Mon, Oct 10, 2022 at 10:35, Chris Morgan <macroalpha82@gmail.com> wrote:
>> 
>> > From: Chris Morgan <macromorgan@hotmail.com>
>> >
>> > Add support for the Hynitron cst3xx controller found on devices such
>> > as the Anbernic RG353P and RG353V (the Hynitron CST340). This driver
>> > was built from sources provided by Hynitron to Anbernic (possibly
>> > via Rockchip as an intermediary) and marked as GPLv2 in the code.
>> > This driver was written strictly for the cst3xx series, but in
>> > most places was left somewhat generic so support could be easily
>> > added to other devices in the future.
>> >
>> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> > ---
>> >  drivers/input/touchscreen/Kconfig           |  12 +
>> >  drivers/input/touchscreen/Makefile          |   1 +
>> >  drivers/input/touchscreen/hynitron_cstxxx.c | 508 ++++++++++++++++++++
>> >  3 files changed, 521 insertions(+)
>> >  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
>> >
>> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
>> > index 2d70c945b20a..9a9528e59c36 100644
>> > --- a/drivers/input/touchscreen/Kconfig
>> > +++ b/drivers/input/touchscreen/Kconfig
>> > @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
>> >  	  To compile this driver as a module, choose M here: the
>> >  	  module will be called hycon-hy46xx.
>> >  
>> > +config TOUCHSCREEN_HYNITRON_CSTXXX
>> > +	tristate "Hynitron touchscreen support"
>> > +	depends on I2C
>> 
>> Since we include linux/of.h, I think we should also add:
>> depends on OF
>
> Thank you, will do and resubmit.
>
>> 
>> There are some small nitpicks below as well.
>> 
>> With those addressed, please add:
>> 
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> 
>> > +	help
>> > +	  Say Y here if you have a touchscreen using a Hynitron
>> > +	  touchscreen controller.
>> > +
>> > +	  If unsure, say N.
>> > +
>> > +	  To compile this driver as a module, choose M here: the
>> > +	  module will be called hynitron-cstxxx.
>> > +
>> >  config TOUCHSCREEN_ILI210X
>> >  	tristate "Ilitek ILI210X based touchscreen"
>> >  	depends on I2C
>> > diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
>> > index 557f84fd2075..43860ca19b98 100644
>> > --- a/drivers/input/touchscreen/Makefile
>> > +++ b/drivers/input/touchscreen/Makefile
>> > @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
>> >  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
>> >  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
>> >  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
>> > +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>> >  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
>> >  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
>> >  obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
>> > diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
>> > new file mode 100644
>> > index 000000000000..11701ff39eb1
>> > --- /dev/null
>> > +++ b/drivers/input/touchscreen/hynitron_cstxxx.c
>> > @@ -0,0 +1,508 @@
>> > +// SPDX-License-Identifier: GPL-2.0-only
>> > +/*
>> > + *  Driver for Hynitron cstxxx Touchscreen
>> > + *
>> > + *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
>> > + *
>> > + *  This code is based on hynitron_core.c authored by Hynitron.
>> > + *  Note that no datasheet was available, so much of these registers
>> > + *  are undocumented. This is essentially a cleaned-up version of the
>> > + *  vendor driver with support removed for hardware I cannot test and
>> > + *  device-specific functions replated with generic functions wherever
>> > + *  possible.
>> > + */
>> > +
>> > +#include <asm/unaligned.h>
>> > +#include <linux/delay.h>
>> > +#include <linux/gpio.h>
>> > +#include <linux/i2c.h>
>> > +#include <linux/input.h>
>> > +#include <linux/input/mt.h>
>> > +#include <linux/input/touchscreen.h>
>> > +#include <linux/module.h>
>> > +#include <linux/of.h>
>> > +#include <linux/of_device.h>
>> > +
>> > +/* Per chip data */
>> > +struct hynitron_ts_chip_data {
>> > +	unsigned int max_touch_num;
>> > +	u32 ic_chkcode;
>> > +	int (*firmware_info)(struct i2c_client *client);
>> > +	int (*bootloader_enter)(struct i2c_client *client);
>> > +	int (*init_input)(struct i2c_client *client);
>> > +	void (*report_touch)(struct i2c_client *client);
>> > +};
>> > +
>> > +/* Data generic to all (supported and non-supported) controllers. */
>> > +struct hynitron_ts_data {
>> > +	const struct hynitron_ts_chip_data *pdata;
>> > +	struct i2c_client *client;
>> > +	struct input_dev *input_dev;
>> > +	struct touchscreen_properties prop;
>> > +	struct gpio_desc *reset_gpio;
>> > +	struct gpio_desc *irq_gpio;
>> > +};
>> > +
>> > +/*
>> > + * Since I have no datasheet, these values are guessed and/or assumed
>> > + * based on observation and testing.
>> > + */
>> > +#define CST3XX_FIRMWARE_INFO_START_CMD		0x01d1
>> > +#define CST3XX_FIRMWARE_INFO_END_CMD		0x09d1
>> > +#define CST3XX_FIRMWARE_CHK_CODE_REG		0xfcd1
>> > +#define CST3XX_FIRMWARE_VERSION_REG		0x08d2
>> > +#define CST3XX_FIRMWARE_VER_INVALID_VAL		0xa5a5a5a5
>> > +
>> > +#define CST3XX_BOOTLDR_PROG_CMD			0xaa01a0
>> > +#define CST3XX_BOOTLDR_PROG_CHK_REG		0x02a0
>> > +#define CST3XX_BOOTLDR_CHK_VAL			0xac
>> > +
>> > +#define CST3XX_TOUCH_DATA_PART_REG		0x00d0
>> > +#define CST3XX_TOUCH_DATA_FULL_REG		0x07d0
>> > +#define CST3XX_TOUCH_DATA_CHK_VAL		0xab
>> > +#define CST3XX_TOUCH_DATA_TOUCH_VAL		0x03
>> > +#define CST3XX_TOUCH_DATA_STOP_CMD		0xab00d0
>> > +#define CST3XX_TOUCH_COUNT_MASK			GENMASK(6, 0)
>> > +
>> > +
>> > +/*
>> > + * Hard coded reset delay value of 20ms not IC dependent in
>> > + * vendor driver.
>> > + */
>> > +static void hyn_reset_proc(struct i2c_client *client, int delay)
>> > +{
>> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
>> > +
>> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
>> > +	mdelay(20);
>> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
>> > +	if (delay)
>> > +		mdelay(delay);
>> > +}
>> > +
>> > +static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
>> > +{
>> > +	struct i2c_client *client = dev_id;
>> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
>> > +
>> > +	ts_data->pdata->report_touch(client);
>> > +
>> > +	return IRQ_HANDLED;
>> > +}
>> > +
>> > +/*
>> > + * The vendor driver would retry twice before failing to read or write
>> > + * to the i2c device.
>> > + */
>> > +
>> > +static int cst3xx_i2c_write(struct i2c_client *client,
>> > +			    unsigned char *buf, int len)
>> > +{
>> > +	int ret;
>> > +	int retries = 0;
>> > +
>> > +	while (retries < 2) {
>> > +		ret = i2c_master_send(client, buf, len);
>> > +		if (ret == len)
>> > +			return 0;
>> > +		if (ret <= 0)
>> > +			retries++;
>> > +		else
>> > +			break;
>> > +	}
>> > +
>> > +	return ret < 0 ? ret : -EIO;
>> > +}
>> > +
>> > +static int cst3xx_i2c_read_register(struct i2c_client *client, u16 reg,
>> > +				    u8 *val, u16 len)
>> > +{
>> > +	__le16 buf = cpu_to_le16(reg);
>> > +	struct i2c_msg msgs[] = {
>> > +		{
>> > +			.addr = client->addr,
>> > +			.flags = 0,
>> > +			.len = 2,
>> > +			.buf = (u8 *)&buf,
>> > +		},
>> > +		{
>> > +			.addr = client->addr,
>> > +			.flags = I2C_M_RD,
>> > +			.len = len,
>> > +			.buf = val,
>> > +		}
>> > +	};
>> > +	int ret;
>> > +
>> > +	ret = i2c_transfer(client->adapter, msgs, 2);
>> > +	if (ret >= 0)
>> > +		ret = (ret == ARRAY_SIZE(msgs) ? 0 : -EIO);
>> > +
>> > +	if (ret)
>> > +		dev_err(&client->dev,
>> > +			"Error reading %d bytes from 0x%04x: %d\n",
>> > +			len, reg, ret);
>> 
>> This could be a single line, since column limit is 100chars now. This
>> applies for a lot of other wrapped lines in this file.
>> 
>> Please consider joining such lines to reduce the overall line count.
>
> I want to confirm everyone else is okay with this change. While the
> column limit was changed to 100, some subsystems still prefer the old
> 80 limit. If everyone is okay with 100 I can do that, I just want to
> be sure.

I think it's fine:
$ find drivers/input -name '*.c' -exec wc -L {} + | sort -rh
 198 total
    198 drivers/input/mouse/synaptics.c
    182 drivers/input/serio/i8042.c
    167 drivers/input/keyboard/applespi.c
    152 drivers/input/mouse/alps.c
    151 drivers/input/mouse/elantech.c
    133 drivers/input/mouse/elan_i2c_core.c
    133 drivers/input/joystick/grip.c
    133 drivers/input/joystick/adi.c
    132 drivers/input/joystick/gf2k.c
    132 drivers/input/joystick/gamecon.c
    131 drivers/input/joystick/a3d.c
    130 drivers/input/joystick/cobra.c
// ... snipp ...

I've also had some review on this on a previous driver i submitted here:
https://lore.kernel.org/all/YfK4UcuCfF7JfI7H@smile.fi.intel.com/

But let's wait for others to chime in. Again, this is more of a nitpick
so if you'd prefer to keep at 80chars that's fine to me as well.

Thanks
Mattijs

>
>> 
>> > +
>> > +	return ret;
>> > +}
>> > +
>> > +static int cst3xx_firmware_info(struct i2c_client *client)
>> > +{
>> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
>> > +	int ret;
>> > +	u32 tmp;
>> > +	unsigned char buf[4];
>> > +
>> > +	/*
>> > +	 * Tests suggest this command needed to read firmware regs.
>> > +	 */
>> > +	put_unaligned_le16(CST3XX_FIRMWARE_INFO_START_CMD, buf);
>> > +	ret = cst3xx_i2c_write(client, buf, 2);
>> > +	if (ret < 0)
>> > +		return -EIO;
>> > +
>> > +	mdelay(10);
>> > +
>> > +	/*
>> > +	 * Read register for check-code to determine if device detected
>> > +	 * correctly.
>> > +	 */
>> > +	ret = cst3xx_i2c_read_register(client, CST3XX_FIRMWARE_CHK_CODE_REG,
>> > +				       buf, 4);
>> > +	if (ret < 0)
>> > +		return -EIO;
>> > +
>> > +	tmp = get_unaligned_le32(buf);
>> > +	if ((tmp & 0xffff0000) != ts_data->pdata->ic_chkcode) {
>> > +		dev_err(&client->dev, "%s ic mismatch\n", __func__);
>> 
>> Should we print the device's ic_chkcode in case we don't recognize it?
>> 
>
> Good idea, I'll make that change.
>
>> > +		return -ENODEV;
>> > +	}
>> > +
>> > +	mdelay(10);
>> > +
>> > +	/* Read firmware version and test if firmware missing. */
>> > +	ret = cst3xx_i2c_read_register(client, CST3XX_FIRMWARE_VERSION_REG,
>> > +				       buf, 4);
>> > +	if (ret < 0)
>> > +		return -EIO;
>> > +
>> > +	tmp = get_unaligned_le32(buf);
>> > +	if (tmp == CST3XX_FIRMWARE_VER_INVALID_VAL) {
>> > +		dev_err(&client->dev, "Device firmware missing\n");
>> > +		return -ENODEV;
>> > +	}
>> > +
>> > +	/*
>> > +	 * Tests suggest cmd required to exit reading firmware regs.
>> > +	 */
>> > +	put_unaligned_le16(CST3XX_FIRMWARE_INFO_END_CMD, buf);
>> > +	ret = cst3xx_i2c_write(client, buf, 2);
>> > +	if (ret < 0)
>> > +		return -EIO;
>> > +
>> > +	mdelay(5);
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int cst3xx_bootloader_enter(struct i2c_client *client)
>> > +{
>> > +	int ret;
>> > +	u8 retry;
>> > +	u32 tmp;
>> > +	unsigned char buf[3];
>> > +
>> > +	for (retry = 0; retry < 5; retry++) {
>> > +		hyn_reset_proc(client, (7 + retry));
>> > +		/* set cmd to enter program mode */
>> > +		put_unaligned_le24(CST3XX_BOOTLDR_PROG_CMD, buf);
>> > +		ret = cst3xx_i2c_write(client, buf, 3);
>> > +		if (ret < 0)
>> > +			continue;
>> > +		mdelay(2);
>> > +
>> > +		/* check whether in program mode */
>> > +		ret = cst3xx_i2c_read_register(client,
>> > +					       CST3XX_BOOTLDR_PROG_CHK_REG,
>> > +					       buf, 1);
>> > +		tmp = get_unaligned(buf);
>> > +
>> > +		if (ret < 0)
>> > +			continue;
>> > +
>> > +		if (tmp == CST3XX_BOOTLDR_CHK_VAL)
>> > +			break;
>> > +	}
>> > +
>> > +	if (tmp != CST3XX_BOOTLDR_CHK_VAL) {
>> > +		dev_err(&client->dev, "%s unable to enter bootloader mode\n",
>> > +			__func__);
>> > +		return -ENODEV;
>> > +	}
>> > +
>> > +	hyn_reset_proc(client, 40);
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static void cst3xx_touch_update(struct hynitron_ts_data *ts_data,
>> > +				s32 id, s32 x, s32 y, s32 w)
>> > +{
>> > +	input_mt_slot(ts_data->input_dev, id);
>> > +	input_mt_report_slot_state(ts_data->input_dev, MT_TOOL_FINGER, 1);
>> > +	touchscreen_report_pos(ts_data->input_dev, &ts_data->prop, x, y, true);
>> > +	input_report_abs(ts_data->input_dev, ABS_MT_TOUCH_MAJOR, w);
>> > +}
>> > +
>> > +static int cst3xx_finish_touch_read(struct i2c_client *client)
>> > +{
>> > +	unsigned char buf[3];
>> > +	int err;
>> > +
>> > +	put_unaligned_le24(CST3XX_TOUCH_DATA_STOP_CMD, buf);
>> > +	err = cst3xx_i2c_write(client, buf, 3);
>> > +	if (err < 0) {
>> > +		dev_err(&client->dev, "send read touch info ending failed.\n");
>> > +		return err;
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +/*
>> > + * Handle events from IRQ. Note that for cst3xx it appears that IRQ
>> > + * fires continuously while touched, otherwise once every 1500ms
>> > + * when not touched (assume touchscreen waking up periodically).
>> > + * Note buffer is sized for 5 fingers, if more needed buffer must
>> > + * be increased. The buffer contains 5 bytes for each touch point,
>> > + * a touch count byte, a check byte, and then a second check byte after
>> > + * all other touch points.
>> > + *
>> > + * For example 1 touch would look like this:
>> > + * touch1[5]:touch_count[1]:chk_byte[1]
>> > + *
>> > + * 3 touches would look like this:
>> > + * touch1[5]:touch_count[1]:chk_byte[1]:touch2[5]:touch3[5]:chk_byte[1]
>> > + */
>> > +static void cst3xx_touch_report(struct i2c_client *client)
>> > +{
>> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
>> > +	unsigned char buf[28];
>> > +	unsigned char finger_id, sw;
>> > +	unsigned int input_x = 0;
>> > +	unsigned int input_y = 0;
>> > +	unsigned int input_w = 0;
>> > +	int idx = 0;
>> > +	int i, err;
>> > +	int touch_cnt, end_byte;
>> > +
>> > +	/* Read and validate the first bits of input data. */
>> > +	err = cst3xx_i2c_read_register(client, CST3XX_TOUCH_DATA_PART_REG,
>> > +				       buf, 28);
>> > +	if ((err < 0) || (buf[6] != CST3XX_TOUCH_DATA_CHK_VAL) ||
>> > +	    (buf[0] == CST3XX_TOUCH_DATA_CHK_VAL)) {
>> > +		dev_err(&client->dev, "cst3xx touch read failure\n");
>> > +		return;
>> > +	}
>> > +
>> > +	/* Report to the device we're done reading the touch data. */
>> > +	err = cst3xx_finish_touch_read(client);
>> > +	if (err < 0) {
>> > +		dev_err(&client->dev, "cst3xx touch read failure\n");
>> 
>> We are already printing in cst3xx_finish_touch_read(), no need to print
>> here again.
>
> Ack.
>
>> 
>> > +		return;
>> > +	}
>> > +
>> > +	touch_cnt = buf[5] & CST3XX_TOUCH_COUNT_MASK;
>> > +
>> > +	/* If no touches registered, clear the input slots. */
>> > +	if (touch_cnt == 0) {
>> > +		input_mt_sync_frame(ts_data->input_dev);
>> > +		input_sync(ts_data->input_dev);
>> > +		return;
>> > +	}
>> > +
>> > +	/*
>> > +	 * Check the check bit of the last touch slot. The check bit is
>> > +	 * always present after touch point 1 for valid data, and then
>> > +	 * appears as the last byte after all other touch data.
>> > +	 */
>> > +	if (touch_cnt > 1) {
>> > +		end_byte = touch_cnt * 5 + 2;
>> > +		if (buf[end_byte] != CST3XX_TOUCH_DATA_CHK_VAL) {
>> > +			dev_err(&client->dev, "cst3xx touch read failure\n");
>> > +			return;
>> > +		}
>> > +	}
>> > +
>> > +	/* Parse through the buffer to capture touch data. */
>> > +	for (i = 0; i < touch_cnt; i++) {
>> > +		input_x = ((buf[idx + 1] << 4) | ((buf[idx + 3] >> 4) & 0x0f));
>> > +		input_y = ((buf[idx + 2] << 4) | (buf[idx + 3] & 0x0f));
>> > +		input_w = (buf[idx + 4] >> 3);
>> > +		sw = (buf[idx] & 0x0f) >> 1;
>> > +		finger_id = (buf[idx] >> 4) & 0x0f;
>> > +
>> > +		/* Sanity check we don't have more fingers than we expect */
>> > +		if (ts_data->pdata->max_touch_num < finger_id) {
>> > +			dev_err(&client->dev, "cst3xx touch read failure\n");
>> > +			break;
>> > +		}
>> > +
>> > +		/* sw value of 0 means no touch, 0x03 means touch */
>> > +		if (sw == CST3XX_TOUCH_DATA_TOUCH_VAL)
>> > +			cst3xx_touch_update(ts_data, finger_id,
>> > +					    input_x, input_y, input_w);
>> > +
>> > +		idx += 5;
>> > +
>> > +		/* Skip the 2 bits between point 1 and point 2 */
>> > +		if (i == 0)
>> > +			idx += 2;
>> > +	}
>> > +
>> > +	input_mt_sync_frame(ts_data->input_dev);
>> > +	input_sync(ts_data->input_dev);
>> > +}
>> > +
>> > +static int cst3xx_input_dev_int(struct i2c_client *client)
>> > +{
>> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
>> > +	int err;
>> > +
>> > +	ts_data->input_dev = devm_input_allocate_device(&ts_data->client->dev);
>> > +	if (!ts_data->input_dev) {
>> > +		dev_err(&ts_data->client->dev,
>> > +			"Failed to allocate input device.\n");
>> > +		return -ENOMEM;
>> > +	}
>> > +
>> > +	ts_data->input_dev->name = "Hynitron cst3xx Touchscreen";
>> > +	ts_data->input_dev->phys = "input/ts";
>> > +	ts_data->input_dev->id.bustype = BUS_I2C;
>> > +
>> > +	input_set_drvdata(ts_data->input_dev, ts_data);
>> > +
>> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_X);
>> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_Y);
>> > +	input_set_abs_params(ts_data->input_dev, ABS_MT_TOUCH_MAJOR,
>> > +			     0, 255, 0, 0);
>> > +
>> > +	touchscreen_parse_properties(ts_data->input_dev, true, &ts_data->prop);
>> > +
>> > +	if (!ts_data->prop.max_x || !ts_data->prop.max_y) {
>> > +		dev_err(&client->dev,
>> > +			"Invalid x/y (%d, %d), using defaults\n",
>> > +			ts_data->prop.max_x, ts_data->prop.max_y);
>> > +		ts_data->prop.max_x = 1152;
>> > +		ts_data->prop.max_y = 1920;
>> > +		input_abs_set_max(ts_data->input_dev,
>> > +				  ABS_MT_POSITION_X, ts_data->prop.max_x);
>> > +		input_abs_set_max(ts_data->input_dev,
>> > +				  ABS_MT_POSITION_Y, ts_data->prop.max_y);
>> > +	}
>> > +
>> > +	err = input_mt_init_slots(ts_data->input_dev,
>> > +				  ts_data->pdata->max_touch_num,
>> > +				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
>> > +	if (err < 0) {
>> > +		dev_err(&ts_data->client->dev,
>> > +			"Input device registration failed\n");
>> > +		return err;
>> > +	}
>> > +
>> > +	err = input_register_device(ts_data->input_dev);
>> > +	if (err < 0) {
>> > +		dev_err(&ts_data->client->dev,
>> > +			"Input device registration failed\n");
>> > +		return err;
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static int hyn_probe(struct i2c_client *client)
>> > +{
>> > +	struct hynitron_ts_data *ts_data;
>> > +	int err;
>> > +
>> > +	ts_data = devm_kzalloc(&client->dev, sizeof(*ts_data), GFP_KERNEL);
>> > +	if (!ts_data)
>> > +		return -ENOMEM;
>> > +
>> > +	ts_data->client = client;
>> > +	i2c_set_clientdata(client, ts_data);
>> > +
>> > +	ts_data->reset_gpio = devm_gpiod_get(&client->dev,
>> > +					     "reset", GPIOD_OUT_LOW);
>> > +	err = PTR_ERR_OR_ZERO(ts_data->reset_gpio);
>> > +	if (err < 0) {
>> > +		dev_err(&client->dev, "request reset gpio failed: %d\n", err);
>> > +		return err;
>> > +	}
>> > +
>> > +	ts_data->pdata = of_device_get_match_data(&client->dev);
>> > +	if (!ts_data->pdata)
>> > +		return -EINVAL;
>> > +
>> > +	hyn_reset_proc(client, 60);
>> > +
>> > +	err = ts_data->pdata->bootloader_enter(client);
>> > +	if (err < 0)
>> > +		return err;
>> > +
>> > +	err = ts_data->pdata->init_input(client);
>> > +	if (err < 0)
>> > +		return err;
>> > +
>> > +	err = ts_data->pdata->firmware_info(client);
>> > +	if (err < 0)
>> > +		return err;
>> > +
>> > +	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>> > +					hyn_interrupt_handler,
>> > +					IRQF_ONESHOT,
>> > +					"Hynitron Touch Int", client);
>> > +	if (err < 0) {
>> > +		dev_err(&client->dev, "failed to request IRQ\n");
>> > +		return err;
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +
>> > +static const struct hynitron_ts_chip_data cst3xx_data = {
>> > +	.max_touch_num		= 5,
>> > +	.ic_chkcode		= 0xcaca0000,
>> > +	.firmware_info		= &cst3xx_firmware_info,
>> > +	.bootloader_enter	= &cst3xx_bootloader_enter,
>> > +	.init_input		= &cst3xx_input_dev_int,
>> > +	.report_touch		= &cst3xx_touch_report,
>> > +};
>> > +
>> > +static const struct i2c_device_id hyn_tpd_id[] = {
>> > +	{ .name = "hynitron_ts", 0 },
>> > +	{ /* sentinel */ },
>> > +};
>> > +MODULE_DEVICE_TABLE(i2c, hyn_tpd_id);
>> > +
>> > +static const struct of_device_id hyn_dt_match[] = {
>> > +	{ .compatible = "hynitron,cst340", .data = &cst3xx_data },
>> > +	{ /* sentinel */ },
>> > +};
>> > +MODULE_DEVICE_TABLE(of, hyn_dt_match);
>> > +
>> > +static struct i2c_driver hynitron_i2c_driver = {
>> > +	.driver = {
>> > +		.name = "Hynitron-TS",
>> > +		.of_match_table = of_match_ptr(hyn_dt_match),
>> > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> > +	},
>> > +	.id_table = hyn_tpd_id,
>> > +	.probe_new = hyn_probe,
>> > +};
>> > +
>> > +module_i2c_driver(hynitron_i2c_driver);
>> > +
>> > +MODULE_AUTHOR("Chris Morgan");
>> > +MODULE_DESCRIPTION("Hynitron Touchscreen Driver");
>> > +MODULE_LICENSE("GPL");
>> > -- 
>> > 2.25.1
