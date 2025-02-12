Return-Path: <linux-input+bounces-10006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2CEA32D96
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 18:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E429E3A8957
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 17:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690F325A333;
	Wed, 12 Feb 2025 17:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kRGyDfvZ"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010012.outbound.protection.outlook.com [52.103.67.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37875221D8B
	for <linux-input@vger.kernel.org>; Wed, 12 Feb 2025 17:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381789; cv=fail; b=sULgcqLwS05Z4N+QwsNdnsq9+FSjGAOGuLVpoQ4WXJoMKKbEOJ98WsKiMuYqsbnMBmpJupD2rcUmXKTh7gGdPzLtBukU1j0uPYjhBPfapGU4fE/uGUi3XBPAQwJgZCrV2l/j+LUwwRORedineHQ4z4arNIHafY3Sc/Jt5CnGfJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381789; c=relaxed/simple;
	bh=tEj9S0+xnpa1yt9BUta80SCmYzxR8XqizGTfKc9fsag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CMuTM3aKAfvz582XNmDm2zXYC1oK/2lWHTHWHvc+4hwJBgdRIVhXFkstWk/iqBnNt6OtQ9enjh2ctMJzLshDrSIYCrG243k1mgPDpegyFa26tUhTTE9C11bPRWAYPJ5Kz4qpeysxG5ytXnBwY72r9MgrekJuk/15qJQTP/fkKpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kRGyDfvZ; arc=fail smtp.client-ip=52.103.67.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBpRZb005jD6gBou6EExVNbfbX7TQg31ImB4Csz4cEHwlcVGinvqH2smVivSkKip6KwtFtdshK341j+EbwM6yW0p30IrxXEm0Xtiv/U9Gx9nVpuHHGYaUjtKhd6+Uji2ZIoUe45HhWq6Va+89PguVErrQyN0f9mTOxkpAc8PikODZ0dA1BPxJCHM/rcnkmx3k4HtVzgkA2EAsG+s9SsvDWYLeZBdx6OP3ceVzUtDtjURk6GTblukRQV/VBxl9HAdIQvwH1diAsrfYm8Stx0UAECJgvV4TAWehcDjWZkG7elCB+m7O9nvKrlw+eINnfBbE7WfUenuUPppWx2kxv/ymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEj9S0+xnpa1yt9BUta80SCmYzxR8XqizGTfKc9fsag=;
 b=ix6zq/IZfa/fbacLn5d38ufg9NEaZD0BhHZwrJFbGPaI0MEaQ2Gq5W8DExxN89Gu2j81GZS9MtRxZCNmhDeuvC9xbYcPmhUeWIoEKmea+n3Xbogq/lpuOyuyK68zpojXXd4HWtatDlRmWmOtFp5U3RFkHMJDIEZ8sGwdEshWiu/Mtv4Mi4P6kbtK3ie4/cSW6hzFDDQ/3YfCTcvt//sW6Q3rV7niaumXFkfT1If3a+NtYoJtOReriaFmC4I1VLVvripWJp4Cms653rxReXetUq17clYCX68DUeABfpTIxM6g/setd9d/THmzzcbct+nPh0bZxKz92dhE0w/fJBs1wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEj9S0+xnpa1yt9BUta80SCmYzxR8XqizGTfKc9fsag=;
 b=kRGyDfvZmjvKwG6FcZOpOrsd/BvZ8Md1cAc/vYu7VZbyc7A6RE7ySgrr2H0yKE6sWuL/yACt5JgrFnJ8AQUba9titd2sTIvCyOwfKqoWo/BwmCCAlFAssTw3ACD0EGj83H/JHK6IRxzkj6cerqPiXyabSb0qCVRwU7kBGdv1s28kU0bpwTCZJAc3D4kOgj84pBMBWBsoJWw9IHF0duB2v0AH8iXNmiNY4cWfeq576OWbeROStsk/UzLQXlE39srPJzB3m26lb4lsnfiMfJktL9QAXzT/LYWp4HTxDqm5/yCdp2Kz3qsieSi1wcqQeGYQ2jtuyohKZPdQyeKgOrOHTA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MAZPR01MB7024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 17:36:23 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 17:36:23 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Alex Henrie <alexhenrie24@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"jkosina@suse.cz" <jkosina@suse.cz>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Topic: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
