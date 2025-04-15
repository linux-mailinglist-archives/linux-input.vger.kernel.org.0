Return-Path: <linux-input+bounces-11796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2EA8A3D4
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0761B444375
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346561FDA9B;
	Tue, 15 Apr 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="c0SZMfyB"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010013.outbound.protection.outlook.com [52.103.68.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629EE1F5434;
	Tue, 15 Apr 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733642; cv=fail; b=s8btt3ETicjf+EJGNgl6D0Fz/sOXjJE/Y+TH5Xa3dzVLogWSg9Ee0iqQOlRglRR2C+8eAOQ5N1z2H0HiGnM+zNTNX60lT+6dNReW+q5UVOQPsnFzEJ2Uvp1kbWdMmNIkcyOP1YQYipILdQY/zVNyEPhrnQ+CJdX2L6sz74GGzOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733642; c=relaxed/simple;
	bh=Dae3IBbeqHqy2zk+EVFF1NLDBUcuuFjhagiZWrKyOYw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eZj8V4qc8IDM2sngRlOcRhcjtS+oh6WLFfBfDV7CJqNTPPqApmc3TFbjbZMPWlBnO98lwKVQZS40JD93zDoOVrdo4AnqyMqLy5veqn9AWdc7/xP1CRhh45ngyzAw4dl7HkwsPz1ul2FM45/0863zThR+70wzIx4mEbH9znJGwsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=c0SZMfyB; arc=fail smtp.client-ip=52.103.68.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvnW01WzJlAIlg6CqV+QXsPDaBAeUdjNZAJmYUpP/HpSdZiv2aFZK39IG5aZhYxiBUHhuDvJ+T0lnRiWkEGSQTveXRUliVDL4OogmmudTSAVTzXI/gPxSbdLVsK0LnIPZBjufcOnpOL8oAiyV4W7zF88u0IuyZQIRMX+uHphhH68XIAHz0a/dQOMEIg3ac2pHp2iIcrsszI5Bbv+HRPUMmmMKzT7W6/nDYv5nhXF27pcSVHGIB/5K11N9c/eU5NbEE43hoFFW3Iw7KyPQKQ2drRgkyEkCSDHZFC0OCz8gvJUn0+pWoN+GsE3nq6jvGuKX39/04E/7Ld+IgASv+ZdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zQoJjd6VAXGyfhy2dULdfQPxOOXkj7MbUqSgEACHio=;
 b=LnO5XkZxRzD1rOeu0mw9Ij/uD3hsLvDVGPo20aq9rWJ+DvXhNS+5sfwNl9dvAVEZFIJvqheRO5ebmBxAdKcAPhgaQcuof9TSQ+sqFU3Of6NcmqSkAZ8xYspeToAKsTRh6ZfgnqmYcrF6brfwDRCYCuAQPMyLq1Csktu0aU+GE6ISb0/87UeUWIVvoK7PprDWZOnfwfKjeShzyZJWo9jkjLLRya1wuP+6XsnjWceePww3hWlTFSJEcyEbnd8U/SBabVLOPAjIeJnGr2s33Z7i0MYnxlsVPmv4wAi4jqO3G+qZvvRjMZNBTDanyre4UIg9pZ+6SvhPc9inTFnTNbJMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zQoJjd6VAXGyfhy2dULdfQPxOOXkj7MbUqSgEACHio=;
 b=c0SZMfyBoE8qZ0vLKk4eSm1e93P6XxDLQ5WnGwGDUtwoItQdQ5Nbyws/bSLG/3x3MfKZX55dfIf5QgPxVTHUJmdWACZva1XrAKaM/ZPnB/fuvFppAlFSr8eEUsF/okzXG78Fj0iy2cdTyzbLG/Xwta9G7xEh1EBC3ifXOiZgyHyvLHqLRz70tUMhvA56a5EEP3DiAxz3Iu4wDUq1fU/fJgozrWRrn5+hQzGELqFHRHmvJs8L7thdHcEEjFPaa55udWU9Yv3OVBIwAJqmgPszgJmi2vj2x1+ImZ8ew2piGikTgLfuS6kpJOGoyhJXDx0J5goxAkp4elVsPuMC9ybtOA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:13:55 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:13:55 +0000
Message-ID:
 <PN3PR01MB9597AAF561CF06CFC75B05DCB8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 15 Apr 2025 21:43:52 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH RESEND v5 5/5] HID: apple: Add Apple Magic Keyboard A3119
 USB-C support
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-input@vger.kernel.org
References: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Content-Language: en-US
In-Reply-To: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <bd19afa5-7ce3-43a2-a3f5-056d202cf0a9@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b904e3-e94c-432b-020d-08dd7c38856d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799006|6090799003|19110799003|5072599009|15080799006|7092599003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkpsL09KWmh2SDRwOURCNTBUUW5DVTFQS2wrd21ZWk4vd2h0cm1SclAyUkRZ?=
 =?utf-8?B?L2h3VjVqMTV5eERzSkhDODNnY2xxTE9oMW9mb1F1aVptV1R6SjZzOVVTMWZG?=
 =?utf-8?B?MVI0Slp0bm52Ym1rdmlremFXdStQSWJPU2FhZjQ2aHkrbDg1UWM0OGlWOE1s?=
 =?utf-8?B?bXREOWFRQ05mU2ZsUjBlQ3JzVktlamE5blB5Vmgrd09DK2tVb1lLNHRUeFBa?=
 =?utf-8?B?TjgvN3RkbkVNVUQvV3UzSjJrb2NSKzNPSGhhdTZQbFJWMnRqbkNWVzE2NVZ4?=
 =?utf-8?B?c1BoeFRFUCsyVWVPY2RjOHB0cE9DcGlQT3N0ZnNXQ1didGRscVFBK0c5cys5?=
 =?utf-8?B?UUk4cndYTzFNT0MxTEMvMVlrb1d4NmJQa2JWQWozeE43dmhGQ2phUE42RUQz?=
 =?utf-8?B?KzR0b0laTmNlZU1FR2w0K1FCK2x5cmNWUU1tbGM1ZUNydGNRMEZXbWt5L1hD?=
 =?utf-8?B?dGlYNG1DUkRacXJZaWZ3Tnc1TmxvSkFmZXFRUm44eWtSQVRxdU5ramtDUTVB?=
 =?utf-8?B?aDhwRGszZWcrbHV6NnpzUmdJSjZ2T0dGL3ZpN0ZwbU5IWjR5ODJ4ZTdyNkZJ?=
 =?utf-8?B?eHlLOER2TWxNRnYwUWU1cUZEOHhlWUJwUHh5ZTcrNHAwRHF0N01ZdkRGQkZv?=
 =?utf-8?B?b3VkQWN5MGpLamtwTFcrVDYySHRvVEtsT2JSWkxrZjVMQnk0ZkNKbDM1L0VK?=
 =?utf-8?B?RURDNWlFSVlnWTU4L2x4OGZxU3ErRmJTU3ZTY2orMnZPQWRsU21ZS1BwNDM0?=
 =?utf-8?B?aDJBL25hMEdZZkxNZWcwTkdpL3lNa3FoV2NHcC9IUFRLT1ZWTElVVm9ZYnpl?=
 =?utf-8?B?WXN2d3RHbFBrL2h5NTc0Q3hzTFVrTmJqYVFHMmNJWkVpL2NZYWlyaURPRnk5?=
 =?utf-8?B?bUtsMGdVajJrdHk2alh4Nk94WUF2dVg1d2x4ODltNTl3bUMyRHMxd2tNVGZ0?=
 =?utf-8?B?VnVEM3pNdmNrZXhpUmpqVjN4ZXBQVzBlSlh4cVV0NXZHUWZXK1JOUWg2ZjVI?=
 =?utf-8?B?anpjbUhzRWhCcEkzYTBGTk1GN21kZUdVM1BCZUtaa1pnZUhTZkdFYjhGUGJ5?=
 =?utf-8?B?QVBVeDdpdnFLZFN5N2sxOERjQVZ0YitQSWpDbC9rZE94S1dMbEt5YlJNMTZR?=
 =?utf-8?B?cmFDY29aWmJjNE45WFBJc3B1UHBWUEk4WTVoeml5Q3dnb2pXaURMVm53R2J6?=
 =?utf-8?B?bUdTZVlOWThNa3RFc3JCYXliaVVCK054aERNTnhMeDhhaDFQRzVQOURjS1ha?=
 =?utf-8?B?eTY1bDJ6MVNkMmJxSis2UGI3MzNsTzVjQ1h1TTZoaksxMnJvQVhzRFBXWG50?=
 =?utf-8?B?NDRod3F6aGxCN0hPMnNWVlBGclJRbHRqS0xydUVxOU9qM2Y2NFhaNGlvSkNj?=
 =?utf-8?B?WG1VOFlyNGZVNHUvR2sxbW9tOTU2MjdTNGxZZ0tTU3BBQThnYmk4cFlwWHdS?=
 =?utf-8?B?OHBzUjU2S2VKNFZOZVFCcW9IeGI0WktocThtYzVWNC9xbUhQSzdHSTZHT1Iz?=
 =?utf-8?B?K2JXN0EwaFNRWjAzWmlqQWRUQ1E2L3gvczJwT3k2MTJscmJ6VjBpT0ZlSHFW?=
 =?utf-8?B?YzJKdz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDhWSTVkd0g0NEpUVUdQNTZWT0UxaVkvOTNBMXdxL0h3VHc2WlplNkI0bU5t?=
 =?utf-8?B?ak5jMEZDZGZxdUdCcm1tRmFLN0Z2MGtscittSUZSK3NKWFFRUUxpUnZ6emZB?=
 =?utf-8?B?bXZ2aUNjS3p1VXQ3T0s3eHp6RFB3NjlmaEJTd29xc2lEWnlIeC9PQ3NSU25U?=
 =?utf-8?B?V3Z1UEUwUXpXYmR4amdSMnl5c3RQanBlN1RMaWZnQThtcnpZOGQwa3hzSThn?=
 =?utf-8?B?dTgxajkrcTFLZUFkRThIeVRMV1NEeVRqcndHVVhkNzJzbDlHY3J0R2U3cWhw?=
 =?utf-8?B?V3h2cGtuY1hHYVlaOGNITkZESzdCcE1WWDVxd2xITUdhcWhXTlBVRkxYdnlP?=
 =?utf-8?B?OTdmMFdHeXNra0xuamNWb0VWc2RybEhhRGswcmxDdzFpRXdaK1crTm1RY0F3?=
 =?utf-8?B?TkFZaXZlc0ZqVnp3b1ozNzFaQkduRTZnQVIvcW8zVHg5VUtTQkZHK0Fxajds?=
 =?utf-8?B?MDlaLzBaZVNIa1VvNExBb2JaY1pYdVB0QWI2VHF5WnRDdDlRalh5UWxkcUFW?=
 =?utf-8?B?aXBMQzlKWEQvL2Z4dGM3VkVDYndJTU5pOXdtaXRaZnJoZThrc3RxV2FCVG5L?=
 =?utf-8?B?WkcwTGZySUN3VEhxTWlDd2JJS3hLY25PcmFRNG1QaWRHaXhNS0JsUTduUEw4?=
 =?utf-8?B?ak1GeUNNcXhFNGs4S0dKVGVvZjFvTm5RMjYyMStmTmpiT1N6WHZWR3NPR0xj?=
 =?utf-8?B?a3FIS1BKNnh6WHdIcGdtdlBZVFdRNTdydU55THdsaUpXdHZEVWs1SzdEUXll?=
 =?utf-8?B?NFFYSnhGVGVBd3BqU1R6aVdnUUNoNmtDZXAybmtJWWNHcTE4dzRMS2xTSzhl?=
 =?utf-8?B?ZGJ1TXBsbUZQMnlGVFZ4WTVTbWtKSmJGT2RzaE12OTF3Y21VZUQ0Q3ZzcWZ4?=
 =?utf-8?B?ak5ISkI2WHVNL3JXYTFwOENkOTIzUi9lVDY0ZXRPVU9YK05nVkZqazBTTzBn?=
 =?utf-8?B?b1BDK1FJRmpsc1hSbzlpRm1JdjFCUjZtMFQxcHMveDd0TFVhUTA5d2YwdUE1?=
 =?utf-8?B?ajN2bGlXQm5zaHdXaU5zbG8xSGJLS0k0SFhXUk8yaVpPaWc4b3A2aGpOSUdi?=
 =?utf-8?B?emErL2FKUXV1QXRYNzhNWERSZ2ZHdUltNGs4MHVVT3BFTUNiR0s0SEhXVmxt?=
 =?utf-8?B?clY0SU5vWW4xTkl1TUFZNWhsampSYXNSTW81VU9KUjZsdFAwTUR4cFdUUUlp?=
 =?utf-8?B?TmJ6WjB3ajk1Z3VmVGZZZHNmUXVUUzkyUGVKck5zS2FjYXBhMnFZcXhtdWYx?=
 =?utf-8?B?Vzk1SUI4MHNDVldkZ1JiN1MzSmhCdDFZTWxYOHFQUkdrL2VkY0lSamRBZUZL?=
 =?utf-8?B?MGRGcFJ1ZlJDR3VnOHhEeFJDN09SblBtYzhzVlBYSG1VMXZxR1ZNN28yT1hv?=
 =?utf-8?B?emRES1B4UDYvWTJBVE4zNkdjNkJUYUhIbHRwS0FqWXRuUnhIMWQrQ2J5N04w?=
 =?utf-8?B?TThreUlaUFdyZ0xTZlhYeWgwWjhuU1pHYzNaUkhkVFJjUnFGWXNzMThQdkJN?=
 =?utf-8?B?clB5U1I5WlV5OFdNWjZKYUE0NDZBazNmZGtyZGNLaklQMlJqdkl2MklvS1cz?=
 =?utf-8?B?NlkzYzRoSjdNVTRSbTFPMzNFZnFBSUZpNTY5cjVBczNTdnhDbENQUDNsTzk5?=
 =?utf-8?B?SlREbFpXUFRvZmJWRWtnYTdmbXZEVklabzRaU0hWbHBwbUxWaVI5d3Q1aFYv?=
 =?utf-8?B?Q29MOENCWk5IeFB4TFFwS2MrN0xRSlhlSk9Peityd1l4Wm9VTlk0VmtqOXJV?=
 =?utf-8?Q?pPrOEaENWlF/Rg6hk51KygS6eFu/IfOFncAuRL7?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b904e3-e94c-432b-020d-08dd7c38856d
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:13:55.8270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

From: Aditya Garg <gargaditya08@live.com>

Add Apple Magic Keyboard 2024 with Touch ID and Numeric Keypad device ID
(05ac:0322) to those recognized by the hid-apple driver. Keyboard is
otherwise compatible with the existing implementation for its earlier
2021 model.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index e95a54113..0524893f7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -486,6 +486,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024:
 			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
@@ -1182,6 +1183,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8682e1b11..4925bfd08 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -167,6 +167,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2024   0x0322
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
-- 
2.49.0


