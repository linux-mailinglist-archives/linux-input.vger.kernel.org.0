Return-Path: <linux-input+bounces-7872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91B9BCD7C
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6C9283471
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3571D88D0;
	Tue,  5 Nov 2024 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="hnfHMGQ4"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2065.outbound.protection.outlook.com [40.107.105.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BB31D6DA4;
	Tue,  5 Nov 2024 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812192; cv=fail; b=t6yRbMOrybo8MtRDGyjSg98wzbEGBjOpxhgOBs+xA6Cjp8qIguKeLQBn6HEKr/gBHFFXPn2NbtEr5gOOoF/UqR8ubqRrahjaKxY4r8VTIZ/9DTQjT3KopyDBVoJ7q4cijIFuuUnTY672XKcZar2aif85yKmYc27q5/kc3fuUXuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812192; c=relaxed/simple;
	bh=ixd9vx7fGX6WhyKoIZR+/6JvIOeTDfPrEj60bDbhlBk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sd37ZBuUiUSHAlQ10g0g2M6hwH+RwJg4xrCesolbO9J7WppDxD1Z9NZSdmMrYQVSR0FLWvkCn0i8XD9EHPyVxdXU3XlkdFvCTraKUhop3d96ZpLsy0+k52um7DgQNZh02urCO33mwwhr/Im+M9s2c2pHuz1VrFGskEHcgPkUNUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=hnfHMGQ4; arc=fail smtp.client-ip=40.107.105.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9hf0tqBE4AH8zigWWc7WdFjPMkzwCfvyjbNv+VPesGAObuOHXfZ5Pvwyl0mrej2xh9yYIgyknn/gBFs6XB1AE/t1Q98qN4TulUCJSe+AOzgDZHcF0xx5vBlJASD1Zrq/i2GZ31/UJU5+nRBWThwoQS3JOxQQykA1CGxILfNun9EbDu2PEsEYLtK73hBTs12koqmu65hueQPXeCO/BDRUOgVIqwEcojS+9JDhvcvO1uO2tFJZ36MU5zDfHwU2zqOfc2omk1BjTGu/8KCxFDYTvSOaCFtRVLgmPe5GQRxIOaFqLPL+BQEV4gvBt6IYdr3eVObPb45AMORctUT6Y5OGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPpqvU/x1lLLzvA1jSXQ2tcMAGSm2VDvD1469TGC/pk=;
 b=Iv2eN3YBM+PL2itGkhasNKIdOWO81qWhKdd4qadJqQDq1m6p4WPuADY3C0fkuASX9sn486ITXglMGOuxB3vUG2YimRz/xAq3artWs4JkZTpo2mIMGaCFyTzgOlcBQ0qhgIvE4H3z9G29HuhDrPH4wt+sdUtoiJO7Za4/Xc/QAG4O1seZZOFcT9MCwvEvkwbhuSYT2NBBupLJrJ9rSezyJUmY8hJfud6kK6wkwvYi3tl3YH1xev0hGocYXZwqDuh4XUStPhtNTPYAftt5kbYBbAftB5lIn8Cz3KZY/JrqhMqHd/1hmjln9kLIhdBn2IppM7nLmoqzkirI72nhot9KqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPpqvU/x1lLLzvA1jSXQ2tcMAGSm2VDvD1469TGC/pk=;
 b=hnfHMGQ4CExth4GxjNhXET24rY5FqBWbVV6qFrj014eG+IQTqH/OJsAsMk3DgjwXNFWd30b5g8fMQL2oEzWktIDLa4WFSfqUIQLNxgePsfjRFIivZ1wwcPyrJWCCeywEGs3iCgRl31TW5Tp/W8WhhKWU8Ig/iPEUVqjjXhN1KkCzD+0iURiMX2eInC2vlwRT3gkCXXKeFarpuCF/XoZAi16e50I1IcLNvLXKDTrkM4iV34Bbi8DXIXShkj9cvS00wp74+XEZJG4XMlu+73zHXJxh8arABpikfkNXwFp+4XaXyjJal63d6oF4adwAo2XMPtgUTEjR4TOWjrumMrR6Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB8468.eurprd03.prod.outlook.com (2603:10a6:20b:52e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:09:47 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:47 +0000
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
Subject: [PATCH v2 4/7] dt-bindings: input: matrix_keypad - add missing property
Date: Tue,  5 Nov 2024 14:03:19 +0100
Message-Id: <20241105130322.213623-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::13) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 29257e80-f1e1-43df-b624-08dcfd9b1fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vuhXbb9FcUhQE9Z1sAxC/HuzWULXfk+BkYkOsyXH4q52zZKM20mbOu7TtqT+?=
 =?us-ascii?Q?EMPrISy3c0yge4uC1CPH7yqySS6u7I7xZ8ZLRyUkKeYLek+X1dyjLZUlu2lN?=
 =?us-ascii?Q?AJ97PnXGFEn8pOu3s5fAVw2vD7lPv5iPRwfUh5l16+KrdUiu/UkmIkU1GoUy?=
 =?us-ascii?Q?E2j7HvvFnG+CwD0s6aErX4P/Hvq+4eurADd00Aj5Vn8MrhB6oGIoCZNd+I1l?=
 =?us-ascii?Q?1eT9KG1Mw5CbokBMubtRzPELWVKdhp/Y4wQYwG4VoqgUKMAA/olyIT9orlv2?=
 =?us-ascii?Q?X74MDVoUQwnvLAAqVG3Vdasm0EYC9dkWeyzrFJD7pkVNBenYuQq3rYGz6dAD?=
 =?us-ascii?Q?3mVMGj2QisWi8w+3DRr+poN252K0/bf6XIBOHpKEqDHkls6H/Ka1L6solatl?=
 =?us-ascii?Q?jXsGzGkFJXorc+Aer+rbkH09YpaBw6QKHjK0HNVaLPbIX0PWE4N6cUcxyOoP?=
 =?us-ascii?Q?m3eelwni36h7a2g/OK9cJmhVqoIzbHb2z92W5XA89LlhBvPflfucIp5+Bem/?=
 =?us-ascii?Q?EeckSCPADobxbPm2BWpIlRGg3ZA8qqcssthBkKKz4wVk4+VC4Xtw0LPbphdJ?=
 =?us-ascii?Q?3bNzK3UfjGJsJaUe94Pz3I72dmda+vMrAgOBV3+kCK3Ir7NXWYWM4Z5B7cmW?=
 =?us-ascii?Q?KktVKuqydYyu8ofCI8JG00Bin6GUJ6DVQ3/XW5tInXO07iCMCeOYQk7Q1yvy?=
 =?us-ascii?Q?yA7ss1XO9VXJMIhzv35tbMnhBe38g8hvsCCG4RNRkK6cvaAA0bRht12aIU8n?=
 =?us-ascii?Q?hYgtNzcBJF+twNEKf4aJPmJhAneazYul4/I0T/ee2bEr7yHb2sKB/lKEG1My?=
 =?us-ascii?Q?JKpsV1SfCGeIQRQCIcwTo9gP9HSmGuSK5Z1YgDFEID82p3FuFRU81V72hfLY?=
 =?us-ascii?Q?fxijtxgmAki4H9WNmoQefESibVJ3D/nC6DWdXJf//TPiKlqmM253mmO6BHMF?=
 =?us-ascii?Q?/atxBVj3JRi30/GReZJAbVUdwgjujgPsAzr695xML6BTo7GPetZYHACRm6LC?=
 =?us-ascii?Q?bf6QHqmjswgnskPnXljwJDXOO8TTd1HwBx5IvvCw1ghJpaowgJpVeWx6LId3?=
 =?us-ascii?Q?jplJdsojMN3WvpJwU9hPZyVgBErq9V+S6O+5fqaW9asWxqJ7A3QH/YDoX4ii?=
 =?us-ascii?Q?0qM29z/g16FiRGmtGDVkTLwDMQDdnrGWm0EFRX36/bEa/D5mfFtm1gsxQwTn?=
 =?us-ascii?Q?JcBu4DdxLap/r0P+j4+f+FNj37ozioFXnspcd+HESfPS+JwrAV4txlnFKFGu?=
 =?us-ascii?Q?nWkQcN8ULNVB5VAmU7zwW2ZEDthlPshegt3g/CwV+var5920wxOV11R9Mqco?=
 =?us-ascii?Q?orltyV+bcpZIbyHxIXsuo3aM6SFUOgWmc+BqQq5poD2Ovzp8DRGkC3qlDYqE?=
 =?us-ascii?Q?AYLM7dU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E7OmlWhD5NBrdnwifp1b/Iirn0IHrXlwxnqoqWxRae0cJQon5YeEUTHAaZvk?=
 =?us-ascii?Q?aIRTl9P8Wz0NF4kl1UAIMH3tAcdNqMHJpgpOc75C/PnOVlZo50XFegNS7+B7?=
 =?us-ascii?Q?vpAbKDG+4F/vtyeYFOgJrbTR0Nk1SojZRSEXKCfSGJoJcWXV/TxzLyRxCztL?=
 =?us-ascii?Q?cK7ls1f/jiOOi0CC11NP/lOz9RISfZAt6CxtQc7abRTT2pGuPQY+a7OJMdsn?=
 =?us-ascii?Q?xSNxY4bw3UL1dpNa4JFAWum9yhtF5o1vBmLPtSPiLCevSrhPTVc3v0Qi9qN3?=
 =?us-ascii?Q?/Wh5VHzO0Sc7uS+YQs9t8uMXp323U9DF5u4wEjB1B+YXGr8vlXCQ+bUP7xje?=
 =?us-ascii?Q?gQhCuNaVw8+guE73dob8ByWn5BQqmNVehP8e29k+uyoOFow/Mkw6NO6XVKJr?=
 =?us-ascii?Q?BVeB5ynsY5FI56FewHzNipozsu0/T/9YxdGZzL6tng34H+6+kOuwUqAcjo22?=
 =?us-ascii?Q?xWW7wU0bdVn2fZiLihkIMg+og5+A07y6hv4qDB/9OCt2bNNFb30wWZ1h6C47?=
 =?us-ascii?Q?fKTa0qQ+dbMDqAUJDZ/MwV16CDkGO4QfVp5Cin17sccJxCpemrqe9ZdlHQiK?=
 =?us-ascii?Q?WYdM9q6JMthq/k4rN+BFAeZ4Fzz9k/bSDAPFjCSHgbfFN+gvPImiTS/LMMMJ?=
 =?us-ascii?Q?a/8/SftVXLm6VNss/PR+E3gMxQ7U5x5Pn47StKS689Kt0B4W0bHF1dOBtQyE?=
 =?us-ascii?Q?A8tcaLza5MVvfSzhp/41OmjZSs1WCqhut1tcFQn4F1y3/l4KhHV+qxGIB9As?=
 =?us-ascii?Q?/WySqXwNClv0CV4k3MUQQ1K96C69ddhBr076jI85r/xNqEqMcrh1e9fwNdfC?=
 =?us-ascii?Q?km5GaZ82u+5o6womu3kSSEWrHwdoaDsQ/ZXVDE3d2vB4dAUooFEYxqTNRN4h?=
 =?us-ascii?Q?Z0YbTu0yW//Tg3TxpOYG0mM07h+Tg94uyflI5RH8joMdyoRmcqmeSbHlqHnD?=
 =?us-ascii?Q?kDsUjcvMHNW3eRzyEexMfflHJ3duwUvRgN/BiXgkiVjFPQGJxdAmP0nvjmLp?=
 =?us-ascii?Q?//egDDhZ/keY61j4q/+IuiGgmn95218mvgRCU8Oyo2Guf3P3Kt9N8sVNNmi4?=
 =?us-ascii?Q?851mFg3hHojqkUKqeJ4aB6gCmqX4d2AIjCH44DXRSNxNgfXo2/8j0HChG6JD?=
 =?us-ascii?Q?cw+C7eLuQnnzkUgITPJvf+dtK/zgTMMTOc8F9mQI7Uw7ItNg64XgYxs1pHKv?=
 =?us-ascii?Q?vmxmzGsQdCdLROnglTISc6wTY0vkchlqge+IMf8Tyu4jl4uGtViHAsZZevrK?=
 =?us-ascii?Q?Y4Z3A69ERAgMuRuH0Txu6ug1tsHX7J4sMSEiSEaHoDW7ssE+Z8odE3jxKyGP?=
 =?us-ascii?Q?NfpeVn3FfZb8hVvtgwdDAAeVvf/bKh7uXwlU6zO124Hz1fsbphk2D+TDPkgK?=
 =?us-ascii?Q?dJo/v09XLusNA9N3wE0W/UA7R/TmJHFmWuP6pyJP2aLIIDQAjD1FSQH4lPdb?=
 =?us-ascii?Q?YsRBYSwQ/slPzyeTWPFBx4pbWtyIhsg4qbgojCPNdDNy+WApDZQwpGkVW5wq?=
 =?us-ascii?Q?3sAtGgyQjhCr8CjKzyut9yEaUHhmxiWNbU+KcRQ8pYo5nUe0XZAhEuer0us+?=
 =?us-ascii?Q?BcWEq6QNrD+AqA4w8l/rhWph8HEuMYZHVtAkPo2e?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29257e80-f1e1-43df-b624-08dcfd9b1fa1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:47.2917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS5L4H3bCjXKcxn2b/i17KTgvL1Xf8H8lDfLBVGSCnsXkyaLq1MDymNHgxr7d9binsy/0YhxuZJSW/7M9hw4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8468

Add missing property 'gpio-activelow' to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 745652b..9ea66b3 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -51,6 +51,11 @@ properties:
       (Legacy property supported: "linux,wakeup")
     default: false
 
+  gpio-activelow:
+    type: boolean
+    description: The GPIOs are low active.
+    default: false
+
   debounce-delay-ms:
     description: Debounce interval in milliseconds.
     default: 0
-- 
2.39.5


