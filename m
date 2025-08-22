Return-Path: <linux-input+bounces-14253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF86B30CDE
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 05:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0203AAA82DF
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 03:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A82826B764;
	Fri, 22 Aug 2025 03:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="TGTPPTur"
X-Original-To: linux-input@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013032.outbound.protection.outlook.com [40.107.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B811D432D;
	Fri, 22 Aug 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834494; cv=fail; b=NqSMAeBrD9lST0Y/mfKwMPe54hJjnaZNIsUgbeNpomuYm/y4b2P0fQL2fHKeKgm/6rXUQwuBFtEWg0PVyVgi9D7H0F+HSKBG8KTZ1foAD0REOMXiSdQCodfHegMJgOz3J2kYHYuuXytUCzuOA20epXHoPTFQg7j+aB3sVTu+e/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834494; c=relaxed/simple;
	bh=K07EH8Y5ON3TiFkurt7RL8B0vjyrbQJZVoTIndDBcmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jvmpauIoa2cl3mpLfITf0mDUtPrDOfKXHz/CZeAe3bbNpyLGY5GveD9z5n6vMZPhPPxU24raBT91AJVKQBha6CNWhlM0bo58khEvAt8wEhU41jpqnEpl0JqnAgexV6nnt+AFK0SS6oBD6T1pisQFwDJ1+BuKSyWVonw4zYaDeRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=TGTPPTur; arc=fail smtp.client-ip=40.107.44.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjwk9KnHGeMSw4aUbMmLOaWVFP8lwHvRPoZvQu+UF1ysYNk/hSt7nkWyLZp0aOmEqSC6g4moWMCDQ85HWbDpR48TErgMeoeyiJcqlNHqLOMWjYQDrSsSYD4kq24ud3vEtpO+b2bCY82EwTrJl2Pe/tEV6pCMGNMKIxKDlTjRbYk0YMcnc9ghTGg52+ACoKKlorwmGxpSdhY/XqXOjHms/NHyUu8mcuQV9Jvq7FXmwD8kTjMPAwNs5G0VMxmMYWHjx1t24oiTjcxUrmNCpFnCrpYgNFI7Vp0s2Qj1DDOlUD2cqnFn4D5c4YyJ4+l9WaFMapl+nbu/lPJEsM29FDuVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBMLNe71MfW/Pdb6CK+BC+HVnm7NuJ3k9J/9PCJfQgM=;
 b=K7ZsW5SqvUJPSxoSEgzm/UsJ0jrJcyGfVfjuwBD3BUtG8Oh4SpWpsXQbvEk/p4t9rete70W9tBSNCR/O6izWCmxHMMowE1yN9H+GIeMxNhNNRkQ9GvgKFfs7fuwTixNjkILaaKrio3MfTvj+I34XyCPkbnPsgvwmOoHxq+uXG9RnMXlldY9DLJOzlhhW9mhIkP93WEdXEiFvdccS6O16JLuEswsegiuPbTJCblBrIxea5xXICUxwc2Iz1bM41D1tyoNVTTCHrnH8jiSl3IVaYBb+zYZbOv6MSjagVAypA3cTDErq4ixbrZF+a7jLjfn4U1B6IvivtD1yJvADD+t78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBMLNe71MfW/Pdb6CK+BC+HVnm7NuJ3k9J/9PCJfQgM=;
 b=TGTPPTurZ7lS7lw6QwuikV6vKixrXLNV2mncmDZ9w6C5Ky3+exH4yAGr6Hnqf4PUlEsYmlNs9WoBHVgA+snijuncWHbqEgpSngG1USJMmsEpjp8W4yZ21+L6vPAXd7aw2jB6HLa2KzR5OvHHQzQedtisnyGSPU5w1D7WmzoPRgPciUndzZz0w7CODN9CmFHE+zeIw2S+xgMkFZUXQeldoRykS3Sv925Bd2xk/IertIDAjCbOY4rv0L3vRrxdsmzvARW4MLYt6A/XrT9n20kwi0go5cJQusermYOyUXxaGFULv8L9WhZ9e72ZX+OSOCF+bmoD/tTsjkXF5HQbKMvrHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5150.apcprd06.prod.outlook.com (2603:1096:400:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 03:48:07 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 03:48:06 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v2 1/2] Input: misc: Remove dev_err_probe() if error is -ENOMEM
Date: Fri, 22 Aug 2025 11:47:48 +0800
Message-Id: <20250822034751.244248-2-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822034751.244248-1-zhao.xichao@vivo.com>
References: <20250822034751.244248-1-zhao.xichao@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc6fe59-1b0b-4571-039d-08dde12eb3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KGgQdx/oUmED/v0Y+cWjv+Z1ZVE8zgJQqxyUlvAdD16NHgHhxHO2QqbMSZAS?=
 =?us-ascii?Q?xjMuJCmBM+tHSdHHoLNlzvO68pmdKQWjJs7JKpk6EBQCJJGs1OWSvbEGPnxs?=
 =?us-ascii?Q?xjwzwSNCpHotjVj6wqUek97wkkDDBZLkHx85flwMzcuOnimpHz7t0Lcm2s7O?=
 =?us-ascii?Q?PYr9UCNrPP8UGLP/S3PL3qAyIKFhus/lOWrCaGT1bMwjzJXMKLCc4yoS2U18?=
 =?us-ascii?Q?A42/JlGsXlb/qqyMcJBIY7FJ+0DmiD0ZYs1Zx3I/gYTXZew1h95QhYnlVYTT?=
 =?us-ascii?Q?ymYgLTuCpU9n+b+1YCycGWjt1nhFl2h3uJQZZHpJG8xFh2grB0GQcbmrWV8S?=
 =?us-ascii?Q?LniNc7P89pezfQ0BKXdzAiq4S74XxrvtC4MMOICJPwxUSD6bIfQ4JeMcyxwK?=
 =?us-ascii?Q?I9sKN2Njof4FIQoNsyJ3hRNqfm5OgtHlEN9LfQqV7wBl1YW7C8Up3KrDMClS?=
 =?us-ascii?Q?SBIRENbX/ZgwiAmieUAN2ht8oVJI7iLWmnHVQX5xR9AGPCF5PmCmlen2Qckp?=
 =?us-ascii?Q?5gUb6hSp9+ZhN1UDPkgco7mdfijzYjHz8gZX5zPklv0UkR+xIxxurqwBK1iR?=
 =?us-ascii?Q?B9H/57WGEFnYjqjElW8cQ0PdkOfTP7ko/iT1qA4g/q5fAkRmlbpiyJtrOysH?=
 =?us-ascii?Q?2G9P7fewcwF5X9JJLpfaOSHSlPVBQfDxDkWNrzI71LbBVHL/LG6mfFtsRaWz?=
 =?us-ascii?Q?/8/XD8a1b+SigH3hzs9t+BoOvQdkuT9aO/flpqUAPAPhoLuUYdqKC6GvRrXa?=
 =?us-ascii?Q?+Na+OkM15C2vIm6MkfBBfn468H8Eom4J0+KVxu4AtkHDFKMBEuNBMXUPz4Gt?=
 =?us-ascii?Q?wNjAYsZ+gGnuJnCSwtOiPfSUJg0laYGQW/FE7+ADWOaWR37cjm/Q1JeQC9jT?=
 =?us-ascii?Q?/c9tlODChG3i8FulCdUrBAoesUkKoRy+31at+TSYx5VnGM2XGDHRYXb+FLZA?=
 =?us-ascii?Q?JGn+1rE2U2fU07uN5/kDvvxd2nzqmAYLf8SqUlb8a1NVszcl5+Z534zDwFRL?=
 =?us-ascii?Q?26WqQLF36qfjLSqMVwd/5gTtHInqTwAeH7IIn6I3uWMJpObWEJu0wzAMJc/G?=
 =?us-ascii?Q?dJLRB2KyUkqfnUIYiVudXTdYMWFupFiD3wfD4ZsvmvEC81mCfICo5ImLAIMs?=
 =?us-ascii?Q?8tTy2zmZPV0wre7BWW3687MXcurISj2lNvpB7PcTScHKhsBNKLAQZWFpOifw?=
 =?us-ascii?Q?AWcVkimGogw/5nsiatCXl9IGutp1b/8BqXcnDoWG58/PIiXYq13z8QfLgUev?=
 =?us-ascii?Q?ETQ89D40tk/tn59FtIHqAhx9ATw+THzxDAwm1ecFEr8kJCEcWpG15LK+GlcJ?=
 =?us-ascii?Q?TtooIa/u1Lv4ykwkxIUhCUSDdzrgbNA+pjntQh8AQsh5DMhSC+Ycxz25ze74?=
 =?us-ascii?Q?lYf1Ypf5wFcXxA7HgvMyEa8nmSLKHo6K8UIDvGERPbsgTEikXBzOLU9TAko+?=
 =?us-ascii?Q?UzeWj8kYO63Yb+7VysfCr1ajzwun1S6cK9ICm1Tv7D9HnwybRjEzFP9M8GXa?=
 =?us-ascii?Q?N270qr/diqhCBIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XaBSUikXXfzOOClJZkjpgS9LupKTAj+DQX0aNAx4iJclCsbgkUB5MlrYQ9C9?=
 =?us-ascii?Q?eAadf/Uab8LzIc8WfR00ZwuzXuRTmnS5gJcOSwyFVsm5fDwhGb4+Ns4Q9tCa?=
 =?us-ascii?Q?F0iE2D1fzHtuIQyaYp5FXM0zdTIz/UU6hpdkRhWBv/jwmf8o3/ohKqnWGPw5?=
 =?us-ascii?Q?KErey0cAyYx+YkWDRMyXT/p/PJs1TzE0T3kRapkgfr9zbyHQmUq9BDJONFQ4?=
 =?us-ascii?Q?HYiUP1bxzbywQoPNGvQLlj4dXHaxA/RBhMok7J37ZEypTGSMOyVkrqciHZN/?=
 =?us-ascii?Q?uNwLXPZgSIX7j20MnyeOH00BoUl1VHLtmtOGLtOJG5zCl5tsBiWxV9KuKV0q?=
 =?us-ascii?Q?refyfnDktZSF6kr9OzCJwVVsHEvK9OoxckIP7Lz63gW/i7Ioa8iozML8+BYc?=
 =?us-ascii?Q?3VcKcZuwInIbFETrgS3j7SEyH75LAwqWI3amOQM+Fl9Gp+jc+Uv/mZASUhZt?=
 =?us-ascii?Q?ziJF8jcWdOEGxgFF+TokajyyG+w87bgL02yZXcsm8WxSDnmtND/tlcqNw5p+?=
 =?us-ascii?Q?IVcdSWRWBsIzs26AAK0PXw4m8elQJaAPoLJJ6AxpOY4SQ9OTtDX6wQpuuVxl?=
 =?us-ascii?Q?PSyXzYQS/P/KFTugYjaHn7UjNrQ9KPAoK/qLKpT2ELsZStHWgj4rsQyr8qbf?=
 =?us-ascii?Q?jy3i4n9yI8wPRP61rlqrtEciS867yc6BCNOF/ai5LocxUb2GsjAxuREEtqpY?=
 =?us-ascii?Q?mZDQ7m/i37HgesyOoti4NbEnuOf1j1VcoulaQfpXQb4/WEgOlDuSq1ylsQGa?=
 =?us-ascii?Q?Dkn2WvkrnYWbqqk9DZSi+FQZqzkvoXgAPgYgMLd+Vf86pA4tFH47+UnzaCB8?=
 =?us-ascii?Q?+51UalrU83ojoMC9L2R7TByI4IebnbTLBhAO/pWmGaJLZVWqF5tIARFD5Uhb?=
 =?us-ascii?Q?392X68oL08uAov8HeEfkMafsJvC2znhTLk7SYZNhESvF3fF2J1H18r9QJEUs?=
 =?us-ascii?Q?HGtW83jURKfLiKbDlWKOlB2Sp6nlqr5TPXr/tJ/3dTgQdF6q5AlXUPuYQcVk?=
 =?us-ascii?Q?vuz5NGfokbkbSdGgFYNJpUSH3RHxiz5fsAWTuOI1s7NNokjf4W9InTUDtxFG?=
 =?us-ascii?Q?0pBB0AmQMYLo0P6bQNSZmVCVfTqKzyFwJeo+2FavkcUfGLuG4aK6Eqe8AzUo?=
 =?us-ascii?Q?g3oEAQ4Uxz91bo9Z2cCrfDylKAhE19tnHC7nM0EvOSODcyYbJZpw0Q08Ixlg?=
 =?us-ascii?Q?dJuVQ5FHtTdDf2bQglsR2stooW0BgMLoVcFbZrgeoGo8sbh6kSEJrjHob48i?=
 =?us-ascii?Q?fb6rFoYGmRyLtCBRCULRSvpUTKtuKAuQznPau+kBxPFLX15wPwsl5YAPXiim?=
 =?us-ascii?Q?LsPQaOFOmow5spBy6PkbFy3B0YqNRPY8YpLngUkVhRK1+bJfNqYx1PZG/OrS?=
 =?us-ascii?Q?KH+5qe6mopPlWlcoKS7aee0ZuxnNcsgVyNRK7PDmI1Z61G8KAe08fuJs9vBc?=
 =?us-ascii?Q?ZkzEwBiiU9CEsWz46O8OmB5y0c5d3QmHMIYni1El+j0h3usWOWRqZCLqhqgl?=
 =?us-ascii?Q?35OOhvFiYp/HxZQEhXEiuVMsWBNfXQKXkzErZE8VFvmU9vSdkKY9AlDPyto5?=
 =?us-ascii?Q?uNQtFhu6inMSv0+fljVOrNiNuIvDc8n7t4B2CbZU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc6fe59-1b0b-4571-039d-08dde12eb3a8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:48:05.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSB4HFRUHEPRWD1t3ZUWww8SQdcQGcllvFkeWohwoS0TjhFi1cvPSqrwYMcH7dvfj3ifbZa84d7t1WoxPHrXxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5150

The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
Therefore, remove the useless call to dev_err_probe(), and just
return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/input/misc/qnap-mcu-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
index 76e62f0816c1..3be899bfc114 100644
--- a/drivers/input/misc/qnap-mcu-input.c
+++ b/drivers/input/misc/qnap-mcu-input.c
@@ -103,7 +103,7 @@ static int qnap_mcu_input_probe(struct platform_device *pdev)
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
+		return -ENOMEM;
 
 	idev->input = input;
 	idev->dev = dev;
-- 
2.34.1


