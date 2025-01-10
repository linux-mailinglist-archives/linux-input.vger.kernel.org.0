Return-Path: <linux-input+bounces-9128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C496A086EF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DD6F169273
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E441F2063DB;
	Fri, 10 Jan 2025 05:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Hks+GVd/"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10913746E;
	Fri, 10 Jan 2025 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488204; cv=fail; b=ew678hvgIv2oH6cb2c/UltN+NRhgv4c/9ichapMNawpmZPxeITjOdHrxBYKC1gY+ROW7nwqr75I4IcQ2pcecR7Jymijn8DaIeMir3WCXGWl02/NCjPpJeyWVSe2cNazNRi8iCzu2oYNyIYauskXFQATl1fzYmcRQSNHeEh8rk6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488204; c=relaxed/simple;
	bh=EvVcj+QkhINjk7MlFePZzdr2iFo1oy3l9BTZXf2UzTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a+u1mn1pcV9p0GRx4ostTqCR7IUbiA7/jEJhzN0bP3lC1gZs4B4NDgE/ldy7apTg+6VowQFCONzWTzhPIAA4410Fm0tuXU1hDUwLPZ5rYUHwG0bD3Mi+GcJJCpuAmNOjVDdBSVnyM0S8WrtASnrMoT8Ly6f9AetA5cd9fGNQKZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Hks+GVd/; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PG9UgcRgiPQrTOtSIzZJ/nLctHVEEzGlB7taLXVXumFiA9AhODFpEuO4EwM5M1G5r2qPU6dmDc2lvEp5T5UxXuFuyO7+UN6H1mD14+O6zYuCfCm9xlxH+6nzk3iFmNsaI33Xv63vXl4i/1epLSnBzq2V+z1T4891EVEd45iSXuSrr5YlPqU0zqehMFucksldU+x/7JsjRGZia9KFrQGKplicEoUt8JmuLVjAawFwzT0bu5xx2yWlQda235KvSiUAYqAye52RSrqaa8i38o5115jbToa8xzbOlbarjwENk6MZWxEDk6ScxF+8w5vWqjNrQzHv1Dj30glE8CFMVyqRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ4PuYrsoBHjd5rQT+OWLuFMampVZia+Zk4zk5q1tS4=;
 b=MaIIkOZFgEJ4rnAsoCZYW6Rz/Agv2ov5T68+I0ajzTW13owgLty+K+/limrJCmqwEdfVUPon/BJNfkApUCV+HP+9CJt1yDTAk+SpRWz0bRz/2kL3OmMB65zfbWdVVqmGZXFbw9zAZ2eRd3TqTepx7rKslqsVwM2/2++opQbxTKq7LkilgYfkJF7HHHEUbsPvZcFVts2ckNeyJmszUWWTvMjaK3OBEwLxJnhNFM9QfV1ZzB4mv+h/V0hYSxs2s80kQhUGFOp+v5Ie3gOpPRuyzmlfNFI+1S6re0M6u0zeuwjyj6RXsR2S3ldBUqxrJdFvMwOa6NuRN+/Qce9Qi+t3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZ4PuYrsoBHjd5rQT+OWLuFMampVZia+Zk4zk5q1tS4=;
 b=Hks+GVd/bFB6BPqVIIwVwAMRj7WpGWqbeSQK8AUEYTITzVhVRCfRQcXyIAUeQEI5vn3wjBk+E+dfh6NlFUl6y7FBGuMk8EASXnBuSzpZQzmqr/aH8Kz6wVIcSKQy5V1L1pSjnmZuyiabExRp16/03KchvW5AkFGsd7IwGPk7fDZBniJSFrzmOuaFaUt6MqcYGDfroXvXVu5xAxTL+43Ib/nBHx4s5Hwil7jCUMPqMMwKVAZSMSYOoXQQw5ovIuedEaWSltAtRsGzKbC8ive4IFTs00wZnnOY1AytlLbQttuI2Y7bap9RR0dHnjorhg5TWJGpy7FyXeuKJhwinFBzwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:00 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:00 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable delay duration
