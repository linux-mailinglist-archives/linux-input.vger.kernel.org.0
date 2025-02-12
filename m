Return-Path: <linux-input+bounces-10001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9EA32B33
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 17:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32811637EC
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67D421149F;
	Wed, 12 Feb 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RmRc80Bq"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D22211279;
	Wed, 12 Feb 2025 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376625; cv=fail; b=fRdkFB4cFUU7sj9vfcC4HTYu4qTWFHs16/7wA+zlWL/MRR9Sl+hu9s4n4QNk1dPaAfYj297/P7+LoccsZNYA80JfG2ZckoDTDQPYnCGz0GB9y2TJOT7Q2Q5UUN9okloYuMLbkrSeEnWd/uzFY6lN2ya4zdlJOzpSssm0v2P400g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376625; c=relaxed/simple;
	bh=11IcU65czaQyGqjyL5NuNr82zKmvbd1fLL3tPLAGDLE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l1TqWnNf5nLEyw6g/gwLaELu7PqOnyKMC7IF95Y6Zau56kgx9DWssa/kVV4rdbPCbB8SqoDsrzvz5yFA6pIdC7xL2ida5aUSpZZ/dibw29msAq5gtlPKODp3KUfCF3Z5uCwS7csv2UhQX4seP8xYV3Y7ffFsED2uY9U51e2z7dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RmRc80Bq; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLFzrtiAQm0EbsJwg8WKP8pzhUdt+s69Rm4NvXMyeMy3o0TO2z6nDyEeFZZkc4FzQZzqTHCjx+2/E9KEAqctNd6ULLc00FnpwtO/v1Uan4f8CkS+6pnVP2jSQlir9sdb1EQsceSA/5TyT7TxGDgQ2bIpr+UstD97PCFxBx/qHhbUlUNLTKLVbqK7wTDApa+rxCYTgY+VL1+hjLqga10SlXApx/69X0kWMrcMmWU6RBCJr2ktwq7N/h5Qs6VuyoE1fuVoNZ/pLgYAKmyiBgy61YGh1xZXxxdmDT9GHgUaNe+uoW4qyig2ljX5SKSMNWfxyCpj0MY7j71aiNL8bCCkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11IcU65czaQyGqjyL5NuNr82zKmvbd1fLL3tPLAGDLE=;
 b=VBYGAfSsAhtK4XRdzq4R3EJTKv5toy+Mxmb0vrmJITaMxO5WLITknxdNcsAjk96iyp8drgZBAe3vwXKodu83kGaJ2vssRyrvuT82Ox+eXSU43xXyVJxayTnIxDGCpPc3Z6DTKHMrKILx7Jsy8M9a9OFOMO1hFBmMwr/5NZw5C3lgNL84tQR15KLoX/iwZ02dLZE2ZiD/GVvlYdc2u51zMcPM4cGLUaJYdASFZnTTpXhlG3fcxVEpqgOVHryhMPTv4KboeoX/JXphJf22XnnyBxC8OCRc5+8n+2jIGFtydLBeRvODp2TMNt84S1/ohPf9s+BbqE/EUui6MQXtgy62hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11IcU65czaQyGqjyL5NuNr82zKmvbd1fLL3tPLAGDLE=;
 b=RmRc80BquRKkyN6g3QDAJs4H6e5KaX/g+mtr1J6C+IX+VMWPTUo5hSBbhoYxgnySFcwepcLP3XPNQgnl4/aqiusUCQhz+FGZONctjX7t1nzzbPUu7CjDwPtlr5H6ilD+n3g3MaiKqAFSs8YXohLAu6jLzPoAhxGE+o957yhSuH1f3kf9LLJueCukBr/J/5KxyGczZwKhcVM8oDwHSKhaBzRXFX6kXk6BFy1JdHsErwkmXBgP7BAfpaBMCl7PMpoQ+FrtgjR6BVZHhQehu5bE+4tEOOZiaqioKF/fd4IvNtti+GY1CoiTo8q58dLh0LxF5dfNRtrWCwY7Y9h8iHIQqQ==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PR01MB9297.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 16:10:12 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:10:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH v2 2/2] HID: hid-appletb-bl: fix incorrect error message for
 default brightness
Thread-Topic: [PATCH v2 2/2] HID: hid-appletb-bl: fix incorrect error message
 for default brightness
