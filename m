Return-Path: <linux-input+bounces-9863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14190A2DB7E
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 08:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20AB51886E27
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2025 07:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9ED13213E;
	Sun,  9 Feb 2025 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="mXkLHFsR"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FC624337A;
	Sun,  9 Feb 2025 07:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739086012; cv=fail; b=rKvoxQJT+FFkTHPJEWLcKYrT+LEfnjGD/BWXzMV0jTx7gMgG+/wbvpT1DZ0JXsLTMUJdbIjUZkFpVGa6P4rxLG3FCOTBdPaRmtIeX7MTn/80yM80AL8XZNueYfGhSiWedcjUIrRE1aownruKZ6+YQ1l1nZQQq8Z37d8Tl5iQLDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739086012; c=relaxed/simple;
	bh=WljrWjVcmKAHt9d8zCY9OMW+YRVZqAXDwuWddA5wW1U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YpsVz/KmU5TAh+eONeBI+7LqudTOziGQrsHYQojNaYHrQ8YksW3TUr4uNr4dMI/+pJASp7PYtoNcy8rteZXLMWfMfe98D4QeJoHYAEvw/+6mUPMGi6ROOxkoBIAfVhQJamjmkDpyXw0eLwmTjgCym3Zkr05NomGcULeLQnnMfEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=mXkLHFsR; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6NMWvcgsCm97UXrUtnD1YC6N9ZyWKyr0bhSUwwd+AtRYYdEtl4mhI5dFz754Ok/uVE3oo6iu75oY8K5rsCpKg5+E5rcZ8muhxcUEUBKMbYPRDhjtoCuIbEWt+ASoFtNPsXQ916f9HnWOCI2FXMAY8tSnSs2fT9JEpzNbV63uTrP24m8/mIMOP+/NQx4cArRWpDTFz8dL2YYJo5s6/ySkMHN3YyhLMVfAGH6i7q0vbczRxDQjBGE+PK2XsuATgCmxwEZp6Bk7rk1Lp63sPte7Oda322VHKtiUhFBoCRUw8wvZcU80mcjrr6f1sDS6ARFe3ZPEg0ICEuazYYJACvIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WljrWjVcmKAHt9d8zCY9OMW+YRVZqAXDwuWddA5wW1U=;
 b=BACK18Lu4vGKrPf6ms7d7wJSYhS65RRCnPlZkwza+CMnAfEhPk/xH3g/f+anV9oH53YLX30m8LEAsd4FBKCoRS6nF90mjNz3OrmD/Iyo8lIHGVWDwe2qeQX5wB0c9ZIqr1ZXYs8FPSDqPZiSk/RDX00jgaE+iq83P7Dz2UiSGSLQycBI75xmgBOOjFPAzIkCgo9qPZGjpuv6di25AACRYYyAT+L0WDe/yTgp6eYjpRh6P3gjS4LquHmRulIVhuJ2IFSWxHjQzetw/0fctcelH/wI1iZ19sm69ws799AZpDOKRi1+1NZkJp6D77qVsfcJRI+A3HdC15XaWtTfS6mbTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WljrWjVcmKAHt9d8zCY9OMW+YRVZqAXDwuWddA5wW1U=;
 b=mXkLHFsRPOL5tp5DtWtw5Sre2EjNQjFgLSJ99ut8eBaqsRaQ0760Vrl7rWKqFijlKiKG58n9FFZitPUldA3XjtFSZHNMhCnK9CylfNZYPzCn07WSaTnJ7nrq61cEEaKkNLOZ0RiEWKfWVtkxQARZU1PGAaWG6+i2qZSAP/JP5xH6Q8yWC96MdV6iSJcMisd0nhyUKjd5PmUddCH7WqasOI6J+XBvJDktZAApijbgkanBd4lQpNMfU0+lxbVWlzWaym/xZrpsGtnJkzyDQk+Jha6RVkgOTgHHkExDpFd891zkD2MEmJkYzHWMR8o66SheDbvgr+faX5bACvdxSElArw==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MA0PR01MB5755.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Sun, 9 Feb
 2025 07:26:46 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 07:26:46 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] HID: hid-appletb-kbd: make struct attribute
 *appletb_kbd_attrs[] static
Thread-Topic: [PATCH 1/2] HID: hid-appletb-kbd: make struct attribute
 *appletb_kbd_attrs[] static
