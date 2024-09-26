Return-Path: <linux-input+bounces-6737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47050986E4E
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FAB282DFD
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 07:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D46193408;
	Thu, 26 Sep 2024 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LPhjxhuF"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2049.outbound.protection.outlook.com [40.107.117.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7EE1925A5;
	Thu, 26 Sep 2024 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337331; cv=fail; b=fBUd9nA77lGKcIAQE2OqojoEFKwMDOTBcVLXsU+zsQTAUQYoRRSKtHD89ErqCpMnr0U1yn2AWhsQCWVCinDBZy/uPac+E2IokgCs3wdZLdR4C0AKepEP64zsl9b64g8jHnnNYtZRjfW3cWn9VUMKvmAQm93ig9CBUiURQ/XRI7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337331; c=relaxed/simple;
	bh=FPdyB0bZjkt+TxR2P9FGYYqhTT/RoDXPxD5+Xt2L0Xg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cMzzbL5LM5N9Lt93gfjjj5UJh+8/MDKw8Ha4SEzZRuVfBczJAek1kxtIhJyLAzSdZPvfawIlOTCPghf5eh9msjmMbJkcvCzk4ZZiqKjjwidxRDCAvawD8WxpOTQXc11UC/gQSoTesZJ/PqaOxgXa8EkOVtuMOOVpH3cu2qmYR1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LPhjxhuF; arc=fail smtp.client-ip=40.107.117.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6tv2AaOzqvzhwSgt62KuLNAlQGAVP5pZHxpzLPFn1bxz364+fVxVSilf6Ls+8qd64qRp82GtELnd8Ptdytb+oDdaEgtbvCtffAVdfqqD0ss+JYTP3uSCWlMdf16FVG90pokIlcMpk526+Z72sJAmnH2c0rCJi9D9guL+NukEaeXIWENOzvJbCX7hKUG/wgLcheVc6xxPVIs21EbtOszO3+vGbSZz6vtN/MJsqmP3U3oGUtEaOKgGTr2TTiqWZxMQAnrkYv67mCNNuOMau/fonV3mxuEGapFduO5+yQrK23eIJNdkTd5COfC/96OD862T5cujF/l3JlOgMV0bJi0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUgF8esQ8FjKnMHs/NnNqk/29b5jxRKs49WwTfl9HzE=;
 b=CpKIXQ4f63mmnpAFVPfJuXS9PcMVGal40mtOYN1WB27YJPh+UKfBQIT6tsfyPQ14ns0pagv6wnjHllvg4pjoB++3o309kdiNFA51HnL+GohPg39kp4fRHyQzjbJKtjcugzn8t988Ahv+9gIecpxSrsnKwf69V7YJpTTc/QM91ZC0HgaMu+6iVhxOIpYmcKCtsM7JQsJMTrpQ5UjsgL5pTLpDILFcCHom/11QfxUATgSaRhtftfiWFFAb1s2twG3Kocv0XUdeSXaMwBTTwP8jzT3qJrcHVa0GwWgEY/r7X4bqcKSng+lLNWAEClQYbiwQye5edZkg/mPK7xIYid0i0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUgF8esQ8FjKnMHs/NnNqk/29b5jxRKs49WwTfl9HzE=;
 b=LPhjxhuFSpM9x1YX66mFLxol5tgEwMMxT2mzcMT55rOpQYYjS6mpmY/X3QsQpvcNTwiuT7gVFhQhtWBAH9ogLy6JmJViU4/+EoeMGe7nePXKd7U9FOnyyH0hW3c1YyJaqdVwJd3UyQTx0jaEeQlRiaYt7SXhNQ5XSfHTmkbwIMZv7jcSQwUDCKgfUbmfcAuqGh0Zo3LC8glqOKN45dc4YnyZzSfg/BiXe/wo6zRbf8yFlrR2W+bFkbUaMY2vEa0kMuyNtIJZdAbofm1WYQSeCYTEiJof4WE/WHMib9LKjfYtMP8TF/nWThy88GH7ArNuxZvmUTTapqSdEEqRv+VMjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEYPR06MB6484.apcprd06.prod.outlook.com (2603:1096:101:171::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Thu, 26 Sep
 2024 07:55:26 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 07:55:26 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: dmitry.torokhov@gmail.com,
	o2g.org.ru@gmail.com,
	mitr@volny.cz,
	Henk.Vergonet@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] input: misc: Correct typos in multiple comments across various files