Thread-Index: AQHbfXSiek/9eKHa2UOEiOnSSu3oBw==
Date: Wed, 12 Feb 2025 17:36:23 +0000
Message-ID: <3137A636-3FC2-4016-BC64-F5CEF308F834@live.com>
References: <20241001055146.543800-1-alexhenrie24@gmail.com>
 <20250117061254.196702-1-alexhenrie24@gmail.com>
In-Reply-To: <20250117061254.196702-1-alexhenrie24@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MAZPR01MB7024:EE_
x-ms-office365-filtering-correlation-id: 2dd101ed-66e2-4f52-6778-08dd4b8bc4d4
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|8060799006|7092599003|12121999004|19110799003|15080799006|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzRaUGgxRGFFMStuQ2Vvb1g5ZXFGRzJNQWN3UzRRSVJuOGxIbElVc3k5SE1q?=
 =?utf-8?B?dzcvSmFDMXhveUNIbldmdGNRQU14WlVmN3JOZjg1VFl6Z0tNVDhIWUFtZDRO?=
 =?utf-8?B?cjZ4TktXcUNib0VZUGhGbzNONUJJeFFHUU1IRjk4MHhBbnI0YjhBcThUcDEr?=
 =?utf-8?B?T28zUTMwUTFsRDZJdE1iVnBxanhDRTc4Q09MUEFTMEM0bjFGUi8yM242N3Zu?=
 =?utf-8?B?eWFSYzNZalBMUzNjVWppb0dTK3VmcWhFYUVvNE9GdFA1aSs5S0hlK1ozVEJQ?=
 =?utf-8?B?L1dicEtITURaL01TL0F6dVROYmJpSDV6TFdBNmRxY0VLM2JQRVlwWXUxeG0w?=
 =?utf-8?B?NlE5UW5abXQ3MU9QQ1U1MGZDOWJVNlFmR0crRWxBVXdpeExYdjB1NzRsU3hu?=
 =?utf-8?B?Qk5qb1YrdlFZN2cya01tckY5VURnMVdFTElvVDNHRFZsVkhrMFE3QW1IRVlC?=
 =?utf-8?B?V3FrY0o1M3U0STRCbSs0bXFlcHppUXc0ZGY3aVgzc1o5RjBHczJBUEY0V2dN?=
 =?utf-8?B?aGtaUU1EMkVKWUM0SzJ5b0J2R2hZS1M0SnlWRW1wSXI3eFpMZGZTWHdaUERO?=
 =?utf-8?B?Um1NNCtwQVRMRHdBRnM4ZVZtcXpUSVV3ZW9scS9Jb0Vxai9Qdm5kNGF0NkpR?=
 =?utf-8?B?L1Q4Z01qUWp0Y1ZXVWlYalVKd3lJS05QdlJhM0RmRnA0M0pjTElBTWFJOURG?=
 =?utf-8?B?a3ZhSlUwNld4S0Q5V283MkljRlpDVjRXZTZEM0RIZzFuQjlMNEh6YzdMSFIx?=
 =?utf-8?B?cENsenAyRm1ud1A2YzJNOFZNQ2loYWRIc2ZkQUViTlJXNDNFM1NHdldVOE5X?=
 =?utf-8?B?NTJOMjlTWXE5b0NCb3IzV0ZGQTZvWlNzaHkrV05OK3ZHREZpSE5JNkFQMzRL?=
 =?utf-8?B?MjcxbmNmZlhYZzRHR0JKeEg0eVNQOGluUk1CaUJzdDRGUlVKTUVscW1iUGxx?=
 =?utf-8?B?SUFuM3lDYkxTVm82eXF4NXpoMXVady9RbTQzZ1ZXTytFb3dCRWVBZi9VckpC?=
 =?utf-8?B?OGZVVzdwSm93N1BHbzM3RFVYcUxBWGNaNS9nbkVsekV6WVlsNFc2RWJvN0Jr?=
 =?utf-8?B?QVp0Z1RmSHlBSFVCSkVMK0RsbUd1dVBnMEFVVjdmaGJyVHBPenJpMlpxSkRt?=
 =?utf-8?B?UGtXTjl2SmdTNVc0eFlUV1BBRjJxVWFnaEFyOEVUaUdEcWwrNDFkRkVwb3FF?=
 =?utf-8?B?cnQrTGVWQ1hTTU52MHQ2TVpZMXZrNFBTN3NlS1lKSk01MVkrU1VKbzAyZ0lN?=
 =?utf-8?B?RHA2dFV2ekxXR0FSY2ozdXBYUWxjV09NejZPMFN4RzdwaWlBYjc4UHJBYmVJ?=
 =?utf-8?B?Q09YWnRqQllCcTFEUmdOcnYxRWxxQmY5MXRjRU5EZS9oK3NiTi9TY2puT1JV?=
 =?utf-8?B?bWdNdFFIOGRWYlFjZFBTOEJJZk1WSDlhSFBKeTVXTHZ2VVNKVHRXN2ZHWHlX?=
 =?utf-8?B?QktGTklJYmNqaWxqN0lOL3BEUFFyMkRsOWVzNlg1OXJOSjdWQ2JVWThFR0tS?=
 =?utf-8?B?TG14MlBFRkF6NVZLVGR3R1c3Z0lncUNIeWxUYk5MbjVzS1RGc0Q4QmxZbnVm?=
 =?utf-8?B?M3NGQT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTdzUXlrTDZ4ZlRjbFRVVVhOVmp5ZDl6ek9ISlRGNy94aWtWczRJUmE2MEZQ?=
 =?utf-8?B?ZE51M1dwWjZvcGlPTll2MC9nSDlKREZzWUxEZWpMc2gyZXF6bUFRdVhueHNL?=
 =?utf-8?B?WmE5TnE1UXRJVXNWV0JGeTVlaTdLeE82U1dSVmhaTFpMQzJWYW1mNDJqTGJE?=
 =?utf-8?B?UHlTRkxpQ3FRamI2VVNuSjdKbExSWWF0RDZmVDV1Wnh0aXRmSXhMRnFOcTFr?=
 =?utf-8?B?V1N1Z2gxM2k0RmZFbU9naXF4dmVWN2hSYWpvMGh2aWUxa1gzYUN6bkViYU9L?=
 =?utf-8?B?bElNR3NMYXBRMjNaUmhtYkNBYWowNXljeUZNS29VbG8wZHFPbGloWmEwSXFY?=
 =?utf-8?B?YXNPUXpsQ1lUYzZMLzVsY0lBbGllSUZJNUVGemtrQ0h3ejlwS0x6czhuMC9Z?=
 =?utf-8?B?OG81Q28rNnl2bjc3bXdLdk9PQk5tUko4aThJcVBuYzRBdERXbjVEaGpOYWhW?=
 =?utf-8?B?VE1Ba1VhQ3EzY0pPczEvQUhhV2I5M0diUzJLK1FDYjh5YTNaMENURWRvSkUv?=
 =?utf-8?B?ZG9mZ2tZazl4QXlZZWtmSkU5dU9XWENJTWs3QXdOd2poeFV2TlF4SVIrQXhm?=
 =?utf-8?B?Y05qNHVGVXBiY0JELzA0K2lOVWJ0c2lhYnBPdHFQMlNZYVNKbHIvbmFZb1NR?=
 =?utf-8?B?R2NGZ0t2clFzd2JhV0lVZ0FKKzVORkVaWnN6V0FLU3FKSFo3TmhxN3NwQTlr?=
 =?utf-8?B?QzhtRGdDS1F4a0VFT0RIci9za09jeEVEYW1oazJUMnhxTjJ4MnZ2dEg3ZEZK?=
 =?utf-8?B?MlFJTEdKR0REckErM3ExYmUrSGlmSG92MkFBbWFvZThoYWdFbFhCSHRJREts?=
 =?utf-8?B?c2Q3aXBGNXo0QXFvM3Z3UkMzYzlxKy9zWXc5ZzlFRTd5RW9lZlIwUXhIQ2J3?=
 =?utf-8?B?N3BqZGQ1VDFlRVRRZ1hLam5yTUwwNUtRSjNTSUZzYjZPUDR4b3ErMjFoNVlK?=
 =?utf-8?B?eVhINTQ0cUdCT1BsVWxORm1wdUNHNEJOTUQwSHlBandHWm9wUWZIV3AxVEl0?=
 =?utf-8?B?VG5lR2t1TERhUXEzZXFQdU5WSlc5N0VRZ3dqc1hueDZZU3NhRFpYd0pkREg5?=
 =?utf-8?B?eU5yelptRURsNkVXSGI1WG1wMVRuK3dVYktkcVlIVG9SSVZ3SC8rOWFUd3lq?=
 =?utf-8?B?aWJhV1JOa1dUa3psTnE4eXBqTWhURGJWUmdnb3Z4VU1WalFKcklFZXV3Um9u?=
 =?utf-8?B?NnZkU0MxN1d5R0ZyNEl5dDNPTXhqR1poZ3N1QnpsTEtHcUczbWdMVUFORGNn?=
 =?utf-8?B?c2VrTnZqaGt3VGU2dmp2clV1K2tmaHVXd25OWnVGejZxWjh2aklSUGZFMmVZ?=
 =?utf-8?B?YmNTSzdlNmo2NE1CUmU5U29aM3RaZkMySUR1T0o1azBGUk1lc0NRQVNPd3Y5?=
 =?utf-8?B?K0x0MDhSWHdrQzl1K1U5djMzRmlVTDVCSExvOENhTThlU21xUVQ1d0FwYVFl?=
 =?utf-8?B?bFk5Wi9GbGxtMkJuVXQ0a1c1SzRTVjIxMmdxWlFPUVpYS1ZRc1BHRDRkM2ZY?=
 =?utf-8?B?dHNrOXFLSnA4eGUwTlZIV05nSldKb3V2aXFYU3JrekY2VFU2bTMwNi9OcXZM?=
 =?utf-8?B?TEhuM1FCcVJWZ1VlZXF1ZDdtNXltMmtvU2lMUWZxNXU3d0t3NVJhbHVkLzg5?=
 =?utf-8?B?RzVUc3pkOS9RRENXY2tnRW1TeFVpaEdBQkFhZCs3OGV0NFdlUm0xNDdLOGNy?=
 =?utf-8?B?bU0zWUhUNit4ZDBJUDJ1ZzZ2YTdEclhaYUE1UHVDeFZGL0xYYU1aMFlqSlBT?=
 =?utf-8?Q?voV9YjXIOhqqYCJ+fYID8qkUNphFPpleXfFqTVi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB3FE6700D983B4E81A5035DF5AB7D06@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd101ed-66e2-4f52-6778-08dd4b8bc4d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 17:36:23.0839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7024

