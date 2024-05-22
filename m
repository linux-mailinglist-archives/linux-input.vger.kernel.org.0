Return-Path: <linux-input+bounces-3769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F194A8CBEE9
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 12:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675251F22E43
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387DF7E572;
	Wed, 22 May 2024 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="REh5uMJS"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3600717BB5;
	Wed, 22 May 2024 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716372245; cv=fail; b=Tl2y3WGBH6TvyFp0X8C7wqwzUloC4GFDLEXXvexYyxFnwBTfMVWHCZObqAB9MeM/VgSRGibz+amRb90vu7HNudQptULgCQnTS2hvKntBTsUPYgScrcYvztRLhOPTNNxDfKcOMsSZXHPs8moVKkkHZZ51H9c3JhaFlXo4OZlrSc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716372245; c=relaxed/simple;
	bh=+5nz+5dEoPkMwk4ei0SQmOGZ0jbcb9kDRJovmb5ZwD8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EEgaJdx3R3lVHB5oZboDBRSFebhT3dIKsxSlIXg9iaq/lg1riBIaKoCgOC1bF93IJu/5oHQChrjNXBWtR8/hMqBt+1yFZfdIqj3Cs4ziaUycI9YfSYXqfQsa+JZ4AbYrmfMx/MZvToxoi0mAJRd0ZEZt/MIuAdjsGy7wuJq3mBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=REh5uMJS; arc=fail smtp.client-ip=40.107.92.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwGFW+NAFfw8SV8cxN/hzdAYD9UA/REsCV9826OYx+HFA/ZuEWiEWLtsG5f6hG25322VngfPPGwWIPpfiK2WOyLkOOi6yJe/J1BIgtDV0/Th50h3NdEAPrIO7Oq0+1wbasPnzFDV19yrR+NKfcJWPX1+OndinMDUV+ZsvnmwiBQ/vmiLiZxPRe6hbBh4h6n0z7iQ5V0tRwcI4IimBVhK2iGANitwMWpLBLnGP/U+dEt8OATd+iZzDEXXQUKCnLISxcKu4o+iwKSJyn+/0crMWbXJjzVrkNxkDIwLPIvAbetWVcoxtgEF40q1Pm7HL+xO/RMSaANeYoDhhHanOvmJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmvZbOVDpKx4wbqBFCU69NJDtrdZlwlyLtwIhAeems4=;
 b=SZ8/uf449EX8jnzxNIFc56l4+XnNA7Ry+5NAs39i7crvITiB8i5DJOQJi6ttP0idG0zhgVgIoe/AV15OKqZqAZRIYU0MR1R/AaF9riGr7Nsp08oGdi8PZsqrYq1Iurg2roWjC7SCj2NdV2ChIXJePZxOb7dQ7rqYf7AQiQNNJltNMxAWKpZ+YPf5E8Q2mhgyXNRvQTSSofa5hmbq/xG93c/xgtGi34plVuGEaZgL0azlPX4pLhfgiukN+6CU9u+WoVcYe/WOzwxO/6BbvYcphhmPfdH0QoB18D4712Q4kegj+3nBhwP5wa8GhMRldhwT7AdugqSFkmFa5xD56fjx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmvZbOVDpKx4wbqBFCU69NJDtrdZlwlyLtwIhAeems4=;
 b=REh5uMJST/Fm1nHhGuFqkUHrTS2fNkNX0ficCH/9I8UIa4opun8vEzfcgGzswTTYJ3kLe95f8fMvv8gGSIYSgNk9uvlf/atemFULkLSd8A6tEHcCZwWXFy3jHuHH/bttOags5n7QN3PvGFN/BvBRMHsoQ7V4dA2OI/O8chpGdlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SA2PR08MB6730.namprd08.prod.outlook.com (2603:10b6:806:118::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 10:04:00 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 10:03:59 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-input@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: ili210x - fix ili251x_read_touch_data() return value
Date: Wed, 22 May 2024 11:03:41 +0100
Message-ID: <20240522100341.1650842-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::6) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SA2PR08MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd9bd44-4b61-409c-8059-08dc7a468011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nx20lxZ9PofmzERqU3t/e7gBT/D+YUfsAlZQdCzfMijRuIyB9HfBcvu1JIHH?=
 =?us-ascii?Q?jx+HeIMl8IF1GBrItZ7hWDIEON8ggQ9alFL4GoySjrS929vxPSgrwkAPw3kl?=
 =?us-ascii?Q?eO5//ZRTUA0XNXeZehxS9KtuXqrq/f1h/cwMHzhLoBJNArh8GRZkzYZ58H44?=
 =?us-ascii?Q?lhf4kpibZCmxf6dE7FzR4YBCiBkRZzFiGkKheVDrb/DbWnOspR3JfhqERqZ5?=
 =?us-ascii?Q?Ml93gBd+V0+VYxpKAC0cXFEvJkbHtUNBy4EEFAGFTmJqsn6gmX2PIDJyxBcC?=
 =?us-ascii?Q?8Ove2LSvt1GGEyW6FaaPZrzIeh6PDprioksgic+32AIn17nxXKTdn6Mwotql?=
 =?us-ascii?Q?VSQhWlAjaH2kC8G6JpRWBJEChVDV+D1Z6nP23xaL2InaE6VgM2WU1yN5JEcI?=
 =?us-ascii?Q?/P+eBER8JJg7sYABoRWNQW5mkhH2n5LAxiH++VhFmISlC8/KWZak87NqtjQ9?=
 =?us-ascii?Q?/0Avy1FpXxhycIMBjOQwkLVQfhGq6KuzgiyZ2XWcxnGVOIkzbTYtWPAUX0NP?=
 =?us-ascii?Q?bF9XBKYpo1ZK+LlwAW7wNVRelxr50rySyuMr5MQONqQc1mT37UeUQnll3uhv?=
 =?us-ascii?Q?7ta0LXE1AH/3xNP1Ytlnw7xNkRhz5upKn4/rQ82n28AvvzKzAllbSF+u3Int?=
 =?us-ascii?Q?bd3zA6W4WhM+s58fh0XN3J4F41WZBgGedMRkrgpBzXQcwvAeXDgRMPrJiXBk?=
 =?us-ascii?Q?XjIPV7EiDv006UWcMWjFx/0hb62GtRPJX6CgsNQUVpplR3eNOzCR+7lHGu57?=
 =?us-ascii?Q?DgWbTXkYREsUQCaZPEWU9Kyv5jnQSER9l0fuQ1zDY2C/dG6iS0H1wKfdQ1wx?=
 =?us-ascii?Q?23lIc3XhjBK/Pr9I/pJSog7N5za8nIa9Xi8KEb87ojLPhsVbdmrlbs8LpoZT?=
 =?us-ascii?Q?z+gn4TqKIBJgXmfkvJpN8LG0wKCXm1uIgBJwbJmAXjn3zWJVmN78fgm52/yM?=
 =?us-ascii?Q?RB66NG2FVXbUa6uChcALyHKq74VeBOg27T7EM/gkuuqrjkXp/J25EOSYKnx/?=
 =?us-ascii?Q?7V8CukLBBFJ5JbTlu1D2N44sZSiCxm26lYCt0L3Dw/UxK1OzQYSfl4nZA5sF?=
 =?us-ascii?Q?SN5o9CEjIoXocRmn4Zcy3cgK6HFssiJSVI4nFJs2Is0iw1hgYewsYm1OsH13?=
 =?us-ascii?Q?fYH2f04xztIrhnnc1E5IlORHgkIAMyGKoIJyVTiQ16ajH+RyS3Unz8JMq6ET?=
 =?us-ascii?Q?erGJAqqxTEmkhTmEhPqyvdZdfhnV3cjYj8VFa8vwvxA8FKKMs73c6rWtDISv?=
 =?us-ascii?Q?UAJAHMQQHimv24QWshenP3OanO7qlDs3tPDSe7yk3GXSPBf2KLGGHBvHPUr5?=
 =?us-ascii?Q?wcKmlStvLeK1yTnbVpKCqBOC9a75JVoPProKcFd1wJ7lGg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ovtPzInskIpQpibpj68TwClr7/MxJzIaH4Ho76Rx5d8dD01T2XxuPVLyezXZ?=
 =?us-ascii?Q?68yIkMoq5s0xqpHH+pfOagrO9a9Z0m6vDxDs6EtikArF7iDMg0pyKpXByMGw?=
 =?us-ascii?Q?vNGtQVcHsMLXQ1hCbPqAZcCy0r5rp3ngt9YkmU47touLBOkJsUD80uu9+Rm0?=
 =?us-ascii?Q?2MAoIaPl7A9h5CWINRYwzwci7DPBXp9eCalLOEeSrvsNsvbgimM1FUX6XKZS?=
 =?us-ascii?Q?4rtTr1Mz512t2VOwXjx1J6cGJ2SJFunrgE37ibjwyjf1dhrUYY1f6+fzzfmP?=
 =?us-ascii?Q?zbzjfn45F1TfQ1cRCeNQtmOo9VHzV8frjX4tmvj/m3HLdJ7+uPYJmR+dmZ7P?=
 =?us-ascii?Q?LFIFVwVWU/RK5q/UXqSmMEKKlA9PRhHgSxAe1k4LLI4Hl2GSDtIKABranEbP?=
 =?us-ascii?Q?Wuy/WFoVLbFT9WCebGJvhIMrwDp2IKbHHeFdOvbThOFIec973qWCoXibo9sS?=
 =?us-ascii?Q?aS/XCF1gg3Jl9tLzYpToFZdeFyjy88JfKYlM8Jf1gZ2Uq4zSbZoi1cfBedxj?=
 =?us-ascii?Q?WsfMdu1CnwmejT27Zj/lqFohTE56aEIGWx5l7GwInojZ3TC6RmNSMhmi6qQq?=
 =?us-ascii?Q?fKUhkWfwLWZqD58n2k5k3eI68et7YLtzqgid2G4C5H5JrybkLa5bKWY7zZwf?=
 =?us-ascii?Q?NuhPBRitoH4S2lnMLv186Q1RqIPSHXWcwQG/O7R+H4DVxR22++ekZOt8Z1t4?=
 =?us-ascii?Q?kd7jU6PVHsSpQsom0sTRkmmmgBXO1oBPlYBdBNR8WdgV8PfKS5TSHIYFpxBb?=
 =?us-ascii?Q?vhqibZy0Lju+RcTm8oErVRx9pC418rbSI703MYSGLCC0g13YCzArbH1k4vas?=
 =?us-ascii?Q?sW2/O9DMcTsULDn6OQdO5H+sx7PKER3tBM4m0mPCmutVPy9hmuZLjNNsuFKm?=
 =?us-ascii?Q?QGo4Gm+7MIbpyOCQwHJ3k0ChdkWlzRv/JJZI6iSNhbk4hKlg64u/z3lnjfs1?=
 =?us-ascii?Q?pN5evXh6bhqB0LpvjPBrMDzeTlPKG019TJF+2QcIKhl+js+n2HK4NTPbv8AL?=
 =?us-ascii?Q?F2Nr3oABS19iyjGzttp144UAYRUq+Ug5wSTPgJbTsXIsvhtSEPZO+2WyfOLK?=
 =?us-ascii?Q?72mG8gdxANBhT+flxah+17SY2/WbwK2hO1LHYPnkdX0KzhDrGK8C0Mjc6QN3?=
 =?us-ascii?Q?CjaThWevUlFYoKtB8/yaI/h9RBu3mW4/Jbcl8MlM90N+YMkgwVKyno/hgBVg?=
 =?us-ascii?Q?aj9QxNmptDUNPvLJQP/H6Vek1VcrFfoECkoXB4QFXClNUz7/cEIJN0XVfJ6F?=
 =?us-ascii?Q?sUnyr3cSNfVnz0WSfwpXHc5+71XybLiKlxBM2LbRyUy+9n8dvSXe3KCqEVVH?=
 =?us-ascii?Q?CE74OpwU6IupSsQPN9U0cR635cNlBtMrytIEBHqe1V86L6nmly2MXwlrOzw/?=
 =?us-ascii?Q?uxIcAvTYRLuRlHfxVWXjOLcXy6PdkTeHz+hx2+T1gRDW0rdwQqNpBJmrw/81?=
 =?us-ascii?Q?OW1XBwBbTIJ+NXAXVGtR6CStKNAUcnutxOvcIMyuUrLtljyQ+K4/MPQCGOZc?=
 =?us-ascii?Q?Wpk6nbe5mKWn58ky4NbKJh+XWtdkktJ+I6D7gk4SbvHma4PiQ2LDTwB7pdK2?=
 =?us-ascii?Q?+Jy0OPlrNb707rcA0rXs0F4EXw/Tfui/2VNeM3+AixNaI6QZcOiOX07p7h+c?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd9bd44-4b61-409c-8059-08dc7a468011
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 10:03:59.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4O0ohk+0nugsZY3+UkRczHzrhXyxfsYygxBfyr0no/ENZp+n6sLyoJDIKkVkFNEJcaS3Cj3tIZOLwtRU3cdrtn7n5/PjVrohlJ/9xvp5gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6730

The caller of this function treats all non-zero values as an error, so
the return value of i2c_master_recv() cannot be returned directly.
Follow the same pattern as ili211x_read_touch_data() to return zero when
the correct number of bytes is read and a negative error code otherwise.

This fixes touch reporting when there are more than 6 active touches.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/input/touchscreen/ili210x.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 31ffdc2a93f35..8846c6d10fc0d 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -255,14 +255,15 @@ static int ili251x_read_reg(struct i2c_client *client,
 static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
 {
 	int error;
+	int ret;
 
 	error = ili251x_read_reg_common(client, REG_TOUCHDATA,
 					data, ILI251X_DATA_SIZE1, 0);
 	if (!error && data[0] == 2) {
-		error = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
-					ILI251X_DATA_SIZE2);
-		if (error >= 0 && error != ILI251X_DATA_SIZE2)
-			error = -EIO;
+		ret = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
+				      ILI251X_DATA_SIZE2);
+		if (ret != ILI251X_DATA_SIZE2)
+			error = ret < 0 ? ret : -EIO;
 	}
 
 	return error;
-- 
2.45.1