Thread-Index: AQHbfWiY4SwvHLPFKEWRiPkySZcBog==
Date: Wed, 12 Feb 2025 16:10:12 +0000
Message-ID: <9441AF40-0481-4709-8D21-2058CCAF9304@live.com>
References: <FD47E76E-F8D0-4EE4-A050-E3A569806BFA@live.com>
In-Reply-To: <FD47E76E-F8D0-4EE4-A050-E3A569806BFA@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PR01MB9297:EE_
x-ms-office365-filtering-correlation-id: fd0270e3-4fc1-428b-f000-08dd4b7fbb13
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|8062599003|19110799003|7092599003|461199028|15080799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?OVpzbCs0anhzSTdDWUdaOW5VcitiS0NoU0Zkam5oSVBUd3NybkV0emI5KzZv?=
 =?utf-8?B?QkRlRkVLMmVlSVUzTFNuRTdzWlhqZEJqSFYyWndGL1NMSEI0RkVXY0hZY214?=
 =?utf-8?B?QSthOHRyVDFQbWZsVEoyRVBFOTAwcEZMczJtSDJ2VVZjYVcvdnduOWgzcnE2?=
 =?utf-8?B?OS9lb0o2YS8rSnJ4eEpSdVRRVmRBRGdqY2FETVB2UUoybTZXdG1TVUJvck85?=
 =?utf-8?B?M2FwSnhqYkJENllhRkxjRFhxR2hLVHVlVEtaY0YybldueDB0c1NBSG1ud3Bo?=
 =?utf-8?B?MURLWWZGNDM2NjliejJENnhveHlnVCs3Q3BJSUdtbEhxWkFtWTBYQzIvem5y?=
 =?utf-8?B?MFA3MHAyY0V3TEkxS29mVGtjeW5UcDJxU2dQWWU2dkIzU2UrSzFBQnl4U2RC?=
 =?utf-8?B?TmxLQlI5WGdncVNGNzh2U2ZrYnNoYUd1TURxQk5XbGQyOWlXNG9BNjkyKzJU?=
 =?utf-8?B?YmZZRmhuL2lwUlNVellRQUV1Z1VTNEFIQkNrNjYvd0pFSFdhRWNHdEFrM2kr?=
 =?utf-8?B?c09NYVp1VkExVG1SMm5sUGdZOTBHVnl4TTBBNWJaaUc1Q1FKWFYzcXJIRXpU?=
 =?utf-8?B?dy9XSG1pYmRoUjk1WkVQeEJlVUhtZExlaHRjaTJwWU95ZUJ2R3l2SW5XWTZl?=
 =?utf-8?B?TDJobG9ES2NoT2Z3TUpMK2ZOd2dZcFBjTEZwZ0k5eVV1dndnZDBWeTd3TEVH?=
 =?utf-8?B?Z2ZZVGlpMkFkalNxK0hOZnN2S3BFSGpQcm52dWNHZy9rQTZ5OUFicDI3NGRF?=
 =?utf-8?B?M1RhQUgwUHhNZWpsbkxFN3pCR090ZXJSbG4zYXZ1SHVtU25SNlQ1WDlVMFR3?=
 =?utf-8?B?alE3Q3FCZUpOa0EwZ0dCUEV3blgvUEhJMWNLWGJRQkM4Z3JFWDQ5V2IvMWhv?=
 =?utf-8?B?Sm16UEVVMm5JYW9YNno2WWZEMGEyZ2s3SFRkZXZKeWZKWlRZVHVYemozcUxS?=
 =?utf-8?B?VWdjVzM2dlBadlVpY094Y0QyWDRPK2RBSFkvTndiZGJBMmx1RHE4UWYvaDFY?=
 =?utf-8?B?MWpZWTVlSGF6ZnY0aXpQQnpINjR6bkoreW5OSXZ2dmFkdEw5L0VOQUJrV3FB?=
 =?utf-8?B?cnFaTmtWQUtPNU50K0tEWmJndVc3OHpXb3JaVUpVdlYwemp0M0lLWGhjRjhO?=
 =?utf-8?B?UEkzNDVMWkxpK0sxb1JpdGtVcW5LR0IzQ0pTcTZzZUdVTnkxWVc0a2dpQStQ?=
 =?utf-8?B?Z1JxQUVUTlY5b2FNa0xzSFdoZGVlZVkzYXI3MEFyVHh0djhvNFRYbWxKeE9S?=
 =?utf-8?B?T292UWh6V1hZQ1RnRmxCdXhqRHJ0WkJldXYrVTJKNWJlSTZ5M1ZmT1gvVk1T?=
 =?utf-8?B?Y1pjOFNSSjFvMlRtRWtGVlA2U0JFaVhKMUN3cW5kUVlPZnd3cXBXZkt2NTJL?=
 =?utf-8?B?NFdkWUtnK0NSSmcwM0VTWHpRZ25lU3NlcjFMVksxZm1TYldBTTB1dlM0dmJD?=
 =?utf-8?B?VlVvMmt5ajJYcTEzbkJ5V3hnWVZOQ01YekRPME1RPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SW4ydUdzWDFFd2VpVWN5T2NNajhiMGZNYXBqaW4waGd2MTNCd0pDbk02bFQx?=
 =?utf-8?B?bmg2a1ZnTW4yR0VpRktVN2RqbVFHWjVsWVlZdVcwTUY4bnpkdm9BNXJFWHR5?=
 =?utf-8?B?elh6ZncwZERwaEkwMm9BNS90azM5enpNRkJlaHFmdkNaTEFGblZhNzZRbThM?=
 =?utf-8?B?YXJ6T1owQnlUODM3a1ltM2xGNitqQ2ZUbll1dGNPaVIyT21PdEdJdlQ1Z1Mz?=
 =?utf-8?B?NWNteHB2T0ZPeUQ4SExhKzNoZ2R3SG9lWkI0TU9mc095TDl4YWE0Z2Fsd0sy?=
 =?utf-8?B?Z3FTTUk4ODhpNmVMRzFib1RIVTR0am9CbkZYTTF0TGRUeTMwSkU4VjY3NVF2?=
 =?utf-8?B?MmRRTEpDSFNsWXZYOVVIaENLNG1neUdmRWJvN2svREZ4dnZSMTF6Z1RNY3Ba?=
 =?utf-8?B?eHo4WSsyekJXMW5DcytZRGNtNzJvWEpVSkNhOHR5elhRR2hXVmZDak5mZ0lj?=
 =?utf-8?B?OXVwTXcvazBrMGw4TDhLYzZHTHF3M2ZCVDdjRklRemgvTGcwaHhnNzZDU25H?=
 =?utf-8?B?Z1RxalMwb1k0ZFc1WmxxS0pseHVjWk5IeWExSWxpelRlekg5cmJDNlVsMWhW?=
 =?utf-8?B?WWtRTnNDemtXSEtobHI2Q0RSNW5RMjdWNTZCcnpzT1JSS1BhOGk5Snp1YnEr?=
 =?utf-8?B?eXEzMytVbEVSbi9QSmcrQjd6N2tPWkJzUTVIMFdKRU53V1Vld2NETDJWZmwz?=
 =?utf-8?B?b3phaGFDb3M5SWFNMlJHbkNqQUZ1VVRnSlNaZkF1dGRsQVRVd2w5MlphVUdx?=
 =?utf-8?B?K2lyV2JQVmJKdjhNYnRiVzhIZDJUdHBSNFJ4MnRnK1p0aTVDZExRUFlHdnFq?=
 =?utf-8?B?b2tnTXVzL0RidVlEYllWbElkSzk0VjRXbDZ3RSthWUgydS93QXRMTlhCdDJh?=
 =?utf-8?B?TStpc3RuWjNXc0dCZ1oxK3RIN2V6OE4wbTJ5dW1vNTlUZ2xVTWdlQnhXYldV?=
 =?utf-8?B?Qis2TWVXY1FzYWlzUnUralhqVlNoL3hQbHQ4aWZ1RU5ZRXErVlhPOS9Ic0Y3?=
 =?utf-8?B?SGgrMThBZWw2OHJqd3ZFQUtJd2NjK2NUZ0lpRC9CYUxIOVJ1ZVVHVmZOaGFH?=
 =?utf-8?B?eGdWNDFBcTNSV1RlZHZVV3pnSmVBTzY5cENJZFlDdEdFZC9yY1F1b1ZaY0pJ?=
 =?utf-8?B?MnZzNklaZXUwaXFlVlJpOWxYTGlmd2cyY3dlQTU5Qm1Tc1QrY3VOS0tMNVIv?=
 =?utf-8?B?ZWRNRlJrSndNRGs0Tk41aVNWa2k1WHpsbFNmdndSSzdGNEN5RlA0NnBOMUlx?=
 =?utf-8?B?QkcrQ2cwUlIvUWZrd3J5a0RWc3R5cUk1N2RoR0RJS282bDZvWS8yQ2hHVXVx?=
 =?utf-8?B?b0tnOWloNEdKdUVnd3lsU1BXZ1FDbHpPWnIrLzVZYUUzdjg4QnJvVzkvZW5P?=
 =?utf-8?B?Z3JEVVJVbDVna2VlUFRqeFFKYmNtN1kxZVR5SXpNaWZ3dkpVTDI2MTBCTmU5?=
 =?utf-8?B?VWF6S2c0OHp5QW5jZWlaZGRKbTc0ZS81SVNuZHZrYm0rWFdYYzF0cnRLZ2xP?=
 =?utf-8?B?T0x0cndaMldOeXdxTWZocFV0WnNZZkNkWjNoL1N6aWxqbE1VUWtMYXYwaWlj?=
 =?utf-8?B?ZkNWQlNLNG9lOU10M1NOS1BvaGR2Z0pydFpCWVNVcmpXc0d5eEpBRFNkdTEv?=
 =?utf-8?B?akZtU09BOGE2d0hrL2l2eEtxTk5tQlVLSUJuR3NXankvWjFHRm1CQkVXN2hY?=
 =?utf-8?B?NTRINkx0NFptZnZuVkRpTVhsM0pnTHRCemo5dEI0TE45UktNNWR2UHVKdFpn?=
 =?utf-8?Q?fTC2zhGVP5fLjXqFSXmaqs81JjkvTGUIYAt0ASF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <102FC2D0ED8D814388EBA57D23F2D105@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0270e3-4fc1-428b-f000-08dd4b7fbb13
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 16:10:12.7681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9297

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhlIGVycm9yIG1l
c3NhZ2UgcmVzcG9uc2libGUgdG8gc2hvdyBmYWlsdXJlIHRvIHNldCBkZWZhdWx0IGJhY2tsaWdo
dA0KYnJpZ2h0bmVzcyBpbmNvcnJlY3RseSBzaG93ZWQgdGhlIGludGVuZGVkIGJyaWdodG5lc3Mg
YXMgb2ZmIGlycmVzcGVjdGl2ZQ0Kb2Ygd2hhdCB0aGUgdXNlciBoYWQgc2V0IGl0LiBUaGlzIHBh
dGNoIGludGVuZHMgdG8gZml4IHRoZSBzYW1lLg0KDQpBbHNvLCBhIHNtYWxsIHR5cG8gaW4gTU9E
VUxFX0RFU0NSSVBUSU9OIGhhcyBiZWVuIGZpeGVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEg
R2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KLS0tDQogZHJpdmVycy9oaWQvaGlkLWFwcGxl
dGItYmwuYyB8IDUgKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYyBi
L2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWJsLmMNCmluZGV4IDFhM2RjZDQ0Yi4uMzg4NTEzNjI0
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYw0KKysrIGIvZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGItYmwuYw0KQEAgLTE0NSw3ICsxNDUsOCBAQCBzdGF0aWMgaW50IGFw
cGxldGJfYmxfcHJvYmUoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVjdCBoaWRf
ZGV2aWNlX2lkDQogCQlhcHBsZXRiX2JsX2JyaWdodG5lc3NfbWFwWyhhcHBsZXRiX2JsX2RlZl9i
cmlnaHRuZXNzID4gMikgPyAyIDogYXBwbGV0Yl9ibF9kZWZfYnJpZ2h0bmVzc10pOw0KIA0KIAlp
ZiAocmV0KSB7DQotCQlkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIHNldCB0b3Vj
aCBiYXIgYnJpZ2h0bmVzcyB0byBvZmZcbiIpOw0KKwkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwg
IkZhaWxlZCB0byBzZXQgZGVmYXVsdCB0b3VjaCBiYXIgYnJpZ2h0bmVzcyB0byAlZFxuIiwNCisJ
CQkgICAgICBhcHBsZXRiX2JsX2RlZl9icmlnaHRuZXNzKTsNCiAJCWdvdG8gY2xvc2VfaHc7DQog
CX0NCiANCkBAIC0xOTksNSArMjAwLDUgQEAgbW9kdWxlX2hpZF9kcml2ZXIoYXBwbGV0Yl9ibF9o
aWRfZHJpdmVyKTsNCiANCiBNT0RVTEVfQVVUSE9SKCJSb25hbGQgVHNjaGFsw6RyIik7DQogTU9E
VUxFX0FVVEhPUigiS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4iKTsNCi1NT0RVTEVf
REVTQ1JJUFRJT04oIk1hY0Jvb2tQcm8gVG91Y2ggQmFyIEJhY2tsaWdodCBEcml2ZXIiKTsNCitN
T0RVTEVfREVTQ1JJUFRJT04oIk1hY0Jvb2sgUHJvIFRvdWNoIEJhciBCYWNrbGlnaHQgZHJpdmVy
Iik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KLS0gDQoyLjM5LjUgKEFwcGxlIEdpdC0xNTQp
DQoNCg==