SGkgQWxleA0KDQo+IE9uIDE3IEphbiAyMDI1LCBhdCAxMTo0MuKAr0FNLCBBbGV4IEhlbnJpZSA8
YWxleGhlbnJpZTI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGUgT21vdG9uIEtCMDY2IGlz
IGFuIEFwcGxlIEExMjU1IGtleWJvYXJkIGNsb25lIChISUQgcHJvZHVjdCBjb2RlDQo+IDA1YWM6
MDIyYykuIE9uIGJvdGgga2V5Ym9hcmRzLCB0aGUgRjYga2V5IGJlY29tZXMgTnVtIExvY2sgd2hl
biB0aGUgRm4NCj4ga2V5IGlzIGhlbGQuIEJ1dCB1bmxpa2UgaXRzIEFwcGxlIGV4ZW1wbGFyLCB3
aGVuIHRoZSBPbW90b24ncyBGNiBrZXkgaXMNCj4gcHJlc3NlZCB3aXRob3V0IEZuLCBpdCBzZW5k
cyB0aGUgdXNhZ2UgY29kZSAweEMwMzAxIGZyb20gdGhlIHJlc2VydmVkDQo+IHNlY3Rpb24gb2Yg
dGhlIGNvbnN1bWVyIHBhZ2UgaW5zdGVhZCBvZiB0aGUgc3RhbmRhcmQgRjYgdXNhZ2UgY29kZQ0K
PiAweDcwMDNGIGZyb20gdGhlIGtleWJvYXJkIHBhZ2UuIFRoZSBub25zdGFuZGFyZCBjb2RlIGlz
IHRyYW5zbGF0ZWQgdG8NCj4gS0VZX1VOS05PV04gYW5kIGJlY29tZXMgdXNlbGVzcyBvbiBMaW51
eC4gVGhlIE9tb3RvbiBLQjA2NiBpcyBhIHByZXR0eQ0KPiBwb3B1bGFyIGtleWJvYXJkLCBqdWRn
aW5nIGZyb20gaXRzIDI5LDA1OCByZXZpZXdzIG9uIEFtYXpvbiBhdCB0aW1lIG9mDQo+IHdyaXRp
bmcsIHNvIGxldCdzIGFjY291bnQgZm9yIGl0cyBxdWlyayB0byBtYWtlIGl0IG1vcmUgdXNhYmxl
Lg0KPiANCj4gQnkgdGhlIHdheSwgaXQgd291bGQgYmUgbmljZSBpZiB3ZSBjb3VsZCBhdXRvbWF0
aWNhbGx5IHNldCBmbm1vZGUgdG8gMA0KPiBmb3IgT21vdG9uIGtleWJvYXJkcyBiZWNhdXNlIHRo
ZXkgaGFuZGxlIHRoZSBGbiBrZXkgaW50ZXJuYWxseSBhbmQgdGhlDQo+IGtlcm5lbCdzIEZuIGtl
eSBoYW5kbGluZyBjcmVhdGVzIHVuZGVzaXJhYmxlIHNpZGUgZWZmZWN0cyBzdWNoIGFzIG1ha2lu
Zw0KPiBGMSBhbmQgRjIgYWx3YXlzIEJyaWdodG5lc3MgVXAgYW5kIEJyaWdodG5lc3MgRG93biBp
biBmbm1vZGU9MSAodGhlDQo+IGRlZmF1bHQpIG9yIGFsd2F5cyBGMSBhbmQgRjIgaW4gZm5tb2Rl
PTIuIFVuZm9ydHVuYXRlbHkgSSBkb24ndCB0aGluaw0KPiB0aGVyZSdzIGEgd2F5IHRvIGlkZW50
aWZ5IEJsdWV0b290aCBrZXlib2FyZHMgbW9yZSBzcGVjaWZpY2FsbHkgdGhhbiB0aGUNCj4gSElE
IHByb2R1Y3QgY29kZSB3aGljaCBpcyBvYnZpb3VzbHkgaW5hY2N1cmF0ZS4gVXNlcnMgb2YgT21v
dG9uDQo+IGtleWJvYXJkcyB3aWxsIGp1c3QgaGF2ZSB0byBzZXQgZm5tb2RlIHRvIDAgbWFudWFs
bHkgdG8gZ2V0IGZ1bGwgRm4ga2V5DQo+IGZ1bmN0aW9uYWxpdHkuDQoNClJlZ2FyZGluZyB0aGUg
dGhlIGZubW9kZT0wIHRoaW5nLCBjb3VsZCB5b3UgdGVzdCB0aGlzIHBhdGNoOg0KDQotLT444oCU
DQpGcm9tIGUyYjJlZjNmNTc5ODAwZjExZWUyOTNmYjQ1ODM4YTQwMDRjY2FmMjMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxDQpGcm9tOiBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29t
Pg0KRGF0ZTogV2VkLCAxMiBGZWIgMjAyNSAyMjo1Nzo1OCArMDUzMA0KU3ViamVjdDogW1BBVENI
XSBISUQ6IGFwcGxlOiBBZGQgcXVpcmsgdG8gZGlzYWJsZSBmbiBrZXkgb24gc29tZSBub24tYXBw
bGUNCiBrZXlib2FyZHMNCg0KLS0tDQogZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMgfCA1NCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
OSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aGlkL2hpZC1hcHBsZS5jIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCmluZGV4IDQ5ODEyYTc2
Yi4uOWQ0Y2JlNjM2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxlLmMNCisrKyBi
L2RyaXZlcnMvaGlkL2hpZC1hcHBsZS5jDQpAQCAtNDIsNiArNDIsNyBAQA0KICNkZWZpbmUgQVBQ
TEVfQkFDS0xJR0hUX0NUTAlCSVQoMTApDQogI2RlZmluZSBBUFBMRV9JU19OT05fQVBQTEUJQklU
KDExKQ0KICNkZWZpbmUgQVBQTEVfTUFHSUNfQkFDS0xJR0hUCUJJVCgxMikNCisjZGVmaW5lIEFQ
UExFX0RJU0FCTEVfRk4JQklUKDEzKQ0KIA0KICNkZWZpbmUgQVBQTEVfRkxBR19GS0VZCQkweDAx
DQogDQpAQCAtODksNiArOTAsMTkgQEAgc3RydWN0IGFwcGxlX3NjX2JhY2tsaWdodCB7DQogCXN0
cnVjdCBoaWRfZGV2aWNlICpoZGV2Ow0KIH07DQogDQorc3RydWN0IGFwcGxlX2JhY2tsaWdodF9j
b25maWdfcmVwb3J0IHsNCisJdTggcmVwb3J0X2lkOw0KKwl1OCB2ZXJzaW9uOw0KKwl1MTYgYmFj
a2xpZ2h0X29mZiwgYmFja2xpZ2h0X29uX21pbiwgYmFja2xpZ2h0X29uX21heDsNCit9Ow0KKw0K
K3N0cnVjdCBhcHBsZV9iYWNrbGlnaHRfc2V0X3JlcG9ydCB7DQorCXU4IHJlcG9ydF9pZDsNCisJ
dTggdmVyc2lvbjsNCisJdTE2IGJhY2tsaWdodDsNCisJdTE2IHJhdGU7DQorfTsNCisNCiBzdHJ1
Y3QgYXBwbGVfbWFnaWNfYmFja2xpZ2h0IHsNCiAJc3RydWN0IGxlZF9jbGFzc2RldiBjZGV2Ow0K
IAlzdHJ1Y3QgaGlkX3JlcG9ydCAqYnJpZ2h0bmVzczsNCkBAIC0xNTIsMjAgKzE2Niw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYXBwbGVfa2V5X3RyYW5zbGF0aW9uIG1hZ2ljX2tleWJvYXJkXzIw
MTVfZm5fa2V5c1tdID0gew0KIAl7IH0NCiB9Ow0KIA0KLXN0cnVjdCBhcHBsZV9iYWNrbGlnaHRf
Y29uZmlnX3JlcG9ydCB7DQotCXU4IHJlcG9ydF9pZDsNCi0JdTggdmVyc2lvbjsNCi0JdTE2IGJh
Y2tsaWdodF9vZmYsIGJhY2tsaWdodF9vbl9taW4sIGJhY2tsaWdodF9vbl9tYXg7DQotfTsNCi0N
Ci1zdHJ1Y3QgYXBwbGVfYmFja2xpZ2h0X3NldF9yZXBvcnQgew0KLQl1OCByZXBvcnRfaWQ7DQot
CXU4IHZlcnNpb247DQotCXUxNiBiYWNrbGlnaHQ7DQotCXUxNiByYXRlOw0KLX07DQotDQotDQog
c3RhdGljIGNvbnN0IHN0cnVjdCBhcHBsZV9rZXlfdHJhbnNsYXRpb24gYXBwbGUyMDIxX2ZuX2tl
eXNbXSA9IHsNCiAJeyBLRVlfQkFDS1NQQUNFLCBLRVlfREVMRVRFIH0sDQogCXsgS0VZX0VOVEVS
LAlLRVlfSU5TRVJUIH0sDQpAQCAtMzY0LDYgKzM2NCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFwcGxlX25vbl9hcHBsZV9rZXlib2FyZCBub25fYXBwbGVfa2V5Ym9hcmRzW10gPSB7DQogCXsg
IldLQjYwMyIgfSwNCiB9Ow0KIA0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYXBwbGVfbm9uX2FwcGxl
X2tleWJvYXJkIG5vbl9hcHBsZV9rZXlib2FyZHNfZGlzYWJsZV9mbltdID0gew0KKwl7ICJPbW90
b24iIH0sDQorfTsNCisNCiBzdGF0aWMgYm9vbCBhcHBsZV9pc19ub25fYXBwbGVfa2V5Ym9hcmQo
c3RydWN0IGhpZF9kZXZpY2UgKmhkZXYpDQogew0KIAlpbnQgaTsNCkBAIC0zNzgsNiArMzgyLDIw
IEBAIHN0YXRpYyBib29sIGFwcGxlX2lzX25vbl9hcHBsZV9rZXlib2FyZChzdHJ1Y3QgaGlkX2Rl
dmljZSAqaGRldikNCiAJcmV0dXJuIGZhbHNlOw0KIH0NCiANCitzdGF0aWMgYm9vbCBhcHBsZV9k
aXNhYmxlX2ZuX2tleShzdHJ1Y3QgaGlkX2RldmljZSAqaGRldikNCit7DQorCWludCBpOw0KKw0K
Kwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShub25fYXBwbGVfa2V5Ym9hcmRzX2Rpc2FibGVf
Zm4pOyBpKyspIHsNCisJCWNoYXIgKm5vbl9hcHBsZSA9IG5vbl9hcHBsZV9rZXlib2FyZHNfZGlz
YWJsZV9mbltpXS5uYW1lOw0KKw0KKwkJaWYgKHN0cm5jbXAoaGRldi0+bmFtZSwgbm9uX2FwcGxl
LCBzdHJsZW4obm9uX2FwcGxlKSkgPT0gMCkNCisJCQlyZXR1cm4gdHJ1ZTsNCisJfQ0KKw0KKwly
ZXR1cm4gZmFsc2U7DQorfQ0KKw0KIHN0YXRpYyBpbmxpbmUgdm9pZCBhcHBsZV9zZXR1cF9rZXlf
dHJhbnNsYXRpb24oc3RydWN0IGlucHV0X2RldiAqaW5wdXQsDQogCQljb25zdCBzdHJ1Y3QgYXBw
bGVfa2V5X3RyYW5zbGF0aW9uICp0YWJsZSkNCiB7DQpAQCAtNDE5LDcgKzQzNyw4IEBAIHN0YXRp
YyBpbnQgaGlkaW5wdXRfYXBwbGVfZXZlbnQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgc3RydWN0
IGlucHV0X2RldiAqaW5wdXQsDQogCXVuc2lnbmVkIGludCByZWFsX2ZubW9kZTsNCiANCiAJaWYg
KGZubW9kZSA9PSAzKSB7DQotCQlyZWFsX2ZubW9kZSA9IChhc2MtPnF1aXJrcyAmIEFQUExFX0lT
X05PTl9BUFBMRSkgPyAyIDogMTsNCisJCXJlYWxfZm5tb2RlID0gKGFzYy0+cXVpcmtzICYgQVBQ
TEVfRElTQUJMRV9GTikgPyAwIDoNCisJCQkgICAgICAoKGFzYy0+cXVpcmtzICYgQVBQTEVfSVNf
Tk9OX0FQUExFKSA/IDIgOiAxKTsNCiAJfSBlbHNlIHsNCiAJCXJlYWxfZm5tb2RlID0gZm5tb2Rl
Ow0KIAl9DQpAQCAtNzM4LDYgKzc1NywxMSBAQCBzdGF0aWMgaW50IGFwcGxlX2lucHV0X2NvbmZp
Z3VyZWQoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsDQogCQlhc2MtPnF1aXJrcyB8PSBBUFBMRV9J
U19OT05fQVBQTEU7DQogCX0NCiANCisJaWYgKGFwcGxlX2Rpc2FibGVfZm5fa2V5KGhkZXYpKSB7
DQorCQloaWRfaW5mbyhoZGV2LCAiRGlzYWJsZSBmbiBrZXkgcXVpcmsgZGV0ZWN0ZWQ7IGZubW9k
ZT0wIGJlaGF2aW91ciB3aWxsIGJlIGZvbGxvd2VkIGJ5IGRlZmF1bHRcbiIpOw0KKwkJYXNjLT5x
dWlya3MgfD0gQVBQTEVfRElTQUJMRV9GTjsNCisJfQ0KKw0KIAlyZXR1cm4gMDsNCiB9DQogDQot
LSANCjIuMzkuNSAoQXBwbGUgR2l0LTE1NCkNCg0KDQo=

