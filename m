Return-Path: <linux-input+bounces-11356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64142A7557C
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE8B47A3D6A
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABED19AA5D;
	Sat, 29 Mar 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="S5PKz1Qa"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010004.outbound.protection.outlook.com [52.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44918188A3B;
	Sat, 29 Mar 2025 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240982; cv=fail; b=XNJSYExDHg0lHKAANV7nVmDKJ3phDAs6XPSuMWERyIw/NFic7RLAxM2OdZGc9AW9605Yw2pN9+Wr6o7sJfMdZEpT8mOqYNoaXr5DahogQk8SEImnM04HyqXWyv4V96iWAsLZs9ohzIUQML/oJBm/0YwsIPlTq+DooVaqAaBBAaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240982; c=relaxed/simple;
	bh=b37/FPgu82P/p+dt7dm6jL8PHu/l3c16LCQ7H8Wt1xs=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=em1kFQGUhhixYPTOymm3kukLtR5len/Tq/BsA1xpSJ7p0yadw3TW2KNbCexOlM1f7O7A7gF6890zaJAL2qhKL63HL0orAPe2tkjKbpv/lwcwCv+JAF5G78rLJ2KWUday9PEZufvs4vs6n9Wcce9X9/T8/IYXeLN6QUOduRCuVEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=S5PKz1Qa; arc=fail smtp.client-ip=52.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9s7hOwtP/DBvnSGqMvHzqHyBk+KCv9D1vIBwgvrhscyWGMc3uX5N1bC2ojRAs3f2LGTF8zDtMx5UjRceR86SQAZBpqeeTs5vMc9b3izCYUfNCAk8cWYj+9fRnOXfLNvBh/fO+XCjXeWxRW9huD6VOwrcfULIik/T994LR4KtEvA9QtEujM4H/YxJsv3Kig+EK0X1ThD8hKTbYLY3iLYS7LJIp4vJtmRAB2gaLxl2Hu2aS4SRaawkcJjLA8EiS5PhVgAM6YFRYacxJEq+iIe3jIlKjDZeVoNUO8FlHhZEWd932HZPOIHfZgS+2sH5QPcvs3gl4bX57JhkjTKrLeWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNC7MN9Y10OcKnn4KzodRFpVn3mMlPo87kxfSqxr340=;
 b=tKaGRjCO7nAZyxyxazqh4X5RSox9/37tGj5BqXGhouX7mekOr7mh1TKj0P6nUw7H3l0eooNnaxofH1AB35QafJ74CNwJMvfxzVIo4kj4JJTPVEk1tQsek88dxdX4DrJZW8StJVVTPChD5xQTbywlmMdSRqI7ZLgSwf0DHsScM4IL0R924Aq46bonIyhjhEBXuCMXfXAd2XEwhebZ8JACWrnM5IoZoybx6yrhSaTtp/x3TwxpKDg0ublZFEkGx/MUt5xgU3qUbt5if+tASVNwTSc52bMzgfdw/7fxDt7klYK/Jzaag+C7z1i4Z8QxLFB3XxAiJBa7aN/a8Oky6MrEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNC7MN9Y10OcKnn4KzodRFpVn3mMlPo87kxfSqxr340=;
 b=S5PKz1QabOkubUPB4JPQZiNhZigNEjJLVMubSSRdoCJ+vleouYv7z7V7XxswJm5s1glWao3UwXpuEkVk0NJKVqsW1h87KDxFnmZJUl5NmMdZZzZjKlQ/G6YEya1F5YwUzkU4dWZALvP2hk+9mIMka6bL48t9GSy3RfOLoevlgzM3G9UyppIK8sP2TEPAFJn0UyuaGb5NNgEhF7Re9GsNiiR9RoX+shhw6jgWBBOIhXLvT8/G0sm4g3hHMtv2T0nYOIWc0jG7rzS7uVshTV1uysp+OOuL9FTsou6AMysXTrjPMmpM83Ea8K5xKcKwL8b6HWcZ+EfDR8FrOkh7ezYO+Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:36:15 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:36:15 +0000
Message-ID:
 <PN3PR01MB9597847521E5718F1C9E20FCB8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:06:13 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/5] HID: apple: Add Apple Magic Keyboard A3118 USB-C
 support
