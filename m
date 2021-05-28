Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD0D394411
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 16:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbhE1OVP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 10:21:15 -0400
Received: from mail-eopbgr80053.outbound.protection.outlook.com ([40.107.8.53]:27619
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229599AbhE1OVP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 10:21:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoWIluapoEHLgT1ukb6h5stqpBvIUAZ1oBnT8uftXpOOOS1SpOggTGv1O5HGIUmFFeLkw4G0hVW7XVhhCNhoFm2iMRazR2AFdlC45BA1oa1B46Hkx3njtw5ubLHNrPn4EGzoOGmVwpel7+RUNSf9zhLjGqzEiaKMxPz73LFS013olCZwMCgH8ufRIzqufla+6fesRf6ppmPtz4nB9vkbTmcO3OCkgXIO8ib0JXVf950KdPT+8tMC1tQOlKgzWcwLd04I6ufFzChW6um8dIZxw+sML9qv7WZNyhNDT1ryy4H8uRug/0q1EsvA0fs1jI2LuRRi4Q/w1mHtNW1+/gDonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oph7H39zcG2U7So5XbIz9TUnocHCsrDFAkjnDgcoxpw=;
 b=EcPINuU3VTEHQAtnwcn9577ZxtWrGcn/Fzmjs0rwprPD1juD/Nhm9JItYC/D9epDqTa0qAQpiIlC4b7j8CyjO179LE3OTUv6J5ZfjU1D38phwX3t4ghulxqBGYqPL5t/A4NTwNLekPiah+DR6fI4zhw74Ft1TiWFXeudZsp3oj0RRWRsEuxMn6/n8+whQ9fRHJJgkQTl1IaikGO4a9o4Z1vAppa8bHf6b0BEIscIs663OSdgID9F2F5tfuEkCLigeZCerYLOEqrcrKkAzQ03HSupHDWSsIZLq9TXuzv2zGlm6D7xQ6FmiQC+L+Teph9ejRt9CyBF2atMQNxS2ei4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oph7H39zcG2U7So5XbIz9TUnocHCsrDFAkjnDgcoxpw=;
 b=MXxBGBdOvNNOhTP9Igo/ACugpk4HbMlFnhxAnu95dDey9ORFOazLs3xyKIN2/6G0HNKXZ3tc4EQEH5L1gmLoy7RZIlIL5iq+1z613ekp9Is8y9vuZA8beiK6PSGP4beQ8luEG0crZqVLSgWX/8tLlC4Su+AvtELLFjzQ0oSZnA8=
Received: from DB7PR07MB5818.eurprd07.prod.outlook.com (2603:10a6:10:86::27)
 by DBAPR07MB6743.eurprd07.prod.outlook.com (2603:10a6:10:191::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.12; Fri, 28 May
 2021 14:19:37 +0000
Received: from DB7PR07MB5818.eurprd07.prod.outlook.com
 ([fe80::3143:3e9:7c4e:9aef]) by DB7PR07MB5818.eurprd07.prod.outlook.com
 ([fe80::3143:3e9:7c4e:9aef%6]) with mapi id 15.20.4195.012; Fri, 28 May 2021
 14:19:37 +0000
From:   "Gerecke, Jason" <Jason.Gerecke@wacom.com>
To:     Jiri Kosina <jikos@kernel.org>, Yiyuan GUO <yguoaz@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Yiyuan GUO <yguoaz@cse.ust.hk>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: check input_dev->absinfo in
 wacom_bpt3_touch_msg
Thread-Topic: [PATCH] HID: wacom: check input_dev->absinfo in
 wacom_bpt3_touch_msg
Thread-Index: AQHXUhz6sX4p9OKs70q4vFRm8cQ2SKr32nBQ
Date:   Fri, 28 May 2021 14:19:37 +0000
Message-ID: <VI1PR07MB58210C73FCD05B54826446E4ED239@VI1PR07MB5821.eurprd07.prod.outlook.com>
References: <20210517093403.74276-1-yguoaz@cse.ust.hk>,<nycvar.YFH.7.76.2105261250060.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105261250060.28378@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wacom.com;
x-originating-ip: [71.34.89.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 187b76d4-83eb-41a0-2d13-08d921e39ffe
x-ms-traffictypediagnostic: DBAPR07MB6743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR07MB6743E2C8AA134DD924551FA0ED229@DBAPR07MB6743.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1L/pTGUlHAk3MQQy/6Eg/W7+0YBPp5xUJhaCFSnuJ0ek4CmMFO7nhbDBOo4d8jZacjSSYNaoNit7YQCSlCiKxStiwq033fJVwkGInsilx5peqtcKAdTVdTZ/yKzgrWXJ2m8g+zIpAqrYgqJk736/9i3JqWfNj/Be6yM43m9zQ5NBOQZLW5uygGp+Tc6HyRAvtHP9bcQEUGjDEJ9x+CeAHLUk1aLWBDPGmIkDQY7I1FV1ELNeGb1ZTH0uZtxq7eDrUHxgEp3UmbMqu6MHKh+Cs9XCHP8ZRvOSVQVteGlIacnuE0Yvj9aP81z93n0c4m2t/Xs2aFOe3GPJEWbFsqXBJiA3QqSEtYrTkwo77Cx324fI2RykGdLh1mjs+UokZK2ngkjOHY9uI+N/j6WhrcaTS7waPe9BURJuPMby7CDsNdPa4M47YoIvsAE6FRxtvoCyyC4jyQxVIZ4OgOq+q1SuzVaPFjDR8g3jcUXfWnmXLYaLQD8czlBEW+z9eZFRybAzbfffNIZPirBsAyyrOEbBroMSLFBxT+5cI+vBqE1P6NMAuf25vBxiUJHDXGwRGONLYLm8fui238E0Inxr0TCOuf0bvsLeoZRc9f1Ngks//o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR07MB5818.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(136003)(366004)(346002)(376002)(38100700002)(71200400001)(478600001)(122000001)(76116006)(91956017)(66946007)(52536014)(66556008)(6506007)(33656002)(83380400001)(66476007)(66446008)(64756008)(86362001)(4326008)(316002)(110136005)(54906003)(186003)(8936002)(107886003)(5660300002)(6486002)(26005)(2906002)(6512007)(8676002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?isjxMHezsy6RIwZnhFVgnHFDvi9lHBAWlnAAd5FRkhG3Kp1NRzUEIu3m1Q?=
 =?iso-8859-1?Q?tLxa1iH0noTCXWTmAHaYRIi71U8kTBFYSt/UidyiU/3QTTyORdD1oXDKjv?=
 =?iso-8859-1?Q?r3ekP/XyiN3+lspqxQDSktnDEuOiNiQ6N+ICb8EcD1+NLd0+CKvblAwkmM?=
 =?iso-8859-1?Q?thrKfaitej+tHLUyuQM4MfkrxKe4Mh9taW45Cen98VWSbw77IfbD4ySXJ9?=
 =?iso-8859-1?Q?vUsltl5zRWG4flQJwU62RdtS0g+orS0tiVyubKxoJmuyBX/q8U/NlJfz3i?=
 =?iso-8859-1?Q?M5eWwdoP3uFtkbFE7ILBoAl3stSAux3dg5HAaEj5Yyrym+g8nSJdpqghr1?=
 =?iso-8859-1?Q?2n4+z+0dmiQJVoupqFtGeKrXcQQVqlFB6fACz3RMy7Cw7yd/fvsL0AOIeV?=
 =?iso-8859-1?Q?4EQXECkRxiS2NGjMEXG6mw/GrEw08BoP59joDsej3tA8yKZIwrgQpByUNV?=
 =?iso-8859-1?Q?wlPPjo+6wKWiuu24FSYILDvowdathdNdtf1RDgg4ZnEQaDRmknzEKe9Nsd?=
 =?iso-8859-1?Q?XrePUSZyF+y8cowNqkUtKBRPfV4Rm7104DYpfvI1s7hK5UKQm6GnRW7O1k?=
 =?iso-8859-1?Q?cwTrjIYtET5Ag5jIg5VDTfMEZfYMouNzsXZM8X2hsWKi7Ocx4BMdvb+utx?=
 =?iso-8859-1?Q?ZE4lDhQvaP/LxcoyWMqOSvf5c39hepXMGV6EPvRfuoceXgqvJLskC35bmY?=
 =?iso-8859-1?Q?jhybihLzrYxLovWVgxTlsVH1UhfT8HP2SC33oaHyD/YvxZeOrlCzFEes3b?=
 =?iso-8859-1?Q?DaT7bKmeFf4s0vCuxk3YbOXHwoJ8juI6uGCsOiu2YzKjhxwMByobyPy+4x?=
 =?iso-8859-1?Q?3bBsXD+Jo10JXFE+Ww9D8xOmleji88rvHFjsbFwPPjbU0kmliERPSeWcKu?=
 =?iso-8859-1?Q?3/9hiZmXp4+gVnmEQcC3/14AMOczF+raJuedcGYYb6jG0oz10YineuGhqi?=
 =?iso-8859-1?Q?cC6U8Qqj7cvS7rvpL75byemmcqbHsMdfcH83mncaNXLmZdOg04pqGelGxP?=
 =?iso-8859-1?Q?uoMOgyWxcp/IW/UAsGLZomApp1E5BvqSEVQYOeNVe9JM66GqhvsPeUi08x?=
 =?iso-8859-1?Q?lVfvntNt7zvGgoiPUsnaSB4dT3eS2OycgzSEDe0xoHVHfJpCwWbsmO8Zn6?=
 =?iso-8859-1?Q?7/9oTGRkQ4ImHL4taMU+IrrM7XwHMxxNLxsdmYsI9iULusJV4lHCYQl/tm?=
 =?iso-8859-1?Q?NYyWWGQ4wCbEJ5jCXnYOtXbym1j4319fhElKCwXawIWqg9L74i8kw31pT6?=
 =?iso-8859-1?Q?GfEoPXhUcKlOdVXS+oD8uU9IpL2uYOPTyzDQGmrVICQacR+TmrQN4Zbt21?=
 =?iso-8859-1?Q?Sy08asZpwU/EKhW4SPKeX1zvfm1dwUW2pqXMMWLY+t6BmOY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR07MB5818.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187b76d4-83eb-41a0-2d13-08d921e39ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 14:19:37.3904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cRYu5YJ3OLU2OIVlXttUC3/2lNveyHADWzAKTopzVSpbx5sUDYCmIlUn9cx7vsh5w2nTv5DqDryVUR4Rq3RwRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6743
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jiri Kosina <jikos@kernel.org>=0A=
> =A0=0A=
> On Mon, 17 May 2021, Yiyuan GUO wrote:=0A=
> =0A=
> > The function wacom_bpt3_touch_msg calls input_abs_get_res(input,=0A=
> > ABS_MT_POSITION_X) to obtain x_res, which may equal to 0 if=0A=
> > input->absinfo is NULL. Since x_res is used as a divisor, this=0A=
> > may lead to divide by zero problem.=0A=
> >=0A=
> > Signed-off-by: Yiyuan GUO <yguoaz@cse.ust.hk>=0A=
> > ---=0A=
> >=A0 drivers/hid/wacom_wac.c | 2 +-=0A=
> >=A0 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
> >=0A=
> > diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c=0A=
> > index 81d7d12bc..a5a6fb8bc 100644=0A=
> > --- a/drivers/hid/wacom_wac.c=0A=
> > +++ b/drivers/hid/wacom_wac.c=0A=
> > @@ -2892,7 +2892,7 @@ static void wacom_bpt3_touch_msg(struct wacom_wac=
 *wacom, unsigned char *data)=0A=
> >=A0=A0=A0=A0=A0=A0 bool touch =3D data[1] & 0x80;=0A=
> >=A0=A0=A0=A0=A0=A0 int slot =3D input_mt_get_slot_by_key(input, data[0])=
;=0A=
> >=0A=
> > -=A0=A0=A0=A0 if (slot < 0)=0A=
> > +=A0=A0=A0=A0 if (slot < 0 || !input->absinfo)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;=0A=
> >=0A=
> >=A0=A0=A0=A0=A0=A0 touch =3D touch && report_touch_events(wacom);=0A=
> =0A=
> CCing Wacom driver maintainers in order to get their ack.=0A=
> =0A=
> --=0A=
> Jiri Kosina=0A=
> SUSE Labs=0A=
=0A=
A NULL input->absinfo is very much an unexpected condition. We've either fa=
iled somewhere during setup or things have gone off the rails afterwards. S=
ilently limping along like this is a bad idea. I'd really like to see an er=
ror message logged and the device removed if possible.=0A=
=0A=
Jason Gerecke=
