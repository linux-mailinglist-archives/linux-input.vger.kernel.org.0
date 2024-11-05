Return-Path: <linux-input+bounces-7870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3119BCD76
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD2C1F22439
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC061D63EA;
	Tue,  5 Nov 2024 13:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="SjAA99lm"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4287F1D79B7;
	Tue,  5 Nov 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812175; cv=fail; b=sW+BdSBxe6rOrO+BMULxCEr6bZooJ8/c65YchIrA8BH8IP5EVfEvE5Dg4U2wiowxi2v8DGcLamfXNnuaDSKBLwxespJqRx/btKvL+1YU5RneyF93st3s1xYj7M1sqDLZ+OHEZ/EEtQCbinui6N+1fMWJmYp886XdMMoXOJh6fBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812175; c=relaxed/simple;
	bh=ICb1ZJa6LdnXLJpcObLc7GnKhpTlymZSzdD9dyFNT2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zkkhkaawfw/gH4OsPsXp+LhJm12VaGvb2SUYqklTtTZgKti9uD6oejaoObWAyCPmaWPJVsndBKXFraKjj3mrYLFvwEBWH7W5Oqh9Si0xtkEpnDrBtHAVF4JBACIKUziyI+lFX7FweCySdj821rDtRpk+9fLXf1VZKv0Wxg+DbHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=SjAA99lm; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW1oZfMyzPP6OIm6UC/CEwXj7u06FVQrzA/FlYfDQNiiY+66SuKiR7eiJUOsgHnQ0+q4ieopujG7DfHDZL+7GEYCPENeOhtDc+cQPX6zfZMxPYILoIUkbglOxYOFBV3/A4+5OQarwHFt00X8kaBa3JKWUyDdwmZ6TBpQOwAMl9U3aRE6nCdECMFg68XclK1qtB79YUsCsTKs7cc1gaLK12aphNWZYXXbsxeeWLA8WoUzi/x3BV/VXss1jTHed7DeStjHbPPVXRMjyGISsjNnZJESigUwUvGTzTXwKX0DVawJ/HCL6kz7JTrYUE71Sl/qTz7QPkwV1KfSCDojbzfmHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etH6092wcqik7oYjT3OW7PC/JboEFgrsdlXTFY9BDoE=;
 b=LaqEuzvbM1dSD7eg3VVZXfwDLAyJy6NezupPVcKEvow2llosVVevlUtL16YiBToX1w/suyssU7AJjHl/IpBnTXvzTgz81l8Gh/nvJODW1PhHR02NRK4naC3jmRmQ46arKguGpzKbX3JDzP2bza4zTqc8yO+OhsPwr/Fuu9HhcHgUd7jDhRuNGL9DjEh96rASd/YdXoIprw0KQP3HWXfYmkZbx32ZrOvZG575bUsb/eoYLiTpZXMtTyGtBJ/BN8wOjkZZW2eLgerU6Q0PoZAAPV0xBfO3iZTxhOOJ8W7RU33UV3vrhU26INRMDlHbhlAILPMh1/nkEG48SGrIY5nJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etH6092wcqik7oYjT3OW7PC/JboEFgrsdlXTFY9BDoE=;
 b=SjAA99lmrYftZIaIu7u07C/Fg0ARDdlO06GRD0MtZhVc9i9Wsta829X9ph3mCi9WrNqbK6FX6z/NqEnd8qJGnTCD0I2J3QICNH9/yB490wBBE69HbZZzcLSZlKTJJhdS8yuXs0zSwSuh/aDRoQvNRZtqxKmtK25pdorPOD/oUl+NFoNq8cNVjp/qrnYNNUyv+IFMxzIrjSr1eeFPSX2bjbDxFSPuP4qQG5GUhU6eUl/NC/ZWfb7f2bP7QGVkwdXG1fuJoPoJFQLvvhnf0C0X3eyDxzUOzjfiBckzLYeQ9uRa2nkNPawrPplNTZ9ckXAMnZqUT7i6UbM9ONcIdkWjkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GV2PR03MB9377.eurprd03.prod.outlook.com (2603:10a6:150:e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:09:30 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:30 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] Input: matrix_keypad - add function for reading row state
