Return-Path: <linux-input+bounces-9131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33004A086F9
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C54B3A9504
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE88E206F14;
	Fri, 10 Jan 2025 05:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="ZhxxU/py"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E12A2066CF;
	Fri, 10 Jan 2025 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488231; cv=fail; b=pk31vzrsarTmoFZgYnvAEX1AGFQUjspLspJEng28f0KYnBBJ8MdQRfj8J1qNsDniwoCra1D5mBTW67PEW23Twv1T7MdQ0/F5UIv3l2oEsb4LBesq2tQTguH3O8ExF8GzVacqwAUOv2EdsY/PCgCKd/xRoQolI4HVP77PUxHLe58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488231; c=relaxed/simple;
	bh=JhQXCJsqzULHdZwD4heWuIkqTb9cPk+SktYe7+RGOCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o0045nMc+NoW9Zj82SUxLn2O2F5NFFT0zsLL/tfxp3GD9SgIlitK3c0yLon1FXDk6O40zqvco/j8Yth2vSCfeVk4lH+Q0GrdmPicn2JwmWDsT8gAVsr+j1/Z5sKblDQbBSakXMW9YJsmF1e8bicGKrEq0Sw+kecXd6cKh/aiaqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=ZhxxU/py; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRfYwa/4GGDqt99juV03Sf3aeKhfD5tApD+w/HdaqH2Y78k2BhlgNAJk4iVskdgTNLTeefT3izUrBz3zlbwk+9px/bjpDkYisVtuy7oaBazt3vqcfEf8XaP0HiePNONKE/voF71d9oT3BS7xqN504jopUodKedounDPHLMccS75hZQMDVUWCAch4znVF/l9uXj70i/GRocHvIEncLIpSOZ5VfR9Bu/Fnt2dWAQd5RsBFxWmIyN0kHWYgErcgwSCJ8nAxD9jUoLgCd7LuTwVPOCyiFGXDeoq5aiDwuXXH17VQEbWLuDtIO8ECfTvhf18Pd6veuvAYKqYSkBRNdMifHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLaYmrtyc4IIDnTbvVt19A+OKuO2cdwJj9wQHgM/08Y=;
 b=rvfRJpZOnhEr504gNfiYVCdN/GEhvWjd6ptodXjV/sr5ixyd8dwxtVUdQU47HGPTBj3HcWPa5DXl0ZBRyzLIiwIi4/oxD0ouaRN2z53Y0x6DeyiEbFk+X/qV12nBUOy0SKA451vh5/GkETiuyQbIilnojwRcpb3uWs+AWdeTjOsD92qoilsg521o9XItgOXG+7qilX4yHCf2xexWeuy2TOsssBTSERf1eo91B5ykRpqbI4rV7bJmyCxGDy4uxLLNp5guEp2i48Eb9M0wf4VfVqjwJt7ibez+3VP9Vu9gEu65o6NB6YtetRpsKArbcHsf4mKno8uHBOrMt31TP+IE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLaYmrtyc4IIDnTbvVt19A+OKuO2cdwJj9wQHgM/08Y=;
 b=ZhxxU/pyfHnjw/B3zeOI0ZGkNO6QuhXhWhfCiGLwXJsiXODng7prKArVV8lKehT8b9qZ0D8XXEKhuSgG5qEUqG+sVfTXl6oGP/lEVlClPJi4+wq7hGHU1ODHgYzVR4ku3z5r/qWbAP84hKmBH7fIKgUtRi+0yUOjixP0VkT86EQDGrPzNzqbBUs7vKx1Qbt7Xi0J8orZKvCBIGbGN11cyeIsy9KgtgXzhdEsii4N+l7PcKc4Vij85uoaamUSJWmYjcjgslDEVaODlsBeruFR3csKQmckpKadHbDrtDnzergJwFhQTrnesX/75tqNBorz8YVpxyruugIMmi0SyVCl2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:27 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:27 +0000
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
Subject: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing property
Date: Fri, 10 Jan 2025 06:49:03 +0100
Message-Id: <20250110054906.354296-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::19) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a0eecc-1b86-4d2b-4278-08dd313aaf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xt50TKIT7DK+6UUeIYYHQnBr/9vr189SIAzA/kZ8PKvjTo+cfjBsNe8jmfXC?=
 =?us-ascii?Q?mN3TgYhcPOrV/Oa3bFS7gPQEQkt5sRTyJVuPrYTmEP9SesJCz3eDX/icVaO+?=
 =?us-ascii?Q?ZOt7mubbSzhNZKkyfC87m2C7X1bkGSlo+S+H2KFJDkAwpj3Es847tz/CfRh1?=
 =?us-ascii?Q?MRvYvvxfJA22ABK5QdpKGDXdSVfUYPb8g7D0tfuGATJoQDpzGDsHWkUcBvzP?=
 =?us-ascii?Q?FT3LK8W/N4u/umu0FfnyetgRnx8+LvEZKpafZRC5WnYwAg+X2GWmTJupeN6X?=
 =?us-ascii?Q?sa6AT9t8aMRxy0JufNdaeoDhFbgHNBVWWAoZHMYqsAU8Uk8t4e7ZdxEFmjII?=
 =?us-ascii?Q?Vuypsd8cfdY1QRGB8SRGMkdrk9cpnF9GwJSNJ5kyTmgqK8zfY4BjXY5gqk/m?=
 =?us-ascii?Q?1HnsyD0nJHoOmyCbCOQkTkQgePbzlkY+6SyPpUtvORrrmByFI7ZTA7PZyk+a?=
 =?us-ascii?Q?+rrcyBH2pUzaJTJazFTlASOqyXkyfGH9O7XQy47sJ7jVF3OCo0iFWD1RXiHG?=
 =?us-ascii?Q?4cq4ZG2B55qYvKhB+pcfx6pri/ww5s3b2du9Y0JqZXDjltaUAjLKFS549Utg?=
 =?us-ascii?Q?szHdOTRzFNzriwsEASMQaPVa/KX8qaPa8ckNulFDGrpUE+XctHoq8wbrKv2E?=
 =?us-ascii?Q?z5cJnqiID9Gz1qzUcPqOqL/OoWM3w/SaVMbV6X87R1j3pwofmkf/L/yEfsy7?=
 =?us-ascii?Q?d33vyyGML3YyIWC3kp+FUvY0N5Ykbu4+yPNc6tOgVIvRxGiXu+9GZoavAcHl?=
 =?us-ascii?Q?Kj6vJClnSAXS4tLZWc5+/JN7lNXB5Q6M8XqqmsAYb620hp0oUcxrbvTiSmSy?=
 =?us-ascii?Q?Rj4hcvSZq/w8Q9PyBUvkqk69ncjatYYb8V9vwG6KOgvXIlXkilazeFgW0qsr?=
 =?us-ascii?Q?TcBFAgIg/Z5TiJUH7ExFOREf4L7OBdOIhGNOPTZnkppTJ1JewBH8k+30BpAA?=
 =?us-ascii?Q?2bjW+qRQ+Hxhy07tF6qCEWIThIBDnanq7kEINDMquaBc8aQmRqua0Z97v401?=
 =?us-ascii?Q?EIj+PivpWUue4igNDrW9OC7m0vg+83S464+ENAAxcUNPRBv68vqznBPAiyH4?=
 =?us-ascii?Q?85N9KEVY75DYJfGM2VO1Cez/uxRJCdJlHLQeIecA3O60V+k6A1nMZM7HjBW2?=
 =?us-ascii?Q?F5wjDuI9Sk+HZIJM4ngRSHrbbvje82FvJ/RFZySaRBdxo2PNzLjycjKY3EYi?=
 =?us-ascii?Q?wyI5EUeeDOzrMZlBRE+LvMpWWS0Jvq9kmwVYiA7EMsQxHZWLJFA048hnqdm8?=
 =?us-ascii?Q?rWmc6bgewW8xX4lkLysOBXlYp7SDfhEuxTkTvE6gugz9qOe318Mlq63ISARM?=
 =?us-ascii?Q?tZLpsfrr5OTl2ZalM/9qYY6Zygpi61A4EARApyQ2XFsddf2FhP37FzVnE2Mc?=
 =?us-ascii?Q?yABE/RftiWegH5X6vEufR5Ah5l3P5ph/DHSFmH2K70t+hIxiAaeseA4FituX?=
 =?us-ascii?Q?I8PdGnQR/8voOgmI8u0oJb8WAAHbHzwp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QslasrKD3K1PsPmd25bb1mIXB2eHyZZXNnqCKcyXCrIkpjoiZqDzYeSVBQeD?=
 =?us-ascii?Q?I/XC4vSafzh/lCtCyAnuQgaZotyBT2noijuHqrzNinr7RXLm3tXbtRTMwHIC?=
 =?us-ascii?Q?llQtfUvdf9Jl5mjHKPS4rjcj0DgcoPYZiQsyADEn0NlCApneGC7j6B3MFUL7?=
 =?us-ascii?Q?4PaRm6aoBaNw6zcssnoer5vN0Tg5V06y9Lj48ktrqfEqaWftI74Y5cg6GjCU?=
 =?us-ascii?Q?ZeOQ1D+eB7BfTYspW2kwJibv6Tkc1Sac4Y9De2NMh75/h29TY0Dg+n7YKI48?=
 =?us-ascii?Q?3B2wAm+iGaiNttLQkE+edQwQrwnSC5bSGiogziOussHaziWyuT99BKLOtEoy?=
 =?us-ascii?Q?MjG3V2/tdDuAMi4MNT9XJzZW4Hh7isbgN0iePVilvDQzJMH2FYUNhv8NcnFU?=
 =?us-ascii?Q?FGemcYasRybXXC0GLIC9apOUtapXLOh10vdK0aL3I7/kJ5v/mCuqAohHYpV+?=
 =?us-ascii?Q?mFdxp744vSOHDPjF5uEPdoBovtuKuQgmTLmV6eRk8zMLHkSa59Ur+uqzACgj?=
 =?us-ascii?Q?rGXuimNnaKT7mqS8ijt5pvxsHw2SuxQKbBlc2VWFCyRK1ubWfXu2W4BNQGU1?=
 =?us-ascii?Q?Sg5mYGAbnH3RXv2ddfvHrczfwj3ib4m77okQvzySMnoh+tHS0cT93PdNpjiA?=
 =?us-ascii?Q?chroA2dtdT+qOPYttkHqUWZKMzOiaLHWX+Gw3Oz7QFldlvfH2pmL886Rz2xz?=
 =?us-ascii?Q?8FmWAX3xEGRyv4WjqfZvvWIUjvLaYomU4fwBOX6DmbEwfMZv5VNrUWtBzdUs?=
 =?us-ascii?Q?/XpDsx6a+5e4eOAz3NnFhdyK7hFyPVfiYmUAxK/PeyhzqUMiAb7nBPhRrFv6?=
 =?us-ascii?Q?qTTF1iytgg0JK9MY/csZQnjgWun0I1IirJPzupGy2Hzv47KA4zTZjR9r/zsx?=
 =?us-ascii?Q?UCaA8PTwQFPjA9BnJCg6HDzF9VY7M1uY949YljqDAsKQmX4n1nJjTtIKyvM9?=
 =?us-ascii?Q?J/miv9Xy9OYPvXa/z2EijnwoFuF6rO4xBp0DglbIi8kshoRD8sg8ZRwQSc9y?=
 =?us-ascii?Q?ooOXcRostM4yWfA33QYF/C3OkntbitdBH0WegVBw8jziVwrQU4kVBqXkk+8I?=
 =?us-ascii?Q?Wi8qMGXQiZ1A+YwQWAT/qnnjnLdMs2YndlLxKTotkso+m4S/8MaP25niZgFo?=
 =?us-ascii?Q?AvfdNHV1G4vIH+1Kdincxbm6RGJ27l8OFPWtWw6GUgXB9nao7wbR+/CeQoNA?=
 =?us-ascii?Q?LGR4O6G0pCS8T5baFim+foxAetzrGc6g+yIOcJpRCTGHC3Hr2lSaLJtueM0Y?=
 =?us-ascii?Q?ABRJ3WJLGNN050OPgkS1f9DIupO24TWZy4vA4bjrGYZWCJaWgOVFEne7bUOK?=
 =?us-ascii?Q?8wBWAvsabJreGhMJk+WsAlId2g71crdyRQgCk4QcrYM3o+0Up3AvNL9LlaJu?=
 =?us-ascii?Q?D3Dbl+zWuvPQLvt8ETeCUiVNuwNJOe4PmyPLAwnsT50Jro2rlbwwX94xfyFT?=
 =?us-ascii?Q?RkEV8gvVpDoa8ZVIRJZufXeW0+De3uIC8pDthgtR9uMlj7h/xpYBfOpDwazc?=
 =?us-ascii?Q?Alof71ta9eMkAN+UeBXIfj+Mt4Hf8/29zjJpcHVGUNoEa6Jan+r92RxzPJnJ?=
 =?us-ascii?Q?L6UDute+cqqVJe+wFfjjrJDhvHlfTxwYSFlya9oX?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a0eecc-1b86-4d2b-4278-08dd313aaf69
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:27.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0Y3tpD9d8qD7kfoVPXd19OWYnXaeq6bwj1f9DHv3CbPfns664zzfwbpZLwBnZHIw3V2KNcRCjVYm6d1z9IoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

The property is implemented in the driver but not described in dt-bindings.
Add missing property 'gpio-activelow' to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 0f348b9..9c91224 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -40,6 +40,12 @@ properties:
     type: boolean
     description: Do not enable autorepeat feature.
 
+  gpio-activelow:
+    type: boolean
+    deprecated: true
+    description:
+      The GPIOs are low active (deprecated).
+      Use the GPIO-flags in gpio controller instead of this property.
 
   debounce-delay-ms:
     description: Debounce interval in milliseconds.
-- 
2.39.5


