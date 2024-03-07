Return-Path: <linux-input+bounces-2274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932F38747AD
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 06:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B663B1C20F7B
	for <lists+linux-input@lfdr.de>; Thu,  7 Mar 2024 05:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68E77484;
	Thu,  7 Mar 2024 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="FvXg06gJ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2116.outbound.protection.outlook.com [40.107.100.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E063CF
	for <linux-input@vger.kernel.org>; Thu,  7 Mar 2024 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709790036; cv=fail; b=Ddcb+Ld2nCZHLAMCoxn/odS1UJ9Wrmh/gGHvHMVVC0HYls02Ao8GvrBnbefuDJrPQrSZ2+gTJNHhlbkyyrDOO94SyitAARx0MvMrbE0kgafv99rqN1Lvoz2vhaFkqqVZ6edF9ThKNLaTAB+rD/w/fb2f0yjCX6AZS45AlRldmlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709790036; c=relaxed/simple;
	bh=K+kMaK38Pp6RCc5fWrh6lvJOZ7zxApjXKtIp7ZfXvos=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uZ626Qk+s9WKwRtbKqvXwrD/tGi0KHy42cjr7XHcIpRZj/vkZQbkrOIaMj3v2yB1QCTVoSdZM+jmNjDfuTrrCq+6U93gb5D14/wXt+7oar+1lJpN+OBtD4A6SY9dyRNC6i2UxJPNZj7L2G41FaAIMym0RkEuPb6elxEbkXI8Lmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=FvXg06gJ; arc=fail smtp.client-ip=40.107.100.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ey76B7oXwJ9gPa4vPKlMJ50ZCv90T0bTP/5Emp7anSbHfZ68nRsDrbK5HSfs/WlFNiiE7mPg5xKBhrvDkQ0tK7DlolKvvof1H77uZtLz7bUpjEEGZYEjDwFYMAAosHUh7ZYCjXWGpRPoInluWwItoDrUB/NNkHMVHNKMogaOYI67wu30kI+8uqUJcIMcZago+sd5N+mqpGaFcRnd5XCtybvGmP78ObZJ+tbiAiZCosJ2ZSZCUdBn/wL2SBxJ1OAcx8kCcBEQJLHX9w20aBVGHS+zLxOWmS+hXqBVWfOcbnDCEzOIuN6YexuNP5syHqksV3y3SGQ2k/6ZI2D4/eA39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZSLJhrMjCbdJ7mV+xDE2uCZeCjmTsQ3+uk98ItNZHw=;
 b=NZY30hbKUmRjwS+5OfNUu9Bx2zP8zJyemfQj06xANvI+bCq7Dua7/rf0AxtjnZ4rK9humfTFRVIqGFYLQrRoh2VMwHx6Xb5Ase/jhw4eK8WziDfHMEYrjgV2Or7sE/7wrGWp1xeHP3iSzZQSWngfxq0c1UIa0xQQjJjDVz9/sRBm24cx079Gzr5MzPy9pc79JhvWaZvixKQqahDaptztlN5mmF+HHIZ+Z9GAlGJMQJdWcUyDIuV/dfLtEvbVYrRnlRadQcMp9nl/ffHcJu3khO58ZhQupo0qgMTOMePTFTx7vZ7JbIUlgKc3VglWMbO+l0rQ6Fmfos4cg6nHHOc/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZSLJhrMjCbdJ7mV+xDE2uCZeCjmTsQ3+uk98ItNZHw=;
 b=FvXg06gJUHtciVETiO8ToqUle0eWXamDAcgq0iZciWIJRbN80ytKZhoCLF3YcQE80Au0ZpWlTSiGiMezRR1ZpKgmanx1FowPdB/QfCa/hEezsQN7bEPJJ+mN4g0rY6tkBodS1A+WRcg3af4yHeNGkC+lHGwFq6RrFvnEWg7ESMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SA2PR08MB6666.namprd08.prod.outlook.com
 (2603:10b6:806:fa::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 05:40:31 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 05:40:31 +0000
Date: Wed, 6 Mar 2024 23:40:21 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: jeff@labundy.com, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [RESEND] Input: iqs7222 - add support for IQS7222D v1.1 and v1.2
Message-ID: <ZelTRYX3fenMQuhF@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SA2PR08MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c14b9f1-e15a-41d0-c278-08dc3e691a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	80ExZbMgFr+GOPtCPNQUbDeEoIiJ8lUTdfzY1JrILU51HxiVgXF6QfPNHlBGznu5LIS58NcUEnOQSjw2YBA8tVn3xkl7kdBAkU2sbTwh5cDJMAUqP8z21vLL2YEiKWFrMmpfS6R7Ity4vQ2t3VyurTloiIuIZH6/awNelDXuC+w6u3Pgl2DQ1aaIAkFWl+yUnMfNXHM6Jsz9HrqXqKtc8GNsETgtuVY9DVNcaLqSJopBeZqBqyasArkROMLCilqf2yBj3Q+chqdOSFsiyOH+vRt2FIwY/+y/q7WxNbooPA5/fCis2RG2+SZMlaM7qQTDc068g1bufqP7lbvhsY5+yJm0UOsaWzkHvww1L5+QmAmrWwl2WEo3FcLPgnAN6ERBm8xRMt4K6ypPbzJapwGGV/9BEX2MbEEfYENHoBnUhsVFmT9RD972U62zyq7J1iB3Mkr96xV/Uqp5auYF747mdh61c3DTiVCvbIecVFWEpheJ22xyGLxWEG/YvCfvrAEbyeTlRrCS5pe/AXvM7fgNWV+CTsczbgfUwEDprCTw3CjdA8klEINWmPEyog9wsVZvAs13q91zemw1EsneR0SkxJaEd4Kj3UyqzR+gvPaAPjcVzsFBLy+09oK6Nb9NkL0CCm8cdYEnA/Ou8bxw4C0uFPQGWdKDE01023B78GPNWj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zHebKpB7gqEvxPChlDepajcjOTOtcdBwQ+Gh5d/hMOYMj+N7NB8+KlfdiMWd?=
 =?us-ascii?Q?GOHfdpmNSG3ap5zVlCXZQE0VppLBQBHDmGnC5Dv9D3CkU2q9rPkeMLFyqyh4?=
 =?us-ascii?Q?2hFnsKyQ0YAJ3rAW+649yx5mtoJDH4Ob4oc7AZFhvA/2d4PK6YfAsXbCUFI7?=
 =?us-ascii?Q?yD/x4ZtdP0WfQ7CgFzbC2/SGXLGI0suzmJ4W6/aMXsn0Z3bbTU5F4MOKfLXR?=
 =?us-ascii?Q?aMBoLl0cn9o7kqgucc+Pe2FS9lchvUY2b7YlQer3SU9OmQV+AKrybqsouSaB?=
 =?us-ascii?Q?IVjliNRHTsdcVFUI6Y2YgbrSCiplbvd6qZ+olmV1HGM76wAiJiDdyvHU1rN6?=
 =?us-ascii?Q?LGADYcfyUJISGRsOl8+kKehx/v7bTgXh5w0n3/r2MkCb+9r3XTsG+gSfqB4R?=
 =?us-ascii?Q?WObWT1VKU+gEB6NMhqB6bHsE/u6vr3v5cqurH9i5U/QhqYsPOuUMbtcJqI2Q?=
 =?us-ascii?Q?I5nITwVP7OSXa34CQHlegLSyaY+/EI+k8imbQ3UbHH4dif2rcmmLl05x10Cf?=
 =?us-ascii?Q?y8BZJQp5uyw0cU9/b9i2RgvxC0e55oeHZFg+TGSF2JQyMtStRYt1FEUaWaF6?=
 =?us-ascii?Q?yBM6GHp9YG4vV8UxwXbDxx0H7/Fued+AbS0PbDuyxS9b1yUdKeBYzoMh+sQx?=
 =?us-ascii?Q?izglBct5PGfLQMoAxZ9GTcdK6LyCnCJ3UnkG/4MARc2d2cnMRMFid5oC8Ewv?=
 =?us-ascii?Q?o12fkcc3UJBScBhCbxJ4k27oTQCutKmEta59ht1cGqGYpJ3SqU0usTe2Tqc1?=
 =?us-ascii?Q?iJ4rp5P7wheWjkjZoq4hNiBfrivXDRtn4V1axs0kQX0WGk3s0kF/IVyCBDVE?=
 =?us-ascii?Q?FBW8grlW7CdG5ScE+zRqegF1NFfKFLkIA7kWsy/WHTgQPA+zyyeE2HjjH7KS?=
 =?us-ascii?Q?3I+yygdbZiHFthyMqxCuKNo2v8gxgwkjjXQhSqPtnz342TB9OCPpIHe42S1e?=
 =?us-ascii?Q?oJ5Zs6Xv2PjxTisEG4+hbFhnA0kZF/pG+1jl/5YKToHv31IhjzluT8qHnz+7?=
 =?us-ascii?Q?oCKZW/zBOrrQRrwt+JM16co/hcy41LJOS0mut5Vc7FeMLCLqkAYp51/kaJR5?=
 =?us-ascii?Q?L6tpFHPTqmX7AAQW3DV/W5eebyk3ilFhbvNM3WCtVkoWgV60yOoIOa5D7ALL?=
 =?us-ascii?Q?CRcRO2v0PV9D2aU7x71wDf3Lgv/Hz8I3R3BM98wKd4NlskO4xYshpVmUrHqI?=
 =?us-ascii?Q?vnT59yZ3VQMkKwszOOHHJm8DdHW2BiE23JWDC+1D93MpU1yu3ccVEVdM6hoK?=
 =?us-ascii?Q?gnMJvqPkh4W1Z8kWZSx3WcF1azhNvQ6Y1c2fXce5WjxPpEokDWqHrP2NnLAx?=
 =?us-ascii?Q?Ffkkvz4dMSTJHE3smOYZ8ULbUbtLLnfUlueanPVJzzbylCfvuCv5niW3zD0y?=
 =?us-ascii?Q?tZIRXuDvQQ9fYQojop8+4G4kyeWaVOBGPSLCYIbQRTEHfuWk8YZynDIiBzD0?=
 =?us-ascii?Q?5ARhsxgCq2RBCBL/GJ4uECYYju0TvMWi754VG6k5Hac6bpnWUfGYqAnvE5cu?=
 =?us-ascii?Q?yeqeyy5Zlby5eeB9vl7k0WFgwZaZQY294EwvV/M4FrZneF7i2Y3XfkUgDnlg?=
 =?us-ascii?Q?V0Bq48Hi2U/+vOvr3YQZAM6Ywdh4mpyxben++6xy?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c14b9f1-e15a-41d0-c278-08dc3e691a2d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 05:40:31.3186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE4qLzTJ9aPNWMmwlHpWjBO1CIoq6FoAM0NTU9qPTRB6YZqWUkDNG6yYYODbTVVVigwGuJLOWBU6KYnWMWauVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6666

The vendor has introduced two new revisions with slightly different
memory maps; update the driver to support them.

Fixes: dd24e202ac72 ("Input: iqs7222 - add support for Azoteq IQS7222D")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/misc/iqs7222.c | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
index 36aeeae77611..9ca5a743f19f 100644
--- a/drivers/input/misc/iqs7222.c
+++ b/drivers/input/misc/iqs7222.c
@@ -620,6 +620,118 @@ static const struct iqs7222_dev_desc iqs7222_devs[] = {
 			},
 		},
 	},
+	{
+		.prod_num = IQS7222_PROD_NUM_D,
+		.fw_major = 1,
+		.fw_minor = 2,
+		.touch_link = 1770,
+		.allow_offset = 9,
+		.event_offset = 10,
+		.comms_offset = 11,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 7,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 7,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8700,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 14,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 14,
+				.num_col = 4,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAE00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_TPAD] = {
+				.base = 0xB000,
+				.num_row = 1,
+				.num_col = 24,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 3,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 12,
+			},
+		},
+	},
+	{
+		.prod_num = IQS7222_PROD_NUM_D,
+		.fw_major = 1,
+		.fw_minor = 1,
+		.touch_link = 1774,
+		.allow_offset = 9,
+		.event_offset = 10,
+		.comms_offset = 11,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 7,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 7,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8700,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 14,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 14,
+				.num_col = 4,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAE00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_TPAD] = {
+				.base = 0xB000,
+				.num_row = 1,
+				.num_col = 24,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 3,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 12,
+			},
+		},
+	},
 	{
 		.prod_num = IQS7222_PROD_NUM_D,
 		.fw_major = 0,
-- 
2.34.1


