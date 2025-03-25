Return-Path: <linux-input+bounces-11230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF25A7027C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 14:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D29E188936F
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC47258CE1;
	Tue, 25 Mar 2025 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="jqETiux/"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011032.outbound.protection.outlook.com [52.103.67.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF1258CFA;
	Tue, 25 Mar 2025 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742909902; cv=fail; b=HJr/sVbK35sHcvnyJWNnTtTaG9ioSX4kYPJmKUbhCkomcL+SiXUb/eHAUJLrlhw2STOnf3rK85QmqdYBk6xrSGWYLpxG9s+xHS1CGezrUWwSts+LBMYlzwQDPbVIg4PRZ7HxNc3hG2kdZ3lk5WsmhRRUt7i5C12LQKTnu5SldqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742909902; c=relaxed/simple;
	bh=p3vyenuZGRZKXN1/pvMUcSkbJR+rFs1Wqpq/MMZj3iE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lBh7HRKyYOlCPMAcmBYCovpABcAZjsmE4NgibdciuvCZWWLGZWy85NdLTNBtXmQOz6a0M5OrVsB6B7QGCSTPs445zXKp5DB+NiikQknsk+sdElAbIp8CQ0lR6mv0/yiJehJj1C8YhJ4J/63vQvdL4YcT3VS36WlVGaPmWapR7sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=jqETiux/; arc=fail smtp.client-ip=52.103.67.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bw768OcHeFq1C9ccYw2QhVUMtDl7E9hYiWceBkV4sRyL2LQyGME6KA6DmwPv1NuvTDnp+N6WANWYFw/rdXN+IMMGOY8dYgUhE41qeIyvovwvpD+py353F1wV823b2XsGLcoPqHW5LBnPokf9nDwgwLOs3f7uU/Jh1tch2A03o9UvcRvCPhytpADnsr/RzaOeqK9VMqWreSpUNF/XXmEqtK7FLW4SApxfN4+St/K3R5VS411Mz+Kps28+l4PgLBT39UpdbNIXmuoF80GzBb7aw+z+qFjq2Tpkk29Cs+dtfRGcUjR/ceDD7F4A7aea32YIG7jt/8gBkV57EBqhGO+0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3vyenuZGRZKXN1/pvMUcSkbJR+rFs1Wqpq/MMZj3iE=;
 b=xZoR2wdcHTwdFls6moxwdhvTaRFVjcIjMmUoQKQEldkP9XE0Co3lnaMUiswjPIMOwCowji8a0bJVDL8+sO7EJHsqM03KL8eKpwur1t2Gaxmftrpv97pHp12bXRSiGtzpGuvTKweLKv1xBfnD81IWZY60u4s5JYIOCv4JlHZ5M+UHPT7r5j0qeK5FEQqlfK3Yz74KITdK36HGQVzLKpoqN2f/ooC8EbKm8QPWBbDd6yE8ZthzJrqCzUs4r7fUXWl+GOuEfWb0ljiG86drwn6GXcwdcBvJWv/DfnwFjHYYUVh3J6cYcnKU7l+8+r8uaHW4GrgN03072BWLU434Yhnivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3vyenuZGRZKXN1/pvMUcSkbJR+rFs1Wqpq/MMZj3iE=;
 b=jqETiux/2J+4eqnT60oPa6oajZFsaMfInzw6YXNFpHZptCmSqP1rk3U8Kh7SP0CBQHExIS/fCqdWJnTavPJVf9UaguYTNPTwA5+tPqDu4y8pNv9ek4VL0U+3YWjBeS5BTBXXexbHP+2vHWETpou6n9fpsbwROoF9SLEAP1zZmSF9k+LjAQAwfiNW0pbaRrAszGxPQfSQI+YsVo+lxWpf46ayHcj7Q/LTMb0gQ5C8+QDCyXsaSXmEu/H+fO1dIia2HRS/pO8ieBnbwmZO4tortBf212N7vHJQmEdmjiuXYU7mUuA4NlRXL2hjzOQVWCdbAvwkOTQgdFTKaD3zYHiqjw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB10219.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:38:15 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 13:38:15 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, Kerem Karabay <kekrby@gmail.com>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Aun-Ali Zaidi
	<admin@kodeit.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch
 Bar
Thread-Topic: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Thread-Index: AQHbkZzRU8+IPljIHEm6oANSDsXjWbOD7AoAgAAHDKw=
Date: Tue, 25 Mar 2025 13:38:15 +0000
Message-ID:
 <PN3PR01MB95979F7D629681CBBCB763ACB8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
 <90644A22-3136-4D4E-864E-7F7210D0C713@live.com>
 <vx6hvspvlfsv3palzvjpvsrmkl6s7qut366bhxq3tcwvyf7z63@drzftehh2rew>
In-Reply-To: <vx6hvspvlfsv3palzvjpvsrmkl6s7qut366bhxq3tcwvyf7z63@drzftehh2rew>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB10219:EE_
x-ms-office365-filtering-correlation-id: 146997df-a325-480b-759f-08dd6ba24b7d
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|8062599003|15080799006|6072599003|7092599003|461199028|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHRzeFIrSVRHQXNwbDMwNGNKdmppYklidkRZZnY1TXlRSUpiV3l6ejY2S0Qz?=
 =?utf-8?B?eXNoQjAvV3g2RklkdHNoRHJtNG1GTVRxekNXV3pYREpweVFDbkRySXY0SVdD?=
 =?utf-8?B?cS9RQjRmL0I3NlQzMEVvNTNDazRJS3JmKy9pRjNUK2t3a0YwZDBMOUZxSjFI?=
 =?utf-8?B?V01MZUlFWHpNYkdJczBuckdUaUJtaVB5M3RoQXVVVkhmelJiQWxhMEREZ1Zt?=
 =?utf-8?B?cDYwdXVvbDREMnpNb20wdXVrUUVKck5JMnhQbmFmaVJKOEJoVUlKekdCRkY0?=
 =?utf-8?B?c3VmV3doVmhpUzArSDVqNzg0ZVdCRHBoaHlUc2NFd2FpdjdRcVVDL2t6dXJj?=
 =?utf-8?B?blE1ZHIrbm1QOTh5aG5ROHpUNnpFZ2c2WlNYMVpOZmZxWGI0YWlJUkg4VkN6?=
 =?utf-8?B?R1dEdnNaUHpxZTcrUU42UkFtNlpuTVBScEo1OGxXUXN4cnNySE1oK2t0VFdz?=
 =?utf-8?B?NDBKRTY0WjAzZVU5dlg4Vm8ycHZqWGYxWW5IRDY0a2ZBU2Vmdkd3d3Jja1lr?=
 =?utf-8?B?MkxxR3VRYkd6MllWZDdlUm03ZGl5dVJ3bmhNRXRtYlhYRC9vSDJuVXVoNGxX?=
 =?utf-8?B?SHlnQ0M4ZkxqWEtRUStOL2thcVpxYVo0WnVLVnVDajVBekNqYW9FbnpFRWlq?=
 =?utf-8?B?MU96K21EWWgrNnRqUXRsR2RhYk9ia1BLTlExUTIwMHJ0c2kxcEc4akFWSVRZ?=
 =?utf-8?B?VVV5cjUwNU1FQk0yZDBkZWpvMHVEbm45cjE1a2lYck5nT0tmYkU0NXgxeVRT?=
 =?utf-8?B?cUdweklES2o4elFSV1ZUR0toNUhpSHVXeCtOWGc1cjVyd0xDRm1HdzZVT2l2?=
 =?utf-8?B?U0pNVGpBRGJzZklwQkFOeGltbUVlbWU3SjJGTzNna1dSQWkyZzhMWGVWSkI4?=
 =?utf-8?B?ekE1NjY5NC82ZzlIdXNPRzg5ZkU3RzFYc3h3VDRsV0x0RTI3cFBobnhOZWF6?=
 =?utf-8?B?TWdMQ2tqVmY5V0h1MDI2b1I3Z1RrVVppZzhtMy9reEFOcVJSejhHZU4rWFlF?=
 =?utf-8?B?WFh6dm9EenkybWErVVBCRS9FTW40QnJKQzliYmVlcmJqb0ZoR3lOS1diWXhS?=
 =?utf-8?B?MGhvVHY0RW0zVFlBMFUrb1doOWhTVVpzZzhBUVRRWThQZFByYnoyb0MwM3lX?=
 =?utf-8?B?RGxNZWZNMERKMnk0c21aZ0hQbDBQZk9qckxBRjl2MThuSmF3SmlKekVaZG5D?=
 =?utf-8?B?V05NN3Foa3YzRWc4TjlzZ21CMnJnZkFndTRrSWttM3NuUThFQ05aR2oxbnpz?=
 =?utf-8?B?MG55SHVRallhOWNxM2JmNTFYVTlWanVlNzZCMDc1SW5lVWhMRGVBRHdJR2g2?=
 =?utf-8?B?RkZWaGlPdk8vOFRHNjQ0cXAyeGJzZ2h6NDAzVXBxQUpkT2ZVQTJjRWJuZThV?=
 =?utf-8?B?NTdvb01pN1JLNWF2VThWRFI5NVYyNUdaOVdCejNCdnh2RlRaZFBHWUEvMVZv?=
 =?utf-8?B?MktHdC9WWFhMTFQ3cWEyRW93QWg4VlUvOURxWC84MlR4YkVNSjlhWDhidm9P?=
 =?utf-8?B?Tzk2dUkrdURPVVc0MDFXS3V2aHlCc2twcE00UWFkcGdmRUJXSEhkR2w3WThG?=
 =?utf-8?Q?vzVAVGuWL/1xs6aDnebUv6w4A=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWJyOXk2MkljUHJsam9PdU1VQmROWldZSWlFRSs3aUdGcTVqUUdoSDU5Wk84?=
 =?utf-8?B?ZEJzSzBaL3RiR0xNZy9UUFN5cXlhMGVyTFRmSlVYZEFPOGtBc1dzeDluemxt?=
 =?utf-8?B?cFFEcFdyZDROd3RiTHZCQ2VOb1U0RlBBekJOcnFRNC83TnZuQ1ZSYTR2bVV1?=
 =?utf-8?B?c05TN05rNzZtVUEvQU05VWtZRWRzeUVWWHBxR0RRUERLckV3UzdWZXNjN0ZX?=
 =?utf-8?B?YUFYMnhnUlFoTGFEeDl3RkpGUE9TNUg3VnRweGU1OExnWHpLZ3dCNnUzSTRT?=
 =?utf-8?B?bjlRck5WWlJRVmF0ektJVDFrbmg0R3p6NWlKdGNSRU55NGxkNURJUzhEZmxs?=
 =?utf-8?B?emFVWlZhTEZXREFuMDllWmhsdi9HcVdhN253cHRMbkRZcC9aV2lZNmZhd0V2?=
 =?utf-8?B?UnFPQzhqSi9NVUZTYmxKMUN3ZWx4OVNKdkxhWTh3RXBTM1U2cm1hWTRuT0tZ?=
 =?utf-8?B?YWtBeHVLNjFyT3NUbkt1Mk80dkhrSE10cWZ2L0t3YzBhSk81UXo5MFlicWlh?=
 =?utf-8?B?R1ZYVTRlNVpvVndGSUFjYW1WWnZSQ0pBeXhOWGM0ZTRMa1poNGZBa2tPbDJs?=
 =?utf-8?B?MzlramRWSWRBNkplYWJBc3M0aDN4NUQ3TGZGbHlDT0ZjcUwvelBMNWxIOXIw?=
 =?utf-8?B?OWx1ZEtPR0FKZ2ROMndVNFYzUTFGSTdPMitnZW5CaVRGTzhsUU5Ec0ROb1lB?=
 =?utf-8?B?ZFVJUmRYRVVrNHArVXBEZ1VOWk52WkJ5K0huZ3NHeTNKb1dDQ3I5ZnN5bTlK?=
 =?utf-8?B?eTVIWjFlQUFWUC9tZEVTTVpYU0taOE5YVmdMUWUzV2tybFhMbVBVaGlBaXRq?=
 =?utf-8?B?eDI1NUZQMEF1ZVd4eUdJRk52ZHJ4aTRLRVFKbDJPaGxKVGdsZFZ1RzI5c1Bv?=
 =?utf-8?B?RTZ5akMvcE1jZCtManBTdFN5SlI2SWxaZGluNzVUVFhFaHVoNHFEcFA3TnlC?=
 =?utf-8?B?T0ZTektUMWZ1NWxWOG1LdzdseTZGbVJyWmdSSEJzaTZ3UkQ4VHFSM3kxeVFn?=
 =?utf-8?B?WUFpUld6QXF0UUZvZ2lzQVN4cms3UllTM3BrWE9UWGl1TTNhS201Z2JobW42?=
 =?utf-8?B?dXFxc0Z4L1p0WUhrWmhSNG5rWWQvUTRocEZSb29lWjlONVlpc1E4RVoybTNU?=
 =?utf-8?B?MktXRlBIMU80VmVzQVZCQUZBcnZ2dzJuWkIrLzlkYW9CQ2FRWExsblRIVG5W?=
 =?utf-8?B?UWpZS3ZVU3NYbmVocTFEcXQ5SlNJSlhvNkMzbmJBUXI5UTdFZW05cnNtRDRG?=
 =?utf-8?B?RWpCQVRYMWtGWXdaWWNtY0VMWjBNOE16RVFpR2pJVGNkL2FucmRydTZacjgx?=
 =?utf-8?B?eFNqc1JpTmRhWE0xaVltQnl4VmZETkhDTldBTVJFNSs5QXAwYTNhN3dXQ3BE?=
 =?utf-8?B?Y0VYd1JhQXZxY3duUWNSclI4NXhITXRMSXNmdStOTm4ybnhBQ1IwLyttdHQy?=
 =?utf-8?B?ZGdYOW9EOE11SW5KYjh2L3NFQUxnVFJGaTVMaUhGZlhhbXBTLzdoOVJ1NDNZ?=
 =?utf-8?B?QjNxNFduT1dyWVpSSE9nWUxVdWExZCs5WjVyaWxNZUxXR3RXQWU5VUV5aUdS?=
 =?utf-8?B?RFo3S2YwekxLTFM1cThQOTRyOXpubUhnMEFsUVQ0TUVYd094TDloaSsvOEV2?=
 =?utf-8?Q?fTwqvb/eVethLEqWCpidIyzLzf5reBPZCMu3tAidtdQ0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 146997df-a325-480b-759f-08dd6ba24b7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 13:38:15.1375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10219

DQoNCj4gT24gMjUgTWFyIDIwMjUsIGF0IDY6NDPigK9QTSwgQmVuamFtaW4gVGlzc29pcmVzIDxi
ZW50aXNzQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/T24gTWFyIDEwIDIwMjUsIEFkaXR5
YSBHYXJnIHdyb3RlOg0KPj4gRnJvbTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4N
Cj4+IA0KPj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBkZXZpY2UgSUQgb2YgQXBwbGUgVG91Y2ggQmFy
IGZvdW5kIG9uIHg4NiBNYWNCb29rIFByb3MNCj4+IHRvIHRoZSBoaWQtbXVsdGl0b3VjaCBkcml2
ZXIuDQo+PiANCj4+IE5vdGUgdGhhdCB0aGlzIGlzIGRldmljZSBJRCBpcyBmb3IgVDIgTWFjcy4g
VGVzdGluZyBvbiBUMSBNYWNzIHdvdWxkIGJlDQo+PiBhcHByZWNpYXRlZC4NCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4NCj4+IENvLWRldmVs
b3BlZC1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQo+PiAtLS0NCj4+IGRy
aXZlcnMvaGlkL0tjb25maWcgICAgICAgICAgfCAgMSArDQo+PiBkcml2ZXJzL2hpZC9oaWQtbXVs
dGl0b3VjaC5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gMiBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9oaWQvS2NvbmZpZyBiL2RyaXZlcnMvaGlkL0tjb25maWcNCj4+IGluZGV4IGRm
YzI0NTg2Ny4uNzI3YTJlZDBkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9oaWQvS2NvbmZpZw0K
Pj4gKysrIGIvZHJpdmVycy9oaWQvS2NvbmZpZw0KPj4gQEAgLTc0Myw2ICs3NDMsNyBAQCBjb25m
aWcgSElEX01VTFRJVE9VQ0gNCj4+ICAgICAgU2F5IFkgaGVyZSBpZiB5b3UgaGF2ZSBvbmUgb2Yg
dGhlIGZvbGxvd2luZyBkZXZpY2VzOg0KPj4gICAgICAtIDNNIFBDVCB0b3VjaCBzY3JlZW5zDQo+
PiAgICAgIC0gQWN0aW9uU3RhciBkdWFsIHRvdWNoIHBhbmVscw0KPj4gKyAgICAgIC0gQXBwbGUg
VG91Y2ggQmFyIG9uIHg4NiBNYWNCb29rIFByb3MNCj4+ICAgICAgLSBBdG1lbCBwYW5lbHMNCj4+
ICAgICAgLSBDYW5kbyBkdWFsIHRvdWNoIHBhbmVscw0KPj4gICAgICAtIENodW5naHdhIHBhbmVs
cw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMgYi9kcml2ZXJz
L2hpZC9oaWQtbXVsdGl0b3VjaC5jDQo+PiBpbmRleCA2NmUzM2E0ODIuLjA3OGNlZWY2MiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMNCj4+ICsrKyBiL2RyaXZl
cnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMNCj4+IEBAIC0yMjEsNiArMjIxLDcgQEAgc3RhdGljIHZv
aWQgbXRfcG9zdF9wYXJzZShzdHJ1Y3QgbXRfZGV2aWNlICp0ZCwgc3RydWN0IG10X2FwcGxpY2F0
aW9uICphcHApOw0KPj4gI2RlZmluZSBNVF9DTFNfR09PR0xFICAgICAgICAgICAgICAgIDB4MDEx
MQ0KPj4gI2RlZmluZSBNVF9DTFNfUkFaRVJfQkxBREVfU1RFQUxUSCAgICAgICAgMHgwMTEyDQo+
PiAjZGVmaW5lIE1UX0NMU19TTUFSVF9URUNIICAgICAgICAgICAgMHgwMTEzDQo+PiArI2RlZmlu
ZSBNVF9DTFNfQVBQTEVfVE9VQ0hCQVIgICAgICAgICAgICAweDAxMTQNCj4+ICNkZWZpbmUgTVRf
Q0xTX1NJUyAgICAgICAgICAgICAgICAweDA0NTcNCj4+IA0KPj4gI2RlZmluZSBNVF9ERUZBVUxU
X01BWENPTlRBQ1QgICAgMTANCj4+IEBAIC00MDYsNiArNDA3LDEyIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRfY2xhc3MgbXRfY2xhc3Nlc1tdID0gew0KPj4gICAgICAgICAgICBNVF9RVUlSS19D
T05UQUNUX0NOVF9BQ0NVUkFURSB8DQo+PiAgICAgICAgICAgIE1UX1FVSVJLX1NFUEFSQVRFX0FQ
UF9SRVBPUlQsDQo+PiAgICB9LA0KPj4gKyAgICB7IC5uYW1lID0gTVRfQ0xTX0FQUExFX1RPVUNI
QkFSLA0KPj4gKyAgICAgICAgLnF1aXJrcyA9IE1UX1FVSVJLX0hPVkVSSU5HIHwNCj4+ICsgICAg
ICAgICAgICBNVF9RVUlSS19TTE9UX0lTX0NPTlRBQ1RJRF9NSU5VU19PTkUgfA0KPj4gKyAgICAg
ICAgICAgIE1UX1FVSVJLX0FQUExFX1RPVUNIQkFSLA0KPj4gKyAgICAgICAgLm1heGNvbnRhY3Rz
ID0gMTEsDQo+PiArICAgIH0sDQo+PiAgICB7IC5uYW1lID0gTVRfQ0xTX1NJUywNCj4+ICAgICAg
ICAucXVpcmtzID0gTVRfUVVJUktfTk9UX1NFRU5fTUVBTlNfVVAgfA0KPj4gICAgICAgICAgICBN
VF9RVUlSS19BTFdBWVNfVkFMSUQgfA0KPj4gQEAgLTE4MDcsNiArMTgxNCwxNSBAQCBzdGF0aWMg
aW50IG10X3Byb2JlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LCBjb25zdCBzdHJ1Y3QgaGlkX2Rl
dmljZV9pZCAqaWQpDQo+PiAgICAgICAgfQ0KPj4gICAgfQ0KPj4gDQo+PiArICAgIHJldCA9IGhp
ZF9wYXJzZShoZGV2KTsNCj4+ICsgICAgaWYgKHJldCAhPSAwKQ0KPj4gKyAgICAgICAgcmV0dXJu
IHJldDsNCj4+ICsNCj4+ICsgICAgaWYgKG10Y2xhc3MtPm5hbWUgPT0gTVRfQ0xTX0FQUExFX1RP
VUNIQkFSICYmDQo+PiArICAgICAgICAhaGlkX2ZpbmRfZmllbGQoaGRldiwgSElEX0lOUFVUX1JF
UE9SVCwNCj4+ICsgICAgICAgICAgICAgICAgSElEX0RHX1RPVUNIUEFELCBISURfREdfVFJBTlNE
VUNFUl9JTkRFWCkpDQo+PiArICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+ICsNCj4gDQo+IFRo
YXQgaHVuayBhbmQgdGhlIG9uZSBiZWxvdyBtYWtlIG1lIHZlcnkgbmVydm91cy4gSXMgdGhlcmUg
YW55IHJlYXNvbg0KPiBwcmV2ZW50aW5nIHlvdSB0byBrZWVwIGhpZF9wYXJzZSgpIGF0IHRoZSBz
YW1lIHBsYWNlPw0KPiANCldvdWxkbid0IHdlIG5lZWQgdG8gcGFyc2UgaW4gb3JkZXIgdG8gZG8g
aGlkX2ZpbmRfZmllbGQ/IEFsdGhvdWdoIEkgaGF2ZW4ndCB0cmllZCBwdXR0aW5nIGl0IGF0IHRo
ZSBzYW1lIHBsYWNlIHRiaC4NCg0KPiBUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIGxvb2tzIGZpbmUg
YXMgZXZlcnl0aGluZyBzZWVtcyBwcm9wZXJseSBndWFyZGVkDQo+IGJ5IE1UX0NMU19BUFBMRV9U
T1VDSEJBUi4NCj4gDQo+IENoZWVycywNCj4gQmVuamFtaW4NCj4gDQo+PiAgICB0ZCA9IGRldm1f
a3phbGxvYygmaGRldi0+ZGV2LCBzaXplb2Yoc3RydWN0IG10X2RldmljZSksIEdGUF9LRVJORUwp
Ow0KPj4gICAgaWYgKCF0ZCkgew0KPj4gICAgICAgIGRldl9lcnIoJmhkZXYtPmRldiwgImNhbm5v
dCBhbGxvY2F0ZSBtdWx0aXRvdWNoIGRhdGFcbiIpOw0KPj4gQEAgLTE4NTQsMTAgKzE4NzAsNiBA
QCBzdGF0aWMgaW50IG10X3Byb2JlKHN0cnVjdCBoaWRfZGV2aWNlICpoZGV2LCBjb25zdCBzdHJ1
Y3QgaGlkX2RldmljZV9pZCAqaWQpDQo+PiANCj4+ICAgIHRpbWVyX3NldHVwKCZ0ZC0+cmVsZWFz
ZV90aW1lciwgbXRfZXhwaXJlZF90aW1lb3V0LCAwKTsNCj4+IA0KPj4gLSAgICByZXQgPSBoaWRf
cGFyc2UoaGRldik7DQo+PiAtICAgIGlmIChyZXQgIT0gMCkNCj4+IC0gICAgICAgIHJldHVybiBy
ZXQ7DQo+PiAtDQo+PiAgICBpZiAobXRjbGFzcy0+cXVpcmtzICYgTVRfUVVJUktfRklYX0NPTlNU
X0NPTlRBQ1RfSUQpDQo+PiAgICAgICAgbXRfZml4X2NvbnN0X2ZpZWxkcyhoZGV2LCBISURfREdf
Q09OVEFDVElEKTsNCj4+IA0KPj4gQEAgLTIzMzksNiArMjM1MSwxMSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGhpZF9kZXZpY2VfaWQgbXRfZGV2aWNlc1tdID0gew0KPj4gICAgICAgIE1UX1VTQl9E
RVZJQ0UoVVNCX1ZFTkRPUl9JRF9YSVJPS1UsDQo+PiAgICAgICAgICAgIFVTQl9ERVZJQ0VfSURf
WElST0tVX0NTUjIpIH0sDQo+PiANCj4+ICsgICAgLyogQXBwbGUgVG91Y2ggQmFyICovDQo+PiAr
ICAgIHsgLmRyaXZlcl9kYXRhID0gTVRfQ0xTX0FQUExFX1RPVUNIQkFSLA0KPj4gKyAgICAgICAg
SElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9JRF9BUFBMRSwNCj4+ICsgICAgICAgICAgICBVU0Jf
REVWSUNFX0lEX0FQUExFX1RPVUNIQkFSX0RJU1BMQVkpIH0sDQo+PiArDQo+PiAgICAvKiBHb29n
bGUgTVQgZGV2aWNlcyAqLw0KPj4gICAgeyAuZHJpdmVyX2RhdGEgPSBNVF9DTFNfR09PR0xFLA0K
Pj4gICAgICAgIEhJRF9ERVZJQ0UoSElEX0JVU19BTlksIEhJRF9HUk9VUF9BTlksIFVTQl9WRU5E
T1JfSURfR09PR0xFLA0KPj4gLS0NCj4+IDIuNDMuMA0KPj4gDQo=

