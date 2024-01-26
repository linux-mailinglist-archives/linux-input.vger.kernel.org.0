Return-Path: <linux-input+bounces-1479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416F83D34C
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 05:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298321C229EB
	for <lists+linux-input@lfdr.de>; Fri, 26 Jan 2024 04:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF098BEB;
	Fri, 26 Jan 2024 04:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="nRnQw3bO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2AB658
	for <linux-input@vger.kernel.org>; Fri, 26 Jan 2024 04:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706241744; cv=fail; b=NDojBefSXuohJMez5Le+dvG4Yb5O2ZPVmqHIGTssfzoQxLX5kJA/Yn5P5yUzfs+gqAnmsIRvfac7aWzuHOuIoYeAWUjrkoZk5lzZu7Z8li20LrugguQ+pCdrso/3SfTAw1fv5wM7rYZ48v6EeWuNxRqMHwpJfCKRP3plqxzjdNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706241744; c=relaxed/simple;
	bh=K+kMaK38Pp6RCc5fWrh6lvJOZ7zxApjXKtIp7ZfXvos=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n02BS3jhZDScFXG/HKk20jKWZOjlmxmteyryJrm1rDB83yqfLun8o+LqbYLQ/kGJFHC7GWSOxCIO1dmeJ6c/g0DoNBUp7NFmk3w4dIfx05ngz41aDgjCEHFaSY/4Afk7C2W7b5wpnr88bc9G+Ft2aX1XLZtYs9iy+y+stOWxQNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=nRnQw3bO; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngZLhtGAeJtLlX8ILpZPxTMiWud4q27pAktJJVyxS8lgrL+XsRrMsNillcU6ieDlZXVN3u0QDGiNFAu7mjpk1/CMPQYOdVheE25r9YYrhTMehejZnkHGFbhPBv7LHPzWZTiKW25blhmNw4h2IvsGEIgq26NfC+4NFG//Zp2QIafC4vLwTHFyySuSCrHd2gPistzyDGupP3Ox14CCXP53zfzOAQRr0kLwDg3smaPadZwFhM0Mp5Du7Mf5kFrCEhSQe1KSjTVrArG49o60H55C4EKRJAvbtx5zwz1MepscsWwByd+bJvxNLZWLjUuLgs2gBJpMAVbMGBN3GUky+VaotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZSLJhrMjCbdJ7mV+xDE2uCZeCjmTsQ3+uk98ItNZHw=;
 b=iZ9OP6ui1bZJwfwdEwikoZ68xWrftpesoZntLxAFj1KBXjE2pBTioozZI4t/+FAtGFSqTDut74I1UQWfML+whowKETzhrS18Ft80E4vV8ZeLxUItbH5hwZi9NQwwt2ErO9kOHvJOMvbPja0IAeXU6uz3fYr+W4UyymcHncHnb2A+ShG/OaUQBabEbReNRgOvdpRsgRE0nxqkTAUrDzbzVCA1K3SStP3kss9yf24HOcNi8nDpCg+4ijKkW2dLRlUcxbuaARUxchLc4azBSzqFkyYNEk1m1wxJSrepPQOgk8vKURpICQFyYYXz02WxrbjXH73POGvV6VKdG3EI/uqlKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZSLJhrMjCbdJ7mV+xDE2uCZeCjmTsQ3+uk98ItNZHw=;
 b=nRnQw3bO3RVHLRfQAJCpOxSxMBbeNvgmNPNq0nDLSZVDFPbjZZFX0suw0bNRxJXDdaF84ZF+CMGUOLykZ8ie7VHk9+lJvIxbkH0f/taURjRIv7RLsdJyOi6YK6cNXixukt/EeiBcZSeqARZ/9ra7jI7lC/CEB4n4bis4STpD9UM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by SA2PR08MB6761.namprd08.prod.outlook.com (2603:10b6:806:f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 04:02:20 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::6965:e04:a3ec:9177]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::6965:e04:a3ec:9177%7]) with mapi id 15.20.7228.009; Fri, 26 Jan 2024
 04:02:20 +0000
