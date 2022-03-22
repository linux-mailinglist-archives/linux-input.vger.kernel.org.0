Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA894E355C
	for <lists+linux-input@lfdr.de>; Tue, 22 Mar 2022 01:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbiCVAJa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 20:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233532AbiCVAJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 20:09:29 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F399013DE1;
        Mon, 21 Mar 2022 17:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hO71gNpH3VGfty2icrGJWgfhGyuiLYlmL10SqHbVqOFNrbnHQuRgyyhGLda+3lYI0u78OO1aKs0/FPkPS1F3GK9Kh7DPU1sdGn6F19Y3+j35Pqcjyr4x1Bv5Wg5+cWkl57NfPsDCqu1Qq/z05jY3QNXcASA2YjQLm7jUrBflDRgPe9v7/uG6Vcf8O5n2v9jocG0Cccv5Y5rM3+pMwrIFoDbCMhZSltVBaTDOX7UZIZF3T7YWmij7Zfi7qZHNF3Ais5fEt/iwGc587mSLUf+iKW/sFVHgF50+b4vL1V5BnPd3aQkJEX0RC0iOPC2a2KMyHeA5lmv72kZerpfg/l/GhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5DBFm6ulWoZ99elsolHe3aHT5CjQYp1mBx/mAKqh4M=;
 b=I8MqFILzQtSQk5Pv+P2pEUKb/79deZaUvNAXwPnemmCZth2DknJntoGjpKg9f6S4Kjhm8gQ2VDlUEzzMd9IDv2jbPwmCcoK19BdlfonbI+TTb3cpSoESJNUeQXAIb1jaYtsM0HVgxFOFGcpvFaFnI0uyEujtHe4CB4nOKjdYeJlBXDY+1dPhESSoUqOq+Fo1KkH2jdgJhC/sE8tSaqwqWd3DX+B62xHtBZh8bLnI+9HkJSFstLlB15wL+tSSsbYS2FC0bSPCVKb2zjbaDIGtAmr6SFi0ShoakV+aGei7MoU3ZyeKUpRP7V0C57RLPXs9cP0tU1zstNNg1sM2FYkQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5DBFm6ulWoZ99elsolHe3aHT5CjQYp1mBx/mAKqh4M=;
 b=agPJVMnsnaGfSOO2qn2cEWO8jYNymLBXVedaqhtB/OhBDVAda9fGSkgeQtuEqBYfXmN6hkodkEjm7WA/nmU72MCtkSV1+JoNI78t3zV51GysIamsnYf3GCkoL22MZIrE5ccqLBGR8FeU9JLJ893/quVR3pBebxKc/8fXZ8d1SnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SN6PR08MB4464.namprd08.prod.outlook.com (2603:10b6:805:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Tue, 22 Mar
 2022 00:04:04 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::3d7d:ce41:a265:4481%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 00:04:04 +0000
Date:   Mon, 21 Mar 2022 19:03:58 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: isa1200 - new driver for Immersion ISA1200
Message-ID: <20220322000358.GA2648@nixie71>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
 <20220315233528.1204930-3-linus.walleij@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315233528.1204930-3-linus.walleij@linaro.org>
X-ClientProxiedBy: DM5PR07CA0135.namprd07.prod.outlook.com
 (2603:10b6:3:13e::25) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c44507e-0972-4ad2-cd0a-08da0b9779b5
X-MS-TrafficTypeDiagnostic: SN6PR08MB4464:EE_
X-Microsoft-Antispam-PRVS: <SN6PR08MB44646B163FEFD8E8208D8CDFD3179@SN6PR08MB4464.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYRDAE7xybafoZh8ScE83iuaILKqeM2qWAOZ3k5WjfqIgYd8UIPM7KrUvbc525VEHxImsl3LO+LDOLqIrwknYuDHvW7gSKpKjjQUP9aBP4OTA8MetPpx411wYQ+E+uJK66SxFNQ4SA7Fu0Q34YkI3nxvM61Nyg40yW/69gU/B0HuWCyVUPPQ8vpTxR6K0MHK+Rihb2Otom7AXAS+T/uJ2rKRqywQl27KVOQ/i3ZqwMf1e61jPag+Btsf7j//IyRNVrAwVCYDDmc5lg3Hie5ru9fo/nvKka9o+alwzYjgAuJfaGCEOPMvxhIW4SNYs1trjtKDuJSnDCTZKdMlc31SQTJNGKOe302hkJYvTMkY8sJ/QGZCvUa/pwDFiVk+9ch5HnsvH2GfUnNqHtpoNaWSNlbiGLY1fyVFQ76wHIUeytLiFiAaxN1HQc4gjlJjDGZxOT5QFnoS3/jmK1W/JbMzmx6i+sFCPWTJN7RuQ0DlaaObv+TvD+DvnCNPnkfyJ780qQ3N3ikVdtzVdMFFQmMOrBPn7klnag6mBiaExx1VZX95CNy8jJZs2rEpGf/zpVYjS0+hpKViovaJ/x+ZzN8QAaZYJeYj2mYUu7myKz+mhok1f1AFzZb/puGIiwF8czaH1/+9hxe5WnKUit/XAIO1efokoFJ9MsK+QZB5Ahl+2/9tmcuoiM0Cp4Rb98toZ7I2KWywdzyqYDEznFCyJn1pDPstG4ajNNTHDCYGmOdFzJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(396003)(39830400003)(376002)(366004)(136003)(346002)(5660300002)(8936002)(66476007)(66946007)(6486002)(6916009)(86362001)(2906002)(30864003)(66556008)(8676002)(316002)(38100700002)(38350700002)(4326008)(1076003)(52116002)(26005)(33716001)(83380400001)(186003)(6666004)(6506007)(508600001)(33656002)(6512007)(9686003)(95444003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tB38MTuSHy7z9dBijXlNKo3vW/YOTuS8jyVy57bLqhegAAdBUxqNsXz+6iaH?=
 =?us-ascii?Q?BdZcA1O76LZW+7DppcajimMMUtr39fBwItR5JgQ6znfFGfXlbrQQ/Ig/rlmW?=
 =?us-ascii?Q?C2GIQ7B1yFo4UAPoXMkh6IvGqLsGEDQGxSyiuOvpeFfyux3stpqctWph+kwo?=
 =?us-ascii?Q?HIM9y03gl9K/8VTTw4z/VEmiTc+OpcYpBnDeulSHgHVmF1CbIrE+Er5PiHw0?=
 =?us-ascii?Q?igY2TeZEbLsteyaneNDX5pH47Kpo+R2VjU0XI9gBSj3hL/QwgofVZ/NkZULO?=
 =?us-ascii?Q?xYubOuIabt6iuJpSuiVi91JNKtHgcYaZhbLHBGMKohZOwv/8PPApaCzqK5g2?=
 =?us-ascii?Q?Qj7LItPQ8hpss3NDRqBixCkq9x+YHrDlnMRGLJ4MQZZ2g+CEcM91ZJ9l2M/c?=
 =?us-ascii?Q?VGCNyh7T27d1KyUoHHF9uT4UUt7b748OAHxmznwRxmu+U+yO0W31Dvut81Lk?=
 =?us-ascii?Q?jpXUkWz6UQ5RWAM8grNeO9XKO4IqGW7XeK3IEsJjcclAsxes0ABjrJ6q0t4+?=
 =?us-ascii?Q?z0OxdP4Vrf/1xfJotFx0BLaVZms7WZBnpb/+oIqGTsCGg++88Jr4uAtfDqux?=
 =?us-ascii?Q?HIIu3vbODtPoK3dA7smvpAr8NarfUPFgWyOKoVly4A6OovGJB3Aolax+UD5w?=
 =?us-ascii?Q?YUfkwX6isNBCPVxDJhEF4atIqSHpQLfSQjzdqUTCmNaz5Y1LiguuYqZteYJf?=
 =?us-ascii?Q?2EuWCQV+xyXRch+l0ucq/GSSClpFrrhF2diJjUoXAXx7AchFxLjWnD6EQCcm?=
 =?us-ascii?Q?QKkTQ3WD1VGbpS6Ycf6qNLbeSfvbC5TeJyN3ZfzhcQ/Qu3ctf8ICckF4wOyd?=
 =?us-ascii?Q?JFpBTuOgXEUVyoVYu/PuB+O/swbhWF4ERREm3aIbSUk0LvIKDIvSyFA+oC8H?=
 =?us-ascii?Q?QTU3KD9RBDpJZqUBhwhfgzTCadJh6nvpjwB65HuHRbAVC9S3A5wGNVJ9iwuB?=
 =?us-ascii?Q?UxGf4BpCVjG/ZVJ77dJD6YD0NczZGuoUfU9ADYwGZY3uHNkbm8SqYR5Xr5Ww?=
 =?us-ascii?Q?LnhAU1wN+kQJ6uOI8BBbUaRa09AWpdUOhXrxixh92aEm3gQTfxrdfV35fAlw?=
 =?us-ascii?Q?piM7WE5Pq3tFZYgvbHHqALUp4zRFB0BTMtq8arDnORQS24pnIZ0nTTF37wtb?=
 =?us-ascii?Q?ZalJ/3osVlMaP/Dquux8n8ku+kj/V8JHJe8HQc3ISENYEBmOku6vIyo4FVJ9?=
 =?us-ascii?Q?qCgCKCsvZv1WozAJjWu29kLRpWWTEHXsc9Nd+h/DDjae48YD1msch3sOHpK6?=
 =?us-ascii?Q?qfVqtOLpFswAJCai6LqW9VUmes40l3b8/c4CLMb6SIhhY1rZmVoIVPOO38Zq?=
 =?us-ascii?Q?qVxl8BdEo/8fJvhuzMuF4ZUuBt4/FIHalTpZX/vmz4R/5z7BYQklCBtPArL0?=
 =?us-ascii?Q?iWCidB9eCtm2ScOKe3/qrb/HkqfsNYZm63hXc4C9U/fnA62LtIq4rwpSFVTJ?=
 =?us-ascii?Q?njKhRPUIsrJAiTe3zAWj0Tii6dwVBdPF?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c44507e-0972-4ad2-cd0a-08da0b9779b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 00:04:03.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mL1ix1Lb2wLVsw9b9A+k6IbKCDePyK1X429E6Rp0Yjgc0m4M5y/9WVAd9+LpZQ6iuCVgdFAN81LfTrIsytV8vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4464
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Wed, Mar 16, 2022 at 12:35:28AM +0100, Linus Walleij wrote:
> The ISA1200 is a haptic feedback unit from Immersion Corporation
> using two motors for haptic feedback in mobile phones. It is
> used in Samsung Galxy S Advance GT-I9070 (Janice) and Samsung
> Beam GT-I8350 (Gavini).
> 
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  MAINTAINERS                  |   6 +
>  drivers/input/misc/Kconfig   |  11 +
>  drivers/input/misc/Makefile  |   1 +
>  drivers/input/misc/isa1200.c | 429 +++++++++++++++++++++++++++++++++++
>  4 files changed, 447 insertions(+)
>  create mode 100644 drivers/input/misc/isa1200.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..439bb72c9468 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9363,6 +9363,12 @@ IMGTEC IR DECODER DRIVER
>  S:	Orphan
>  F:	drivers/media/rc/img-ir/
>  
> +IMMERSION ISA1200 HAPTIC FEEDBACK CHIP
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +L:	linux-input@vger.kernel.org
> +F:	Documentation/devicetree/bindings/input/immersion,isa1200.yaml
> +F:	drivers/input/misc/isa1200.c
> +
>  IMON SOUNDGRAPH USB IR RECEIVER
>  M:	Sean Young <sean@mess.org>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index dd5227cf8696..3a0e371a6579 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -762,6 +762,17 @@ config INPUT_IQS626A
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called iqs626a.
>  
> +config INPUT_ISA1200_HAPTIC
> +	tristate "Immersion ISA1200 haptic feedback unit"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable support for the Immersion ISA1200 haptic
> +	  feedback unit.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called isa1200.
> +
>  config INPUT_CMA3000
>  	tristate "VTI CMA3000 Tri-axis accelerometer"
>  	help
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index b92c53a6b5ae..f6987c20e516 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
>  obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
>  obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
>  obj-$(CONFIG_INPUT_IQS626A)		+= iqs626a.o
> +obj-$(CONFIG_INPUT_ISA1200_HAPTIC)	+= isa1200.o
>  obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
>  obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
>  obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
> diff --git a/drivers/input/misc/isa1200.c b/drivers/input/misc/isa1200.c
> new file mode 100644
> index 000000000000..472058c32d42
> --- /dev/null
> +++ b/drivers/input/misc/isa1200.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Immersion Corporation ISA1200 haptic feedback unit
> + * This chip controls two force-feedback motors
> + *
> + * This chip can use either an external clock or an external PWM
> + * to drive the PWM. If a clock is used, the chip will generate the
> + * PWM for the motor. If a PWM input is used, the chip will act as
> + * an amplifier for the PWM input.
> + *
> + * No datasheet exists, registers and values extracted from GPL
> + * code drops from various Samsung mobile phones:
> + *
> + * - Galaxy S Advance GT-I9070
> + * - Galaxy Beam GT-I8350
> + *
> + * Copyright (C) 2022 Linus Walleij <linus.walleij@linaro.org>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/property.h>
> +
> +/* System control (LDO regulator) */
> +#define ISA1200_SCTRL			0x00
> +
> +#define ISA1200_LDO_VOLTAGE_23V		0x08
> +#define ISA1200_LDO_VOLTAGE_24V		0x09
> +#define ISA1200_LDO_VOLTAGE_25V		0x0A
> +#define ISA1200_LDO_VOLTAGE_26V		0x0B
> +#define ISA1200_LDO_VOLTAGE_27V		0x0C
> +#define ISA1200_LDO_VOLTAGE_28V		0x0D
> +#define ISA1200_LDO_VOLTAGE_29V		0x0E
> +#define ISA1200_LDO_VOLTAGE_30V		0x0F
> +#define ISA1200_LDO_VOLTAGE_31V		0x00
> +#define ISA1200_LDO_VOLTAGE_32V		0x01
> +#define ISA1200_LDO_VOLTAGE_33V		0x02
> +#define ISA1200_LDO_VOLTAGE_34V		0x03
> +#define ISA1200_LDO_VOLTAGE_35V		0x04
> +#define ISA1200_LDO_VOLTAGE_36V		0x05
> +#define ISA1200_LDO_VOLTAGE_37V		0x06
> +#define ISA1200_LDO_VOLTAGE_38V		0x07
> +
> +/*
> + * The vendor source code for the GT-I9070 states that the output
> + * frequency is calculated like this:
> + *
> + *                 base clock frequency
> + * fout = -----------------------------------------
> + *        (128 - PWM_FREQ) * 2 * PLLDIV * PWM_PERIOD
> + *
> + * The base clock frequency is the clock frequency provided on the
> + * clock input to the chip, divided by the value in HCTRL0
> + *
> + * PWM_FREQ is configured in register HCTRL4, it is common to set this
> + * to 0 to get only two variables to calculate.
> + *
> + * PLLDIV is configured in register HCTRL3 (bits 7..4, so 0..15)
> + * PWM_PERIOD is configured in register HCTRL6
> + * Further the duty cycle can be configured in HCTRL5
> + */
> +
> +/*
> + * HCTRL0 configures clock or PWM input and selects the divider for
> + * the clock input.
> + *
> + * Code comments says that bits [1..0] gives the division factor.
> + * If the input clock is 44.8 kHz, writing 0x11 into this register
> + * sets the div_factor to 256 and the resulting frequency will be
> + * 44800/256 = 175Hz.
> + *
> + * If the PWM input mode is set the input on the clock/PWM pin is
> + * assumed to be a PWM already rather than a regular clock pulse.
> + */
> +#define ISA1200_HCTRL0			0x30
> +#define ISA1200_HCTRL0_PWM_GEN_ENABLE	BIT(7)
> +#define ISA1200_HCTRL0_PWM_GEN_MODE	BIT(4)
> +#define ISA1200_HCTRL0_PWM_INPUT_MODE	BIT(3)
> +#define ISA1200_HCTRL0_DIV_512		0x00
> +#define ISA1200_HCTRL0_DIV_256		0x01
> +
> +/*
> + * HCTRL1 configures the motor type(s)
> + * ERM = Excentric rotating mass
> + * LRA = Linear Resonant Actuator
> + *
> + * Bits [0..1] are set to 1 when using PWM input, we don't know
> + * why.
> + */
> +#define ISA1200_HCTRL1			0x31
> +#define ISA1200_HCTRL1_EXT_CLOCK	BIT(7) /* Else PWM in is assumed */
> +#define ISA1200_HCTRL1_DAC_INVERT	BIT(6)
> +#define ISA1200_HCTRL1_ERM		BIT(5) /* Else LRA is assumed */
> +
> +/* HCTRL2 controls software reset of the chip */
> +#define ISA1200_HCTRL2			0x32
> +#define ISA1200_HCTRL2_SW_RESET		BIT(0)
> +
> +/*
> + * HCTRL3 controls the PLL divisor
> + *
> + * Bits [0,1] are always set to 1 (we don't know what they are
> + * used for) and bit 4 and upward control the PLL divisor.
> + */
> +#define ISA1200_HCTRL3			0x33
> +#define ISA1200_HCTRL3_DEFAULT		0x03
> +#define ISA1200_HCTRL3_PLLDIV_SHIFT	4
> +
> +/*
> + * HCTRL4 controls the PWM frequency
> + *
> + * Set this to 0 and ignore the duty cycle and period registers if
> + * PWM input mode is used.
> + */
> +#define ISA1200_HCTRL4			0x34
> +
> +/* HCTRL5 controls the PWM high duty cycle */
> +#define ISA1200_HCTRL5			0x35
> +
> +/* HCTRL6 controls the PWM period */
> +#define ISA1200_HCTRL6			0x36
> +
> +/* The use for these registers is unknown but they exist */
> +#define ISA1200_HCTRL7			0x37
> +#define ISA1200_HCTRL8			0x38
> +#define ISA1200_HCTRL9			0x39
> +#define ISA1200_HCTRLA			0x3A
> +#define ISA1200_HCTRLB			0x3B
> +#define ISA1200_HCTRLC			0x3C
> +#define ISA1200_HCTRLD			0x3D
> +
> +struct isa1200_config {
> +	u8 ldo_voltage;
> +	bool pwm_in;
> +	bool erm;
> +	u8 clkdiv;
> +	u8 plldiv;
> +	u8 freq;
> +	u8 duty;
> +	u8 period;
> +};
> +
> +struct isa1200 {
> +	const struct isa1200_config *conf;
> +	struct input_dev *input;
> +	struct device *dev;
> +	struct regmap *map;
> +	struct clk *clk;
> +	struct gpio_desc *hen;
> +	struct gpio_desc *len;
> +	struct work_struct play_work;
> +	int level;
> +};
> +
> +static const struct regmap_config isa1200_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x3d,
> +};
> +
> +void isa1200_start(struct isa1200 *isa)
> +{
> +	const struct isa1200_config *cfg = isa->conf;
> +	u8 hctrl0;
> +	u8 hctrl1;
> +	u8 hctrl3;
> +
> +	clk_prepare_enable(isa->clk);
> +	gpiod_set_value(isa->hen, 1);
> +	gpiod_set_value(isa->len, 1);
> +
> +	udelay(200);
> +
> +	regmap_write(isa->map, ISA1200_SCTRL, cfg->ldo_voltage);
> +
> +	if (!cfg->pwm_in) {
> +		hctrl0 = ISA1200_HCTRL0_PWM_GEN_MODE;
> +		hctrl1 = ISA1200_HCTRL1_EXT_CLOCK;
> +	} else {
> +		hctrl0 = ISA1200_HCTRL0_PWM_INPUT_MODE;
> +		hctrl1 = 0;
> +	}
> +	hctrl0 |= cfg->clkdiv;
> +	hctrl1 |= ISA1200_HCTRL1_DAC_INVERT;
> +	if (cfg->erm)
> +		hctrl1 |= ISA1200_HCTRL1_ERM;
> +
> +	regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
> +	regmap_write(isa->map, ISA1200_HCTRL1, hctrl1);
> +
> +	/* Make sure to de-assert software reset */
> +	regmap_write(isa->map, ISA1200_HCTRL2, 0x00);
> +
> +	/* PLL divisor */
> +	hctrl3 = ISA1200_HCTRL3_DEFAULT;
> +	hctrl3 |= (cfg->plldiv << ISA1200_HCTRL3_PLLDIV_SHIFT);
> +	regmap_write(isa->map, ISA1200_HCTRL3, hctrl3);
> +
> +	/* Frequency */
> +	regmap_write(isa->map, ISA1200_HCTRL4, cfg->freq);
> +	/* Duty cycle */
> +	regmap_write(isa->map, ISA1200_HCTRL5, cfg->duty);
> +	/* Period */
> +	regmap_write(isa->map, ISA1200_HCTRL6, cfg->period);
> +
> +	/* Turn on PWM generation in BIT(7) */
> +	hctrl0 |= ISA1200_HCTRL0_PWM_GEN_ENABLE;
> +	regmap_write(isa->map, ISA1200_HCTRL0, hctrl0);
> +
> +	/*
> +	 * This is done in the vendor tree with the commment
> +	 * "Duty 0x64 == nForce 90", and no force feedback happens
> +	 * unless we do this.
> +	 */
> +	regmap_write(isa->map, ISA1200_HCTRL5, 0x64);
> +}
> +
> +void isa1200_stop(struct isa1200 *isa)
> +{
> +	regmap_write(isa->map, ISA1200_HCTRL0, 0);
> +	gpiod_set_value(isa->len, 0);
> +	gpiod_set_value(isa->hen, 0);
> +	clk_disable_unprepare(isa->clk);
> +}
> +
> +static void isa1200_play_work(struct work_struct *work)
> +{
> +	struct isa1200 *isa =
> +		container_of(work, struct isa1200, play_work);
> +
> +	if (isa->level)
> +		isa1200_start(isa);
> +	else
> +		isa1200_stop(isa);
> +}
> +
> +static int isa1200_vibrator_play_effect(struct input_dev *input, void *data,
> +					struct ff_effect *effect)
> +{
> +	struct isa1200 *isa = input_get_drvdata(input);
> +	int level;
> +
> +	/*
> +	 * TODO: we currently only support rumble.
> +	 * The ISA1200 can control two motors and some devices
> +	 * also have two motors mounted.
> +	 */
> +	level = effect->u.rumble.strong_magnitude;
> +	if (!level)
> +		level = effect->u.rumble.weak_magnitude;
> +
> +	dev_dbg(&input->dev, "FF effect type %d level %d\n",
> +		effect->type, level);
> +
> +	if (isa->level != level) {
> +		isa->level = level;
> +		schedule_work(&isa->play_work);
> +	}
> +
> +	return 0;
> +}
> +
> +static void isa1200_vibrator_close(struct input_dev *input)
> +{
> +	struct isa1200 *isa = input_get_drvdata(input);
> +
> +	cancel_work_sync(&isa->play_work);
> +	if (isa->level)
> +		isa1200_stop(isa);
> +	isa->level = 0;
> +}
> +
> +static int isa1200_probe(struct i2c_client *client)
> +{
> +	struct isa1200 *isa;
> +	struct device *dev = &client->dev;
> +	u32 val;
> +	int ret;

The general practice in input subsystem is to use 'error' for return
values that can only return 0 or an -errno.

> +
> +	isa = devm_kzalloc(dev, sizeof(*isa), GFP_KERNEL);
> +	if (!isa)
> +		return -ENOMEM;
> +
> +	isa->input = devm_input_allocate_device(dev);
> +	if (!isa->input)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, isa);
> +	isa->dev = dev;
> +	isa->conf = device_get_match_data(dev);
> +
> +	/*
> +	 * TODO: we currently only support using a clock, but the device
> +	 * and the device tree bindings support feeding the chip with a
> +	 * PWM instead. If you need this and can test it, implement it.
> +	 */
> +	isa->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(isa->clk)) {
> +		ret = PTR_ERR(isa->clk);
> +		return dev_err_probe(dev, ret, "failed to get clock\n");
> +	}
> +
> +	isa->map = devm_regmap_init_i2c(client, &isa1200_regmap_config);
> +	if (IS_ERR(isa->map)) {
> +		ret = PTR_ERR(isa->map);
> +		return dev_err_probe(dev, ret, "failed to initialize register map\n");
> +	}
> +
> +	/* Read a register so we know that regmap and I2C transport works */
> +	ret = regmap_read(isa->map, ISA1200_SCTRL, &val);
> +	if (ret) {
> +		dev_info(dev, "failed to read SCTRL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	isa->hen = devm_gpiod_get(dev, "hen", GPIOD_OUT_LOW);
> +	if (IS_ERR(isa->hen)) {
> +		ret = PTR_ERR(isa->map);

isa->hen

> +		return dev_err_probe(dev, ret, "failed to get HEN GPIO\n");
> +	}
> +	isa->len = devm_gpiod_get(dev, "len", GPIOD_OUT_LOW);
> +	if (IS_ERR(isa->hen)) {
> +		ret = PTR_ERR(isa->map);

isa->len

> +		return dev_err_probe(dev, ret, "failed to get LEN GPIO\n");
> +	}
> +
> +	INIT_WORK(&isa->play_work, isa1200_play_work);
> +
> +	isa->input->name = "isa1200-haptic";
> +	isa->input->id.bustype = BUS_HOST;
> +	isa->input->dev.parent = dev;
> +	isa->input->close = isa1200_vibrator_close;
> +
> +	input_set_drvdata(isa->input, isa);
> +	/* TODO: this hardware can likely support more than rumble */
> +	input_set_capability(isa->input, EV_FF, FF_RUMBLE);
> +
> +	ret = input_ff_create_memless(isa->input, NULL,
> +				      isa1200_vibrator_play_effect);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't create FF dev\n");
> +
> +	ret = input_register_device(isa->input);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't register input dev\n");
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused isa1200_suspend(struct device *dev)
> +{
> +	struct isa1200 *isa = dev_get_drvdata(dev);
> +
> +	if (isa->level)
> +		isa1200_stop(isa);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused isa1200_resume(struct device *dev)
> +{
> +	struct isa1200 *isa = dev_get_drvdata(dev);
> +
> +	if (isa->level)
> +		isa1200_start(isa);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(isa1200_pm, isa1200_suspend, isa1200_resume);
> +
> +/* Configuration for Janice, Samsung Galaxy S Advance GT-I9070 */
> +static const struct isa1200_config isa1200_janice = {
> +	.ldo_voltage = ISA1200_LDO_VOLTAGE_30V,

These are better suited as dts properties. In this particular case, you
can accept LDO voltage in standard units of mV and then automatically
calculate the register value without the need for all the #defines above.

> +	.pwm_in = false,
> +	.clkdiv = ISA1200_HCTRL0_DIV_256,
> +	.plldiv = 2,
> +	.freq = 0,
> +	.duty = 0x3b,
> +	.period = 0x77,
> +};
> +
> +/* Configuration for Gavini, Samsung Galaxy Beam GT-I8350 */
> +static const struct isa1200_config isa1200_gavini = {
> +	.ldo_voltage = ISA1200_LDO_VOLTAGE_27V,
> +	.pwm_in = false,
> +	.clkdiv = ISA1200_HCTRL0_DIV_256,
> +	.plldiv = 2,
> +	.freq = 0,
> +	.duty = 0x46,
> +	.period = 0x8c,
> +};
> +
> +static const struct of_device_id isa1200_of_match[] = {
> +	{
> +		.compatible = "immersion,isa1200-janice",
> +		.data = &isa1200_janice,
> +	},
> +	{
> +		.compatible = "immersion,isa1200-gavini",
> +		.data = &isa1200_gavini,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, isa1200_of_match);

I think Rob had a similar comment; these sound like board names rather
than derivatives of the same piece of silicon. I think we only need one
compatible string, with everything from isa1200_config defined in dts.

> +
> +static struct i2c_driver isa1200_i2c_driver = {
> +	.driver = {
> +		.name = "isa1200",
> +		.of_match_table = isa1200_of_match,
> +		.pm = &isa1200_pm,
> +	},
> +	.probe_new = isa1200_probe,
> +};
> +module_i2c_driver(isa1200_i2c_driver);
> +
> +MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
> +MODULE_DESCRIPTION("Immersion ISA1200 haptic feedback unit");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.1
> 

Kind regards,
Jeff LaBundy
