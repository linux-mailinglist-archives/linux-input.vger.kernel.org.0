Return-Path: <linux-input+bounces-7791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A44979B7491
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33BC61F247E3
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99BC2146A6C;
	Thu, 31 Oct 2024 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Fu91qiNO"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013025.outbound.protection.outlook.com [52.101.67.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAD146A71;
	Thu, 31 Oct 2024 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356256; cv=fail; b=aSvCqvup2wAsGX/TomqaO0DuzpDmEvj/Sb8CNto0Y7v4ADls/IYewat89fR05IndedVmWaGnw8TabMoy30mYDhMJ2e8aflKIV4NcJrgy0BOQTKxCtHTs5iMp70EmnWkC6QuhCacXOa1CEQkbVL2oiNoCn+/Qcc8nx58a/Kf8ajE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356256; c=relaxed/simple;
	bh=0TL3eszPsXS15LWRzFBdD5LNuJOQOlWN2vuPYINr93E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L/M/pfF+LXOz72X92iFHE//on9WRl2pRu1vlz/oEefNAWc3o6rPN7twgLhjkRYoiSvePD4HfLTKRlMNkIDW3ULa7GvN1mr3p8Oomppx0tIq85MstRMfP3naYNZrVWWVsA9Yg2E6UAv9rbe/qf6aI7msxgvjkBtFRBucXZc5RVeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Fu91qiNO; arc=fail smtp.client-ip=52.101.67.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImIlhm4qIOAn8WGb17w1vriO9SMH3e5uURBd/e5U/HctNOrYjIxqPVYxdpZutLViiqw4yGD7sbyo3hAxa7ifZwS46S4ORO6LKzVdpIdHnjo6cvtJkH8CoOZZF8WRnmCXkRhw5nochh2/JkWB16l9k+XAXNzJs5AQsM/ib3XL77C5TByHHAuUEQElehhoLPdpFr1h3/OjcxI0z9cYWrWv8Ttwt8CDE9fC/OSsTVHmiw9oEB7BRUrN1cNc39FKptr1FFo/oMAWbziJQnGqnWAlew8RD6JYN3rWD0OFsM8sqJzHpQLMk+afWCPHoTE4GKX2VyHlc9nx3UqAkqJaFlADNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqsdfSW+AIXNzHY2JAESylM/5d99FguRZSl9P9cv3OI=;
 b=SpmOARpyygsF3dNXi9VjWe6KsLod65afEEIlkmFOt94+BL/g8cDjtJ//Wmde8aK/DTPrKgdKVuNMEjToPXHx9Noorvt6YZNlIXLqs4gqeETfKpCmzzpq+D3RgFKcCbjKK4fZQFcnfU7XmMy5l0mgphicgCnmR4h5c18ZMOwKH1XvkMDLC2NW5ijdtMQcdqLCHRyDH80uh7yCFzoalUF056ucc8eYhu0hrSzIdZBFxpDcsOGYrKbxn69WQOIsr5D6Y1TxsnChpnS/SyzQddjt5Y2vv+PSYU2MKeoAZsMN2Za7aY1zRtNPGk/r6plrRPaPwVkWY2NhY9xFqL53WRqiNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqsdfSW+AIXNzHY2JAESylM/5d99FguRZSl9P9cv3OI=;
 b=Fu91qiNOdt/1K7PhrybctTAsQIcXg4Ki33YV+vPz0O6n57j62gbaE1krb5R4oJWL4VXfbzoc9XYtwQMRWbElbSKNYCyx70M4xtfZfhGsRErNptk2/8O7kTPSjrda8ko18EGjO/KPu2mbEB+63dVom4yNix4cqj+VSdvmkFPFZLcfVJDsYSPxt9SSGiCzqBvQap7AHam5TWTAT9tA4mGY7w1SUHth9tAaAH/iD1XPEgBALCk7rSVpAnXV8PxyOpoSDJLihnBP8CbEfVA/+Wpg2nfkqneXi5obWaR6Ptk/DDBgEtKLrhESFnzDkCFIUNQp/GjN5dSbLYonCfprwBOUfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:30:51 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:30:51 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	HeDong Zhao <hedong.zhao@mt.com>
