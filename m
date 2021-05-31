Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BEE3969F2
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 00:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhEaXAd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 May 2021 19:00:33 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:46049
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231624AbhEaXAd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 May 2021 19:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX2XUb1qchXQOfGdMLZ4iPe/G44mHdwvzrMKIIrzbLnyOazQPbMgC+VhNXqt+mEBAzFO5l+Dem0JmVDj3RjlgVymB4FCpeB11jQa/MC8PP0fmICMTLBUgS1D4MEEK8MEmCiNxP2AU+3LC4ALPZgZl5ob9AK3lsG4tcdURvqlesf3cwlHWT/mV3u638Lj3Rw47B88GjKySFSoODXmBhYiQ7AWFK7GcmkzQheX1//kxQjv7FwXTyCmqULnv6RvcYdMqVdPk2uTdrWo+kDNa73PXJG/4UKsvXti8wDujoL6p7bACCXvaNG5n1YpvFSY/RIxdvQZCQ1Bm2BQCr5C1sVvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Aap6ILK8ZRi2vOG2NvGT702un7OZGv+7g+fW/SICi8=;
 b=duozc/pl5bMbw2cLXLma0Vf76hN87CqMql0prsJplQXuR+fuuHu8+ChKDmxTvlcrU+eQkH0fr0A+nzhnhBRRASmPsGneysGpdMMGtpYKrGX4j9b/pqFoIIE7Oi/UYEoihkk/Ud+nHo2ugECGw2W93TIj4ihtPyPHhhz3t1jhdpvT0n/XFobBTUF1ZbMy9ASVktt1oI+k3+cufs3SCgdOh/dQaFOR7RC5EVV1HqpsxYkO+RqXm6sgiWD+ZkowMkWTLn5UZhdH3DVBY+WrJoVTQJ9CLbAuWRKnPpjHk011tdfxC5UstivTX+zDtpuA83wjl+YJy5JoNp3G4JDe4lfiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Aap6ILK8ZRi2vOG2NvGT702un7OZGv+7g+fW/SICi8=;
 b=gxBpVYtzz7PdEGSat/tujYhvsShxdRNh0wz8fM6B+vOD89T8TyizR5zRSXC4mgZUwSCGnzW6RwH2QYPA0Zocko9cT8P9jUuOMXHvWivC9QLHz7lMJizAU8+l3CiAuSvs8h5FQ0+DHSvDW/c4xzFyDEF4ATwY2t/Ms4uqiZN1eEA=
