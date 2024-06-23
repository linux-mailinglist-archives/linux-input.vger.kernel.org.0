Return-Path: <linux-input+bounces-4565-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60969913708
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 02:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D62271F226E8
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 00:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B89801;
	Sun, 23 Jun 2024 00:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="JxCthixt"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2096.outbound.protection.outlook.com [40.107.100.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877A184E;
	Sun, 23 Jun 2024 00:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719101973; cv=fail; b=QLCHMqithOSb3RxnvpEk+0lytl+v2VdgJ/LJcRrnrk+qoF5x8MSPFl0Kwp3TZWtS0xe2RVI/35qAy32p4c9kvRC9CB+yVufbe//v3AWJUkuBDpltvS0yNu9vswld8wBQ7h4ZtGtvWDriOe+UAFdumm2YGzVSbt3crQ0eWP5LMa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719101973; c=relaxed/simple;
	bh=Y50IZ9pc9pVobNwC675DEGyuKo+p5IHYt6akufmRtLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JdTmia7mXTf7M3Rcp3uTvUTDQHhEKQA2372kyptEjPcDVlcT4nSQiCFk9GLXrReRZGIVqKb0PEOI7Uya/8teUr8N2V2IICDaMhgyNbXaMkfYb5Rczcewfj6C5DUNhFZlMTszNBSRMjB+gnJcJzQYzqfldrY195GNvgmxdRc2m/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=JxCthixt; arc=fail smtp.client-ip=40.107.100.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag1tozfG72l4vVIOhGrKIjVVJcT1BhM6mJ4NNn5eTvurbKUfuNbth35lcpTUmbkdTDbe90BFixPbpQbidfZOtCsGL9FWmRygRXrkzMrQL3JiYc+Htjeedgl1tU99+yHtJTZ5WukJnamCUPtASfgx4rIqICqPDdsy2/uLZwvv9+NsMPZByLX5LGoCAJxgR1ff6P5HAO7VPJPPGeNW9N6VWBuU6rf0emZBgjlHXGr1x1bbchsIQTH/xltw3ealDmoiJnXqcSb+zmD/hxgaE/yXFedZJmVFqqoS/8h7cv+SYdbr2WuCoioxaC4h+doCBRY/9v5qkCvq8iOUe6jVUlt32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2u7+tG5rI6FlQJD5ClAH96KhqTUDX6q2qv9BO8JUpAE=;
 b=a4yJXVIm5vnTBpl+bqZyyk2TDddMjnuuzDNOX6HrI8S9DW0WcU6JguJiQD8sj2oV7hhrZoSnSStGa4P5dG4fTXngYANq4a0NoZuAcE1RPtL4QIRpThNWqJQrxEMzqUeAEGkQ3r35RvNaJFd554D6+6K6Qs0iY0Ewbt3Jxc4VcBA4yHNWjfLnyUlCmZGchOoxprOgExRVQcfuAZ7WXKXbmG7obUKZOywHYtY33YcTmFKrocEgmL8D0HW4nBzgfN/2UeZkNY274TsE913KnZIIh/I8akACWyqbmTkaaZdeaIL8bRyzDpUBXYvSiojkWdrGHHdEeS9g+ZaEhAIzK7cmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2u7+tG5rI6FlQJD5ClAH96KhqTUDX6q2qv9BO8JUpAE=;
 b=JxCthixtnxzTDUZZNGUabeM/ct+AFcxAMNdkPqGeK0J3wRWOQdNPtAeDNX3cw4lsgsP3/PCyIdpJl1wO+bJwTzpatBUZOFp7kgIBqz71xVcqV3cgxv/8cAAfF2mualSGYVmdd2hHKcXoMvd/YaqBWMDiG1Joq0/yMRIsLkw8WY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH0PR08MB6956.namprd08.prod.outlook.com (2603:10b6:610:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 00:19:24 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 00:19:23 +0000
Date: Sat, 22 Jun 2024 19:19:18 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RESEND v11 1/5] firmware: cs_dsp: Add write sequence
 interface
Message-ID: <ZndqBvyhCmA0kOkS@nixie71>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-2-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161745.2312359-2-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN6PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:805:de::49) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH0PR08MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f3a691-ae94-4d59-9ba9-08dc931a21f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GpEbcZkGKGRDGrBiodv1i5+vnpznA0XbFMiBUnNxUxYKTVy/l8Qe685YrFZb?=
 =?us-ascii?Q?+mOdQ8yNi3UAsC+8jirRinAu2e9BcofPAhCdBowTDa8XbTJZx0PlNlvx9GyT?=
 =?us-ascii?Q?okDY6AwDdtKWTdES68CLjvZoBUPjvqR9pe4OG0qkfiayM9JYWQg4YRgVeOoC?=
 =?us-ascii?Q?qipS4tPH5pQTaOogBb8xYp+R/txtTW1cySUA54GRLDlFIIjOHzb6lPLeOw7R?=
 =?us-ascii?Q?hFqpgMKKUycf4Y3kF4mViD7cRTyn2IsrxmNHiLlwsfR8IZi6/iaYaJk9kgox?=
 =?us-ascii?Q?Ixrdmt5Dp/qWs4Ph55HR918BVD9WmYI8bXChTaO9IBJCLM4CCpJhO11H12Kc?=
 =?us-ascii?Q?I27JFXmFLNQg1w3Dk8jKZxQwhVypFUNtz/sPNXjJeAWorX9I0AhNy2sJFcKU?=
 =?us-ascii?Q?TiURW/jH5yHKwgg3VMhNLWGKxYMBTA2sANw4LDZuBOY0AQtLiOSGK7VqP3g0?=
 =?us-ascii?Q?1ALWr8bLCqAHbfR3wA6jQgEL4brRU8XHejWgZwAUnEUch+JNt06jib4PvFeu?=
 =?us-ascii?Q?Z3OcMtqlfJ3+BYS9JvQ481gfjV5UN4v0zVhsjk8jEIj4OlDed8xr+5xNZAXb?=
 =?us-ascii?Q?gKOjl11oU4l61bHWl8lRu7xkIZpEMI/ApdpObJXB1nbBXUckImGYGIQ1UQZA?=
 =?us-ascii?Q?/rFxBPLQke1WaKxryDhCC7A3FKYQPZjg1ICtnhLinpKddl+nxWeMQx4p+nIT?=
 =?us-ascii?Q?kT/QCtWWum1+B7h4SMUWBWjxSEE6kwcPQ1N6DB3l9wzjY74WbAKRv5gNvja2?=
 =?us-ascii?Q?MMS3C4kWuwLbIKrtrNhOYckOBtAqZ7GG0BPquG3e8WE+OmsEujhIu92rPc6K?=
 =?us-ascii?Q?LvJXPymzkPSta/wH2Po2Y4t0HtKC5Zoe6fEgeC3bHdD59AVY4Mkbh7kp1V6V?=
 =?us-ascii?Q?W/vkyKLVdQ7sy4OC4JDOxfAXUr3X50KlxF+ao+WJQYqV06tORBvSetnf9JOi?=
 =?us-ascii?Q?V+bpV7+U1xNkDmoJ2QE8Q9K2WoGD+9JbXD0/fjHoXBQcuKykIINf/nPW0wyY?=
 =?us-ascii?Q?ODj1ehABmFKujFqbMDyABxU0lhn+2mGWOpBNhj8oHFXLEzdX0wKhf70VpqSd?=
 =?us-ascii?Q?P5gW9hsyPhasn0LpVNdaZ7KGqBaDdCopbkXxo5ZdMobAcbcC9Dpru2NPMowF?=
 =?us-ascii?Q?T05m/JGaXHVVxnJVGHUG32JyMzEzsHCl6QX0wadfo9TMVKcZcgNzacMJBkGz?=
 =?us-ascii?Q?obtl0VAblPgfRZnyFTEQ15PbLT/xjgOtv+SJzoT+Npoid6JSx0k9DSmSviZT?=
 =?us-ascii?Q?+JACZ5vXQGKbt9gTjq9ajz4RhTXUUTHpvshSFAx7+J7gyhKChev6RN+256dv?=
 =?us-ascii?Q?WnNiCIccq3TtkrNpod4kRoR4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TUvTVvOuc+bviND0xy3iAGrlLyOkhKwyDlIagbQqGrlM1PZILZ/lwTdovDA3?=
 =?us-ascii?Q?e+Nb7pVUyukJ/CKR85kMvAVKbTheDJZos6uwHv4tUyU8g6S4s1nDdwNtf7jS?=
 =?us-ascii?Q?gYj1cXpFFwWebZcu/CtMQxXeUKyL1oMNiQEUjDUIioFkhVjFxQfBfEUKUDHp?=
 =?us-ascii?Q?dgvp9uZZhNv1zZwUt/xXN+1Y+iSGvnd9lM4zX3Sb9x930q51KYBdRr5bF3TG?=
 =?us-ascii?Q?pWY+tLBj2pANkRhEMkByxJvejJjNpLdddz1D7mlMkjMpJ/iCM1mfBP5d9PFd?=
 =?us-ascii?Q?bq/umKVntbsuADlqvD3iLLmhoLsrT4SB9WFMFFiK83+a6oW3+G8BAojLA8WQ?=
 =?us-ascii?Q?yf3Exx/HpVlmqaaKc48mCJy8BFszAxzDRNc1NzO6A8TgNLruNrPXZoAkZZZQ?=
 =?us-ascii?Q?xuPp23b/tsd3xHu+gWcaMfCVHpCSqfD35Gmb++xLEqFuneHVocs/i4oONunD?=
 =?us-ascii?Q?j1aRFedJ8bngzEzQVKt6jY1NIV837BnhKSZ6Hdp1nH6jl5EWvYN4iD2wSGQY?=
 =?us-ascii?Q?/kxcHm8cl2VPuifit9ZoWqLOe0/ReBu/dilSALvHbE0y8/js6uCb4k6yfRTb?=
 =?us-ascii?Q?mIxlcykHZBaZ3FABvX+eIJ8MgD6oMa37LH4s2TPncbh2EAoTDHeMjrUilpl4?=
 =?us-ascii?Q?QfRGwc5/3wQxRpdb4j07TlPqax4NrMRVXFRKJ9xeftewhMdRae6J1jLrXB94?=
 =?us-ascii?Q?Ei/Eb/cU2AKuzkXmTK5CMJ0rgfTPIUHVcIoca3FW85OpZNy1ztrmIb2ZvQsC?=
 =?us-ascii?Q?ahf7jexm/bWS4ich4wnKjVbbe9nPJwb7pQb5CQBK9C+GYaefwLH5uQcXXz5a?=
 =?us-ascii?Q?EseoA1LKF/s78J5vqXegFY7gWdvimASMZwhNmtABEKo3M4ZZkNyiJcg/9Ppe?=
 =?us-ascii?Q?5lb5RGhmJmR908zcniVjm386VPsWVSH2zoiwN6vopqwoucE942bXlCRy2utQ?=
 =?us-ascii?Q?3xcwT2bSm4wVTYoHGb2q5/ZpeEUON0nviTt3f7j4fr6cfBpXztatq2VklA7B?=
 =?us-ascii?Q?ZFmOlnCjZVhqpIvXCE80/2JS5tQGgkWFjoN9haXq/c6TuFstcqlzFL3YsyVf?=
 =?us-ascii?Q?mtWnSgzmPvStEdMoI78iLtjSXiivfi5Q3R/f+LJhg50tgnbq2tp5sbGHwPFX?=
 =?us-ascii?Q?zap6NcjnlUayRh+txa+GrtK2MF4C+wPd/S1JNjaagA/bueaPb/Wl2ktOXPLZ?=
 =?us-ascii?Q?dk0N2vgbcMHA6beas93Q2AN54HHHKE/Fhcw0tRU7aQ0m90XURereEayDDuaN?=
 =?us-ascii?Q?dQMsPhVP1zLXOgqFi2NlqmKRAJtmbx1yV/puUn6OFg813oTlGWgcC92ysz0P?=
 =?us-ascii?Q?jC3ClYMEZTic3sA5P1qDyOjjRuvxV+VLf/+rnCEmiZn2/wm7C0OYFoHB04OR?=
 =?us-ascii?Q?ABjLdkIt7XmVy/2dT/7Ov5t/mS9xO/Q1+0Lp7MIg+k8u9knuzl5NAALbN8Gk?=
 =?us-ascii?Q?CJKN3aR7OkkeBaglKtESVAMmC5XXVxlV05TGUMx7bmxkCipa4JFFJDH9gkUg?=
 =?us-ascii?Q?XzoPPN1nSgYRpMHERNkftHKpVU5HUN4oNmxOXxWn4g1Wv9F/w0qOKEWf4cE1?=
 =?us-ascii?Q?owvmrzsAzbMzERDjF7xbiSPYZT+XZSKmL2UhuOiD?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f3a691-ae94-4d59-9ba9-08dc931a21f2
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 00:19:22.9700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOLyBY+NXm3R1lxMriEkf8Xar0VloxLMkDTga3gd0wjICQz5Ly5HNrSyuFLv/dhMGXJY+IW6fwcoOr9mGUZ9mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6956

