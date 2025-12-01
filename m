Return-Path: <linux-input+bounces-16424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60778C9786B
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16CB3A3423
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F292313554;
	Mon,  1 Dec 2025 13:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="HrCFeCYr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="HrCFeCYr"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020077.outbound.protection.outlook.com [52.101.84.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A330A312824;
	Mon,  1 Dec 2025 13:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.77
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594481; cv=fail; b=pMtUA6EPEaMp+pUvgzGfIEZkOdU4WvZy0W7+IPKVo4WEU3Ov+LRNEHrJTfPbTHWVNhdwfbKkHjLi4YCPsHUN2fSlzz53zscM9nwRa2FowZIXsU9K2D4dS/wtOHlA+mle1786iTYUT1EVYoG9z8yWeU2wfjJzhKDgxI5SnCO1PEM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594481; c=relaxed/simple;
	bh=+uKuTuiMnqAWAXBSBJ8/HCFKmBi4EHmtGeuCMTItkM8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Knp0B5KQ0F8ZXRXHAy15z/56zRz2kmYPsOUNgk55La0DMPDkd/1zqXwY9EWxV2T5njUqGsjuv88sMYXnRbGrcS+7qxRQWG3sVdLwxYhiUO4atooQFrOEdiy5qq88Q15c2+Ko+RFTJbayFr9xJNapwJnZYryrGpmziXZ3/axNapo=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=HrCFeCYr; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=HrCFeCYr; arc=fail smtp.client-ip=52.101.84.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kHoWY7lf2V0yYQgII4ty7tXckMgkWj4pcAOTUyUqr7WEcTuaXOojUZMsfF2TZzHN7nQrVYXmzadjvtH4AxawfF5GK8Dly7MJrsoaaH8rtyYXMEQiFv2oNu8MTs24ec+fShAXM317ULmONCjITylnJoFpm1BT4Ih+3DIDQfvsyqFxleHppcSeyCJwg4jPON1PJvQxHwZeUiwL8Eld3jUcG7l3MRWK0axY40hsEQEYHntDpaSzmwpGSq9a32bOpTpcRx5uH1ooK04Lb5nP+VdwMeG2KZksprBG9yGi0fq5BvRgyW5oMtEYaCWlStlOBQN82oVAriKvNtcbEqoKBily5Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=vzANKzaN0OPMOwgEX185KSJ2yzrsh2WLx6YfX4RNkdciHvsR6z4yiHfJrdm6t0kFtYIBw38/xOmwUbg/qyeO8CY756dPQTSs96uE+EpQnwBt2b53VUwdOYV85zW9SV9wbTrBvcOsiqDNGol91Ryqd3D6fUmOYWsPIeQ/2GRXad44WnLFLhCNjvNoGFh/G/WzvLHn8v9DUysgrINJodAwqR8SYX2oN8s2gI5eipA1l0Vnaxeu7OtahwhaIIaOdj57zylhTwLHf2dB4TDOGSqrVXxCcTFjnEed+OktFhvDSV9dqMURC7JGD7EXaJzvP/OeM+c3wxgcSdEN0/ZNO5nV2w==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=HrCFeCYruwpW+XLK65K5f42APw5Wz6NbMBDBYz1fE0/fwWWWF9rovC988lTo+VsbX2LKCQdozWGld6lz3sS3iK8uaschlVyypJl/gZMf6zH8WwxsXAR4L1QoMpurjOQ0oTdQHy1JmCDrfJ1+g0CI2P6Lagen5ZD0THQt4iJZgh4=
