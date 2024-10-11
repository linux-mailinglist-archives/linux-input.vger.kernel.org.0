Return-Path: <linux-input+bounces-7354-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DB999B65
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 06:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8360C1C21ADA
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 04:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4E11F4736;
	Fri, 11 Oct 2024 04:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="OnDT5wuv"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D51C463E
	for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728619410; cv=none; b=uZfs/czrHDeXpWHozxJwmlDbfd1XOyqsShh1BbmcmsEEvnKD3YH3UMm/Qub/YvAmT4QOSSbjXHvSI/CCWo3ILFAnehmYTBQP19/lHP5HNMLyE5UWeYCPDkQiKQvSNmbUl1Y+Q/kkLz5GKzxSn5jLq7MoSfFeyBSE5zW9yNiJez0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728619410; c=relaxed/simple;
	bh=V+cB3AgacgW4V1WKLAXnF4o3bFSNJ7x6yuK0bTFQHdA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=r1S5bCicXx9lYHTyhmF2bhaCSttOylGSUz7jEgOnPn1v1cb/csfxkud7xg+rEVC+ZB5U7KcgEEhdU0SPPopZCmZv/s26ilvv0sVQOIqXdegi1MUAqp3S/Rkn3aLt5MrstxzTZvsp+hhUGKcp1v7889cqhQBCQcFCysKKWztSkYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=OnDT5wuv; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1728619406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+cB3AgacgW4V1WKLAXnF4o3bFSNJ7x6yuK0bTFQHdA=;
	b=OnDT5wuvDbPoq3oqhpNKA2T+ADqWLsDyT2AUg0OmV0iiT2U2g/X03M0qnCcB2b9Vs0YNOe
	7+eVEAOf+kR0ny957wwDpu7J3FAK+00Ohwq74swUCjEmAEd6U8wLcoa3S4Iw2mD/B7vEEg
	IsZaKtxeGeWZzJPXbhuzcwoAdhJXTJ8=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-aQzzb9HdOrG7KQBjbakTIg-1; Fri, 11 Oct 2024 00:03:23 -0400
X-MC-Unique: aQzzb9HdOrG7KQBjbakTIg-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by PH0PR84MB1717.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:171::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 04:03:20 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 04:03:20 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Topic: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Index: AQHbDvyAJRxpPdoqekCWSH3hIjpGNLJpS/pwgBe6B0A=
Date: Fri, 11 Oct 2024 04:03:20 +0000
Message-ID: <EA2PR84MB378022DD0D3D06901404BEDB8B792@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
 <EA2PR84MB37807C9F2191AFE41F9372328B6A2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <EA2PR84MB37807C9F2191AFE41F9372328B6A2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|PH0PR84MB1717:EE_
