Return-Path: <linux-input+bounces-523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE080806AE6
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 10:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E181F21195
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAED91A734;
	Wed,  6 Dec 2023 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W8yGdRJR"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2132.outbound.protection.outlook.com [40.107.114.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F61EB9;
	Wed,  6 Dec 2023 01:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/QjNb5kAWrm1kq8k0AwMGsb/PtOkbECtin/o/+EAXFLL5KksQZMcJcJIy54AXDKwZ+ehMAc7ODQm8tEtYr6IvlcO2amhElehzL61Le1gvuWzfx+g89PQhEVoOpeB/ueVMtlw6/fnpDAGjKxEJr+Nk/hO94AigLxrwrhvuOx7hrBNQOXYwY1PhdOqh9ZtRWBdvl+pJP4N6EJJdfWsLAKxH+iJpmocyTzIUbdf+RXJP+PSOtLwd7PcQgY6ceSQSJ2Qes1L10KZS2hH9EGy3WQ+BslQ+30aEKQ2lA3H2ChIGk2fjZwICu01ZorBc+LaYLHC+xkalpXvhV22JR4oRDJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VyLBVavQc3vfSay1jtsB5M28hR/dtQtpXmkXM4nAPWU=;
 b=S6kcRVqJC9gWYyd0bQJ2WVx8h0r3rjM3WHrO+a+VNK9D53v4PQjcGdEPxsxRu4jIBd4uvjIpFKAVnALUjNj8aiVQbxA2xLpEOJXCQkgm1woXP+JUSut8TKDteKQLgEueko4mbcS4QhabScS0xN2g75bHUwC0XQgBx53xHRX+/W3WpckaInxBe2AqFknaPw325yOhlSUWDyYb3fGfwiZ81xB+J0mMz83NSX1W4e02AaodhV38QYMlH2t0LwX4epqNVQ9rxTiYIQYuf0VlpS4YyMrBCiSWtcZFy1BF6oIk9rIT7eH/+eYAvPmSdCZSVcD53zgiroGCplJP/RjclrDYAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VyLBVavQc3vfSay1jtsB5M28hR/dtQtpXmkXM4nAPWU=;
 b=W8yGdRJRrl7SIutxevfqaZf8N/qp6o/bcznYTKt2I2Ccocd29IwYzNnEnxl2cRIJ+1oaQiVnqkNSEoev71SU8W+eS8l4sy4aGcatGi9cB8nQ4+5z+6XV83h1Y+xtnVfyakIslxACX3rVfwRE73VqzhG01PAQnBfb15pA84nm+8I=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYCPR01MB9959.jpnprd01.prod.outlook.com
 (2603:1096:400:1d7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 09:39:12 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::db2e:9e88:68f8:486b%4]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 09:39:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Support
 Opensource <support.opensource@diasemi.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Thread-Topic: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Thread-Index: AQHaJVVo5pef/q5Tg0+CFbpInSqy6bCbJfgAgADfNbA=
Date: Wed, 6 Dec 2023 09:39:12 +0000
Message-ID:
 <TYVPR01MB11279F14F24EEFC63BF6F3EB58684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231202192536.266885-4-biju.das.jz@bp.renesas.com>
 <202312060431.fHDo1Yk9-lkp@intel.com>
