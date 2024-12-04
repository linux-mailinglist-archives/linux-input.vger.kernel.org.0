Return-Path: <linux-input+bounces-8378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849579E3336
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 06:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6F8280E1F
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 05:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AEC17AE1D;
	Wed,  4 Dec 2024 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="ghILMbJ4"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB2D2F22
	for <linux-input@vger.kernel.org>; Wed,  4 Dec 2024 05:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733290738; cv=none; b=S5ErztTrc2V8s5ovs61z9rY7ephgDlz5VBjf0x2StPs5ReqtjW7n++OX3a5t3oowEV/5GAekUEI4b1MrDDY3F27WNVxNQ206NMDlgnstN04ta4IrWP8LwedhP5EE79+J5qliVhalPP6+g84FLsS31P6J2K6/MXkfYLlyYTzzo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733290738; c=relaxed/simple;
	bh=nONwpWrVEVed9Wf7K4891w0wt2G+7hgREjhflOp8N4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=B8WZch+8iwr4oXVoEZZZCP6E36Q5gmGNquGbboI7mDyrE/XTbQ2pMkfgq0+Rrj4O8HcOUBYHkw2dK3GmVinU4eZlbFXjUQ5dVLw7/oTyCgEEVb1v9+Atsgp5SB7mq1Q2mHVq+FFBu8HAVyxBXrCXn9OK0QqVwp+N5YlB6nlIibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=ghILMbJ4; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1733290734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nONwpWrVEVed9Wf7K4891w0wt2G+7hgREjhflOp8N4Q=;
	b=ghILMbJ4a05lvLu2PLwMR8UwicjbfIb2UoGZMiH7uCO554PdKGiQAbTuKGc/nPEJlab0k1
	kRiObGOT699tGjR/SJ8seI7+MXEDyeqLHo93KU6xIbl8y9oWk9QRvDu+kmE/vVw8DAYyS/
	019XO0rRv4jBqoucj/WssHq/9LLOzgo=
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-K5iW8IRpPy-KYJiGyJZJbQ-1; Wed,
 04 Dec 2024 00:38:53 -0500
X-MC-Unique: K5iW8IRpPy-KYJiGyJZJbQ-1
X-Mimecast-MFC-AGG-ID: K5iW8IRpPy-KYJiGyJZJbQ
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by DM4PR84MB1829.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 05:38:50 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:38:50 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Takashi Iwai
	<tiwai@suse.de>
CC: Jiri Kosina <jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin
 Tissoires <bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH 0/2] Introduce Poly/Plantronics mute event support
Thread-Topic: [PATCH 0/2] Introduce Poly/Plantronics mute event support
Thread-Index: AQHbRgyt1JXpZCGIlECUsc44lLiHJrLVkF8w
Date: Wed, 4 Dec 2024 05:38:50 +0000
Message-ID: <EA2PR84MB378008E3B3D2B0787F6EB8E38B372@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
 <87h67vzo8z.wl-tiwai@suse.de>
 <dc2bef93-9d74-4700-82e4-575e462dbc16@cosmicgizmosystems.com>
 <87jzchz0g1.wl-tiwai@suse.de>
 <93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
