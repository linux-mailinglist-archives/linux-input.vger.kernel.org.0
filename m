Return-Path: <linux-input+bounces-6558-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49635979C98
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 10:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5E81F237C9
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2024 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9A913C908;
	Mon, 16 Sep 2024 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="f50amXeA"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F513D2BE
	for <linux-input@vger.kernel.org>; Mon, 16 Sep 2024 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726474403; cv=none; b=YfTT2KMD+Q6mth6A5X8AgK/qNpFk3tE35LUE7W7Dze3xW4XOd45qsW5JlXD7Ktm2sJ+DXwNBYCoHukxnDIcEuSlcx1JG8wI0Ww2/rPdgJ905kn+VtUf1GF+V3rZDnkkrMDwxmTesfmDltrvYZkF320HY7KRbZ+NdHTgPwIKvSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726474403; c=relaxed/simple;
	bh=wXIXWjCFZASPZJCCVg3BReFbcaue69mfpzOBABvKVX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=B0HLmHO+4Zfa0TauDqROE2VJKK0NOncDCbrD5Cd2j2cRgUhMKFU40uBKMZzai4GPmjFw9CuVyZvhHVw/vvKCBwYVrM750JOPceUPmXZftpTvDeeH0Y/Z/+4VwUtKIaqgKeJkriM5y6+2i99mueWL/hp0a3pQYU/cm7aHyBLFsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=f50amXeA; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1726474399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OHrnhgFtjZLacqo/XSOODkmPPGVuCqrNrsi2W98gfVg=;
	b=f50amXeAnRDZDYseStrqhCtwzBExTmkKV6EpECB/UKMAT+RgkbRjE5f+OOwsIZYz6NH+RO
	rWeBAAeqZHav+Gyf3uj+BiqDNEAs7hJ29LMo0NDKgU09UJSPLtdbgkfc5q+KLaS0KTbQxd
	ROP7YFeWPidK+LTHKXU1KqEZ6f2804k=
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-qiLmJNUHP3qJRrx9MaDv8w-1; Mon, 16 Sep 2024 04:13:17 -0400
X-MC-Unique: qiLmJNUHP3qJRrx9MaDv8w-1
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:25b::18)
 by DS0PR84MB3591.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Mon, 16 Sep
 2024 08:13:14 +0000
Received: from EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e]) by EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::af88:ed17:72c3:3f4e%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 08:13:14 +0000
From: "Wang, Wade" <wade.wang@hp.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Topic: [PATCH] HID: plantronics: Update to map micmute controls
Thread-Index: AQHbBeXJu68qxmQNwkyRo9KKHud0xbJaEwUg
Date: Mon, 16 Sep 2024 08:13:14 +0000
Message-ID: <EA2PR84MB378051BB14F857BA84E662818B602@EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM>
References: <20240913060800.1325954-1-wade.wang@hp.com>
 <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
