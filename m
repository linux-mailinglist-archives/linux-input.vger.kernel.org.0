Return-Path: <linux-input+bounces-16425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5FC977F8
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF6064E265A
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AB0313E1E;
	Mon,  1 Dec 2025 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nfUZubhC";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nfUZubhC"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021092.outbound.protection.outlook.com [52.101.65.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF1313524;
	Mon,  1 Dec 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.92
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594482; cv=fail; b=TZ/qT1rRz8Cwb82FA4js6Kg3cp+NTGQaNKQ5F6pvFT3hBK0OmB1hapmb3HxKigUPbWCTM/viSdWS+NybdWzsLOmJB5auj1Pfe4wWKiC6pZbnUmf/dSaqKGNnRcvmV5dRuhmVSMBXHaaKx1ENaNAzqYDZJ21C8KTuet9Wn26weU8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594482; c=relaxed/simple;
	bh=W1KsoekCBZaZSH6zfbkijVJqLUfs5NKtjwxJlNsg1/c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aamu8/bXsLwlYHxxcON6GfYAlXMrHznxhA87UhBsbvf8CT4bSoBJUhA5L0BgOqtz/Q6QcXCfRPUdGrXei5s9XVeXsUTgXRWc+juvs05Uc060N7nGdiCSU2iZoS6lqS6Lqrv5mv68UDxcVEc7O+mlSbAQL9oDoxy8os4XNWkQRt8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nfUZubhC; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nfUZubhC; arc=fail smtp.client-ip=52.101.65.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NeCnMiuxR8q0e8uRXRMonMF/QOaUBf/icp509VqX9BSKrDHn6CnivMigZ/8bzpMqsgcf3/8xRELJ8fHGWtR3H5RdcLDotnk+kCYgzrrQx9t432XBH1J+BijCJ5lpx+gBPGD/uV2nBSfqbSS/0M3Ur3ZVC7xSZTvMyH8Z9t9+rE0O3ZbnB2M6I/YtGF6aYi+TAHtHXIzmC25VR8SP/qtitNOE2+3EAVys5hiFLalGo2J5euBzTPIri5W/DTPo6b+25Sw1mcnQ35QRhVzub5YRy/yXmSASfz6jALoO1UouUN1zPmuQwtIjfouctBoaXRtGI4n1CretqckZ+TW3q8s4gw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/weNvg2XgqMh9lWd1vYCDo6O0sw7gdbvR9OOdMLHGxA=;
 b=y9Wg0Mlrq2kuHG/YLO0BlrdkSumr+srH0g/DUE4TNkJlf7UbvYpp7qcj1YmITwae3QH3J+wmX1euPSK08JwOj2iWvkNOJmg8+oQum7L4PX7AS3OTwqvJ31IGr+6vAycVeBUXDo0I4XcX7bJXNxfo2GL1tpKP9R/EgjS9fz5vbw/J66/UdS7we19OpEnJINtkpC1IylDVKIVAX65s7BuPoQmdJJcompq2qBNAusbkEx0wAqjKyHe9RqVcQJHctYrXhKHh+B0ucvb+n55oEYRjQTAKpGlEzilyduVorf8pjEaPiQ5OdKqiibLzrNS5KO8jttYDjMWKxJNPpwZjb1lFEA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/weNvg2XgqMh9lWd1vYCDo6O0sw7gdbvR9OOdMLHGxA=;
 b=nfUZubhCv/P2HPpZjIT5nRcNTdmQ+/7pQ8kIpjUwmBORAMHHJHH3LlbnjFdRQb45wbhftpb8hsc1j2n2aa4tZF0ZVfHtLQzCdvtPmgqjpUR1AlyCs5ylE3ZRTh3hAiNQ+aTnlXJBJXAzwRg79/0Kwm8PJohLyFqAluscgDW3Ntk=
Received: from DU2PR04CA0179.eurprd04.prod.outlook.com (2603:10a6:10:2b0::34)
 by GV2PR04MB11712.eurprd04.prod.outlook.com (2603:10a6:150:2d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:54 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::d8) by DU2PR04CA0179.outlook.office365.com
 (2603:10a6:10:2b0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:53 +0000
Received: from emails-1495203-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 68EF08014D;
	Mon,  1 Dec 2025 13:07:53 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594473; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=/weNvg2XgqMh9lWd1vYCDo6O0sw7gdbvR9OOdMLHGxA=;
 b=q4DJ8o+TMEnESyHfhh6/K/ikYGGRrGiylk9jmVi3EksQ0rMFnMNnxwwWQQG0ufs/F5Khw
 tkUTq8TUkFQWLNEKeT6gMffCCic71Eh2ovWtAJzC7qTbs2ZVp+TJ774hRlQbLJ0EMKJW3ra
 Vy+7VtJuc48jPLYCyMRLYKOFHB0oNfk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594473;
 b=lLKzh5Zlmdx20h77Tvd6w3jaa3Jk9JlVdWQq+kmikWciBOEsQAZcqDQ1tz1Hq45SZaWNh
 vVQyd772Np7/DTklbCCY5FzqcMW4GfwGsdS3dnTCy9Efr4PzsA+1w00TR/OvDnSLgkIz8i0
 zCta/pToip1uJgo1ca6pZUjsVBjMonI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElQWi2jpgn+uINXZfJP7MOFLQttczNcH3JzMvAMVUaAGNT1m7RAFmJWsGavjdZ7wsKyqSb+M1N9m5O6WGJAZM1Wa+TlEAVllfHN9jdhr6d4xfOadlZ12Z2tXT0v0u/V2b2+/ij7nl/Z5SfYkMWta+ghrZHh/n0jDU7143JWBfhPSEn6uRoJek4sE2ZdnSFylxgRVDazQmOwIL0gNUdAkEsYAxpzQtedB4/KOlsQXdsXWDYOFynPQ5cMi7l0+RtxAgNRZyeIQuQeLSyb3hky3GVJrqERhkPOEwYU6Wh2CERnsQIMEAQHQV6W0P9RXFE2V3JE6HJwQJlMCqNZhIRswUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/weNvg2XgqMh9lWd1vYCDo6O0sw7gdbvR9OOdMLHGxA=;
 b=dLX5xPj22PHV6cw6RHYhugGcYNFZPqMBlKTSA4idjeLb65FP7popSy1NUrX2zE9otRhZlhmh5uYu5O/rzapU45FlbdGFs77w2B2Cq3Ws/M/30huSudwqSlFpy7RmEM0DIGDdJQGpDDhL8xQb5TbSQbaiucZTS8dfgT6LEQR+FUtMgplKybiVwoyhGLEffr0dW9s0qkjxF0JusxEc8IWv9TDe5oF7KNJ0amtAkFmldHdXyeXFb5r1Y15KVYHnDqy7rd5cK8Qh25rlmg3gzOM69V/W/M4mQPRADeL0G+Ov8lmWMMhXw/HIpP7LSEsYdyUvaToyFZb5LzOcoZOcThNBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/weNvg2XgqMh9lWd1vYCDo6O0sw7gdbvR9OOdMLHGxA=;
 b=nfUZubhCv/P2HPpZjIT5nRcNTdmQ+/7pQ8kIpjUwmBORAMHHJHH3LlbnjFdRQb45wbhftpb8hsc1j2n2aa4tZF0ZVfHtLQzCdvtPmgqjpUR1AlyCs5ylE3ZRTh3hAiNQ+aTnlXJBJXAzwRg79/0Kwm8PJohLyFqAluscgDW3Ntk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:39 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:38 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:27 +0100
Subject: [PATCH v4 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-8-53a4cd6c21bf@solid-run.com>
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
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|DB1PEPF00039231:EE_|GV2PR04MB11712:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b91895-9250-42f3-168a-08de30daa36f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SUEvbGl2SS94NzdXUDJNbkRHdzhRQ1E4NWFoQkFLcW4rNGZKWi8rQk5kNG1B?=
 =?utf-8?B?c1k3NTJ3V3VReWduTVpsVHNrc0s4TGhGS2FySndPcUhpY081YlF5eW5BUHJx?=
 =?utf-8?B?d2NYWnJnb1VDS2d5SUR1TlFsZnV4QnZTcnVMNlJFRTBXVkptWUpkL2k5dzVl?=
 =?utf-8?B?NDB2TG5ZVnVFZGFMNTV0YlFuU3ZpdUZBMzNaYzFybFZGTC9NTWpiV24zdEs0?=
 =?utf-8?B?dnBGZExWZmRzUmw5KzlRLzFDM3Y0RXJxYll0WEZPeXlxVCtRNW51WFdUTlht?=
 =?utf-8?B?MUhYZWRuM3lOODU3RnduU3I0TnMyWHFnWndEaDczR0REdEwyTndFMHlPNWtP?=
 =?utf-8?B?R1hnL05ncHIxQ0hCWVhUV0hueXg1UHcvcHAyRWRFT3MwSUgreWFLZkJlU0lj?=
 =?utf-8?B?ZUNBNlF1UjRnUCs4YWw3RW1oVktSUzZaSDYxRnJEZlJCOTN4T2NGZE1TTEtn?=
 =?utf-8?B?aG9LSG0wSG9RMU1kOXE2S0Z0ZDFsbHFqWEEyVlk4Rnpad3hEei9YKzg4czln?=
 =?utf-8?B?aWZVeElDS2VqeUdpbENKdFIvelNaSk1GVkQ2NERuaHN4Y3NDWFJ5WlNlenBO?=
 =?utf-8?B?aVZ5ODZSSEZjc3lwa2FQM1RrTEhZVVQyenNaMzhKNFRZSG5seEtmb2Zja0VR?=
 =?utf-8?B?RTdHekNVNkhMUzR0SGZFTk5LeU5WSXRNVkFlRmVtK2xPVjRSMnZITkY5YU05?=
 =?utf-8?B?T1pPdWZ0RDlTbUxLN09aNGd3TjB1MG40WDZEU0lHMnI1SGs5NUg3ZmxhWDlW?=
 =?utf-8?B?cmY3SWZUekpJY2ErOFp3R3NhYjZFMlA4blJHWWJoT0VRNnlURWx0UjJJS3Y0?=
 =?utf-8?B?U2dxakdnZ0t4dW1RS0pRZzVpcGVzRm1vRW1NTkVLd3E3MWFOVFJ6NkZ2TjR2?=
 =?utf-8?B?WDAxVFJkVmRRclo3NlJKSXYwbGs2VzRWeUdnYzdxdWRsMXUvbFlHcmhqeWt6?=
 =?utf-8?B?KzZxNkh1emVacldoSVR6V0M2ekp3TThEN2todVZXeVJsZHN5Y05Rd0ZObDE5?=
 =?utf-8?B?ZnlROFdCVGtIeFlTTXRZNTFBUEVUYndmenpVZ0pUb2FmMGRORGpvTnI1Uk8z?=
 =?utf-8?B?U3ZRT0tWTnFmbW40M2oydkt2ZWtJQm5naWR6VE91Z0p4UHJQTCs2RlBZMkVX?=
 =?utf-8?B?YUZ4Wklia3R1S0x1MlVlSkZlb1REL0t3WjJhQTF0MUIycXVYcFNSbWVkb0Uy?=
 =?utf-8?B?ZEcwYUFsdUNlYyt4c3JVZXJ1ajZPZXdMQ2pWTnB3OFgxOFVTODNTd2NCRXha?=
 =?utf-8?B?aWJDdnBhajFQcjBiTXdzYTMvbFFpQWZHT1JXaGF1ZHhnOTFxeXdKOVZlLzVm?=
 =?utf-8?B?ZVFSbUdnSjFGVUp5b2lBbUJaWkVVbUZLaDhXdXFmUVRCT0I5cnh2SWVTazZk?=
 =?utf-8?B?RjhXdVNnY0JYMmtwelV4cmNTTjd3VXpCWEovL3RibjRsREd1MmU1b1RwMVpF?=
 =?utf-8?B?d1ZpSFVrVTFZZ3hTUE5uZjVuREJGbEZKTjVIYW5qYUQweWJFeWNMYU1Xa3kx?=
 =?utf-8?B?OG5HMnFjZUFtRXAveVQ5KzhoRnhmdUEzbUdSS1BEVk14Wlp4SEZaOCtIVHpa?=
 =?utf-8?B?OTJvdkRZZjlDZlFBNUYreXYvU09yYVZBTVR4aUp4emx3clNnUi9ZeTFxRWVU?=
 =?utf-8?B?RkxNcExVS3EyL3N4YlZpLytHYk1aODlXbEY5WFB4NkloQW5EOGJpeGZDejRi?=
 =?utf-8?B?M2xKQUZLTDhPcjNoOE90NnJLT21Wb2Vlc1J5THVPRTMrdVVzKzRndmQ2Z2ZS?=
 =?utf-8?B?a0NVMm1OZ05rbVBwbHl4c1I3Z0xSVGtaRit2WWlXOXFYNTQvdDVOcnFWVVZV?=
 =?utf-8?B?K0VlTHBBWCtxa0FIZWpEMER5VnJOUUdURlVXWjhKYTBsOHNFWUtjby9qNjlS?=
 =?utf-8?B?cFVkYzdrdFQvelFNR2plYzRXSzlUOXQzOURTUUJQUDhoRE1BQndJMTAxdWJn?=
 =?utf-8?B?bUM1TDhGV0RJNC81c2ZmYWhpM3ZlYVlVNnlxWnhPbHZTZHVoQjhja1pwV3Ru?=
 =?utf-8?B?MWFzeFMzZ3VJcDB4ZW1qU3VTRHBlaHJzUVUzNmNlaE9qNlNXcWZ3OXluT0ZX?=
 =?utf-8?Q?zA3/1S?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: baa5f71951c240d8a9a4d12ba8919673:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea63c867-169e-484d-fb8c-08de30da9a9c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|376014|35042699022|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTVOc0xrT09sUUovWjRqZCtoWDBobXRLdlAxSVd6ZlRXemtYR3pGbjVWYmsx?=
 =?utf-8?B?cXU4VVQ4ZWVpT3NIR2k2a3pJNjFUYXdkRWdFZFZtOHYrNllZV1ViekJnNStM?=
 =?utf-8?B?T3R2UVArZkpQYUFlYzVCQ0lYbUJBWG0vRzBwMjZxdXZSMzV0SVIrTlpNTk43?=
 =?utf-8?B?ckZ3RWZpWGNIMUJiRmxtUk1JMFdnWFYxbXc5Rmp4SUg4M1BUYmVtaGozb0ZL?=
 =?utf-8?B?V1l2bVVqb1BmdUo2cHdPQ3pqdVRTeWJlU3hGUUpSM0ZGNzdBVW0vNFVMLzhm?=
 =?utf-8?B?Mm5TNm1CallNWkVpWjR2bXN5V2JTdHNwZmZiTXgrOWVIZk80U3ZrNmdZdC8y?=
 =?utf-8?B?VndlVy9uelRwMFR1VTBiWm9rak1DVXB2dnU0ekx5cG5WTHRKVFdzczZzVjVs?=
 =?utf-8?B?MmpYcHR3cWo1NElsMVdPTGROd3psS1o4WmI5NFJJL0crYWtVeXF4Nm9FZ0xv?=
 =?utf-8?B?aWNEdll4QzBtZXMwK0hLVnU0Mkt0TDQ4c1Z6OGI1czMxR3NaRSswYmpMa096?=
 =?utf-8?B?Y1pXcHNxOVZ0TTdBUGtTTUNVZlFwcHhTbGRGRkVXZjlKeDk3eGZ5eFRibGlO?=
 =?utf-8?B?cEpmTHNHYVFCdmpIdE1uTTJnNnRpVUJPN1hGNGtGMDFBL1A4b01qOG5PZDAz?=
 =?utf-8?B?cGN6SHBFdUZVVHpRS1hkU1djZCtqa3pMSlFnTmN1UG5ycnhDZHAwSzhOL3Mz?=
 =?utf-8?B?Y3VlRnAzTDR6V3d4aEZjeHlhSHBMaHFSdk5ieW9sUGhwNHZNZ0kwNkw2TG8w?=
 =?utf-8?B?N0pFU3hvZE05OHp1VjUxOEMyNGt3Yk9WV2lFV3hQcGNkT3F5NHhGMzJsc3E0?=
 =?utf-8?B?MmVBa0ZzenBvZXdlVENDSlhDa0JVclFoTUp4MWdkWWFNN0l6eHFBT013RWli?=
 =?utf-8?B?VjNYSmJuNzFMUnZjRHB2bjh1VnF6ZjlReTl4VWU2YXBOVENZR0VDNEhBbTF1?=
 =?utf-8?B?SnZRbmxoVVl2YVVSNWZGQVFVLzU4Zzhjcy8wK3ZmcytDVGFUQThxWUc4WXBj?=
 =?utf-8?B?elBCQ01Pb05lb2g1ZWhTUDFodm9zVC9FYUltR0QxN2QxMnp1NEJDeUxlRzFx?=
 =?utf-8?B?S0ZHbVJnVUowQTJZb2J3ZWNBenE4OXRkZUwxckN6R28vSzFySTNKOVFJSmtk?=
 =?utf-8?B?TWhuRGZqYVFaSWM0V3liMDBwbXIyVnkyOVJ1WW9lTjAvYVR1WmhoQU52ZUZu?=
 =?utf-8?B?K1RpRzZLb1pmUHVKOXhNQmNlMFdFeXJnMjRaV3o0eVNmUm51R1ZZT25Yc2dL?=
 =?utf-8?B?V0w5MEkydUVyME8wWmpQZzNSbTNCK25WTldMT3dVbmFEcWtTV3MyTVV1cTFW?=
 =?utf-8?B?YWswb0NwREZiTExUMUt2YjJHTlhLSmdXM0pUTUlueGVFNi95Vk5KT21VNE1V?=
 =?utf-8?B?MmFCd1UvSEptR3FCOFNXQzRTbzZtUnpHdkZYQjFyZWxTZkNUMU1yVWZWeXYy?=
 =?utf-8?B?K0pwNEJ2OEZGNm1lQmx3cmMvOTFyK2xXdXoyYXplZ28zVWpBMkJXRVFKZkJH?=
 =?utf-8?B?VExMVTZnQklZSitPY2R5TERIbkdwUTJYd2FwY2VZT2NBclkrSHoyQlE1bERq?=
 =?utf-8?B?cjFZTzJFZm5Uc3hTVlFBQ3lkMzZ1V2lpYmI4M2pPaVQwNE9ZWndFVDdBRUlN?=
 =?utf-8?B?elBLTWx1UHBxaWJnRjZ4ZmJNdTduOHBiNy9TMXFvMEJXWHY5ZWo0Z1NidTdP?=
 =?utf-8?B?OTBlNVFtaU9vTnNnZmtDVy9DOVNNakFtbHN1RnpOVTNZejA5Ym9TNW1qam14?=
 =?utf-8?B?NWZhdUFnakJFQjBuNHlzSHRsd2t3d1BYNWI0d3ZtcjJmZ3R4WUlUbHB0d3p6?=
 =?utf-8?B?QUEweDk2ZzdIMDdYbkVvMlR2SFI1YytjejlNRURwd0RkWDRBeDRhV0tTQXhy?=
 =?utf-8?B?KzZtQ3FqUnc1M3dCNzNyQWdPaHFQbHRwejlJWlNlMmcxbzdwYlNTbkRWNW1H?=
 =?utf-8?B?V2l3MDZxK0IrT0Z4UkpScGx3R2NyVDRkMEYwdGtnT3dmcnNUdnZMWjlyc3lt?=
 =?utf-8?B?MU10alZhalZ2aEtSb1BPaUkvZUZFTVJYdjJvbm9meUdBSXdTbnRiSkQzVzdX?=
 =?utf-8?B?eG56Y3Vqc3AxY052RmRLSzQzMTFOSFk4YUdQZVFpcjlHb0wyNUFVT21TMjRt?=
 =?utf-8?Q?W3wo=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(376014)(35042699022)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:53.5729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b91895-9250-42f3-168a-08de30daa36f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11712

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 +++++++++++++++++++++
 3 files changed, 732 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c56137097da3b..3fbc8a1a1bf6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..110e7ff1ff135
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 0000000000000..04c16475e64a8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
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
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
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
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
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
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
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



