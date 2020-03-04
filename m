Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109A9179254
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 15:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbgCDO2B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 09:28:01 -0500
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:25080
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726748AbgCDO2A (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Mar 2020 09:28:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3/BAJyX/2RSHuid9fso8EnAD5hbDvnm4kmqkf+HKB3uhtfjd4f1e1D7EZvKCEcJliSxzS3+xOBgQCR3/e5Wnvg1s/w3Y68w1oGOlpBqFf/sKL/xiickUEuSxFCUsLUYwy4/fiyL9g340vk+ftHD5ohFEfEYkBOCnhU09ln6MtUyHOYgG8VoVmbPWc2stzWgnPPyJhALMG49eNtVZgSNsj2BK2ruSURI5yM0l4ytfMY8rhcbICzfBQkzhQDbSYIK2mlHgq3a/s7NML1//4RNRZrFRKz+yzXb4sWNwO1o2qv6dQSBvN00OUCf6oXDmL8paBMp7V8T5S7czAuI4eFBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iilNfO49LGVOvXUCHMVF2e/LiuueK36yh5lDwT05I8=;
 b=VSoTr3Y0PDqowAPqJ/ELuCuPJavyjepLuYfjBOBsUCJirLU/L1Gc74DD7Q7Yjli8dwfOOAe1+h54+IcAkFNCt/KABw0puijaVxawDGTPY8AZwtZIkFpxAuYR+Obyo+jy2spudQpaNY8ttB3CbeX+1+i1KsFqtgE5uHaGSI1reL0BvIGAvxp5emDf6GqKTn8et6e9i9sdx5UWMRgDjLF8l7qvKK9fgn541jBv9nqTF8X3Gy7XE7zrtyfLbiLYxV8l45szUZIFAoNyoT5VbmYaR5MMdqSUGFQrzms7Gnwnx7xHQPIjB1z8cEW8Mf+HfT5sCeV+BRcMqN6/CeT582iu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iilNfO49LGVOvXUCHMVF2e/LiuueK36yh5lDwT05I8=;
 b=IV9L8zuoolF+S1i1ur34Wdg4NSev3kXq65buEn+CoLUtoBbOC9hLwt08G/WVT8S/7c9jNqpcpthygzOgayMx1bX+jnQge8G0P5+aWeqPhk6UX4inA8+AFlMF1J3BT+Z8l2nISFkXiPSWv5nmhlBrqXlwTSAhzu63VScg7jyVcwE=
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com (20.179.179.149) by
 OSAPR01MB4610.jpnprd01.prod.outlook.com (20.179.179.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 14:27:55 +0000
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092]) by OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 14:27:55 +0000
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: iwg22d-sodimm: Enable touchscreen
Thread-Topic: [PATCH] ARM: dts: iwg22d-sodimm: Enable touchscreen
Thread-Index: AQHV2zyxdFprAZ+aikeI+eBmLQnm7Kg1gv2AgAMEh3CAAAwSAIAAE+EQ
Date:   Wed, 4 Mar 2020 14:27:55 +0000
Message-ID: <OSAPR01MB50289BD27D31A2422379F2B8AEE50@OSAPR01MB5028.jpnprd01.prod.outlook.com>
References: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdVmsDVJRWp2uzVs0BKp-CjAcc6PS-1wBPT8J+UZr1O7CA@mail.gmail.com>
 <OSAPR01MB502876C5213B528A95A5B912AEE50@OSAPR01MB5028.jpnprd01.prod.outlook.com>
 <CAMuHMdWarWksbXsAaGpG7wunGdNb7DA=EL2NPE4gNrS+P7zufg@mail.gmail.com>
