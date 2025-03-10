Return-Path: <linux-input+bounces-10693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA09A5AA38
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 00:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 714E617192C
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 23:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125DC1E834E;
	Mon, 10 Mar 2025 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="jRmeLJvw"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2106.outbound.protection.outlook.com [40.107.223.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3784A02;
	Mon, 10 Mar 2025 22:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741647598; cv=fail; b=ZZjGDWbXhRxYhdx8Ehhx8Vltvu7nnbwhm9GO23+k3qRtFs8BHKkDLeDfTG15iNgRAFCiH/TDMFl7+/tVfPZSoBkg6SLY/msN5CbBOAIiTx8VNbnV6j0LdDtCjcshNpe0I6ZIiWbL9viKN2ODzF0ZORxbXRWOXW8mfY4Uu46rTes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741647598; c=relaxed/simple;
	bh=ODmoL8QpMRtFM6pfYgP7g1CLZqjos2VhFF5I8lX1mY4=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:References:MIME-Version; b=VZCnV6ZXXVAiKu2UloWrBpBDjlFgCAB7naZdABTPGSxrphqSpDl9CwBLSo4mp3+YVawiRAcuW1J4kOtuzIvsz1KS51Y7mBW3PZtYL6c3Y8EGttDW0IdkBhOmSYbQ+HcIioP6gwOnF9k6obCR0w9f2gN1S8JbH6W7agNZst7f6zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=jRmeLJvw; arc=fail smtp.client-ip=40.107.223.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1DnUlcuY9d8PfCp6wwgBqXyfpZAuxwyp0rKHYRGPj2te73Yh6vf0tg5OlYQuYqFuSPV7JsSVCr3k6FDRfgIB8fyhLdcM85wGkAzrUnsRCHZ7rKkRvsHHz8K65Qum1qlzIwo+Mn/Rw52bkJEA8OhqDo1C5iYFsuvHpc93+73gtLYagLoEzXy/k8kD5IOiJIH+bF1uqUHQZr548zUBBZ4M5cU0+WSdAOX2BCkjpRF0+DoSbvIW3zgOc1caufHcR8uCQjr88BHlqxbnYQmWCKIV2/r/8+yF2aLOX+M+ciEpTHY+C447gn2EL5COZnYjaZD/O19fRPxMEIbD00+RJEsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnvGi5RopCNtC6GalGMprqIegr4JNPXQtB7Pd5EdzKY=;
 b=dYE7NLuKcasd2bMnkmewFgrUSYL+P6R2asZjUf9Ky0YXSFGLeTGyrHgihLnBU02COX7iv6lkRdx5c+AQqDQH6Gmt1//wVFPy35i/ffJg+GrM4529Q6vMdDnQ73n8BWW/oO7+ZSPkakDqBLKsKY8k1ll8Kpc1BvwdYzCCmtKwymjC2iHmVYJwWYthZhWKcCTvTox2MycNZgfEyWG9GwTYRDwWMPsoe5/4gus5jhiwnXLYIC7b0AcW0SdE54uOAZfW6Zk1pw1kkjx5fC9LF8NoqxE0y1efogcGvO13igmhlUbP+DwzU3z+ylzgdXfeg4XAMQkwy+gYfVA3DdGt5hamCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnvGi5RopCNtC6GalGMprqIegr4JNPXQtB7Pd5EdzKY=;
 b=jRmeLJvwyt/Hr/XbGfU0klVFQl40TftCIediQik3dutU6yO9uSeeilM1h4Mj/6Htm38pYp8eVw6btkOo7a5WcAWLnRc/0EdXGbsea2LN+oFrII4qem/nvJ1d+PUNOkS1ryykhDe/C78x8AmTax61ql9JvSVwkqo10hTuo+bH7n4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SA3PR08MB8826.namprd08.prod.outlook.com (2603:10b6:806:397::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 22:59:52 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 22:59:52 +0000
Date: Mon, 10 Mar 2025 17:59:49 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	jeff@labundy.com
Subject: [PATCH 2/2] dt-bindings: input: Remove bindings for Azoteq IQS269A
 and IQS626A
Message-ID: <Z89u5UBMDXtMw/Hq@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z89ugIeYkJ7rAzJP@nixie71>
References: <Z89ugIeYkJ7rAzJP@nixie71>
X-ClientProxiedBy: CYZPR14CA0044.namprd14.prod.outlook.com
 (2603:10b6:930:a0::28) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SA3PR08MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 20add3cb-5474-4d2b-90d7-08dd60274417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JGmrJ9DA/FHUGyBJ2wfVGI1r2oyF1sdF9JRK4ajg+ndqgdaUlC/TT94kOY68?=
 =?us-ascii?Q?udc6nVysgXzXRwZit/dDVDxxzzqvDFDRCEwI0oFnB8TQ2A4ZTVcha+TDGa6x?=
 =?us-ascii?Q?rxvOMjJJ7PMeHa2F81uMIz/qevaVknpgGWXNtBCG6AgytywfEZxZzIq9fOXr?=
 =?us-ascii?Q?9/+17k0ToR//ugfjUj8uDJnkyeVjO6FBuLwmn1mIbKNcaLCYxi2h4fQr/w65?=
 =?us-ascii?Q?s1Rp1u749qHIoVW0GJBqcftCVM1m979Bb4gux/w9dTNDMeY92NXs2VfdCLjJ?=
 =?us-ascii?Q?hHbHOQmbnjL1O+1I/1UBKKXBifMJl5cnJEjrBHZEzdo2lHZgvJo6y4OuBIAr?=
 =?us-ascii?Q?+7Z7nWUC/x4RWmqr6aTpawgDujW6W67lcbC8LivRLzbzU8k8e7JEcXZ+b26v?=
 =?us-ascii?Q?Zj3WeFTnwZ5sbRw/G9Z0vrZxHxcfWgpwSRBjnQITb8avYUWAmJ2deQCC3RLM?=
 =?us-ascii?Q?p2oZw241nNu5rjPx4gM+gQ3oHagoYwnzztAgc6+E/9SX/st1c8CuRLudouas?=
 =?us-ascii?Q?26vFAc8VDgVKbE83pgmimpma6ftu4SJIG7K9M70w360sFd/76unNUB0czOta?=
 =?us-ascii?Q?2EbMHtlkjiO0oE5pul0UywSNWEmKJTstIWjBde3E3+WkyOGvKCdq3TKFHFUV?=
 =?us-ascii?Q?dYH+po0C+uybTMRMSNozZHUODJBmASZNqZV7VGIdIo0Gr0BgzRgGdNbrbT73?=
 =?us-ascii?Q?Gnl5e8+XIErZN8Fu29QogrQy5JZ/wAqVUAg0D9S7L21yaIv1s+rIGCmyNepA?=
 =?us-ascii?Q?GOISvx7yAs+ybN0HllNQBP0NwQYhjEQkdPUcw+ISk5CJOn6wT6k8dcW5wNxZ?=
 =?us-ascii?Q?QfU2b7tKnwgCRxCrAAlp7Tc2I2pg6LeBS+pb9CzMkrBWq9PbAPwik+21Yx+3?=
 =?us-ascii?Q?/EWIrpikBu6DKPvSz4tbq9QIiU3GafQMoHq1IFK+7QzU7/cNgATITxVyQiY7?=
 =?us-ascii?Q?RvaxF/hQb9tLLWJiFxSQNISJExPKIB0qITRlpyaHk2ScX7Psqn6W5T2VMu4W?=
 =?us-ascii?Q?3MNRg9ijJC+kvrngEB0wsJtkKIgStvUAP1IPM9+DTgt+CBAKYnhthCziGQqX?=
 =?us-ascii?Q?U5GSrpA+tD6b8Djz1Q6NTGsfCEr4W00v9ZQMpoMYBOFwB6NB4yTl/haLCPZ1?=
 =?us-ascii?Q?tYVCfMyVEnzD9xm+DKjNn/K5R4DDH+hme3VSSWaZCK82NRjZnnIHffdYcr5u?=
 =?us-ascii?Q?zy2RFaj3l7h77SchdUVLZGCOLe25y37iBvxutA2b+hMccuG3pcehXhxc7Ifh?=
 =?us-ascii?Q?e4q7KQBqnFjBLFjcUTwVWS+uIm/mgTWQrkjj0tzuN52QdOD7Wg3+d1w0tS56?=
 =?us-ascii?Q?uehwXkWmVs4xwVWetrWrfiqCsOsjM5xk9GEqQ9UBLyOBbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mn4aLjdLz6k9thvPm3fZXgeYhqxS5/2v6KS0GQ3HL0FtggFg9xJdoSmkKSHA?=
 =?us-ascii?Q?1FeWh+z8uoliuNVlMOvidcucdBlJ3fP9wtZP6eO70oIr/wI1t8gfVuBs74Gm?=
 =?us-ascii?Q?NttGqhJyJ+SSEAW5yaJHUD23bE8MQ8mt/hIVJyyjYCfE8v5EqmEdc0UXRUXG?=
 =?us-ascii?Q?8n5zuapgoE/WYPO5j+DenNkl4oqAfta5kaaUT7aMLzUuU6RDC85XU2aKRzlO?=
 =?us-ascii?Q?vZJOH/CL4s2M3eiY2VED79f5uNRA+INf0YDo0LNoJvQTaiQfN2KIlYwPzo0Z?=
 =?us-ascii?Q?ozs5qKHJ8sk9DwOGMIvxTqRY8AUm4yqxTYEqUsoujsMzBCqtiAjMVEWUNAR2?=
 =?us-ascii?Q?3mrVi5BIawDtYFx2D1dwTHXEunPVYJHghhgMRaHlVDuiZiT0O4/cLiLz5PQZ?=
 =?us-ascii?Q?7GUSLiTk8//Ia0Jz9c4uak+eEgH8DnVeIC1LFMgYwNFYdOyg06jKL1rzLJ5x?=
 =?us-ascii?Q?5HYIfWKgqYnv7IKt0iofAEPxMJgIBz+0ixRu++GI+cpH7kxf/qhMx10SIfMh?=
 =?us-ascii?Q?KvldU3gpF8EgEfHSX+95TEBtcmW3Uti2BRJAbnnrR6ADn8UvNyc/NIAz5YZK?=
 =?us-ascii?Q?B+XIMCwThD0d6uA91MERZCR3yyC4J3NdeLS0pCDRKln+0jHAMnXBwoeFuXtr?=
 =?us-ascii?Q?84qRPpthfVEQn6FvtuwR1XIiLk0vLsLhxPDlfy64z9y3z0jlyCWZypniIJA0?=
 =?us-ascii?Q?frpfPRpSvAKnc/Yy1atFSWCkc2MgLH23bcYdtdXaqf2rFB4bdMHenytPMTCF?=
 =?us-ascii?Q?xdsvgSyflptq7eJwrjjPgoZza5HhERjECfVE/I7vqX2sOygQq3VKm7z7HHfs?=
 =?us-ascii?Q?xVD1chI4f59YOZsu7XsSB+cUzibXG2uV3KhIqGKEVeFGB/qf9X+6Q+GBRyYM?=
 =?us-ascii?Q?wtek4yVsbJczqnal32wZivFU+ObGyic62fmtmo6cb2AfuJepgukdW81FlHVk?=
 =?us-ascii?Q?YX0PhRJAeV7cpIVCthXkq2RcKsEfXQXIvnMDbU1ZxMZwIcMqPHExK8Bsp2so?=
 =?us-ascii?Q?PGOMwnfNSSQIgvvtBDquDBRCyHo0baouF1hH37t2gSBGJMxkOflfTn6Z5VeL?=
 =?us-ascii?Q?iFuzlHOBnJw1be1HdzPTXPRZ4XKvPZxCt5gUiidjFFCjyaETzta2yJ1fEnTj?=
 =?us-ascii?Q?C4+yRuCIqat6EMhzkvHDTG2D3JMWPaHfX448kkdXK4NO3qlzHAzYxpR5HWWY?=
 =?us-ascii?Q?RdZcPS3D//Tz3kY3fD/EfoxWuLAMg12/FbTwC8PdTzOspfXhf4ZfW84rvDp4?=
 =?us-ascii?Q?vuf/CZN65KZnnrvSJEjPYcjnjTee1dIoLHv9qZ4xHY0UFOVz+JlkLLCHDe/j?=
 =?us-ascii?Q?nwXacGnkVC+JZpjIqtcvR3dRxfWQP5NkQSNyI73trSzwbaqUl1p8QlXiK/ls?=
 =?us-ascii?Q?zDVkKz1TvjwPnCm7vVg6PX81H2A0nHUAQC/wK7VZfKkU2e3SmqsuIN8oBqv4?=
 =?us-ascii?Q?iFzkzQV9owP+j6vt9ljR+pFZupmLOyyx6Yh+ebKx09EObch+W5QZGUjNdPWQ?=
 =?us-ascii?Q?tlKDDG0kAOr76l7Q0o83NDjycDL979jzgs0Qei2ogwCpf2VrdZAC4lzjvd8H?=
 =?us-ascii?Q?VdwGSaBkKemPOCNLC2AzBn/KZv9M8HGQ8skhF+Sc?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20add3cb-5474-4d2b-90d7-08dd60274417
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 22:59:52.2077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8l/8RUwGlydNNcDNuex8uCSF/XJiptfiK4H5p1NaniHDya2zLGZrBPI2srwJnYCWzyu3V5C8OneKywNqEsOyew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR08MB8826

The vendor no longer recommends IQS269A for new designs, and no
longer manufacturers the highly similar IQS626A. No new product
development will use either device.

Remove both bindings to prune unused documentation and avoid the
need for any further maintenance.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 .../devicetree/bindings/input/iqs269a.yaml    | 648 -------------
 .../devicetree/bindings/input/iqs626a.yaml    | 878 ------------------
 2 files changed, 1526 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml

diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
deleted file mode 100644
index 2c3f693b8982..000000000000
--- a/Documentation/devicetree/bindings/input/iqs269a.yaml
+++ /dev/null
@@ -1,648 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/iqs269a.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Azoteq IQS269A Capacitive Touch Controller
-
-maintainers:
-  - Jeff LaBundy <jeff@labundy.com>
-
-allOf:
-  - $ref: input.yaml#
-
-description: |
-  The Azoteq IQS269A is an 8-channel capacitive touch controller that features
-  additional Hall-effect and inductive sensing capabilities.
-
-  Link to datasheet: https://www.azoteq.com/
-
-properties:
-  compatible:
-    enum:
-      - azoteq,iqs269a
-      - azoteq,iqs269a-00
-      - azoteq,iqs269a-d0
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
-  azoteq,hall-enable:
-    type: boolean
-    description:
-      Enables Hall-effect sensing on channels 6 and 7. In this case, keycodes
-      assigned to channel 6 are ignored and keycodes assigned to channel 7 are
-      interpreted as switch codes. Refer to the datasheet for requirements im-
-      posed on channels 6 and 7 by Hall-effect sensing.
-
-  azoteq,suspend-mode:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description: |
-      Specifies the power mode during suspend as follows:
-      0: Automatic (same as normal runtime, i.e. suspend/resume disabled)
-      1: Low power (all sensing at a reduced reporting rate)
-      2: Ultra-low power (channel 0 proximity sensing)
-      3: Halt (no sensing)
-
-  azoteq,clk-div:
-    type: boolean
-    description: Divides the device's core clock by a factor of 4.
-
-  azoteq,ulp-update:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 7
-    default: 3
-    description: Specifies the ultra-low-power mode update rate.
-
-  azoteq,reseed-offset:
-    type: boolean
-    description:
-      Applies an 8-count offset to all long-term averages upon either ATI or
-      reseed events.
-
-  azoteq,filt-str-lp-lta:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description:
-      Specifies the long-term average filter strength during low-power mode.
-
-  azoteq,filt-str-lp-cnt:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description:
-      Specifies the raw count filter strength during low-power mode.
-
-  azoteq,filt-str-np-lta:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description:
-      Specifies the long-term average filter strength during normal-power mode.
-
-  azoteq,filt-str-np-cnt:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description:
-      Specifies the raw count filter strength during normal-power mode.
-
-  azoteq,rate-np-ms:
-    minimum: 0
-    maximum: 255
-    default: 16
-    description: Specifies the report rate (in ms) during normal-power mode.
-
-  azoteq,rate-lp-ms:
-    minimum: 0
-    maximum: 255
-    default: 160
-    description: Specifies the report rate (in ms) during low-power mode.
-
-  azoteq,rate-ulp-ms:
-    multipleOf: 16
-    minimum: 0
-    maximum: 4080
-    default: 160
-    description: Specifies the report rate (in ms) during ultra-low-power mode.
-
-  azoteq,timeout-pwr-ms:
-    multipleOf: 512
-    minimum: 0
-    maximum: 130560
-    default: 2560
-    description:
-      Specifies the length of time (in ms) to wait for an event during normal-
-      power mode before transitioning to low-power mode.
-
-  azoteq,timeout-lta-ms:
-    multipleOf: 512
-    minimum: 0
-    maximum: 130560
-    default: 32768
-    description:
-      Specifies the length of time (in ms) to wait before resetting the long-
-      term average of all channels. Specify the maximum timeout to disable it
-      altogether.
-
-  azoteq,ati-band-disable:
-    type: boolean
-    description: Disables the ATI band check.
-
-  azoteq,ati-lp-only:
-    type: boolean
-    description: Limits automatic ATI to low-power mode.
-
-  azoteq,ati-band-tighten:
-    type: boolean
-    description: Tightens the ATI band from 1/8 to 1/16 of the desired target.
-
-  azoteq,filt-disable:
-    type: boolean
-    description: Disables all raw count filtering.
-
-  azoteq,gpio3-select:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 7
-    default: 0
-    description:
-      Selects the channel for which the GPIO3 pin represents touch state.
-
-  azoteq,dual-direction:
-    type: boolean
-    description:
-      Specifies that long-term averages are to freeze in the presence of either
-      increasing or decreasing counts, thereby permitting events to be reported
-      in either direction.
-
-  azoteq,tx-freq:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description: |
-      Specifies the inductive sensing excitation frequency as follows (paren-
-      thesized numbers represent the frequency if 'azoteq,clk-div' is present):
-      0: 16 MHz (4 MHz)
-      1: 8 MHz (2 MHz)
-      2: 4 MHz (1 MHz)
-      3: 2 MHz (500 kHz)
-
-  azoteq,global-cap-increase:
-    type: boolean
-    description: Increases the global capacitance adder from 0.5 pF to 1.5 pF.
-
-  azoteq,reseed-select:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description: |
-      Specifies the event(s) that prompt the device to reseed (i.e. reset the
-      long-term average) of an associated channel as follows:
-      0: None
-      1: Proximity
-      2: Proximity or touch
-      3: Proximity, touch or deep touch
-
-  azoteq,tracking-enable:
-    type: boolean
-    description:
-      Enables all associated channels to track their respective reference
-      channels.
-
-  azoteq,filt-str-slider:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 1
-    description: Specifies the slider coordinate filter strength.
-
-  azoteq,touch-hold-ms:
-    multipleOf: 256
-    minimum: 256
-    maximum: 65280
-    default: 5120
-    description:
-      Specifies the length of time (in ms) for which the channel selected by
-      'azoteq,gpio3-select' must be held in a state of touch in order for an
-      approximately 60-ms pulse to be asserted on the GPIO4 pin.
-
-  linux,keycodes:
-    minItems: 1
-    maxItems: 8
-    description: |
-      Specifies the numeric keycodes associated with each available gesture in
-      the following order (enter 0 for unused gestures):
-      0: Slider 0 tap
-      1: Slider 0 hold
-      2: Slider 0 positive flick or swipe
-      3: Slider 0 negative flick or swipe
-      4: Slider 1 tap
-      5: Slider 1 hold
-      6: Slider 1 positive flick or swipe
-      7: Slider 1 negative flick or swipe
-
-  azoteq,gesture-swipe:
-    type: boolean
-    description:
-      Directs the device to interpret axial gestures as a swipe (finger remains
-      on slider) instead of a flick (finger leaves slider).
-
-  azoteq,timeout-tap-ms:
-    multipleOf: 16
-    minimum: 0
-    maximum: 4080
-    default: 400
-    description:
-      Specifies the length of time (in ms) within which a slider touch must be
-      released in order to be interpreted as a tap. Default and maximum values
-      as well as step size are reduced by a factor of 4 with device version 2.
-
-  azoteq,timeout-swipe-ms:
-    multipleOf: 16
-    minimum: 0
-    maximum: 4080
-    default: 2000
-    description:
-      Specifies the length of time (in ms) within which an axial gesture must be
-      completed in order to be interpreted as a flick or swipe. Default and max-
-      imum values as well as step size are reduced by a factor of 4 with device
-      version 2.
-
-  azoteq,thresh-swipe:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    minimum: 0
-    maximum: 255
-    default: 128
-    description:
-      Specifies the number of points across which an axial gesture must travel
-      in order to be interpreted as a flick or swipe.
-
-dependencies:
-  azoteq,gesture-swipe: ["linux,keycodes"]
-  azoteq,timeout-tap-ms: ["linux,keycodes"]
-  azoteq,timeout-swipe-ms: ["linux,keycodes"]
-  azoteq,thresh-swipe: ["linux,keycodes"]
-
-patternProperties:
-  "^channel@[0-7]$":
-    type: object
-    description:
-      Represents a single sensing channel. A channel is active if defined and
-      inactive otherwise.
-
-    properties:
-      reg:
-        minimum: 0
-        maximum: 7
-        description: Index of the channel.
-
-      azoteq,reseed-disable:
-        type: boolean
-        description:
-          Prevents the channel from being reseeded if the long-term average
-          timeout (defined in 'azoteq,timeout-lta') expires.
-
-      azoteq,blocking-enable:
-        type: boolean
-        description: Specifies that the channel is a blocking channel.
-
-      azoteq,slider0-select:
-        type: boolean
-        description: Specifies that the channel participates in slider 0.
-
-      azoteq,slider1-select:
-        type: boolean
-        description: Specifies that the channel participates in slider 1.
-
-      azoteq,rx-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 1
-        maxItems: 8
-        items:
-          minimum: 0
-          maximum: 7
-        description:
-          Specifies the CRX pin(s) associated with the channel. By default, only
-          the CRX pin corresponding to the channel's index is enabled (e.g. CRX0
-          for channel 0).
-
-      azoteq,tx-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 1
-        maxItems: 8
-        items:
-          minimum: 0
-          maximum: 7
-        default: [0, 1, 2, 3, 4, 5, 6, 7]
-        description: Specifies the TX pin(s) associated with the channel.
-
-      azoteq,meas-cap-decrease:
-        type: boolean
-        description:
-          Decreases the internal measurement capacitance from 60 pF to 15 pF.
-
-      azoteq,rx-float-inactive:
-        type: boolean
-        description: Floats any inactive CRX pins instead of grounding them.
-
-      azoteq,local-cap-size:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2]
-        default: 0
-        description: |
-          Specifies the capacitance to be added to the channel as follows:
-          0: None
-          1: Global adder (based on 'azoteq,global-cap-increase')
-          2: Global adder + 0.5 pF
-
-      azoteq,invert-enable:
-        type: boolean
-        description:
-          Inverts the polarity of the states reported for proximity, touch and
-          deep-touch events relative to their respective thresholds.
-
-      azoteq,proj-bias:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 2
-        description: |
-          Specifies the bias current applied during projected-capacitance
-          sensing as follows:
-          0: 2.5 uA
-          1: 5 uA
-          2: 10 uA
-          3: 20 uA
-
-      azoteq,sense-mode:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 9, 14, 15]
-        default: 0
-        description: |
-          Specifies the channel's sensing mode as follows:
-          0:  Self capacitance
-          1:  Projected capacitance
-          9:  Self or mutual inductance
-          14: Hall effect
-          15: Temperature
-
-      azoteq,sense-freq:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 1
-        description: |
-          Specifies the channel's sensing frequency as follows (parenthesized
-          numbers represent the frequency if 'azoteq,clk-div' is present):
-          0: 4 MHz (1 MHz)
-          1: 2 MHz (500 kHz)
-          2: 1 MHz (250 kHz)
-          3: 500 kHz (125 kHz)
-
-      azoteq,static-enable:
-        type: boolean
-        description: Enables the static front-end for the channel.
-
-      azoteq,ati-mode:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 3
-        description: |
-          Specifies the channel's ATI mode as follows:
-          0: Disabled
-          1: Semi-partial
-          2: Partial
-          3: Full
-
-      azoteq,ati-base:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [75, 100, 150, 200]
-        default: 100
-        description: Specifies the channel's ATI base.
-
-      azoteq,ati-target:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        multipleOf: 32
-        minimum: 0
-        maximum: 2016
-        default: 512
-        description: Specifies the channel's ATI target.
-
-      azoteq,assoc-select:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 1
-        maxItems: 8
-        items:
-          minimum: 0
-          maximum: 7
-        description:
-          Specifies the associated channels for which the channel serves as a
-          reference channel. By default, no channels are selected.
-
-      azoteq,assoc-weight:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 255
-        default: 0
-        description:
-          Specifies the channel's impact weight if it acts as an associated
-          channel (0 = 0% impact, 255 = 200% impact).
-
-    patternProperties:
-      "^event-prox(-alt)?$":
-        type: object
-        $ref: input.yaml#
-        description:
-          Represents a proximity event reported by the channel in response to
-          a decrease in counts. Node names suffixed with '-alt' instead corre-
-          spond to an increase in counts.
-
-          By default, the long-term average tracks an increase in counts such
-          that only events corresponding to a decrease in counts are reported
-          (refer to the datasheet for more information).
-
-          Specify 'azoteq,dual-direction' to freeze the long-term average when
-          the counts increase or decrease such that events of either direction
-          can be reported. Alternatively, specify 'azoteq,invert-enable' to in-
-          vert the polarity of the states reported by the channel.
-
-          Complementary events (e.g. event-touch and event-touch-alt) can both
-          be present and specify different key or switch codes, but not differ-
-          ent thresholds or hysteresis (if applicable).
-
-        properties:
-          azoteq,thresh:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 255
-            default: 10
-            description: Specifies the threshold for the event.
-
-          linux,code: true
-
-        additionalProperties: false
-
-      "^event-touch(-alt)?$":
-        type: object
-        $ref: input.yaml#
-        description: Represents a touch event reported by the channel.
-
-        properties:
-          azoteq,thresh:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 255
-            default: 8
-            description: Specifies the threshold for the event.
-
-          azoteq,hyst:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 15
-            default: 4
-            description: Specifies the hysteresis for the event.
-
-          linux,code: true
-
-        additionalProperties: false
-
-      "^event-deep(-alt)?$":
-        type: object
-        $ref: input.yaml#
-        description: Represents a deep-touch event reported by the channel.
-
-        properties:
-          azoteq,thresh:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 255
-            default: 26
-            description: Specifies the threshold for the event.
-
-          azoteq,hyst:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 15
-            default: 0
-            description: Specifies the hysteresis for the event.
-
-          linux,code: true
-
-        additionalProperties: false
-
-    required:
-      - reg
-
-    additionalProperties: false
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - azoteq,iqs269a-d0
-then:
-  patternProperties:
-    "^channel@[0-7]$":
-      properties:
-        azoteq,slider1-select: false
-else:
-  properties:
-    azoteq,touch-hold-ms: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - "#address-cells"
-  - "#size-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/input/input.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-
-    i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            touch@44 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-
-                    compatible = "azoteq,iqs269a";
-                    reg = <0x44>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-
-                    azoteq,hall-enable;
-                    azoteq,suspend-mode = <2>;
-
-                    linux,keycodes = <KEY_PLAYPAUSE>,
-                                     <KEY_STOPCD>,
-                                     <KEY_NEXTSONG>,
-                                     <KEY_PREVIOUSSONG>;
-
-                    azoteq,timeout-tap-ms = <400>;
-                    azoteq,timeout-swipe-ms = <800>;
-
-                    channel@0 {
-                            reg = <0x0>;
-
-                            event-prox {
-                                    linux,code = <KEY_POWER>;
-                            };
-                    };
-
-                    channel@1 {
-                            reg = <0x1>;
-                            azoteq,slider0-select;
-                    };
-
-                    channel@2 {
-                            reg = <0x2>;
-                            azoteq,slider0-select;
-                    };
-
-                    channel@3 {
-                            reg = <0x3>;
-                            azoteq,slider0-select;
-                    };
-
-                    channel@4 {
-                            reg = <0x4>;
-                            azoteq,slider0-select;
-                    };
-
-                    channel@5 {
-                            reg = <0x5>;
-                            azoteq,slider0-select;
-                    };
-
-                    channel@6 {
-                            reg = <0x6>;
-                            azoteq,invert-enable;
-                            azoteq,static-enable;
-                            azoteq,reseed-disable;
-                            azoteq,rx-enable = <0>;
-                            azoteq,sense-freq = <0x0>;
-                            azoteq,sense-mode = <0xE>;
-                            azoteq,ati-mode = <0x0>;
-                            azoteq,ati-base = <200>;
-                            azoteq,ati-target = <320>;
-                    };
-
-                    channel@7 {
-                            reg = <0x7>;
-                            azoteq,invert-enable;
-                            azoteq,static-enable;
-                            azoteq,reseed-disable;
-                            azoteq,rx-enable = <0>, <6>;
-                            azoteq,sense-freq = <0x0>;
-                            azoteq,sense-mode = <0xE>;
-                            azoteq,ati-mode = <0x3>;
-                            azoteq,ati-base = <200>;
-                            azoteq,ati-target = <320>;
-
-                            event-touch {
-                                    linux,code = <SW_LID>;
-                            };
-                    };
-            };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/input/iqs626a.yaml b/Documentation/devicetree/bindings/input/iqs626a.yaml
deleted file mode 100644
index e424d67b0542..000000000000
--- a/Documentation/devicetree/bindings/input/iqs626a.yaml
+++ /dev/null
@@ -1,878 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/iqs626a.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Azoteq IQS626A Capacitive Touch Controller
-
-maintainers:
-  - Jeff LaBundy <jeff@labundy.com>
-
-description: |
-  The Azoteq IQS626A is a 14-channel capacitive touch controller that features
-  additional Hall-effect and inductive sensing capabilities.
-
-  Link to datasheet: https://www.azoteq.com/
-
-allOf:
-  - $ref: touchscreen/touchscreen.yaml#
-
-properties:
-  compatible:
-    const: azoteq,iqs626a
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
-  azoteq,suspend-mode:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description: |
-      Specifies the power mode during suspend as follows:
-      0: Automatic (same as normal runtime, i.e. suspend/resume disabled)
-      1: Low power (all sensing at a reduced reporting rate)
-      2: Ultra-low power (ULP channel proximity sensing)
-      3: Halt (no sensing)
-
-  azoteq,clk-div:
-    type: boolean
-    description: Divides the device's core clock by a factor of 4.
-
-  azoteq,ulp-enable:
-    type: boolean
-    description:
-      Permits the device to automatically enter ultra-low-power mode from low-
-      power mode.
-
-  azoteq,ulp-update:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3, 4, 5, 6, 7]
-    default: 3
-    description: |
-      Specifies the rate at which the trackpad, generic and Hall channels are
-      updated during ultra-low-power mode as follows:
-      0: 8
-      1: 13
-      2: 28
-      3: 54
-      4: 89
-      5: 135
-      6: 190
-      7: 256
-
-  azoteq,ati-band-disable:
-    type: boolean
-    description: Disables the ATI band check.
-
-  azoteq,ati-lp-only:
-    type: boolean
-    description: Limits automatic ATI to low-power mode.
-
-  azoteq,gpio3-select:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3, 4, 5, 6, 7]
-    default: 1
-    description: |
-      Selects the channel or group of channels for which the GPIO3 pin
-      represents touch state as follows:
-      0: None
-      1: ULP channel
-      2: Trackpad
-      3: Trackpad
-      4: Generic channel 0
-      5: Generic channel 1
-      6: Generic channel 2
-      7: Hall channel
-
-  azoteq,reseed-select:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [0, 1, 2, 3]
-    default: 0
-    description: |
-      Specifies the event(s) that prompt the device to reseed (i.e. reset the
-      long-term average) of an associated channel as follows:
-      0: None
-      1: Proximity
-      2: Proximity or touch
-      3: Proximity, touch or deep touch
-
-  azoteq,thresh-extend:
-    type: boolean
-    description: Multiplies all touch and deep-touch thresholds by 4.
-
-  azoteq,tracking-enable:
-    type: boolean
-    description:
-      Enables all associated channels to track their respective reference
-      channels.
-
-  azoteq,reseed-offset:
-    type: boolean
-    description:
-      Applies an 8-count offset to all long-term averages upon either ATI or
-      reseed events.
-
-  azoteq,rate-np-ms:
-    minimum: 0
-    maximum: 255
-    default: 150
-    description: Specifies the report rate (in ms) during normal-power mode.
-
-  azoteq,rate-lp-ms:
-    minimum: 0
-    maximum: 255
-    default: 150
-    description: Specifies the report rate (in ms) during low-power mode.
-
-  azoteq,rate-ulp-ms:
-    multipleOf: 16
-    minimum: 0
-    maximum: 4080
-    default: 0
-    description: Specifies the report rate (in ms) during ultra-low-power mode.
-
-  azoteq,timeout-pwr-ms:
-    multipleOf: 512
-    minimum: 0
-    maximum: 130560
-    default: 2560
-    description:
-      Specifies the length of time (in ms) to wait for an event before moving
-      from normal-power mode to low-power mode, or (if 'azoteq,ulp-enable' is
-      present) from low-power mode to ultra-low-power mode.
-
-  azoteq,timeout-lta-ms:
-    multipleOf: 512
-    minimum: 0
-    maximum: 130560
-    default: 40960
-    description:
-      Specifies the length of time (in ms) to wait before resetting the long-
-      term average of all channels. Specify the maximum timeout to disable it
-      altogether.
-
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
-
-patternProperties:
-  "^ulp-0|generic-[0-2]|hall$":
-    type: object
-    description:
-      Represents a single sensing channel. A channel is active if defined and
-      inactive otherwise.
-
-    properties:
-      azoteq,ati-exclude:
-        type: boolean
-        description:
-          Prevents the channel from participating in an ATI event that is
-          manually triggered during initialization.
-
-      azoteq,reseed-disable:
-        type: boolean
-        description:
-          Prevents the channel from being reseeded if the long-term average
-          timeout (defined in 'azoteq,timeout-lta') expires.
-
-      azoteq,meas-cap-decrease:
-        type: boolean
-        description:
-          Decreases the internal measurement capacitance from 60 pF to 15 pF.
-
-      azoteq,rx-inactive:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2]
-        default: 0
-        description: |
-          Specifies how inactive CRX pins are to be terminated as follows:
-          0: VSS
-          1: Floating
-          2: VREG (generic channels only)
-
-      azoteq,linearize:
-        type: boolean
-        description:
-          Enables linearization of the channel's counts (generic and Hall
-          channels) or inverts the polarity of the channel's proximity or
-          touch states (ULP channel).
-
-      azoteq,dual-direction:
-        type: boolean
-        description:
-          Specifies that the channel's long-term average is to freeze in the
-          presence of either increasing or decreasing counts, thereby permit-
-          ting events to be reported in either direction.
-
-      azoteq,filt-disable:
-        type: boolean
-        description: Disables raw count filtering for the channel.
-
-      azoteq,ati-mode:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        description: |
-          Specifies the channel's ATI mode as follows:
-          0: Disabled
-          1: Semi-partial
-          2: Partial
-          3: Full
-
-          The default value is a function of the channel and the device's reset
-          user interface (RUI); reference the datasheet for further information
-          about the available RUI options.
-
-      azoteq,ati-base:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [75, 100, 150, 200]
-        description:
-          Specifies the channel's ATI base. The default value is a function
-          of the channel and the device's RUI.
-
-      azoteq,ati-target:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        multipleOf: 32
-        minimum: 0
-        maximum: 2016
-        description:
-          Specifies the channel's ATI target. The default value is a function
-          of the channel and the device's RUI.
-
-      azoteq,cct-increase:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 16
-        default: 0
-        description:
-          Specifies the degree to which the channel's charge cycle time is to
-          be increased, with 0 representing no increase. The maximum value is
-          limited to 4 in the case of the ULP channel, and the property is un-
-          available entirely in the case of the Hall channel.
-
-      azoteq,proj-bias:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          Specifies the bias current applied during projected-capacitance
-          sensing as follows:
-          0: 2.5 uA
-          1: 5 uA
-          2: 10 uA
-          3: 20 uA
-
-          This property is unavailable in the case of the Hall channel.
-
-      azoteq,sense-freq:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        description: |
-          Specifies the channel's sensing frequency as follows (parenthesized
-          numbers represent the frequency if 'azoteq,clk-div' is present):
-          0: 4 MHz (1 MHz)
-          1: 2 MHz (500 kHz)
-          2: 1 MHz (250 kHz)
-          3: 500 kHz (125 kHz)
-
-          This property is unavailable in the case of the Hall channel. The
-          default value is a function of the channel and the device's RUI.
-
-      azoteq,ati-band-tighten:
-        type: boolean
-        description:
-          Tightens the ATI band from 1/8 to 1/16 of the desired target (ULP and
-          generic channels only).
-
-      azoteq,proj-enable:
-        type: boolean
-        description: Enables projected-capacitance sensing (ULP channel only).
-
-      azoteq,filt-str-np-cnt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the raw count filter strength during normal-power mode (ULP
-          and generic channels only).
-
-      azoteq,filt-str-lp-cnt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the raw count filter strength during low-power mode (ULP and
-          generic channels only).
-
-      azoteq,filt-str-np-lta:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the long-term average filter strength during normal-power
-          mode (ULP and generic channels only).
-
-      azoteq,filt-str-lp-lta:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the long-term average filter strength during low-power mode
-          (ULP and generic channels only).
-
-      azoteq,rx-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 1
-        maxItems: 8
-        items:
-          minimum: 0
-          maximum: 7
-        description:
-          Specifies the CRX pin(s) associated with the channel.
-
-          This property is unavailable in the case of the Hall channel. The
-          default value is a function of the channel and the device's RUI.
-
-      azoteq,tx-enable:
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 1
-        maxItems: 8
-        items:
-          minimum: 0
-          maximum: 7
-        description:
-          Specifies the TX pin(s) associated with the channel.
-
-          This property is unavailable in the case of the Hall channel. The
-          default value is a function of the channel and the device's RUI.
-
-      azoteq,local-cap-size:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3, 4]
-        default: 0
-        description: |
-          Specifies the capacitance to be added to the channel as follows:
-          0: 0 pF
-          1: 0.5 pF
-          2: 1.0 pF
-          3: 1.5 pF
-          4: 2.0 pF
-
-          This property is unavailable in the case of the ULP or Hall channels.
-
-      azoteq,sense-mode:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 8, 9, 12, 14, 15]
-        description: |
-          Specifies the channel's sensing mode as follows:
-          0:  Self capacitance
-          1:  Projected capacitance
-          8:  Self inductance
-          9:  Mutual inductance
-          12: External
-          14: Hall effect
-          15: Temperature
-
-          This property is unavailable in the case of the ULP or Hall channels.
-          The default value is a function of the channel and the device's RUI.
-
-      azoteq,tx-freq:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          Specifies the inductive sensing excitation frequency as follows
-          (parenthesized numbers represent the frequency if 'azoteq,clk-div'
-          is present):
-          0: 16 MHz (4 MHz)
-          1: 8 MHz (2 MHz)
-          2: 4 MHz (1 MHz)
-          3: 2 MHz (500 kHz)
-
-          This property is unavailable in the case of the ULP or Hall channels.
-
-      azoteq,invert-enable:
-        type: boolean
-        description:
-          Inverts the polarity of the states reported for proximity, touch and
-          deep-touch events relative to their respective thresholds (generic
-          channels only).
-
-      azoteq,comp-disable:
-        type: boolean
-        description:
-          Disables compensation for the channel (generic channels only).
-
-      azoteq,static-enable:
-        type: boolean
-        description:
-          Enables the static front-end for the channel (generic channels only).
-
-      azoteq,assoc-select:
-        $ref: /schemas/types.yaml#/definitions/string-array
-        minItems: 1
-        maxItems: 6
-        items:
-          enum:
-            - ulp-0
-            - trackpad-3x2
-            - trackpad-3x3
-            - generic-0
-            - generic-1
-            - generic-2
-            - hall
-        description:
-          Specifies the associated channels for which the channel serves as a
-          reference channel. By default, no channels are selected. This prop-
-          erty is only available for the generic channels.
-
-      azoteq,assoc-weight:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 255
-        default: 0
-        description:
-          Specifies the channel's impact weight if it acts as an associated
-          channel (0 = 0% impact, 255 = 200% impact). This property is only
-          available for the generic channels.
-
-    patternProperties:
-      "^event-(prox|touch|deep)(-alt)?$":
-        type: object
-        $ref: input.yaml#
-        description:
-          Represents a proximity, touch or deep-touch event reported by the
-          channel in response to a decrease in counts. Node names suffixed with
-          '-alt' instead correspond to an increase in counts.
-
-          By default, the long-term average tracks an increase in counts such
-          that only events corresponding to a decrease in counts are reported
-          (refer to the datasheet for more information).
-
-          Specify 'azoteq,dual-direction' to freeze the long-term average when
-          the counts increase or decrease such that events of either direction
-          can be reported. Alternatively, specify 'azoteq,invert-enable' to in-
-          vert the polarity of the states reported by the channel.
-
-          Complementary events (e.g. event-touch and event-touch-alt) can both
-          be present and specify different key or switch codes, but not differ-
-          ent thresholds or hysteresis (if applicable).
-
-          Proximity events are unavailable in the case of the Hall channel, and
-          deep-touch events are only available for the generic channels. Unless
-          otherwise specified, default values are a function of the channel and
-          the device's RUI.
-
-        properties:
-          azoteq,thresh:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 255
-            description: Specifies the threshold for the event.
-
-          azoteq,hyst:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 15
-            description:
-              Specifies the hysteresis for the event (touch and deep-touch
-              events only).
-
-          linux,code: true
-
-          linux,input-type:
-            enum: [1, 5]
-            description:
-              Specifies whether the event is to be interpreted as a key (1) or
-              a switch (5). By default, Hall-channel events are interpreted as
-              switches and all others are interpreted as keys.
-
-        additionalProperties: false
-
-    dependencies:
-      azoteq,assoc-weight: ["azoteq,assoc-select"]
-
-    additionalProperties: false
-
-  "^trackpad-3x[2-3]$":
-    type: object
-    $ref: input.yaml#
-    description:
-      Represents all channels associated with the trackpad. The channels are
-      collectively active if the trackpad is defined and inactive otherwise.
-
-    properties:
-      azoteq,ati-exclude:
-        type: boolean
-        description:
-          Prevents the trackpad channels from participating in an ATI event
-          that is manually triggered during initialization.
-
-      azoteq,reseed-disable:
-        type: boolean
-        description:
-          Prevents the trackpad channels from being reseeded if the long-term
-          average timeout (defined in 'azoteq,timeout-lta') expires.
-
-      azoteq,meas-cap-decrease:
-        type: boolean
-        description:
-          Decreases the internal measurement capacitance from 60 pF to 15 pF.
-
-      azoteq,rx-inactive:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-        default: 0
-        description: |
-          Specifies how inactive CRX pins are to be terminated as follows:
-          0: VSS
-          1: Floating
-
-      azoteq,linearize:
-        type: boolean
-        description: Inverts the polarity of the trackpad's touch state.
-
-      azoteq,dual-direction:
-        type: boolean
-        description:
-          Specifies that the trackpad's long-term averages are to freeze in
-          the presence of either increasing or decreasing counts, thereby
-          permitting events to be reported in either direction.
-
-      azoteq,filt-disable:
-        type: boolean
-        description: Disables raw count filtering for the trackpad channels.
-
-      azoteq,ati-mode:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          Specifies the trackpad's ATI mode as follows:
-          0: Disabled
-          1: Semi-partial
-          2: Partial
-          3: Full
-
-      azoteq,ati-target:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        multipleOf: 32
-        minimum: 0
-        maximum: 2016
-        default: 0
-        description: Specifies the trackpad's ATI target.
-
-      azoteq,cct-increase:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 4
-        default: 0
-        description:
-          Specifies the degree to which the trackpad's charge cycle time is to
-          be increased, with 0 representing no increase.
-
-      azoteq,proj-bias:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          Specifies the bias current applied during projected-capacitance
-          sensing as follows:
-          0: 2.5 uA
-          1: 5 uA
-          2: 10 uA
-          3: 20 uA
-
-      azoteq,sense-freq:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          Specifies the trackpad's sensing frequency as follows (parenthesized
-          numbers represent the frequency if 'azoteq,clk-div' is present):
-          0: 4 MHz (1 MHz)
-          1: 2 MHz (500 kHz)
-          2: 1 MHz (250 kHz)
-          3: 500 kHz (125 kHz)
-
-      azoteq,ati-band-tighten:
-        type: boolean
-        description:
-          Tightens the ATI band from 1/8 to 1/16 of the desired target.
-
-      azoteq,hyst:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 15
-        default: 0
-        description: Specifies the trackpad's touch hysteresis.
-
-      azoteq,lta-update:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3, 4, 5, 6, 7]
-        default: 0
-        description: |
-          Specifies the update rate of the trackpad's long-term average during
-          ultra-low-power mode as follows:
-          0: 2
-          1: 4
-          2: 8
-          3: 16
-          4: 32
-          5: 64
-          6: 128
-          7: 255
-
-      azoteq,filt-str-trackpad:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: Specifies the trackpad coordinate filter strength.
-
-      azoteq,filt-str-np-cnt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the raw count filter strength during normal-power mode.
-
-      azoteq,filt-str-lp-cnt:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2, 3]
-        default: 0
-        description:
-          Specifies the raw count filter strength during low-power mode.
-
-      linux,keycodes:
-        minItems: 1
-        maxItems: 6
-        description: |
-          Specifies the numeric keycodes associated with each available gesture
-          in the following order (enter 0 for unused gestures):
-          0: Positive flick or swipe in X direction
-          1: Negative flick or swipe in X direction
-          2: Positive flick or swipe in Y direction
-          3: Negative flick or swipe in Y direction
-          4: Tap
-          5: Hold
-
-      azoteq,gesture-swipe:
-        type: boolean
-        description:
-          Directs the device to interpret axial gestures as a swipe (finger
-          remains on trackpad) instead of a flick (finger leaves trackpad).
-
-      azoteq,timeout-tap-ms:
-        multipleOf: 16
-        minimum: 0
-        maximum: 4080
-        default: 0
-        description:
-          Specifies the length of time (in ms) within which a trackpad touch
-          must be released in order to be interpreted as a tap.
-
-      azoteq,timeout-swipe-ms:
-        multipleOf: 16
-        minimum: 0
-        maximum: 4080
-        default: 0
-        description:
-          Specifies the length of time (in ms) within which an axial gesture
-          must be completed in order to be interpreted as a flick or swipe.
-
-      azoteq,thresh-swipe:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 255
-        default: 0
-        description:
-          Specifies the number of points across which an axial gesture must
-          travel in order to be interpreted as a flick or swipe.
-
-    patternProperties:
-      "^channel-[0-8]$":
-        type: object
-        description: Represents a single trackpad channel.
-
-        properties:
-          azoteq,thresh:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 0
-            maximum: 255
-            default: 0
-            description: Specifies the threshold for the channel.
-
-          azoteq,ati-base:
-            $ref: /schemas/types.yaml#/definitions/uint32
-            minimum: 45
-            maximum: 300
-            default: 45
-            description: Specifies the channel's ATI base.
-
-        additionalProperties: false
-
-    dependencies:
-      azoteq,gesture-swipe: ["linux,keycodes"]
-      azoteq,timeout-tap-ms: ["linux,keycodes"]
-      azoteq,timeout-swipe-ms: ["linux,keycodes"]
-      azoteq,thresh-swipe: ["linux,keycodes"]
-
-    additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - "#address-cells"
-  - "#size-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/input/input.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-
-    i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            touch@44 {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
-
-                    compatible = "azoteq,iqs626a";
-                    reg = <0x44>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-
-                    azoteq,rate-np-ms = <16>;
-                    azoteq,rate-lp-ms = <160>;
-
-                    azoteq,timeout-pwr-ms = <2560>;
-                    azoteq,timeout-lta-ms = <32768>;
-
-                    ulp-0 {
-                            azoteq,meas-cap-decrease;
-
-                            azoteq,ati-base = <75>;
-                            azoteq,ati-target = <1024>;
-
-                            azoteq,rx-enable = <2>, <3>, <4>,
-                                               <5>, <6>, <7>;
-
-                            event-prox {
-                                    linux,code = <KEY_POWER>;
-                            };
-                    };
-
-                    trackpad-3x3 {
-                            azoteq,filt-str-np-cnt = <1>;
-                            azoteq,filt-str-lp-cnt = <1>;
-
-                            azoteq,hyst = <4>;
-
-                            azoteq,ati-mode = <3>;
-                            azoteq,ati-target = <512>;
-
-                            azoteq,proj-bias = <1>;
-                            azoteq,sense-freq = <2>;
-
-                            linux,keycodes = <KEY_VOLUMEUP>,
-                                             <KEY_VOLUMEDOWN>,
-                                             <KEY_NEXTSONG>,
-                                             <KEY_PREVIOUSSONG>,
-                                             <KEY_PLAYPAUSE>,
-                                             <KEY_STOPCD>;
-
-                            azoteq,gesture-swipe;
-                            azoteq,timeout-swipe-ms = <800>;
-                            azoteq,timeout-tap-ms = <400>;
-                            azoteq,thresh-swipe = <40>;
-
-                            channel-0 {
-                                    azoteq,thresh = <35>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-1 {
-                                    azoteq,thresh = <40>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-2 {
-                                    azoteq,thresh = <40>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-3 {
-                                    azoteq,thresh = <38>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-4 {
-                                    azoteq,thresh = <33>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-5 {
-                                    azoteq,thresh = <38>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-6 {
-                                    azoteq,thresh = <35>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-7 {
-                                    azoteq,thresh = <35>;
-                                    azoteq,ati-base = <195>;
-                            };
-
-                            channel-8 {
-                                    azoteq,thresh = <35>;
-                                    azoteq,ati-base = <195>;
-                            };
-                    };
-
-                    /*
-                     * Preserve the default register settings for
-                     * the temperature-tracking channel leveraged
-                     * by reset user interface (RUI) 1.
-                     *
-                     * Scalar properties (e.g. ATI mode) are left
-                     * untouched by simply omitting them; boolean
-                     * properties must be specified explicitly as
-                     * needed.
-                     */
-                    generic-2 {
-                            azoteq,reseed-disable;
-                            azoteq,meas-cap-decrease;
-                            azoteq,dual-direction;
-                            azoteq,comp-disable;
-                            azoteq,static-enable;
-                    };
-
-                    hall {
-                            azoteq,reseed-disable;
-                            azoteq,meas-cap-decrease;
-
-                            event-touch {
-                                    linux,code = <SW_LID>;
-                            };
-                    };
-            };
-    };
-
-...
-- 
2.34.1


