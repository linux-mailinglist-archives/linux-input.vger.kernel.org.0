Return-Path: <linux-input+bounces-9396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FEA1654F
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 03:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A76A164E1E
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 02:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7F32940B;
	Mon, 20 Jan 2025 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="kbetJWlF"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6D1DDF5
	for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 02:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737339599; cv=none; b=GaUXe5OPLYTRcAh2Z9znkC0sz0RqObRjqFxX12urADx1K2LE3cy0FkS7P9qBlzWv3syNJEUAVP6V3rBD6e8aupSVF9c0f6yzdQ2qdk0o5a3iJ62dZifKQZ7BOiYY6w1PmquTxI4CEWSaqRoWKzJfJAFQJZ+wb3NqjjrOyd/woCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737339599; c=relaxed/simple;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=fHi/Lj6tUtzMdONi9WAiflwGZqb8Knl9/309Zix90E5ZMgMNpz+H7QK54pNJushMioc3+XVVV6sR7H/CZsybQ2qwpu1Axuv1GuiIdoYcjj/ipgpocB15iOPj1vgKOOTIDDb3BLMHWLJycPocqCMfOAhsw6SBGcwmQTUhmiGToig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=kbetJWlF; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1737339596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	b=kbetJWlFZy6zchZCPsgzdbdmO18658dUJHVeaLXRNpR3s0MNZN5DFaCmK4kiQdeTuyo+1H
	ugUdGJJYfYzyR5pRafLk6mTZyTn7Bi3p+F+mfSs6d4IuutY2IsQY9lfqYn+mWFZT71e/au
	Cc4Rl/EelX5nicUuwcjz5G7+tqIuoQw=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-k56tXiHLNl2srgPgYexdSg-1; Sun,
 19 Jan 2025 21:19:55 -0500
X-MC-Unique: k56tXiHLNl2srgPgYexdSg-1
X-Mimecast-MFC-AGG-ID: k56tXiHLNl2srgPgYexdSg
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by MW5PR84MB1426.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Mon, 20 Jan
 2025 02:19:52 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 02:19:52 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Jiri Kosina
	<jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] HID: hid-plantronics: Add mic mute mapping and
 generalize quirks
Thread-Topic: [PATCH v4 1/2] HID: hid-plantronics: Add mic mute mapping and
 generalize quirks
Thread-Index: AQHbaUQp1RcHcoarl0KoluJK+DZ9m7Me8OWg
Date: Mon, 20 Jan 2025 02:19:52 +0000
Message-ID: <EA2PR84MB37805CE32018CF83B1D9B5C48BE72@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
 <20250118005841.6618-2-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20250118005841.6618-2-linuxhid@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|MW5PR84MB1426:EE_
