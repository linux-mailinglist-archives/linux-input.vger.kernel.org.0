Return-Path: <linux-input+bounces-9780-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC857A2804A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 01:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B29D3A2842
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FD22288DF;
	Wed,  5 Feb 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aDog5Bet"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AE42288C9;
	Wed,  5 Feb 2025 00:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716373; cv=fail; b=hECi5EhYDhGOA5L4s2XrPQfnhPrfpeSYZ1hbqdDPuNUmXfYTTaPe8v3OqOwHZY2UPa1ZzNfmt1a4oPB4hhqbgE8oEFYDx86G4eGbr0VOSlfvLQlI1729Oin7Jow5U6idyI4yGo77t55FQYtisQg25wMKcpqmPF/dl8MDGol2Aaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716373; c=relaxed/simple;
	bh=zQeVfeCxLWPp1ta82McHGDfqjkgW42mBMCjsal6VJxQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g88kimO2GRj66gkvcRqbm2BovTZAd6V9kIbLPY0jY0xtxf83KNg06vXaYDqC+Ks3z2aI4IjDl2P2aQm2jZpspHFgIfm79eBSlPPRD4PMZITtfES4wnfvTvpgUHJf+Y8XYezaX3K4LLQpnzKJRHb+kVBb13p3DsIyr5UgnNOXZxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aDog5Bet; arc=fail smtp.client-ip=40.107.249.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+XEhXwMEz9LBE4IeSxNDxk1Q63lNO7H3R7FY2nzc4Tm4fz5cdOym0BoGpbLat1SVvX0dQKzg06Q0ks6zCSW7QNhhUMwziZGbCwHlNDN8RLGWbo4Cky2ktcvdXahJgrfhoUMT/zepXeeZ6VFV64vT5PTdf5YkYDPxahBa+22UBFjXE2sIJbKSD85ecHahng+A8m4dq2bIbTzeWgt2Cz+pomWB/iHQpnPq+M7orb2WjShlDFvyXOcbPO+RxJzPT5rUM1oRzX7ZFeQqsWRkP5tN5c7jKg2W7+CmD+2axp3gxaoAATaRZQDrGxaoI+vZ4YmcpM9CbgdkJ4DDGSdg3GLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLJ6/6T287sMFeFzpA8pzl4U0kUK+AHmoE0BEwYo/f4=;
 b=KvEumd7WbmkOmFknrAYbPoQ0d4eRVDHwG7DR/UuEv6yGlcMfq22q8mgJZB0GOlWz8YoqrSLkMQotrwEWYco2P4IxAxwj/C8PVT9+lbWG5cQQpZTDBS0q95d+GDcBZkNInbM2hi2yhAWgFaq2wXF53LtEw8AjD4QatWS/WHUP2lkakvd/hPAsESGLh1bpVupahv5Zsnh09BlaPBNcTgaQjBX6pWl8CYW5CHYGAYf5oDpBWZhvJKXNRlT20uDTwEN+iRrTtUWcN8b+Q4bDT61JA3QWAostqflx5mpVHI/eb+cRGtfWlpF8tXuGLy31h4ZOMAg5fcqn04sgQJ5+WBRXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLJ6/6T287sMFeFzpA8pzl4U0kUK+AHmoE0BEwYo/f4=;
 b=aDog5Betj8yK/B8AI8pqhiNQUWP1xym92WwWlVNds9jNgMTknsLoB5wePLPwwk7RmayqJCG2es74UjwiWTWs1mbCR7f2HRohImiYJduMQeTOM/rBOxzrHKiX5qhfljHI2FC9kIHjH7kjv4QKMaFata2gs1n/caJm56JuTLV7oTPhrRH2cuzz8esWZ7XwfDbWaxlLSJiZibJsG5k+p33rUrcOPU+v5RpaVY0GdJgsol50PD+YGp3vy22yeQd4TBivR64QiTZPQBf+ks3qbNp1UCoZZ8jC00FAEpyhW8efNoJAjLkySdV4ztmG7Q4q5ZZkati3vF3fu55fOKnaIVCZMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:46:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:46:03 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:45:16 +0800