x-ms-office365-filtering-correlation-id: 8e4c203c-c6fd-4ba7-d7f9-08dce9a9a4f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?OHNLdDlTemZzajhSbXFKUTkwUUs2WmpUelRSdjE0TkQrb3VlemdZQVVpT2JS?=
 =?utf-8?B?WktQSlFpZENJNmZqUjd4T2VCd3QybVhaSGUzeENhZG16bWp1Y3NSem10WXZ2?=
 =?utf-8?B?bzRFeGtyNDlyYzNjVDRNaHRXZ2VFZGlUQkp1YU5ra2RXTU9qVHd0OTN5QkNq?=
 =?utf-8?B?TzlGMXlsTDQ5VXRNK0pvUHg0SGlFWTJ2VE9uQ3ZDOGo5bWJUYlJBdWxSZy9W?=
 =?utf-8?B?akt1akYxS2VIMlc3RkFaK2FSR3E4WGxQaVhuQ3MrU0cwdk10eWJidVBxVWhw?=
 =?utf-8?B?bkVhb2UwQWhJQjJUYjdjRkFUdDdLQzg5QzMzTGNSem5PdUlubWxwbTMwWi9l?=
 =?utf-8?B?WDBUcGFTQTAzV2lVVVJEUmwvY3docUlPY1MzL0h3Rzhrc2ZnUkRZRWJIdFdq?=
 =?utf-8?B?N3pISHVBVnhPdi8xVDhDeGQySHp3YmQ2amZSSkZzSFYrVm56N20ycjM2YTBq?=
 =?utf-8?B?Qm8rZUxoVjA4WjlUNkRnTEZIWFp3eTZRc2dKNExzQU1qTzR0K2ZoYnRHcSsx?=
 =?utf-8?B?d083Qzk5cERteTExWXhRMVJhNERzY1hLM1NjNGcwN3Z5akI2bHpxZ3lIZkJN?=
 =?utf-8?B?T0xqUGJIdktKVisrMklVcnJqV1ZPL2Y2akF4QmtLSkl1NU1reVNDNVlwVHN4?=
 =?utf-8?B?YVdnbWE2UzVlSlZnc2h6TjNWSFc3R1pKZlhQR2RuZEdpOENId254OTgzbmxo?=
 =?utf-8?B?aTRVek5PRitTQWViRDVuSHVmbHd0U2RPY0l6SmsyMzBoUXFOcVlXQWpwT3Yw?=
 =?utf-8?B?ZUVuV1ZmcDF6emZCMk42TlYvUVRnd296Ui9BMmxhdXFYSjRwYS9ESFJub2pz?=
 =?utf-8?B?UVA2N1VxNmhYZE1UWnJPd010WllmOWhvV3l4dVZXTFFDOURoSGsrTzBLYlc1?=
 =?utf-8?B?amVIZFhXQ3lNTkprdXl1UW4xcnVhRUtoNWllZk9RN0JBcW05eGtTam4vaVo3?=
 =?utf-8?B?bFVnd2VGV0p1L1pZTmdvZnlIbnZwUU9WTldyNXp0WTZRRmRJZy9xNFVkSzAv?=
 =?utf-8?B?UHA2TkpiQ0xUTDEyaWdKTlAvVkNvdkxGc1ZHNEVHZGFMbER3bGJHQjBSOXhh?=
 =?utf-8?B?Sjl4OUxpSVVtSnBNemZnVmloY2JJRlNaUGRHYm9RZ0xJMUZNZVVva05HYkNQ?=
 =?utf-8?B?SXJwVTNRMFZ2VnduL0FkL3lLWlRlNzRJNUM3TTUxeHdwL1NGMyt0T3ZwOVhl?=
 =?utf-8?B?enRldWhhajEvRXE2b0VJV2s3bDk0ZUVDcnFBcWJoUlNwQWhheFBZRWRVMnV3?=
 =?utf-8?B?eitIaUt4V3ZrblFxVlpXeDZJaWV2Ui91UFFYWXJCaDlTYlA4Sk5peDc3M2tp?=
 =?utf-8?B?VExPTW9ZdmRHRlVtUmprZmgzU205YXAxR0tmdDFMWDF6bFRpQmZkelM1Zkd3?=
 =?utf-8?B?M1NIc3h5eEZwLzgzczhac0ZRSlZMVm03d255Y3IwdnB5OXY1bGhZTlJKbnlL?=
 =?utf-8?B?WFVPWk9XK2ZZRk9hVlZBL0VyZmNtNXQ5YnM0cG5wODdxWjlrY2o1TTl6cTEx?=
 =?utf-8?B?b1hqbkVNc3pxK3NObklKTkYrTFN5Q3VCdk1vY3BhYnlQS1NEakp6U2VoSXky?=
 =?utf-8?B?ZGh4VVRkY0tuQ0NGWWZucUZXRUQybHlsbDE3cXl5aXFOYkw5TVUzSnJJOGt6?=
 =?utf-8?B?T3JxWGJ5eGllK2RRQ2o4WWVJdCtUdHZHR01VdE0rQ3VTcVl1OVlzM2JwWTEy?=
 =?utf-8?B?dTk3S2ZZMFNjeERsUkZFL2c0YWZ2RWgwZnZHT1VPL2h5cGZXNFBIek1SenBq?=
 =?utf-8?B?QjI3V2dlc2JiV1ZBdTc4SFNydVZianRUOHNaTGNoMThlWmJ2aFc2TjhMZlV2?=
 =?utf-8?B?RjdPS0FYWmhKTkp1RVNDdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVNvM3dVUEZUbjBic1h4VXdEaTZYRmFIVlRrMjJsSnFNczNlU0F5Z1BKcnBQ?=
 =?utf-8?B?UkNFcFdQQ3d0YWJZeDFHR3N0bGlOOGFleVlHN3pONk8zRDg4VVY1VlFjQVhW?=
 =?utf-8?B?SFdNdGoxeEJScU5YaWFzWjhkT0J4a29iMGdacXpwclh5OEtjdVR5dzVoMllP?=
 =?utf-8?B?bFlacXhjWDd4amM0dHFyRXdPb0ZkaWEwdEpDWjcraS83ZFJOZHhLSXNsSS9a?=
 =?utf-8?B?VnFLeVhTbGVxelluZVIvOE1XeS9wc3hzRjZuZE92clM1SG9SOHFVNS9OMWVq?=
 =?utf-8?B?K09NQStLUUhLQ0lXWjUxSjEwb2Y0ZDVQdUtsdHhCSE5RSXFUVnU0ODB0d21Y?=
 =?utf-8?B?d0JaRmcwOFNNQUsyTFo3Z3lIcXN2RlM1YTRXVUtSa2FLbVkyalFYemVLWkpG?=
 =?utf-8?B?RnAwUUN2WWtKcnFtSnc2NzZtZm1sS2hnV2lNZnpQVVd5YTFyZnF3bHFSSFFT?=
 =?utf-8?B?Y1JHYytZRDR1OFloUDJpQUxoSGJPV2hiNWs0TEh2YU1lWWQvMEsrVk9vS2Jz?=
 =?utf-8?B?UXgrWHgyVmRVMUR6MVp2dCtLSy9HWENDeHlnZHpKbENjNU5wMHJ4blNyZGNo?=
 =?utf-8?B?cXdMa0QyWGsvWmJmR0k0Skp3ejJMdXRtYzR1My9YRFhMRHhMRmZlbmZWL25I?=
 =?utf-8?B?WE5idGtLRi8zWXRRejJCMFlYNjduYllqTmRBdGk4WGxNVWtxZzRCMGoyWEpx?=
 =?utf-8?B?dmxVNzlRa3VFMlJXSWttYkt1WjE4UHpVOVg4V3pqQ1ZvMllxdy81VCtFWWNp?=
 =?utf-8?B?RUdGbEdhVVlOY0lOeGtnelRXcTE3aWJtQnlTN2FlQUFrZmtsWlo2REhlNUxn?=
 =?utf-8?B?WWI5RGFsSmJWaU9uOEo1MXpUTnora1FqN0tSYm1Kb3VOVXlVRFpJV3dXb25M?=
 =?utf-8?B?NmZsVjRrbWNVeitHQjBSekEwSndZbmRwVzBkTUdWWjJlQ3BONE9mQXJheFdx?=
 =?utf-8?B?ZW1RYlVXeEE0K00vWktzRERGNXk0Snd0Qk9wVWJuUVBNb2NwcjJXTGlUTTQ4?=
 =?utf-8?B?UndGSDRwelhxR1F6bHZOMk9VSVBwc1VuVlFYTGx3Z254dVoxTGdWWGRoWVRQ?=
 =?utf-8?B?NFRXRWhPODFJeUpZUTR6QUU5Y0tYNVM4SnpvUUp4WnFVdTM2Z1FzZVJ4Ymt6?=
 =?utf-8?B?Mm56Wk9DOGVnbklYd2JRS0Rjd0M5TXh2YnlZZUlmbkIwYjZ6dDhrWmZyVjJ5?=
 =?utf-8?B?M3BTOE5ZYXVsRXJHMzZoMllsc29LKzhxSE5KNmV3bW9Yc3ZPZHhzdSt0Q3FP?=
 =?utf-8?B?WFVQTTdtRlhWd3Y2bWQyL0d6eE9mc0t4Y2RadEsvQ0Y1by94bnJoQmU4ZXVw?=
 =?utf-8?B?MGZiQ0VjR2svblVQcDdqZCtnbE0zQTFBMTNhSDF0MFdHMGlCYWZNd29FTEtG?=
 =?utf-8?B?aXdLWGk4eUNZVWFBTDN6VlF5N0FiN3ZOQmp5MzkyRGxCVUNtZXk4R3NiSjlM?=
 =?utf-8?B?S2NMM0dFYWJXYVdpQzVsVG9iMTZUM1RDSG1qOTlNVno5L3k5TklTMk92UW5a?=
 =?utf-8?B?bDErRkNEUTIvcVFGNjZoRnIxTnptbGo2Z2wwenM3NmlFVjNtZk1rbCtTV0Jt?=
 =?utf-8?B?eEhreGt2YzZXZkxYTzNYVVJuQ3F4MUtobm50T3luZHJieE4wSm1obktZZ3NQ?=
 =?utf-8?B?MHcvNFE3SUIwYkc5YkM0NkRYVjN5TlpYUVFHOWxpeWF2RmM4Vm5OUWIwM0pL?=
 =?utf-8?B?TXhYaTFjTVg5UVNjelJ6OU10S1FFZEdMUHE3MzV6TFhIbjNyMTU1cTR3NU5j?=
 =?utf-8?B?eldqSkpWb2xaVXlsWDdVUTkwRklkaEQxVVNyL3Fnb0luMjNsOW9HWmxCYkFn?=
 =?utf-8?B?Sks1a044c1R5RDdHY1cvKy9QQWs4TDh4QW1icnVKK0dvTTc1SHpMS05iQTZh?=
 =?utf-8?B?cldxakkzalFDek5hYTd4WXgxY1pDVzgwOFIzQUsvQWEwUnluRHhDdzdRb3pD?=
 =?utf-8?B?VXBkM3NBS3VSYWdwdDFkV3hlVGlpVHIyUW4vdVMzeXZnN3p4eVA0RUdaMnRl?=
 =?utf-8?B?SWMyNndDTW5vNGthS3Ixb3JDME5BeXh3OEdUVUxHdms5RTVlaDlXOUZTN0ZT?=
 =?utf-8?B?M3NvNVNoc3FxV3Fib1ZYTnlFMGdSeFcrdmp4QzBHL3l4eVFhL2pQcDNQQ2RR?=
 =?utf-8?Q?dlXM=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4c203c-c6fd-4ba7-d7f9-08dce9a9a4f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 04:03:20.6094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IapctDe1XLU7L7DUqakjbXmoVw3ZObMkw37m3LBbWofS4+D+pezOWkCGjebv+a/3J2zdIsgsBoO55YCWtkD3bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1717
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgVGVycnksDQoNCklzIGl0IE9LIHRvIGFwcGx5PyBBdCBsZWFzdCB3ZSB3aWxsIGhhdmUgYSBj
aGFuY2UgdG8gaW1wcm92ZSB1c2VyIGV4cGVyaWVuY2UgaW4gdXNlcnNwYWNlIGFmdGVyIGFwcGx5
IHRoaXMgcGF0Y2guIExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIGNvbW1lbnRzLiBUaGFua3MNCg0K
UmVnYXJkcw0KV2FkZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2FuZywg
V2FkZSANClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjYsIDIwMjQgOTo1OCBBTQ0KVG86IFRl
cnJ5IEp1bmdlIDxsaW51eGhpZEBjb3NtaWNnaXptb3N5c3RlbXMuY29tPjsgQmVuamFtaW4gVGlz
c29pcmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+DQpDYzogamlrb3NAa2VybmVsLm9yZzsgbGludXgt
aW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFi
bGVAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBSRTogW1BBVENIXSBISUQ6IHBsYW50cm9uaWNz
OiBVcGRhdGUgdG8gbWFwIG1pY211dGUgY29udHJvbHMNCg0KSGkgVGVycnksDQoNCjEuIFBlciBv
dXIgdGVzdGluZywgUG9seSBoZWFkc2V0IHdpbGwgbWFpbnRhaW4gTXV0ZSBzdGF0dXMgYXQgaGVh
ZHNldCBzaWRlLCB3aGF0ZXZlciBob3N0IHNlbmQgZmVlZGJhY2sgb3Igbm90Lg0KMi4gTXV0ZSBs
ZWQgaXMgb2ZmIHdoZW4gUG9seSBVU0IgaGVhZHNldCBjb25uZWN0IHRvIGhvc3QsIHNvIGhvc3Qg
d2lsbCBrZWVwIHNhbWUgTXV0ZSBzdGF0dXMgd2l0aCBoZWFkc2V0IGJlY2F1c2Ugb2YgdG9nZ2xl
IE11dGUga2V5IGV2ZW50Lg0KMy4gRXZlbiBVYnVudHUgYW5kIENocm9tZWJvb2tzIGhhdmUgdG8g
ZmVlZGJhY2sgUG9seSBoZWFkc2V0IG11dGUgc3RhdGUsIGl0IHNob3VsZCBiZSBkb25lIGF0IHVz
ZXIgc3BhY2UgaW5zdGVhZCBvZiBrZXJuZWwuIFRoZSBwcmVjb25kaXRpb24gaXMga2VybmVsIHNo
b3VsZCByZXBvcnQgTXV0ZSBrZXkgZXZlbnQgZmlyc3QsIHRoZW4gdXNlciBzcGFjZSBoYXMgY2hh
bmNlIHRvIGRvIHRoaXMga2luZCBvZiBpbXByb3ZlbWVudCBpbiBmdXR1cmUNCg0KU28gZm9sbG93
aW5nIHN0YW5kYXJkIEhJRCBydWxlIGlzIG5lY2Vzc2FyeS4NCg0KQlRXLCBvbiBNU0ZUIFdpbmRv
d3MsIEFmdGVyIHJlY2VpdmUgbXV0ZSBrZXksIHRoZSBob3N0IHN3aXRjaCB0aGUgbXV0ZSBjb250
cm9sIHN0YXR1cyBvZiB0aGUgYXVkaW8gY29udHJvbCBpbnRlcmZhY2UsIHdoYXRldmVyIG11dGUg
c3RhdHVzIGluIGhlYWRzZXQgRlcgaXMgY29ycmVjdCBvciBub3QuIEkgdGhpbmsgaXQgbWFrZSBz
ZW5zZSB0aGFuIExFRCBwYWdlIG11dGUgTEVELg0KDQpUaGFua3MsDQpXYWRlDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUZXJyeSBKdW5nZSA8bGludXhoaWRAY29zbWljZ2l6
bW9zeXN0ZW1zLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI0IDExOjMy
IEFNDQpUbzogV2FuZywgV2FkZSA8d2FkZS53YW5nQGhwLmNvbT47IEJlbmphbWluIFRpc3NvaXJl
cyA8YmVudGlzc0BrZXJuZWwub3JnPg0KQ2M6IGppa29zQGtlcm5lbC5vcmc7IGxpbnV4LWlucHV0
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgc3RhYmxlQHZn
ZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gSElEOiBwbGFudHJvbmljczogVXBk
YXRlIHRvIG1hcCBtaWNtdXRlIGNvbnRyb2xzDQoNCkNBVVRJT046IEV4dGVybmFsIEVtYWlsDQoN
CkhpIFdhZGUsDQoNCkkgcmV0aXJlZCBmcm9tIFBsYW50cm9uaWNzIGluIDIwMjAuIFRoZSBvcmln
aW5hbCBkcml2ZXIgZGlkIG5vdCBhbGxvdyBtdXRlIGJ1dHRvbiB0byBiZSBtYXBwZWQgYXMgdGhl
cmUgd2VyZSBtdXRlIHN5bmNocm9uaXphdGlvbiBpc3N1ZXMuDQoNClRoZSBoZWFkc2V0IG5lZWRz
IHRvIHJlY2VpdmUgc29tZSB0eXBlIG9mIGZlZWRiYWNrIGZyb20gdGhlIGhvc3Qgd2hlbiBpdCBz
ZW5kcyB0aGUgbXV0ZSBldmVudCBpbiBvcmRlciB0byBzeW5jaHJvbml6ZSB3aXRoIHRoZSBob3N0
LCBpZGVhbGx5IHRoZSBob3N0IHNldHRpbmcgb3IgY2xlYXJpbmcgdGhlIG11dGUgY29udHJvbCBp
biB0aGUgYXVkaW8gY29udHJvbCBpbnRlcmZhY2UgYnV0IHNldHRpbmcvY2xlYXJpbmcgdGhlIG11
dGUgTEVEIHdvdWxkIGFsc28gd29yay4NCg0KQXQgdGhlIHRpbWUgVWJ1bnR1IGFuZCBDaHJvbWVi
b29rcyBkaWQgbm90IGZlZWRiYWNrIG11dGUgc3RhdGUgYW5kIGl0IHdhcyBwb3NzaWJsZSB0byBt
dXRlIGZyb20gdGhlIGhlYWRzZXQgYW5kIHRoZW4gdW5tdXRlIGZyb20gdGhlIG1peGVyIG9yIGtl
eWJvYXJkIGFuZCB0aGUgaGVhZHNldCB3b3VsZCBzdGF5IG11dGVkLiBUaGUgb25seSB3YXkgdG8g
dW5tdXRlIHdhcyB3aXRoIHRoZSBoZWFkc2V0IGJ1dHRvbi4gVGhpcyB3YXMgYW4gdW5hY2NlcHRh
YmxlIHVzZXIgZXhwZXJpZW5jZSBzbyB3ZSBibG9ja2VkIG1hcHBpbmcuDQoNCklmIHlvdSB3YW50
IHRvIHRyeSBtYXBwaW5nIG11dGUgZXZlbnQgdGhlbiB5b3UgYWxzbyBuZWVkIHRvIGFsbG93IG1h
cHBpbmcgdGhlIG11dGUgTEVEIGZvciBwb3NzaWJsZSBob3N0IGZlZWRiYWNrLg0KDQooSElEX1VQ
X1RFTEVQSE9OWSB8IDB4MmYpIGlzIHRlbGVwaG9ueSBwYWdlIG11dGUgYnV0dG9uIChISURfVVBf
TEVEIHwgMHgwOSkgaXMgTEVEIHBhZ2UgbXV0ZSBMRUQNCg0KVGhlbiB5b3UgbmVlZCB0byB0ZXN0
IG1vcmUgdGhhbiBqdXN0IHRoZSBldmVudCBnZXR0aW5nIHRvIHVzZXIgc3BhY2UuDQpZb3UgbmVl
ZCB0byBjaGVjayBtdXRlIHN5bmNocm9uaXphdGlvbiB3aXRoIHRoZSBob3N0IG1peGVyIHVuZGVy
IGFsbCBtdXRlL3VubXV0ZSB1c2UgY2FzZXMuDQoNClJlZ2FyZHMsDQpUZXJyeSBKdW5nZQ0KDQoN
Ck9uIDkvMjQvMjQgMjowMCBBTSwgV2FuZywgV2FkZSB3cm90ZToNCj4gSGkgQmVuamFtaW4gYW5k
IEdyZWcsDQo+DQo+IE1heSBJIGtub3cgdGhlIHJldmlldyBwcm9ncmVzcyBhbmQgYW55dGhpbmcg
SSBuZWVkIHRvIGNoYW5nZT8gVGhhbmtzDQo+DQo+IFJlZ2FyZHMNCj4gV2FkZQ0KPg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXYW5nLCBXYWRlDQo+IFNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDE2LCAyMDI0IDQ6MTMgUE0NCj4gVG86IEJlbmphbWluIFRpc3NvaXJlcyA8
YmVudGlzc0BrZXJuZWwub3JnPg0KPiBDYzogamlrb3NAa2VybmVsLm9yZzsgbGludXgtaW5wdXRA
dmdlci5rZXJuZWwub3JnOyANCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgc3RhYmxl
QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIXSBISUQ6IHBsYW50cm9uaWNz
OiBVcGRhdGUgdG8gbWFwIG1pY211dGUgY29udHJvbHMNCj4NCj4gSGkgQmVuamFtaW4sDQo+DQo+
IFRoaXMgcGF0Y2ggaXMgZm9yIGFsbCBQb2x5IEhTIGRldmljZXMsIGFuZCBpdCBkb2VzIG5vdCBk
ZXBlbmRzIG9uIG90aGVyIHBhdGNoZXMsIGl0IGNhbiBhcHBseSBkaXJlY3RseSBieSAiIGdpdCBh
bSAtMyIuDQo+DQo+IFdpdGggdGhpcyBwYXRjaCwgTWljTXV0ZSBidXR0b24ga2V5IGV2ZW50IHdp
bGwgYmUgc2VuZCB0byB1c2VyIHNwYWNlLCBJIGhhdmUgdGVzdGVkIG9uIHRoZSBiZWxvdyBQb2x5
IGRldmljZXM6DQo+ICAgICAgICAgIFBsYW50cm9uaWNzIEVuY29yZVBybyA1MDAgU2VyaWVzDQo+
ICAgICAgICAgIFBsYW50cm9uaWNzIEJsYWNrd2lyZV8zMzI1IFNlcmllcw0KPiAgICAgICAgICBQ
b2x5IFZveWFnZXIgNDMyMCBIUyArIEJUNzAwIERvbmdsZQ0KPg0KPiBSZWdhcmRzDQo+IFdhZGUN
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gVGlzc29p
cmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDEzLCAy
MDI0IDEwOjA0IFBNDQo+IFRvOiBXYW5nLCBXYWRlIDx3YWRlLndhbmdAaHAuY29tPg0KPiBDYzog
amlrb3NAa2VybmVsLm9yZzsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyANCj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBISUQ6IHBsYW50cm9uaWNzOiBVcGRhdGUgdG8gbWFwIG1pY211dGUgY29u
dHJvbHMNCj4NCj4gQ0FVVElPTjogRXh0ZXJuYWwgRW1haWwNCj4NCj4gT24gU2VwIDEzIDIwMjQs
IFdhZGUgV2FuZyB3cm90ZToNCj4+IHRlbGVwaG9ueSBwYWdlIG9mIFBsYW50cm9uaWNzIGhlYWRz
ZXQgaXMgaWdub3JlZCBjdXJyZW50bHksIGl0IGNhdXNlZCANCj4+IG1pY211dGUgYnV0dG9uIG5v
IGZ1bmN0aW9uLCBOb3cgZm9sbG93IG5hdGl2ZSBISUQga2V5IG1hcHBpbmcgZm9yIA0KPj4gdGVs
ZXBob255IHBhZ2UgbWFwLCB0ZWxlcGhvbnkgbWljbXV0ZSBrZXkgaXMgZW5hYmxlZCBieSBkZWZh
dWx0DQo+DQo+IEZvciB3aGljaCBkZXZpY2VzIHRoaXMgcGF0Y2ggaXMgcmVxdWlyZWQ/IElzIGl0
IHJlbGF0ZWQgdG8gdGhlIG90aGVyIHBhdGNoIHlvdSBzZW50IHRvZGF5PyBJZiBzbyBwbGVhc2Ug
bWFrZSBhIG1lbnRpb24gb2YgdGhlIGNvbmNlcm5lZCBkZXZpY2VzIGFuZCBtYWtlIHN1cmUgYm90
aCBwYXRjaGVzIGFyZSBzZW50IGluIGEgc2luZ2xlIHYzIHNlcmllcy4NCj4NCj4gQWxzbywgaGF2
ZSB5b3UgdGVzdGVkIHRoaXMgY2hhbmdlIHdpdGggb3RoZXIgUGxhbnRyb25pY3MgaGVhZHNldHM/
IFdoZXJlIHRoZXJlIGFueSBjaGFuZ2VzIGluIGJlaGF2aW9yIGZyb20gdGhlbT8NCj4NCj4gQ2hl
ZXJzLA0KPiBCZW5qYW1pbg0KPg0KPj4NCj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+
PiBTaWduZWQtb2ZmLWJ5OiBXYWRlIFdhbmcgPHdhZGUud2FuZ0BocC5jb20+DQo+PiAtLS0NCj4+
ICAgZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMgfCA0ICsrLS0NCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMgDQo+PiBiL2RyaXZlcnMvaGlkL2hpZC1w
bGFudHJvbmljcy5jIGluZGV4IDJhMTlmMzY0NmVjYi4uMmQxNzUzNGZjZTYxDQo+PiAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1wbGFudHJvbmljcy5jDQo+PiArKysgYi9kcml2ZXJz
L2hpZC9oaWQtcGxhbnRyb25pY3MuYw0KPj4gQEAgLTc3LDEwICs3NywxMCBAQCBzdGF0aWMgaW50
IHBsYW50cm9uaWNzX2lucHV0X21hcHBpbmcoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsDQo+PiAg
ICAgICAgICAgICAgICB9DQo+PiAgICAgICAgfQ0KPj4gICAgICAgIC8qIGhhbmRsZSBzdGFuZGFy
ZCB0eXBlcyAtIHBsdF90eXBlIGlzIDB4ZmZhMHV1dXUgb3IgMHhmZmEydXV1dSAqLw0KPj4gLSAg
ICAgLyogJ2Jhc2ljIHRlbGVwaG9ueSBjb21wbGlhbnQnIC0gYWxsb3cgZGVmYXVsdCBjb25zdW1l
ciBwYWdlIG1hcCAqLw0KPj4gKyAgICAgLyogJ2Jhc2ljIHRlbGVwaG9ueSBjb21wbGlhbnQnIC0g
YWxsb3cgZGVmYXVsdCBjb25zdW1lciAmIA0KPj4gKyB0ZWxlcGhvbnkgcGFnZSBtYXAgKi8NCj4+
ICAgICAgICBlbHNlIGlmICgocGx0X3R5cGUgJiBISURfVVNBR0UpID49IFBMVF9CQVNJQ19URUxF
UEhPTlkgJiYNCj4+ICAgICAgICAgICAgICAgICAocGx0X3R5cGUgJiBISURfVVNBR0UpICE9IFBM
VF9CQVNJQ19FWENFUFRJT04pIHsNCj4+IC0gICAgICAgICAgICAgaWYgKFBMVF9BTExPV19DT05T
VU1FUikNCj4+ICsgICAgICAgICAgICAgaWYgKFBMVF9BTExPV19DT05TVU1FUiB8fCAodXNhZ2Ut
PmhpZCAmIEhJRF9VU0FHRV9QQUdFKSANCj4+ICsgPT0gSElEX1VQX1RFTEVQSE9OWSkNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBkZWZhdWx0ZWQ7DQo+PiAgICAgICAgfQ0KPj4gICAg
ICAgIC8qIG5vdCAnYmFzaWMgdGVsZXBob255JyAtIGFwcGx5IGxlZ2FjeSBtYXBwaW5nICovDQo+
PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KPg0KPg0KDQo=


