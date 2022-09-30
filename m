Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8037D5F0EE9
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 17:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiI3PfA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 11:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiI3Pe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 11:34:58 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C329E3CBF5;
        Fri, 30 Sep 2022 08:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJIXj8IrGe2IEDMsJk3FzVEJvzj0nNKBbQrTV17taK5+NDxB/XdjsIUM82w/mDqNTdo9jw4B0qL1TTfaK1tEF5Va1Ea2QRx62Vbk8iUMlbg5ExYBd4WVD6pRhKhak4FaUewmwoGCOq2Yr91MXGixgD2TFevjKmqy7BWH2yk54PPdsFvfuuUfyqZpPhNiWXt0JIoeM6XDNIC2o5fuoLvWdUpQBXQVcU34WSr9T+Ko18Pieic4gGKtmbeePFqtUolkat7TygDcUz7yNe5tVWQ7VhEqt2gvHKmk/PastXOk2YgnwDQ4SCeKYFY0WYkcPLqD+YjJUgT0yuBhYyUrnxQv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLqDgEkiqkmNFqo4WDFU46dUr5b9qMUGfFaJvXmksHo=;
 b=iUGxNTbm8+cd/fyGn/JVUQtXeCjecYaf3cpP8YNZ+b4zos2EzHJ9kmjYo+3ehD7eYr8essO5O6PPJgjL5mRafM8Z7DVTUdX8O92KySAFdR6hrkGzyWma8DLozqHsPrZDZCQfAItKExp7cem0rlV+zzTcK2vdoZ4EVJTXuDb/NhF761R4BGCPfZuzVKs9Wh5hZco5Thr8KzVryQzN13YUxNnuEZ7Ui4RWmyYaUUPWUkjwY2G7Ru/nHfGs5uWX8tT8XGVZ+LwywNNTgdoOZqdIS/JfYF7WOiLG8dhPKhnFL9XZnOdpQreCz4DRZsO17a6gl/U7stj2HkQ0iLA4fm/MOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLqDgEkiqkmNFqo4WDFU46dUr5b9qMUGfFaJvXmksHo=;
 b=Lf7IImmLZftFxmhPoQuCEKB0o2E9j2YBgmTmDqTL9MSRl4Xt/veFeXAT5DrdihXYgVvyn9UcXIkCNNkzHZLR8PuakQLx2WPyIwnJEYWS9PWCAZVBX3aExrhY/RTm9ZqYTI3ZqHzeJslHYNfIgjn0+3Vp0e3ZFpdEcB+A6J3WK/zxPKEXCBRKP42TCrL8X2NNp7kDu8dFbaJEHhLnDq3CLvYcYTzOHU7HVlORR19a/+OdXSyqem0Jbi8zWHYCf718TCYmMmFPjjYER5X6Jy1mNDXmHtYq+aUVJqvY4jxvMNgwDQ8pyoRPFqOy39QBiVLoUMNPnmzsgxolXsRU4g342Q==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BL0PR06MB4691.namprd06.prod.outlook.com (2603:10b6:208:5b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:34:52 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 15:34:52 +0000
Date:   Fri, 30 Sep 2022 10:34:50 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <SN6PR06MB5342901F1E899851B6D9670CA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
 <20220928214806.13572-4-macroalpha82@gmail.com>
 <YzXGu1YeelH5CGFn@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzXGu1YeelH5CGFn@google.com>
X-TMN:  [gji/sIasyyNh29WU3IjwYMqml2xC2cGE]
X-ClientProxiedBy: SN6PR16CA0072.namprd16.prod.outlook.com
 (2603:10b6:805:ca::49) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220930153450.GB20@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|BL0PR06MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: a30af617-eb1a-459f-4bf7-08daa2f95107
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIdNG82QtkqAL3U5W5DsLC7AQyeevo6cPOzjdYsf6wqu42HxAlsrm5hVTNFnf0muETJeGAWNfCV6WEOu+6IWVYsppWRj5kaqwk/VKdOSl06eyMPgR0Y/nMrYPoTdAqjvwNbgR/UWwCiQ8OKq8EP0z8rNef6Fr/5r8g7HvahNt83qfb+0YtoHyksOsfYIP9orzQ+EYl4VAYsiznWK1Kt2JwynQCKhD0XJTsr+RMQYQwY5m0mFexWG5s0IsVO5RvDUY0O03b3lvDVWFWlZGmQ+Mk3vNirgBadRhUkUim87HpS2xdBUP9hOKzpJQwjHz1qmOD7dIwVF+D+hPEfPs1g77//eicDJvrtqe6XTTpk/gdj9Cx8KFkAqyvcWFn/eZ4/2ZIe7zKF6RxmgzRnZtzXonDu2EvS39nhEKg7ywN18vBdFSfhBrm32F4tw2cOmN4/wxj2Vu5oA3UWyZXwozHATxAL1PLw3e5s9QyYK2K2W0kjmW5UdSceUl2rsKhLWWBlh6xnhl/tV1BHkIPbvNLrqBk+KB9QxgW+LtchDnCk3RS3j0b0J7ubcLhb7kA89UmFtphZxDD1tTfg4stBF0s0n+ud1315wkQVaO/VrBprfG8Hbn3YHMQjGgPNX+QTlKMhGkaCVdif5YAlzIaRhIwOKXc/mw7SpYINrvJIjb8z+VXvIUz8IcI10OxMmxUMyaagK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hm/zsnZlj5ODGdt9uFn8fZcAVb8srE8PzgBiQhM6aBsBAuUVDRF/q1JC4Onc?=
 =?us-ascii?Q?tuIC8DzWneVAWEHqPpiGRL376158Km9ABnETxS4squ+dmrG6qgvKY/quZOdY?=
 =?us-ascii?Q?LbsKrUGSl2fvFa5yveZHIi2jt6lzawW3Rq1JPOsuCpl1jFfEIr8k+BuM8AJv?=
 =?us-ascii?Q?1d3Sd4QFxbPaDNEzaJ/vfqa8R1o76/lbyIxrwtLDqND0EgwJZXh+koghRKLW?=
 =?us-ascii?Q?dAWn5hSnAFwIAwt1SBqh10K3w6rJNVGXw05xgj6PBap+EP36UIMlVeToYbZX?=
 =?us-ascii?Q?0vj5C37zIuxGCdq9UQ+8g/MF9lSDNlq9pE+uvew/tx/Bxqy5LzuzTMvAw+5g?=
 =?us-ascii?Q?pSZ5ViHV890f2plA2kGqp/GRhBKI1kAmC5q+dA/phPLiNJ8Sga7DQm3HlIvp?=
 =?us-ascii?Q?9kfdD7hUZJK4MlJmTXcnqMf81z9ga1hxMzJ6iqZKXUbELjMFKD0DT3m+R+rq?=
 =?us-ascii?Q?okXMJsM7GLEyDDw7u7oNq+odTgUtDuP6gpalj3TqELzZT9aMtuHqjn8pZxMD?=
 =?us-ascii?Q?MYmvYNlgHWfmMdD3ohWXiisSk6IU8YCV3/8vnVLlsf5RCEjUJwZ8BxcM9eh9?=
 =?us-ascii?Q?57+3nU7VuiSItn0HbbvLQcLrXa3oc5dYGAkjuHvMB2SS36vjIcB5mQnASbj3?=
 =?us-ascii?Q?NECYKNL4ES3UXLxIwihOw/Yxc5HkbFWgq4H7iEVS4Z1ZQ2Ut1Ug0x9vFyvJ5?=
 =?us-ascii?Q?hHiNrkibGxjXdGSc6yJroS2T9t0y6Uj7Nkxl+wnnEXh2qn9fkUuFgWAEV5SS?=
 =?us-ascii?Q?6sEIxCt/usIt4ejRqevPemz29XY9KBHScKLrXd7OnoauxM0lld2dyEagCxFH?=
 =?us-ascii?Q?QLPpScDBCDY7MY4+8zKsw/4283qd7pQsxXO0tbFX4KxU+IO/0RaJ7K74jCV2?=
 =?us-ascii?Q?4NDMmNczCQj9e60FbUUviQSsx/Vd8XkgpQVAJJh7BK8Ztgh6F1cCfE2Tw7F1?=
 =?us-ascii?Q?TUxcedXu94cwoiHf4MhfHaQ0Po1ECnycjfl8/9jPdoJagOylI6h65aQ8V/wy?=
 =?us-ascii?Q?O99GRolRXvFjrSsYF8d7eSlufBnUAAb6BUk7Ye80NZvxRqUgDFEkDWi0ZeGk?=
 =?us-ascii?Q?Chq6oFkIc6/uSVELJaAro4r60qkU1Vh5AdY6RiaiSeoiJyoKHPdzztdA0/S8?=
 =?us-ascii?Q?mOPymYLaC9UZYD+YJs5kWuFeFkOlvNDpxKaOI9tH7n5t44aVVKGAO5f6vA4m?=
 =?us-ascii?Q?PeNzV/nn5Unqxy9/KoB3gtR9XA6pa9pCyOeK9oPVtLWGbPmDiK1Nhxg1Wsi7?=
 =?us-ascii?Q?jWhG+NAqNric+FdwqG/fteCn2GNd8dgqOHrT5fv7Wg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a30af617-eb1a-459f-4bf7-08daa2f95107
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:34:52.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4691
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 29, 2022 at 09:24:27AM -0700, Dmitry Torokhov wrote:
> Hi Chris,
> 
> On Wed, Sep 28, 2022 at 04:48:06PM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add support for the Hynitron cst3xx controller found on devices such
> > as the Anbernic RG353P and RG353V (the Hynitron CST348). This driver
> > was built from sources provided by Hynitron to Anbernic (possibly
> > via Rockchip as an intermediary) and marked as GPLv2 in the code.
> > This driver was written strictly for the cst3xx series, but in
> > most places was left somewhat generic so support could be easily
> > added to other devices in the future.
> 
> Thank you for the patches. This looks generally good, just a few
> suggestions below.
> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/input/touchscreen/Kconfig           |  12 +
> >  drivers/input/touchscreen/Makefile          |   1 +
> >  drivers/input/touchscreen/hynitron_cstxxx.c | 483 ++++++++++++++++++++
> >  3 files changed, 496 insertions(+)
> >  create mode 100644 drivers/input/touchscreen/hynitron_cstxxx.c
> > 
> > diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> > index 2d70c945b20a..9a9528e59c36 100644
> > --- a/drivers/input/touchscreen/Kconfig
> > +++ b/drivers/input/touchscreen/Kconfig
> > @@ -422,6 +422,18 @@ config TOUCHSCREEN_HYCON_HY46XX
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called hycon-hy46xx.
> >  
> > +config TOUCHSCREEN_HYNITRON_CSTXXX
> > +	tristate "Hynitron touchscreen support"
> > +	depends on I2C
> > +	help
> > +	  Say Y here if you have a touchscreen using a Hynitron
> > +	  touchscreen controller.
> > +
> > +	  If unsure, say N.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called hynitron-cstxxx.
> > +
> >  config TOUCHSCREEN_ILI210X
> >  	tristate "Ilitek ILI210X based touchscreen"
> >  	depends on I2C
> > diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> > index 557f84fd2075..43860ca19b98 100644
> > --- a/drivers/input/touchscreen/Makefile
> > +++ b/drivers/input/touchscreen/Makefile
> > @@ -47,6 +47,7 @@ obj-$(CONFIG_TOUCHSCREEN_EXC3000)	+= exc3000.o
> >  obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
> >  obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
> >  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> > +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
> >  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
> >  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> >  obj-$(CONFIG_TOUCHSCREEN_IMAGIS)	+= imagis.o
> > diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
> > new file mode 100644
> > index 000000000000..e963968593c3
> > --- /dev/null
> > +++ b/drivers/input/touchscreen/hynitron_cstxxx.c
> > @@ -0,0 +1,483 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  Driver for Hynitron cstxxx Touchscreen
> > + *
> > + *  Copyright (c) 2022 Chris Morgan <macromorgan@hotmail.com>
> > + *
> > + *  This code is based on hynitron_core.c authored by Hynitron.
> > + *  Note that no datasheet was available, so much of these registers
> > + *  are undocumented. This is essentially a cleaned-up version of the
> > + *  vendor driver with support removed for hardware I cannot test and
> > + *  device-specific functions replated with generic functions wherever
> > + *  possible.
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/i2c.h>
> > +#include <linux/input.h>
> > +#include <linux/input/mt.h>
> > +#include <linux/input/touchscreen.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +
> > +/* Per device data */
> > +struct hynitron_ts_platform_data {
> 
> This better be called hynitron_ts_chip as we call "platform data"
> something that differs per-board, not per-chip version.

Acknowledged.

> 
> > +	unsigned int max_touch_num;
> > +	u32 ic_chkcode;
> > +	int (*firmware_info)(struct i2c_client *client);
> > +	int (*bootloader_enter)(struct i2c_client *client);
> > +	int (*init_input)(struct i2c_client *client);
> > +	void (*report_touch)(struct i2c_client *client);
> > +};
> > +
> > +/* Data generic to all (supported and non-supported) controllers. */
> > +struct hynitron_ts_data {
> > +	const struct hynitron_ts_platform_data *pdata;
> > +	struct i2c_client *client;
> > +	struct device *dev;
> 
> Not sure if this really needed as I think everywhere you use it you also
> have "client->dev" available.
> 

Acknowledged.

> > +	struct input_dev *input_dev;
> > +	struct touchscreen_properties prop;
> > +	struct gpio_desc *reset_gpio;
> > +	struct gpio_desc *irq_gpio;
> 
> I do not believe this field is being used.
> 

Acknowledged.

> > +	u32 fw_version;
> > +};
> > +
> > +/*
> > + * Hard coded reset delay value of 20ms not IC dependent in
> > + * vendor driver.
> > + */
> > +void hyn_reset_proc(struct i2c_client *client, int delay)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +
> > +	gpiod_set_value(ts_data->reset_gpio, 1);
> > +	mdelay(20);
> > +	gpiod_set_value(ts_data->reset_gpio, 0);
> 
> I think you can use gpiod_set_value_cansleep() in both places.
> 

Acknowledged. I'll confirm it works and if so make the change. If not,
I'll note it in the next version notes.

> > +	if (delay)
> > +		mdelay(delay);
> > +}
> > +
> > +static irqreturn_t hyn_interrupt_handler(int irq, void *dev_id)
> > +{
> > +	struct i2c_client *client = dev_id;
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +
> > +	ts_data->pdata->report_touch(client);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +/*
> > + * The vendor driver would retry twice before failing to read or write
> > + * to the i2c device.
> > + */
> > +int cst3xx_i2c_read(struct i2c_client *client,
> > +		    unsigned char *buf, int len)
> > +{
> > +	int ret;
> > +	int retries = 0;
> > +
> > +	while (retries < 2) {
> > +		ret = i2c_master_recv(client, buf, len);
> > +		if (ret <= 0)
> > +			retries++;
> > +		else
> > +			break;
> > +	}
> > +
> > +	return ret;
> 
> I like when functions return 0 or negative, not positive (when
> possible). So I wonder if we should do something like:
> 

Understood, I'll redo this to make it return 0 on success
instead of a positive value.

> 	if (ret == len)
> 		return 0;
> 
> 	return ret < 0 ? ret : -EIO;
> 
> and then in callers we can do:
> 
> 	error = cst3xx_i2c_read(...)
> 	if (error)
> 		...
> 
> > +}
> > +
> > +int cst3xx_i2c_write(struct i2c_client *client,
> > +		     unsigned char *buf, int len)
> > +{
> > +	int ret;
> > +	int retries = 0;
> > +
> > +	while (retries < 2) {
> > +		ret = i2c_master_send(client, buf, len);
> > +		if (ret <= 0)
> > +			retries++;
> > +		else
> > +			break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +int cst3xx_i2c_read_register(struct i2c_client *client,
> > +			     unsigned char *buf, int len)
> 

Is my ignorance of the i2c protocol an acceptable answer? I'll try
this out on the next go-round.

> Why don't you have register as a separate u16 argument and then use
> cpu_to_le16[p] to convert to on-wire format.
> 
> > +{
> > +	int ret;
> > +
> > +	ret = cst3xx_i2c_write(client, buf, 2);
> > +	ret = cst3xx_i2c_read(client, buf, len);
> 
> This clobbers errors from writing register. I also wonder if you can
> use i2c_transfer with 2 messages, one for writing register, and another
> for reading data.
> 
> > +
> > +	return ret;
> > +}
> > +
> > +int cst3xx_firmware_info(struct i2c_client *client)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +	int ret;
> > +	u32 tmp;
> > +	unsigned char buf[4];
> > +
> > +	/*
> > +	 * Testing suggests command is required to allow reading of
> > +	 * firmware registers.
> > +	 */
> > +	buf[0] = 0xd1;
> > +	buf[1] = 0x01;
> 
> I wonder if we can define some symbolic names for these.
> 

I don't know what they mean, the best I can do is guess. No
datasheet sadly. I know from preliminary testing if I don't
send this initial command here the rest of them fail, so I
assume this command allows me to read certain registers?

> > +	ret = cst3xx_i2c_write(client, buf, 2);
> 
> This looks like a candidate for
> 
> 	error = cst3xx_i2c_send_command(client, 0x01d1);
> 
> helper that would wrap cst3xx_i2c_write.

Acknowledged.

> 
> > +	if (ret < 0)
> > +		return -EIO;
> > +
> > +	mdelay(10);
> > +
> > +	/*
> > +	 * Read register for check-code to determine if device detected
> > +	 * correctly.
> > +	 */
> > +	buf[0] = 0xd1;
> > +	buf[1] = 0xfc;
> > +	ret = cst3xx_i2c_read_register(client, buf, 4);
> > +	if (ret < 0)
> > +		return -EIO;
> > +
> > +	memcpy(&tmp, buf, 4);
> > +	if ((le32_to_cpu(tmp) & 0xffff0000) != ts_data->pdata->ic_chkcode) {
> > +		dev_err(&client->dev, "%s ic mismatch\n", __func__);
> > +		return -ENODEV;
> > +	}
> > +
> > +	mdelay(10);
> > +
> > +	/* Read firmware version and test if firmware missing. */
> > +	buf[0] = 0xd2;
> > +	buf[1] = 0x08;
> > +	ret = cst3xx_i2c_read_register(client, buf, 4);
> > +	if (ret < 0)
> > +		return -EIO;
> > +
> > +	memcpy(&tmp, buf, 4);
> > +
> > +	ts_data->fw_version = le32_to_cpu(tmp);
> > +	if (ts_data->fw_version == 0xa5a5a5a5) {
> > +		dev_err(&client->dev, "Device firmware missing\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	/*
> > +	 * Testing suggests command required to exit register reading mode
> > +	 * and allow device to function as touchscreen.
> > +	 */
> > +	buf[0] = 0xd1;
> > +	buf[1] = 0x09;
> > +	ret = cst3xx_i2c_write(client, buf, 2);
> > +	if (ret < 0)
> > +		return -EIO;
> > +
> > +	mdelay(5);
> > +
> > +	return 0;
> > +}
> > +
> > +int cst3xx_bootloader_enter(struct i2c_client *client)
> > +{
> > +	int ret;
> > +	u8 retry;
> > +	unsigned char buf[4];
> > +
> > +	for (retry = 0; retry < 5; retry++) {
> > +		hyn_reset_proc(client, (7 + retry));
> > +		/* set cmd to enter program mode */
> > +		buf[0] = 0xa0;
> > +		buf[1] = 0x01;
> > +		buf[2] = 0xaa;
> > +		ret = cst3xx_i2c_write(client, buf, 3);
> > +		if (ret < 0)
> > +			continue;
> > +		mdelay(2);
> > +
> > +		/* check whether in program mode */
> > +		buf[0] = 0xa0;
> > +		buf[1] = 0x02;
> > +		ret = cst3xx_i2c_read_register(client, buf, 1);
> > +
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		if (buf[0] == 0xac)
> > +			break;
> > +	}
> > +
> > +	if (buf[0] != 0xac) {
> > +		dev_err(&client->dev, "%s unable to enter bootloader mode\n",
> > +			__func__);
> > +		return -ENODEV;
> > +	}
> > +
> > +	hyn_reset_proc(client, 40);
> > +
> > +	return 0;
> > +}
> > +
> > +static void cst3xx_touch_update(struct hynitron_ts_data *ts_data, s32 id,
> > +				s32 x, s32 y, s32 w)
> > +{
> > +	input_mt_slot(ts_data->input_dev, id);
> > +	input_mt_report_slot_state(ts_data->input_dev, MT_TOOL_FINGER, 1);
> > +	touchscreen_report_pos(ts_data->input_dev, &ts_data->prop, x, y, true);
> > +	input_report_abs(ts_data->input_dev, ABS_MT_TOUCH_MAJOR, w);
> > +}
> > +
> > +int cst3xx_finish_touch_read(struct i2c_client *client)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +	unsigned char buf[3];
> > +	int ret;
> > +
> > +	buf[0] = 0xd0;
> > +	buf[1] = 0x00;
> > +	buf[2] = 0xab;
> > +	ret = cst3xx_i2c_write(ts_data->client, buf, 3);
> > +	if (ret < 0) {
> > +		dev_err(ts_data->dev, "send read touch info ending failed.\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Handle events from IRQ. Note that for cst3xx it appears that IRQ
> > + * fires continuously while touched, otherwise once every 1500ms
> > + * when not touched (assume touchscreen waking up periodically).
> > + */
> > +static void cst3xx_touch_report(struct i2c_client *client)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +	unsigned char buf[30];
> > +	unsigned char finger_id, sw;
> > +	unsigned int input_x = 0;
> > +	unsigned int input_y = 0;
> > +	unsigned int input_w = 0;
> > +	int idx = 0;
> > +	int i, ret;
> > +	int touch_cnt, i2c_len;
> > +
> > +	buf[0] = 0xd0;
> > +	buf[1] = 0x00;
> > +
> > +	/* Read and validate the first bits of input data. */
> > +	ret = cst3xx_i2c_read_register(ts_data->client, buf, 7);
> > +	if ((ret < 0) || (buf[6] != 0xab) || (buf[0] == 0xab))
> > +		goto end;
> > +
> > +	touch_cnt = buf[5] & 0x7f;
> > +
> > +	/* If no touches registered, clear the input slots. */
> > +	if (touch_cnt == 0) {
> > +		input_mt_sync_frame(ts_data->input_dev);
> > +		input_sync(ts_data->input_dev);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * If we have only one touch, we have enough data to process
> > +	 * the event. If we have more than one touch we need to read
> > +	 * the rest of the data. Note these functions are not combined
> > +	 * because this is how it was done in the vendor driver and I
> > +	 * lack the datasheet to modify the necessary values for
> > +	 * reading from all the registers at once.
> > +	 */
> > +	if (touch_cnt > 1) {
> > +		buf[5] = 0xd0;
> > +		buf[6] = 0x07;
> > +		i2c_len = (touch_cnt - 1) * 5 + 1;
> > +		ret = cst3xx_i2c_read_register(ts_data->client,
> > +					       &buf[5], i2c_len);
> > +		if (ret < 0)
> > +			goto end;
> > +		i2c_len += 5;
> > +
> > +		if (buf[i2c_len - 1] != 0xab)
> > +			goto end;
> > +	}
> > +
> > +	ret = cst3xx_finish_touch_read(client);
> 
> Do we have to do this here? Can we jump to "end" label? The function
> looks a bit messy.
> 

I'll see if I can clean it up better.

> > +	if (ret < 0) {
> > +		dev_err(ts_data->dev, "cst3xx touch read failure\n");
> > +		return;
> > +	}
> > +
> > +	for (i = 0; i < touch_cnt; i++) {
> > +		input_x = ((buf[idx + 1] << 4) | ((buf[idx + 3] >> 4) & 0x0f));
> > +		input_y = ((buf[idx + 2] << 4) | (buf[idx + 3] & 0x0f));
> > +		input_w = (buf[idx + 4] >> 3);
> > +		sw = (buf[idx] & 0x0f) >> 1;
> > +		finger_id = (buf[idx] >> 4) & 0x0f;
> > +
> > +		/* Sanity check we don't have more fingers than we expect */
> > +		if (ts_data->pdata->max_touch_num < finger_id) {
> > +			dev_err(ts_data->dev, "cst3xx touch read failure\n");
> > +			break;
> > +		}
> > +
> > +		/* sw value of 0 means no touch, 0x03 means touch */
> > +		if (sw == 0x03)
> > +			cst3xx_touch_update(ts_data, finger_id,
> > +					    input_x, input_y, input_w);
> > +
> > +		idx += 5;
> > +	}
> > +
> > +	input_mt_sync_frame(ts_data->input_dev);
> > +	input_sync(ts_data->input_dev);
> > +	return;
> > +end:
> > +	cst3xx_finish_touch_read(client);
> > +	dev_err(ts_data->dev, "cst3xx touch read failure\n");
> > +}
> > +
> > +int cst3xx_input_dev_int(struct i2c_client *client)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +	int ret = 0;
> 
> Call this variable "error" and not initialize to 0.
> 

Acknowledged.

> > +
> > +	ts_data->input_dev = devm_input_allocate_device(&ts_data->client->dev);
> > +	if (!ts_data->input_dev) {
> > +		dev_err(&ts_data->client->dev,
> > +			"Failed to allocate input device.\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	ts_data->input_dev->name = "Hynitron cst3xx Touchscreen";
> > +	ts_data->input_dev->phys = "input/ts";
> > +	ts_data->input_dev->id.bustype = BUS_I2C;
> > +	ts_data->input_dev->dev.parent = ts_data->dev;
> 
> No need to set parent because devm_input_allocate_device() does this for
> us.

Thanks, I'll do that.

> 
> > +
> > +	input_set_drvdata(ts_data->input_dev, ts_data);
> > +
> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_X);
> > +	input_set_capability(ts_data->input_dev, EV_ABS, ABS_MT_POSITION_Y);
> > +	input_set_abs_params(ts_data->input_dev, ABS_MT_TOUCH_MAJOR,
> > +			     0, 255, 0, 0);
> > +
> > +	touchscreen_parse_properties(ts_data->input_dev, true, &ts_data->prop);
> > +
> > +	if (!ts_data->prop.max_x || !ts_data->prop.max_y) {
> > +		dev_err(&ts_data->client->dev,
> > +			"Invalid x/y (%d, %d), using defaults\n",
> > +			ts_data->prop.max_x, ts_data->prop.max_y);
> > +		ts_data->prop.max_x = 1152;
> > +		ts_data->prop.max_y = 1920;
> > +		input_abs_set_max(ts_data->input_dev,
> > +				  ABS_MT_POSITION_X, ts_data->prop.max_x);
> > +		input_abs_set_max(ts_data->input_dev,
> > +				  ABS_MT_POSITION_Y, ts_data->prop.max_y);
> > +	}
> > +
> > +	input_mt_init_slots(ts_data->input_dev, ts_data->pdata->max_touch_num,
> > +			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> 
> This mat fail so please handle errors here too.
> 

Acknowledged.

> > +
> > +	ret = input_register_device(ts_data->input_dev);
> > +	if (ret < 0) {
> > +		dev_err(&ts_data->client->dev,
> > +			"Input device registration failed\n");
> > +		return ret;
> > +	}
> > +
> > +	return ret;
> 
> 	return 0;
> 

Acknowledged.

> > +}
> > +
> > +static int hyn_probe(struct i2c_client *client)
> > +{
> > +	struct hynitron_ts_data *ts_data;
> > +	int ret;
> 
> Call this variable "error" please.
> 

Will do.

> > +
> > +	ts_data = devm_kzalloc(&client->dev, sizeof(*ts_data), GFP_KERNEL);
> > +	if (!ts_data)
> > +		return -ENOMEM;
> > +
> > +	ts_data->client = client;
> > +	ts_data->dev = &client->dev;
> > +	i2c_set_clientdata(client, ts_data);
> > +
> > +	ts_data->reset_gpio = devm_gpiod_get(&client->dev,
> > +					     "reset", GPIOD_OUT_LOW);
> 
> I've become fond of:
> 
> 	error = PTR_ERR_OR_ZERO(ts_data->reset_gpio);
> 

Okay, I'll do that.

> > +	if (IS_ERR(ts_data->reset_gpio)) {
> > +		ret = PTR_ERR(ts_data->reset_gpio);
> > +		dev_err(&client->dev, "request reset gpio failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ts_data->pdata = of_device_get_match_data(&client->dev);
> > +	if (!ts_data->pdata)
> > +		return -EINVAL;
> > +
> > +	hyn_reset_proc(client, 60);
> > +
> > +	ret = ts_data->pdata->bootloader_enter(client);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = ts_data->pdata->init_input(client);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = ts_data->pdata->firmware_info(client);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> > +					hyn_interrupt_handler,
> > +					IRQF_ONESHOT,
> > +					"Hynitron Touch Int", client);
> > +	if (ret < 0) {
> > +		dev_err(&client->dev, "failed to request IRQ\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct hynitron_ts_platform_data cst3xx_data = {
> > +	.max_touch_num		= 5,
> > +	.ic_chkcode		= 0xcaca0000,
> > +	.firmware_info		= &cst3xx_firmware_info,
> > +	.bootloader_enter	= &cst3xx_bootloader_enter,
> > +	.init_input		= &cst3xx_input_dev_int,
> > +	.report_touch		= &cst3xx_touch_report,
> > +};
> > +
> > +static const struct i2c_device_id hyn_tpd_id[] = {
> > +	{ .name = "hynitron_ts", 0 },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, hyn_tpd_id);
> > +
> > +static const struct of_device_id hyn_dt_match[] = {
> > +	{ .compatible = "hynitron,cst3xx", .data = &cst3xx_data },
> > +	{ /* sentinel */ },
> > +};
> > +MODULE_DEVICE_TABLE(of, hyn_dt_match);
> > +
> > +static struct i2c_driver hynitron_i2c_driver = {
> > +	.driver = {
> > +		.name = "Hynitron-TS",
> > +		.of_match_table = of_match_ptr(hyn_dt_match),
> > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table = hyn_tpd_id,
> > +	.probe_new = hyn_probe,
> > +};
> > +
> > +module_i2c_driver(hynitron_i2c_driver);
> > +
> > +MODULE_AUTHOR("Chris Morgan");
> > +MODULE_DESCRIPTION("Hynitron Touchscreen Driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.25.1
> > 
> 
> Thanks.

Thank you for your input. I'll make the requested changes and resubmit.

> 
> -- 
> Dmitry