Thread-Index: AQHbesP58EeHhXFtz0aeQpCXHLgaNw==
Date: Sun, 9 Feb 2025 07:26:45 +0000
Message-ID: <3AE31FDA-2F6B-4CFA-9E19-0DEECE363D30@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MA0PR01MB5755:EE_
x-ms-office365-filtering-correlation-id: 61cdbad2-8318-42e6-36c2-08dd48db1be8
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|8022599003|461199028|15080799006|19110799003|5062599005|7092599003|8062599003|102099032|1602099012|10035399004|440099028|4302099013|3412199025;
x-microsoft-antispam-message-info:
 =?utf-8?B?anlUTEllOEZUQjR1Y3NyLzVWcVl5WG1QMW1kYmNreFo4RzA3UmhkSHN3Q3Fr?=
 =?utf-8?B?bEU1bHRoejB2dmtqbkVpNllvVEp3T2VpdjB3WXQ5WkRMdll1Q0U4dkJmd0xF?=
 =?utf-8?B?dXhLNEJWT2ViYng4OWpYc0Y2Wk0rQzNrbEVOeDRwME1CamZ3bkR2c3BhdlN3?=
 =?utf-8?B?K1kyOVpRVEsvbTNOV3JIWnVHQ2RsNFNnNXNPQlR6MW5KQUV4NkJzeE5kbTJq?=
 =?utf-8?B?MmMzT0RPOUt3d21lWWp0YzRXOStzanl2WDVMb0dtdW9xZHQ0disxSGZRU3JF?=
 =?utf-8?B?eEFjWGdDM2p3V0pibkVzWDMvTCtHNkhCZGx0ZGZITnVUVVBjSlFCTVFWazZN?=
 =?utf-8?B?bjRDdi93WWxxREF0Y3pBT1pPVzdLVER6WlJ2Rm5MVFdXa05DbFZKL2FZSGhO?=
 =?utf-8?B?ZFNiRTdXVWo5OCs3OWtUWGM2NFNkTjFXdWgwdzRMQWVBbzVJQ1BZcksxSXNq?=
 =?utf-8?B?VzZFMlVlaHMwU2RXVFBXaGVWWkZnMEQ5dW9kZ0JCUUNtWWtGT090M1VmUURW?=
 =?utf-8?B?TnU0OE9UL3pIdzNqL2pGQjJOaTlhd1JpdzE0ZFBnVnNiQThscXkwQXhIN1pB?=
 =?utf-8?B?SXlvQm9rZXBzT0NFYlNwbXRya2RJTlprMCs3M082aEJnWDhJelMxS2NvYWZH?=
 =?utf-8?B?V2R2SEdvNTJ0ZG1wT0R2OXltQ2RTak1lYzZDRHlwUkRhd29ubUlvYlp0L3Bp?=
 =?utf-8?B?ekp2RmxNVDIvVDh3dk5ad1Y2cG9FKzc2S0ZJT1YvL3pNdkhyZ0F2QjF1NTU1?=
 =?utf-8?B?elp4czU1UXg1MTFqb2RnT1kxNEppRnlhWG1mblhrRXlNdGZqT20ybHRici9Z?=
 =?utf-8?B?Wll3YzMxdFlMdFQ4QStBUENaNUpjNVBtZGZHRmlyeEdkQ0hUMDIzdlc5T0Z3?=
 =?utf-8?B?VHhsM09rK0dTdFdHQ0xBZHM0OSs4ZFdscXpWeFpsd0Uvam11NDJLcTltZVc1?=
 =?utf-8?B?eHR1MEpXU0FKNFFrRTE5SVpYa2c3N0ZPbmVmVC9jRVJmMlQ3cDJHR3Y0aVhv?=
 =?utf-8?B?Mzlqb1JPbU4zNVZuMzhCKysrZEdQYU0vU0JhREEyeWtoWmtRYlZFNklDSVpw?=
 =?utf-8?B?N3N0SGhDQThtNENuWVBqRHZ0WFVDMkNMcnNJMksvdnlZL3JpNmVmVFFhWERB?=
 =?utf-8?B?NmN6eERFSmdZeGVjSFNpYlIxSFVqODQ0MGV1ci9aa1p0ejdLVUozbWlucHJa?=
 =?utf-8?B?SFk3TmhLZEpzNUFHclpkWE5qNzdxNVVwMG1RblBIem8wa3pkOEY5WHNiVWpV?=
 =?utf-8?B?Y0NFcUtXVDRmcTBBZytrVEtuVmdFbnU2aG5FbmxYY3E2UkRvUG9RN1h5OEt4?=
 =?utf-8?B?cVlHKzhrWlJPSUI4ODR4WEJJbG00S0hwUDZjYzdQSU1FMDZnYmpzMjlWRURu?=
 =?utf-8?B?QkZSZ3VPYlFIN0xVV09nN3VnWGEzeWd1UEtvWm02T3N4dXR0UUdwbTBkV0dn?=
 =?utf-8?B?Zlgzemt1WnJZVGlKbW5pcWkvT2VCUWNqUU4xUTNiUGZTdXhiSHYrUnFyVkFY?=
 =?utf-8?B?SVMrZjhMKy9ZUnQycHNuWVpjazhNQ3I2OVNRbGNtMDYzYXBmRGwwTDk3NWdx?=
 =?utf-8?B?MFVHSVFnSWMyd2NuakdYbk1JZXR0R2J1OThpVkxyRDBrZkhxZDFnWFBPaGlt?=
 =?utf-8?B?NEh4UjNBSE9DVXNCUGtQTVZDOTdzVU9nRXBITHFmZ0F6eTMwcVJhTVlBRmVl?=
 =?utf-8?B?SWJ4WlJwajNVSW1VY1JnYVJaVGhFMDU5VEd6aStRSGxNSkM3QktRc3ZvejJ4?=
 =?utf-8?Q?gSv3Hth5IGTou30UH0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFB5TXlRbjZXSSt3dWZGRUxTSmhWUnI0RGlnT0Y4QW90MHJ3ejFIbXVENUpq?=
 =?utf-8?B?T05aalBWRHczbDNuWDFoVFFvSDdHK1hEenlWaFRTZEpaalNnaUdqVXAxMEJG?=
 =?utf-8?B?QTZDQjlGMEI5U0VNWkRCZjdCRnNiZGZqRHo1WE53QitBd21wNG9PdDlENkx4?=
 =?utf-8?B?b2hvU3dNME4xVVVmSFMwQ0tyQmJYV3doMmdFSFZ2anpOZUhNMklncUVueXZi?=
 =?utf-8?B?TW41a3dtMFBJNGJ4b1RzcFNaU2ZtZDBtSEtIbkVPLzd1YXNHMzhxMndQVjU5?=
 =?utf-8?B?UklHU3pacjRxUGt1TkFuMU4vbTZtY21GN1lDT05zUXgxczJsM0N0WjhwbjNr?=
 =?utf-8?B?RSt1cTJuQmZ6WTFVeWVKVlZiM1h1L3I5Q0c2VXYvNDFoc2JWeUVRdmNscFRi?=
 =?utf-8?B?MUVXb1lzaTFEMFd6eW1hTGZNL0p3Q1Bac0NWMjRjUUJYSlQzbVI3V3ZOZWJz?=
 =?utf-8?B?UU5VQ1Y3SjY0UUdVVXJGQWw0YWRXYmJIU29rR1pwRDZxQk4vdnNjbDRHaXRY?=
 =?utf-8?B?UlBEWXlQSm5JOE00NWorZmJRM0daWlovZEM2TzIyUWRQU1piQkoxTmExY0J3?=
 =?utf-8?B?ZEdQWXhLTnpPY1ZHR0dxRmpsREV6TmZaRWdFWnVRNFkxZkRWZWhseWd1WStK?=
 =?utf-8?B?REQ3eW9vQlN3cy91STlzZzBmeVVYb3g2akhXdExXNnF3QUcydTdGaEVTeDlq?=
 =?utf-8?B?RDN2dXZxa0tVSlFvOWJGc1dlR0N1K0V4RHZtZmxtNDF5cmJXajJhNW9aZlgy?=
 =?utf-8?B?ai9INzFkQVh2bU1mN003TTJGampZa0FFRm04a3ljb2QrVlhITVVTM3VrYjBS?=
 =?utf-8?B?cnNKdnN3RUkyRHlSNHZtWVN4ZEhrbHAyd2ZXVjJld2hBTUVPQktqM0dnalB0?=
 =?utf-8?B?U1RXVWdzMFY1T1M4UmhKS2d6b01JZnRBUC9Xa2tuTVNGRG9DSEprRDVMSito?=
 =?utf-8?B?bnJoNlpWSjNUQm9CUUVwM3RBQjkwQTJzSXRETExWWG5lSmNKQ2ZYMGl0S0xu?=
 =?utf-8?B?a2VlTXhGaDRXRVpsV2JDejNyV1N1UE93ZzFsWmZuNklwemVvQm1VYjl4ek54?=
 =?utf-8?B?U0QxalVTYitVUUdDT1J6N3dGbTNQQXB0Z0t6ZG9xcFphWkxiUm9MK3dlcEc5?=
 =?utf-8?B?ZXFIemk3SENLa0ZMU2hIQ2gzK0JJWVR2VFB1M29nS3ZYWUcyeUdHR0N6TjI2?=
 =?utf-8?B?YnZGNS8xWm8yNGtaUVhuV0NHYThxYW5oNklJcjV6bWFvNGU1TXZBcTlOVloz?=
 =?utf-8?B?djlQazIrWUdtVlhSS0M4cEZjWWkzWUttRjEzemptYWhNVzZjMzZzVlBmTkl2?=
 =?utf-8?B?RjNsMGRxYjJha2hLWThTbnM4UVlkbHc1VGh2YVdrb3lIMHhpcWRnRWF3SUJH?=
 =?utf-8?B?RGVxNG12WXF4d0FDQjBNcWJlSVdmYWFHT2NzVzcrK2ZHRGgzT3FtNHRtSjkw?=
 =?utf-8?B?SGpyM0duMlZ1V1ZsOXFONjNYVTJ6SHA3Sy8yYzlXMUtMdFZoVGZBY2Rhdm4z?=
 =?utf-8?B?U3llaSt4TmpScEQ4aitkSHR5RkwwbGdOeDlESS9kTlVqOXdjb09MbjYramFH?=
 =?utf-8?B?WS80Ti9KWHFwMEJjSW1NY2ZnZDdEWGg1cW9tZEhxWi9hTno1ZWkyQW4rOUhz?=
 =?utf-8?B?bmRaREtSd0p4dWtzZFZmNGRlV1JIQThTTzBXS3p2TS9lMnNsRzJkN3M4Zm9R?=
 =?utf-8?B?R012ckRHVHdZNTF5ZCt2NGRtUEg2QXJGdUY0eVZxWncvT3ZjRUw2cUpvSmdY?=
 =?utf-8?Q?THDTBkEVrkQsD85zm/aQndGFpyQTs42rZquk2dD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A8C9B71E4FFC741A3F0B602EAA67B96@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cdbad2-8318-42e6-36c2-08dd48db1be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2025 07:26:45.9672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5755

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhpcyBjb21taXQg
YWRkcmVzc2VzIHRoZSBzcGFyc2Ugd2FybmluZyBmbGFnZ2VkIGJ5IHRoZSBrZXJuZWwgdGVzdCBy
b2JvdC4NCg0KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0K
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwMjA5MTEw
NS5ac0xvQlNJaC1sa3BAaW50ZWwuY29tLw0KU2lnbmVkLW9mZi1ieTogQWRpdHlhIEdhcmcgPGdh
cmdhZGl0eWEwOEBsaXZlLmNvbT4NCi0tLQ0KIGRyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5j
IHwgNCArKy0tDQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jIGIvZHJpdmVy
cy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCmluZGV4IGZhMjhhNjkxZC4uMzhmYzBlNThjIDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCisrKyBiL2RyaXZlcnMvaGlk
L2hpZC1hcHBsZXRiLWtiZC5jDQpAQCAtNCw3ICs0LDcgQEANCiAgKg0KICAqIENvcHlyaWdodCAo
YykgMjAxNy0yMDE4IFJvbmFsZCBUc2NoYWzDpHINCiAgKiBDb3B5cmlnaHQgKGMpIDIwMjItMjAy
MyBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KLSAqIENvcHlyaWdodCAoYykgMjAy
NCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KKyAqIENvcHlyaWdodCAoYykg
MjAyNC0yMDI1IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQogICovDQogDQog
I2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdA0KQEAgLTE0Myw3ICsx
NDMsNyBAQCBzdGF0aWMgc3NpemVfdCBtb2RlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCiB9
DQogc3RhdGljIERFVklDRV9BVFRSX1JXKG1vZGUpOw0KIA0KLXN0cnVjdCBhdHRyaWJ1dGUgKmFw
cGxldGJfa2JkX2F0dHJzW10gPSB7DQorc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmFwcGxldGJf
a2JkX2F0dHJzW10gPSB7DQogCSZkZXZfYXR0cl9tb2RlLmF0dHIsDQogCU5VTEwNCiB9Ow0KLS0g
DQoyLjQzLjANCg0K

