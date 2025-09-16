Return-Path: <linux-input+bounces-14770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AD7B59F02
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 19:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12BA33AE8F7
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 17:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5597B2FFF95;
	Tue, 16 Sep 2025 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Vd+9Mpq2"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27334222575;
	Tue, 16 Sep 2025 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042831; cv=fail; b=AJuCWU1pxdaeZ3pMgj5HOokuRWyn6QbdFg+qn3pNyHFziIG+4toBKWjyq78IoaKoUcHASOuhlxoutTaQgZAB9G1jizuIfVtSA4DevtWBbfR5jLilY/5RlSo0o6mA6oUGTFdc349bbXj9AqnFfrsz1ZpQGUcfwL8M8uC5sEaYO9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042831; c=relaxed/simple;
	bh=YW9K12BZr3U75DDTX9cGptGLttUKkxlgzXo6yqeeNe8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L5GE3cmHsSb/ArcgAJqLfk7Uto3X3HTcd2bKrX/mlACX7PpgRjz4SBgNLmeSdM5PeCD1D6IC+BBk1yPTxlSn83FaxsGeRpq2CFRwFwmQl7D/svrurAmiLP2U5xLaKS7umF9dMXeqiWCeqnfqyR/n3D4lfw2T9MHAmNJlrsbT7J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Vd+9Mpq2; arc=fail smtp.client-ip=52.101.72.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZdjiQe/4R25FBovH1P2jlN3XVq2bgoAfjVO6rKs3bexVzPh8tA8oEHI6VH7KLfnRF7gX6t0hmaQ5EloSQBATmn18Pzpd9Cu8QkgOSULuY+OTDsSIWzbDnau3WEXHQpjQsQKviuk2qX6AXJDZY2ISKEs/Z20t3oyo1qKalNde8WpgV3C2b5JxVwQzsbY76YkiEaZXA/3e+0Wr1MbaLD0VbUJQWR2h1NRt0rUVsYHFNUEB0AntbvosIDxuwwBfOEYgR/t841QYlxRlU7eVygFJ8f6pH0cYl7tjrZ5Em4c3lH8gz9XREIvo32I7p0qnoYY/5s5/Mv/YDBgV9GieLNctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd53B0DDd+sCElPXdFSTQlPzJV3VP2CDPR9WbBT96x8=;
 b=QhDjOy4KvfapS+gPm9UQJgBSlf4zWj0JsnZ4hSV5ObL++y5Ozl8dHnPu2dsmh2ucvynGVR7/ghg9PwixisKxrz9j3vZ9Bnk4ywcwI+acgseTNxhH7AMIZtkY81ZXACQL4N3+/rszctOpl0QbKjF2/DWS6iAavjg2WMYQjs7CRf+jZb1vN99KbZtJ+QvQjNAfZXrTWwWAq6furSLe2/frsYEzRzGoafZMSjpTnD1Nfx+YxB5k1QqOeuFnrtTewT6tQCbPR1v26SNiWjyr2xxAfBYJMHdknB1pR4+jOeCaoGkejnrnMTIxPnprBWV6yh0HVuskQ0slK1nQmtXhgHI1Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd53B0DDd+sCElPXdFSTQlPzJV3VP2CDPR9WbBT96x8=;
 b=Vd+9Mpq2RveHMrohYFGHvmpQMqeNFSiDkIXDHY9BdggE5mZjQR6vgV616k+UUnMj8aTAOnc/POkP7rCWPMmi0hvwD5/KocCkdbHJigDkv8VXSg85WAZjJvhwWhFEqpDMwK+bBOOzdhLVNcJtYTsVN8EXL91oJPjsLkOd7j0t77Rsye2Ze6ixmaZvGZ1S+mu2WRs5q5rb6wbp+P94m5Vvl9PKcZShRb4qdNiLvxHnbwJd2IGFqsuwIx4XAcd+rAuH4GEw+2gYcwyrsYqAGuMfX1L3vGZ3x2yyGFq1LRHv9vyVad2A3AZuQICDJUyZqQgxXUwIuafO/EbY6ZsQhAYAug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM0PR04MB7075.eurprd04.prod.outlook.com (2603:10a6:208:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 17:13:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 17:13:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: input: convert tca8418_keypad.txt to yaml format
Date: Tue, 16 Sep 2025 13:13:26 -0400
Message-Id: <20250916171327.3773620-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM0PR04MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c7d9d25-bce9-4716-c10f-08ddf54464d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LDyqizBP/JBsFAivflMSzK1p+jKr/lzTJ1x2FDlbpVEGtcVp4T98LmAtNlPv?=
 =?us-ascii?Q?7xZvadjUtlq8oSTA/gu9Bsq1zoo3G2MaL4JmFDutR/ZAYoBDbJZAPaAWHCbJ?=
 =?us-ascii?Q?kylJzmDSevdohdmlJpcbB2GPDf26LnvYmAgeCMvrDTfF46C6nYikgVydMNAv?=
 =?us-ascii?Q?der8Q90F4Doy7QjoQ4pVPE7MZuSYi2lK7g0icngIUBjFW5DEZjXmAJuQbHdG?=
 =?us-ascii?Q?TvfeJc1Np1P/5wVm67KGK9fQabGOqkhuZI0mjrpsayjN6u7CdCvjr2QY4CpT?=
 =?us-ascii?Q?uII0YTmuvNsxvmf0vae+vdYIawvdm0A68uSiwEX2LtRd/9+C058Hru9SDOri?=
 =?us-ascii?Q?KJK/a5yknMWQe1/SN/HT3Vv9yLi9g6F8JIkDPmhDl7QGQRS+1jZFYboRPocL?=
 =?us-ascii?Q?u+YYVe5tdaL2h8f6SM+2JrTEzqK8GtD6D42ufunCMIXXRdKDfHZi00r6M8Jf?=
 =?us-ascii?Q?3khXm6QMM3BS19+URKqcbmbE1v1VtnbIKp54trII/l70jJKILAGJBd1kayrH?=
 =?us-ascii?Q?m9Y+8Uy2QNYqjnVZxTmqwy2SKjn9j+rJ2bE9+CNaKCjFjiEyNLivTGoEc9ga?=
 =?us-ascii?Q?Ok8OjfatFpvQq3sOY7FtaLB8mKNQpw4MS1wvl3TuljLFdoAqku8hyGaRmJU1?=
 =?us-ascii?Q?fbd7gxJW1/3YQiZ7fyjTbOvB9Z4XZsSuJAamKGZl4cl5JQ4zrquZmVRDXEEm?=
 =?us-ascii?Q?ZHk+dI8SCTmObVKNDw3LJejcMmGBz44hLGOcs7/xdVr32kAj3/qDBWsT6tpw?=
 =?us-ascii?Q?d6USKR+hjgYUwrvV1f0baVbjzU0a5cFMrmNCpyPKO61HqlJ3meXDSPfe4qq+?=
 =?us-ascii?Q?bRkH2xguPyLEDe5mveaEoFIArQRLzVYLK9Ac7m1xZ4XmPnpnsh006F9TWts3?=
 =?us-ascii?Q?9eKx36vciiDkiLqufObq8eph1651Y/K2C6P9X8FswyRicSP77Q0wUNQz7c+w?=
 =?us-ascii?Q?Vyh754cKLYlVQmw7l7RyCifS/7mWzyC/8LAvU1aO2rzfBBundMcjUCvbhoeP?=
 =?us-ascii?Q?FVXU/ff5kAe8T82alW9KlVZXbBo5LymHEPUGFc0dcHG66ENsew+HIyuPqDyc?=
 =?us-ascii?Q?qleE+U7lPP4yUfzk4iZfECJDaZccLiyf9p0H8y1szrafkvjduQlHzoNch8M8?=
 =?us-ascii?Q?kYPY5jogH+FRtt748vul2A7a1V93GajZBCo7Ime13S5+aHxLGZWM1Nik7gtN?=
 =?us-ascii?Q?wxx9KHlo47fdmioVGttgUNzoVynTbFlzT2/rWvck8LBQxGA7o2rUWku5UiIy?=
 =?us-ascii?Q?++gIGxasV+BBruNFiNwUOt3aFCVY4V1taFnwhbk/pP2C0kxAHiibvrPxq03h?=
 =?us-ascii?Q?nxd/bv5uTq0EunhTBmYtxwuqlXQRE+7Tq/3Ypp72OQrB7jghntpfvKlmycDG?=
 =?us-ascii?Q?CUErNQIroPldfrW4/f0Wk3MdETzU5L3wdK3eYDKtoQMCneIUccsjleyCxhQ2?=
 =?us-ascii?Q?m3sds8KXMPS0MDr0W1dHptak0peLlkFNq6tO8+DGJkh7YacSrBemnJC0aB08?=
 =?us-ascii?Q?k7nP/y+wm4UN0ZwqToKsaDjeHOVomapJ7VQSxYHnBj+ecWqJQ4Bve00xAW8V?=
 =?us-ascii?Q?InM1f3xTHr8gPMD/RO0ZlMGtqm+VccJT8afopMDXza9uWq/HQ+66wNrRNJwb?=
 =?us-ascii?Q?iZvExHr6EpG7DmunlXEZaau3pteMgJOflxTyLdFGQ1K803ygBmpST2zL8MiQ?=
 =?us-ascii?Q?yXCRVeDrGO8IH+P+bcIWidncqSF2roUESiIoO7RW1FqQLBfj6s++O5AAZrnd?=
 =?us-ascii?Q?M/a230RguA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?28ahXiNqkzXrNPzWiXHj4uAfxlDjECY5NhGgcutr14+jrXNMOgwiY24iOeMC?=
 =?us-ascii?Q?440gXMafuBbgjWwJygA2eedXw2HxZ6ac14Q3EXL1kD7WXtdpv2HvJivHqEJN?=
 =?us-ascii?Q?5Ph/OyPE+qvvYeR7xNzkqTYiwzSkLib/UyrohFGlJX6+7JG91156FNHEC39j?=
 =?us-ascii?Q?jZEkDbW+iTzikYjXfs5+gYAJ4OKTeaIxfe4O+D1IkDFMP8H/KAu4RC5f8EcR?=
 =?us-ascii?Q?ebS5i/XCPD5Slo7vhFbrSrz1bkS/XhezESavKatWvDR+daEqic8pix6u5WDE?=
 =?us-ascii?Q?ypXK4OtMiOzeBlcCvvB/ox3tMDLH+ldDx/xDq3ZbVjtHuBXwVVFibbm793Jt?=
 =?us-ascii?Q?7RDneV/i3891DY5P11lga/JzGt6KrPx9nDDPtPSAJBXf0DKVWnykwzmMjtZu?=
 =?us-ascii?Q?cdldRep8Y5IDMDY+c5UqNlrw9iMdGRGC9nU1jQ0QmRJT9UBudz7L+Cfbcf+x?=
 =?us-ascii?Q?w66xZVfpD8A+8oxRIMGIUDSjcrrGOC2sLFzhzPYCfnqbbZRCy3GZOgbHqvkB?=
 =?us-ascii?Q?Mi0pgTbZNBNOBHP5H3voL8WIDoXPC3EUVpkwCyGXWqMftIL4RI5sJkAkWY5F?=
 =?us-ascii?Q?628aUY6ynmr62q3c1k/HjUMyRnf0vJwFEyAlrZLdk2AdaIPp0Kx9HXAijBkP?=
 =?us-ascii?Q?MLDpysCweklDWQYeYiVotNq7B+BGAfCdtzOOjlQKC8NyHCpXHl7Mg6ymqCNP?=
 =?us-ascii?Q?+SORze37+2zolhqvzSwBf5qw5ajAvRtgyXqhxBvG7m/bPcT7TwX9syg4bNKW?=
 =?us-ascii?Q?Y/Pgcv8D57uwkUgBrqUII9LtwPdGVZE8pNJ885DDmu2r8vtt1m967EcfSfY8?=
 =?us-ascii?Q?ap0Etgu39y9I/qCG+VpJ0SYCaiQDWabqTEimiSuyRpdzbvnMmzZ1IIKupX7T?=
 =?us-ascii?Q?l7lDFc2jKmsZ9X85BugIWgIpAwadeJvirkez9fLBH3BsW81wFFvoOVQieDOP?=
 =?us-ascii?Q?PvSKGKzAT/rOCyfVRitimZBZV66w8XDSnLNOBbykUG7sgnk/ryD7fpq5BfTJ?=
 =?us-ascii?Q?rOzraP9ey0Crd/Q3DxJsVg4ZDTGJ3rcWrbv+SPLb9P+L/xRsoZQ34EVjwxd7?=
 =?us-ascii?Q?KPJwmjiPIt7Acgkd5StmDPFkURBhfU0hll40wmPEXyyGwLd3+H0iKRGie3jq?=
 =?us-ascii?Q?ZDGm0a/mgLvn7qEzWTlUcRhiehJva3JWNhTrG68eSheJxyeNvA8Q2FzgI4n3?=
 =?us-ascii?Q?8UWJZX3/Jm+/QaI1/45yYE8KzJVzb3bspPlJuflzL0P2kRKURkHCs8VUTIQF?=
 =?us-ascii?Q?U4w9NFw5T95vbE/aOcAAg6eeZNiGBkLcpEW674PtF1waavdnbfuBW2y2c47A?=
 =?us-ascii?Q?/jBx05SbmZuqgPIuVHiS9h1PIlFkASecHodcVDxzCURz2wELQv5Yuvnq/XHr?=
 =?us-ascii?Q?jRDWLdt9nsyV/KqeuhvP50rpDrHqJnbFSktThDeoL4+fEuvXPVjjYMVtQald?=
 =?us-ascii?Q?xaT2kWDCLrQPl8XS2nNet8EksSdSC7tlCyVc2IJ/rCuxKDrKdBWDsIuiU0ye?=
 =?us-ascii?Q?+rMmAEid9ZSdeE8qWOS+hrcXk60NLhJyx5Wov4iDF8QDv4ROLq6sMaeNTuDw?=
 =?us-ascii?Q?ErsCCJkFDJRANjvDhZgguVvAfPTWRzhFq73Jfu8D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7d9d25-bce9-4716-c10f-08ddf54464d2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 17:13:45.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gM9vcjfJ6A9Q6VRm1JJLiInM2dSNVzDh5qyw7CV7X5LNF6/xbdfwKFlnGoOKQiiI+0LfnNYhk0D1EREpvZD3bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7075

Convert tca8418_keypad.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add TCA8418 to title
---
 .../bindings/input/tca8418_keypad.txt         | 10 ---
 .../devicetree/bindings/input/ti,tca8418.yaml | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/tca8418_keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,tca8418.yaml

diff --git a/Documentation/devicetree/bindings/input/tca8418_keypad.txt b/Documentation/devicetree/bindings/input/tca8418_keypad.txt
deleted file mode 100644
index 2551850091678..0000000000000
--- a/Documentation/devicetree/bindings/input/tca8418_keypad.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-keypad,num-rows and keypad,num-columns are required.
-
-Required properties:
-- compatible: "ti,tca8418"
-- reg: the I2C address
-- interrupts: IRQ line number, should trigger on falling edge
-- linux,keymap: Keys definitions, see keypad-matrix.
diff --git a/Documentation/devicetree/bindings/input/ti,tca8418.yaml b/Documentation/devicetree/bindings/input/ti,tca8418.yaml
new file mode 100644
index 0000000000000..624a1830d0b0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,tca8418.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,tca8418.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TCA8418 I2C/SMBus keypad scanner
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tca8418
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        keypad@34 {
+            compatible = "ti,tca8418";
+            reg = <0x34>;
+            interrupt-parent = <&gpio5>;
+            interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+            keypad,num-rows = <4>;
+            keypad,num-columns = <4>;
+            linux,keymap = < MATRIX_KEY(0x00, 0x01, BTN_0)
+                             MATRIX_KEY(0x00, 0x00, BTN_1)
+                             MATRIX_KEY(0x01, 0x01, BTN_2)
+                             MATRIX_KEY(0x01, 0x00, BTN_3)
+                             MATRIX_KEY(0x02, 0x00, BTN_4)
+                             MATRIX_KEY(0x00, 0x03, BTN_5)
+                             MATRIX_KEY(0x00, 0x02, BTN_6)
+                             MATRIX_KEY(0x01, 0x03, BTN_7)
+                             MATRIX_KEY(0x01, 0x02, BTN_8)
+                             MATRIX_KEY(0x02, 0x02, BTN_9)
+            >;
+        };
+    };
-- 
2.34.1


