Return-Path: <linux-input+bounces-599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9A4808DB1
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 17:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E33281D55
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 16:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F72B46B95;
	Thu,  7 Dec 2023 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tNXpzAqc"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 602B610D1;
	Thu,  7 Dec 2023 08:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COrywJh3lNGURlLIgVkeyOAV+855Xmm0NN2OX5DJXULJZyPvzwM2kcQc9BaG2TmFOS1vPHe7HCKnzyei7/c2BBlmmSiudhJUdL7zUjxaIPc5hsZy0WPlkDk4KnC3P1tKuof+oVVONCUIt7Q44K093vlm1m5DUdAPQbnGTsyKBmnlL22WjAxQuhEU94O4P8GAfmHzfBT2FRF7MUzccral4OLzbWuu3e/ZUp2RmPF2pawb/hoioM8M+4g8/MShhlHeOlFsyERa/SQp1bm4qe2Ew+zx1RHdB1Dof+dPc1uTJXjUSqBiaZ8JZwejXi3bzfHIL0+0GVtjfuJeVfS8gnYQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC6Q6XcaUTkq/j8h/M2vTlTVBqjyO51+Z8lOLiKB1Zk=;
 b=nYmTRVPz46bffKiKHBXpQr8F8tXnBt0XZ/7sPvAm4rMIE/fIzU5MQfTDKzfw7DmdAMrwEeymOQKX+9bTJ+s8dlBJOk9egI0k/DeddT+U6ig8DX0C7UYNeuvw/itklm0X/79wqqoKl6sTGE0Hya/J0LEcvzZ+SpJWTqFIg6+5/AXF4bMSi3iZQgoPhAKU9/UoxYowI5sxDDVhteFSCCt5ztv6BpTT0/VXhtMVol5iF8gxt7q1eLqU0gwl/PzpsOWrWWvb1Dvr3yqXlGM8qKou+c7xWsWhfjkTeiXABCgqKMVFCeHORj3X3pU2MpJ5GzArDDfl3FWDspRKTR9eaHF9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC6Q6XcaUTkq/j8h/M2vTlTVBqjyO51+Z8lOLiKB1Zk=;
 b=tNXpzAqcNuOoG8mOtw0u9yjaRMTaAfFh20siBc6EDugzmd3IzghyhRbvlL42z7qzuGomwf4GXFoDI3OwiQHF6CU9u7LfOAIB40Rcw65qX7aUMyG/OgKbOoO3saDzy+FIbqnPXN6KPTsq5jBQ25jtzhOkCqdpnguOakoq50mIYAY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB11939.jpnprd01.prod.outlook.com
 (2603:1096:400:3e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 16:42:45 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7091.010; Thu, 7 Dec 2023
 16:42:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Support Opensource <support.opensource@diasemi.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/8] dt-bindings: input: Convert da906{1,2,3} onkey to
 json-schema
Thread-Topic: [PATCH v4 5/8] dt-bindings: input: Convert da906{1,2,3} onkey to
 json-schema
Thread-Index: AQHaKF0EkoKNlmsKwk+KaIIYLixCu7CdgF8AgACHZlA=
Date: Thu, 7 Dec 2023 16:42:45 +0000
Message-ID:
 <TYCPR01MB11269D1B6D2183207BD84381A868BA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231206155740.5278-1-biju.das.jz@bp.renesas.com>
 <20231206155740.5278-6-biju.das.jz@bp.renesas.com>
 <39094951-6ecb-4948-8be5-7ab13dd5269b@linaro.org>
