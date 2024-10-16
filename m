Return-Path: <linux-input+bounces-7474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0137399FFE3
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E3D1C242E7
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 04:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A6E18870B;
	Wed, 16 Oct 2024 04:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="RvOKYQbi"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2099.outbound.protection.outlook.com [40.107.104.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B5176237;
	Wed, 16 Oct 2024 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051376; cv=fail; b=ARwjm8GkzKrhX4kcPaALa0QOEzU2R4c3JqazBlwZwQceHXtwYLGQMiqwixFCGHQxT4h9/IXxzBYnbeiztcivb08ZnFnCQb5OmSTMY7FKrdP6Re5PzWC8KWuC7xlkfTIani0kljJe47F/itsFXLBjfUh/z8R8Rf4XIrZ8rFGeu78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051376; c=relaxed/simple;
	bh=rod/YgmYyK+858yfUuVMyb+pZdeSCOBjH0+RNVu9iK0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=OLBgX+kUEFA/w9cAnqGWsi9Y4GUw0696A0NQvsRMG5YkV/tDv1MZLz6BxyOJZfsQO7zHqDAcFUbceVXTZ5XmI5YP0kUom2RYEOYYPyuBF0q8ft3rL0nPdVjBfgW1dLRecxLWpER/skQ33Pz6OfTgkzHcpC2GAi/s83rvF55my50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=RvOKYQbi; arc=fail smtp.client-ip=40.107.104.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4dtv4yg7QwCccI79J7v3CLo/p7jshnO8VjdQpE2WqN/2OvstKliYXm13yi96fOgpMm02ojclELphi0PRtYfmTwmR3APoV7GEJKE7uvibYOgdMstfbJurMcEqxYzdrYJU9bLAZf/BVQaytfFJ5T3vC+eLcHSQ+R0NtTooLJBzOIQ/Z+jDwLjaMUgbcAGUBYfhF8Df67Fe3OVwprPFQPYSJOJiEd5km6LLf0PqTs0oXcJ8ncXhjOrlVqv6aoofmWy7A7SnSEVEfEA1crxBM/z9RHNnILhRqtDI+IZhtY0zyg6UiF8BbfijWoS12JdxR4TU4Buz1a2NlwIY/r2q1inXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcpr10BKpfxSN9nSVE5KUzL6+8Ncm73V9hZ8HD0rCVg=;
 b=qcgYy9IbBvFmHdD7LVOahvVXx8X5O/CS1sQL6m6OVPjhDnPmNjhB0yV9+OTYnKOHWY8w30w/+AtZb8aL+xYl2NcQ80Hzp3bHZdLOjJfMm9xhkMQ5fwh0FoRmqhCc73j+CJ4DkEtA5TBo1Ir4x8xzS3G+nMVjtBgyNxHToMsv1kPgs4AMf55c3QcbH3ZcPUHJh1f+vWSep07LyWTMBUsRa9B2WQ8f/9RHl4uGAeCwcKDjeQGtagWksDTY+af4R6b01KzGMkSu5hsHdnZErwWUlHQAQlDkaN473K+rEHM9U6xESikEu7OctVNCjB8MjGn+cGj4Kr08wI5a7f60paA5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcpr10BKpfxSN9nSVE5KUzL6+8Ncm73V9hZ8HD0rCVg=;
 b=RvOKYQbiRF9cGluVS+vCuhXl5toJdEWu5+nbarVavpIjJ3T1J6ISlOTg8A34I8220U5bga0A6NsurzVZMg84EjYOIfud6iLBlcXBh++wcP7w3dk7LiaMq+BMJOmNWheQX3rqP57pLxmEM67/6xs608s9m40VzG+J7N3tw5GY9Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by PAWPR08MB10183.eurprd08.prod.outlook.com (2603:10a6:102:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:02:49 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:02:49 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Subject: [PATCH v11 0/4] Input: support overlay objects on touchscreens
Date: Wed, 16 Oct 2024 06:02:39 +0200
Message-Id: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN86D2cC/43SzU7EIBAH8FfZcJYNUL7qyfcwZjMDg60x7YbWq
 tn03aVrzB4kmx5nCL/hP+HCJso9TezxcGGZln7qx6EUUj4cWOhgeCXex9JgSqhGGCl4Ipg/MvF
 5Oi19nkd8O51hDh0nZZ3RAoCcZuU6wkQcMwyh24DFHjXPQW5H50yp/7qOfX4pdddP85i/r69Y5
 NbdMW+RXHADZMhLDMrqp8/xPf1GOA40s01e1F5NFS1ZDxYTORCpqjV7taZoqBO6FDQCuqqm92p
 6SxpsEClIomirmtmrmS1psmiCjmjbpqrZvZotWixrE6Z1Rpq65v80LRp1T/NFC4CWXAwoUz1pe
 9O0Une0tmgQkpQ+SgUeqpoUN84qe+/DieJ510B0LaIK7T9vXdcfwjATiVMDAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729051368; l=6342;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=rod/YgmYyK+858yfUuVMyb+pZdeSCOBjH0+RNVu9iK0=;
 b=tpRy0b1yq8Or9/A1HyeRUMIh5ZpwLZ3zbAqJXAir8JJQADUOBxkDh8VixYNatdbVHfCPwdS1y
 mluMd+UFNBmCaD0j3knmtXmt/2CNuhkxsfcBYSvjsUy8rbCgrmruldt
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|PAWPR08MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: 06eb413e-8b4e-4bba-a41a-08dced976647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVFJckhQaU5RanVrUVpGTXdORHZLT2ZXblVSMiszSFNyZytGQ2JGcERZZzhI?=
 =?utf-8?B?T1NKWVpZY09vVVJsakVDS211cm5xRVc4TGdOdlQwMnpEakFPbjM1UUlRb3Qr?=
 =?utf-8?B?Y1M5VVVIQUdzdDdxNFB6aUtYMVN5WWdNSzJkY1pzWmJlU3RhQWJZZm0xYldp?=
 =?utf-8?B?aHprQzdTL2JjNXpLUGVPUXZORy9MWHlmNlNNZVNIdnA3ckhacStxdDk3dlRR?=
 =?utf-8?B?SVhzLzZ4SkhmODZrR0x3YjRkSFJQbmRWOHgvQUFEdXFXTThEY282L0xOK0pz?=
 =?utf-8?B?YzczZDFxZzNBd1RkOW5WcEFsMHdIQzZmSUtrTVNxS1RYaWhHUHNqVWdwZko3?=
 =?utf-8?B?SmdjQWUvMXIwU2ZQTVQ1WWlieUlCeGRLcys4dzhRc1BwK3kvUHFGRXA3d3pS?=
 =?utf-8?B?Nk8zOVprN1pzbldPeHpwRTlPY0VpZldHSFE3ZWJpdE5lazlmZTdUKzA1SDBx?=
 =?utf-8?B?TUQ4VmtrUFRXbGR0Q1MxaGo0bUt3ajdrSWg0NnJwRWlHa2xINmQ2OE82UmMz?=
 =?utf-8?B?aExsMjY5cWRIZk1PeTJtcFRuangzNWlORm4vSFZNTW5pMUlQOW9WZURCL1hM?=
 =?utf-8?B?VGdSQlkxdHd1OE5RNGN4VTQ1VVJjdWxKWThybnZ3N2p6Ui9EZWxkbCtOWlQy?=
 =?utf-8?B?SXRZVFNraXRGbVZzMTdlQUEycFJpSE5zbFFqV2pKSkFGcTRsbHgzSzlqVFNE?=
 =?utf-8?B?d0REc3ZpNDgzdlVXVWgzSklJTlc4RnpGSmJIRHQ5MGNmUEtDSk1zeHR1MUZ3?=
 =?utf-8?B?cVNMbEZKeWEzdllPQUZjSEFBQzF6Mm9IMWg0SmlYT21xRm1rV3JtYmpvMDRC?=
 =?utf-8?B?cEpMdFF1cTBjMm1PZlM4a1RLTUhXQU5HQ1M1b3FzeDFxV1B0VERwV2pRWFdO?=
 =?utf-8?B?aEsxeXRFOXNCaXprSEdiWGJTa1VUR0pEQWhmdUNCem94aVdteHlldldpeUpZ?=
 =?utf-8?B?WGl3cVNEWmoyNU94K3hYUzZQWmNRSGUxdVBmcmZMSnJ5REZzeWlpK0Vzbjdx?=
 =?utf-8?B?c29qZ29sVXlCVnhHR2cxdzhtckg3UDVCM1k1MUUxa3I3ZnhZZHlYU0pEK21N?=
 =?utf-8?B?cWM2Y0pyTnlnQVN0c2tuVTViendQcGIvMUNLdXltTEEvYUtRUTBCdkpsTDZz?=
 =?utf-8?B?WDZneU4yUU9nT205bEU4NjFOeUVQR3pOZmFiVlV2Qmk5elVIa1lmcXNGL01M?=
 =?utf-8?B?ekl5Wkg5cDlTcWhQN1kvQTM5Z2VCTWx0MC9DdHZyWFBNcGNkeXhjS3U5aHBk?=
 =?utf-8?B?Y0loOUNjWldydi9aMUlOemsrMlhLYUJGZlI4ZjVUZ28yVmE1MEpEcWhsVEV5?=
 =?utf-8?B?Uk9DcE1TK2xHU0QzbFdXRC9wMmtqcTJqOTRhYzArQW92bjg4bmo2Z1hFQ3pP?=
 =?utf-8?B?U29wN0VLMkJsNzBsQjMwM3hvME1DMmJEaGdBclhIcFFyODRRYndQZDZkNDNl?=
 =?utf-8?B?dERFaXB4enF1K29mOXVFdk1QeDdPeG4rM3lBZ1o0YXhmY3UwN0NhMW9OVWZP?=
 =?utf-8?B?QUh0ZXBoN1l3MHBudTloOWNQeXJUMTlPVlJ2a3lxSy9mNWdzSmx0akZIUVFC?=
 =?utf-8?B?TnhxYnJqcDVTa0VaSkVnR0d4VHNZR2RaMDArNVp4RnNSaUZuT295eUh5c1Bw?=
 =?utf-8?B?Q0YyRmZvUEdhZUVpSzFpSzVxVWlTc1VaSEg3VDNkbk5TejZ2R1I2K0c3bFAz?=
 =?utf-8?B?V0VSQlZwTlNjM00rYVlqbHZPbE5HaFJRaVpocldHd1lieDdDb0FiYUVQdHFW?=
 =?utf-8?B?QmM1V3Y5aDdaRlRvSFAwM3RCdnVmWDRiWG96dHZZbGRPS05Lcmx5U2JiSkxy?=
 =?utf-8?B?RkZ2NW92MHREd0ZVTmlaQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENrUHRRQWFIaklNeVJscUlCWjFNVjRyRmRMeW5YUWliZkM5ZHRHeXh1U25L?=
 =?utf-8?B?QWlKeDl4R1krUjkveC9QNU50Mk1haEM2NXN2bE9lQ2paYnVrTGVmSzgvZC9L?=
 =?utf-8?B?T25FVklWQ3lkemlsdElWcDZscWxDakJSTHcvWjZ0R1dJaGRaQi9wZmRyeHBw?=
 =?utf-8?B?akpLaURoSUpXZHd1VkVHbDh1UGF0MEhKVDQxMWw0VkxEM2pFNjBlcDIxWlJO?=
 =?utf-8?B?MkxoV01EdjhqbkZZb0ZJQWxpSmF0SGJ2ODJTUnpDL3p4SURmUGt4NzZSWWlh?=
 =?utf-8?B?c2pWYUZzWEpidlZweU52Y0NKaXoxZWdCZDdIOUFsNTJyNVpWaEtXaW9TSWxn?=
 =?utf-8?B?OHRxaC9HZjFQRTdCNlFVUFJ3ZTJQeE5pd3hUVUdkQndZYTI5dm5GaUVPQjBO?=
 =?utf-8?B?NXhXMkR6dktnYktrdCs0dXNmQXJLb1FUTFBTa1l0dmpiTVVKcEhEajduVi90?=
 =?utf-8?B?dnovMlYrVVRwNDNsQTByaFdlMkZEUUcwcEpFZDhjbjRNOFFzVVRINGYxTzNF?=
 =?utf-8?B?OEF2VHZ6MlRQalkxOGo3YTBaUTMxVVUrcE52T2xiN05tN2ZoV2NqSjRTZmhJ?=
 =?utf-8?B?NHZ4ZHZYSzBFRWhvYVZleU9iNFVsMzczN2l0aUVzbC94L3NXM0x1UEFOQjFB?=
 =?utf-8?B?K0FlaXN4K3lKM2gycjcreGZRY1dTZFVpdnA4VDNKUmNPaTZDcU9BbDQxZFEr?=
 =?utf-8?B?My9ZMzQ4ejQyb1NwWFFtaHpRTzNjUWYwM2s5MEZ0VnRzQ2ZQUm5SYjdSV0pJ?=
 =?utf-8?B?eXBUMnJ3eEE1clBON1hnUEpiVDAyNDIvRFljZVVqVGJ2YkZjSFQzMzlNT2N6?=
 =?utf-8?B?Y1VkVVMrTDRBTVI2ck5KQzJDbk5KaG0rTWNtV3M1YTVGd1NjQk9uaFRkazd0?=
 =?utf-8?B?WEorK1gyY0p2dTYxeUtTVGNOVXFFalNRdk1aR3NmbXBOMFZ5NmJRVjFaSzZh?=
 =?utf-8?B?Y1V1NXBsZW1tM3NDcW82ZUVLWkZVeDZHT2E1dURNbVNDakdXeUpFSTlYZktT?=
 =?utf-8?B?NmNsSHRNTjNwRndRemk4RW51dDV2dlducE1jVWdRbTd1SStva2lWdkhDSTh3?=
 =?utf-8?B?OEg3aGEzSFA0bXhuNmRyNHNBWFRSRjU4a2NYSUZGNzM5ZTI1QjlROC9iNS93?=
 =?utf-8?B?MFFhRWttT2hEdVV1WFlPbGhYVEF2dmdlTzhnODk5N1pNajlLVTBZWWUyUlZF?=
 =?utf-8?B?eTVyeWRxRDFzaXJKelJleGc1UkhseEJnNlRjdmZMU0VVR3E5Nk45dVliQ2hH?=
 =?utf-8?B?bi9WU1NPUGZuWjJvRUU5UVgzZUpjS0xPTTRVcGVtdTRYa3Z5RnFpWm9jckda?=
 =?utf-8?B?bzJoTTFVZ3BJMmZTRE5SM21tM3QwVHNSeFZLT05hdkNhUjM0S3VORUZ5MTE3?=
 =?utf-8?B?ekY2cXEweVRrODFCcElBeHliNDJPNmp4dG9wWFlHK3JtS29kRng1TFFyQ3Vt?=
 =?utf-8?B?bUNvZHdmVG1TTGhnZ3FjTXBBT3h2eUtZY2ZyOVR4N0lHUmRiY0ZKWlJWNEtB?=
 =?utf-8?B?NUhwOVBPTVhBSmdLKzJrN1c4aS9NZEhvRXVXUENiL1U0dUppRDRCWTVTN0dk?=
 =?utf-8?B?SDNDdGRMdE9PSnArWVVIbEZCNEhjZHdhcVRBdzB3alA4N1U3OU9tUzEyUzhZ?=
 =?utf-8?B?SW1hNVQ0bU1KcHdzU29neGlHT3Rob2hXSE1IRUptcm1EbklFRW5vQVZVL1Er?=
 =?utf-8?B?QXV2UzVIZnhJbE1pV3p0ZjdSRXl5V0pVSzJYNk0vc2FiU1JkR3h2eDZaam1U?=
 =?utf-8?B?RnRsb3UrZkhkSU9WWllHZ1FPaGZueWljVFY1bEdneWsxRFRPMERWR094VFc4?=
 =?utf-8?B?YXg4QjZTMW8rY21uTVMzek1idXNFYktxb1pYSkVFK1NBMGZyd2tNQXB3NHdP?=
 =?utf-8?B?WktiSjdBL1RQQUd2ZlhUMTdQUlBSSUF1ZVNlSnFYNVpYTzNWb2xLSU4xcTI3?=
 =?utf-8?B?R0FNM0drZ1RSNk8wU0g4bWJpZWZtRmFab2FXeVVkbC9GcXF5eUpTR285MnBH?=
 =?utf-8?B?UkZMbFFMeUZTampKdVRWZnFPN1pSUEdmSms4cmtVOVBrWDZpWDV4aWlXVm43?=
 =?utf-8?B?Z2kyaSt0VHFibEpRMDF5TmJUK3NhMkdSOXNjaVhoOXl2N3IxZDI5QjBTVEpX?=
 =?utf-8?B?aTRTOVZMN2tJZUp1Y0gxV25TZDVVamxsQVZweFZYeXVsaFUwZUZjY00rdjMz?=
 =?utf-8?Q?MGi/J1mFo6eLw8sVp7rHueY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 06eb413e-8b4e-4bba-a41a-08dced976647
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:02:49.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7apIrgGXyRHWnyeVFI3g1gxKNHYKua1vAiwHPdUA6/di1J8n9ncTFepVj8QHg6kt5yFX9O4UiZ+Fhd0Tj7+Vt3Tp17r1O7ZZmb2MLdsafI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10183

Some touchscreens are shipped with a physical layer on top of them where
a number of buttons and a resized touchscreen surface might be available.

In order to generate proper key events by overlay buttons and adjust the
touch events to a clipped surface, this series offers a documented,
device-tree-based solution by means of helper functions.
An implementation for a specific touchscreen driver is also included.

The functions in touch-overlay provide a simple workflow to acquire
physical objects from the device tree, map them into a list and generate
events according to the object descriptions.

This feature has been tested with a JT240MHQS-E3 display, which consists
of an st1624 as the base touchscreen and an overlay with two buttons and
a frame that clips its effective surface mounted on it.

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bastian Hecht <hechtb@gmail.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Changes in v11:
- {touch-overlay,st1232}.c: work on assigned slots instead of positions
  retrieved by the sensor to account for those that don't track the
  contacts themselves.
- touch-overlay.c: do not emit sync and rely on the driver calling it.
- touch-overlay.c: use cleanup attribute for fwnode_handle *overlay.
- touch-overlay.c: simplify return paths in touch_overlay_map().
- touch-overlay.c: drop validity check in touch_overlay_segment_event()
  (internal function, not API).
- Link to v10: https://lore.kernel.org/r/20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net

Changes in v10:
- touch-overlay.c: use fwnode_for_each_available_child_node() macro as
  there is no point in adding unavailable objects.
- touch-overlay.c: initialize error in touch_overlay_map(), which would
  be returned uninitialized if there were no touch overlay segments.
- touch-overlay.c: fix fwnode_handle refcount (overlay must always be
  decremented before returning, fw_segment in error paths of the loop).
- Patch 4/4: update description (the feature does not add a second input
  device anymore).
- Link to v9: https://lore.kernel.org/r/20240422-feature-ts_virtobj_patch-v9-0-acf118d12a8a@wolfvision.net

Changes in v9:
- touch-overlay.c: trigger a button release if the finger slides out of
  the button segment to be consistent with the button press when sliding
  into a button segment (see touch_overlay_button_event()).
- touch-overlay.c: (nit) remove braces in if with a single statement in
  touch_overaly_process_event().
- Link to v8: https://lore.kernel.org/r/20240320-feature-ts_virtobj_patch-v8-0-cab6e7dcb1f6@wolfvision.net

Changes in v8:
- touchscreen bindings: fix description formatting.
- Link to v7: https://lore.kernel.org/r/20240119-feature-ts_virtobj_patch-v7-0-eda70985808f@wolfvision.net

Changes in v7:
- General: return to a single input device implementation.
- touchscreen bindings: segment instead of button in the label
  description.
- touch-overlay.c: define button-specific data inside segment struct.
- touch-overlay.c: remove fwnode_property_present() and check return
  value of fwnode_property_read_u32() in touch_overlay_get_segment().
- touch-overlay.c: simplify return path in touch_overlay_map().
- Link to v6: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v6-0-d8a605975153@wolfvision.net

Changes in v6:
- General: use a single list to manage a single type of object.
- General: swap patches to have bindings preceding the code.
- touch-overlay.c: minor code-sytle fixes.
- Link to v5: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v5-0-ff6b5c4db693@wolfvision.net

Changes in v5:
- touchscreen bindings: move overlay common properties to a $def entry (Rob Herring)
- st1232 bindings: move overlays to the existing example instead of
  making a new one (Rob Herring)
- Link to v4: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v4-0-5c6c0fc1eed6@wolfvision.net

Changes in v4:
- General: rename "touchscreen" to "touch" to include other consumers.
- PATCH 1/4: move touch-overlay feature to input core.
- PATCH 1/4, 3/4: set key caps and report key events without consumer's
  intervention.
- PATCH 2/4: add missing 'required' field with the required properties.
- Link to v3: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v3-0-b4fb7fc4bab7@wolfvision.net

Changes in v3:
- General: rename "virtobj" and "virtual" to "overlay"
- PATCH 1/4: Make feature bool instead of tristate (selected by
  supported touchscreens)
- Link to v2: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v2-0-f68a6bfe7a0f@wolfvision.net

Changes in v2:
- PATCH 1/4: remove preprocessor directives (the module is selected by
  the drivers that support the feature). Typo in the commit message.
- PATCH 2/4: more detailed documentation. Images and examples were added.
- PATCH 3/4: select ts-virtobj automatically.
- Link to v1: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net

---
Javier Carrasco (4):
      dt-bindings: touchscreen: add touch-overlay property
      Input: touch-overlay - Add touchscreen overlay handling
      dt-bindings: input: touchscreen: st1232: add touch-overlay example
      Input: st1232 - add touch-overlay handling

 .../input/touchscreen/sitronix,st1232.yaml         |  29 +++
 .../bindings/input/touchscreen/touchscreen.yaml    | 119 +++++++++
 MAINTAINERS                                        |   7 +
 drivers/input/Makefile                             |   2 +-
 drivers/input/touch-overlay.c                      | 277 +++++++++++++++++++++
 drivers/input/touchscreen/st1232.c                 |  35 ++-
 include/linux/input/touch-overlay.h                |  25 ++
 7 files changed, 485 insertions(+), 9 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20230510-feature-ts_virtobj_patch-e267540aae74

Best regards,
-- 
Javier Carrasco <javier.carrasco@wolfvision.net>


