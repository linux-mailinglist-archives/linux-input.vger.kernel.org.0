Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAA0156F7A
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 07:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgBJGdg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 01:33:36 -0500
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:20321
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726170AbgBJGdf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 01:33:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwpCy8QhrGCC8CTAm6rj8wAuqfU1ZoP0OCS7sa3AJHff675jT4+8McT38UHWEhTDzBpEfdxiiOWi6Blj00lHNjUnzjk25n1fQQe88wmgnpIPvqSMs586iSQziV9axr3gLdDWC0ZYoKgh6FUegEmOImeGE3zOYwepfwHhD8o0Ss0TBwskIPko3DBv+xav964D76wApWsyBqKfLZExUxtApeZgnIkPS3Q7Bawu6Dn9ZQyNF20i2jL/NSwYc+jG7o48kLn3hWy5HGRa3aqNqVohm8Oh5KSXx/haWiesT4mXI1JB9g5CXRNWCSoOoBaJFCYLvnaMvAxIIdWX5+YV8NqAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfqXd+DMI+6U6SVoYMG0ts1qqSXaeiBmvnHHLLBT+xs=;
 b=h88sylbFwbyPwnvVM16oTM2LsVMH8F4wQdy69Cgb9GxrTN3lIS/dOW0zhHUeDbEdYFd7q1jBspEA6O5r/EAaKy+fm/n/zFwtKRbUeO5Wm3J3IijUX7rZX2El6Hrm8Zsj4LXkhw0HzAIEzZdFRhrq+S0bdShxZi0H4e3sJNM/4GTUoXQcdwNtUBfp5uOJwwAf6zRs9rXO8qdat8/Y9R4TIsXeXrHP5Rvq5bvhzlo+qGKXfsTbtgiUlSaw3LMg4/kuuFLHz0jtMu0cLcqnc+MUNqmaBdhMp99EdznQ59ncMpW7O3VPIT9X/67DlqKSMN5AIrLMzsICiXktnouLCHcPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfqXd+DMI+6U6SVoYMG0ts1qqSXaeiBmvnHHLLBT+xs=;
 b=UNpf+y54UymTMbY53z6wTxwY298iXTcCarZDJoAO+0KoijqUjujnoaKRPvz8fFYGazKw7qrAsDDewqtDEPvDILjHN5UhCBiz2xlgEg6RhdPP49LMUlq4V3/R7zQaXzrd7VkPWfxFS7r+yQTyAZQyv6dkWPQ6mhT9RYOBEXMnWvg=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3344.eurprd04.prod.outlook.com (52.134.8.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.29; Mon, 10 Feb 2020 06:33:31 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::85e9:f844:f8b0:27d%7]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 06:33:31 +0000
From:   Horia Geanta <horia.geanta@nxp.com>
To:     Robin Gong <yibin.gong@nxp.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     =?iso-8859-1?Q?Andr=E9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Topic: [PATCH 2/3] Input: snvs_pwrkey - enable snvs clock as needed
Thread-Index: AQHV35muNBIBR/iti0mqpaUfcGw1rg==
Date:   Mon, 10 Feb 2020 06:33:30 +0000
Message-ID: <VI1PR0402MB34851857F012286250BF3BBE98190@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20200130204516.4760-1-git@andred.net>
 <20200130204516.4760-2-git@andred.net>
 <VI1PR0402MB3485EC2F82DDE52DC5CA0795981C0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <20200209223836.GA199269@dtor-ws>
 <VE1PR04MB6638A4F4E3BABE0ED0CD4A5189190@VE1PR04MB6638.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c486d2cc-3528-4bb1-3bc9-08d7adf3254c
x-ms-traffictypediagnostic: VI1PR0402MB3344:|VI1PR0402MB3344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB33440FCE435599ACB6A1CBB698190@VI1PR0402MB3344.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(81166006)(66446008)(66556008)(64756008)(66946007)(81156014)(8936002)(6506007)(66476007)(91956017)(8676002)(5660300002)(76116006)(53546011)(186003)(7416002)(52536014)(26005)(44832011)(71200400001)(86362001)(2906002)(478600001)(33656002)(54906003)(110136005)(9686003)(55016002)(4326008)(7696005)(316002)(4744005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3344;H:VI1PR0402MB3485.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2szjdFPevfgeS7Hkfl9pgTOyHO7e6W4Qu4MjADVgg6mAls4gOrwoicJeI0jQWTP8tbUYfsCvk6yTxEL8wcZHzfwD/226uXeE9kvVuRDHt5UGJhX1cQc4N1Uo6VyT8LrlXIRGDjMFt3O7zAthkc/FMnn8PS1Ol78Bt17BB0WmYsKymxzWRw5t+zigyWfrGVa6vdv60bXyd/T16UqK9G0gbjjyRfRWOpc/EEX4yufjsiRu+hH9y4fqPBwMGzHu+gryOnj7wiAW3UVzk9WP9TgDkpthUpZJUs+wOS+wUjHaLforlCSSy7DiJGUGQM1Gnwcd8DHLycmpUuRRZUMAUlyLIW4UOkOTEYVH4QMrHtDC1DhKBMfIp5uT2L0VrQFcYvWeftq1m1HOIYoEFcEvdeOgVrZOR/BMypMWIxulNOvU2NecwrbDcT8A7GzqK2sNGA+
x-ms-exchange-antispam-messagedata: 7OkPOFhmJAnUDvZ8Jp/sSU2THut1MsLL54J15o2K5+/O925FHw8l59I7ddf5q5DEXY9dUS9W47OmQbW2zn1sU4+Q2R+WSI1N6mJ3S+uYfoIMQnP36CFpnYd4+ZzwdI4mycoDA9G4i+qNIdwzc3rj+Q==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c486d2cc-3528-4bb1-3bc9-08d7adf3254c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 06:33:30.9376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JTZPSjPV101M+GXmm05d+Dv+K+CGsv/Il7fWui4U4C2yI4J2CG9LhG43ZHadxixoKu2M7w/obgBagvBqlPZ8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/10/2020 4:03 AM, Robin Gong wrote:=0A=
> On 2020/02/10 Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote: =0A=
>> On Fri, Feb 07, 2020 at 08:10:22AM +0000, Horia Geanta wrote:=0A=
>>> On 1/30/2020 10:45 PM, Andr=E9 Draszik wrote:=0A=
>>>> @@ -140,6 +148,25 @@ static int imx_snvs_pwrkey_probe(struct=0A=
>> platform_device *pdev)=0A=
>>>>  	if (pdata->irq < 0)=0A=
>>>>  		return -EINVAL;=0A=
>>>>=0A=
>>>> +	pdata->clk =3D devm_clk_get(&pdev->dev, "snvs-pwrkey");=0A=
>>>> +	if (IS_ERR(pdata->clk)) {=0A=
>>>> +		pdata->clk =3D NULL;=0A=
>>> Using devm_clk_get_optional() would simplify error handling.=0A=
>>=0A=
>> It sounds to me that this clock is not at all optional and the driver cu=
rrently=0A=
>> "works" only by accident and therefore optional is not suitable here.=0A=
> Yes, then we need to add all snvs clk in dts for on legacy i.MX chips in =
this patchset=0A=
> to avoid any potential function broken.=0A=
In that case the DT binding should be updated too,=0A=
to make the clock mandatory.=0A=
But before doing this all i.MX SoCs should be checked.=0A=
=0A=
Thanks,=0A=
Horia=0A=
