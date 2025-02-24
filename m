Return-Path: <linux-input+bounces-10269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D46A41548
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 07:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFF3616438C
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27BD1C7012;
	Mon, 24 Feb 2025 06:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ZNEhha4M"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011037.outbound.protection.outlook.com [52.103.68.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E712E28DB3
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 06:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378185; cv=fail; b=Sbxwx2kZgQwxgQ8G/a1eNCHPqJixPbu8QNi53Oj/U7nCCc2SQ4aNaFP8MOE7aM3YkXs9sf4BICJMNZrZ4416viZ3qxxEdwh8+aXdOgLu4SmByV9f4AhOGrN/U156VYr2g9kbECsCSpcQhHdbnGVgqSqbMWYJn+nufWCJYxju44M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378185; c=relaxed/simple;
	bh=Mc7QmT4ZMaTLB+WSGAzguCOJyhYkiURgqumkzKZPpxY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s+lhRkyV9umqP/kpw548ebXExWk9bFQW8VwPtCuavlaBThb0/zL/hgMGYF+QJVrLdB4Co1xN1VYbX3Pcr82SCZCde7rtYXyYKqUju85TQVCzQc5geDnz/uOPYK9ehs6hl6daPICTVUtHI1bYm8mcQ4mrKq0OoyQqAw9p5u64Rz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ZNEhha4M; arc=fail smtp.client-ip=52.103.68.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsmSHWxRy9K5Hvj6p7t9cv+iTf4pouaHwGEwYI9DMLmLCxhJvUNf+xf/dm6yiGxiDRebS7fTQfKplXovyxdgDp/xG8wxJwZJkULA4QwCKZV8UHOolRsPq5yoCSn0U4/gt787xjjiUj7rNsATkq7g/uN4RWmeezxJVLolwmCFTwBQVqf9bPEj+hhxeugnft1xMAzJKZ+gyTb9ZWiCtkAXrdkmpdgB9/HwJQ9KJsAGZTf9N/3UsUVzAwm80raCbyRIp7HjNeDjEUYrkVVPX/lSfn9kc9yJTcJT6YGUk6FcQh0upw4EhisWm6oFnph+MSRoKMpokMlz1eqaFboHDxB6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc7QmT4ZMaTLB+WSGAzguCOJyhYkiURgqumkzKZPpxY=;
 b=dmEZ3QPU0R5syb91/QuOPYoPj7wDU5aznLoIKoIoS2acROo9XUfdniAPx4XtXgGmxQsFWf8EtecB1/3a9Q1mXiJWgycFz+Ndf9FKup71DkQj2VK+sFcu5gAlvDtLRdgERiXJcYP0XB5ZNwkeLYhssPKgnBNa8oos4ZLa14obbGSRDr4g9h9KwHkqU1XS0WjdVoNrJPBRKCdjuAbNB9UtVecxzE2zndRK2Zs1AXmEEuJk23MzUnqYp5/kjaGJTVFcSGXyGYDfmg3e/iNgtVgQEkxuFXLw3kwGR2Q+IUB9c1/cPfgsKqc+4pxEWlOC34KnZjnpmKn2PdyqKIq1mWrbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc7QmT4ZMaTLB+WSGAzguCOJyhYkiURgqumkzKZPpxY=;
 b=ZNEhha4MPoaeb3L9AQ887j4ve9Zitjl3Hdu4aYnhkHTIa6DE+dyBOdUzVDe9vjlbFrJM1+9uVkBlVVSZ44e7CAkgJymx1g3PGXp9sAnAwIDVZI3MiQUWLcPdBHyCeGTikSqhsG4BghfY0Z1ujz2kXJFRGdHBc4H1aLgsb5WMdekQKUS6C1Tf8CYKFnJi7e4q6mwwWCanEJHr5k0+PPN6jMqGglDAWLrYwQsvegGSxEx74L6LEh985qZkYvPnKwHnACOsv9dm+u2XU+Xybh30KpThG1AZNfzDxkiK6xjkrt0n7i6FdDFl12dRryh48I3YppxIi8PPhMvNhCflyLmhOw==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PPF10F160173.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::586) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 06:22:58 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 06:22:58 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, Alex Henrie <alexhenrie24@gmail.com>
