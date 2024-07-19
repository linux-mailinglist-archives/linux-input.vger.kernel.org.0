Return-Path: <linux-input+bounces-5098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF219379CF
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 17:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 821C8B21224
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 15:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BE713D61D;
	Fri, 19 Jul 2024 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KD4E9Lau"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48C2F34;
	Fri, 19 Jul 2024 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721402601; cv=fail; b=ka96mvqaphid9VtFwVvjMEiOKWktj8H6pvsxL33j4Ve10tP8KHLnbfNygCq8xValEnq0LgWWI6xqZBlgNeSsCEyh2Ef6noq/+OjPRYeMaAfpKfh/op3at6hs3PPD3H76vUCaxr9a+JM9HeKK50vNXYc9ptL+iODY5HBa6n2WbvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721402601; c=relaxed/simple;
	bh=yaSkYmULS9NfsYLN4ZAoO3dBfu7AXIudyy/4XfC5RNA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KXaTH14MC+BqOZu9I/LqUXF35u9wPYqE0wnN6Dv0YlYPFnkvoYgSs+O3NYWp/4eezJ6AMtbAGUEdHBRK6K03Gl9mN5E82hFT6bdHR0EyM545+fwYSRFVk0Igiy0YQejJ+EX4ffWVFMkAI+QTNsAomDHo/9trxiRI0o5GduBv9No=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=KD4E9Lau; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdoCGZ8u+gaqV/0VjIBZQSJFQI/VYUSpgTiWTxkCU3+KBxpK7f4O7PNUE25cEPCKx2BEIADvzmGQMwygNwoeB32yV0DfNCfjkb/2W1mBFLBG2aIGcsk1QOAh2V/n3kig0JwOptCxaSdtEfVfFX5hz6R9AWPsAjAu7E9S7CZDh8ymPQ3CgaUupJI6QAHolhc8TeT7JNsobcYcx+JoYtHkYNS5zgRCkupdrU6mDL31xADJEAoH06EsJwsbQDnn2bT8ZKDy17OMXQVBSfu7dflIp3KG2SHXiS4UtmxDvQytgRM6sBOvrvebjgMbu3x3mOVjxPRkHFXx1qWNmZPWsLmMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqRlvxjPo10/PKom4QdM1Ycywdzatx/Q2b1NA4cCbLE=;
 b=QhkILBTIdbcOu+OyY69jA8X3VvOcISi9caRMKPcBAOSUaURKn9Qy413LRFISmuex60tLFEHzSQrM0zFF3gRnH9D6GlCAj1JE7iwGu/R9y20l7hxa5YEBAO4QNU+YHY0NKNvfDTP54Kg+wRdNAMCh8iSDIIGYK+cOejaJEyRaeKWltWUSSGpzXxZVgSsdpMAHgx/KH3YbsjCI5iUXiLQtuVFI2lwDgrq1mCJpa8SUb6tI7h04I9TL4VMvD03L64NxWiEfCmnrRLZbOPIcD2gnOfFrXE82tP8JCrmzUazhXrOLTQZ5Ov9h2KT/sMjHUvqSClg6a2VSkfy6EmPixSZGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqRlvxjPo10/PKom4QdM1Ycywdzatx/Q2b1NA4cCbLE=;
 b=KD4E9LauA7iL9GHY1rTbk67RSyGuedJ1Ff/ekfetuomS2ot7YTT5XLyfexCil3RN5ZHzCLlN+XXZmYU2D9Sn/NIU1GB56EDdcZJECqte1siUnilB5nrF6Rr9KEJDo2qdGC8fhJLx5xmjzNhDgZZEq6K2NvrsL89k2QNzv4c2NKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 15:23:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 15:23:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nitin Garg <nitin.garg@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] input: imx_sc_key: Enable wakeup according to dts property wakeup-source
