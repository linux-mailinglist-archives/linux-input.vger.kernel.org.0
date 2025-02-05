Return-Path: <linux-input+bounces-9778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93394A28046
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 01:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E253A7192
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6909522836C;
	Wed,  5 Feb 2025 00:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="geFRxdle"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B05227BB6;
	Wed,  5 Feb 2025 00:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716368; cv=fail; b=FxnAKaYUu/xnGilaGp6qKQ8iZMPK7sk178mHE6pXDCYupxvZCPBDoo6Glm5UGvBSoP3fROvDzByD/6DyeQdIc0+PZ+TO2jR2xiEN87n56K3x2PVCPSGkfFbFcIOuOU/IRhHX07EgLDY7Kf00fL8XZ9rjo8/jWvcCML7t8n8LSrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716368; c=relaxed/simple;
	bh=f0XWM6xBggK2QfOcHzd3+B2023F378UQ/qXOqelOuSw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z0QU7fy76r9g4DUMoazpn/fCSLoOGvhdoadnbs/5Y7VHMeMQhC/hdnuJVKvAuYUcTKhBt9b0cXElE6OfWXzTWoAyoXQAg8+kD9AlmKVxhRv/V0H72EdLblsuYhDYA2CXVcFafXZ1qt/HqhyGtHqmaLu0AMhuTCaTJJlF1egVNms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=geFRxdle; arc=fail smtp.client-ip=40.107.249.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB7u4a6Zjh5aWhc/79HcbZURJBkQ9KsioXjOPqfthwvalAq+kYHNyfEtumib1leQS5DQx5n8iFPGauZWsxj2Tt5CSDZFtapS/IquMmJgbybEosmzRy+PhKzr3DqA0YgQdyDIKUuc6mfkPD8sPA4y9O1UYn3ksx5ep5Z2f2QyMexzreK1EviB0+O4iiD2tEkWdlncBGW5nP0uXYYj4+2ZHUm1BKnatcuEd4ALRvj/CeYPif0fTWEPZ7ZgmFz4bsOnUfBRHBZndUgz6l5KSiGSulnrDpyxDIMwI6GwGR3sdFZcBiq8UO5sEDKUkoRd2SD3XCrsBM4LHWf3uVgZXc2ALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBJXBX/BlDu3iR52lDbc09nZRQMR+H0jkQvpTPg3SOY=;
 b=qDydsRsO5Cfw3c2lKbkmnaG+7UihFE2gbyIY6tcDfN+3zHhjuGtwqQC8swd21HAEuwKdndtbaZEEap0qGm1ccOzgLDFAeZmJbJLFarcK7AGHQdTuM6FyrXp7wjQrITxJ4tPL8KRjaimdCaNfDmro7AfY3wLGSRoeyoRGlWLuEaPQH5TbnpPjN1O7yWgdNS7U/KHnuaQRPizL3PO9qR2TiXxUkE9p7MrjlZvilsPt6AnkmSG+LfKhKe7Kapw3qUmiJm+QojBjpXf+0TqOzn06i6yRpD+VPcvcSZApqmhoOxxtVl1EF7J8PFou4QBZFrcxcqJoS7xYG009zyw6iFqvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBJXBX/BlDu3iR52lDbc09nZRQMR+H0jkQvpTPg3SOY=;
 b=geFRxdleOnkCybpV4Z6Z8p4v3vzR7ioE0Sw4PRrYpkycTBaktIfDNJZtL7JHEidXmX9rjIwW1bg8TSFU7B5WOt1loDcttg++x1JbxXgvrZwxcSd6P0tyItGHxYdXuWogeNNpSHWSKVYFmQqGfMF0jeklzB8WIVnfwhsfXcI0/9Qf1oyt0qQyCY8ut2zVh0EmOskSAlIMVJ5LpGe28oH9LllmmQYV/SwSp4Iysd9KHFiB17z92TwSDSHfJiESLT7tHTfAY1mtBX0DDKYOsRmwkuK+syh+YsY343xBF2XiDQ3Vraf9zs0mmgJEY0wO8kPqToWksQ+sBHmD16IalZI3qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:46:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:45:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:45:14 +0800
