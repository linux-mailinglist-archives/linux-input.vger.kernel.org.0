Return-Path: <linux-input+bounces-4628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F808917D07
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 11:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C38F1F23C42
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 09:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908BA171E7D;
	Wed, 26 Jun 2024 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="TAK4nxUH"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2136.outbound.protection.outlook.com [40.107.20.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB116630E;
	Wed, 26 Jun 2024 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719395788; cv=fail; b=Our/tYqatWSXv9K9Z9wNac3r31nxjJXHrk/orllpExn9bmqsTJajEFYM66o7iyHlMxVz2ebtQrPvfNVOK+xvqenTD9QKJGIx/v1WFcG7Ax9JWmOg/izoJePQwsxjLYaCI7wZLjKr0LWfNCeZUdilJwTmGaxQ/NIBbXKtMgOiv1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719395788; c=relaxed/simple;
	bh=vsFZ9q+ydDIxRWmbs1NXOo9kzGcFogQc7xsPDOQ5BJY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ltj0y9ya7MUzUX+FkDu0stT3DSnADCSvVrtujD6HmKzkLnAGmvQ4C8l4PSgQuuCjk20Jk9cQ0iMc0L6aFYhtqQ4ZkUNXe/Y/UyP8zgaY4x+D9TWOYjlhUUNNkSABq9vmunwDL7o/SDhOkb9MFZ9pgIEXZULWrmLpsQ3Xm+mtvQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=TAK4nxUH; arc=fail smtp.client-ip=40.107.20.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+kP21oWfuAWUYP5wewlED4lbnGbqZor2PXRk28oAAVtCI5tBv82XHFxfepLT8HRHldyuZCSG+xcWMbsael0w01Q9UUIVmI0J1xW/0NPd1/0NQMaZaMRIxzzHf6CnGB6wHYkvhff+rR85CPDgPovsbxYxh92+O6tmFNHdtOnwbi8Zb6iJgq/TyueKE0qWCeSNHn2Y05t9I0dcHEayrzABuhJTOGHsRV7Zz0lapS71DWqGlkPhWXw8n0TmZZ1QVNtd9bMNeOS8TCOEytUNBDA9mQYZ186ZT+Lq0TBhdJ/r6yykggl6JX8/pO94wdFqM8JxNO9a9RKxPNa9Sc4o6sdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16dHfUkG6vspy9E+xLRgyQx+eEGZf+k0YLqnYjZmSGE=;
 b=PBW9+kxuYtONRWYyx8gCLuWZoskORxQSfZBatC0XjSkQPgcF5dutc5OxPyvMZzD2vR7vWMkuMh/NhFiuKHeX2h3H3nDpDMDyr8W9Yn3KGEiWziib2vXhNxPGrnFL1iSumH92sPEIWV3HURj3OxUwtzEYoV42KK1ociuswsCo1Q6pK43OyHXFeGPl/kYGsUqbWhK0vYMv45ZrdDLQ3T+Lsgy9V5i1wCjo1mbKcrJo3/I/4bsiRKA30POUn+t+3zw7ljMBE118vtD00DCObekyl2bmEjb7t6UtMre78xV4cxClylqE07Vn5k8CIAXwqz8apw8rFDQ6xnXWX38MUhX1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16dHfUkG6vspy9E+xLRgyQx+eEGZf+k0YLqnYjZmSGE=;
 b=TAK4nxUHW8eP38+gd8WajBFs1S0FbGO8SowooB7s3pJw+GkgLM+ZVTfRiDiriJ59cGBijWayXuVFu8OwSE0yEEMvOWTLCEC0MvpFd++DjXUMXgw9BgacBe5u3sJZZg4A3kIkHxA6MCwZkgE5rimSM4grkIbFllPeR5g2z6Dp+4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS8PR08MB5893.eurprd08.prod.outlook.com (2603:10a6:20b:23e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 09:56:22 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 09:56:22 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 26 Jun 2024 11:56:16 +0200
Subject: [PATCH v10 4/4] Input: st1232 - add touch overlays handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-feature-ts_virtobj_patch-v10-4-873ad79bb2c9@wolfvision.net>
References: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
In-Reply-To: <20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Jeff LaBundy <jeff@labundy.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719395779; l=3367;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=vsFZ9q+ydDIxRWmbs1NXOo9kzGcFogQc7xsPDOQ5BJY=;
 b=55Ks+AEa+N68j45g05Yo/HraT+5FsMOqFEGQ1g5gLaV19GDbogCTq5FrHnjlb51TjQv0g1rS/
 4kRtBurCQ9fD613yTeuHd6L14cGDh13i4pP/MYNGXmPrqiZOt6e1b0g
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS8PR08MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c37b82f-737d-4640-adbc-08dc95c63b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230038|366014|1800799022|376012|52116012|38350700012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXlCWG9MWjNwdVNyM2x4Z1NLVHRFd3RaeG1xU0VRSUFpN0RnQ0JYazExcDAz?=
 =?utf-8?B?bDN1N0p6aHZ2RWtQbnhwWmt6RHgzNStDSU5zQ0o1WFQ2dnBEZnFBTG4weXhE?=
 =?utf-8?B?SmQvUDlMY2FCRzhuU2ZtMUhKZDRoQWxmUTJOUGl2RnV3ZXMzck12MVFsNnBm?=
 =?utf-8?B?YmVIMDV2TDBYdVNYZkMzSHJ6aWdpWExveWh4NVpRZnIxTGhMd3JjTlVaMmli?=
 =?utf-8?B?bzF5UUhQbS85bGVEVWVibFB1K0hYQUZOV1U3Mkh0aWNMcVY2WnN1RitiaU1a?=
 =?utf-8?B?NlV6VXVsenZzbDViWHgvS3VmVTEyclRQWjUzQW9NbEUrL254UklTK3VGT1hv?=
 =?utf-8?B?emh2NE1tN01WNDBqLzlhQWJQL0dFSkJaTVJ6Z1A0cmcxMmxKdzcxS0RDNUxE?=
 =?utf-8?B?eGxDR1ROYjgrSVRkcUk2ZHJqbDBIV2VlendmMktEdDJ4L3F6TEtKNjM1Skdi?=
 =?utf-8?B?KzZKZTVCSlhwN2xjV1RJNUU5WHdJcGtZVjljeE1MRHBiaGx2enFGTjExWk9N?=
 =?utf-8?B?dlFvVTlPbnIwaVNpSERTdVJyaU4wL1l2MHlseHRXSHFTKytlWllKWVRvWEMr?=
 =?utf-8?B?b0pxQzY0aE9KRkNrSVI5MXZtd1ExbFRrcXVZRG8xN09INGdFTGk5YXFGWEx2?=
 =?utf-8?B?YXhCSU1vc0FHL3dYQnZKSmwreVBEbGpoYjVuVlJDQmVZcUJNdGFJZjFFbXI5?=
 =?utf-8?B?RmdJckdNU01ENERBNHFWYmpwTGE4NmpLTFR0aDhvZklhQWpDbVJaamhuQlll?=
 =?utf-8?B?ZnVlY3NsckJjOW1qZFgyek85enBsdzdkbDhlQnE4YWluY1pLL1BLbThoMFhm?=
 =?utf-8?B?Qmg1MG5Pb0NjV0pibnJKTXFMOWxmQlNvc0QvTEFaUUJ0L0Z1b3ROR0pBZ3hM?=
 =?utf-8?B?aFFOV3pyU2FWblUyclZRMVpuZjdEVDM1aXpxOFVJMWFSTk5uVlluKytDMlhl?=
 =?utf-8?B?VEdYSkdiYTNoSFhMcjVjUGZIdSszMk9NSU1DbHVpSWQ5V0xoQUVxREZTMHR6?=
 =?utf-8?B?K0ZqUFFLODgxR2ZtWklhYXFZRzhNa251a1lmWXFyb0diUFN4YjZCcGFtZytB?=
 =?utf-8?B?UHhscXplNklQTDlBRnFxMG9zb1hrdGROdVQ2cE0vRHBnVmkwNDNJdW5vazFv?=
 =?utf-8?B?Mk5hQ3orZTJiUEh3TE51SnVwMXpZMWNvTWVVSnRIVXhxVjlpQjNwVHFDekgx?=
 =?utf-8?B?dkFZRWZrV1RZUmVJY1NlaDQ1OEJYOWRYaFVVNWkxWFdOeVBLaGFiMHVXeHJa?=
 =?utf-8?B?RENyQXAwaENSMC9mdVFUamRsUTVvQStjZHVOS0o3WVV4M2ZQT1BpWGxyZkls?=
 =?utf-8?B?NHdoQ2JzZkgvVU9nbTF0RExsNW0yYWc1TUhTZnJ4Y3NuUzFtWHlJM3BCM1VF?=
 =?utf-8?B?YmJKMXUxSE5KTkNsL1oxaXZDdXA5d2hTVWxLWW1UTHVpTHFpRGk0TmJMSXla?=
 =?utf-8?B?MVl2MnMzcXNFK2FVQmpPR2RmRlRxWDNnaXhKTnJyNnJzZURDVHVDR2tvRTVm?=
 =?utf-8?B?ZDZQT09SVXNTNk9LTVFHUlArS3VOQXhhSWRFZk55TWJUczdaWURtaWlrd2Y4?=
 =?utf-8?B?OFF2THhIQWFZKy9yV3kvd2UreURVVnpURjJkc3RzWUJkajYwZzVvMjRkKzJP?=
 =?utf-8?B?NDE4ankydHV4VFZSL2FYR1Rpdm5GNDZOVUhZSzd2VS9lbHk3bnZ4Wno1QXEv?=
 =?utf-8?B?ZVB3UzZWMENoTWVvekFVT0I0WWUyQnp4cUhVTzB4M1RsbEJML1NBT1BpWnlt?=
 =?utf-8?B?R0hobXBibW9tMDBBamxCWVFna1NHYjZBUFlRbmhSYnNiVk5zVkFpY1UrdERY?=
 =?utf-8?Q?kU8oP5QWvPMBeTNfEBCQZOMiRYK9ga2xxRkps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(1800799022)(376012)(52116012)(38350700012);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGlyeGUxenZreExoOEFycjFZajBCK1llcEVWUXFSU0JBakV4SVNUbDFUbXNO?=
 =?utf-8?B?a09BcFE2NkQ4ZjAzaEg2T3RrVitYUzJaaWM2Vi9xNWFERllMVVU3UkhCeDJq?=
 =?utf-8?B?dHhEOTd6dXpIOWgva1lQU1NpOUpGTmlSUU1aWm5GcElPNnoxYitKOGExTitD?=
 =?utf-8?B?WitLM1laMjAzd09MSHlKMkp6Qkx3Q3VTdnRBSXVyUzRZT1U1UzR1Q0JKZm1p?=
 =?utf-8?B?dHU1MTRkSzJkMmZBd1I0aUh5WDRUUWRSNGdGOVdVL3pDYjR0eW1WeDhqK29u?=
 =?utf-8?B?NjVobnJjUjd4TWc4S3VDS0RXLzBZcW1Pc2hYOForTHlVYkZ1dGYzNmZiZ2ZL?=
 =?utf-8?B?MEdOVThpbFBNcDd4N3o1MnpUR0FtNi9CNUIraVhkTjB1czJXdTZ5ZFYyaXBv?=
 =?utf-8?B?OFdZOUFKemxOYlkzNGF0MVhxUmpvRmxDZVg3SC8xZ0Rqcko0eG1uTnBUR2JB?=
 =?utf-8?B?Ni9VZjdJU3c2M0ZPVHE5a3NKdDBnV05FakZkWlZtZC84Smo5TU9QYUFvdlQ4?=
 =?utf-8?B?bnVGNTVpTTM2VmRQTFlKVzhnL1N6ai9ZNHBKODFYRXVaZ2pKVHplL1p5N3E4?=
 =?utf-8?B?b2hiWWF1MUFDNEdLTTV0TjA5aW9KV1dSQytINDl6M2FBbjM3eE44MDNOaEVQ?=
 =?utf-8?B?ckRIMnYvTURPSTB5clFqR2g2R3JLc3JWVzhhR2lSYnQ5MktVRE8xOFVNRnRp?=
 =?utf-8?B?QUtaN0Y2c2U2UEFHcjJCSE1hdjk3QXA5WU5QN2dXSGZ6T3NpeGhOSW5NR2ph?=
 =?utf-8?B?d2lxVkp3SVF4TTFjdTN0UlNvSGZGWVFCbHJ5UzJKM3JvbzlHZFFnSFBZZmRi?=
 =?utf-8?B?Z2dram44cG5zSjhhNW9nbjBYeTdNZVRaNWJFSFI5NzBoY1lOc25tY3VHSEtE?=
 =?utf-8?B?N2cwOGxJUDdTTWFHaFo2cjRjcDBVV2ZEMmFic2VBU3JrM0xMT1lTTEtFdDIy?=
 =?utf-8?B?T214RVNORDVhZzRTeFpaMG5XWmNORHdnM0NQQVoyK2tPNHJUYUN0OWorNTh4?=
 =?utf-8?B?Y3F3UDJFam55dWRYNC9PcHIwZ0F1ZmR3a1JIR0VhNHY4ZEprNUp3ektadG81?=
 =?utf-8?B?K3gzNjdLQUJKNE5oOTBFbWt5RXBMY1ZCV2J0OEp3V2ZpMjFXeml1TzJyc3J2?=
 =?utf-8?B?dDVwcXJvb0xYTnZIYUplY3hJNmcwNWFVRmJoZmhRSDFmRUVnMjJVZit5QWpr?=
 =?utf-8?B?UXRPeGxLSGIvcUNwcktidnRMTmxDR2NETDBhNHM2Kzd4S2FsSi8zYklYNWds?=
 =?utf-8?B?NjhqRGRHbzJ4YlRSVzZkRnJOcjZtN00xM2lNWHhvYmFkS1VRYmcvUHJyMGtE?=
 =?utf-8?B?TTFxcU90eXpyOGRMdEN0a1hadXhRTFBNOTJCRUNHMWY0S0VXL3VoVFRlamdS?=
 =?utf-8?B?d0hZQzRmS2JEWlZOVVZ6NVlIYWhlV2UwOFU0OC9Kek4xOUw2dERuU0lRN3NG?=
 =?utf-8?B?SFd5SWJSZGErZU5Vay9SL2c3VWxnaVBoRkRaNEtacXJQRE1BNEFCdjZRZ2Ew?=
 =?utf-8?B?OUtQM2NnRGpyN2hwNG1iSk8xTW8zNU5mNTlVUW9EL3FMZDI2MFhhR0tmak4x?=
 =?utf-8?B?MFJ3ek9wdW1ON3k4S04zd3BkMUdHcWVybXRCU1FTNVU3YUFZNEFKNnNlYUpx?=
 =?utf-8?B?U1Bqdko5UXNCTXlaZk1zRWYrSDJqZk9FdGl2UWFjN0hnQWsrcy9VdDdZdTc1?=
 =?utf-8?B?MC9IOWhxdDFhWDZGRmcvV3c0MVJYNVdpakliVDkxZTdGNFNRU3NMN0hySzhi?=
 =?utf-8?B?ZVo4UWpzZ1Bma213UFJXNzR5cERYMVVnSlliUGtuQWROMC95WWVwZHJ5L09W?=
 =?utf-8?B?dFFwVko4M1Nid2VyajhlMGNGTW5hMm4zQUZTWWovUkEyNlFCTi9jUFRpN1Ra?=
 =?utf-8?B?WUlQUjNMRXNXMzd1cURpOTBSbTdqNGhZWFZGS0dscG9FcUhna3orcytJMUNS?=
 =?utf-8?B?MWJHb2dMZ29HZnN1YUxBVGNlbTJna3VXd1BRRXFWajBQbnJFUUEzRUI1YWs3?=
 =?utf-8?B?dWdwaUpiNXYxVUw5WkZSZGJKQWFVQktKUlVmUDZqYmtmaFZGWXZQNXZQbVdK?=
 =?utf-8?B?VDR3MTN1VUs1azAxdVBsdFRrSTN3VDJGbVU2dndDSnNHeVVpdnIvcTZjbnlK?=
 =?utf-8?B?ckVwUWpxOC9QdDA5b0Nid1dRanZlNWpEb1lScEVoaC9yVk9pL0pUYmRuaUxZ?=
 =?utf-8?Q?Te36ec/u/MXmqgcnPJkhjN4=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c37b82f-737d-4640-adbc-08dc95c63b23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:56:20.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vrr0sksCYcSBfF08uaG6rq0Uo9K5jafWveXK8u414RiAzz2MAqtXJDIcrBnUivdLoLmp8Try/hFuJMXYKG1h1O74TpctW6n9IfV8H+9upkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5893

Use touch-overlay to support overlay objects such as buttons and a
resized frame defined in the device tree.

A key event will be generated if the coordinates of a touch event are
within the area defined by the button properties.

Reviewed-by: Jeff LaBundy <jeff@labundy.com>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/input/touchscreen/st1232.c | 48 +++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 6475084aee1b..4fa31447dbc1 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -22,6 +22,7 @@
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/input/touch-overlay.h>
 
 #define ST1232_TS_NAME	"st1232-ts"
 #define ST1633_TS_NAME	"st1633-ts"
@@ -57,6 +58,7 @@ struct st1232_ts_data {
 	struct dev_pm_qos_request low_latency_req;
 	struct gpio_desc *reset_gpio;
 	const struct st_chip_info *chip_info;
+	struct list_head touch_overlay_list;
 	int read_buf_len;
 	u8 *read_buf;
 };
@@ -138,14 +140,20 @@ static int st1232_ts_parse_and_report(struct st1232_ts_data *ts)
 
 	for (i = 0; i < ts->chip_info->max_fingers; i++) {
 		u8 *buf = &ts->read_buf[i * 4];
+		bool contact = buf[0] & BIT(7);
+		unsigned int x, y;
 
-		if (buf[0] & BIT(7)) {
-			unsigned int x = ((buf[0] & 0x70) << 4) | buf[1];
-			unsigned int y = ((buf[0] & 0x07) << 8) | buf[2];
-
-			touchscreen_set_mt_pos(&pos[n_contacts],
-					       &ts->prop, x, y);
+		if (contact) {
+			x = ((buf[0] & 0x70) << 4) | buf[1];
+			y = ((buf[0] & 0x07) << 8) | buf[2];
+		}
+		if (touch_overlay_process_event(&ts->touch_overlay_list, input,
+						contact ? &x : NULL,
+						contact ? &y : NULL, i))
+			continue;
 
+		if (contact) {
+			touchscreen_set_mt_pos(&pos[n_contacts], &ts->prop, x, y);
 			/* st1232 includes a z-axis / touch strength */
 			if (ts->chip_info->have_z)
 				z[n_contacts] = ts->read_buf[i + 6];
@@ -292,18 +300,30 @@ static int st1232_ts_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	/* Read resolution from the chip */
-	error = st1232_ts_read_resolution(ts, &max_x, &max_y);
-	if (error) {
-		dev_err(&client->dev,
-			"Failed to read resolution: %d\n", error);
-		return error;
-	}
-
 	if (ts->chip_info->have_z)
 		input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
 				     ts->chip_info->max_area, 0, 0);
 
+	/* map overlay objects if defined in the device tree */
+	INIT_LIST_HEAD(&ts->touch_overlay_list);
+	error = touch_overlay_map(&ts->touch_overlay_list, input_dev);
+	if (error)
+		return error;
+
+	if (touch_overlay_mapped_touchscreen(&ts->touch_overlay_list)) {
+		/* Read resolution from the overlay touchscreen if defined */
+		touch_overlay_get_touchscreen_abs(&ts->touch_overlay_list,
+						  &max_x, &max_y);
+	} else {
+		/* Read resolution from the chip */
+		error = st1232_ts_read_resolution(ts, &max_x, &max_y);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read resolution: %d\n", error);
+			return error;
+		}
+	}
+
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X,
 			     0, max_x, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y,

-- 
2.40.1


