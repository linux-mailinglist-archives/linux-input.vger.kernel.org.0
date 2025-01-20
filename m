Return-Path: <linux-input+bounces-9397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394DA16551
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 03:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5922A16537D
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 02:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BB62114;
	Mon, 20 Jan 2025 02:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="D6+mVebd"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1980C02
	for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 02:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737339605; cv=none; b=g61Gg9KFD5p9HZDO1y+m8XUPERD2VD+6gUeT8RqsWRV7rtuIjJkpJkjEclaDjciLQx47LFBciE48NWHNUIsTrjLrKJ32/flGkLsP0j6NIWhCG7rEOrl56NQ55GvaypWfILHjxQxf+cwxjwaPqN1dldR5Tq48HqcCsA9RmUFDjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737339605; c=relaxed/simple;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=eY7+aSxSScSA9N5DxFTrlx50LOq1xQ810OYLapt4g30nJy/7/KWJGlYrB9UluSabH3Y4TZ4mG7OOWfXIn3Q/R7BkKNgqOuD2Zxa+5kqeviodanEeisYmp0NG22Vn0kz0T7Y2arqU9d0QsmoJP6vuSkpL8I5SgIkTSj85mNPgjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=D6+mVebd; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1737339602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+eFZE0SfaSAvEFEz26Zpd1eCR9Yd+De70yHTI9ZFlE=;
	b=D6+mVebd3KP41WaIqAqj808xXDQLYPLgXOPxlE7P61dxHErAycsBHPidxFrR4HKZtYah7v
	zqnpcd5n9a5m0UydQQNUKW02QAP0fEmzNypz7jEiYS5PTW3VIdcNCFe83hKgh+Y6xYTtr0
	cHFfCivan4DpnKxROBqwpa9+SQ9uf3c=
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-UAw7f-ucMaOiU4QZrblcvA-1; Sun,
 19 Jan 2025 21:20:01 -0500
X-MC-Unique: UAw7f-ucMaOiU4QZrblcvA-1
X-Mimecast-MFC-AGG-ID: UAw7f-ucMaOiU4QZrblcvA
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by MW5PR84MB1426.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Mon, 20 Jan
 2025 02:19:59 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 02:19:59 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>, Jiri Kosina
	<jikos@kernel.org>, Takashi Iwai <tiwai@suse.com>, Benjamin Tissoires
	<bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
Thread-Topic: [PATCH v4 2/2] ALSA: usb-audio: Add quirk for Plantronics
 headsets to fix control names
Thread-Index: AQHbaUQqHjGH8MxvIkyiwK68hryhh7Me8QiQ
Date: Mon, 20 Jan 2025 02:19:59 +0000
Message-ID: <EA2PR84MB378059637916FC117406BCC98BE72@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
 <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
 <20250118005841.6618-3-linuxhid@cosmicgizmosystems.com>