In-Reply-To: <CAMuHMdWarWksbXsAaGpG7wunGdNb7DA=EL2NPE4gNrS+P7zufg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marian-cristian.rotariu.rb@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6579e900-2406-43ea-6958-08d7c0483aff
x-ms-traffictypediagnostic: OSAPR01MB4610:|OSAPR01MB4610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB46109C2283CCE026AC713CD5AEE50@OSAPR01MB4610.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(189003)(199004)(52536014)(4326008)(8676002)(4744005)(81166006)(81156014)(186003)(478600001)(6916009)(5660300002)(66446008)(64756008)(66556008)(26005)(66476007)(76116006)(66946007)(2906002)(71200400001)(7696005)(6506007)(316002)(33656002)(55016002)(54906003)(9686003)(8936002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4610;H:OSAPR01MB5028.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdeXM11hT9ZZf/ECZUGaBbYMXXUv4YtQMITAuGlT0rKU/DeSuiX529iD+HBNywA6/hiF/s0zIageBdxcjFfsDcT3dB2RmUfJ4OE0jy8SD4dT7UVPF2iD9Zt7M6onODVDvSryQ4ZuQLu1uARBgSmIBKjbMncb7PUSaDn4CRE0QUU7px62+skpatQ4ZeiTT3xYDoXrbyNcS47+SdUw5Tt0UMXN4r+03GnHsTo9TS/mnW6uVJoDtAk9ep3sbil5vfsrtuJo2WaNLxvWHOsvM/lkCrUEXLMK4ysdu0lHuwlVOMya5S/FXPF8qKUhs1DTd//Lr02rD8F10qvsboCcmGS1YsXmRpzznuPwj150/ZCbvMx4zCaSCUG4h8mEBNGcI+z0LhwbH7H56eqhXIOkapdi2lVIdKVfXteeyTmNN6baIAq26eyQ7iqF+/GdG/1cv16m
x-ms-exchange-antispam-messagedata: TSPVXBP/SJ1bXcQnFRjk7/QbNjHqu9WRYUGj25qVAzCRr8G04EUtHneB81nFL0zYz6D7GrMlvRlG0VmqeP9tuRPDloE0arDQVvffmaZq8O/qoenMYtsaqx+9kcBMNVEVurIjlDUe6DKmufAxoEykHA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579e900-2406-43ea-6958-08d7c0483aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 14:27:55.4071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M1qMFWO4vmvcfOI4MMVkgU9scsQnKaxx3ffppAyko4RqOdPa1pO0KsS1wzuGYVu7mRg5sXYffyG9RYYhBcDwznwLtopo/5U2cfVbbyqdbmOL8iutvzZUbzRPUQUlbNbY4ogk2TKqWd9YmZ6iZNUbbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4610
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDQ0PjsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW80PjsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MCBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiA+
ID4NCj4gPiA+IFRoaXMgc2hvdWxkIGJlICI8NCBJUlFfVFlQRV9MRVZFTF9MT1c+IiwgdG8gcmVm
ZXIgdG8gR1A0XzQuDQo+ID4NCj4gPiBJbmRlZWQsIEkgd2lsbCBmaXggaXQgaW4gdjIuDQo+ID4N
Cj4gPiA+DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBpcnEtZ3BpbyA9IDwmZ3BpbzQgNCBJUlFf
VFlQRV9MRVZFTF9MT1c+Ow0KPiA+ID4NCj4gPiA+ICJpcnEtZ3BpbyIgaXMgbm90IGRvY3VtZW50
ZWQgaW4gdGhlIERUIGJpbmRpbmdzLg0KPiA+DQo+ID4gU2VlICJEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL3N0bXBlLnR4dCINCj4gDQo+IEkgYmVsaWV2ZSB5b3UgY2Fubm90
IHVzZSB0aGUgc2FtZSBHUElPIGFzIGFuIGludGVycnVwdCBhbmQgYXMgYSBHUElPIGF0IHRoZQ0K
PiBzYW1lIHRpbWUuICBEb24ndCB5b3UgZ2V0IGEgLUVCVVNZIHNvbWV3aGVyZT8NCj4gUGVyaGFw
cyBpdCB3b3JrZWQgZHVlIHRvIHRoZSB0eXBvIGFib3ZlPw0KPiANCj4gQXMgYm90aCBpbnRlcnJ1
cHRzIGFuZCBpcnEtZ3BpbyBhcmUgZG9jdW1lbnRlZCB0byBiZSBvcHRpb25hbCBwcm9wZXJ0aWVz
LA0KPiBwcm9iYWJseSB0aGV5IGFyZSBtdXR1YWxseSBleGNsdXNpdmUsIGFuZCB5b3UgY2FuIGRy
b3AgaXJxLWdwaW8/DQoNClllcywgdGhpcyBpcyByZWR1bmRhbnQuIFRoZXkgYXJlIG11dHVhbGx5
IGV4Y2x1c2l2ZSBpbiB0aGUgZHJpdmVyIGNvZGUgd2l0aA0KaXJxLWdwaW8gaGF2aW5nIHByZWNl
ZGVuY2Ugb3ZlciB0aGUgaW50ZXJydXB0cy9pbnRlcnJ1cHQtcGFyZW50IHJlZ2lzdHJhdGlvbi4g
DQpUaGVyZWZvcmUsIEkgd2lsbCByZW1vdmUgdGhlIGlycS1ncGlvIHByb3BlcnR5IGFzIGludGVy
cnVwdHMvaW50ZXJydXB0LXBhcmVudA0KcGFpciBkb2VzIHRoZSBqb2IuDQoNClRoYW5rIHlvdSwN
Ck1hcmlhbg0K
