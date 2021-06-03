Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBC339A374
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 16:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhFCOkB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 10:40:01 -0400
Received: from mail-dm3nam07on2052.outbound.protection.outlook.com ([40.107.95.52]:5440
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229744AbhFCOkB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Jun 2021 10:40:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKLMi2W9hrBPtFV3lDsq9KiTX/e7z3E+QKZ19nhaAoyPR0Z/ZOp3XUJtGvFrnJz8QcDMYehF1dS//WP8LUEE1VfB4I+kQEqqKOH5EHcAAvdGDCuFiMUeMJEDQLzo9qBTtd89w06S/UYVj6w4YQUpswebsZOFKe7dWuxeOXLB7xIILaXbRLceFH8bTQjiVeq48fFqQjOhcfQo3MYYM2seZ4IheqGEuzGG3mTyPVH+aWnG73tSttDNcZB2+WNPpdnB32ts4gXe9/vU0OtChDclD/BcDHqOotaI26upuGf9QhciTm0//q/BHFvSyvc4tmPKvHVJdz/BBff27qfb+Ek7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tUqim+YHwXjRoxgyNx3a+csKK9EaL1/3ytTfSnb+DU=;
 b=RAExSnCYzT0ObxfVpDCD+w0DFpMyxdYcDii5vRtfZ8nJIpf7VU7649KuWZ8WBytWUpE+GNx7irYWJit4c1iInnvP63JlLF7la//C44QI7B4sjR2Uf/q+OtFP/jcJFBwBRmSN80e6DXN7lMYtElsKKiYAZh94oH4iIiagvS+4KoWvXHC+iyS/yMpn/9pU2gVf9DVzHVZjWE4jdhy6XSzkNL2D4zn8M0afxJIcerHzEajo7eCa7BGXdciOPIOrfD1r2KWzt2G+T5CTn4Wd+PWyzPIkcmKi0dYLLmKgNyYHnTiBmh9oWwPoh0vg6H9WbOUUHfuOzr2FtY5+jbYrvP+00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tUqim+YHwXjRoxgyNx3a+csKK9EaL1/3ytTfSnb+DU=;
 b=qqmNh6ha4nom/IgaNp37WuF7739QcP28U8pS36cdls7KI8mix4YXRThowd6GKxhm8jNuTdSea49Gz0qwoikjhaJvKWZpUyKOlLSIEzXt9uGfJPmy9yGYfqUupxXYO8sfKwUlkDYqME/Vgd8Txh3PdXz5EcAlluHQ8Kt6jWzHWlE=
Authentication-Results: kaa.org.ua; dkim=none (message not signed)
 header.d=none;kaa.org.ua; dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB5270.namprd08.prod.outlook.com (2603:10b6:a03:42::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 14:38:14 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8%8]) with mapi id 15.20.4195.023; Thu, 3 Jun 2021
 14:38:14 +0000