Subject: [PATCH 1/4] input: keyboard: ep93xx_keypad: Use
 devm_pm_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-input-cleanup-v1-1-9758898ff8cb@nxp.com>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738716321; l=1402;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=lLk6bV9Q4qc+HUdwJdc/NyACnoatpwVUWdW9RwekWXs=;
 b=7zL7i+g9ZP1bfjG5cTwXQOi1Jqw3NcS0dh/V/mXAJHhl3OreOjEha2JCLQEuaWf1dNlcjcKUn
 C/WGQf1YU2oCY6Anm5IS3G7QGNuC8NoxtpvW5c2pzkeO94aFazjfUZb
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 179e77d8-108d-47e0-ef2c-08dd457e7596
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3NtazBCNkx0VnEyOFI1VzdyNGVBMFZ5OXV6WlVmbmNOQi9PeUkwcFo4RHg0?=
 =?utf-8?B?SUZNWFZlYm1sY203aDcwcE1iaklvaE82bmVrRDBRWnI4OUYyVUhmTDdQVlM3?=
 =?utf-8?B?MUwxUEFhYzBnVVhFMDhXRmJ0d3RrYXFlQWs0bFJvbEpOVk5pRUd6bXJaRTVo?=
 =?utf-8?B?YVFwbHBEeEMrK0Q1S2d1L3oxdmhqMGlacVlJMkhwb1hxaCtjQ2NOYjBocG85?=
 =?utf-8?B?bm9HTkpKRldWOHZPWlY2QW5aT2NScCs2MmFlZW45NU5TOGtLS3VwUVhaK05a?=
 =?utf-8?B?NlRuNGtSbjBPSWtrWkVqSVJBbWI0Zm9CWTZtS2FlZ0RWU1FjMlVhcU9SL3dq?=
 =?utf-8?B?MUZ2ZmlmUFFsODU1NXFDRDNwengzdlBOSVhFNCtsZXVXeXZKMEJVTkt5TnVz?=
 =?utf-8?B?ZUNRdDFtN3JtZWRGVDNFSWQ0R0tSNXltUno2V2tsU0NLQ0NCTDl0SjJyMkR2?=
 =?utf-8?B?WVJ0WFU3L1piRU5oZTc4YXNPV1FyU2ZZVyt0ZWxSUUdaczJWNmJrUTUrK0pH?=
 =?utf-8?B?VGMxSDU5cGdFdERRZE5ZVEluY2F5RXJxY21JRkpHSVg5d1lNcGMyamdvL0R1?=
 =?utf-8?B?SXR2VkpzWG5WZjc1WjhxQ0JLemRpdTdHMUV2VUQ1TXdSaEZocFdweXFjeDdj?=
 =?utf-8?B?MVF1L0hGa2d0ZnhmUFRHelZOcERpT3hQMmxPYkgySFVtMStsdnJTMHBabk0r?=
 =?utf-8?B?VU5ISlIxZ2JlK2pTc3NhTCtZc2o0OU5rczNkZ0RHMGJ2WUo1Yy9QckczdUhF?=
 =?utf-8?B?S2pteEVEYW05TFpzbVorRUpZWkRWUFp1MUFPSTdnRVFiN29ybWQwb0U5b2NX?=
 =?utf-8?B?R1dUSENqK0RWaU1KSGI2TUIxUVBTc2J3M1BCOC9hL3RUTTBlZTFMSnJPNFl4?=
 =?utf-8?B?SUt1RGFlMmVIUzBlRUdvS05PTEdYdE1SZUU3QlJzZk9EVzR5citNZ1JzcVdR?=
 =?utf-8?B?b0I0QXNFOEhacmFLT1NMZTJtN3l2bC84UWpQMVFhR0duOUJEREYyZ01KSDdI?=
 =?utf-8?B?YUdUUkYxblRFS3E5YmJsRlhXVXBoVnA5dVBmU1VmcWNyc3R2eGs3VGVKTTFx?=
 =?utf-8?B?WmtociswVVRMeUNkVmNDU3dqTU5wRnZjc1JGQTNsQ3dyWWNyNzhDdDMyTzNu?=
 =?utf-8?B?UExrZXFjN2hzRy8rRndUdHQzZ3EyLzZ3TnRFOXFPRi9tT1hGOVRyRHZ1Zi9T?=
 =?utf-8?B?K0hUMGYrc2x5a0FDYzc0bFFYcDYvOFErbHdMM252b04yaHJOQmFENkFwaHc5?=
 =?utf-8?B?NUtSTnVhbS9ZQVZPWGNhYnJOcXV2Q0M3Y1hjUGYwemFTRHZoQ2VQOWRvWnBi?=
 =?utf-8?B?aGpxNUpHcmd3SnVNRzB4eW1ZOVpUQ09Zem1TRmlVRDFHREJBbG1wZ2dSNmJn?=
 =?utf-8?B?NVcvRnVSLzN6YVdXdEsrZXYzYVI0UU5TaGpVMm1kLzh0cDRkWDFQTUNQN2pK?=
 =?utf-8?B?d2xCMExzNk5ZUGJXNk5IVkVTcVo1Ym5JMWVyRlBrbGhyTEllRlBqb0RIc0Z1?=
 =?utf-8?B?YU1IK2NaazU0ZWlOOXZjMkFCUWlSbGNnZUJOcll5R3NCaGRBazQ0ZGYrenpy?=
 =?utf-8?B?bUN6UzE0cFF5UXQ4WlY0UkJFUkpCZU9FdDd1aG4rSlhrTG16cThaVkh2VnNx?=
 =?utf-8?B?VHBhWFo3SlFlNHJuTGRSZ2VpbFlNSW5kVzJFQmx6YUk4czdIV094ZDE2d1JV?=
 =?utf-8?B?bDlkSzdVOWRhRlNjdWpZK0tVNzZiaXplYnE1TkN3Zk5KM3NIUVNBY3BRRERj?=
 =?utf-8?B?c3RxOGMvaFFNc2VOdTRzdSt6dnlSd2xrQ3BQU2d4MWtHemxycldYQVdKRXR0?=
 =?utf-8?B?anlvZ3dZcUdLMmt6TVZ4STBjY2NDRzgyUzRpWUk5Vmo3bEFQd3RWNHlwa0pI?=
 =?utf-8?B?SkU5a3lBT1pkL1ZjbERYMCtzeWRDQTYwWFF4R1EwcUtiODFwdlM0bUlrUDZ0?=
 =?utf-8?Q?7vIjEJ0yaaVt+D46JCIiX8daBG2bWKFF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGtVM0VIZDZheTJodVFFSktxWXhHRjZyLzY0bWl3d2MyaFYvNWVTMEZsYUN4?=
 =?utf-8?B?d0IyVm1xMkpsMEU4SWZLZnhlaWFuRDJGZmRXZHJ4OXZ6V3gxWkp1dmFjRHNk?=
 =?utf-8?B?bVZzN3ZUaWZQeTU1bFluaitaNjdUMHlFODBZMXVBTmFIajYwS2oyd1FSRmJl?=
 =?utf-8?B?V204Wm9ncWNXT0dMRVpxNGk5S093WmQ2TXB6Njd5L1R1bkJkQ0xvZkZRTGd6?=
 =?utf-8?B?V1piNDJsUUR3RDE2aHdDdTVMRUUvOU9lcVU5UDhuSmtrVCtYT3k4ZHBzYlhJ?=
 =?utf-8?B?SmRjMFk1Q0tURVNZcWFpdzhRTE1Da0g1Q21FYWtSWGRDaGI2K1hJRDU3UHI0?=
 =?utf-8?B?NUZGS0NSTExDM2JKUWkzRUdpKzgwdEQwbUNDQW03RmpzaHByc25MRVBrYkJX?=
 =?utf-8?B?ZElwV0dubzRQZkZYNFl5TjYrY285NjFTVUVvRWRuT3gvR0lMbnl3K0IvSmJG?=
 =?utf-8?B?NGpvdE9KTUx1ZGlLS2hEMnI0L25teTdFWlU3cDZhb05QZ2d2N3lQN2c2MnZY?=
 =?utf-8?B?QW44RDhGM3VWU2MwL0pTVVRZZXA5enRpZlNFWXJwLzJadi9yS2Y4STUvVVg0?=
 =?utf-8?B?eVY1RUxyejUwUHdpUzltTGxyNEZEUVM3Wk4vblV3M2x2QUdLY1U2ZmdPcTJB?=
 =?utf-8?B?VVg1NlJhUUZaZjBITi8zREE5c3Y3NnBqMEdSdFJEMUNJUVl6eGkxNUpEUUd5?=
 =?utf-8?B?b1ZFY1JNK3Z0Q1g2UFlWWVlVZkJkVDNZVVQzYlZYRXlMWEdScnBVNUNYNmVY?=
 =?utf-8?B?UEpIYnhaWG5LR3RpQzZOR0E3bTBRczdDS3E3Vk9UVmZmbEg3eFh2dE5Xcm9K?=
 =?utf-8?B?cXJQd1VSZnZWeDhxazgveDdGWndtWlNkWUpGeXVCMW1GKzI4WFdCMkNnekZI?=
 =?utf-8?B?MTZEWW5HeHNVMGowN0g0QjV3eXhaS1Z3SkJacGN1bHpPLzVid2JPY2FKNk5F?=
 =?utf-8?B?Z3UyQ3UzYkhxd09yV2JkeFA4THFlUWl0SnV1azA4dExNaGsvbnQrMlZ5ZStS?=
 =?utf-8?B?a1ZGMGxuMUhUb3VMbDZQUTB6RWhLNHNXRUxIVGZOM0RjT3ZReExKdkZ2dUk2?=
 =?utf-8?B?cUVObjNWSkFFRTU2R3MvQVhveWRIS2xmckZWQytyaitrNUNNRlltd3IrYTky?=
 =?utf-8?B?eGJScm5yMXNlZ3EvZGZJSEJNUkI1ZlVDTE5Fd1IwSnZLTnlvdEVQcGZMNzR2?=
 =?utf-8?B?OXEzNDhlNHlmRndabWh5VEZZdDh2WkFxd01QM0txRkdlMzh4MXRyMkVBeG9y?=
 =?utf-8?B?VTJ3djBtTGxpZDJxbDVqck5mZnhEc3d1RDk0VERGSVJ6dElPaVE2M3BpVVht?=
 =?utf-8?B?czVzb1VycERENWhlUEQ1MzkyN1dKL09NbmZaMXQ1R0FWWk1vOTQ2T3RDM21V?=
 =?utf-8?B?THQ0ZElOSkRaa1ZSd2xiTTIvSVM4Z2NFREo1dkNPdmtNUHhXQnFDZmJPbS9r?=
 =?utf-8?B?NFhQUmt4WjkvVzJhNVg3MFpoeDIxMVV3NXpTdVdzMlFoV0dzQXRxcXpDaHkw?=
 =?utf-8?B?Wk4xNzFYaGJHTkNXUHFQM1ptRHdqZlBybnF1bHhUdHJOZ2VOWlJxN3FycHlx?=
 =?utf-8?B?blJhM0tDSnQ2WnUwQUdaejZlTElhN3I1U1FSSS9BMXRqYm9OWStuUGJESnhp?=
 =?utf-8?B?a0RDV01OaXZyVm9tblJBMHB5N3o5U1kvL3Y4eFVrSGFYcjJPanhWb3p4MElD?=
 =?utf-8?B?OStCc2lvSGYxOUs0eDM0OFRtazV6TG53dm9MMnIxOEZPemk2WGdQc3piZUpH?=
 =?utf-8?B?bXNNN2p3dVVKT01jMnd4OFMyL2xTYWpVVW9BbnAvbjI0OE1nZDBPN21QTlFG?=
 =?utf-8?B?L2NwaHcxb01rWlE1M0hSbmRMYm05MGVvbUFHOUphcVA3RFdIRm05SFQxODJY?=
 =?utf-8?B?MG14aTN3K1Nka2JsSUllT2o4MkROeHRLajFjVVIvYXpkQ3ZMcmZtNkdlZWh4?=
 =?utf-8?B?UDdUODB5NFR0NXhFQThsd0VicS9pd05jakIyUzJPeU5vcHV5eVZPZDgrK3Bm?=
 =?utf-8?B?SXUyN0ROdlpXWGxJR1FUUlNhN2sxRGNId1VyL1VONnFsdkhsMEthaVhjV2Ey?=
 =?utf-8?B?MWcyMVVTcVNhZ2tUaW5JeTYzVk1ucytzYjR5VFhSeXo0UzdXY2RlUnZJS3V6?=
 =?utf-8?Q?tUSaGYi7P3NpN6+LdsqzMbTMO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179e77d8-108d-47e0-ef2c-08dd457e7596
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:45:59.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGQINNCJDYs2ROk4RU6kG3+w4hZtZa6FykF7gGSn0TbHSxskcz6ky/kcvLLO2CTPpgi0mPczcvM72DRPZjUjsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/keyboard/ep93xx_keypad.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 817c23438f6e5176431e1f736bb511f9919b67de..6e3cbe3ca72dbd43485c23f6042b4fba007ff5e6 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -260,18 +260,13 @@ static int ep93xx_keypad_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, keypad);
 
 	device_init_wakeup(&pdev->dev, 1);
-	err = dev_pm_set_wake_irq(&pdev->dev, keypad->irq);
+	err = devm_pm_set_wake_irq(&pdev->dev, keypad->irq);
 	if (err)
 		dev_warn(&pdev->dev, "failed to set up wakeup irq: %d\n", err);
 
 	return 0;
 }
 
-static void ep93xx_keypad_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-}
-
 static const struct of_device_id ep93xx_keypad_of_ids[] = {
 	{ .compatible = "cirrus,ep9307-keypad" },
 	{ /* sentinel */ }
@@ -285,7 +280,6 @@ static struct platform_driver ep93xx_keypad_driver = {
 		.of_match_table = ep93xx_keypad_of_ids,
 	},
 	.probe		= ep93xx_keypad_probe,
-	.remove		= ep93xx_keypad_remove,
 };
 module_platform_driver(ep93xx_keypad_driver);
 

-- 
2.37.1