Date: Tue,  5 Nov 2024 14:03:17 +0100
Message-Id: <20241105130322.213623-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0025.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::15) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GV2PR03MB9377:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbf1fd2-040f-48ce-06fc-08dcfd9b15a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GO0Y55qAjdjVwwK6LmYuoVdgbAMCYUfUEOAU4gqc8Vb8Qpy0FVddwWtkJrOd?=
 =?us-ascii?Q?ZL1b5O8I6SVmD8BOAKu8ucHchm3UH6vfn6r10SUaD+3aC3sBChz8O9R5b/cp?=
 =?us-ascii?Q?LeKiQIkFJCMuqomU+RkYnHsFr20hiNoGKs5FMCgN9DWEOFxG14WCaSvBlPNU?=
 =?us-ascii?Q?5/1RHnRjgkFZaK9pWE+og3++YwS+s1/7PDLSCBzkRfZg57ci8vQxh4ydyyRC?=
 =?us-ascii?Q?GancXzJ0adZWg92cKT3kOtzvJJh7iSnMQF2iMRNr9OcrbkPRahidfdq3OAXE?=
 =?us-ascii?Q?AewegKYuBtigRipJCTVkRBZS67Tye0EiV9UgJ1g6dCHKV2cTzg7RqcCQnVyk?=
 =?us-ascii?Q?LeaZw6BiUXI4DaKZsE3bdOfPmuUuWMNwvqAbpmbpt9pJ9V1j1wR+VxfFDyNY?=
 =?us-ascii?Q?fV3/5bBQhmYa6kBpy4SFFtJkSlpRiyE0B/1K50w+MplMYqLOvcFJ4YdKljVX?=
 =?us-ascii?Q?xSyzeXpI7LAliTQVZ6v8RBQpMDUdjArb+S/WiDL5XI2+Fx3Lzr/Zy/1Ce5ZN?=
 =?us-ascii?Q?amk2yNrB5KDi7+VmyJcLL61jU65wMk77xAsuDLmdzbm8ujSYXd5EqbN0tolx?=
 =?us-ascii?Q?GV7Ku9PnEAsj+cqKFJfOpRghZwz6osRn+NFHcegKnMFKifNEP36D1dH1lEVd?=
 =?us-ascii?Q?4qnmrAXJjcvFBNPVbKkpv/cnDeR89FdqioVcqtoW5mQq8RwzCUc2zXugkob6?=
 =?us-ascii?Q?lSvrjnZANGYc5IjkLahQl7DXmwPp4pLdz5INAkfNAiSqXnktfvhsAGoNFKjs?=
 =?us-ascii?Q?75PzQEzdK52nGPndWn1/5Mr5/RrGfQcOziSPYi6H84x/eL6CVrRIwH2BiQbA?=
 =?us-ascii?Q?JBoedYZjAkATrDTvYlzWlmL2eLQq4PCv/ujin479apSbrXWyKgonJoRhicSZ?=
 =?us-ascii?Q?kV/H5tcmAcbDSlM6LxQL/HNQuzc4JtwJ7H5aXkfW3Qy7rYTG+UEBwA2fL9oO?=
 =?us-ascii?Q?E5BkaUarF+yTdG0fGg2KYfsn6BygGsF1+vkwWy8ApmMrSSDHdgpL4kEB47dD?=
 =?us-ascii?Q?/0wVl1qH5z+UUNyEKGM6fg0eZKcHpflxTZwHKbFcvBC+7vrDxdszmu3YVGdu?=
 =?us-ascii?Q?pZ+eGEGPIj27JgBzx12rKVYlKeoRCr0s0mIdIy+rlx8+sPyIzflUqI7a0WwP?=
 =?us-ascii?Q?HjLnDmC1qve46BWzJ6ZRQqR9SxeeSXo6HIfyAOZGSZD3IupUeYQjQQC6dvSA?=
 =?us-ascii?Q?VGq/9BBQW41P5EP9XDLajd+cF3qRZZ1p0SxK86x/U5Un9YfZLaNn2ku9Zvc9?=
 =?us-ascii?Q?SJ9Ac7P57KsQ/xZLAR5wKmVbmozjfUshQKdgE8rKsU32QB8n9MfZxUThw4gK?=
 =?us-ascii?Q?gmMZ29GGlBHQKUdfS7g/Ya84nJUKXURnX7c51q26dj3CMw4GYngAyz/pKl+C?=
 =?us-ascii?Q?Kc48VFc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/kgKYsL6l2c5HUZXSRmtF+HpiVBEp9h3ly3SDJQONQhbqeqmdnGIhJUMdWCd?=
 =?us-ascii?Q?dVpIUWyjoR0+rn6oK9e8uSzflorArr/WZeS3uxAD+Q3rZ7C1poCNnehwRteo?=
 =?us-ascii?Q?gwtc9L/rq/jTFmjP3kK1dz+Z7i1047vRUbypj/g89jAngt9Uzm4WfCygcQOf?=
 =?us-ascii?Q?DlTf4CZruiuUq4ebmENGOByqPSLLdJd2worGm5tBJR5r07EaNmcYGDqXuCIM?=
 =?us-ascii?Q?LKVI8TADUpEh1y/EvxmoagnWY87m0BTFD+26uuobRt0sENitI3yZYJ2ncPpU?=
 =?us-ascii?Q?Bcjoiv0FSMb0jkrIVX9Y1Rk3wV3rwiGBVFPvJPeTnvhhjLsOxicJvAShQrND?=
 =?us-ascii?Q?AG6zxBUtacIujw2pYITyI/Smd7ZiVhvjGbVH584VycuJ0ChdsMmaM4qjhtx5?=
 =?us-ascii?Q?0VQ7FHMfEP4MkGHpwhtwEivVS6fmfCSbp8ufuZuGcHIsNwhNLvUnzVOZD/t1?=
 =?us-ascii?Q?RmNiG2+3Oa9diHiinR0P1IGqEUjzvxT3gckdtCkUPz0RKYhNyJeJW0DmJZsx?=
 =?us-ascii?Q?/58MZLBVEn1/JZqh3+MAUJcx9otYWuP0OC1Z9v4zXJ2kSA+rHB1z8g789QpF?=
 =?us-ascii?Q?T4eFhL7PugRVmnECuIZ9lXCKoIWK26EP/R4rQoWXKwGzEbQHJ6GtdWl5mZsC?=
 =?us-ascii?Q?cao9CIX/xUkCzxZ1mcZ378yeI052D6P7o+UqK9EqJi7QZwigzOupwK6bzQX4?=
 =?us-ascii?Q?jCV1aWWVUtpMJ/yiqthQ1JaX8AhdpOSNGejj6l1Yrp+0FgsTbLNRCPWm/tgX?=
 =?us-ascii?Q?eFCsXC1KHIokYp708u06c+889wdkdeprrBq+ELr/1xpR2UBbmmuBuXLj7GXp?=
 =?us-ascii?Q?4Kq0b0QQ5N2ktEU3ber75FLU7Uwb2A3eje09I8Da6znBrztnL3zj2VE4nyav?=
 =?us-ascii?Q?dbqn3OnG9G/A738c6u14qk5oe3uxjzQhfVFburVeLzjiEQUR0sJN0aJoegIt?=
 =?us-ascii?Q?p/wgRbHS9KlKawYsFmD0y5a0CSEmkldYXIWjM1M9L5H+mNZymHWn1MKwfs5g?=
 =?us-ascii?Q?lR8ct6cMXiBQm4vUEg0S29qvxWjjh9G/vLaOuYyJcoxOQkj5bWuJz4MqUVBl?=
 =?us-ascii?Q?neZy5mJMEBj3Fp2706lmbbW9wCAMm4wH4dR/F7Q/eBabooNYNkPNNz8FkME5?=
 =?us-ascii?Q?CkzSDVQQjHRDcZ3euqjAx24jKHVNbumC0BIVCZXR6jTQGND9n0Wup5hQwa4G?=
 =?us-ascii?Q?FcAMeWOf/dq0hdaM7eeLb0dIwy+Btg8GFcr6N4TnhKDino/1ViQg4Qa1Dz+j?=
 =?us-ascii?Q?lHWxD4pHufSCRNmfLlTmKnSditRGkGm/1+ky7RABBmEfzQaI5h4NKttDxJyW?=
 =?us-ascii?Q?rqShNHnDBkuuGrVhsYIMY0NuU1WsvH10fi23KQiDolMWyN4m4Ekiku8+It+i?=
 =?us-ascii?Q?OtHnlUPLIp6f66juSPvNplRr5TIhdM67zxeSUBr+v+3VusFDM9dmg2ucAdRj?=
 =?us-ascii?Q?3AaUXOD4sJRM2QKIFTcrrnp+z39jrlgp1UFpyOHNq/ux+F5cNggRpsoYGQMk?=
 =?us-ascii?Q?avePOBQEURmfD/oMl57GuPE4ssG2MvViKyhDAbgxSAKx0ubN8o5rciFOE1F/?=
 =?us-ascii?Q?5pCdHvgj19wcOaZdWB1STLvjwSfcQtOI1Ea022wk?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbf1fd2-040f-48ce-06fc-08dcfd9b15a4
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:30.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJa6gOjvWGSlnAj8WNcFy0uyN0TS4gB3TLW99KdlYvtSDgMvMl8JaUHDpLhqmJw3LHSTaFo2Y3CGRQGt04eTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9377

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 9eb6808..2818915 100644
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
@@ -126,9 +136,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