Date:   Thu, 3 Jun 2021 09:38:07 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2 v2] input: add SparkFun Qwiic Joystick driver
Message-ID: <20210603143807.GA13110@labundy.com>
References: <20210602190504.23076-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602190504.23076-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:806:6e::7) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SA9PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:6e::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 14:38:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a64169-df6a-4754-0924-08d9269d3790
X-MS-TrafficTypeDiagnostic: BYAPR08MB5270:
X-Microsoft-Antispam-PRVS: <BYAPR08MB5270AC4D92897F7C8E093B2FD33C9@BYAPR08MB5270.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MPzIzRFg8UHgLxPFyN+h86DsQbqyZ/jW1n371SrzH7bGT4QwvjjVZu+Oi5rX3t9I4GHDLvsyk5xbHD0y0omwElx2WzN0Gflhz9lXpaTKMWt9qYATENZFJfAX3VmhQxwIaxWczBeA3Y50f58Xkoop4RUPMjBRxs9odyeffgUVTk6hk/fbg39/NZeasMdoi+hc4a3hbhfO5+EFraLOiPKl9e6cpMVDA3j6Erbi0leX2jDxBRlEJ5M18VUD9Q/Dp7kgLuzT3tsnbiB7gI8wjcyTsJKJWUY5TGShSd6JJk5fhCsGdMEFU7q6MgWjDpnwK8j1DpRKKU3C9bDHyn8IZb+0RmKSwsuVme2XqLBgUGyPpZ1fYtzV285xHgLcUGmXUsweEqkvM0URdzQVGVvhogtNvPNhTVkggziDeW/eniXZIS1pnCiH/wtkCcWFkZLPLaUXxB3D1MGy41mURDtpK2qjZ9Y6aCWPOF2EU+XSlRlREOjYoxYUgyZM8XZn9RkPv3NRexqi6LhJWYTAoZ1M2R+OyAwxHDUbjYRpKbuucAD//8OELQga/a0PrCH8xDOyJmEJ+VIlkvQLwkr1OUYHhmGTo6Y0t5/cE9MOGOAA0owisu7v3CiW2cx98n/aIQNOglujDjHnA8yb6aHQnLzqgDlO6EgbOyCXjPZXGNJ7CupK4Jpt4hTeA9FmXGm7NK5/8KZonbbuuHMK97HNf8vSOOMLCKBkl5hpqSQIfVYtRbUpyF+P1U5GzXpLGRPdZtMeBtQb1+Lh1rmMmsqt77EABaUa2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39830400003)(956004)(1076003)(2616005)(54906003)(38350700002)(86362001)(316002)(33656002)(38100700002)(83380400001)(36756003)(2906002)(8936002)(478600001)(26005)(16526019)(186003)(8676002)(966005)(6666004)(4326008)(52116002)(7696005)(5660300002)(6916009)(66946007)(66556008)(55016002)(8886007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUxUUE5WUnc3amduVFJ2bkNnZFBtMzRTRWJDTVYrY2ZneGxseGp4Sk9NemU3?=
 =?utf-8?B?SGpQa0NIWDQ1eEVQcndMMjBFQVl6bGRBSWhCWkdDUnN1NmVMYTJJQXZpazlv?=
 =?utf-8?B?ck91ZkV0K0tnNEdRYkNkdlQ4V0dzcm5iMC9tbDkyQXJQRmJQQ2NtZ1l0M2t4?=
 =?utf-8?B?MXByZWJaeTRpOGR6VHJWekpQSXJKeUJLUXdhZUNrTWltUjg2ZlArcW1YN0lU?=
 =?utf-8?B?QTVkSWc3TkNJc3dOTWZRcE1rQlNsa0pNK0ZtUkZQbS9YcVE0Z1FLajYvZGhh?=
 =?utf-8?B?RG1EdU1YcmJ5TGNpMTRFczJES0NlQlIrSHMyY1pFaC9VdDhBaE0ySXJxSUJT?=
 =?utf-8?B?NE8ySUVrN3ZUbW10cmo5R3NhVHJpTTROR2hiTktHMHBGWG1kK3FRQnYwbTEx?=
 =?utf-8?B?V3JqV0xRMVpxM2RUMjlSd09GdnUxTEQyTnN4NnJjVFZNbFF2UFpEREtVREZu?=
 =?utf-8?B?Zlk2SERQbTdjYVNjNFBOVW5vanJtWWtkS3ZEaVNpSmpSV0RPaUJFN1E3eS9U?=
 =?utf-8?B?QTkyQVc1UFJ5RnhMUWgvWXlidkpHbTh1L1NSM0h1TG1ETE1pYXpFRG9rc0Nw?=
 =?utf-8?B?YVBqdVE3UE9lQThjVnVIZ2NZdkdhOVJ4dXgwc1o2emhzclQwM0thZEJnL3gv?=
 =?utf-8?B?TlpaT2E5N2NYVzNjN09oenF6d1Q3VDZ0VkZubXZ5STFTenpDTXYzcHNJRnh0?=
 =?utf-8?B?U1p1cC9LaTl0aFFNZWw1TXFoUWVQUDlEYmhkMkJXZm0zazNuL0RJaUx2Wnd5?=
 =?utf-8?B?UVFHTHpkbzluUitRdWtTZVY0N2tvdk1GVXVHMnlzcE9UOHIrSENQUjAwaGpU?=
 =?utf-8?B?UmNMMGtxYmx2djZ0SVQvdldBc3JPdWpsQWZxUCtINnYwWTA2aVVLTDl4dEM4?=
 =?utf-8?B?ZjBpcm5XRFV3V3lTUmt3R0tQMm5xTmVvalR3YlpZOXlPM0xYMUhKVlBiN0x1?=
 =?utf-8?B?MkRxRGFIQ1N4eWR4QUdLa0hyeXhSQkJETXBOSzJ6cDNzb1dYSVEzaDZmMDIw?=
 =?utf-8?B?ZkdNbTlKQTM2c28rODJBcVhPSHNPUDJCMU9qd3RCSEVrUUxnTVBWYkxmR0M5?=
 =?utf-8?B?SGxDWGVPYVJZRXMrSGxKbHpJRjFkT2JrYnJFOU02ZElKbjFRQmVEZUN4eHZQ?=
 =?utf-8?B?MFl3TkFuU0pEZ1o1TzR1T2dCbkloUlBQWWU3dVVOZG1nMzBvT2tZMSs0bVZT?=
 =?utf-8?B?dFQzcVdtNmJudFNxRWZPeEpMMnJpamltMXZ1SW1sRGp2MFdLOFMrY1NCQUI3?=
 =?utf-8?B?Unpua1IyeUkxTkhXdUFPNEZyTm9VeFRmSlM2dCtqQ0ZvNHYvUlB3S0tYayt3?=
 =?utf-8?B?YkxIYjVKSXllNG0yRHEvRmRQSHVOa1dnTHgzeEMwS0dZclJvZEo3MkVqTzZV?=
 =?utf-8?B?VWdFMU5nRlY5a3R4bUZPSGVIL0xrdGlXblh6WnZSOE5oc2ZmZ1czUTk1Ny91?=
 =?utf-8?B?bkgySHUwaFpLWjNBUC9icEszVmpGWE9yNHFxUkx1bFI3MFg5Y2FRb29uV0dh?=
 =?utf-8?B?anVYZ2pMdkpZVEl0cWJQTldpR0s0Qm9nbS9zb1R2d0lrc3FlZjVLdWxzV21i?=
 =?utf-8?B?bFZJVDMxRnZRUnlJSmt4anBKbzhtWUF1aEF5Q2E0cko0czFCcDUwOGdObHla?=
 =?utf-8?B?bU0vdm5udTVyT0grcS8xZ2RQd3FrcWEyR25uOGRpcmxVVzZacE9xZjlRVlZK?=
 =?utf-8?B?Zk5rOS93TmE3R1ZLQXpVekJrMjM1cWMyMmFEbzZvU1pYbzhtcGtvak9lLysy?=
 =?utf-8?Q?iCppEyMjGQSry5QoxDgqQKMwCgMPZ85AnIavgk0?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a64169-df6a-4754-0924-08d9269d3790
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 14:38:14.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmPkVrL/hIm+ue7jJ1n+7scv8IOr/Klys7N4AzK1SbmAGBJsacgxREzgaaG/uKR5w85AQfnemBCQqmeNzfskwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5270
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

