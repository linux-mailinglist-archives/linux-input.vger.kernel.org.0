Return-Path: <linux-input+bounces-11714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA330A84717
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 350C71B818A5
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D684228CF67;
	Thu, 10 Apr 2025 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="QGKDnZMb"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011031.outbound.protection.outlook.com [52.103.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297A1DB366;
	Thu, 10 Apr 2025 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296795; cv=fail; b=VFsVtSheNICWa2w8jkmzY17FzA1zwxSbEUMJZUi5cPeIUzkrgEuNyTTgwWkH0wcOxpERc1TPndXRejSmYvYXDiymqceFNO9Xt2VsMfK4cAG2IHTaMzWRb9J4swu1r3Z/xSpiU9Dndzc27707jeLk6sXiOBg+EvTVqqiXL9azzh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296795; c=relaxed/simple;
	bh=fi0Mb/JNGjr9IZ2sQ5c8cb6lopS9/lbaeYJNwI2GAQw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mhCQJgS946G6R8K5coOCBr6Dzp0PqxOiXUBXiFSA009Xt2KPsMlWV+Bf5gI8jzTWbi22aL8lId7vy6GzhplV+L4IwnsNGaMrSRBfqGMjYpkLq8QBZpDi0ePTxprLB/GfmsnPHu/cc6X0yFZOjtni01JySNBQa1P3uKyxvO4/jY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=QGKDnZMb; arc=fail smtp.client-ip=52.103.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2ajvavMvoB3uMTdkhFLGFK8R+Ym64gjk0PlSojHZxzRoSNYDuB4eSQm4a6w2YjvSrRrSfddlRIZI+ZzGzspsDWiPsf8JkvieLP4xJtJUMRfyMgL+79be418zmH/RFQ5BbzHPtvmcl+xuiWRV5okMn8vSp05n9bKeJBaYwXlXtBBwDqbtAEgEJucP7Ylc15RrKKOkYZpF+aI7AbqKTZ4QvWf22wpoW83ho322OR03VCyB09tP1KxOzEpZDla780+J40LTiWwPQGOXWTIepnpUCgmu7TwlaHmcNR6ejKPny2ljlsUF3WB1WY8fREmDep8A22KgrY+ANRgPpgOmIu3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijIk++SxwcY60Gq3R1JBICZkp/2TOaNRuXRTC/S3hvI=;
 b=Uys/1Dq+9t0vUu/Z0xcF0SfpiGeolEW0u/yJ2a7XwbVHMkNioLu9dGwW7mR7nJjpcXTpFH5S0DbSyDbtWIYzVqh4apjy4Rka27wUjALjRAoP5MZW9/vYgDy2btuzPwrcFjddnQjmYLtzxpMjQnGRsw9IUKCO/Nt7bM0JJBfEMv7caeeJNPV6f3KHv2ExSuwvOLVuboohjsz5nb34jiUJ76CcIXg2bXUr8GA4h6dUU9z8/ObNnn3KWLbtnfzeST5jdiXdrl8ZeeowEAzNzE3Uu8ixZRsA2Y90sOtMyCNOT2l3U5uqjOx/T2T9M6VLsFztbE+mvz7I2LKjMmcDHS0mNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijIk++SxwcY60Gq3R1JBICZkp/2TOaNRuXRTC/S3hvI=;
 b=QGKDnZMbafnGCt3I18kP2T7GzUro0YjqvC2esgGHgozYu7OyblI0tR3AzkUp/bl+QYlxgRWmH7/Fz9NfLqJGubqn7RoWTxzVylSiq0kM3os/0rejLFxsW03eWfV8tJISPEuy/cEq2/QsVgzd8FWrb3H4Juv0x+0nCXlQi91+BPyqJFBZwg5k+gmBDyKrPrMo8TSFRERdw9HfPRDJnK9z3fqcFoq+Sv8uAOpvIMO3XnsUeucJrcixW5RI3eBKYpNcJe06jxfiNadFbC8lE7JvtyLHbY6qf1DhGIb6QMkQD1VkHnh3ZmguEQeRm4bV69ufkhcMLxbUA4+Ps4xrYFpsjg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA1PR01MB4164.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 14:53:09 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:53:08 +0000
Message-ID:
 <PN3PR01MB95973CC9AD4C05E8241116F3B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 10 Apr 2025 20:23:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] HID: HID_APPLETB_KBD should depend on X86
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Kerem Karabay <kekrby@gmail.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1744273511.git.geert+renesas@glider.be>
 <8fb6c5995f0e72482bad6367d89d9ee5312dd409.1744273511.git.geert+renesas@glider.be>
 <PN3PR01MB9597160EE7E131BCC171FA39B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdVYVpgS9fSMbB=S0cF=1QLyVQ993q9-JizBS2N6azSicA@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAMuHMdVYVpgS9fSMbB=S0cF=1QLyVQ993q9-JizBS2N6azSicA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::8) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <e9221349-31d8-41e8-a1a6-4ee147a72118@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MA1PR01MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 717e3580-df40-4d68-31d9-08dd783f6836
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|6090799003|5072599009|6072599003|19110799003|461199028|8060799006|1602099012|3412199025|440099028|10035399004|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkxzdHh4ZFNpSzFPLzlodkdWNDdxYUV5WWxaN0IybWlyNmRDYUUxc3hibDBh?=
 =?utf-8?B?bDZTZ2RSZTJONVhTVHRFRzZBR20vRFN3RmxhZFhRbVdSTUpEdythNXRjeUZO?=
 =?utf-8?B?emJWOFdoMUg0NDVselczWVQvUFQ2M2hwbVl3T1EveEMweWxROXFtRnZ0eWJ2?=
 =?utf-8?B?aGRhRVQ5WmtaSUwzL3k0dmlUL2VLWHNtcWVsbmZyOXRLTUZGQ0l3ekU3VTlw?=
 =?utf-8?B?d1hKbHJldnRPTUVheDRxczBDSmhJRnFLbHExUG02QzA5YUtRSGR5eE5qRVJC?=
 =?utf-8?B?dkZ2TXYySG9SU0lZNkhQc1hkOGpienducTcyVDNWdDFScDFOOWNxWUtzOWYr?=
 =?utf-8?B?VXJVWXhnSnlVQTFTdmUyZC9GZnRqMm42NXkvTGtCYUJoNnJiV01lcUQ5cDlD?=
 =?utf-8?B?U3FPMWlOSm0rS3prdFQ3UnA5cW9Dc2xVQXpMSzc4d0U4b0tJNjl5TTloSENq?=
 =?utf-8?B?WjYwOWtlZ3dRWjhmS1FJR0JrSGRVaXltTmUvbWNsVzR1dkVRUWlicDZoY25O?=
 =?utf-8?B?Mmc1NnNDT3UrdzFtcStxSjdvQlB2SEhxL2JqeDJ2dnpEVnlwMnR2b0JibDJU?=
 =?utf-8?B?cmdrbFF1MkN4blE1NEZCYzV2OUFnWGs0UDB1NHRVU2dqdUJEVTZXM3F1U0l4?=
 =?utf-8?B?RjRsWUlweEVoVE1LUTQrMG5aZ3JxM2RLMlZwWFhGcVlPZ3MvV1dTWXlyZHRk?=
 =?utf-8?B?K0FrL2NVMGxnS1hNWitNTmhjU3NXMmJnMHFua3hSN1ZPb1ZsU2JXNS9CNEVu?=
 =?utf-8?B?UENZOTZvb1pSVGNUUFNzbWk0alZuRWxUSFVYa1VFMEYya0IyTmpFU2tLNk1q?=
 =?utf-8?B?UkMrWXdiWHN1SlF5NnZTRFpiWnlDeEQ3MU9XTkx5UDlkY08zeTJxZUptMmtV?=
 =?utf-8?B?NEszTTJtNXZybitKbk9jUnA1VWZ1dkd3ZlJOSDFhUmw3dzY1QnQ2V3BLN3hT?=
 =?utf-8?B?SW5SelV1VWVYeWZ5RStEamJOL0pXNm1UOVZpMHppTWF0YWg0OC82a1Fnak4v?=
 =?utf-8?B?bUFLVUU1MDYxaGdGOVpYQjZxVzIvV0xVbEpTRFNhWFkrdE5nU3h4dittSVJK?=
 =?utf-8?B?VVhXNkJzaUY0NDdEZzR0cXEyRmVEcEpUY1duSzhReWlydUJET0d2REN3NnBR?=
 =?utf-8?B?ZzJiOXZDSWQvQjJtNkZRWThTakR1Q2N2Yys0UXN4cTRBbjBsUkR3SkVsQUVt?=
 =?utf-8?B?eTlQZm9TVmdQSUpsSThQdU5Jak10UGNHZGtIdzB3dGVnQXMxV2Y1NmVPYTF3?=
 =?utf-8?B?aEprVkVCMFFQL0ZjQms4cmFGTFpoN1VpNTBPTXYwZmZxOWpKMzIzS2puYUhs?=
 =?utf-8?B?RDFhWXhOUHJEd0JjcWZyL3hlOFQybk9YZk9mWkh5dkZPOG5pWDZKekNGRVdP?=
 =?utf-8?B?UFdmWG4zczg1eWw0c0lzamZLczRHejJCdlVCTEQ0WGU0M0FpczVGeWhZZUtp?=
 =?utf-8?B?MHI1czQ5K1Y3YmRtd1g2TUVoY0hhQUYzc3RXdDAzMndRRWlFU3RyVElubFMr?=
 =?utf-8?B?aU9POG1EbUhxcS9YWWJtKzBBT3dlaE8zYkdNVXZ2V0V5aTBWMTh3TlJiOXZt?=
 =?utf-8?B?bjBuWC9VSnlwd2hKNCtweGcwNzYzQWZJSkVjc3BrOUlUR1JqS0c0cjY1eWNE?=
 =?utf-8?B?Y0VjazJteUVQTDI1SVV4Vkh3VmEwQ3lJMXUydDlYMUNzSjVzcVpYTzJoMXY3?=
 =?utf-8?B?Uk1kNzJYUU5FZWs2dmdxaTBSSGJUK0E5Rm0yYVBESkZtWWxIT21DbzFRVEd0?=
 =?utf-8?B?eW9XQWZQaXc1bkQzcm5vd3RrZmJCK0ZubHMvSXRPbVlhTUN5WVdlc3NhRzA5?=
 =?utf-8?B?dmxjaW1hUDBwQWZSU3F2dz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWFURkd3dlJ4RWJLNzJDZ2UrcW1sOU5IdWNGQjBIWVlMeWtqZzlRNWlybmYz?=
 =?utf-8?B?QS9xb3prNVdiR0xXSXcvbGc2bHlCOTJEcVlvNVNtTktBZmFvbUZIbjMrVjdP?=
 =?utf-8?B?REFlYnE5SE52Wm5SZDQ0MDg0c2NTYi9KZDN4VE5FZE9qbnF2NlJ5ZlR6d3dJ?=
 =?utf-8?B?TWpjMVZ1Y0pDNDFtR0NtUEEwTDY5QXBLcGM3UU1uZjI5Q1QzNkZpL0ZzU3Uw?=
 =?utf-8?B?VjU5M0l0MzNhT240MHZ3QzJVQWN6Vzg2eWlOUExRbE9hTkVjZFptQXVPS3BF?=
 =?utf-8?B?OFM4enB4WWxIQUNxeTNXYTRTWGYxcGpWOFkwZHpsbFpyb3RJZkxuNE9SbkRY?=
 =?utf-8?B?WUpIQ0ZJZDBxSzZyUldXSGJVUkdHM05laDVreDZtL25zTEszYVYxVUNFcVpO?=
 =?utf-8?B?TGVKOHUyU2xWeVp6SFFCb1JtdEVGN1NuUmlteXN0VDlXUWR1Q1RLb3FycVlE?=
 =?utf-8?B?cktoU1FTZ04yMm1DSVZZaGVYdkR4cUZOaDNDUko2bmFKeGZDTFhJYmkweVdh?=
 =?utf-8?B?VFZ1bVVJZDd6cXN4emdLLzVpZHFZdHJtelJNNWtnRzl5NWY0YXE3WXY2dUpn?=
 =?utf-8?B?MWk4M28vZnhjUUtxZittRzVCeGRWZzYrRU8vcDdURUFFbjRUUDNTcFdnZ3Vq?=
 =?utf-8?B?MlVkOEJRQ2pyVWo2dWRlRkVmVEtCZjBVZWcrUmh2eXMzVU9HdEZ5RVFyWGdv?=
 =?utf-8?B?T0NLZlhta2QwUE1LS2l3ekhMRUd1TVlMMUxaOTNpTDRGeW9OTG9KeG5mdnZE?=
 =?utf-8?B?amdUMklXVU54SG5HRmVpSW9OTzUyaVBPSUlQbmlSZDRxRFBlZ0Y1VTYydmJm?=
 =?utf-8?B?QUx5eFlXc0RuMUh2cGZXSk03RjBTdm13Z0psbVhrU1NFVVFvbiszdHdsalVK?=
 =?utf-8?B?SUlWK1B2UzR1TGY1WmdPN0M5Y3RVdVNVbXVKV3hDNGNhY3d2M2FIdGUzUy9V?=
 =?utf-8?B?d1lUZ2xmcktyamZkYXM0bzlKbW94d21HMWs2akl3QTFmaVE1SSs5UGJsZGZp?=
 =?utf-8?B?bWhTdkErOXNVWmx3N0pmV3ByVEEwZ01IZnZsZm1RMG85U285dWpuQmVEQVFi?=
 =?utf-8?B?ci9PMVVSTWUzcDNSQ29sL0ZwN3NlNEVNUTBBcFFwNkZLSXBLRWoyakRkb3U4?=
 =?utf-8?B?V3RnWGNwdGdTaE1zang2aGZPV3l4WDkxT0k1Z3dseE9tUGFGUnhPdVo3aGFl?=
 =?utf-8?B?TzBLVDB6ajh4dkNGVW5Razc5empxT1VwVXZpQmJiMk5JOERncGoxOFVKcmxh?=
 =?utf-8?B?QW5RZE5sTmFHczVOLzVYaVBDK3czS2NEYzBpdUNTRjg3cEZPZDcxUFVRZFkr?=
 =?utf-8?B?dTV4SW5mYW92LzljcThCUis0NVN6RWlDM25uckcrUndYQkU2NXNRMW5iSFU3?=
 =?utf-8?B?L1ZXQzdkMkVlMzZLMVBabmxqTG1HbTB0ckdoNDVPUWxBM2g4M0dIUEN1OFJ0?=
 =?utf-8?B?WXUzbXUvNTZ1czAwOTJKR3d6YWtIRjZPTWkrSmZjTVZPODM2TTlWOE8rNndy?=
 =?utf-8?B?YVE4NitGK0NFcGZBVGlLY0xVTmRUWmxpVEFUaDBZTG9hbkZybWZoRFIvL09j?=
 =?utf-8?B?ZXBOd2ZTaVV4SW95cEhFdnp0RW5LWEw0RWhCT2NoQVNhY3Q3NE1PYUFPRjVU?=
 =?utf-8?B?NFJPaXJHa1hZVEVwU0g0a2lUTzN0bXBkTldEVDRkeDV4dkJlTTd1SVg0TGMv?=
 =?utf-8?B?Vlo4cnBibk4rUngyVEhva3Fva1NPZUZ3UnNYMVMvUHdPU1NoUUF6QXNtRHZH?=
 =?utf-8?Q?KuUmpmLQd53PsOrGhb8r2mHHaIVXOu+7dJk0I1z?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 717e3580-df40-4d68-31d9-08dd783f6836
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:53:08.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4164



