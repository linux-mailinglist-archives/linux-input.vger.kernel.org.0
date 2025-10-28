Return-Path: <linux-input+bounces-15787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45042C16B5D
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 21:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775E71A68361
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 20:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC6C3502AB;
	Tue, 28 Oct 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E1JjsQor"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959034FF56;
	Tue, 28 Oct 2025 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681711; cv=fail; b=K+PY50A+0+P3i1YYStpupHie2bvH5Lnj4eMMfxnzvc/zZKEs1MImxrFuf2Df3jzkYIyLQ+T9LBodAdh9+WQlVWJD+lFekIVYuwZXH2WKrCSj1Qi3Rwxynt+LFRLj35ymEhQQm2xemDDNqAG8uehn8N1t74zZDmH6sObbVSrosgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681711; c=relaxed/simple;
	bh=97a1zIi0T4Q/AHMO1+KfKvSPqI9pHnctOxpiv2gCtKE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AE2SC/pMCvaUnvlMybmgGZFTysVBb94EF3ANwNXMfDdv8sGFZr+6h/QJlWO0I5PaF3rtoJ0j7hUmdoGQEsArIAJLqD9wmwGKMjmsveHVer/MMop8ZHbe0/NXFzx8QlwPAoZ2+H0IZJOMA8DytokwQe4G86t+C83ni5ZDB0YZq3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E1JjsQor; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSuRPesQuLUv6qgnqXct3Z9si9e6QV5j2Z0P7aFdHAnySoDsrRnUveARqYYSFIdbGqXm5VJmSX1ggGc691x2mtZQt13BJqkxi6qAHKNM7dFJ3Xb6YAqzzubADfRHWj8uzQsp5oykXa0xHpDFToQ1zASXhuVCNMehXgk2bqA1Mi6MQdG3TofA7rAEGPXAeEt0ac01XCLt6P7h+Su3a6lFpxub4MpcC8tWzLt7MPUqXEq+aTBXQTOzUHOdB42MzuTSBnN0uCSFp9nznrC/+trOemATV7eXHUEt0WrLaRWuH8q4DQZxzCkVJkTCTTEoDzPOi8FHfwqkN1GE/HrFjyjF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUYw9L0pJLLWZXMTqNFeMnLqprMVFIZ+QIza8JH4jQk=;
 b=k5uye3BgGNs1ER4wRuZS9TwZ+GRf67CldELsBOVuPq1mLq5Ge3Ajo88QnR4x7ARIJhpWvIlXncX8AgATG1oNdkrigOXNms6dATQDtJgJob5uoCzT6oD4hfoYBDQRMiouP5oBnd71nP4TwXEMOMcmvcEhZaGkHtfJ/BUeocbw12N0+HRSh/+z1XX5jdhDivglnw8/jOUynZP1oxLerxsEwCdWZp95rTGE2KXEob+SJFjMqmO57fCwg6Ah57eHSS4B59y8xgBKKA1vDdW+tvLCsMb8Fhlj+DVNzAmk5QpVRTWiUUt+dooe2DMpbAsLe3FB74pqmPenp4EZ5tPFUzQ1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUYw9L0pJLLWZXMTqNFeMnLqprMVFIZ+QIza8JH4jQk=;
 b=E1JjsQorSAU3dQYr6cDJI8Hack6oIEhOaeTdNZuXG5fdWb+wvjX4wzEMfAQSELmjz0AnBsHuHE6posK4Po04epcLvKEcYVvPVS3REEgSLkIHGF3R/HFo9HZ4Eigx/zHOibDVVLpoeJY4qxtqDLoRTdTM1CFKFgoxOnK3qaEnCt5Dc+zDSaDnHWMkl5TuKCAj3r4DWxgz7A9FLFq0/uCSJl1kefHi4S5ZeHPO9nfHJDFi9ZpN+nb9vohrScGJtTGOOBp7xptvvz8FgrguEziV+8d0So70wu3xfXlClCv18Mo/VSS70jRMTMq7T+U+QqCMCAaF+R2+UfM0EGcJpzQyOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:01:47 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 20:01:47 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 28 Oct 2025 16:01:28 -0400
