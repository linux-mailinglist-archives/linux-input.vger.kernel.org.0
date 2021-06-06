Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F5A39CC1F
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 03:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFFBvY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Jun 2021 21:51:24 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:16736
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230022AbhFFBvX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Jun 2021 21:51:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aal0dvdYMJ9/VQCFUX7SYv/4f5bPTT/2p2lqDL5aJbd06rtXwJzHDYxQaL3t7zMG5wfSCkYSgLjQUBEKTnyVwpUHuTF0SaFOEbH1iX5LzpNsCgPAQ65vfIEnHELUIZlIBtulxDBArsBCfGTssZMrGxb4FQ4B/g0e0j2A5B69ePOe1aZ5BWEQ0Pc3rG2OsKa+mi9BMdt4H0LqaWN0mT7UhtUZCTj2u4IEVxKuTj6eBilt5bsfbmlGrptkAtcnOc6slsK2+EwNAHzTdgIZ6ovqsOAJ5oVQ6vRBX84ftWyqZZJwGdNtb/jPlJDYpK1ooVBTIeBzQgySbISzIfK2e6V6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwn2fQMaZz6ilex6p+a3EVM9Z1vCpcRdc8GYNq/wUdE=;
 b=ArlmuN6gIsjDFjDEH4q2DvjyTkFY/jQPLR4L0QW5E2kDUNeaHuIbVX1EUkb5wlNbnxlOfEDRk523vVMmVUdhmUcLwB5qHRvo/RC1GvlN+0BbS2Bc/BI9BosmJmWAx0v0rx4MZPllndLVzGOwkkqsoVKdB0wEIt8TtE3hY++RjUEr4+PddBT3lmFbYqCk60UYBkciG6LKGWNlaZ9KT9xunqMvuaj9RtLIwobOwMR7PWIU5Crxzq4paMkhhzJgr4Z2qcQ+BXqUUBauiwu0cHrtKtLfx04/akD3DHOLKfc2J1bRnw1lUqciaAcBfNXPTyGoaGNMo4p+wL5fXkAoUyJj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwn2fQMaZz6ilex6p+a3EVM9Z1vCpcRdc8GYNq/wUdE=;
 b=dUWdJYK0YA1FGDanhXH4KqDx3GSudRPk9oVen9chLzFiczHnhqnnHrRn7zJ4jtBVcKHNEipSYutg07XDtxfIDJdP6ENC+lqL1/zFyn8ys94EzD8XP0bCG1udhRd6bjqDv2BoWZGdukVgBuztaxn5mu93yCOTWmP3+HNQkUVKc+Q=
Authentication-Results: kaa.org.ua; dkim=none (message not signed)
 header.d=none;kaa.org.ua; dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB5989.namprd08.prod.outlook.com (2603:10b6:a03:128::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Sun, 6 Jun
 2021 01:49:31 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8%8]) with mapi id 15.20.4195.029; Sun, 6 Jun 2021
 01:49:31 +0000