Subject: [PATCH 3/6] Input: matrix_keypad - add function for reading row state
Date: Thu, 31 Oct 2024 07:30:01 +0100
Message-Id: <20241031063004.69956-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0018.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::16) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: f386ac41-3ebd-493e-1dcd-08dcf97590a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WwxrPTnEwsQ6Obh53jLzReDShkKkjTR3fQeMl8QXb+blEI7pM7jyPKeAaGsg?=
 =?us-ascii?Q?jbJD1gZEjmJslxdj2taU2n4Fra0jxuqUHK6zwF6MfuINMklEd4I6tYNMvLQo?=
 =?us-ascii?Q?pHFVYxUaREoDVxip4KrvyjKmZED3Eqym7LvDoXyCAaUi6al8yHGoowFvVdGa?=
 =?us-ascii?Q?07+vr2RAijRB0qyF80+wCwGcw/pFRy7nCoxyNijpQMucu9HnP44+zMHwFJWv?=
 =?us-ascii?Q?pONNgia8PTLHBPjgh+wVWDj20sJElGnAFn7q3TTlWKVNJ9bZyqqip1NFaBCr?=
 =?us-ascii?Q?/di72Br6U5UZJtxKWYCY0DccmBj1Z8nGcuz0frtmxzgXSYqNaIzQuZQDFEhT?=
 =?us-ascii?Q?DeIGCJqQad72WXV4f6Qgzd+OILN29bc1te/xHN3F8WQQbL0qlCog4fQe1dh8?=
 =?us-ascii?Q?KpF3hAkOFZ7a7BT6svmTgwWidEm6a6ACALFFxpX297sCF9RiIM7aBYC+Qn3p?=
 =?us-ascii?Q?y6P8hdR6s9BA1Kq9sO5GHKDJ10ov/4Tv41rtqgZphN94BKzxHD6MQnay/dN3?=
 =?us-ascii?Q?UKaJ5doifztRNKk1rOcIUe1MAAGsDoXRzmvcvipn1JTuF1flmnwg/QfbHvIM?=
 =?us-ascii?Q?JKmrHEHr57MurqkW3VxhSJmHVvaU2AmGQnFpTEKwf4HzR/8FIFTsYJf2XjGY?=
 =?us-ascii?Q?IOG46eFWma6pAsh/ZT+5pz1IysWRBOh1P5Gw9fRtOqAXCZjStyquEh+wmB1E?=
 =?us-ascii?Q?FRZkX/hZHaUt2vFlbpJXNKJrq/RrsFUORSPrwlyWuezmtaknTcDdBfdiygwn?=
 =?us-ascii?Q?tvWuLUeDWY/a+4TK13FlLkb4RQz2SHg+n4vRLVhQ49ka/v0NEQCqUCT0w/PW?=
 =?us-ascii?Q?b5zk6uTKAaDP6GJnh7USuLAUE3SkkeqCndN4X2GvfetFlMSUsOyMHDj4eG7v?=
 =?us-ascii?Q?iDv8EO5+9w23sOfOtrccL67NhoN4QFz7fauvvF9P4EIpmoNo0tlxQ80uomuQ?=
 =?us-ascii?Q?n56F8nrCy74tdAzYBeaHUE9l8CymJGBzN9tUfm4C5krate46YMDtWEzopB8D?=
 =?us-ascii?Q?xLaOnCUAXbvmulea2XndmXqiZp7m6qnCeneqv8JdkRB4s5IxidtjEIe02qME?=
 =?us-ascii?Q?dBc7dm7l169KvDeiFck3KV68rA+rU3QYm+QdJ4MbxBKSFdWxNfRi0vilA2O3?=
 =?us-ascii?Q?YlJxEWCDvoKNSnWZHyaiCBszzENA7HaXxuXIRisgNwOm7HuyMOxhKcGbTLn/?=
 =?us-ascii?Q?MB5b6kUuho2lCEOcXHqwPVAgTdATRRnv/sWNwKo3NuzqOdNWd66n04WD49Xe?=
 =?us-ascii?Q?eWF2++d90KEEH04WO7S1g6IJM/qbhwZeyDTFLRsi2oSzGlI7f0jS5QoJBL7s?=
 =?us-ascii?Q?O/tB1kDS+2xuyMU0awXnN/duTvOMv6QjAA4HTLVQvJSj9WHFjZHy/xSOGBK7?=
 =?us-ascii?Q?G6lGJQE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cyd96F7epd0FaEK01YFSvtT1tp41krdXQlkPwCE+NuoPhfrQCsgQouWhw1Oc?=
 =?us-ascii?Q?4T8hXbuBGqee7MKR4HPbchOo1mJVOYZKHUbmTRVZ+c7BRFoAp8uqpZLZnsmj?=
 =?us-ascii?Q?XdUHNOJOQvC+ZBCqE7RuFhkgWUKzMessIfi2A/rX9bsW1d4zdmqxP/RZsNhT?=
 =?us-ascii?Q?7NyAvypt+kHIRP/81C2Qcc4AsuVWu1uk3jgB+qqtR3QtuXSz4VE2drVdyxs2?=
 =?us-ascii?Q?MyMvmQ+WP+OoaTJMcsGh/JCxG5kGzXQF3UPGOa+EaqjEqLu4WqxVmcEjh7Lm?=
 =?us-ascii?Q?lYNnymmMlgdT5TlSNu1Ws0P0hOrGkPmGSV3HDODxlgiadgxpPFJbYnfAv9Nz?=
 =?us-ascii?Q?K+F2yYZ+tGiFymYLdOvCtdEY4BrjjaHMEqtujhYrgxHnA1L67V2lf+Y+9s3x?=
 =?us-ascii?Q?yYrcryQjMlLkTQEhd6jrybgYmCb3jhLvlPkCS9iDP2afGko2d8r9KMjY4TCp?=
 =?us-ascii?Q?ciLjMjX5KMOOvR/JH4cOEmcQltMj/+XQYovNrCKjRBsf6PNddvyXQLDjDY6/?=
 =?us-ascii?Q?Ir82dG59U43Qq4OVJuGtLprfGkrBGDQPwvKrZ6cYUST1tC+Q55Jm4/YbwUhV?=
 =?us-ascii?Q?xZFQXw48hg5WQ6poHmGM9ndOqWxedqJVG/ikCo2UHEtM+YO8JNUyQMzF3ghu?=
 =?us-ascii?Q?lbbQjlp1HLgCDB1CBOVWFr8kgOuegespCtmy1zGnC9WV4T3d5JOMyE2XRnVm?=
 =?us-ascii?Q?2tM+3aDmYkAcmiW4eWC28pbKAHau6h1NTUOYMRUyHkLrwivMCivc/DYpHqA/?=
 =?us-ascii?Q?smd+kk+rkpGU3SITglphNjM7npugesNcdPJzsjlxF018AfzreTuECePyi3dk?=
 =?us-ascii?Q?2pWEzaIS1bjzcn1TRAXx0W5wKk5P/B+vHzHtCHKCsXkWBS/epdabYBX/5j2N?=
 =?us-ascii?Q?bnQyDhvgDjAS2Qz4MkL1xxcBy+5I86QFV34QuS110Q8FyXQq6o6gcPgbwxcr?=
 =?us-ascii?Q?IEM/XiR4XjPQfnygzeuF1HL4T5FyAT4zblIo3ysWSCy7PjogTA4+MO0v2u1Z?=
 =?us-ascii?Q?i8Q88iJnGUl5rNZs/utg7IHSrEwHEPvVx4DH4QGQqwxAFqjbIpMVmGHGodKq?=
 =?us-ascii?Q?WCs9uKTudePkhSCLFSGG81RA+0DdY6oh6ucU9yIRWLQ3g208eozRbr/tkKot?=
 =?us-ascii?Q?imHEwqXx5DXWI+oT6C/l/k09S+s61R88NqBF16HsjHR/GZ3nf5EH5cxcCGt6?=
 =?us-ascii?Q?69Z23V3brHslWrjJMOEszIsGJvQxsnko6BPTna5yhhvReHZuHOeDwG9KJSqq?=
 =?us-ascii?Q?mFXiV7LLRxDvkSdK9rGInmQvzkFc6bxpBSkNJQLdzOaDUyzLIsKYXJHQ2s5Y?=
 =?us-ascii?Q?QEDN5D2FPxJx2HDigWQVrHe1Mqm8vNdU9CMLZ9rli5P+3FGmAdZtJDD5QEEX?=
 =?us-ascii?Q?M3zboSHYdC1sdLr6cS2q6tmkF4uaUnWyDSCmqjm8i/NJSBOdW967wgBmr9Fs?=
 =?us-ascii?Q?BdpriaYrYsSTUog8ipO0f9rA3+mJDyDmFK4kRA/A0aFFsq1Zz4VouJYXdQtT?=
 =?us-ascii?Q?Nb+V7h5HMuiEpuFK8zj48ynk3T1F8XY4xz+EZq37bcDZTzC2Y8vRwGoqnfCj?=
 =?us-ascii?Q?TSmnzfd25f7jcpyokyK6tMMxN8THmFsfcE+2fveE?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f386ac41-3ebd-493e-1dcd-08dcf97590a9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:30:51.4298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUEIB/9bkMpGBN9RyrZ/84aDFO+gRJmgtCDAyiQKi78bkeo+E4Ltsk79DIgQXYUe+Ko5VEp+2GYLgNnxmR4buw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index e08d7d5..c091f90 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -101,6 +101,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
+static uint32_t read_row_state(struct matrix_keypad *keypad)
+{
+	int row;
+	u32 row_state = 0;
+
+	for (row = 0; row < keypad->num_row_gpios; row++)
+		row_state |= row_asserted(keypad, row) ? BIT(row) : 0;
+	return row_state;
+}
+
 /*
  * This gets the keys from keyboard and reports it to input subsystem
  */
@@ -123,9 +133,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