Subject: [PATCH 1/2] dt-bindings: input: fsl,scu-key: Add compatible string
 fsl,imx8qm-sc-key
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4_qm_scu_key-v1-1-9732e92a5e83@nxp.com>
References: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
In-Reply-To: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761681699; l=867;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=97a1zIi0T4Q/AHMO1+KfKvSPqI9pHnctOxpiv2gCtKE=;
 b=y7vHTirecFwiJAZ1KHc0iVkafJvi7pVzTN+5NN0UvxaQahkInnFOZ/FonM00ZZMMhdA68Wy7i
 oMtqJqqka4DAR8rFAX1tv8sWXHAfECj0yeLjk6ErXEE28PRNfd8mSKn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: d73faabf-ad7d-4f02-d248-08de165cd349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW5Qb0I2SDJSL3I1TXI2ditkNjhENHFrR3ZlQWdoS0lyQ3dwUG9DeGJIWXNk?=
 =?utf-8?B?eGoyMlpKMWROd2tyVVF1WUlSTzhSZ1dObUpVUjRTT3I4cFRxMWpLazMyYWxC?=
 =?utf-8?B?ZzYzYkZFWkVQb1RYdWVsY1dOZVFlT2prQ2lIUmFhL1JOMTNnQjRXSzlGQWdK?=
 =?utf-8?B?WUpwUVoyUE12bzZ1amY3TVBpKzhJU1I0TXBWeEMzMWdIejZWMlZSMTQwZG5Y?=
 =?utf-8?B?UDZFWERzL0J3ZUJ1OGE4Z3lLOUZRWlBQWHZjbmFocjdqL1VzZ01CTWd2a0RR?=
 =?utf-8?B?b1JiY2ZlZWY5RGY0MTJTSE9hckc1MEdMVEUxYmQxc1M5cy9qL0hyd0ZWQ05S?=
 =?utf-8?B?SGhCdmRuM2lYaC8vNUJRU24ydC9iSzQvUTMrdzlpaUc3S2c2dzY3U2dCamR0?=
 =?utf-8?B?U28vbmpwbzVvR2NsL2Z6ckJrL2orRzRmWjBlWjFEOE9na3J4ODNQaVBBbVlo?=
 =?utf-8?B?TE1wQyt6aVF2WTIzYmdIVXh3U01ZQWJTRDRZbzJrU3d4bnBYWHUvWXVpRGNL?=
 =?utf-8?B?WFlVUVpTM09WMXpSNlBEbWFnbHRBRElBa2tQTXNoS2ViQjF5WHJtazdwWVZL?=
 =?utf-8?B?K295RXd5SVJIUmhTVzNRRktnU0xKdU42UUptcmdxbXlrbWxCQnkyaENyMFg3?=
 =?utf-8?B?YUx2SHhEZ2ltV3M0cThQcEk2YUNhODZsWklIUDJmWks1ckxkUG50dlJHZk0w?=
 =?utf-8?B?ZGo4bXEvbWkzKzRKVUcyOFdURFRNeWJEZllLKzdkMDdrQUluQmEyd29xWnMz?=
 =?utf-8?B?eVFEWDZGb2FMV3dsNld5S21GSUs3NkR0bGRudS9veUZnWEU2K01OeFkvaWdH?=
 =?utf-8?B?UVh0N2JqZElmV09uZXY4cmtQNlNaUzdGZ3RNbmF2aStIbThPRndnYnA5Y0RL?=
 =?utf-8?B?RGN6aGt4NjZYYllTdzN1MkNjRG1UbnZrdm1xYU9WM24wNE9XYXAvYXZtUDBu?=
 =?utf-8?B?UjNndHRaSy9HVlRWVUdnNUlYSTBTVk53d1BvVDlzWFVTa3ZQanRyTjRPSWJV?=
 =?utf-8?B?R2JBTE5zcngwMUhNMGZzUXdnMTRIaUFwNHRDMnBWalJSL0VlK0tjYitpYXlh?=
 =?utf-8?B?TkQ4UEh1c201TUFSaTlaV0JscW1wd1NKbU43TmM1NlJqUXZkbEhmNGY4bkNz?=
 =?utf-8?B?dzVLM0NCQnhFdldEajJRazVYM1ZqTDN2NlJEd2YvYkk5RFRwQUNvY1l0Qlh0?=
 =?utf-8?B?NFdXWHNqVXVMNmtQTGVrTkx3dDRYSWdxQWpTSFV2VndabFRyZmNjdXBFb1pT?=
 =?utf-8?B?c3FZeDlXRldwMWpqeUZNbWI1MjVBOEhkTkxIS0tXak0yOVIrRko4MU8zREtu?=
 =?utf-8?B?ejVYWXk1aE5CN2NxdWRhNzNpS0NFYlhMTWcwbVZFbmpJa3ZCTUFkMGRjb0RF?=
 =?utf-8?B?MS9zTUNSTU4vckhMOUMxa0hzVHNTUGxGQ0VuUjVIUTh6aExkRHlaQXpzalMy?=
 =?utf-8?B?b2VmbEVuWXUxd1dFY1I3ajAwdDJIeGpoWUw5eEgyR3RuM1JGdU5mWVAvNFEw?=
 =?utf-8?B?YTErWlc0V0pqVXByeUc3R0JsalRsK2RJZG42Rlg0Z2hPd3FaN2FQSWlFWXhs?=
 =?utf-8?B?NFU1dHR1Q2ZkdnUvQWRlUFIwblphS1ZHUkhFZVFTKzdMZXZIdzZSSlNIK3Rt?=
 =?utf-8?B?em9BTnlDeWxTbGRmTHVWcHp0dVNtRmNPWmtyM0VqanppUGlWUjhnWFN4ZytE?=
 =?utf-8?B?bTNvbGVEWjZUZ21IREcxdGRDaUlsbkkveExiNmN6dTJkQUhEWXozTnRsRHlz?=
 =?utf-8?B?cVUxS2JubUxJZWRZcnNBNjhqZ2tDRHJYdHBtT0JtTitVd0RJOHRPcG5BRjZ4?=
 =?utf-8?B?Wk4xWFpxMXdwRlM1eE4yQVBOamExcjVRL20vd1Jyd1VIMmpxemdVUXQ0bDlX?=
 =?utf-8?B?aHRFcVJLQ0hFM3E0S3AwdjdxdFVUY0hldVdzaFZzQVplekVVbnNpdEE4S0R0?=
 =?utf-8?B?bC9wZXlTVHNGZE80QjdGQWNEc1luelVkcENrdlMzMmVrNjdRTllNQkZId09m?=
 =?utf-8?B?anUzTVB6VTMraXhRemhnbm1xTXp5a2FTQzBQWTFLRWZqc2hRU3JVWkNxNzRZ?=
 =?utf-8?Q?w+UPMO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWZjRHVGWFhodE8zUm9SSnFxU2ZOYk5vUTRyVlBsY3RveVdjVXpGRXJ3dTd2?=
 =?utf-8?B?K2pad1JMWEhsdmhiTjYzWVhhVmsxS0lJM3NqZDloUzRQWmw2MGRrZFNGMENO?=
 =?utf-8?B?blFPc25TNGQxOVhzUmJFU1d2cnQ1c1ZMY1pobGJic1VNMFpJOU93aThFYnFM?=
 =?utf-8?B?aEZpakhRbmpGdWdTV1BMT093eUtpSnNQZUhIMEVSbjMzRmRTUTk3eXc1V0Fa?=
 =?utf-8?B?ZVdKTUN3dFNqc09uQjBaRUsrV2FBaGNWK08xZEJ1SWRLNHJ0ejJHTk1tNEls?=
 =?utf-8?B?UmdSV2crNERlbUY1VjIzeWVaTitTVjFRTVZlWEYxV2JiWnVmZDZrK082T0wv?=
 =?utf-8?B?U0poSVVob2dxS2lVTHV1Tk1qdFlKTmNxcUg0cnpabXp3b0preS94TE5rVmw2?=
 =?utf-8?B?T3dsT3FmQXBnY1JOdVZnZzV4U201cnowaVFUaGxBbGtmbWhXVGJmMXlUVXph?=
 =?utf-8?B?VmtleFJpQndPMm4zekZ0MkZlREZrVnBVWmtBMzdFMFFnVTdEZ1lHR3dvalR0?=
 =?utf-8?B?NlBNMURoakswRllhMVBJSEUxQjFWalBFWHh3d2RPVWtVNldIV1B5NEQ2YStL?=
 =?utf-8?B?Mm1HZ3A5OXVpTVJmaFlkdW5GT0JQTEtIWmVQajNIWDFYS1V6dGRma0NZdEVG?=
 =?utf-8?B?NC95QU1jSXZXRW4ra3QvU3o0Y3A4b3QzOWFxS0pjbGxFMHl3bE5pMTBzaWtM?=
 =?utf-8?B?TWFwd25mTTJYb0x3QVJtL1VXK2ZDaHBVWW5YNEdwMnRZbkwxb3haU3AvOWRP?=
 =?utf-8?B?M1JZOUVKdHdQVldaV3NnZzA5U0J0QlNHMFl6U0lCRlVMU052RktGZi9YQ2ww?=
 =?utf-8?B?R3ZEOUpONHQrMGdRNW9VNkpicUVZbVZpek95MzM2NjgyZTBYb2wvT05HZURm?=
 =?utf-8?B?dkc5LzRKQkRYRDk1L0Fodm1FbWlObndCZFJIc1dYTG5helI1alFLZFczT1Ux?=
 =?utf-8?B?d0pWTForMTVTelR3Z25lMkFadTg0MWNROG5yeVNyS1BXaEZpK1ZRTXJINTRF?=
 =?utf-8?B?S0cvdDE4NTVmUmpvY0pyeDZVWUlkVEowb3FVWHlyYmxXR1ZnMjRCU0ZCb0gy?=
 =?utf-8?B?YjNjdnVCc0MzVDRJbnRBWEhxUjFtWkdWTldnSUZKT0ZPdjlza3d3RlR2Y0li?=
 =?utf-8?B?YTE3aHlHeDkwM05QZ1NibGp2OHMwUk1vU2Z3eVNuMi9ONDhaWEZvcFhwYlZ5?=
 =?utf-8?B?VFVTOSt6VXJNQk5QamYvb0ZzYlhRTnM0Ym1Da2gyTUpwRmRTU1pXVGRSbHVa?=
 =?utf-8?B?K1FwVnlrbDdxYVR1Ry9MbWVka3NUbElmclNDSktaSWJvL3JOZnAzWHZVaGNG?=
 =?utf-8?B?S3BMZ2ZBUlFtY05VSklKVDN2S0x0dHdheFlLWUpMUzFYQWZpSXdpbkVxcVVr?=
 =?utf-8?B?QzBySlZvcHNBK1lYYTEvcVZSam53Nm9WYWIvSmRrL0RvdFgyMzBFNHNZaVVm?=
 =?utf-8?B?SkI2WWdCVmVFSmMrYnp3SHNCRnJ2T2cyV2lhTUlIakFSY0FVU3FOQzBscjJu?=
 =?utf-8?B?WGVaeGZMYUpNNEhsNXdTMG1NUkR1ZnE2TmlMVTJJWnpNVWkwQ2R2eDVOd0hF?=
 =?utf-8?B?TENXRlNubWZFNUl5cXRvcGc0ckZxaElrQTdYZkZFMGNQWm9QSFdpTStFMGpN?=
 =?utf-8?B?RGJBSlMrM1NNVDY3THVKZkJSN3ROQmtJNmsvbno5aUF4RDJFZytQWUxOOUhs?=
 =?utf-8?B?NWRNeVU4TGRZYmdOeXdrK3VqaHRSOW1tWHNWRkI2YjNMcDA2bitDREhscDRM?=
 =?utf-8?B?cVhzNnJCMjhMUmxmNHNvSGxKTEFTL3l5Sk5IRGNhZmErek5KMENLMm80OHJN?=
 =?utf-8?B?bC9WWm1TR3gyUmxpMjZERTdnYWVDZ0JCRTZ4MUY1aElTRGo1MW9qRk9SK3R5?=
 =?utf-8?B?SjhjWlY5N3FmdHFYZy93d0hSY2JIOStOci9SVGFRbDhRRW9uK2VKc0hEQ0xD?=
 =?utf-8?B?dWpGVGFpVVRjUnBOYzUxRlh5MW54WUZuaFkxejQ0Z1NHOFVuUWhRVElPd2xM?=
 =?utf-8?B?V3RXQXYyRkdvNzI4YTJvV21kOFR0ZnZFR0NuN3B0cWVWRlArWFlVbjBka3Ez?=
 =?utf-8?B?NE00d1BpQkEwWmxjR3JHUWQySGVvK1NyYzRJcTMxRzBqSlZQVExNNlJnQk1Y?=
 =?utf-8?Q?fw+hRdiAA70Z5PnxCe7PAGw4R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d73faabf-ad7d-4f02-d248-08de165cd349
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:01:47.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvWapjTxlMDY/duMBalOpwLkt5F6VJ75fQkQ4ri7lRdw+V4bUlr+kMnCoRetU6ivlOCT0uhlQxsrvS88N63D5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

Add compatible string fsl,imx8qm-sc-key for i.MX8QM and fallback to
fsl,imx-sc-key.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/input/fsl,scu-key.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
index 29921aab9d9713c475654fd1e1e1ebe26a5e08d1..2566cffc252d7c426bcd94fa3c2dc90fbb664a9b 100644
--- a/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
+++ b/Documentation/devicetree/bindings/input/fsl,scu-key.yaml
@@ -18,7 +18,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: fsl,imx8qxp-sc-key
+      - enum:
+          - fsl,imx8qm-sc-key
+          - fsl,imx8qxp-sc-key
       - const: fsl,imx-sc-key
 
   linux,keycodes:

-- 
2.34.1


