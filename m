Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 946E210E9F4
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 13:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLBMPk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 07:15:40 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.113]:58238 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfLBMPk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Dec 2019 07:15:40 -0500
Received: from [85.158.142.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 1B/19-12310-76005ED5; Mon, 02 Dec 2019 12:15:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSf0xbVRTHuX2v5UH65qVAuEOoo1tmBrS0QOD
  NiI5kYZioUeOicWHjlT7bJv1lX+tg0YTpFmEdsayw2TqkWxiYTjMt21xxi1jQ0Uk7xaljbrPZ
  asKPTWenU0CKfX0w9b/POd/vPeebm0NgkjFRPsE02xiriTbIRJm4rkxYJdem/dyg9A5JqN7Ri
  JAaOToFKF93AKcm4/eE1J2h7zBq77nR9E2i+oDnWnq939cuqn97UVl/1y99Bn9JqDepzc2NQl
  3UHcUsow80+z4OCVpBQrwPZBIAHsOQ5/AAzhdf4mjK4xLxxSBACx1zqQKHYxgKf3tIuA9kEBL
  YLUAHB7ZyggRGATo/FgCcIIIUco1FUy9y4PsCFN7jFnAFBj8EyLMUwThXNtyBXFfmUqNyYCO6
  5fJgPJejL4ZncY5xuA7NdC4lJxEECWl0p2c7v9mEFnw3UpYMWIM+aBtKPQWwEP2++3iKMZiHr
  sR6BRwjCFHf2YsYz7lo+mZCyPsZFHrjMuD7pSj8Q2yZZei9ntFlLkQTvY5lfgpNHooIVvzDny
  0t9ynU59iLczFRMnIi2MKjBb1zW8E71iN/52kR3y5AgbkK7kMQjAnRR2emcCco8/wnNM+lyPt
  pXMRzCeo/MotxTMIsFHLHcC/AfYBSW/Vanc1I6w1ylVIpV6kq5JXyCqWC3iVXKxi7vIkx2ax0
  UlTQO1kF22JsMmgUJsbmB8mj0ryCS8+AA/duK4JgNSGQ5ZKLd2MNklVqs6ZFR7O6HVa7gWGDo
  IAgZIhMJJJalpXRMs0v6w3J01yRESGW5ZBBTiZZC21k9VpeugDkhHO65ygmwU1mE5OfR9YtJU
  2QM+nspvsjVg58AhTmZ5MgLS1NIrYwVqPe9n99BuQRQJZNruGmiPUm2/1NM8kQgmSI6j03uBA
  2+l8pv1WAHvnrqv3JSs2q/hPjT0iuqrdIBXXd5wPljsv21R1lsSZPR6VUXGfePngBPyv/u2rr
  NXf7eG5PjdOxXmyJ/DZfWl2jI5/Ham9a2Dj5o6zYMJ8Wmq1trKp7sFZ73Qs3b8t4OhwaOXfp8
  /STuyaqVV3tuGbLQfrd71s2hX7JerG1zflJ5JL6tQMb3oyK1t6iHPPFXw1nbju8tsj5xzezuj
  Wh8MNxy6mcrqoNbX++4PI/VD4Unu5bHNl8ZPr1yeGLAw3GokHzsxWvjtOPnpT1S09v3F+DTwV
  /feu5IqGYuh4Aj8f3e3cHH6vu1Bd0lR1XLOSWZu5ki0+VrNv404j7RFtJ/Nj81zKc1dGqYszK
  0v8AHQiQ41sEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-22.tower-239.messagelabs.com!1575288934!672342!1
X-Originating-IP: [104.47.5.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12649 invoked from network); 2 Dec 2019 12:15:35 -0000
Received: from mail-he1eur02lp2054.outbound.protection.outlook.com (HELO EUR02-HE1-obe.outbound.protection.outlook.com) (104.47.5.54)
  by server-22.tower-239.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 12:15:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5Ch+8Uc55gCEq/EWnJg3Aaws595QCKCFP+yEq3J5umm0GaUPl2WYi0xFMxBCedwz3vq0ScjEOXdZhUmiBWJOQ6tXGvAqT4uihbk/Fkm1Te01P4R2EQqbIwYW5eN+QfbIaoX34sNp7PqgWzocP2ze2maKRNjLUdJ2m6h2Ili/ulB4epLuJ5Q63aJUX6XYPy8hzvnA9T/Rk1bdn7L4H6ACfz9vfmSoajMGmE5s8ZCgYJtmN1BGQoyHySVYdhmkiKzZ4MVV/K82dq0AbNAnGTpcQq8CSgqR96ndjur0ZQqskzEI4/E9kumOAhl6X1YK5lyQhYM1EBLDAGIXnXZYVVc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5v/avFGS/8F3PNLz03y7Ei2XfGh/c+vPKiA8Rt2c4U=;
 b=bKucSfeDxUdf15t/qdy/pJ11szS6CYSwxN1vgSkVZb6bX/5PanNpX7DGLHRQaEjTa+CQP0vy5700DhuZ7AmhUGMF3v3oJXRU78F9ZIXXMxB8/zzNbXOcEmGmwYU8q3Vqc5QDME3gfzZSbeUj/MhLbFUJP2tLYnS/diBeHkKiU2LzYvoWCxG7Ff/4JcsXQ1C4Evd+y+ZeVWg5EZpSC5yh6bhjMX/rqbZms1h1HhtxGBfEyZP60ZbMvoaLSlzao9FvJjHIdhvLkkqv5cOkfLJeDmyD1YEl/MuSERRak8AUyscuFkdZL/7cPxLze9VMpFcP+gaumc/YlvNvLzixJ9Kcog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5v/avFGS/8F3PNLz03y7Ei2XfGh/c+vPKiA8Rt2c4U=;
 b=IiAO5LIsWj8Oy81JE8ilNaQgy2jnS5onO/avw9c1XB/+VgIONhKDnre9SGW1/a1BxyDK35rSiaVKHG/VcGE+ebiC/rZ64i8Ycyq5vH6LSY2Q3SfeTCV+cOXLd/Iz9YG5mXUVXF7GOxda/GQh7JNO1u3GqRpUd6iaPbXLKsqv9xw=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM (10.169.150.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Mon, 2 Dec 2019 12:15:33 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 12:15:33 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Thread-Topic: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Thread-Index: AQHVpSXRUU8r21ku9EatdfUM8rH4w6emv+kg
Date:   Mon, 2 Dec 2019 12:15:32 +0000
Message-ID: <AM5PR1001MB099439FC20DAEBFC6584081280430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-4-m.felsch@pengutronix.de>
In-Reply-To: <20191127132304.22924-4-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b54aaaf-c1b1-4a51-2af8-08d777215470
x-ms-traffictypediagnostic: AM5PR1001MB1060:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1060EDBB5E1E81694A77BD7FA7430@AM5PR1001MB1060.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(376002)(136003)(366004)(39850400004)(199004)(189003)(52536014)(25786009)(8936002)(66066001)(6436002)(4326008)(11346002)(446003)(71200400001)(66476007)(229853002)(2501003)(2906002)(76176011)(7696005)(26005)(186003)(6246003)(55236004)(102836004)(6506007)(316002)(5660300002)(110136005)(81156014)(54906003)(86362001)(8676002)(53546011)(81166006)(33656002)(478600001)(55016002)(9686003)(74316002)(3846002)(6116002)(66556008)(64756008)(66446008)(99286004)(7736002)(76116006)(66946007)(305945005)(71190400001)(256004)(14454004)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1060;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wrg3f+UPiAD3BCmhpVIZwYyajmm5Ie32u0zc0oLhWu8LJekCGW4DF3MEqThjMPVSHEP6uKrdE0kMknKYlrCD+B99qyXJRLS5/rEkDrzSR/ysBDZTM9MgKMQsDwNrMDIadrOKEP2SkzJczux9r5MowCX/52AqO3T2GgMXSK5ul1H5m/AdPsazUg1EA4xPhEtJtulkxJRJsiPDAkx4wZHxTYJTv2i3/hez4P14QcjToK/jxTQPAbcqTAekSK4VvfzCLWe/C7PQqZ+1xXMbeg2MpyHTmj7Qm8lZ1gq0AtwdCu3u9LOAP8DGC47Tzk/9KBd4gs37uT31FRIqxSv7EQpCnxewE4iKgA8yxBOdlub982EYZ3IjJE8R405B9fHlvv2hp2JBS1L66Aw+92dSwB6uwv6l+oIlyg7NHUb0COUOrZGSw2iZfwMYzpUKd38VLxV6
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b54aaaf-c1b1-4a51-2af8-08d777215470
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 12:15:32.5769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DCExpF3/7F+dwgIChcK3ZSamimtoNGkHDaNmx64ZeHyCWA+lQPbaA4ZZ0YlPxVODPd3MJOarcnAmNoJCttzMRmnUD0yB5keOuKoNvnXWh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1060
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27 November 2019 13:23, Marco Felsch wrote:

> There was a bug within the driver since commit f889beaaab1c ("Input:
> da9063 - report KEY_POWER instead of KEY_SLEEP during power
> key-press"). Since we fixed the bug the KEY_POWER will be reported
> always so we need to adapt the dt-bindings too. Make the description
> more precise while on it.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v2:
> - change description according Dmitry's suggestion.
>=20
>  Documentation/devicetree/bindings/input/da9062-onkey.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index 0005b2bdcdd7..9f895454179d 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -15,9 +15,8 @@ Required properties:
>=20
>  Optional properties:
>=20
> -- dlg,disable-key-power : Disable power-down using a long key-press. If =
this
> -    entry exists the OnKey driver will remove support for the KEY_POWER =
key
> -    press when triggered using a long press of the OnKey.
> +- dlg,disable-key-power : If this property is present, the host will not=
 be
> +    issuing shutdown command over I2C in response to a long key-press.

This also changes behaviour of button press reporting as the driver will no=
t
report a longer press (i.e. a button hold where the driver polls for releas=
e).
It will only report a short key press to user-space with this property prov=
ided.

The question here is do we still want to support long press reporting but
without the I2C sequence for shutdown? If so the driver needs to be updated=
 to
work this way as right now it doesn't.

>=20
>  - dlg,key-opmode : Set the nONKEY behaviour. This value is initial set b=
y the
>      otp values. See nONKEY_PIN register description for more information=
.
> --
> 2.20.1

