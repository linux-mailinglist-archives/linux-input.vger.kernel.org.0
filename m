Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85A06CCF9C
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 03:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjC2BsF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 21:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjC2BsE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 21:48:04 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91382189
        for <linux-input@vger.kernel.org>; Tue, 28 Mar 2023 18:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR1GuAaMM11oxpR7M3vKtLp9hU6eIZ+mC5CRTwhaEA5Y+kofugJ1oZFxIzau2pUMplxVBMZAXVLoX8dPr/8LHzbcS+oUlvyMtoNKM44P0EAEQbJrb7XTPb7pCFoL3ooY1U41xgpanKc8G57NXXK46ZAuNpSBbbNCmEhVcP9maQl4a741N6w5rmrVY46R+h+Vb+9Mh5QV0OQPJWow+fpMsBAKfGjviHfKQ5etoN1Vyyb/GQmmmW2D7M9BWtni0n2kFuG6WQKf/fLQqkVKnd01k3TbZfX3wJrbHzbxkvoV4LiBEEY1RoykCPF7OdOUbpCsKHqdGWjIAm7eYOVJoi/Z1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyEhtATjgSzQicYlk+mPQS6u4UbZ6q3ZSWM43cN5Nc4=;
 b=IB316D/TJTUQrUveXGrPhl0ER7FbxoeaOaVpzv7yNPXPX8e/Yv0xXfeNF+NGP6v1xzR/sW+qDC9OWWCc48l1Khhb7ZSqkjeZUq7gU52JIlJWLiKIj+5hYRihanDnI3leYqIp9zwvTLQ9YZbkP2aENdM2M/DtqzcBG2gqEBujnl83MB9BuLjBpb+h5XsbxIoB/BGOBfCDcdp5fjtmlOvEZS4UUpbSBvuc/zT9c5cV0eq+CQoLmGXm+k/5UVpeQlKLzshOKZTLyuT9zN7EBhcPUGwG1XqUsL1r7uXsDZjPw2BCbCqduhSEOUA2lhEbcvklf8FAATK0Qr15DHRsUCPZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyEhtATjgSzQicYlk+mPQS6u4UbZ6q3ZSWM43cN5Nc4=;
 b=mgzR0rZEcKqyfgnZWvfYUJQIwNhz+Vb0uSuwdRZOJlXbTEOXZSAewuAUvYrXAvqMo7nzOkGhEVJhdrmDroF9mAO68qreC7dJG4Ymhol2GcDxAM8DurmXRK4bwUVrRZKixSALJzGXb0ddauAu5n7C9a4mKsYLd1Hx8WXftlLDjKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CO1PR08MB6708.namprd08.prod.outlook.com
 (2603:10b6:303:6f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Wed, 29 Mar
 2023 01:47:51 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::34bc:e51:9ef9:3ab1%4]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 01:47:50 +0000
