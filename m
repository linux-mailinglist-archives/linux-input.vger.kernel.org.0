Return-Path: <linux-input+bounces-13068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA0AE94AB
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 05:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D27E1C428BF
	for <lists+linux-input@lfdr.de>; Thu, 26 Jun 2025 03:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71961205E25;
	Thu, 26 Jun 2025 03:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="s1ohJq9J"
X-Original-To: linux-input@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012029.outbound.protection.outlook.com [52.101.126.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B781F1909;
	Thu, 26 Jun 2025 03:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909422; cv=fail; b=fZv0QZucKZ/uhqCMHQSZReO9QNK1puFPUo8M52O9Xa4N6dtveOLkCmBA90vjAbMqwlicKglritL0kBAypXE8uZkIAfEsyv1SFbhhCzTj0Dgye47DjwEg0gxLa6GmIHOTETu6nOqwJW8lmm2EqDVhHgyzRuXMmwFuU1CbiRgQWvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909422; c=relaxed/simple;
	bh=zxeiUMf2KlZQSChLF4vDVQhEM/gQtiw9GzwiNUSqfsc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9pjU6bjfJSuH9RJMZUF+Y1LeSt9aSd5vyJltWLKclj0cbIKg8LVMI6A7BKQNyBDVU/5AjIraoTeqTZxNypifdIvfi5MXbbTX7xT1XNH4E1rQZ0u8KKujg88eSixQrsL4qEJSMysleuu/OEZX24pnRdzmwKHbYMAwt+rnPiMyEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=s1ohJq9J; arc=fail smtp.client-ip=52.101.126.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhl5/gMRbAuQOVMDb8l1FF1puiTvk29VmEbKfzofIZLfXK5dKAxyUiVRzGRcuf0UkPUZpQ3LPp3iqqjhbwDHSDWcpEe8YMhPQCmNL8UVx1d8QOcAF4TcGpyBLEr4m6n10uCNGDeW08FF4lCnzkaHzXTkEmNNzS1w1KKxoO1qR493LnmyeYLMpjazVxjieRZcto74QWY7JzvGFfjX4SH0FaCm3YPktoTijfQzrOUII2T0cQTD8Xv+7fulGJWb3t82RpSEJrNCoRejOrQVKxKXSLtI6daN7Xe6x760Xay95xXRTvXKRJnuNVbFhuwL1URm/Q36OuY9b2eCIj7tH2YgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxeiUMf2KlZQSChLF4vDVQhEM/gQtiw9GzwiNUSqfsc=;
 b=kJ1BsE/Xt/t47JwDsiZiUOKF82NDW9G61eiVcx56Dg3guP4qYwQtiGZfhE5gfLlsRl7VBzvw58puG0Y5D123bq5Yb9wrYSgVJ+gFZx5y9AHRj4HztCerGF0A56qadSrW1A16kHEpv2GzyBolCLbHoLfamxEjnPTLrxPlK3banTn+yhvj+Q9oXZ1vAJrCoWBuD6CDYW/3HQk9IMlxSogr8oo5eOHyZX/09Yn6sBL40+aqmFKoWILIULhDkFjo8QpPfAKzVNLT0TrqrNyRmaeuRHrUBh1clPR9nKAqCVXmfhex0BeiftqIt7M3rUBqAOPVOL+E5B2y1XHi2Xx1SYabhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxeiUMf2KlZQSChLF4vDVQhEM/gQtiw9GzwiNUSqfsc=;
 b=s1ohJq9JtdIjXH2V9FNn0hANJvgIBAcX0CQ7Ru8rdZEPMOOOhCeB7sV2GbqCv2LUDrhVed/Ud14bcXPHK28wSOLY4pVVStInVR7n7DXBgsniL4maEOHFNENjJFmNb50OuXoPfyx3VIBgPYj89990JAAjEJw0L3D7HluDX5tSJ8Y=
Received: from TYAPR01CA0203.jpnprd01.prod.outlook.com (2603:1096:404:29::23)
 by JH0PR02MB7944.apcprd02.prod.outlook.com (2603:1096:990:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 03:43:35 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:404:29:cafe::a9) by TYAPR01CA0203.outlook.office365.com
 (2603:1096:404:29::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.31 via Frontend Transport; Thu,
 26 Jun 2025 03:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 03:43:32 +0000
Received: from PA80318969.adc.com (172.16.40.118) by mailappw30.adc.com
 (172.16.56.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 11:43:29 +0800
From: huangzaiyang <huangzaiyang@oppo.com>
To: <huangzaiyang@oppo.com>
CC: <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] <drivers/hid: Implement a battery status polling mechanism for selected input devices.>
Date: Thu, 26 Jun 2025 11:43:02 +0800
Message-ID: <20250626034302.5902-1-huangzaiyang@oppo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250624130836.5743-1-huangzaiyang@oppo.com>
References: <20250624130836.5743-1-huangzaiyang@oppo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|JH0PR02MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd8b4b6-dbe0-41d7-2179-08ddb4639fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxeBma78SWul15mbU1AAjywoGFiY6Qm2+XFxQljgkFmWS6h+UmHzgIEL3yzs?=
 =?us-ascii?Q?rcUi301MxqT6DAxlBMWjVw+dHjlvwzvu0qfiuGz8ixlZD5O7J9j6igWxsg1k?=
 =?us-ascii?Q?KAISIN97M8Fw0xBOSpv92NaHoXf+qt0eu6SEl4p2cqgpt1OqnIlwW8iKfk7c?=
 =?us-ascii?Q?4uMovnmK5maelabScScyXo+cm5m4X6tGFeRPBXV3Z9JDC7PneEdaecx6x2IU?=
 =?us-ascii?Q?qi2ZU+BVHHWsArIL7NuFc+8ssLQlr30VfQfKyVGMMmCeL48KTNF49O7yvLVt?=
 =?us-ascii?Q?le9fCT9V0Xc2Dpn7qQFv72Ki8oYTfU+sjY4ocfnDXhRl+GW6bFyF528NNOt2?=
 =?us-ascii?Q?Rs9jaFdUGx9c4+A46IY0FiXbki3Fqq7DB0CJ/5YrAw0BqpQh+Ey5uGTOERkn?=
 =?us-ascii?Q?4k60KuAu+Vx00ziWlQWr45HGewV0/UzttpMQnwq/+HNqWFE5TrTPEuwSjniV?=
 =?us-ascii?Q?Jd26r9GP52pMqITsHTBJ4GbsPXnVBV7wlzeS3rEspkYCscfATkGp3ULf4nW0?=
 =?us-ascii?Q?HGUknN/MuDtDo1Ev1ySHdz1gsAe6yVKkBjiIEXcaQD2zJMyV5UUsqqjURPCV?=
 =?us-ascii?Q?RJEaEB8wTp11DWbCX9GbHotObOImrGhJg1HCyI1VsxDGohaWAzt7P8lQp9Ae?=
 =?us-ascii?Q?aCWITwvYJN6nG5ft+5AAIWYq7A3NeBY3ECs/ATNLxe6AMCaNm4nYYFPcQ8Q3?=
 =?us-ascii?Q?SMbtOKg60+mqQ3DM7jBuf6I9TvoB2xiJd6X/bjOdrlhCUHa7/vjkGao89/kr?=
 =?us-ascii?Q?83ALASlA1t30D6OCQx2ZTlXzvYCztWqJNjCYxfKypQQ1WFgDtHLJS7M31Rmw?=
 =?us-ascii?Q?SZbR4yx2hJTK4s+8TNeNaA7KHTth3ZK0GO0DXwHoA+ZiiA6lzoXYoMCjIYLN?=
 =?us-ascii?Q?BEDMR7Awg2/pNvddfN9QXyxI2ZgGRKTN2kSmgDNBkBPYXMQeFR6hMYowM5Nx?=
 =?us-ascii?Q?b2mOM+g4f4UcFG/qD8KaaJ68gKJ+UQKpURebQbi7N+IGuZUBo4ad93U8TOHO?=
 =?us-ascii?Q?hAaQ9YahhCtn3ZgPXFtnWT4PbzzaKn5mS/69w+NrhokGYrSTjrGPgFd72u2F?=
 =?us-ascii?Q?3QYL86eyLffYrEmRG61cyT1FNBb+OEPaaivB+IboHaaop4WXKIfsPGZWRNe+?=
 =?us-ascii?Q?JX6osonBpcM/M617g6vWt88cWhBXfJsSo+t8WoMgteHrJNHwlrLalkjiWbcl?=
 =?us-ascii?Q?nfMJUuG0yoGZq/QoiUq8cFoIr4UQr3ulUoqZffS7GUjhjA9sbj/2oki0tTsX?=
 =?us-ascii?Q?1krQIUOLQmozEtA2oEyGTwARSOP8CboBFbCMbUF9iwGvYAWyu3S+0Xe6h5uo?=
 =?us-ascii?Q?If5aZDNEhzlDrJE8cp26RKCppk7q6nRYWfHEErPLf+vDPL9sOP/A82X/kyyx?=
 =?us-ascii?Q?KwmANNOkvcYwWwu2B8K2lMsMKHVXdJdrWcH6t2zcKkeS5iBHCyjxPmZW37Ut?=
 =?us-ascii?Q?2jB5hI80hI881uCLBezJawOHjMc3HwN+W8nlw7AdDJybc03EhkjThXIIoGYN?=
 =?us-ascii?Q?ncZ8/H8fHXOOdPFNGLD88ARGmzhtoJIqCZeR?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:43:32.8237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd8b4b6-dbe0-41d7-2179-08ddb4639fad
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7944

Hi all,

I submitted this patch a few days ago but haven=E2=80=99t received any feed=
back yet.
I=E2=80=99d really appreciate it if someone could take a look and let me kn=
ow if there are any suggestions or concerns.

Thanks in advance!

Best regards,
Joyyoung Huang
________________________________
OPPO

=E6=9C=AC=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=
=BB=B6=E5=90=AB=E6=9C=89OPPO=E5=85=AC=E5=8F=B8=E7=9A=84=E4=BF=9D=E5=AF=86=
=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E9=99=90=E4=BA=8E=E9=82=AE=E4=BB=B6=E6=
=8C=87=E6=98=8E=E7=9A=84=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=88=E5=8C=85=E5=90=
=AB=E4=B8=AA=E4=BA=BA=E5=8F=8A=E7=BE=A4=E7=BB=84=EF=BC=89=E4=BD=BF=E7=94=A8=
=E3=80=82=E7=A6=81=E6=AD=A2=E4=BB=BB=E4=BD=95=E4=BA=BA=E5=9C=A8=E6=9C=AA=E7=
=BB=8F=E6=8E=88=E6=9D=83=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=E4=BB=A5=E4=BB=
=BB=E4=BD=95=E5=BD=A2=E5=BC=8F=E4=BD=BF=E7=94=A8=E3=80=82=E5=A6=82=E6=9E=9C=
=E6=82=A8=E9=94=99=E6=94=B6=E4=BA=86=E6=9C=AC=E9=82=AE=E4=BB=B6=EF=BC=8C=E5=
=88=87=E5=8B=BF=E4=BC=A0=E6=92=AD=E3=80=81=E5=88=86=E5=8F=91=E3=80=81=E5=A4=
=8D=E5=88=B6=E3=80=81=E5=8D=B0=E5=88=B7=E6=88=96=E4=BD=BF=E7=94=A8=E6=9C=AC=
=E9=82=AE=E4=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E9=83=A8=E5=88=86=E6=88=96=E5=
=85=B6=E6=89=80=E8=BD=BD=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=EF=BC=
=8C=E5=B9=B6=E8=AF=B7=E7=AB=8B=E5=8D=B3=E4=BB=A5=E7=94=B5=E5=AD=90=E9=82=AE=
=E4=BB=B6=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=B9=B6=E5=88=A0=E9=
=99=A4=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E3=80=
=82
=E7=BD=91=E7=BB=9C=E9=80=9A=E8=AE=AF=E5=9B=BA=E6=9C=89=E7=BC=BA=E9=99=B7=E5=
=8F=AF=E8=83=BD=E5=AF=BC=E8=87=B4=E9=82=AE=E4=BB=B6=E8=A2=AB=E6=88=AA=E7=95=
=99=E3=80=81=E4=BF=AE=E6=94=B9=E3=80=81=E4=B8=A2=E5=A4=B1=E3=80=81=E7=A0=B4=
=E5=9D=8F=E6=88=96=E5=8C=85=E5=90=AB=E8=AE=A1=E7=AE=97=E6=9C=BA=E7=97=85=E6=
=AF=92=E7=AD=89=E4=B8=8D=E5=AE=89=E5=85=A8=E6=83=85=E5=86=B5=EF=BC=8COPPO=
=E5=AF=B9=E6=AD=A4=E7=B1=BB=E9=94=99=E8=AF=AF=E6=88=96=E9=81=97=E6=BC=8F=E8=
=80=8C=E5=BC=95=E8=87=B4=E4=B9=8B=E4=BB=BB=E4=BD=95=E6=8D=9F=E5=A4=B1=E6=A6=
=82=E4=B8=8D=E6=89=BF=E6=8B=85=E8=B4=A3=E4=BB=BB=E5=B9=B6=E4=BF=9D=E7=95=99=
=E4=B8=8E=E6=9C=AC=E9=82=AE=E4=BB=B6=E7=9B=B8=E5=85=B3=E4=B9=8B=E4=B8=80=E5=
=88=87=E6=9D=83=E5=88=A9=E3=80=82
=E9=99=A4=E9=9D=9E=E6=98=8E=E7=A1=AE=E8=AF=B4=E6=98=8E=EF=BC=8C=E6=9C=AC=E9=
=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E6=97=A0=E6=84=8F=E4=BD=
=9C=E4=B8=BA=E5=9C=A8=E4=BB=BB=E4=BD=95=E5=9B=BD=E5=AE=B6=E6=88=96=E5=9C=B0=
=E5=8C=BA=E4=B9=8B=E8=A6=81=E7=BA=A6=E3=80=81=E6=8B=9B=E6=8F=BD=E6=88=96=E6=
=89=BF=E8=AF=BA=EF=BC=8C=E4=BA=A6=E6=97=A0=E6=84=8F=E4=BD=9C=E4=B8=BA=E4=BB=
=BB=E4=BD=95=E4=BA=A4=E6=98=93=E6=88=96=E5=90=88=E5=90=8C=E4=B9=8B=E6=AD=A3=
=E5=BC=8F=E7=A1=AE=E8=AE=A4=E3=80=82 =E5=8F=91=E4=BB=B6=E4=BA=BA=E3=80=81=
=E5=85=B6=E6=89=80=E5=B1=9E=E6=9C=BA=E6=9E=84=E6=88=96=E6=89=80=E5=B1=9E=E6=
=9C=BA=E6=9E=84=E4=B9=8B=E5=85=B3=E8=81=94=E6=9C=BA=E6=9E=84=E6=88=96=E4=BB=
=BB=E4=BD=95=E4=B8=8A=E8=BF=B0=E6=9C=BA=E6=9E=84=E4=B9=8B=E8=82=A1=E4=B8=9C=
=E3=80=81=E8=91=A3=E4=BA=8B=E3=80=81=E9=AB=98=E7=BA=A7=E7=AE=A1=E7=90=86=E4=
=BA=BA=E5=91=98=E3=80=81=E5=91=98=E5=B7=A5=E6=88=96=E5=85=B6=E4=BB=96=E4=BB=
=BB=E4=BD=95=E4=BA=BA=EF=BC=88=E4=BB=A5=E4=B8=8B=E7=A7=B0=E2=80=9C=E5=8F=91=
=E4=BB=B6=E4=BA=BA=E2=80=9D=E6=88=96=E2=80=9COPPO=E2=80=9D=EF=BC=89=E4=B8=
=8D=E5=9B=A0=E6=9C=AC=E9=82=AE=E4=BB=B6=E4=B9=8B=E8=AF=AF=E9=80=81=E8=80=8C=
=E6=94=BE=E5=BC=83=E5=85=B6=E6=89=80=E4=BA=AB=E4=B9=8B=E4=BB=BB=E4=BD=95=E6=
=9D=83=E5=88=A9=EF=BC=8C=E4=BA=A6=E4=B8=8D=E5=AF=B9=E5=9B=A0=E6=95=85=E6=84=
=8F=E6=88=96=E8=BF=87=E5=A4=B1=E4=BD=BF=E7=94=A8=E8=AF=A5=E7=AD=89=E4=BF=A1=
=E6=81=AF=E8=80=8C=E5=BC=95=E5=8F=91=E6=88=96=E5=8F=AF=E8=83=BD=E5=BC=95=E5=
=8F=91=E7=9A=84=E6=8D=9F=E5=A4=B1=E6=89=BF=E6=8B=85=E4=BB=BB=E4=BD=95=E8=B4=
=A3=E4=BB=BB=E3=80=82
=E6=96=87=E5=8C=96=E5=B7=AE=E5=BC=82=E6=8A=AB=E9=9C=B2=EF=BC=9A=E5=9B=A0=E5=
=85=A8=E7=90=83=E6=96=87=E5=8C=96=E5=B7=AE=E5=BC=82=E5=BD=B1=E5=93=8D=EF=BC=
=8C=E5=8D=95=E7=BA=AF=E4=BB=A5YES\OK=E6=88=96=E5=85=B6=E4=BB=96=E7=AE=80=E5=
=8D=95=E8=AF=8D=E6=B1=87=E7=9A=84=E5=9B=9E=E5=A4=8D=E5=B9=B6=E4=B8=8D=E6=9E=
=84=E6=88=90=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=AF=B9=E4=BB=BB=E4=BD=95=E4=BA=A4=
=E6=98=93=E6=88=96=E5=90=88=E5=90=8C=E4=B9=8B=E6=AD=A3=E5=BC=8F=E7=A1=AE=E8=
=AE=A4=E6=88=96=E6=8E=A5=E5=8F=97=EF=BC=8C=E8=AF=B7=E4=B8=8E=E5=8F=91=E4=BB=
=B6=E4=BA=BA=E5=86=8D=E6=AC=A1=E7=A1=AE=E8=AE=A4=E4=BB=A5=E8=8E=B7=E5=BE=97=
=E6=98=8E=E7=A1=AE=E4=B9=A6=E9=9D=A2=E6=84=8F=E8=A7=81=E3=80=82=E5=8F=91=E4=
=BB=B6=E4=BA=BA=E4=B8=8D=E5=AF=B9=E4=BB=BB=E4=BD=95=E5=8F=97=E6=96=87=E5=8C=
=96=E5=B7=AE=E5=BC=82=E5=BD=B1=E5=93=8D=E8=80=8C=E5=AF=BC=E8=87=B4=E6=95=85=
=E6=84=8F=E6=88=96=E9=94=99=E8=AF=AF=E4=BD=BF=E7=94=A8=E8=AF=A5=E7=AD=89=E4=
=BF=A1=E6=81=AF=E6=89=80=E9=80=A0=E6=88=90=E7=9A=84=E4=BB=BB=E4=BD=95=E7=9B=
=B4=E6=8E=A5=E6=88=96=E9=97=B4=E6=8E=A5=E6=8D=9F=E5=AE=B3=E6=89=BF=E6=8B=85=
=E8=B4=A3=E4=BB=BB=E3=80=82
This e-mail and its attachments contain confidential information from OPPO,=
 which is intended only for the person or entity whose address is listed ab=
ove. Any use of the information contained herein in any way (including, but=
 not limited to, total or partial disclosure, reproduction, or disseminatio=
n) by persons other than the intended recipient(s) is prohibited. If you ar=
e not the intended recipient, please do not read, copy, distribute, or use =
this information. If you have received this transmission in error, please n=
otify the sender immediately by reply e-mail and then delete this message.
Electronic communications may contain computer viruses or other defects inh=
erently, may not be accurately and/or timely transmitted to other systems, =
or may be intercepted, modified ,delayed, deleted or interfered. OPPO shall=
 not be liable for any damages that arise or may arise from such matter and=
 reserves all rights in connection with the email.
Unless expressly stated, this e-mail and its attachments are provided witho=
ut any warranty, acceptance or promise of any kind in any country or region=
, nor constitute a formal confirmation or acceptance of any transaction or =
contract. The sender, together with its affiliates or any shareholder, dire=
ctor, officer, employee or any other person of any such institution (herein=
after referred to as "sender" or "OPPO") does not waive any rights and shal=
l not be liable for any damages that arise or may arise from the intentiona=
l or negligent use of such information.
Cultural Differences Disclosure: Due to global cultural differences, any re=
ply with only YES\OK or other simple words does not constitute any confirma=
tion or acceptance of any transaction or contract, please confirm with the =
sender again to ensure clear opinion in written form. The sender shall not =
be responsible for any direct or indirect damages resulting from the intent=
ional or misuse of such information.

