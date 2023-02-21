Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F52669D950
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 04:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbjBUDj3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Feb 2023 22:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjBUDj2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Feb 2023 22:39:28 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50F6BDF0
        for <linux-input@vger.kernel.org>; Mon, 20 Feb 2023 19:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmhtbexnhNpzcgUzScgjF0QvWA4uvRT0b/MvI1PVmvnJVqx/QN3p9bKkFdKyC3W/X7yPblR9yswoj+yNCN562Hy1I7K8o7+Na/W67JPZUEYsF8BmpOvV7rGLIhRf5LoMOhs2dZCO4UrxhMMFeJCNvir/K13DDcVsiwx8fenhDcQtkSv9OSgk+u/5p4JScJa/CS9tQqKgTNPynXkpI28u5woie276AjQx8abpS35pNu3zaIeQ0APrJPZer5SLvB5pH85viCOf7RmkYDWB1OubwYMIK40smTQ2y1bTu7ejFs/C2VmBwaCWUXbnIlVsV068lypoaglrRu4yh7Ou8pZxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8Bc7yJqVgesxXK+sbGZKjONJ5wkcYXbvFF+ePw5cmk=;
 b=f3JNn7BWQu+cV6UsxQwtUXDMvCQg80d64yVb4s1pt5awv3x0n8YnpysCGmUt9OuJcE2vTrcdBzdbBafveiUBqSeGM1Xd6BxNJKRwvdkn87jDcfKn/gkyF/tYdp0IoQhCFFHFcu/z4FSF354uyYS8BHtS5Wm1VSMFTgp/LeDPf+Bcpgo5m1h3yE63dh2NwoqcMnPxsdmwPGBbBkQIfX2qAvjdjgyDOv3O+iZJwOKwFqMkPxKQPbYz7xzvF3504mrZoILNTDY+k/x29ly8tF54CxdnzgfVY902VqzX2CJG3vQgEQ82igXw2K0xAuY/5GdWcNoBWkD3Yab86Qc4yCLoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8Bc7yJqVgesxXK+sbGZKjONJ5wkcYXbvFF+ePw5cmk=;
 b=qQBFKlN9YctYdN/cKLt8lsEPAdjQzmfgjm686fWR55WHMyL0el8u+JgxMtDWbLwkeDrDKPa2Glx31oozAcLEL3uGUCj/ZcfSqPqjOaxAgCFZ0kyXwJwCHn66HDYglkkBe3qFKtEedabj8QMaO9rnP3eIZrgdKRt6NkJhF67vzuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by PH0PR08MB6645.namprd08.prod.outlook.com
 (2603:10b6:510:43::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 03:39:20 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 03:39:20 +0000
Date:   Mon, 20 Feb 2023 21:39:14 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: touchscreen - Add new Novatek NVT-ts driver
Message-ID: <Y/Q84gI1AnE6oqRU@nixie71>
References: <20230217150749.32670-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217150749.32670-1-hdegoede@redhat.com>
X-ClientProxiedBy: DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7)
 To SN4PR0801MB3774.namprd08.prod.outlook.com (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|PH0PR08MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: 132b951a-dfde-4cd0-cd5c-08db13bd3774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVfhuNYxHfQ40n8UIXw6IXmwXRu5O3k3dMgXRbab7Fd2812sfS0LL+LbLFm00OaQcEJBvCHzJsSsbo6+SaH1+ChltcEVrNJsJZZr462ayjaTFeMuV8T7mLx47vvJQTyD4jmUKgDACb/mbeNLR0CFEI8ZmYQDYK+Sy517gAbPCbVEArA/MSs0LBuAQTynNqOvtINzatUDHPnmM02AREAfysP0PRalo+vlBcnSwqfxEeBwbpjas1mDvvxK70zF46dyEsKH8PvZ+gZpvxGW3suTJ5lJo2OsJtTkeDIIRDa/oIHHQzaoYhg4uAOKvoo8PV5xe/FrhVHFEHAgBUdEHAjw7PtxktETxYQ52BfnKPMiztgJKvLxM947mHnGg5O31RRKZr5OhkwCZ3riI6Db+4LQMCewwEUhuE3LXsGEFoKjwYwXxELrU2vgpOunA+iyO0VRkBzH+RBVaYgIjR5HjfloZkzq4qb65T/lIqNJr80JXydhojLibjD3JoatGATsBW0cLd2datz+lIqUmRqU7gawtqR87D+695CVqtHqxYAGc83t2+JdhGCcLGMkakCnIr9PvgqHiWDp7xb/ggyKY7klNgMgya6kKZYvobyEwaytdiZKb0QmY0D4NeRCBWlVqEnQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(346002)(366004)(39830400003)(396003)(136003)(451199018)(8936002)(5660300002)(66476007)(6916009)(4326008)(66946007)(86362001)(66556008)(8676002)(83380400001)(478600001)(6486002)(316002)(966005)(41300700001)(33716001)(186003)(26005)(6512007)(9686003)(2906002)(38100700002)(6666004)(30864003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s2jgZbv8846hndgu3GAKp9Ym+698vDgZGvxz4PpNI5cpaXG3OXgNKzm2hHxv?=
 =?us-ascii?Q?uvyBn4jjH2YKNCyYNnnO5QDsThhxCmgMcUWM0Vvi4i6HjMKelysiW45IzaVG?=
 =?us-ascii?Q?gHPVa0FqOb+r+zGXlWcWO7ADJiDyzOe8ClDw/UHPc8NYwwRQ/t2fCo6I3qWp?=
 =?us-ascii?Q?8YCBBX+Fcl9Alt1gkrFvGd1JVGjYmyXccO7XRrAWuuQ9CA/I25YLnzXYmGde?=
 =?us-ascii?Q?KoJ+TExVXBSgL+nbdAcDeOge1CqI0SfF9tN2ReyI+AXNT62X8HGoxTYg11Zt?=
 =?us-ascii?Q?94Wa7Lwx/y8c4cmzRd03dON1pjX5W/nFuqsdV72T0vnSPwKa628+HG0kmNvt?=
 =?us-ascii?Q?SzGgHFHdJciNTorMZE2oAEYEhnxYGdwpcD7GJKGaaeayWwU0LNkGAFr4JSIa?=
 =?us-ascii?Q?qfI3gX3T8SwosTVZejOX2HjwTuQMgdmo/+jvfb+m1xiPg1Adssr8SVWpPJz/?=
 =?us-ascii?Q?ygbuDPB1xcMTVOxfDrY2VC9a5ZIcbE1XJRS5AH15CekvvO32adXyJtbNHrsy?=
 =?us-ascii?Q?AbpCFzuhIACATiQCjfB+jho2UJ+T03Q9n6nYaBTOWeEMa1XkzI0Wgx0FZvpj?=
 =?us-ascii?Q?w6RAXucn68JVHDwLdIpzFTFjPTaoXK2Ma4zbM5gHQp929knFevrNVJag4kuL?=
 =?us-ascii?Q?n3KLGOjPufSDDcin/LDvQtFhJtTSGR2olUvX8GrhwCquOy659fb9kezr6Z10?=
 =?us-ascii?Q?hRWNiM/mIVjW0ULEQlUmrPXqGiNx/yionoz4o8g1qCWQcMDMoVkfXPiHgBVl?=
 =?us-ascii?Q?DISemCq67QCKBMAfmyZwY8vJpsXhrSgCgVWKT4FSLELkVk1zTa45gR3Va851?=
 =?us-ascii?Q?NrvZzCMuLGGfhoj2cLpwFU3+p5SP/9qtdyhP1yG+0+d6CjMZtSQMbVYvAkN5?=
 =?us-ascii?Q?rXTq4EH1lx4ihNQLy4UF+zeXE/zLNIIHeObsIAM+PGTueM98VAwhRRdM5BKA?=
 =?us-ascii?Q?zoKV/X08a4I7yVNCMMDjh06hnaSfXR2EqZ4qQ9Wvk2R9K5As1KlRTDFlUd3U?=
 =?us-ascii?Q?1X35qcxljS3BR4uvMk+KSu1+Re4ho9Mw996g817zzEcIxqaCAZLdISmgPwjX?=
 =?us-ascii?Q?7GrgwMvaFkiwhelxLuIrRrYnS/8XX6tr11qh21bzP9BziwRpm2Pmm53KX7LO?=
 =?us-ascii?Q?PM8WHq9jVsjCntvQFwslzHW3RjoLiZ92S9dadBU3E3RrcPsEkKU/Gg6z64tf?=
 =?us-ascii?Q?rw5wx3aCPHbS2VJm0sFTmf6nhOoHycJadlLqo7RQbZBw7H2WSOJyoa/8qC/u?=
 =?us-ascii?Q?v6745B55Y+rg2AKB492CRpgPhHykIcs3SV/P1MBq5VITw3FB8C4RCV4rybSn?=
 =?us-ascii?Q?nI8Ve58WcAfw5zQUn+5LFSTgZIhaOTbbwuAbQ763ohPLdY02Ao+1TAwQFqc2?=
 =?us-ascii?Q?NaTKogPKbkV7yfQtrMeUloz3M58UnjlnnPw9YiWa5KKZcUoeH/shVHynQal5?=
 =?us-ascii?Q?jIakKHkEHTHqnh6LDVhAEbx5gY+u0hEeYYvEgdWS8SX66XTjiVeFGHDz6QvA?=
 =?us-ascii?Q?FLtsFHpKkPXV41lcllJ7M0azFutXbLMo/koUStDxtbm+oCCHbpJI5qwpVYrh?=
 =?us-ascii?Q?qy1ogg2kpcK39PMK+NQB73uTGPtgRhcdRajbhCcL?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132b951a-dfde-4cd0-cd5c-08db13bd3774
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 03:39:20.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEwmNjRwX9qS78Cw31bZm2CmYJwPm47oZtxvyjXdtC3dCXmcrHE5WhrPryxT5DOtIURre1+4k5K4eiOrQXoqzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB6645
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Fri, Feb 17, 2023 at 04:07:49PM +0100, Hans de Goede wrote:
> Add a new driver for the Novatek i2c touchscreen controller as found
> on the Acer Iconia One 7 B1-750 tablet. Unfortunately the touchscreen
> controller model-number is unknown. Even with the tablet opened up it
> is impossible to read the model-number.
> 
> Android calls this a "NVT-ts" touchscreen, but that may apply to other
> Novatek controller models too.
> 
> This appears to be the same controller as the one supported by
> https://github.com/advx9600/android/blob/master/touchscreen/NVTtouch_Android4.0/NVTtouch.c
> but unfortunately that does not give us a model-number either.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

This is a great driver; I have only a few comments below.

> ---
>  MAINTAINERS                                |   6 +
>  drivers/input/touchscreen/Kconfig          |  10 +
>  drivers/input/touchscreen/Makefile         |   1 +
>  drivers/input/touchscreen/novatek-nvt-ts.c | 288 +++++++++++++++++++++
>  4 files changed, 305 insertions(+)
>  create mode 100644 drivers/input/touchscreen/novatek-nvt-ts.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 60c0ded06e3f..0c051a973e6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14835,6 +14835,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
>  F:	tools/include/nolibc/
>  F:	tools/testing/selftests/nolibc/
>  
> +NOVATEK NVT-TS I2C TOUCHSCREEN DRIVER
> +M:	Hans de Goede <hdegoede@redhat.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/input/touchscreen/novatek-nvt-ts.c
> +
>  NSDEPS
>  M:	Matthias Maennich <maennich@google.com>
>  S:	Maintained
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 68d99a112e14..59ca8bfe9a95 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -666,6 +666,16 @@ config TOUCHSCREEN_MTOUCH
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called mtouch.
>  
> +config TOUCHSCREEN_NOVATEK_NVT_TS
> +	tristate "Novatek NVT-ts touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a Novatek NVT-ts touchscreen.
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called novatek-nvt-ts.
> +
>  config TOUCHSCREEN_IMAGIS
>  	tristate "Imagis touchscreen support"
>  	depends on I2C
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 4968c370479a..41654239f89c 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -67,6 +67,7 @@ obj-$(CONFIG_TOUCHSCREEN_MMS114)	+= mms114.o
>  obj-$(CONFIG_TOUCHSCREEN_MSG2638)	+= msg2638.o
>  obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
>  obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
> +obj-$(CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS)	+= novatek-nvt-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
>  obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
> new file mode 100644
> index 000000000000..2464c758ca14
> --- /dev/null
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Novatek i2c touchscreen controller as found on
> + * the Acer Iconia One 7 B1-750 tablet. The Touchscreen controller
> + * model-number is unknown. Android calls this a "NVT-ts" touchscreen,
> + * but that may apply to other Novatek controller models too.
> + *
> + * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/module.h>
> +
> +#include <asm/unaligned.h>
> +
> +#define NVT_TS_TOUCH_START		0x00
> +#define NVT_TS_TOUCH_SIZE		6
> +
> +#define NVT_TS_PARAMETERS_START		0x78
> +/* These are offsets from NVT_TS_PARAMETERS_START */
> +#define NVT_TS_PARAMS_WIDTH		0x04
> +#define NVT_TS_PARAMS_HEIGHT		0x06
> +#define NVT_TS_PARAMS_MAX_TOUCH		0x09
> +#define NVT_TS_PARAMS_MAX_BUTTONS	0x0a
> +#define NVT_TS_PARAMS_IRQ_TYPE		0x0b
> +#define NVT_TS_PARAMS_WAKE_TYPE		0x0c
> +#define NVT_TS_PARAMS_CHIP_ID		0x0e
> +#define NVT_TS_PARAMS_SIZE		0x0f
> +
> +#define NVT_TS_SUPPORTED_WAKE_TYPE	0x05
> +#define NVT_TS_SUPPORTED_CHIP_ID	0x05
> +
> +#define NVT_TS_MAX_TOUCHES		10
> +#define NVT_TS_MAX_SIZE			4096
> +
> +#define NVT_TS_TOUCH_NEW		1
> +#define NVT_TS_TOUCH_UPDATE		2
> +#define NVT_TS_TOUCH_RELEASE		3
> +
> +static const int nvt_ts_irq_type[4] = {
> +	IRQF_TRIGGER_RISING,
> +	IRQF_TRIGGER_FALLING,
> +	IRQF_TRIGGER_LOW,
> +	IRQF_TRIGGER_HIGH
> +};
> +
> +struct nvt_ts_data {
> +	struct i2c_client *client;
> +	struct input_dev *input;
> +	struct gpio_desc *reset_gpio;
> +	struct touchscreen_properties prop;
> +	int max_touches;
> +	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
> +};
> +
> +static int nvt_ts_read_data(struct i2c_client *client, u8 reg, u8 *data, int count)
> +{
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr = client->addr,
> +			.len = 1,
> +			.buf = &reg

Nit: there is no trailing comma here, yet one trails 'buf' below.

> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = count,
> +			.buf = data,
> +		}
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, msg, 2);
> +	if (ret != 2) {
> +		dev_err(&client->dev, "Error reading from 0x%02x: %d\n", reg, ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}

This is idiomatic, but I feel it is clearer to write ARRAY_SIZE(msg) instead
of 2 throughout; this way the length is hard-coded only once.

> +
> +	return 0;
> +}
> +
> +static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
> +{
> +	struct nvt_ts_data *data = dev_id;
> +	struct device *dev = &data->client->dev;
> +	int i, ret, slot, x, y;

In input, return values for functions that only return zero on success tend to
be named 'error'.

> +	bool active;
> +	u8 *touch;
> +
> +	ret = nvt_ts_read_data(data->client, NVT_TS_TOUCH_START, data->buf,
> +			       data->max_touches * NVT_TS_TOUCH_SIZE);
> +	if (ret)
> +		return IRQ_HANDLED;
> +
> +	for (i = 0; i < data->max_touches; i++) {
> +		touch = &data->buf[i * NVT_TS_TOUCH_SIZE];
> +
> +		/* 0xff means no touch */
> +		if (touch[0] == 0xff)
> +			continue;
> +
> +		slot = touch[0] >> 3;
> +		if (slot < 1 || slot > data->max_touches) {
> +			dev_warn(dev, "slot %d out of range, ignoring\n", slot);
> +			continue;
> +		}
> +
> +		switch (touch[0] & 7) {

With all other fields and values defined so nicely, it seems most clear to
also define the bit field name in this case.

> +		case NVT_TS_TOUCH_NEW:
> +		case NVT_TS_TOUCH_UPDATE:
> +			active = true;
> +			break;
> +		case NVT_TS_TOUCH_RELEASE:
> +			active = false;
> +			break;
> +		default:
> +			dev_warn(dev, "slot %d unknown state %d\n", slot, touch[0] & 7);
> +			continue;
> +		}
> +
> +		slot--;
> +		x = (touch[1] << 4) | (touch[3] >> 4);
> +		y = (touch[2] << 4) | (touch[3] & 0x0f);
> +
> +		input_mt_slot(data->input, slot);
> +		input_mt_report_slot_state(data->input, MT_TOOL_FINGER, active);
> +		touchscreen_report_pos(data->input, &data->prop, x, y, true);
> +	}
> +
> +	input_mt_sync_frame(data->input);
> +	input_sync(data->input);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int nvt_ts_start(struct input_dev *dev)
> +{
> +	struct nvt_ts_data *data = input_get_drvdata(dev);
> +
> +	enable_irq(data->client->irq);
> +	gpiod_set_value_cansleep(data->reset_gpio, 0);
> +
> +	return 0;
> +}
> +
> +static void nvt_ts_stop(struct input_dev *dev)
> +{
> +	struct nvt_ts_data *data = input_get_drvdata(dev);
> +
> +	disable_irq(data->client->irq);
> +	gpiod_set_value_cansleep(data->reset_gpio, 1);
> +}
> +
> +static int nvt_ts_suspend(struct device *dev)
> +{
> +	struct nvt_ts_data *data = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	mutex_lock(&data->input->mutex);
> +	if (input_device_enabled(data->input))
> +		nvt_ts_stop(data->input);
> +	mutex_unlock(&data->input->mutex);
> +
> +	return 0;
> +}
> +
> +static int nvt_ts_resume(struct device *dev)
> +{
> +	struct nvt_ts_data *data = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	mutex_lock(&data->input->mutex);
> +	if (input_device_enabled(data->input))
> +		nvt_ts_start(data->input);
> +	mutex_unlock(&data->input->mutex);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(nvt_ts_pm_ops, nvt_ts_suspend, nvt_ts_resume);
> +
> +static int nvt_ts_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	int ret, width, height, irq_type;
> +	struct nvt_ts_data *data;
> +	struct input_dev *input;
> +
> +	if (!client->irq) {
> +		dev_err(dev, "Error no irq specified\n");
> +		return -EINVAL;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	i2c_set_clientdata(client, data);
> +
> +	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(data->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio), "requesting reset GPIO\n");
> +
> +	/* Wait for controller to come out of reset before params read */
> +	msleep(100);
> +	ret = nvt_ts_read_data(data->client, NVT_TS_PARAMETERS_START, data->buf,
> +			       NVT_TS_PARAMS_SIZE);
> +	gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
> +	if (ret)
> +		return ret;
> +
> +	width  = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_WIDTH]);
> +	height = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_HEIGHT]);
> +	data->max_touches = data->buf[NVT_TS_PARAMS_MAX_TOUCH];
> +	irq_type = data->buf[NVT_TS_PARAMS_IRQ_TYPE];
> +
> +	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
> +	    data->max_touches > NVT_TS_MAX_TOUCHES ||
> +	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
> +	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
> +	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
> +		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
> +			NVT_TS_PARAMS_SIZE, data->buf);
> +		return -EIO;

