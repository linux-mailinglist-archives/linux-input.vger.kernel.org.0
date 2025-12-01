Return-Path: <linux-input+bounces-16418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A2C977D1
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BC173342FB6
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAD33112C2;
	Mon,  1 Dec 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fh2fJIYP";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fh2fJIYP"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021108.outbound.protection.outlook.com [52.101.65.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5482C326B;
	Mon,  1 Dec 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.108
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594472; cv=fail; b=FQ/Fzx2sZKL4RBALGaUrdcdJujQL9Zug8sTgWAyQ9a44CsXnjDJH7fiejM+tQAegk7Oxmcwi5AhFzVWZJzs6mCyGQ+zD6ZC85gl1ta0DVCgXvQvjBgWWAMmJ6urBkJYA9MT3I1yxV7brnRqFSY4skB8wDGX5k6skiLWM8ayiXeA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594472; c=relaxed/simple;
	bh=mxuPfmtEAV8G7oQ9vNtTlyEpc3rIKW9Hq41mLShjsLU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m/w1wBW5a/txrmhknPhoniAO4wzJy+DRlRrXZyVD9wZb8D6MDVvo2lbAYor5crRRPxqdZhoAfJP1es4VDSl/4h2G57aLntAIWT6Kkj5FQmVyTV4jDskRrxzmT/xQYtjWpsFY8u/L+SqMyKrex0HZbnhAfLmimpRgDQ9anah7Hw4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fh2fJIYP; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fh2fJIYP; arc=fail smtp.client-ip=52.101.65.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NxeSnIj2z4FMtMf9fYJLbvyAy92vqwa3QYNb8LOuwyy8bpzbD++zGrDiY53MO0JIP3Vo78SmvE+lbpmpSVFfCnDLVuQ0++AijBhsVtlvDUDAi8HJW7aM7yDjvMPJHP4F9OVkRgX1WfsVqLrgDMBzfA4pmhjaB/c8QJ3BCRmtJ9XKZ2RIjJ7cIPq9tc98V0CmlmVlDOmDgML9WbV3WgQRYE9XIxg9rNfxCIKMD9tZFGv2zjezSasao0kzy0nJT1XpZ4RyBaIIC0koN2P9C+J2TobchXcbFQ5c+ofN6DBlb4j2WwEizEdP5ednQNXE2ZBgWtYX3lZqUQEKI315QSnTSQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhLQmB3u4cRwQIieUkNHw+SYuPhG2L+4s4k96tqfNl4=;
 b=RaKUsXIalbx8mvgFNryMTkkiSpl4dyFDq03yQRNtRrHbKhJ0dkafUZVMhl9LLHNmUZZrBT5rEiVxX5pQ4DwvawtWU4k4MbxmlGpuFc+cauEwNasE2cMMypH8tFUz091mV4DbM90KVjOAAuaboZqj6u/EXnV9ed/U5noVN87VcqJV9lrFJoMnbHh8Uq+IEvQkq6VhZHKdc5lNYgjWg+0+wpG0l2n82c0+2yNvGVvna9aPf4yOueF7VOM+Kirl4F6B+FrzbaL4I/kBG6eluuWPxzaLa31KCzW0bVR8HLBdESAbbIzny40hDqGdqb9D/OfMjzjpGV5RuU8IeJV+s2H91g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhLQmB3u4cRwQIieUkNHw+SYuPhG2L+4s4k96tqfNl4=;
 b=fh2fJIYPUKZE2iyE+HqRUMs8OQhfPf22xD2VVvWj0ef8a7ongz+5I1ypSxd2sCx3WC7HzoDaBaRDHZdHmtVIytKXEIUbpbPQE90aR7d68/gNXW64m+vzpGPQkP7Bo4qbeQ+mEB+JQJ22sI2jVIDsrwubDp8ek8Kvw6L0j3R5Jgk=
Received: from AS4P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::16)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:46 +0000
Received: from AMS0EPF000001B0.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::2e) by AS4P250CA0028.outlook.office365.com
 (2603:10a6:20b:5e3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B0.mail.protection.outlook.com (10.167.16.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:45 +0000
Received: from emails-262389-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id A3AF580153;
	Mon,  1 Dec 2025 13:07:45 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594465; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=yhLQmB3u4cRwQIieUkNHw+SYuPhG2L+4s4k96tqfNl4=;
 b=QHbeXV55Rjy6Om7YeBB4XUdWSQzIcPhyXKTrNYC2X/K1SvckuKISQWP1XRsCp578LJ/ZB
 pcPRPP9NGbBflogPTPfbJjMy0w9aSkpCIYsrCfhHti9Cj/4CSDx6qb9CML5QMXtiylgTC3a
 h87jPgdO/2/50p9w1vn5GrD/LZMEgEw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594465;
 b=Njyy9GgeUMiaDMHgSPWOkfssOMQLugg1MrUUY8jR32X2EpYUkTkBISLT64MPwYIvR0Mqt
 WiTJnl2MxB6n+PjZK95UG6thMsI6LchtRdD4bq4GBfYxg6LDXWLFakBAGiuQNlPAOUEUIPN
 P2zcaZlFzKlv6YxtkRQoDPCxVkYI5SE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND9Uoi/F6I1gQVQ5KpJBRhtaZyzM6G1Fgkj3dP+wqmPuH+mtzQlSsgy6RaFJqYwXzSf3n1MFCko3NW7i9JENIFkxEe2oiNHCP8QVyCFcxsS4T4Oi/AtrbY866jHx7AESrRcOCVYTTWDlQyP1vcXMph2I0tUUKeEIzsDvgh4H20zma5sObH6VllWnbiqLmkYeLf8cKIsCQD9gzL1RJJ7aooshBan4oclb43QprDBpttQeshvUW9wlf9y3YqwgYCbV0gAUSZwFWcLYBYwYuWjyNIz4cSmyT25QGsVeV8xrFck+/eN50ZeLsSpDXPpwz+h8XOxlbQ+CTK0v4tuMZBJjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhLQmB3u4cRwQIieUkNHw+SYuPhG2L+4s4k96tqfNl4=;
 b=nB1t/aw7xyZ/Ejn8g2zObBz24DPVIQNSZEooRvnBvRT7d9jPFXYXOSfd0DCaPUd6sAtLkgkZPtLIVSKFlr/egOv+g0KSOh5WOHxbNdU7gFLVsTwphby3IbhUqnpvb2H5mp+EDa4qaUTS2WiTZmIR/CDbWUFCYgUQEI3A1bmvCfXD87uKAFaHamfYtOYs29uRKWflueT89kVUHH84xPmUCPEL3znW+kWWo3kifNjhkUhzDa1huuydH4Ip7n2zvD+PYlBpsldPQusxHtL9upVOwtGAvx4xHVsjlNEIArQIyUiu2dXqOOj/GbOrCW4Ln7SRa+IrZMPPJXsmF5yr6HOztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhLQmB3u4cRwQIieUkNHw+SYuPhG2L+4s4k96tqfNl4=;
 b=fh2fJIYPUKZE2iyE+HqRUMs8OQhfPf22xD2VVvWj0ef8a7ongz+5I1ypSxd2sCx3WC7HzoDaBaRDHZdHmtVIytKXEIUbpbPQE90aR7d68/gNXW64m+vzpGPQkP7Bo4qbeQ+mEB+JQJ22sI2jVIDsrwubDp8ek8Kvw6L0j3R5Jgk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:35 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:21 +0100
Subject: [PATCH v4 2/8] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-2-53a4cd6c21bf@solid-run.com>
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
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|AMS0EPF000001B0:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d11f0e-619d-4418-88e5-08de30da9ef1
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MnBKL2lCYnZtdGJERmxGTHc2NjB2UU5rQ1NnSzdhclhadHRHWEFFZXY5aG5M?=
 =?utf-8?B?QlRyL2FTT0hNOVVOUjl5T3JGcGhEQi95SWNodFgvNDM5eCtxVS9GWTVjTC95?=
 =?utf-8?B?NTNiVmRPQVRmQ0xJL1lhSURWV3o1SGR6RUV1b2lSZ3NZdDZvenY1RnFLendB?=
 =?utf-8?B?NjFHcUdMeFMxcC9yaWt0RllOS2M5VmM0a3E5TFhNc1VyQzdXeWJCK3NsUldR?=
 =?utf-8?B?Z0lOSTlveHVXc3ZoQ0FmMEh4dFgxeTVUd0Q1eE95dFRobkhRcWRjMXk2Qzd2?=
 =?utf-8?B?cWh6Q2ZnelNqK0dQMnZFREdGdXZmdnNHWEk5TGdEVVhBKzZ3c0Z5UWpCQUNX?=
 =?utf-8?B?emw4N0kzUGlka3Z3VkpKRWlvcmNVM0NQY29rTTNtMXBBQnJLSkxOWndZdTBl?=
 =?utf-8?B?b1FoenhhRUxwMW1sbU5DL3ZOQlJNZ01FWG5zV3M5N0dES2ZyT2dhcjJycEIx?=
 =?utf-8?B?dEFFRlc4MUFabFZXcW1PVjFqbFlXSldVamplck1LV09xOHJZQUcrWnR3N25t?=
 =?utf-8?B?dXp1ZnNlRStObHplV3dFY1JkWmd3a0tETkhKNVpLdHQ1L1hwQlZPYzNoVmRT?=
 =?utf-8?B?YW4xSVJ1UzhmWGNhb0VkZ1ZGSmpQU2VxS28xdWVjajIvSGl1RFRtWnNJeWdx?=
 =?utf-8?B?NTduRExXM3Z0TmJ1SkhlR2ZnQjR6SXBhcFpsWFR2anMxck5KYjlDZy8yVEsw?=
 =?utf-8?B?ZytmSEZLOEcvUmtlQXQ3QTdFcmFPVFFxRSsvZWxyT0NvQ0VFOEEzb3JkVk9Q?=
 =?utf-8?B?Ykk5SVJHSy95OVYwVmorZWs3T09BTU5BclNBeUlaRklRQkdzYTlLaFdHbElZ?=
 =?utf-8?B?bVVSb1BjNW1DdU5rbHdSSTlrN0VDeFRvaUF0RlhMMElIRUNtZnBqV3dHSU83?=
 =?utf-8?B?WFR6TitmYTU5WVNNODA2OFF0dVdEQ1V2eWtzWkZmRDg4K2Y2MmNQeE1CRmdE?=
 =?utf-8?B?OGZyMlBQS09sRzVnZmlFa2VSRVVDNldwL0hpSHlvekdmYy93TGFSR0RLRXBn?=
 =?utf-8?B?Z0wrenhjTDBrUXBaOExJVXFPNHZlWE1yc3BzTjdQQXVmNy9OdXBuQUl5ejEy?=
 =?utf-8?B?ckdBb0E1dTFNdVdmdjZiMCszam9zdHA0RHpQcjJDYTdZTWJVdGNLY1RiTUZj?=
 =?utf-8?B?WUdmQ0pYZnlpaEFjdWpVa2duTEN3MEFudjBZVjdUcWI2TFNkQWtrak1PQWpa?=
 =?utf-8?B?N3ZCUzhEVnh5QnVlOVAyeFM2WVI1VThCSDh3UnUyV1VsN2luT2JtVEJ5KzJC?=
 =?utf-8?B?NTdkaTNLZFkzNHdmU3dJQ1BaOTJxUDZLcHZqT24xdk1GTlQ3cjNnRVhjOGxU?=
 =?utf-8?B?OHBaY0RjVHB0cS9yV2VWNEdFcmRpbmI2OUpCWTBFUDZMQUJGb05teVZIU09m?=
 =?utf-8?B?Mlp4Z0lQTXNHMjcxaWZhbCtyWFVYMWgrTXFMOVJRTWRFVTllQ0dXbEhEbk9k?=
 =?utf-8?B?YUNncURqWVBWSGhJOXB0aklVLzJSTTlrQTNqbG5kUE95RlpVRUQ4ZmJxVlNP?=
 =?utf-8?B?STdDWmltNThOS1RPNysxVW1lRU5RakxoQzNCenJBTzU4cnVGQ1pwcWk0N2th?=
 =?utf-8?B?aEQ3bDZwYmpYVDBmY0piMHMzcEVCaksxRDJiVy9NVEtZZnUweFl0VllqTmw1?=
 =?utf-8?B?akFBdnZLb2tnSVBQdEhnVXV4UnAvSWdBQUtNM3R0SGJxYmV2Q1ZtTHJZS09k?=
 =?utf-8?B?SGdMWk82VmJ2WERiSHUrK1Z2UFpuL2l3RGRSdVI1ZGdpRkYxUUhSVVBiZ1JH?=
 =?utf-8?B?UnZleEpMV0ZUMVl4cjFCczErOHNvV2NFNkhpaS8wMlVXOS91djJBSWF4RHNY?=
 =?utf-8?B?SmRlOFA1TkJ2TUlsVS9OV2pOUlRTR21qRi9BZzVjckpmQVRyaThWWnhqckZr?=
 =?utf-8?B?YTU3UkRveXBGemkyVGk2aUtiT3JGNWRKZHYwZDdoeXJVdzQ3MWJZMDdJVzVw?=
 =?utf-8?B?TTgzTmZNR0xvUUZtQVFqdkZOTzEwSlU1djdMOG9kRXJRcU9zdUpiQmprZFZv?=
 =?utf-8?B?ZnorcWZLQU1yKzhLcG4rU21RQ29lR0pDUnJvOHNFYllRTmZ5eWJKYkRDZ2gv?=
 =?utf-8?Q?KR9YXq?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2b273afad9924239b793c6cf7130aab4:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16e1f12e-f2ab-436b-605e-08de30da985a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|7416014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVZOUyt1cDhoZVh0Ny9DNHRDRnBEaitKamZNeG12ZmsrT3p6eEw0c2tlN084?=
 =?utf-8?B?bjhvM3doTWhaRnBxZERiNEgrZ0VRUDRWMlVBc2dYS05PaGpJcmZRZUdzVzJI?=
 =?utf-8?B?UUtwN0lrcTBzVWVQT3FZWDkrcnhwbXNwdE1WQUZ0ZkJDZVVOTnFZdnc3RHow?=
 =?utf-8?B?dE1QaGw2RzFtK2JXdDcrZnUzSGNPRVliR1lnUDR3OE1PaTRlamNtbXhjWVpD?=
 =?utf-8?B?RHpvbkNYT2d6UWRieFRjL21CaUp2UUhhcXFnZG5UMllpRWxiam9kanUwZy9R?=
 =?utf-8?B?enYrOW1hMUFvQTFPQjdWcmRQWVNlb29tNDR6OHY5S1ZybEhBdnY0bFZ1bXZC?=
 =?utf-8?B?OFJZRFVkZUpiQlhVRm9YT2ZIN09mUVVyY1J2RW9mQzB1UGdZNjBRK0htdDkz?=
 =?utf-8?B?UTE5TW92Sk1OWkt4cXFaQ2tQNnRsYUh2dGdHVFJDWVVxaWh1ODFjSnV3Sklo?=
 =?utf-8?B?M1ZwSUo1VnpINWd2S0pPVEZObU5YenJxSWMrNTFySktjbzJHK0gwQ0ZUWlF0?=
 =?utf-8?B?TE5UWWlzUm00NG1xcWMrdzExcys1YWVISG1tb1hlelVwaXpUQ29XVkdFb3Q3?=
 =?utf-8?B?MzVZU1VYMWNxQ0FoOG50MStpNFBDTm1KdWU2eUZobHdvTlNtRjFSaEVWOTBP?=
 =?utf-8?B?emxMRVVPT2ZvK0hOSHM4NTA0TjhxTG8xUnU5VTVLYlMrK0M1RUs2Vks0UnNB?=
 =?utf-8?B?YzY4Qk9iVXk0RjFQZTIvM00yak94ekRyV0xYUE9qTFMwRmcrTnk2Ni9LOFRL?=
 =?utf-8?B?dE95NWRqR2Jyblo5ZDNrelUvMkhWQVJsRHlGMUlvNjBncWl2Y3h5STNwdGd2?=
 =?utf-8?B?VlBkaGJRYWZ2elptL0RLa3F5U3ZNaVlNVlFWVnJHL1lmWWF0dEdjV3NNRE1s?=
 =?utf-8?B?aVIzSjJscklyZ0lucFBzREhaSm1QejFQMStMaHYybzViNnhlWnp2THZIRTBN?=
 =?utf-8?B?b2VCQStLVGttSWhOZ2NIRjB2NDJ4bHZPSitOQVA2TWsyaW9MaFlJM0pUbEJT?=
 =?utf-8?B?TmlxSWhBajdNM3BWN3VKVmxrREZiMlhBMklqczUxTHhqb1I3OXJyZ090Zm1C?=
 =?utf-8?B?K0NocnFoOE9DQ3ZHZWJ6UStwNWE0THkwVElndTR1bFRadHkvbHA0cnJtZ09F?=
 =?utf-8?B?Zm5IdVVia1d1eXpvRllzVFhFbHQwN0ttcmhyZU4xVTR2eThpZkQ5ajlkR1I5?=
 =?utf-8?B?UFBEN2FJUExhNkg3ejN2aVZYdEtOUXJwbzA3RG8zSVFTWUdOYlZLL3l5L1Vk?=
 =?utf-8?B?NGZUY1lxYVpIZ09PNHd3ZnA3MURaQzhOTTdVQVRVQTIzWnhHN3R3TEIvb2xq?=
 =?utf-8?B?c21lZVQ0NXdocjVpUjg3RndKUlh2REJGNFgyVlYva3NtL25nYkZpTnF2TVV2?=
 =?utf-8?B?ak1QcG9sZFRBNGZrd1RocDZUWHIrRkxtdUE3aVQyeWt4dEYyUFJjWWNuQ0VO?=
 =?utf-8?B?dnBLU1U4WDdBUFdPQjRlME1sbU9IRVd6dTM1TGllUnN2UXJqUFE2bTluM2dK?=
 =?utf-8?B?YnRHd0RkS3pvWE0ySGFQQi8xTFkrZ3VvK3UrcHFUbXNWa1JhOU1TVEh3Y2Zq?=
 =?utf-8?B?bTFxVTV0U1NMNnVjSXlaS2g4YWpqOXJwRkEvYml3elpjbTVFYU9RVUVsNmtF?=
 =?utf-8?B?WEFZNUxGdXUxblNYN3BiNFZjZ1hWOWp4Vk15VC93REFVR29VYlRHYWh3cCtk?=
 =?utf-8?B?aldhY1hTZGNjUHNDc3Z6SGJ4R2VxQzZGb3FNQW84dHc5SjRJNTViYmFZUWcw?=
 =?utf-8?B?VWxjNUNZWWVCemZURVRFcEltSTgvYkxRa2hDeUhKWjZHZ212aXZ4ZTRlRU9p?=
 =?utf-8?B?VXVKRW80dll4bWIweTU0dVRtZWR0YmtyZHBUM2dXMHNCRm9xZnNDUnBDM1JO?=
 =?utf-8?B?SXFGZGlUTk1TZGpSaGVpTmFsckpiUmQrREUxazZscVZpaERKWFpBOVFkMC9q?=
 =?utf-8?B?d3J1UCtTays5cXRHbzM3ZDBhNS9jbE56aWVXK2JtS1FIZmpiU0RLNzNlaVZ0?=
 =?utf-8?B?VFVFbTJubzBTd1BFYVhlRE51ZHNSWXdFanhSa0NVYUpDb0JObExPdi94bU1n?=
 =?utf-8?B?SjFidHBFbHJ1NXdVelVjS2t2TS9yS3BlZnVDTzlHOXU4cUJCNFVBMHJTcE9I?=
 =?utf-8?Q?9T8A=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(7416014)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:45.9800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d11f0e-619d-4418-88e5-08de30da9ef1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483

The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
function for reset.

Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
support GPIO providers that may sleep, such as I2C GPIO expanders.

Further switch the mdelay calls on the reset path to fsleep (preferred
in non-atomic contexts).

This fixes noisy complaints in kernel log for gpio providers that do
sleep.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index 0dd632724a003..10e5530d6a5d0 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -396,10 +396,10 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
 {
 	if (ts->reset_gpio) {
-		gpiod_set_value(ts->reset_gpio, 1);
-		mdelay(10);
-		gpiod_set_value(ts->reset_gpio, 0);
-		mdelay(delay);
+		gpiod_set_value_cansleep(ts->reset_gpio, 1);
+		fsleep(10000);
+		gpiod_set_value_cansleep(ts->reset_gpio, 0);
+		fsleep(delay * 1000);
 	}
 }
 

-- 
2.51.0



