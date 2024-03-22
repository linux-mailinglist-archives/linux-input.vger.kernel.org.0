Return-Path: <linux-input+bounces-2486-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8491E887194
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 18:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7EC21C233C2
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 17:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C7A5F87F;
	Fri, 22 Mar 2024 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.PT header.i=@OUTLOOK.PT header.b="mFKWSG3X"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2073.outbound.protection.outlook.com [40.92.89.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72BB5DF3B
	for <linux-input@vger.kernel.org>; Fri, 22 Mar 2024 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711127166; cv=fail; b=hHytDifeNSGICozOzriwEUmGIAICg/hE514oJN+CXOcMgrN02R1JkEdxVuSlxvdt3JaBEeNgwQxgvBhWwseBht7u1kQHcri9Esf7l5YP/4zb9me6dsRZRjSbcUhf0olvi94+blZUNTMCOKlqmtjnKFLOImZGmcLE6PkKbm61ZOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711127166; c=relaxed/simple;
	bh=Jl3iaXrOkCuVuLYmTwn73oeGEHHwLMJ7eZrQPqyHgjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t1WQyNAMPMwxAiPqLrTWgyawxC1fLPWf2HJA30tkDQ/08bRFlGjnrbqIIeCLPZhiVfUAiBelF3bz7k4UcS5MK7rs5wTlZqrjg5Yb+ukbvu97DZ/fSWOxqCOMLMj4SOnfq23gFF0rsiQzZiDPWJ1fioOFyTQOFyp4IJC6S7XGd34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt; spf=pass smtp.mailfrom=outlook.pt; dkim=pass (2048-bit key) header.d=OUTLOOK.PT header.i=@OUTLOOK.PT header.b=mFKWSG3X; arc=fail smtp.client-ip=40.92.89.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.pt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6aYZ2Mou8WpnVr/nNLmVlKHkXk4FvlAAiRSq3yBTuSxAaHt8I8Vo/VwmxMWjhuf6+H8AfGCgpVtm9ZDpN0JuuM2XKovnZXRYHDf+7+BrOGNx8+G6wB8dATwxhP3p5XdFjjw9vgbgM01JjweqSGF7cQErgklC2ZmUUobZuB5WXMsYtFzByvoCiG06w9QligBwlmSocIaQtaZZjIyJGWWZZdPFXNER06XsyHZooBF57iE/JgGALRmJXXVb02F4uxzdQxfQduZlg/gCR4zVVf7O0EbhSLabinkmCDV0q0tE3CAQXyZQoZggxHeoi3hwH2AasnQJ4PULk4ofrfaRspRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl3iaXrOkCuVuLYmTwn73oeGEHHwLMJ7eZrQPqyHgjk=;
 b=RFeNPmzcdv4+4YkURKnlwN7ncEEc8n7ADOVC2bSnHSoS8unvxJAWgG5GsTrAm8cEhk2QHGv6OqkkwW2PvZoECY1sHYuN0+nQm2GKqDdOi7/yiwVKmDqGwHyQ2NDYsUk77MSUsgvHI4vjPdRucwqpfBPZc6fMZXLo69TFKD6RCRzzAJnJgr61F0ZVQxZqv0FTxUhc+q/BBegec07uD3pfdiHjbSzDLCRJ5gHbdAFss3GYPp7/MoTl9/Z2QofcwgzPOtwN0ry8/uMDStdglmHpF2trPetIbNkAGjx8lguj/H1SNA+fP+59YKJTSV/3dptfqYjKKGDm2Fitg3VUcwjHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.PT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl3iaXrOkCuVuLYmTwn73oeGEHHwLMJ7eZrQPqyHgjk=;
 b=mFKWSG3XVL8nx2ZsFKTk1Pgh0gzKRDlU+2r6UX0Iw2VHtkkIhOvk/coHe7Rswh/EzyNR0lbp7M8yTBa0IgEzHnr3N3p/HgFnlzFaXv9/AfgpjquZwJYCo1QM54+qQcwrJrtFYgz7dCinp2GCzeGqlCXpp8Tg1Tk683EBg78HmjSfBp+9SQqZbdVx1Iwt1WIEhpVKD4/1kHLTU7B/9sj46ep7yL7t+SqYVkt7X3x+P0G9f5ajdmTypNXTgNakvQQUDj/O6ofXhJHIpXJIu32dInxnBmbTqMjTyxDE/cg8MqEjug/5jIHHmFpJ+HhTcLMr5BfPUYQjtODZ/aBoMwW90g==
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3bc::10)
 by VE1P189MB1005.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:163::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:06:00 +0000
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::8cf3:9add:3e50:c2eb]) by DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::8cf3:9add:3e50:c2eb%3]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:06:00 +0000
From: Nuno Pereira <nf.pereira@outlook.pt>
To: Jiri Kosina <jikos@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Daniel
 Ogorchock <djogorchock@gmail.com>, Ryan McClelland <rymcclel@gmail.com>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