x-ms-office365-filtering-correlation-id: 279e6e95-b725-4984-9fa0-08dd38f8ec6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?f1PDC7Nn6xNs9nVGhKTyh9QBFkCfkGCeEM0HTHGgdBRcIcofb8tO06hHUUOQ?=
 =?us-ascii?Q?JVOewcm5jR9szz/0WXmlkzXcvA1HMwSrBQEneoSdxFh0gmpldaiQnuSmmYge?=
 =?us-ascii?Q?iHS4Vv0P36XOvIjUUjCuchGYrBIMVWvAElNhRJRUNHOFnAFqdp1eOhEtKkLM?=
 =?us-ascii?Q?e7bwI9zGjZBoO0xSLTloB3o0TJXp7nQxGTdln5yBWgKvwv7GPHdFNORbsIL8?=
 =?us-ascii?Q?F8ikmG9N3fDQ9XPJIi75jaWLuhbaoAIhOZh8fDND5Nx+TVi8+DLwc+Fhq3rm?=
 =?us-ascii?Q?Lwjmn/8+8Cz0paORK2Nki6NRTszxlWbCucVMzPReq7w95+t93mk84K+D/Pgu?=
 =?us-ascii?Q?shX/9YTreFKpD9qZSPG9TtSPWxpzuRRpXhO+bFaYao0H3gQBzQTRJU7O5JB/?=
 =?us-ascii?Q?mGmKmNFVQKEWW0ZsVo7jzoW08E6rvSNWJdq6QVIjYj42SMQlvvl4fg9ozfFA?=
 =?us-ascii?Q?u5jtQ0uhG/M67rcLtADMV+STxqr4p1fE8rEeDQjUgUrDdz/t095rxwy5SwBj?=
 =?us-ascii?Q?woeJGHiD+/NwFZwbICr2uFtauaZ9W96+5xPEgWXxqXWcohrI9KFCFLkov88m?=
 =?us-ascii?Q?iiMPePfwIMePyoyEovRxGrGpCwVB3twzbgsc0X2+Abkp+Ws5/kbtmP4w4imU?=
 =?us-ascii?Q?OrbOKtkJxsxiMJ7P8V4T029nwc5vXJY0QhhCdvlasff05FXFYzNop1EW/E93?=
 =?us-ascii?Q?s0JRS/HatGyh5b0h/vdsjYVc+KztyPuJdY/DHMcJAwTl5i/vR1efIdtMwnOz?=
 =?us-ascii?Q?Z7GSMNe29hSCc6zcK/rlFRZIjLap80Oe4vq2vHoP9jQRZWMIprDW7l1wEM4Q?=
 =?us-ascii?Q?rJ7le5pifrXytXHJlWg3qUTRW0BzCKB6Oygm9EPP22Pj6mcvSxVNR/7ZJF64?=
 =?us-ascii?Q?7AWjgNKfmTEiQhBq8KjCIB5kF0ledYoC2iFSF+ancQRz9GtHuFCCG6g5ZJ8b?=
 =?us-ascii?Q?DZAORLvCiWFF0V5jIYZNH4hmek4UzPh30smRwaHLoKddbKpsibI/cqj+x00w?=
 =?us-ascii?Q?XZcmWaScRpiCGPfcQlIVGs2743dILZZhQyK7nFgcS5yC2sGmq/a+oKmlpYjw?=
 =?us-ascii?Q?2CGh3He91LUgZXmyQtjTgKZTa/N7HqkzeLHdm01Xa9njFtisElkF3tpcXf/R?=
 =?us-ascii?Q?rYbSTAigjxWfPtHL3pEH1ErBE7FhmDEb2FZHLkmwUOh8uQGSebPxwzIbLwuP?=
 =?us-ascii?Q?ohGgm45yz+QtlJCDVqwEiWA0xsoHcq3/3CVmyJn9HBVEF2SlP/DKplwa5FxH?=
 =?us-ascii?Q?l/7CGarIcygXk6Vw6ufgunyrHQrEX+b674wVqwTGMDs6Uvj/7pEMbXumwBCK?=
 =?us-ascii?Q?besbqJQ7ST4G5Ot1CAZzDCGRdoUiWtCfBZkZL7G2A1deYzpYrSwdSonchgti?=
 =?us-ascii?Q?L/3jjkBqf/NzhCkZQqAVZCrispzy9VS0Su67oHPM5qT5+XJQ1ulnRIkwGhG3?=
 =?us-ascii?Q?QUjm9GtW67rc/SQ3esyXgVuAHyNT4F95?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?imFivenovxGyuq2sZx1KVXl53jX8VFI3XH+B2i1vYPCxuIXorFgejfypXghF?=
 =?us-ascii?Q?RINe/LroxqbG1hNFkUGWWiaLrC70NmgAcXDl6pcarxSHpdfWhQeQiRHCqdlY?=
 =?us-ascii?Q?6soDM1hz6Cko/dlFoBr8WmEngTjnTWbkIc6j9g42Iv9PDYOjGDH8y2B+yAzU?=
 =?us-ascii?Q?UGbQBRke9ZxPA7jkQYiDY5ZwgUsuEzTbj3Az+cUKoMOuSbBVQWIP9j/z3UsP?=
 =?us-ascii?Q?NaNz0N8qCyDGcaW5Vi1OHuddPRI4tj4ZlmfQZlz0/HLulfXpGQlnDxZozTAY?=
 =?us-ascii?Q?/hrN7cW2AfniimX80G5J2GHaPypLnKFdflamTaUCCqVv9N+jvt5CAkHbrQfs?=
 =?us-ascii?Q?DcGGVfFrqMw7OLUH6+qZIgR6hQTX2BtiEpo86/R6XHEwsezCRbEQoTGQdAIC?=
 =?us-ascii?Q?SrXiALVzB8mriJmNUr8YVC9eE6SWu2XIswPSkSG8sl9SvQdSELWpFbclAdiZ?=
 =?us-ascii?Q?1MsHZLshUmkqi8WA09IQ186OlfNwJ40ZwDUlOImlNBl/jkYa9UhmcrkK11qz?=
 =?us-ascii?Q?2ns7srTalvMkaQr+6qZRQ2o8IZjGzJeYYn2shkmJFc7zFTm7I9hy7zzNmGgF?=
 =?us-ascii?Q?ANd3t/BhgI9tWy8etNjqxVBTnmMiXzrIXMV7sVY7EK0YZ8SNMa0E9gVMSbXI?=
 =?us-ascii?Q?1nLW1mjnA9E8AwC1KYUoiy6R0aySzqj8GT6Ye57QyUY3fqqyaIelmUyAFnWw?=
 =?us-ascii?Q?2Q/XvlDOEtcw/zdxf7zV6QbTUNcNRtltWcfF1zpPu4zA0Q6uXIGsrufXemSe?=
 =?us-ascii?Q?RdEdrVa93UhEV2/jaGok94frxyhS1F0If0RiGiThMUVFGoHCvnwxJNW5pQWd?=
 =?us-ascii?Q?P9nYR8gvzjVjLN3kXafaAwrYaD1CZlZm5ULAlfuXgeV45vuxWgjmSgQv5/gC?=
 =?us-ascii?Q?rWRlOtoflNbLyFTIsejU0tUL9ZR9jdSxrKP2vsa35x184Q8PbP3ukGB4TcsB?=
 =?us-ascii?Q?SVtlG28q6iRKIzQBuuNcx/LmO3viCV6jcE0XgVNRKzQMTzZvs76a0jx5hFfT?=
 =?us-ascii?Q?i2jlpCa6d3htx2QYJGB7J4pZAMOhPHQAIDGV5hX8OHtjPxWc80a7YCHEs+j0?=
 =?us-ascii?Q?NV1wbycqMj3U5TlZgBIBdeCfCjZLaGUgkpvp2nQ2huPKPPcJ3qYF9jnzef+r?=
 =?us-ascii?Q?EIqL0uCvODvRy0SIco3FpuVOn+zmHBF6jtisPXFwStjJj8XVl8PYskh/1EQl?=
 =?us-ascii?Q?qkA6dkzdXftf5NypmA2SAE8INpGIIy4EqK0odWoTeoWKlVPErTWTh5gjmJWV?=
 =?us-ascii?Q?wYfQTbwV0xDoAyQhctMTWscqYUM6It0X+FahsX8ccquzf4qjQyhaFyEJlGeY?=
 =?us-ascii?Q?0OQWR5Sr6hdm/7zNMfMWXarfmM5KonitWImFUuhUuabOoC8sRXhjBkDBicQy?=
 =?us-ascii?Q?uCys38/J9nyi621GMNqzoMEZIc3LHV7hG1VN3P4zagaYAwBdFXGIJICFIMcV?=
 =?us-ascii?Q?75aCulTjhoXtfIdD7SJy+ECYCnDdeD9WuRiCQIYLWs61tr+Epco8zI6I8opm?=
 =?us-ascii?Q?Iz+3Wj3d5AmKCnfFeWYpYZdCl6ADprh5NqxXS0BF7APFcZwF5ApPFHwKRx/t?=
 =?us-ascii?Q?FRf4J1VWthmkhwAH8Fs=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 279e6e95-b725-4984-9fa0-08dd38f8ec6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 02:19:52.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0pvUSv+nzkeQc75mDS1zXt3EpT4HVaf1TXv5cmpb8/3+p/AhyF65MSiq7crf6kZeq9YF4RPYqDn8HcDp7fkjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1426
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AoKT9WQ5FC9oy3QOIgrgxnQj20nGHfW4SeFcqgrSzYc_1737339593
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Wade Wang <wade.wang@hp.com>


