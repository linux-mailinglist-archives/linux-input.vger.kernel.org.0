Return-Path: <linux-input+bounces-7383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D967B99CAFD
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 15:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690011F22C3B
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 13:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA001AA78D;
	Mon, 14 Oct 2024 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="EjuW44jH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C31AA783
	for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911244; cv=none; b=cqoa+JTyhaHqFkmxFUrAHwKCjv6dsxqiMAPQ4OAh0UQ7IOIb+u9y21F67r4gJz10fejw9KWsUFEjfEBILwVgqUIFWEX/kxkwkPtzdtyBWX0Vf3GsOnz0/0i6xU0m70/gCzgUO3+E3dYF2TKNYiWhE1nydnF22Fj6c0D0zm4Z6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911244; c=relaxed/simple;
	bh=I952XMmvN4KOgGNwbhiCfktKvjyMcNYT9lvkdZDTmBU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=JyLBmOOZTHtquf+XTGwm7ilprHqUDnb8KjYkfXM2KcWmaSvC4uxAxkBGM2qPvchgdJCKfAboer/cnIyzm/c/R+QSkOHqt/RRp1NHKAEySIQ7dFvHS+SdKaFF1ofwCpAUCYqZMC0IdFPiEFF092hq+8238xPmSl8VYunGwF3zcCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=EjuW44jH; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1728911241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I952XMmvN4KOgGNwbhiCfktKvjyMcNYT9lvkdZDTmBU=;
	b=EjuW44jHNxGV01E3A93yx5oMfL+NPmbXSRUMuLmyRBet502zogfAy6u4PP18wstkxmRes/
	IdKLk+F7r/jvdSrbIgOZM9HyqpLFjHY886QrBLvBPlCA8Rxk1Mrue0LA2nQ/ovk+I/v9Ch
	B7w1oye5CsN/w7BP990oLnpByyRdlZ4=
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-99GQUxZpOqu_7wbBvgZnWw-1; Mon, 14 Oct 2024 09:07:20 -0400
X-MC-Unique: 99GQUxZpOqu_7wbBvgZnWw-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by LV3PR84MB3792.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 13:07:15 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 13:07:15 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Topic: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Index: AQHbHfQ29Dkypdc46Ee3Lvn3svQLg7KGN88Q
Date: Mon, 14 Oct 2024 13:07:15 +0000
Message-ID: <EA2PR84MB3780C21ADFFF33B1576CCDA78B442@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
 <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378082C6FA58AA25258DC74B8B682@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <bc92e409-cebe-4da1-a225-c48915c5dcba@cosmicgizmosystems.com>
 <EA2PR84MB37807C9F2191AFE41F9372328B6A2@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <EA2PR84MB378022DD0D3D06901404BEDB8B792@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
 <234020be-e030-4271-9cc1-a1f6d04eeeed@cosmicgizmosystems.com>