Thread-Topic: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
Thread-Index: AQHaaQOGaWUcQg00tEKCUeoMRSTM5rFDvrcAgABk7qk=
Date: Fri, 22 Mar 2024 17:06:00 +0000
Message-ID:
 <DU0P189MB2044DCF13C8A66F0ABA15897FD312@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
References:
 <DU0P189MB2044EAF345CB76578D8C1A5CFD5A2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2403221200350.20263@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2403221200350.20263@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [pcaxwgdfgGiSI0fbUj+ag5mWtQ76efKu]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P189MB2044:EE_|VE1P189MB1005:EE_
x-ms-office365-filtering-correlation-id: 454e1a8e-1a0f-49b6-c0c6-08dc4a925939
x-ms-exchange-slblob-mailprops:
 WaIXnCbdHrNLYEJ5HghreUmTctoVX0465eVSJQ33JIBHKsY2KEkw31V90J07QhEgk2JpJ5PIBkEAz4zqePHC/4Wxa5exEbBKPcCWio7JqvhcfxaS/yr2v6CR9EWrwNyhMrSX+j2BupiqP0qIQJmZWA8YbK8fyLmnVCMhAgu3m/4uHtTRrzk9m88eQx3iquNTYYPJcJtJwAB8XQ8AElQsW2JChEDIcqrMwy30aLN5xJ1x0jnEHoui02UUYsf60FhOapRpQCYwMivnhrYsmcKzLd266DcpF8irW391qH3sizt4iiMiR6jQiNUDVoAcrTpge4PobYFTosb4/iWY/yzVyihDbjvihVDqSxsbSRDamTKP4DtFhx13hMdjW6/TQFcsQlYU6qbeXMhGUpiFYI9A+2A7SlPYQGVUyZknPz9gJqbPY441F3TLhlJxumHAT0I8nJdF1R26NI6Ua1U+rDo6K4lizJAJDUa+4Ds9BjLRD6wtzfHToBDJ4XZbZhCZtTysnzsFLTclb/RWnwIXpQ0S8hCYJM4O1G8SVup7nf+AqHhgj/Br/Fv86a/S8LB+OJqQ8r+un1NWTAlOa6sr5l3wFIIJ3b2ZpRjTpOWIgG46x5IYSd2hYO5q0mQSweMUtzwJZZzFRC+YlU5OAhIKemat60RGrvneYWnhuzKP0Fhrtdi6OzduaYgYNV12QC3Ugh83BBLB/ibdZvshAS0iEE53+Jq4VlJ79t+4ehN87XdvfZsE18jpqJnPXDejRZWJFO15WccyBd2GseQ=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nA9JMweCoILXQ7NeR7KQzN4mA+MXwdsxDiI0Y9QkqMeu2ERs3qE4cXL2Ul7zchy5IkGNIfIpMoNgXjms6gjsZwT8EFFuIgLceja7QGY/1umXt2B/m78BLtvA8CAyq5be71t5Q5tDPpZd5PInHAEtlw2qP+KwyUahzmOnl0u2adFVUOA6kcK8UC1yxO5Z54cBKm72NxLSvoum05hORtCjG54DfxJ6nMKUXnYfAuT5inulanpZnUeFb1hqupYxr8FV2ozEf2vWRd6nW4WRIcP01szQ+Rs5TOSqTl0uK97B8WkjSr7hkl+TdeAoSsTIocsTT60fkykU1hfh+x6kj+3u4Rc2hd5hM5egFQyjoEjpBbe8x4w/aqc0E0ceqHC6GVTy8gFS13Z9DPsDiGAYOGr0pSpH7A//iYComqttdzzZLbPiKeMJAR+LotO5pBt0pdI0ZeXrRe43u9FqIl5uIWEsvvrq5O6/QkDvTkHEJnvA10MtDJWTis0yaPX4TfdzU0dSy7YhDlMQZeFQ1jnHzlBhhwseikl8eoT50DF//bm/FenQuqY30jub2mirUxgKL01b
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7tj5QEMCo+uqyRcNY6Uk4EvYO8JJFpiVHcY5mPToxURhiHC3VxMYyaIRnD?=
 =?iso-8859-1?Q?Fxyj9o3YhQHxv/Ob7oaTExwpL7Fec2GCaTLKUiiV+1ozpSzWI6H2VNB1sQ?=
 =?iso-8859-1?Q?1x42xE1gQhPPQ2JJpB1D+cV0OZRHm7gsG+LfOddlaKztV0Nx4koPk+JIC0?=
 =?iso-8859-1?Q?KGk13ruF95P+HotUKuvAD53pEZKv9p8OKzFKaCdQvrRlk1pWM2m2ACZdCI?=
 =?iso-8859-1?Q?vJByvFhKwMERcTKwtPfVdxEbcFoZtBHuLrrqcczPZtQa9HbmJbh5zcE8Eg?=
 =?iso-8859-1?Q?fzDj2cc5Zw7ix22Ri5GW3U/JKKC5OX5tr502tpHR35t858YgN+PSHepj72?=
 =?iso-8859-1?Q?g7EYeO3xF1kbcowFIdzHlmZNJXQVdxVqurlD0e51EjB1tFwgVBQpEw9p4g?=
 =?iso-8859-1?Q?4pYVYTZWYfY+dnah19qCNDnW3Ip7rcIdnYVoTPhuW+sDfsPRZ0nEAHLepo?=
 =?iso-8859-1?Q?yBRggSuObXWrEYfCx8c0pa3qJ/XC0to574nn9+5xLjtkqACJqONe6l5918?=
 =?iso-8859-1?Q?RfdILy2ECeuB7NWoeJLFm8iGSvXrlHMIDEHiPZk9FL3PmuINZh2CgHbtJ3?=
 =?iso-8859-1?Q?mCEpGuSQCXnx7rF5j7ecHk6syDCpeRT0YDGsnqdHpovwmcHuh/TXJUxnhi?=
 =?iso-8859-1?Q?AYo9HU1Z7JlS+eZL+6hiPCwdhNijsDtl8+2oDIghRDHFg57qJZtSThc4bq?=
 =?iso-8859-1?Q?fUcVurR/1Dxt9Oe56+f/lKQACTw3akTgBKeD1i2pIfJZbSCl+7zyUBnPje?=
 =?iso-8859-1?Q?ETLl5ufchtY8URtF5OL7CTnfWcZz54+AtYk20abwZPKKAPZjjz40w2agkB?=
 =?iso-8859-1?Q?mRw2Ndk7WirJPmu0fzK82smmLWytCKxYPKPJJAYUTYzxm+pa9KPL44wtKV?=
 =?iso-8859-1?Q?7scC505gfFUtdQyoyG3DDe/fXjeb0S+gs3hwA3OQuKXQ8si04s3s16FzBd?=
 =?iso-8859-1?Q?1BRwCS4VSbE4n0td4Lqy+aXi0r/Q8wV9PuCCkiCeHsHTWs/wHzCJ5MBht9?=
 =?iso-8859-1?Q?i2pbLu4aUbjnzcTqcTWx8LKvHZgbggPgKZwywL80K2mDPcdxQAanJJlh+F?=
 =?iso-8859-1?Q?lVJjU6vcJk9jIcJptWZxGc7SPa2bE7pUgZeYrFXS/yhDob0YyxXskDspRf?=
 =?iso-8859-1?Q?dAuJ7xqwZ4VM5wOIBZHpaSVmh8KEIYowF3E/JVjBzS2t/rkAcFONZRToCi?=
 =?iso-8859-1?Q?vs2n/0mzfSH3AF8tGJAp1ia30EqOjMd5zyaTGEWvd01JP/3GSv3lInqOwF?=
 =?iso-8859-1?Q?rKBdDYG1bjd6L1N47qxA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 454e1a8e-1a0f-49b6-c0c6-08dc4a925939
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 17:06:00.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1005