Date: Thu, 25 Jan 2024 22:02:15 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH] Input: iqs7222 - add support for IQS7222D v1.1 and v1.2
Message-ID: <ZbMux0sns6wSwfH9@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DS7PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::26) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|SA2PR08MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: e11f8777-358b-4b3f-2953-08dc1e2397e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6l0+ChKn2dn92/+Ui6iPvPUzVfmIz1qwhCXmDBUnh/ydNgKSfwfUZG7kzrGrKFSKBG2PmroeZ1Y1BVnCGSQTn3LUe72EchX+FFns4J6f8LwW9bf2M8nc3b0BYJUarbXqbXwiu8jwt3tXinGHF4/uPayJnAkHFzGHHqVhzsKHK5y6qxQG/zw3wBtTIbwU+Tbtl79NwgpaPfgw5edziH6yNPV/zdAWZ4wRJSiwpjIa0OFPts3pfOn9KtEVtg2kldM/1/tMEyI2GHzNsIo4uBm9WoTYa3VbBGQcEbMvFwaS5038yUPytFEBFjerFBuqjYJHk8Shek6ztwAoYcmitVu1ofcGvjy00XxqbtmxrdnFbfSe+QvuMOi7VIwkYydxn7ctyzY/6zLcx6LByftgBT6Iq4UVyLGn+tNLCWLfxgbRneF7yJ1gHGRx3kECB65jpPN3MuHarA4i/EIAXV1qAzB0/MK75hVc/FObQAV9pFBfjFLspwTxquPYyVGRFJevzLXXm/wjJOfQe2aVW9uItXNx6t5pV6Sb5o26gi3n/JN95oiaNz/AEWw6X5qfy3S+AI3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(39830400003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(26005)(86362001)(107886003)(5660300002)(4326008)(38100700002)(8936002)(33716001)(66946007)(66476007)(9686003)(6512007)(6916009)(66556008)(8676002)(6506007)(6486002)(316002)(6666004)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MMU8HB2f5HA/eG7TMWUHzlo/yz35dMXwGerrs6ZzqbtPCfzhzzLBU0f9bI9f?=
 =?us-ascii?Q?WKAV+Z4VNuzh+7nYT/bab4zc2ryJM9Gvqc75OOwG2YyTI0i/b2AVedwhduFt?=
 =?us-ascii?Q?30Pe/1WrCpcj9tB5RH5tOycEtzXALGeXaiskrFAaOz2Lnj6OgEeEx08datjL?=
 =?us-ascii?Q?u6Pd0TVwAftfYapVTH7q7ZpT4HRGcbsumvroTkv/3SIWSrBCgnRl/fFmpy2a?=
 =?us-ascii?Q?CsMxtfJ74W8X6XTH5ULS+KMgUv1XiQqHqc93tK8cGGxob8nixndkX0CUlG67?=
 =?us-ascii?Q?UsqNjVQNh+5jUfMeHp+8lY/VXxqmWV7SJUYMPwfuSPblcehj2rhYuOrDnwH0?=
 =?us-ascii?Q?psVMq2LDhB1qV7uaDPEdnfezn0TJ7LavvRjc73zJp9WwueiQQvCyTtYVNZc4?=
 =?us-ascii?Q?6C0XcN30rit3mejZKo+7bOpjJgKleAmh96zXFCQtCAuIfLUkyemmOAAo06XY?=
 =?us-ascii?Q?/a4Yaov2x5iFxqDYS7qyYqJPfx9O+yAbS7wB0A/8RZjtQJyHbN4D+0XLtGH5?=
 =?us-ascii?Q?crfUjWIPKL8uGtVu+To2W2qWgZlkB7zYkGzBJXH1wO1upv+KxD70ou9+6Bh8?=
 =?us-ascii?Q?anKM5OebX3FtHLjwziWA7a6XAjRK28NkOxO/GdQh1aaJ348iyH8m/ZANJzaA?=
 =?us-ascii?Q?i6w2R+jIVb79S8/0aMg2RSga0e/GDZJQAaO/EQ7+UAr1bVZUaCjaXT8SCr+n?=
 =?us-ascii?Q?DQTnmz7FfsS671D6I/mf5dpme5373MuPH+i5y0TRK2CscSSVfzYZ2sgMwRee?=
 =?us-ascii?Q?tw325Z2h2pjVJXH44hQKfJ3kp0dco8JBNCgWQAhzbTG9olKVdC28DybGsviC?=
 =?us-ascii?Q?XTq/0NOA0bkkfCHUnaFaiwCOkO1vAUjFXtBKXMydYx9v8O8iv2vNnukohr5v?=
 =?us-ascii?Q?SB7T3KYTnoUvL+yrQhkhwJSiZb6GzFOneCUTgagpTudjjqOr/RenYkxN9QYw?=
 =?us-ascii?Q?pYhVcH+RGyRlL41NH6gB3/C6r+4CpxT+qZkcR1x/WVo9nb1XLAVN0UKg1Wk2?=
 =?us-ascii?Q?9Ty74T7VjpH+d8qsDVw9kynDWd3SpyYKOckn+XSB8jB6+hwY/VF+FfG7iNlr?=
 =?us-ascii?Q?fzJIeufgU8gS/btxh2C9qAQiMyowoFN8QiOzjyX8Zk7RSbZoy2quRueftCEs?=
 =?us-ascii?Q?RRs/GiAEBgHuBh4QLss5580PJDd0brcZzrOXqi+RQV2cM9caZgO85HJt9ShD?=
 =?us-ascii?Q?DpfwlIc9XDeAJOk4yO5+ehdgyyDB+40GK/gyZFzrwaGn0EZ7K/nCBcutwQ4p?=
 =?us-ascii?Q?RMByxyjoMEGYEXGKXWz6wIjF2BxPjl7LWzIM23Ndh+DNhtxRJpgmujFTFJya?=
 =?us-ascii?Q?a2ce13J5v34VCLhBVAtAZoDmsz/jm1lJy5W8DV46Y4CnaxhH++mjLkNe2OQb?=
 =?us-ascii?Q?6hby0xO7WlxqfO7yk7YP/kCdXFIEbLe2TlS1C3rlvoCCEm5BQ2CgTDN6x+qU?=
 =?us-ascii?Q?Nf9OlKM1qnuCYzEvQG0C7Or9h8jxPE/jyXj1ybiZVtLDVaj+1l58Sc3acLsw?=
 =?us-ascii?Q?Qm1vdUyTVfpzyIUjclA+HUlpYqHOME6LBjk4Z1MSbhEP8vydqIIjdG33AdHp?=
 =?us-ascii?Q?nih9/4BfKZOIlxViMfW5D/22KTmEQo1MuDriy7g6?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11f8777-358b-4b3f-2953-08dc1e2397e8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 04:02:20.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LUC1mWrXUBNsGQZaMp2fc9M1aAJv6AgVHp6aRddY04LsJ+0Pokcs0QWnrbPN+4EbTfeoLQ7HBsdLOe5bbe/MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6761

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