Nit: because there was no I/O error here necessarily, but rather invalid or
unacceptable values, I think -EINVAL is better here.

> +	}
> +
> +	dev_info(dev, "Detected %dx%d touchscreen with %d max touches\n",
> +		 width, height, data->max_touches);

This is also idiomatic, but this seems better as dev_dbg.

> +
> +	if (data->buf[NVT_TS_PARAMS_MAX_BUTTONS])
> +		dev_warn(dev, "Touchscreen buttons are not supported\n");
> +
> +	input = devm_input_allocate_device(dev);
> +	if (!input)
> +		return -ENOMEM;
> +
> +	input->name = client->name;
> +	input->id.bustype = BUS_I2C;
> +	input->open = nvt_ts_start;
> +	input->close = nvt_ts_stop;
> +	input->dev.parent = dev;

devm_input_allocate_device() already sets the parent for us.

> +
> +	input_set_abs_params(input, ABS_MT_POSITION_X, 0, width - 1, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, height - 1, 0, 0);
> +	touchscreen_parse_properties(input, true, &data->prop);
> +
> +	ret = input_mt_init_slots(input, data->max_touches,
> +				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> +	if (ret)
> +		return ret;
> +
> +	data->input = input;
> +	input_set_drvdata(input, data);
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, nvt_ts_irq,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN | nvt_ts_irq_type[irq_type],
> +					client->name, data);

Interesting, it seems interrupt polarity is configurable? For my own
understanding, what if there is an inverter on the board? Is the
expectation that the customer reprograms the controller's firmware?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "requesting irq\n");

dev_err_probe() tends not to be accepted in input, the argument being
that the callers who can return EPROBE_DEFER be responsible for setting
the reason as opposed to every driver calling a separate function that
does so.

> +
> +	return input_register_device(input);
> +}
> +
> +static const struct i2c_device_id nvt_ts_i2c_id[] = {
> +	{ "NVT-ts" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
> +
> +static struct i2c_driver nvt_ts_driver = {
> +	.driver = {
> +		.name	= "novatek-nvt-ts",
> +		.pm	= &nvt_ts_pm_ops,

I believe we need pm_sleep_ptr() here now.

> +	},
> +	.probe_new = nvt_ts_probe,
> +	.id_table = nvt_ts_i2c_id,
> +};
> +
> +module_i2c_driver(nvt_ts_driver);
> +
> +MODULE_DESCRIPTION("Novatek NVT-ts touchscreen driver");
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.1
> 

Kind regards,
Jeff LaBundy
