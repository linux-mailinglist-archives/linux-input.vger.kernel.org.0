Return-Path: <linux-input+bounces-11353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8079A75576
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 10:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4615116E07A
	for <lists+linux-input@lfdr.de>; Sat, 29 Mar 2025 09:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEF018DB1D;
	Sat, 29 Mar 2025 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="YTpqtvdS"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40032AEED;
	Sat, 29 Mar 2025 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743240852; cv=fail; b=T1GnJYZZyPpI8uJchk+69IQnjsWIMeqaxlgK3M/tzh/HIJECMehQVopYK1G+0DqQH/CYE5vmOSGxWY6pRoK/FkMKhpaAAoCNypvClHE2/RgtGk/EFtvff8V0KQRC+m6pm8Wzt29jdrU9844+CmDIH2UmdAkdKu5AaUNSAV7qRs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743240852; c=relaxed/simple;
	bh=xJQR0CC4nV/IrSxv1kc0XKN68FkiQsjGBJmSM1K6fKU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tLR1f1DCsbqcJhvinNRziDFNWyl3nwFT2+4ull2TleK/qPVy+axVo8ffGMPnG7sOyHuea//g9G0+2OG5PezQBABvoUpraobtNGWeK1qodow/0oHS9EOUPrq0hfUQGs+yEeEKqGVAiMctXpbfY03lf2NnPk9Q/PYiI1hhLFXmlqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=YTpqtvdS; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/7HHCm2VxPVx2JAwxRIE0ja9n7QqCYMBqxuLuAbYF2kY1XO9UBpAcNEHvSaTGzUtJD34RyPVHxX6IvlHGlnrnYoajQaXnTolKI/AaKb4maKbjQxfsTACVsh7w0jK7hs6QXZ5RcyhhrAtg4+r0GqkGMthjn24mU8ZcnqTV4xfiku0blgug0jKwvdSzCRLyHuBtxxWbKxY665AwQorDzim2hfL7mq3ud0ukRLSzXRnCddo9VMADeAxdkHkzS6aYURVriOgBQGm0+wNq8yaN8hDN6YNKbCMgVXjuId035Tri5DoZgBk21ySkXQ23Ui8GIsqwlb2hJkkqr74x/pIDz6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdFFVbEAbnxpC4fjLPdyMTsLjDbBHlIdn7oF7oloh1w=;
 b=NM7TgdDk9oGhnfZf37vidlbVmi+MiPI1+1ABRQ2U8k6e7Pn8S8qRlpLlKF3MPoMJ7+Y4QQY/iZh8nWK6YJo7arIVsHzWtacFZWvut0ZV9vbE6x3fF5lIplESkgO6t6n2p5n95WBN997YlpE7NF5M6DsTvcCdCu3owIfPXUfG2AviskZ26psrT6xB4r4gGDB8TALz6uEBuXIoHuWNyRz5fEAA+ZlUuSuFPb0PUYDXWO7WNiI0Odtxmv3ZcAJ2H2ktbACXK/KOxq6uge5NRgMR8SysLbYrZuf7VVEzTQB3eOzwn/6bKPrQbKyk5p5ZC2+lzWNCxZR2kLpeQ4/gcr5KIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdFFVbEAbnxpC4fjLPdyMTsLjDbBHlIdn7oF7oloh1w=;
 b=YTpqtvdSb2HouGMpLVyDBQOr0r1RinO/sPOOVffKDgpgpCtMohr3BWdPGs0MqaXZrN4mLcPxa3ZJVZ/Kg01P0uJikQgLZafBySat6BdGiRQdLlX1CU4Ydk+4+HYMJB/eC2T35jTTy71UKQgR6AxINdA1d1fx6zmqF2TSsFnv4/OZ8mNmX9nje0dPciHBZaUKVM7qyE9MMCVUBOL+wDE8j7kJdksKhIBPGPlxG1JoqDWIZDmxez13A8nOaCUvx3nVqve+XVBqstP2E4nYdX+nsirQpGs8XGoO7nk4AB59+hDwO8cnrvyctws6G+v2l5z5hSfGxGWhVK2718401PeAiw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB10042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 09:34:04 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 09:34:04 +0000