In-Reply-To: <93cbb09f-1e0c-4dd8-8ddf-f46f36f4a3af@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|DM4PR84MB1829:EE_
x-ms-office365-filtering-correlation-id: e9abd480-f09c-48fa-bd98-08dd1425ee78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?QURGUEFSejV4ZHMzanhuU0Y1U1lsRVNQT1lucFFKNkhvNzZsOFh3YUoyVXN6?=
 =?utf-8?B?b0N0U0FZMWF6Q2ZyVlAvc3dMNkpOZkZYU2dtYkY4S3o5ZmdNVWt5U3U5WlI4?=
 =?utf-8?B?cTR5Uy8xMGNFbWZ1VHNWNnF4MWNCQUFxUU5MNTRablJVZ2FVdEdzMWc1Z3V0?=
 =?utf-8?B?VmloQkRRTnB6RVV3Zm5aQU5wVXRqRE16SUdVQW9lQXprdjVvVW9GemxSWm9i?=
 =?utf-8?B?b0tjZnJIU3ZRaTBkaTZaU082RTBPR2JGa2dyL01adTlCdTZEZGkrYW1GdXJG?=
 =?utf-8?B?eitYT2h5SHVyVE9jYVJEY2NBT0lBZ255RFFwYjdNTW1WWVdtQWs0enJ4YlFM?=
 =?utf-8?B?ZFhaMmFEYXNqQXQ4QlNlYzFTVmM2MUhOeDdwNE1GVDFpVUVndU9paWxCVmpS?=
 =?utf-8?B?T0pHZXUxUUpoWHpmUW5Va0pwMDhIc0hsc1hzSWhhNlZHeFNPZlpPbXptd0hv?=
 =?utf-8?B?SHY2UThFcWJHWnNPb3Y4RDlsZ1FwTzZCR2hkMEhxTit6M0I2aFZJTXhXREdu?=
 =?utf-8?B?N0ZabjcwTDVYZE9kcHFHc2kxanpqbENhLyt1OExDNnBYNTlRWkZjSDEreVNa?=
 =?utf-8?B?QXlzT2NCei9MdjgyUGE0azRIRURRdGdXT3B3TnpKbEVjR3g5czlNS1piYVNR?=
 =?utf-8?B?WmVSb1RUd3MyRGZrTGdWVVE2dkEwMDFodHNNRTVJTHhqeUJ5WEx1d29CeUtG?=
 =?utf-8?B?MkROZDVJeURtVm1oU3RjaGxMemJGdnU3L0s5bFV6LzRQallIVVhMSUI1M01K?=
 =?utf-8?B?OGVqc0Y3WWVXRGo4c3E0bE5wbTBTNGhGdUZvZ01mSUVrbnpBSnViYlVKM0o4?=
 =?utf-8?B?bFR1L0thS096UzFsS2RRd1NrNFM2NGZ2NkpGazV1ZWViQTRwa3BxalViall0?=
 =?utf-8?B?eFl4UDl4dFArTHVZV1BOTE9pY0RLOGxzMHhjajIvTnVvcVNoZVFsNk5KRlB1?=
 =?utf-8?B?cmtMNlBSYWVmajhnU01hSU1iYklkUmdHRlAvVzF6M2RNdTljdTFlTUdiVHFR?=
 =?utf-8?B?SXdsVlV3TmhsaVlmMjlLbWFuSEczZm9SOS91M2RxbkIraS9aeFNJR1hTTE5r?=
 =?utf-8?B?ZnZ0aDlpQkxtYUtaRXRuL3EyRThoellUUzhGNkh1STNOeTRBdHk1QW1OMExa?=
 =?utf-8?B?amRhVXN0SWduNUhiNU5JQ1hjekEyU0VBWFJrMmY1ZEJqMEw0SHJVeloxMU50?=
 =?utf-8?B?Rk00cHRtamZmV0ZySnNTSG84QU9ZNWZXaWU1d1pPTU51bDB1YlpsNmVvV3hy?=
 =?utf-8?B?d2srSlc4UGpHZndBYk4rV2hXSXFONXFZQnFjTnJyWmlDZ21YR0RTWG12WDZE?=
 =?utf-8?B?NnltQ2dPTkltWHZ3N3IzU01vZEMxbkE4WGo5dkRyeEZCMVZwUHJNQndGaDli?=
 =?utf-8?B?MW9oTWtEb0JkZXVhTkIwQUMweko3RXpibWlBOTE1QitqMm1ieWN0dDN1S0Js?=
 =?utf-8?B?aUk5R0xYSGN0NG9sRVhhY2pNSlU2VWhlRjFWdCtrQm85RXM3Sm5SNlZ4NmYr?=
 =?utf-8?B?SDZWWFNGRFJoMytoUWpKR3crZ2pGRXNFaTg1Sml2S2RUN3NEOG5qaXlDa1Zr?=
 =?utf-8?B?LzUvY0FmMmdQQkoreWx3NjY1V1M5NDBlUldMWXNIaTFQaDJRWVNHblZCclVz?=
 =?utf-8?B?RTlFK3VOTll4MXlGSW05Q082MmpOeUJWenBDUEJ1eVB1Smt2aTN2b3QxbTBu?=
 =?utf-8?B?MngxSEFJT2QyOVVMdVlLb0pmY05oK0FqT0lXWkhPNlFsOURXUnhCVmxnUHU0?=
 =?utf-8?B?bVZXZnNzaGVtWWgwQjNUeW9iOER3cW1ld0NsaldkRlczNTZ1blJ0by9FcjZH?=
 =?utf-8?B?bWgySUpzTTZmU0VyZDUvK0ZwRVNha01OSGx1UjJxMFF5akc4WEhXd1B3WE0w?=
 =?utf-8?B?OVplOUdzUEk3MUpNcGFKcHgybHpTbHVKYTdHekxTMjdPbEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlhtZmxWUmVQeE9oV3h6N0VJRW02U0VFZElJODBzdTUwRlFNdU1BR0x1djZQ?=
 =?utf-8?B?NXB4MWhGU3JTYUZyRjVyWUZUMUdQK1gxbXFJY2gwamZrbzBwZHUyaGVVdnp5?=
 =?utf-8?B?ZzU2YzQyOWdRVTRNZTRSVXhHR1ZDWm5Qek5pRDM5aFBnSUJYOElKUlB6WFhL?=
 =?utf-8?B?cDlEK00wUHpHV01CZ1FrRzd1WFZRMEI0V2Zkd3MvbkVFZGRKMUhqcXpSNnFv?=
 =?utf-8?B?TVV1OVNYRnBxTlU0VUtZc2pzTEZUbTNreFFrcFgwcEVrSm00VHZ0ZmtwMEpV?=
 =?utf-8?B?L1crUms3cnhxazBPbUwzakJ2dkVMUEVHcFZXTVk3bGh0WUMwOVptME1iQ21N?=
 =?utf-8?B?NGQ5enhkSHRKelRxQzl2Z2p2UXovenZtY2pVRjliNWlCSnhlZE9rVDVlMEVI?=
 =?utf-8?B?b2phajg2VVNSTEQ1K0pDc1dYSnhJZ21Md0dOUnJ4b2xKbExrbGRxcHdxdTdH?=
 =?utf-8?B?dFVTWVloWEZMN29SRnFDSG9xQk1YVVR6Qnlkc2ZrSlJhTHBiWDUwNDdnM2Zx?=
 =?utf-8?B?MXp2a1hzUlBnaXNiWFEzUmkxUnJ6dlBCcjF1YlR5YWdtMjhLM3hVKy8xS1Na?=
 =?utf-8?B?S0tWeGZvQWwybnltcHFybXhidHRWeXB5QlFrVDJ4VloxQUJMdklFbkNzTHZ6?=
 =?utf-8?B?WWNyQm5EdnZadGxTMCs4VTBKYlhJbmdaUWdwazF0K3pTTXV4QmV4L2haNHhz?=
 =?utf-8?B?Wjk1bjhDUlpETTJNeGlIVENwRThhOGNXbDZtdEUwT3VGdi9JNWYvcDdGK1pw?=
 =?utf-8?B?M0pyUVo5R0k5Y3g3dWpMRkJVcU9lR0JOZVJhTTlRSHpNN0wrK3RHdWRHQmll?=
 =?utf-8?B?VUphSVhWNnZ2cXNtakFQLzJnV0ZqZks3ajBTMHg1UG5PeUI0ZjNHelAveVhX?=
 =?utf-8?B?RitqNXF3bmF5d1M1N1VxK1EvUEZwMXN1SmR2VmxzRmNFempiWmExVXBaOHBi?=
 =?utf-8?B?YVRwQkxSMzdwQXB5Z0hscDRIejRTWFNDWm5rYXhEVzVWaTJFYkV6dGtVRDhN?=
 =?utf-8?B?ZGRhNnNrU0dDaW1SdHplWXN0ZklxZWsraG9nQmh6U3RrSVdUckowMjdqemVB?=
 =?utf-8?B?VmZ5bitzenpzYW1Tb09Wb3NFTS9ER0N2Q055b2FLQVBoVnJMVGhTeCtoUVR4?=
 =?utf-8?B?a3JyTmF0S3kvZ2dld0JuSnFISWt3ZFVZYmxVUHlOSHhxbTlLaW5yMGFxUitz?=
 =?utf-8?B?eXRLK2JkM0JzOHhXUDJpYmZvdG5GQmk1QTBtckg0d1YxbVF5djJxeVpQUnF3?=
 =?utf-8?B?Ynd2NVJlSkFidCtwS3ZzVlJiOGw4VVBybkZ1YmhrVVNKckN0Y0puaW1mY0VR?=
 =?utf-8?B?MG1KTHI2Mk14d20weUxtc2FvajduQnNYYUlDckdSUjZhdndBOXQzSldjYjJM?=
 =?utf-8?B?dEJoMnlTbGpITVBKUzFtRDRyTnNsMy9EMzlUQ2hoeGlBYU1xMFZyYmQ3eUlS?=
 =?utf-8?B?am1LU3VyaVlIT1V5YlBOZmdsekttZDJSOS91RUw5U0hJZlY3UkJBRU9sUDdK?=
 =?utf-8?B?YkRDbFY2RFl3Q1F0MXBzeU4xL09FVzZkbTBuVFZpYk10K3ZDazRvRXhHdXJ5?=
 =?utf-8?B?UktpMGR3U1hOeTU4ay9iWGlOY2NVVVdFTXJHL1g4ZFRoT3R3ZlhsTHhJa2R6?=
 =?utf-8?B?Y0VTV3ljcFp4a3dqL2FaRFNCSnFiUkNWdlZ0dHZwdytDTnhTVlRxYWhSRFc1?=
 =?utf-8?B?dXIyWXhRcXgrZTYzUjBNOWQwSmpLbDdodGg5SmIvN014aWhiZEFvUi95QVNy?=
 =?utf-8?B?Y2RBL0ljWlJZTW5ZWGVlVy9DMFIzVVQ3MGdDZkJzZlZzZjVCMWJOY1l3V2wy?=
 =?utf-8?B?dERlQUdUWWZBQ2Nxek42R2l1VjRoUXl1aFMyN1N0ai9FdEwwc0ltTXB4aHNm?=
 =?utf-8?B?aFZ1TFY0WEN2MzhRQTUrb3p6bUNvWlpiMTRiYUJoZll1SzBkZHR0UVRtUHp5?=
 =?utf-8?B?RlZhbDR2NStKTEZrQkptN2Rub1R3OE9HRUNqQkZhUmNEaHBrZDAwN0xLQW9J?=
 =?utf-8?B?bTdZYmxLRkJJb2EvUXNTdU8wT21TZXFBZGFQaTcwWWlydDJrZGVLRjlVSTZs?=
 =?utf-8?B?SE5JY082aCt1bWxyNmJiNU56ZjZiUU9uZVFvSnM0WHg3amNoMXhaSExYeEdv?=
 =?utf-8?Q?8YFg=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e9abd480-f09c-48fa-bd98-08dd1425ee78
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 05:38:50.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vys+AmDKkAIfAM5mkbFqQHJKtCPNz2jAyIzqVeI9ExllTqRrqx/xgLfGCN4Cd2zYG1MooEmxoeC1KzpT16+HSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1829
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nVa5FTKP3q_gzhIG7tVdVl7LVaqej4EZ0jSGo13Rfl8_1733290732
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgVGVycnksDQoNCklmIG9ubHkgVVNCLWF1ZGlvIHBhdGNoIGlzIGFwcGxpZWQsIHRoZSBzaXR1
YXRpb24gb2YgbXV0ZSBrZXkgaXMgbm90IHdvcnNlIHRoYW4gdGhlIGN1cnJlbnQsIGF0IGxlYXN0
LCB2b2x1bWUgYWRqdXN0bWVudCBpc3N1ZSBjYW4gYmUgZml4ZWQuIFNvIGl0IHNob3VsZCBiZSBP
SyB0byBhcHBseSBVU0IgYXVkaW8gcGF0Y2ggZmlyc3QuDQoNClJlZ2FyZHMNCldhZGUNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRlcnJ5IEp1bmdlIDxsaW51eGhpZEBjb3Nt
aWNnaXptb3N5c3RlbXMuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgNCwgMjAyNCAx
OjI0IFBNDQpUbzogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KQ2M6IEppcmkgS29zaW5h
IDxqaWtvc0BrZXJuZWwub3JnPjsgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNvbT47IFdhbmcs
IFdhZGUgPHdhZGUud2FuZ0BocC5jb20+OyBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2Vy
bmVsLm9yZz47IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+OyBsaW51eC1pbnB1dEB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6
IFtQQVRDSCAwLzJdIEludHJvZHVjZSBQb2x5L1BsYW50cm9uaWNzIG11dGUgZXZlbnQgc3VwcG9y
dA0KDQpDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbA0KDQpPbiAxMi8yLzI0IDExOjMyIFBNLCBUYWth
c2hpIEl3YWkgd3JvdGU6DQo+IE9uIE1vbiwgMDIgRGVjIDIwMjQgMjM6MzU6NTEgKzAxMDAsDQo+
IFRlcnJ5IEp1bmdlIHdyb3RlOg0KPj4NCj4+IE9uIDExLzI1LzI0IDEyOjU1IEFNLCBUYWthc2hp
IEl3YWkgd3JvdGU6DQo+Pj4gT24gU3VuLCAyNCBOb3YgMjAyNCAyMTozMjozOSArMDEwMCwNCj4+
PiBUZXJyeSBKdW5nZSB3cm90ZToNCj4+Pj4NCj4+Pj4gSGkgSmlyaSBhbmQgVGFrYXNoaSwNCj4+
Pj4NCj4+Pj4gSSdtIG5vdCBzdXJlIGhvdyBpdCB3b3JrcyB3aXRoIHR3byBkaWZmZXJlbnQgbWFp
bnRhaW5lZCB0cmVlcw0KPj4+PiBidXQgdGhpcyBwYXRjaCBzZXQgbmVlZHMgdG8gYmUgYXBwbGll
ZCBhbmQgZmxvdyB1cHN0cmVhbSB0b2dldGhlci4NCj4+Pj4NCj4+Pj4gSWYgdGhlIEhJRCBwYXRj
aCBpcyBhcHBsaWVkIHdpdGhvdXQgdGhlIEFMU0EgcGF0Y2ggdGhlbiBtdXRlIHN5bmMNCj4+Pj4g
aXNzdWVzIHdpbGwgb2NjdXIgd2l0aCBtdWx0aXBsZSBQb2x5L1BsYW50cm9uaWNzIHByb2R1Y3Qg
ZmFtaWxpZXMuDQo+Pj4NCj4+PiBCb3RoIHBhdGNoZXMgY2FuIGJlIGFwcGxpZWQgaW5kaXZpZHVh
bGx5LCBhbmQgZXZlbiBpZiBvbmx5IG9uZSBvZiB0aGVtDQo+Pj4gaXMgYXBwbGllZCwgaXQgd29u
J3QgaHVydC4gIFNvIEkgZ3Vlc3MgYm90aCBzdWJzeXN0ZW1zIGNhbiB0YWtlIHRoZQ0KPj4+IGNv
cnJlc3BvbmRpbmcgb25lIGF0IGFueSB0aW1lLg0KPj4+DQo+Pg0KPj4gSGkgVGFrYXNoaSwNCj4+
DQo+PiBJJ3ZlIHRlc3RlZCBvdXQgdGhlIGJlaGF2aW9yIHdpdGggZWFjaCBwYXRjaCBpbmRpdmlk
dWFsbHkgYXBwbGllZCBhbmQNCj4+IGhhdmUgZm91bmQgdGhhdCwgSU1ITywgdGhlIG11dGUgZnVu
Y3Rpb25hbGl0eSBhbmQgc3luY2hyb25pemF0aW9uIGlzDQo+PiB3b3JzZSB0aGFuIHRoZSBjdXJy
ZW50IGJlaGF2aW9yIHdpdGggbmVpdGhlciBwYXRjaC4gSG93ZXZlciwgd2l0aCBib3RoDQo+PiBw
YXRjaGVzIGFwcGxpZWQgdGhlIG1peGVyIFVJIG1pY3JvcGhvbmUgbXV0ZSBjb250cm9sIGFuZCB0
aGUgaGVhZHNldA0KPj4gbXV0ZSBidXR0b24gYXJlIGZ1bGx5IHN5bmNocm9uaXplZC4NCj4NCj4g
VGhhdCdzIG9kZC4gIEhvdyBjYW4gaXQgd29yc2VuPyAgQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCBm
cm9tIHRoZSBwYXRjaA0KPiBkZXNjcmlwdGlvbnMsIHRoZSBVU0ItYXVkaW8gcGF0Y2ggY29ycmVj
dHMgb25seSB0aGUgbWl4ZXIgdm9sdW1lDQo+IGNvbnRyb2wgbmFtZXMsIHdoaWxlIHRoZSBISUQg
cGF0Y2ggY2hhbmdlcyB0aGUgcXVpcmsgdG8gYmUgZ2VuZXJhbGl6ZWQNCj4gKHRvIGJlIGRyb3Bw
ZWQgdGhlIG5leHQga2V5IGluIGEgc2hvcnQgcGVyaW9kKS4gIElmIG9ubHkgVVNCIGF1ZGlvDQo+
IHBhdGNoIGlzIGFwcGxpZWQsIGl0IGRvZXNuJ3QgbWF0dGVyIGFzIHRoZSB2b2x1bWUgYmluZGlu
ZyBkaWRuJ3QNCj4gaGFwcGVuIGJlZm9yZSB0aGUgcGF0Y2guICBPVE9ILCBkaXR0bywgaWYgb25s
eSBISUQgcGF0Y2ggaXMgYXBwbGllZC4NCj4gQW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQoN
ClRoZSBVU0ItYXVkaW8gcGF0Y2ggYWxzbyBjb3JyZWN0cyB0aGUgbmFtZXMgZm9yIHRoZSBtaXhl
ciBzd2l0Y2ggY29udHJvbHMuDQpUaGUgSElEIHBhdGNoIGFsc28gYWRkcyBtYXBwaW5nIG9mIHRo
ZSBtdXRlIGJ1dHRvbiB0byB0aGUgS0VZX01JQ01VVEUgZXZlbnQuDQpJdCdzIG5vdCB0aGUgcGxh
eWJhY2sgdm9sdW1lIGhhbmRsaW5nIHRoYXQgZ2V0cyB3b3JzZSwgaXQncyB0aGUgY2FwdHVyZQ0K
c3dpdGNoIGhhbmRsaW5nIHRoYXQgZ2V0cyB3b3JzZS4NCg0KVGhlIFVTQi1hdWRpbyBwYXRjaCBh
bGxvd3MgdGhlIG1peGVyIHRvIGJpbmQgdG8gdGhlIGhlYWRzZXQncyBtdXRlIGNvbnRyb2wgaW4N
CnRoZSBmZWF0dXJlIHVuaXQgYW5kIG11dGUvdW4tbXV0ZSB0aGUgaGVhZHNldCBtaWNyb3Bob25l
IHdoaWxlIHRoZSBISUQgcGF0Y2gNCmFsbG93cyB0aGUgaGVhZHNldCB0byByZXF1ZXN0IHRoZSBt
aXhlciB0byB0b2dnbGUgdGhlIG1pY3JvcGhvbmUgbXV0ZSBzdGF0ZS4NCg0KQm90aCBwYXRjaGVz
IGFyZSBuZWVkZWQgZm9yIG1pY3JvcGhvbmUgbXV0ZSBzeW5jaHJvbml6YXRpb24gdG8gd29yay4N
Cg0KdGhhbmtzLA0KDQpUZXJyeQ0KDQo+DQo+PiBUaGVyZSBtdXN0IGJlIGEgd2F5IHRoYXQgYm90
aCBwYXRjaGVzIGNhbiBiZSB0aWVkIHRvZ2V0aGVyIGFuZCBiZQ0KPj4gYXBwbGllZCBzaW11bHRh
bmVvdXNseS4NCj4+DQo+PiBJZiBpdCB3b3VsZCBoZWxwLCBhbmQgYmUgYWxsb3dlZCwgSSBjYW4g
c3VibWl0IGEgc2luZ2xlIHBhdGNoIHRoYXQNCj4+IGNvbnRhaW5zIGJvdGggY2hhbmdlcy4NCj4N
Cj4gQXBwbHlpbmcgYm90aCBmcm9tIHRoZSBzaW5nbGUgdHJlZSBpcyBwb3NzaWJsZSwgc3VyZS4g
IE9uZSBvZiB0d28NCj4gbmVlZHMgYW4gYWNrIGZyb20gdGhlIHN1YnN5c3RlbSBtYWludGFpbmVy
cy4NCj4NCj4NCj4gdGhhbmtzLA0KPg0KPiBUYWthc2hpDQo+DQo+Pg0KPj4gVGhhbmtzLA0KPj4g
VGVycnkNCj4+DQo+Pj4NCj4+PiB0aGFua3MsDQo+Pj4NCj4+PiBUYWthc2hpDQo+Pj4NCj4+Pj4N
Cj4+Pj4gVGhpcyBwYXRjaCBzZXQgd2FzIHRlc3RlZCBieSBXYWRlIGFuZCBteXNlbGYgd2l0aCBt
dWx0aXBsZQ0KPj4+PiBQb2x5L1BsYW50cm9uaWNzIHByb2R1Y3QgZmFtaWx5IGhlYWRzZXRzLg0K
Pj4+Pg0KPj4+PiBIaSBXYWRlLA0KPj4+Pg0KPj4+PiBQbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCB5
b3VyIFNpZ25lZC1vZmYtYnk6IGFuZC9vciBUZXN0ZWQtYnk6IHRhZ3MsDQo+Pj4+IGFzIHlvdSBz
ZWUgZml0Lg0KPj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+IFRlcnJ5DQo+Pj4+DQo+Pj4+IFRlcnJ5
IEp1bmdlICgyKToNCj4+Pj4gICBISUQ6IGhpZC1wbGFudHJvbmljczogQWRkIG1pYyBtdXRlIG1h
cHBpbmcgYW5kIGdlbmVyYWxpemUgcXVpcmtzDQo+Pj4+ICAgQUxTQTogdXNiLWF1ZGlvOiBBZGQg
cXVpcmsgZm9yIFBsYW50cm9uaWNzIGhlYWRzZXRzIHRvIGZpeCBjb250cm9sDQo+Pj4+ICAgICBu
YW1lcw0KPj4+Pg0KPj4+PiAgZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMgfCAxMzUgKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+PiAgc291bmQvdXNiL21peGVyX3F1
aXJrcy5jICAgICAgfCAgMzUgKysrKysrKysrDQo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMCBp
bnNlcnRpb25zKCspLCA3MCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4NCj4+Pj4gYmFzZS1jb21t
aXQ6IDI4ZWI3NWUxNzhkMzg5ZDMyNWYxNjY2ZTQyMmJjMTNiYmJiOTgwNGMNCj4+Pj4gLS0NCj4+
Pj4gMi40My4wDQo+Pj4+DQo+Pg0KDQo=