Date:   Tue, 28 Mar 2023 20:47:47 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: touchscreen - Add new Novatek NVT-ts driver
Message-ID: <ZCOYwxZ6npS8bBgb@nixie71>
References: <20230326212308.55730-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326212308.55730-1-hdegoede@redhat.com>
X-ClientProxiedBy: SN7P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::17) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CO1PR08MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bcaef49-7147-4ab3-af24-08db2ff79a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/OOWszfpiJF91DufFoAcmYIjJ9wtzhMHUzy5/ktLPhqePDgb9E3R5FHHm8ofpNDTTNu2MZ6sVTljQwWRqK6NLw4KjICY5JVCmbnYMf/nJFNHuZB5hBAdRgyxDr/5DmZCEhgln09aj5ZnvbNK5zsrq4z7jzBrHXZWmLTPEtibzHuLE4nCBGMvjBc5EID0fX/8iwHY5tWyer5wyN9dEdfnVHHJeWJw/f5MNQxBWUu8YyGJF11H63MMxb95O1TaWxkrB3/RAtcHu4ihV5NCEJTfoggKC3aocjn9YjTE+extT6W4ddB3Rcv2mtbDhZePpVFihFd1/CoOIX6M0s5S2iDV93lHknPatJ5Vi1vTPoKE2z5TJu5A37C+IyijfzPKeDh36MWyRCktn2MbE2pG2q2ilWxPxbDb08zCjrKA3FCGwtOhiR/2gtG0jXV3nHMiBzq3VQJWnuIGJSnEcNqZ1Cm4Ayaqq1qLgVk38vdfdlJRVwxQDOCoTLLH18UyLf3Qx6YoQWGjylbYrB95vXzh/lHoBhBA1LO4IQ34yBJHIamyI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(396003)(366004)(376002)(39830400003)(136003)(451199021)(8936002)(2906002)(83380400001)(41300700001)(86362001)(38100700002)(33716001)(5660300002)(6486002)(966005)(478600001)(66556008)(8676002)(66946007)(6916009)(6512007)(66476007)(4326008)(6506007)(30864003)(6666004)(186003)(316002)(26005)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGWwlmSao1nowK0HsQ9Z+P0L5zIUm8P9cup/TKuLOkb7UUE10i2I4JztwNpo?=
 =?us-ascii?Q?k/tsDpo/QpAKiLMreJzZ3H3V4+HYcm180Hw4ZYgZ9XUbr5/mtHRk95AqcxaV?=
 =?us-ascii?Q?K1JdovrZQ8yKP5Lnws9fVjhQk7cRGrwEiBLd0QSMvDE0WCwS3RlyaTmSupaV?=
 =?us-ascii?Q?9qtFIIO+t0+HK5odXYHQ7p3sUSMJ8uQ1w530IThmMZHhoV6UHWRH7S5pRyvN?=
 =?us-ascii?Q?T+La9TCOxcho5GNm6y04bbTWLx+NXgJ/UDVDQQFyZWWtkmoObGmmHzg1Llf6?=
 =?us-ascii?Q?f4Vsy7TcMkoSrzJrG5lV/JOTb7bpseZ0YPwQqodumywshrpvO+2RftCqkYF/?=
 =?us-ascii?Q?CChuylZwdrVaGbYnMEnXID07dq61zVNxbAoXTlZJXkS2e4ovad5MHDVoYIJi?=
 =?us-ascii?Q?yYFWxR5L+TNrrhjqkYesB22HM6IjiW0/KbvjuL/R4yXB+Bd0PCMIMH8MlMXZ?=
 =?us-ascii?Q?1Ax7Ae9rZTOu0T7U/FUjHefaTeCSebLayTJbwsvjhkeS3Fkj7PCmlJy+F38h?=
 =?us-ascii?Q?/rT9nrZT1TQJEhyG/ERj/KQecQo0Ofi6/42wPDvuTe4Zg8c+c8O7x74aPf18?=
 =?us-ascii?Q?OsoPunCu31nW+v4iE3Buu9CLJIVDQf/FOa5cZX68n57rYaqNzyLvycnbbPfC?=
 =?us-ascii?Q?BBsjFpFtDuVwSdnUQW4IY6hOsR3QDF7WjtrHzJpOh2uN2lrxoD/B5cLreAnO?=
 =?us-ascii?Q?vSvyJa8JKeqSHnUwgLrAe61mZLbjDv8oXxBkoaJ3VZ/C47uf+pNxdZggnmDo?=
 =?us-ascii?Q?2dYZUYensElSCnzZYozieqbk4/yndipsRVPhiq5tbE/R58XgFi5aQUF8wSC7?=
 =?us-ascii?Q?o4dc0VvVyJO2bkVBKS7IVzXDBSIGK7Wf+17DuRBFxg8OH04Qs+Xhxw0Xx5q+?=
 =?us-ascii?Q?y306Bdp1j+ldGNUZ61smtHnR6hf6dPLPmoQ3HI2IdqMlJfzrInliI5nyIqHw?=
 =?us-ascii?Q?MZKq4ulo0NnI/ljdNqS3t8UDbRHRrAvn3/Oa97eIXK/v6u+f29qcZGeJIqYw?=
 =?us-ascii?Q?5nl50LmNaZZsxS1ax90GhYPj6LMja4+Wa5nWu/Cfm4yU8kxB6nkJm+d2egfC?=
 =?us-ascii?Q?93IxTRji5Qca9h8mHRpcvxN5t0PNmNjxU/FRXthH14gdfgGg0f/2P0pRvf00?=
 =?us-ascii?Q?FQA2bBfO4/Jb3PMztngdqPFZVizGBKRSDgOZhaGX9mAD/73f7RAMvSHgUVCF?=
 =?us-ascii?Q?Wx6aHAm2TfDGr0A7bEVtnGnvAPXtVSzKsTs6cufSVFNGZ2syVmHmBcrX3zu5?=
 =?us-ascii?Q?eg/dkiMMj/tFM9KhJaRtY3iN9BtMJg7lBG0bTrgkU2B0yYT9WBpN/S9C8Y+A?=
 =?us-ascii?Q?pg5VdYlLm9IkJ4tjGVpYWCAMg1U+zzS251cTwOsRBM6T3Qm0Qa8SalUpBdkc?=
 =?us-ascii?Q?2uV/XFqDk15ivm77T5L2V9FbHIwZiX7QmPKZqypNyMW4L/7z+zQ8vfL0Vha1?=
 =?us-ascii?Q?d246DiZP+wYQJzydwG+zCTfgjUdn6adwtO2AHakRmZkZIL3DfarARcfRcIDp?=
 =?us-ascii?Q?lVCHFDGEnSnDBb+6rK0BYtbrFPPj3vf9eJeNk7GvHhVIv1oWVyGfpNONF5Va?=
 =?us-ascii?Q?loCQQM8QTQ7mYq6bpzDEjuuFbDDZO/lLoVcvEOWS?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcaef49-7147-4ab3-af24-08db2ff79a58
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 01:47:49.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tw9zAKlCnuhe7fWIU3ARSNuRAKfr3tNA9p8dylrGeWo1agNFNpDYHhEZC7iIXaqTQVAb4iPkSSz+kM5BpXDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6708
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 26, 2023 at 11:23:08PM +0200, Hans de Goede wrote:
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

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  MAINTAINERS                                |   6 +
>  drivers/input/touchscreen/Kconfig          |  10 +
>  drivers/input/touchscreen/Makefile         |   1 +
>  drivers/input/touchscreen/novatek-nvt-ts.c | 289 +++++++++++++++++++++
>  4 files changed, 306 insertions(+)
>  create mode 100644 drivers/input/touchscreen/novatek-nvt-ts.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08b7178d645b..30b57a4afe9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14788,6 +14788,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
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
> index 1a2049b336a6..1feecd7ed3cb 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -654,6 +654,16 @@ config TOUCHSCREEN_MTOUCH
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
> index f2fd28cc34a6..159cd5136fdb 100644
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
> index 000000000000..f959e7b14ad6
> --- /dev/null
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -0,0 +1,289 @@
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
> +#define NVT_TS_TOUCH_INVALID		0xff
> +#define NVT_TS_TOUCH_SLOT_SHIFT		3
> +#define NVT_TS_TOUCH_TYPE_MASK		GENMASK(2, 0)
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
> +			.buf = &reg,
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
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	if (ret != ARRAY_SIZE(msg)) {
> +		dev_err(&client->dev, "Error reading from 0x%02x: %d\n", reg, ret);
> +		return (ret < 0) ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
> +{
> +	struct nvt_ts_data *data = dev_id;
> +	struct device *dev = &data->client->dev;
> +	int i, error, slot, x, y;
> +	bool active;
> +	u8 *touch;
> +
> +	error = nvt_ts_read_data(data->client, NVT_TS_TOUCH_START, data->buf,
> +				 data->max_touches * NVT_TS_TOUCH_SIZE);
> +	if (error)
> +		return IRQ_HANDLED;
> +
> +	for (i = 0; i < data->max_touches; i++) {
> +		touch = &data->buf[i * NVT_TS_TOUCH_SIZE];
> +
> +		if (touch[0] == NVT_TS_TOUCH_INVALID)
> +			continue;
> +
> +		slot = touch[0] >> NVT_TS_TOUCH_SLOT_SHIFT;
> +		if (slot < 1 || slot > data->max_touches) {
> +			dev_warn(dev, "slot %d out of range, ignoring\n", slot);
> +			continue;
> +		}
> +
> +		switch (touch[0] & NVT_TS_TOUCH_TYPE_MASK) {
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
> +	int error, width, height, irq_type;
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
> +	error = nvt_ts_read_data(data->client, NVT_TS_PARAMETERS_START, data->buf,
> +				 NVT_TS_PARAMS_SIZE);
> +	gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
> +	if (error)
> +		return error;
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
> +	}
> +
> +	dev_dbg(dev, "Detected %dx%d touchscreen with %d max touches\n",
> +		width, height, data->max_touches);
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
> +
> +	input_set_abs_params(input, ABS_MT_POSITION_X, 0, width - 1, 0, 0);
> +	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, height - 1, 0, 0);
> +	touchscreen_parse_properties(input, true, &data->prop);
> +
> +	error = input_mt_init_slots(input, data->max_touches,
> +				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> +	if (error)
> +		return error;
> +
> +	data->input = input;
> +	input_set_drvdata(input, data);
> +
> +	error = devm_request_threaded_irq(dev, client->irq, NULL, nvt_ts_irq,
> +					  IRQF_ONESHOT | IRQF_NO_AUTOEN | nvt_ts_irq_type[irq_type],
> +					  client->name, data);
> +	if (error)
> +		return dev_err_probe(dev, error, "requesting irq\n");
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
> +		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
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
