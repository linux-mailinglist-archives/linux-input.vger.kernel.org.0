Return-Path: <linux-input+bounces-5063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BE19333AD
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 23:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBDD1286DA3
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 21:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5B813C669;
	Tue, 16 Jul 2024 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="H11ulwTO"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013034.outbound.protection.outlook.com [52.101.67.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56B182B9;
	Tue, 16 Jul 2024 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165617; cv=fail; b=HPOJYc25AT3I0y5tG5bR3MeDDvO2H6rOP8PsKeGL/V7Fkclr7Z9zfUu5jZg39W5R7KjrSYzTMVWrdMEl+GWgcjUQnBmlez9HK3ToW+n+YKFB8hgm4d/SRDBJQMU3Sx0KUHOBVaUDh6Z3YGx+aPw5SPPgyVBYaZeoL2T+18eAYzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165617; c=relaxed/simple;
	bh=Nz1v5wK0FL9JFar1v7eRdsJQgS/yOHcEGXE8ejI3epI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gjCJXKYatbuCI8iYGmaewt/4u85rloLltM/+m/RSEvcQX4lKYkFKwOryN98b69LazHB9Tk6cH38SGbceKHteI6h/sW+By9hV1YjKXe6Zhs6rR8x+TgBVD619ejm+y8CopAfubcGT2mJ6ejI4IU8LpnpfhDIY+YrqRSXApg/NlYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=H11ulwTO; arc=fail smtp.client-ip=52.101.67.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E22EmZVgo4J8TIOrtghx/Dpcj/OUZBBFT2hgsf86yf46ZVXjyXo6KKZwBmkPPCyBRU3gtEnSIslvAyzYZIOVjrZ6BvcR4tnTtwaRektuGxrVSzYkS6fZ8WI80K0feIVyr4Q9XaomjYuenjHUyz8wOgtYHI73FX6mNTFsurgdOY9jBGthBpc+q+PPmJI9ajUZJZNjgw3KMgAOATDuZHIjLfQ1uCIcyrVwnfL0MoFEoqOv99/QJBmW/j9RxIG58zXNSio8aeFW0ipE7veNvytKpKDaFdNB6YCuP9oAuINADA2jDE/pMdsipDREIIfIVdPgmKKxZy1IzuOIKYaOf/i/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qui3W61Wpo3niu+istJi6Vs0yv5PgvlIyYH7KR2GYdM=;
 b=I0Y2Q2vtXtiXxgqd8SX4Ejki0MEVS1qoOW0wxaOn7B9fu/gzS3BrnS0QRuYJXoob0gxZsS69bh6GBEtfzR0noQ8I2KyQ/zftIE0oM/Zac0VcL0gv52MgzurtlmYT8qehgVA5xRy47o/pPl+T/nnn1X7ehewVwxZxBSaTKxlVeBigV+ptyn0CWiMweLxiBGLgrwsNkYYlQ0iMAfOiBtnFIIpjggzHgLkfDWtBbiwpVLs1HQi1jIkiUBr8YT3rFVFYcae1gXv+HIl0n5bVfl2cxsC6qtlmgehPNknz1NMBn7Gy8zKsfZRRV0Htz9HncA724AIDJDCyXfXgHHkRBsGr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qui3W61Wpo3niu+istJi6Vs0yv5PgvlIyYH7KR2GYdM=;
 b=H11ulwTOoMqLWZaWBSFq9HtDkN6BLcTttAnNmzGqKdHs25qejHKUJR5dlHKXXQorNBgybJlW7uJckV2d+068qjKMpOkdtoQ3zGngI7HpfZ/5LEhgMUJxO1bXasroJIRoBvkdjkSETznRVgWDr8c3nWiXqAg9yDTqH1Ey8ODYOqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7008.eurprd04.prod.outlook.com (2603:10a6:803:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 16 Jul
 2024 21:33:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:33:31 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Nitin Garg <nitin.garg@nxp.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] input: imx_sc_key: Enable wakeup according to dts property wakeup-source
Date: Tue, 16 Jul 2024 17:33:11 -0400
Message-Id: <20240716213313.1584557-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 2876af1a-3986-4f04-6bfe-08dca5def00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WxIlQgUh9UjDSZToNsD7XDfuBIqEFvBgCB3A0Uqhf/hyloEYM2sY5FZqaS52?=
 =?us-ascii?Q?ATLKYXvYbTORpEYClm8Evau3L1LoqMU9S/3diOEFfng24TGR3VIsNviaVZbH?=
 =?us-ascii?Q?EM3HRNO8M7Kp6va8FSLAWrnoWUKiEqEPUQ5+5oeB8d37OCCka7m+P3ywtW87?=
 =?us-ascii?Q?CCe9xnlPv3SDSDWzGdZnw9LkKCSFCTOaWeWdTV6JRh3uJAHhoKINlac4MRVS?=
 =?us-ascii?Q?HvXgaWkl+QkQ2SxviThIhP3Sxhkj4xA7YJUr2LYWKxSZ5L+mf+4E2Bft4yn3?=
 =?us-ascii?Q?YccNAiEU+K8haSHiaVAU7gCR6s139RuD+0Szksy+NfIRlH6xtsy6ovw+uktw?=
 =?us-ascii?Q?O7KVDEGt/QXYsoIeSZItkU8eCJVgFveXgkTxoLl/sM1E/ejEblgnNRTqn1E9?=
 =?us-ascii?Q?yAehfCSD1fuCemjp9RsXs9koZx7Bwh3GJi6W+zhdSNfMhGP576rXSwP4fNxG?=
 =?us-ascii?Q?m6m5mTWZkc0Vx/gatkECSWEPmLz1sow5Ho37VAXF5hK0ylVR9mkNYXxsZfQD?=
 =?us-ascii?Q?/9O+iRvixj1+C/zW8boncsY/Zs3il6TJDr4aW6oIxKlKeSEzaUXFxPXC49+N?=
 =?us-ascii?Q?bxpX3UCdh8fmNgDa6kGdUBpLWtVbxyP1hE3McoKpOsjw+1MNcgkdRuuHgKIq?=
 =?us-ascii?Q?XEI8OVTfFJ6cCm7WnHM9ku1zUwSp83BahlA32x8KoxN0Gi8t+sMmr6UE6yUX?=
 =?us-ascii?Q?LbsMSothgjMsDncTp5VqXjyGjPo0uGKZw6SiX9sWX1KFCc28Tks9GgPG5UO/?=
 =?us-ascii?Q?tPlyoR88UPYYw4SaKBvFRwxtzLcef499sBG89rfotcG8x0GBN6Nc7cdlp3VM?=
 =?us-ascii?Q?pQuy+XFJECFDc7FWaMSMbZwrXdFOgq3q7MpLrtRuD8PVwVENF6fhXbU7w63s?=
 =?us-ascii?Q?N304yVOlKx+7kG7R0toKhbcG5pPt+ad7BcpfBCv3E2xxXSMXeL+AWtOHJreF?=
 =?us-ascii?Q?PfZi9EXcn2YMlArrpuVAam87KzMIF9PNJlx50YH4KttIHnpw5+AMoAzIm6I4?=
 =?us-ascii?Q?OOAUB7seQQx40pteqksTRwZmtr7fM3cj4GzFPPlFzvBNl7W3g65kHdFNDA+b?=
 =?us-ascii?Q?tkblg3KoZhXFX+XbByDjDrlf29Fo2gEPM0k2wFDlT6VkcDWG8KSACJy50gCf?=
 =?us-ascii?Q?EMmw7THFxtltbOkvn1qMtVez2bOVtxj83+RD3hTbQuZwpXlt7RTcfSSM5ntw?=
 =?us-ascii?Q?Xj79+phMax6MoNGSKeJl06iZJTPLxFHq4vXwhWIlMMuWf8Id8PTWzds7A8dE?=
 =?us-ascii?Q?l3mVwBVAJNcPu33Pc2m+jMzRCKXXfv1EwWc0oOIYCGbtakLia4DsJ6Mv4i48?=
 =?us-ascii?Q?gNzwd6sgTW5QApC0LToDpzTzIvKDy5TRbXxosicJKmvAvLIrOgyGl7ttSovr?=
 =?us-ascii?Q?ttDAP0JwkAhiQ0VmziPb5H4OEfBgZAjPHi2HKDH5FRNeVQobfBR26dp1zA9s?=
 =?us-ascii?Q?wv0msk71dN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g+EgPfOrxNyzg6X2TfrW+urhvqda5BcPqwz0Q0vuL/jCM7dYIA9Bf4ZM9T2Q?=
 =?us-ascii?Q?2qBQuQusEtuwFhKoH6DmvU1/JgRzXzwRk07kjcdi562Z2mu11oS1D5R4V+4d?=
 =?us-ascii?Q?khKC8X3jyfXt9vTypnDn3qCKw0ybRGUePhUm0h8NdOJZrTEbE9P4MF3/DLe1?=
 =?us-ascii?Q?wvGexpiNpGg/yeVAn73VV1GVqngYzyP4YFKxg+C5VP6x1RuLMgjoWarb7T93?=
 =?us-ascii?Q?9r/lmjkEQXhsgB1D3bnI9+uONrF9M/7pF1Mpf9M/RIyK5te7rqRTM1EtmC7A?=
 =?us-ascii?Q?1PrLZWMZDFQdbrFILoIjwmrcHrF3AzUtM14uC4S8Lrx5X94VJEJ+tCSgLT/B?=
 =?us-ascii?Q?xvbvykpOFH5W7fe/ZfvNIHJPoFnC9lwLDnUUbAztTm+zrsner92RGnxSu0nU?=
 =?us-ascii?Q?MdGtGpfutmLhSkUjZYQEOhwN+C1+Sa9/01iByCeksxqvlSLpPW4l91BWuK3B?=
 =?us-ascii?Q?HKslLJkmWhoU94BejLe2SW2MNw2DroYjwu4uz+Veal0UbKZ7/VjR/26Gp1QE?=
 =?us-ascii?Q?rT3yruRcmEee+VT8WjrPUnEuXqXD+30WFUbbnekuvpda0Reew/IwHX6Ep0mI?=
 =?us-ascii?Q?vR03O2LK3K+gLyqwPM9nxyP38ridP9i3xw6bPYews0Fb8xYlegjx5Wpa9Vuq?=
 =?us-ascii?Q?TH0YI5+rABKr7XY6oA/SFzIUW+m9Yn4fzoCJ6pNw03ehHkboPxe+GxdC/rD+?=
 =?us-ascii?Q?OILdcijbf3i3k/RwpKyR9n7O8lAn6nWUMp0g12yIpmWT28YKnjhKZaiMR3J2?=
 =?us-ascii?Q?RTozanxhB/BkwSYuz771qu7bHC2cK+YXTibb4oneyXQ8veY6w/5EhmqsoCpl?=
 =?us-ascii?Q?QHh7NHYGV+WAHq1HY8LKa29dg9kBgIo0wpNBoupK8I/kkynQFWaOuHJG1ySQ?=
 =?us-ascii?Q?o9F8J8u+DlsWBKr5ni7KEk4gDE7KMwyRZTsdWHuY21mk2sCXzxbu/j0DiRys?=
 =?us-ascii?Q?elrzXKysO5pOlRWchqrJpwF3aO4oCtMEzukUAvHklDg+dlHU+lmtYx8aBUIw?=
 =?us-ascii?Q?x3U+8OeJODYPleCekd0COCfaSZMgSPMLoz2A6oI0c2IswtVusVxZ9jRgtyGg?=
 =?us-ascii?Q?eZj9wq9LJUF/yebGsFZPQLcJ1iib8jFpbJ6P5C5pW5UAPJXvvUjvby0iZ4ri?=
 =?us-ascii?Q?hL8sMW86T7MGM3Ob6SbCg3/kRizSVlJUKHe+GZ687mzNcuLp2gpQTSFfiS+3?=
 =?us-ascii?Q?uNFV+uM5COIV04bG0UUWU5lAbnAB3c3gsJQRPMCw+TnCyY2jTlFz0Yk/6qu4?=
 =?us-ascii?Q?z90wYoBExatPkAYswvMnmquFt5Ls3rYVyhW68QUPy0Vq1Q//9k29nH8cifug?=
 =?us-ascii?Q?Gh+EKg1DOu/9hLv5C1z5FAvAAta4q8HGVdpHDlfVJ8r27PNMcD0TGSlzqQ7L?=
 =?us-ascii?Q?w5zX5RLmG5zKwpRE+paVvViZ4Z+kDIi9UBFj679sIL+W0snyczW/P03WjT6M?=
 =?us-ascii?Q?gu73or8xS/YM9Q05dG6+xuh/PUfwc3tBsQrvRTityQcVRF8Q53q3ZjkaM6Eb?=
 =?us-ascii?Q?Yujof24zVGxUfWOruqQof52UCfrdix9zs2/mHA5MJNAnx6vKD/XqbVIfRs1k?=
 =?us-ascii?Q?JQLWjdS55xaSMUZ10TF3zR4v49+uiL8whrL56b8V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2876af1a-3986-4f04-6bfe-08dca5def00c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:33:30.9839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /wmqNj9AZNrtebT/oaGUGI7cVz39bKdYgRSkr6TBE27WI5L8wj7jXnnX3FaW5+wKd7xyKYCE4tBmmDGJcTbLJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008

From: Abel Vesa <abel.vesa@nxp.com>

Enable default wakeup according to dts property 'wakeup-source'.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
Reviewed-by: Nitin Garg <nitin.garg@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/input/keyboard/imx_sc_key.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index d18839f1f4f60..83025407065ba 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -110,8 +110,10 @@ static void imx_sc_key_action(void *data)
 
 static int imx_sc_key_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct imx_key_drv_data *priv;
 	struct input_dev *input;
+	int wakeup;
 	int error;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -130,6 +132,8 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&priv->check_work, imx_sc_check_for_events);
 
+	wakeup = of_property_read_bool(np, "wakeup-source");
+
 	input = devm_input_allocate_device(&pdev->dev);
 	if (!input) {
 		dev_err(&pdev->dev, "failed to allocate the input device\n");
@@ -151,6 +155,8 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 	priv->input = input;
 	platform_set_drvdata(pdev, priv);
 
+	device_init_wakeup(&pdev->dev, !!wakeup);
+
 	error = imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
 					 true);
 	if (error) {
-- 
2.34.1