In-Reply-To: <39094951-6ecb-4948-8be5-7ab13dd5269b@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB11939:EE_
x-ms-office365-filtering-correlation-id: cf782eae-e10e-4932-f61e-08dbf7438a34
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eAb3N8exXGozHaGOUJKx61un1q6dURgVMvvDTDPILEMJEBLIq9hYxTpc8Rac0QPFN7g00Sa41TAtqvLjssxyby6FdC/R0f0MLpDooyrwRX8AJndbW+aUb8MshY2cZtEbCTs/K34EcXePrQgEF9Vi6i1WQDdrq9ULYCf3aKT8tzsQCIvK3ANtAc+C+PLRAFxE7tcaN+HrshC3tSdIY+iNk8psMx7UxJy2OnblWjkgBaD1bgxzlq6I0IM0lDptFHohR1b1kY3ETwkIDSqjZN/FShqQxKP4Pt9OVIV+SjqG7aKlk713EbRHaqW5tkeK88Y9BENZoONcGRuWs0cv2uYv4neHMjHnPxrxCzMeN+huRlmEySpzH+/ftdSLLtxNaaSdnE6jbVAirMNiRMsRECtGW8aOIDGmeiyNU7vNPyCWUYYpGs0CaORytFan8A/jTxv5sbqw/q098CBtEJnv6Z4c1kFrXHMXhGsLgpGlf/7VhXLTJkyQTHbKs9/nTH11O1j9jLjH9/4wsEHtxwYdwVTud3TqI+daDdL53XkoJt2Zc+VIp5fFmajAsKID7rvz3Mt9SFV9KKTa+XPs7h3jJSxD9+QGBu4VAFXIgMYmarPbXNffgmTgL+sP9EDEJyQt2KtZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(41300700001)(7416002)(38100700002)(5660300002)(86362001)(2906002)(33656002)(122000001)(6506007)(53546011)(71200400001)(26005)(7696005)(478600001)(8676002)(52536014)(66946007)(76116006)(4326008)(66556008)(66476007)(64756008)(9686003)(110136005)(54906003)(83380400001)(66446008)(316002)(8936002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tyae5uT4AC0eyiQAPWRlvdN6s7+GkOfTzu5H2fkFCxVZUY9MuYnh+fnGPRg/?=
 =?us-ascii?Q?1keo3XE6FKmb6TuaTm4qY3M/p4zQGaDY8dGubnL0zLX7QvvkWC9aMwqdO5KA?=
 =?us-ascii?Q?pXyyVvXB5NGMCz0IGvNh7x9jmoUVDMwD9jF41oRs3PlfYjReiVjOKl2k7mSk?=
 =?us-ascii?Q?iR2xn7ZdWT0TPljbT5P8kdmKgqJJhSj5Lzy0UMJMFl2L+XO4+ah5aZVw8wWj?=
 =?us-ascii?Q?1XnMFBIYDoWKgA60S/G2FCDdZd130moqJTW+6vQ8iH7k0OimBcaeDPazKDwa?=
 =?us-ascii?Q?kBK6Pp8UZFhDLalJ96ZXdCu3J5PwqD1uudNlmeyWYVBUM8MuHcSmvnqUQ116?=
 =?us-ascii?Q?PMD1C0Ms6ueB77dajv9s39bW/8KjUY2JQerJujld/nAo4+ML0FnuIZaPlxkR?=
 =?us-ascii?Q?oOoLzc1ctBVreIEAb6AP94Fpoue3tJWhShk8HDZ+vrlEXvZyx0LpvNdiWjec?=
 =?us-ascii?Q?LrlLeSZS98Cu+ne3UTJWTkJSblbda09l6esi5e5YlbdOx1DZ9NMZyEeKpuaD?=
 =?us-ascii?Q?zOdNWiw0QVo9ZQZWXYFnf/bHmwVz3IY61JUy5r5w4MvO6dP+XjCg5pG9YW+3?=
 =?us-ascii?Q?MOPKjlzfD0PjMpYL46mIQjgzmi/YIIam6J6ouFI7pdFn2QPk7kQFyUOJ+jqU?=
 =?us-ascii?Q?/52SkFbgCOm0FKdSyg6ckNoHPc9mfvGTAnc4NohelyioldZpBtgUWEoJPLzG?=
 =?us-ascii?Q?3QkJnMkqOqXcw9T2sZlB7glhD0hrLYIeKyI9XxwwTJLGHaSpAXkXakh5ipHS?=
 =?us-ascii?Q?LTJ0FuvKLpJUq5YGH19PsmVjscPI2qHM6qqGXjr2Bbx1wIaiI8iJC6I4R5dw?=
 =?us-ascii?Q?En23kmSNDLZdo8iHfk6a9UQtsRCOCUHItWWLfcI7SlPaSge1Tve0q8SV5FDV?=
 =?us-ascii?Q?2oOaB0rd+L97oX9ix49eKyACWMnce24EC2hA/VQBiM+CmtXxV+FvvKA8BNvo?=
 =?us-ascii?Q?jVFKvNMnbLSau4uwSlxzUJ2c3YEhIVX7QfHfKII0FdLDXD6GJ+KP0fuM9F8Z?=
 =?us-ascii?Q?GK74/UolWiN/ETYUB1scVijE+8wSKFHACYqcd3X0GN1dbYzifBs6mXWMCbfF?=
 =?us-ascii?Q?lP8KAd/lz5bFW9dOHr3SZqF8F4NI1BL/cOTqnHjNuYIK7aYgqbzEaRZKb0vD?=
 =?us-ascii?Q?GyJ4P6XgtcojVhoEaJdO1HyHg7283JtlFqJnF3VRxsjFy6DHkr/tVMDpG602?=
 =?us-ascii?Q?n4If2SJzgO8zW8jlnKxvIVNVTntliCAobqKzsB7YUrpS9z3w1sHuxNOPJEuT?=
 =?us-ascii?Q?jawZ6aHRot8SDytJCLbqesjfpoULj/tpLBio/doWAO4FCKH5nQ4goRlwcEoZ?=
 =?us-ascii?Q?jGbMmpE649/+2+LTWhns2lVaYj9rmXUrpX5OGV6eZGVQMnS88yuIMCc4lAVC?=
 =?us-ascii?Q?8N1MAWyVJxRMpbg26eyVR/z4af6YEXbPf3Xo7fB/s3VA8l1JgjVj4eo50OA6?=
 =?us-ascii?Q?2cC2kquVJIp8dGEn9T92jph0GLm3kyAnb9e51hpdQHg9yCO5ZuQYMsndnBPt?=
 =?us-ascii?Q?55KTcxJ39Sl8L0RJBA5/048PMJBkZjS+qmbeNH610Nc2VcNUlXPuMHoaqCr+?=
 =?us-ascii?Q?cpvqs+EKeqw6mNoT3d1xdyx08nffWt40N+QLb4KvQewbALB/LQwmOIQQTZK8?=
 =?us-ascii?Q?1Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf782eae-e10e-4932-f61e-08dbf7438a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 16:42:45.6551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6quPAXmlOJWSknKWovwTXtA27asHmVIi+8ybZ8xN3BBRtWqrxAb9IcjE2QhqPvwLv0BS9tkVkTWwALIefafh8noOwkybgEHBCHSiGI6FrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11939

Hi Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Thursday, December 7, 2023 8:37 AM
> Subject: Re: [PATCH v4 5/8] dt-bindings: input: Convert da906{1,2,3} onke=
y
> to json-schema
>=20
> On 06/12/2023 16:57, Biju Das wrote:
> > Convert the da906{1,2,3} onkey device tree binding documentation to
> > json-schema.
> >
> > Update MAINTAINERS entries, description and onkey property by
> > referring to dlg,da9062-onkey binding file.
> >
>=20
> ...
>=20
> > +---
> > +$id:
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
> > +  For DA9063 see
> > +Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > +
> > +  This module provides the KEY_POWER event.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
>=20
> Drop items

Agreed.

Cheers,
Biju

>=20
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> Best
> regards, Krzysztof