In-Reply-To: <s36bnt7ptdarrxpejm6n62gf3rvvwfagmmpyq4unpv3hn7v2jf@up2vjv7shl2q>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: EA2PR84MB3780:EE_|DS0PR84MB3591:EE_
x-ms-office365-filtering-correlation-id: 63257f4b-ed77-4f81-216d-08dcd627698d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018
x-microsoft-antispam-message-info: =?us-ascii?Q?MR2RKfRnYVt6naTKvuhEpaMW19cuNCAIGtPerSyediBeJquVYYsURBlv67j4?=
 =?us-ascii?Q?zqgu2K0NOv2RNxa39iDem8YosOeCTVVx/+9AH1Uuh5kS8/8fTftTtoWRRb6l?=
 =?us-ascii?Q?AbNqEpI99SQjG8jEYPsQSHYMWWRDFtb3pYzHO5RsFVLprik3VLWNvPPkHNcE?=
 =?us-ascii?Q?pEQCnZUQR9W/vIBfZAup2OmKhyPpdNGXyY8xhB1aCUxj6nHOoxm3WPv90K2G?=
 =?us-ascii?Q?kyt1qqrwOjKY/+W8I551NoY3bbSzkPXhCJ+Vgxll9CX6MrKTSRnOx9hYYanv?=
 =?us-ascii?Q?ewXp/9xyPUjvqf/oFFXrdanzApKAg1EPcwhP+ie8jGaQnVq230QUlD9O/x8x?=
 =?us-ascii?Q?KfKAzelcBsDYjLzh0zd09E6DSXlt12fhCvlwaGa2Uwi6rwh8FX1utHkpqnwG?=
 =?us-ascii?Q?JfRCCDzvAAa7K4buuIFEdjYnb6w5y0btM7FCxmUhXxXxB1hAZFpbBFDtnVk+?=
 =?us-ascii?Q?LTn51QTmdCZQpU3vCf9A8vqm/v96c2bMxepgv1+SnzCydmnJJEQz4+Y6roFI?=
 =?us-ascii?Q?ej34BWeXbrf34V+LKMqrlTtRWrPWqQ2i5jTx2XUb3fisWnBRghQZMsD+I5rl?=
 =?us-ascii?Q?Mkc81QLH6ol3Oqjr97E2X1JYV/oHX+QEx/IaYNkn39xGzDIGVXeiuCwPqQg8?=
 =?us-ascii?Q?6f5cNgb1NuM/QbleVX2cVX3zqCknyT5pLXzlg726r38Avejm3HxuRd/w050s?=
 =?us-ascii?Q?1Jbl4o9xBqYwXhkN+1WV/cyCbPPVFUggv8z2P8a9sC7evq9UeAlkN1rPKcPd?=
 =?us-ascii?Q?gP2Im51fHNnKydSvD1DRl7EugRB3JvnwMnKo6VnItA4Zj18Xv0i6EXliIv07?=
 =?us-ascii?Q?KwxJWphWwW7UGIe41NQnyeBcV5QY0hq1dkiHyszqGVCYGQ+3zeSY3pohE+jX?=
 =?us-ascii?Q?zMrWrQTym9LPMmuNEvwYd/xWpLppvWo+yLa/z9bzFwotSfmQUdCno2HxXyzM?=
 =?us-ascii?Q?SbOjoxTze+pCO1jYHQA0dbwRYikW7EsVBf7IsVfUsqrmUXvP/1J/GzUcqoqI?=
 =?us-ascii?Q?dIyJVU2TVkMYFT90Ul38T1tmijoEAS8oPxk8ylKVEuLJ0ObldTDNyhZ4WUoX?=
 =?us-ascii?Q?GC77PyCqKLsYlc7CSauT/cOFSRvQfn4niwzmuG7KoMLLEELRiqOeLZY0ws+8?=
 =?us-ascii?Q?xDX3OS+IwnA8ETF/0OWxlDcWi+0TsKe0WHNSt1fP1ewntVluRSaruDiTfnjg?=
 =?us-ascii?Q?vq+rekmaMxlxnoPboJS1UMbZIypJ6RMqEqs6+5H2V2bNHN1RBr8hzDxGYrC2?=
 =?us-ascii?Q?fdG+u2KXTGNDSFyLroe9UPUu/hwNwpBwQ4DQoXciaAKC/52cGy1XaEBK1Yd2?=
 =?us-ascii?Q?JAeJOxemeUHLzHaGSWXQAhVR2hZNlNdwS/B2LuR8LyHejRzpX9KrFsEf26Gr?=
 =?us-ascii?Q?p5/oNiZuoIWyr7oZtwBPzMlKjiWKhltf+IMGnPa09gQzxe+QIA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dnOb2jPWCDc4Jto2eU/u0Ouy3YRyMeCpccLPxd61nhQYMM8C8MOyJs26ZR5r?=
 =?us-ascii?Q?adzBz4gYHAIBydyxWo3ZZYXfbxqbesa5HmJo+DEq1ZdyghGQH/NCLr1JjNMb?=
 =?us-ascii?Q?cT6K2CpZk2kJ0u2Q+YCUUqnWbd261YoaqDVH7fDrF3JmbzMoSTtojDL+pul8?=
 =?us-ascii?Q?fQ85l476aAjW//cbEJjJVhDXRTH7B1GS+Npx28GbLubNdAfNL6RsaKmZKCoM?=
 =?us-ascii?Q?DxQGfOH3OphBRyHigDZXboY4igQPSEZQ3fq6F1Ig+rGcL0IOk6x2JJzWxDo6?=
 =?us-ascii?Q?id5f8DsZeSSbPfm7ySuBVeYExSS8qA3lInA0gL3GnQF347NQFelYKK38w6pa?=
 =?us-ascii?Q?OP6NJzc34m0LkgygJmRh6rBKz6fLWQn2viBQUZPrfWrOfAbHz2IfepiKmI8B?=
 =?us-ascii?Q?xj6G+jiWgzScXlU3SBJIFriqi7rXYw6ecQ5aBlVKqdrbP7ObKhUQqSP+QPyC?=
 =?us-ascii?Q?2uPXoMygoqFBD0oJ5+hd+2FJfw0GyEHp4ZNoiyQORHrWEq/0fA/XNo+/kUPz?=
 =?us-ascii?Q?ch9NUuUSgBNN0FeYBh8CjugQX8xEjZ1tvtjWEzfFCveW5ZFccAkF9y38kvV5?=
 =?us-ascii?Q?B/8DstJTm4vj5q7hzUu2KVHTNxOsVYYiTpQqKiebK2cf9OzoaloKxf/+rAfF?=
 =?us-ascii?Q?Yc7+abGSE5ArCDrG8maD1NHSrCauyDuanWzQnCi0fgdmp3ZSsQXUGmPb9t54?=
 =?us-ascii?Q?UpWhMFtPI0T1sHNMi0+joZ8oJxiRS0bf+lEdKZ6o6H9emjunwl3/xqzKfRqY?=
 =?us-ascii?Q?qXqKExs3HsGGdLiNt3ykeoPAzBYRtZrg00uuCvwTOdwvEW3PlftOpZTrzu3w?=
 =?us-ascii?Q?xAAzsTHXcci23nZZb5F23YsFQDho08EDpOevqHsagA6HDleh2SX+BU4LkLHU?=
 =?us-ascii?Q?Ie5TvsPwLbSvonPayVKOwIDfoerB5NAOzSt7gaRmCPGLtu+kzfy24RVnIiup?=
 =?us-ascii?Q?NSDXVgjNtxkvH6N5McHVMYIf2KvbsEM9dclzKngUg0kP3jQsg7FURjMfzNNV?=
 =?us-ascii?Q?WSXD1SMmUeUVZdayuQsGnecozgbtoG2DdIut6xv9rLokrjZkjExgQ1OP1CEL?=
 =?us-ascii?Q?2xJalbW6zRXlNQf35G4MrbDJC/uSxWn0nYSmV4IqjjYvsnghRoapNLuDG4PF?=
 =?us-ascii?Q?Nu656OZTKecm7pYayYgSmaKUbzEnxtOLCCgmENccXuHTQ78E8C8P2Fu5vo54?=
 =?us-ascii?Q?xWfQ45V1xmSSk7J4czq7sLEkuZpkJhgOndvB/G5Iv3pGKQwUzrmO9gv/Jlix?=
 =?us-ascii?Q?UxGYY2rgtfzDFuBRBt8D7rrGGQoiKGJ1XvdEjyV2hGZglyW0bPPy78tEbgBJ?=
 =?us-ascii?Q?syF/O69uSh4VHzMO/wyiul/pA+E0D8qVi6y/kNSviItDQiCqpgijOQcqoEuj?=
 =?us-ascii?Q?qx9Nqb/P15IqX6Qm9fJZvzFxRgq0zm58foFL/5vnQJHTtYhFYZiqznLFWl7G?=
 =?us-ascii?Q?A/EVsVdMZGC9fr0DZkr246Lko6sUevriCxteLk13JwVUFTDIe6V9I4kgv+fG?=
 =?us-ascii?Q?CHbZOTVqfId+6TZz8Ce9FTuvzRzcLMuVvzcgrDPnGag787gE7QCW9XK+HWnk?=
 =?us-ascii?Q?4Dd0Mmtpp+wnrOxTvos=3D?=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: EA2PR84MB3780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63257f4b-ed77-4f81-216d-08dcd627698d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 08:13:14.2105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XihEEiIvisgY94BToc26aaXYiNLyGy3mLaKNQC3/ttThi9hKOl5g0GH4HZgT8Kr4LnsRGUsDAQfZ5W85GKutQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR84MB3591
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