In-Reply-To: <234020be-e030-4271-9cc1-a1f6d04eeeed@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|LV3PR84MB3792:EE_
x-ms-office365-filtering-correlation-id: ac97a21e-76a4-41c4-45a8-08dcec51203a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018
x-microsoft-antispam-message-info: =?utf-8?B?UTFJblBqdEpiSnNQMFJZK2Ixc2VEZkc1K1BHd0Vucjd6V2pGNXFVZmU1WHl5?=
 =?utf-8?B?ZVhvU3JJWVd3Y0diYk5ndk5hbE1LbkRONmV6U05hZGxMV0t4Ukp5UkJ1Nncz?=
 =?utf-8?B?VDZUdHV6RmdWU2JpV21aVlh6UXVrMEZsbWFTL0FxTTBZeWpBc3dtR1lSenVs?=
 =?utf-8?B?blNjeWl4cjNTM0xJNEM1ZTVZZWJRYjdkbnpqYTRPSWdtZnJjUW56TFVZM0o1?=
 =?utf-8?B?Y3d0M2ZWeEdYMUF2dTJFV294OEhZbWVZT3g4RXFHalAwWlB4Z0YyMUE0MER0?=
 =?utf-8?B?UDlwNnVzbWJzRkIySWt4a1BXOXlIWTZkQWMyK3NVL1U2MFhSNEN1WFlpUDZi?=
 =?utf-8?B?U29udUJDa0JoQ0RsdU9uVU4xZSsvZk1RMWZ4SDdXeDhJUSt1RnFqNTN4ZWJl?=
 =?utf-8?B?OGhMU1hIbkxmNnlkNUJPWHBqWWJvMkxoRmtCNlJwQXZ2VXVsdmorVnczZitX?=
 =?utf-8?B?VjNBSkNLSERWbFQ5MGIxN2QwbHJsZ2doM2dXaUtOSEM1NDZ5QjhKSWNxY3lQ?=
 =?utf-8?B?VEJjWVoreTZMaEUremgzWDB2NjdUMmM5eVh5aGVkTUpJK0c3WElHTDl0bmhI?=
 =?utf-8?B?N05pcmQweUNKeUlpVlY2cWx6WnQ5NCtvRkNuRWJwTXM1LzNyMGR4MVNnWnJX?=
 =?utf-8?B?cjR6c2FKMDVsdXFKNmxYYjFqTkRrUHdEWUpkSWx5dXE0ZE5FcVdGc2VPd2dB?=
 =?utf-8?B?Y2xnMmhLakxYTFdITzQvTTNCUXRnWW5INHBWeFhyUUhmNTFYa2tsRVk4a3ZY?=
 =?utf-8?B?c25pRVRNR3J0R1RWT3pOeGIwcWV6cW93QjZwK09wRnZqWitpZXRpVFZvcWxB?=
 =?utf-8?B?d1VYZGNKSlVFS0F2NXJGUHlkSFpPK0JzS0pMb3Y0Um9yVVpzQ0FXSFZ5OTA4?=
 =?utf-8?B?S0JTNUs1VnRNeE9HaElrVGM4SSs1NHA4WG1PZ1h4SFpZd2lHSVJXOVhMUmhK?=
 =?utf-8?B?bFdtK09MMGl5UlM3SythUVhablBJZWI0ZU5ERTFnVXBHZTU5cHNEVjlIckhO?=
 =?utf-8?B?UzUxcjExSW1jSDJwV09xNytwQWo3TDJ3NmU5T0Nha2JMRE1iOEJSbHhOYU1s?=
 =?utf-8?B?cW9KNEd5TTBHNkRGeDcrTnB1M1hUakczZ0w5ZkFKWmpSbnoxYTViRWpGYld4?=
 =?utf-8?B?WWNZNjZua1k1YTU2UTl3WVJzeW1KVmE5Y2pmOFo2NlpIenpHSDJHQmJiLzhX?=
 =?utf-8?B?MHdNdGloYThSQ2M5b0dKa0lkRnBCekZJMWZDNDIrSmYzNzV5TDNpdWtDdWVl?=
 =?utf-8?B?WGRBaWUyaWdJNmFQckdYZzVVNGhCNjROLzJaZ2I1SGFDSmhON3JUbElPT2pD?=
 =?utf-8?B?L0swLzZoQVNOV1dJbzZycEdxRkdIT3ZyRENmS3Y1S0FJWUo0YUNvZGxSbmc1?=
 =?utf-8?B?RDV4WSswd0lzRFpTdkQwblVNenlJQ3lCNWhFZHhqcnVVVk4wWmVFbWhzWEtE?=
 =?utf-8?B?Wk1jeUpXOWtjWVlMWjdNRm5kSWlOcVlSME81eTJCbXFOeHJTSThaM3ZTbHV1?=
 =?utf-8?B?TEJ4VVFqNWNTQ2wybUZWUnd4UitDclBsRW1JcHJvdjBzWDdyeURLWXJKUzNO?=
 =?utf-8?B?ZFVZQlV6QW1Yb0NoSTRyWm5rUlBMclVHRElzMXQ2VElvZzRidnNjQXM5ZEVW?=
 =?utf-8?B?ek5yK3BkTGhRYVg0bER5Ly9zcU1rNzNIekdxNHlFV0hwMHcweElnZjA4aEJk?=
 =?utf-8?B?d3FPY29nNlo5N21raEY1bnRGYzFOMTM3d2ZVOGZnbnQwSkZIcFhUdjc4bkw2?=
 =?utf-8?B?VEhtcERPK1JqY3NpSVZNOXNQb0xvNG9vYXdpbkZOaE9oaDBHR1ZmQzZ4aXdN?=
 =?utf-8?B?TmMyS3hsZ3luaVd2ZWlxUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1YzU2xyUHVMaU5BZmc3TnRhaFNLeC9HVFRHMWhNcVE5NDBlUTZpdzlmT1BW?=
 =?utf-8?B?SGlhTm53bEtnUUhTdDhvdncvcTZKOVo0WStsMCt0S1pHM1JGaHJrbUNBdjVM?=
 =?utf-8?B?eEl6Rlc0aE5YV3ZHTjdVbi9LcHhTdStTNmNzS1lFcGVUZXI3RHA3THFYbjBV?=
 =?utf-8?B?RGJuRlUxNVpqSjdUcW5NZjJjS0hSaTdiUjk0MGsxYVhRWGtMaUlzYURNUDVG?=
 =?utf-8?B?Nm5WQXIzSGZNQytpQkJERm5wVFVGRWlLd1M0a0JmZ2NzL3pSSS9lS1hQVlhQ?=
 =?utf-8?B?NlBTTTlyTkJBTmFCZnR3NXIxbDhEZEVPUTRubUR4Z1dRWWVYQWNqbDFQWDRx?=
 =?utf-8?B?b3FMTXVSdGIyRXFZaDd1ZWpVMzZxNDUvWi9BV3daaVNKK0M3dnBMY0Iwdmcw?=
 =?utf-8?B?WmQ4aDZCUTM0a0d0eHlzN3hvN3hKVk5GL2xkZ21uakhXeFRFUEhOSXVxZWEz?=
 =?utf-8?B?K3NoM0IyU0o5QytRZ0UrV2M1d0Z6NDhJUEl4RzA1RXIwd2RqMkZFd2s4dEd1?=
 =?utf-8?B?STd4VDhkSVI4YmRUMXIwWnMyNUVaUmhpNFZtU2paVEN2eERVZFdyNVZMZmNn?=
 =?utf-8?B?emI4M2VYekc2dm9mam05dVhMNzk1WmhnVmszenpTbSszU3huQWszcndSbzJM?=
 =?utf-8?B?ZzdGb1FqVDB4ekNyNVNNTEE4SGJqVzZ3SWUyQ29xRUZHVi8wK1hyd09NcHdM?=
 =?utf-8?B?L0E1Zlo0dk9uazNJUWphc21wRFBsS21OUFY5WTUraEdWZkFIZklOdnE3SkFt?=
 =?utf-8?B?R2R0Tm15b3lqY0hGY3duSUxmTkovM0RzK2RQeDVvL3E2ang5OUdaY25HK0w3?=
 =?utf-8?B?T3Bzd2g0T0x4MWh0dFRFVU5VRnRtZWdMa3dudGdDOThxWFRWb2RsY2ZYYUsw?=
 =?utf-8?B?ZC9sTFBxa2djYjdjZ3l6SVNnZUFLcEQ1N1NkeHNVUHpRZGRMd2RjZDRqM3Vq?=
 =?utf-8?B?RTl1SFJrMjdMSHN6OVEvb1BVS2xGVG1Bd2ErWVljVzU4T1RrZVd5RkV5YmdS?=
 =?utf-8?B?eUsvQjY5b1IvUW9VSzZrUEoyZDdaMXpJb0FZOUtYVGFFTUZ4WGo0N1NQVUdz?=
 =?utf-8?B?ODR6Wjc0eEg4c2Y4YXlEYlVhZTVWZHJGTGxrQ1BHRjRUUklJODRXTUxSV1Rv?=
 =?utf-8?B?Mm9mTDdhYk9HWEcwenZmYW51WGlXZFFUZWw3TXlwUGtCQ1R1aDJ6N3dCa2w0?=
 =?utf-8?B?Z1VRNkE5N29hNXUrVjZoSWpSaXA4aWNWbExCdktON0RDTHhIVy9DV0ZZVGtw?=
 =?utf-8?B?ZjhFWW9zVVpFTjkwZE41UTZoeTVFQUNvK3VqYXorRHQrY2VHT0VncjJFbmRn?=
 =?utf-8?B?OWx0bmxMa1VpQlFXd3RZR25yMENxVm5JVkhLY3FuK0ZzemhLU2RHSkdVOTQ2?=
 =?utf-8?B?ajNYNllLOExPcWwvNndINkZIYWUwdEExZ0FadktDU3pqbldsSUdNOXVTeXJr?=
 =?utf-8?B?aU5uT1RMVlIyK2lyeGg1VUs2b3RzM3ZxZy9odDBYM2hFWjluSUJKYWJ3Qzcx?=
 =?utf-8?B?cDVVWmtSenZwdlVIR3Z5V2pTUStlQWowWXpucUNoQVhKWXFsVzVQSmVYU3JS?=
 =?utf-8?B?RU1RUUJrMUd3K0dreTAvSzY4QUZNTC9YU0hRTFlxMXM4b0NIcVQ2ZTFoVlhD?=
 =?utf-8?B?eERhRFlIbWNEazFDZG9icTdiODFzRzlWVTRZS1E4dlg4YTV5TFpIbndaaVJ1?=
 =?utf-8?B?eSs5RjROMXNuWlJHNTZPOEljN2toTU5VYU1CNGRvbW1ydVhKakl1SjI5cWNB?=
 =?utf-8?B?a3RyNXVKK2VZSnl1Qm84bGVSYkd6d3k3WlZyUmNyWmUzRWpJYXFQSkNadnF5?=
 =?utf-8?B?TUpxeTRTWEtJNFhreEJEOEVRVW9VVmhTMHZ4c2ovWXZYYlhCM2RLMmhkUENj?=
 =?utf-8?B?dDF5OFRpU3NYM1lFL21ON1RPd245V28yeGRCaWpLWEFiNjMrR3REYnZYLzkr?=
 =?utf-8?B?R1BUR1JWTDNTRVk5VmtKOXNrZFA0MEJlaXlYcEhKb3ZmeVlacjBBdVZZdk9a?=
 =?utf-8?B?Tzl4Tzd4ejJlQW9JUFJCckFEbFRVL2RIQVdKQVVFZEtPaVZ0MGErVWR5TEFl?=
 =?utf-8?B?a0d6UUFFZHNRT2pPdE5mUXc2b253MXBuemluSkFkdzZpQXViSmN1ak5PNHBH?=
 =?utf-8?Q?+wWk=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac97a21e-76a4-41c4-45a8-08dcec51203a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 13:07:15.6601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BfHuYinUoEMu8MYiEJJ64bEN4Jb8we0o8b9KBCwT1B5BvTFaT7begrjSl8iTa4559lTY+CPJ2znsRFRezzpkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR84MB3792
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgVGVycnksDQoNCkFmdGVyIGdldCB5b3VyIHBhdGNoZXMsIEkgd2lsbCB0cnkgaXQgYXQgbXkg
c2lkZS4gVGhhbmtzLg0KDQpSZWdhcmRzDQpXYWRlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBUZXJyeSBKdW5nZSA8bGludXhoaWRAY29zbWljZ2l6bW9zeXN0ZW1zLmNvbT4g
DQpTZW50OiBNb25kYXksIE9jdG9iZXIgMTQsIDIwMjQgMTI6NDggUE0NClRvOiBXYW5nLCBXYWRl
IDx3YWRlLndhbmdAaHAuY29tPjsgQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtlcm5lbC5v
cmc+DQpDYzogamlrb3NAa2VybmVsLm9yZzsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdlci5rZXJuZWwub3JnDQpTdWJq
ZWN0OiBSZTogW1BBVENIXSBISUQ6IHBsYW50cm9uaWNzOiBVcGRhdGUgdG8gbWFwIG1pY211dGUg
Y29udHJvbHMNCg0KQ0FVVElPTjogRXh0ZXJuYWwgRW1haWwNCg0KSGkgV2FkZSwNCg0KU2hvcnQg
YW5zd2VyIGlzIG5vLCBub3QgdW50aWwgc29tZSBmaXggaXMgcHV0IGludG8gdGhlIGtlcm5lbCBv
ciB1c2VyIHNwYWNlIHNvIHRoZSBtYWpvcml0eSBvZiBQbGFudHJvbmljcy9Qb2x5L0hQIGhlYWRz
ZXRzIGJpbmQgdG8gdGhlIG1peGVyIHNvIHRoZSBob3N0IGZlZWRzIGJhY2sgc2V0dGluZ3Mgb24g
dGhlIGF1ZGlvIGNvbnRyb2wgaW50ZXJmYWNlIGZvciB0aGUgdm9sdW1lIGxldmVsIGFuZCBtdXRl
IHN0YXRlLiBUaGUgcHJvYmxlbSBpcyBpbiB0aGUgbmFtZXMgdGhhdCB0aGUga2VybmVsIGNyZWF0
ZXMgZm9yIHRoZSB2YXJpb3VzIGNvbnRyb2xzLg0KDQpBZnRlciBhIGNvdXBsZSBvZiB3ZWVrcyB0
b3J0dXJlIGFuZCB0d28gZGF5cyB0byByZXBhaXIvcmVjb3ZlciBteSBzeXN0ZW0gYWZ0ZXIgZm9s
bG93aW5nIFVidW50dSdzIGluc3RydWN0aW9ucyBvbiBidWlsZGluZyBhbmQgaW5zdGFsbGluZyB0
aGUga2VybmVsLCBJIHdhcyBhYmxlIHRvIHRlc3QgdGhlIGJlaGF2aW9yIHdpdGggYSBtb2RpZmll
ZCBoaWQtcGxhbnRyb25pY3MgZHJpdmVyLiBJIHJlbW92ZWQgYWxsIHRoZSBxdWlya3MgdGhhdCBo
YXZlIGJlZW4gYWRkZWQgc2luY2UgSSByZXRpcmVkIGFuZCBqdXN0IGFkZGVkIGFsbG93aW5nIHRo
ZSB0ZWxlcGhvbnkgbXV0ZSBldmVudCB0byBiZSBtYXBwZWQgYnkgdGhlIGNvcmUuDQoNClRoZSBx
dWlya3MsIGJ5IHRoZSB3YXksIGFyZSBqdXN0IG1hc2tpbmcgdGhlIGFzIGRlc2lnbmVkIGJlaGF2
aW9yIG9mIHRoZSBoZWFkc2V0cy4gQm90aCB0aGUgcmVwZWF0ZWQgKnNhbWUqIHZvbHVtZSBldmVu
dCBhbmQgdGhlICpvcHBvc2l0ZSogdm9sdW1lIGV2ZW50IGNhbiBvY2N1ciBkZXBlbmRpbmcgb24g
ZmVlZGJhY2sgKG9yIGxhY2sgb2YgZmVlZGJhY2spIGZyb20gdGhlIGhvc3Qgb24gdGhlIGF1ZGlv
IGNvbnRyb2wgaW50ZXJmYWNlLiBCbGFtZSBXaW5kb3dzLi4uDQoNCkkgZG9uJ3QgaGF2ZSBtYW55
IGhlYWRzZXRzIGFyb3VuZCB0byB0ZXN0IHdpdGggYnV0IEknbGwgZGVzY3JpYmUgdGhlIG11dGUg
YmVoYXZpb3Igd2l0aCBhIERBODAuIEl0J3MgUElEIGlzIEFGMDEgYnV0IEkgd291bGQgZXhwZWN0
IGFsbCBBRnh4IGFuZCA0M3h4IFBJRCBkZXZpY2VzIHdvdWxkIGRvIHRoZSBzYW1lIGFzIHRoZSBj
b250cm9sIG5hbWVzIGFyZSB0aGUgc2FtZSBmb3IgYWxsLg0KDQoxLiBQbHVnIGluIHRoZSBoZWFk
c2V0Lg0KMi4gT3BlbiBVYnVudHUgU2V0dGluZ3MgbWVudSBhbmQgc2VsZWN0IFNvdW5kLg0KMy4g
U2VsZWN0IHRoZSBoZWFkc2V0IGFzIHRoZSBvdXRwdXQgYW5kIGlucHV0IGRldmljZXMuDQo0LiBN
dXRlIHRoZSBJbnB1dCBWb2x1bWUgYnkgY2xpY2tpbmcgb24gdGhlIG1pY3JvcGhvbmUgaWNvbi4N
CjUuIFN0YXJ0IHByZXNzaW5nIHRoZSBtdXRlIGJ1dHRvbiBvbiB0aGUgaGVhZHNldC4NCg0KTm90
ZSB0aGF0IHRoZSBtdXRlIHN0YXRlIGluIHRoZSBtaXhlciBpcyBub3cgb3V0IG9mIHN5bmNocm9u
aXphdGlvbiB3aXRoIHRoZSBoZWFkc2V0LiBFdmVyeSB0aW1lIHlvdSBwcmVzcyB0aGUgaGVhZHNl
dCBtdXRlIGJ1dHRvbiB0aGV5IGJvdGggdG9nZ2xlIHNvIG9uZSBvciB0aGUgb3RoZXIgaXMgYWx3
YXlzIG11dGVkIGFuZCB0aGUgbWljcm9waG9uZSBpcyB1c2VsZXNzLg0KDQpBbHNvLCBpZiB5b3Ug
dW5wbHVnIHRoZSBoZWFkc2V0IHdoZW4gdGhlIG1peGVyIGlzIG11dGVkIGJ1dCB0aGUgaGVhZHNl
dCBpcyB1bm11dGVkLCB3aGVuIHlvdSBwbHVnIGl0IGluIGFnYWluIHRoZSBtaXhlciBpcyBzdGls
bCBtdXRlZC4gU28gdGhlIG1pY3JvcGhvbmUgaXMgc3RpbGwgdXNlbGVzcy4gWW91IGhhdmUgdG8g
Z28gYmFjayB0byB0aGUgU291bmQgU2V0dGluZ3MgZGlhbG9nIGFuZCBzZXQgdGhlIG11dGUgdG8g
bWF0Y2ggdGhlIGhlYWRzZXQgc3RhdGUgdG8gcmVzeW5jaHJvbml6ZSB0aGVtLg0KDQpJIGFsc28g
dGVzdGVkIGEgQlQ2MDAgQmx1ZXRvb3RoIGRvbmdsZSB3aGljaCBiaW5kcyB0byB0aGUgbWl4ZXIg
dm9sdW1lIGFuZCBtdXRlIGNvbnRyb2xzLiBNdXRlIHN5bmNocm9uaXphdGlvbiB3b3JrcyBhcyBl
eHBlY3RlZC4NCg0KU28gYmVmb3JlIHdlIHVuY29yayB0aGUgdGVsZXBob255IG11dGUgZXZlbnQg
YW5kIGhvcGUgdXNlciBzcGFjZSB3aWxsIGZpeCBzb21ldGhpbmcgaW4gdGhlIGZ1dHVyZSwgbGV0
J3MgZml4IGl0IHNvIHRoZSBoZWFkc2V0cyBhbGwgYmluZCB0byB0aGUgbWl4ZXIgYW5kIHRoaW5n
cyBqdXN0IHdvcmsgYmVmb3JlIHdlIHB1bGwgdGhlIGNvcmsuIFRoZSBpc3N1ZSBpcyBpbiB0aGUg
bmFtZXMuLi4NCg0KT2YgdGhlIGhlYWRzZXRzIEkgaGF2ZSB0aGVzZSBhcmUgdGhlIG5hbWVzIHRo
YXQgZG9uJ3QgYmluZC4NCg0KQ29udHJvbDogbmFtZT0iSGVhZHNldCBFYXJwaG9uZSBQbGF5YmFj
ayBWb2x1bWUiDQpDb250cm9sOiBuYW1lPSJIZWFkc2V0IE1pY3JvcGhvbmUgQ2FwdHVyZSBTd2l0
Y2giDQpDb250cm9sOiBuYW1lPSJSZWNlaXZlIFBsYXliYWNrIFZvbHVtZSINCkNvbnRyb2w6IG5h
bWU9IlRyYW5zbWl0IENhcHR1cmUgU3dpdGNoIg0KDQpUaGVzZSBhcmUgdGhlIG5hbWVzIHRoYXQg
ZG8gYmluZC4NCg0KQ29udHJvbDogbmFtZT0iSGVhZHNldCBDYXB0dXJlIFN3aXRjaCINCkNvbnRy
b2w6IG5hbWU9IlBDTSBQbGF5YmFjayBWb2x1bWUiDQoNClRoZXNlIG5hbWVzIGFyZSBjcmVhdGVk
IGJ5IHRoZSBrZXJuZWwgaW46DQoNCnNvdW5kL3VzYi9taXhlci5jIGZ1bmN0aW9uIF9fYnVpbGRf
ZmVhdHVyZV9jdGwNCg0KSSBoYXZlIGEgcGF0Y2ggSSBhbSB0cnlpbmcgdG8gdGVzdCB0aGF0IHdp
bGwgY2xlYW4gdXAgdGhlIG5hbWVzIG9ubHkgZm9yIFZJRD0wNDdGIChQbGFudHJvbmljcykgZGV2
aWNlcyBzbyB0aGUgYnJva2VuIG5hbWVzIHdpbGwgY29tZSBvdXQgYXMgIkhlYWRzZXQgQ2FwdHVy
ZSBTd2l0Y2giIGFuZCAiSGVhZHNldCBQbGF5YmFjayBWb2x1bWUiLiBJIHdhcyBhYmxlIHRvIG1v
ZHByb2JlIHRoZSBoaWRfcGxhbnRyb25pY3MgbW9kdWxlIGludG8gdGhlIHJ1bm5pbmcga2VybmVs
IHRvIHRlc3QgaXQgYnV0IG1vZHByb2JlIGZhaWxzIGxvYWRpbmcgdGhlIHNuZF91c2JfYXVkaW8g
bW9kdWxlICh3aGljaCBjb250YWlucyB0aGUNCnBhdGNoKSBzbyBJIHdpbGwgaGF2ZSB0byBpbnN0
YWxsIHRoZSBmdWxsIGtlcm5lbC4gVGhlIGxhc3QgdGltZSBJIHRyaWVkIHRoYXQgaXQgYnJva2Ug
dGhlIGtlcm5lbC4gSSB0aGluayBzb21lIG9mIHRoZSBwYWNrYWdlcyB0aGF0IHRoZSBidWlsZCBj
cmVhdGVkIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgaW5zdGFsbGVkPyBOb3Qgc3VyZSB3aGljaCBv
bmVzIHRvIGluc3RhbGwgYW5kIGluIHdoYXQgb3JkZXIuDQoNCkhlcmUncyB3aGF0IGEgZnVsbCBi
dWlsZA0KDQpmYWtlcm9vdCBkZWJpYW4vcnVsZXMgYmluYXJ5DQoNCmNyZWF0ZWQ6DQoNCmxpbnV4
LWJ1aWxkaW5mby02LjguMC00NS1nZW5lcmljXzYuOC4wLTQ1LjQ1K3Rlc3QxX2FtZDY0LmRlYg0K
bGludXgtY2xvdWQtdG9vbHMtNi44LjAtNDVfNi44LjAtNDUuNDUrdGVzdDFfYW1kNjQuZGViDQps
aW51eC1jbG91ZC10b29scy02LjguMC00NS1nZW5lcmljXzYuOC4wLTQ1LjQ1K3Rlc3QxX2FtZDY0
LmRlYg0KbGludXgtY2xvdWQtdG9vbHMtY29tbW9uXzYuOC4wLTQ1LjQ1K3Rlc3QxX2FsbC5kZWIN
CmxpbnV4LWRvY182LjguMC00NS40NSt0ZXN0MV9hbGwuZGViDQpsaW51eC1oZWFkZXJzLTYuOC4w
LTQ1XzYuOC4wLTQ1LjQ1K3Rlc3QxX2FsbC5kZWINCmxpbnV4LWhlYWRlcnMtNi44LjAtNDUtZ2Vu
ZXJpY182LjguMC00NS40NSt0ZXN0MV9hbWQ2NC5kZWINCmxpbnV4LWltYWdlLXVuc2lnbmVkLTYu
OC4wLTQ1LWdlbmVyaWNfNi44LjAtNDUuNDUrdGVzdDFfYW1kNjQuZGViDQpsaW51eC1saWJjLWRl
dl82LjguMC00NS40NSt0ZXN0MV9hbWQ2NC5kZWINCmxpbnV4LWxpYi1ydXN0LTYuOC4wLTQ1LWdl
bmVyaWNfNi44LjAtNDUuNDUrdGVzdDFfYW1kNjQuZGViDQpsaW51eC1tb2R1bGVzLTYuOC4wLTQ1
LWdlbmVyaWNfNi44LjAtNDUuNDUrdGVzdDFfYW1kNjQuZGViDQpsaW51eC1tb2R1bGVzLWV4dHJh
LTYuOC4wLTQ1LWdlbmVyaWNfNi44LjAtNDUuNDUrdGVzdDFfYW1kNjQuZGViDQpsaW51eC1tb2R1
bGVzLWlwdTYtNi44LjAtNDUtZ2VuZXJpY182LjguMC00NS40NSt0ZXN0MV9hbWQ2NC5kZWINCmxp
bnV4LW1vZHVsZXMtaXdsd2lmaS02LjguMC00NS1nZW5lcmljXzYuOC4wLTQ1LjQ1K3Rlc3QxX2Ft
ZDY0LmRlYg0KbGludXgtbW9kdWxlcy11c2Jpby02LjguMC00NS1nZW5lcmljXzYuOC4wLTQ1LjQ1
K3Rlc3QxX2FtZDY0LmRlYg0KbGludXgtc291cmNlLTYuOC4wXzYuOC4wLTQ1LjQ1K3Rlc3QxX2Fs
bC5kZWINCmxpbnV4LXRvb2xzLTYuOC4wLTQ1XzYuOC4wLTQ1LjQ1K3Rlc3QxX2FtZDY0LmRlYg0K
bGludXgtdG9vbHMtNi44LjAtNDUtZ2VuZXJpY182LjguMC00NS40NSt0ZXN0MV9hbWQ2NC5kZWIN
CmxpbnV4LXRvb2xzLWNvbW1vbl82LjguMC00NS40NSt0ZXN0MV9hbGwuZGViDQpsaW51eC10b29s
cy1ob3N0XzYuOC4wLTQ1LjQ1K3Rlc3QxX2FsbC5kZWINCg0KSSdtIGdvaW5nIHRvIGdpdCB0aGUg
QUxTQSBicmFuY2ggdG9tb3Jyb3cgc28gSSBjYW4gY3JlYXRlIGFuIGFjdHVhbCBwYXRjaC4gTWF5
YmUgSSBjYW4gcGFzcyBpdCB0byB5b3UgdG8gYnVpbGQgYW5kIHRlc3Qgb24geW91ciBtYWNoaW5l
cyB3aXRoIGFzIG1hbnkgaGVhZHNldHMgYXMgcG9zc2libGU/DQoNClRoYW5rcyBhbmQgcmVnYXJk
cywNClRlcnJ5DQoNCk9uIDEwLzEwLzI0IDk6MDMgUE0sIFdhbmcsIFdhZGUgd3JvdGU6DQo+IEhp
IFRlcnJ5LA0KPg0KPiBJcyBpdCBPSyB0byBhcHBseT8gQXQgbGVhc3Qgd2Ugd2lsbCBoYXZlIGEg
Y2hhbmNlIHRvIGltcHJvdmUgdXNlciANCj4gZXhwZXJpZW5jZSBpbiB1c2Vyc3BhY2UgYWZ0ZXIg
YXBwbHkgdGhpcyBwYXRjaC4gTG9va2luZyBmb3J3YXJkIHRvIA0KPiB5b3VyIGNvbW1lbnRzLiBU
aGFua3MNCj4NCj4gUmVnYXJkcw0KPiBXYWRlDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFdhbmcsIFdhZGUNCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyNiwg
MjAyNCA5OjU4IEFNDQo+IFRvOiBUZXJyeSBKdW5nZSA8bGludXhoaWRAY29zbWljZ2l6bW9zeXN0
ZW1zLmNvbT47IEJlbmphbWluIFRpc3NvaXJlcyANCj4gPGJlbnRpc3NAa2VybmVsLm9yZz4NCj4g
Q2M6IGppa29zQGtlcm5lbC5vcmc7IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogUkU6IFtQQVRDSF0gSElEOiBwbGFudHJvbmljczogVXBkYXRlIHRvIG1hcCBtaWNtdXRl
IGNvbnRyb2xzDQo+DQo+IEhpIFRlcnJ5LA0KPg0KPiAxLiBQZXIgb3VyIHRlc3RpbmcsIFBvbHkg
aGVhZHNldCB3aWxsIG1haW50YWluIE11dGUgc3RhdHVzIGF0IGhlYWRzZXQgc2lkZSwgd2hhdGV2
ZXIgaG9zdCBzZW5kIGZlZWRiYWNrIG9yIG5vdC4NCj4gMi4gTXV0ZSBsZWQgaXMgb2ZmIHdoZW4g
UG9seSBVU0IgaGVhZHNldCBjb25uZWN0IHRvIGhvc3QsIHNvIGhvc3Qgd2lsbCBrZWVwIHNhbWUg
TXV0ZSBzdGF0dXMgd2l0aCBoZWFkc2V0IGJlY2F1c2Ugb2YgdG9nZ2xlIE11dGUga2V5IGV2ZW50
Lg0KPiAzLiBFdmVuIFVidW50dSBhbmQgQ2hyb21lYm9va3MgaGF2ZSB0byBmZWVkYmFjayBQb2x5
IGhlYWRzZXQgbXV0ZSANCj4gc3RhdGUsIGl0IHNob3VsZCBiZSBkb25lIGF0IHVzZXIgc3BhY2Ug
aW5zdGVhZCBvZiBrZXJuZWwuIFRoZSANCj4gcHJlY29uZGl0aW9uIGlzIGtlcm5lbCBzaG91bGQg
cmVwb3J0IE11dGUga2V5IGV2ZW50IGZpcnN0LCB0aGVuIHVzZXIgDQo+IHNwYWNlIGhhcyBjaGFu
Y2UgdG8gZG8gdGhpcyBraW5kIG9mIGltcHJvdmVtZW50IGluIGZ1dHVyZQ0KPg0KPiBTbyBmb2xs
b3dpbmcgc3RhbmRhcmQgSElEIHJ1bGUgaXMgbmVjZXNzYXJ5Lg0KPg0KPiBCVFcsIG9uIE1TRlQg
V2luZG93cywgQWZ0ZXIgcmVjZWl2ZSBtdXRlIGtleSwgdGhlIGhvc3Qgc3dpdGNoIHRoZSBtdXRl
IGNvbnRyb2wgc3RhdHVzIG9mIHRoZSBhdWRpbyBjb250cm9sIGludGVyZmFjZSwgd2hhdGV2ZXIg
bXV0ZSBzdGF0dXMgaW4gaGVhZHNldCBGVyBpcyBjb3JyZWN0IG9yIG5vdC4gSSB0aGluayBpdCBt
YWtlIHNlbnNlIHRoYW4gTEVEIHBhZ2UgbXV0ZSBMRUQuDQo+DQo+IFRoYW5rcywNCj4gV2FkZQ0K
Pg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUZXJyeSBKdW5nZSA8bGlu
dXhoaWRAY29zbWljZ2l6bW9zeXN0ZW1zLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1i
ZXIgMjUsIDIwMjQgMTE6MzIgQU0NCj4gVG86IFdhbmcsIFdhZGUgPHdhZGUud2FuZ0BocC5jb20+
OyBCZW5qYW1pbiBUaXNzb2lyZXMgDQo+IDxiZW50aXNzQGtlcm5lbC5vcmc+DQo+IENjOiBqaWtv
c0BrZXJuZWwub3JnOyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IA0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIEhJRDogcGxhbnRyb25pY3M6IFVwZGF0ZSB0byBtYXAgbWljbXV0ZSBjb250cm9s
cw0KPg0KPiBDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbA0KPg0KPiBIaSBXYWRlLA0KPg0KPiBJIHJl
dGlyZWQgZnJvbSBQbGFudHJvbmljcyBpbiAyMDIwLiBUaGUgb3JpZ2luYWwgZHJpdmVyIGRpZCBu
b3QgYWxsb3cgbXV0ZSBidXR0b24gdG8gYmUgbWFwcGVkIGFzIHRoZXJlIHdlcmUgbXV0ZSBzeW5j
aHJvbml6YXRpb24gaXNzdWVzLg0KPg0KPiBUaGUgaGVhZHNldCBuZWVkcyB0byByZWNlaXZlIHNv
bWUgdHlwZSBvZiBmZWVkYmFjayBmcm9tIHRoZSBob3N0IHdoZW4gaXQgc2VuZHMgdGhlIG11dGUg
ZXZlbnQgaW4gb3JkZXIgdG8gc3luY2hyb25pemUgd2l0aCB0aGUgaG9zdCwgaWRlYWxseSB0aGUg
aG9zdCBzZXR0aW5nIG9yIGNsZWFyaW5nIHRoZSBtdXRlIGNvbnRyb2wgaW4gdGhlIGF1ZGlvIGNv
bnRyb2wgaW50ZXJmYWNlIGJ1dCBzZXR0aW5nL2NsZWFyaW5nIHRoZSBtdXRlIExFRCB3b3VsZCBh
bHNvIHdvcmsuDQo+DQo+IEF0IHRoZSB0aW1lIFVidW50dSBhbmQgQ2hyb21lYm9va3MgZGlkIG5v
dCBmZWVkYmFjayBtdXRlIHN0YXRlIGFuZCBpdCB3YXMgcG9zc2libGUgdG8gbXV0ZSBmcm9tIHRo
ZSBoZWFkc2V0IGFuZCB0aGVuIHVubXV0ZSBmcm9tIHRoZSBtaXhlciBvciBrZXlib2FyZCBhbmQg
dGhlIGhlYWRzZXQgd291bGQgc3RheSBtdXRlZC4gVGhlIG9ubHkgd2F5IHRvIHVubXV0ZSB3YXMg
d2l0aCB0aGUgaGVhZHNldCBidXR0b24uIFRoaXMgd2FzIGFuIHVuYWNjZXB0YWJsZSB1c2VyIGV4
cGVyaWVuY2Ugc28gd2UgYmxvY2tlZCBtYXBwaW5nLg0KPg0KPiBJZiB5b3Ugd2FudCB0byB0cnkg
bWFwcGluZyBtdXRlIGV2ZW50IHRoZW4geW91IGFsc28gbmVlZCB0byBhbGxvdyBtYXBwaW5nIHRo
ZSBtdXRlIExFRCBmb3IgcG9zc2libGUgaG9zdCBmZWVkYmFjay4NCj4NCj4gKEhJRF9VUF9URUxF
UEhPTlkgfCAweDJmKSBpcyB0ZWxlcGhvbnkgcGFnZSBtdXRlIGJ1dHRvbiAoSElEX1VQX0xFRCB8
IA0KPiAweDA5KSBpcyBMRUQgcGFnZSBtdXRlIExFRA0KPg0KPiBUaGVuIHlvdSBuZWVkIHRvIHRl
c3QgbW9yZSB0aGFuIGp1c3QgdGhlIGV2ZW50IGdldHRpbmcgdG8gdXNlciBzcGFjZS4NCj4gWW91
IG5lZWQgdG8gY2hlY2sgbXV0ZSBzeW5jaHJvbml6YXRpb24gd2l0aCB0aGUgaG9zdCBtaXhlciB1
bmRlciBhbGwgbXV0ZS91bm11dGUgdXNlIGNhc2VzLg0KPg0KPiBSZWdhcmRzLA0KPiBUZXJyeSBK
dW5nZQ0KPg0KPg0KPiBPbiA5LzI0LzI0IDI6MDAgQU0sIFdhbmcsIFdhZGUgd3JvdGU6DQo+PiBI
aSBCZW5qYW1pbiBhbmQgR3JlZywNCj4+DQo+PiBNYXkgSSBrbm93IHRoZSByZXZpZXcgcHJvZ3Jl
c3MgYW5kIGFueXRoaW5nIEkgbmVlZCB0byBjaGFuZ2U/IFRoYW5rcw0KPj4NCj4+IFJlZ2FyZHMN
Cj4+IFdhZGUNCj4+DQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogV2Fu
ZywgV2FkZQ0KPj4gU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMTYsIDIwMjQgNDoxMyBQTQ0KPj4g
VG86IEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPg0KPj4gQ2M6IGppa29z
QGtlcm5lbC5vcmc7IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+PiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+PiBTdWJqZWN0OiBS
RTogW1BBVENIXSBISUQ6IHBsYW50cm9uaWNzOiBVcGRhdGUgdG8gbWFwIG1pY211dGUgY29udHJv
bHMNCj4+DQo+PiBIaSBCZW5qYW1pbiwNCj4+DQo+PiBUaGlzIHBhdGNoIGlzIGZvciBhbGwgUG9s
eSBIUyBkZXZpY2VzLCBhbmQgaXQgZG9lcyBub3QgZGVwZW5kcyBvbiBvdGhlciBwYXRjaGVzLCBp
dCBjYW4gYXBwbHkgZGlyZWN0bHkgYnkgIiBnaXQgYW0gLTMiLg0KPj4NCj4+IFdpdGggdGhpcyBw
YXRjaCwgTWljTXV0ZSBidXR0b24ga2V5IGV2ZW50IHdpbGwgYmUgc2VuZCB0byB1c2VyIHNwYWNl
LCBJIGhhdmUgdGVzdGVkIG9uIHRoZSBiZWxvdyBQb2x5IGRldmljZXM6DQo+PiAgICAgICAgICAg
UGxhbnRyb25pY3MgRW5jb3JlUHJvIDUwMCBTZXJpZXMNCj4+ICAgICAgICAgICBQbGFudHJvbmlj
cyBCbGFja3dpcmVfMzMyNSBTZXJpZXMNCj4+ICAgICAgICAgICBQb2x5IFZveWFnZXIgNDMyMCBI
UyArIEJUNzAwIERvbmdsZQ0KPj4NCj4+IFJlZ2FyZHMNCj4+IFdhZGUNCj4+DQo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNz
QGtlcm5lbC5vcmc+DQo+PiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMywgMjAyNCAxMDowNCBQ
TQ0KPj4gVG86IFdhbmcsIFdhZGUgPHdhZGUud2FuZ0BocC5jb20+DQo+PiBDYzogamlrb3NAa2Vy
bmVsLm9yZzsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyANCj4+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIEhJRDogcGxhbnRyb25pY3M6IFVwZGF0ZSB0byBtYXAgbWljbXV0ZSBjb250cm9scw0K
Pj4NCj4+IENBVVRJT046IEV4dGVybmFsIEVtYWlsDQo+Pg0KPj4gT24gU2VwIDEzIDIwMjQsIFdh
ZGUgV2FuZyB3cm90ZToNCj4+PiB0ZWxlcGhvbnkgcGFnZSBvZiBQbGFudHJvbmljcyBoZWFkc2V0
IGlzIGlnbm9yZWQgY3VycmVudGx5LCBpdCANCj4+PiBjYXVzZWQgbWljbXV0ZSBidXR0b24gbm8g
ZnVuY3Rpb24sIE5vdyBmb2xsb3cgbmF0aXZlIEhJRCBrZXkgbWFwcGluZyANCj4+PiBmb3IgdGVs
ZXBob255IHBhZ2UgbWFwLCB0ZWxlcGhvbnkgbWljbXV0ZSBrZXkgaXMgZW5hYmxlZCBieSBkZWZh
dWx0DQo+Pg0KPj4gRm9yIHdoaWNoIGRldmljZXMgdGhpcyBwYXRjaCBpcyByZXF1aXJlZD8gSXMg
aXQgcmVsYXRlZCB0byB0aGUgb3RoZXIgcGF0Y2ggeW91IHNlbnQgdG9kYXk/IElmIHNvIHBsZWFz
ZSBtYWtlIGEgbWVudGlvbiBvZiB0aGUgY29uY2VybmVkIGRldmljZXMgYW5kIG1ha2Ugc3VyZSBi
b3RoIHBhdGNoZXMgYXJlIHNlbnQgaW4gYSBzaW5nbGUgdjMgc2VyaWVzLg0KPj4NCj4+IEFsc28s
IGhhdmUgeW91IHRlc3RlZCB0aGlzIGNoYW5nZSB3aXRoIG90aGVyIFBsYW50cm9uaWNzIGhlYWRz
ZXRzPyBXaGVyZSB0aGVyZSBhbnkgY2hhbmdlcyBpbiBiZWhhdmlvciBmcm9tIHRoZW0/DQo+Pg0K
Pj4gQ2hlZXJzLA0KPj4gQmVuamFtaW4NCj4+DQo+Pj4NCj4+PiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZw0KPj4+IFNpZ25lZC1vZmYtYnk6IFdhZGUgV2FuZyA8d2FkZS53YW5nQGhwLmNvbT4N
Cj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2hpZC9oaWQtcGxhbnRyb25pY3MuYyB8IDQgKystLQ0K
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMgDQo+Pj4g
Yi9kcml2ZXJzL2hpZC9oaWQtcGxhbnRyb25pY3MuYyBpbmRleCAyYTE5ZjM2NDZlY2IuLjJkMTc1
MzRmY2U2MQ0KPj4+IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvaGlkL2hpZC1wbGFudHJvbmlj
cy5jDQo+Pj4gKysrIGIvZHJpdmVycy9oaWQvaGlkLXBsYW50cm9uaWNzLmMNCj4+PiBAQCAtNzcs
MTAgKzc3LDEwIEBAIHN0YXRpYyBpbnQgcGxhbnRyb25pY3NfaW5wdXRfbWFwcGluZyhzdHJ1Y3Qg
aGlkX2RldmljZSAqaGRldiwNCj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+ICAgICAgICAgfQ0K
Pj4+ICAgICAgICAgLyogaGFuZGxlIHN0YW5kYXJkIHR5cGVzIC0gcGx0X3R5cGUgaXMgMHhmZmEw
dXV1dSBvciAweGZmYTJ1dXV1ICovDQo+Pj4gLSAgICAgLyogJ2Jhc2ljIHRlbGVwaG9ueSBjb21w
bGlhbnQnIC0gYWxsb3cgZGVmYXVsdCBjb25zdW1lciBwYWdlIG1hcCAqLw0KPj4+ICsgICAgIC8q
ICdiYXNpYyB0ZWxlcGhvbnkgY29tcGxpYW50JyAtIGFsbG93IGRlZmF1bHQgY29uc3VtZXIgJiAN
Cj4+PiArIHRlbGVwaG9ueSBwYWdlIG1hcCAqLw0KPj4+ICAgICAgICAgZWxzZSBpZiAoKHBsdF90
eXBlICYgSElEX1VTQUdFKSA+PSBQTFRfQkFTSUNfVEVMRVBIT05ZICYmDQo+Pj4gICAgICAgICAg
ICAgICAgICAocGx0X3R5cGUgJiBISURfVVNBR0UpICE9IFBMVF9CQVNJQ19FWENFUFRJT04pIHsN
Cj4+PiAtICAgICAgICAgICAgIGlmIChQTFRfQUxMT1dfQ09OU1VNRVIpDQo+Pj4gKyAgICAgICAg
ICAgICBpZiAoUExUX0FMTE9XX0NPTlNVTUVSIHx8ICh1c2FnZS0+aGlkICYgDQo+Pj4gKyBISURf
VVNBR0VfUEFHRSkgPT0gSElEX1VQX1RFTEVQSE9OWSkNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIGRlZmF1bHRlZDsNCj4+PiAgICAgICAgIH0NCj4+PiAgICAgICAgIC8qIG5vdCAn
YmFzaWMgdGVsZXBob255JyAtIGFwcGx5IGxlZ2FjeSBtYXBwaW5nICovDQo+Pj4gLS0NCj4+PiAy
LjM0LjENCj4+Pg0KPj4NCj4+DQo+DQoNCg==