Date: Thu, 26 Sep 2024 15:55:15 +0800
Message-Id: <20240926075515.10042-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEYPR06MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 88ded886-227c-43e9-1a71-08dcde0094e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/h7cR0qvgf7x31RIY5yGHvGZQJo4ocsRsUjy7s+u5qj9b7Wl6p6VQ8ZA8biP?=
 =?us-ascii?Q?OF7z6W1q5c7uIbwNMQliI1ZX/kFWBXb9pZV4cSSxesMqR5LCvOZLNdgZbeCk?=
 =?us-ascii?Q?p82I/BxdEYymyKFK+4wq8i33f8whTMmHfcz1TCAJgBaO9a3zoRJQTz4Yv61A?=
 =?us-ascii?Q?/1Rb3drn+Bh+qopoWHciNWGwjmBsDraj5JXHxqDWOAr2pDitT6I0KKEHvndY?=
 =?us-ascii?Q?Eb9HjuF1BABkXq2IcfWXVZegorLX3y7HZZ6S9RRIw4ei0G6KIY7XXHWtXgh1?=
 =?us-ascii?Q?conNQO5TjkVw2/0MPxSeaqY0wI9U+eVDuEQSVi+JT8JByRESVXtZ+GwhG8aJ?=
 =?us-ascii?Q?1jR0MTfrt+7u7dGCuK+xPqoSc7KzX3Uq6GjRncN0EMZiHsSsIl6Ml0w4zoDk?=
 =?us-ascii?Q?kE5+m6Ir4OZ3eIXvo/c5bKxwmZnJVR5W3GDfkXPNffAA+VuKUaIuith/w+Xp?=
 =?us-ascii?Q?r+1eGSyxxwoG2jsPhgBK2uwBdkt28f5974BMIA0/+8IvHEwXKoIytutOnpJa?=
 =?us-ascii?Q?49jDd6DFwF5eth0BfSIJOM/3Mleh13LI3B/u2/hGlCaDIst8WKwN7oVpeiIQ?=
 =?us-ascii?Q?qvLmieabZHdo7ExtTe+Mqizhqos4kjQRpJJJARPQz0EBd1dJJjXDaDLOzEEE?=
 =?us-ascii?Q?Wg1Rc43s6+3sdUCy50I8qpM4hT3XtIoobhzCjK+GtDwmI8S64quXBhIkCBgY?=
 =?us-ascii?Q?j1gUu1lM9Picq4VOjvjrS46P8S47DdmunMC8Yg52mGVTK3tE0rQgHilDl3wn?=
 =?us-ascii?Q?GjKT+cVVpbjHpkpCDc7oO1J+aP8rSK7CuJeba5WJRd4BgTOPMhMRB1NYPtIe?=
 =?us-ascii?Q?engnMn2A4X5Zngj2GmiNBDpCgRz73QlmXpvaTcJrxgMCZp2XI1rrCE+dwTh2?=
 =?us-ascii?Q?0R5xCvlmPqfdRM56J0YJSnTDcYwEqRXzG7DcurTQI4WY++CclloiacYHW0kW?=
 =?us-ascii?Q?TuIf8EZ3jSLGWjq5o3+N7G9fHB7qAQZaFRPVABtWezxi89emiYBgmiTuiaUs?=
 =?us-ascii?Q?SQZPeijRyrzPOti0SvDlejZ+Hf1VncfsoaRPyLYcQBL7rEQUTcBhrESya7xL?=
 =?us-ascii?Q?LScvTMz+LLTUUtvo6q7CfEzXgNpaFWX8AmBLQ3l5KPLJYDnjacstM/0MBbm8?=
 =?us-ascii?Q?wXxF6QvdTg7s6z+sBJ6RrVEifx3iMYkBLN2qC3oIGttcRUd07czZurcU8V/i?=
 =?us-ascii?Q?SbtBhJIsUgdb8kuh1fjvKa2Zk5owU3x9d3m7IvWBSoXoTUca+QT547RDK4yd?=
 =?us-ascii?Q?Mzwf8nX9TiSmOMXJlF4oGya5Bljz11DqNnDU1FcZvBU5/HiuyxeL7fqLYONj?=
 =?us-ascii?Q?fcQ7guwqVx+NUYN+hdxWznXPNzEkteF53F7eD2UKkW8wMeY74nYfL/cYPSdP?=
 =?us-ascii?Q?ONp4KCY48ZhaL8FXuzHAH2owu9SRVfiSFNiWLMswPR3YbUhhKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z5K0QlKKuNvANWODWuuTfPbPAqecIRsyBNko5uoPUbmI0qHD+EET0oOuNeZn?=
 =?us-ascii?Q?azcJ5TCFrwm/U8dWPvXPOfbg1xb30i0BJtNbfrt0QjZ1Bb4UX0W+pLqi5YJU?=
 =?us-ascii?Q?gU0S6fTyUgeznVEIP0y2kkdWPnnWWSjA7gPkP3mdhj5/MOy4odTerujcvA/I?=
 =?us-ascii?Q?hYqIKTmMfOt5St/zu/BnlaJMuBEKsV77awIPf+3BwvS9bs1AlxqDUrL5WCfP?=
 =?us-ascii?Q?cDYzhdBrBua+gmpq4u+b2jt4BbE24vVhrRGuQXo0yoG8GAXcLtGxyqi6Mt6G?=
 =?us-ascii?Q?h5rP601iVQ0PpW8JERVOEJKvgiIFtxkJlOrXxlxmbFsCoLBCGbgSXK53GHse?=
 =?us-ascii?Q?EZi9kO+VetbncZQx83O00AX0SNa3UwGQskmPIJwJnaqlEfdyyqzbNQ6iSIpD?=
 =?us-ascii?Q?kZ8kMsDRJoY08p4N1xtGB+ppKtJ0g/JM3Kufzaun7d3oAEqQ/j7fYUvsjoO1?=
 =?us-ascii?Q?fMTmq1b52WXrV1ZBDKNCNAWvywLk7reucBtpz95S4EAUzo9hkg8WD+gwWUSO?=
 =?us-ascii?Q?Eu/ueOZfZdvj6qoyzZuX2Q7mhj+aFETSXUGguuYSgkCTdes3nrDv29M/I9A4?=
 =?us-ascii?Q?5+896fA93ikbv99l8JS2+7hKFP/UeaARn1Mo+cGOrXeztg1t92sPXQJ6MjTz?=
 =?us-ascii?Q?3Tyc5LQxvHRcD6nkUPmHcnRm/7JZdkY5idn2DC8tyGE2BU6D32wMzJCrEq91?=
 =?us-ascii?Q?95WiziKQg0lImRySSwvozX5lCdX+rpyahgrqOwAjwjZXv5BJGdF+Bnx3HzmJ?=
 =?us-ascii?Q?Esii9LRTcO2S9nl8W7ExbWb/WazZtoKhSa01fT0uTMIG9YUckyUOsb2YF8iK?=
 =?us-ascii?Q?Ztouxaq2hoGbqKRZF1NotZAV9QGxdk+Xmi2WtclfKJNvq8w3YUqry15xg6MR?=
 =?us-ascii?Q?rjewmm6O5UyNohZjHjf6Y9lM/5tqt802QucB1T5LH/MSm/sTqRqDmRmaq9pY?=
 =?us-ascii?Q?ONFRHSubDOoiMYmKBi66L+Pn5fKlg3JXbFiRot60+1anTt2s3Y51xaJQ7pUs?=
 =?us-ascii?Q?yYMKJFrdZI3K6oWDPH7tvB6fbosrhcc+gQ1Mv2JrONu16m2vsbfV7cE2eCtn?=
 =?us-ascii?Q?cW+JccsCDmtuyfl15DRuTyo8CQmfPVYihx3R6UYXkFBqnNJUmREtEbKr6mB3?=
 =?us-ascii?Q?HHkLOd/xAzLda5yYWSS/tXd0ZTgk50c5XHKE6LczcD3UGHHK64+EsDRtuAGV?=
 =?us-ascii?Q?YYptzWxUPS/S8P3CN6iU8hLloFbWSinO15x/kleq8znWXb7zWWSDovTLEWSB?=
 =?us-ascii?Q?anrvKIUbcLisbYG8Q5XiTH1MJyzyIokNsV8dJGmds+FMGAuBUl/Upml4oWEM?=
 =?us-ascii?Q?0nsCRoUpfPX2arfFnOXBbk6ITx0ip8lNZ5bf2wSmChIWUop+JMcyp2v+cFQ/?=
 =?us-ascii?Q?mO6C60YCKSFgyZEefLxILLbScTYj0PUG6w5xNkcX+xAi8M4dwqg3lIbQnZ/i?=
 =?us-ascii?Q?qXh7ETwIWCyJ0w8svjWVVMxyeefgWwYit3wwc9S8muqWtEQfDkT53q0usc0i?=
 =?us-ascii?Q?5r7frzFj519IzRnuK3dcSOXDunnRVkL3NuN62oi69WZUkffhCzgYGpgfB3n1?=
 =?us-ascii?Q?S6xbB47uLe+bkaSQZ55oApYCtA1tCncXfhqaoCmI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ded886-227c-43e9-1a71-08dcde0094e7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:55:26.1263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljK5op5YznV/Uj3JCqUHWrSfndnlc3roQSVvrhBYHDRIDd2Ejy40sm0quDonhgmi5XIrtvHz0a+RBRahvN7aOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6484

