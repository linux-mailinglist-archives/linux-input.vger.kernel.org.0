Return-Path: <linux-input+bounces-9777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AAEA28044
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 01:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40C01649F5
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C6227BB4;
	Wed,  5 Feb 2025 00:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O8Ih3NmX"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE7224FA;
	Wed,  5 Feb 2025 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716365; cv=fail; b=HvUVCy9bvntLC1jF1JBSwsQNKFW6nUKzGnK7cBvbA1YyYyqsCbjUKP3EDcGqFe2RsqzBATB5bCxOSPCL/I0A2kYd6HvNXfUFlC4cstlKSMtUQFUlVStE18jWN5rHPsn6U/R0hC5JwJaALeAD8gm4vowL6ruB43I3vpNnCyl7C+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716365; c=relaxed/simple;
	bh=kxEEL9Ia+LZHXbnYv0nfv73rQ6UdKyuduhKeBuQGwtY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=B3w8nlTT5M4jKesw6hTAeLj/Eb+GZ+hC1cEK8wQrU0SLbKG9/uSba9LSIIDsy2KM9XMgb8joNXet2T+aPog7KtDPxWqs9Krn2i4nYepr4b2KzKdsyalW7aMsbsl+ofDBZpJGI2ezpCr+8TfSb+B4ktVj385E9ClCsHgUjE6KYG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O8Ih3NmX; arc=fail smtp.client-ip=40.107.249.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBGgAqgfBGs9ECLpO4oNyyQQb5ohPL+gKvHGa/+/37svuIuvX+XfkVHUQ/H9VTigQWqQ1Za+/amPNkYyBKohLZn/yDCigPP8NvURId968N4W7WLxMnvE3qMu+lH3bK03Jb1/3mdcW6u7icw2c0wkJRz0WYpRReDsjENj5NyBRlCFABgGwTZkvPz6RMZS/X0GgM5L5bGnm2oILDS7+gHqLDTwhbQrejQ5n8/bc8FBcSROrRk6blV07ZBY8HijRdbw5ih7VuuxJ3LZ/hy6pJUZ94xgrZqasEvYj6aEDQPOqWK3tMGRE47BheD61Op1JL81lVBVYpIGJ8IwQ0KwOu6qQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEUajuzgZUAPnw9PKZHRcNOPUWi/PHRQ+Pfu+5Wlc0Y=;
 b=qp6TNRLl/XLVUC16JuZM2gj+Xrj8BYXSJY7qaQzkUHfEd9m7Ebu5phToKtxPIjFjMiFooTod0FGj9ELuUCb5xMu6kbvzLGq1UGziEpCy24ImWk7k+S1fztIRUjRT2yLnjrDW/tmBvEmApSpz2EZaNeaCHFUQqWpZslBhpUp0msjV2dCJPaMr+UIriTu9oGFXlPTWJ/Cf5TRbf0xjS7KHytyDEafOXdxRp32XihfN15Vnjv7fWp/YxMO7tl6g0kZozRg/vNoqK7f7JZ6dri6STSjE0zB8484oRsa045hq56Cd9HAAjDdFx0b6DUdTgEUHYgRFWUHwsOjPxOHLkNnioA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEUajuzgZUAPnw9PKZHRcNOPUWi/PHRQ+Pfu+5Wlc0Y=;
 b=O8Ih3NmXoxpJNPah09alj5TsUsa3BeWvE9YeXdVBAdnS0jCdnx8XoazqUh4e9No1YLBMAceujT6ThxIg7UbUrRVJV99Jhbwbs7xfTyUZXoQPRV1KaiY3SAgj3f8y6TcY2yPWiXr9relUOyVBmyIL3Bz/9StAwHzZ5BGpupRLdbII3wNK7/epJ2XfYoQGqzPypI/5k+w2d+2YsdEydg2y0QrWaskA0V8kgJtquq57BYZdalCspFKUSvUZtr5wiJuqUTUPYid9GkzBGBJ4ACDtM8l5/wO/w6qTQUQLw/HhZSK1PLvupeZ+oviCym4Z25E+Hik/ynEWgWU4HwIeEQZWxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:45:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:45:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] input: use devm_pm_set_wake_irq
Date: Wed, 05 Feb 2025 08:45:13 +0800
Message-Id: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJm0omcC/x3MQQqAIBBA0avIrBPUEKqrRAuzsQbCRDMC8e5Jy
 7f4v0DCSJhgYgUiPpTo8g2yY2AP43fktDWDEkoLJTQnH/LN7YnG58CVHI2zuLp+MNCaENHR+//
 mpdYPZ5q7eF8AAAA=