Subject: [PATCH 3/4] input: misc: nxp-bbnsm-pwrkey: Use resource managed
 API to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-input-cleanup-v1-3-9758898ff8cb@nxp.com>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738716321; l=1523;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=g2vZhAdAlG59tJHA7zmPtBw4oLxwHW1tSbJmlo9rLyg=;
 b=F9TW25kz+xXABLmaH6yb/mMDlaYy4cTOAR+MsjSq1CZdIy+avdAjWxqBxOZoHtxMnrQ2Lhb2q
 acT9Dtv/0ZyAuKqEhKwCvPI0c5nPy6DaSGUprEh9IIX90MOqwuh/i6r
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
X-MS-Office365-Filtering-Correlation-Id: 19780e12-73a2-43c7-62d5-08dd457e77e7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEZITTRBYndYU0ltcHd1S2VMcmpTdFZUWEVwZXZwTVhBeDZLSlRDUVdGWEt2?=
 =?utf-8?B?c2RDNVNqaVRycVRBdjVRN0VEYm95eFdXQmFoVWs2N2xxNlhLTjFmSXc5ZFZ1?=
 =?utf-8?B?aENQTFJ6OGdENFphZ2dQQ0lpU3RsMFd4Vlk4dEw3Rm5iam91UXNiOXdNN0Rw?=
 =?utf-8?B?TEZyQ0lSUVFZcnRxUHNPWWNQTCtEL2tqY3VpNG9GZkZQTmJtZUtmUWpsYjgz?=
 =?utf-8?B?bmllY0dCaEFMeWtNdHdJMzZKTUtUREw0bzJDZWdMR01QOVJhU0Y3TGhDc3VR?=
 =?utf-8?B?TzlXakx0d1JrREdiT0YxT0dTcjlUcFBYbnl5eGVRZnVqRHpQNEVsbXpJeTl3?=
 =?utf-8?B?aVNMWjJzN0NFRnNzSkIxUHRGa3dDMGtPbGNaaUtxa0VRa2c0bTVwVXVWaHJy?=
 =?utf-8?B?R242WUxCMkZ1MlRaa3NKNFhpY0FnMi9iSFBwV3F4UEdiQ1NmTnZPcTY1SDR6?=
 =?utf-8?B?Nml6bWRsbWc0WlY1bWxPR0U0VE9CT2Y2bE9QaE5KTnUzclJUT2xTdVdMa01x?=
 =?utf-8?B?L3FsR2NVVHZPTG5LcUkvdVI2QlQrZkVxS3o0ZjBlZUNaRkg2aEhvMkd2OVVU?=
 =?utf-8?B?Vm5HU0VQWmgyOHNwaU5jMGY1VWFncW4rcGRUN25aMzN2ZmpMTmhOeFVOYnU4?=
 =?utf-8?B?ZTJBRFE4ekZxRzkxOC9nbzVDU3NENzAzNEhzNVlQeDRla0xSWHVzZW9mU0FR?=
 =?utf-8?B?SGVTRXRTcCtPY29EamtqSXNNcm9DaFVYQ3pLWmhLQldiV0lWTlUyTFZuWnZM?=
 =?utf-8?B?VTkwRm5KWDV5dTdyN2VkU3V1QUkzL25aalFKN2lDTEtYN2V5cksxenFuSDl4?=
 =?utf-8?B?bWVwU1VrUk8xQzVHU0VvS08zbVovbEVkdUdiLzRiNDZ4c0ZZTitZcXdTWTZO?=
 =?utf-8?B?M2w2YXpRKzFmZW1NL0NmblBCZS9qdUFuT2toT0lwL1I2UVYzVGVNMWUwQnZE?=
 =?utf-8?B?b1dXZkIwdzZtekpESVZLTVBURWpnaEplZWJDd0hkRE9sWG1semFrbjd3Yk9j?=
 =?utf-8?B?TnhoUHpadm1SdE9yQzFON1NPSU1TTkMwSEZZNmt1c0QvVlV3ZlZYT3p1WExP?=
 =?utf-8?B?dFlpaDBjaU5sbXJYSzJXa1VUZDZSOHU4anpVai9BbDBkblVESlVsOW1IOE1t?=
 =?utf-8?B?dmIyKzZ2eU96dVFuZy9yRUQyemduZXoxVm1ZUERsQmhZbDlXS3RXU09rQy9G?=
 =?utf-8?B?ZzJzRjNVeXlHS3d2TjZxOE41Z1JDNm0wYk5sSUhyTnEveTlVN0lCWWNDNjYw?=
 =?utf-8?B?YTZUa1ZzRTJ5OW5VQUFMUE1DY2dDcStkTDYyQTFvemNINGk2M29ZdWtucnNh?=
 =?utf-8?B?cHdlMi9BU01lK1N6UVhYYnhwWDVHL3VJUS9FSjd4NTF1b0xuUy9VNkxxcWlh?=
 =?utf-8?B?UFl3L0sxa3lBSGdVOWs0cVpubi8yU0FyQm1EWDNSRHlvM3NMaWZxYjh5Q0VN?=
 =?utf-8?B?R1p6Yzl1dXY2WVJTNTcyL2FKYzF5dC95Z1BGMXNlV01KUHh5SUM1Q29WVzVq?=
 =?utf-8?B?aThKbXpKU3ZHWDgzUkRMNFBjSTRFYVZ5SnFIaGlnbXRCRzFmYUViNGIxZ2la?=
 =?utf-8?B?dGFINm9IWElYc0Ewc2pBdWRRdVp1eEZ5UDRzMkRPRUV3WlpUS3RYZ0hNdnFY?=
 =?utf-8?B?aGpuMFljWEszNHN2aUhCNWk0WEErNUNpSE1mdUdWLzdtWEgrQ1NiUE9zVjZW?=
 =?utf-8?B?VHducERrdzlIWkdJUEFreXhxNU9RcDd2aUZMaUlkOW16NWN5WlRHQUdnOVZY?=
 =?utf-8?B?NmpLRGcrUVRFREFhZWlvRmd3MTZmZGJSRDgxelJtNWpWalNwWENzdURwZXZU?=
 =?utf-8?B?VUZsbjdtNlRrV0VnYk9rdjUxaTFsV0xrbTY0UVpadUV4dXQxRmwyTmRJckJx?=
 =?utf-8?B?WnQ0STBJVWZZMFV2MjdPK2FRamN1VFZ3ckc5VjUxWHpQZlJGNFdJTXJMZlZW?=
 =?utf-8?Q?ZFvrdOA1ams=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTBENHBCZkNMRlQ0a1FLTzJzbEU2Z3NFLzVHY3UzcUtaZDJxWWIrYytFb1NX?=
 =?utf-8?B?QVpHeHFJcE0relRBdGV2cEFEMVU4ZkVjL0Y2SXcyM0FLeVlVSHVZcE5Rc0Qx?=
 =?utf-8?B?dytlYmMwdmplby9GSGd1aEFnbnBSanduRnl0ZHdRMXdtWkpZUmZBUkoyKzdy?=
 =?utf-8?B?VXNocG9DV2xIK0pQcTZURHFydEJ5NWVMN0hvbU8yMTNMQWRjNlp0UlpxSGJk?=
 =?utf-8?B?THl2OENVbmFScmtQSU5QdjJTWUg1emE1Wm5YclhkVVpLUTdrTWRTOXFpOTJS?=
 =?utf-8?B?ZTBURDNWZGRQdUF6d0VrcURES1NLalRlZTZacFNxZ2pyUXlXTEcwckxsa2hp?=
 =?utf-8?B?M3YwWm15R25CRG42bm9Ra2dlMDhEb3pmMnBLQzNIV1cyL3hxSjdMS0ZPWW9J?=
 =?utf-8?B?NVRwNjZOYzNyWlZCOE5HaTh5SUZFamV1bkFUbVdrOXJDU2hKNnpuU1BqWVN5?=
 =?utf-8?B?VGx0dk5kbTlqUUJEdXFVK0tJb2l0QmoxSlFZcm5taFh3RGJ6WG1iVlk1S29F?=
 =?utf-8?B?SnJNWGhrWm1aZ1ZFb3NQTmNvZExYUU9rc2d0VWtVZjdNTytvNkhEUU1ZUnhF?=
 =?utf-8?B?dnhkU0x3Ymg4YlNZN1c0SEJteHVOekUzckZOcVd4azJUQUNQQXJ0MGkyR09V?=
 =?utf-8?B?TVp4ZTNGTkpuUk9TRUxOT1pvUEZFaUZWNnNOOVUyNGg5T1BVcGJMSkI0Zmox?=
 =?utf-8?B?bHFIVkNQTGNsVXFpV3p5cW1NM3BnZHlSTVZNQXp2S0RqR2RtQTkwTmJiM0pU?=
 =?utf-8?B?MUdxZ096UXpWazV2b0NjdGdpZVE5UHlodWQ5eHBJSVdDSGJBRHN5VUxaSmNK?=
 =?utf-8?B?T1NtTzlZUDZQVXZ2N3c5Tk5HQlZTdlR3ZTM0TzVwSnBVYStPeWVacGFzSEZv?=
 =?utf-8?B?UkI4eHBQQy85ZzA5M2ZSVnpTeFM1RE9ZcUkyTnpUMFViVlBEQzRJcXloWDBh?=
 =?utf-8?B?SVhQZU1aTmFRdWxkYmN1VnVjNFZZQXRFcm1GV0UrcG1ESTlreEpIVjhPMFBn?=
 =?utf-8?B?K1pjQzI3Z0l1QmF0VTZwcW5qeXl5Wk9NODgrcG11Rm9sS1RlQUtPblRTVFJ1?=
 =?utf-8?B?ZVpkMUlEd01aQkE1Nm92b3lqNHZheVFUT3U2dzVKRnlrZ2hNMkVibHI5NVoz?=
 =?utf-8?B?TjZLdkduNWdxOXp6akNGWlltelZVaDVlZnZidzBuN1V6dmVvMUI1N1krVVIr?=
 =?utf-8?B?bk5tY25ld3VQNmh3M0ZqYTVzTC95em42U1N6YUJNWC9wWW11SlZMNmlRSWJv?=
 =?utf-8?B?N0RhSzlLT2lUMFIrWEdNZDdxWU1SK0YwSDFJMjZZaEJlS1kzakRIdkpqV2lV?=
 =?utf-8?B?SVR0ZXhoWDVhRnFjUDFCUDNVZlFETUtTb0ZkYVg0SE92SUFWZVB5dmt4Wi9S?=
 =?utf-8?B?ZnB4cHhVaHFWYm8ydlBickIwL2l1eSt4MHZxKy9ybmFWMkxUbzNxWGJYdG5T?=
 =?utf-8?B?ZHA5S0R0ZTV5aHdNNUZNYmVJaDJHb0RuWG9sREFabWVnUThNOWliVi83VVRQ?=
 =?utf-8?B?TFcxS3FWeStKZlJBUVFTSEhTczBrQmtiQWp1Wkl6NzByU2I4Z0ZaeS9PejdF?=
 =?utf-8?B?amt3a0FHVitSQnk1TjVYcEkwN1AwU2pRZTJhTnJTNWozT01tWnZXR3ROd1Fu?=
 =?utf-8?B?cjh6Qkd3SzM1dkVzRHBON0NPSy9ldlRLRVk0cmhjS2lVbjB4WXhORDIvSThE?=
 =?utf-8?B?Q0FrRWdtMTJkRjlQN016QmsrN2FpTkx3ZkltYWF3Sm1sRi8xZXc0K2J6VWJz?=
 =?utf-8?B?RXY1RU9jMmVwY05GMGcyOEtvZ0NWaW8yNG43SHhXd3B0bHpRblhDWGk0eW9i?=
 =?utf-8?B?WklFditwbytlbmZPeDJoK3EyandnWXNyNGY5anpjL1NjTVNCRUpBWm5INlAz?=
 =?utf-8?B?VlNmZytsYzMxUnoxUU1ua29NbmIwT21icDhIVzREdGY3OUFQWnBMbi9HUlZY?=
 =?utf-8?B?UWlDc056eFRxRytpQmh1cWUrYzJUWktWTlFhTnlHbDlnWDJRNzVyRWFYaTVu?=
 =?utf-8?B?TkNZK3pZaTFvcEIvai85TjZTbGs5a0YzLy8rTzVPWU9pNE1EUXRobWM0T2JW?=
 =?utf-8?B?VXRWZHZuYWwwem5XVzFZVlZySnBZR25KaWpYMm9YcWJ0QWZPcll4V0tNMWIx?=
 =?utf-8?Q?EVQ3JliCfy2BxxgMxMHaet3PD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19780e12-73a2-43c7-62d5-08dd457e77e7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:46:03.7305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTogL04aT/TcN3D8hrCrH8ArsIBecNVAoGOLgiF2uAgqBZoSBpNfsx9ZIlTJH0iNi4kYlX1YpwYo1Kz5rRg/sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
'driver.remove()' hook.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 7ba8d166d68c18b396e616f6f9074ae98c4629b7..5faad2c98af35c52dcacbf25728dbaf2cbb3c625 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -179,20 +179,17 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	error = dev_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
+	error = devm_device_init_wakeup(&pdev->dev);
+	if (error)
+		return error;
+
+	error = devm_pm_set_wake_irq(&pdev->dev, bbnsm->irq);
 	if (error)
 		dev_warn(&pdev->dev, "irq wake enable failed.\n");
 
 	return 0;
 }
 
-static void bbnsm_pwrkey_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-}
-
 static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -229,8 +226,6 @@ static struct platform_driver bbnsm_pwrkey_driver = {
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
-	.remove = bbnsm_pwrkey_remove,
-
 };
 module_platform_driver(bbnsm_pwrkey_driver);
 

-- 
2.37.1