Fixed some confusing typos that were currently identified witch codespell,
the details are as follows:

-in the code comments:
drivers/input/misc/drv2665.c:18: Contol ==> Control
drivers/input/misc/drv2667.c:19: Contol ==> Control
drivers/input/misc/ideapad_slidebar.c:26: meaningfull ==> meaningful
drivers/input/misc/ims-pcu.c:742: bootoloader ==> bootloader
drivers/input/misc/kxtj9.c:28: funtion ==> function
drivers/input/misc/soc_button_array.c:518: indentical ==> identical
drivers/input/misc/wistron_btns.c:274: satelite ==> satellite
drivers/input/misc/yealink.c:380: singe ==> single
drivers/input/misc/yealink.c:617: coresponding ==> corresponding

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/input/misc/drv2665.c          | 2 +-
 drivers/input/misc/drv2667.c          | 2 +-
 drivers/input/misc/ideapad_slidebar.c | 2 +-
 drivers/input/misc/ims-pcu.c          | 2 +-
 drivers/input/misc/kxtj9.c            | 2 +-
 drivers/input/misc/soc_button_array.c | 2 +-
 drivers/input/misc/wistron_btns.c     | 2 +-
 drivers/input/misc/yealink.c          | 4 ++--
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index f98e4d765307..59ad69912bfd 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -15,7 +15,7 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 
-/* Contol registers */
+/* Control registers */
 #define DRV2665_STATUS	0x00
 #define DRV2665_CTRL_1	0x01
 #define DRV2665_CTRL_2	0x02