Message-ID:
 <PN3PR01MB9597780A4B8E32BE7B6CEC35B8A32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 29 Mar 2025 15:04:01 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/5] HID: apple: move backlight report structs to other
 backlight structs
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
X-ClientProxiedBy: BM1PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::22) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <4756305f-5269-4e20-94ed-1a8576d0a2f0@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eadc198-adce-4e4c-e061-08dd6ea4d8aa
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|15080799006|7092599003|461199028|6090799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmI5SlhqbTNyUDVSdmRMV3NkRUxvTi9WK1FRdkV3ZjdRdHJsdVlGZlJtSlhD?=
 =?utf-8?B?UmMvNnpRSlM5dHZhOGxNRFlyNTlBalc0YXhiR1hpdEl4OElSMGp2YWd3ZEFN?=
 =?utf-8?B?RU1wR2d2eTBnZ1o5N3lsVnlWa3JORnhZSjVKS3lCNGhxL3B1bDVNaXRkVjNr?=
 =?utf-8?B?eFRybmZnVXNUT3I0eGhaU0t1ZS9YMGwyOUI4aEIyTVVYK09ITnRTbklERU4z?=
 =?utf-8?B?bytDdk82OHJoNDM5cmlDSUdhUzFlakIzODUvZlZZOEg3Rlp4THlJK2tORis5?=
 =?utf-8?B?RGIvWGxCWVBXZ3p3VUxJaU1QbjZ3TkVpcldLZ2Fobzl0Zm5ZQ0hDZGRtY1Yz?=
 =?utf-8?B?UUZnZjN0NStiWlBtRG5NeXM2UlpaUVBLbXFzWWN3ZVhIZEFMR1BFUzgyd3Nj?=
 =?utf-8?B?M24vWk93Unl6Y0RLcFVrSktqRjduaytzZ2hoYVVuWElDdFp3WkNPRSs5MzBI?=
 =?utf-8?B?VWk2WENsSVRwS1A2bGYzdG9pYWJ2a2ozSXlEcW9JNUkydUxWNVphTGthTHdP?=
 =?utf-8?B?eWN2UkdsUEw1VFVOTmVEN05SeHFhU21TdDZuMU40QVZOU0VRK2pCNnc0TW9l?=
 =?utf-8?B?ZDA0WEtpSWxpbGh5bVNMSUNYYjh6UW90RkdNVWNycm9PSGFXRi9Gck1HRVBX?=
 =?utf-8?B?V25sWGNYMzcwUTZid1MxSVdEZk1wRFdnOVpESGwyekxjVk9NZUR0dEZicm1O?=
 =?utf-8?B?K1R1WGJnQk1HNkxEdGZhaWVwVnBZQVVtVm9CdXR6dUtyM1Q1M2dvT0F3UGZT?=
 =?utf-8?B?aitURFpMTGZ1OTRJSjFXQkM5RTRhakxUVjZYOFQrTWptcndSa2t4S3B2bFp6?=
 =?utf-8?B?blVjMFFLMlpMWG8vME5YM1U4RGZUOEZsSDZHSjhLaG5adzJ2cUo5RUpLM2dM?=
 =?utf-8?B?S1NWQzZ4TUhSZXNjd2NNaXVsTU50MDMyM3FmaDVwU1N5RVBqZjJ4OHpYa0JE?=
 =?utf-8?B?bnpKRWgwWUdpK3VFazRPR1ZwSFpKYXdkZkgyTjUwb3MrUkxTZzh2UmJGT2Ex?=
 =?utf-8?B?MllsL2NVaDJDWmtUVFBmcHBiZHNldlcvbFlha1FQczV4b3ZQUjZaN0tvdUxZ?=
 =?utf-8?B?SkVLUk83bEFRNm1DNkppeXRUZE1NNE82VjZQemtTWDZmdDFhN0xuRUh1Qk9U?=
 =?utf-8?B?UE1Yek1BLzJjLzNCdm5nWXVtV1YxQXczOUdnWkV0cy9GdTM4VnhyQmdXUlRR?=
 =?utf-8?B?TURaRkQvaEVUTC9nZEphR0c1VHptZmtjV1pGQ2huWUVzSm9qclV3elRINDla?=
 =?utf-8?B?ZE9yUHJaNXFLUGwrTEtlS3VTeC8vRDc5V2VBMjdlak9RZnRHdVhYQTRXVEdK?=
 =?utf-8?B?T3kyTzQvVEUzUTJqYmtvR3k0b1RUQVI5OUJ3MTgybGpqZWNoZkRTMVFJR2Ri?=
 =?utf-8?B?WTh5dGQ0NjhUVlp3VUpkNnEvNVNYUXRscmVhOHh4VFUwYW5LTUhyN3FkU09i?=
 =?utf-8?B?WTZPZzVGMmNMVnZhYyt1N0didEo4WG5RQjhmOG9udm9Tb0IxalN1QU5GcXgy?=
 =?utf-8?B?aWowT2lqTU0yd2tDL3V2NFVHZTFXM3NqamFTUVFjK0VrR1c3ZVN3dEJucGk2?=
 =?utf-8?B?a0lIZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk82dGpYQTd5dzVaMjZMQ0dEMjVRb3cxb0lGZ3hqd1NZUG82MzB3YUxJR2h6?=
 =?utf-8?B?b1BCWllEbUJHQ1BHb2RKdWwwTHBYcDBWcHBtWHhQRnV6cFlIRHRuNzlXS3lP?=
 =?utf-8?B?VkhxK3BmWjZxeWM2UkJRQTRkbjc5d3BONmtZSGUwSTIzMWs0Kzg4dk5FbEJQ?=
 =?utf-8?B?NHB6VUlSWnl2UnI5TkFnSTFPdnYrWFNkTW12eFhtdjNic05pVkdDZEpoN2JE?=
 =?utf-8?B?dXpkMkdLQjRwRlY3eGo0STZUcnhhRW42UVhtVmMxeHlkQ29XWHNYWDh2ZWh0?=
 =?utf-8?B?b045ZjRvd2UrcGxWY3diMC9CU3dBYXpGWWRkVU1MTVNsMmNlS2l6ZVliTmdZ?=
 =?utf-8?B?Y1Y0UE1zdE5MaHZYVzRhSEgrbklrbm1uam5ONEJHblJNMTJpRVdhd2t1emgz?=
 =?utf-8?B?ZnpLaGNtdDB3TXFCeDFkSzRDUk9JK2JtVWczcDEvUG5CZ1JBUEttU3paYmJv?=
 =?utf-8?B?eVl1YTBLMHdGazI3UGIxUktpYzhtRzhwelFRaFlqOUVRQ2dCK3N0UzdJOW55?=
 =?utf-8?B?SVVieWVkNDA4Mmx2elo4K3FSSlpxMC9IV2J3OGJKWjUzcGhEb01qdUVYVDBr?=
 =?utf-8?B?OU5nZVE5SW03MzUvTVBKSVJoY1FnbDZYeVdaY1VGeEpWbE4xL1R1RVd0SnVq?=
 =?utf-8?B?dlF2N0Ewc3N0aS9ncDJLUytqaUVmWWtScFU2TjBQdkticitEb1ZKNy9JK1I4?=
 =?utf-8?B?TTNUUTRVdXBQenZCTzB6c2lPSUlVZnVMSUdDYVMza1BVM203eUNLT2tyV3JR?=
 =?utf-8?B?TVQwdWgzWGU4MG9oVTNGYXZRd0RwRG1mVlgzR0FKTDFPWG1WcTFDMnhEQjRU?=
 =?utf-8?B?UVl5djcvL0VoaC9BNTVXUGlUTzRVNmhHRlBRLzZqYlhpRUtRdUd1T0oyYkhm?=
 =?utf-8?B?RVlGZnFucmZSUVhLZkNwbnEyVUNQVFNOOVlXTWhUZlYxcXZRS25hSkRQWmFk?=
 =?utf-8?B?dTN4dmEreHU4SFpSVGVyRlhxQWJOZHVnYms4WmZZZE05enh1endRU0EzUUZp?=
 =?utf-8?B?YjFjZWlIRXNDNlQvT2g0MGUwOC9lYmtldGVIbk5KTlJYakxrMGx0ZjhsbGYw?=
 =?utf-8?B?b0ZTSjgrQ1RQMmFHUzNPVDJZRFlBWk5sSzhjRER0Yno4N0pSQ3NmOUxQVDc1?=
 =?utf-8?B?YW5hMmdmMnRIam8wSkhucU12L2RRYzRlaUhzTmVZTy9ETzJTR1VXOU0rekhC?=
 =?utf-8?B?WENsemtiQnpxekEva1JiOFRzVWszanJVdWRyTXZ6OWxiRENjU29DV053Y3NH?=
 =?utf-8?B?UVIrWEJPZkt1a2JvSkJnL0l3V0FkeEg3M3BPUngrSm9RaW5zaThLeVFiT2hB?=
 =?utf-8?B?ZEdGbldwSktPeDRjZnBxWm5ybEdQcm16NkZvT0xuelBjRVh3aWZOaVZYNXRk?=
 =?utf-8?B?UllwblN2dG4yQVRiNzNuNHloblQ2MEZiemxwYlRVSnB4V1NISEZGTnpVOWdM?=
 =?utf-8?B?aGZmK0VvWFZ6UXY4ZVVabDd2bzNRb0xJNkFLVzRVajR3YUIwazBBb2FUUkJq?=
 =?utf-8?B?YUVJaEFBeE80WEJyaVBNMzBCaHh0dlE3Z0hZd1RiTlRRTmtSQldQVGpMOFZ6?=
 =?utf-8?B?ZXhMMWJYbjBDT1B4ZEZPY0JINE5VaEdXOGQzSllhak1uQ3c2aXRjZ055ZkZw?=
 =?utf-8?B?djZwTzN6NG1wemtKK2Z0SkNaSXBXMTlSYXlMYjJnYVUvaUV2d0ZtRDJFamFy?=
 =?utf-8?B?TUtXUDlBY0tlZ3p6QzMyd1hFRU5CUVVpVXovSkQvcDVlQUE5VUdhc0sxMVg4?=
 =?utf-8?Q?8LDarizAwxLKCcOPw/uurvjMLyZNQkvsQA6bZKT?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eadc198-adce-4e4c-e061-08dd6ea4d8aa
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 09:34:04.7289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB10042

From: Aditya Garg <gargaditya08@live.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
 
+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
 struct apple_magic_backlight {
 	struct led_classdev cdev;
 	struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
 static const struct apple_key_translation apple2021_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-- 
2.43.0