This cleaned up rather nicely; just a few more comments from myself.

On Wed, Jun 02, 2021 at 10:05:04PM +0300, Oleh Kravchenko wrote:
> A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> Directional movements are measured with two 10 kΩ potentiometers
> connected with a gimbal mechanism that separates the horizontal and
> vertical movements. This joystick also has a select button that is actuated
> when the joystick is pressed down.
> 
> Input events polled over the I2C bus.
> 
> Product page:
> https://www.sparkfun.com/products/15168
> Firmware and hardware sources:
> https://github.com/sparkfun/Qwiic_Joystick
> 
> Tested on RPi4B and O4-iMX-NANO boards.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Typically a binding patch should be first in the series (i.e. [1/2])
with the driver next (i.e. [2/2]) so that checkpatch does not signal
a warning about an undocumented compatible string.

> ---
> 
> Changes:
> - update code after code review
> 
>  drivers/input/joystick/Kconfig          |   9 ++
>  drivers/input/joystick/Makefile         |   1 +
>  drivers/input/joystick/qwiic-joystick.c | 147 ++++++++++++++++++++++++
>  3 files changed, 157 insertions(+)
>  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 5e38899058c1..7dfe8ea90923 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -372,6 +372,15 @@ config JOYSTICK_PXRC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pxrc.
>  
> +config JOYSTICK_QWIIC
> +	tristate "SparkFun Qwiic Joystick"
> +	depends on I2C
> +	help
> +	  Say Y here if you want to use the SparkFun Qwiic Joystick.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qwiic-joystick.
> +
>  config JOYSTICK_FSIA6B
>  	tristate "FlySky FS-iA6B RC Receiver"
>  	select SERIO
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 31d720c9e493..5174b8aba2dd 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
>  obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
> +obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
>  obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
> diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
> new file mode 100644
> index 000000000000..59c0f3e6ee75
> --- /dev/null
> +++ b/drivers/input/joystick/qwiic-joystick.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
> + *
> + * SparkFun Qwiic Joystick
> + * Product page:https://www.sparkfun.com/products/15168
> + * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>

Now that you are using byte order macros, you should explicitly include
linux/kernel.h.

