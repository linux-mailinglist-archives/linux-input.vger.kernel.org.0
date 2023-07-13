Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2287975157A
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 02:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbjGMAoP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 20:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbjGMAoM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 20:44:12 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031E61989
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 17:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hyperx.com;
        s=mimecast20221008; t=1689209003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HHzrtmhTkiXsiLpMn1FKrw+wOzpWGa8F85u672xImok=;
        b=jFNc8WuOL5t9YsYDQuVRpvvVRhl1B03opi5gOWnzkBOI1wCwWZBMa9D9OIk0DvcX1Hmrpo
        lW4S+Cr0VKgYkBJx8ZySJy/YhSr5MaHK1Tkzpx1baU5clOOgcPXj5x4WraEUgo3P416DlF
        6uLUNzbMnf1KIJnydHKUwfgmgkfK/48=
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-_ohPLp77MW6UR6MHz6nd_g-2; Wed, 12 Jul 2023 20:43:22 -0400
X-MC-Unique: _ohPLp77MW6UR6MHz6nd_g-2
Received: from MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b3::10)
 by SJ0PR84MB1824.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Thu, 13 Jul
 2023 00:43:20 +0000
Received: from MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d070:eeda:c3d1:9971]) by MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d070:eeda:c3d1:9971%3]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 00:43:19 +0000
From:   "Nguyen, Max" <maxwell.nguyen@hyperx.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] Input: xpad - add support for HyperX Game Controllers
Thread-Topic: [PATCH] Input: xpad - add support for HyperX Game Controllers
Thread-Index: AdmxO7SKOKq1YFE3Qj+lw7yIOJJAOgCJOumAAHCPnjA=
Date:   Thu, 13 Jul 2023 00:43:19 +0000
Message-ID: <MW4PR84MB1780BBFAD855717EB1EA86A9EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
References: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZKxVBULWtM30ZJ7D@google.com>
In-Reply-To: <ZKxVBULWtM30ZJ7D@google.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR84MB1780:EE_|SJ0PR84MB1824:EE_
x-ms-office365-filtering-correlation-id: 661be20b-433a-41b7-f9bb-08db833a27a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: AyyM9kb+TkJyY8h/j1thOfWiZgXMW8oaa8OKKriRWvZKl5QJHsZvt8D7CEvdyIp6M5UFM3AvZbQHCI7wXYI0RxdiWvVryr7oyP7yuTgn79jpJp1AhJwx1qCevTJ0y87z5CWTEfg1oIMtyFtQjhIjSUAUyEsT/SmJOwZUA0RL1i/OvSiJX7jasE92J5ztvHlUuCY7+K/uSDhp7zS4sP7uKb30LzYP6k18f4pqGJhZQL8YopEPYZxA9l+O8Vd9GPpB+94dWBok7z3/pKRSh3T2FJFvSV2r954FDp1zVa9Srlv9bRBanxeeBZR98FHZgDW8X6qSdejcbFxmQn0btH7LvAMSoAgIx7PtRoiZGRJzVoCpelhmaedMSLJMesok7hXsQhZOc1HrDFhSjwQ3ot1+81kXvVbhWCHWMvEKfs5aShibg5MCwv0GC6SJhpeolqPoT7ak7psnTZbPgPifgVNVfgPzLN9WjbInM8cn6h7m3To48gz8kuN10bem0fd/PQGHfDr5eAOJtHafVftIkCrj2tzj8zbo22kvGwI3X9wyCyjaFeDSJqOyPHnGlL/V+cTr27b0u+T/FDOcLuctNgjL2ixHu2gPucn8benR3LnH+jtsKOQ+YpfxCOL7xb79l8qV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(55016003)(186003)(26005)(52536014)(2906002)(5660300002)(6506007)(53546011)(55236004)(83380400001)(71200400001)(478600001)(45080400002)(9686003)(316002)(41300700001)(8676002)(6916009)(66446008)(66556008)(66476007)(76116006)(66946007)(4326008)(64756008)(7696005)(8936002)(38070700005)(33656002)(86362001)(82960400001)(38100700002)(122000001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LNtvRBu3/suca19WFidZt33bQIkzU6sYjVO+1eArYOz0ODKSra91uDKsAPQi?=
 =?us-ascii?Q?0I2t0nv2DcleMUcJ0P7sIhVPccoQ/ubCF+s2N1Xb9wxZAgbkVlSV7Y52rhGW?=
 =?us-ascii?Q?Qju6OATmqV9zchF7e9t8jYPnk6vkR3rxlRXtrYEtCD/ECoR7UzbCAAuMqpBI?=
 =?us-ascii?Q?COoiu+TsGiRcohL/GHpFFPhNNt8lKBRlWsFzTJ5f9/Ao/0xZbtSjAaVu7F+p?=
 =?us-ascii?Q?HCz3xyzImfcNfnsqSw5t5ddk9oMiYpYylA4bnS2aZsF2zBAU5UaGITzDXoz+?=
 =?us-ascii?Q?eDzxTXVde4kI++TGw8c6tQtmUeOrRAIDIlLjyN8yyf+gtehxGfMZV6PB5rvS?=
 =?us-ascii?Q?/kWbl9fhTIxbGtbbzu8bhiibUDw2ZklfTlx8CNlgcOoo5M41+BT9OzMagqog?=
 =?us-ascii?Q?1J6BGyBYEPx7I0y+1Cz8dRAQFyLLQ1s54Ngo3cobg28e4e3vH38EAlEOa6Ij?=
 =?us-ascii?Q?jeXnPN4fHF6OoBAZQrEsYsZTe7Bvi1W7Bqe+Jse44yN/rfRaATY8Ah5NyKQ6?=
 =?us-ascii?Q?5Nwv4Z0/U7BosLFaTonZ7/1fI0kDuhCBDv9L3zWqlkoWJo5Sdo8BNnEm8hNV?=
 =?us-ascii?Q?BHQ2S3gPV3d6wyYreKWkZYW3heAYb2coA9XwLShKOtxU8lhyA6OO6r/pdVyU?=
 =?us-ascii?Q?vocwyJnGDWR0uw8ENBqZvmxsswSVaoP9H42xL6kGXonMkJ8Uv+HOX3QB90nJ?=
 =?us-ascii?Q?Wv/nfzMk6QRCkxZ2TLNTvJMRxEfcBxKnZkB/pPeGcUDgz6/nQGTHsCSU525B?=
 =?us-ascii?Q?6aKdEfyBRb4WLdu5tcZokx0l//e9vxQ0xMPPRuJHa3tf+OW54QyX0W1t6IHD?=
 =?us-ascii?Q?hGquX/pYWnWnJSL6erZtFIAZ0ctFigo76Zc7loEVWZQnW3QXdjbKBioOQfJD?=
 =?us-ascii?Q?27BuUEIAVhCIzhtV8etojUVSeMGlZCs9bWB1QB4aUw/QizWCos6SMUTfd+yP?=
 =?us-ascii?Q?G+yQiuAW8CVPeqdlLn1wG5stKTqwRSsmmFRKYgjUP235I1CKJM5n+0qzGArx?=
 =?us-ascii?Q?W1y4VctY0CO0F9lzznFIVPqXMoxqyZpSVct4c9ZP3PF0jGP4iTbzGqOH+gZy?=
 =?us-ascii?Q?6zbw0fcjjMN4I4WUrt67MKsEZPJdp74ZxkIU1tR9YBPwHjyAC/HT0tuT/r4J?=
 =?us-ascii?Q?5qvij6SamnJCzhqs7NRSdL9u3KXMSXRgQEzAUAasVtHovL8v9E3wcrAx+11L?=
 =?us-ascii?Q?o+OxX9BxB3zMhe+jehw9OFlDfWDiy94PADabZSQ/E7TcZVYiGJXr7L0OEE15?=
 =?us-ascii?Q?uoT48vEMGrCdWXd3koNoMqOI80QqSCxZ6vgH+oPgowyScBIs9ZCAl0R+kk3r?=
 =?us-ascii?Q?pmE6r93K8CchUaBF1zi91QdwO5bYWnj0RGDnlXxa4oRNoEwjuwwUTfZNTr2J?=
 =?us-ascii?Q?CXTNBFi8kkmq1Q9r1jOJoue/fGvQ6xMFK4fwdJFTLxIVEYi4XvhrEJoHifiN?=
 =?us-ascii?Q?EBwRKoS1o3bs90MzQiDz+kTX6QcSnfpie9AH+CuDHdI3mH4ABCTkbcNF4Wa5?=
 =?us-ascii?Q?7soOeUQG9kNE1KDIX5Q8MH6sc2fRarTqG/FDA/tzrOeFlWJfE8i/m8+3qfm7?=
 =?us-ascii?Q?6K2I9VDUksBb+cKwD9En1qlBz6ypltAUvraOzLgs?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 661be20b-433a-41b7-f9bb-08db833a27a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 00:43:19.8867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XlGCT/EvLIQPLOCohAE19wWB5BqZZDPjj9rsaHCthqbb1WCpJeeXYUkIkapxGZdIr8Wfdx2VB6iwtrTynpI9ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1824
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hyperx.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I have sent over a new patch.  Let me know the whitespace-damage issue is r=
esolved.  I will need to adjust the acks since I had missed it.

Regards,
Max

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Monday, July 10, 2023 11:59 AM
To: Nguyen, Max <maxwell.nguyen@hp.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers

CAUTION: External Email

Hi Max,

On Sat, Jul 08, 2023 at 01:30:16AM +0000, Nguyen, Max wrote:
> Add HyperX controller support to xpad_device and xpad_table.

Unfortunately the patch is whitespace-damaged, could you please resubmit?

>
> Reported-by: Chris Toledanes <chris.toledanes@hp.com>
> Acked-by: Carl Ng <carl.ng@hp.com>
> Acked-by: Jessie Jin <yan.jin1@hp.com>

Acks should be given at least in public and they are typically reserved for=
 maintainers or people actively working on the code/driver in question. See=
 Documentation/process/5.Posting.rst

> Signed-off-by: Maxwell Nguyen <maxwell.nguyen@hp.com>

> ---
>
> drivers/input/joystick/xpad.c | 3 ++
> 1 file changed, 3 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c=20
> b/drivers/input/joystick/xpad.c index cdb193317c3b..a5e507b8f619=20
> 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -130,6 +130,7 @@ static const struct xpad_device {
>                  { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE=
_XBOX360 },
>                  { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX3=
60 },
>                  { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0,=20
> XTYPE_XBOX360 },
> +                { 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0,=20
> + XTYPE_XBOXONE },
>                  { 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>                  { 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>                  { 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0,=20
> XTYPE_XBOX }, @@ -457,6 +458,8 @@ static const struct usb_device_id xpad_=
table[] =3D {
>                  { USB_INTERFACE_INFO('X', 'B', 0) },          /* Xbox US=
B-IF not-approved class */
>                  XPAD_XBOX360_VENDOR(0x0079),                            =
 /* GPD Win 2 controller */
>                  XPAD_XBOX360_VENDOR(0x03eb),                            =
 /* Wooting Keyboards (Legacy) */
> +                XPAD_XBOX360_VENDOR(0x03f0),                            =
  /* HyperX Xbox 360 controllers */
> +                XPAD_XBOXONE_VENDOR(0x03f0),                            =
/* HyperX Xbox One controllers */
>                  XPAD_XBOX360_VENDOR(0x044f),                            =
  /* Thrustmaster Xbox 360 controllers */
>                  XPAD_XBOX360_VENDOR(0x045e),                            =
 /* Microsoft Xbox 360 controllers */
>                  XPAD_XBOXONE_VENDOR(0x045e),                            =
/* Microsoft Xbox One controllers */
>

Thanks.

--
Dmitry

