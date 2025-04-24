Return-Path: <linux-input+bounces-11972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A8AA9A9AB
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297614675E1
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4A921FF35;
	Thu, 24 Apr 2025 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ou91cSym"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C03C1EDA35;
	Thu, 24 Apr 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489578; cv=fail; b=aP3k3L/206pmP+sLwlHy//Qq6RwBusP4Oeh8JZoAePF3iNFrtHGumUZI33ivHxLfDX7eMuMLyJu8Z0q+KxdcwjLnEcINpbORAyNf/t05cOkMgZ78MjdMFXXy7lapjd1IMu61lZiCSZpKL5SVpjOB9czT9Tr7b2q8hrhs64AKBMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489578; c=relaxed/simple;
	bh=hR0n8wBbwL4AZAh1yyN9cTjqBhtfCh0UPm8CkaRlpsg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tR179a2k0f8uJa8p5738HYaYr9c3wBBdGMn4sV9QCZGhvACRKX52ZyQ6Lw8t9AJKtjxFC4qIXA1llCqkoWkqvpZsOEwqsi8EnQh/Nk7SME455+wues4oSg03x8LMAchpdnIru+zbDkn+vh0Lw5TEHnLDsUZ/fnL4JNZuCtnRX0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ou91cSym; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av4okHOGBhV8y8JxXhS7TCZOPgYcyEBevAkphOBh4S9aMIj+y8XDiH8p5bwAgFWzUnjgz0ldeeOVjPfCjT+Pym0L7HTDBPFnhebLbIbneCtHrDnS/GVqVPBTf/zke8tnBHKFjqoISILs9OSqyroe3yWUMv1dqYk3e+jLDKuQ/20uCPgcRSGwHezopujMGGm3KS5vGjOBDEpPUti9RbqXHxWPYJZyWAzg5sA1c8OlWpoKQQF/r/JqVfIUpm05OV6nUVa+vH6TgXNblDK0dupJj72FgOPEKbdrnjmVNg7LUXylvCKXUhp/Gpzl4bRmKdNNudFfQiI7TQE171uTy8SFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR0n8wBbwL4AZAh1yyN9cTjqBhtfCh0UPm8CkaRlpsg=;
 b=b77LAqAlK9owftzIA/GE8tmG1BOznOCh5I4hJiSLPyAS22ato68isGCyPdyeJ5bO43tWqRD7x79qVP6DtQS3FK/EdrDpdq70mq3TmFjChc89zWWEPHRt2l3Qif4si3KTRO2tDXWtUVecEbQFBbfayWQiTE+1gD3lYwjekTtsxWQvmzCqhL0orGH/Rri0L7evRMnWHIZkkfMVeF5R42FaQik1CNpNKWVIjqqhhxV7fBO525xtF0PIqWuxFsoo0kjZQ2b7CzvbFAiXFMepWAnlUfFFlrI4jUBd/r29AQVf/4io+EVGmwRrJ/DpkghrveBJUEDqFvMX6bL7aT0CrEc7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR0n8wBbwL4AZAh1yyN9cTjqBhtfCh0UPm8CkaRlpsg=;
 b=ou91cSymais+L72P0bA56krB/uuXJ/gMUt+Fp3nPQDd9Ln4J/FEY2dXwRgaD4KBOkfiPU4wNuKrSKJEUG2ADneXJHsDc6GB0S6BUgLYukWW5uk39pT6API++OqB1Kb+WfHIa0YgwEZ4N92vI9Z3T/OI6Gilib9/hVuTxncZ2bRB5Q+CZze/acfDiwtqwhPH5Ad+rJdnIGia4w2Imt3lFguCp/VX60crpIW8OOgpgcCDeuOblGsvUsT64xX/52x4B5/ogjOiUkMtB1VRmNpB9EZAEG488o7evxHXvby+Y/+eOcvpOfVP4eWz3lE3o0jB+a6BAeInzuHOiUBtBSDmMxA==
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10c::9)
 by MA0PR01MB9370.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 10:12:52 +0000
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa]) by PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa%3]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 10:12:51 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2] HID: magicmouse: Apple Magic Mouse 2 USB-C
 support
Thread-Topic: [PATCH RESEND v2] HID: magicmouse: Apple Magic Mouse 2 USB-C
 support
