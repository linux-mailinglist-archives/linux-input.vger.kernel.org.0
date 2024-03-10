Return-Path: <linux-input+bounces-2324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53683877935
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 00:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A94E31F21A7C
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 23:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE9E3A8C1;
	Sun, 10 Mar 2024 23:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="M4lXvatX"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2113.outbound.protection.outlook.com [40.107.95.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610C243AD8;
	Sun, 10 Mar 2024 23:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114017; cv=fail; b=u9hunvAKCIx/1sSxSfZYhqWFtlTHb+XBVyTr6WGBKxM7nrRpIrasuIbDuDwxKwF+fR7ggKKKEVt02ONV8u5URFIslDl5kMeiYylwDxSPTyfWUNy95sXEywEmzrg0ej59GPg8L8lWx18k2uKAegrOtGA5zft9bDLAVU9/WbA2ySE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114017; c=relaxed/simple;
	bh=Rrgk35+D8T/l7xOgSOym7/mLmX2FQd5IAtzPcbC0Uw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hQly9cS1RLr7iR0b3LGy4v956QMC4OimF3clvbtogVPplp7Ucc3o79mZdb2DwDP5d6Lv5Y9Y9BwczP0O3HKlPtFiWtX0xzR2/Tu1Sh/68xUcwKJuWpUoeDKbc030jy7L7zonWX/R8837PYz3keuWKPZsft3dBJb4Vc9A7DTNnEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=M4lXvatX; arc=fail smtp.client-ip=40.107.95.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrfIXpG+cyHlyjMAN1Ymigivq2YMnc+skiIDGTEir+SG9C9KyEcdgGBwS4JREzVUAFi38W6h9ur2lHnOiUZgJ2wxQoSJiq8AP1hNueItJTVZFYi69HCZDdCCR4cWJQoyWbih1iIaB/PduiAR908wq5mMTkFfL0uqDkApmXF1tTAilKo/5Jhi6FwoqlRMtL4IKa36qjH06TbvSbiv8V+Cw/fD15+KfFeyPQORSUUFo6NFJWDj03+HDoC1oEaRou1zZo7NGIEqBF1OlnTB+uaYEyETbm5IQn9BVJlgg7o5khaK9RNqT7EScvSb87aaTOJdXXUXyY3OOAvnOc+r4PiEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7m9a5rUp9Lr85aifYsKgolBOjhbU+Q0o3d1Dd7sKkc=;
 b=ZpI1hD+kVee6NAjSk60puqXsxDphNFWTc15goOT/6OerSm9ByJ90dlUBaiuLnGANJiqjkcH85fQ4EkMXtN3XFomt3kyPK25w55W7ddazz1tNgS0trgsQakYvsT5vzdML2g6pcH3ZMz9R8jGoUfnYJZAGSM6cOQ4FGOjDYYvs0oi/qvJy93cMzgLNXaeE7rnkGP0cI0WudYCneqE7ZRbuUJbjfhtnd3k5zCpbmJHIy6R56NsE3DYla7iv9Iis0QHNiKfeZR8ma9wdDUMxh39Xi6sM+zyEP76cP0rfbVlXeGwXB6VNZqOIw/QA6jgLri1lh0MApoMj3gr3ktlNZX+3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7m9a5rUp9Lr85aifYsKgolBOjhbU+Q0o3d1Dd7sKkc=;
 b=M4lXvatXm2r1g7/HHDNvJfP+CnJFrVc05McU2CWFda/F52/GAmnEgh739aClVOREBTK/IO/hsgkw+OmFrHNOtNBMIiZekDg8n5+vwO7+jHyXvPBHsFtUe/c70U68o3rBMvRurUrccY6SFkyOhj3T/3u5DfjxfbXoW+EP/hhqrW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN8PR08MB6353.namprd08.prod.outlook.com
 (2603:10b6:408:d5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Sun, 10 Mar
 2024 23:40:11 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Sun, 10 Mar 2024
 23:40:10 +0000
Date: Sun, 10 Mar 2024 18:40:04 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <Ze5E1KxRltUTX4R6@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-4-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308222421.188858-4-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN7PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:806:125::13) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BN8PR08MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: d665b1f6-2a09-4ac8-8f2f-08dc415b6ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DAnz5LR7LcXY9yFayP900+DNt+HbLdS6zqHPrtGd5eBEl2P38YhUX4hRfkrPCUdQnqUXR7uAyljMtz9uATGl+Imr0URuDurjnDgXuxE3U1CsqulP+SemwaMYkqVHkioJpp+P8ezJsiNE+r9ORDQ8yABJmW4wz6OvQvaaIog+ETY0bOHI05J2pjKbwGOYW1RZ+Y4smDcL6KX7t6ZsQqCDpJ81vvEzAhTdtIfFXm+BosoKqBFpjFXZp/sloRsJHvfnjly/aR51wBPN6USZ6fBnCiBnBdTzM6IFitP+wblAMuAguwoU4ecX/o7Ng+HEGBelJHGVN6tqEGWgrX/zSW/ZnQ4ca8ziDUiOOA2nCIertvxhg5/5uIF0BSWQWG8R05XRug8WBjeJzT8xGtkFTMmO4Kl6WR7YJ8OV6jSdi+52eeCUDeHO4XsLsaPzTmuOESCkloQ6oCKv5+888JSIqdAt3tnQEB+2xI0hCxYvHFWF6NbFG8f2EHvq/ij6EuzJf3OqTKOyDEPa1g1M9HQMVQbu6XqNFb4jRu67uX0zlKWVNACEx8bj20t1NzouxikOwnUsqc3/bSZvYCWM/MdAz2BbBaSCmK597tuV6AZY/4VmGh8Ay5lBrCknzsmRQGonws1Ack9BO+6nzYr72WFPqHrNMoGwW/9bzRqcFz3jV99EWnQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?guS8iCmJZpsFYQC8dygNMtWsMTFP2fbj0l1tiz8cek0b5tJ+94C6JSLThg7M?=
 =?us-ascii?Q?SvNZNfgXeBnN1kFCQ4fNtgZ/Ag2FxMumXJLZHWs97VXL5dNRpT5AwsndNaqQ?=
 =?us-ascii?Q?HC2wlBMw7r+FcAGFMfZvsbYOs8ZkXZfja6dX+DNa+CCSL9u24ZuTRSxlo2nu?=
 =?us-ascii?Q?f8uSImJb7sIRbYhrXDHJcnsbdXsVrl6JrX83CQ+6/J+zOXIcF3TxbE1ohgPd?=
 =?us-ascii?Q?BaV4/Rd69mv2EgOK8Sdhvqc9ZDCZnSE6vXUkAH1mPLjgo8l1V4CT+OEYth1S?=
 =?us-ascii?Q?c4KF1VNXYpCfSj/nM62G7Upy4UBKFzehzrqAD0fcBvmrre7p8jT4jvkYMNkV?=
 =?us-ascii?Q?AELpSl2nkr4vQywyzkMe+noICj9M7FTk9qwQjjEDsLXvVsuBUBsFZrWeYUST?=
 =?us-ascii?Q?YmTdSnBfHjpmVNmnFG6yOYnGoMOz2SyXt2IA0mHPZ84uQ8wpiqZB5O6QcH8S?=
 =?us-ascii?Q?qgo0J2QyzTJz29cRYc5BoxyykCtnPBVFbWjoeB1AuYYbta/RverhVJnG71/c?=
 =?us-ascii?Q?VsG5igxfDb5VQVNpuzEx967EgM1MkfnuSbFEuOVWVn8/lZ/oez9O7ySrkZiH?=
 =?us-ascii?Q?lXZB5nBro0SJ9OrV2wSEq6HouSYbxIK8Ps0OCI/cYWqKDU3IU+Z21FcDKyv5?=
 =?us-ascii?Q?A4T57AbANOfkF4UZrbnMlzoCW4mdFgYFuXRf6ossvIUkulJam6tHp6X1XCpO?=
 =?us-ascii?Q?dxm9WMybo2yLVykxPhxV/5e+c3tqRFxlc9A6pq80ysQRJhdBCydyWK2x9sUW?=
 =?us-ascii?Q?LiOpLT2vBiNXjyVMUiWMLRUc5a6ycnd5ejWQOjeuTuMYqMrmZi98pt1e4VlJ?=
 =?us-ascii?Q?H/6zK+3P9dcTA19N42YxLR1Kxw3xJgfcZcKE+ck1iZ0Gnu3YRHsuSQmQBGRr?=
 =?us-ascii?Q?Pzi6T03q2vZR8mSP+VTwQ7CPta8mBJn/GzPpNMD1EloO4P0d8UcJtFBtnj8N?=
 =?us-ascii?Q?VeJKyc+L9dNjhHaeQ7aWQU0UNlJpOk8BSoVqA6EoyMnvgHTtSrv4FCZhyaem?=
 =?us-ascii?Q?TMq1JC25uJQDVAC17aYn5Ww3uGAllKq5Z6B900yqvDM9VjzclMLrfpcAG3zb?=
 =?us-ascii?Q?moUdpHQRBjOjDD6ATlvOfvogACY4OiQgwbVtR01tf2m+MaRCFeFgBtzqmIZ3?=
 =?us-ascii?Q?0iN2WTYts7gyShGElEsBHieLRMZMOFR+3cvVJEzcgiCh+yatNRpeYv3BRouv?=
 =?us-ascii?Q?BS3P+naaU9fBm6qgYWAzQW6caJz72t3L9ddB6wAZ9AcM3PVk1mAUmMXE2zX2?=
 =?us-ascii?Q?7/INeDqEvpHp9ACgIWwebyGkYZZiXdiA+bzHYKf9CxBGFcGVEqFtL2SRSG/S?=
 =?us-ascii?Q?TwTjrTmW5HxDPzWRyhImToZQgDyIljGPxzs+MBEqd9g2ghSVKe5Oayt7nRP/?=
 =?us-ascii?Q?IAmzRzlry00zInS+eH3VhIpy6pfaj7llo1uuw91edRISnOn3NdBNJIFNyHBN?=
 =?us-ascii?Q?DVg6qtHn8rXDY98k5L8NCrxRjgtXbK9BCKuAnEr9cGuU6mABc21ze2ZEILH1?=
 =?us-ascii?Q?ZIbUtr3JczD9Zzf3BZnw8InJSlH7UHzBDZTqmaYPIdqvcNvl126w03B925cj?=
 =?us-ascii?Q?gitNfJZfI9ZYI7FEo4kHNUhHCS0olEKPAj/L1m+i?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d665b1f6-2a09-4ac8-8f2f-08dc415b6ccf
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2024 23:40:10.7129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjHeOU6qxOoWoS42nbU3QeQcqjTrN7grFuWKZPG5021rF3WWYu577cIpM4mIv94ER/XAziLjFYdTSbfVIKadlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6353

Hi James,

Again, great work! I think we're almost there; I have just a few
trailing comments related to maintainability.

On Fri, Mar 08, 2024 at 10:24:19PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  30 ++
>  drivers/mfd/Makefile        |   4 +
>  drivers/mfd/cs40l50-core.c  | 528 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/cs40l50-i2c.c   |  68 +++++
>  drivers/mfd/cs40l50-spi.c   |  68 +++++
>  include/linux/mfd/cs40l50.h | 144 ++++++++++
>  7 files changed, 844 insertions(+)
>  create mode 100644 drivers/mfd/cs40l50-core.c
>  create mode 100644 drivers/mfd/cs40l50-i2c.c
>  create mode 100644 drivers/mfd/cs40l50-spi.c
>  create mode 100644 include/linux/mfd/cs40l50.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b71017a187f8..69a9e0a3b968 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4940,6 +4940,8 @@ M:	Ben Bright <ben.bright@cirrus.com>
>  L:	patches@opensource.cirrus.com
>  S:	Supported
>  F:	Documentation/devicetree/bindings/input/cirrus,cs40l50.yaml
> +F:	drivers/mfd/cs40l*
> +F:	include/linux/mfd/cs40l*
>  
>  CIRRUS LOGIC DSP FIRMWARE DRIVER
>  M:	Simon Trimmer <simont@opensource.cirrus.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 90ce58fd629e..6273c255f107 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2241,6 +2241,36 @@ config MCP_UCB1200_TS
>  
>  endmenu
>  
> +config MFD_CS40L50_CORE
> +	tristate
> +	select MFD_CORE
> +	select FW_CS_DSP
> +	select REGMAP_IRQ
> +
> +config MFD_CS40L50_I2C
> +	tristate "Cirrus Logic CS40L50 (I2C)"
> +	select REGMAP_I2C
> +	select MFD_CS40L50_CORE
> +	depends on I2C
> +	help
> +	  Select this to support the Cirrus Logic CS40L50 Haptic
> +	  Driver over I2C.
> +
> +	  This driver can be built as a module. If built as a module it will be
> +	  called "cs40l50-i2c".
> +
> +config MFD_CS40L50_SPI
> +	tristate "Cirrus Logic CS40L50 (SPI)"
> +	select REGMAP_SPI
> +	select MFD_CS40L50_CORE
> +	depends on SPI
> +	help
> +	  Select this to support the Cirrus Logic CS40L50 Haptic
> +	  Driver over SPI.
> +
> +	  This driver can be built as a module. If built as a module it will be
> +	  called "cs40l50-spi".
> +
>  config MFD_VEXPRESS_SYSREG
>  	tristate "Versatile Express System Registers"
>  	depends on VEXPRESS_CONFIG && GPIOLIB
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index c66f07edcd0e..a8d18ba155d0 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -88,6 +88,10 @@ obj-$(CONFIG_MFD_MADERA)	+= madera.o
>  obj-$(CONFIG_MFD_MADERA_I2C)	+= madera-i2c.o
>  obj-$(CONFIG_MFD_MADERA_SPI)	+= madera-spi.o
>  
> +obj-$(CONFIG_MFD_CS40L50_CORE)	+= cs40l50-core.o
> +obj-$(CONFIG_MFD_CS40L50_I2C)	+= cs40l50-i2c.o
> +obj-$(CONFIG_MFD_CS40L50_SPI)	+= cs40l50-spi.o
> +
>  obj-$(CONFIG_TPS6105X)		+= tps6105x.o
>  obj-$(CONFIG_TPS65010)		+= tps65010.o
>  obj-$(CONFIG_TPS6507X)		+= tps6507x.o
> diff --git a/drivers/mfd/cs40l50-core.c b/drivers/mfd/cs40l50-core.c
> new file mode 100644
> index 000000000000..92e67f80f36a
> --- /dev/null
> +++ b/drivers/mfd/cs40l50-core.c
> @@ -0,0 +1,528 @@
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
> +#include <linux/firmware/cirrus/cs_dsp.h>
> +#include <linux/firmware/cirrus/wmfw.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +
> +static const struct mfd_cell cs40l50_devs[] = {
> +	{ .name = "cs40l50-codec", },
> +	{ .name = "cs40l50-vibra", },
> +};
> +
> +const struct regmap_config cs40l50_regmap = {
> +	.reg_bits =		32,
> +	.reg_stride =		4,
> +	.val_bits =		32,
> +	.reg_format_endian =	REGMAP_ENDIAN_BIG,
> +	.val_format_endian =	REGMAP_ENDIAN_BIG,
> +};
> +EXPORT_SYMBOL_GPL(cs40l50_regmap);
> +
> +static const char * const cs40l50_supplies[] = {
> +	"vp", "vio",
> +};

Strictly speaking, the VA supply must be called out in the binding as
a required supply; the device cannot function without it. I think you
have gotten away without handling VA because VA and VIO are likely tied
together on your board.

Are there any practical applications where VA and VIO would be split
apart on the board? For example, can VIO be tied to a 3.3-V supply in
support of 3.3-V logic, while VA remains powered by 1.8 V? If so, the
driver needs to provide a means to supply a separate VA regulator, and
the binding needs to specify that oneOf them is required.

If VA and VIO are recommended to be tied together, then I don't think
they need to be defined separately in the binding. We should only ask
customers to supply one 1.8-V regulator; perhaps the description can
mention how this regulator maps to the VA and VIO pins of the device.
For older devices like L25, VA and VIO were shorted inside the package.

The same goes for VAMP; it seems the intent here is to support internal
boost mode only, with VAMP and VBST shorted on the board. Therefore, I
don't see a need to define VAMP in the binding either. If you intend to
define VAMP in the binding, then the driver should support external
boost mode, otherwise the driver is incomplete. It seems unlikely that
customers would use external boost mode for a haptic application; this
is probably more common for audio applications that borrow the same die.

As I mention in the binding, VP should really be optional in terms of
regulator support; it's almost always connected to a battery, and not
a regulator.

> +
> +static const struct regmap_irq cs40l50_reg_irqs[] = {
> +	REGMAP_IRQ_REG(CS40L50_DSP_QUEUE_IRQ, CS40L50_IRQ1_INT_2_OFFSET,
> +		       CS40L50_DSP_QUEUE_MASK),
> +	REGMAP_IRQ_REG(CS40L50_AMP_SHORT_IRQ, CS40L50_IRQ1_INT_1_OFFSET,
> +		       CS40L50_AMP_SHORT_MASK),
> +	REGMAP_IRQ_REG(CS40L50_TEMP_ERR_IRQ, CS40L50_IRQ1_INT_8_OFFSET,
> +		       CS40L50_TEMP_ERR_MASK),
> +	REGMAP_IRQ_REG(CS40L50_BST_UVP_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
> +		       CS40L50_BST_UVP_MASK),
> +	REGMAP_IRQ_REG(CS40L50_BST_SHORT_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
> +		       CS40L50_BST_SHORT_MASK),
> +	REGMAP_IRQ_REG(CS40L50_BST_ILIMIT_IRQ, CS40L50_IRQ1_INT_9_OFFSET,
> +		       CS40L50_BST_ILIMIT_MASK),
> +	REGMAP_IRQ_REG(CS40L50_UVLO_VDDBATT_IRQ, CS40L50_IRQ1_INT_10_OFFSET,
> +		       CS40L50_UVLO_VDDBATT_MASK),
> +	REGMAP_IRQ_REG(CS40L50_GLOBAL_ERROR_IRQ, CS40L50_IRQ1_INT_18_OFFSET,
> +		       CS40L50_GLOBAL_ERROR_MASK),
> +};
> +
> +static struct regmap_irq_chip cs40l50_irq_chip = {
> +	.name =		"cs40l50",
> +
> +	.status_base =	CS40L50_IRQ1_INT_1,
> +	.mask_base =	CS40L50_IRQ1_MASK_1,
> +	.ack_base =	CS40L50_IRQ1_INT_1,
> +	.num_regs =	22,
> +
> +	.irqs =		cs40l50_reg_irqs,
> +	.num_irqs =	ARRAY_SIZE(cs40l50_reg_irqs),
> +
> +	.runtime_pm =	true,
> +};

No need for newlines in here.

> +
> +int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val)
> +{
> +	int err, i;

It seems this series uses 'err', 'error' and 'ret' throughout. I know that
'error' is typically requested in the input subsystem, but I see no reason
not to stick with 'ret' for the rest of the series.

> +	u32 ack;
> +
> +	/* Device NAKs if hibernating, so optionally retry */
> +	for (i = 0; i < CS40L50_DSP_TIMEOUT_COUNT; i++) {
> +		err = regmap_write(regmap, CS40L50_DSP_QUEUE, val);
> +		if (!err)
> +			break;
> +
> +		usleep_range(CS40L50_DSP_POLL_US, CS40L50_DSP_POLL_US + 100);
> +	}
> +
> +	/* If write never occurred, don't bother polling for ACK */
> +	if (i == CS40L50_DSP_TIMEOUT_COUNT) {
> +		dev_err(dev, "Timed out writing %#X to DSP: %d\n", val, err);
> +		return err;
> +	}
> +
> +	err = regmap_read_poll_timeout(regmap, CS40L50_DSP_QUEUE, ack, !ack,
> +				       CS40L50_DSP_POLL_US,
> +				       CS40L50_DSP_POLL_US * CS40L50_DSP_TIMEOUT_COUNT);
> +	if (err)
> +		dev_err(dev, "DSP did not ACK %#X: %d\n", val, err);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(cs40l50_dsp_write);
> +
> +static const struct cs_dsp_region cs40l50_dsp_regions[] = {
> +	{ .type = WMFW_HALO_PM_PACKED, .base = CS40L50_PMEM_0 },
> +	{ .type = WMFW_HALO_XM_PACKED, .base = CS40L50_XMEM_PACKED_0 },
> +	{ .type = WMFW_HALO_YM_PACKED, .base = CS40L50_YMEM_PACKED_0 },
> +	{ .type = WMFW_ADSP2_XM, .base = CS40L50_XMEM_UNPACKED24_0 },
> +	{ .type = WMFW_ADSP2_YM, .base = CS40L50_YMEM_UNPACKED24_0 },
> +};
> +
> +static const struct reg_sequence cs40l50_internal_vamp_config[] = {
> +	{ CS40L50_BST_LPMODE_SEL,	CS40L50_DCM_LOW_POWER },
> +	{ CS40L50_BLOCK_ENABLES2,	CS40L50_OVERTEMP_WARN },
> +};

I recommend against aligning the second values here and below. If another
register with a long name is added later, the patch would touch more lines
than needed in order to restore the alignment. What you've done for the
cs40l50_dsp_regions[] array is safer.

> +
> +static const struct reg_sequence cs40l50_irq_mask_override[] = {
> +	{ CS40L50_IRQ1_MASK_2,	CS40L50_IRQ_MASK_2_OVERRIDE },
> +	{ CS40L50_IRQ1_MASK_20,	CS40L50_IRQ_MASK_20_OVERRIDE },
> +};
> +
> +static int cs40l50_configure_dsp(struct cs_dsp *dsp)
> +{
> +	struct cs40l50 *cs40l50 = container_of(dsp, struct cs40l50, dsp);
> +	u32 nwaves;
> +	int err;
> +
> +	/* Log number of effects if wavetable was loaded */
> +	if (cs40l50->bin) {

Is there any other clue you can use to discern whether a wavetable was
loaded? The memory at cs40l50->bin is gone now, and although you're not
dereferencing it anymore, another contributor might be fooled into doing
so down the road.

Maybe a boolean would be more maintainable; I don't feel strongly about
it though.

> +		err = regmap_read(dsp->regmap, CS40L50_NUM_WAVES, &nwaves);
> +		if (err)
> +			return err;
> +
> +		dev_info(dsp->dev, "%u effects loaded\n", nwaves);
> +	}
> +
> +	cs40l50->wseqs[CS40L50_PWR_ON].ctl = cs_dsp_get_ctl(dsp, "PM_PWR_ON_SEQ",
> +							    WMFW_ADSP2_XM,
> +							    CS40L50_PM_ALGO);
> +	if (!cs40l50->wseqs[CS40L50_PWR_ON].ctl) {
> +		dev_err(dsp->dev, "No control for power-on write sequence\n");
> +		return -ENOENT;
> +	}
> +
> +	/* Initialize the power-on write sequencer */
> +	err = cs_dsp_wseq_init(dsp, cs40l50->wseqs, 1);
> +	if (err) {
> +		dev_err(dsp->dev, "Failed to initialize power-on write sequence\n");
> +		return err;
> +	}
> +
> +	/* Configure internal V_AMP supply */
> +	err = regmap_multi_reg_write(dsp->regmap, cs40l50_internal_vamp_config,
> +				     ARRAY_SIZE(cs40l50_internal_vamp_config));
> +	if (err)
> +		return err;
> +
> +	err = cs_dsp_wseq_multi_write(dsp, &cs40l50->wseqs[CS40L50_PWR_ON],
> +				      cs40l50_internal_vamp_config, CS_DSP_WSEQ_FULL,
> +				      ARRAY_SIZE(cs40l50_internal_vamp_config), false);
> +	if (err)
> +		return err;
> +
> +	/* Override firmware defaults for IRQ masks */
> +	err = regmap_multi_reg_write(dsp->regmap, cs40l50_irq_mask_override,
> +				     ARRAY_SIZE(cs40l50_irq_mask_override));
> +	if (err)
> +		return err;
> +
> +	err = cs_dsp_wseq_multi_write(dsp, &cs40l50->wseqs[CS40L50_PWR_ON],
> +				      cs40l50_irq_mask_override, CS_DSP_WSEQ_FULL,
> +				      ARRAY_SIZE(cs40l50_irq_mask_override), false);
> +	if (err)
> +		return err;
> +
> +	/* Add child devices now that DSP is running */
> +	err = devm_mfd_add_devices(dsp->dev, PLATFORM_DEVID_NONE, cs40l50_devs,
> +				   ARRAY_SIZE(cs40l50_devs), NULL, 0, NULL);
> +	if (err)
> +		dev_err(dsp->dev, "Failed to add child devices: %d\n", err);
> +
> +	return err;
> +}
> +
> +static const struct cs_dsp_client_ops client_ops = {
> +	.post_run = cs40l50_configure_dsp,
> +};
> +
> +static void cs40l50_dsp_remove(void *data)
> +{
> +	cs_dsp_remove(data);
> +}
> +
> +static int cs40l50_dsp_init(struct cs40l50 *cs40l50)
> +{
> +	int err;
> +
> +	cs40l50->dsp.num = 1;
> +	cs40l50->dsp.type = WMFW_HALO;
> +	cs40l50->dsp.dev = cs40l50->dev;
> +	cs40l50->dsp.regmap = cs40l50->regmap;
> +	cs40l50->dsp.base = CS40L50_CORE_BASE;
> +	cs40l50->dsp.base_sysinfo = CS40L50_SYS_INFO_ID;
> +	cs40l50->dsp.mem = cs40l50_dsp_regions;
> +	cs40l50->dsp.num_mems = ARRAY_SIZE(cs40l50_dsp_regions);
> +	cs40l50->dsp.no_core_startstop = true;
> +	cs40l50->dsp.client_ops = &client_ops;
> +
> +	err = cs_dsp_halo_init(&cs40l50->dsp);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_remove,
> +					&cs40l50->dsp);
> +}
> +
> +static void cs40l50_dsp_power_down(void *data)
> +{
> +	cs_dsp_power_down(data);
> +}
> +
> +static void cs40l50_dsp_stop(void *data)
> +{
> +	cs_dsp_stop(data);
> +}
> +
> +static void cs40l50_start_dsp(const struct firmware *bin, void *context)
> +{
> +	struct cs40l50 *cs40l50 = context;
> +	int err;
> +
> +	/* Wavetable is optional; start DSP regardless */
> +	cs40l50->bin = bin;
> +
> +	mutex_lock(&cs40l50->lock);

It seems the mutex is used only to prevent interrupt handling while the DSP
is being configured; can't we just call disable_irq() and enable_irq() here?

> +
> +	err = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_SHUTDOWN);
> +	if (err)
> +		goto err_mutex;
> +
> +	err = cs_dsp_power_up(&cs40l50->dsp, cs40l50->fw, "cs40l50.wmfw",
> +			      cs40l50->bin, "cs40l50.bin", "cs40l50");
> +	if (err)
> +		goto err_mutex;
> +
> +	err = devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_power_down,
> +				       &cs40l50->dsp);
> +	if (err)
> +		goto err_mutex;
> +
> +	err = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_SYSTEM_RESET);
> +	if (err)
> +		goto err_mutex;
> +
> +	err = cs40l50_dsp_write(cs40l50->dev, cs40l50->regmap, CS40L50_PREVENT_HIBER);
> +	if (err)
> +		goto err_mutex;
> +
> +	err = cs_dsp_run(&cs40l50->dsp);
> +	if (err)
> +		goto err_mutex;
> +
> +	err = devm_add_action_or_reset(cs40l50->dev, cs40l50_dsp_stop, &cs40l50->dsp);