Date: Fri, 19 Jul 2024 11:22:58 -0400
Message-Id: <20240719152259.760457-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9755a0-f1b8-42ca-88d0-08dca806b5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/X6aWee9ua5KEGMC8JCi/gzq6b4+PSP8Ca9HwxnR1HAIT/iZtLzXWPuVlq/J?=
 =?us-ascii?Q?fPGh/EYGQtn/1FOA6+g8nZdPHbGcYcJhussbgq6kqR4o0/sIdaRnTVMOCSDI?=
 =?us-ascii?Q?nz2myGfSbiuKojfF/Tb5A0zkJibojDJchyhhqKArz4Ht0QLxLa1NDKVUdHbj?=
 =?us-ascii?Q?YFwbVBX6Ht7BT73BG/6awcgCYnkI2CmSrZ86LUSROB3/wiDh1xw5qflOCJuC?=
 =?us-ascii?Q?G3iqIaxYawXkoO83nXNnBQQqFK5kCQLY/hHl+A86Aq4+mW6CHzCuy+Scc8I4?=
 =?us-ascii?Q?+i69RnTOOQ7VD0MRtkCq+89W2PGmQAdpI4OoEtHgv56CW41lXXVuPikGbIsK?=
 =?us-ascii?Q?Yn0kEOGML9Ajxe96/DewtLZYaC9CQb1G61di5/yZqRTWEnJxlBZsiCIl7DBi?=
 =?us-ascii?Q?gvMl0/UvjRmO2Y9SS8weZZOlNm2blAjpNtJAZ0lZeEaQj06AHw9oM7FRdpIh?=
 =?us-ascii?Q?v5r0HpZhxWSR0e8pcUacFBW1gCHxfE7SjHTq8/HVHRnsNj3Jg4pKTYfPwhhx?=
 =?us-ascii?Q?/JLECQKANHiITDnRDxlkQrOFy90IUquD+PeWxnsDPgXNLD9wCU08HM2mhuGY?=
 =?us-ascii?Q?dFpmFt9BHIEEtZMnlNNfxPqAPewp8G9U2akdYFXPWl3NU7MQviq0Qo155nm+?=
 =?us-ascii?Q?60kgpvkW9vPI/d9m5e4htuxbwEWyeoK3kBJGtXPl0LGa/a7ojitOU6Aa0Jwg?=
 =?us-ascii?Q?r5FWmK1sxcMcsZxOsFKm/mYVoH2mTeUUbymYjxKFnD7jLi2ypcr2DrGke4UX?=
 =?us-ascii?Q?uzLUffMXXTHe1lw6kIVi0QnYyLrEX7jqMV2HBhF5z9ZalMZJr5VQLzjXV4qD?=
 =?us-ascii?Q?dD+fPqBArOV/KMrXcqnF+s4hVjiTYFDXfVq9r+Y5fp+7wL3d37/Yz9YKNY5x?=
 =?us-ascii?Q?y5hom/Rqb9I3gspaI7/sJSZXMVOtxpWFySHFLytn0MKb/pyErfPvdU2JTysf?=
 =?us-ascii?Q?8OOt0JtY2ycnx42fDxEpyACNx8XLbBmHiEj9X9Q3VnssL39G2yttH9XlFV0o?=
 =?us-ascii?Q?5iinHjkEx4Nqe8DHhCEB6cQ6yceomEQ9iHMLnUOW52yDTaxbOljMeDdkiXAe?=
 =?us-ascii?Q?deMygU4+8DfnRvLz0WBdx75MYYnNT2SDBElr8scKY6oTj437trwJQK52be50?=
 =?us-ascii?Q?QNDVlEPldInCVLVARR5IvhzQ/W3/XygulC65kK/a0XSij6+l/lNfx15ElE+M?=
 =?us-ascii?Q?1hcH5AxWp5f1BC1OjZxDv/kepVctrlLPJaJCoZ1zYqe15AeKc3ienPE7U4bw?=
 =?us-ascii?Q?TylpncZcNiTzQay/ZoBYaAywt8DC4evSqloePdr33rx7+Ee2QFypjXWP9VB3?=
 =?us-ascii?Q?bpv1J1PLc0n/KysNPlpYRgejFf6zE5mxABeZAq4TFeVYpZPrm9xwA8mzSEIo?=
 =?us-ascii?Q?DaYj7cITMhZWbz4cmBQLNcPhGF+03teyuM5YBiP61uICEbiqh3YgRqpW4Qpw?=
 =?us-ascii?Q?Rgr2zGr8UNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?40r9pG6R2EVbKqcnQSU3Ps2wgCSyRrk2SD5eNnrihV3XPRm22y1V3Pdb/5el?=
 =?us-ascii?Q?QLe00rMOccuj1CBr8fjhl3GlBQuXQ/iBEOFWUBRONmMV7M2fj75LBSqIgmsa?=
 =?us-ascii?Q?I0RRpYjxGaQUfIgQofSzLUimQVFPkOLyeGlL2gjT6ZyFmmH4KVmneEaLTrSJ?=
 =?us-ascii?Q?3DXICLv2ZaJ3NWjEgJV41+GPhizNVA6PhahLOPMx2a0qZiqMdsl6GKr+eLXU?=
 =?us-ascii?Q?0AHXytj3KIFTidxCtZdS9lrrDG4zPwHt/DP58XFDVH7T8pjuBPiSanpw4/JV?=
 =?us-ascii?Q?wjBOccyAXUwDlSPauonTtqM7lrpyQpeJy9msuDC49uvnJpIzvrPf6yxm9h3R?=
 =?us-ascii?Q?2NqFaANIn36jFpqAw6oZoRZOp0p1tIdC7SMeR3pBEJqnPEArY+SJmonUD3of?=
 =?us-ascii?Q?V/9K9rdYzh5hTSlhx0aYXy3WhHzFAwvgqsWsQcixaE4bqRMuerb/Dv2TESKo?=
 =?us-ascii?Q?uEzSXXEJ5oJXRvHeow2fY0d3m4L0j6m8dCKEjY0RAS1DUuGqNyRUnJPUWL+x?=
 =?us-ascii?Q?WiErmayf3fCybjMxrkF0Fig02xE03XOaELpP89BOJcllFVaDnzK/2pGyz35C?=
 =?us-ascii?Q?IIZ+WEgx04QcdfslLLzORKZLGOyr+nVhGLgAeNTqofzgZvWsOLJO8tELafLl?=
 =?us-ascii?Q?7gRw0qCN0DrGSVvIuF/tlK3xTUQ2+Q/eKD+zy9eNyM+dsr0oEhxreDCOzemj?=
 =?us-ascii?Q?sFiPWJqh7l7SGnZZoQFkLpu3Id85uRE8ZjoaQ2VDPsMJSnoQfZGmhOSZo6rb?=
 =?us-ascii?Q?g2Bb6+xtEmJGIBZuHjAEgVWWRrCw5N6qcBA0mDXAlJBf9BgkBDcaEzTiV9TH?=
 =?us-ascii?Q?s8z1cGyzbJg7izF3pDj4HO6SPb5jDpTKJXlxxXyjsWQATR4VeYrKsHxBu2pl?=
 =?us-ascii?Q?5gtbuBOLbltXDKzZAZuYPHdeNcIFUzT/Pcxq2HmpQELqxqWb48cpOrwELwdq?=
 =?us-ascii?Q?DLRswkBU7TeY8lzFxe0c/Up83rsfqJ64K6bJDKCYQ/lE2SvpU3mdHk4DH3m3?=
 =?us-ascii?Q?afDEW0bdNUSjJbk1xVyl1it5DDJhYENdV8Kjod9YgqrneHtYGbUUndBtSgkN?=
 =?us-ascii?Q?kAVrk14WQsvARpgXA/MEvE1BZbMesMWmA/c0+SwHyieOoHO7/3vdPjcs+Ceq?=
 =?us-ascii?Q?UX1U0kEvuIz/C+2OXkSiuJluF/Ta48qDZFSL+cqx6bBHGW4YQfstkzHpydEl?=
 =?us-ascii?Q?IsskgsXP7AvBvIig+kfFHtbmZO7FTvka1pZxouUkyhRSCHSldNNakhiAbCWa?=
 =?us-ascii?Q?pXVedcyu4hEmLxlj/NPYddTTIoBnXdl5YxBTnkGgFYxT8Hfs4+bXqzGNGUTX?=
 =?us-ascii?Q?7evzyrNL8NyeqUg2ul4/xZsiwCeXRSXOjZg+0gw7pUdTfUXGywdvJP8QS96S?=
 =?us-ascii?Q?ZktK8KMc9z5ZSJijzleY4J3/iHIlPnt25Lw0PXFl/xKPfjWC+TqWWrMVbQov?=
 =?us-ascii?Q?kYCp8fEnrz01/OBjDJV0oAvnvAD5YkpvwahN434Upmg8tVFlISqU6BikF2jQ?=
 =?us-ascii?Q?vWOstmQiF55w8bEl5CrGBpOf5vZb0GPR/vPEHL13a9PsweVmDQjdPAVASfd1?=
 =?us-ascii?Q?RCj9H5XIwTlLVhzWG00bPLx04hch26LWSD9AiyDQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9755a0-f1b8-42ca-88d0-08dca806b5ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 15:23:15.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heiXoS3lIpNGzXplfTPUWrFREQgEwI3NykVldi6l7YpVsZ5q/5xUOecAiYHe8ub+sywZcsN8RB8CyrhXE9DUMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770

From: Abel Vesa <abel.vesa@nxp.com>

Enable default wakeup according to dts property 'wakeup-source'.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- change int to bool
- move of_property_read_bool() just before device_init_wakeup()
- drop !!
---
 drivers/input/keyboard/imx_sc_key.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f60..fc1492088b645 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
 
 static int imx_sc_key_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct imx_key_drv_data *priv;
 	struct input_dev *input;
+	bool wakeup;
 	int error;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -151,6 +153,9 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 	priv->input = input;
 	platform_set_drvdata(pdev, priv);
 
+	wakeup = of_property_read_bool(np, "wakeup-source");
+	device_init_wakeup(&pdev->dev, wakeup);
+
 	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
 					 true);
 	if (error) {
-- 
2.34.1