Thread-Index: AQHbriHmey3Dlc42AkuMsdAcJ+Ain7Oyph+AgAAAe/c=
Date: Thu, 24 Apr 2025 10:12:51 +0000
Message-ID:
 <PN0PR01MB958894148AB5FC361E018D6EB8852@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
References:
 <PN3PR01MB95978C46B66BD92230030AD4B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <o0035599-3p0n-7rs1-1951-9o854266o77n@xreary.bet>
In-Reply-To: <o0035599-3p0n-7rs1-1951-9o854266o77n@xreary.bet>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9588:EE_|MA0PR01MB9370:EE_
x-ms-office365-filtering-correlation-id: a9096ba5-56d2-44ec-5560-08dd8318926a
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8060799006|6072599003|461199028|19110799003|7092599003|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1dtcTdBbjFwY0NZWjF4S0hnYlArRU9YVkVmcmwzR25EMzdUcUlxREN1OGlY?=
 =?utf-8?B?alNEVlk4ai9OVkRVTE5ibitwM3FFQmo4ZHJVVUprUUFUbndCSzBySHlPMXBG?=
 =?utf-8?B?MEIyS2xqb0pRKzhQdEVNRGVsY0l3VG9mRTVPZWNtVXpiRlU2dTdwSElseHM5?=
 =?utf-8?B?VHlOZjZvTHJseTRkM0lSQ0VpQ0REMExzZmU5S0R4N1hBUWlsMk5EZDVxcEhQ?=
 =?utf-8?B?K2hJSlZOZUVBcFI4Q0ZQZjJIMEFrRC9jdEo0NExDZjJpTzhpcTVZYVJxeHdh?=
 =?utf-8?B?ZnVGc3h1Q1ZpanJ1VEZjRWUxUXNnNXFXcnNYNzZacmhlQlJDZlpFaWxDUXJx?=
 =?utf-8?B?dFI2M2RyWTdWTzRnR2crMVJWdXF3WWdBY0RvTG9WUnRwZnNPdENGN3RFM2xS?=
 =?utf-8?B?OS82R1dTMC85V0w4bTJyMWgydXFadGM2bnBhbHFuOThkNkpRV0VvMVk1bHE1?=
 =?utf-8?B?VmhubWRrU0tXdXJqUGljdXBUeDJ1bGlmMGJrYWl0VUlCQ2d5R3VRZ1drZjkw?=
 =?utf-8?B?YllhM2hNaWo1QkZkczRGbE5wcDZaU0JPNzhyRHpROFN5UkxDbkdHTlZRbGE0?=
 =?utf-8?B?SWNQS3FyNFY4OFRSZVp1Y2xqNXJZdzdkSUxVNDdNV0MzRVFFdmJXcUU5dHhT?=
 =?utf-8?B?M3pweHN4b3h1V0lHYWQ5QVBMTEZvcEtYSlk4UWRldjRlTmg2RnRyK0x1OGZH?=
 =?utf-8?B?RVpXTEUzNHlVRWFQbzNKcGcwQmUvWTRXNU9xMjY2U2xDdkpFTVdNWFpCcmtE?=
 =?utf-8?B?OHpHQk5YTkVrb1VDQ3BsWXFtOXdpb1dkV1g1c29KZCsrYmtmbHJZZlN1UEZJ?=
 =?utf-8?B?eXRONDJ0YW5nOFhXUFQwNE8wdXRKMnBJNEN6WWtDU0g1azNlbmJiVks3WExN?=
 =?utf-8?B?SXNGY1dYaU9GMldxQlczZTdzZzcyS1NMb0tPN011R2JZTHI1WW9UcEhPSFRm?=
 =?utf-8?B?dnZCWW45WStMeXNnak1OT1E1RlFXQXlvaTVKS2crVFNrVzljaG9lZkxoRVI5?=
 =?utf-8?B?U2pVeHExejFubkVjeXZKc1dyU0FPeGxJb2c0dGg3b1BNRkt6cnlDUFRJQmhU?=
 =?utf-8?B?YllIcitnTnNQbHd4SGxoUEYxckVRQlB2dDdNTzQybEJUR2VINENzYmsreFhK?=
 =?utf-8?B?Qkx1dkpuTVRkamlna0FEbnd1SVNVMzlsbjdxY0ZMc0FPS012Ly9JMWNhMU1L?=
 =?utf-8?B?bXRDVHQ0V2FSeW9JSldDS1liN2p2OU11Z0h6Z1ZBb0tuMlRFdENDM1JHYWY5?=
 =?utf-8?B?dEJyWGNjSzlneVB1QmJVb0pjb3dYVzVRMGdBanlUdFQyMUFoaitxUnlRdjNs?=
 =?utf-8?B?dmpueVpTeUcza1luVVNpK29sa3NjU2Q4Z1AySHQ1SzNOWVpxWlZkd0lIT2hM?=
 =?utf-8?B?Y0cvaW9KVGhxYnpYc1pJOWxSRUZzRmlkTG4vblVLcGc1aStveVhUR2VXYWRn?=
 =?utf-8?B?TnFHeHdEMFFEZHZKTWRGY2NmS3h4NmEyOFZvWkw1Vi8ySERxVlpVelZpOTU5?=
 =?utf-8?B?bk53dmg4YnMwcDFwTCtEdGdNSXJRUDJ4Wk1ZQWRQbjJxRGhXVlgxb0RIWUlP?=
 =?utf-8?B?eXAxQT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QVRLQUZtLzJEakp4Q3k1OU1Dcyt3K0pITHhTQlJkcGF6MWdaWG9JQmdLVFI3?=
 =?utf-8?B?UjhUb1RKc1J6LzZJMTRjVUdGSzlkOS94OG5PbWVCTXJQWG81YzJGWUZQY1Vw?=
 =?utf-8?B?QUlnZ21CS3Zsd2Z1ODdMMllKWWtPc2RYVXVvVXdHaHN4YVlLUjFBekRBT1VK?=
 =?utf-8?B?L0RLdWdueDVvVThiSGZNekpUdGEwSmZqR2pvWHFpK25CYTRySnNYQU9zMU45?=
 =?utf-8?B?QnFIL0NrclE0S3JweWxERVQzTXdLc1NkTW1TOVc2b1dxN1p0RURlQ0VadUJv?=
 =?utf-8?B?N0RaaU0rakNIbHBSRXd6ZVh1bW9jTUlzMTBSeWJSU284clhYbkl2dC9JSEkz?=
 =?utf-8?B?QStTQVFDWnc3dXJBa2FVWlhnQnVCZldnUXhINEUvU05RaFZlb2luT2VFZ0Nn?=
 =?utf-8?B?ZVhCWjVjNTBvaEJXdTY0SCs1LzRWblVBNVFxcUI4UDd4YnEvNjdwREk2T0VB?=
 =?utf-8?B?MnViQklXNW1waEZETGcxM3FLQlNWRUd0SkM3Z25IYTZHNUVFc3lTNzQvbWwz?=
 =?utf-8?B?Z0JsUmlQS1B4SHIrVFlMenFaTHpsd01kRHE4ZDdjZTFkKzdSZ1Z3UTlXZjZu?=
 =?utf-8?B?SzRTTHlMK3B0VHlzR2hMZFUxMFFoRWZGT2p6ZldkN0E0UzhiS3RBQWNWc0dz?=
 =?utf-8?B?UExzV2pCR0xEUXFPcHFWaVlmTzM5dFRtTmNBK0RwVHZQdXg1VTcrODFocFBk?=
 =?utf-8?B?ZTFOZVdzVCtVbk5NZHhudWRuZTNzWTlPZzM1L2c0RjZ5dmFHSFRabGQ2Nng2?=
 =?utf-8?B?RVVrdnZXRjFnajdFNDRrT213L01DSFRodjkxM2hUSG9iaXQxNTJlRGdEWmV1?=
 =?utf-8?B?T1ZxQ1RhU0l5WStvaWRzTTY5UU1kOWZJQWg5OExIMmV2ZGMwNmY1NUNIakp6?=
 =?utf-8?B?Y3crdkJjQk9PZmQ3MS9nejdIeC9TWDkzdjhEZ2t4U1k1UThFT0UzL1dxL1dD?=
 =?utf-8?B?aFBMcldmcXZ6c3VlUS9yRHFFaXA5M1ZRRzUvOVhlWXlwNzFVcW9UVHBKQ0V2?=
 =?utf-8?B?N0lZaklmN1p6a0MzMFd1bzZuWnZad0hLZXl4V1lyQVJBaGdSYVM2V0lFQUlI?=
 =?utf-8?B?UVBTNnhlU21RK3dTYXB6UnhXcDBvMnZLUkM2S0cweVpXVlhnaGpHVUpUWExG?=
 =?utf-8?B?S0hhUmFzYmo2ZnhMc2dzWDZnSjAwbVZmY0FuVG9NMTVZRCtrdHRKcEJycDFI?=
 =?utf-8?B?c2NOYzQwdzVwdEJ1d1JYZ00yemhDYVptTFdmRlNMQkEvRzU0V2FXbFQxaWsz?=
 =?utf-8?B?a1MrRkdmNGJhUmQ2QndwUGRWODVKZTBWSEZqc21acEJzVVJGQXNGWldBOEtm?=
 =?utf-8?B?YjlKZU1PQ05xdFdLbW95MS8rODJXbmNUNWhuRm5lTmtKQXBERWJmVUdoWUgy?=
 =?utf-8?B?RGhvQlhUUkppdkR5cWZhaG9RQk1vYzRaY2R4cDNYUTVhek5OWjhzV3BwNVY4?=
 =?utf-8?B?eVFnTjJRb0t2REhueUhzWnROMjZVaXIyYTV6RzlDcUM0dFJycGhCT1RXSXVt?=
 =?utf-8?B?ckdraFh2OXFXV2hmOW92eVhZWkt3TE5zTHM1ZWRPc3N0MFQ5NkVjN0ZMKzBu?=
 =?utf-8?B?QVJTV1ArSE5xZkk0OU53Nmw0ZUUxYzdjZ1NiWFFoUnpPTW1qeDNtM3JlY2I3?=
 =?utf-8?B?b0ttRUxQNVZwcmlBK1pEL3FKbjNDZldCZHBYeVcwNGlHby9wSmRPcmxUL3VH?=
 =?utf-8?B?UnJvUWc2ZkhXb0NiK3VmREU0aXFsd1dpZmlYd1c3MlJ6SWFHbU9LbWJtc2w5?=
 =?utf-8?Q?puijT+F8XIcFQ9yCUk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a9096ba5-56d2-44ec-5560-08dd8318926a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:12:51.5150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9370