In the case of L25, it was common to stop and re-start the DSP for either
of the following reasons:

1. Swap out .wmfw files. Eventually, different algorithms got so large that
   different .wmfw files were needed for different use-cases (e.g. A2H vs.
   f0 tracking). No matter how much RAM gets added to the HALO core, there
   is never enough! :)
2. Respond to spurious reset. With one customer in particular, the reset
   GPIO traveled over a flex cable, and the connector suffered some contact
   bounce during drop testing.

In general, things that should be able to be executed an infinite number of
times (e.g. register writes) should be logically separate from things that
should only be executed once, like a call to devm_add_action_or_reset().

The same is true for cs40l50_configure_dsp(); it contains a mix of register
writes, but then a call to devm_mfd_add_devices(). Please consider separating
some of these tasks so that rip-up is minimal in case you need to restore or
reconfigure the device on-the-fly at a later time.

> +err_mutex:
> +	mutex_unlock(&cs40l50->lock);
> +	release_firmware(cs40l50->bin);
> +	release_firmware(cs40l50->fw);
> +
> +	if (err)
> +		dev_err(cs40l50->dev, "Failed to start DSP: %d", err);

The fact that we have so much clean-up in the error path may suggest that
the bulk of this function belongs in a helper, e.g. __cs40l50_start_dsp(),
with return type of int.

