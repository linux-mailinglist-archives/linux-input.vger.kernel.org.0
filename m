Return-Path: <linux-input+bounces-4082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7AF8FB768
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986E81F29386
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 15:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E06149002;
	Tue,  4 Jun 2024 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="TUJeu2Fx"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2118.outbound.protection.outlook.com [40.107.21.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830F149001;
	Tue,  4 Jun 2024 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515089; cv=fail; b=SHiXw1t5vzw1IEBydUk5k6LSl3+gEJc0ki31wbQKfZQITYpH63OKcaS1Nk1YfaMBxHKwkPLtMjS07pKbhZwxew3nm3sk678O1We5KsFvoTBW8Ee17htMsqii+YkSSenIEAE/dwq+mvYZVKDjYVXDh76vawtve807l/ulbG0J42U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515089; c=relaxed/simple;
	bh=n+8ZHSxOO+cGq+YxO78St4orXLLCthyVvQqvGUBi518=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=afTYW7QXwh0DDpG/GyeXHjKKvUgWTSuM0vdsyWG0C/nBSC0E8616FFoTjvosy1hrD62SS9jZB+EFkS5z152DPvcvW2wO4qS8xcH9MVRuXVK4u2LUkqqwaBTP6maVgWNjNDQUPJIrl/sMoZndjJb8QLpFZRsLDnRJAV3lPeZVmh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=TUJeu2Fx; arc=fail smtp.client-ip=40.107.21.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeSII+IYtpBIW0XrdtxFJUI5quIS/wTE2Bs9bbjaaj3laUmMvv95l2o8pnt1SpKbivCo4R9rXUryYQI6ScR9+6AeGwWnPxPSWijHxyRj6ODw8MukYNHdHeO+Qz5zkN7OQJF1bzaNIVC4j7Pv8FzFuMoP4jOmYALTizZuEydrQBZMKBkvcXvElE/08avEMQWnJfvhgitMK5SFgZCRet9HwjVccRivUx3Hnge7weoZtm6PJRiWd+2mlKLTego7f2z92Vd8jgXlO8Z6FkC+KSpou+Ij8jpT9ko3M6hZot9ny4OGFFO7wJj2g30MDaUJKCcJYQr9vaSq1rtIK+6+NS96vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsJU62CPaA+d6cak7Ee34TDG8PrySGSklFdMd96xOyA=;
 b=IsXI/7dZ7KC/m0l+0vVKAAEUmg0Z0xxeXtiE1q8FbPw3RlZVnBPn7eyBpOBVz1nP/PCKEBFRBp56aZJsagJ7aqEmKiliKTqAVauULnocQI8rL7DPfNmeE18e9Lsi6YakZidKHgS9iVt1PZ5UDp3Sq1EsaS84lP4XRdaIlpa7Yqkad6DQ+tCNordcO9Butm2liaQogZzY0jHigQFHySEDMFoR/1EiSM+iGWaWOGHUzAodCyufNa04v6Y0gL5mnJd+wOVxfD/3fmC+2h2kb4fSrcgGYiAJBvkx+uCSThOfiyJl4LkhVZzf4G6+JtVNJrl/sfuj7U6oq2pBUR4WrVo3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tsJU62CPaA+d6cak7Ee34TDG8PrySGSklFdMd96xOyA=;
 b=TUJeu2FxKFkQSStMVrZn4zwEu9OLdNuwor4kEi2bJMIHwbMY1bWWMyGT4h8C69ObzAkDGnbcBszZJtJQ1Ahow6uSYAH6EbnfkdJXDYR5TeOoEc8F57VRy610/O1dT7/n165LjUVzrmR4AMu5wp0OQIXFAW/BOGkQ6lNg1D+9nJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9911.eurprd08.prod.outlook.com (2603:10a6:10:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 15:31:22 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::a08:11be:8709:f5e1%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 15:31:21 +0000
Message-ID: <ef1bb07b-0233-40c9-8c46-0db67d1c8bda@wolfvision.net>
Date: Tue, 4 Jun 2024 17:31:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] Input: support overlay objects on touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
References: <20240422-feature-ts_virtobj_patch-v9-0-acf118d12a8a@wolfvision.net>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <20240422-feature-ts_virtobj_patch-v9-0-acf118d12a8a@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9911:EE_
X-MS-Office365-Filtering-Correlation-Id: 86dabf7a-2bcc-4858-068e-08dc84ab62f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHVOSStNQytzdG4yYnZEVklsaHlkZEswa1RqcEhPVkZ4QTNEYSs3YzBYOEw3?=
 =?utf-8?B?MEJnYnNyT1F5SXFMMVFlOW5JM1Ftd05wU0xPWlZmTDBYTWRWWFpUVnlkbG9Q?=
 =?utf-8?B?bG5KS1VZcEZtTE9OaW93eFVWWmhxS2N1ZjkrS0phMTVPaGl4MFBqWkFqcWdL?=
 =?utf-8?B?anhSeldwMW1qZXFGOHhmSnQ3WmdzZ3djODlRaGR4RHRDWEsya3grbVJ0L2xU?=
 =?utf-8?B?dzAwc1FXeXpOdDYwSXZEbjduQ2s2eVd5RGdNZ24reVo5cjBSdE5jY1ZGSDh1?=
 =?utf-8?B?dWN1ZGR5TlkydEMvcGxmSHFvVkV4UWxRaFZFbW0xY202WWR6amtPcWoxTkVw?=
 =?utf-8?B?eU01b3hPaE9RVGhTSHNIWmJwRG0yYXFndXIxQ0tYa1BCME4zcHgvTnprQ3pu?=
 =?utf-8?B?N3crODBkZVlYakRsWnVJME1mVWt1UHc1SEU1TU1VMC9DTXlpa2tyQUdXVkhE?=
 =?utf-8?B?OGd6L1lrN2R4UnlwaWt3TE1ucFhvMTFrUlpxY0hDNjc5blZ0d1ZieGp4WEJS?=
 =?utf-8?B?M2xLTHJGanlKUFZtSUllVEJEdTRiN3lQTGF1bHNUSHo3QXFXaWZ5V0NKQnlB?=
 =?utf-8?B?ODhGM0VjL2MzU25Ldi8wSjk0aXhOeTFmVEMrVnVHaWRWTU1tWEtwT3R2aFlJ?=
 =?utf-8?B?QTUvL21yWWIwTWdCMmhpRGR6dXl3aDl2dUJIRVlHTzcyTE9sQ0hXOFV1SFVH?=
 =?utf-8?B?V1B0SGM3YThkcVh6b0l2RFdhYy8zMER2a2tuTk11MTFUaytTZ2hSVXlpR1BW?=
 =?utf-8?B?TFFLbGlqbkhDSVRSSUdTL25BVDZmZGxLYmdjbktMb1VyNjMrR2FSQ04vYUYy?=
 =?utf-8?B?MTBLdUVrQVZrbVo0NVhOc09yS0RjdnRvb1NnalVOVjhiQVlYS1ZYc1FZTTlO?=
 =?utf-8?B?QkVSQUI0Ukk1YzlRZnZoMTZlOVNaZHRmSkZyMWpySFp6UmxJMzAyaG9CZUtt?=
 =?utf-8?B?dlFuTnZKODlhUmVaK1BPRHkrYkVLMFV3cGVMU2xjSFFBNUg2YlJnUFhHeUlu?=
 =?utf-8?B?QVcxR2E2R3BybzJCaDhjMm5YTlkrMnAzVDh0aXhLWnNnTExnQ1FIK0VlWS9Q?=
 =?utf-8?B?Y282TGQvSUMxV1RMTmFNQ0NReXZrTk5HTnZaSHoxQ3pJcjNnSkU1SXZ1bjVU?=
 =?utf-8?B?dEJ3d1VUbi9UU0V1WjlUdFQwZ25tTDBEY1Y1K1A1Y1JqYWFQTGRtUXcyMXF2?=
 =?utf-8?B?WGo4MXRvNlRHMk1xUUdlbGxML1FBbWRCSEkya0lGeFdzRDZzYmgwY1pkWnA3?=
 =?utf-8?B?NGQ1VWxGSzcxVFR4L2pXbis4Nk9RMmRBb0YzaDcrQS9ST2RaYUF2ekF1K1BG?=
 =?utf-8?B?SHloSXVQQ3BQRmJQamR6SVZmeWIrT1lXaG54VThKUkdHVWV5bXN2cEZXVkkz?=
 =?utf-8?B?WEVOZ0lYYWpHdkVFcXZ1bVNzbVZHbG9ZUkUvdkVjVGQ3dlNVL0E3TncyR2k3?=
 =?utf-8?B?cU1STlZERmxCVlBmeE9ld0dqYXJwcHdRWmFrS1lKOGpLTHZhUXphRjF3U1Z0?=
 =?utf-8?B?WERla0hOY1JHUUNzL0hhbFFiS24xaEh6cEtMMkVLcTlxLzJlUDE3djhnMlJl?=
 =?utf-8?B?dUgzakpGMUJTVnNVMnA4MXNSb0ZZUytoazA4QlE2ckpPWDJxZm94WnQrMHpw?=
 =?utf-8?B?NHFQSi96UGd4WDIzNzRnUVJoYy9hczJQNXJvN0dycDRxU3hGaWY3Nm45Ymlk?=
 =?utf-8?B?Qm5JU3ZibDF2OHdyQ29Cb2l2Yk1PdW5CSmpiM0IwcnZGNHoyVzRFdVd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zjk5SWRHQ1NDTVVib3RHVk9SUGVNOFowQW9vNXZvV2tEVVByTnliTEk3bVNp?=
 =?utf-8?B?R0dvd0pJYnZSOW02S0JnQWYvU0tpL2VYZHdPMDVtMHlBeGVoci8xbUo0TDZm?=
 =?utf-8?B?b3FFTlpSd1lnVFdmOFdCN3lVeVdQS0xlbm1tcEZFRndJVDdzK2YwSVhBc3dH?=
 =?utf-8?B?U0o2ZTMwTENWVkpFdjRnOEtVUndiUFBuMEhwRTB0SFgvNTZ4ZlhGMUhkZDdp?=
 =?utf-8?B?OFRZTFE0M0lGOHJnL3I3VFFQaCtPYXo1WTRVTWhsMTF6bkZuS2wzcy81TTJ6?=
 =?utf-8?B?UGEwYTYzb1ljRjVYUC9WVjZUWlA0d1Y0K2grZkJyNWVCZEJqdXVyRytSV2w3?=
 =?utf-8?B?c1NnbXNCWFpjWGc0QU0xL3JXY0RDZkh2c0N3dks5dzhMaWQzeGtMRi80NWI3?=
 =?utf-8?B?K0dPeUxRVThqWFV0UnNubHVvYWovZkpuL1FTZVhwcW9mVHpIdlk3U2dEbGh0?=
 =?utf-8?B?SVJDdWxJdityWUtyQ1dPUXFuWWtNbDhuOHA1NmhDdjc3T2FxNkE0eEJEYzBC?=
 =?utf-8?B?aisvYWhic2pmWWt2UHVQZ2c1MldQQ3phNkxWVjRrbHFpZXJtcEl3ZWFqcWJT?=
 =?utf-8?B?QlBzVzBwNnF0eTNKRGp6VVJZTmU4dElIaFZyZ2k2bVlqdnZTQkxjbHk0a0M3?=
 =?utf-8?B?TzlWK0dvWHdYd0xBT0x4SnQ0NWVXTzBvVnR3My9Mc21KeFJCTHM2NkI3L01U?=
 =?utf-8?B?UEZOcjhsN2lEamFJS1I3OG1mNmdzNWVsSnpnc1RiTHhKNGVpOGVNNGo3SUoy?=
 =?utf-8?B?RVhWQi9sVWVpa3FMY1c4WlZ1Y0NzN3NoUktDWG9RLzRQM05TQzg0eWYveGI1?=
 =?utf-8?B?YnRONHJRelpNeEtrWElLdm01c0YxK3djYlUzVlUvWk95RGE1a1lwUVIwQUU4?=
 =?utf-8?B?eFVPZUVKclNTdGpnd0JVaGxvajlvSzNDaVY5b0tURDNZY1dReHVvKzdrU0RM?=
 =?utf-8?B?eEs5K3Bxamg3cGRiV215RTBSdXJxY0dweWljK1ExNGRBbjlPbHQ5c0xEY20y?=
 =?utf-8?B?aUp5Y2x4aS81UDdKdkxTSHNjdlhwVnRxRDhaNTRsajFEY0hPUlc4SVhHYk41?=
 =?utf-8?B?UmRyc243SDNTUnJKRzZqdktUOXptL1dEbSsvamx3emdVUHRhRDdpYUovTEM2?=
 =?utf-8?B?Wm1CSVYwRzVCYVZhQ2xLZ0dtTG1qbWIvbkdLSzJXNDRzaWdWMGl6WHh1WENI?=
 =?utf-8?B?Unp0VDZkak9CTFJ6S2pGbTYwY3oyeHhKbzNYcTFXY1JhSWxtbnNwQnFydUVl?=
 =?utf-8?B?Qjg3THZFejI3K2t4RkVnUThyWjR4S2N1eEN2bm1MMTVsRFFCQVJvRXdwTzl1?=
 =?utf-8?B?NWVaUnpUaFAyc0pmTjhwVHdNUDhWNG5OQjk3RW12ZDloYitTWTZJNWJ0R2N2?=
 =?utf-8?B?V1FadHNYeXcvWkhwZ1NlRXRSUnZ4OThuYnpTT1RPYi9FckYxY1VKdXh4cFdZ?=
 =?utf-8?B?YmlCK3Z3RDdlYjJsK1BCcnpwZHBKbVpIVExMWWI1Q3NjQnFtRFE1bUNia2Y3?=
 =?utf-8?B?ZHR5djIzamtIdXFMaFFHdmxLQVVIRzBGbVV1SGEyNUEvWXd5Zm5LU2hkamx0?=
 =?utf-8?B?RVg2bTFSaWZxYllqWnFuUmljeXdhUG5wLzMwRW54NSt2SFgyai96RXZYQlhG?=
 =?utf-8?B?UmdVbWpiWHpmNVg3SDJnQ1dTYXI2ZXEwOGFXTFBQeXBrK0l0SHp2bzlXR2hH?=
 =?utf-8?B?NUZHY0NNaHFpeWhzczZ0eUlWSkw2cVRsUlZvL2J4cWJFQzN5bnF6b3R4MEFX?=
 =?utf-8?B?UnNKRlNmeUZkYStXVjJncjZIZndOaUN5M1NvMytpcVFtb1crTmJ1cEpSOW5X?=
 =?utf-8?B?OFNSRTdWTnlOaTkzNjVkK0RVSURpeEhzQm9YNGo3Y2ZUSndxcXYyRzhhUk9y?=
 =?utf-8?B?bndIdWp4QmYwaSswbjVSN25IVFovYnU2b0VNNUtFREZNZmhTcHByYzJuUFhP?=
 =?utf-8?B?Z2VFWnFYU21xNVFaTDFOY2VDbklPT1BScm9XT2NNdGpOT0ZtKzdHTFdISnhP?=
 =?utf-8?B?OWdHWFUrTDBFYkNYRU5rOEZPMnk5ODcxZUZQMjRjMnhIcGp2emVPQWRSbVRQ?=
 =?utf-8?B?ZHRsTy9iTHZTak5jMFc4cCtzWTdsYnd3TGo2dVVHbGZxNTY0NXRpb0JHVDBh?=
 =?utf-8?B?RVZNQWZDaGxsZFF5cWYvMVBGZ2tXZEV5dmZwM1UrNkFSQUpMV1pwSWVWM3ha?=
 =?utf-8?Q?hivvPBAABbovG3WlWFZ5yqo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 86dabf7a-2bcc-4858-068e-08dc84ab62f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 15:31:21.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFeuIT7RuAQiadGJTARTB9jN4bZZMv8bxN/EmuncknEjhz3Ch3XJjWY5PcM1c8aBQXzKyRnuMCHszzJMlol9smKDePYDjn/7sCkZlKWbm8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9911

On 22/04/2024 12:07, Javier Carrasco wrote:
> Some touchscreens are shipped with a physical layer on top of them where
> a number of buttons and a resized touchscreen surface might be available.
> 
> In order to generate proper key events by overlay buttons and adjust the
> touch events to a clipped surface, this series offers a documented,
> device-tree-based solution by means of helper functions.
> An implementation for a specific touchscreen driver is also included.
> 
> The functions in touch-overlay provide a simple workflow to acquire
> physical objects from the device tree, map them into a list and generate
> events according to the object descriptions.
> 
> This feature has been tested with a JT240MHQS-E3 display, which consists
> of an st1624 as the base touchscreen and an overlay with two buttons and
> a frame that clips its effective surface mounted on it.
> 
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bastian Hecht <hechtb@gmail.com>
> To: Michael Riesch <michael.riesch@wolfvision.net>
> Cc: linux-input@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> 
> Changes in v9:
> - touch-overlay.c: trigger a button release if the finger slides out of
>   the button segment to be consistent with the button press when sliding
>   into a button segment (see touch_overlay_button_event()).
> - touch-overlay.c: (nit) remove braces in if with a single statement in
>   touch_overaly_process_event().
> - Link to v8: https://lore.kernel.org/r/20240320-feature-ts_virtobj_patch-v8-0-cab6e7dcb1f6@wolfvision.net
> 
> Changes in v8:
> - touchscreen bindings: fix description formatting.
> - Link to v7: https://lore.kernel.org/r/20240119-feature-ts_virtobj_patch-v7-0-eda70985808f@wolfvision.net
> 
> Changes in v7:
> - General: return to a single input device implementation.
> - touchscreen bindings: segment instead of button in the label
>   description.
> - touch-overlay.c: define button-specific data inside segment struct.
> - touch-overlay.c: remove fwnode_property_present() and check return
>   value of fwnode_property_read_u32() in touch_overlay_get_segment().
> - touch-overlay.c: simplify return path in touch_overlay_map().
> - Link to v6: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v6-0-d8a605975153@wolfvision.net
> 
> Changes in v6:
> - General: use a single list to manage a single type of object.
> - General: swap patches to have bindings preceding the code.
> - touch-overlay.c: minor code-sytle fixes.
> - Link to v5: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v5-0-ff6b5c4db693@wolfvision.net
> 
> Changes in v5:
> - touchscreen bindings: move overlay common properties to a $def entry (Rob Herring)
> - st1232 bindings: move overlays to the existing example instead of
>   making a new one (Rob Herring)
> - Link to v4: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v4-0-5c6c0fc1eed6@wolfvision.net
> 
> Changes in v4:
> - General: rename "touchscreen" to "touch" to include other consumers.
> - PATCH 1/4: move touch-overlay feature to input core.
> - PATCH 1/4, 3/4: set key caps and report key events without consumer's
>   intervention.
> - PATCH 2/4: add missing 'required' field with the required properties.
> - Link to v3: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v3-0-b4fb7fc4bab7@wolfvision.net
> 
> Changes in v3:
> - General: rename "virtobj" and "virtual" to "overlay"
> - PATCH 1/4: Make feature bool instead of tristate (selected by
>   supported touchscreens)
> - Link to v2: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v2-0-f68a6bfe7a0f@wolfvision.net
> 
> Changes in v2:
> - PATCH 1/4: remove preprocessor directives (the module is selected by
>   the drivers that support the feature). Typo in the commit message.
> - PATCH 2/4: more detailed documentation. Images and examples were added.
> - PATCH 3/4: select ts-virtobj automatically.
> - Link to v1: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net
> 
> ---
> Javier Carrasco (4):
>       dt-bindings: touchscreen: add touch-overlay property
>       Input: touch-overlay - Add touchscreen overlay handling
>       dt-bindings: input: touchscreen: st1232: add touch-overlay example
>       Input: st1232 - add touch overlays handling
> 
>  .../input/touchscreen/sitronix,st1232.yaml         |  29 +++
>  .../bindings/input/touchscreen/touchscreen.yaml    | 119 ++++++++++
>  MAINTAINERS                                        |   7 +
>  drivers/input/Makefile                             |   2 +-
>  drivers/input/touch-overlay.c                      | 263 +++++++++++++++++++++
>  drivers/input/touchscreen/st1232.c                 |  48 ++--
>  include/linux/input/touch-overlay.h                |  22 ++
>  7 files changed, 475 insertions(+), 15 deletions(-)
> ---
> base-commit: 0bbac3facb5d6cc0171c45c9873a2dc96bea9680
> change-id: 20230510-feature-ts_virtobj_patch-e267540aae74
> 
> Best regards,

Little reminder: this feature was reviewed a few weeks ago, and it is
waiting to be applied or receive new feedback if required.

Thanks and best regards,
Javier Carrasco

