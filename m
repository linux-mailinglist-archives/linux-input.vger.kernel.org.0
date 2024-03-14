Return-Path: <linux-input+bounces-2378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48387C0AD
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 16:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22901C21116
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 15:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD93373526;
	Thu, 14 Mar 2024 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="qfO5GpI9"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2095.outbound.protection.outlook.com [40.107.93.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1FD73518;
	Thu, 14 Mar 2024 15:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431653; cv=fail; b=Q/etWEriDLfb8+UioJ/KzOCNb7XNsME4JmBsPcXGyU46sYei5tRooVnO476VnmJJTS5eERJOt+xsv2IWtuhm5sdOGjdpT482z26haSO3wU9VtExgpiYsgfISl0c1LXaVQ9rRAqsNaCyd8djPeR/ETBqpB9d/EOaNCt6zmO2g+nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431653; c=relaxed/simple;
	bh=cRtNTNhVo37jRMFzhjIwQ46NC/f7hF5amu3kwbiZ6yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bzMtUCYO9qFXUEDMdV1VjKdocve7n9OJrkqmPZWc6uQY3He1Om46GsJYVpUgzSbQbVW24FXC5pr0w1B1nqRdAKRXt20Pnqstk31isSHoFYyqLJ5C7fly6+6KHVQcjWRDVy52HhgvQFSHvooSpx0OAenm/IBkqaqG/0oXj0yB5cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=qfO5GpI9; arc=fail smtp.client-ip=40.107.93.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjXipWa7CmcDIvZ2i5bPnonQjXt7PfL5wnjns2FrzI2g85di/D4ywgzbm2av0OZoVB+zjWAV5Y4/hNSrExwVGYBczffVpEsDQ5TsWbdvGISpKrxkU3pqHp/6RGARhn9NfxeSsDjKP5xulH466TIrH9leVE0f8bppvKJzXFJH7W8SJXV2T6cDlmPAQPn/rk/WXDzrV1z6TQAgRgjcS/VKrpS97ui0Z2k9GlLaueUiqGVm26qcjofivfiTSyoi5We5yxcwoIPH3o/O3Sloq4ELNkWtFRSMt2fHT0ia5nbbfY0DsTlX59OhXG+7orudCdQ9mHlJaVxjR7gtKoa6vZ8b4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTM06dBGEo4EPFirDuNK7PxN/QNFD/bH9qIFT0IpdyE=;
 b=bfnXNodmP+kmVy+ko9HYysxrZ9gj7gbmxqkMBEvVlnqvGPygNCM7AyUupzrgSmPKK6bu1jgYPJF/uIBAAaQ9Km9j+ztRytSUL2RrHNfKpPfu29SsC+m9m7KBUNVUeLM8eZJ2miSfeV92yqSBe4gZTtnTLvjzVPiw6kLazdeHlOHbmtz2PQMNd2xROuy8iqRqSp3buHMb4tf60h5FTIBG+Sswb0PNgpRq0hubzhZH/BBBTuQGzWaIQdFOaR8fgEkmauZP48jf/5fLEea68t6kRFEhLUuDkvFSaL51JW8KEwaqQPDvnA3qLhq/XWTPNoTXG4dVDixg7qA9d1nruwpZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTM06dBGEo4EPFirDuNK7PxN/QNFD/bH9qIFT0IpdyE=;
 b=qfO5GpI9RCLk3OiCK1tjgAwFhjs+EfdqUvnFNbe5GWtkyXT83Ub8m0CEi3SNtS0F4+2MmHhNSCDgvkoMLPQbvl4s+3YyiVrfvE2rUT42KfsuEjzYzoq7NanL1PAGc19gnHQN2fy8KYkuTsyIK4rAIxi5QwbIPBY1BVICyMckayY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM8PR08MB7271.namprd08.prod.outlook.com
 (2603:10b6:8:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 15:54:08 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 15:54:07 +0000
Date: Thu, 14 Mar 2024 10:54:01 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <ZfMdmYM5cK7GKdbG@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-5-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308222421.188858-5-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SA1PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::29) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM8PR08MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d3f31c-5742-4a9f-1488-08dc443efaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zh8XCk7VqMyL7eW2eki8yfBK5ox2hz3NVP8LI3PolMfG3Qxix8bYyVJxijEl76itXtFwp3bO8oJFz4Azi2ycOPoyLLNCjI3hTWAFZGCUOfq+ga6T48owLYNwN95ibd79RMDkRm4Gb1f+RTyqrRMquQ+2nPRrMgaz94g15NDfobf/fGgPQreeer31YZJxvZBSRE/wtPE2qUIhH5pO84jcWITkNtdtUGVEfRpJClZUSy2nJlzopKzETQJVV7PR+1LswD31xHVdbvESS3Dpv3eukzmOy8SHrGQ7Ywo78CJVg7Pe1vwmEcnAno5FAUG91fpqsH02zRwMFuCMsx3sXDs1V86wWCo4rSIqlGP2XtAyvvWwjVx3+PEvJIubXNHb1e9eZfxlsWBbbLta70zx+vJAxRUgmtXkGhHxAG7MUOJ7FSp/S1Xb82dYRsR5RjSm5HrMSq79I0hfwzLMeoZiGMK2lsRvEZfX6RzTdw8Zx1GX2blqAp3g4yaxTF5XRXPm/M2hFvNAYJI0A0Q0jwdcJeSdJsKFmb8iZjR/uL5K6Geq6QyiQ3hElGgh/3dv5bYiwB00XL6P9WtB1PDUe1fA+j2hsXoOw2PvGnx90bGLfy5aN5DC/jQQJdgsCNaO4fPGuOn/gnTSS1Id3m8TS3WregwmlgJG/6RqcYD1Uvf2XYbPpuA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tuErVqNeRUGg7aDYj2zhiPEq/XpYNKmuZsND6OpArL3xCcHepm/0/BRoDpWR?=
 =?us-ascii?Q?01d7BoFPrS7IAGAD/EIXJpP5XltuvOZO3JuaVU4EDWZ3m6rfJatvNd+49Jv6?=
 =?us-ascii?Q?ezYLAevFGHK1wSiFQw+QJhnNZljwS7yQ53z3xz0VehYnZQ/L0ogNq30hywH/?=
 =?us-ascii?Q?NNDOSd+kL0lnfAi/QbIoKdbebY7KEErb6GmSlWm9xjLqK/prVQqsMZW3XXU8?=
 =?us-ascii?Q?nh3BRYnNCpIbk7R+SZPbWjFZxSwKNnJMjq58rNSsWpu16MlmhT1MeXYhWiXv?=
 =?us-ascii?Q?iWixZrhsOeGZMKMejpxthTcIFd/2OKkdfbsI/3LkkBdH3WQV26PTS+vvft0a?=
 =?us-ascii?Q?/pnjpTV6ckU3B6LZbuGk99xlGX9HkCwbLHR0P7zer2KcZOw8K2kVEKABlh1n?=
 =?us-ascii?Q?SG+w62df4cuR58nsm/Ijf/C2n2ZH8QaYobPQDj2VTXPCnz1kOmZTM9CxLWJ8?=
 =?us-ascii?Q?py0fxo8TYMBbJH2467IEws1syJNb3Armwe6bXlmDmk0qvTVTyVztyW0o4zW2?=
 =?us-ascii?Q?qKDv1vPVcee9g9MZ6tuLxagOK6nQjN5JdjAgiwwnbaQTvlUOv5a72k4gcjI/?=
 =?us-ascii?Q?rs5YyJHx11tW0uO1Cqw3OsYyIOcjzCT0U5znP1kvhT3yQ20xW8BVw3Rr/I12?=
 =?us-ascii?Q?MZZ8Wm1IZnQ9dpYJLyIsdMLPyK9CRpdDA7/ZLC13ybEs624x50zLumV99qBU?=
 =?us-ascii?Q?yCskDq4kYmRCvR12UBAlQC3j6tlk9Oxs6ozAPGp1VA55vRcB6azMRy0RzQMz?=
 =?us-ascii?Q?ELVIoXE6U4S3fhX42L6l461QSVmZXCK5ws1SLdbnUmp34FYsT02gTeiYxe5X?=
 =?us-ascii?Q?lHLiDNaTQX5lLML3iIOhDsVtDT3yWqIOOkKk3QxkX8HYoDgpeK3Lj7ZHnm+R?=
 =?us-ascii?Q?B5LvO+tgjHvPugiygh5TKtW/whp7dmdkCnftue1GiCHcck3+wVhYOKYdkumu?=
 =?us-ascii?Q?sEZ07e6miNFG3DbXtBYdAOgzku3rispXe7M6ltAt4NRYameUTrJBXk3Zp6X4?=
 =?us-ascii?Q?dzK4paiBtNY1g8kmj+50X7N+0979g+8WHcZXtXEn6TFfECCQPUSciEM4TRYQ?=
 =?us-ascii?Q?6jnLlh9nh4RdIUYrQL/VCib89MBARk3YQ0nc1WFzDZRbRD4GZCDxaFucaWMN?=
 =?us-ascii?Q?avfPcP9l0IaK2TZeKwLYfNOxlUURTh1oXeXYiBYrpgDeSVAmbn7cmFqLqgRy?=
 =?us-ascii?Q?CnYT8egB51FGt82H0IiNL1VwDytO+wHkx221DWYvpQJwARnJ/GMITk1LphqX?=
 =?us-ascii?Q?ieQjVvPKIj7yTn86ZIzM4XiG+jj7TzyKW2+VFkEB14hzEpe+ND2V21TH5cfm?=
 =?us-ascii?Q?xvUh7okoTsn8+sM9aeh6av1jfg5WqihZUrMAI4ePlc+pkNRX9UmJxTt+MO55?=
 =?us-ascii?Q?wS0MFKgSTDsi0uYuBAV870+nT9JPnRJcBXodiyZZHLQt4gOni/uDtyQNeOV4?=
 =?us-ascii?Q?AB41orG5PnT3Aazt04ZJAzOyHTJtgsrWqpaPikz1eZIXQZtC1J3w1r0H4cUY?=
 =?us-ascii?Q?ySHzcSko41cew3es72Cu465Xhiefp+qr2gJgg9RKGVClA/Mi2ZQgmXXQFdOV?=
 =?us-ascii?Q?XJVDI4ofl5FQYtp2Mo5fMY1Ckk3/uBwBH6eLBkp1?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d3f31c-5742-4a9f-1488-08dc443efaf3
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 15:54:07.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPguh3EmKdZBwNCkVqKD/djDSOckXmrxq1por1EgbUvlPn3jzJ9oGv8MvSrj/2exy6OGVGt49JK+sHsc7uLD+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR08MB7271

Hi James,

On Fri, Mar 08, 2024 at 10:24:20PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The input driver provides the interface for control of
> haptic effects through the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
> v7: v8: v9:
> Please advise if playback stop is still misused with respect to not
> specifying an effect ID. The device can only play one effect at a
> time, but setting max effects for the EVIOCGEFFECTS ioctl to 1 would
> restrict the number of uploads to 1 as well. So I'm unsure of the correct
> approach here.
> 
>  MAINTAINERS                        |   1 +
>  drivers/input/misc/Kconfig         |  10 +
>  drivers/input/misc/Makefile        |   1 +
>  drivers/input/misc/cs40l50-vibra.c | 578 +++++++++++++++++++++++++++++
>  4 files changed, 590 insertions(+)
>  create mode 100644 drivers/input/misc/cs40l50-vibra.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69a9e0a3b968..24cfb4f017bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4940,6 +4940,7 @@ M:	Ben Bright <ben.bright@cirrus.com>
>  L:	patches@opensource.cirrus.com
>  S:	Supported
>  F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> +F:	drivers/input/misc/cs40l*
>  F:	drivers/mfd/cs40l*
>  F:	include/linux/mfd/cs40l*
>  
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 6ba984d7f0b1..ee45dbb0636e 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -140,6 +140,16 @@ config INPUT_BMA150
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called bma150.
>  
> +config INPUT_CS40L50_VIBRA
> +	tristate "CS40L50 Haptic Driver support"
> +	depends on MFD_CS40L50_CORE
> +	help
> +	  Say Y here to enable support for Cirrus Logic's CS40L50
> +	  haptic driver.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called cs40l50-vibra.
> +
>  config INPUT_E3X0_BUTTON
>  	tristate "NI Ettus Research USRP E3xx Button support."
>  	default n
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index 04296a4abe8e..88279de6d3d5 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_INPUT_CMA3000)		+= cma3000_d0x.o
>  obj-$(CONFIG_INPUT_CMA3000_I2C)		+= cma3000_d0x_i2c.o
>  obj-$(CONFIG_INPUT_COBALT_BTNS)		+= cobalt_btns.o
>  obj-$(CONFIG_INPUT_CPCAP_PWRBUTTON)	+= cpcap-pwrbutton.o
> +obj-$(CONFIG_INPUT_CS40L50_VIBRA)	+= cs40l50-vibra.o
>  obj-$(CONFIG_INPUT_DA7280_HAPTICS)	+= da7280.o
>  obj-$(CONFIG_INPUT_DA9052_ONKEY)	+= da9052_onkey.o
>  obj-$(CONFIG_INPUT_DA9055_ONKEY)	+= da9055_onkey.o
> diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
> new file mode 100644
> index 000000000000..c7e68862bbfe
> --- /dev/null
> +++ b/drivers/input/misc/cs40l50-vibra.c
> @@ -0,0 +1,578 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/input.h>
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +/* Wavetables */
> +#define CS40L50_RAM_INDEX_START		0x1000000
> +#define CS40L50_RAM_INDEX_END		0x100007F
> +#define CS40L50_RTH_INDEX_START		0x1400000
> +#define CS40L50_RTH_INDEX_END		0x1400001
> +#define CS40L50_ROM_INDEX_START		0x1800000
> +#define CS40L50_ROM_INDEX_END		0x180001A
> +#define CS40L50_TYPE_PCM		8
> +#define CS40L50_TYPE_PWLE		12
> +#define CS40L50_PCM_ID			0x0
> +#define CS40L50_OWT_CUSTOM_DATA_SIZE	2
> +
> +/* DSP */
> +#define CS40L50_GPIO_BASE		0x2804140
> +#define CS40L50_OWT_BASE		0x2805C34
> +#define CS40L50_OWT_SIZE		0x2805C38
> +#define CS40L50_OWT_NEXT		0x2805C3C
> +
> +/* GPIO */
> +#define CS40L50_GPIO_NUM_MASK		GENMASK(14, 12)
> +#define CS40L50_GPIO_EDGE_MASK		BIT(15)
> +#define CS40L50_GPIO_MAPPING_NONE	0
> +#define CS40L50_GPIO_DISABLE		0x1FF
> +
> +enum vibra_bank_type {
> +	WVFRM_BANK_RAM,
> +	WVFRM_BANK_ROM,
> +	WVFRM_BANK_OWT,
> +	WVFRM_BANK_NUM,
> +};

