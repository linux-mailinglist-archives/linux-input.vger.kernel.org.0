Return-Path: <linux-input+bounces-8998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F3A041C9
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4CF33A75B3
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA171F5402;
	Tue,  7 Jan 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="mfjZbao8"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F961F239A;
	Tue,  7 Jan 2025 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258630; cv=fail; b=B06tcMDFSuh7iEIATK58xKLTduFjV2+qoI0zLVEa19/rGERt4iqdTdYy1a4Zr8/dNGD8MXh5TWeyLtQqcaqx7tNaVthFxQKeNbhOjhUmn2nwh1yAY47TANNOVfCcu+dwlB8dWkXQ5K2wjzh+rfS4+oACu+dJ8PjkIxGOYSa/HSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258630; c=relaxed/simple;
	bh=lOLQphsu8SLWGtQVUcwoPXsIiWgcNjIpzB9++8fZwcs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XeDmc9qKfdt4a0dGsG+NzAVkXRO6eTArYXyNKkochjUcRd649l/4Qi1Q9JTIQeK2H3YK7MlEDDCKW1KTkMkR7ScdkaM8mzL3juuVnCeCll2iLXY2onfrIGIOidR0ZL39JPhtPSmu/VzHmosan5XW3tnTIUUOXZ33Fba526x2WTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=mfjZbao8; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlWzxBOXCH50I4+Kj/FcbTiwnZAOhmCevuL4hUnSfWaTNPKVp3rRNAFkK6ewu71dtznY+Qy1CMrs/x4kCTFGBnpqj3a1UFeDfuhg151rg9J+Bg6qQb3lCGRiFCEvd7yUUpqYNlBJvj2r1madKcPup6ZPDHqvu7rsJkdg5bY9FCKWIlN2gRxK/8V93cqDnNf0vKFW0Dee3al5fYTsmJ3k6+L3mNZFmZJyXaRSqRhPHrqGb/vKJDGg6+FE9llbDRtbtfiI/hHTJM10mX0W6QbBqbIQlzXA5I+yjxCBjV9l2xG/SVtfk30f1gkMyhsOuAB9BXO9TAFlUNNvH1jS8oLLNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD/WYeTnwfz4gIUoEAH2KQvQg/fFteugY95cueWhNBI=;
 b=OBLXpe+51locXRzbV45FZtmd/lzF+89XbvPbLRWoxhfQv8vQNrDZrgwUk+PPQDtAfGrPCossEd3RKIB1KhE7udgkOHadLFxHO3FmGcRbz7stdv/YG+36PhWk7f1GJnJSw8F+r0d/7iMStEohNXCNTTBsX215iykV5vfDLH5HBoOjordLamLA4oEf6Kk+pxAD7pBAQl3m8vRjSA4Ah/30uAUpjj0JBEomy2pLuDV1KZysjGsjfXSJclxe9cy7m9E4e0hQ16ZLKWx2fpm3WgMDXdi67tKkI2kZgjMPtynf/iF1MjXD3MHvGovO2uwMGOcdCthnfntDzv8zOQzXO/hHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD/WYeTnwfz4gIUoEAH2KQvQg/fFteugY95cueWhNBI=;
 b=mfjZbao8lUrU2n2i++LtJpvqZGbrztvYEGyBC3cdryqh7zUwTS06BtSKhFxreMZc9a1nIsoe7BEhewcBRrNYc2p65gUkJ7kTI21x/iRWc7be/dDYxMGfz24sygEuz6oUzZIF8hK7xfI3yeJOm3vB/KNtjTKXqmlx0ANVGgi0jwD6WPx8qmdbH1bZH7QKWxREboFD3pvrrd0N3V5ISaEvKYemThY2qzWMe+8RzhEPyd/xKOTvW1OvKTobE8CeGnM/2gb8AxSDbTHxkku2havoOEcfZjU0thP5JPM36JAmG0kGCwgBb2rgvr+vP/rak1dz27UWyOUaq5+jmJIjY2UYBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:03:08 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:03:08 +0000
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
Subject: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing property
Date: Tue,  7 Jan 2025 14:56:56 +0100
Message-Id: <20250107135659.185293-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: af55140f-c7c1-4b39-c8e5-08dd2f2403b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oreadwkuJtyyDitApM1nTB4bOqnrTGxFTMFX5Y/ZAKDmEdtZppv/SZzdUPPG?=
 =?us-ascii?Q?ZiNYP1gdb1EQQBhrmdZOEWoZVo9gkVgdMgv4e8gCH5XIfAmExPN6P7I6r1HK?=
 =?us-ascii?Q?RBW7rx3VEuJLhXfb8HCwVCDUp2Nm7A1ZEOJ8M/ZCXaz2T8q6ri2iJkn8bkF6?=
 =?us-ascii?Q?4/ACJHu2d3AvnGNc8pXuYjmLUPItBt8CQ8bCKPQJixRL9yIg2QTiBsFNT218?=
 =?us-ascii?Q?OJ5w9tgA5Ccpuu+u4uDFREdfr0sRRec2eEg2IRM2K1UBDyiWbH23km6NneTG?=
 =?us-ascii?Q?hGZwSw5E/i8GU4gc7UGISnpc9+Z2gozAXIsXPMJ1CgF6BEm960MKIAsofA4q?=
 =?us-ascii?Q?/KGAQc01UcX+PIPlQVUVlrkMhQaRwEVZTDtf0YZNOZ+jxR5KUiBiuyaNQH8y?=
 =?us-ascii?Q?UUdkiT2MP48HH2MOsFtg971H9hH7jCjnoFHO2B8+6qFFkxxBbZnMOKe4O8hL?=
 =?us-ascii?Q?7ALaGtTqPuHQxSbTw8rhlJsfeEQN1Pfyk6PpA4GZDwPnP3lGftirYh9mF2YD?=
 =?us-ascii?Q?q8LY+FKDRsbWLZvFfVmdLqnVDtrP19ejdo6HUqch+8/33H2YEtUHgTzV7ABP?=
 =?us-ascii?Q?/gegN4/XhUqfb2d/963pOc51PGa97KdM5yAhvywG5DJ3vmBvP6N9xIEPamOy?=
 =?us-ascii?Q?Wxt+nnEvmujrGwoO8O5jbXq/AvpLq1Jh6JdXNMghPN5CzoznGN8m6dTYiX+Q?=
 =?us-ascii?Q?D2N6H0kR+bF8rE+bWGWYEVIyXJqqoRPKhYPdCjKyaETDk9WEsp3RCLJyMtXu?=
 =?us-ascii?Q?5s4zUq38GqiOULGwSWpxeghx6u8btbMxDHg3ltV0TUb/NzTnuUnnMoULFv+6?=
 =?us-ascii?Q?Lop53vxaJD2C66Ela80DhWS38ET0AfODcjQHfPt5jYRHcK99yYvGaRbnugEs?=
 =?us-ascii?Q?HDGHtiDszJazQoM8JFIcWF2IOfyTzBxeLQJ3Y+VBVfa5jjiun8o9Wc64LjXO?=
 =?us-ascii?Q?uX4rX172EiX63XOBE8bXnx7ngOnx3SLzowwWfSEhLfIXrHmMeuSVPZZy0ARn?=
 =?us-ascii?Q?HLIam9MTggZMm168KF2zQpYmsqRDra9zhf1fThDjAyIO1o4pq3L+1r/exWxn?=
 =?us-ascii?Q?2ad67npXQGBOjZcZVnrokSwyFgv5rlEc5kV6APsADWVxOebONZ5t0K0N2bOd?=
 =?us-ascii?Q?7ClwWmA3dU1rZoVWZxSjyhU8YA56818x7fxSKSxAo9R8FMzMdxf9UPo3nIzN?=
 =?us-ascii?Q?cbWDI1N1aOKNCr9DebsrIWb9aaX5nk5mfPIxEMp+eax9jtuU0aQ+mCruC5NK?=
 =?us-ascii?Q?tlO6DJli43sev14k/JBCjM1BG+ebbuypa0Ii7IHXe+ehD7Kuk8yQL84rhy/O?=
 =?us-ascii?Q?WZwPAPTywQ6v/svipN4J8b60z8qrB01396airyQD1FTgINFLsaQo/IjIzo7v?=
 =?us-ascii?Q?zqEwLZNe9MoVo4E41xre1YmMSAoDei7ieNgL+udkWzv2e1+zKULleNJ0kgWP?=
 =?us-ascii?Q?1UMk2BdebZtifG9qxRiWLQQUxkPuNizL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjuAgqQyJ0UPkAx9lSoLMdeS9bMclezfbuTqFynIkSPoXoejpAu2CCn+oTpW?=
 =?us-ascii?Q?LX5GSrcD9/xR1TFon46cDro25/istkTw3iLZ+xhQj0exKeAP+bcrEN1YJfnU?=
 =?us-ascii?Q?9UKMcQ7TdvmvMkUNbCAAyt96hfFUVDJfVUu1nUBmEz6Br3Ox3+wPak30GwAb?=
 =?us-ascii?Q?QB5hakTtKAAGx5uGQJQjav0o19BO4urQOEpQj6gcuM6uItE6Rf4sQBiM7BoH?=
 =?us-ascii?Q?OAGgl608M1bSRFAld/aQWGMgXG6Z45f5so1FtWA2Ivxtn0ngq3PICyu3fQaL?=
 =?us-ascii?Q?W5VN9+P4HezABDXhBaie5dsXBnE6cJQs29Kh0Ekv8TuMc3tesBq/XSc0g6MP?=
 =?us-ascii?Q?ZA8JnwiOanQgSvdAopddD6b53paub/LAE26vQxYiG2rShOIJ7NqX1sLKZrTf?=
 =?us-ascii?Q?pmMTmx3SI57E+AMBVJNYjBgr5MY22gpI1Qsj3QhC3MIJPqB3c8E12IFSYnxC?=
 =?us-ascii?Q?ycVLSUIRoKETKLj4wgyZp6nGKHpBH6pKgGlmRo3Jth4x6ooz02xW8IHViEw6?=
 =?us-ascii?Q?dR2oqYWbUuScMIBhTTmKI1Ij/BJt+7DF3j4W/V29S6MJlfTLKdsGLKVq8nzR?=
 =?us-ascii?Q?f9Q66RCfAcMbrm/XeRPTh0o0VZ4sZvgpur14Is4MoaRdw9JJTQ6r2Rz/9cmE?=
 =?us-ascii?Q?l5xTOGiNcfnGKNeyzfl6xPoibQRSUPDO/xF+dNDDO7g0jImH84LEq5f73y6Y?=
 =?us-ascii?Q?xGoykhj4kSFIa5MKmFDa0Bf0wLiWLF1rYHTInxC7xF3GGGpaKY9LijohCaiY?=
 =?us-ascii?Q?rRCNPk1gsLWa2xkGBLi8btdIRo0RDSZq6MJAvRYok4S7cRintFcI0E6EqRGY?=
 =?us-ascii?Q?2DXe6Jlk+PmKXrjdi3zVxH686gtQGCI6vOerSvjn8dC9LDd0HNfuUWCWoyac?=
 =?us-ascii?Q?+HU/KywgWRNBVMQS+iK7kcY4qqZuelhNnVbSa0YzEjw5i/HnFzkLu2NNKudK?=
 =?us-ascii?Q?zO6AqAR3sPDcFSDKLh1QIQw63sr/RcfO5MEVgjQwRoCreVVsZxUuv/t7oTCM?=
 =?us-ascii?Q?UhigAsR0uDu+j3P1trwX8R9AWEJCQnxbSXnfL4nQVCYJeUfQg0rh48NXzyoQ?=
 =?us-ascii?Q?Wyt4dbfA3SaIg8GaqKhsFP6LaYHcAhe7ZhM3nDXnAVLIGwwkjZFQX7MdWWMn?=
 =?us-ascii?Q?qnQ8kWh2zm9XmN9+W/n3Ynn5sWFehVLIjknV8RbNKS3GRgH4UYsTOCx7oy29?=
 =?us-ascii?Q?TtS1PI5+C6bt7pTSXi9XzON3sIjAenSDToj/hPoy+pXhUZ7dmXW3iul9nIQg?=
 =?us-ascii?Q?hktL5wHdFasDQkauw53eeuShRIgu2UrmA96kgTeBfgjtXKYLQ52bTqfu4k+c?=
 =?us-ascii?Q?vu846tiGinFARZ7tFYYw9+vkXCWYv/YftGPrMeQwGiOgigplRBSvZi05ZkZP?=
 =?us-ascii?Q?hIJn5Exq8tJUPF++Cfb7YxfQrFlCj5iuVmy5x+cotqvS4+GzKMo7vIw/yeBj?=
 =?us-ascii?Q?km0pdeBU4nwNeKEk7/uTpbr9QX/4+yOd4tqp7s4R3B86CuRYqo2KDExW+GT0?=
 =?us-ascii?Q?a26LmE3Ozrt7TaKEL0BL/EPd2hmAHTnWW0TndsBRXXEh4eoqi/4EUX9TI9oP?=
 =?us-ascii?Q?u278gXG8LRRwQ6gzd+LcW0rpx4OlqXEogO7ATYt3?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af55140f-c7c1-4b39-c8e5-08dd2f2403b7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:03:08.5193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0e/BK5ptAQUgElH2KG3Xs1tfw12B81qRfjxipG1BNIIR5G80zl9sWs0Y/a8T6m+dcyhfHXCItmhVIq0Ozm3wpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

The property is implemented in the driver but not described in dt-bindings.
Add missing property 'gpio-activelow' to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 75975a1..b10da65 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -38,6 +38,9 @@ properties:
     type: boolean
     description: Do not enable autorepeat feature.
 
+  gpio-activelow:
+    type: boolean
+    description: The GPIOs are low active.
 
   debounce-delay-ms:
     description: Debounce interval in milliseconds.
-- 
2.39.5


