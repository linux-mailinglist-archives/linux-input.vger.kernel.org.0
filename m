Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2AC1133ED8
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 11:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgAHKFb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 05:05:31 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.112]:60357 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726567AbgAHKFb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jan 2020 05:05:31 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.eu-central-1.aws.symcld.net id E2/24-12462-669A51E5; Wed, 08 Jan 2020 10:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSfUwTZxjnvY/2wNYcLU3fEWi0fiSCrS0Yd39
  smdkSAiMSEjaWEaNc6Y02toW1JSvLZmCRREEd48Nos1qsn+CGBoKxzimwxpVGZXQgKoyMUV1h
  Y4PBOp207K5X3fbf7+ue5/deHgKVfCdIJxiHnbFaaJNSkIIZtiXvUDGdsj2au4vZlNt3F6e+8
  YQB1dXuxagHf0RwauHaGEo1fO0T7hTke50/CPN7ug4J8j+NavKXehTFWBlutOiqHOW44XF3HV
  rtzHUcaJrG64AvpxGkEIA8i8LOySMCntzC4HTbsQTpBfDZkadxgpF+FIYeR4UckZDtCLzXOQd
  4MgPg9Z/qWJJMCEgKtvp/FHA4jdwLv3XdQbkQSkYQ2OStxzhDyhqtD5/ifKgc/trqRHlcBH+b
  D8cxRm6EN8eH40PFJA0PLd9IbIsh8HKoLz4omXwVrvhuCzkMyEy4XH8x/jFKyuHDkBvhMCRJe
  Ob6MMpjGZydieF8noFDn9wHvL4V3hkPJbASnnT5EjgTBt1NCbwLLv41wc4h4vnI/C5epuCZpg
  aMlzfC2GAtL1fDxeFgosFmuPRoNNEgA7qnpnDuKZDswuBwbwBpBtuc/2ntZEeh5BZ46VpCXg/
  bmqaFzvifSIVDJ0JYB8C6AKWzGisNdjNtNKm0Go1Kq81VbVflatT0hyqdmqlRVTAWu5VmTTX9
  gU1tqzVXmPRqC2PvAexZ6d/HFFdBS2RePQheIhClTGx0yfZI1uqq9LUG2mbYa60xMbZBkEEQS
  ih+7QLrpVqZSsbxntHEHudzGxIiZZq4nLPFtmrabDNW8lYA5BLNsy4PSvhcZz2oBLNUWZh0uf
  jz82yU5KKGGsuLQc8PPQgy06VikJSUJBFVM1az0f5/fw7ICaCUii3cQpHRYn+xb46tgrBVUsK
  pXBU7/a+VXod8PHDq3cB9j44p9cv7pw6KMka31B8bylZcoFrOyU/1jXqjN/RUFlWysKFhH/b7
  2Buimn2TT94sWy31DdR+ND7bmYf6Am9b12Ufff12OKg+X3LiM60+69mIOyYXFFz1SQ/uDxwtj
  uZYB7LG/CPoFeTS98dlN5G31lzZEImW72xsXOq/3Df055PVLxYmHvVhm5Yv5hxOLSlwnyxr7f
  hqf2GwfWZyJH3Hgf61gvWlIgvSnH+uCPdJW35ePp5HrAt5oqt13b3uDia78PDutkjHvUrCG+z
  +e80r/ZtXKtozvsS1JVsV5k31cGV33jsK9EFBzPFyYdEvE9tvnU7z+2eKw+KFSSVmM9DaLNRq
  o/8Bq2in8mMEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-24.tower-246.messagelabs.com!1578477925!1799284!1
