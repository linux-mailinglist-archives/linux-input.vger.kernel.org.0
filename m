Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC0F611B2D
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 21:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiJ1Tto (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 15:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiJ1Ttm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 15:49:42 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2102.outbound.protection.outlook.com [40.92.45.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D2510D689;
        Fri, 28 Oct 2022 12:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMdh0bTZlpm0jGAssUFD2MqbJfX+ZYTUOq5IkKX5VMxlZmrc5CPmwPb2C+Gu4BQFx5uf3GCVBDn7sUi2Rb7pEPnpXLbTxGNWCOZ0yfGt/zMP4fyYrI1TI0nLppejC2CHo+6JifjuTfkU4W5AQ0ng+iC/hraqxDezHGo0Sh05Ou6Et/6XtWHRTu3IiCvQOE6Uk5kf0gl4lDd3bbtvNuKPO1wAZ32PnZpqk0KDGUjzSDtHzHXmH4K63cMawdcIhMbVsz6FmpP2ch9RGNj1XGc+cFi1gdegB57xjHUOPrgP5S8UOCh5+FaqGTUyyQMbzYDE0UVh9UuGw03yjVH1UBQgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhGEpT7kT5bVymuetCdzymmdgh7bVc8IGA6wjchMbU4=;
 b=LP+BEct+A0kwpkQZFKYE1KNQXAUbZHcJlfP2l742PUjaXW60F4UqG45Vw8bII9+S6ZMiqqVDD7lHGPD7EmFeqx3s4orNEVSv/cmCPiIqQT1OErlBrBwgCEF7fYC9eR+WTIX9i43hffHEEzKyeJiF18/1J/wbnNfIp1srn3pZlWkxxcUJU8H/e3lTUtaV8wxWz/XTNIsM+CP3wgSY+GfdBlPqDeSP74lFxnRqiHpXgwRFQQ0Ub3wkSn/bZ9oN3v+SO3lsdz/50BoIBGV4lAN8wCrk0G45qRHcEAadz02o+qglZoJntl4zcA7SEyIIX83/eOdunV6j40VSYqd/rsoEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhGEpT7kT5bVymuetCdzymmdgh7bVc8IGA6wjchMbU4=;
 b=ke7VGFPywe4P/6qfASyp60teki1LpWbfe55K7DpJ3Vcw/HTMXLEHDDdbqNYD0pS179qr/SRIo7MKpnV0pC6PHjnUFbzNBqcBO2hAx0zCyf5s5hF30Z04d7kXvsVNEdo5K2p/Gb5WDc520G5+oXJdd+eiB7Y6t4sk+FWegLo/46LNPhAiUEhUM6N5kSUdTifjb3KxVfXbAZxvkLpY4mn2uj6LQIidJ4fHo/IMBoO6+zCWt78bn6vnoHAPgj0dVkjQPd0kQcAowJl0iLzP5aaFG6yOYt8foCb1Wl0uHB3L/tdn/Lxxdqz2NN9IER+Ni7XWL1YpWAs5JnxISOI8Je5rNg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM5PR06MB3178.namprd06.prod.outlook.com (2603:10b6:4:41::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Fri, 28 Oct
 2022 19:49:23 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d%5]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 19:49:23 +0000
Date:   Fri, 28 Oct 2022 14:49:18 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, jeff@labundy.com,
        neil.armstrong@linaro.org, arnd@arndb.de, robert.jarzmik@free.fr,
        Jonathan.Cameron@huawei.com, christianshewitt@gmail.com,
        stano.jakubek@gmail.com, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH v3 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <SN6PR06MB5342910C69D1CE159245C95DA5329@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221010153522.17503-1-macroalpha82@gmail.com>
 <20221010153522.17503-4-macroalpha82@gmail.com>
 <87sfjhp9f6.fsf@baylibre.com>
 <SN6PR06MB5342B4732AF2C08686E312B0A5309@SN6PR06MB5342.namprd06.prod.outlook.com>
 <87edut7kfz.fsf@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edut7kfz.fsf@baylibre.com>
X-TMN:  [sIlTBwexKQBQfn8h1oWKHjvhnfK2Uqxo]
X-ClientProxiedBy: SN7PR04CA0082.namprd04.prod.outlook.com
 (2603:10b6:806:121::27) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20221028194918.GA30897@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|DM5PR06MB3178:EE_
X-MS-Office365-Filtering-Correlation-Id: c8a1d8d5-72e1-4369-80f8-08dab91d82ec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6X0IdJ/ArnrrOJIOMFNVNMXGiXQ7Z6Ohk0kXDC84agSWPX0iPTjoOx7uwFd+Egm5oQIxE65dLgK00vAX9Ii1qZ1x8z/NnqhFYEc2JqZBnq0sHTtKGlTahotPHQ+6zb3zuS+xU2UnrioP2K/lnAKc91D3ROHmuvsDygRSw3FSlnUBjEgP6BYIubB7WB4pEtKHNvyDP80KU5Kif6pnTOqGTqjWLnmUdJFXPqGCOL3iFoxNcOKfbraN6SmDyhsGH4ge8oQ/qmO8D09qtAFxZJSS6DeRnLxmFQbfvEM05dNmNqLLYPkLr/zAqrsHJyydKkKR8lA2W/y1CMRh3zZkFa67xyH5s7LQVV7lT2SofrjK+4z4EZ0uDG5gFSU8UDNgy7ZblXEFdQdNEqRSLKOd5RKKRf9hsY61TVUKM/XbKZQilewezIepsY09ym9/d6DTkwh6kCIfMU95/B8IdYF+0+/5ZmoxE1I8NI8NDrRF6316Icr3zaT8ri7EEq8lZiuuNuk5s0L0CHECnCkmRMFpyD0iXbFlJq834DxwkVPXYd2LEr38v3hzsZrNrVBgzYYd8j2m0xGWsyIuGA024d3NPMHjzXdRHLsXojrdRixBvKxs+pPJhw1rCJcbgJiqlNLmlSobHuvkJBIvLa1jWAIT5hOBCZl/ikD/qHrd9gV038FgjoZBj5HAd7bkVeR8UXJskAb7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvnF+2w2qBSV/S5E/PWvQ9Uyk+UONyl0y1nrB4FPc6LTKz5Hif+JFJp3TsBI?=
 =?us-ascii?Q?6iMRvoBHdl2m5p+mF0/+5igZ6WUI/TwMf42s7gPJI4387tvvEdH4SloJhCu5?=
 =?us-ascii?Q?8I0eQo9IBmaI9PYQn+LR9V8i5EDV39A8MVI751mdNCo6Zh21hq7UF7lB9Fxx?=
 =?us-ascii?Q?gMmmfhda7A1YAmRTdBG47kCX0KmX1bvL+BKAZbPQdU4vem9T8Ju/vMejNd0a?=
 =?us-ascii?Q?VHQvvqMptwJUuHvLqyoymb2tMtNx8EAeCfB46qLMr85IT00E2FCYJMPHTj/4?=
 =?us-ascii?Q?xddElOF4JpdVTHvSI1xfaagXIqei4kAc+68FUOtzXG9K190Lef4ziB/W4xlo?=
 =?us-ascii?Q?PjVhwUdPCmO2Qe3UiyipMM/Y8QS4TFCAxbzP6+3OUG2mgqe/Lyi30peg/MFs?=
 =?us-ascii?Q?B09byoSyqwqa7l+O5zznmotzLbd1Q+Gnj3KEPdc5dUggCgXWQNGcHnwRHniI?=
 =?us-ascii?Q?7FZRDZkeAwgJCYRnWbqT1nYEvqYHVs81Wd6Do8ykhoMaERKq1WW6kxGgFiux?=
 =?us-ascii?Q?0kCrbuXVQbCKLxy+CoQjPEXEV4D5AV8EdmeLB+K2BFa6lnsULxaSvucBUQBf?=
 =?us-ascii?Q?jgyAwUoFKcrUAbAfN0I6S8Ukzo4MKBr23omwlzdO/dzx6dbzPlkq0xRVrKMS?=
 =?us-ascii?Q?w6K24nRMbN2pjm1JQksJ7Zk7w66+GEAFkmZ9ibvzZbbtYvTIXAg0N6iow1lK?=
 =?us-ascii?Q?YrNdXlKgmW61BRUOWT/YS1XeqG8jcmR3YHKidh0XBySm7/fZcTZGCF7CV1nF?=
 =?us-ascii?Q?J2oLWHNHbwe50q2JNcYswt993BE5IeX73ol2y9hPWvWApSLJfgjXYc78LFG3?=
 =?us-ascii?Q?akVP+xgcGqIq2ugpd2d9Y8BrHXgahKfgXbDZBb3Crtt3zZp6lvmBQWNE5KYx?=
 =?us-ascii?Q?Fn2DhkBuTZyLakTLfjsfoXNjI1MvgfI+JLQ9a/VyTapsq/KS+D6m7PE/JbbB?=
 =?us-ascii?Q?evAWMPEYkPEUockGACSvoWl5BwBVhnjWZyUvyqQIpvwJGnr3tSpL5ko3uGIy?=
 =?us-ascii?Q?5tzjYhdTnHSHAOHh7OB0O4RrgjC4iyCTKN168IWZb6VOchcwerIndmZSdpGH?=
 =?us-ascii?Q?E58L14tu7iagPfQQXxLtRtFjsVyZWRQ37EfUqnRAUUteVdL7HYTQ13diw5KX?=
 =?us-ascii?Q?ovYGTq78N7E1I2sZWqEwGJZE1bSeyKqytITLXC28AMmDqAKV8M3+lPbr2Pgf?=
 =?us-ascii?Q?aRzIOV9Jx1h/fFD9fDle2Lp6kOVyBE4QEsX4YElF42JTyEUKC42OVCL+tm8a?=
 =?us-ascii?Q?DobG3sWl7VoYjngbnqmn9Hnr+2Yv+xwtOI9HQL3V+Q=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a1d8d5-72e1-4369-80f8-08dab91d82ec
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 19:49:23.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB3178
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 27, 2022 at 10:13:52AM +0200, Mattijs Korpershoek wrote:
> On Wed, Oct 26, 2022 at 14:24, Chris Morgan <macromorgan@hotmail.com> wrote:
> 
> > On Fri, Oct 21, 2022 at 03:56:29PM +0200, Mattijs Korpershoek wrote:
> >> Hi Chris,
> >> 
> >> Thank you for your patch.
> >> 
> >> On Mon, Oct 10, 2022 at 10:35, Chris Morgan <macroalpha82@gmail.com> wrote:
> >> 
> >> > From: Chris Morgan <macromorgan@hotmail.com>
> >> >
> >> > Add support for the Hynitron cst3xx controller found on devices such
> >> > as the Anbernic RG353P and RG353V (the Hynitron CST340). This driver
> >> > was built from sources provided by Hynitron to Anbernic (possibly
> >> > via Rockchip as an intermediary) and marked as GPLv2 in the code.
> >> > This driver was written strictly for the cst3xx series, but in
> >> > most places was left somewhat generic so support could be easily
> >> > added to other devices in the future.
> >> >
> >> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >> > ---
> >> >  drivers/input/touchscreen/Kconfig           |  12 +
> >> >  drivers/input/touchscreen/Makefile          |   1 +
> >> >  drivers/input/touchscreen/hynitron_cstxxx.c | 508 ++++++++++++++++++++
> >> >  3 files changed, 521 insertions(+)
> >> >  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
> >> >
> >> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> >> > index 2d70c945b20a..9a9528e59c36 100644
> >> > --- a/drivers/input/touchscreen/Kconfig
> >> > +++ b/drivers/input/touchscreen/Kconfig
> >> > @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
> >> >  	  To compile this driver as a module, choose M here: the
> >> >  	  module will be called hycon-hy46xx.
> >> >  
> >> > +config TOUCHSCREEN_HYNITRON_CSTXXX
> >> > +	tristate "Hynitron touchscreen support"
> >> > +	depends on I2C
> >> 
> >> Since we include linux/of.h, I think we should also add:
> >> depends on OF
> >
> > Thank you, will do and resubmit.
> >
> >> 
> >> There are some small nitpicks below as well.
> >> 
> >> With those addressed, please add:
> >> 
> >> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> >> 
> >> > +	help
> >> > +	  Say Y here if you have a touchscreen using a Hynitron
> >> > +	  touchscreen controller.
> >> > +
> >> > +	  If unsure, say N.
> >> > +
> >> > +	  To compile this driver as a module, choose M here: the
> >> > +	  module will be called hynitron-cstxxx.
> >> > +
> >> >  config TOUCHSCREEN_ILI210X
> >> >  	tristate "Ilitek ILI210X based touchscreen"
> >> >  	depends on I2C
> >> > diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> >> > index 557f84fd2075..43860ca19b98 100644
> >> > --- a/drivers/input/touchscreen/Makefile
> >> > +++ b/drivers/input/touchscreen/Makefile
> >> > @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> >> > +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> >> >  obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
> >> > diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
> >> > new file mode 100644
> >> > index 000000000000..11701ff39eb1
> >> > --- /dev/null
> >> > +++ b/drivers/input/touchscreen/hynitron_cstxxx.c
> >> > @@ -0,0 +1,508 @@
> >> > +// SPDX-License-Identifier: GPL-2.0-only
> >> > +/*
> >> > + *  Driver for Hynitron cstxxx Touchscreen
> >> > + *
> >> > + *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
> >> > + *
> >> > + *  This code is based on hynitron_core.c authored by Hynitron.
> >> > + *  Note that no datasheet was available, so much of these registers
> >> > + *  are undocumented. This is essentially a cleaned-up version of the
> >> > + *  vendor driver with support removed for hardware I cannot test and
> >> > + *  device-specific functions replated with generic functions wherever
> >> > + *  possible.
> >> > + */
> >> > +
> >> > +#include <asm/unaligned.h>
> >> > +#include <linux/delay.h>
> >> > +#include <linux/gpio.h>
> >> > +#include <linux/i2c.h>
> >> > +#include <linux/input.h>
> >> > +#include <linux/input/mt.h>
> >> > +#include <linux/input/touchscreen.h>
> >> > +#include <linux/module.h>
> >> > +#include <linux/of.h>
> >> > +#include <linux/of_device.h>
> >> > +
> >> > +/* Per chip data */
> >> > +struct hynitron_ts_chip_data {
> >> > +	unsigned int max_touch_num;
> >> > +	u32 ic_chkcode;
> >> > +	int (*firmware_info)(struct i2c_client *client);
> >> > +	int (*bootloader_enter)(struct i2c_client *client);
> >> > +	int (*init_input)(struct i2c_client *client);
> >> > +	void (*report_touch)(struct i2c_client *client);
> >> > +};
> >> > +
> >> > +/* Data generic to all (supported and non-supported) controllers. */
> >> > +struct hynitron_ts_data {
> >> > +	const struct hynitron_ts_chip_data *pdata;
> >> > +	struct i2c_client *client;
> >> > +	struct input_dev *input_dev;
> >> > +	struct touchscreen_properties prop;
> >> > +	struct gpio_desc *reset_gpio;
> >> > +	struct gpio_desc *irq_gpio;
> >> > +};
> >> > +
> >> > +/*
> >> > + * Since I have no datasheet, these values are guessed and/or assumed
> >> > + * based on observation and testing.
> >> > + */
> >> > +#define CST3XX_FIRMWARE_INFO_START_CMD		0x01d1
> >> > +#define CST3XX_FIRMWARE_INFO_END_CMD		0x09d1
> >> > +#define CST3XX_FIRMWARE_CHK_CODE_REG		0xfcd1
> >> > +#define CST3XX_FIRMWARE_VERSION_REG		0x08d2
> >> > +#define CST3XX_FIRMWARE_VER_INVALID_VAL		0xa5a5a5a5
> >> > +
> >> > +#define CST3XX_BOOTLDR_PROG_CMD			0xaa01a0
> >> > +#define CST3XX_BOOTLDR_PROG_CHK_REG		0x02a0
> >> > +#define CST3XX_BOOTLDR_CHK_VAL			0xac
> >> > +
> >> > +#define CST3XX_TOUCH_DATA_PART_REG		0x00d0
> >> > +#define CST3XX_TOUCH_DATA_FULL_REG		0x07d0
> >> > +#define CST3XX_TOUCH_DATA_CHK_VAL		0xab
> >> > +#define CST3XX_TOUCH_DATA_TOUCH_VAL		0x03
> >> > +#define CST3XX_TOUCH_DATA_STOP_CMD		0xab00d0
> >> > +#define CST3XX_TOUCH_COUNT_MASK			GENMASK(6, 0)
> >> > +
> >> > +
> >> > +/*
> >> > + * Hard coded reset delay value of 20ms not IC dependent in
> >> > + * vendor driver.
> >> > + */
> >> > +static void hyn_reset_proc(struct i2c_client *client, int delay)
> >> > +{
> >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> >> > +
> >> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> >> > +	mdelay(20);
> >> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> >> > +	if (delay)
> >> > +		mdelay(delay);
> >> > +}
> >> > +
> >> > +static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
> >> > +{
> >> > +	struct i2c_client *client = dev_id;
> >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> >> > +
> >> > +	ts_data->pdata->report_touch(client);
> >> > +
> >> > +	return IRQ_HANDLED;
> >> > +}
> >> > +
> >> > +/*
> >> > + * The vendor driver would retry twice before failing to read or write
> >> > + * to the i2c device.
> >> > + */
> >> > +
> >> > +static int cst3xx_i2c_write(struct i2c_client *client,
> >> > +			    unsigned char *buf, int len)
> >> > +{
> >> > +	int ret;
> >> > +	int retries = 0;
> >> > +
> >> > +	while (retries < 2) {
> >> > +		ret = i2c_master_send(client, buf, len);
> >> > +		if (ret == len)
> >> > +			return 0;
> >> > +		if (ret <= 0)
> >> > +			retries++;
> >> > +		else
> >> > +			break;
> >> > +	}
> >> > +
> >> > +	return ret < 0 ? ret : -EIO;
> >> > +}
> >> > +
> >> > +static int cst3xx_i2c_read_register(struct i2c_client *client, u16 reg,
> >> > +				    u8 *val, u16 len)
> >> > +{
> >> > +	__le16 buf = cpu_to_le16(reg);
> >> > +	struct i2c_msg msgs[] = {
> >> > +		{
> >> > +			.addr = client->addr,
> >> > +			.flags = 0,
> >> > +			.len = 2,
> >> > +			.buf = (u8 *)&buf,
> >> > +		},
> >> > +		{
> >> > +			.addr = client->addr,
> >> > +			.flags = I2C_M_RD,
> >> > +			.len = len,
> >> > +			.buf = val,
> >> > +		}
> >> > +	};
> >> > +	int ret;
> >> > +
> >> > +	ret = i2c_transfer(client->adapter, msgs, 2);
> >> > +	if (ret >= 0)
> >> > +		ret = (ret == ARRAY_SIZE(msgs) ? 0 : -EIO);
> >> > +
> >> > +	if (ret)
> >> > +		dev_err(&client->dev,
> >> > +			"Error reading %d bytes from 0x%04x: %d\n",
> >> > +			len, reg, ret);
> >> 
> >> This could be a single line, since column limit is 100chars now. This
> >> applies for a lot of other wrapped lines in this file.
> >> 
> >> Please consider joining such lines to reduce the overall line count.
> >
> > I want to confirm everyone else is okay with this change. While the
> > column limit was changed to 100, some subsystems still prefer the old
> > 80 limit. If everyone is okay with 100 I can do that, I just want to
> > be sure.
> 
> I think it's fine:
> $ find drivers/input -name '*.c' -exec wc -L {} + | sort -rh
>  198 total
>     198 drivers/input/mouse/synaptics.c
>     182 drivers/input/serio/i8042.c
>     167 drivers/input/keyboard/applespi.c
>     152 drivers/input/mouse/alps.c
>     151 drivers/input/mouse/elantech.c
>     133 drivers/input/mouse/elan_i2c_core.c
>     133 drivers/input/joystick/grip.c
>     133 drivers/input/joystick/adi.c
>     132 drivers/input/joystick/gf2k.c
>     132 drivers/input/joystick/gamecon.c
>     131 drivers/input/joystick/a3d.c
>     130 drivers/input/joystick/cobra.c
> // ... snipp ...
> 
> I've also had some review on this on a previous driver i submitted here:
> https://lore.kernel.org/all/YfK4UcuCfF7JfI7H@smile.fi.intel.com/
> 
> But let's wait for others to chime in. Again, this is more of a nitpick
> so if you'd prefer to keep at 80chars that's fine to me as well.
> 

I'll keep it at 80 for now, but I'll make all the other changes you
suggest. I'll resubmit shortly.

Thank you.

> Thanks
> Mattijs
> 
> >
> >> 
> >> > +
> >> > +	return ret;
> >> > +}
> >> > +
> >> > +static int cst3xx_firmware_info(struct i2c_client *client)
> >> > +{
> >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> >> > +	int ret;
> >> > +	u32 tmp;
> >> > +	unsigned char buf[4];
> >> > +
> >> > +	/*
> >> > +	 * Tests suggest this command needed to read firmware regs.
> >> > +	 */
> >> > +	put_unaligned_le16(CST3XX_FIRMWARE_INFO_START_CMD, buf);
> >> > +	ret = cst3xx_i2c_write(client, buf, 2);
> >> > +	if (ret < 0)
> >> > +		return -EIO;
> >> > +
> >> > +	mdelay(10);
> >> > +
> >> > +	/*
> >> > +	 * Read register for check-code to determine if device detected
> >> > +	 * correctly.
> >> > +	 */
> >> > +	ret = cst3xx_i2c_read_register(client, CST3XX_FIRMWARE_CHK_CODE_REG,
> >> > +				       buf, 4);
> >> > +	if (ret < 0)
> >> > +		return -EIO;
> >> > +
> >> > +	tmp = get_unaligned_le32(buf);
> >> > +	if ((tmp & 0xffff0000) != ts_data->pdata->ic_chkcode) {
> >> > +		dev_err(&client->dev, "%s ic mismatch\n", __func__);
> >> 
> >> Should we print the device's ic_chkcode in case we don't recognize it?
> >> 
> >
> > Good idea, I'll make that change.
> >
> >> > +		return -ENODEV;
> >> > +	}
> >> > +
> >> > +	mdelay(10);
> >> > +
> >> > +	/* Read firmware version and test if firmware missing. */
> >> > +	ret = cst3xx_i2c_read_register(client, CST3XX_FIRMWARE_VERSION_REG,
> >> > +				       buf, 4);
> >> > +	if (ret < 0)
> >> > +		return -EIO;
> >> > +
> >> > +	tmp = get_unaligned_le32(buf);
> >> > +	if (tmp == CST3XX_FIRMWARE_VER_INVALID_VAL) {
> >> > +		dev_err(&client->dev, "Device firmware missing\n");
> >> > +		return -ENODEV;
> >> > +	}
> >> > +
> >> > +	/*
> >> > +	 * Tests suggest cmd required to exit reading firmware regs.
> >> > +	 */
> >> > +	put_unaligned_le16(CST3XX_FIRMWARE_INFO_END_CMD, buf);
> >> > +	ret = cst3xx_i2c_write(client, buf, 2);
> >> > +	if (ret < 0)
> >> > +		return -EIO;
> >> > +
> >> > +	mdelay(5);
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static int cst3xx_bootloader_enter(struct i2c_client *client)
> >> > +{
> >> > +	int ret;
> >> > +	u8 retry;
> >> > +	u32 tmp;
> >> > +	unsigned char buf[3];
> >> > +
> >> > +	for (retry = 0; retry < 5; retry++) {
> >> > +		hyn_reset_proc(client, (7 + retry));
> >> > +		/* set cmd to enter program mode */
> >> > +		put_unaligned_le24(CST3XX_BOOTLDR_PROG_CMD, buf);
> >> > +		ret = cst3xx_i2c_write(client, buf, 3);
> >> > +		if (ret < 0)
> >> > +			continue;
> >> > +		mdelay(2);
> >> > +
> >> > +		/* check whether in program mode */
> >> > +		ret = cst3xx_i2c_read_register(client,
> >> > +					       CST3XX_BOOTLDR_PROG_CHK_REG,
> >> > +					       buf, 1);
> >> > +		tmp = get_unaligned(buf);
> >> > +
> >> > +		if (ret < 0)
> >> > +			continue;
> >> > +
> >> > +		if (tmp == CST3XX_BOOTLDR_CHK_VAL)
> >> > +			break;
> >> > +	}
> >> > +
> >> > +	if (tmp != CST3XX_BOOTLDR_CHK_VAL) {
> >> > +		dev_err(&client->dev, "%s unable to enter bootloader mode\n",
> >> > +			__func__);
> >> > +		return -ENODEV;
> >> > +	}
> >> > +
> >> > +	hyn_reset_proc(client, 40);
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static void cst3xx_touch_update(struct hynitron_ts_data *ts_data,
> >> > +				s32 id, s32 x, s32 y, s32 w)
> >> > +{
> >> > +	input_mt_slot(ts_data->input_dev, id);
> >> > +	input_mt_report_slot_state(ts_data->input_dev, MT_TOOL_FINGER, 1);
> >> > +	touchscreen_report_pos(ts_data->input_dev, &ts_data->prop, x, y, true);
> >> > +	input_report_abs(ts_data->input_dev, ABS_MT_TOUCH_MAJOR, w);
> >> > +}
> >> > +
> >> > +static int cst3xx_finish_touch_read(struct i2c_client *client)
> >> > +{
> >> > +	unsigned char buf[3];
> >> > +	int err;
> >> > +
> >> > +	put_unaligned_le24(CST3XX_TOUCH_DATA_STOP_CMD, buf);
> >> > +	err = cst3xx_i2c_write(client, buf, 3);
> >> > +	if (err < 0) {
> >> > +		dev_err(&client->dev, "send read touch info ending failed.\n");
> >> > +		return err;
> >> > +	}
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +/*
> >> > + * Handle events from IRQ. Note that for cst3xx it appears that IRQ
> >> > + * fires continuously while touched, otherwise once every 1500ms
> >> > + * when not touched (assume touchscreen waking up periodically).
> >> > + * Note buffer is sized for 5 fingers, if more needed buffer must
> >> > + * be increased. The buffer contains 5 bytes for each touch point,
> >> > + * a touch count byte, a check byte, and then a second check byte after
> >> > + * all other touch points.
> >> > + *
> >> > + * For example 1 touch would look like this:
> >> > + * touch1[5]:touch_count[1]:chk_byte[1]
> >> > + *
> >> > + * 3 touches would look like this:
> >> > + * touch1[5]:touch_count[1]:chk_byte[1]:touch2[5]:touch3[5]:chk_byte[1]
> >> > + */
> >> > +static void cst3xx_touch_report(struct i2c_client *client)
> >> > +{
> >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> >> > +	unsigned char buf[28];
> >> > +	unsigned char finger_id, sw;
> >> > +	unsigned int input_x = 0;
> >> > +	unsigned int input_y = 0;
> >> > +	unsigned int input_w = 0;
> >> > +	int idx = 0;
> >> > +	int i, err;
> >> > +	int touch_cnt, end_byte;
> >> > +
> >> > +	/* Read and validate the first bits of input data. */
> >> > +	err = cst3xx_i2c_read_register(client, CST3XX_TOUCH_DATA_PART_REG,
> >> > +				       buf, 28);
> >> > +	if ((err < 0) || (buf[6] != CST3XX_TOUCH_DATA_CHK_VAL) ||
> >> > +	    (buf[0] == CST3XX_TOUCH_DATA_CHK_VAL)) {
> >> > +		dev_err(&client->dev, "cst3xx touch read failure\n");
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	/* Report to the device we're done reading the touch data. */
> >> > +	err = cst3xx_finish_touch_read(client);
> >> > +	if (err < 0) {
> >> > +		dev_err(&client->dev, "cst3xx touch read failure\n");
> >> 
> >> We are already printing in cst3xx_finish_touch_read(), no need to print
> >> here again.
> >
> > Ack.
> >
> >> 
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	touch_cnt = buf[5] & CST3XX_TOUCH_COUNT_MASK;
> >> > +
> >> > +	/* If no touches registered, clear the input slots. */
> >> > +	if (touch_cnt == 0) {
> >> > +		input_mt_sync_frame(ts_data->input_dev);
> >> > +		input_sync(ts_data->input_dev);
> >> > +		return;
> >> > +	}
> >> > +
> >> > +	/*
> >> > +	 * Check the check bit of the last touch slot. The check bit is
> >> > +	 * always present after touch point 1 for valid data, and then
> >> > +	 * appears as the last byte after all other touch data.
> >> > +	 */
> >> > +	if (touch_cnt > 1) {
> >> > +		end_byte = touch_cnt * 5 + 2;
> >> > +		if (buf[end_byte] != CST3XX_TOUCH_DATA_CHK_VAL) {
> >> > +			dev_err(&client->dev, "cst3xx touch read failure\n");
> >> > +			return;
> >> > +		}
> >> > +	}
> >> > +
> >> > +	/* Parse through the buffer to capture touch data. */
> >> > +	for (i = 0; i < touch_cnt; i++) {
> >> > +		input_x = ((buf[idx + 1] << 4) | ((buf[idx + 3] >> 4) & 0x0f));
> >> > +		input_y = ((buf[idx + 2] << 4) | (buf[idx + 3] & 0x0f));
> >> > +		input_w = (buf[idx + 4] >> 3);
> >> > +		sw = (buf[idx] & 0x0f) >> 1;
> >> > +		finger_id = (buf[idx] >> 4) & 0x0f;
> >> > +
> >> > +		/* Sanity check we don't have more fingers than we expect */
> >> > +		if (ts_data->pdata->max_touch_num < finger_id) {
> >> > +			dev_err(&client->dev, "cst3xx touch read failure\n");
> >> > +			break;
> >> > +		}
> >> > +
> >> > +		/* sw value of 0 means no touch, 0x03 means touch */
> >> > +		if (sw == CST3XX_TOUCH_DATA_TOUCH_VAL)
> >> > +			cst3xx_touch_update(ts_data, finger_id,
> >> > +					    input_x, input_y, input_w);
> >> > +
> >> > +		idx += 5;
> >> > +
> >> > +		/* Skip the 2 bits between point 1 and point 2 */
> >> > +		if (i == 0)
> >> > +			idx += 2;
> >> > +	}
> >> > +
> >> > +	input_mt_sync_frame(ts_data->input_dev);
> >> > +	input_sync(ts_data->input_dev);
> >> > +}
> >> > +
> >> > +static int cst3xx_input_dev_int(struct i2c_client *client)
> >> > +{
> >> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> >> > +	int err;
> >> > +
> >> > +	ts_data->input_dev = devm_input_allocate_device(&ts_data->client->dev);
> >> > +	if (!ts_data->input_dev) {
> >> > +		dev_err(&ts_data->client->dev,
> >> > +			"Failed to allocate input device.\n");
> >> > +		return -ENOMEM;
> >> > +	}
> >> > +
> >> > +	ts_data->input_dev->name = "Hynitron cst3xx Touchscreen";
> >> > +	ts_data->input_dev->phys = "input/ts";
> >> > +	ts_data->input_dev->id.bustype = BUS_I2C;
> >> > +
> >> > +	input_set_drvdata(ts_data->input_dev, ts_data);
> >> > +
> >> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_X);
> >> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_Y);
> >> > +	input_set_abs_params(ts_data->input_dev, ABS_MT_TOUCH_MAJOR,
> >> > +			     0, 255, 0, 0);
> >> > +
> >> > +	touchscreen_parse_properties(ts_data->input_dev, true, &ts_data->prop);
> >> > +
> >> > +	if (!ts_data->prop.max_x || !ts_data->prop.max_y) {
> >> > +		dev_err(&client->dev,
> >> > +			"Invalid x/y (%d, %d), using defaults\n",
> >> > +			ts_data->prop.max_x, ts_data->prop.max_y);
> >> > +		ts_data->prop.max_x = 1152;
> >> > +		ts_data->prop.max_y = 1920;
> >> > +		input_abs_set_max(ts_data->input_dev,
> >> > +				  ABS_MT_POSITION_X, ts_data->prop.max_x);
> >> > +		input_abs_set_max(ts_data->input_dev,
> >> > +				  ABS_MT_POSITION_Y, ts_data->prop.max_y);
> >> > +	}
> >> > +
> >> > +	err = input_mt_init_slots(ts_data->input_dev,
> >> > +				  ts_data->pdata->max_touch_num,
> >> > +				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> >> > +	if (err < 0) {
> >> > +		dev_err(&ts_data->client->dev,
> >> > +			"Input device registration failed\n");
> >> > +		return err;
> >> > +	}
> >> > +
> >> > +	err = input_register_device(ts_data->input_dev);
> >> > +	if (err < 0) {
> >> > +		dev_err(&ts_data->client->dev,
> >> > +			"Input device registration failed\n");
> >> > +		return err;
> >> > +	}
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static int hyn_probe(struct i2c_client *client)
> >> > +{
> >> > +	struct hynitron_ts_data *ts_data;
> >> > +	int err;
> >> > +
> >> > +	ts_data = devm_kzalloc(&client->dev, sizeof(*ts_data), GFP_KERNEL);
> >> > +	if (!ts_data)
> >> > +		return -ENOMEM;
> >> > +
> >> > +	ts_data->client = client;
> >> > +	i2c_set_clientdata(client, ts_data);
> >> > +
> >> > +	ts_data->reset_gpio = devm_gpiod_get(&client->dev,
> >> > +					     "reset", GPIOD_OUT_LOW);
> >> > +	err = PTR_ERR_OR_ZERO(ts_data->reset_gpio);
> >> > +	if (err < 0) {
> >> > +		dev_err(&client->dev, "request reset gpio failed: %d\n", err);
> >> > +		return err;
> >> > +	}
> >> > +
> >> > +	ts_data->pdata = of_device_get_match_data(&client->dev);
> >> > +	if (!ts_data->pdata)
> >> > +		return -EINVAL;
> >> > +
> >> > +	hyn_reset_proc(client, 60);
> >> > +
> >> > +	err = ts_data->pdata->bootloader_enter(client);
> >> > +	if (err < 0)
> >> > +		return err;
> >> > +
> >> > +	err = ts_data->pdata->init_input(client);
> >> > +	if (err < 0)
> >> > +		return err;
> >> > +
> >> > +	err = ts_data->pdata->firmware_info(client);
> >> > +	if (err < 0)
> >> > +		return err;
> >> > +
> >> > +	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> >> > +					hyn_interrupt_handler,
> >> > +					IRQF_ONESHOT,
> >> > +					"Hynitron Touch Int", client);
> >> > +	if (err < 0) {
> >> > +		dev_err(&client->dev, "failed to request IRQ\n");
> >> > +		return err;
> >> > +	}
> >> > +
> >> > +	return 0;
> >> > +}
> >> > +
> >> > +static const struct hynitron_ts_chip_data cst3xx_data = {
> >> > +	.max_touch_num		= 5,
> >> > +	.ic_chkcode		= 0xcaca0000,
> >> > +	.firmware_info		= &cst3xx_firmware_info,
> >> > +	.bootloader_enter	= &cst3xx_bootloader_enter,
> >> > +	.init_input		= &cst3xx_input_dev_int,
> >> > +	.report_touch		= &cst3xx_touch_report,
> >> > +};
> >> > +
> >> > +static const struct i2c_device_id hyn_tpd_id[] = {
> >> > +	{ .name = "hynitron_ts", 0 },
> >> > +	{ /* sentinel */ },
> >> > +};
> >> > +MODULE_DEVICE_TABLE(i2c, hyn_tpd_id);
> >> > +
> >> > +static const struct of_device_id hyn_dt_match[] = {
> >> > +	{ .compatible = "hynitron,cst340", .data = &cst3xx_data },
> >> > +	{ /* sentinel */ },
> >> > +};
> >> > +MODULE_DEVICE_TABLE(of, hyn_dt_match);
> >> > +
> >> > +static struct i2c_driver hynitron_i2c_driver = {
> >> > +	.driver = {
> >> > +		.name = "Hynitron-TS",
> >> > +		.of_match_table = of_match_ptr(hyn_dt_match),
> >> > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> >> > +	},
> >> > +	.id_table = hyn_tpd_id,
> >> > +	.probe_new = hyn_probe,
> >> > +};
> >> > +
> >> > +module_i2c_driver(hynitron_i2c_driver);
> >> > +
> >> > +MODULE_AUTHOR("Chris Morgan");
> >> > +MODULE_DESCRIPTION("Hynitron Touchscreen Driver");
> >> > +MODULE_LICENSE("GPL");
> >> > -- 
> >> > 2.25.1