From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597CEB67FC52231276F6038B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0252.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <8f924e4b-6d8e-418d-8cc7-e723d19ea7cd@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7dca9d-c98f-4136-c3e3-08dd6ea526cb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0J0NlRMaU1Lc1RKajB2RFFyOHcxempzTVJVd0llem5nbGlNZ2FNWXowei8y?=
 =?utf-8?B?MUhQa2lPUTNSZVF6MXhjSG8wa1ViNXUwV2NwMmRLanNjdmxGWkdGdVpraERk?=
 =?utf-8?B?a0FNaWtnanZWRWREL0g5U2lneGhlcGN1bjJOaVhndjJLK21xOHQ1QmVQcTh0?=
 =?utf-8?B?Y2JVSlMyeDF1d2FIc2FBbWVTMUJYczh0OXRMNWd5dTNIUnVoNzdTRTFRRkpi?=
 =?utf-8?B?T1RlbUs1WG82emNzMzZMSzREOEFaT1FZMFpOdU1uVnp1eFBCVHdWeXRjL2xk?=
 =?utf-8?B?ZVFEblNkdW5wWE1pbk5kWUxaV2FWYWthVlg3UEdhQTF0UjVUQmtRTnVscDI1?=
 =?utf-8?B?V1RUOHIvYlV4OVlTSW4zdVJkcFZQNy9jWGVod0kvVFZxK0tYaHlNUW5HalpL?=
 =?utf-8?B?aUZJbnBvOTBMNEo5M2JpYjBjdVlIYndUcmdVSklOZTBZRmlnYU9vbGVQRmdD?=
 =?utf-8?B?OHJFcnltSm9kSW8vdzBWOHlxKzFFTnVFVzU2NDc3b0F0eHpnQVNRaVQzVEdU?=
 =?utf-8?B?aFh0U1AxLzdBN0p0d0xWYUQrNWZUL1ArMitWVCtMQWFsRWRNRTJ4MGljeEFY?=
 =?utf-8?B?NjZ6K2MxbUVDd2VMNTdOTUVzRktrbTk5QjBrbVo1TlE3Vmh0N0N3WUtpcmg4?=
 =?utf-8?B?T2Q2T0Z2dDdYcDlqU1k1RGl4RjZUTjAzSXBqU01LdVh0RWx3TWVLbzFOb1Mx?=
 =?utf-8?B?UFpTbjkwZE1YTE5zbkVXcjV6Z1FTa2xIYTV5L1d5NUY1bGZKZW1xY2hnMjVR?=
 =?utf-8?B?N2VCSElPYVhIdFFtSFh4bFJJM2h3UmlEN1lHZk1tVnpyL2tHVysxL1NxOWFT?=
 =?utf-8?B?cEhmZTZLMU42VkVxMzZaZzBrUk1icjF6K3FBV0xmMUtxUFR6QStuQ0xpRkc4?=
 =?utf-8?B?R1dQUzdpemhCbVpZK0h3dHRQbG9DS0lvcTV4SEJOd0srdVRuMDQycXNqQkU2?=
 =?utf-8?B?c281NkpsOUV2azZDR2FMV0cyODNwY0xVZ0JLSHJBV2dHSUZKVkNtaTF2YVVI?=
 =?utf-8?B?MzV1QjRMUEswM3ArMGRUSTNsM2xYeGVXZVZESURkOWRWaGoyek5jd1RDajN4?=
 =?utf-8?B?UnpnNmZsRXdTVnYvWk9hbG5XWjdjUUZSaEhpS3R5ZzFVcU9qWmxUdGRCS1hL?=
 =?utf-8?B?N2U0eDhjQ2xKdU9oNDE5ZTM1L2I3T1gzZHJKcXM4d0hpVTRUaU5zcG9JVTU3?=
 =?utf-8?B?N0NxWjhIZGZ2MXpzTlpkMlNhUVh2MnYvVG1yWWtWLzNNVEc5RDJUK0FERkdn?=
 =?utf-8?B?bGdEcHRXemhURHFXSHVoRkVDb3BaOXJtZndKU0lPWm5Kdll4Y0NER2Y0L2cv?=
 =?utf-8?B?dUtMdldFdDVlVU1zNThIcHp0U0ZBNDRoeW1JZjNweFBqT0VFN2hVRndoVWFE?=
 =?utf-8?B?dUlKb3FDTnFSVSs2d0ZyWXRmZTNGTUEwL0NYMTVmZWNzaDJMeUxCcVNNZDhm?=
 =?utf-8?B?VEE4L01aOStGQlh1S3pwRitiN1A1YkZ1RHV6Z1RnQWgyYWZVWnVyRzJKQVRx?=
 =?utf-8?B?Z0h3czU4MEhlY2JrWEF4ZXhDYS91ZUxSdWluSUJhU0JwRWZ0QW14aHRSMCtW?=
 =?utf-8?B?bWxpZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFdmdW5QTlNUcGcrZXAzZVpWc3piMXRMV2dzZDlDUjVoYnIwU21hNzRnNFlY?=
 =?utf-8?B?WG9YTHp2TVZ0L1k5L3oxMmpYQnJhS2xtK1Q3WE1uaU40ZmczM3NCUVlTYXRQ?=
 =?utf-8?B?cnV5VE1MK1RxM2gvb0xDS01uaTNlUmZPbXNDT3pialJPMzF5OGR4aGRRSzlL?=
 =?utf-8?B?cVNLNzNRMDIvc3V3VXNVTXM1Vkk0S1hEV1lXV3kyQVQ2Y01yMGcwNDBFdm80?=
 =?utf-8?B?YVVUMWd0MTBTU3p1S2x0YjlENUcva2UrL2UyRnpWeTNhZ3U0SXh0YUc5a3ZC?=
 =?utf-8?B?U2FSRWdRcWlYTzBpSDZ1VXgzZ0R5cnBQc3JGVTNvK3NQdnNUcmtPdzFrc1dD?=
 =?utf-8?B?VDJhT3F0SnM3bmNva3BZRmRsNDNFKzR1TXJQdHhiTk5RMHd6YXRtUGVrSi9F?=
 =?utf-8?B?M2ExMSt0ZmhrRkhUZ2hpTUVRKzRteTJybXBpQ1g1ZnU2THU5bGpHYmpPaE92?=
 =?utf-8?B?NkpSSzl1N2FmMWZjZ0hwNitFZWlaUGtxRWxrc1FXMzlLbitXWitGZi9HN3l0?=
 =?utf-8?B?OW8zeDE4UC96WnBJdi9sbkpHYUNwbHp2V0Q5MWFUSXlHRFVmbWNVc1J4cWE3?=
 =?utf-8?B?NUFXYUtuOC8zUVBEODFnOGNWc0R4aktYbDliQmRxZmtZTnlTckJaMXN0N2Js?=
 =?utf-8?B?eENqbGhrTWgrOEIxNEV6VmtHblVsVE5oZXN6V3FaTTl4UDVWd2RaYzV0WHd2?=
 =?utf-8?B?SzNIeHpRWjJPT0pOVWh0SHluSE4rZ01DU3NMT3RIVzYyYVRJVHhiUVF5RXlW?=
 =?utf-8?B?bFJ5Nm55Z0lNRllidVU1VlJlOWVTbDBndHFGMzllVG4wWWhZc29DeVB0WjZR?=
 =?utf-8?B?RHVMR3lORkN2KzlSbkZ2NFlxbFhUWWJRNVJGQm5vMDl6ZGY2NW1uSXZ1a3Vz?=
 =?utf-8?B?Mnk3aFROZGVvMVFPYzJsMHkwakJtWm1ENWxqZ1c4eWlVejB6M3Z4ZmtZOEFQ?=
 =?utf-8?B?YUpVUlZZY1gzMzZwVjdxb21YRkROTzhoSUovQnpvUXJXSWI5cUVOcTljUHRT?=
 =?utf-8?B?QWM3QXFVUDZ2dFg3blFPYWdPNmw5enNRVWVwdHFpUXNjZ2JxZktVUG83TlVF?=
 =?utf-8?B?WWRZUjlTYXFDMlc4c215UHNJUlFtRmNicXZ6Y1ZvMi9UaHpNLzk1SXNRUGxQ?=
 =?utf-8?B?UDZ0Z0RaS1FhSVY4bDVRaDlSYVBlejB0RHp0bW1oOUFaTjZrcVVPTnhxUGRp?=
 =?utf-8?B?OWc2alpzRmdMYmRaM0h0ckNnUU9RT0NmWDZmdWNXbUdmd0hRTjJsRnB3NWZW?=
 =?utf-8?B?KzQyR001RlEvSTMyYXpNc1JsT1hnN3RKM2M2QVVwU05oOWVQTVFuU0hDOE0z?=
 =?utf-8?B?WlJoOW1BUXFNYml2Ulp6VmpQb09zL2xYRXNscXVEZlc2TncxVWhlVkkxaVor?=
 =?utf-8?B?ZlJwVVJVclMrbmFJY0g0ZUprdDRrd1lXVGQwR211cG1VMWFTK2V1UDN0ejVq?=
 =?utf-8?B?dkx1NWo4ZFZKQWxXZ0tmeHdHcFFOb3pkaGZUZFc2R1o3cXNQWGwvaTh1MEpD?=
 =?utf-8?B?ZTRtWkc2S0dlbXR1TzFXc1JOcXBoQXlLWHdIL3lOYUh3R2tVejZIMVZtUVRM?=
 =?utf-8?B?L3ZtdHNmWFpKcmF3ZFdZaVNtc0lhMHJkdHRiZ3BraUhvVzByWUVRTVV6QVRh?=
 =?utf-8?B?WktleXh3RWRwNG9ZdGFsTlRzZUFTWVZFM1NoWm9ZcVRGTkl1R2JOcGNZNTk0?=
 =?utf-8?B?V2pNRUFadnV3ZkIzR00rSW5WQkF6RG95enNrVUsrTlpuR3ZoM3dFcHVHQnlP?=
 =?utf-8?Q?fVAi68oRnelJ/cfpr7DX1EJ1EuKCOsnldH/byf2?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7dca9d-c98f-4136-c3e3-08dd6ea526cb
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:36:15.8081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 with Touch ID device ID (05ac:0321) to
those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table = apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..8682e1b11 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.43.0