X-Originating-IP: [104.47.9.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16417 invoked from network); 8 Jan 2020 10:05:25 -0000
Received: from mail-ve1eur03lp2054.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.54)
  by server-24.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Jan 2020 10:05:25 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pxls7e90dP9ymYu5S7+UgabADCPoUsrVvbpMt2yimHfDaG61rZbSXmGHxwxQa2PmCy6Kqr0up8RP2uRSjJYgNjTH2ereNJxg7ZFfGfwS7fj3QOX6MNpZ8y3qtcRD0Uxblv8ml+Owe9g+vPxd6w/KRBrWUogpoe/WKIocisqYLnohc1YsK4wfFmSujM9MwgmXEUAB7RBCuFhE+sI08x7gCZtMhQI8gTAYBQDLVKaVat3UHVhZXlrHTnJXSOkruw9jVPzlVJdbTcZxTRcN3nAkQsFObwxj2CgBzCz63dpEty1qYResI5PHrcijXTYWmzy8yqd/cn6tS4BhMV7lqzN+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8s60IdPpUyEPXv4sH9Q7aBRYRjWY63BhhPF+5xMTYA=;
 b=jxu8DzcBgFF1xP0sk6O9oeznPdhDBBWfxb9D63ES4IvvDuvBu34yDabv5x0KDctv/2HNq0gqiufsJUeUgtu8LCjNSbcyWGX652W37UULiJICOLOs2MWSlpw49jI3+yANCSkoNGFWFPtHguEbQvL+oyYe0iMA/r6O64bu27GMjI60Tah3u8eO8JF9gRA3C8uZbe/TDwYw4++D0Y4BXeyg+JTW8GAWpscepuU4OeE36f1r95JouJpzq8cQ68lrBE9PsKomOjbD13MhNvKfPga0rbQbHFDjjIy8L7dVjUxwaGReV4vRAF295mI7HoOZsLxZCndpzcKylQB+um7Ia8t/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8s60IdPpUyEPXv4sH9Q7aBRYRjWY63BhhPF+5xMTYA=;
 b=fPE5VPJFp1Aq2mQyTPnOxc4vZcr1bgTQlvhLtX8PJKDaECOwvVSAxMqwl8u384VX4lndGY6RX1pDZnaOhFzgkPYgSyJ7PlHMYxPpGT6broi6cmGsU4+ThcRK+pB9hR3QC6mQiw+QGfGzypi9rjqRs1unS8/DU4mm0nlKtw4lJSE=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1073.EURPRD10.PROD.OUTLOOK.COM (10.169.152.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.13; Wed, 8 Jan 2020 10:05:24 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ed23:3ca0:97ef:c868%10]) with mapi id 15.20.2602.017; Wed, 8 Jan 2020
 10:05:24 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Thread-Topic: [PATCH v2 3/3] dt-bindings: Input: da9062 - fix
 dlg,disable-key-power description
Thread-Index: AQHVpSXRUU8r21ku9EatdfUM8rH4w6emv+kggAxdQYCAA0DDUIAouxOAgAGxkCA=
Date:   Wed, 8 Jan 2020 10:05:24 +0000
Message-ID: <AM5PR1001MB09941D7D48C31A7A79FD5A3F803E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-4-m.felsch@pengutronix.de>
 <AM5PR1001MB099439FC20DAEBFC6584081280430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191210082759.2hf6ekuqgs2uzzm2@pengutronix.de>
 <AM5PR1001MB0994D38015B1799F3F3A7CF380550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20200107080831.lbeqpdxkgk42pbke@pengutronix.de>
