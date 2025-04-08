Return-Path: <linux-input+bounces-11572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F9A80467
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 14:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57AE43A88C4
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 11:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECEE267F57;
	Tue,  8 Apr 2025 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IXs7eNfZ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011035.outbound.protection.outlook.com [52.103.67.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C608267F5B
	for <linux-input@vger.kernel.org>; Tue,  8 Apr 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113549; cv=fail; b=otMvemvThKa5Divy3ztc59AcBrBMeHCOjtJLQw/zLRdrsETQR5lw9jXgbfbkpzFeEDOUCC4+5snA1QICxd8xF6T58YIboZ1Q8uGlTb0F/XcP6A4ewj9kEgXT47i+nSttRzHDZ1rBalaHTSG4atA4+0BliQBpztDYpmBheNqdCew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113549; c=relaxed/simple;
	bh=HpXXBAhS27IcaysRXWIG+MV0Sba2DSDto4G52DwMj+A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ryUYuA2E8hFmtnZ+Idm65pI84GvucCiBL3e5tPB4/b9Ibn7GPHc+tcegdLbwCH00ySly/Vkqu1AeFJxyXqGAKe6yLcrmZC/C/xuQ8cy7DXkuNrMMEPbSkUw3ghwqF9sGd9FcYwZKmMNorLmV8G9x36Yi57XVxd+faluF31hGefc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IXs7eNfZ; arc=fail smtp.client-ip=52.103.67.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2gJQzF2utYnLbqT4TNy++ACWkgwYYQEOaMvhrpBI+mAKe0+K3QoAzte/OvG50FKFDS04/N+0COK+ah1qtbMeSlHrSXOqbPRgvkAvRCdwEgEfrsGiJqsHbpXydwKTQyElrKDe+pOcdP5ojKR/L0E09J+wstgTQCfE7bYde6SVlFB1zVIk553sjXm2JvLH5rHYf2y0zOzzlFT2bLSsyu71bgig4M17YTz5L7HVtx/Ne0OYnBqri5xf1GQTKe+Q/riVnpqRdrndDG5HtNn0Of279gIu3BxyCaF2aqSZnJFH10fB3hHSevxlQJTtdg205RsLMlc8rbZyOfnI8On4j4log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGdqIIpDDT+Ywkyd27k+B4ze5X4PJ0sZxkS8mM/xb/g=;
 b=S6bPe5O5+FVoZwdyZOG9vVCtDqnGQpfc2s43p4Z8h2/7/q1WF8RCzqzRh//X2atqYQPyWDBAXErFsXouXrgwONDUlWTjZS4N+m2WVE4RlB1su7+upVA881w99VfcmYu+QdOHuhc+4osks18QjMV274sLq5ObeZcTIGtC97vMognnP8sCYBw9xRi71CUOYQc33shJE7MO1Wo55U9X7+zANCP7Z0K1sDBMX7zqb1Nt66FuF/ysB6tiJqoWI7ayAO5a7WRNGy/FPc/VvmvrQxsC2N9+BTi1WedtrrUxi8nD9dDTyofOH/PxCEaMBXM45UMfpBv+7eRuR2ORpeEz12qhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGdqIIpDDT+Ywkyd27k+B4ze5X4PJ0sZxkS8mM/xb/g=;
 b=IXs7eNfZ/V7RX6oq5isvatRfpU3s+WQs0I2Apr7Lj12/tADeTn64m5krWSE3k4wrD/gQ9ROx2cKRBKf2zPHH6VQKuKN75OlEg0u2mBDZhi1NaeFUJMBNnHRX4WfGJvw0Ba4qdToYJBJfuJjJkoDQYYvDpS9qg+VrkUHZBRxclEWTgcOgZ0Ang8pHCsAfLDPAvxX6SxNDofBcZ6rJlC4corulvvAVyKO1usD5pRy+myTo6Oz+o2r+Ei65iuMnbgIk3Ees+nNCF47AqXuDlF7F/ZCifCd8MXMbejUD0OGAXj4Zjv41n9XJMosvVJT/aIHeb9R0DBDynRBZRvNmzEIFYA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9873.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 11:59:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 11:59:04 +0000
Message-ID:
 <PN3PR01MB959714051C429C203FB1D97AB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Apr 2025 17:29:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: jt <enopatch@gmail.com>, linux-input@vger.kernel.org
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::14) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <dea199d1-67de-4ff7-89c1-96fc35ea42cb@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9873:EE_
X-MS-Office365-Filtering-Correlation-Id: 0846216c-1719-46bb-9d58-08dd7694c228
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|8060799006|19110799003|7092599003|5072599009|15080799006|10035399004|4302099013|3412199025|440099028|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2FNZTk5ZTNzdmVtc0NqTzJLR1RpMklCU1pYYXp0cDI3eWFQTUJpSnF1eW1L?=
 =?utf-8?B?ZjMzVjBwS1h5WVVNQ2cvWEEyZUZKRlM2eU1BVVpRZDZudEdhcUM1cVpSc2hC?=
 =?utf-8?B?NEk5UStOenpNZmUveXAxUUFuY0NuNjlqYnhjL1ZSNmlueHBFSlNYZVV1VEt0?=
 =?utf-8?B?ME1kRnROa3hWVEJCdGpLNVpPbSswWGlON1UvM0xvbUNFZ0p2ZXYvOVpIQU9y?=
 =?utf-8?B?Ykx0OW5mTDd1aStDS1V5SFhmU0x2M242eVVNYm1ERlZNa3hYcVE5YUJZd1Rl?=
 =?utf-8?B?QnpGeEwrUFZkV2NvMmk2OHJndWZYVWE3Q1ozQTE1bUZJUytCK1liWmRMSkZl?=
 =?utf-8?B?MVVMVlI3bEkxRUh2OGtLdUVxNWhHaEluMWMzRUtPYkNPc2ZzdURMUGpLTmRT?=
 =?utf-8?B?c0hTMzhrOEtrQlVxRXVuTC9ZcDhBN0FyTms3N3RHb1RVd2NPd1QwanRsZko5?=
 =?utf-8?B?RnQ3ZUd1S3dCZGhJSnVzbkJ6UGRFdDZZUUh3eEg2SDB0MVNVdzRxc2Y4TGgr?=
 =?utf-8?B?UVliZEdSSGRmRXBhN2poWWNIbTBOTDd0KzIwd3E1Vmt3YlNHS0xSd3R3UkpE?=
 =?utf-8?B?MXhyV2laa0pKVlN2djRrUCttRXNpSDFka0ZHSFA1R2JwY1ZPVE1UKzVVMVB4?=
 =?utf-8?B?aVEyTW9BSlN1L1ZteDZsT2VkdUc4T2dNTzF3VHRoaXFKSE9tMzYwZXFFajJk?=
 =?utf-8?B?ejNBSmpGZjZhTkMvRkY5UyttVUh5Y0cybG82ZG9ZbVN1RXpPK3ZabFFvWUlL?=
 =?utf-8?B?ZUU4cGFEVGtncktORSt3MkJOYkdVOWtSaTZuRFM1SGJHY2g4WkhndDkwaWRs?=
 =?utf-8?B?a3QxNlhvTGlJYW9iME5MMVQrWDhnR1ZsbTRMUkhnOTVBV0lyQm5VOHo5T0Rr?=
 =?utf-8?B?elN2OVl3ZVpNV1VZNnZRZGRkcU9VUXVSUzRWbEMwdGN3bG1ycFFWVFE4WGIz?=
 =?utf-8?B?SS9NWi83RC9hUXRzUU14RzE2dXVITE1Da2xFc1pORC90SElYeFB0WDBLR01P?=
 =?utf-8?B?bmVvNWhUTlF6OFpqSFdoMFZsdTlzTHcvSTlCeDA0aTl2TmRsWkJnTEp3NUlu?=
 =?utf-8?B?QlBsVVFDTG56SndBKzBxc0ZSNU93MEZLUmFzbHVqRm8wSnB3bW12elhNUUVZ?=
 =?utf-8?B?Vm1KUmcyNTlacVQ0OTF5N2pVY3NMTEpXL01wVTNlNWt4czVDYjBnVVQ4d2gr?=
 =?utf-8?B?aGJqdytDODBSQnFvczBpWEdyUXRxQnB3KzFYVTYvaER6TmJGYlpnYXlDOGxV?=
 =?utf-8?B?MDhEVWNndHZyRHF0d25EMlpVaEphSzV1QmRKNVBjZWIwMWl2d2FSRkd5bDFt?=
 =?utf-8?B?WHNNSjNaUDlpeHRLYUpOcEpNTVVGdXU5VzZ3ZEZTaWVzSVBwYktzblJ4azA4?=
 =?utf-8?B?VXNXckpYMElQWWJLZS9MMXlvK1k2dFp4UWptY2VRak0reFhCdFpueXZKVDEv?=
 =?utf-8?B?RW5kNnNSTjZGVzFMb3JVeWdod3htWjNqWEJWU05DdEE3ZW9JK1IxUkxqd29i?=
 =?utf-8?B?WFIzR3I3RTdCeXRHQXZKMDVBSTNxQjdaRGpHS05FdmFEanAxb0FhRUl5RzZ0?=
 =?utf-8?B?cUZ4NXNJRm1lWkd3dE9nMUJEaUs2VWhGWnpKM0pmZW10N2s4TTRVcEpiNVpH?=
 =?utf-8?B?OUFyb1ExMzJDbUV1VndtVTN0eTJ3Q3kwdk16N3ltZWNjNHdNNENOK0IrVDZP?=
 =?utf-8?Q?WGrKUb7puYco9zxghnNc?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDg5UnF6NVlGbGpjTVRnWU1JQ011aW1Jb0NDVGZpd1BoTkEzRWd2d21SWXMw?=
 =?utf-8?B?Sjh1cUNLMUlwVGhoWEJJTm93aDF4aSs5WXlKbVNJZVUxQ3ZMV2lPSzJLb1ZL?=
 =?utf-8?B?dDIydnF6U3d0UStYekNLL1ZlS1RMOEJRNnhFZU1ldE1rVkJsd1BTcE5IVWJX?=
 =?utf-8?B?SFh4bEU3SlBYanprN2p0K01haUJwLzFnMFdaT1RZd3pHendRbkhleS9KMjQy?=
 =?utf-8?B?UVZMYUhFbUc4U1JJY1VlV3Z2Z3lVVWZNbEEzZ3RldmpCSWVtQzNWeGh1M2ZX?=
 =?utf-8?B?K2tnSzU3OGRUa1hsWVBWSFBWSk80bXlzcnZ2K0JRQUlvR1paRzNiOW55TWRz?=
 =?utf-8?B?OGo1NmQwRzZqQ1FhU0pGRjJ2c2tWVjdUY0xYU2ovUmhFWXZuUUlxb0dHT1o1?=
 =?utf-8?B?aktpRjI3MG91OGJxV1FIdnZ1QU1zcDdnUU9XT0MxOGdCZk1hVi81a0x3QVN3?=
 =?utf-8?B?MGtibStmRmFVM0wyZ1hIMmczREJzU3haY3d1TTZlMU1RVlVKbVpkTW1UQ2hG?=
 =?utf-8?B?N2J4UHhZNHA0eHlIaWdRR1hYSzFIYjJ6OWNvM1BQd0dZcXQrUlR6RVRDeW1m?=
 =?utf-8?B?T2N2R2ZQME9pd0R3UlRqZ0l0RkFiWFptdUtKTTRTY1JYMjhYYmo0Uk1vYk9M?=
 =?utf-8?B?SUUxQXptbVloMnlRQ3Z2VkVVb24vZzZhK25EY0Z2dTdGWlVYUUgrZXhmSUNP?=
 =?utf-8?B?WGJtUGdrTHBTT0NSVUN3V3NudkQvOU8vdW81YVhBaldOb1U2ZEtiMUNBeUdh?=
 =?utf-8?B?WFAxbjBoMzBNbHcwb2lYYlhrTXdLeE5Hb0xLb1pXUmY0WEhaZFFaK0RKTlRP?=
 =?utf-8?B?Z2JVZGZoeEo3K2JlMlNiNGZ6UEZHdXpzdENiMWxiaWpuSUtNdGdSd29mb3N1?=
 =?utf-8?B?YWVyZWROMUZ3NXUrZXEvR0pST09uT3Zicy8vVzlwL1l4OEpqeUwyRmtqL0xJ?=
 =?utf-8?B?L1JwT3M2NHFrWk9SeEgyRVBhblIxVmhLNWg1MjBkTCt4ajZlNmRsNHM5dmxm?=
 =?utf-8?B?WXdoN1I5MkJtQUZFNkM4bXpvZExtejduMDlmYUU2OVhiUEtPOXJ1T0syaXll?=
 =?utf-8?B?MGhLbGdram1ucDlBS1REdGsvRzY2Sm5XaFlzWFZrN0wwbnVvMGRnQnFKUjV3?=
 =?utf-8?B?NGlaNU9FSzRnYXFoQWpYNGJZZHhrNU1iN2VPWkRzWUw0SHA3OG0vbHB4ekFq?=
 =?utf-8?B?RXdxWitmM3JZR1dIWFVWTjBsMUFKVUdjdXE4WGJicy9KbmJjdStDNThtY0FR?=
 =?utf-8?B?eUVIUWxUSTBpakp6QUxHK0dMdnpQZlpJQVQyZnFia0RIMTdCcTBSU2U0alFn?=
 =?utf-8?B?ZmxYMHM1MDR0YkFTMW1RaE5taFZIR3ZkUGRpUWZjeS82b2swUVZpQTJ2WC85?=
 =?utf-8?B?YmZ4T0hsNGc0WEM1N3gyTFYvM1luem5lMnI4WlVEbFc3SjlnbWZpMGRrN1dG?=
 =?utf-8?B?K3N2M0ttdTJ0VXhoSEZETHVnbzBTNldJK0ZWVFpOb0QvN1BXd05ic1lYMVU5?=
 =?utf-8?B?QVg5V3R1UXVXbXJmc09wTysxZ1RpSGdRRk5OUUlHd250UExMTzFGN1RNRnh5?=
 =?utf-8?B?UTVqU0ZQWlZRVnlRYi8zVnlBR0hxeDh4aVZVdEpSbkNIK0lTck1VNStmVHJv?=
 =?utf-8?B?UTQ2SmxFRHZJUEZ4TnFQS1REZEJyTmUyNTNiWTRMRTNxMUxGUmtqTjZ0YlhJ?=
 =?utf-8?B?M0JsUjliRGx2dGxXOTcxTGEzUVgzQzR0cHA3YTBxRTRXSzg2Ui9oa01VQ2JL?=
 =?utf-8?Q?eg3iZg/o7fVTho4pCxjYtqCusT3nrzLcB2st2MP?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0846216c-1719-46bb-9d58-08dd7694c228
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:59:04.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9873



On 01-04-2025 09:02 pm, jt wrote:
> Hi.
> 
> The trackpoint / touchpad combo on an HP EliteBook 850 G1 is detected
> under Windows 7 as:
> 
> Synaptics TouchStyk V2.0 on PS/2 Port 1
> Synaptics LuxPad V1.5 on SMB Port
> 
> Linux 6.13.9 (zabbly stable kernel on debian bookworm) detects these devices as:
> 
> PS/2 Generic Mouse
> SynPS/2 Synaptics TouchPad
> 


Can you try adding psmouse.synaptics_intertouch=1 and i8042.nopnp to grub and restart?


> I was unable to get libinput quirks working so I filed
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/1106 - Peter
> Hutterer kindly explained that the problem is that linux does not set
> the INPUT_PROP_POINTINGSTICK property on my trackpoint. He explained
> the udev hwdb workaround and he also suggested that I send a mail to
> this list.
> 
> For what it's worth, I think that this mis-detection occurs on many HP
> laptop models.
> 
> $ cat /proc/version
> Linux version 6.13.9-zabbly+ (root@gh-zabbly-linux-39666878469) (gcc
> (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40)
> #debian12 SMP PREEMPT_DYNAMIC Mon Mar 31 02:08:07 UTC 2025


