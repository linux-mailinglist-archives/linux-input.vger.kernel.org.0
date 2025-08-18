Return-Path: <linux-input+bounces-14108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03864B2B09B
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 20:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B27C1B6367E
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 18:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CF6264638;
	Mon, 18 Aug 2025 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mkCnJLv/"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4629223DEE;
	Mon, 18 Aug 2025 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755542313; cv=fail; b=ty/URT6U5x4moo0hyhIpzo4nUlsNfWUJWvLXZsC7saC5MSo/MTQmMvt/R8pO6VxZ96uqvVhQc97t/9HgVO8h1z7R1j3EgIx754sOwBbCjZMRtxHTAZj1kxi+QijwVI4wLqu2fHUk+zU9F2hLiLMqecGvwvSh66Zg7nE7s19jx+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755542313; c=relaxed/simple;
	bh=gPx9f8uWYpwLO6wauDUgNnXldfSCAUBd/q6k7/IQ1As=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dYlb6DvDqhhBVKKXUJ7OeJ9p0aU4D4GjVILY2fNEpOmafcdAtYKSzAS4Iha509j2kWtN8un0t4Kh+TMYqgxJwjtu6e7wPTujJ57wjlxvKBdnPMPNBGgrSS6Pcduj3u5GDv8O43iexjDqYlK3S92gQGPf8NUqX5FeMgzyTeRA+B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mkCnJLv/; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVSkoD1zOVYmuZmZ2HAp9AZ56Db6guOu1MLulBKK2psxSveILv0NQGqNk8KnhT2gNzLanTFZcMqVkaP3TPKzE1Uk/ZOtD6NuttAydRaL+fD488esfaNQOwyDXbMkdfu7U0ntvErF/8srz2fXuUcMCEh21xCndJiIbaBijVEmlprcRCkboO09fhGNjxAN/hrQbDLfOYL1267hpMGkUSGwk/5xIJVsDACpsCfGKH5eJbBamufMTL3Z2ZK8CYv2czVD6j5Bq02b0LKud1FqrR9vUs6oLyc+1bobSMqiy2mJlQXQ+AxrmUcmTadpdOrUNEvpjQE3sMVUSvh8Z6UvpGhmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCmZbYCJfOr6WH0O5tAMZaWPDcWJgjhkvWzPM07viQs=;
 b=I92yHg7fmorVDWUS9I+IApR+e4cDo+ig7+DjbnJwEIiOueY9glXu7HIlkaNi7XTCHpqAK6FdJG9htmRTEUnAPzwCeUA+rX1FQCEPprlBf7TdGi6oILF6ImSwn3fnqfiTrAcC7vnv68kG10RSikyMIRz2/Kw3hs/arl++cElx4OTzng8pCsGwOMaRy6vWoPLx8L0qlSQjbfhreTFQB49OnMZ+/jx2GRODNBPOdwUNWHRCInANuna8UUSgEyzDug9NT741PJVh+cTZdx170LA6VLACAGnFHEG+Aqluwpm3ezSjXiddKMpxjyTdgr1sW8RMg3cspCMOkY5lfk0eHkx6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCmZbYCJfOr6WH0O5tAMZaWPDcWJgjhkvWzPM07viQs=;
 b=mkCnJLv/UvKhsUQH5wUgF/Xz24ucXK7juP6fWhagsLgFzUx9PDYJJdJsZivvfr+3F+Zn2ZdmcoWAVzGYPICVsK/Ke1Rozc0IiqjByAM0mVsKsT6xHakCyEuCETH++tCoSxrkoDObYHHnHxPJwR4mDXkw8o+JwRTH1PMY3tnuss9Rn0Fqu+sf+RDx2SzCXv4KS39gEVJa4gOaBm4b3v2qU/0tkA6Eq5LYCkXHoMxV/dNLXNWUGqaZN7YtYiOKdifwd2nigrvdpNwtISNzwYc9RyOnuvWunwULla2pIdcnlOCnjb0dBpesiVhi+SdiixbncvkHNC/sY0F6MLgR6dYHcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by OSKPR04MB11317.eurprd04.prod.outlook.com (2603:10a6:e10:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 18:38:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 18:38:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml format
Date: Mon, 18 Aug 2025 14:38:13 -0400
Message-Id: <20250818183814.3603308-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|OSKPR04MB11317:EE_
X-MS-Office365-Filtering-Correlation-Id: a4bf745a-0a49-492e-2adf-08ddde866bad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKiHu9/IQ1C3/Pul300YhFKo06CsN3ntgllD2m/BPwfossQgkQAVaEPgh3Dq?=
 =?us-ascii?Q?1d+FE0dPnf+XYJYPqHIcrngyUI+p/7HczzvlvHWNka78zx4xZCeUAoHoFTnA?=
 =?us-ascii?Q?cBJB84OwgcJwmOLaFUGDi/5FSThZCU/sS4PeyIAU4xqCYNDamikCdCmJWz5o?=
 =?us-ascii?Q?0UtNoOdlOriV2pC7lcrp8DL3Qux5VI/XVouYejADV8jvK0YdYWZJ/mNIGULj?=
 =?us-ascii?Q?Ah1HghPh5M5J9i2c2bbnJu7KCD73fhmsj2OVbXPWOrVXiGa+QCf4uzfpJSnt?=
 =?us-ascii?Q?4YDokocrMrXXW0UOqi0T9Hewxvm9CzSDk605o5Mqj1zn3kK8v1J1/29ntPGf?=
 =?us-ascii?Q?xAKSh9s6YdVwuQdWmst1/rdJ9zCuoC6zjdcuX8gR1lOLqV2C+YitWzgG0+Wr?=
 =?us-ascii?Q?GIKY4GzYUmbdpz1ZIC93qrzZEBNHrem2agJxNPBb1qEbRt1ggukz9Qz7qCTK?=
 =?us-ascii?Q?iTm2l4W8ddHTXvoScjX9kBPv3HIzWwylaUfuI2qViSk/1akCLMy83anCqROt?=
 =?us-ascii?Q?fAnmW+PsY6rz1tYNocV5zqPgt0kw4CJ6jcCKNnhzEIqHafmIEGhqOsbbW18O?=
 =?us-ascii?Q?MArr3PW3wWJBzVBjuWUpUDgtuCug4PFqMFSTJl/3IvoRvNQG4hvo0BxYCSkS?=
 =?us-ascii?Q?N23v3vcXnlZtMnIY6pF0VMtgIyYkzMh27yTy59MNoAKnJvyhVq8h5/d13IWi?=
 =?us-ascii?Q?Q+AhECilQYD1y475m3mbutPZqFn70OUiK+7mTgsS3ymSdiyqSMucapNICcPw?=
 =?us-ascii?Q?Z4LDJkjrWn2QczZFtaMGae2PD/SaoAW9bBLNvUk92WeFvaqRaLWWF3jLdcuw?=
 =?us-ascii?Q?/qWvxe+VDVzbFcw0njc/tbWKYyJjpRke7oOHmGS39Nh+XTswkMZ+ur2fjU8C?=
 =?us-ascii?Q?bLptLxUsHFI8iwRWveK9EO/aRixUprPsURNSyYexPeTMxLUOVi4m2MEqlxh4?=
 =?us-ascii?Q?/49U7MtHAUMYAOAWLrTNXZ5oEgHQ4ZQe0Hdr/UZUzWPyHMEG3Ptitd0gZrxt?=
 =?us-ascii?Q?6Np7/s6BuzCr1Bcv/juniCZHVMEavdtj4tctRGS4Sr+M1H1x9xovIJpnBMvS?=
 =?us-ascii?Q?dZJeiUy0NceMf95L14izn1HjpxM848v+IPKqpYSyVT/7SF+VYjy40g1Z6AVr?=
 =?us-ascii?Q?Aj7NQfPDluNcFQu4oTK6dTGRbeDeQsy0AReByQwODydibYLVkYQRLTyLaDFE?=
 =?us-ascii?Q?AsZL+a5pkAose42F3Qr/a0ai98S8lfb1r3bFcqoqoxDCR3SzfPdleHyLvcfU?=
 =?us-ascii?Q?/fLzZ7avcSSKNNelBq1v4J+8s9avjK0l8UmGJYzjm4SIkXKvHY4G+1yKS9IB?=
 =?us-ascii?Q?zerteYjutqbIjafWyy2n2/ckcK7y8KSqZJ/preo9aclsgfX5X3yK5ZOIbpt7?=
 =?us-ascii?Q?RMgCXa6NJZSSO8r7TzFgPtDkRBf+imcdbcWCdDIYG3oEoac3JeQvU4bInYDe?=
 =?us-ascii?Q?dfpNT+jEEPgjjTl4+321ZyzTnTRAxh36?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?//iw6WhLPN+uc3TT7lOl6ANhpT+ne/E48khgNKSMl+wPr0xq314oRDDhNceX?=
 =?us-ascii?Q?cDHeBmY8wKzji7V1gL53qjyXbl/MuZdzH0YS7M+SFSxb4ydpbh3ShOJRPdmf?=
 =?us-ascii?Q?PE3ES3/uG15T50qGXJYpZ1EnqPmvD1lLklQrPqPcV/GtS/C5xPi6TBOXc9vr?=
 =?us-ascii?Q?1DNjj2gy5887hCUvHghtwAAFsiBDzyZeXhFtpLvdO9JtYIGk/NKQRfUJK9Uv?=
 =?us-ascii?Q?ETnV0DDBOFOcBJYqz1klR5q5lNHRCHhJIKM++tN8zXTS9LpjXgpGBaBfzBXf?=
 =?us-ascii?Q?i4oeQwI2AV9Jjtqm5+H6GqSu8ueRyzoYq2ueXiB8pHSWNpnMl7h9Ej/0HmQO?=
 =?us-ascii?Q?9AKCfTi71ml5MBDD0wt1vWPLkKtJOPo+QMhmev5TcMCDyZlmD49SoZyjk2zR?=
 =?us-ascii?Q?C32swMekqyfNvDneuxc+vuOJ46QxavG365MGYmLP/qr7DfkaguJ+ata2D2go?=
 =?us-ascii?Q?toDTe/q5gbDjgxiT6TjvjRc8vIPMZyfZJKmv0E1K+TFT/I+cvInsnqTxSpkL?=
 =?us-ascii?Q?dn+yrnnaRY5INLVZGcntO6l4LUB57HDo+m5CxrG4dA/H6Eg1W3lisuPr3Vh2?=
 =?us-ascii?Q?k3mvR7x7YQDsm3mGA6BGIaqpFZl3uHfXFxBsOue53KZvmb9btrejRP29R+X8?=
 =?us-ascii?Q?v9VRdwaPaGobeVieFqkFOCX/V5nUnBuR9WR5yFMdEbAZx5cOB0xM0CdXGNWe?=
 =?us-ascii?Q?3OGYfoQiTbpqNI311hPf3HLGpcFnf9GQnW0F6gXkPUnkLacr8JY4scvr0llr?=
 =?us-ascii?Q?qmz1Qg2vWlYIOiCrCJY1yuFSUNooiG1bygARHMbcE+owgoccKySlItVVbY0b?=
 =?us-ascii?Q?kRyHGcPwDHnFXlfRRNar5f0jQg4Perv6pvSZlXxAQ+Dld7wWDdvOUf9IVs/R?=
 =?us-ascii?Q?PlDW6Hvve+KixYK6PAnn3njhbbZLgU4KtWJE5yyHHcs7mOZg7idnOi1vUoRu?=
 =?us-ascii?Q?tBmqDOm8f4rz9EQrqQadbKMGEOPv5Wa3EZX8Lnbbq+3yb2AJC23dOn1Vv0fx?=
 =?us-ascii?Q?DpHwLi1qy0NHt1kb3HIhJg2r9Wkccr2TPr4P0kGnf3IhTK0XNPACgW+BJLB5?=
 =?us-ascii?Q?rYcap1KvpqurGJ42P6TP6CertSFeW6WUHQCWyLkCXhfI9sgx7TygTmQ3rP9U?=
 =?us-ascii?Q?7CXPT6Ep6kIjX6Xpe5y3wHN/gWiRzxY6tGzh2Fbmubh5lm3ANr2EKV9koAG4?=
 =?us-ascii?Q?CbSSKBAll1DkGuojrQgF8gZH3+t72TYE6dYqr2DxBWFpVR8DrL0ut528Qpfh?=
 =?us-ascii?Q?FRR2jvTk/AxrqUMXGLbWTIN4EY+sOY3faWRt52nAtbWOgyjhe+5U4XFoFo2F?=
 =?us-ascii?Q?c79G/Y7tdxsIzHg9eVGxueNagKb+zB6ipWdqAzTB9ru6gcJsbzn4N9DMO0br?=
 =?us-ascii?Q?fFhlsvRKxfbfKSxfPRAxtDRYT6Mlrlj8Ng2K/pmExQ9mXXr7kSwhG8WmskXr?=
 =?us-ascii?Q?W8+9kuTUxSl9CXNk9U3bg4vpHkZ0uJjh4Wkpi3skeFwwe8bD3eipdvFUKiYx?=
 =?us-ascii?Q?prtprLamWiTzN/6aqAC911m0GothH82td54HQh6WqBb271/UI39SpXZmE2Oq?=
 =?us-ascii?Q?5nQ/v9aHX8ZQ+FHQGT1PFr3adKmJeKEAZgWC66NW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bf745a-0a49-492e-2adf-08ddde866bad
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 18:38:27.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMucbnL+WZz/O8pBZLQRxKCOJlYvFZgeMwt9pUC4N93g57dJkdieIFECNJ5jffZRATVl2anAdQ092fU80lQr4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11317

Convert lpc32xx-key.txt to yaml format.

Additional changes:
- set maximum of key-row(column) to 4.
- add ref to matrix-keymap.yaml.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add ref to matrix-keymap.yaml.
- remove properties, which already defined in matrix-keymap.yaml.
- Add Vladimir Zapolskiy review tag
---
 .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
 .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
 create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml

diff --git a/Documentation/devicetree/bindings/input/lpc32xx-key.txt b/Documentation/devicetree/bindings/input/lpc32xx-key.txt
deleted file mode 100644
index 2b075a080d303..0000000000000
--- a/Documentation/devicetree/bindings/input/lpc32xx-key.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-NXP LPC32xx Key Scan Interface
-
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-Required Properties:
-- compatible: Should be "nxp,lpc3220-key"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The interrupt number to the cpu.
-- clocks: phandle to clock controller plus clock-specifier pair
-- nxp,debounce-delay-ms: Debounce delay in ms
-- nxp,scan-delay-ms: Repeated scan period in ms
-- linux,keymap: the key-code to be reported when the key is pressed
-  and released, see also
-  Documentation/devicetree/bindings/input/matrix-keymap.txt
-
-Note: keypad,num-rows and keypad,num-columns are required, and must be equal
-since LPC32xx only supports square matrices
-
-Example:
-
-	key@40050000 {
-		compatible = "nxp,lpc3220-key";
-		reg = <0x40050000 0x1000>;
-		clocks = <&clk LPC32XX_CLK_KEY>;
-		interrupt-parent = <&sic1>;
-		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <1>;
-		nxp,debounce-delay-ms = <3>;
-		nxp,scan-delay-ms = <34>;
-		linux,keymap = <0x00000002>;
-	};
diff --git a/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
new file mode 100644
index 0000000000000..9e0d977bdf5cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nxp,lpc3220-key.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx Key Scan Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-key
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nxp,debounce-delay-ms:
+    description: Debounce delay in ms
+
+  nxp,scan-delay-ms:
+    description: Repeated scan period in ms
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - nxp,debounce-delay-ms
+  - nxp,scan-delay-ms
+  - linux,keymap
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    key@40050000 {
+        compatible = "nxp,lpc3220-key";
+        reg = <0x40050000 0x1000>;
+        clocks = <&clk LPC32XX_CLK_KEY>;
+        interrupt-parent = <&sic1>;
+        interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+        keypad,num-rows = <1>;
+        keypad,num-columns = <1>;
+        nxp,debounce-delay-ms = <3>;
+        nxp,scan-delay-ms = <34>;
+        linux,keymap = <0x00000002>;
+    };
-- 
2.34.1