Received: from AS4P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::18)
 by VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:53 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::ea) by AS4P251CA0030.outlook.office365.com
 (2603:10a6:20b:5d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:52 +0000
Received: from emails-8290778-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 41F3480127;
	Mon,  1 Dec 2025 13:07:52 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594472; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=PRfHfqQY2yD7h6NLlRvKKAM+yk+yMgaSav8b/rZvd80TMCD4eY/Vj9m42MlJZW4UyzhSk
 oNDjCXYLwsS5iB9hL/I2wTGgPcKr/FrG3mNslieSY2b9RNKMMzZ4A3rEasnSvThhFtH9hCx
 XY5MGgSmO8xrO4SAyBt0AW5To5klHxo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594472;
 b=B0FXWwoQ+ak1DOptiM2Ekgwz9U7Tj2JVfD+f91EsTDE92zfaByu5DAaDHM2RQm5GXWpTS
 Oz2u801p+BF7J9xvwWPjRjdJaekGY69yqgbaKqobEtr+BTWfGTyLaaOjcUqekv38/5rbdlI
 VD8r4FZW4u/xKgvzA3tc2/vLAxp486w=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raZfngQeRkRclq/Ep2o8GM3QsyNUrj6FSagtxeNI5szu6zm3v+PdWzKMl4hIWZWVIbW1AVDJ75vYz9gtWZHTo+iG/F2OCMV16s5ujcZ7jXBeXswYB5zpsr17fdI7TD8N/bRMmIUDq6hldBbxj9N5j853/f+drQRIo77KViEjSbyIqjNc5X/wwpGCr/pFML3dRm/l0UdyDXjh9Y0tNqY7m1leWjjBYGsKSoN14+6oFd23v3YIttqUDnvlbk7pkbrq1H7Z3WQtuX7nTybPwuiiARXKMQzsIbEwVGlwNoM1w+iMozTntDc/oJhYWxyv0K3pAWD5lxQGI9y/lWK1zYo4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=sHsUVdKekxT5tGhQPNL1HrvGcMZkQCRWK+085dsXhxzwxcmULLEoBT3TRIvpcQ44fERTz1NLph+JuLrL6OCSO7d2UH8aaETC3sTyI5dVmVdeoqs+CpSS/d63qFbJerIxARdhVFxvHpbzDg0cKeA5JeDosGhBmmOEIoOvtSpczozTM1zBvrklyxHUa7rru4GS4WBuoNPctaQj8RCoiVrUdHowwxAvhZEVbqbCWxA70+hqm9LUU1m3YALDPMvz+Ik/BqN/102ziibYPjdEChtwZDG22TDvXzN8j+LFrF2Ydairpz2jvnJmzUHwlvsuWfDZe2SArYuXlopMmF3mijnGfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpssOqSs1rnI8EHQSsilbLBLKcXoMz1McwKlBYykzuA=;
 b=HrCFeCYruwpW+XLK65K5f42APw5Wz6NbMBDBYz1fE0/fwWWWF9rovC988lTo+VsbX2LKCQdozWGld6lz3sS3iK8uaschlVyypJl/gZMf6zH8WwxsXAR4L1QoMpurjOQ0oTdQHy1JmCDrfJ1+g0CI2P6Lagen5ZD0THQt4iJZgh4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:38 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:26 +0100
Subject: [PATCH v4 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|AM1PEPF000252DE:EE_|VE1PR04MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ecfe08-c3e3-432a-2ec4-08de30daa2d6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WjFJMHFWWWFVcmRiTVpzQ0JJYXc0S0pMTmpPWjBYYmxBZFViVFJqMzhzYy9D?=
 =?utf-8?B?MGFrQXZlckpSeDRIbnc1TE0zRy84TzBDQ2pWdkJWQ21PSTV1M3RPbGRBdXlW?=
 =?utf-8?B?UnZzUlJ0Uzc0elhpQWhKNmtadk41Z2lXL2VQb2s2VXpsUTdWZVVWYkRQVmJR?=
 =?utf-8?B?b2QzWjU0Q1luUEJKcHZxS1lEZm1HMW1vekQ5UisreFE1RmFGSzBNemlISlRE?=
 =?utf-8?B?TVBCN2VQVCs0dElqQStMVjVBSDZlVUNONUtTcEMzSjBuamRjY3hkUWRBNVIx?=
 =?utf-8?B?b2UxMm1NRlI2TmJQdkEzNDBnTlQ5UEd3V3lDNXNmMlFCVmUrdUlvbzlmOGI4?=
 =?utf-8?B?Si9xOWYzNC9XWUlhQmt6ZlpYVDZPZWJ3ZmcyZWtDcnBYSEs2NkxqcThpemZ5?=
 =?utf-8?B?RjdjNWpxMUFmM2N2b2RnTzVDOWIwdE1Kb3JhZTN3c1pJNXJZNVR0aWt5YTRl?=
 =?utf-8?B?dzRrVGZORFVFSVE2eXFteDJ2NlNyNFhrRHlwVjMzckx4NkoraEh4RDNSUGJC?=
 =?utf-8?B?ZXorYTB0QUE2NFFFUGhVRGQ2M052NllOTHN4VW9LYVQ1ZzRPWTJ4djNPSTJS?=
 =?utf-8?B?RVV4Q3RjQXN2K0h0RnNlaTNWMCszeDhqMFZ5cTNzM1FZRmZNaW5XR0M3ZHc3?=
 =?utf-8?B?S0tHYzdZWjUrNlM5YXdPRkFIWDFGVU04Vm1wQ29hREY2S2d2WVEvMXgwSHQr?=
 =?utf-8?B?RlVncGJSemdDOTA2MHhwOFIrSEJ1Q0NCd3BObFBUTFF3Yy9wdmd1WEhhbUZx?=
 =?utf-8?B?UVlZaTNBUHFpVDVXU3RXU2FFTmU1cUY2UWFGTG0zcjM2ZFVIdUdsVkRvMHNx?=
 =?utf-8?B?MWtLQmt6Qml4cHErQmQzaVJ3N2M0MlltK1I3Qy94UXVsalByNTlFc0thTWg0?=
 =?utf-8?B?ZkV4U0tzL2RRSCtTSVN2Y3J6VEw3V2hRUzdBbzV2ZlJkR21KS3F6UFVXbVI4?=
 =?utf-8?B?VEl0VFcyOG5pczhlM3RxQi80Tno5WDRXdGRmSXJVZUVGemhhQXNucDZNbitk?=
 =?utf-8?B?ZTNjeGtnTEx5UkNUOHBVVHBPOXJFdWRDZUhtcHd5R0lwUG5wTlM4cnBmYjNP?=
 =?utf-8?B?czhkWXBLY1dWUUZkbXRVdGtyb1MyRlJ0MXFNOFROKzM2bXVTWExGKzQrMmVi?=
 =?utf-8?B?YTF2UGg1OWNYL1J1cTNqUW9aeXNXcHR1ZlQ2M1FiQkxsd0N6NVQyeWVQdUdK?=
 =?utf-8?B?Q1ErUWM5bStBcFJRbXZET3dFaWlQblNab1d2WUlKSk1NbEpNMTVMYU5EblFZ?=
 =?utf-8?B?TzE3WVlsWVN2VUFsbDZBTWx2bDk2QlFFVFJCdkNia3lJeFFNMEhzK0RGb0ow?=
 =?utf-8?B?Y0FvclFvQTZvU3BCL09jU1dONFpoZk05NUMxZ3ltWU1MK0dGQzV2aHVtMFZl?=
 =?utf-8?B?U3JYYjNjOUdTcDJNa3V2eVhVVWFRUXllTVd6R3liNlFJc2NBYVdPZjNEUG9B?=
 =?utf-8?B?bUxUME9ZakloRkFyNzVOMW9lRXFwdFR5Q3NNbUVycVU3R2lEOVkyWlhZL0h4?=
 =?utf-8?B?My9HS1FmdTZtSnR6cE4xS2Q2MlAvVndmbldwUC9ERC8ra0NOUGM2aXAvaE5N?=
 =?utf-8?B?a1dzS1g1cjRuRmVmQkxaOW4ra1k5N3d6WGVFTDhmckxodnhwcmFLRmJNZU85?=
 =?utf-8?B?RllyYk93RmlVbjM3OVRROVcyaGM4UHlhWjN1VnFKZzl1T05QYU5OMldsZjcw?=
 =?utf-8?B?UjRlQkxPeUVLcU1Zemt6bHIvNDdTM3ZIVVJmSnFkbTFKYnVtbFFLVTBWWGsv?=
 =?utf-8?B?VTdMalJSNHZOYnhaaDNHWmNVeUI1MGN5SnNERE54VGg0SUdYVE5KTCtReUEz?=
 =?utf-8?B?M3dnTFIwQ3d2cnM5SVArSTlyOE1KUTFjNGwxM1dZLytCYURLSTZ6czNLOVRH?=
 =?utf-8?B?a0ZTVFQxTDdveDdON1lReXA4Y0JmSWZzUmo3Yjg1a1FSMUR3RzdzV3Ara0o2?=
 =?utf-8?B?SXhUclYrYmFZZGIxYkdqckFCMnNRVWdVZUlLcWtJRGZkdnprdUxsRGl2ZTYr?=
 =?utf-8?B?Yy8yQ2dIRDd6dTQ3QnNoN1drTGt1MHRmSXdnOXBDNW5NeVlTUGR3Y1FwRlQ2?=
 =?utf-8?Q?1upSaR?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4d8b8081c9f94f9db90be8e5860cd450:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a34961f7-f87b-4f49-12bb-08de30da9a3d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|35042699022|82310400026|14060799003|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFBRQVBWWEJpbEhxdkdqMkhYSWpZTlAxYmduQmJjK2ZNamY1d1RqUGZGTTZG?=
 =?utf-8?B?MHVTbVhmbitXRmpocWQ5T0l4SDk1czNmQXMxUTdMMlU2UGJ4bGxFYUtBY3Bs?=
 =?utf-8?B?QlZNZ0Z6TU4rcE5XaU9DbEFRVllkaDI0WkNra1cwMzlmL1o0MGQ4cWEyNlMr?=
 =?utf-8?B?Syt3MHFwWHNRUURxdldNNEwwOVBqTGhRQ1I1cy9kV0tUT0lWM05TV2trelRS?=
 =?utf-8?B?aUVZK2dIVmViWEhkMU9ObkNLcVBUR0xEb1dFeXJLSzEwOTlxaUc2eG5zaGMv?=
 =?utf-8?B?YnlKTkg3bUtjV1V4RUkybTNVcSt4QXZQT3hUY213WU8xcGpqZWVGaFBiVW14?=
 =?utf-8?B?aDZkUTZzWVNzMU5Pa0dWbEt1T0crTHpMaGYrQmZyNG5lbjlyOGpQNFYxTllP?=
 =?utf-8?B?WjVsdTVHOGF0ckVjQjVlSys2OWFVSE9Sd1c5QW5salY0L2FCaFRHZlFUaFpi?=
 =?utf-8?B?TzVCY2lzQTNtUjlwOHdLWG5LVXArZnJlYVVuNGplc1kwbmhSdUxxcGVSL3Rl?=
 =?utf-8?B?VDBPOWM5NWJIakRVQXFMK3F1cVRGZ0x2LzREUkVOZTlZZFBzSTIrczVBVFIr?=
 =?utf-8?B?eThYTERySy94TXdrckRveGt2YkhZVUIrckVhM0w2cXNsZmtuTlpIZVkzaWJ6?=
 =?utf-8?B?blNoWSs1ZzlmQnZMY05SNEU1NzgyczlZSG90RjZ3MkpKMlVVMjI5WVNiQkdW?=
 =?utf-8?B?QjVpbWZ4T2lLYWt3YTNqTm5YbWxtTjhhY1NNRmtWV1ZhWmtyODI2blNiWlo3?=
 =?utf-8?B?bThVaG5OZE8vUkJaWVNhbGNyWVNXZW8wL05MUHpuSU9UbDB0dk5YYTBpVnc1?=
 =?utf-8?B?RHFIWTNiQ2h5RUVrS3lwbGwzNUhCVnhqZTBCSU0xeHJUUUEzdUdGVzduVlZh?=
 =?utf-8?B?YnJKT1hjalZ6bm5OME45bFlXVlBOdjdqME9lM0dkQTRnSDZHcTRONThqSjhO?=
 =?utf-8?B?RXMrTlFQVVJqY2FVQVJNV3h5K0RzZU1iTmM4clRVRnpLMmYvcUYvd0NsZWsw?=
 =?utf-8?B?Yk5YL1VBT2l4d0xiUXlKVzFsVFZoN3dUMTdRdFpyZU1xRk1iT2RPTFIzTVZi?=
 =?utf-8?B?aXUrem1wRFJqVEJNOTQxVGZKMlZGOEgwbDNsQitUeW9VNGdOZnd5VVFiTklR?=
 =?utf-8?B?UjBEeUt1ZE5rdENZL0RSMVdoMUo1ZlcvTU1RRU53ZkgxRThEVm9QWXZQbkpM?=
 =?utf-8?B?THZ1d0hBRW9Ga2l6RSt3dlg2MHNlQmFMUjhUeDh3Wmg0bHd4Y0JldTRYSU5h?=
 =?utf-8?B?UWI3KzRmZy9UMmZuTTNjTnNDUVJaNHJ3REcrc00xY3phVjZTczU5TFpJTWlq?=
 =?utf-8?B?OVBjOXFLOCswNmxwbGRPYy8xY2gyRkU4NysrREluUlBPczR1a00yWTQrYVEw?=
 =?utf-8?B?V2g1L29relg3NmFlNjZaanlhdUZ0NzRVSjAyM0Y0SWY1OTBVSGNMMDBXbmxY?=
 =?utf-8?B?a09hRDduZWozaCtINnNUMDk0TkFQSDQvKytCdWNtOFh1MDMrVHBOMVVDQVBw?=
 =?utf-8?B?L09xbGZDcENxZzZxcWpRdjlpMWg3Z2tha3VMQkI2SXQ1MlpTQ3VnOHpMM0dp?=
 =?utf-8?B?b2lVTkdjdW1Oa3djTDFYRUhleTZyai93VmZtVEdwbUZqbCsxbTBwSyt0NXFu?=
 =?utf-8?B?QkF0RXZ4dk15eVQ5enJaUGRjaGhsMXpBSjhaOU05WDNQWUlDUms1em81Rkpy?=
 =?utf-8?B?RkpXMFVUQk53cWhVTzVxNWdWa2lFMVdUNVVzaUNXOStmQTF5OWUvTnF2TlZK?=
 =?utf-8?B?WUVrQUlvM1NQdWlVVEZLbm1uVVFjRHQ0YUcxTjgzdzMxK1UzVkZSakJZdGto?=
 =?utf-8?B?QjdIb0V2RktyU1B2aXQrd3dyWU9yN0FKVG83UlljU3RjYURZMXRFbmpPSkhH?=
 =?utf-8?B?OWJ2S3IxMVNzWEJtQXdLTGpCOG51Y3d4cnRCU2tMZkdKNUxhOS8xQzVhZlVa?=
 =?utf-8?B?Z2ZvaHp3VU4xanFzRWUzNEZqVWxLT2ZGMTR6MEVweXBWTHNSNUU0YmxoVzYy?=
 =?utf-8?B?M0pvRlVjMktPcWlHbFAwNHVaVHJzRDE3MXBRZDJjN1Q1Z1Eza0QwK2w5WHQ5?=
 =?utf-8?B?aUxtU2tyQk9TTnFub3ZkSFgxWFQ3RlBhT3VHR3ZtT0JuVGkxMUg4Wm1vRHNk?=
 =?utf-8?Q?cGdE=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:52.5113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ecfe08-c3e3-432a-2ec4-08de30daa2d6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7280

Add description for the SolidRun SolidSense N8 Compact.
The board is designed around the i.MX8MN SoC and comes as a complete
product including enclosure and labels.

Features:
- USB-2.0 Type A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- eMMC
- Cellular Modem + SIM holder
- WiFi + Bluetooth
- RS485
- CAN
- 802.15.1 radio
- supercapacitor backup power supply

This is a headless design without display.
The board includes an internal expansion connector for daughterboards
which may be described by dt addon.

The supercap is not currently described due to lack of suitable bindings.
Vendor BSP uses gpio-keys driver to trigger shutdown on power loss.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
 2 files changed, 855 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d414d0efe5e74..c56137097da3b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -181,6 +181,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr3l-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-rve-gateway.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-solidsense-n8-compact.dtb
+DTC_FLAGS_imx8mn-solidsense-n8-compact += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-venice-gw7902.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
new file mode 100644
index 0000000000000..93396e22ba409
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts
@@ -0,0 +1,853 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Device Tree file for SolidSense N8 Compact
+ *
+ * Copyright 2024 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mn.dtsi"
+
+/ {
+	model = "SolidRun SolidSense N8 Compact";
+	compatible = "solidrun,solidsense-n8-compact", "fsl,imx8mn";
+
+	aliases {
+		gpio5 = &expander;
+		rtc0 = &rtc;
+		rtc1 = &snvs_rtc;
+		usb0 = &usbotg1;
+		watchdog0 = &wdog1;
+		watchdog1 = &rtc;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	/* LED labels based on enclosure, schematic names differ. */
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		/* D20 */
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D18 */
+		led2 {
+			label = "led2";
+			gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		/* D19 */
+		led3 {
+			label = "led3";
+			gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0 0x80000000>;
+		device_type = "memory";
+	};
+
+	reg_modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbat";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		regulator-min-microvolt = <3800000>;
+		regulator-max-microvolt = <3800000>;
+		gpio = <&gpio3 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to lte modems behind hub ports 2/3 */
+	reg_modem_vbus: regulator-modem-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "modem-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_modem_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* power to usb hub, and type-a behind hub port 1 */
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_vdd_3v3: regulator-vdd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "usdhc2-vmmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&regulator_usdhc2_vmmc_pins>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		off-on-delay-us = <250>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wwan";
+		radio-type = "wwan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&modem_pins>;
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&A53_0 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply = <&buck2_reg>;
+};
+
+&ddrc {
+	operating-points-v2 = <&ddrc_opp_table>;
+
+	ddrc_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+		};
+	};
+};
+
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ecspi2_pins>;
+	/* native chip-select causes reading 0xffffffff */
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&can_pins>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk IMX8MN_CLK_CLKOUT1>;
+		/* generate 8MHz clock from soc-internal 24mhz reference */
+		assigned-clocks = <&clk IMX8MN_CLK_CLKOUT1_SEL>,
+			  <&clk IMX8MN_CLK_CLKOUT1_DIV>;
+		assigned-clock-rates = <0>, <8000000>;
+		assigned-clock-parents = <&clk IMX8MN_CLK_24M>, <0>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy4>;
+	local-mac-address = [00 00 00 00 00 00];
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Depending on board revision two different phys are used:
+		 * - v1.1: atheros phy at address 4
+		 * - v1.2+: analog devices phy at address 0
+		 * Configure first version by default.
+		 * On v1.2 and later, U-Boot will enable the correct phy
+		 * based on runtime detection and patch dtb accordingly.
+		 */
+
+		/* ADIN1300 */
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10>;
+			reset-deassert-us = <5000>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+			adi,link-st-polarity = <GPIO_ACTIVE_LOW>;
+			adi,led-polarity = <GPIO_ACTIVE_LOW>;
+			status = "disabled";
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
+					active-low;
+				};
+			};
+		};
+
+		/* AR8035 */
+		phy4: ethernet-phy@4 {
+			reg = <4>;
+			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			status = "okay";
+		};
+	};
+};
+
+&gpio5 {
+	usb-hub-reset-hog {
+		gpio-hog;
+		gpios = <3 GPIO_ACTIVE_LOW>;
+		output-low; /* deasserted */
+		line-name = "usb-hub-reset";
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			BUCK1 {
+				// supplies soc vdd, soc mipi vdd @ 0.9V
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <850000>;
+				rohm,dvs-suspend-voltage = <750000>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+				rohm,dvs-suspend-voltage = <0>;
+			};
+
+			BUCK3 {
+				// BUCK5 in datasheet
+				// output floating
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+			};
+
+			BUCK4 {
+				// BUCK6 in datasheet
+				// supplies ldo3, ldo5, muxsw
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK5 {
+				// BUCK7 in datasheet
+				// supplies ldo4, ldo6, muxsw
+				// enables dram vpp @ 2.5V
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			BUCK6 {
+				// BUCK8 in datasheet
+				// supplies dram @ 1.2V
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO1 {
+				// supplies soc snvs @ 1.8V
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO2 {
+				// supplies soc snvs @ 0.8V
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO3 {
+				// supplies soc vdd @ 1.8V
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			LDO4 {
+				// output floating
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO5 {
+				// output floating
+				regulator-name = "ldo5";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			LDO6 {
+				// supplies soc vdd mipi @ 1.2V
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	/*
+	 * routed to various connectors:
+	 * - basler camera (CON2)
+	 * - touchscreen (J3)
+	 * - expansion connector (J14)
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	expander: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_expander_pins>;
+		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SYSGD", "PFO#", "CAPGD", "CAPFLT#",
+				  "CHGEN#", "BSTEN#", "", "";
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+	};
+
+	/* battery-charger@68 */
+
+	rtc: rtc@69 {
+		compatible = "abracon,abx80x";
+		reg = <0x69>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_pins>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&i2c4 {
+	/* routed to expansion connector (J14) */
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&tamper_pins>, <&usb_hub_pins>;
+
+	ieee802151_radio_pins: pinctrl-ieee802151-radio-grp {
+		fsl,pins = <
+			/* RESETN */
+			MX8MN_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x0
+			/* VDD_EN */
+			MX8MN_IOMUXC_GPIO1_IO06_GPIO1_IO6	0x0
+			/* SWDCLK */
+			MX8MN_IOMUXC_GPIO1_IO14_GPIO1_IO14	0x0
+			/* SDIO */
+			MX8MN_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x0
+		>;
+	};
+
+	can_pins: pinctrl-can-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI3_TXD_GPIO5_IO1		0x140
+		>;
+	};
+
+	ecspi2_pins: pinctrl-ecspi2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI2_SCLK_ECSPI2_SCLK	0x96
+			MX8MN_IOMUXC_ECSPI2_MOSI_ECSPI2_MOSI	0x1d6
+			MX8MN_IOMUXC_ECSPI2_MISO_ECSPI2_MISO	0x1d6
+			MX8MN_IOMUXC_ECSPI2_SS0_GPIO5_IO13	0x1d6
+		>;
+	};
+
+	fec1_pins: pinctrl-fec1-grp {
+		/*
+		 * Some pins are sampled at phy reset to apply configuration:
+		 * - AR803x PHY (revision 1.1)
+		 *   - RXD[1:0]: phy address bits [1:0]
+		 *   - RXD[3:2],RX_CTL: mac interface select bits 3,1,0
+		 * - ADIN1300 PHY (revision 1.2 or later)
+		 *   - RXD[3:0]: phy address bits [3:0]
+		 *   - RX_CTL,RXC: mac interface select bits 1,0
+		 * SoC enables pull-down at reset, PHYs have internal
+		 * pull-down, so pinmux may unset pull-enable.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_ENET_MDC_ENET1_MDC			0x2
+			MX8MN_IOMUXC_ENET_MDIO_ENET1_MDIO		0x2
+			MX8MN_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1e
+			MX8MN_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1e
+			MX8MN_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1e
+			MX8MN_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1e
+			/* RD[3:0] sampled at phy reset for address bits [3:0] */
+			MX8MN_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x90
+			MX8MN_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x90
+			MX8MN_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x90
+			MX8MN_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x90
+			MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x10
+			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x90
+			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x90
+			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x10
+			/* phy reset */
+			MX8MN_IOMUXC_SAI5_RXFS_GPIO3_IO19		0x0
+			/* phy interrupt */
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10		0x140
+		>;
+	};
+
+	gpio_expander_pins: pinctrl-gpio-expander-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x140
+			MX8MN_IOMUXC_SD1_STROBE_GPIO2_IO11	0x140
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c2
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C2_SCL_I2C2_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c2
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c2
+		>;
+	};
+
+	i2c4_pins: pinctrl-i2c4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c2
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c2
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x100
+			MX8MN_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x100
+			MX8MN_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x100
+		>;
+	};
+
+	modem_pins: pinctrl-modem-grp {
+		fsl,pins = <
+			/* RESET_N: modem-internal pull-down */
+			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			/* PWRKEY: pull-down ensures always-on */
+			MX8MN_IOMUXC_GPIO1_IO08_GPIO1_IO8	0x100
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x140
+		>;
+	};
+
+	regulator_modem_vbat_pins: pinctrl-regulator-modem-vbat-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SAI5_MCLK_GPIO3_IO25	0x0
+		>;
+	};
+
+	regulator_modem_vbus_pins: pinctrl-regulator-modem-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_RX_GPIO5_IO4		0x0
+		>;
+	};
+
+	regulator_usb1_vbus_pins: pinctrl-regulator-usb1-vbus-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5	0x0
+		>;
+	};
+
+	regulator_usdhc2_vmmc_pins: pinctrl-regulator-usdhc2-vmmc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x0
+		>;
+	};
+
+	rtc_pins: pinctrl-rtc-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO01_GPIO1_IO1	0x140
+			MX8MN_IOMUXC_SAI3_RXFS_GPIO4_IO28	0x100
+		>;
+	};
+
+	tamper_pins: pinctrl-tamper-grp {
+		/*
+		 * Routed to physical tamper input (J12),
+		 * accelerometer and light-sensor interrupts.
+		 */
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9	0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MN_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MN_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MN_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MN_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MN_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
+			MX8MN_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
+		>;
+	};
+
+	uart3_pins: pinctrl-uart3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_ECSPI1_MOSI_UART3_DTE_RX	0x140
+			MX8MN_IOMUXC_ECSPI1_SCLK_UART3_DTE_TX	0x140
+			MX8MN_IOMUXC_ECSPI1_MISO_UART3_DTE_RTS_B	0x140
+			MX8MN_IOMUXC_ECSPI1_SS0_UART3_DTE_CTS_B	0x140
+		>;
+	};
+
+	uart4_pins: pinctrl-uart4-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_TX_GPIO5_IO3		0x0
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			/* wifi refclk */
+			MX8MN_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_WAKE_HOST */
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x100
+			/* WL_REG_ON */
+			MX8MN_IOMUXC_SD1_RESET_B_GPIO2_IO10	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MN_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MN_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MN_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MN_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MN_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MN_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+			/* usdhc2 signalling voltage pmic control */
+			MX8MN_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+/* Bluetooth */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MN_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+/* console */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+/* RS485 */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	uart-has-rtscts;
+	linux,rs485-enabled-at-boot-time;
+	fsl,dte-mode;
+	status = "okay";
+};
+
+/* 802.15.1 radio */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins &ieee802151_radio_pins>;
+	status = "okay";
+};
+
+&usbotg1 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	disable-over-current;
+	status  = "okay";
+};
+
+/* WiFi */
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+/* microSD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc3 {
+	/*
+	 * Use lowest drive strength for all high-speed modes to minimise
+	 * electro-magnetic emissions.
+	 * In this particular design HS-400 still works okay, no extra
+	 * pinctrl for 100mhz and 200mhz are required.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc3_pins>;
+	vmmc-supply = <&reg_vdd_3v3>;
+	vqmmc-supply = <&reg_vdd_1v8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.51.0



