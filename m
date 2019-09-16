Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E03AB3D14
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 17:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388884AbfIPPDn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 11:03:43 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.115]:59636 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725798AbfIPPDn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 11:03:43 -0400
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 4E/A5-31151-B44AF7D5; Mon, 16 Sep 2019 15:03:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUwbdRjH+fWu1wOpHi2EZ43VeMOpk9Z2kFk
  T50g0GSEuMXOLcQPdtZy0WzmgLVmZEDYiS8rekJcFS0pHZcx1Mk0nmbDVAWML4ByDCMIIBoEO
  KJgsw2GAjNnrlan/fb7P93n7/fKQmGyAUJCs3cZaOMZMEzG48Q0iRZXRVJql6fzzJZ27+45Yd
  8Mzi3Te2jZcN/pwSax70D6E6cr93ZI0Ir3NOS5J93kdRPrpx5r0Rd8LH+B7xSZOn2ffLzY++t
  4vyT/2jH1wZUlyBF2IrkAxJKLOYbDiqsAEcQuHn2/2E4K4jGD15HJY4FQPBjdu9Yt5IaNqRFC
  +NhIRUwj8az+IKlA0SVA6qO6ZCJfEU4sIWryViBcY1YLglLM9JEhSTn0I5bPFfEE8tRsW3I+Q
  wFtgbi5I8IxTL4OjqjLMUoqB0YAH41lGceBuXA7Ho6ltEJgcDg9GlBL+OnoxnINRiXBv2h2OA
  0VB07V+TOAEmJtaEwv5LPSWjSAhngy//DYdYRoaXN0RVsKg+3iEd8JAsEHEvwWoAIK2yyew9e
  Km1fYI66DpeDkusAJ6Bm6K+fcClQRrXUVCOB86ApciPTfBYuBXrBJpnP9ZW+BkOHv1ISHw69D
  cOI85w18RB71fTeNnEe5FOr3FlGO05TIms0qr0ai02hTVVlXqFjVzWKVXs4UqA8vZLEzIVDOH
  rGprUa7BnK3mWJsPhe4qu4DY/CNqdC6ou9AGUkQnSJV0aZbsWX1edpGRsRo/tRSaWWsXep4ka
  ZBubwx5cRY2h7V/ZjKHrnPdBjKWjpfe9oRsqTWfybWacgSrD6WQlXMuD0b2eps8mAzn8jhWkS
  h9wnei+FRjIfe00fqlDyKlQi5FUVFRsth81pJrsv3fD6JEEtFyqY/vEmvibE/nBUOriEKrvGY
  o4VexMf9aiiOiaLJTXjT5+e/3P6mrfuvY6OMx8PtO0otft15/21s7eTrmSam8bzm1viTtwMrw
  ruhrOgd7QHJ0dSYX7B2dP2WtOf0+15utVYs76OFAcT32fp3/47iP8lpvuzYukImHLs4MNWAbD
  EvSg+lRZ8o1kmTfcx3Kgh27LvjbhpP+Tr1TmDm+9TyTVnsKfzXp7r4zyeN3SWnZ+XcciZmGby
  qqq+o1G8WH5fMJjukXN5VpJ2bnr1x5ZUQ00+wJPpgqyVL88d3ezJk+94QzwVxjbRna82VNXQV
  hr95/f3fGzubrNXpu2xcZV1P60T5nS4xNOR9vufdu8Xbm4PKl94JjBcpv7SfGipleGrcaGe1m
  zGJl/gGT9TMXZAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-24.tower-246.messagelabs.com!1568646218!46620!1
X-Originating-IP: [104.47.6.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28988 invoked from network); 16 Sep 2019 15:03:38 -0000
Received: from mail-ve1eur02lp2051.outbound.protection.outlook.com (HELO EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.51)
  by server-24.tower-246.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 16 Sep 2019 15:03:38 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hduHPJJSGIsQTzBT6MHPbMpvgKPeWzl/J3+IR8MhFt+gmIrFNJi9ROgUYi8tfs34WsDbha3ryOrH7JfoavfRN90jCR4VFCSobMWD2wv8YIEhvuGqXJOJatSziNY7p92e7iGkty+FiYavVdvOXpU6TBlxitA4fx7jZwIn9Ag5ZCLQDjRwMhlEuzEx/2SjSzHO91HU14EcorezUFNUNhQRbGtEPbq9gCkgXO3ZQUJADTWrFJelEOvb/FlnRdtZfWosS3EcMMDyza9LLQZ5ewdS78vduQiQyVBEdTN+VWbTGoUmU3E/3FoITobzrlA5ZlfGdCMyf7QhRU2nrXE+z9nSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyEeF0qa72d8z2tgqomCHL71W3hLYpgHI2AQdhacsBo=;
 b=QEDWYg6NzDeLYS6hK5SScP4TRQacS/9fcAnO+/g1yq9nVcqBU1IFhr1/Paa2zqGa7cwH9HV+iJn368mz7vOXIVKfaYzrb2p9oRmwLceZ6KzTaHjbi0n+d0llDzb4slaV6kAaemqL29FL4nqoQzvFCIHgPsdDl6ruLEovs8c3xHwoqm1YUJf/hAlmwuv+Kdc181zu8alTv3T8a2rTd0XqMd2cpAWz50iU+Yn3Bnip60AnDwUFQ8+qSBCTB0D0p2ToX8JB+440B+3rw3xgsSEY+hEqBd1z2odI9r86tm3MGRVz+2iBKnUKXIWLt91x/o0ukc+n3JhhD2ajj6cDZzFv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyEeF0qa72d8z2tgqomCHL71W3hLYpgHI2AQdhacsBo=;
 b=ZW1YOuz0r+NoMU3Gb3ep3TYM37dyI2SdY05TDL38v+PUrSKyNRMbgWGc2m4uijvmJCyZD/NVPaCui+ORboAaEuQLs5eLKo5Olxox77Xddbp1VPf+gi8ZLK5+WM5FGMPShxQd799jVI/OYCVaD1yGVQk9YPsLhbsuip5BYIjIguQ=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM (10.169.155.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Mon, 16 Sep 2019 15:03:37 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e974:b4ff:cb7d:4230%3]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 15:03:37 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 1/4] dt-bindings: Input: da9062 - add key-opmode
 documentation