Date:   Sat, 5 Jun 2021 20:49:25 -0500
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
Message-ID: <20210606014925.GA1535@labundy.com>
References: <20210602190504.23076-1-oleg@kaa.org.ua>
 <20210603143807.GA13110@labundy.com>
 <7a78421c-f1aa-c5a8-bdde-0f24e5c9b669@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a78421c-f1aa-c5a8-bdde-0f24e5c9b669@kaa.org.ua>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:806:122::30) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SN7PR04CA0115.namprd04.prod.outlook.com (2603:10b6:806:122::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend Transport; Sun, 6 Jun 2021 01:49:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9e9748-a7b3-4533-5791-08d9288d53b7
X-MS-TrafficTypeDiagnostic: BYAPR08MB5989:
X-Microsoft-Antispam-PRVS: <BYAPR08MB59892329E401E1683A3F1440D3399@BYAPR08MB5989.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HplX7THm6Vv6ZCzRCS9YR08fVJ22ILWNSBNrNuMk8x36R21mRS4ac0sybPDfRp7Hy3cRBxLuqPt1M0zYrJSifla1+cWTamQMpKFiePueoR72moCGU2KsYvG9MSmOLGbXIZGnZIeZu3y4GHklfF/VCI4wEbHeoSSUxqY4waYKoF2B+KMpHa11DuEtOcoZ8Z341VzhW4/8VLY7g+6UgA1E96JGpCEMnwrKmTCYmXUnyuNM3gbR/GUReua8eRoPPBULbYSzkpj/7Lx4HP8qFlzTsMVSha6TjmXdqbA2T11jFjn86jIJWPPpOvYlyxJjO6sirvBigqxhnrgKmlmOmJi3gSxTmv2zbuUXR9cdLkwmveCe3RDr9N7uRbfUrDkp8Okrd/VHM7RGNg/CE4WrDUOPqQB3HydY/BR5rNiR6ucuZ+aA/zDGBlMsyfvhJ4V1DMqwq7EItr5vPs92v4S0bZ1PXGBWwmvfp9eBkyOuLOmx/unxXCdjR3B1dxvwW7YHnqsL8RiBlLxWlW0VfzDUALq/dnfI9FkkN5LBqqTJp5BbshjmQjNUTtdlNev2uRL+HSkxkfzraE1R9pwT2KT+eJBP8npCis3EL5NnFtLBSVyeRm+++8FfRq8cUvGOk+eL1I5S3PSTGFcLWypzfNjOeHbmf1tJ82kWQtUnFZ44jsf+Y/V54BYgl5Q1VVuvI81MYiCdtfVQvcznpl7jcB4mVcYVab5/9quiTN+OkJ7VPFnhgGoyEqqRUeuFAfcPo/Byur43G+DVtXC+pznUk8us2MS5jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(346002)(376002)(136003)(366004)(396003)(8886007)(478600001)(2616005)(956004)(36756003)(6666004)(966005)(6916009)(38100700002)(4326008)(38350700002)(5660300002)(7696005)(33656002)(52116002)(55016002)(86362001)(54906003)(316002)(66556008)(66476007)(66946007)(8936002)(16526019)(83380400001)(8676002)(26005)(186003)(2906002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cVhQeTgrdHJ6SFpFMCtKKy9BZExZa0xpTGtMSVNxZ1Z3a3Jad0J1dURmaUhF?=
 =?utf-8?B?eHd4WEJYYXFqTENnWXN1L3RiaVg3OFVZQjUyeXQyTDdySGk4NVptemxEWUZT?=
 =?utf-8?B?cXRpMWh1Ni8vejlnR003NXJuNlZCUnBsVTFIbFpVTDVOVnR0OFh1VDJWSGdv?=
 =?utf-8?B?OWJWc3lySlg3UnM0ZVVSZ0Y2VGVPR3p2MHU1Q2pxa09JakgzYWp3Qmp1dDVC?=
 =?utf-8?B?eC8waXVWaGRpdHBlWDRvY3FwRkd4MmxKREVMWW92b2ZyUTJMWFg3K2szcmNi?=
 =?utf-8?B?THZGcTRPa0FSWTIvSjQ3aXRsN09vMGppcnpSRFppTmdwcGE4ODhhNnUzSHVY?=
 =?utf-8?B?VXBlbi9OTUlyeXhHZDNvdzJjNlB3TkRJaUNKcGVJNVI5dUZKT3cyTllENitz?=
 =?utf-8?B?em8yMXJVNlB6dmNma1dGSzM4T3pmaGV0WWlWOGF0NzNXS1MvYkdDUFNpZzhw?=
 =?utf-8?B?dTFSd1BIUjI2Y3Rnd243L1ZRYXBseThIME9ydnlGdHJNVi90QS94Z3lBOGJL?=
 =?utf-8?B?bWxpVGFnQ1ppS3hsMWxVK2xZd21DVWF4SDN6bFcyRElsTWQ5K2NLdy9HQ0JF?=
 =?utf-8?B?R2RDdlZTaFpTRUFtd0M2dEZlSUhuSjR2azgxWGlVRndIT3kyQlhSTkNPWk9x?=
 =?utf-8?B?NUI2OFZaQXZWNDdMSGxUTm5yYVhWOUR0TEV5RnU1T2g0aEJ1cnBKY2hrWnJE?=
 =?utf-8?B?ekd1M2NVcXN2azFudnA0V0hIWkI3dFU2cWt6WFFCdmd5R3NKMndRT2JUd0Fz?=
 =?utf-8?B?OGJ5TVBtdjZOa01IcXJIVWlGWVRWWjdHbk9MQ0pJVnN5VzdINUdWUTNackZL?=
 =?utf-8?B?NlhLdzhaR3NzejMrQy9sVHR4bWJDSG1xWC9ocml1R3UrN2ZzRHdpVzRaYkI0?=
 =?utf-8?B?TE1LNW5MVU5oakt3NVZid0UyVktmVzN1VTBxbkJEYXJySW5RSkRNcStEKzJL?=
 =?utf-8?B?MGw3aEUxa1dHYXM3VFZXenZ3ZVZFc2pKVG8xVE1BQVl6aTRUa2JVTjhWSGRB?=
 =?utf-8?B?QkkxaVhaZzF2V0tqeHRhaHVXMWZqcG1kWHFLWmsyL0Z1ZmZscW8vQjB6VExD?=
 =?utf-8?B?cmlONVBZYjU5YktUOXlvdGF2V2V6MzJNR2FrNTlheEVkMk1aQTIyTTZPYzdh?=
 =?utf-8?B?Qml0N2tpNGNlNm8xb24rbFM5N3JjcHVHOU9ZSEJ5b01rd0pkZnI4ZHYzelhB?=
 =?utf-8?B?blE3K0cxS3Z5dG50ZGViZXQ3LzVCU21BVk00M1hOUk9qUTBWSi90QVlwV0ZQ?=
 =?utf-8?B?WUYzVnVXekxJMFdEemFjVSt4M3M3QUg1K2NtRlJNNEdpdENaeWRmSE81Q1Yw?=
 =?utf-8?B?L29oYzNwdll2VmlpVHY2dWIvdWhDTjR5K3Zwa0JTbXdTRUFzeE5MZnFhQXJr?=
 =?utf-8?B?dDZTRlpGTkx2N3RabzVhbVZYRmd1di9waEVUTktVU2tyczlFNDZMU2JoT0hY?=
 =?utf-8?B?L0dGZnJnRlQ3dXQ5V0RkUWg4ZkZBNVQrZUlHOWdmenYvMlkxRk5JUFNDcmJa?=
 =?utf-8?B?eHI4U0NEelY5L1RXaEZ1VGhLdFkzSWFGWTI3OGQxZG1QV2JUaDZ5aEZqaVFC?=
 =?utf-8?B?d2J2Ulo2SldlRmJCMVZqQXdMVFZlZkNpdTFCZytHZjRxenZxTW9TaTh4b3NB?=
 =?utf-8?B?NlgxK2lxUWVVdVBGbERHQllUZWhVMFc1OUlFRDB3SytTSWJOQ2ZpK0JNNnhx?=
 =?utf-8?B?RDlVNENzd0JtOWl4YTVHYXFQYW8zMFErQWFCcDdvK0o3S2dsRGFMZUZBaXJ3?=
 =?utf-8?Q?uo4ml9s2xm4dOAC8438+SFBrsB9LsSiIegWeIhP?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9e9748-a7b3-4533-5791-08d9288d53b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 01:49:31.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yS50jLT0/Ry1urjMCPrza89Y7wgmHv/wy0u7ZR0crSkI7MpJjf9qcBnM4T4JRoxp4Kc+djBbTH6mWYc+vCPE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5989
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

On Fri, Jun 04, 2021 at 12:54:42AM +0300, Oleh Kravchenko wrote:
> Hello Jeff,
> thank you for your code-review.
> 
> Could you please clarify a few things below?
> Just for my better understanding.
> 
> 
> 03.06.21 17:38, Jeff LaBundy пише:
> > Hi Oleh,
> > 
> > This cleaned up rather nicely; just a few more comments from myself.
> > 
> > On Wed, Jun 02, 2021 at 10:05:04PM +0300, Oleh Kravchenko wrote:
> >> A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> >> Directional movements are measured with two 10 kΩ potentiometers
> >> connected with a gimbal mechanism that separates the horizontal and
> >> vertical movements. This joystick also has a select button that is actuated
> >> when the joystick is pressed down.
> >>
> >> Input events polled over the I2C bus.
> >>
> >> Product page:
> >> https://www.sparkfun.com/products/15168
> >> Firmware and hardware sources:
> >> https://github.com/sparkfun/Qwiic_Joystick
> >>
> >> Tested on RPi4B and O4-iMX-NANO boards.
> >>
> >> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> >> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> Cc: Jiri Kosina <jikos@jikos.cz>
> >> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> > 
> > Typically a binding patch should be first in the series (i.e. [1/2])
> > with the driver next (i.e. [2/2]) so that checkpatch does not signal
> > a warning about an undocumented compatible string.
> > 
> >> ---
> >>
> >> Changes:
> >> - update code after code review
> >>
> >>  drivers/input/joystick/Kconfig          |   9 ++
> >>  drivers/input/joystick/Makefile         |   1 +
> >>  drivers/input/joystick/qwiic-joystick.c | 147 ++++++++++++++++++++++++
> >>  3 files changed, 157 insertions(+)
> >>  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> >>
> >> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> >> index 5e38899058c1..7dfe8ea90923 100644
> >> --- a/drivers/input/joystick/Kconfig
> >> +++ b/drivers/input/joystick/Kconfig
> >> @@ -372,6 +372,15 @@ config JOYSTICK_PXRC
> >>  	  To compile this driver as a module, choose M here: the
> >>  	  module will be called pxrc.
> >>  
> >> +config JOYSTICK_QWIIC
> >> +	tristate "SparkFun Qwiic Joystick"
> >> +	depends on I2C
> >> +	help
> >> +	  Say Y here if you want to use the SparkFun Qwiic Joystick.
> >> +
> >> +	  To compile this driver as a module, choose M here: the
> >> +	  module will be called qwiic-joystick.
> >> +
> >>  config JOYSTICK_FSIA6B
> >>  	tristate "FlySky FS-iA6B RC Receiver"
> >>  	select SERIO
> >> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> >> index 31d720c9e493..5174b8aba2dd 100644
> >> --- a/drivers/input/joystick/Makefile
> >> +++ b/drivers/input/joystick/Makefile
> >> @@ -27,6 +27,7 @@ obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
> >>  obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
> >>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
> >>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
> >> +obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
> >>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
> >>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
> >>  obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
> >> diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
> >> new file mode 100644
> >> index 000000000000..59c0f3e6ee75
> >> --- /dev/null
> >> +++ b/drivers/input/joystick/qwiic-joystick.c
> >> @@ -0,0 +1,147 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
> >> + *
> >> + * SparkFun Qwiic Joystick
> >> + * Product page:https://www.sparkfun.com/products/15168
> >> + * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
> >> + */
> >> +
> >> +#include <linux/bits.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/input.h>
> > 
> > Now that you are using byte order macros, you should explicitly include
> > linux/kernel.h.
> 
> Where is requirement is described?
> I've found a lot of drivers without including linux/kernel.h but linux/bits.h

It's actually asm/byteorder.h that defines these; I mention linux/kernel.h
as it includes it anyway. I think either is fine for this driver.

> 
> >> +#include <linux/module.h>
> >> +
> >> +#define DRV_NAME "qwiic-joystick"
> >> +
> >> +#define QWIIC_JSK_REG_VERS	0
> >> +#define QWIIC_JSK_REG_DATA	3
> >> +
> >> +#define QWIIC_JSK_MAX_AXIS	GENMASK(9, 0)
> >> +#define QWIIC_JSK_FUZZ		2
> >> +#define QWIIC_JSK_FLAT		2
> >> +#define QWIIC_JSK_POLL_INTERVAL	16
> >> +#define QWIIC_JSK_POLL_MIN	8
> >> +#define QWIIC_JSK_POLL_MAX	32
> >> +
> >> +struct qwiic_jsk {
> >> +	char			phys[32];
> >> +	struct input_dev	*dev;
> >> +	struct i2c_client	*client;
> >> +};
> > 
> > Nit: no need to align these declarations (here and a few other places).
> > 
> >> +
> >> +struct qwiic_ver {
> >> +	u8 addr;
> >> +	u8 major;
> >> +	u8 minor;
> >> +} __packed;
> > 
> > 'addr' is unused so it can be dropped, in which case QWIIC_JSK_REG_VERS
> > would need to be increased to 1.
> > 
> >> +
> >> +struct qwiic_data {
> >> +	__be16	x;
> >> +	__be16	y;
> >> +	u8	thumb;
> >> +} __packed;
> >> +
> >> +static void qwiic_poll(struct input_dev *input)
> >> +{
> >> +	struct qwiic_jsk *priv;
> >> +	struct qwiic_data data;
> >> +	int err;
> >> +
> >> +	priv = input_get_drvdata(input);
> >> +
> >> +	err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
> >> +					    sizeof(data), (u8 *)&data);
> >> +	if (err != sizeof(data))
> >> +		return;
> >> +
> >> +	input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
> >> +	input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
> >> +	input_report_key(input, BTN_THUMBL, !data.thumb);
> >> +	input_sync(input);
> >> +}
> >> +
> >> +static int qwiic_probe(struct i2c_client *client,
> >> +		       const struct i2c_device_id *id)
> >> +{
> >> +	struct qwiic_jsk *priv;
> >> +	struct qwiic_ver vers;
> >> +	int err;
> >> +
> >> +	err = i2c_smbus_read_i2c_block_data(client, QWIIC_JSK_REG_VERS,
> >> +					    sizeof(vers), (u8 *)&vers);
> >> +	if (0 <= err && err < sizeof(vers))
> >> +		err = -EIO;
> >> +	if (err < 0)
> >> +		return err;
> > 
> > I think this reads a little simpler as:
> > 
> > if (err < 0)
> > 	return err;
> > if (err != sizeof(vers))
> > 	return -EIO;
> > 
> 
> Can we sure that i2c_smbus_read_i2c_block_data() will read exact numbers of bytes?
> And if it read less, will return it an error?

I think it's highly unlikely an adapter would perform an incomplete transfer
without returning an error. However, this behavior is technically defined by
the adapter itself.

As such, I think it's prudent to validate the entire range of return values.
If for some reason i2c_smbus_read_i2c_block_data() returned 1, vers.minor is
garbage and you must bail or retry.

My point from your original patch was that you should not squash every value
below sizeof(vers) as -EIO. In case i2c_smbus_read_i2c_block_data() returned
a different negative value, you should return that from probe.

> 
> >> +
> >> +	dev_dbg(&client->dev, "SparkFun Qwiic Joystick, FW: %d.%d\n",
> >> +		vers.major, vers.minor);
> > 
> > These should be printed as %u.
> > 
> >> +
> >> +	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->client = client;
> >> +	snprintf(priv->phys, sizeof(priv->phys),
> >> +		 "i2c/%s", dev_name(&client->dev));
> >> +	i2c_set_clientdata(client, priv);
> >> +
> >> +	priv->dev = devm_input_allocate_device(&client->dev);
> >> +	if (!priv->dev)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->dev->id.bustype = BUS_I2C;
> >> +	priv->dev->name = "SparkFun Qwiic Joystick";
> >> +	priv->dev->phys = priv->phys;
> >> +	input_set_drvdata(priv->dev, priv);
> >> +
> >> +	input_set_abs_params(priv->dev, ABS_X, 0, QWIIC_JSK_MAX_AXIS,
> >> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> >> +	input_set_abs_params(priv->dev, ABS_Y, 0, QWIIC_JSK_MAX_AXIS,
> >> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> >> +	input_set_capability(priv->dev, EV_KEY, BTN_THUMBL);
> >> +
> >> +	err = input_setup_polling(priv->dev, qwiic_poll);
> >> +	if (err) {
> >> +		dev_err(&client->dev, "failed to set up polling: %d\n", err);
> >> +		return err;
> >> +	}
> >> +	input_set_poll_interval(priv->dev, QWIIC_JSK_POLL_INTERVAL);
> >> +	input_set_min_poll_interval(priv->dev, QWIIC_JSK_POLL_MIN);
> >> +	input_set_max_poll_interval(priv->dev, QWIIC_JSK_POLL_MAX);
> >> +
> >> +	err = input_register_device(priv->dev);
> >> +	if (err)
> >> +		dev_err(&client->dev, "failed to register joystick: %d\n", err);
> >> +
> >> +	return err;
> >> +}
> >> +
> >> +#ifdef CONFIG_OF
> >> +static const struct of_device_id of_qwiic_match[] = {
> >> +	{ .compatible = "sparkfun,qwiic-joystick", },
> >> +	{ },
> >> +};
> >> +MODULE_DEVICE_TABLE(of, of_qwiic_match);
> >> +#endif /* CONFIG_OF */
> >> +
> >> +static const struct i2c_device_id qwiic_id_table[] = {
> >> +	{ KBUILD_MODNAME, 0 },
> >> +	{ },
> >> +};
> >> +MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
> >> +
> >> +static struct i2c_driver qwiic_driver = {
> >> +	.driver = {
> >> +		.name		= DRV_NAME,
> >> +		.of_match_table	= of_match_ptr(of_qwiic_match),
> >> +	},
> >> +	.id_table	= qwiic_id_table,
> >> +	.probe		= qwiic_probe,
> >> +};
> >> +module_i2c_driver(qwiic_driver);
> >> +
> >> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> >> +MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
> >> +MODULE_LICENSE("GPL v2");
> >> -- 
> >> 2.26.3
> >>
> > 
> > Kind regards,
> > Jeff LaBundy
> > 
> 
> -- 
> Best regards,
> Oleh Kravchenko
> 

Kind regards,
Jeff LaBundy
