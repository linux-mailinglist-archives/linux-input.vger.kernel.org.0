Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FF039CC2D
	for <lists+linux-input@lfdr.de>; Sun,  6 Jun 2021 04:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhFFCE2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Jun 2021 22:04:28 -0400
Received: from mail-bn7nam10on2057.outbound.protection.outlook.com ([40.107.92.57]:50585
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230022AbhFFCE2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Jun 2021 22:04:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL5dsM0CagadydNDYXttlBMMG+nWdcP9zmvCyMUkTQrudO0uvV9k/dvHF1pBBcuWbaGdMQisBFASE2dfZ31tyzvNPLw+F7YaXgI/dZ2OQGngBPOjMTtO9S8gbqdHMSe6N1nBlxZmvL99nAwt8fp248MPxrRpOw7IMyI+ThPft26x6uHHznjJpEjfA+xvEtz8hjiYJLSXx1ryyCy2Lnv5OhvjhC2m2ClqRZyzQZ8y7+qh0D9+w+eD5noju4PWDD5aqXrlbueCCJr6T3RQl/UwRH9D5MErn7/kIuFXyzneMgBSHB/4RSRUumelYbpN3GPRn3+eWq6mtT9GN4rs0XX2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRLxosQ/zIr8xPMg25mfJsL625lpk52JjZ9Vm3eV4bs=;
 b=hq5j0+43grZm5Ra+L5j4m4v/OW7BJXVBv1EaExsUBPmdpW+j9rv5Jbidg/bmu6G+m74bo+qbjSis69vlDVg7E2gdPm9aWJ5fxhzE+Ghvl1yxCtu0mIhMKG4MiE+upyWdKqke2LoMCto+gJvruPNvZzqWOr731G54KYjPF4txcQ/t5G4sjxM2qgEMsnB5HzLrF41yMgUkKjl/qWFrjItLmzyAuVZefQCpzKc3YYyJnw0OAbLOlXAndzOR7FaqIxFjnWcWkdnP7ipwhnajbhCrPDwast85/FIIlKZ3n39tM+f1pYED4SdH58hVrqkvhVVSim88glvlC25+gSv5B7yWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRLxosQ/zIr8xPMg25mfJsL625lpk52JjZ9Vm3eV4bs=;
 b=ifFpplR0qwkGoj/1BTawCGBbA3FhNHt/qy1ItCOcWNv8KBxo9QRqqZuWZ97/3Rw4VBtWH2sOMwOiBE44heBAC85KsCNl3J0ytKwcs0NLifLYe9yDq4r15EbV3r3sjQSDVkPZXHboswJUy1PPXL9ax7Jqd0UeSoBzPd4XXUkmjcI=
Authentication-Results: kaa.org.ua; dkim=none (message not signed)
 header.d=none;kaa.org.ua; dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB3912.namprd08.prod.outlook.com (2603:10b6:a02:83::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21; Sun, 6 Jun
 2021 02:02:35 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::8437:f5f6:48e:f5d8%8]) with mapi id 15.20.4195.029; Sun, 6 Jun 2021
 02:02:35 +0000