Thread-Topic: [PATCH 1/4] dt-bindings: Input: da9062 - add key-opmode
 documentation
Thread-Index: AQHVbJedzuOYdPgZmEuukN7TAq6jQKcuZiKg
Date:   Mon, 16 Sep 2019 15:03:37 +0000
Message-ID: <AM5PR1001MB0994D57AE63D69B67D06A296808C0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
 <20190916140358.30036-2-m.felsch@pengutronix.de>
In-Reply-To: <20190916140358.30036-2-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 041ff914-5b88-44d8-7381-08d73ab70d52
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:AM5PR1001MB1089;
x-ms-traffictypediagnostic: AM5PR1001MB1089:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10896A3000DDF4155EEFFC70A78C0@AM5PR1001MB1089.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39850400004)(346002)(396003)(136003)(199004)(189003)(6116002)(14454004)(3846002)(316002)(186003)(7696005)(966005)(102836004)(66556008)(66476007)(8676002)(66446008)(64756008)(55236004)(76176011)(11346002)(26005)(6506007)(76116006)(446003)(53546011)(478600001)(99286004)(81156014)(86362001)(476003)(81166006)(8936002)(71190400001)(110136005)(256004)(66946007)(71200400001)(54906003)(66066001)(6246003)(6436002)(2906002)(55016002)(229853002)(5660300002)(74316002)(486006)(25786009)(33656002)(53936002)(2501003)(9686003)(6306002)(305945005)(4326008)(7736002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1089;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6Ado5e/JGcDUqbd9TJ0z+JHdxtWjONsPytp7yx4VnlKKJpTNGzjQDvekzEpi4L5i5tFkCe1T2+nbIErD54dA4t//niBRRMXHlp8bPNS0lMIyy7S/dV/k0obEbJCpiJOaFLmkYTdtmRvkkw3cvUuL/yjNvqYn6jUwYZP10g4nNEfwjzn/c8e1FluHxntOKlrrrZXwr0rJY7RDnN3sOQUqIR+VjflewWvIRgq0AlpmF3/uvQflXZyLpwiK9ecQv6bRnUnAD3QgLYWbR5GEb4pGM1dveGtsmFLQrvq48LEmqJma+V0Ywu9TL1Mkx88pnjlbPkESnU56tRQXbtsUg5ssfkJAgNVNX7DnUvKAM6OL0Svhdfy69WUHNAs6D2S1c6yBF1Mf8YP1LTs67GuWDx7pg3Xhw2PYbH9LGLYY/4S38PY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041ff914-5b88-44d8-7381-08d73ab70d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 15:03:37.1578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyUI2SyBNyI8KRlz4bisWraRVJCpNcsmuanmu/pFFiIHKqIA2LR/lVWdpr7vFxkIwIoUNuVWNWW6SAoiHt0Gxv3dbEYhHo3koAUgaqP61MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1089
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16 September 2019 15:04, Marco Felsch wrote:

> The onkey behaviour can be changed by programming the NONKEY_PIN
> bitfield. Since the driver supports the reconfiguration we need to add
> the documentation here.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/input/da9062-onkey.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index 5f9fbc68e58a..d1792452ceff 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -19,6 +19,12 @@ Optional properties:
>      entry exists the OnKey driver will remove support for the KEY_POWER =
key
>      press when triggered using a long press of the OnKey.
>=20
> +- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set b=
y the
> +    otp values. Check [1] for more details. Valid value range: 0x0..0x3
> +
> +[1] https://www.dialog-semiconductor.com/sites/default/files/ \
> +    da9062_datasheet_3v6.pdf
> +

As mentioned in my other mail, this can apply to any of the 3 devices, so e=
ither
we need be explicit and say this is only relevant for DA9061/2 right now, o=
r we
should refer to both datasheets.

>  Example: DA9063
>=20
>  	pmic0: da9063@58 {
> --
> 2.20.1