diff --git a/drivers/input/misc/drv2667.c b/drivers/input/misc/drv2667.c
index ad49845374b9..b53231d41b09 100644
--- a/drivers/input/misc/drv2667.c
+++ b/drivers/input/misc/drv2667.c
@@ -16,7 +16,7 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 
-/* Contol registers */
+/* Control registers */
 #define DRV2667_STATUS	0x00
 #define DRV2667_CTRL_1	0x01
 #define DRV2667_CTRL_2	0x02
diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/ideapad_slidebar.c
index fa4e7f67d713..7f1b3690b7e2 100644
--- a/drivers/input/misc/ideapad_slidebar.c
+++ b/drivers/input/misc/ideapad_slidebar.c
@@ -23,7 +23,7 @@
  *
  * The value is in byte range, however, I only figured out
  * how bits 0b10011001 work. Some other bits, probably,
- * are meaningfull too.
+ * are meaningful too.
  *
  * Possible states:
  *
diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 058f3470b7ae..f687e8832fd3 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -739,7 +739,7 @@ static int ims_pcu_switch_to_bootloader(struct ims_pcu *pcu)
 {
 	int error;
 
-	/* Execute jump to the bootoloader */
+	/* Execute jump to the bootloader */
 	error = ims_pcu_execute_command(pcu, JUMP_TO_BTLDR, NULL, 0);
 	if (error) {
 		dev_err(pcu->dev,
diff --git a/drivers/input/misc/kxtj9.c b/drivers/input/misc/kxtj9.c
index 837682cb2a7d..2f301ebb2fb8 100644
--- a/drivers/input/misc/kxtj9.c
+++ b/drivers/input/misc/kxtj9.c
@@ -25,7 +25,7 @@
 /* CONTROL REGISTER 1 BITS */
 #define PC1_OFF			0x7F
 #define PC1_ON			(1 << 7)
-/* Data ready funtion enable bit: set during probe if using irq mode */
+/* Data ready function enable bit: set during probe if using irq mode */
 #define DRDYE			(1 << 5)
 /* DATA CONTROL REGISTER BITS */
 #define ODR12_5F		0
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 5c5d407fe965..e8f373715e50 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -515,7 +515,7 @@ static const struct soc_device_data soc_device_INT33D3 = {
 };
 
 /*
- * Button info for Microsoft Surface 3 (non pro), this is indentical to
+ * Button info for Microsoft Surface 3 (non pro), this is identical to
  * the PNP0C40 info except that the home button is active-high.
  *
  * The Surface 3 Pro also has a MSHW0028 ACPI device, but that uses a custom
diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 5a64557920fa..81f34b96c611 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -271,7 +271,7 @@ static struct key_entry keymap_fs_amilo_pro_v8210[] __initdata = {
 	{ KE_BLUETOOTH, 0x30 },                      /* Fn+F10 */
 	{ KE_KEY,       0x31, {KEY_MAIL} },          /* mail button */
 	{ KE_KEY,       0x36, {KEY_WWW} },           /* www button */
-	{ KE_WIFI,      0x78 },                      /* satelite dish button */
+	{ KE_WIFI,      0x78 },                      /* satellite dish button */
 	{ KE_END,       FE_WIFI_LED }
 };
 
diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 8866bf65d347..08dc53ae1b3c 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -377,7 +377,7 @@ static int yealink_do_idle_tasks(struct yealink_dev *yld)
 		if (len > sizeof(yld->ctl_data->data))
 			len = sizeof(yld->ctl_data->data);
 
-		/* Combine up to <len> consecutive LCD bytes in a singe request
+		/* Combine up to <len> consecutive LCD bytes in a single request
 		 */
 		yld->ctl_data->cmd	= CMD_LCD;
 		yld->ctl_data->offset	= cpu_to_be16(ix);
@@ -614,7 +614,7 @@ static ssize_t show_line3(struct device *dev, struct device_attribute *attr,
 	return show_line(dev, buf, LCD_LINE3_OFFSET, LCD_LINE4_OFFSET);
 }
 
-/* Writing to /sys/../lineX will set the coresponding LCD line.
+/* Writing to /sys/../lineX will set the corresponding LCD line.
  * - Excess characters are ignored.
  * - If less characters are written than allowed, the remaining digits are
  *   unchanged.
-- 
2.17.1


