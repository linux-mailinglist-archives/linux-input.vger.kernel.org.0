Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7373179085
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 13:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387966AbgCDMiW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 07:38:22 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:49507
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726440AbgCDMiW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Mar 2020 07:38:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLdb+mdeYuFKPE9Zk2weeUE3Y8+ZKlov+JAYHOonV8sIir93BqhO0vhNis4gz7waOo0MKB/vvq61LIC3rHUuSC8KhXecXvHgM2diWrTFnRPzRh6Hwfe5uqNj1RagbIRVVbEmt14In28pUl8q6/OfOqIZkjc5Fiw2aMcy/TBb+5LcNbF0GIOe5JohmnSR4qu+837/jF/ycHZUwPoHYPUEplCBoNpi7RGp+e6PU9McrksDnW+jzhubWtrHDgh7HkN7fYAmnR8wTphgFNuUMqHp4UB1qU88jlO0LgIen2uEcpc0CeJs9LdxbVWeOeR1zPXsaIcooqfbeZvA5l8prrHStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YI7Mzh4yrKAjOPRCpn8cvCfjsnTGW/qgPn8tBqSlMzI=;
 b=cCo9xk0VouaGrsJbrcR00bAyCQVk4MdjlLPA3swGXldccaiVqL2moy1ysXTHY8MKld5wg7zLYsD6CIdxvakSCqwZrM54U/Lm0ubOFy+zAGjtytmETcRB3UFmZMe1yg+0v2WaZKHUP8W//rpwNiXDFobQ9tpZnHRhf/uw+58QuWaU/c1KSg7y5nI1vjv7Vuf2J1E6HujwE1dXwqjCFa6EcRb26nDD0dOYsAvHRyFfOpB+uuB5bBsIfXP+f3P08a9J0Rtkv2RYTX6yVvtMhncGMpAnlGGVsd09FFsaxJ/jBJrjs2Lrf+KpVNDHK8OmOo2Bhf9iXNvSpJ0wIboj/5rCKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YI7Mzh4yrKAjOPRCpn8cvCfjsnTGW/qgPn8tBqSlMzI=;
 b=rIHWSvAgdMnG0KONw8IUeASbduV8ZJS4OD/3xMmYx0uFQJnpta5XfjWteuDe+BoQ39KhOhwPbOyZTTfF4j0oVAwYP2Rg1jGdBY52T8aO9a04V78aB//Qtz0GNDB2idT92K5gejXOPa9CByRQ/EwMhbKUSory7tgS2tEaAMmd9lE=
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com (20.179.179.149) by
 OSAPR01MB3729.jpnprd01.prod.outlook.com (20.178.103.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Wed, 4 Mar 2020 12:38:16 +0000
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092]) by OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092%7]) with mapi id 15.20.2772.019; Wed, 4 Mar 2020
 12:38:16 +0000
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
Thread-Index: AQHV2zyxdFprAZ+aikeI+eBmLQnm7Kg1gv2AgAMEh3A=
Date:   Wed, 4 Mar 2020 12:38:15 +0000
Message-ID: <OSAPR01MB502876C5213B528A95A5B912AEE50@OSAPR01MB5028.jpnprd01.prod.outlook.com>
References: <1580808174-11289-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdVmsDVJRWp2uzVs0BKp-CjAcc6PS-1wBPT8J+UZr1O7CA@mail.gmail.com>
In-Reply-To: <CAMuHMdVmsDVJRWp2uzVs0BKp-CjAcc6PS-1wBPT8J+UZr1O7CA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marian-cristian.rotariu.rb@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69c5e6da-a39e-47d6-b20e-08d7c038e94e
x-ms-traffictypediagnostic: OSAPR01MB3729:|OSAPR01MB3729:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB37290609589641A2CD55BCC4AEE50@OSAPR01MB3729.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(71200400001)(5660300002)(33656002)(52536014)(6916009)(55016002)(54906003)(86362001)(9686003)(316002)(6506007)(4326008)(7696005)(26005)(66476007)(66946007)(64756008)(76116006)(66556008)(66446008)(8936002)(81156014)(478600001)(81166006)(2906002)(186003)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3729;H:OSAPR01MB5028.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CcQy18N6+yrgdZ5hPc6WCgNzXxoCuuVIuZcwFQta/VENqXdCQ7AUlN0ZUqjNHkcIJsiw53nrFeCR2x7f4DzE+igaBFPRy3ds4yNyNvz/NGuebmGNuD2aBiFzY33qfX11774t0LDEQ50dP/jM6bnAdtisGR2fXo9cJOGdtKjnwqe5W158nLK1jxAxc8gY6WzbaaBY/iF1Bu7QLY/DdGf8WHypQFmxsoCViMEdhvmMS1mkALCn/chkzNX6Eu8Ulf47eq4WbBwep3NXdHonWHNhA911e1Ktlc+M8Q+jG+DFcrAjGJIuGyBpjTw6czZyQUTnuB4bc2Oh25VNIk2qtAj8y5RmVCyCPfcc3wgt0ZGdxRC2bR6zU9dXtoBTl1mg6G1vrgOTFSyf3jqzO884AbFPYVeNUdtzQBT/L4AoMQ0+mfaOE8Hvst8zQ1FH61xsgkzw
x-ms-exchange-antispam-messagedata: DSWpP/1Mohqi1MvRwVPI7NB0cipAz+ReD1l/EPqJFR8L3XXCmKLZcvFVDlOUSJKXOqbRF3rEtZPYS5ofYCWFjTZus7fH6LvAwzGVbI2GWS9bbTljqpGpTbYnvTFG/h6YyVwtkYBZnwZITKHBeuXBIA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c5e6da-a39e-47d6-b20e-08d7c038e94e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 12:38:15.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gDMHRC7ofbAWnzk8BxBZ0Q1L8xzKEy68aix6ImVoErgugkDwXs2QWTSmMQqKPgYz7uE3sNYTIYWNY64YCBHkm9sR8taY7gUU6YodfqEwIVGXCgcjP6eW6jEyBohTzjmCEII0sMunB8xMi6ooku4EbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3729
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiA+IC0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3I4YTc3NDUtaXdnMjJkLXNvZGltbS5kdHMNCj4gPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9yOGE3NzQ1LWl3ZzIyZC1zb2RpbW0uZHRzDQo+ID4gQEAgLTEyOCw2ICsxMjgs
NDcgQEANCj4gPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiAgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPiA+DQo+ID4gKyAgICAgICBzdG1wZTgxMUA0NCB7DQo+ID4g
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtcGU4MTEiOw0KPiANCj4gQWNjb3Jk
aW5nIHRvIHRoZSBEVCBiaW5kaW5ncywgdGhpcyBtdXN0IGJlICJzdCxzdG1wZS10cyIsIGJ1dCB0
aGUgZXhhbXBsZQ0KPiBhbHNvIHVzZXMgInN0LHN0bXBlODExIj8NCg0KVGhlIGRldmljZSBpcyBh
IE1GRCBhbmQgdGhlIGJpbmRpbmdzIGRvYyBpcyBoZXJlOg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9zdG1wZS50eHQNCg0KWW91IG5lZWQgdG8gYWRkIGl0cyBzcGVjaWZp
YyBmdW5jdGlvbiBhcyBhIGNoaWxkIG5vZGUgb2YgdGhlIG1mZCBkdCBub2RlLiBJbiBvdXINCmNh
c2UgaXQgaXMgYSB0b3VjaHNjcmVlbjoNCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS50eHQNCg0KPiANCj4gPiArICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiANCj4gTm90IGRvY3VtZW50ZWQgaW4gdGhlIERUIGJpbmRpbmdzIChidXQgdXNlZCBp
biB0aGUgZXhhbXBsZSkuDQoNCkluIHRoZSBjaGlsZCBub2RlIHlvdSBkbyBub3QgbmVlZCB0aGUg
cmVnIHByb3BlcnR5LCB0aGVyZWZvcmUgdGhlIGV4YW1wbGUgaXMgbm90DQphcHBsaWNhYmxlLiBJ
IHdpbGwgcmVtb3ZlIHRoZSBhYm92ZSBpbiB0aGUgdjIgcGF0Y2guDQoNCj4gDQo+ID4gKyAgICAg
ICAgICAgICAgIHJlZyA9IDwweDQ0PjsNCj4gPiArICAgICAgICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwmZ3BpbzQ+Ow0KPiA+ICsgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDAgSVJR
X1RZUEVfTEVWRUxfTE9XPjsNCj4gDQo+IFRoaXMgc2hvdWxkIGJlICI8NCBJUlFfVFlQRV9MRVZF
TF9MT1c+IiwgdG8gcmVmZXIgdG8gR1A0XzQuDQoNCkluZGVlZCwgSSB3aWxsIGZpeCBpdCBpbiB2
Mi4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAgaXJxLWdwaW8gPSA8JmdwaW80IDQgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsNCj4gDQo+ICJpcnEtZ3BpbyIgaXMgbm90IGRvY3VtZW50ZWQgaW4gdGhl
IERUIGJpbmRpbmdzLg0KDQpTZWUgIkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvc3RtcGUudHh0Ig0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnRv
dWNoPjsNCj4gPiArICAgICAgICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4g
PiArICAgICAgICAgICAgICAgaWQgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIGJsb2NrcyA9
IDwweDU+Ow0KPiA+ICsgICAgICAgICAgICAgICBpcnEtdHJpZ2dlciA9IDwweDE+Ow0KPiANCj4g
QWJvdmUgMyBhcmUgbm90IGRvY3VtZW50ZWQuDQoNClRoZXNlIG11c3QgYmUgcmVsaWNzIGZyb20g
YW4gb2xkIGRyaXZlciB0aGF0IHdlIGhhdmUgZm9yIGFuIG9sZGVyIGtlcm5lbA0KdmVyc2lvbi4g
SSB3aWxsIHJlbW92ZSBhbGwgMyBhcyB0aGUgY3VycmVudCBkcml2ZXIgaXMgbm90IHVzaW5nIHRo
ZW0uDQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBzdG1wZV90b3VjaHNjcmVlbiB7
DQo+IA0KPiBNaXNzaW5nIHVuaXQtYWRkcmVzcy4NCg0KSSB3aWxsIHJlbW92ZSB0aGUgcmVnIHBy
b3BlcnR5LCB0aGVyZWZvcmUgbm8gdW5pdC1hZGRyZXNzIHJlcXVpcmVtZW50Lg0KDQo+IA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtcGUtdHMiOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAvKiAzLjI1IE1IeiBBREMgY2xvY2sgc3BlZWQgKi8NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBzdCxhZGMtZnJlcSA9IDwzPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAvKiA4IHNhbXBsZSBhdmVyYWdlIGNvbnRyb2wgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBzdCxhdmUtY3RybCA9IDwyPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiA3
IGxlbmd0aCBmcmFjdGlvbmFsIHBhcnQgaW4geiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHN0LGZyYWN0aW9uLXogPSA8Nz47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiA1MCBtQSB0eXBpY2FsIDgwIG1BIG1heCB0
b3VjaHNjcmVlbiBkcml2ZXJzDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogY3VycmVu
dCBsaW1pdCB2YWx1ZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0LGktZHJpdmUgPSA8MD47DQo+IA0KPiBCaW5kaW5ncyBzYXkg
PDA+IGNvcnJlc3BvbmRzIHRvIDIwIG1BLg0KPiBFaXRoZXIgdGhlIGNvbW1lbnQgaXMgd3Jvbmcs
IG9yIHRoaXMgc2hvdWxkIGJlIDwxPi4NCg0KSSB3aWxsIGFkZCB0aGUgdmFsdWUgdGhhdCBtYXRj
aGVzIHRoZSBvbmUgZnJvbSB0aGUgY29tbWVudC4NCg0KPiANCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAvKiAxMi1iaXQgQURDICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Qs
bW9kLTEyYiA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBpbnRlcm5hbCBB
REMgcmVmZXJlbmNlICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3QscmVmLXNlbCA9
IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBBREMgY29udmVyc3Rpb24gdGlt
ZTogODAgY2xvY2tzICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Qsc2FtcGxlLXRp
bWUgPSA8ND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogMSBtcyBwYW5lbCBkcml2
ZXIgc2V0dGxpbmcgdGltZSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0LHNldHRs
aW5nID0gPDM+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qIDUgbXMgdG91Y2ggZGV0
ZWN0IGludGVycnVwdCBkZWxheSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0LHRv
dWNoLWRldC1kZWxheSA9IDw0PjsNCj4gDQo+IEJpbmRpbmdzIHNheSA8ND4gY29ycmVzcG9uZHMg
dG8gMSBtcy4NCj4gRWl0aGVyIHRoZSBjb21tZW50IGlzIHdyb25nLCBvciB0aGlzIHNob3VsZCBi
ZSA8NT4uDQoNCkFzIGFib3ZlLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsg
ICAgICAgfTsNCj4gPiArDQo+ID4gICAgICAgICBzZ3RsNTAwMDogY29kZWNAYSB7DQo+ID4gICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLHNndGw1MDAwIjsNCj4gPiAgICAgICAgICAg
ICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwwPjsgQEAgLTE4MSw2ICsyMjIsMTEgQEANCj4gPiAg
ICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAic3NpIjsNCj4gPiAgICAgICAgIH07DQo+ID4NCj4g
PiArICAgICAgIHRvdWNoOiBzdG1wZTgxMSB7DQo+ID4gKyAgICAgICAgICAgICAgIGdyb3VwcyA9
ICJpbnRjX2lycTAiOw0KPiA+ICsgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpbnRjIjsNCj4g
DQo+IFRoaXMgZG9lcyBub3QgbWF0Y2ggdXNpbmcgR1A0XzQgZm9yIHRoZSBpbnRlcnJ1cHQuDQo+
IA0KPiBFaXRoZXIgeW91IHVzZSBHUDRfNDoNCj4gDQo+ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0g
PCZncGlvND47DQo+ICAgICBpbnRlcnJ1cHRzID0gPDQgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4g
DQo+IHdoaWNoIGRvZXNuJ3QgcmVxdWlyZSBhbnkgZXhwbGljaXQgcGluIGNvbnRyb2wgc2V0dXAg
KHRoZSBncGlvLXJjYXIgZHJpdmVyDQo+IHRha2VzIGNhcmUgb2YgdGhhdCksIG9yIHlvdSB1c2Ug
SVJRMDoNCj4gDQo+ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpcnFjPjsNCj4gICAgIGludGVy
cnVwdHMgPSA8MCBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KPiANCj4gVGhlIGxhdHRlciBkb2VzIHJl
cXVpcmUgZXhwbGljaXQgcGluIGNvbnRyb2wgc2V0dXAuDQoNCkkgd2lsbCB1c2UgdGhlIGZpcnN0
IGFwcHJvYWNoIGFzIHRoZSBwYXRjaCBsb29rcyBtb3JlIGNvbXBhY3QuDQoNCkJlc3QgcmVnYXJk
cywNCk1hcmlhbg0K
