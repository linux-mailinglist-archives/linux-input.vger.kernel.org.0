Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E9CA1470
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 11:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfH2JLp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 05:11:45 -0400
Received: from mail-eopbgr40084.outbound.protection.outlook.com ([40.107.4.84]:62598
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726642AbfH2JLo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 05:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3RJyGZemYGIXZ7tPVg+imgv+pwGwof3fpKqXsMe5k3xpuRO5GmV1xx+ekbexDwH/CVDn7D4VHmNp5xfFhjCASRZWGM7b12xXRf9UgRbeKN+wwPFgG1udw2JaehMN0Db0LL+yKgK0L+SFmF8gD5EZL5R+Ca6XqwN2EO7rHgklyg9I/OWqyic8pxzccQVxXm0346LTq5EAbu6BrcvfwPJdTq/A7QS2k/ap3E41/uqNQlR0QzuRFfVl67BOZ8OQ/qFQONxa9Ebhpr/jwHwdqhQKjZPRjW+4Rh6o3cOh1bHXPR5WgO77BcJDeCfdU9H9H2L4XT/RZhStg1z4bMauGD6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0l/pAhLmTkq5w68BYfciEDCSagqabVGTo/LfGXRXAc=;
 b=eXcrm0UUSfS5SBQfSgiAsTywaYILstPfmmr0tqHDPIFEs7G7iu8lZq8zOzF0kTWnaI7B9LTeLlnHLdUKAWe+DbQStfQ0bf98B+TK03QQVTVbwm3JJZY/z75CrB4r9ihz8lSGu6UcGfYbsWQ3AqhiaGCAIoT9hWblSH0T9TiRb9OMgexg0fPhBXvBxqF19pbLurDku1FEUg7wy1YoXwO0+rqfIDo1xlQIWgCA+fn949wzaGCvWa9+OzuE8EAm7GHEDjK4L0tE57ZpS40ast9FVuklOrk50k+aWFFe10c4Qi7hGaRgyqXslF0PT00aK3akjQySkmp0BxMTyIunauAL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0l/pAhLmTkq5w68BYfciEDCSagqabVGTo/LfGXRXAc=;
 b=QdXG1IpT8fEgZi0M2Io8TMHVskqtAHAn16K/E2bapf6nNtYgHiQT+ilc6gRzf4nQ2k2/7PCZHRQN/DJPJ85yOI5PzPnDnH792nWcmVugZVs6ytqmjlcdoLEaVCDzpXJVxd6ZIYdeauqEII1HIhGPOO7hs9oZKgiSFpCzOJzq9I0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6560.eurprd04.prod.outlook.com (20.179.234.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 09:11:41 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::8f2:412c:88c6:a365]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::8f2:412c:88c6:a365%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 09:11:41 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>, robin <robin@protonic.nl>
CC:     Mark Rutland <mark.rutland@arm.com>,
        "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-input @ vger . kernel . org" <linux-input@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-arm-kernel @ lists . infradead . org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2 1/2] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Thread-Topic: [PATCH v2 1/2] input: keyboard: snvs_pwrkey: Send key events for
 i.MX6 S, DL and Q
Thread-Index: AQHVXNNoFKqEJ8ezkE+ZaY9GbWy3m6cQSLcAgAFzJACAAA7PAIAADbeQ
Date:   Thu, 29 Aug 2019 09:11:41 +0000
Message-ID: <VE1PR04MB6638A54664EE3FFE16BD419189A20@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190827123216.32728-1-robin@protonic.nl>
 <20190828091550.pdc57wanu6twew5p@pengutronix.de>
 <6d353af709ea545cc34abca5c40674e3@protonic.nl>
 <20190829081712.timamprawezzbesn@pengutronix.de>
In-Reply-To: <20190829081712.timamprawezzbesn@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5527339b-0e52-4528-a4ba-08d72c60e7cd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6560;
x-ms-traffictypediagnostic: VE1PR04MB6560:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6560E127F58F459350E8EF0489A20@VE1PR04MB6560.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(199004)(189003)(5660300002)(446003)(6506007)(53546011)(186003)(102836004)(3846002)(6116002)(6246003)(8936002)(86362001)(11346002)(486006)(81166006)(81156014)(8676002)(256004)(476003)(4326008)(25786009)(66446008)(71190400001)(6436002)(9686003)(478600001)(53936002)(71200400001)(55016002)(966005)(45080400002)(110136005)(26005)(76176011)(66066001)(14454004)(54906003)(7416002)(305945005)(66476007)(52536014)(6306002)(76116006)(66556008)(99286004)(2906002)(64756008)(7696005)(66946007)(7736002)(229853002)(33656002)(74316002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6560;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MWTBryiCe7sxuVrslxZJF6IBwd3wmv/bQcTmfDs+LXRcDc5u56Hw5cyPOUZ18fZlzypF2IkMMgrpavPAFYCWVPxOJnKSrY2quA2pJXIwxg5Jc89pSlaydb06JhcjCHTDiCJU3DBNDY9SgdaDzqkBZETHiarcBjGMfQtPar63M8HP3m9BB3od2fVs/k6dkIzVy1tXBCJ5z5J9Ruj3H48+zllGPCM+vZhf2tsdhHEFl0TpE9z0nUiOGJz6KjMhmZQ6O2qzO5znANrNh6TsQ8058WLdFrnOYklzqegjLMsidwgvjniR9viLZbz6ZgBPcYOkwgI6G4DUzjEacbRnASctZoi62ByOtAUtkm41381CR1RQ2jQJ3UqIWUzGiRPQZahANvMusRgwRa7bkQTPtprMEK8qVfBo2ES1KHf+RmbQ+EQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5527339b-0e52-4528-a4ba-08d72c60e7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 09:11:41.2112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JL9KJSemToZPCk002ywNkRHa//ASYhd5vaHdfoOt2h2PRyYhxxPTuZuU0+R15/kfkyxvt1LbF5vzskNqpM6EwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6560
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019-08-29 16:17, Marco Felsch wrote:
> > > While reading the rm it seems that
> > > the snvs block has a dedicated version register. IMHO this could be
> > > a better way to apply the change also to existing devices with old
> > > firmware.
> >
> > I thought the same thing, and fully agree with you. However I do not
> > have a way to determine which versions are out there. Since I couldn't
> > find any documentation on this, and I only have i.MX6 S/DL, D/Q and UL
> laying around.
>=20
> @NXP Kernel Team
> Can we get some more information here?
Go ahead, please. That snvs version register SNVS_HPVIDR1 should work as ex=
pect.
MINOR_REV checking is enough, none-zero means for soc after i.mx6sx, but
Zero means i.mx6q/dl/sl elder soc.
>=20
> Regards,
>   Marco
>=20
> > Regards,
> > Robin van der Gracht
> >
>=20
> --
> Pengutronix e.K.                           |
> |
> Industrial Linux Solutions                 |
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.p
> engutronix.de%2F&amp;data=3D02%7C01%7Cyibin.gong%40nxp.com%7C8d4e1
> 0cd77bd4652f3eb08d72c594e76%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> C0%7C0%7C637026634390359345&amp;sdata=3DmhXlUxmLWg8qtwhPQfkJZm
> VAn4QQ3YybLOSh83uf27E%3D&amp;reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