Authentication-Results: kaa.org.ua; dkim=none (message not signed)
 header.d=none;kaa.org.ua; dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BY5PR08MB6198.namprd08.prod.outlook.com (2603:10b6:a03:1e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 22:58:50 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 22:58:50 +0000
Date:   Mon, 31 May 2021 17:58:42 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>
Subject: Re: [PATCH] input: add SparkFun Qwiic Joystick driver
Message-ID: <20210531225842.GA4008@labundy.com>
References: <20210531133243.9488-1-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210531133243.9488-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:806:f2::11) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SN7PR04CA0006.namprd04.prod.outlook.com (2603:10b6:806:f2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 22:58:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2c06007-1e97-4646-3a03-08d92487a74d
X-MS-TrafficTypeDiagnostic: BY5PR08MB6198:
X-Microsoft-Antispam-PRVS: <BY5PR08MB6198ABEA83CB69E1D4350DFAD33F9@BY5PR08MB6198.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ySN3nbJZBuUcFT2V3bTgovU9GAGSjoYAM0s7cGkMqB/nK2sC5ry/dm543G4QqHQzhzH5UAlOfKN4tz7v7Jewk/9RpPq4E1Hzcf5R7OHUzX7hFed9qsmNPzykuZaR/KhGf9T6yXaOlPszV4T2pEI1iBf5T9Bn/FEUq4K4RxCkmKI01oP0oRLGsowvSuySSuPD+oMKGZkov6MyCna45gYHLFyw4ue3eQT4hBGeZgIpBz6mWdcEIKttJRaKr+jKPRpyjfBmeyor93ICy5BU3un57WolrydpXKzfu6Cabw3KK9l+Knb0TugzL5lOFY7TICVMLEn/DSdtmS09KPyDE/YtfEJlgspSdDFY8avNz3KmT8zd2rV1v9jobPj0yMNuCFlkcTk7qIlBWrh+I23qeXGEcWLuB7SumSvkfgJYZsyzuStUoJhRqW9wNm0yHHOiyIAzYgP2nrYTJZFTSm+a3ci+Z8c2fv8RfBxWPoyvaREA1N62vQO98FUxj7rzmS/esO195TMdCAlfO0xFcORGe90Gg70OYc3PScJj6AyiSiBJbZ53x+V/RiC+Ti/XK1YhQnnEVxg8YifnS4ZyOli0QygVTPlID1EatFNpwgJVArpDkX3QIwpcND7ygj77wcq0l28Tj3egKcZGL6diIbkfxo2ntipAzZaJwGQTzVGAQQJFcpe0WUK/R+KK5VB6YkrzjATNIeQTYZ/S9shiWM7ia/cQIfw7E0+XpUDd3XcxGfuRDUHWdQXykBHo/76YaPwUyh2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(346002)(39830400003)(366004)(33656002)(8936002)(38350700002)(16526019)(1076003)(66556008)(8676002)(66476007)(186003)(6666004)(966005)(2616005)(86362001)(30864003)(5660300002)(26005)(66946007)(36756003)(55016002)(52116002)(7696005)(6916009)(2906002)(956004)(508600001)(8886007)(38100700002)(316002)(4326008)(54906003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWt3V0czV0lrWXBtRVpnVSt5d1NHT1RudUZHNTZDUm55aFZlMHM0bFJGSk5k?=
 =?utf-8?B?SE5VajlwY2tta2I1c2VkMHZoeGF4SUpBWmNGVWJwMllzM2NXc0FHQVZQQ09o?=
 =?utf-8?B?bEFXaGplSXhRTUcrdHExMFJCVFp5MVBLV05XT0ZUb1lISnBrbWpaYU9QN1RF?=
 =?utf-8?B?bTR2Y1JkVDlpUWpBcjRXU09HNFpCcFB6aGdZblBMQ3NUTGUxSGpYMCtudVRw?=
 =?utf-8?B?d3ZOcmVkZE0vdWdUdHFkbUpUTFVCbk5Rako3TDdCU1RiOFRtaERsdkM5bkZq?=
 =?utf-8?B?cUNVVWdiSW5abDhXN0M3TFo1bFZRSzkxaDU0SWJMWndrR25DMHJlRDFPZ1dn?=
 =?utf-8?B?cExjblhjS3ZRR0IrclliS01aRWRJVnF3cCtkZkl0c1F5cjhMYkFZdEhOYkFC?=
 =?utf-8?B?elVndWtFOTRPenhKRU9qLzMyUFdMYnJYYXV0RkFLVTBxaHhZOUxSNkFBVkdU?=
 =?utf-8?B?Ym5TaWVNU1BUZVhTbTJTNnNuSHo1RTY5SWFpWlJncFQ0SkVRM01EbiswOVdn?=
 =?utf-8?B?UGJoL2Zrd1F4Y3FlMDZ0dWdLb2ExQmljbGVvaklFcis0NFZzWGNZREpEQnNI?=
 =?utf-8?B?V3ExV0lDV09pY0h1aDJPSWlhamNIWUI5VnRPVGtVc1RYV0p3QjNuSk16Zjc5?=
 =?utf-8?B?aDBXeU1aZFBtZmZUeFhYTGNDTTVvaUVmQXoyY0ZJY0NyVnRWdmhlcWd2dFR4?=
 =?utf-8?B?ZThNRldxTUZ5TlVsUUp3TnM2ZFlXMXdwSUZJWGIxdkJRa05sU0xwR2UwYXM5?=
 =?utf-8?B?dVdGYVV3bStUR2h2UkEvR3h6MUJnVy9MZC92cmRtaDAvTDdGNUdzYVdxOHBB?=
 =?utf-8?B?OGYxdWlmdVl2RXF0SHh1Q1hjdlE4Zjlud2lnYXNRZTFYckoxV0pXQ3BLaS9L?=
 =?utf-8?B?ZTBrWW9xdGYxQUJpKzVWa3dNd0g2Zlhva0NiQ3dtT1ROaURtZDNBTkVEUlUv?=
 =?utf-8?B?S3JZS1pyb3o1RnFrdDFiclc3L096TnV3eTkyQ1VwY0Y2bWwydUVPcGNZZ2lm?=
 =?utf-8?B?citWQ0FOYWdhV1RRTy9RbG5neW9ZUnFkdWI1b1o3OUNRREU2U3hxNUNaTnlN?=
 =?utf-8?B?OFdKMEt1Q1FGd2FxYkdaM2Znc0JKcitRSFBsRmtUVFkrZTNLRk5IWEkyRnF0?=
 =?utf-8?B?bDZsSkFwWWZuOTVKYVMzcWhLY3VZTHphMEF2cVB5TlFrT0MvbVYvN1VaTWU5?=
 =?utf-8?B?cUZPd04zZExmOGh3Q2NIY3I2SnIyMTRCT0ZPUjlWNmR3R0t6MVJnd0pDT2FU?=
 =?utf-8?B?RlhNbUo3cWxIbGN6RnJHQmE0dWtmWU1GM1FiUlI2SmpVdGNmbStiMVNhZnlF?=
 =?utf-8?B?OE96c2FhVlNlZWpmV3I4dEtHNWRmYURIVEVBVnZ3OStxUDFTRjFRREJtRDlP?=
 =?utf-8?B?QXVHSEJaUGhwNjVqcnZXZ3J1YWJoZzB5RGpCNFBHa2U2OURTZW52ZDZzSmJC?=
 =?utf-8?B?MmpUVmFyZEFBSEFiTjVUMGtnL0dnSnp0WmVBR0FQQXNPUXJnWVRlTVZ1OXlh?=
 =?utf-8?B?UnE5THdUMW53bEZXaGt3T0dndlhKUEUzSDdmaERvR3ZJY1RxYjlKRXRVUElL?=
 =?utf-8?B?NWhDK1MyM243Q0E0bHlGUDFlWCt2eU1qR1V6M3IyKzlHTEhDVEJEZXZDYnBR?=
 =?utf-8?B?WVNEUjE0NzhvT3NSOWRtMlJhYVpCZWZIdmdHTC9ONElZMnZlRWtpendxdlJS?=
 =?utf-8?B?MCtxWmxTcDZRR1dOZ29mNzRLb2YzcHpiMllQb3Nid0FYRTZyalNjdUJGUWJ3?=
 =?utf-8?Q?F2VyiMEy2UfVlWGokIer9Jpi/05TLPtF0W5YkA/?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c06007-1e97-4646-3a03-08d92487a74d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 22:58:49.7777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQxnneSwOG574AOMUUYtUtLCXI37Sc72dJwpYxw143wNr3rFY6lJIsbHSg5TYrD9ZYOpQBoAMRlsiONzELFFuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6198
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

Neat little device; some comments below.

On Mon, May 31, 2021 at 04:32:43PM +0300, Oleh Kravchenko wrote:
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
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---

Please use a version number (e.g. v2, v3) and add a change log under
the '---' when sending new versions.

>  .../bindings/input/qwiic-joystick.yaml        |  31 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  drivers/input/joystick/Kconfig                |   9 +
>  drivers/input/joystick/Makefile               |   1 +
>  drivers/input/joystick/qwiic-joystick.c       | 169 ++++++++++++++++++
>  5 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qwiic-joystick.yaml
>  create mode 100644 drivers/input/joystick/qwiic-joystick.c

Bindings must be a separate patch with Rob Herring (see MAINTAINERS)
on the To: list.

> 
> diff --git a/Documentation/devicetree/bindings/input/qwiic-joystick.yaml b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> new file mode 100644
> index 000000000000..51cadeb350f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2021 Oleh Kravchenko
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/qwiic-joystick.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: SparkFun Qwiic Joystick
> +
> +maintainers:
> +  - Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +description: |
> +  Bindings for SparkFun Qwiic Joystick (COM-15168).
> +  https://www.sparkfun.com/products/15168
> +
> +properties:
> +  compatible:
> +    const: sparkfun,qwiic-joystick
> +
> +required:
> +  - compatible

'reg' is required as well.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qwiic@20 {
> +        compatible = "sparkfun,qwiic-joystick";
> +        reg = <0x20>;
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 944b02bb96d7..a5631e68f5d1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1060,6 +1060,8 @@ patternProperties:
>      description: Sony Corporation
>    "^spansion,.*":
>      description: Spansion Inc.
> +  "^sparkfun,.*":
> +    description: SparkFun Electronics
>    "^sprd,.*":
>      description: Spreadtrum Communications Inc.
>    "^sst,.*":
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
> index 000000000000..9b7ab0dd1218
> --- /dev/null
> +++ b/drivers/input/joystick/qwiic-joystick.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +/*
> + * SparkFun Qwiic Joystick
> + * Product page:https://www.sparkfun.com/products/15168
> + * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
> + */

Nit: typically the copyright information goes in the multi-line introductory
comments; there is no need for a newline after the SPDX identifier either.

> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +
> +#define QWIIC_JSK_REG_VERS	0
> +#define QWIIC_JSK_REG_DATA	3
> +
> +#define QWIIC_JSK_MAX_AXIS	GENMASK(10, 0)
> +#define QWIIC_JSK_FUZZ		2
> +#define QWIIC_JSK_FLAT		2
> +
> +struct qwiic_jsk {
> +	char			phys[32];
> +	struct input_dev	*dev;
> +	struct i2c_client	*i2c;
> +};
> +
> +struct qwiic_ver {
> +	u8 addr;
> +	u8 major;
> +	u8 minor;
> +} __packed;
> +
> +struct qwiic_data {
> +	u8 hx;
> +	u8 lx;
> +	u8 hy;
> +	u8 ly;
> +	u8 thumb;
> +} __packed;

Let's use __be16 for 16-bit big-endian horizontal and vertical position.

> +
> +static void qwiic_poll(struct input_dev *input)
> +{
> +	struct qwiic_jsk	*priv;
> +	struct qwiic_data	data;
> +	int			ret;
> +	int			x, y, btn;

No need to align these declarations.

> +
> +	priv = input_get_drvdata(input);
> +
> +	ret = i2c_smbus_read_i2c_block_data(priv->i2c, QWIIC_JSK_REG_DATA,
> +					    sizeof(data), (u8 *)&data);
> +	if (ret == sizeof(data)) {

This is personal preference, but returning early on error avoids having
to indent the rest of the function.

> +		x = (data.hx << 8 | data.lx) >> 6;
> +		y = (data.hy << 8 | data.ly) >> 6;

With hx/lx and hy/ly defined using __be16, you can use be16_to_cpu() to
resolve the 16-bit value. A comment to explain the 6-bit shift from the
documentation would be useful too.

> +		btn = !!!data.thumb;

I don't think the triple-not is necessary as input_report_key() already
squashes non-zero values to 1 with '!!'. If register 0x07's polarity is
inverted, just pass !data.thumb to input_report_key().

> +
> +		input_report_abs(input, ABS_X, x);
> +		input_report_abs(input, ABS_Y, y);
> +		input_report_key(input, BTN_THUMBL, btn);
> +
> +		input_sync(input);
> +	}
> +}
> +
> +static int qwiic_probe(struct i2c_client *i2c, const struct i2c_device_id *id)

It's much more common (and easier to read) if the i2c_client struct is
passed as *client.

> +{
> +	struct qwiic_jsk	*priv;
> +	struct qwiic_ver	vers;
> +	int			ret;

No need to align these declarations.

> +
> +	ret = i2c_smbus_read_i2c_block_data(i2c, QWIIC_JSK_REG_VERS,
> +					    sizeof(vers), (u8 *)&vers);
> +	if (ret != sizeof(vers)) {
> +		ret = -EIO;
> +		goto err;
> +	}

If i2c_smbus_read_i2c_block_data() returned a negative value, the original
return value should be preserved. Only return -EIO if 0 <= ret < sizeof().

You can also simply return directly; there is nothing to be undone at this
stage.

> +
> +	if (i2c->addr != vers.addr) {
> +		dev_err(&i2c->dev, "address doesn't match!\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}

This error should be impossible. If the address in dts does not match what
the hardware is expecting, i2c_smbus_read_i2c_block_data() would have been
NAK'd in the first place.

> +
> +	dev_info(&i2c->dev, "SparkFun Qwiic Joystick, FW: %d.%d\n",
> +		 vers.major, vers.minor);

This should be dev_dbg() at most.

> +
> +	priv = devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}

Just return -ENOMEM here.

> +
> +	priv->i2c = i2c;
> +	snprintf(priv->phys, sizeof(priv->phys), "i2c/%s", dev_name(&i2c->dev));
> +	i2c_set_clientdata(i2c, priv);
> +
> +	priv->dev = devm_input_allocate_device(&i2c->dev);
> +	if (!priv->dev) {
> +		dev_err(&i2c->dev, "failed to allocate input device\n");

No need for a print here.

> +		ret = -ENOMEM;
> +		goto err;

Just return -ENOMEM here.

> +	}
> +
> +	priv->dev->dev.parent = &i2c->dev;

This is not necessary; devm_input_allocate_device() takes care of it.

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
> +	ret = input_setup_polling(priv->dev, qwiic_poll);
> +	if (ret) {
> +		dev_err(&i2c->dev, "failed to set up polling: %d\n", ret);
> +		goto err;
> +	}

Again, you can just return 'ret' here.

> +	input_set_poll_interval(priv->dev, 16);
> +	input_set_min_poll_interval(priv->dev, 8);
> +	input_set_max_poll_interval(priv->dev, 32);

Is there any reason not to #define these intervals?

> +
> +	ret = input_register_device(priv->dev);
> +	if (ret)
> +		dev_err(&i2c->dev, "failed to register joystick: %d\n", ret);
> +
> +err:

This goto label is unnecessary.

> +	return ret;
> +}
> +
> +static int qwiic_remove(struct i2c_client *i2c)
> +{
> +	struct qwiic_jsk *priv;
> +
> +	priv = i2c_get_clientdata(i2c);
> +	input_unregister_device(priv->dev);
> +
> +	return 0;
> +}

Because the input device was created with devm_input_allocate_device(),
input_register_device() is managed as well. Therefore you can drop the
remove callback altogether.

> +
> +static const struct of_device_id of_qwiic_match[] = {
> +	{ .compatible = "sparkfun,qwiic-joystick", },
> +	{},

Nit: { }

> +};
> +MODULE_DEVICE_TABLE(of, of_qwiic_match);
> +
> +static const struct i2c_device_id qwiic_id_table[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{},

And here (see other drivers).

> +};
> +MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
> +
> +static struct i2c_driver qwiic_driver = {
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= of_match_ptr(of_qwiic_match),
> +	},
> +	.id_table	= qwiic_id_table,
> +	.probe		= qwiic_probe,
> +	.remove		= qwiic_remove,
> +};
> +module_i2c_driver(qwiic_driver);

No need for alignment here either.

> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.3
> 

Kind regards,
Jeff LaBundy