This patch is for all Poly HS devices, and it does not depends on other pat=
ches, it can apply directly by " git am -3".

With this patch, MicMute button key event will be send to user space, I hav=
e tested on the below Poly devices:
        Plantronics EncorePro 500 Series
        Plantronics Blackwire_3325 Series
        Poly Voyager 4320 HS + BT700 Dongle

Regards
Wade

-----Original Message-----
From: Benjamin Tissoires <bentiss@kernel.org>=20
Sent: Friday, September 13, 2024 10:04 PM
To: Wang, Wade <wade.wang@hp.com>
Cc: jikos@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel=
.org; stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Update to map micmute controls

CAUTION: External Email

On Sep 13 2024, Wade Wang wrote:
> telephony page of Plantronics headset is ignored currently, it caused
> micmute button no function, Now follow native HID key mapping for
> telephony page map, telephony micmute key is enabled by default

For which devices this patch is required? Is it related to the other
patch you sent today? If so please make a mention of the concerned
devices and make sure both patches are sent in a single v3 series.

Also, have you tested this change with other Plantronics headsets? Where
there any changes in behavior from them?

Cheers,
Benjamin

>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>
> ---
>  drivers/hid/hid-plantronics.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.=
c
> index 2a19f3646ecb..2d17534fce61 100644
> --- a/drivers/hid/hid-plantronics.c
> +++ b/drivers/hid/hid-plantronics.c
> @@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_devic=
e *hdev,
>               }
>       }
>       /* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
> -     /* 'basic telephony compliant' - allow default consumer page map */
> +     /* 'basic telephony compliant' - allow default consumer & telephony=
 page map */
>       else if ((plt_type & HID_USAGE) >=3D PLT_BASIC_TELEPHONY &&
>                (plt_type & HID_USAGE) !=3D PLT_BASIC_EXCEPTION) {
> -             if (PLT_ALLOW_CONSUMER)
> +             if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE) =3D=
=3D HID_UP_TELEPHONY)
>                       goto defaulted;
>       }
>       /* not 'basic telephony' - apply legacy mapping */
> --
> 2.34.1
>