DQoNCj4gT24gMjQgQXByIDIwMjUsIGF0IDM6NDHigK9QTSwgSmlyaSBLb3NpbmEgPGppa29zQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gVHVlLCAxNSBBcHIgMjAyNSwgQWRpdHlhIEdh
cmcgd3JvdGU6DQo+IA0KPj4gRnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNv
bT4NCj4+IA0KPj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIFVTQi1DIG1vZGVsIG9mIEFw
cGxlIE1hZ2ljIE1vdXNlIDIuDQo+PiANCj4+IEV4Y2VwdCBmb3IgdGhlIGhhcmR3YXJlIElELCBp
dCBzaG91bGQgcmVzZW1ibGUgdGhlIGV4aXN0aW5nIGNvbmZpZ3VyYXRpb24NCj4+IGZvciB0aGUg
b2xkZXIgTWFnaWMgTW91c2UgMi4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIEdhcmcg
PGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLCBub3cg
YXBwbGllZC4NCj4gDQo+IElmIEkgbWF5IGhhdmUgYSByZXF1ZXN0IHRob3VnaCAtLSBwbGVhc2Ug
YXZvaWQgYWxsIHRob3NlIHJlc2VuZHMgYWZ0ZXIgYQ0KPiBmZXcgZGF5cywgdGhvc2UgYXJlIG5v
dCBoZWxwaW5nIGFuZCBqdXN0IGNyZWF0ZSBtb3JlIG1lc3MgaW4gcGVvcGxlJ3MNCj4gaW5ib3gu
DQoNClN1cmUuIFRoZSBrZXJuZWwgZG9jcyBzYWlkIHRoYXQgSSBzaG91bGQgc2VuZCBhZ2FpbiBh
ZnRlciBhcm91bmQgMS0yIHdlZWtzLCBzbyBJIHRob3VnaHQgdGhleSBnb3QgbG9zdC4NCg0KPiAN
Cj4gV2UncmUgdmVyeSByYXJlbHkgbG9zaW5nIHBhdGNoZXMsIGl0IGp1c3Qgc29tZXRpbWVzIHRh
a2VzIHRpbWUgdG8gcHJvY2Vzcw0KPiB0aGUgd2hvbGUgcXVldWUuDQo+IA0KPiBUaGFua3MsDQo+
IA0KPiAtLQ0KPiBKaXJpIEtvc2luYQ0KPiBTVVNFIExhYnMNCj4gDQo=