In-Reply-To: <20250118005841.6618-3-linuxhid@cosmicgizmosystems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|MW5PR84MB1426:EE_
x-ms-office365-filtering-correlation-id: 3b049c47-de94-4c57-16ee-08dd38f8f056
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?Z+p0yQTmF/BwAUFgyqlPzb54IWt9dXHAqTnfLMR/5aBzRdj3yYilVi6NChXb?=
 =?us-ascii?Q?b+haHWMN6W64M9fd9AHaqhaJjgVSRmqdV39JqP1yGaKi91Cvnl7hRKs3DU+8?=
 =?us-ascii?Q?g9EZsh0wcpuoM1OpP/SFdZkoTjTpR5Hyi79/oAM0DahtOD9W1TaowRVDt9pI?=
 =?us-ascii?Q?Vg9tT3cvnBRlYdADHjkKaKV9EEQuzq4UkNNNjBF7sjnAU+URjN98kbQUwucV?=
 =?us-ascii?Q?OjHMBTcpsNE22A5XQB6LXdw17Rm0f6ijSAL+bYEwZPejcfMpsv38ZAFZJL8t?=
 =?us-ascii?Q?8oaPr7SOIieV8W2JJkbEzBKHgyQNoODpFUF4abmOFTu9H+Px0D+sMtcoznOF?=
 =?us-ascii?Q?iwbKkMf6PRIXiM4j5TIU4SM2Qx4qc9w0SZsuaZqIqpjMoIl+scmfudD01quz?=
 =?us-ascii?Q?zZ2V7XwMV931ppOQXk4GHbT9mJTxSjRxfJGrXKgwdPEs/vhqF4rn7AjM6AYi?=
 =?us-ascii?Q?enboePKl9gZ9/DtAlT5IZnB0+9Pee0lGlE1m1tk3LjIc1plRRNeEB3SgPh2v?=
 =?us-ascii?Q?Wh9jTtPtnUHcn5wE+4Em/qcMt9XE9oZkYmg/rPJ6EQnWGlY9nbsKbzvd38vW?=
 =?us-ascii?Q?j6Uz4STujBMvHE8Vae1y46HGItFkeRc3ll3AFEt6rzwBdRaxRDmOBw2ds8X9?=
 =?us-ascii?Q?j74CpnDx2UM5i1oaoGOqtxVag9y6QFFZzJvEomsJlxCAjI0+5AURYZuliCbT?=
 =?us-ascii?Q?uAdY0scwRUwWi7ZOhq5HKUoD3dt3Uz9f4VAReNrgNNhYTMsIfbzMzDcq5hrj?=
 =?us-ascii?Q?I6rbbv9DsqF1Met2WBDS3vWJSyxKYSewBDmesOgFf3dwnvV+trBVryz25cyX?=
 =?us-ascii?Q?YoyjkwnqtxSpTcd4hdrKMRQYhSzzbgFnE69ZhGfdmJSC4OnP/A3fuMvC8lx2?=
 =?us-ascii?Q?p7ZAnAwSNTV5PPS3M7g6kV5lTNOKaLHrOECK0ZxqruuBdhRrczHNF08WtrJw?=
 =?us-ascii?Q?l/GB/DFf2OTRxHGEJ/dA9EaHBuA3Di0tmWWg2G006cPnzqgFP1ZKEjqUJav5?=
 =?us-ascii?Q?uS55tp6Q92g7bmX6tiAqvNat9KlfBh1adnKUybbSKRoLEdh92N6CA24JT41N?=
 =?us-ascii?Q?rXgXn2qVXv+uF3RNc0TWbFRjZgU5/9uc2m4hf42kDPAMqowtwZ0+8kwsI06D?=
 =?us-ascii?Q?Rfiipj5KTLDbJ2oxePmVnQsIl2144Ly9aFD8Gk64CJs7DVPGdALtmeQjxBlq?=
 =?us-ascii?Q?6nFH+hyYlNUUDx+ibhXa2w/0fJmEJo7FHi4OJShk7TAwCt1RxWj710ut8hlP?=
 =?us-ascii?Q?6SM9woXHtGzAGmKoO3qFZ9/R7DDlZKonJB3FKdMwmtviag4GnAIl59H5AaMI?=
 =?us-ascii?Q?Efbn8AeHBb0/L/RR+LqqhgUHezgacjKXIGafA75nJvnzXqOPm2gVng3nZ/m1?=
 =?us-ascii?Q?nnaFobVWPFwG7y3R9NZ8u4AT023RHvJYs8w71wXUb35HfojtYJVRMbGzAWEA?=
 =?us-ascii?Q?nBl+YA3fo0X7Y6sDubom4lPyTsZTHLwz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GLrTi/GQ/rrh4qrHnpPnslKBjdB8YExg2aCzRik5kpKOVwqe/SvW3LE3bfS2?=
 =?us-ascii?Q?7ydtSYqOKHpqmYybA8X3cTdD+gAJANiDGCJ5UYclvS+bgh+nzwEIuZ5YsE5J?=
 =?us-ascii?Q?3/y1jqf//zOqDXs5nPoBHPz2601mcBnWA2YMSEfEbLYeiX3wjro8oDuB+oBz?=
 =?us-ascii?Q?5UxtTRM8ZCfCERj7Tp4ZeYOWOF+XZzdNwIN09Ahw21Oa1XbXtOmDK70otnQw?=
 =?us-ascii?Q?HdILJlrJJm/L3szz/fpcPYE1+uIOLyRan5fc/BrRGJXkGo1wFgz0aV8YOWdj?=
 =?us-ascii?Q?R6YpcBDSJiCqBlXIr49KWheZzAMD5/aRcJ0ikSxpDsRuOyJLxq+MJcezomtr?=
 =?us-ascii?Q?CR0XdXRkrpFV7EmKNIWluhJNs67pY2iu2KlMWSyfxr1lz1MtrbinkwTqPUr9?=
 =?us-ascii?Q?eGAE3Dahf8IJO64V0yDFNrBlgun9DUkKEfzUzE1/RjzlZXriE5VOmtIgQjW1?=
 =?us-ascii?Q?Z9OfmI5bPCYOSg6z/2wKqznScJ263qhHfAd1eMqEHvN/dx53JmPNslkqeNv/?=
 =?us-ascii?Q?FeW2aN4H9aANJoBqOgluv767XYDYqwJ5nUTK1YLe8K3i+QxS2quBwn7wVO0p?=
 =?us-ascii?Q?KNFqCQxJxttncTXeeUW6OWHtOWYD84+mBnSObPUh2qnO5qZnRENv1al7CQPz?=
 =?us-ascii?Q?4oedrsajypVemeD6AVxVCVU8f6GTJmlGjVVmXacUQiKqVbLIqS8BVAV/9dxS?=
 =?us-ascii?Q?EXlgkGftY+Yw7If+u54rnA01XbAAepHti5BDlHoJnEWeuc/w1xRZZc5lm7/T?=
 =?us-ascii?Q?6zglR42C605+arJC7dsUden4eZd6lcZW5h0+w+WA8Ksb4Eir2YKgPcttZkay?=
 =?us-ascii?Q?PZ4wR1KwYbozol7BaImEFnCZFo62tRpzKm7A/i6bYklytNOJoixsxTqsKWH0?=
 =?us-ascii?Q?R4rCBcEewYr8VT+N/Esi6DuBtrNxgQCbUlgf6DA+aLnw9KN7gx/PpwYMTpv3?=
 =?us-ascii?Q?vjIHROgtgsxqsF/CtzpKqhBJnPT8uR+d9TfcuYCPw1gyy41jkm8CUEu/g+PH?=
 =?us-ascii?Q?Thhq43e/CV8ftmIcjZmH8k3nO56D+d6yAypFJA/Pw7gMpE8BFdhwobFqg7D+?=
 =?us-ascii?Q?o+3dkqWeRd/tSi3eWmK95fDdLhzfHWmg1tv1+7rRdT0XOcrta2YcT5zrwwzr?=
 =?us-ascii?Q?xxPjtpXkd1DNvmOho8BcHlxnuCsMy7w+9FzEAJfn+1sUpunZcbjwT6ZB2DzC?=
 =?us-ascii?Q?4PeI57+l9KXLrtNIulGeQfzwKg7IAlaK4G/3egDpw6j11l6TbgVckdZUOOzC?=
 =?us-ascii?Q?Ev0H7oW3nUz0W97k58eiVjwg0gKez0sY/pRiBy6nIZMmNKBlSkIZYfrHNuI4?=
 =?us-ascii?Q?XLapRCpcEP/abT3JNw77OlCck8oxcIEvVbHY0cbboKfa2cOnnm+NXgB3Sc+W?=
 =?us-ascii?Q?6jwLfqoE09suTliJ6nAj59xTrJlj4yi1P0aQVe6JpvV/+6OQoCxe9lJWRRik?=
 =?us-ascii?Q?cfS1BEU2aq5oPL6Jv/6luO+5q9Bc2AlmKx1P2+bQ/oMDnNMWEF2rgOv7ZFqp?=
 =?us-ascii?Q?hNE3ZkF+TUaaUiVgQr6PiYIy3EeAnxV/AyViVOv0cLRYK8t60xrgII3c3wQ9?=
 =?us-ascii?Q?w832aULUVR+BNz8ESts=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b049c47-de94-4c57-16ee-08dd38f8f056
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 02:19:59.1666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XL/qpm1E7srQ3mIyoEGUyg0t6TSpad/O39u2RgBAkIb3Blgf+RO/vOE4jH1SkgEk7AnENcdK+Lww/nAPvc8YJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1426
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyXvJwlUeUa7XOVlYFGTGF2wJmrav5lvy4DybmkArI0_1737339600
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Wade Wang <wade.wang@hp.com>


