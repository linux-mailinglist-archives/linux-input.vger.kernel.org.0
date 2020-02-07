Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2058155314
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2020 08:37:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgBGHhE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Feb 2020 02:37:04 -0500
Received: from mail-eopbgr140072.outbound.protection.outlook.com ([40.107.14.72]:54740
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726136AbgBGHhE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 7 Feb 2020 02:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9K+FxcNOkCSRCC1a2XshiVm3icLMtkQD6utmPgcZPEFnPlnMgCcc5mQlkm13Gi1CUvwGQR651V2+TP5Sw9bwgvs2q+KvvJxcH4dU1s8n/dDlV++kxgrLmzx8PGKPi+dpbPT5AGZUG7ueTHMc232nLTTNO0G6znJuPH4IWh3AgHi97kYAOJg2sYt5koFKqgN9GYjg+eeNM1RG8Pwz943zmLlkJxAs44mbpdxxdJJGMVilrJiwZzSuLXGAvZqbKM3eVu/8b7h+G1CSZ0mUf4rYbhyzJ7C8Iy+FRpy4N92u5f29Q3Yk1PXdjGGtQhWqMwiFWHVNaA4ZqcQOi5Im0lIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TonupJVX6lcZ/M4/yDVPGJ+52Btda+VNZDZ3nh1xoPI=;
 b=fOPxO6nBiyPMCxTpQVJdugA/jw7mSc+e3zfG8djGxHwq3vQ5nK82aYSgRh/prOd3n0dzgu7AAk1lHjG55H7CsP/nhER2vw8ejmTZxa9/7S0wbXE01IgChcdHFeQKkFCiaZHpm75ShtCKosxBhWNg3WSO3g0/OLia9+AGuY+RVIkwhZ7EVXDRAPHONlJuA+bmTcXf9uBzy9VZvZyty3bCYa3ych9L7GPqvkg5M+vzJAb8KtaAopzXa1BZQXGkh6fb4T0voRB0qX7c0wYK2uDtDVRXol1BA6JJ2dI8rrahZ9siaZ7VnU/0321u7lgkOu/zyNgqVEsR1TsxmxNXKL9sPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TonupJVX6lcZ/M4/yDVPGJ+52Btda+VNZDZ3nh1xoPI=;
 b=Q6+3f/HFutM8sNpF07h9ohkUIQqUCkF75QVBLOiv7Uev7ruuLJpECepdOJOLWR0qizWi926wPtj+y7z+q7HKZ8m+JM2TTMyZ+j6G9NYa9r6ypOjKFjjZavPpWEbSU7RidHtng+Z41eH2tr7EacULOI/ZG/WUaq6OWAAqPqW4T7w=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3504.eurprd04.prod.outlook.com (52.134.4.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Fri, 7 Feb 2020 07:36:59 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d%7]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 07:36:59 +0000
From:   Horia Geanta <horia.geanta@nxp.com>
To:     =?iso-8859-2?Q?Andr=E9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Anson Huang <anson.huang@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx7s: add snvs clock to pwrkey
Thread-Topic: [PATCH 1/3] ARM: dts: imx7s: add snvs clock to pwrkey
Thread-Index: AQHV164xC7dgwu9e4kaRkYTJlTesdg==
Date:   Fri, 7 Feb 2020 07:36:59 +0000
Message-ID: <VI1PR0402MB3485BFC1B2BD9842ACE2E834981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4612cabb-3d35-467a-cb43-08d7aba083e9
x-ms-traffictypediagnostic: VI1PR0402MB3504:|VI1PR0402MB3504:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB35048F878DC6960B70EFDAA0981C0@VI1PR0402MB3504.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(91956017)(54906003)(316002)(76116006)(110136005)(64756008)(5660300002)(55016002)(9686003)(52536014)(7696005)(66946007)(66556008)(66446008)(6506007)(53546011)(66476007)(26005)(86362001)(71200400001)(4326008)(8936002)(81166006)(7416002)(8676002)(186003)(44832011)(33656002)(81156014)(2906002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3504;H:VI1PR0402MB3485.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ihjRnMdEf3l8PtR7XKZ4R1tZirSdkkpxhn02dHsiRWsw5k8r63ByyjeJY2T4ci1hylTRWhbV2WOYrD0PIN2fNVawz4p6rmYiCnrUZzPhayupKdxAxHPLkrhgNOt+6ogT+8C3fDC5gcNTFTUzL3NWd+nCCfd8jn6UD8qWMh9a14CVbXoCPPg804UrPkE2yZVfaAwGgWxNkAmirFMhTtpvCImVwkMw4AtRURqnGyn4tQ3Ky/+5iiFffgxe2a1PJvA39N5nzBeBoheVZ8VLE3V4AMJSwWDTOQZcKXRaHbfIy6wUh1nnXiCmByyp9k2Y8MoVumZvNLqjr9AYnHQh3ciN+X7gWrqFU78ZoI3dn+oUG6H7gnHsaORMAVm7Fb50abZHR5Cv8ifKDtuOXTCfxXHl7AgP2VSEfxTQlOcNFF7/PTQoz7QuJsU8ChE91QU1XxDI
x-ms-exchange-antispam-messagedata: ucqayEml1S6C62EefBkbdxoSRBB41cCfRm+t60A+qogsIMg5eDqXIYfZcZpdHD/uuLcs3Fx0hxKtiySbyLdta/6j8EWNjEAq5R/7czCzKXa9i7uzVMKAqfk4h1FQwFaq424EgugMzXP0SLpVwjZcew==
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4612cabb-3d35-467a-cb43-08d7aba083e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 07:36:59.1489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOuPcsjVHOIs+tb67ieQ7Muz5PeCd6d0AGipbbS02y0+BA4b5FN24TIsyclmWaVarvQ9trl8PtF6rnjgzh+gCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3504
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/30/2020 10:45 PM, Andr=E9 Draszik wrote:=0A=
> On i.MX7, the SNVS requires a clock. This is similar to the clock=0A=
> bound to the SNVS RTC node, but if the SNVS RTC driver isn't enabled,=0A=
> then SNVS doesn't work, and as such the pwrkey driver doesn't=0A=
> work (i.e. hangs the kernel, as the clock isn't enabled).=0A=
> =0A=
This is true also for i.MX8M.=0A=
For this reason it would probably better splitting the=0A=
DT bindings update in a separate patch.=0A=
=0A=
> Also see commit ec2a844ef7c1=0A=
> ("ARM: dts: imx7s: add snvs rtc clock")=0A=
> for a similar fix.=0A=
> =0A=
> Signed-off-by: Andr=E9 Draszik <git@andred.net>=0A=
> Cc: Anson Huang <Anson.Huang@nxp.com>=0A=
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0A=
> Cc: "Horia Geant=E3" <horia.geanta@nxp.com>=0A=
> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>=0A=
> Cc: Herbert Xu <herbert@gondor.apana.org.au>=0A=
> Cc: "David S. Miller" <davem@davemloft.net>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> Cc: Mark Rutland <mark.rutland@arm.com>=0A=
> Cc: linux-crypto@vger.kernel.org=0A=
> Cc: devicetree@vger.kernel.org=0A=
> Cc: linux-input@vger.kernel.org=0A=
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>=0A=
=0A=
> ---=0A=
>  .../devicetree/bindings/crypto/fsl-sec4.txt     | 17 +++++++++++++++++=
=0A=
>  arch/arm/boot/dts/imx7s.dtsi                    |  2 ++=0A=
>  2 files changed, 19 insertions(+)=0A=
> =0A=
> diff --git a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt b/Docu=
mentation/devicetree/bindings/crypto/fsl-sec4.txt=0A=
> index 2fe245ca816a..755c2838d658 100644=0A=
> --- a/Documentation/devicetree/bindings/crypto/fsl-sec4.txt=0A=
> +++ b/Documentation/devicetree/bindings/crypto/fsl-sec4.txt=0A=
> @@ -449,6 +449,19 @@ System ON/OFF key driver=0A=
>        Value type: <phandle>=0A=
>        Definition: this is phandle to the register map node.=0A=
>  =0A=
> +   - clocks=0A=
> +      Usage: optional, required if SNVS LP requires explicit=0A=
> +          enablement of clocks=0A=
> +      Value type: <prop_encoded-array>=0A=
> +      Definition:  a clock specifier describing the clock required for=
=0A=
> +          enabling and disabling SNVS LP RTC.=0A=
> +=0A=
> +   - clock-names=0A=
> +      Usage: optional, required if SNVS LP requires explicit=0A=
> +          enablement of clocks=0A=
> +      Value type: <string>=0A=
> +      Definition: clock name string should be "snvs-pwrkey".=0A=
> +=0A=
>  EXAMPLE:=0A=
>  	snvs-pwrkey@020cc000 {=0A=
>  		compatible =3D "fsl,sec-v4.0-pwrkey";=0A=
> @@ -456,6 +469,8 @@ EXAMPLE:=0A=
>  		interrupts =3D <0 4 0x4>=0A=
>  	        linux,keycode =3D <116>; /* KEY_POWER */=0A=
>  		wakeup-source;=0A=
> +		clocks =3D <&clks IMX7D_SNVS_CLK>;=0A=
> +		clock-names =3D "snvs-pwrkey";=0A=
>  	};=0A=
>  =0A=
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
> @@ -547,6 +562,8 @@ FULL EXAMPLE=0A=
>  			interrupts =3D <0 4 0x4>;=0A=
>  			linux,keycode =3D <116>; /* KEY_POWER */=0A=
>  			wakeup-source;=0A=
> +			clocks =3D <&clks IMX7D_SNVS_CLK>;=0A=
> +			clock-names =3D "snvs-pwrkey";=0A=
>  		};=0A=
>  	};=0A=
>  =0A=
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi=
=0A=
> index 1b812f4e7453..6240a6f58048 100644=0A=
> --- a/arch/arm/boot/dts/imx7s.dtsi=0A=
> +++ b/arch/arm/boot/dts/imx7s.dtsi=0A=
> @@ -614,6 +614,8 @@=0A=
>  					linux,keycode =3D <KEY_POWER>;=0A=
>  					wakeup-source;=0A=
>  					status =3D "disabled";=0A=
> +					clocks =3D <&clks IMX7D_SNVS_CLK>;=0A=
> +					clock-names =3D "snvs-pwrkey";=0A=
>  				};=0A=
>  			};=0A=
>  =0A=
> =0A=