Please namespace everything, e.g. CS40L50_... and cs40l50_vibra_...

> +
> +/* Describes an area in DSP memory populated by effects */
> +struct vibra_bank {
> +	enum vibra_bank_type bank;
> +	u32 base_index;
> +	u32 max_index;
> +};
> +
> +struct vibra_effect {
> +	enum vibra_bank_type bank;
> +	struct list_head list;
> +	u32 gpio_reg;
> +	u32 index;
> +	int id;
> +};
> +
> +/* Describes haptic interface of loaded DSP firmware */
> +struct vibra_dsp {
> +	struct vibra_bank *banks;
> +	u32 gpio_base_reg;
> +	u32 owt_offset_reg;
> +	u32 owt_size_reg;
> +	u32 owt_base_reg;
> +	int (*write)(struct device *dev, struct regmap *regmap, u32 val);
> +	u32 push_owt_cmd;
> +	u32 delete_owt_cmd;
> +	u32 stop_cmd;
> +};
> +
> +/* Describes configuration and state of haptic operations */
> +struct vibra_info {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct input_dev *input;
> +	struct mutex lock;
> +	struct workqueue_struct *vibe_wq;
> +	struct list_head effect_head;
> +	struct vibra_dsp dsp;
> +};
> +
> +struct vibra_work {
> +	struct vibra_info *info;
> +	struct ff_effect *effect;
> +	struct work_struct work;
> +	s16 *custom_data;
> +	int custom_len;
> +	int count;
> +	int error;
> +};
> +
> +static struct vibra_bank cs40l50_banks[] = {
> +	{
> +		.bank =		WVFRM_BANK_RAM,
> +		.base_index =	CS40L50_RAM_INDEX_START,
> +		.max_index =	CS40L50_RAM_INDEX_END,
> +	},
> +	{
> +		.bank =		WVFRM_BANK_ROM,
> +		.base_index =	CS40L50_ROM_INDEX_START,
> +		.max_index =	CS40L50_ROM_INDEX_END,
> +	},
> +	{
> +		.bank =		WVFRM_BANK_OWT,
> +		.base_index =	CS40L50_RTH_INDEX_START,
> +		.max_index =	CS40L50_RTH_INDEX_END,
> +	},
> +};
> +
> +static struct vibra_dsp cs40l50_dsp = {
> +	.banks =		cs40l50_banks,
> +	.gpio_base_reg =	CS40L50_GPIO_BASE,
> +	.owt_base_reg =		CS40L50_OWT_BASE,
> +	.owt_offset_reg =	CS40L50_OWT_NEXT,
> +	.owt_size_reg =		CS40L50_OWT_SIZE,
> +
> +	.push_owt_cmd =		CS40L50_OWT_PUSH,
> +	.delete_owt_cmd =	CS40L50_OWT_DELETE,
> +	.stop_cmd =		CS40L50_STOP_PLAYBACK,
> +
> +	.write =		cs40l50_dsp_write,
> +};