Hi James,

On Thu, Jun 20, 2024 at 04:17:41PM +0000, James Ogletree wrote:
> A write sequence is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> certain power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequence present in firmware.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Thanks again for your great work here. This entire driver is well
organized, scalable, and serves as a great template for future FF
devices with similar use-cases. Nice job!

Kind regards,
Jeff LaBundy

> ---
> Note that this patch can be applied before the others.
> 
>  drivers/firmware/cirrus/cs_dsp.c       | 278 +++++++++++++++++++++++++
>  include/linux/firmware/cirrus/cs_dsp.h |  27 +++
>  2 files changed, 305 insertions(+)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 79d4254d1f9b..6d886ffea10f 100644
> --- a/drivers/firmware/cirrus/cs_dsp.c
> +++ b/drivers/firmware/cirrus/cs_dsp.c
> @@ -275,6 +275,12 @@
>  #define HALO_MPU_VIO_ERR_SRC_MASK           0x00007fff
>  #define HALO_MPU_VIO_ERR_SRC_SHIFT                   0
>  
> +/*
> + * Write Sequence
> + */
> +#define WSEQ_OP_MAX_WORDS	3
> +#define WSEQ_END_OF_SCRIPT	0xFFFFFF
> +
>  struct cs_dsp_ops {
>  	bool (*validate_version)(struct cs_dsp *dsp, unsigned int version);
>  	unsigned int (*parse_sizes)(struct cs_dsp *dsp,
> @@ -3339,6 +3345,278 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
>  }
>  EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_read, FW_CS_DSP);
>  
> +
> +struct cs_dsp_wseq_op {
> +	struct list_head list;
> +	u32 address;
> +	u32 data;
> +	u16 offset;
> +	u8 operation;
> +};
> +
> +static void cs_dsp_wseq_clear(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
> +{
> +	struct cs_dsp_wseq_op *op, *op_tmp;
> +
> +	list_for_each_entry_safe(op, op_tmp, &wseq->ops, list) {
> +		list_del(&op->list);
> +		devm_kfree(dsp->dev, op);
> +	}
> +}
> +
> +static int cs_dsp_populate_wseq(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
> +{
> +	struct cs_dsp_wseq_op *op = NULL;
> +	struct cs_dsp_chunk chunk;
> +	u8 *words;
> +	int ret;
> +
> +	if (!wseq->ctl) {
> +		cs_dsp_err(dsp, "No control for write sequence\n");
> +		return -EINVAL;
> +	}
> +
> +	words = kzalloc(wseq->ctl->len, GFP_KERNEL);
> +	if (!words)
> +		return -ENOMEM;
> +
> +	ret = cs_dsp_coeff_read_ctrl(wseq->ctl, 0, words, wseq->ctl->len);
> +	if (ret) {
> +		cs_dsp_err(dsp, "Failed to read %s: %d\n", wseq->ctl->subname, ret);
> +		goto err_free;
> +	}
> +
> +	INIT_LIST_HEAD(&wseq->ops);
> +
> +	chunk = cs_dsp_chunk(words, wseq->ctl->len);
> +
> +	while (!cs_dsp_chunk_end(&chunk)) {
> +		op = devm_kzalloc(dsp->dev, sizeof(*op), GFP_KERNEL);
> +		if (!op) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +
> +		op->offset = cs_dsp_chunk_bytes(&chunk);
> +		op->operation = cs_dsp_chunk_read(&chunk, 8);
> +
> +		switch (op->operation) {
> +		case CS_DSP_WSEQ_END:
> +			op->data = WSEQ_END_OF_SCRIPT;
> +			break;
> +		case CS_DSP_WSEQ_UNLOCK:
> +			op->data = cs_dsp_chunk_read(&chunk, 16);
> +			break;
> +		case CS_DSP_WSEQ_ADDR8:
> +			op->address = cs_dsp_chunk_read(&chunk, 8);
> +			op->data = cs_dsp_chunk_read(&chunk, 32);
> +			break;
> +		case CS_DSP_WSEQ_H16:
> +		case CS_DSP_WSEQ_L16:
> +			op->address = cs_dsp_chunk_read(&chunk, 24);
> +			op->data = cs_dsp_chunk_read(&chunk, 16);
> +			break;
> +		case CS_DSP_WSEQ_FULL:
> +			op->address = cs_dsp_chunk_read(&chunk, 32);
> +			op->data = cs_dsp_chunk_read(&chunk, 32);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			cs_dsp_err(dsp, "Unsupported op: %X\n", op->operation);
> +			devm_kfree(dsp->dev, op);
> +			goto err_free;
> +		}
> +
> +		list_add_tail(&op->list, &wseq->ops);
> +
> +		if (op->operation == CS_DSP_WSEQ_END)
> +			break;
> +	}
> +
> +	if (op && op->operation != CS_DSP_WSEQ_END) {
> +		cs_dsp_err(dsp, "%s missing end terminator\n", wseq->ctl->subname);
> +		ret = -ENOENT;
> +	}
> +
> +err_free:
> +	kfree(words);
> +
> +	return ret;
> +}
> +
> +/**
> + * cs_dsp_wseq_init() - Initialize write sequences contained within the loaded DSP firmware
> + * @dsp: Pointer to DSP structure
> + * @wseqs: List of write sequences to initialize
> + * @num_wseqs: Number of write sequences to initialize
> + *
> + * Return: Zero for success, a negative number on error.
> + */
> +int cs_dsp_wseq_init(struct cs_dsp *dsp, struct cs_dsp_wseq *wseqs, unsigned int num_wseqs)
> +{
> +	int i, ret;
> +
> +	lockdep_assert_held(&dsp->pwr_lock);
> +
> +	for (i = 0; i < num_wseqs; i++) {
> +		ret = cs_dsp_populate_wseq(dsp, &wseqs[i]);
> +		if (ret) {
> +			cs_dsp_wseq_clear(dsp, &wseqs[i]);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_init, FW_CS_DSP);
> +
> +static struct cs_dsp_wseq_op *cs_dsp_wseq_find_op(u32 addr, u8 op_code,
> +						  struct list_head *wseq_ops)
> +{
> +	struct cs_dsp_wseq_op *op;
> +
> +	list_for_each_entry(op, wseq_ops, list) {
> +		if (op->operation == op_code && op->address == addr)
> +			return op;
> +	}
> +
> +	return NULL;
> +}
> +
> +/**
> + * cs_dsp_wseq_write() - Add or update an entry in a write sequence
> + * @dsp: Pointer to a DSP structure
> + * @wseq: Write sequence to write to
> + * @addr: Address of the register to be written to
> + * @data: Data to be written
> + * @op_code: The type of operation of the new entry
> + * @update: If true, searches for the first entry in the write sequence with
> + * the same address and op_code, and replaces it. If false, creates a new entry
> + * at the tail
> + *
> + * This function formats register address and value pairs into the format
> + * required for write sequence entries, and either updates or adds the
> + * new entry into the write sequence.
> + *
> + * If update is set to true and no matching entry is found, it will add a new entry.
> + *
> + * Return: Zero for success, a negative number on error.
> + */
> +int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> +		      u32 addr, u32 data, u8 op_code, bool update)
> +{
> +	struct cs_dsp_wseq_op *op_end, *op_new = NULL;
> +	u32 words[WSEQ_OP_MAX_WORDS];
> +	struct cs_dsp_chunk chunk;
> +	int new_op_size, ret;
> +
> +	if (update)
> +		op_new = cs_dsp_wseq_find_op(addr, op_code, &wseq->ops);
> +
> +	/* If entry to update is not found, treat it as a new operation */
> +	if (!op_new) {
> +		op_end = cs_dsp_wseq_find_op(0, CS_DSP_WSEQ_END, &wseq->ops);
> +		if (!op_end) {
> +			cs_dsp_err(dsp, "Missing terminator for %s\n", wseq->ctl->subname);
> +			return -EINVAL;
> +		}
> +
> +		op_new = devm_kzalloc(dsp->dev, sizeof(*op_new), GFP_KERNEL);
> +		if (!op_new)
> +			return -ENOMEM;
> +
> +		op_new->operation = op_code;
> +		op_new->address = addr;
> +		op_new->offset = op_end->offset;
> +		update = false;
> +	}
> +
> +	op_new->data = data;
> +
> +	chunk = cs_dsp_chunk(words, sizeof(words));
> +	cs_dsp_chunk_write(&chunk, 8, op_new->operation);
> +
> +	switch (op_code) {
> +	case CS_DSP_WSEQ_FULL:
> +		cs_dsp_chunk_write(&chunk, 32, op_new->address);
> +		cs_dsp_chunk_write(&chunk, 32, op_new->data);
> +		break;
> +	case CS_DSP_WSEQ_L16:
> +	case CS_DSP_WSEQ_H16:
> +		cs_dsp_chunk_write(&chunk, 24, op_new->address);
> +		cs_dsp_chunk_write(&chunk, 16, op_new->data);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		cs_dsp_err(dsp, "Operation %X not supported\n", op_code);
> +		goto op_new_free;
> +	}
> +
> +	new_op_size = cs_dsp_chunk_bytes(&chunk);
> +
> +	if (!update) {
> +		if (wseq->ctl->len - op_end->offset < new_op_size) {
> +			cs_dsp_err(dsp, "Not enough memory in %s for entry\n", wseq->ctl->subname);
> +			ret = -E2BIG;
> +			goto op_new_free;
> +		}
> +
> +		op_end->offset += new_op_size;
> +
> +		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
> +					      &op_end->data, sizeof(u32));
> +		if (ret)
> +			goto op_new_free;
> +
> +		list_add_tail(&op_new->list, &op_end->list);
> +	}
> +
> +	ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_new->offset / sizeof(u32),
> +				      words, new_op_size);
> +	if (ret)
> +		goto op_new_free;
> +
> +	return 0;
> +
> +op_new_free:
> +	devm_kfree(dsp->dev, op_new);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_write, FW_CS_DSP);
> +
> +/**
> + * cs_dsp_wseq_multi_write() - Add or update multiple entries in a write sequence
> + * @dsp: Pointer to a DSP structure
> + * @wseq: Write sequence to write to
> + * @reg_seq: List of address-data pairs
> + * @num_regs: Number of address-data pairs
> + * @op_code: The types of operations of the new entries
> + * @update: If true, searches for the first entry in the write sequence with
> + * the same address and op_code, and replaces it. If false, creates a new entry
> + * at the tail
> + *
> + * This function calls cs_dsp_wseq_write() for multiple address-data pairs.
> + *
> + * Return: Zero for success, a negative number on error.
> + */
> +int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> +			    const struct reg_sequence *reg_seq, int num_regs,
> +			    u8 op_code, bool update)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < num_regs; i++) {
> +		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
> +					reg_seq[i].def, op_code, update);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, FW_CS_DSP);
> +
>  MODULE_DESCRIPTION("Cirrus Logic DSP Support");
>  MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
> index 29cd11d5a3cf..4cef6fafa1d8 100644
> --- a/include/linux/firmware/cirrus/cs_dsp.h
> +++ b/include/linux/firmware/cirrus/cs_dsp.h
> @@ -42,6 +42,16 @@
>  #define CS_DSP_ACKED_CTL_MIN_VALUE           0
>  #define CS_DSP_ACKED_CTL_MAX_VALUE           0xFFFFFF
>  
> +/*
> + * Write sequence operation codes
> + */
> +#define CS_DSP_WSEQ_FULL	0x00
> +#define CS_DSP_WSEQ_ADDR8	0x02
> +#define CS_DSP_WSEQ_L16		0x04
> +#define CS_DSP_WSEQ_H16		0x05
> +#define CS_DSP_WSEQ_UNLOCK	0xFD
> +#define CS_DSP_WSEQ_END		0xFF
> +
>  /**
>   * struct cs_dsp_region - Describes a logical memory region in DSP address space
>   * @type:	Memory region type
> @@ -255,6 +265,23 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
>  
>  const char *cs_dsp_mem_region_name(unsigned int type);
>  
> +/**
> + * struct cs_dsp_wseq - Describes a write sequence
> + * @ctl:	Write sequence cs_dsp control
> + * @ops:	Operations contained within
> + */
> +struct cs_dsp_wseq {
> +	struct cs_dsp_coeff_ctl *ctl;
> +	struct list_head ops;
> +};
> +
> +int cs_dsp_wseq_init(struct cs_dsp *dsp, struct cs_dsp_wseq *wseqs, unsigned int num_wseqs);
> +int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq, u32 addr, u32 data,
> +		      u8 op_code, bool update);
> +int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> +			    const struct reg_sequence *reg_seq, int num_regs,
> +			    u8 op_code, bool update);
> +
>  /**
>   * struct cs_dsp_chunk - Describes a buffer holding data formatted for the DSP
>   * @data:	Pointer to underlying buffer memory
> -- 
> 2.34.1
> 