In-Reply-To: <202312060431.fHDo1Yk9-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYCPR01MB9959:EE_
x-ms-office365-filtering-correlation-id: ab75e7f7-8e90-489e-5eef-08dbf63f343f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9bQ65O+qTplMjC7et/MgFMDefSVz5umVpwqhg54q6pJR7r0GYJYdHBZDZVqoAmr2jsh0qjRcNNt3zljRV87MRJpNqyYULVpy2ubYl7ABcDUysZ05tCjJEKzzKS9DXoN2KcPuDYjxO9Gk9ixDbPhD3rMT++OQkep53dLx7pGOn6fGvlWiQfMMZ345ykcc0TPo/5/CmrG56APHY4//AmUJWr5eDhhIH2l3P1z06LSnlrIONK+ewxeDiB7ZVfBJALnslvr0E06pnoWJvcVoxQ7h+QeJ0e8pc8MwRamVkddehjh/MojkRRtT3zFYeEomyeGLcSSeuyl6zH9/MUWy/EviW1rRdo2kFjxe1ImAnMeQ8NziJ52ntfS5vUezaNxtsf9cgOxlcwwb/a14eRI1ECHLJw6QhMYydVW1fpVU/mzt0nXRLWfQY9uYNAAMG9ud/nS/QZfYO+zCvQoqy/aypqTkHFcaWzoq/KwOfmljrHj1ZLbqqvMfLoObQ1LOekSUDvuwVg08EQcW8RLl2iW8keW8eVd70+A8SMQK+H3O3j0c3OtjjU6dbCmYx2+Qkqjij8qA/tyH1u0UmEwcao0HAMTrasUgo7Mgfb7b3+3NiEPqxaF4vebLSr1J51YKYKwLrrbdCXXOOuQpmf7fN0pzdjltXA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(55016003)(478600001)(71200400001)(7696005)(966005)(122000001)(38100700002)(83380400001)(6506007)(53546011)(9686003)(33656002)(8676002)(8936002)(4326008)(64756008)(2906002)(7416002)(5660300002)(4744005)(86362001)(41300700001)(52536014)(54906003)(66446008)(38070700009)(66556008)(66476007)(76116006)(66946007)(110136005)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JaD0Tacc3y5SUVsY40G8VVReMccs9mBWb/xj38yFkIG43u2cxzaHX/lA8QH2?=
 =?us-ascii?Q?zik8n2L84MyHm20xvpTbvfGub61Zrhvi7qp0hyQhAcN4BFjf2znngtUCVyFb?=
 =?us-ascii?Q?S1Q9zU7viyo2/eFuqPVb1mG/m1B6akllfsqWG6xLy4hEbarXuEAC5KHemiST?=
 =?us-ascii?Q?NlDBjBlHkfJx3yx0SNhSLG7U01VI09k8C36wL8jxrGOkW180ve0DBnRx91v9?=
 =?us-ascii?Q?oUm+o+4c846j3+VcH8FxQTXo1fcFw0QmpQ5wMvTuHl1FqbZovjFrUjYJPS2i?=
 =?us-ascii?Q?RJ7Xg7OQmqe5xsziqH1PQvquWx3GNjosp3IWsH4Nz2BtETf3TaR+cOkn7q0Y?=
 =?us-ascii?Q?68BkNOwgczijqyZ6FcXC2htze7wR1iMSlvWrY6k6+5nEBh5YhNNLTPW+12B/?=
 =?us-ascii?Q?fr46VOAdpQLJJZMvfqIOodKaRnk3tE26LV3PE/LD4Wrt8G+JaohvpwPjKYse?=
 =?us-ascii?Q?nhp30TjJ1/6c2EEJMYgemECVqEuYns5ynjqQDiZQd0kjvrScR25VdGm2D76E?=
 =?us-ascii?Q?7mioOinJ0boXasBb3odz6/oxs+KBLsVO/Kgoe6+in/jNuSiqLI++m2qnYoyQ?=
 =?us-ascii?Q?C9zIUc5vRZpzJwyhNzx9Xoi98eYlE97H4qNU9uJtP+nQsq0bqU1Tg45iyxPF?=
 =?us-ascii?Q?VHAYVoacX6pNi7zmlg61QWVIpKEqvk1Ua75yT7D7p8GGkKKZHDh/8rRY3UeD?=
 =?us-ascii?Q?dBIvc3DPCavZzvdDw7+DGrBxTS7e1hI2Lov/XAj9zuTYeHutsusn+aGHyCZF?=
 =?us-ascii?Q?bzOdO1PanJ37lzqO1W7qyT8hHJT8AjLv2UkVHlw+DZj27RjgCuSt50EJrOO2?=
 =?us-ascii?Q?lBbZBF4KwtzTDtQj8UAQv6Uq48xYzE9o8jwbWki8J4VcxR3TXacq/dHB/Mah?=
 =?us-ascii?Q?TTv3aEE1fP6u2yC9OQP6fiUHBIAsdRPWhfVa6QyCmniuzf4BFRMLWLwujRgf?=
 =?us-ascii?Q?K+yxgevgVQVONMzVYFiKH3dMo/C6Ci58onj+wpMbshI4AojhYKZiSrEtK0xT?=
 =?us-ascii?Q?jIcJf/awF81FlDwczu+8wh/NyFbGPGE+dMyjQULhWJ6URo4HmDvGCG2odtlk?=
 =?us-ascii?Q?tOaRbsvnxVf3NuNNfSkkF6aEazU0bIA74YQYkGeSs0UyM/oWjzaFYYgwT2F5?=
 =?us-ascii?Q?Bn6TuIFIm/+I3wAAcbccYXIYZunvdR26rmKsq5am2cJKB3QZHDC3eRnr3SB6?=
 =?us-ascii?Q?4JQS+0PLUSw+7yf47YwLYQncK5yFMw1VJU9WJ/pZz5t0tcje8be8wfWvqf4k?=
 =?us-ascii?Q?olkHACWOhZxxP24xKq7eVx7rYqOaRoTeEn0ois8Xq9g4zhwiTlilAQitzRBH?=
 =?us-ascii?Q?+lV92nGlpkbrzrQZEvz75NDvgMa1TyonGNzKTpizljW3Y8IdVmW2zv5qKWF7?=
 =?us-ascii?Q?IkH+4ntxXwGveFWOU2ozOvuO13DAoK87s0il+rPRYOOxCmP3tjkSoDqU4uil?=
 =?us-ascii?Q?4StVbk9GOBx/IuyDP1jO0fVsWxVuw+fRvxP3SQ1o2LTWBt1yYVSYnvVmrwrR?=
 =?us-ascii?Q?1mWxPW9sqTf3Axr+2MDCqZd5lznS3DaKGnxWhK+7/ovZhchdMNC2bjdETKLv?=
 =?us-ascii?Q?ESHWFHVQe/OavFykVWMtWqsbqR9otxjomDrSEUEPyGYgVXkXbDi0VxA3m/+e?=
 =?us-ascii?Q?ug=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab75e7f7-8e90-489e-5eef-08dbf63f343f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 09:39:12.2739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hK70pPD8G7oHAILPoC1LHAeiPTJOoTMGj2Lhiwn0002pkZj72P3CLgeASWxkaZDBfTEMxDvs71TvLyPiw78BWDqHIHSZJugssCuMb10AgU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9959

Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Tuesday, December 5, 2023 8:19 PM
> Subject: Re: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3}
> onkey to json-schema
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on lee-mfd/for-mfd-next] [also build test WARNIN=
G
]
>=20
> url:

> base:
> patch link:
> reproduce:
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> |=20
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> Warning: MAINTAINERS references a file that doesn't exist:
> >> Documentation/devicetree/bindings/input/da90??-onkey.txt


There is an updated patch series available[1] and Please retest and provide=
 feedback if any?

[1] https://lore.kernel.org/all/20231204172510.35041-1-biju.das.jz@bp.renes=
as.com/

Cheers,
Biju