> +}
> +
> +static void cs40l50_request_firmware(const struct firmware *fw, void *context)
> +{
> +	struct cs40l50 *cs40l50 = context;
> +
> +	if (!fw) {
> +		dev_err(cs40l50->dev, "No firmware file found\n");
> +		return;
> +	}
> +
> +	cs40l50->fw = fw;
> +
> +	if (request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, CS40L50_WT,
> +				    cs40l50->dev, GFP_KERNEL, cs40l50,
> +				    cs40l50_start_dsp)) {
> +		dev_err(cs40l50->dev, "Failed to request %s\n", CS40L50_WT);

Please record the return value of request_firmware_nowait() and print it
in the error message. It makes it much easier for Luddites such as myself
to debug ;)

> +		release_firmware(cs40l50->fw);
> +	}
> +}
> +
> +struct cs40l50_irq {
> +	const char *name;
> +	int virq;
> +};
> +
> +static struct cs40l50_irq cs40l50_irqs[] = {
> +	{ "DSP", },
> +	{ "Global", },
> +	{ "Boost UVLO", },
> +	{ "Boost current limit", },
> +	{ "Boost short", },
> +	{ "Boost undervolt", },
> +	{ "Overtemp", },
> +	{ "Amp short", },
> +};
> +
> +static const struct reg_sequence cs40l50_err_rls[] = {
> +	{ CS40L50_ERR_RLS, CS40L50_GLOBAL_ERR_RLS_SET },
> +	{ CS40L50_ERR_RLS, CS40L50_GLOBAL_ERR_RLS_CLEAR },
> +};
> +
> +static irqreturn_t cs40l50_hw_err(int irq, void *data)
> +{
> +	struct cs40l50 *cs40l50 = data;
> +	int err = 0, i;
> +
> +	mutex_lock(&cs40l50->lock);
> +
> +	/* Log hardware interrupt and execute error release sequence */
> +	for (i = 1; i < ARRAY_SIZE(cs40l50_irqs); i++) {
> +		if (cs40l50_irqs[i].virq == irq) {
> +			dev_err(cs40l50->dev, "%s error\n", cs40l50_irqs[i].name);
> +			err = regmap_multi_reg_write(cs40l50->regmap, cs40l50_err_rls,
> +						     ARRAY_SIZE(cs40l50_err_rls));
> +			goto exit;

There is no need for a goto label here; just break.

> +		}
> +	}
> +exit:
> +	mutex_unlock(&cs40l50->lock);
> +	return IRQ_RETVAL(!err);
> +}
> +
> +static irqreturn_t cs40l50_dsp_queue(int irq, void *data)
> +{
> +	struct cs40l50 *cs40l50 = data;
> +	u32 rd_ptr, val, wt_ptr;
> +	int err = 0;
> +
> +	mutex_lock(&cs40l50->lock);
> +
> +	/* Read from DSP queue, log, and update read pointer */
> +	while (!err) {
> +		err = regmap_read(cs40l50->regmap, CS40L50_DSP_QUEUE_WT, &wt_ptr);
> +		if (err)
> +			goto exit;

Same here, and throughout; just break out of the loop.

> +
> +		err = regmap_read(cs40l50->regmap, CS40L50_DSP_QUEUE_RD, &rd_ptr);
> +		if (err)
> +			goto exit;
> +
> +		/* Check if queue is empty */
> +		if (wt_ptr == rd_ptr)
> +			goto exit;
> +
> +		err = regmap_read(cs40l50->regmap, rd_ptr, &val);
> +		if (err)
> +			goto exit;
> +
> +		dev_dbg(cs40l50->dev, "DSP payload: %#X", val);
> +
> +		rd_ptr += sizeof(u32);
> +
> +		if (rd_ptr > CS40L50_DSP_QUEUE_END)
> +			rd_ptr = CS40L50_DSP_QUEUE_BASE;
> +
> +		err =  regmap_write(cs40l50->regmap, CS40L50_DSP_QUEUE_RD, rd_ptr);
> +		if (err)
> +			goto exit;
> +	}
> +exit:
> +	mutex_unlock(&cs40l50->lock);
> +
> +	return IRQ_RETVAL(!err);
> +}
> +
> +static int cs40l50_irq_init(struct cs40l50 *cs40l50)
> +{
> +	struct device *dev = cs40l50->dev;
> +	int err, i, virq;
> +
> +	err = devm_regmap_add_irq_chip(dev, cs40l50->regmap, cs40l50->irq,
> +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> +				       &cs40l50_irq_chip, &cs40l50->irq_data);
> +	if (err) {
> +		dev_err(dev, "Failed adding IRQ chip\n");

I don't see any need for individual prints in this function, since the call
to cs40l50_irq_init() is already followed by a call to dev_err_probe().

> +		return err;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(cs40l50_irqs); i++) {
> +		virq = regmap_irq_get_virq(cs40l50->irq_data, i);
> +		if (virq < 0) {
> +			dev_err(dev, "Failed getting %s\n", cs40l50_irqs[i].name);
> +			return virq;
> +		}
> +
> +		cs40l50_irqs[i].virq = virq;
> +
> +		/* Handle DSP and hardware interrupts separately */
> +		err = devm_request_threaded_irq(dev, virq, NULL,
> +						i ? cs40l50_hw_err : cs40l50_dsp_queue,
> +						IRQF_ONESHOT | IRQF_SHARED,
> +						cs40l50_irqs[i].name, cs40l50);
> +		if (err) {
> +			dev_err(dev, "Failed requesting %s IRQ\n",
> +				cs40l50_irqs[i].name);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int cs40l50_get_model(struct cs40l50 *cs40l50)
> +{
> +	int err;
> +
> +	err = regmap_read(cs40l50->regmap, CS40L50_DEVID, &cs40l50->devid);
> +	if (err)
> +		return err;
> +
> +	if (cs40l50->devid != CS40L50_DEVID_A)
> +		return -EINVAL;
> +
> +	err = regmap_read(cs40l50->regmap, CS40L50_REVID, &cs40l50->revid);
> +	if (err)
> +		return err;
> +
> +	if (cs40l50->revid < CS40L50_REVID_B0)
> +		return -EINVAL;
> +
> +	dev_info(cs40l50->dev, "Cirrus Logic CS40L50 rev. %02X\n", cs40l50->revid);

This should be dev_dbg().

> +
> +	return 0;
> +}
> +
> +static int cs40l50_pm_runtime_setup(struct device *dev)
> +{
> +	int err;
> +
> +	pm_runtime_set_autosuspend_delay(dev, CS40L50_AUTOSUSPEND_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get_noresume(dev);
> +	err = pm_runtime_set_active(dev);
> +	if (err)
> +		return err;
> +
> +	return devm_pm_runtime_enable(dev);
> +}
> +
> +int cs40l50_probe(struct cs40l50 *cs40l50)
> +{
> +	struct device *dev = cs40l50->dev;
> +	int err;
> +
> +	mutex_init(&cs40l50->lock);
> +
> +	cs40l50->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(cs40l50->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(cs40l50->reset_gpio),
> +				     "Failed getting reset GPIO\n");
> +
> +	err = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(cs40l50_supplies),
> +					     cs40l50_supplies);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed getting supplies\n");
> +
> +	/* Ensure minimum reset pulse width */
> +	usleep_range(CS40L50_RESET_PULSE_US, CS40L50_RESET_PULSE_US + 100);
> +
> +	gpiod_set_value_cansleep(cs40l50->reset_gpio, 0);
> +
> +	/* Wait for control port to be ready */
> +	usleep_range(CS40L50_CP_READY_US, CS40L50_CP_READY_US + 100);
> +
> +	err = cs40l50_dsp_init(cs40l50);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to initialize DSP\n");
> +
> +	err = cs40l50_pm_runtime_setup(dev);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to initialize runtime PM\n");
> +
> +	err = cs40l50_get_model(cs40l50);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to get part number\n");

I think cs40l50_get_model() should be called directly after usleep_range() is
called; there is no use in doing any other initialization if we can't talk I2C
or SPI, or the model is invalid.

> +
> +	err = cs40l50_irq_init(cs40l50);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to request IRQs\n");
> +
> +	err = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, CS40L50_FW,
> +				      dev, GFP_KERNEL, cs40l50, cs40l50_request_firmware);
> +	if (err)
> +		return dev_err_probe(dev, err, "Failed to request %s\n", CS40L50_FW);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cs40l50_probe);
> +
> +int cs40l50_remove(struct cs40l50 *cs40l50)
> +{
> +	gpiod_set_value_cansleep(cs40l50->reset_gpio, 1);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cs40l50_remove);
> +
> +static int cs40l50_runtime_suspend(struct device *dev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(dev);
> +
> +	return regmap_write(cs40l50->regmap, CS40L50_DSP_QUEUE, CS40L50_ALLOW_HIBER);
> +}
> +
> +static int cs40l50_runtime_resume(struct device *dev)
> +{
> +	struct cs40l50 *cs40l50 = dev_get_drvdata(dev);
> +
> +	return cs40l50_dsp_write(dev, cs40l50->regmap, CS40L50_PREVENT_HIBER);
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(cs40l50_pm_ops) = {
> +	RUNTIME_PM_OPS(cs40l50_runtime_suspend, cs40l50_runtime_resume, NULL)
> +};
> +
> +MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(FW_CS_DSP);
> diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
> new file mode 100644
> index 000000000000..639be743d956
> --- /dev/null
> +++ b/drivers/mfd/cs40l50-i2c.c
> @@ -0,0 +1,68 @@
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
> +#include <linux/i2c.h>
> +#include <linux/mfd/cs40l50.h>
> +
> +static int cs40l50_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct cs40l50 *cs40l50;
> +
> +	cs40l50 = devm_kzalloc(&i2c->dev, sizeof(*cs40l50), GFP_KERNEL);
> +	if (!cs40l50)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, cs40l50);
> +
> +	cs40l50->dev = &i2c->dev;
> +	cs40l50->irq = i2c->irq;
> +
> +	cs40l50->regmap = devm_regmap_init_i2c(i2c, &cs40l50_regmap);
> +	if (IS_ERR(cs40l50->regmap))
> +		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
> +				     "Failed to initialize register map\n");
> +
> +	return cs40l50_probe(cs40l50);
> +}
> +
> +static void cs40l50_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct cs40l50 *cs40l50 = i2c_get_clientdata(i2c);
> +
> +	cs40l50_remove(cs40l50);
> +}
> +
> +static const struct i2c_device_id cs40l50_id_i2c[] = {
> +	{ "cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
> +
> +static const struct of_device_id cs40l50_of_match[] = {
> +	{ .compatible = "cirrus,cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs40l50_of_match);
> +
> +static struct i2c_driver cs40l50_i2c_driver = {
> +	.driver = {
> +		.name = "cs40l50",
> +		.of_match_table = cs40l50_of_match,
> +		.pm = pm_ptr(&cs40l50_pm_ops),
> +	},
> +	.id_table = cs40l50_id_i2c,
> +	.probe = cs40l50_i2c_probe,
> +	.remove = cs40l50_i2c_remove,
> +};
> +module_i2c_driver(cs40l50_i2c_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 I2C Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
> new file mode 100644
> index 000000000000..53526b595a0d
> --- /dev/null
> +++ b/drivers/mfd/cs40l50-spi.c
> @@ -0,0 +1,68 @@
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
> +#include <linux/mfd/cs40l50.h>
> +#include <linux/spi/spi.h>
> +
> +static int cs40l50_spi_probe(struct spi_device *spi)
> +{
> +	struct cs40l50 *cs40l50;
> +
> +	cs40l50 = devm_kzalloc(&spi->dev, sizeof(*cs40l50), GFP_KERNEL);
> +	if (!cs40l50)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, cs40l50);
> +
> +	cs40l50->dev = &spi->dev;
> +	cs40l50->irq = spi->irq;
> +
> +	cs40l50->regmap = devm_regmap_init_spi(spi, &cs40l50_regmap);
> +	if (IS_ERR(cs40l50->regmap))
> +		return dev_err_probe(cs40l50->dev, PTR_ERR(cs40l50->regmap),
> +				     "Failed to initialize register map\n");
> +
> +	return cs40l50_probe(cs40l50);
> +}
> +
> +static void cs40l50_spi_remove(struct spi_device *spi)
> +{
> +	struct cs40l50 *cs40l50 = spi_get_drvdata(spi);
> +
> +	cs40l50_remove(cs40l50);
> +}
> +
> +static const struct spi_device_id cs40l50_id_spi[] = {
> +	{ "cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
> +
> +static const struct of_device_id cs40l50_of_match[] = {
> +	{ .compatible = "cirrus,cs40l50" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs40l50_of_match);
> +
> +static struct spi_driver cs40l50_spi_driver = {
> +	.driver = {
> +		.name = "cs40l50",
> +		.of_match_table = cs40l50_of_match,
> +		.pm = pm_ptr(&cs40l50_pm_ops),
> +	},
> +	.id_table = cs40l50_id_spi,
> +	.probe = cs40l50_spi_probe,
> +	.remove = cs40l50_spi_remove,
> +};
> +module_spi_driver(cs40l50_spi_driver);
> +
> +MODULE_DESCRIPTION("CS40L50 SPI Driver");
> +MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/cs40l50.h b/include/linux/mfd/cs40l50.h
> new file mode 100644
> index 000000000000..cc0661926918
> --- /dev/null
> +++ b/include/linux/mfd/cs40l50.h
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * CS40L50 Advanced Haptic Driver with waveform memory,
> + * integrated DSP, and closed-loop algorithms
> + *
> + * Copyright 2024 Cirrus Logic, Inc.
> + *
> + * Author: James Ogletree <james.ogletree@cirrus.com>
> + */
> +
> +#ifndef __MFD_CS40L50_H__
> +#define __MFD_CS40L50_H__
> +
> +#include <linux/firmware/cirrus/cs_dsp.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +
> +/* Power Supply Configuration */
> +#define CS40L50_BLOCK_ENABLES2		0x201C
> +#define CS40L50_ERR_RLS			0x2034
> +#define CS40L50_PWRMGT_CTL		0x2900
> +#define CS40L50_BST_LPMODE_SEL		0x3810
> +#define CS40L50_DCM_LOW_POWER		0x1
> +#define CS40L50_OVERTEMP_WARN		0x4000010
> +
> +/* Interrupts */
> +#define CS40L50_IRQ1_INT_1		0xE010
> +#define CS40L50_IRQ1_BASE		CS40L50_IRQ1_INT_1
> +#define CS40L50_IRQ1_INT_2		0xE014
> +#define CS40L50_IRQ1_INT_8		0xE02C
> +#define CS40L50_IRQ1_INT_9		0xE030
> +#define CS40L50_IRQ1_INT_10		0xE034
> +#define CS40L50_IRQ1_INT_18		0xE054
> +#define CS40L50_IRQ1_MASK_1		0xE090
> +#define CS40L50_IRQ1_MASK_2		0xE094
> +#define CS40L50_IRQ1_MASK_20		0xE0DC
> +#define CS40L50_IRQ1_INT_1_OFFSET	(CS40L50_IRQ1_INT_1 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ1_INT_2_OFFSET	(CS40L50_IRQ1_INT_2 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ1_INT_8_OFFSET	(CS40L50_IRQ1_INT_8 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ1_INT_9_OFFSET	(CS40L50_IRQ1_INT_9 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ1_INT_10_OFFSET	(CS40L50_IRQ1_INT_10 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ1_INT_18_OFFSET	(CS40L50_IRQ1_INT_18 - CS40L50_IRQ1_BASE)
> +#define CS40L50_IRQ_MASK_2_OVERRIDE	0xFFDF7FFF
> +#define CS40L50_IRQ_MASK_20_OVERRIDE	0x15C01000
> +#define CS40L50_AMP_SHORT_MASK		BIT(31)
> +#define CS40L50_DSP_QUEUE_MASK		BIT(21)
> +#define CS40L50_TEMP_ERR_MASK		BIT(31)
> +#define CS40L50_BST_UVP_MASK		BIT(6)
> +#define CS40L50_BST_SHORT_MASK		BIT(7)
> +#define CS40L50_BST_ILIMIT_MASK		BIT(18)
> +#define CS40L50_UVLO_VDDBATT_MASK	BIT(16)
> +#define CS40L50_GLOBAL_ERROR_MASK	BIT(15)
> +
> +enum cs40l50_irq_list {
> +	CS40L50_DSP_QUEUE_IRQ,
> +	CS40L50_GLOBAL_ERROR_IRQ,
> +	CS40L50_UVLO_VDDBATT_IRQ,
> +	CS40L50_BST_ILIMIT_IRQ,
> +	CS40L50_BST_SHORT_IRQ,
> +	CS40L50_BST_UVP_IRQ,
> +	CS40L50_TEMP_ERR_IRQ,
> +	CS40L50_AMP_SHORT_IRQ,
> +};
> +
> +/* DSP */
> +#define CS40L50_XMEM_PACKED_0		0x2000000
> +#define CS40L50_XMEM_UNPACKED24_0	0x2800000
> +#define CS40L50_SYS_INFO_ID		0x25E0000
> +#define CS40L50_RAM_INIT		0x28021DC
> +#define CS40L50_DSP_QUEUE_WT		0x28042C8
> +#define CS40L50_DSP_QUEUE_RD		0x28042CC
> +#define CS40L50_NUM_WAVES		0x2805C18
> +#define CS40L50_CORE_BASE		0x2B80000
> +#define CS40L50_CCM_CORE_CONTROL	0x2BC1000
> +#define CS40L50_YMEM_PACKED_0		0x2C00000
> +#define CS40L50_YMEM_UNPACKED24_0	0x3400000
> +#define CS40L50_PMEM_0			0x3800000
> +#define CS40L50_MEM_RDY_HW		0x2
> +#define CS40L50_RAM_INIT_FLAG		0x1

I didn't see this #define used anywhere; please double check this one
and others.

> +#define CS40L50_CLOCK_DISABLE		0x80
> +#define CS40L50_CLOCK_ENABLE		0x281
> +#define CS40L50_DSP_POLL_US		1000
> +#define CS40L50_DSP_TIMEOUT_COUNT	100
> +#define CS40L50_RESET_PULSE_US		2200
> +#define CS40L50_CP_READY_US		3100
> +#define CS40L50_AUTOSUSPEND_MS		2000
> +#define CS40L50_PM_ALGO			0x9F206
> +#define CS40L50_GLOBAL_ERR_RLS_SET	BIT(11)
> +#define CS40L50_GLOBAL_ERR_RLS_CLEAR	0
> +
> +enum cs40l50_wseqs {
> +	CS40L50_PWR_ON,
> +	CS40L50_STANDBY,
> +	CS40L50_ACTIVE,
> +	CS40L50_NUM_WSEQS,
> +};
> +
> +/* DSP Queue */
> +#define CS40L50_DSP_QUEUE_BASE		0x11004
> +#define CS40L50_DSP_QUEUE_END		0x1101C
> +#define CS40L50_DSP_QUEUE		0x11020
> +#define CS40L50_PREVENT_HIBER		0x2000003
> +#define CS40L50_ALLOW_HIBER		0x2000004
> +#define CS40L50_SHUTDOWN		0x2000005
> +#define CS40L50_SYSTEM_RESET		0x02000007
> +#define CS40L50_START_I2S		0x3000002
> +#define CS40L50_OWT_PUSH		0x3000008
> +#define CS40L50_STOP_PLAYBACK		0x5000000
> +#define CS40L50_OWT_DELETE		0xD000000
> +
> +/* Firmware files */
> +#define CS40L50_FW			"cs40l50.wmfw"
> +#define CS40L50_WT			"cs40l50.bin"
> +
> +/* Device */
> +#define CS40L50_DEVID			0x0
> +#define CS40L50_REVID			0x4
> +#define CS40L50_DEVID_A			0x40A50
> +#define CS40L50_REVID_B0		0xB0
> +
> +struct cs40l50 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex lock;
> +	struct cs_dsp dsp;
> +	struct gpio_desc *reset_gpio;
> +	struct regmap_irq_chip_data *irq_data;
> +	const struct firmware *fw;
> +	const struct firmware *bin;
> +	struct cs_dsp_wseq wseqs[CS40L50_NUM_WSEQS];
> +	int irq;
> +	u32 devid;
> +	u32 revid;
> +};
> +
> +int cs40l50_dsp_write(struct device *dev, struct regmap *regmap, u32 val);
> +int cs40l50_probe(struct cs40l50 *cs40l50);
> +int cs40l50_remove(struct cs40l50 *cs40l50);
> +
> +extern const struct regmap_config cs40l50_regmap;
> +extern const struct dev_pm_ops cs40l50_pm_ops;
> +
> +#endif /* __MFD_CS40L50_H__ */
> -- 
> 2.25.1
> 

Kind regards,
Jeff LaBundy