Date: Fri, 10 Jan 2025 06:49:00 +0100
Message-Id: <20250110054906.354296-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0192.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::16) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d4a1bb-6920-4005-b0ee-08dd313a9f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qIMIxrkqgoXUieSncvQ2YMn+2iRTFp8kYD57qf+gBl7A2EVEMKabqg06D53L?=
 =?us-ascii?Q?F3oHbrRd9Ejn2hAGYBoPdC/xgxpYIrvJkilZ2yRHroIAT7XppRYzLEjpR+LN?=
 =?us-ascii?Q?yMi4v3qxS6kfRcKTsKe6bHgQ4H56kXDk2W5JxabHml2FIU+wkP7/QNYSnwzU?=
 =?us-ascii?Q?IZVDnA57GHJTOwvoOFq1EE9hH7DF3DTwOQVboxP27woIsLgv8m63rl9WnVx5?=
 =?us-ascii?Q?PKOycPTiRbyu7CnWJTEGrZjWlx8dL3F2w3rW0gAyKlg/2pTPi20VCGohPWIY?=
 =?us-ascii?Q?1AokB5Q7r0m9JGchmAyfztR9RP6a3JfEVyGKPdl6kVQfe10/8ygEUjdxhfYD?=
 =?us-ascii?Q?SgTV26kEG/1IdNQjla1Ab2lWp8xhwYIsVbVO4qGJNTYuS8avDV6xnhbNcfsG?=
 =?us-ascii?Q?Aaa9myhgn3i9f3zTcVtbHDL8Pgfd3qC+BtzPRco38ZHaPFuM9kTJgTzPhptu?=
 =?us-ascii?Q?YzUI07tY9yznmRlwEk6CNwY5+ycJrlM7u8dbZRLNAvWveEHDorKdbsNYhc2t?=
 =?us-ascii?Q?2CwwXfLiiC9VjVAOPlgRC7ISihr+85OhQjIK9GrqDCEHR7B1QIwyrelH7gch?=
 =?us-ascii?Q?ZEPMuV+dTrGY1GSLAzZxHTTHo4RosackacN+dUmLfju3SqcLPgn43rpigBUN?=
 =?us-ascii?Q?HXbARh/EVdbRBqJ+rElXPxWhsPwrrX9BhEeczHit6CGcaiW1IvSzeLP7Urme?=
 =?us-ascii?Q?3MBYJ5N7GpCKbVVbzZU32ouxiXQu+Tltw8vTFqZweK7XRlyfRgSNtxU3nfd1?=
 =?us-ascii?Q?SfWK7jEnNm86B8R/k9ZoSLn8IzPRvZkql9gSa3GeQE0MZ0lxqK8tJJXmJGha?=
 =?us-ascii?Q?c4Bv6uonPitqRGjHdAmNPJirg81UJRrwo3mWLlCnZdvWmoAuZJXJD1UggqAx?=
 =?us-ascii?Q?g/BPUeFTQhjRKQuLySSs02+JKAbYHI1IXTzwJp45UT3PNJY13s9mYW3plc52?=
 =?us-ascii?Q?/fj4WmpTk2WyxHRdscm8iY4bwBr4V6XK0ITg4MW3jPGfkmjY034XOAEqYgbX?=
 =?us-ascii?Q?NAz8iDdz0lYpcgo9c2bVV8pBLXc2qbhTGbOGF8VuBco/VPJ6mFMtiX524tf6?=
 =?us-ascii?Q?wH5Jj/e7awjJpDFQ3kdcMbJUe5kAJWl9uBVlMvjKlL0PZ7fRg2xNhnOHnTDA?=
 =?us-ascii?Q?Kf8RBQjAXvR5b7jr4olEuYSyBv4tkTmfCAJt2v5f0jhuX1HgsM1rEzCMugGy?=
 =?us-ascii?Q?jHLNGlvX1E54QkJskh9FgOlhgN2ZEzkeMCD/0byo2oSAwIT8FLg8EMljg3hT?=
 =?us-ascii?Q?8l09FHLbAmAXPiocyj89gzaI/s/WqFnSRrMrroUZKfbzYqL7X8LGMDnl/Cna?=
 =?us-ascii?Q?VEDC4LB8aMtp+Bht/eS4OI0SwsQ0h0i47YqGLltGD9THlyHKyVMTmNMA2QJu?=
 =?us-ascii?Q?WmPiesADLoKfdoAUkxbrhvQ6pJ36AsXmnJ3kR88GkHRL90Y0CFc6mNCv648z?=
 =?us-ascii?Q?8req/vJULPZNhSA9vbCLF4k3xbMmqRme?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KJBRyDg1AuXoxnSS7KXwFuFFsGH6oMYJ+nR6tViXmazKQ/gBvPyjZ2ug0ORy?=
 =?us-ascii?Q?VYS0JZwj3ajx+vanLezv0mnAGae4ZLEqph409/NpTUKaRxc5zEZBzdAn0dtr?=
 =?us-ascii?Q?S7XMxjY1wLEM/Tngy/dkuYrxP0/M6yuRKFfKFoqiyVj04s0bO/qDWp1lsm4J?=
 =?us-ascii?Q?pCpR4o5f22/GfQ3e+6UXGVuHq782D/LrcbleGZKm1YVLTSodfPwYj/3aiWpB?=
 =?us-ascii?Q?9hel7MoxLfpnpzZ45vGhuCL8WmuPXCHWoUb+1K+QIpAnb/VPTzT/CnQyfpTH?=
 =?us-ascii?Q?XVlSLC24W+Jnk8HJ6jh35akCNVFuwFT+DTTrH95U16WV3cGVK0tzxVrxp44r?=
 =?us-ascii?Q?G+HT9H+kUN0kiu+2kitjORRQizmt2HLs0RyKeJz0ZMeTGxeASUDRs0TYVUU/?=
 =?us-ascii?Q?IVb6x/sN6bAtGxmw1EXXrak08gyq7bFqFR1XK1ec/4jYEeymQlc164Z1p5+v?=
 =?us-ascii?Q?mzI+Mx6CAn3ckqhEzNdvVyHbmEos0GMj7Ea8Y3d0qRNFPXUNzP7tgEIHBNhd?=
 =?us-ascii?Q?hemG9tnKIlTyW4uKDo/muCmapTcb6nrZ4hsuusWVwE+/iqQlaiZeIzQTPmLy?=
 =?us-ascii?Q?fdMXjoaYu2XochQMbBWBw1qitFOjUkgEd1urDxmILodKOCuD/nhWwqxqm2oQ?=
 =?us-ascii?Q?MpeUA97iaWh9F3XC/vJupRBuCGFJnTqMg47N6ATG/phu2ARwIOueoSFHviud?=
 =?us-ascii?Q?uAFM59YPEJUGzkSzn1JCAOAL1wxYxjuXNsOjhn8Wjg/vwV3ZOl6RHECT0tT+?=
 =?us-ascii?Q?OJy+MdfSp6F9FpvpEWhN9W8RTzQmGCxpevHlQomEq4Ts0Ic0X+Gf6ISKRICq?=
 =?us-ascii?Q?mZlO5HOVDwS8/R6cL3FVOIYsv+07TEdW/BOF6OzJjcrk0Vq+50f6ef9nwUty?=
 =?us-ascii?Q?d27BYfIeXabLkPI3KBKHejMm1DlmkwHcqy9pgJ+FzWLYn1W1/dZ3UomvMumL?=
 =?us-ascii?Q?w0vvH9uVyDw0T++JmcoiNFlt+4y4v/ftun7OXMRe5gvN9TlKR2hXu92o+h4/?=
 =?us-ascii?Q?VXuyQsc0RlsCtLlxX5jvEizvjfiTulKvEm/AhBsM3LzgbIiXf3j5XUNsaaUb?=
 =?us-ascii?Q?zbqsgGsJ87ExS2yGnIf4SbU5ogbofzslGnk4WrI6iJD5hwp/cHguKy7/SUrj?=
 =?us-ascii?Q?DxfFOTUAwtiLC7PhsTL5Iw1GPXfTsxZSHL4/pDYhxLMwBAua0efMe5uuyYYz?=
 =?us-ascii?Q?ub0cu2HOsaBztBHI/+ouGBxrIw4oJFLnk2oC0Y/LabmjtW2UKQ2sf+FDvpoN?=
 =?us-ascii?Q?9rhHEYM7NZ7zXwf2WzY5jMKxF606DwMbpBELYCyXCRbxecxkAL8YnEIKLrub?=
 =?us-ascii?Q?iBGaONJnDx9JpS8FCKuS8HTUAeo9yoV2BsKliT7YPF53xv8fb5h3ZtOi6Ucs?=
 =?us-ascii?Q?k0eFM1lvLSb6DN/myIUq+WpL8jIMSh9xgmxzwZGO6m56E0bXD+c1KkMmT4kS?=
 =?us-ascii?Q?5rydOup5S6LLsOfOihN3PEF4wnzg9ND5HBQd9VXx+AMHQYt4b1pitY+gWSY8?=
 =?us-ascii?Q?Saj/hFLSQhhNf1Rq73t4V5YDbuipqD25e7zmLMSRR2pfd5mSDMsW5Uprat7t?=
 =?us-ascii?Q?WhPOBVfbV5GouXk7iCwoh7vhcXkm5rol3QRUsG6u?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d4a1bb-6920-4005-b0ee-08dd313a9f3d
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:00.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P42a+k2759flheZIng7zjaZVp5lm7BZt0Cx6OnxishRQOPxW6cNIz/s3pih2KzJdCYSowNMkQqhptMkkT2JNIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

The delay is retrieved from a device-tree property, so the duration is
variable. fsleep guesses the best delay function based on duration.

see Documentation/timers/delay_sleep_functions.rst

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 2a3b3bf..5571d2e 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -68,7 +68,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
 	__activate_col(keypad, col, on);
 
 	if (on && keypad->col_scan_delay_us)
-		udelay(keypad->col_scan_delay_us);
+		fsleep(keypad->col_scan_delay_us);
 }
 
 static void activate_all_cols(struct matrix_keypad *keypad, bool on)
-- 
2.39.5