In-Reply-To: <20200107080831.lbeqpdxkgk42pbke@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b510f93-d35f-4be7-d6a5-08d79422475f
x-ms-traffictypediagnostic: AM5PR1001MB1073:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1073E6230F75C2D72FEEB9FFA73E0@AM5PR1001MB1073.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(136003)(346002)(366004)(376002)(189003)(199004)(33656002)(316002)(66946007)(66446008)(64756008)(66556008)(66476007)(76116006)(9686003)(478600001)(55016002)(186003)(86362001)(6506007)(2906002)(5660300002)(53546011)(55236004)(54906003)(7696005)(81156014)(8936002)(71200400001)(4326008)(110136005)(8676002)(52536014)(26005)(81166006)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1073;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VjQMd5zaOIuRsaOb5c7SRPnP/InoI2uvaBKvIwXnvk57fmp7ugz2eM/gU3WYCyTmN0sazTl59dCA7S7y/MqBCrhjNWLExgWGhpS6V2HvkbEykyFfG0sbqfHm4yeR9Kd8RNf68ZodZUd82wUTu7vt7aC8c3L21Hhe3Q6ydAvEHnlf9DfQDBdxrxD+hm4lm6ati1tFqi+i+RcjWw1GNxosBXcI4BQVDDfmP3h9bZYAzgQMX57v/CvN+NpvlbjFuAODSTJO4LE8gLAQ1Tgw2lmB+QomSy64fkHKr62YpWm5af7VTY9Y+Cd59WHe7Fy0oV99uQWOkEv4AeLvBCv30sa5vtrA+R+Dqx6fXbzUdxaofDnm+Vn2PsZ1YjraMzwv44+IQC244rMtFjL3EA/UVCFByXsEu0aXHQSIv7VZ+qfTycLXDNZrJQTeHskwB3Ls7VHH/k/6vDMSAFxOUP3Uo2+v7ts6GsOnUjfAWqoa7g2SLukdiodeEyLQrPhpjZHwYFD8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b510f93-d35f-4be7-d6a5-08d79422475f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 10:05:24.3096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gbN25p0vRtyojc8hTZLKis6ytFCJr5DDUUXznpj7ie0zaVzj671/FoXDiujBAw5erJ6xRnHZphJXkkZXWVqJA5OxbJi2OvQsHzSsyPtl0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1073
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMDcgSmFudWFyeSAyMDIwIDA4OjA5LCBNYXJjbyBGZWxzY2ggd3JvdGU6DQoNCj4gSGkgQWRh
bSwgRG1pdHJ5LA0KPiANCj4gT24gMTktMTItMTIgMTA6MDgsIEFkYW0gVGhvbXNvbiB3cm90ZToN
Cj4gPiBPbiAxMCBEZWNlbWJlciAyMDE5IDA4OjI4LCBNYXJjbyBGZWxzY2ggd3JvdGU6DQo+ID4N
Cj4gPiA+IEhpIEFkYW0sDQo+ID4gPg0KPiA+ID4gT24gMTktMTItMDIgMTI6MTUsIEFkYW0gVGhv
bXNvbiB3cm90ZToNCj4gPiA+ID4gT24gMjcgTm92ZW1iZXIgMjAxOSAxMzoyMywgTWFyY28gRmVs
c2NoIHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiA+IFRoZXJlIHdhcyBhIGJ1ZyB3aXRoaW4gdGhl
IGRyaXZlciBzaW5jZSBjb21taXQgZjg4OWJlYWFhYjFjICgiSW5wdXQ6DQo+ID4gPiA+ID4gZGE5
MDYzIC0gcmVwb3J0IEtFWV9QT1dFUiBpbnN0ZWFkIG9mIEtFWV9TTEVFUCBkdXJpbmcgcG93ZXIN
Cj4gPiA+ID4gPiBrZXktcHJlc3MiKS4gU2luY2Ugd2UgZml4ZWQgdGhlIGJ1ZyB0aGUgS0VZX1BP
V0VSIHdpbGwgYmUgcmVwb3J0ZWQNCj4gPiA+ID4gPiBhbHdheXMgc28gd2UgbmVlZCB0byBhZGFw
dCB0aGUgZHQtYmluZGluZ3MgdG9vLiBNYWtlIHRoZSBkZXNjcmlwdGlvbg0KPiA+ID4gPiA+IG1v
cmUgcHJlY2lzZSB3aGlsZSBvbiBpdC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gdjI6DQo+ID4gPiA+ID4gLSBjaGFuZ2UgZGVzY3JpcHRpb24gYWNjb3JkaW5n
IERtaXRyeSdzIHN1Z2dlc3Rpb24uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2RhOTA2Mi1vbmtleS50eHQgfCA1ICsrLS0tDQo+
ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L2RhOTA2Mi1vbmtleS50eHQNCj4gPiA+ID4gPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9kYTkwNjItb25rZXkudHh0DQo+ID4gPiA+
ID4gaW5kZXggMDAwNWIyYmRjZGQ3Li45Zjg5NTQ1NDE3OWQgMTAwNjQ0DQo+ID4gPiA+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2RhOTA2Mi1vbmtleS50
eHQNCj4gPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5w
dXQvZGE5MDYyLW9ua2V5LnR4dA0KPiA+ID4gPiA+IEBAIC0xNSw5ICsxNSw4IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IC0tIGRsZyxkaXNhYmxlLWtleS1wb3dlciA6IERpc2FibGUg
cG93ZXItZG93biB1c2luZyBhIGxvbmcga2V5LXByZXNzLiBJZg0KPiB0aGlzDQo+ID4gPiA+ID4g
LSAgICBlbnRyeSBleGlzdHMgdGhlIE9uS2V5IGRyaXZlciB3aWxsIHJlbW92ZSBzdXBwb3J0IGZv
ciB0aGUgS0VZX1BPV0VSDQo+IGtleQ0KPiA+ID4gPiA+IC0gICAgcHJlc3Mgd2hlbiB0cmlnZ2Vy
ZWQgdXNpbmcgYSBsb25nIHByZXNzIG9mIHRoZSBPbktleS4NCj4gPiA+ID4gPiArLSBkbGcsZGlz
YWJsZS1rZXktcG93ZXIgOiBJZiB0aGlzIHByb3BlcnR5IGlzIHByZXNlbnQsIHRoZSBob3N0IHdp
bGwgbm90IGJlDQo+ID4gPiA+ID4gKyAgICBpc3N1aW5nIHNodXRkb3duIGNvbW1hbmQgb3ZlciBJ
MkMgaW4gcmVzcG9uc2UgdG8gYSBsb25nIGtleS1wcmVzcy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhp
cyBhbHNvIGNoYW5nZXMgYmVoYXZpb3VyIG9mIGJ1dHRvbiBwcmVzcyByZXBvcnRpbmcgYXMgdGhl
IGRyaXZlciB3aWxsIG5vdA0KPiA+ID4gPiByZXBvcnQgYSBsb25nZXIgcHJlc3MgKGkuZS4gYSBi
dXR0b24gaG9sZCB3aGVyZSB0aGUgZHJpdmVyIHBvbGxzIGZvciByZWxlYXNlKS4NCj4gPiA+ID4g
SXQgd2lsbCBvbmx5IHJlcG9ydCBhIHNob3J0IGtleSBwcmVzcyB0byB1c2VyLXNwYWNlIHdpdGgg
dGhpcyBwcm9wZXJ0eQ0KPiBwcm92aWRlZC4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHF1ZXN0aW9u
IGhlcmUgaXMgZG8gd2Ugc3RpbGwgd2FudCB0byBzdXBwb3J0IGxvbmcgcHJlc3MgcmVwb3J0aW5n
IGJ1dA0KPiA+ID4gPiB3aXRob3V0IHRoZSBJMkMgc2VxdWVuY2UgZm9yIHNodXRkb3duPyBJZiBz
byB0aGUgZHJpdmVyIG5lZWRzIHRvIGJlDQo+IHVwZGF0ZWQNCj4gPiA+IHRvDQo+ID4gPiA+IHdv
cmsgdGhpcyB3YXkgYXMgcmlnaHQgbm93IGl0IGRvZXNuJ3QuDQo+ID4gPg0KPiA+ID4gR29vZCBw
b2ludC4gSSBjaGVja2VkIHRoZSBkcml2ZXIgYW5kIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUN
Cj4gPiA+IGRhOTA2Mi8zIGFnYWluIGFuZCBpdCBzZWVtcyB0aGF0IHdlIGludGVycnVwdCB0aGUg
cG1pYyBodyBieSBkb2luZyB0aGUNCj4gPiA+IHNodXRkb3duIGJ5IGl0c2VsZi4gQXMgdGhlIGRv
Y3VtZW50YXRpb24gc2F5czoNCj4gPiA+DQo+ID4gPiBEQTkwNjM6DQo+ID4gPiBJZiB0aGUgaGFy
ZHdhcmUgcmVzZXQgd2FzIGluaXRpYXRlZCBieSBhIChkZWJvdW5jZWQpIHByZXNzIG9mIG5PTktF
WSAob3INCj4gPiA+IEdQSU8xNCBhbmQgR1BJTzE1IHRvZ2V0aGVyKSBsb25nZXIgdGhhbiBTRF9E
RUxBWSwgdGhlIERBOTA2MyBpbml0aWFsbHkNCj4gPiA+IG9ubHkgYXNzZXJ0cyBjb250cm9sIGJp
dCBLRVlfUkVTRVQgaW4gdGhlIGZhdWx0IHJlZ2lzdGVyIGFuZCBzaWduYWxzIGENCj4gPiA+IG5v
bi1tYXNrYWJsZSBpbnRlcnJ1cHQgYWxsb3dpbmcgdGhlIGhvc3QgdG8gY2xlYXIgdGhlIGFybWVk
IHJlc2V0DQo+ID4gPiBzZXF1ZW5jZSB3aXRoaW4gMSBzLiBJZiB0aGUgaG9zdCBkb2VzIG5vdCBj
bGVhciBLRVlfUkVTRVQgdGhlbiBhDQo+ID4gPiBzaHV0ZG93biB0byBSRVNFVCBtb2RlIGlzIGV4
ZWN1dGVkLiBLRVlfU0RfTU9ERSBkZXRlcm1pbmVzIGlmIG5vcm1hbA0KPiA+ID4gcG93ZXIgc2Vx
dWVuY2UgdGltaW5nIG9yIGEgZmFzdCBzaHV0ZG93biBpcyBpbXBsZW1lbnRlZC4NCj4gPiA+DQo+
ID4gPiBEQTkwNjI6DQo+ID4gPiBJZiB0aGUgcmVzZXQgd2FzIGluaXRpYXRlZCBieSBhIHVzZXLi
gJlzIGxvbmcgcHJlc3Mgb2Ygbk9OS0VZLCBpbml0aWFsbHkNCj4gPiA+IG9ubHkgS0VZX1JFU0VU
IGlzIHNldCBhbmQgdGhlIG5JUlEgcG9ydCB3aWxsIGJlIGFzc2VydGVkLiBLRVlfUkVTRVQNCj4g
PiA+IHNpZ25hbHMgdGhlIGhvc3QgdGhhdCBhIHNodXRkb3duIHNlcXVlbmNlIGlzIHN0YXJ0ZWQu
IElmIHRoZSBob3N0IGRvZXMNCj4gPiA+IG5vdCB0aGVuIGNsZWFyIEtFWV9SRVNFVCB3aXRoaW4g
MSBzIGJ5IHdyaXRpbmcgYSAxIHRvIHRoZSByZWxhdGVkIGJpdCBpbg0KPiA+ID4gcmVnaXN0ZXIg
RkFVTFRfTE9HLCB0aGUgc2h1dGRvd24gc2VxdWVuY2Ugd2lsbCBjb21wbGV0ZS4gV2hlbiB0aGUg
cmVzZXQNCj4gPiA+IGNvbmRpdGlvbiBoYXMgZGlzYXBwZWFyZWQsIERBOTA2MiByZXF1aXJlcyBh
IHN1cHBseSAoVlNZUyA+DQo+ID4gPiBWRERfRkFVTFRfVVBQRVIpIHRoYXQgcHJvdmlkZXMgZW5v
dWdoIHBvd2VyIHRvIHN0YXJ0LXVwIGZyb20gdGhlDQo+ID4gPiBQT1dFUkRPV04gbW9kZS4NCj4g
PiA+DQo+ID4gPiBTbyB3ZSBkb24ndCBuZWVkIHRvIGNoZWNrIGZvciB0aGUgS0VZX1JFU0VUPyBU
aGlzIHdvdWxkIGNsZWFudXAgdGhlIGNvZGUNCj4gPiA+IGEgYml0Lg0KPiA+DQo+ID4gV2UgY291
bGQgcmVtb3ZlIHRoYXQgYnV0IEkgdGhpbmsgdGhlIGludGVudGlvbiBvcmlnaW5hbGx5IHdhcyB0
byBoYXZlIHRoaXMgY29kZQ0KPiA+IHRoZXJlIGluIGNhc2UgdGhlcmUgd2FzIHNvbWUgd2F5IHRv
IG1vcmUgZ3JhY2VmdWxseSBzaHV0ZG93biB0aGUgc3lzdGVtIGluDQo+IHRoaXMNCj4gPiBzY2Vu
YXJpby4gUmlnaHQgbm93IHRoYXQncyBub3QgdGhlIGNhc2UgYXMgdGhlIGNvZGUgc2ltcGx5IGNh
bGxzIHRvIHNodXRkb3duDQo+ID4gdGhlIHBtaWMgdmlhIGEgbWFudWFsIHJlZ2lzdGVyIGNhbGws
IGJ1dCBtYXliZSBpbiB0aGUgZnV0dXJlIHRoaXMgY291bGQgYmUgbWFkZQ0KPiA+IG1vcmUgZ3Jh
Y2Z1bC4gQW5vdGhlciBzbGlnaHQgYWR2YW50YWdlIG9mIGxlYXZpbmcgdGhhdCBjb2RlIGluIGlz
IHRoYXQgd2UncmUNCj4gPiBub3Qgd2FpdGluZyBmb3IgYW5vdGhlciBzZWNvbmQgZGVsYXkgZm9y
IHRoZSBQTUlDIHRvIHB1bGwgdGhlIHBsdWcuDQo+ID4NCj4gPiBXaXRoIHJlZ2FyZHMgdG8gdGhp
cyBwYXRjaCBhbmQgdGhlIHN1YnNlcXVlbnQgb25lIHRvIHVwZGF0ZSB0aGUgT25LZXkgZHJpdmVy
LA0KPiBJDQo+ID4gdGhpbmsgd2Ugc2hvdWxkIGRlcHJlY2F0ZSB0aGlzIHByb3BlcnR5LiBUaGUg
T25LZXkgbW9kZSBiaW5kaW5nIHlvdSBhZGRlZA0KPiBpbg0KPiA+IGEgZGlmZmVyZW50IHBhdGNo
IHdpbGwgY29uZmlndXJlIHRoZSBPbktleSBhY2NvcmRpbmcgdG8gaG93IHlvdSB3YW50IGl0IHRv
DQo+ID4gYmVoYXZlIGluIGhhcmR3YXJlIHNvIEkgZG9uJ3QgdGhpbmsgdGhpcyBwcm9wZXJ0eSBt
YWtlcyBtdWNoIHNlbnNlIGFueW1vcmUuDQo+IFdlDQo+ID4gY2FuIHRoZW4gcmVtb3ZlIHRoZSBu
ZWVkIGZvciAna2V5X3Bvd2VyJyB1c2FnZSBpbiB0aGUgZHJpdmVyLg0KPiANCj4gSXMgaXQgb2th
eSBmb3IgeW91IGJvdGggdG8gZHJvcCB0aGlzIHBhdGNoIGZyb20gdGhpcyBzZXJpZXMgYW5kIG9w
ZW4gYQ0KPiBuZXcgJ3Jld29yaycgc2VyaWVzPw0KDQpJIGhhdmUgbm8gaXNzdWVzIHdpdGggdGhp
cy4NCg==