X-Change-ID: 20250205-input-cleanup-219afcebf38a
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738716321; l=1049;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=kxEEL9Ia+LZHXbnYv0nfv73rQ6UdKyuduhKeBuQGwtY=;
 b=vQIc9jem/J/c7+XvFteijsbBd2go38RbPZ6EDTUu01dXdct9WtaMCT8aI949XMt4D74sAdm3X
 FlVwtaqJoIcCDw26IdLxdtK4cFxq6/xUkgb2hwGbtR3Wq6hTwYBiqV7
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
X-MS-Office365-Filtering-Correlation-Id: 0d3fd303-153a-4188-6108-08dd457e7456
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVU3L1Z2NU5FNXppSmJTbktJeFN1NEJhWjBON3U2QW1VN05IZDJJdFFrNEgr?=
 =?utf-8?B?cXdhZi9EZzdVdlBobWNqWkJEQ2tEQ0E0dFlZejVMWHphTnNwcUpaSHkzM01S?=
 =?utf-8?B?YytJTFRnaE8wNllzSU1oY3U5V1N3VVRUQUtna2R1Z2RXSjc4QUVSbzQyQVhM?=
 =?utf-8?B?QlM0TU9TcDRCS3NHKzZ1eDJGemtOR01hdUpZOUJsUmhUek5ML3daQjhweVQr?=
 =?utf-8?B?bUN3dklVZGU5c0xBMDE1cndEd0x6MytNRFdqREVWbkl4bU04bXhBYzZJMDFX?=
 =?utf-8?B?MG5qak1KcXpXalJhMTZoTEhvUXNVVHB0dXZ1SVdxS0hnRmVUVUNyalljWGVB?=
 =?utf-8?B?RUZ3UXgwQW9RSzg4OFdjRnpCTFM3Vk9JN3hFSDNpV2JMTmEzK2FxQUo1ZmVk?=
 =?utf-8?B?VEJwblVGblBmYWxXaVY0clBuVHYwVnpPNjV4ZldMTXNTSU9oRVR6SHh2UWl0?=
 =?utf-8?B?QW0xa2orcmlYcVVmRFlsRTFiZ3RuWnVrbHdReUFXL0xibnNWSXRrU3YrMVF1?=
 =?utf-8?B?cS9XZnhMeHA0ZHIzdlJjRTh6TUQyTnhPVVkwWGhYVjRXbXJGRkVHTmMrbm5X?=
 =?utf-8?B?cHFra2VPWm93V2dWalRaN1lIZ1NQUzl6N3QyV3BpVEt5Y3UyYkFFblJaMUVQ?=
 =?utf-8?B?SkhVZ01Fb3hrbm1WakhnbUoraEdGS0pqYXZaeGduQmxVdGh0eEFuUSthWFgy?=
 =?utf-8?B?NkM1R29mNGZVZXZ1cGMzTTBub01qWTlYN3ZJWTlOSG1Qa1NTalA2SnVnVVM1?=
 =?utf-8?B?a1cwczcrOFBPbDFMMGY0T3poRGtxTUY0WnV4Ty9NU3NOMFAxVGgySzdqOThF?=
 =?utf-8?B?dFpRYlFqNXEwYXhManRhcXlseVhKbGhvRldhRVpFVkRyc2s1NmNDQWJPS0Nj?=
 =?utf-8?B?Y1FENEtNMGFzbnFDZTQyVEoxYktEcnE0UEdDWDZ0N1JURndORXlyRkxZVko0?=
 =?utf-8?B?YmpSR2grM2JwbkJUdW1YMm5EbEhSSnlIT1hxT0l6U1hNUmNFNVJ5M0lEZ1JF?=
 =?utf-8?B?UlhhNXY5VlJtUStEZDVLbFhmc3p4dXJ2NHF2YzkweWs1clpHV2ZOOXphaDNP?=
 =?utf-8?B?NWVuL0w3ZWhtQ2c2UnRoalQyUXBCSzBhK1l5YU5rd09wUFZkNkZwdE9HQTdk?=
 =?utf-8?B?N0hIeHR5SUMxMmYyNDh3aFdjR0xQR1BnUEV5b2pjRXAzdlVzNFdLVEVVWTFR?=
 =?utf-8?B?SGRWTWI5NE5iOXluaHVlTDJBR0doc0ZxeDIyaUpkN3JQS0M4YTFiZTJ3bVpu?=
 =?utf-8?B?RGcwYzZ5TXMrVnJOcmRJczlaVWpTUjVyVXFYTWg1NWF3VXZPNGI2SHpMeXFK?=
 =?utf-8?B?aXc0U2R5b1BjMlFBRG13TTY4ZHR1eXVyNW9rN3YvOThJeGh2T2V1eHIvWDlV?=
 =?utf-8?B?T0tqVW43dE8zL1phMEZmSXlLb1Z1WGxoOHVmN3Uwc091cUR5cldRQVFYbUdY?=
 =?utf-8?B?QUo0VXR1VHlicy9DUE4rUVpodEszbzRVMnhjdHNhZVc0eXNuK1pMbEtyd0hZ?=
 =?utf-8?B?SHRlU0lpNURXR2dsWWFxNWhlT0ZzMTNHV2hUM1NwV3l1WTB4dURxeUE2MVlD?=
 =?utf-8?B?c3pvQmlIdmhCTzduUG5oQm54UHUyTC9mTncvWVl5VXlERnZuVCtyTW8zRTlI?=
 =?utf-8?B?UzhFVGcwS0xCNm5hcHV6bXZIY2YrSDJvRnhES1hkcU9saWdHNFNqbFExd0I2?=
 =?utf-8?B?RjdlRjVOU3AyU0VtTE43WVk2STUyNWY2b3ZHR1R5cUxIWDVOelp2U2l1QVJJ?=
 =?utf-8?B?MkpBb24rVzdGNmhiL1hSNTAyTXJTNTNPMThrWGdMcWYwZHpGaXRKZlIzM0I0?=
 =?utf-8?B?OFZlQXZoaEF1eEJBZ1p6aGNSelBCbXRaYk92a2RIN051YnZyQllKUjVlbU14?=
 =?utf-8?B?UjBNdkc5cnJzU1ZObEhNb3ZKNEFiSzF2OTJXU3NsdjcreUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWdmS2FjUU9Ub21TMnUzUFBqdHJidVZSbHVNSUpjSEZ3aEVEdkdjY3RMVWpL?=
 =?utf-8?B?RWxhN1Y3M21mTXpidWtleHBhcHB0aFU4NkkyR25iMlhpTUhhWlpKRGVvY09I?=
 =?utf-8?B?WGE2UzZFUmgzWmtOejN0dFYraURaSjdDMlJNLyt1cW1sUSt0SmZDZTYxWEI5?=
 =?utf-8?B?U1pmaGVFdndGZXBnT0ZRRW9SZmZWR0t5eGEvcitteERFeklLYWxDT1VSOXlv?=
 =?utf-8?B?ZWdraVFYaCtWbnRvTXB6bjBXVjVnZnJlRzd5aE9INEVFaG9OZmg0eUhVcHRF?=
 =?utf-8?B?QnlHMnN6NEJOUFJWbnhxRkxCelZFY01kNUM3ZnNyYVJqMVRGYSsyd2ZKdlpp?=
 =?utf-8?B?NldCeC9NUWxjNllxQ09HV1p2NDgxa0RiSmYrVE9NQzZFVzJqNmdBUHl0MUtE?=
 =?utf-8?B?SXFuaVowWEpaRHU4NXlMbmxMYmZPb1BHV1F5cDlmazErTlRzenljc2YwUHRQ?=
 =?utf-8?B?L29OMEJzTUJmODlNaG9EcllETTZZN1VqekpZUVo5YjdhcW5UODkxZ25FS3pN?=
 =?utf-8?B?a3NVZjNBQ0Z4N285MzIzV3ZYOGxQVFFCMEl2NE14dGZDYmp0cmNMMVlwZUNN?=
 =?utf-8?B?VUVldTN3NTdaNUhndnVpMjRDVXMxZHZJVXNPU0RYR2ZSOVZTZ280cWkyeTR5?=
 =?utf-8?B?V0wxcjFxMit1Z3h5NWRUSndVejM3RVFMcTU0WWxkRTZ0ZVh2ZEgyYUc0cEwr?=
 =?utf-8?B?VlV4b09wL2svVXFBbVJGTkZnV1VxRTNoSloycUNKUUlSWmcvZURwRndSWjdm?=
 =?utf-8?B?TkFFcVVWU2ZDdVd3WElKaHlZRG1KWGhUREU1dnFQQ1BHRzBnZDR3QURPTTZz?=
 =?utf-8?B?MHp1bWE2eEtVR0prRVg0YndYck1LQ1kzWVZoR0o3NGJ6OW5DUXcyclNwdklL?=
 =?utf-8?B?ak5Bb0w0VDE4S0JDb1kwRXN0Ny92bWsydDE3Tm9ZWVN6aDYyRWl4aEJRRi9Y?=
 =?utf-8?B?dE9SUWo1amJhMENpcnlhKytvdHk5Q3RnbnBnY1RYY2lCelIwM2lnWHJCQy91?=
 =?utf-8?B?L1lnMmJ0TkFaaVkrbllnT2VsYUFSU3dhWXl3WUV6YUxJdE1DQXU2TFNnaGpV?=
 =?utf-8?B?Mnk1UDRsc0kyQXIyY1pHL0VsRGtVeENCaGpaZnhmSGNPM2xxaXlESitaemlE?=
 =?utf-8?B?QTBodkJtS3hscVBtNmdvaFhJQXFXdTRKTUNPOFkyRTlGcFZOZ2krNmtadG1O?=
 =?utf-8?B?aGtjSFh3Z0NLU01OaTgydnhnQ1A1RFpLWEZWRDh3cXZuNll3d1Jnc1dsYVZr?=
 =?utf-8?B?UktteWN4dG5VWm5vR3lXMzBOb1FvVkZIRElPczJLYWd6MFI4bkh6dk50UENv?=
 =?utf-8?B?N2F3THcyTEpYc1lBQUQxUTNPU1VRQWJUdXpucVN5ckswUWMrVk5tTWlBbjlQ?=
 =?utf-8?B?eXh4Umxyc2VsU0MySUc4enhmSlAyMTg2OEl1ZWNkOW5tenZJTVlmTjhPSUo3?=
 =?utf-8?B?WVozQVNKZERuNVFtb3hHOXM5WEU2bC8xdVZ0NFVXQkhlNGIxNGprWXpJdTNQ?=
 =?utf-8?B?cjBZYnlReldZSXpxUVBGcTZmdmFja2ZkRnpzbG9PSGt1V3QwWVA1RVdVcTZ3?=
 =?utf-8?B?RzdMZS9SdUVsQ1lWazlza3Z3eXZLeDREMGVYWGVVZVQvQlk5ektvR2w4M1VJ?=
 =?utf-8?B?K2daMEFYWHprc1U3TnZwTFhRdnJtbDhOMWk5U3kyRkZLWkZ0ZUgvQnlwNkE1?=
 =?utf-8?B?Sm9RTDZTZWRLL3VveXM5alU0UHhsaTFNR2M5S3hBbFhJWGk3c1Rqa05LNTJJ?=
 =?utf-8?B?OWMyNjU0ZEhsWDh4eG5kWEUvS3QvR3AzNEh4YndYUHpTZnhQZFJqaG9ZWVRh?=
 =?utf-8?B?dnROU05INXpIenJkUTB3QWQxZjZybFplNmtOVmxEckdjTUVzQVRLU0xZcUdM?=
 =?utf-8?B?citBaTFMOFRJQUM5cHFuSjJhQUxPK0lCV0c5ZmQwZzNwOE94L3JYV3FtYTRu?=
 =?utf-8?B?dGJFQVNYVTlzZ0Qva3pBZmhwNWZCd2RlWVdCcSs2WDJOcXJKMXBKWWV1Z1o3?=
 =?utf-8?B?K2pWalRkd2NnajJUdTFhYXFneVA1UURCVVNuNVZET2F5UVd4dzczRTdPS25Y?=
 =?utf-8?B?SHc5OEtXWEgrZDc2a1E4bWcyRjNIVkViVmlGZWwxTDJwcU80YmNKODdRQ2N6?=
 =?utf-8?Q?UT3teaJTTApFguRrk/ksfwfnK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3fd303-153a-4188-6108-08dd457e7456
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:45:57.8799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC73FrJM6w1FIqI1JEh/Hj8Nq0GJ+spjypdsyGyfLmxBcACM7Ctj8i8ByUFLoFel6Tde3KUdBGXDtPxb9iYBKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

This is a pick-up of patch 2-5 from patchset [1]

Since devm_pm_set_wake_irq is in 6.14, so resend the input parts.

[1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
      input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
      input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
      input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code

 drivers/input/keyboard/ep93xx_keypad.c    |  8 +-----
 drivers/input/keyboard/omap4-keypad.c     |  8 +-----
 drivers/input/misc/nxp-bbnsm-pwrkey.c     | 15 ++++-------
 drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
 4 files changed, 21 insertions(+), 53 deletions(-)
---
base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
change-id: 20250205-input-cleanup-219afcebf38a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


