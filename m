Return-Path: <linux-input+bounces-9132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769AA086FC
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 619A41692E7
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B73206F1B;
	Fri, 10 Jan 2025 05:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="qpkSMoEc"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C12066CF;
	Fri, 10 Jan 2025 05:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488243; cv=fail; b=dHVkXLHkpskti59FQGTIXIcZrRU8sQpt4ol0hJSCzRwGDVZdvAT1mucjcGe+SZ3ZJrj78BpMcVhLL7ejU0xjNZBpdKsUoeGACbZTPUh2pCspKbQbRy82Mi7RDbLSAMEAOZKYfaFxpGZokCkG4gPq7FZtUUYH0YTQcsHRtnN05Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488243; c=relaxed/simple;
	bh=UDKg3yURVeqHWh55zBpZywgTX7aVSQ+MOwnDp8mWYds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHwbPebAVmJ4bmXiw9blvs+xQV/sqo9mxT58JpV6Me/I5D313Jyhnfz2NbFNHv/tvT2PjAk0g3sJ2EnSnOJFR6immy7sxm6pose17eH0kPriwgmo82i1DxsfWuBCuW0yG58SMRNRYKexcEQEyIAd2LKLHOWsAh+MMelUR4djyZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=qpkSMoEc; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dz4e3cXjtmAOWVl99z0fBO1OUxrIeOHcRJyuOm2+rWOQmmkIJBxHTFlGJYR3EDYxeucPL0oIH4Yi9xXWbF7ut5Dm9a1OngkdmPatAjabtcleZIYMBKZ1ezdKI5YSYh8YRwVhoHj0W1TT8l3ziwMfO7tTru7421/XRjAtkByOcWz8LWAAxTj8WyN0es96hw3XIh4vmHPwVBqFIvWS5W6eelosJkUiYtxKBBOma1Vy/rgh90rhkLw8f7sndKRfnTPDbRn6+D250Tx9Uvkr2O76T8ktvSxp8moS7kqInl10aevTOuB8USREq9kMAg4Sb5Jfl5xRVWK1DqVrPPuiGV+7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoW1el1f9r/auPKiMJWQZXR8B5vY1ilvXhbKFTPWTK0=;
 b=SAzg/eoU0Is+wChMLE6Ba/WTgtZ19PjIYweEUyeMFrHn7iq5le0FQJsfsNuVMM0eoerRxiX1aHJpuSgQYttoQ/25JJ9pC91h4LhM3rKoUVMvavP5LJk6LGZ4FwVnysgp5NE/IJOpCZxSdlY1T3Qug3bp01xWPYPQElVIpTl1eTP7COgOdX/boS4L35yCD0HAERAoll8tTAjgWqvw1ISqNl6nao7S81yibRWMJtMLp2oyhpvM7y9xgZejY3fNoBxKtN2aXLTXPS4zFa6duqTqnfQZe1I9GBiWDPJr9jvAjHi3q2eEk+RZIiQKYO0TlUrcy6AWF3NqNxo96UUx/af3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoW1el1f9r/auPKiMJWQZXR8B5vY1ilvXhbKFTPWTK0=;
 b=qpkSMoEc+yLTJf6Vi8BJ2VuR+b4oH6dDKq3QiAJhc0xN9VglGOo1NT1DV0tioqLWPgbnEoSlLAIKVnTfdsvz0laQT33LqGolM2u+L1fyReUzaizYx8i29ShC5905F2WZsANnjCYs3Zd18oLiVg7q11W0zSPKl98XZy9jAV3429bsPQNbde7MhKJryagRcG27h0FtC8HL40SWlO4KSxwsAjZHUAh3rU2n3XWtM2NYJCzvA3gdPEk3mD6o3SepnsmpYdjpGBceEg0wgNnVII2kq5vH2xjDQt8KUBomrCYbRvOYusbohpUQgHmiXhTmqUFWtWO2JtP6f6Yr0grnhSpdyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:38 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:38 +0000
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
Subject: [PATCH v5 5/7] dt-bindings: input: matrix_keypad - add settle time after enable all columns
Date: Fri, 10 Jan 2025 06:49:04 +0100
Message-Id: <20250110054906.354296-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::27) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 091b0635-678b-4dd1-ff3a-08dd313ab5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ivbMsE85jBE1Q/mNattBDKJpVsm7lsRgvNUwP5pCb1dgTRDmyDHcTsRtpDm?=
 =?us-ascii?Q?npm2hb7INTqQqnFeHcNimQ7gWmCIiFsKUYl+P6fPssD+fcL+Si3w0U3IkeNb?=
 =?us-ascii?Q?dLDLgMiaDvnN+cXwJPD0Klp/RRmiDby+O0cB4hVftUUW48l76vjGkLthGr3S?=
 =?us-ascii?Q?R1UeZ+uvrgMcyEev6uO3qcPkmvxkIKdINpwyKJv8mypib3l5iH0f37hjb/05?=
 =?us-ascii?Q?OulWWojqwUEWaRIvJ1+gsddLBsF6aeMa+sZB4KtcrAqRz4bWIf0BS+duFxE4?=
 =?us-ascii?Q?emQp+Rz58H8eQYmoXxx+mZ1L2tlHaHgyW0I9WLdIRqlvPJ+A3xBE6XnoIw8p?=
 =?us-ascii?Q?GfVzkzMIdZLbRfu0lh6xx2d3mBEWM+nzKORQ2cwJ4DR3qqX/9fZ/4ONqt2SC?=
 =?us-ascii?Q?yD83IoC6RZrBFh6cScbqA4HSUfYNw8MtG0eREeEn3kDwRydjNvxrehi7Hf9R?=
 =?us-ascii?Q?YmSDay/zXgT4NPdeUuuWr4cocLgJWTotdy0x7b4wP4fhF7YVkXNG1H4n+km9?=
 =?us-ascii?Q?LFM/PSs390uXmvedDgaW89hEhpGljdQongT+Rxht6FUe7hq9VmUvwYn9rKeL?=
 =?us-ascii?Q?RQyXnD7DBUb3gUh2j4YAjGRBfyJ1lJAk9kS0/vKH7jmNe6ZipohHcSeHYzng?=
 =?us-ascii?Q?9GHIQ+SaRg2t3LxlEt5WBG6+2Nh2a3UUpbbmG9225CjHuZu8RLH8usrNuUgD?=
 =?us-ascii?Q?TXQwEe9w7Fo6CB4T2anuRRTGiYch85C/H7BbxPnupnT+DgmeSTAsXmSJUcfw?=
 =?us-ascii?Q?x8Xr+JeJr+ItFVjwS4Ou4QV0yAmIrOcl0hzGLEHYAhSDbPH9GVBCYZy6Xf5o?=
 =?us-ascii?Q?a5QSSeoPYvhj5yMt5dA3g6VtodPZF09KyOaD1Pepb+BhC56m1IrsOTkNxllg?=
 =?us-ascii?Q?UpiHDLYjwwzXN4uy7P7b6dGNRUtW2UhoDmok2AbHa4jQtV3/zssL6Y5us67i?=
 =?us-ascii?Q?VZ9bO/wATpiWCBVYGxtDK5n6XoPq54+Fg7n0C/W/QFwLfboay6Yje++hFHCy?=
 =?us-ascii?Q?QQGdBaawjavXEdkPJbOtdLSjHZ4XBaBCgk1nguc3IwEvHutGwnrmnmn1J/WB?=
 =?us-ascii?Q?arswdO5p5ZFCGCng5eZNc+VG9IVINQ5AC4yS4rqYzVOtEImQ/rSQA6Ex8Uo4?=
 =?us-ascii?Q?pBWvTp6gcWPN7+CSRLyBch4Me5XITXMiFr/ue2AEM6cqHZV8WAqp6vdY42OR?=
 =?us-ascii?Q?0ycptzFwMbnOZIm3vu16Is39qU0FtIh3xjFI33pNXXKN8NsR2GXzA8f23Dl0?=
 =?us-ascii?Q?WQHiaOH53b4VBXpF8REZlxMh/9RKt3pnuKUClUlDd2F0eytYxxmwceYq2J6Q?=
 =?us-ascii?Q?upfcI/rDrAN6gp9B4QvC1m0Tz855Sou9nI5Qw/Kkc4s7QmE/44/bFOu9Xq6h?=
 =?us-ascii?Q?oK3oX3ZjYk8LRMqynOjeaHqnLne/VT7jgcI/Q3Sw1vIfE9G2NHWKPYkt1xxq?=
 =?us-ascii?Q?v3huoUBL1+vLawSorKnJXI+xQ8kfGi/x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e6uh9R2MTlMILlMQQ//PCZpl6kAIzbBLDExbb92XHq1NVLWa5FXpUSbjf7D8?=
 =?us-ascii?Q?5oFVR4LSNs0pE5lO0aUvSziyiBVyK4u5qFefKF1Xn5xpbaDRQUAcN8RyKkcc?=
 =?us-ascii?Q?2BD/gHuMCD58CROZ6Z3WPlcNKWNRkMCQcpiCmLmwMm5XAPCgqkDUZbTZBVk7?=
 =?us-ascii?Q?cOe3N2VGHKZ7png19YHnQDvHkAAqQdqNnRgmNNf/+sSWarGqKtAVraJQRiku?=
 =?us-ascii?Q?NU+ByU9mKdrSTcXx1YGsp19L2nWmfBmKioVZ5uccoUR1gmOUdT6o5Fw3pp4x?=
 =?us-ascii?Q?zhaxw1nBmJkqd7RTZAunjHwBae9IzMxiFMmhl92oI0roDNkWd2gc/LUoAHHg?=
 =?us-ascii?Q?rF3zxUoEmKMA27lJQBG7Z9LPhxQm0ShxmvBoGRtpfGDA51xt6/6UYqcZrAwQ?=
 =?us-ascii?Q?ckCqj57zlot9tmym7MNZqHK4AhKM2yfKPqwsN0DJoQyVgILZ+K2WF3PjHmXk?=
 =?us-ascii?Q?laFGx1XQP8qE7dl9E/qO1X2fR8sB6O8SH9lIWhyeEDHpnr+3oGJ4Oi+dmhCX?=
 =?us-ascii?Q?XqRUSNRvWqQurQ+Kv2cCdt3mDjNSt3wsm/r0hZbo54c+WOdIAZqyWICsuY/G?=
 =?us-ascii?Q?QhTBMh/bjUALXatSXd6OMfh2vbdbxulqH63jr8QTOVoHG3LNPat+8MPkWftJ?=
 =?us-ascii?Q?ToVri5WTv9atvcht4kOnJyUf6Ts0fzzvH420uLy6OJw0Le10icpfUgQMj1ei?=
 =?us-ascii?Q?FJtsWGXy6yjAIjTmKFNhOS6vAsrC5E9M9T7vsPHnMKarVru6PVltz4cDiWx7?=
 =?us-ascii?Q?RL8/iIxspyjh1rUAAJNTkHQLdYgFN1mmoopKd9L70JnltMDXNiYPExskUlD5?=
 =?us-ascii?Q?Jfu+XHwOIPh7QltI4dkx6YOnJ8RgALb+HMgUD5FnAiByrF4nlpRMDwfFgmm6?=
 =?us-ascii?Q?hesVxvoOFk58hyYIczlyr3kWcHDTz6rOsfIc5BSk+crF2/on+xSRhQhBtc6X?=
 =?us-ascii?Q?5luOn99sAEV2iZSUXQv8/61OVY1HynW45HemUQ4lJ0KpRMENBZEe5hGN/1OX?=
 =?us-ascii?Q?XVOcTk4zO87Luo3TqPQqdxGXk+r1KFRv5mbBXQ6XikoseCgfXijDqXQ3ZTLI?=
 =?us-ascii?Q?lHNy0ARXbX7cH03oLYGzEf9hrO7RrvbrGw8aQcTSPHmxwqrqQN+vVMRpRFX1?=
 =?us-ascii?Q?1zHbjes+oB4MboKQz6EntsLiqaN3GWZbZjXiYdA2ItsRssCyQmZtNJ5+Z9s5?=
 =?us-ascii?Q?sINQRd5numPGsgSlJXIbhDjHprgqPs9bJvt83D74aQ7uy6llJzv77lawc/xu?=
 =?us-ascii?Q?d2GS1Lb0NP6fLeqCFGtSeAmrsqH+Y/sPjgZ6lgBWKxEjkScomv59z1rMxw9Z?=
 =?us-ascii?Q?tbVLtaSh9B8Dikx/NHNy1m2aiozY9xMGBg0y9YceimcLCGZR9rnp84XEgdN1?=
 =?us-ascii?Q?UW6w+0q4urvCFLjp1jnST9L+7LkUH4VZGt05p5rWQ2yLd9L3+KZmDL/kaduw?=
 =?us-ascii?Q?H5bBaiXx9PWbd0GBKU4TedqpepIJ3wIM4RBhDBnrc9HSY1tSyz99mOvD/esz?=
 =?us-ascii?Q?mClOIjz/5Q+dibTcPlgApMxGAafCePa0fo63G6RukIcEzShGsRUQeizBbmiR?=
 =?us-ascii?Q?9cu5PFjpMqZGDuzGYOJ1rRefJ7RmaRnwP8qV8RR2?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091b0635-678b-4dd1-ff3a-08dd313ab5d3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:38.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJzcO2gbVWESR2PDC+I7PSdJpEpCt/X1V0W7RGlTZUtfb4hUWmOCpyL5Syy9/W7ekTcBO5MpVD2KHC1eQyWuEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

Matrix_keypad with high capacity need a longer settle time after enable
all columns.
Add optional property to specify the settle time

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 9c91224..dc08d39 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -57,6 +57,12 @@ properties:
       before we can scan keypad after activating column gpio.
     default: 0
 
+  all-cols-on-delay-us:
+    description:
+      Delay, measured in microseconds, that is needed
+      after activating all column gpios.
+    default: 0
+
   drive-inactive-cols:
     type: boolean
     description:
-- 
2.39.5