On 10-04-2025 08:10 pm, Geert Uytterhoeven wrote:
> Hi Aditya,
> 
> On Thu, 10 Apr 2025 at 10:52, Aditya Garg <gargaditya08@live.com> wrote:
>>> On 10 Apr 2025, at 2:01 PM, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>> ﻿The Apple Touch Bar is only present on x86 MacBook Pros.  Hence add a
>>> dependency on X86, to prevent asking the user about this driver when
>>> configuring a kernel for a different architecture.
>>
>> There are a lot of spaces before Hence.
> 
> That is intentional: double space between sentences.

Interesting choice

> 
>> Also, Apple Touch Bar is present on some Arm MacBooks as well, so probably mention that this driver is only for touchbars on x86 Macs and there is a separate driver for the Arm Macs.
> 
> Why is there a separate driver for Arm Macs?

Because it is a completely different hardware on M1 Macs. On x86 Macs, it is a USB device + has both keyboard and drm mode. The keyboard mode makes it display a predefined set of keys and was made for Windows Bootcamp. The DRM mode, makes it a separate display, made for macOS.

On the M1s, it is not a USB device, nor has a keyboard mode. I forgot what exactly it used at the lower level, but it was quite different from the x86 Macs

> Which driver is that?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/adp/adp_drv.c?h=v6.15-rc1
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/touchscreen/apple_z2.c?h=v6.15-rc1
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


