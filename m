Return-Path: <linux-input+bounces-7789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC999B748B
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEEAF1C247B0
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D7D13FD86;
	Thu, 31 Oct 2024 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="GfINoTzN"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013046.outbound.protection.outlook.com [52.101.67.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2F7A15A;
	Thu, 31 Oct 2024 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356237; cv=fail; b=gGULCFMZYcT3zMlMHFwkTM2D3qkmuzPByfwRMVw8iNF5VTqSHj+uRTki88eZ/hgwvCxhSkND2P6Wzv5mGMDkxj4aDrZgK6D3lL+QPHwbfYZQHEFbL66ZyWUv0VnyrTrfApRWb/Mgt4aphiUJRcr1TKtbHE0PsnS/+Eo8UU6X/m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356237; c=relaxed/simple;
	bh=2JgJUp0muyY6HKUfcYE7hCw4Uywu17MgmCICSXHZvnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vfs2PNzeIZk01Re4RvghnB63v6Gbf8KtyA5zISV0WbCJ11zVqBAkQUfQTcaqSV831hxnhMzns6BXrXW5L0NPyoxWexEqtPbLQUVB2nzrCMaybcw4iZ2GbPKZ6wXQUymY6eXA1woL50qQmNjsShnyWpRzcAHsKaioZ2jD2cVUYKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=GfINoTzN; arc=fail smtp.client-ip=52.101.67.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oaJX25RzUZ4FWx6/VQdJ25gbZJ3Rp56S6Xwo3WJB0eat0Wlkp0uqWcT8lzqdNx2pNz9+LMhx4PlxP6Wm7bRb045u+q8bnRXAxzCkaq7x5B2tDaSa0lg19gZVay0aXhWLGqNxvLn05IFx406IDZ9+y8wWqsyG+EkA/fBlmm/2TdONhjMFMT23x/YPb+QGOirxiWG67+xce3lZrm9hDB2dJZWIbluF5mgNxJ2dx2AdRsrR0T4+hrIW+0VKgXQFYSp2ZkwYTK7VdXPsdeTDqkFXP0rCqsg2sD5J27bfN9J4qD5jc0s/Sql1CZ4Tmm+FOU9VfBDYamnp+j2tF9qym9GgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElWlJbJZR8MOatkQ6tjF16LmsPBk6+DHoeCHsZS8qMM=;
 b=lRTx+CPzELIgygvsqAqniPMeBAh9sewKnPWtgPt9imySMldFMjazO4R2ay6kjko6bJCM/96Jgf0GqRMvb+FxI87F4hQGpCgjtQ6cXuvuI7Nx/+mIfm4F0c7WY9HPwG2XI3LrGu4ABD6RX8xAdL0J8eHmRSQSc6HEy7uJ3t5GxdBW1kh46bdu2m69AfiGpavXPmC5HwAxExVPJ69YCRXZzR/q31ccgAm+tXKy4vcDwBemJo7ywW+1J1bqCesLLPADCW8tQsLJctokP6BLR6YhNZd9Gk8I9/jkk0nrorRi5knx3NKr99Nq9J9ENAFOGJE/uPKP+AV+acPiML0fyn+8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElWlJbJZR8MOatkQ6tjF16LmsPBk6+DHoeCHsZS8qMM=;
 b=GfINoTzNZS2uhBbRb7z23AQWZHHxJtEoYWpPQwPtR767zAO2VmrUfvdFYQADY0VbweTroMgkNAEwfayfs53EKFM4Lkv/FG3PDHuH52lvCBEk/nlLCHCjeUDB1W/TKsAlBvNO6sg7QaCQTqT70kTe5RgxmbFQjw/4eM422saCgP18AMqImyIDfwynW+3bmHtzqhPk8JkIZKcq/MZyHqTbcn5Qk3VCNdcUTZ+aD3smXd3Dfdv9wjyx+YibWf0OtpE1aNov7SfgVFihe67DCAWVn94+XfSJ4vQhJ3JVNn00sWzPQ2YAjnCWFg0MEB9jXyH8dKssu6lFSoX/BkNv5AOq9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:30:32 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:30:32 +0000
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
Subject: [PATCH 1/6] Input: matrix_keypad - move gpio-row init to the init part
Date: Thu, 31 Oct 2024 07:29:59 +0100
Message-Id: <20241031063004.69956-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0087.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::20) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bee9d6-cb3a-41d7-5825-08dcf9758527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gBBGzupsebTPHTBV2vjtvnSwrEQH63Zh9I3GAz71UZ7FJcBFYdHEonTzvcih?=
 =?us-ascii?Q?+jxV0WwuPOKb3J7WfJJh8JdKdbOD3lxoSux7sRh5zE/t9zvpKNMt/hUEh4Oq?=
 =?us-ascii?Q?q/9PVw9Cw5GgVR65R0fVbrgWwLrdzxQU/33oA6xViS2U6ebnfIAE4rQTAG1r?=
 =?us-ascii?Q?Ld1bvH2jqVSx+LhGUATz5V6K/Ifq9SFcwpy4o2f8AFKSf1wrDhql8U6RvELh?=
 =?us-ascii?Q?OGRXoxz89RbCORVaomAzGcb2sgJDs7gwlAiNd+/w/WfK39zYueIZROB7qfAz?=
 =?us-ascii?Q?mpwafUL90X+EQk4Z4FmF2NcnOnZyhNI5n8Roh5X4gWOiobRMmFdnsb13B1cb?=
 =?us-ascii?Q?02Blc+9S1miLKEo8zEYHiFUlfrKX6zi227B56pPRkeNXIyFHL4931UPcq8bt?=
 =?us-ascii?Q?sDHk84yZwO+FqQkO0tANLLQTtQerKlZS5oE02Pykq6x9J2BTxKCbY9Wu1XNH?=
 =?us-ascii?Q?jP54lIlIehR7ml9hwMuyAccnaxyMhUpuBmH2TOQ5CYXht+rVxdjdhYzhZeHN?=
 =?us-ascii?Q?dPkp+biiCI8QpXUgTrRLtPVTBcUTublgo6JRN73zDHb1mPOnWFbSbLBxmpAV?=
 =?us-ascii?Q?F5Ts9HOywB9NzZEsXbv3eTmuwR30kBMyrteZIJr8qM2WxUKdROE3yd0ItZoQ?=
 =?us-ascii?Q?/qXB49kkXqWchsbXlDUdejM6x9V77XCVFqtzeLt23+H2k42vRvfVnrqY7Y/W?=
 =?us-ascii?Q?W7F/UBxaWHzq3T9VUHwAqJfmQIhA+QmpnW2RSDMnmyoRiHQy/fh25M3zVl6X?=
 =?us-ascii?Q?zrvHNh0gnoUdY/ZdhDWU7b9JTH2MeO2M40JOVXpb/l0UFQEz3Qknyxpcrx0w?=
 =?us-ascii?Q?F6BdSt51P+axRHz+pbmQVnIKojMg8SChN3RPx9JyFO+vE32Rus+yoFSuMMHM?=
 =?us-ascii?Q?wsrxHfvTannGEhuIPX8NCeTY4Xz5SmJ62qg3EontQ04cjhKLewPWzmPjMhuf?=
 =?us-ascii?Q?9Xi4zJTApeQ3bjsR0J1eeC5HKCG5SoSuIOrr6a++4jdOOJlqcT7f9YzuA6Ll?=
 =?us-ascii?Q?ye2Yh9tkGgf0aLWXx6jwOxJOArKdzcLkHu6tQwXYYNChvlNW4hxgiXZ9PGGD?=
 =?us-ascii?Q?/bksiySTb7TECMTSIqrXx9AjdbRNiuNIU4DuBNk006J4CgqmK8Gh4rvi4Dpw?=
 =?us-ascii?Q?mtLD0uKfkObUty3OmQhmms2AKSfDmzVDHbaqNoWXhLAGvQ3uOjsbF1X3EoHj?=
 =?us-ascii?Q?M6XU3zmWFxFNxpNvOJmngwDYGnDKyr5Y4BlxwUDl2IT+1Al5WS5VQYA/HYK9?=
 =?us-ascii?Q?LLIueJdyrNPywLgX0eeT5McrMVsEkv8QofEhuEY60FbSBF+c91eywXnTV3/E?=
 =?us-ascii?Q?fYa0GKS7mgGyYrSAQJpwALJueA/+rSFV2pcnPLvHv8dOMd6oOGLDluxEEg+6?=
 =?us-ascii?Q?BVdUTfw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMSRwuBgpNFyRe6/E41lxDt7lYNlNSCMryuz2GOdMBK9LfKfJorPVmYzs9Rr?=
 =?us-ascii?Q?R85r0MC8XSMsTEUStIyXXOjb4j7CAMSCKp61YCMNZZdC3k4FtKGy/8i0YoPJ?=
 =?us-ascii?Q?yFTjZ5Qa2VUyfduFoFLFV/GQszE6Xc23qXh8bCWe3hruPAmhcJUHAq2JQMes?=
 =?us-ascii?Q?J5g7OL8VGg2spcUj7jCj53cNy+u4Hcuc0B8JkeYxRec2wXiiR81NiYqoqwQq?=
 =?us-ascii?Q?2kOL2kwXunYKxhQ/KVSMf9Iu5IRhWjWS3503cjCTOz0yYZ1bDePnP9LH73jD?=
 =?us-ascii?Q?z2hQN5VD/7h4+QXEu9QA4RV/XsUmtyHciTEc4Saqb9cfIv9NYDfq8Q1UXR0L?=
 =?us-ascii?Q?TqGR0iFhcTpzuiPdCS4VTeEo0dLFiS5wDdDS3TB8Fwpw7ihHl+tBJqVzhzKG?=
 =?us-ascii?Q?eNgJ6dPEug1EOeT1jpSsEeMAbL9ex5x/Q/M6ZJsfLE5LY4KJdHga2wDGmWGH?=
 =?us-ascii?Q?Zb/hqrpU/FY/Bk1/juy+X441rxwxUPcDlUKpaHqrRqPTLy0w/1i6uttcX/h5?=
 =?us-ascii?Q?U1lebzyIxkQa9+VurfWIfT37beLJ0sm4L2Sv9Yiga9ccUAZHX1qyb4VFM1MY?=
 =?us-ascii?Q?UEe6U/tB6L/9yTatbBjj6AwbofuVUgl+qbOdgjC3JMY9LhG9QByACWV6hXbe?=
 =?us-ascii?Q?LCLR01AIaQkXJMrf6a/2iE4Nk4iHeZmj8Sl1q3Ij5jcLptJD7KCm1Fhw0CN8?=
 =?us-ascii?Q?dwiVRL46vcfBJTIQZRSLWLJ/Kh3WqFx9fPfE0z6f9sZgC1ISUsZZ7LxAtnUX?=
 =?us-ascii?Q?zIPNJeLFoqUq2xeOXPGhsOYe98rWEgQLQ6VaF9liZg34cVVJriP0PONiSw9V?=
 =?us-ascii?Q?+SS3nmLJUmX9WmFaNHtBJZh9jbwHkWbvbg9QtmDUHS4GHFA1hZdqXqjm/W/U?=
 =?us-ascii?Q?qQO59SuXHNL8/kCRfwE45Ojww1dmUdHjhgntBlJ/9njB8dxcPV6ACFIyonii?=
 =?us-ascii?Q?0YNQEvjHVCJGAwY7GYH4Bu3m5dRqdeJylzn22VrQt/8EegyaEBxo+v1kV4Bu?=
 =?us-ascii?Q?2zUZa+GEjm+mo9xLYiiTYLz3dUoDq+gNtU1h72OO5NUjp+PUE7JX9qI6QuxM?=
 =?us-ascii?Q?fybpKhnWI0W96jhIwqDRiUofB9hzXaW79o1LCXfvkjNA133aC7DW/RDoI+U3?=
 =?us-ascii?Q?sbE8CoPX0YmtCnQT/K0sbas5rFDWdNfbtSIfvx7fCe/+kXDW1KIkauOZxSEK?=
 =?us-ascii?Q?Bv+QAj6mpNku3GQQUsG7gBEDuTjkERigIWsoDE+5mJTV3KOa5iv9dOURWgif?=
 =?us-ascii?Q?iYP3cjyL/Oyobkp93+B9b0tofZADP82Ycz+MkWoAS55C5RFcTOL2yXjVF0qu?=
 =?us-ascii?Q?0nSFEb4Mdubv17I0qFq3j3C3/7l4oCVPzFtxNdRLTkgsLt5bDEdCBSqlverE?=
 =?us-ascii?Q?VNuVO+cNBqPfkRMmVeKbwtx6x+YqJ60HoRayZqRuVWPFey0zCt5fVSt8HSel?=
 =?us-ascii?Q?TbmS9Cseru8ooXuWUZ51h/IsxYj4tHQfV/26qWPjKZM+eoljkq1Uk3fpnYnz?=
 =?us-ascii?Q?T+jtS7lxfHVLOGbI3yGORW64BjtcHoicC/JuerhM+k83YHncPV19Pk0xKh5+?=
 =?us-ascii?Q?WrKw3wANlq4yAm0g7xagsloccPgFt1xh1Xw4Gauy?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bee9d6-cb3a-41d7-5825-08dcf9758527
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:30:32.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02/HTA1LlGn3OQA3RaWYxbfgginRuThcQotbXcZRRNs+ALDS0eqFGnFvjcAOl9l/8EUqouSFCdvGVig1xeA64w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

If the matrix keypad is wired over a slow interface
(e.g. a gpio-expansion over i2c), the scan can take a longer time.
Move the initialisation of row gpio from scan to the init function will
reduce the scan time and therefore increase scan performance.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 3c38bae..a2ec9f6 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -118,9 +118,6 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 	memset(new_state, 0, sizeof(new_state));
 
-	for (row = 0; row < keypad->num_row_gpios; row++)
-		gpiod_direction_input(keypad->row_gpios[row]);
-
 	/* assert each column and read the row status out */
 	for (col = 0; col < keypad->num_col_gpios; col++) {
 
@@ -326,6 +323,8 @@ static int matrix_keypad_init_gpio(struct platform_device *pdev,
 
 		if (active_low ^ gpiod_is_active_low(keypad->row_gpios[i]))
 			gpiod_toggle_active_low(keypad->row_gpios[i]);
+
+		gpiod_direction_input(keypad->row_gpios[i]);
 	}
 
 	return 0;
-- 
2.39.5


