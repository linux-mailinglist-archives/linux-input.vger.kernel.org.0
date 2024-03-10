Return-Path: <linux-input+bounces-2316-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB53877820
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 20:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6438E1C20A2F
	for <lists+linux-input@lfdr.de>; Sun, 10 Mar 2024 19:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7623039FDA;
	Sun, 10 Mar 2024 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="bHBFcZMN"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603339FC1;
	Sun, 10 Mar 2024 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710097948; cv=fail; b=urnvQgDX6PCBWK+jYmv1T/6NzVIexRkyX5iO2iV0Zs1dBh2Fr00LsknwjrpdZ4SzLiGAPJMzQMztSnBEgxJmTv0Sh9pmI03bZC8gWME9VMvCEayJg2ENxSgj99mpyMfV0ZWrf5F2fzfjg7AVgzvr+1ebE4h4LrLL4T4/g/X7vf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710097948; c=relaxed/simple;
	bh=0hFqCK1LLqld0YQ7t0ExuWh9TSMkUHfwGJ+TySGhSeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GbPozaRCo6k3SE+zvvYjbIo+wW/LvGRMgC+gDXQ7R4ZG0JNgdo8W4x4A7Wb4ztUU7E3Qn7uqace+8zwDz/Z8bQ1kAJssuztH4KmKUO+UKG/j1yaA+QOe4CfHEJ5cm1DqMw5XAp/o6ftoLW6aACHEO5kuNpPaEr0HzzF/H6zYxUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=bHBFcZMN; arc=fail smtp.client-ip=40.107.93.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBsRX2GE+DnLwI5EZbg655VDycF28QcbbwgYXkUHwOTS5z/Cfv4aYA53x/YRCHh3yOkzaRLzJKulTxn6xF1OSM6nJxGlc/0+Nx5XQGXSr+DPm36z8cyFI+tYsxmK4MeRsY1PHMHl9K39anASOdIPFQTa8qpieREnkznrNH5S1SfhuGxwS826NATl7XEu/YjpHfPHqkl+dFcEkeEvdvKJfGXpfO2/41JHCOnLu2rVW8f08Pi1frQqOUaLTcC3c77mhME3f978k9FNletQ50UNjQf0HXRGIYkTKEOdVjYoSTvLYUpbv3Ox32mqXVLt+AZ7N8sGiKZ/dC7Zfj8MWHQQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrHqNxqNWVbGie47lUWOWf1TNh0WjGyrD19DsRu2q64=;
 b=luvYXtVvPM/6hky/IlkI2xJqPKiTutlbFI+a0U9BEOwKWAjVRoCk7VUj0Su0i5tFn86aRZ6DNG961wtRW7AC1KZEZbsgYMd0vRVRrYnnwK5x5jhLwaA1A96KgAsOqPuXTbhmP1HBE5hwaZIfrBdbxOQwuIkuoiZZU7ucvXWQv9Syazky+fNB9om1cML8phctbJroWboMXwLTvHCDvJTPgQVGuQKZOeykkhnJiVm2uA5lqe/mXf694zeXNrBqFrXuaqTTCLkSs41qvy7nwvvf4+aYjEP4gkqYqKCKLYguCLOPDg1SqE706t5dqZ7R/ntA6eHve+EYnOk9UDQsozFYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrHqNxqNWVbGie47lUWOWf1TNh0WjGyrD19DsRu2q64=;
 b=bHBFcZMNe/i31WXUWr0ru5RW8m6mvP7PmshvaFEPZfailUa4Ll8lLD7pU3liW8T7DHikQDIUg50NvwDZ9rm+V1jJfUnSsx6+yRM+gCVHiwjde8oQjMNJxZzPqIfDVpRV7NZVid7uFoHmkH1Z8Ml0jTc+Y4SGRUbQS407QnemBdA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM3PR08MB9250.namprd08.prod.outlook.com
 (2603:10b6:0:49::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sun, 10 Mar
 2024 19:12:22 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.031; Sun, 10 Mar 2024
 19:12:22 +0000
Date: Sun, 10 Mar 2024 14:12:16 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v9 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <Ze4GEKkXoRA/4Sga@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-2-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308222421.188858-2-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN7PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:806:126::11) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM3PR08MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: efeb3881-0e2e-41ab-af59-08dc4136039f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TZFaBRmAK4RZ3SQgrVhy2DadPPAYJMj9FaYw2XbwNoyNljqhaKoc3GE3XgTo0w1QpeDamtkddvYRQlLbG0qrH0nYDafQkS04IvoydAjATbk0bVWZDzWPtyxhEf42IfpQUkI01/X6LrtUlo5AtRr0WeWNe8dpIRZpHX2CKJtyt3CjDXlUqQWsPH+KI2EeuA5GoNz6m/wp3sj4+/8c8+VkbS1zVdymI8VKBWhUV+2kHhhdwzoDY6FfEQVWbrsxVhso7ROtF7sfCKhMdkUGLo8cVIX/NmMvxfTdCE1riJwDznviIpIC9QKf8qQsrKDu57z2yKC2YrAlQyfoBSFVEtqFMSYoNlWig8uH/OYauGGiG69XgK7i80fCpVsyh8r8M80imlvp89rPwc7leqTqsw6QC+4FO/tTZrOR2bFT85rxhQxTOJr9LYXFax8eDr9BdiE7bNxoRw0KLgdrqb3NvIXp5lotodUXgr24+//XU/WEpdLR8svEVpPK5gymoMpSdAmO81kcoSh46GrTxpi+jwJWpkXZrXcpxB52ghmaw7E5R92DgDPr1hgQdmVp0CgCzuvrB1ATUkq/UxKRmAynwlnB7gcqWVzoN4oZJKztNxQCW28v27vRqq8qILRo3SFg7njCWc6ycljsFR49wHGgqYtLhFG8fh8jVzyrjdl7noXXwiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VwcOVmsJ6GuKIUuaXTBFVVy93EBIKtb6bG74c+gQyzuLBX46FSwQk0d/DsRb?=
 =?us-ascii?Q?Ju/XsAl7Q18M+BzUzI86aXxSqghetvbfiDeKDaILQ8CS1BPelG3ub7Saavsa?=
 =?us-ascii?Q?KHBWfbEicrXyxOxcjyBBEhji83+BiXnasLHNgidSXapV4KEs93a8iceix975?=
 =?us-ascii?Q?UeWme0Bz/jTbl0lUsBmRvW+3YNU7/sVhOFAZD3zniKAy+C9Gue11zSiYs0jw?=
 =?us-ascii?Q?jocNa+hE7xEO4fJIB+MTOKnKJzhI7l3EOiecS88Y32Jixe6Gk9lcoDXYn5Kx?=
 =?us-ascii?Q?U8QYpcElurcUcIYRJ9X0yzWZSqfku1+V4oKDIc8YMqQK5Y3YfZ7lr4PFcY31?=
 =?us-ascii?Q?3mPt3KBQTl541DL5AG3LHEDs/8Cxzu2/9+aR4cb+Psdz90kvz/qfY7/1ZDms?=
 =?us-ascii?Q?RcnVmRer2lNG+nlLDY76fl98Y8vADZTy0ClQPa5DjZh9pWsVV7VO4Uir+nqR?=
 =?us-ascii?Q?GRmjCYGTszGxR2ZBGbdnYq42+cdzuW8tflJatib5hEYGbLhrBLg616XaUA1K?=
 =?us-ascii?Q?gEZLL8bfUMH3JeODWAyilFJg/v7B2TBMPDw821A6QMeLxA4NokDZ5jOXem6S?=
 =?us-ascii?Q?JOG3WfuWLVGDr4FcojNen9honVBlu+OolJhw6RCLE13YH49uPv14Unj1qO+8?=
 =?us-ascii?Q?SDDfRhD3uRZi0ipiMr6oovucqeIiTTMkM0w4y2mBCAf2RMybkqGEAmvq0iIh?=
 =?us-ascii?Q?8hvheIeMVF/lTVp0xZnVr6wYn7imZylB4JzDRXK49YXB3deeESErtqHG59P4?=
 =?us-ascii?Q?/V+Z3WECerVeVHoIyr6wQO2kcgSrwxs3H95lX8m/zAHVxIEt1B5kT6kF+w6u?=
 =?us-ascii?Q?ESUc7+SvNmggbkwobxOekd/vt8bjqka0wYaSLESR+aaA0dQvAleUkOvVtj6s?=
 =?us-ascii?Q?/mG52KVY1s9DlY9ZDTCIKmCSlxTlKU40LVs3hFi36UNFo2VYLg4Nb6QGS5wf?=
 =?us-ascii?Q?ZtDEra/eDGct4GX5xlrpUD1LqLEbIovOjyFTmb4YdYxc/cyN9srqd4uz+SMi?=
 =?us-ascii?Q?HIdLAmATnWtsT6RsVx1HUmzq6d5lErM3QzvxsWBboq8KL44dRokg3+wIVl7l?=
 =?us-ascii?Q?X/X9M0x2I1AQ6Ff3e1pz7sa2WQOIM8bh3jLo8Kdfmprf4Bzwr4rKMmwEBG7A?=
 =?us-ascii?Q?sXUcD8u6YKbAFkQHNZxeqduUFPUlllPuevDr8GZ2US+ayvAhxcsF7538wH2i?=
 =?us-ascii?Q?zeYeNv4CF40Pl3mBKiFtKI+SpDOVtJdAHKPjSI3k4FsKMLTi+9T4eSNqUcyQ?=
 =?us-ascii?Q?h2mVTDnhzuYj2EEQq19eNGIM5THbLb935SrjEXgOjwYl0eMlfIQYCnhmVq6t?=
 =?us-ascii?Q?4CIVoOVBpZ16qfqISOHhFdGrv8dV5YUiiwbbymI4KQg80KC8qSN8k7ywy4kE?=
 =?us-ascii?Q?J5djTXdOuP+zPqkCfRxl+nnKUGadcpqkk4sKbOErGHvkxh6e6W1qmtevyfq2?=
 =?us-ascii?Q?neSm5vROo5+gQI/CUfgQfTDLL85Y6js8J1HYFWSVt3FCvXyVgFTM4dQWzKjd?=
 =?us-ascii?Q?BhQQmIMsZz2H/k1+B5lZdE+2geNvUnWLl+LzoU1EWHnx632bxLULalb8PGQT?=
 =?us-ascii?Q?4vRuijcdGnGmjvgsSWsXXnG9PF7QN4ss/T18Xwgl?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efeb3881-0e2e-41ab-af59-08dc4136039f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2024 19:12:22.6243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUJiiAbdMm9MCj1r/CfbrK+ajZCGTwHYNmPVQoP7n0BW2JH0XHnAZFKpcQLjNyxLFPqKyjopy1zV0tQmAlGVog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR08MB9250

