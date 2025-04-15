Return-Path: <linux-input+bounces-11797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A3A8A3E7
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F4D87A84D2
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6318634E;
	Tue, 15 Apr 2025 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="B3rcunuE"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011037.outbound.protection.outlook.com [52.103.67.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34B2DFA58;
	Tue, 15 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733862; cv=fail; b=ugL+cOObMM/4JCKK08Hil2nA9Snka0YfH1WyVtdLvvTuBI4pEHaXIsISMKlOAAL7a3R6cz7zEpXlVt1t2e1Eb8oaeaAQqI7qRICvBVC5DfUo63Vm9g2aRvVD26zSA1NjeTEai5GwKoIw0Rva27uMDDR2bGUdAuIO63XugSEo84k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733862; c=relaxed/simple;
	bh=LCk9i/j/BhvloRvlrwVcZXldErQNzEJy0uNCdgACbtc=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=WP4Doec2lfb0yCPPw8UI6pxoQPq2IhJhWMi3YD3q9jI8m+CbPUt4QdfU9VyqgAsRH6Ok5c27pw2cJCjdraqUni25AzLPx5S8PGYsmIS/DVUY8i2Y0+ZDceTI8wg5XH2DD3Z0ZUkmOydsqaH/rDuAxkiZqz+aS7tC0NMtlir7sik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=B3rcunuE; arc=fail smtp.client-ip=52.103.67.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxmF2zSCD/G4tmqBRS+EmIkqhLS+bFpCAjGy8IJ7dBooR0PRF9CE6PJuicUSbwLkmal0jApb1wrvLPkEJ7Qn7gGEh63x+wR+eDn/xf4V2/wtKxQaZrsIRIA/mWQde2qsGRALKoIVOmyNLmgAYNgXQuOlfQxx6hAw13DO9uqIdd3Ux5aWrmlza6thT6/CUZsYXFRVdBN5+GHvYfjmqP2F0/0GfAVbEOPxqW9bFKIPUv4kWiKPk0XHwdOOQ/1dBbpNtKW3FIQi28dzm9JR80UKOO72utvB2dW3c0dr8rq4NG6hrOjyJceozAdnhQafUXwhC6a4UNLFWkhJlZ4KGl56Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfhgnReNOkT4JdoJm3g9gNI4Uz3uOoqKYEDdE0SAEG8=;
 b=c8/0fsmcW7YSa8V4P/St0bVMfbZum70AKeN+soVQDqTSlzJ5d0Y8CJLr0XHoPiiPYHj6RKs8KIEmuj937tCK92n50Ig5N0vIKc2JkhJFQ6rKsRJvpTA1dWHybdt4ioXLFWw14cOzlruv84LUuah8g+qoIJcuPsV4SNt4CzVLhDNkV++rjTXa5GJfCZMseHHh4UdI4M3UDtBtNZKK+QkXoHyu3k9d2lk2APrm5I2kXunR69OKLjdQz5gsnDs4kWVBOUoL81iRBxK6nhsK023qBX8D1Uu7WNn83i0WsURTC0SKvJhslIiEGXp5r5tQZDcjqPQ7SwU8wu6x/0gHd6Q9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfhgnReNOkT4JdoJm3g9gNI4Uz3uOoqKYEDdE0SAEG8=;
 b=B3rcunuEGTW/3ucUd1NK/LvjFJ/JLzwKiRq+vspexo3ZWIV21IZhuosDVBfPkAC2exwVXpu8GYHh9ozdVxI3xB5Y61gAivImP/VG65clwxxldtPz2l9ZzTVH09DHRyuR7OL29/NhrDtbYfkxuMX41iZFg2HP+7yxLOnNC20tfyb3tFd90ahyR7VcUOaiP+fTAub6C9cbq5macbtIIA78cbZwW3dloe8+Eb221ijaYak5hkSakVzxy9eaLjVTFFo5GeZZOvUDS7nf8Lpr4/XikOxURPTniTPtRNz2vglt+B3ehR3zSWNpVQytb//eltsRAKJRb8Sqi9vVhGw1QNFYAw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:17:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:17:36 +0000
Message-ID:
 <PN3PR01MB95978C46B66BD92230030AD4B8B22@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 15 Apr 2025 21:47:32 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-input@vger.kernel.org
From: Aditya Garg <gargaditya08@live.com>
Subject: [PATCH RESEND v2] HID: magicmouse: Apple Magic Mouse 2 USB-C support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <e1d4e53c-a931-4130-9666-fa92f59f0d4a@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: c7348f60-76f7-46ca-740f-08dd7c3908b0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5062599005|8060799006|6090799003|19110799003|5072599009|15080799006|7092599003|440099028|3412199025|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZEWmJQbkx6ODRpVHlqanhBWkZiMFFCL014SENhR1BSbGZVT2xrY0c0Y01z?=
 =?utf-8?B?dU9HS1IyR3lzY2RFSnpuczRaS09pMnEyWk9ONDJrV0JXcVhxdHhNMXdqb2xh?=
 =?utf-8?B?cnQwVElxNHVBb3U3NEM3N0tReVczSGdOTXUrbTRtS2tsUWl2VWNYc0FoVzI1?=
 =?utf-8?B?M0JFdGFTT2I1clFGVHV6QmZFWUFPaTI5ejZJMGdSRmF1VFB6TkxGUllOOWhH?=
 =?utf-8?B?RjFyUmtrYmdZdXRrSnh6UHR0YlhGaXZkWDZ4Q1FoeHltczlDeXhFYzZCVys4?=
 =?utf-8?B?QURoZ1NHSVpvL0ZMd21BaHNsc3MrczJ2aDg0RUhZRFhsUnR0VnZBTldibGQ0?=
 =?utf-8?B?a2JhN0RXZXNBcDNrTnB1MkE0enQ0Rmdwc2RSeUVqTHRCdWJhMzRKNWhYTllv?=
 =?utf-8?B?SVVsRExUalFQMFZ3TXM2Mm9ubHJUbUg2bFRMdlRWdHpuZkdMcThwN3dpcTZS?=
 =?utf-8?B?VjBwWkxnV1o2UzdtTzhyRmdkYmQ3SlBvTHpyUWp5RSsvYkswakw3aW9La0FK?=
 =?utf-8?B?b3FubGUzSmZTZkFNQXVyNitZUTVNOFk0UG9QTFFWNWQ2THdLY0ROWTRDQ3cy?=
 =?utf-8?B?TGd1MGpJa0YwUzBpbEpUQW1CYkRXeENEYnIyVytVT2hqbWxiVC9pbDZxRXJn?=
 =?utf-8?B?QThwS3RnWXkvWCtPRmZxeS9lb2pzUmU3MkJNdVMxK2xUSE4rTnBrUTFQOHJQ?=
 =?utf-8?B?VWk2ZVFxRVMvNmxsSEV1WFNyZlRZS3dDTklvTWlkc0xLNUZUU2J5aUtFbmd4?=
 =?utf-8?B?SFBTRGRDQy9WY25DQ1lKU1ZMRCtTZHppVXFnTVIwcldJQjIrcUJYYXBHb1NO?=
 =?utf-8?B?emY3aWJ0V2N2dVFFQ2VrOHZsTFpPOHNUSDMyNEx3RzE0dFcyazR6T3dNdVps?=
 =?utf-8?B?b1pDZURENjZCL2d1RkNSTVFUeUVrelMwQXU3VnRBYVJUalNZN3dqTDFsRCtt?=
 =?utf-8?B?RDdudVQrVzVPODYwbWVNZUxMUWtmdTJRM3ZlZzhnVGFSV3FadWZkam4zK20w?=
 =?utf-8?B?NVBGR3VlUTYyODBRVmNLQWFzQW5hNnJKVFNZSlhhRDh1V1BOT09KZGdyVno5?=
 =?utf-8?B?WVdZZW4xZldQcnpqcndxaURDdWhac3dlUHAxVVlhbUs4QXordGROWnRCblVZ?=
 =?utf-8?B?ZzVDTks5eXkxSlQzajRXTytXSE1tU3BnK2xoQWlnUGhuQnp0a2xZeGtyWUo4?=
 =?utf-8?B?REFsZEt5OU54MHZVU1RUVVVIcUxTOFk2SHdhSzBSaEJ5eCtPRVhONW91ekU0?=
 =?utf-8?B?eW03TjkyQ2lMRUl6dWV4eW1ubUJndFg0TXp4Z205SXovV3NhdkhEeVpmWC9P?=
 =?utf-8?B?Y0UxMktycHN3TTNVK0Jyc3RqQ0p1RDNqcXhzbDlla1JYQzBXblRmbTVPSFFu?=
 =?utf-8?B?YTdhdlJxSzJmL3E1bTh3ck5yUHkzN0NIdGIwbjA3SXZvc1AyejliN2JNcXRi?=
 =?utf-8?B?bXk3aEpWczVOL1RJT1pmMFhlQ2dGSW5BczhLVGdFU0w4TmR0NkFPWHlWaU01?=
 =?utf-8?B?VmIvSnV4UmpVVmZQMWMxTlZMd2liWk51Z1ZleElnNG5lT28xUkdEdldadEcv?=
 =?utf-8?B?cm8xNTlkMW9HWi9ockswYXFoZ0tjS25GUFlTSVBwWlI0Yk5QRDBTSlQrRFI4?=
 =?utf-8?B?RVNjZFVScVQ3REZSQXBCNnZ1RVRGUUE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0VBRFVOL21IWXpWa3BVNXdIc0taSFcxMHdHVk5kaDFaYW40bFVtQ1pGU2Z2?=
 =?utf-8?B?U2RySzhaQjdCZ0w2Z2dXcHQ1dVN3ZnMwT3F0b3lJNWRsZUxrNGFiUnJZWnl2?=
 =?utf-8?B?NmM0c1dwTDl6ZGlXKzlhblpWQVhxcHRxNTRPdkptY0NHaEtweW4yVzBtUU9T?=
 =?utf-8?B?VlZQNTFvOEhrVzlmNkpRUFRTL2NKQTM5c1FyNUU5bHB5STA1dnl6Nk9ZZ0hJ?=
 =?utf-8?B?TmxYTCt6VTBya3NSeC9kWmttRmZ3SFdhdThqaHpBT2l0OHdqakkxV3ozZGhS?=
 =?utf-8?B?VjJwbndJdDJSWkxVRTIxRnQzZ0N5VlVBYmJUZHFHUU56T0hKdllHK0szUnc0?=
 =?utf-8?B?VDJ0VUtqSmpIUkdMTTFFZzlLeWcxbVBHSUw1YTZkeUgyUTEraTA3ME9aMWVK?=
 =?utf-8?B?NVExTUtRL0YyRmV2SUV4c3doL216WXdLTElUb3hIVnlnM29jaFBYR2FTeGJN?=
 =?utf-8?B?TWsySWNlTDhvVHZrL0RsT0xnbVdYbktMc2tWdkk4VE55c2Y0bnJPTERDQWJt?=
 =?utf-8?B?TFhZamk1R1dwYXlZR2Z6emkrbW9WR2dqTWRrNHMxYXh6VjA0dkRRcklJUjZn?=
 =?utf-8?B?WndwVzRMVWFUOFl2Q21rY3N4RmNCSVM2cTNjUWNqVldiMjV5SzlKMTl5NjY0?=
 =?utf-8?B?QjNzTDR1YVFoek1RY0N5Q3BacjNxRWNkSWU0MzU1dDBNSDRRalNmTDYrSjRQ?=
 =?utf-8?B?MngrbVRqbmdCUTluZUp0Y3B1WUh0VEsvWDdlcFdsSGt2N3VyYzJOVFF3elhV?=
 =?utf-8?B?cE14QUNzam5zMFVLaHpCUnlOMk5RTU02SUhqQk5hOUJ3QUJhZkROYzIzTGpz?=
 =?utf-8?B?MU5JWUZDdS9YWldHOEdEY3UvVGVEcDgvVmEyQnNuUWV1cG5mYXdoa0YyNlh6?=
 =?utf-8?B?dDJla2liWlJ2cTJvVUlwVDVEVDdyLzNDMUd5U0M1aTZUSmo3bVpzSS9QODNm?=
 =?utf-8?B?Zm03SUo4VEhuNWs1dWRXK1gvN0tHMUZPRjRaeU4vci8zTUowK0VqNFl2SmJW?=
 =?utf-8?B?ZWVYTk03MXVVcnVSSHBUNDkwc1FKeHc0ajA1a0VPZS9Jc29POHExVE0vNndS?=
 =?utf-8?B?L0RrbThQZWFtM2xUaFpmT3hvZExQakh6elVDeE5yWFh0N0ZqTnVueWxkN2px?=
 =?utf-8?B?MkJoZ3B0cWs5TnBKc2FobGFXckp3ZjZOZDlzTGtGdDhKVWV3ZHZRVDJERnlY?=
 =?utf-8?B?dkV0L1JONDBPMGI0bGVKakk1akEvdEpQYlpBcmtOUnloRStINzZ2Q0wxN0hl?=
 =?utf-8?B?anUxOFFyNUltR0NBNlpteUcvWmJkaGpkSFpucVBXMUJwMUhRcitBL0FhcENE?=
 =?utf-8?B?VXR6MCt1ME5JTmlWN1ZmZGowbC9zS0E2dzkyUEU1TDF6M2h6VzlaZTlwL1Ji?=
 =?utf-8?B?RW9LRHN1dUQvQ2RJckN4REVEcW5Iay9IaWNjNnp5U25yZzhTaXQ0MlZaZE9D?=
 =?utf-8?B?Y1pqdlhONVJ5YTNBNjczOTFGZXhkWXhJeElIQXd4TGxtQlM1UHMxS2dyWGYz?=
 =?utf-8?B?aDFxcDdTYTRZOEtYZXVFTUlHV3k0NXltTWs4N0dudkIxWmFiT1pwNUJOMy9x?=
 =?utf-8?B?R011RHA2cklERU9GTnFDOUlFQTlqTDBhVWxUc2lOVFYzaUdSbUxTMnRiT1dz?=
 =?utf-8?B?WDFkSVI2K2ZDRTJ6M1E1SXNSemhVUGcwdVFJVjN5RGdGbk9hMEE3OUJkanJm?=
 =?utf-8?B?NGRjN0hJL2RmMjV5V3pFc3JoOFNYQitMS2Iyb2p1TE1xMHNlRGlsWTVZVDhR?=
 =?utf-8?Q?lRW/mmIzBFcQTrIZWw6MH5VEzByVD2k3eevWYXX?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c7348f60-76f7-46ca-740f-08dd7c3908b0
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:17:35.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

From: Aditya Garg <gargaditya08@live.com>

This patch adds support for USB-C model of Apple Magic Mouse 2.

Except for the hardware ID, it should resemble the existing configuration
for the older Magic Mouse 2.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
v2: Fix broken patch
 drivers/hid/hid-ids.h        |  1 +
 drivers/hid/hid-magicmouse.c | 74 ++++++++++++++++++++++++------------
 2 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..2d3f96af6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -92,6 +92,7 @@
 #define USB_DEVICE_ID_APPLE_MIGHTYMOUSE	0x0304
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE	0x030d
 #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
+#define USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC	0x0323
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
 #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index a76f17158..423d50702 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -218,7 +218,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 	int pressure = 0;
 
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		id = (tdata[6] << 2 | tdata[5] >> 6) & 0xf;
 		x = (tdata[1] << 28 | tdata[0] << 20) >> 20;
 		y = -((tdata[2] << 24 | tdata[1] << 16) >> 20);
@@ -370,7 +371,8 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
 
 		if (report_undeciphered) {
 			if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
+			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC)
 				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
 			else if (input->id.product !=
 					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
@@ -497,7 +499,8 @@ static int magicmouse_raw_event(struct hid_device *hdev,
 	}
 
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		magicmouse_emit_buttons(msc, clicks & 3);
 		input_report_rel(input, REL_X, x);
 		input_report_rel(input, REL_Y, y);
@@ -519,7 +522,8 @@ static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
-	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
 	    field->report->id == MOUSE2_REPORT_ID) {
 		/*
 		 * magic_mouse_raw_event has done all the work. Skip hidinput.
@@ -540,7 +544,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	__set_bit(EV_KEY, input->evbit);
 
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		__set_bit(BTN_LEFT, input->keybit);
 		__set_bit(BTN_RIGHT, input->keybit);
 		if (emulate_3button)
@@ -625,7 +630,8 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 	 * inverse of the reported Y.
 	 */
 	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
-	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
 		input_set_abs_params(input, ABS_MT_ORIENTATION, -31, 32, 1, 0);
 		input_set_abs_params(input, ABS_MT_POSITION_X,
 				     MOUSE_MIN_X, MOUSE_MAX_X, 4, 0);
@@ -741,19 +747,25 @@ static int magicmouse_enable_multitouch(struct hid_device *hdev)
 	int ret;
 	int feature_size;
 
-	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
-		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
+	switch (hdev->product) {
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2:
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC:
+		switch (hdev->vendor) {
+		case BT_VENDOR_ID_APPLE:
 			feature_size = sizeof(feature_mt_trackpad2_bt);
 			feature = feature_mt_trackpad2_bt;
-		} else { /* USB_VENDOR_ID_APPLE */
+			break;
+		default: /* USB_VENDOR_ID_APPLE */
 			feature_size = sizeof(feature_mt_trackpad2_usb);
 			feature = feature_mt_trackpad2_usb;
 		}
-	} else if (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
 		feature_size = sizeof(feature_mt_mouse2);
 		feature = feature_mt_mouse2;
-	} else {
+		break;
+	default:
 		feature_size = sizeof(feature_mt);
 		feature = feature_mt;
 	}
@@ -787,6 +799,7 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 
 	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
 	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
+	     hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC &&
 	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
 	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
 		return -1;
@@ -857,6 +870,7 @@ static int magicmouse_probe(struct hid_device *hdev,
 
 	if (id->vendor == USB_VENDOR_ID_APPLE &&
 	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
 	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
 	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	      hdev->type != HID_TYPE_USBMOUSE)))
@@ -868,21 +882,27 @@ static int magicmouse_probe(struct hid_device *hdev,
 		goto err_stop_hw;
 	}
 
-	if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
-		report = hid_register_report(hdev, HID_INPUT_REPORT,
-			MOUSE_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
-		report = hid_register_report(hdev, HID_INPUT_REPORT,
-			MOUSE2_REPORT_ID, 0);
-	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
-		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
-		if (id->vendor == BT_VENDOR_ID_APPLE)
+	switch (id->product) {
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE:
+		report = hid_register_report(hdev, HID_INPUT_REPORT, MOUSE_REPORT_ID, 0);
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
+	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
+		report = hid_register_report(hdev, HID_INPUT_REPORT, MOUSE2_REPORT_ID, 0);
+		break;
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2:
+	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC:
+		switch (id->vendor) {
+		case BT_VENDOR_ID_APPLE:
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_BT_REPORT_ID, 0);
-		else /* USB_VENDOR_ID_APPLE */
+			break;
+		default:
 			report = hid_register_report(hdev, HID_INPUT_REPORT,
 				TRACKPAD2_USB_REPORT_ID, 0);
-	} else { /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
+		}
+		break;
+	default: /* USB_DEVICE_ID_APPLE_MAGICTRACKPAD */
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
 			TRACKPAD_REPORT_ID, 0);
 		report = hid_register_report(hdev, HID_INPUT_REPORT,
@@ -909,7 +929,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 		hid_err(hdev, "unable to request touch data (%d)\n", ret);
 		goto err_stop_hw;
 	}
-	if (ret == -EIO && id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	if (ret == -EIO && (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+			    id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC)) {
 		schedule_delayed_work(&msc->work, msecs_to_jiffies(500));
 	}
 
@@ -945,6 +966,7 @@ static const __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	 */
 	if (hdev->vendor == USB_VENDOR_ID_APPLE &&
 	    (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
+	     hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
 	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
 	     hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
 	    *rsize == 83 && rdesc[46] == 0x84 && rdesc[58] == 0x85) {
@@ -971,6 +993,10 @@ static const struct hid_device_id magic_mice[] = {
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICMOUSE2), .driver_data = 0 },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC), .driver_data = 0 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+		USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
 		USB_DEVICE_ID_APPLE_MAGICTRACKPAD), .driver_data = 0 },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
-- 
2.49.0.windows.1