Subject: Re: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Topic: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Thread-Index: AQHbhn4lZ9IKkTrshEyIJtvBtkR/LbNV/Bv0
Date: Mon, 24 Feb 2025 06:22:58 +0000
Message-ID:
 <PNZPR01MB4478FB4D4B19259EB4746A94B8C02@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
References: <20250224053632.2800-1-alexhenrie24@gmail.com>
In-Reply-To: <20250224053632.2800-1-alexhenrie24@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PPF10F160173:EE_
x-ms-office365-filtering-correlation-id: 92b9fb0a-8cae-4df8-9408-08dd549baeae
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|19110799003|461199028|6072599003|7092599003|15080799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUtpSVZvWFdKVS9kSWZRa3VyYVdxS210UytveVlEWm01Z2JpS2NUZnNwREY4?=
 =?utf-8?B?QlpHTzQ4dlJpT0RiR1JzUG95Zm02eGdZYjJSaEpCQW5sZHBFSmoxRk8rR3hF?=
 =?utf-8?B?bEZyV1hUVWZKUGs0aFhzQ01IUE9Cc0NWMmdRYVpKMjBGdmZydTdOMEZvYWxm?=
 =?utf-8?B?dHl5bHhSKzc2S3hEa0NGQzNVakFEbjQzWHpmNjdzMGJjQ3ZaNzlsSWtkZ0xl?=
 =?utf-8?B?Q01vTE56MkdCU0pITm8vSW53N0hrRmphNi9sYmtJYlBmTlY5OTBWS1lnOWFC?=
 =?utf-8?B?NUJ2YjJYbVNLTXBDS2lkNFRPS2NVNGFNMm1Vb2FnK3V1UEZCeEUvRTVmYTh3?=
 =?utf-8?B?VmZJVFdtK05Yb0EyT1gzNFBVTWlzeXRodHdwY0IvWHU3WXNkb0cyeXdVeWtl?=
 =?utf-8?B?WVNaWXRuclp4dndqUmI3YUZxd0FON2VqNlhsR29QZ0l5VE8yMHFHRm5NbUw5?=
 =?utf-8?B?R1UxYVFHVXJrc1FIU3BXMzFNQ1d6MFhsSHBVZDNCdVFhblRyNFRTTFk1TWVu?=
 =?utf-8?B?Ym9aRU1yb1pwZjE1V09NRWIwcE5FdFMzWjdMVDVrVmR5aWNQT1UxMWZMUmlj?=
 =?utf-8?B?YzB3U09mL1o0WkcxYWJlekFWT3ZERWlJU2c1NVJ6QVpFdFd1cU12NGE0MWs1?=
 =?utf-8?B?bVo3ZUVxWGNDYllWUllLbzY0WWtrOFRVTXp3b1YvZ25FcDlvVlBJMm16eVZs?=
 =?utf-8?B?NHNwMDVpeTFJRFQ1b1R4SWdobloxeWhFWFM4NzZWdm9DMDZsb0lxZ0hjRTRq?=
 =?utf-8?B?ZVFhbUlJTzdJRnBwVFBBT2VpcWVGSUhEZlRWUGdGUHkyNllQS3NBYXphanBw?=
 =?utf-8?B?aUNhS1htektXek5na2hHdUhBaWNzUXNuU1E1ZnZ0K0RXQVgrak9vRHZmUHM4?=
 =?utf-8?B?NGRqdkJnMVlYRm5FUjJnQkJ4K0hZdDFHOE5rMkpwb3FneC9YMkhscFI1TThR?=
 =?utf-8?B?eG5MR3pyRk5IOWlRaGdwSnRmcXlHWFZ0RWJhemF6dmQvZG5aQnlzSTBZUUNX?=
 =?utf-8?B?VVNWeHpMM05qVFdhb1FoT3pUbnVIOEZWQW1oWHF3WG5BRDlqV3NRT0E1NzZR?=
 =?utf-8?B?MGpRcUlnWEZHZTlPVU1pNVlMeWZ0NXJlMGZZZXJpbXkwOHNyczJKTk5MTWJy?=
 =?utf-8?B?YkU5Qjl3T2JpZGxnNTZXdHBmMlVvTjAzMlNSdFhkUzRiUXg5cTNCUlFHbUh0?=
 =?utf-8?B?SktDTCtFZTJremh4cmMzWng3eDR5MEJsTS9qTlVoQ1NLVHdWa2N1ZEtJQTdB?=
 =?utf-8?B?VDAxZnRrQWJzZ2R4NVlnS25UOVhPbUxST09MUEJ4UlRhOEQyZXNDSzFqaElL?=
 =?utf-8?B?cDliUUFaQjdiVHcwOFdMUWVNRkF6eU1CdUJJTkhGV1ZRQmppa2VQN1Y4S3Iy?=
 =?utf-8?B?bWt4QWx2d1VyMEUvZlRSZU15UjVkakljL2o5aGQxMnUyS2JlK0JpWmZxRE50?=
 =?utf-8?B?VGZhZ2RGZW5nRS9KYnFNNm00U3ZJRTFqVWxobVZ5dy9razJpTkJvVHVCRHR6?=
 =?utf-8?Q?Fo2+QY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZThoQTBIdHJjbXN4dnBSR1JLRWpYMzd1UlVta0Z0TWtldHR1UU1NSWRmbFlC?=
 =?utf-8?B?QVN6Qk5zN2ZUaUVtd3dMTUJOUzdWdTRxeUxpQkg2OS85UDc2eG5wcEFES1Ex?=
 =?utf-8?B?SmM3VVlGTXNEUnpGRGdldlJxRHFPaGR5Sm1xYXFiN1ZQTWF2eUJRWGxoU0lj?=
 =?utf-8?B?cnptVTJqWnM4d0hmeG9WcmtnOGp0K0xpQm15MjNWenJvYkJzanIxZ1JzQlN5?=
 =?utf-8?B?VG9EZG83MDBJdnFRR0FFcldtVWV4VnMreW5laDdhMkVOMnJUaTM2ano3RDV4?=
 =?utf-8?B?bWRYV0FqUEdQTXd3RHExSEpEa1BXSWRFcVhvVGwvSjY1ZFJxWUJvbW5KMWdF?=
 =?utf-8?B?MW5jVkJXcW5SNHcxcy95UkVyT25pS1YrNSt1NDg3TGdZVnNpZDdLMFFud21L?=
 =?utf-8?B?UDlZRVRYL3lwUjZwaVFJOFpPd3hCaktFWDZ5em1yby9pYit0L2JmSXN0ZmhH?=
 =?utf-8?B?dE1nOVNxZnZraHRvVFd5ZTYxQUUvbENkRS9hS01YWkphV2xRWk5NNnliYS9p?=
 =?utf-8?B?b3o5ZXlVTTgxS1ZtQi9EOWFpWjlJazVIYWpxWXNkajB5eXpWUlFCWU9lSWQz?=
 =?utf-8?B?aVIxa3hiTllOZCs0TDlOb3BvcHllc0I2NGJXQzh6T3ptNllzTkJpWmZWMlhI?=
 =?utf-8?B?QkZ5ejlsT3puVHhpRFJUelJqWDMvWXBSMGZ3MEVZYnluTHY2N3REcTRFRFNF?=
 =?utf-8?B?UlVjY3RXVGZBNU9kM2pocU9IU0UrZ2VndnJLTWxCNmxLeWs4NmpWZUZRb0E4?=
 =?utf-8?B?eGNQS3pobXVGNXBzS0l1RDQrZkFSKzlsS3B2a0VIaVh3cEppR1ZHOXZkcXQ1?=
 =?utf-8?B?aHpMNjRpVmtlNW1Ra3oxWWpGb0NpVzFmMGJsT0lZZE1acHd6OUk2MjhyUUpD?=
 =?utf-8?B?WEdTYmxTc0FYTkdKaVlrNzdnOW9OOGQvVDBrL0grQVhRbFB2MWs2enY5dWk1?=
 =?utf-8?B?WHpaMXR0OXRRWWV5Q0tvOTlMQkQweS9UbDJZL2t1NUIvSWZ0N0o3S3NxVmtU?=
 =?utf-8?B?V0pmV0oydjA4ZkxtV3FRc2NOTkdYdmVSYkJ0TVZNTnQ5aVpDakN5dGhkendu?=
 =?utf-8?B?L2hZSVN3ODBpVFpSQzZ2MHBFSzdqQ0k0MHYzdWJUeHBJOTY1WmZIUC9JcnRo?=
 =?utf-8?B?YVJKZ0hOVDc2SWV1bHNQK2I1Q1Y2Rkt0L2lkQnlUYXREZDhZY05NZnZwd3JR?=
 =?utf-8?B?MVF6Z2w4aEVxQ3o0eHVIc1N6bUFJcmlXcEkxS3JoeWtGYmN6cXNlczdlek52?=
 =?utf-8?B?NklieDVqY0RWMWNwR1BvWGVvV2FOQ2dEZlJCUXlSUDJRZXhTY0VZVXl1cXcx?=
 =?utf-8?B?SzE4L1Y1NFJjcFdQT3BIK0xyTmgxWjlwV2xsMy8yZ2Z1OHVHL1JGWXllNXlZ?=
 =?utf-8?B?Z1F2RSt6eTA2UzhKbTIyY2lNbndueEN2SXhPSGN5T3VGNENldGFWUWsxSUQw?=
 =?utf-8?B?UlBGRmxSZDk0SFVBVU4zOFI4RjJDNTdVbGtDai9MN29mSWxJNkJIRVZDVWNq?=
 =?utf-8?B?d2dWb1FSTXVsL0RObkpnMTAwUC9YK2pleXNMaFVLZWRiakNLOWdYckpFTnA2?=
 =?utf-8?B?bzVxZ1pCTUFUUGtwWmlHK0pIaXhmdE1GQW45Q2FlSjFZK2U1VnRMMlA4MFIx?=
 =?utf-8?B?K3pKRDdUakJYc3BicEpwclpQTmFmL2dVRVpYY01COW1zMTc1TWRNV2xpZnlG?=
 =?utf-8?B?TTE0ZDV0UlhpM0w3eHRlV1hyRS9QalY2QVg1clQ5eHZpOFErTXk2ZTlqRVFj?=
 =?utf-8?Q?STa8Kvdhj6V27BFvXU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b9fb0a-8cae-4df8-9408-08dd549baeae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 06:22:58.3665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF10F160173

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDExOjA34oCvQU0sIEFsZXggSGVucmllIDxhbGV4aGVu
cmllMjRAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IO+7v1JlbW92ZSB0aGUgZml4dXAgdG8gbWFr
ZSB0aGUgT21vdG9uIEtCMDY2J3MgRjYga2V5IEY2IHdoZW4gbm90IGhvbGRpbmcNCj4gRm4uIFRo
YXQgd2FzIHJlYWxseSBqdXN0IGEgaGFjayB0byBhbGxvdyB0eXBpbmcgRjYgaW4gZm5tb2RlPjAs
IGFuZCBpdA0KPiBkaWRuJ3QgZml4IGFueSBvZiB0aGUgb3RoZXIgRiBrZXlzIHRoYXQgd2VyZSBs
aWtld2lzZSB1bnR5cGFibGUgaW4NCj4gZm5tb2RlPjAuIEluc3RlYWQsIGJlY2F1c2UgdGhlIE9t
b3RvbidzIEZuIGtleSBpcyBlbnRpcmVseSBpbnRlcm5hbCB0bw0KPiB0aGUga2V5Ym9hcmQsIGNv
bXBsZXRlbHkgZGlzYWJsZSBGbiBrZXkgdHJhbnNsYXRpb24gd2hlbiBhbiBPbW90b24gaXMNCj4g
ZGV0ZWN0ZWQsIHdoaWNoIHdpbGwgcHJldmVudCB0aGUgaGlkLWFwcGxlIGRyaXZlciBmcm9tIGlu
dGVyZmVyaW5nIHdpdGgNCj4gdGhlIGtleWJvYXJkJ3MgYnVpbHQtaW4gRm4ga2V5IGhhbmRsaW5n
LiBBbGwgb2YgdGhlIEYga2V5cywgaW5jbHVkaW5nDQo+IEY2LCBhcmUgdGhlbiB0eXBhYmxlIHdo
ZW4gRm4gaXMgaGVsZC4NCj4gDQo+IFRoZSBPbW90b24gS0IwNjYgYW5kIHRoZSBBcHBsZSBBMTI1
NSBib3RoIGhhdmUgSElEIHByb2R1Y3QgY29kZQ0KPiAwNWFjOjAyMmMuIFRoZSBzZWxmLXJlcG9y
dGVkIG5hbWUgb2YgZXZlcnkgb3JpZ2luYWwgQTEyNTUgd2hlbiB0aGV5IGxlZnQNCj4gdGhlIGZh
Y3Rvcnkgd2FzICJBcHBsZSBXaXJlbGVzcyBLZXlib2FyZCIuIEJ5IGRlZmF1bHQsIE1hYyBPUyBj
aGFuZ2VzDQo+IHRoZSBuYW1lIHRvICI8dXNlcm5hbWU+J3Mga2V5Ym9hcmQiIHdoZW4gcGFpcmlu
ZyB3aXRoIHRoZSBrZXlib2FyZCwgYnV0DQo+IE1hYyBPUyBhbGxvd3MgdGhlIHVzZXIgdG8gc2V0
IHRoZSBpbnRlcm5hbCBuYW1lIG9mIEFwcGxlIGtleWJvYXJkcyB0bw0KPiBhbnl0aGluZyB0aGV5
IGxpa2UuIFRoZSBPbW90b24gS0IwNjYncyBuYW1lLCBvbiB0aGUgb3RoZXIgaGFuZCwgaXMgbm90
DQo+IGNvbmZpZ3VyYWJsZTogSXQgaXMgYWx3YXlzICJCbHVldG9vdGggS2V5Ym9hcmQiLiBCZWNh
dXNlIHRoYXQgbmFtZSBpcyBzbw0KPiBnZW5lcmljIHRoYXQgYSB1c2VyIG1pZ2h0IGNvbmNlaXZh
Ymx5IHVzZSB0aGUgc2FtZSBuYW1lIGZvciBhIHJlYWwgQXBwbGUNCj4ga2V5Ym9hcmQsIGRldGVj
dCBPbW90b24ga2V5Ym9hcmRzIGJhc2VkIG9uIGJvdGggaGF2aW5nIHRoYXQgZXhhY3QgbmFtZQ0K
PiBhbmQgaGF2aW5nIEhJRCBwcm9kdWN0IGNvZGUgMDIyYy4NCj4gDQo+IEZpeGVzOiA4MTkwODNj
YjZlZWQgKCJISUQ6IGFwcGxlOiBmaXggdXAgdGhlIEY2IGtleSBvbiB0aGUgT21vdG9uIEtCMDY2
IGtleWJvYXJkIikNCj4gU2lnbmVkLW9mZi1ieTogQWxleCBIZW5yaWUgPGFsZXhoZW5yaWUyNEBn
bWFpbC5jb20+DQo+IC0tLQ0KDQpSZXZpZXdlZC1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEw
OEBsaXZlLmNvbT4=