Date:   Sat, 5 Jun 2021 21:02:31 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2 v3] input: add SparkFun Qwiic Joystick driver
Message-ID: <20210606020231.GB1535@labundy.com>
References: <20210603221801.16586-1-oleg@kaa.org.ua>
 <20210603221801.16586-2-oleg@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603221801.16586-2-oleg@kaa.org.ua>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN2PR01CA0081.prod.exchangelabs.com (2603:10b6:800::49) To
 SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.90.243) by SN2PR01CA0081.prod.exchangelabs.com (2603:10b6:800::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Sun, 6 Jun 2021 02:02:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7d7d609-5148-4716-f246-08d9288f26d4
X-MS-TrafficTypeDiagnostic: BYAPR08MB3912:
X-Microsoft-Antispam-PRVS: <BYAPR08MB3912D651EB4326F2062F2017D3399@BYAPR08MB3912.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Lfuh9YCHeGDDFJsrZ/4DNNnj42qhOchsAgkTfStbyfQWNlQf95SeNs6Q5jtU03VL1PymUhbvCdDNVnuJ1jm3zTa05b4OOSfqiV9DPb6BU4LDGNloHacrfr7G81+Cabq2jnOn9w3ZDUSnauLPgYf7N4LIxQJTyMFbwQzc5BHoK4IXSo+r+Z38y35x4AX7sn6cnpKTFx+z87ZchyV5wL+ksNFLWGXaL+LIRynFfipqpy+4JEJCcqWhvEZ4bmY8ISLSfuX0eUnqtZxPRahOTaKonBvBEVX8cVD4FC/dnzLDx9nJn4PCJH7lhcwQGJfgyIOPMmb0YVxTstBT4YqLtyN+lyifjPhKxae8RTzC0HAeXMZKFhzSUArKiKJMe2LCihX6lNuFKC2hhktAACTqUPQdWWYR3+PIucFYvfz0DUeHdbD6LGEz55BF27CHg8IiRiQXS3Sh4BDkFjuzhHwyIqzWQn/E83CSNszdiGmOGdbWO6FWt9v5nERdRMKoZNOYroIQAIN5g0YVr7e3Ux9GC5l2GgpJxMj4Y2EerszrrIwifguzz0DjpcbhyuecNgFpZZ/dylX/5r1O6Kv7i889HiNtSkuHALI/gdDL3RrO4xfPF4lH0mHzzUtIpIEGDpJac4DhE+jSUfAMI+XJ4XpdoEwST5tR6HRN6OA7oTTswrVnT8ltifNJa4Rmjp8eFE/sVoNwyX6swIttKRptZvikg5uWUFaApoZg3poHOCoW0DxfCi2TkbJ0nq6C3DJtPVNnWkQp7xIHf2Cmlp2BHhGROgUoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39830400003)(396003)(54906003)(86362001)(2906002)(316002)(38350700002)(38100700002)(36756003)(4326008)(66476007)(66946007)(66556008)(83380400001)(52116002)(966005)(55016002)(6666004)(26005)(6916009)(1076003)(2616005)(956004)(186003)(7696005)(33656002)(478600001)(8936002)(8676002)(16526019)(8886007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3VkSUtaUTBXMTBqbXJNNTFYL2U2emQ5TEFrTWZ5L3hIUVpBaFdNS2xPc2JC?=
 =?utf-8?B?dkd6V0xUSlVwdTFEUS81MFBGZHhEa3N5OGNQZHhySXJzd1FTS2tTdVZTeXpO?=
 =?utf-8?B?L3dTMzdoejI3Vkd2N1pwMDd5Qmlldko1aHJ3SUJ1MlBYNDAzdmJZamwweHhL?=
 =?utf-8?B?dkQzOHRTWXlldWZJVVpBYUhpeGdla1A4VVNrTVlRTEZFLzY2SmIvYjRxVlRr?=
 =?utf-8?B?Y0pIWS9NUUlvUmlzdWVVSFYvQmtRbjJzSWQ0Ni93ekhIUkltcGVOZDc3Wkx3?=
 =?utf-8?B?Q1VIRFFkcXZrcjROU0s5bi9ucGFTenJzUEsyK0E0MHNDekorV0s2N3BBUWN6?=
 =?utf-8?B?TWJpUWc5QmtxWjBQUzRyYzNlcEFrWHFkYkdiejRtZWcyRG1DekVxczNiend6?=
 =?utf-8?B?M1FnazlTNzRkTG1qcUEyQWZqVDNOY0VmM29nd2tYOEEzV1FVU2NpMWVNQW5Y?=
 =?utf-8?B?dDhleHVVUENUcWRKSEgyQ2kzNmNPWnhwWlNwQWU1Yi9uOTVET1ZUS3hoYVcr?=
 =?utf-8?B?NW9lSEMxa3krRnB0MDZpSG9zelh6SjB3Q3lkY0V4OEZxZ1ZHVm96WTBmRkVG?=
 =?utf-8?B?aGZER1UzTzc1N1BOTFl2SW9ZUEdoNUFZa2pKTnVxdVZkdjZsR0pYUkFCRlIw?=
 =?utf-8?B?T1hkMFpwaUs3UGlyTXlvbytldGRnVnQvSHlrWHd0QUhBU2gvemR2NHVZTE5G?=
 =?utf-8?B?bGt5UlRmVmVYa0lKZkl4QmEwbTZkRDNGa0R3cEhHczBDd2VGY0ZwWDdJOGZE?=
 =?utf-8?B?d3ZJMVlQYmpqdlBJRUptR2lvZlhSb3hmbkc1Nm5mWHZtRk15TUhUYzNFdlNo?=
 =?utf-8?B?YUt6WThRMTU5aVgxMjVjR3RlSXdqQlQ1QzJsL2hIQkFTRWtXWUMyUU50M2cv?=
 =?utf-8?B?ajhramY1MmI0TnZMdzFOTlQrKzE5a3pKaFZKQU85RnlkM0pSOFdXMHpjWEVj?=
 =?utf-8?B?RUxxTlBxZ1VnVVo5bTRQMjVNMmlFbDZsbmo3NzcxU1FqTnhtb0w5c3JFTXVD?=
 =?utf-8?B?aFFhQi9OY0liRkFmYklFYWpxOGpGbmhtbjdvYjZrM2tYckRBQnRWT09PSHJ0?=
 =?utf-8?B?T2hZbzJqUHUxMEtlZnhCd2loR1ZrUkwxMG5LMEo2alB3dWRyUFZWeTRxbGxB?=
 =?utf-8?B?ZWVXenFKZWV1UVVLN0hYS2ZnKzJJQjA3Y2FWZmVTc2tDWDJUd2JSOE9PTTBq?=
 =?utf-8?B?bitVT2k0dENhRExTOXRZWGpTT0NXYi8zYk96TFRYWEY5cER2WEk5SDdDUTBH?=
 =?utf-8?B?VVVuSWxzQytYaUlqSDl4OWI0MitKT3psbFJuYlllejZGY1g2YnJnRXQvMHFh?=
 =?utf-8?B?aWhtYzd5bzYrS0pJd3ZGR3Q2MnZ6b3A0akRreS9BVENUWEZ6UjdjN3F5Mnlw?=
 =?utf-8?B?YUdKU0RTazhtck5UWWxSTGxWZVZhalFvQXpYazRKdTVSQ0ZqbHg2SUlHRTBE?=
 =?utf-8?B?NmMycDNWbkNXSzkrQldNMFI3NWlwZG9wTlprNUUyT3FIS0laYTZYaE5LVEV2?=
 =?utf-8?B?Mlpyb3NYMXJYMlZlZ0pjRGZ6eWNnVDFVblhvVTM4cHcrdTloalVXcXVxVW02?=
 =?utf-8?B?S0RUNkxJRkhFRnhsMVR6dk4yUXlqc0xJNk55a3pYUnZmaDV6S01Xa2lyL3o0?=
 =?utf-8?B?Q0kvYzJRSlUzQzk3RGc4cithL2szZXUrSkNlVU8zVUdNRHNkcVJSZjZIT0xa?=
 =?utf-8?B?enNnN0tyOG9qUmdVUkt3WE5EaURaREVrYk8wSEdaY3JqTHhudTJCcGptMkVx?=
 =?utf-8?Q?RGWQ4sm5f+NYvLu+QlFwL/BUCOvG4scJ4i0Z6O+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d7d609-5148-4716-f246-08d9288f26d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 02:02:35.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvnBu+0W8An4zIAA07qZmII7tORf5DYQAf4ktR+NJX1WIhW8v1O2siBmJZsjMRgCZWotpKDg73Ng3rAGuo+q9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB3912
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

Great work; one last style-related comment but everything else looks
good to me.

On Fri, Jun 04, 2021 at 01:18:03AM +0300, Oleh Kravchenko wrote:
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
> Cc: Jeff LaBundy <jeff@labundy.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
> 
> Changes for v3:
> - update patch after code review.
> 
> Changes for v2:
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
> index 000000000000..d1748ca38de2
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
> +#include <linux/kernel.h>
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>

Nit: in general these should be alphabetized.

> +
> +#define DRV_NAME "qwiic-joystick"
> +
> +#define QWIIC_JSK_REG_VERS	1
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
> +	char phys[32];
> +	struct input_dev *dev;
> +	struct i2c_client *client;
> +};
> +
> +struct qwiic_ver {
> +	u8 major;
> +	u8 minor;
> +};
> +
> +struct qwiic_data {
> +	__be16 x;
> +	__be16 y;
> +	u8 thumb;
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
> +	if (err < 0)
> +		return err;
> +	if (err != sizeof(vers))
> +		return -EIO;
> +
> +	dev_dbg(&client->dev, "SparkFun Qwiic Joystick, FW: %u.%u\n",
> +		vers.major, vers.minor);
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

Other than that,

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy
