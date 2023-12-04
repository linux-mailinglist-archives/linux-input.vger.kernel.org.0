Return-Path: <linux-input+bounces-454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94B803111
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C405B209EC
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6295C224D9;
	Mon,  4 Dec 2023 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OHygp4Y0"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9D6D48;
	Mon,  4 Dec 2023 02:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR1kgSfMf9ljO+ms8JQTKcV1BSMsg42Gb4tJsg+j2rs1Tvr6IwvfV7WUXyXU7CbU2Jju8nTPkUAwXureHOHgWiTj+FrgUkA8sR+tN79Q1ORmNZYFAhOXPpJrmHjiPDpG1djH00kd6j1TzoxnjwptHWyo/7jZmgJuKMHl4i+x9fYO2nl82k6BVACJSuVfRDjYBTQkeW/lgv9rxPcX85e6m3O3BVBXRaAa5253iI9hjOvGRebwne5h8aNjcO8KtTrAY2R2ULWVJV802JkHo1WCAf9bGcltRhWieBm7Qpb04VMijdp7FcqQKrSQYiEELNF5GVGDO6J8oMzSkiCecCV4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvYnMiRvQ3uYXk3+2lTa2jUELYzKmJXPdMEogkKpm/Q=;
 b=kMES+CP9hmN5Ku+5IUAnPyJlD3Z7ThdXaii2xIfCa9yUk6+/0PyLNSuNSbv9gjyHt/LwMtEHENGrBX6MXbk9KN8kL3pXYLAEoD3iWcu/oGkggtyYKMs6gnxaDnbkQlQpHFIM12K+Ym3tfe8n5mdfU9bqbM75E6d446Q7ujF/7d4DjCmqdx5uNIicmL3jb9DVuiNT/NigexJOziyOXrVpewVF2CYzdc5x0k+4SvQn5DGNLf8s9Xb1HfMfoqSCvKUi3fYugyEdny0a/aX+x8s1oZmn3zTYp4T1SPgcFJgORvjmapQpwcLCpory1d0Gp/wLSbpk6AczajIB9tJ/MgcR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvYnMiRvQ3uYXk3+2lTa2jUELYzKmJXPdMEogkKpm/Q=;
 b=OHygp4Y0Ph/4/UH2dek/UdqJs6P/Z3Rvs8LJB0nhqZyk9zB9u8oYH9iHVoqK1Yc+xSnyhXed5g36yx8cgDgNAeuaDkA5d/EoviwXgcFLLf8aYwqyEOhJFMhLqxDiZ9xyDOndHI5j5kOvqCYk/MlAxRLhad7UyRK3T0DUm3vKwGc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB8122.jpnprd01.prod.outlook.com
 (2603:1096:604:166::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:58:23 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 10:58:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Thread-Topic: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Thread-Index: AQHaJVVo5pef/q5Tg0+CFbpInSqy6bCXbxwAgAGHKWA=
Date: Mon, 4 Dec 2023 10:58:23 +0000
Message-ID:
 <TYCPR01MB11269DE536335D0E42FB5DF688686A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-1-biju.das.jz@bp.renesas.com>
 <20231202192536.266885-4-biju.das.jz@bp.renesas.com>
 <20231203-protozoan-degrease-432575e9dc1d@spud>
In-Reply-To: <20231203-protozoan-degrease-432575e9dc1d@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB8122:EE_
x-ms-office365-filtering-correlation-id: 7c14cb31-0361-47ef-8659-08dbf4b7ef2a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f01o5TC0dvIcuzrO68uTKSzeDBhv/PynLX5ZbJlqkpZ2NTVs6d2+9mjcikO4SQKtbToxgFjtYMQG8yd00oYN6jWpZnLA9nJQg1mHjUZP5hy5/4cI+YnSToQqyNnJTnNkZ0h5KK4F9pVWnPSuEc8T6TotRU3BWYG6PaCQ59FEgtLvZZAK6BFm65BePQUoAVIh4Z/n1NZiS5dw+ggsKlubKaKTskc40peByIOlwSzvnaMTUTGZCXf5hL/VySSW+U2yo168cgmzaUYYvYBeEOEG9lWGBXSlShMi93wZxpC/cg4vDr6E6gAkpYqjqzTJxAmJkX0+aICxqlDriLtFVvueYTaWHzQxB2DUL+2t2ZrXvV/Y+8aoZ4GGGeR044eCI6FbIej+NhTdg+H0if9B4wRyUX0/gKCYJxuDjtvGLLW80ZLFCXfgH7SEYbz4pmur7Gxb6nssSN5g0PBKABddhruzwpj2IcxGX85vDizCWXvx1NqF3R0hZz+bdMSXOKB0K7Nshvqdg6ttn9Gml21ICZBmNMudsjmcAGVzhcSsO2VfMdhrH+vgqm1mftWhLjb/AJfisAlKjpP7qLIRghJm35EKc2BoPTfgRacd55+Y0uMgRM7mV6TnC2dR5gMn/gR33AZY2S8CABKpTIIS6afUsvZIfg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(55016003)(122000001)(33656002)(66946007)(76116006)(66476007)(66446008)(66556008)(64756008)(54906003)(6916009)(316002)(83380400001)(41300700001)(9686003)(38070700009)(38100700002)(2906002)(6506007)(71200400001)(478600001)(966005)(7696005)(7416002)(8676002)(8936002)(52536014)(4326008)(86362001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uOrFYNqqLfT/udL9M+9MzJLfB3+XPcDFAATKeX0L1tutnhp/fVJfOLrZsFii?=
 =?us-ascii?Q?HrRE/yZQibVBKxH6R/jbGUK8OUkSO4o2GyNLgxl8L4LchQmnSSnDfVxWGUOq?=
 =?us-ascii?Q?qMfbbetF2e0ZKSElzfkUPIzlKKlgCGQLH1eBsGRi1pQo8MD9Am+cku1yMx30?=
 =?us-ascii?Q?STw3rwLucV4qsWp5uy5dyLdFNvwD11doeS5Asj1y1tcLlysHkuwdHaIIXKqG?=
 =?us-ascii?Q?cqL+3xbyo/YU/1jiRih3dQJKqjjR5g1VFLsEy08z1mmhImBT+g4F3P0lT2ns?=
 =?us-ascii?Q?4KP1Vu5WQDO49bJnz/nhEVDfc7+8RNQt7EBAOhGlh9vAUpo503rl4Ev/bBzk?=
 =?us-ascii?Q?2YtfKnOQSFbKhy+vgKkJPYGY0TLPpSM1/+zJxkUvgBfb01ZlbvZcYSPZJi/z?=
 =?us-ascii?Q?eI0/wl6iopLpQbik+jHFt+eqhzwURErh+tIMKcEnZ7RNaJDwzUEjZNpdMY+e?=
 =?us-ascii?Q?KPSeIhi4hJ3NiO6+f+jVWGX2VM6/bMPQdOLkq4ONXFCJ7+z9yiLEmuCt2bb/?=
 =?us-ascii?Q?k72rsld006R59NJ9iR2XJiZdvwVIsQEWUgoXJCfZo2tBQwPnz6NDMM4aJ4Xj?=
 =?us-ascii?Q?XmCw+wsXWXAeu8Z96mdp1OOpG15NhqI2SF9l30/1w++9ddwbBBEhCbiE26yt?=
 =?us-ascii?Q?VzyM5DL59yfYUupvIi3BvaCTiBftcFd8e4HOZjWM8g5wzdH5tTQ8N3rGUVdB?=
 =?us-ascii?Q?TF6AIcmkXEdIAq9FvZHu+OLo20iIC97inSwvMa9PgffaRYXI4jFpT5ZAj1wU?=
 =?us-ascii?Q?w9CvLRGgBfw2Z8Mfk0cU+dCR7eNLaDDMbb29zFZgOrVJuzFXS2kQVu/e9Bt6?=
 =?us-ascii?Q?5QqxThc8ybg4G4UZLkV3mcENI5WhG2kI809/qJH+jJzMCqUq/9tn8dCyqSbx?=
 =?us-ascii?Q?3NXPxEP/AF7HHADo8oeDJc+5jJr/2g/BlFSFpK3GFOQrJ4rqfmMKANMPPvrr?=
 =?us-ascii?Q?cZTjfmMDtd1dO9k0PywKmg12MfwtrnO6PYsLPTuoPWEvVPL2+hj5BC+p4i/M?=
 =?us-ascii?Q?22HoAQthRpv5sf1J9U0uQrvdxaqxLnuKZJqPDbSV2eqXdciy/ZlkYN0tHwtH?=
 =?us-ascii?Q?wReu6zG5k7D1VfFdv3IzbOg9YWHKVObjMBneDLwyS9G3ijUS2EUp6pmst5rX?=
 =?us-ascii?Q?3tJdX6mImLFM7kT91oSnX4ohUW7ah2KdVgHf0wXVFMRbQhjWRLcqubLjzFt+?=
 =?us-ascii?Q?+5ipoMEGMJdQvg9E6ZcDelKd8rd63zi492+DiBpa7CBw2cJXfrXPe26FZIsU?=
 =?us-ascii?Q?xbDUSXhiAji953hGo9lItoDe529cFp89YVplTbK0URNS6PriaATB01zOu769?=
 =?us-ascii?Q?mZXJzi+324JkXu0mIPOAq4kEj71OQ0BBYIDFhJRTQWr8wlhyYDRwUnDEbKSy?=
 =?us-ascii?Q?N0mDgrUtnNaWwPTZEBHAk0G8agCaoscoOBRMYTLDbV5o1Lcey1HQhtt7zyfI?=
 =?us-ascii?Q?VAhfjuciz+PDdzNmP5UXYKilYv3eUpfBSTQTuIVJccYIjnuHF/ndBnF4N22z?=
 =?us-ascii?Q?I9WuaP/R2m6p/Vwk/i8DRgZ9LGlsxwH5DzPkAfCsV/IRA8C5weqpRLtn+1GQ?=
 =?us-ascii?Q?fZ1MLIOimw5ls/6tUlnRobq4lNX4pmgwgJs8qCyasozIlH+KnK85uMqagbLL?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c14cb31-0361-47ef-8659-08dbf4b7ef2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 10:58:23.1746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ohh1EqwJ36zLsou1V/iqci037pLspxQehMdAfnScVXstGiHQkbDD1XgxBsKftcJNZWC6WO3mJvdmAEl5pUAZPXrK2QezyTYM1JUYEInhwNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8122

Hi Conor Dooley,

> Subject: Re: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3}
> onkey to json-schema
>=20
> On Sat, Dec 02, 2023 at 07:25:27PM +0000, Biju Das wrote:
> > diff --git
> > a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
> > b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
> > new file mode 100644
> > index 000000000000..34f2e00cf045
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/dlg,da9062-onkey.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Dialog DA9061/62/63 OnKey Module
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  This module is part of the DA9061/DA9062/DA9063. For more details
> > +about entire
> > +  DA9062 and DA9061 chips see
> > +Documentation/devicetree/bindings/mfd/da9062.txt
> > +  For DA906{1,2,3} see
> > +Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > +
> > +  This module provides the KEY_POWER event.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - dlg,da9062-onkey
> > +              - dlg,da9063-onkey
> > +      - items:
> > +          - enum:
> > +              - dlg,da9061-onkey
> > +          - const: dlg,da9062-onkey # da9062-onkey fallback
>=20
> Same comments here.

Agreed, it will be like

    oneOf:
      - items:
          - enum:
              - dlg,da9062-onkey
              - dlg,da9063-onkey
      - items:
          - const: dlg,da9061-onkey
          - const: dlg,da9062-onkey

>=20
> Cheers,
> Conor.
>=20
> > +  dlg,disable-key-power:
> > +    type: boolean
> > +    description:
> > +      Disable power-down using a long key-press. If this entry exists
> > +      the OnKey driver will remove support for the KEY_POWER key press
> > +      when triggered using a long press of the OnKey.
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      pmic@58 {
> > +        compatible =3D "dlg,da9063";
> > +        reg =3D <0x58>;
> > +        interrupt-parent =3D <&gpio6>;
> > +        interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> > +        interrupt-controller;
> > +
> > +        onkey {
> > +          compatible =3D "dlg,da9063-onkey";
> > +          dlg,disable-key-power;
> > +        };
> > +      };
> > +    };

For consistency, I have updated the example similar to watchdog. Same case =
for thermal.

examples:
  - |
    onkey {
      compatible =3D "dlg,da9063-onkey";
      dlg,disable-key-power;
    };

Cheers,
Biju