> +#include <linux/module.h>
> +
> +#define DRV_NAME "qwiic-joystick"
> +
> +#define QWIIC_JSK_REG_VERS	0
> +#define QWIIC_JSK_REG_DATA	3
> +
> +#define QWIIC_JSK_MAX_AXIS	GENMASK(9, 0)
> +#define QWIIC_JSK_FUZZ		2
> +#define QWIIC_JSK_FLAT		2
> +#define QWIIC_JSK_POLL_INTERVAL	16
> +#define QWIIC_JSK_POLL_MIN	8
> +#define QWIIC_JSK_POLL_MAX	32
> +
> +struct qwiic_jsk {
> +	char			phys[32];
> +	struct input_dev	*dev;
> +	struct i2c_client	*client;
> +};

Nit: no need to align these declarations (here and a few other places).

> +
> +struct qwiic_ver {
> +	u8 addr;
> +	u8 major;
> +	u8 minor;
> +} __packed;

'addr' is unused so it can be dropped, in which case QWIIC_JSK_REG_VERS
would need to be increased to 1.

> +
> +struct qwiic_data {
> +	__be16	x;
> +	__be16	y;
> +	u8	thumb;
> +} __packed;
> +
> +static void qwiic_poll(struct input_dev *input)
> +{
> +	struct qwiic_jsk *priv;
> +	struct qwiic_data data;
> +	int err;
> +
> +	priv = input_get_drvdata(input);
> +
> +	err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
> +					    sizeof(data), (u8 *)&data);
> +	if (err != sizeof(data))
> +		return;
> +
> +	input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
> +	input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
> +	input_report_key(input, BTN_THUMBL, !data.thumb);
> +	input_sync(input);
> +}
> +
> +static int qwiic_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)
> +{
> +	struct qwiic_jsk *priv;
> +	struct qwiic_ver vers;
> +	int err;
> +
> +	err = i2c_smbus_read_i2c_block_data(client, QWIIC_JSK_REG_VERS,
> +					    sizeof(vers), (u8 *)&vers);
> +	if (0 <= err && err < sizeof(vers))
> +		err = -EIO;
> +	if (err < 0)
> +		return err;

I think this reads a little simpler as:

if (err < 0)
	return err;
if (err != sizeof(vers))
	return -EIO;

> +
> +	dev_dbg(&client->dev, "SparkFun Qwiic Joystick, FW: %d.%d\n",
> +		vers.major, vers.minor);

These should be printed as %u.

> +
> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = client;
> +	snprintf(priv->phys, sizeof(priv->phys),
> +		 "i2c/%s", dev_name(&client->dev));
> +	i2c_set_clientdata(client, priv);
> +
> +	priv->dev = devm_input_allocate_device(&client->dev);
> +	if (!priv->dev)
> +		return -ENOMEM;
> +
> +	priv->dev->id.bustype = BUS_I2C;
> +	priv->dev->name = "SparkFun Qwiic Joystick";
> +	priv->dev->phys = priv->phys;
> +	input_set_drvdata(priv->dev, priv);
> +
> +	input_set_abs_params(priv->dev, ABS_X, 0, QWIIC_JSK_MAX_AXIS,
> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> +	input_set_abs_params(priv->dev, ABS_Y, 0, QWIIC_JSK_MAX_AXIS,
> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> +	input_set_capability(priv->dev, EV_KEY, BTN_THUMBL);
> +
> +	err = input_setup_polling(priv->dev, qwiic_poll);
> +	if (err) {
> +		dev_err(&client->dev, "failed to set up polling: %d\n", err);
> +		return err;
> +	}
> +	input_set_poll_interval(priv->dev, QWIIC_JSK_POLL_INTERVAL);
> +	input_set_min_poll_interval(priv->dev, QWIIC_JSK_POLL_MIN);
> +	input_set_max_poll_interval(priv->dev, QWIIC_JSK_POLL_MAX);
> +
> +	err = input_register_device(priv->dev);
> +	if (err)
> +		dev_err(&client->dev, "failed to register joystick: %d\n", err);
> +
> +	return err;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_qwiic_match[] = {
> +	{ .compatible = "sparkfun,qwiic-joystick", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, of_qwiic_match);
> +#endif /* CONFIG_OF */
> +
> +static const struct i2c_device_id qwiic_id_table[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
> +
> +static struct i2c_driver qwiic_driver = {
> +	.driver = {
> +		.name		= DRV_NAME,
> +		.of_match_table	= of_match_ptr(of_qwiic_match),
> +	},
> +	.id_table	= qwiic_id_table,
> +	.probe		= qwiic_probe,
> +};
> +module_i2c_driver(qwiic_driver);
> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.3
> 

Kind regards,
Jeff LaBundy