Should I resubmit a v2 with that tag? Or is it not necessary?=0A=
Sorry for the clumsiness, it's my first patch.=0A=
=0A=
Nuno Pereira=0A=
=0A=
=0A=
From:=A0Jiri Kosina <jikos@kernel.org>=0A=
Sent:=A0Friday, March 22, 2024 11:02=0A=
To:=A0Nuno Pereira <nf.pereira@outlook.pt>=0A=
Cc:=A0linux-input@vger.kernel.org <linux-input@vger.kernel.org>; Daniel Ogo=
rchock <djogorchock@gmail.com>; Ryan McClelland <rymcclel@gmail.com>; benja=
min.tissoires@redhat.com <benjamin.tissoires@redhat.com>=0A=
Subject:=A0Re: [PATCH] HID: nintendo: Fix N64 controller being identified a=
s mouse=0A=
=A0=0A=
On Mon, 26 Feb 2024, Nuno Pereira wrote:=0A=
=0A=
> This patch is regarding the recent addition of support for the NSO=0A=
> controllers to hid-nintendo. All controllers are working correctly with t=
he=0A=
> exception of the N64 controller, which is being identified as a mouse by=
=0A=
> udev. This results in the joystick controlling the mouse cursor and the=
=0A=
> controller not being detected by games.=0A=
>=0A=
> The reason for this is because the N64's C buttons have been attributed t=
o=0A=
> BTN_FORWARD, BTN_BACK, BTN_LEFT, BTN_RIGHT, which are buttons typically=
=0A=
> attributed to mice.=0A=
>=0A=
> This patch changes those buttons to controller buttons, making the=0A=
> controller be correctly identified as such.=0A=
>=0A=
> Signed-off-by: Nuno Pereira <nf.pereira@outlook.pt>=0A=
=0A=
Thanks for the fix. I believe it's missing=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0 Fixes: 94f18bb1994591 ("HID: nintendo: add support fo=
r nso controllers")=0A=
=0A=
tag.=0A=
=0A=
Ryan, what was the reason for your initial assignment to FWD/BCK/LFT/RGHT=
=0A=
instad of SELECT/X/Y/C ?=0A=
=0A=
Thanks,=0A=
=0A=
--=0A=
Jiri Kosina=0A=
SUSE Labs=0A=
=0A=

