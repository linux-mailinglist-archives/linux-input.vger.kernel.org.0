Return-Path: <linux-input+bounces-7873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E17E9BCD80
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8266D1C22571
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1168B1D6DC4;
	Tue,  5 Nov 2024 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="naHcsTpe"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2065.outbound.protection.outlook.com [40.107.103.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523E1D6DBB;
	Tue,  5 Nov 2024 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812200; cv=fail; b=j7je/Zoe8Y8THOJuUctJEAqYNvXvNiC1cUlzHKtaIa+U5Ai14/pRyK+4U/yOUkA1w1nsW1z78r/xQskwg/xlpL6je04syPJJQwjEZXHwakF52qj02iiKgiQihr1HswUYSIb6jDuXjR5ADdbAtaHXSTlmIAKAxoWNFglKCg0DPwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812200; c=relaxed/simple;
	bh=hsFSlzAzK+Y37KCdiE2V4fS/I8LptbZxhm8jRpUkzwc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hrME/Y0iV/hR4QH+QQjYsyjHbsofSTUw6skjxpaEJm95tWprAIlYVeC56Uu+D/qNnKGChzn1vaDSVly22sssI2nM/3KUccoKMk8E5hsMlyGX3i/lNHAO8Erm8YxCD6WwWwfpuAtGCzE9ruakZuiQcrHeiWxsn2kMuoXFM+B69vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=naHcsTpe; arc=fail smtp.client-ip=40.107.103.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE7MGMI2qGz4OzZkwU8RQqmetnBz2HMBaumudkwMsJJQm9557zfAPppYcz+J9VLjGIbmMjhWssYhVTJfezpnTDUw6hujhm5HSHc85AXrho90zdzb069TOLlKtFwhbwG7NKmHqFKEnrgODoAtjaR3cA7FXVnh74J5yDK3wYr7kB+4nEI1EJPuCaTVCfw8nA8m92cggvnOpZFvQICh1DvJLaaaUQGe3vt2/vv5671yDyFHoey2nkSdUe4FgFkf847o1nZTXg5pCSj2KVCzvX0H3OO2wGcqS41+/4FwUn/0TNRaAXr4uqQdAifVhfbOBVzkS4nFrOJoet2s37BmkRULXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm8kwbF8ujtQJ3hks0GazQ+RZH0hifiVhqY1o/rXA5A=;
 b=QNUsLf/WQwrrR8OQA9M14ZW1WGSdPoGOopQ6tQCv6h6zx7KW+7E23747DSIwtODE1zFfs9LnfT0J9PI5O5/nCE5g6CuM9uVNkXeSlmipXKyN47AOeiU1Qgj64cnAyg0UQ7V/tJKlXuetZ93w4vTl9L0tcDDit4Bu+1SFrWowbGio9+iR9Av/Gnqb0Nrw26X/qpLkPbR7xGIGCwTBx+dJMlMSaezUF7hPq9Md2mSh49RnoQ4+gde9SLc+cyWR5xcGTeK+QoyOvbYCVvgmraUYDNW8ohF9ZaXLgTWIrgsBb5jfHLC2Fnixz2oXtIqBm7VZwW78qdANPeyFX1V2K2/T2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm8kwbF8ujtQJ3hks0GazQ+RZH0hifiVhqY1o/rXA5A=;
 b=naHcsTpesVl9udWq9u4nmGIk3d4vYyke4u7zEiVx/qmsy7AqGwXqvvfWuWiMVWbLrlf0wEafe6fCtX6J0F9k/xUUZDd6Gx/W+O4vOxaYsYBPTHpeBABuL8Ykxkv3sthdXV35ahoJSLHhsweVKCYD1/IUA2GUcpkM6slk3y+jxkTRFv0vV9C+/UnoxR+ITNUbEUbZQ5UgFDnDwzyxq2CNmkEBRErQQKQNHWVhexEKGzJfXh5zx71bGtL+f0wlv2Vu5LzD3coGv0XeU2umep4/HDtQztK2uCQ9d2Mm37+FkOuFxoZDBKfvH7Ud/MiIh7LYNHvBJDkI3ep9F1TRQ3h8+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB8468.eurprd03.prod.outlook.com (2603:10a6:20b:52e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:09:55 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:09:55 +0000
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
Subject: [PATCH v2 5/7] dt-bindings: input: matrix_keypad - add settle time after enable all columns
Date: Tue,  5 Nov 2024 14:03:20 +0100
Message-Id: <20241105130322.213623-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0026.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::9) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3436e5-e6b6-4a87-d3fc-08dcfd9b243a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O7/9GSXv7S8EgawARv5K/31nigflX/j+ni7QIP8jNUMbltu2/Wkxra0A5Fqw?=
 =?us-ascii?Q?YNYeVGPlFD9MmBAIRDVmhkhI2oSUeGLOevvpMPzwT7tlP1viO/Hf4dhPsNOd?=
 =?us-ascii?Q?etJ6+XTuHsGEIzQ5DBWVMYzyIQp2f5ESgXSWLKAc001VV3iFcDnUQHqdf+qi?=
 =?us-ascii?Q?DUt/m7v7DUTVaCGfjQWBEgTXllhtJu6Xlk9hk17CEpccTkihaoOC/d12BBYH?=
 =?us-ascii?Q?VygILKo30ep5kRiOrfKYnbqIMdo2p5Fpd9apEJICG20RBz+9NRVVcrvU3Hvg?=
 =?us-ascii?Q?yJ/LtxXaQEApeeFYGUAhkjICaabJEPLs2AQhzUVR+GRu31wvc85OZ0Eb+5ex?=
 =?us-ascii?Q?yMixE3UxUhQKxkNdEqoWK2ebSPNXOraThU1Ge3TsxlG0+z7N1caSbH5tatSr?=
 =?us-ascii?Q?CNwd6GDMQFgxvBhMQEfkqD3zXvs+/iavkG48wmoWz91xzTIAzWgPdX5hTyD6?=
 =?us-ascii?Q?WyQnXCJGEP/3b9xF4X0ZGe5hFqxlHw8+YLqXVuzMsf/9iTNku7lm6cviSQUZ?=
 =?us-ascii?Q?zWLUgjWOU2mWTCuHR+gbFAuOtQ/d1ZaMbc6VBxVlgSCWnrAq3C/MoWoPEs/z?=
 =?us-ascii?Q?BedF8XuR4S1Bv4OgC+4w0SM2eEULT4uc3vf3F7UsIiadAThwssdFaE3xFsuY?=
 =?us-ascii?Q?p0BgnPh+/4Lqt+2Yh3dUOFebh1xS2LVuY5MpClqV9TpxG/fRKcQ9rCM4yVDT?=
 =?us-ascii?Q?UrE/PKtnLLX0sLWMRr+Mp1802RlBURSImyITJZOnknKBPzyYPl7clGz0ifgy?=
 =?us-ascii?Q?m0w6Ei0LLjUYxjEUR3bcOgLtDgfHPg7vUbs/DEHjRnAdu/YqkafXr9RuugFL?=
 =?us-ascii?Q?uGURoVN7w39mdwIvqusUDTRg1qKmqsqV0U+KoUjK7m73/Exej/wKauwY+Ncl?=
 =?us-ascii?Q?8P+ScEOW5pkYXXqeFJvcEiRFEpsQp1dpdLKh40lc5NAyx64tj2UaeO9n/taV?=
 =?us-ascii?Q?B2SQT+dh36f/s0f3fucU7d/UH1mZ9hps+PpiaRrrJsCzKhFQWUHvSosl4x/Q?=
 =?us-ascii?Q?TdUIjOrCoR2ciOABZ7f6SE2qpjaOPuiOzhcwYolmljRNGHWctCvEEmXvsYgE?=
 =?us-ascii?Q?VDqmu3O8rKb1X9xRVA/Koso1U0spEVwD/W17Ptecj1OdTAmlIGgrFWUod5H5?=
 =?us-ascii?Q?/Fn90uNvQn1DvM5A6DXcIYMYPEg6jI9Gy1JYH8Z2nS+0KE4MjbUCZTxbcJoe?=
 =?us-ascii?Q?Xc6KfZpqXUd7OdGDzWiACqrCZRZRX3FiRRGNFh4Dn4u8Pk3WieH8yT96XVdZ?=
 =?us-ascii?Q?7+dARzbPheS4OliriC2CjYtvSPdspyTyg44jp5ODaef4I+njU4QdsayzBuVc?=
 =?us-ascii?Q?qu3mt5ZPsoK/04G+kLdlWx/+xKiKLT5aM5UhLh4TIynrPQJZoQueygxdK0i3?=
 =?us-ascii?Q?OO/4GIQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9XUeBsYL+3d/NNs/TcP75HYTVbfKQD/Cb7Ef0d5zNWlP9q2by7owQXpni+e5?=
 =?us-ascii?Q?ryeA5FDmpkgsc6Eh5JNPiW5UN3DK+BKcKxwjbEuZKiZy2PoKMyklf19ZzPhD?=
 =?us-ascii?Q?tryQJQxK0a0edFDbJQze5IffjOz8YxpPly5OGR5Q0Fa+JKAyJzWH5T56ne/1?=
 =?us-ascii?Q?UXlAFz6IW1ljeugKDUROKYFYrcIdX4iwihPLnDrYUYEL0ci+ywbF6Jgauywi?=
 =?us-ascii?Q?KD8oX9ll4SSFnO0ygVQelZtI/4lZHGJiXNoTNuiaZAOEYsdwDNTiH4R/JmZL?=
 =?us-ascii?Q?aGEmMQJHma4dGZwXJIzDNo+0VNFteR708sGvnyyZoL/Awgp6yogIjxmNLOG1?=
 =?us-ascii?Q?VmTTx5P4bSE9C9tPGaH/a4B6je4RdvNQjNH6eT1o3h8O3b1wsI2GjD8H9Yu8?=
 =?us-ascii?Q?6oeTPYNjRGQjD/by/5Iljonge4v+VZjy7d04NCZs1AMuhHSp75KHwJ7RV1Sv?=
 =?us-ascii?Q?5esJ+XkLk21MZEKPZZTrViZOg9nhLS0GEgRS8085F3hezyrJASVgsxWLICSU?=
 =?us-ascii?Q?fYKct/e9nLSNFHJnZQa/a6dGVOF7ZnBOv1QCxHyEnF4E3Yl6IzKGlzQT/AdM?=
 =?us-ascii?Q?9mWBUVh1wM6PPgnaEzgGcMwMtio3xn8KSyuhf9jvZQoTX+X0wwjI/MyAKenp?=
 =?us-ascii?Q?8wKnAf9/K5U/eSt+r+SH/0dHaW8f95JO9hR5RqJZQaTTeXCc/a3DL7IFgK/q?=
 =?us-ascii?Q?3hz4MQwcpC74urnaW/GL7tqxDIiXOswfVbW8M2LNUFZ2uf9BydvQHwep6Niw?=
 =?us-ascii?Q?WK0SFOteuF0mF4ieW8V0Fggdc0o9o2DIDy/YKftb0iKdEnqhBsGgGZP7FC7X?=
 =?us-ascii?Q?V5SvLYIQV2KMpZKXo2ldk62BhhRhIvZeUMSbawr6A0h3sENDB9p2R3uJWQNO?=
 =?us-ascii?Q?JgGAaQOkuVIDVeEPmR5BmFict+C8UqA5viuLGAG54HC+LTSGm2o0xSnuGljP?=
 =?us-ascii?Q?8aMpUharOF0VUfkN195YPqdHwA894RZXiotl1FJN/0eEYC1rIZJByYeG0oeB?=
 =?us-ascii?Q?40sEUIMasUxWAaeUoi0/2CwMKa1+L9eWMzOR4zU2PjnntYnEaf0u1t+IKA92?=
 =?us-ascii?Q?o8cne8GiP7suupyU54ymzObQkmaL/afczWit20j5OuLDMgPxUtE3iEcIu2oB?=
 =?us-ascii?Q?vUaeBtAOy4x/KaL3ZLfF4bAmY/qYCi5HbpcswXPAgjL5sUzLmZsCIrOJJ1BY?=
 =?us-ascii?Q?xby4G1HO4zX4WAptuzdCDPqQ2Q2KW4Wexc9YxP67/2/5N9/XbnBZM1ZkvcDM?=
 =?us-ascii?Q?3X/AH0L9al+W/EcQ1cdbmhxLig9E2kfOC7w80P+PFaPjEJ2jpK7KLV6shO0R?=
 =?us-ascii?Q?XFM/3xxOj+L72QZDuUVd2BZClXvq6cpO7T3mh4PgyAAvCaFM6kh+/Gyv/LDR?=
 =?us-ascii?Q?uH/AcXM28cl9AX9ivKPc6IfkTs+OGPsBdBS9i0opGz6fXlJC/GEPTfnjyGzb?=
 =?us-ascii?Q?ZFI4P9gflDRIs5TeQ/UVprX6ilTmGZ3zQ4w5ddNKUwYy5l5TbNAyUlrfsksH?=
 =?us-ascii?Q?p653MdE/S7oVP/viqrp0qUzr4QFCYrb+WFOmqQ3Aqy2Te3kM07yI1SWMOMBg?=
 =?us-ascii?Q?6JgNxtdo8rEJs/CR9GeVf6U7ZbHxUx6IJ6WKbc5s?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3436e5-e6b6-4a87-d3fc-08dcfd9b243a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:09:55.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jb3KIH/IxdRUIq/TNWiBdONbdWXMhKqgMHbkJoqY+jgJpVDtuCW+UOE5X3Jl0FHp4olIrT84rH17I2UuZUT/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8468

matrix_keypad with high capacity need a longer settle time after enable
all columns.
Add optional property to specify the settle time

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 9ea66b3..0ce89a6 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -66,6 +66,12 @@ properties:
       before we can scan keypad after activating column gpio.
     default: 0
 
+  all-cols-on-delay-us:
+    description: |
+      Delay, measured in microseconds, that is needed
+      after activating all column gpios.
+    default: 0
+
   drive-inactive-cols:
     type: boolean
     description: |
-- 
2.39.5


