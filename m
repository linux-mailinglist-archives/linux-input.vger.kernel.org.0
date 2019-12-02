Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEC010E997
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 12:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbfLBLik (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 06:38:40 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.117]:37020 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbfLBLik (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Dec 2019 06:38:40 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-6.bemta.az-b.eu-central-1.aws.symcld.net id 99/3E-19231-BB7F4ED5; Mon, 02 Dec 2019 11:38:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAJsWRWlGSWpSXmKPExsWSoc9orLv7+5N
  YgzctvBbzj5xjtTi86AWjxaqpO1ksbn76xmrxYddVZovWvUfYHdg8ds66y+6xaVUnm0f/XwOP
  z5vkAliiWDPzkvIrElgzpn3sYy04ylMxfetV9gbGx1xdjFwcjAJLmSV2X73FAuEcY5H4t+E0O
  4SzmVHid+9PNhCHReAEs8Tkf7uZQBwhgalMErMWHIFyHjBK7Do5E8jh5GATsJCYfOIBWIuIwA
  omibMtM8GqmAXWMkrM+n+OGaRKWCBM4uO9L2AdIgLhEtu/HGGBsI0k5l75BhZnEVCRePH4EFg
  9r0CixJzth1hBbCGBPInWa7PZQWxOAVuJY0ePgtUzCshKfGlcDVbPLCAucevJfLC4hICAxJI9
  55khbFGJl4//sULUp0qcbLrBCBHXkTh7/QmUrSQxb+4RKFtW4tL8bijbV+LE+gY2mPqfmy5B2
  RYSS7pbge7nALJVJP4dqoQwCyRuvPSHqFCTmLL+EzNEWEZi509jUIhICLxildh85ibzBEb9WU
  iOhrB1JBbs/sQGYWtLLFv4mnkWOCAEJU7OfMKygJFlFaNFUlFmekZJbmJmjq6hgYGuoaGxrrm
  ukYVeYpVukl5qqW5yal5JUSJQUi+xvFivuDI3OSdFLy+1ZBMjMFmlFLLL7GCc9/Wt3iFGSQ4m
  JVHev5+fxArxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4JX9CpQTLEpNT61Iy8wBJk6YtAQHj5II7
  yKQNG9xQWJucWY6ROoUozHHhJdzFzFznFy1ZBGzEEtefl6qlDjvM5BSAZDSjNI8uEGwhH6JUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvE8gUnsy8Erh9r4BOYQI6xbzlEcgpJYkIKakGpqq
  Ui+GvwoyeTxPdxX7+hd+SWYpPPNWmM5x4m33gw16da6ubHS/naL6ef+JN9bqd4V6buRZsNsl0
  +pUuxidkFG3b/rT+SUBnMb+BiIftvcvrRSeesRI4+kP9mXfTd7ufUd6uYvszM1a9ZsxPWHiyo
  2HW7hcxXOErRYMf/0p67iTn9Uok4M9vYfcmPu9Juxhmpu27875276ZWDf55B1bwvHO6/HDB3R
  cF+zaZTVj0Qd1+9Z4zsRsEtDh2RXlOYTuRGjDzS2xv2+Lvb+vfmVru+sjUM/H8dF/Fe3dmuM2
  QdL2+9gwbhwnvYttLUaXhhtMagvrFZzl9Kzb4wHTvxfbN6b9ENxpqrCn/NZdXc45j4D8lluKM
  REMt5qLiRACR+yXQYwQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-18.tower-246.messagelabs.com!1575286714!805671!1
X-Originating-IP: [104.47.1.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30068 invoked from network); 2 Dec 2019 11:38:35 -0000
Received: from mail-ve1eur01lp2051.outbound.protection.outlook.com (HELO EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.51)
  by server-18.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 11:38:35 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpVhY2wt+M/pJf7AfqBP2jOsPnRbB28+4mpuCrk2Mk6cY1PCFLFUCqSiDBN9NmC4azcEwfk+/ESC4pJtgKc3QsaSFWI1oQ2k4KISxLHus0qempNLBvF0oodjgcuA9fQqGzJlzL1PS/qRdL4Sx09+J2jimLuQpn+cVCrRdRTrNRZ3niRnAKMM+dIjJqOvLtWBPnJ+oHYAqBauO7ppnAGk7WnloFdLm4UDj7Afo3spRDnK5ooun31wLIb392cUvoocTkl8xOMRjitaBZW1H5Zz9zPOcqPsADrWbb4/wpIKv2oFtVGCncLs707koxzCkhdOYL9t2/VKVsJbQtMZXta2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqyZ2E39XUbtVSzNtdCLD2KZj/tsKAeyOqhUTQAzOFw=;
 b=BNavhN+sdiz65AsuAxjpig5PnVUMEGuHhPqImKTV3X4efGUKiXjPGT37Nl11fZMl/jNgSzzcnMj2j//Yxw+cbGVCgO41A3XsLrJONs8OQIG+zBp3i+8X2zXHIKsEL8xoqFfC9AoPWia7AXNIlhIABVW0Of02NQEHPkIRcLjXF51ge1gYSzhg5YHMrIpTw9HPxhH29rW4ixfX2w3wJEHxmvk1RkjTav0bqOa6OpkCW4+QZKTh/7gjNJBW3bhUx3pcbRiMFVu1YfXdleqh8d6/Nx723BIjHXsSq51tQ08obp3DEXrrJWoaojK6PB5/iAtMx0h4D1E1Jtue0Nhe9UmV4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqyZ2E39XUbtVSzNtdCLD2KZj/tsKAeyOqhUTQAzOFw=;
 b=p/9AZrO3zdK64cRkD0nvwP3wkvZ+3mVU0vWwxSGSCt+g+2CN+CWc+dicXftERtLIrjovvv84eZvjDr3yXFnkCmmZu5AIQA8ZhoJ8p4c+GpjMnTMEbhPjVyibgvQsbJeuV0tOpMzbZ/FEUERCJjRS3naSJ56HzWzoVr8L5NPYK2M=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1107.EURPRD10.PROD.OUTLOOK.COM (10.169.154.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Mon, 2 Dec 2019 11:38:33 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 11:38:33 +0000
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
Subject: RE: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode
 documentation
Thread-Topic: [PATCH v2 1/3] dt-bindings: Input: da9062 - add key-opmode
 documentation
Thread-Index: AQHVpSXRxL0U12ngTU6B/oDGqAWrJaemuTEg
Date:   Mon, 2 Dec 2019 11:38:33 +0000
Message-ID: <AM5PR1001MB0994C6288939E487BCB5854D80430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-2-m.felsch@pengutronix.de>
In-Reply-To: <20191127132304.22924-2-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72f988fc-cea7-40b3-f471-08d7771c2969
x-ms-traffictypediagnostic: AM5PR1001MB1107:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1107449CEAE9FD52A9EF679DA7430@AM5PR1001MB1107.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(39850400004)(346002)(366004)(136003)(199004)(189003)(9686003)(2906002)(99286004)(71190400001)(71200400001)(5660300002)(55016002)(33656002)(102836004)(53546011)(55236004)(8676002)(229853002)(81156014)(316002)(8936002)(54906003)(6306002)(110136005)(86362001)(2501003)(4326008)(6116002)(3846002)(25786009)(76116006)(478600001)(966005)(52536014)(26005)(186003)(6246003)(6506007)(6436002)(66946007)(14454004)(256004)(81166006)(7736002)(305945005)(74316002)(446003)(11346002)(66066001)(76176011)(66476007)(7696005)(64756008)(66446008)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1107;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3QTFHwuOYbS+l5/c2luFPfrYf4q4GCmClaTOhsRDJrtjCovT4q3Je6z9+5vxlw7qG0FaIwPO1VKDGio7cUNLmQ29UrliSiFDDJtVoghudWRIiXzyi6wShoj2CjEgw8p3SgyJOiK2zBIhnsqMnkDmFaml9RnAkvFggxTuVX6mim3xJK8dT0+rY4Qtbl4ifbw2OLJtX8lNM5WlGMv0thJpY+zzqR8FmXby8YIMHx7h/r9oytgjh2yZ6CkSbisIfFOSAsa/90d8E98bw5HiuDMKuqBV9zbJHNiDOmNrFHhVDOQFJyyTWjTxP87EyfXeF8wMeGZeIMcCkTdgGqgXlRsq7LFqo+Ew8gZK/LSUwSivdkTapnztild8hhOyFr6/wUa6cufZIDtLpk6EHbye3tyLBvYnP0XVxsekxnaGKNX2bzGSyKXzN45A81o5wZbRPpsnB6W6uTEiJn1Xx33XcDsaOZjaPdxgJTwdGnITN+Tees=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f988fc-cea7-40b3-f471-08d7771c2969
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 11:38:33.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gAHQI/uaqFLidDtrDQM9jyUmwf1J/rqQo18uPL0m3Ow/Cmvz88Kt7i0+rLNRzfybFehd9oBJGaxpAc7Gqk4w+cMHYBqlxfol6UarF8RaJ0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1107
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 27 November 2019 13:23, Marco Felsch wrote:

> The onkey behaviour can be changed by programming the NONKEY_PIN
> bitfield. Since the driver supports the reconfiguration we need to add
> the documentation here.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
> v2:
> - add da9061/3 references
> - adapt binding description to be more general
>=20
>  .../devicetree/bindings/input/da9062-onkey.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> index 5f9fbc68e58a..0005b2bdcdd7 100644
> --- a/Documentation/devicetree/bindings/input/da9062-onkey.txt
> +++ b/Documentation/devicetree/bindings/input/da9062-onkey.txt
> @@ -19,6 +19,16 @@ Optional properties:
>      entry exists the OnKey driver will remove support for the KEY_POWER =
key
>      press when triggered using a long press of the OnKey.
>=20
> +- dlg,key-opmode : Set the nONKEY behaviour. This value is initial set b=
y the
> +    otp values. See nONKEY_PIN register description for more information=
.
> +    Valid value range: 0x0..0x3
> +
> +References:
> +
> +[1] https://www.dialog-
> semiconductor.com/sites/default/files/da9061_datasheet_3v6.pdf
> +[2] https://www.dialog-
> semiconductor.com/sites/default/files/da9062_datasheet_3v6.pdf
> +[3] https://www.dialog-
> semiconductor.com/sites/default/files/da9063_datasheet_2v2.pdf
> +
>  Example: DA9063
>=20
>  	pmic0: da9063@58 {
> --
> 2.20.1