Nit: I don't see any need for any newlines here.

> +
> +static struct vibra_effect *vibra_find_effect(int id, struct list_head *effect_head)

I recommend namespacing the function names too.

> +{
> +	struct vibra_effect *effect;
> +
> +	list_for_each_entry(effect, effect_head, list)
> +		if (effect->id == id)
> +			return effect;
> +
> +	return NULL;
> +}
> +
> +static int vibra_effect_bank_set(struct vibra_work *work_data,
> +				 struct vibra_effect *effect)
> +{
> +	s16 bank = work_data->custom_data[0] & 0xffffu;

This mask seems to get used in a couple different places; I would recommend
#defining it using GENMASK().

> +
> +	if (bank >= WVFRM_BANK_NUM) {
> +		dev_err(work_data->info->dev, "Invalid waveform bank: %d\n", bank);
> +		return -EINVAL;
> +	}
> +
> +	if (work_data->custom_len > CS40L50_OWT_CUSTOM_DATA_SIZE)
> +		effect->bank = WVFRM_BANK_OWT;
> +	else
> +		effect->bank = bank;
> +
> +	return 0;
> +}
> +
> +static int vibra_effect_gpio_mapping_set(struct vibra_work *work_data,
> +				    struct vibra_effect *effect)
> +{
> +	u16 button = work_data->effect->trigger.button;
> +	struct vibra_info *info = work_data->info;
> +	u32 gpio_num, gpio_edge;
> +
> +	if (button) {
> +		gpio_num = FIELD_GET(CS40L50_GPIO_NUM_MASK, button);
> +		gpio_edge = FIELD_GET(CS40L50_GPIO_EDGE_MASK, button);
> +		effect->gpio_reg = info->dsp.gpio_base_reg + (gpio_num * 8) - gpio_edge;
> +
> +		return regmap_write(info->regmap, effect->gpio_reg, button);
> +	}
> +
> +	effect->gpio_reg = CS40L50_GPIO_MAPPING_NONE;
> +
> +	return 0;
> +}
> +
> +static int vibra_effect_index_set(struct vibra_work *work_data,
> +				  struct vibra_effect *effect)
> +{
> +	struct vibra_info *info = work_data->info;
> +	struct vibra_effect *owt_effect;
> +	u32 base_index, max_index;
> +
> +	base_index = info->dsp.banks[effect->bank].base_index;
> +	max_index = info->dsp.banks[effect->bank].max_index;
> +
> +	effect->index = base_index;
> +
> +	switch (effect->bank) {
> +	case WVFRM_BANK_OWT:
> +		list_for_each_entry(owt_effect, &info->effect_head, list)
> +			if (owt_effect->bank == WVFRM_BANK_OWT)
> +				effect->index++;
> +		break;
> +	case WVFRM_BANK_ROM:
> +	case WVFRM_BANK_RAM:
> +		effect->index += work_data->custom_data[1] & 0xffffu;
> +		break;
> +	default:
> +		dev_err(info->dev, "Bank not supported: %d\n", effect->bank);
> +		return -EINVAL;
> +	}
> +
> +	if (effect->index > max_index || effect->index < base_index) {
> +		dev_err(info->dev, "Index out of bounds: %u\n", effect->index);
> +		return -ENOSPC;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Describes a header for an OWT effect */
> +struct owt_header {
> +	u32 type;
> +	u32 data_words;
> +	u32 offset;
> +} __packed;
> +
> +static int vibra_upload_owt(struct vibra_work *work_data)
> +{
> +	u32 len = 2 * work_data->custom_len, wt_offset, wt_size;
> +	struct vibra_info *info = work_data->info;
> +	struct owt_header header;
> +	u8 *out_data;
> +	int error;
> +
> +	error = regmap_read(info->regmap, info->dsp.owt_size_reg, &wt_size);
> +	if (error)
> +		return error;
> +
> +	if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
> +		dev_err(info->dev, "No space in OWT bank for effect\n");
> +		return -ENOSPC;
> +	}
> +
> +	out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);
> +	if (!out_data)
> +		return -ENOMEM;
> +
> +	header.type = work_data->custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
> +								    CS40L50_TYPE_PWLE;
> +	header.offset = sizeof(header) / sizeof(u32);
> +	header.data_words = len / sizeof(u32);
> +
> +	memcpy(out_data, &header, sizeof(header));
> +	memcpy(out_data + sizeof(header), work_data->custom_data, len);
> +
> +	error = regmap_read(info->regmap, info->dsp.owt_offset_reg, &wt_offset);
> +	if (error)
> +		goto err_free;
> +
> +	error = regmap_bulk_write(info->regmap, info->dsp.owt_base_reg +
> +				  (wt_offset * sizeof(u32)), out_data,
> +				  sizeof(header) + len);
> +	if (error)
> +		goto err_free;
> +
> +	error = info->dsp.write(info->dev, info->regmap, info->dsp.push_owt_cmd);
> +err_free:
> +	kfree(out_data);
> +
> +	return error;
> +}
> +
> +static void vibra_add_worker(struct work_struct *work)
> +{
> +	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
> +	struct vibra_info *info = work_data->info;
> +	struct vibra_effect *effect;
> +	bool is_new = false;
> +	int error;
> +
> +	error = pm_runtime_resume_and_get(info->dev);
> +	if (error < 0)
> +		goto err;
> +
> +	mutex_lock(&info->lock);
> +
> +	/* Update effect if already present, otherwise create new effect */
> +	effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
> +	if (!effect) {
> +		effect = kzalloc(sizeof(*effect), GFP_KERNEL);
> +		if (!effect) {
> +			error = -ENOMEM;
> +			goto err_mutex;
> +		}
> +
> +		effect->id = work_data->effect->id;
> +		is_new = true;
> +	}
> +
> +	error = vibra_effect_bank_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	error = vibra_effect_index_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	error = vibra_effect_gpio_mapping_set(work_data, effect);
> +	if (error)
> +		goto err_free;
> +
> +	if (effect->bank == WVFRM_BANK_OWT)
> +		error = vibra_upload_owt(work_data);
> +err_free:
> +	if (is_new) {
> +		if (error)
> +			kfree(effect);
> +		else
> +			list_add(&effect->list, &info->effect_head);
> +	}
> +err_mutex:
> +	mutex_unlock(&info->lock);
> +
> +	pm_runtime_mark_last_busy(info->dev);
> +	pm_runtime_put_autosuspend(info->dev);
> +err:
> +	work_data->error = error;
> +}
> +
> +static int vibra_add(struct input_dev *dev, struct ff_effect *effect,
> +		     struct ff_effect *old)
> +{
> +	struct ff_periodic_effect *periodic = &effect->u.periodic;
> +	struct vibra_info *info = input_get_drvdata(dev);
> +	u32 len = effect->u.periodic.custom_len;
> +	struct vibra_work work_data;
> +
> +	if (effect->type != FF_PERIODIC || periodic->waveform != FF_CUSTOM) {
> +		dev_err(info->dev, "Type (%#X) or waveform (%#X) unsupported\n",
> +			effect->type, periodic->waveform);
> +		return -EINVAL;
> +	}
> +
> +	work_data.custom_data = kcalloc(len, sizeof(s16), GFP_KERNEL);
> +	if (!work_data.custom_data)
> +		return -ENOMEM;
> +
> +	if (copy_from_user(work_data.custom_data, effect->u.periodic.custom_data,
> +			   sizeof(s16) * len)) {
> +		work_data.error = -EFAULT;
> +		goto err_free;
> +	}
> +
> +	work_data.custom_len = len;
> +	work_data.info = info;
> +	work_data.effect = effect;
> +	INIT_WORK(&work_data.work, vibra_add_worker);
> +
> +	/* Push to the workqueue to serialize with playbacks */
> +	queue_work(info->vibe_wq, &work_data.work);
> +	flush_work(&work_data.work);
> +err_free:
> +	kfree(work_data.custom_data);
> +
> +	return work_data.error;
> +}
> +
> +static void vibra_start_worker(struct work_struct *work)
> +{
> +	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
> +	struct vibra_info *info = work_data->info;
> +	struct vibra_effect *start_effect;
> +
> +	if (pm_runtime_resume_and_get(info->dev) < 0)
> +		goto err_free;
> +
> +	mutex_lock(&info->lock);
> +
> +	start_effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
> +	if (start_effect) {
> +		while (--work_data->count >= 0) {
> +			info->dsp.write(info->dev, info->regmap, start_effect->index);
> +			usleep_range(work_data->effect->replay.length,
> +				     work_data->effect->replay.length + 100);
> +		}
> +	}
> +
> +	mutex_unlock(&info->lock);
> +
> +	if (!start_effect)
> +		dev_err(info->dev, "Effect to play not found\n");
> +
> +	pm_runtime_mark_last_busy(info->dev);
> +	pm_runtime_put_autosuspend(info->dev);
> +err_free:
> +	kfree(work_data);

This business of allocating memory in one thread and freeing it in another
got pretty hard to follow, which means it will be hard to maintain. I know
there are some restrictions around writing into the HALO core, but I'd like
to see something simpler; the da7280 driver is nowhere near as complex.

How many s16 words do you realistically need for custom_data? Is it possible
to simply include an array in the cs40l50_vibra_info struct, and bleat if
user space tries to upload greater than the maximum size? This seems to be
the approach of the much simpler da7280 driver as well.

This array would go on the heap just the same, but you do not have to manage
it so carefully. Opinions may vary, but mine is that memory allocation and
freeing should be done in the same scope where possible.

> +}
> +
> +static void vibra_stop_worker(struct work_struct *work)
> +{
> +	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
> +	struct vibra_info *info = work_data->info;
> +
> +	if (pm_runtime_resume_and_get(info->dev) < 0)
> +		return;
> +
> +	mutex_lock(&info->lock);
> +
> +	info->dsp.write(info->dev, info->regmap, info->dsp.stop_cmd);
> +
> +	mutex_unlock(&info->lock);
> +
> +	pm_runtime_mark_last_busy(info->dev);
> +	pm_runtime_put_autosuspend(info->dev);
> +
> +	kfree(work_data);
> +}
> +
> +static int vibra_playback(struct input_dev *dev, int effect_id, int val)
> +{
> +	struct vibra_info *info = input_get_drvdata(dev);
> +	struct vibra_work *work_data;
> +
> +	work_data = kzalloc(sizeof(*work_data), GFP_ATOMIC);
> +	if (!work_data)
> +		return -ENOMEM;
> +
> +	work_data->info = info;
> +
> +	if (val > 0) {
> +		work_data->effect = &dev->ff->effects[effect_id];
> +		work_data->count = val;
> +		INIT_WORK(&work_data->work, vibra_start_worker);
> +	} else {
> +		/* Stop the amplifier as device drives only one effect */
> +		INIT_WORK(&work_data->work, vibra_stop_worker);
> +	}
> +
> +	queue_work(info->vibe_wq, &work_data->work);
> +
> +	return 0;
> +}
> +
> +static void vibra_erase_worker(struct work_struct *work)
> +{
> +	struct vibra_work *work_data = container_of(work, struct vibra_work, work);
> +	struct vibra_effect *owt_effect, *erase_effect;
> +	struct vibra_info *info = work_data->info;
> +	int error;
> +
> +	error = pm_runtime_resume_and_get(info->dev);
> +	if (error < 0)

	if (error)

> +		goto err;

Please consider a more descriptive label.

> +
> +	mutex_lock(&info->lock);
> +
> +	erase_effect = vibra_find_effect(work_data->effect->id, &info->effect_head);
> +	if (!erase_effect) {
> +		dev_err(info->dev, "Effect to erase not found\n");
> +		error = -EINVAL;
> +		goto err_mutex;
> +	}
> +
> +	if (erase_effect->gpio_reg != CS40L50_GPIO_MAPPING_NONE) {
> +		error = regmap_write(info->regmap, erase_effect->gpio_reg,
> +				     CS40L50_GPIO_DISABLE);
> +		if (error)
> +			goto err_mutex;
> +	}
> +
> +	if (erase_effect->bank == WVFRM_BANK_OWT) {
> +		error = info->dsp.write(info->dev, info->regmap,
> +					info->dsp.delete_owt_cmd |
> +					erase_effect->index);
> +		if (error)
> +			goto err_mutex;
> +
> +		list_for_each_entry(owt_effect, &info->effect_head, list)
> +			if (owt_effect->bank == WVFRM_BANK_OWT &&
> +			    owt_effect->index > erase_effect->index)
> +				owt_effect->index--;
> +	}
> +
> +	list_del(&erase_effect->list);
> +	kfree(erase_effect);
> +err_mutex:
> +	mutex_unlock(&info->lock);
> +
> +	pm_runtime_mark_last_busy(info->dev);
> +	pm_runtime_put_autosuspend(info->dev);
> +err:
> +	work_data->error = error;
> +}
> +
> +static int vibra_erase(struct input_dev *dev, int effect_id)
> +{
> +	struct vibra_info *info = input_get_drvdata(dev);
> +	struct vibra_work work_data;
> +
> +	work_data.info = info;
> +	work_data.effect = &dev->ff->effects[effect_id];
> +
> +	INIT_WORK(&work_data.work, vibra_erase_worker);
> +
> +	/* Push to workqueue to serialize with playbacks */
> +	queue_work(info->vibe_wq, &work_data.work);
> +	flush_work(&work_data.work);
> +
> +	return work_data.error;
> +}
> +
> +static void vibra_remove_wq(void *data)
> +{
> +	flush_workqueue(data);
> +	destroy_workqueue(data);
> +}
> +
> +static int cs40l50_vibra_probe(struct platform_device *pdev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(pdev->dev.parent);
> +	struct vibra_info *info;
> +	int error;
> +
> +	info = devm_kzalloc(pdev->dev.parent, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	mutex_init(&info->lock);
> +
> +	info->dev = cs40l50->dev;
> +	info->regmap = cs40l50->regmap;
> +	info->dsp = cs40l50_dsp;
> +
> +	info->input = devm_input_allocate_device(info->dev);
> +	if (!info->input)
> +		return -ENOMEM;
> +	info->input->id.product = cs40l50->devid & 0xFFFF;
> +	info->input->id.version = cs40l50->revid;
> +	info->input->name = "cs40l50_vibra";
> +
> +	input_set_drvdata(info->input, info);
> +	input_set_capability(info->input, EV_FF, FF_PERIODIC);
> +	input_set_capability(info->input, EV_FF, FF_CUSTOM);
> +
> +	error = input_ff_create(info->input, FF_MAX_EFFECTS);
> +	if (error) {
> +		dev_err(info->dev, "Failed to create input device\n");
> +		return error;
> +	}
> +
> +	info->input->ff->upload = vibra_add;
> +	info->input->ff->playback = vibra_playback;
> +	info->input->ff->erase = vibra_erase;
> +
> +	INIT_LIST_HEAD(&info->effect_head);
> +
> +	info->vibe_wq = alloc_ordered_workqueue("vibe_wq", WQ_HIGHPRI);
> +	if (!info->vibe_wq)
> +		return -ENOMEM;
> +
> +	error = devm_add_action_or_reset(info->dev, vibra_remove_wq, info->vibe_wq);
> +	if (error)
> +		return error;
> +
> +	return input_register_device(info->input);
> +}
> +
> +static const struct platform_device_id vibra_id_match[] = {
> +	{ "cs40l50-vibra", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, vibra_id_match);
> +
> +static struct platform_driver cs40l50_vibra_driver = {
> +	.probe		= cs40l50_vibra_probe,
> +	.id_table	= vibra_id_match,
> +	.driver		= {
> +		.name	= "cs40l50-vibra",
> +	},
> +};
> +module_platform_driver(cs40l50_vibra_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

Kind regards,
Jeff LaBundy