Hi James,

On Fri, Mar 08, 2024 at 10:24:17PM +0000, James Ogletree wrote:
> A write sequencer is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequencer present in firmware.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Truly excellent work here; thanks again for continuing to lead a
productive review. I think the overall design of the driver and
the way it is organized are solid now.

Apologies for not getting you feedback sooner; I have some minor
comments below and in a few other spots throughout the series. I
think it is ready after these last few points are addressed.

> ---
>  drivers/firmware/cirrus/cs_dsp.c       | 263 +++++++++++++++++++++++++
>  include/linux/firmware/cirrus/cs_dsp.h |  28 +++
>  2 files changed, 291 insertions(+)
> 
> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
> index 79d4254d1f9b..90cd56d70c49 100644
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
> @@ -3339,6 +3345,263 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
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
> +static int cs_dsp_populate_wseq(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq)
> +{
> +	struct cs_dsp_wseq_op *op = NULL;
> +	struct cs_dsp_chunk ch;
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
> +	ch = cs_dsp_chunk(words, wseq->ctl->len);
> +
> +	while (!cs_dsp_chunk_end(&ch)) {
> +		op = devm_kzalloc(dsp->dev, sizeof(*op), GFP_KERNEL);
> +		if (!op) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +
> +		op->offset = cs_dsp_chunk_bytes(&ch);
> +		op->operation = cs_dsp_chunk_read(&ch, 8);
> +
> +		switch (op->operation) {
> +		case CS_DSP_WSEQ_END:
> +			op->data = WSEQ_END_OF_SCRIPT;
> +			break;
> +		case CS_DSP_WSEQ_UNLOCK:
> +			op->data = cs_dsp_chunk_read(&ch, 16);
> +			break;
> +		case CS_DSP_WSEQ_ADDR8:
> +			op->address = cs_dsp_chunk_read(&ch, 8);
> +			op->data = cs_dsp_chunk_read(&ch, 32);
> +			break;
> +		case CS_DSP_WSEQ_H16:
> +		case CS_DSP_WSEQ_L16:
> +			op->address = cs_dsp_chunk_read(&ch, 24);
> +			op->data = cs_dsp_chunk_read(&ch, 16);
> +			break;
> +		case CS_DSP_WSEQ_FULL:
> +			op->address = cs_dsp_chunk_read(&ch, 32);
> +			op->data = cs_dsp_chunk_read(&ch, 32);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			cs_dsp_err(dsp, "Unsupported op: %X\n", op->operation);
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
> +		cs_dsp_err(dsp, "Write sequence missing end terminator\n");
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
> +	int i, ret = 0;
> +
> +	lockdep_assert_held(&dsp->pwr_lock);
> +
> +	for (i = 0; i < num_wseqs; i++) {
> +		ret = cs_dsp_populate_wseq(dsp, &wseqs[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
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
> + * at the tail.
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
> +	struct cs_dsp_chunk ch;

Nit: 'chunk' is probably a more descriptive variable name; 'ch' is ambiguous
and too easily confused with other common things (e.g. channel).

> +	int new_op_size, ret;
> +
> +	if (update)
> +		op_new = cs_dsp_wseq_find_op(addr, op_code, &wseq->ops);
> +
> +	/* If entry to update is not found, treat it as a new operation */
> +	if (!op_new) {
> +		op_end = cs_dsp_wseq_find_op(0, CS_DSP_WSEQ_END, &wseq->ops);
> +		if (!op_end) {
> +			cs_dsp_err(dsp, "Missing write sequence list terminator\n");
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
> +	ch = cs_dsp_chunk(words, sizeof(words));
> +	cs_dsp_chunk_write(&ch, 8, op_new->operation);

Nit: maybe a newline here?

> +	switch (op_code) {
> +	case CS_DSP_WSEQ_FULL:
> +		cs_dsp_chunk_write(&ch, 32, op_new->address);
> +		cs_dsp_chunk_write(&ch, 32, op_new->data);
> +		break;
> +	case CS_DSP_WSEQ_L16:
> +	case CS_DSP_WSEQ_H16:
> +		cs_dsp_chunk_write(&ch, 24, op_new->address);
> +		cs_dsp_chunk_write(&ch, 16, op_new->data);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		cs_dsp_err(dsp, "Op code not supported: %X\n", op_code);
> +		goto op_new_free;

There is no need to drop down and call devm_kfree() here; it's sufficient
to simply return -EINVAL. The devres core will free any instances of
cs_dsp_wseq_op when the driver is unbound.

I imagine you're calling devm_kfree() to protect against the case where
the driver successfully probes, but the contents of the firmware are found
to be invalid later. In that case, yes, this newly allocated memory will
persist throughout the length of the driver's life.

That's an error condition though; if it happens, the customer will surely
remove the module, correct the .wmfw or .bin file, then insert the module
again. All we need to do here is make sure that memory does not leak after
the module is removed, and device-managed allocation already handles this.

> +	}
> +
> +	new_op_size = cs_dsp_chunk_bytes(&ch);
> +
> +	if (!update) {
> +		if (wseq->ctl->len - op_end->offset < new_op_size) {
> +			cs_dsp_err(dsp, "Not enough memory in write sequence for entry\n");
> +			ret = -ENOMEM;
> +			goto op_new_free;

Same here. Maybe you want to return -E2BIG here so the caller can tell the
difference between there not being enough memory available to allocate a
new instance of cs_dsp_wseq_op, vs. one having already been allocated, but
not big enough.

> +		}
> +
> +		op_end->offset += new_op_size;
> +
> +		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
> +					      &op_end->data, sizeof(u32));
> +		if (ret)
> +			goto op_new_free;

And here; just return ret.

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

Here too. This clean-up avoids the rather unsightly design pattern of placing
a tear-down path after the function's primary return path.

> +
> +op_new_free:
> +	devm_kfree(dsp->dev, op_new);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_write, FW_CS_DSP);
> +
> +/**
> + * cs_dsp_wseq_multi_write() - Add or update multiple entries in the write sequence
> + * @dsp: Pointer to a DSP structure
> + * @wseq: Write sequence to write to
> + * @reg_seq: List of address-data pairs
> + * @num_regs: Number of address-data pairs
> + * @op_code: The types of operations of the new entries
> + * @update: If true, searches for the first entry in the write sequence with the same
> + * address and op code, and replaces it. If false, creates a new entry at the tail.
> + *
> + * This function calls cs_dsp_wseq_write() for multiple address-data pairs.
> + *
> + * Return: Zero for success, a negative number on error.
> + */
> +int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> +			    const struct reg_sequence *reg_seq, int num_regs,
> +			    u8 op_code, bool update)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < num_regs; i++) {
> +		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
> +					reg_seq[i].def, update, op_code);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;

This is absolutely a nit-pick, but in cs_dsp_wseq_init(), you use the pattern
of breaking on error and always returning ret; here you return on error. Both
are functionally equivalent but it would be nice to be consistent in terms of
style.

If you do opt to match cs_dsp_wseq_multi_write() to cs_dsp_wseq_init(), I do
think you'll need to initialize ret to zero here as well to avoid a compiler
warning for the num_regs = 0 case.

> +}
> +EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, FW_CS_DSP);
> +
>  MODULE_DESCRIPTION("Cirrus Logic DSP Support");
>  MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
> index 29cd11d5a3cf..cfeab75772f6 100644
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
> @@ -255,6 +265,24 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
>  
>  const char *cs_dsp_mem_region_name(unsigned int type);
>  
> +/**
> + * struct cs_dsp_wseq - Describes a write sequence
> + * @name:	Name of cs_dsp control
> + * @ctl:	Write sequence cs_dsp control
> + * @ops:	Operations contained within this write sequence
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
> 2.25.1
> 

Kind regards,
Jeff LaBundy

