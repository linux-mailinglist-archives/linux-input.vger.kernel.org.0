Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB2F11CA46
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 11:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbfLLKJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 05:09:05 -0500
Received: from mail1.bemta25.messagelabs.com ([195.245.230.65]:36381 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728575AbfLLKJE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 05:09:04 -0500
Received: from [46.226.52.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.eu-west-1.aws.symcld.net id F3/4A-12286-BB112FD5; Thu, 12 Dec 2019 10:08:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIJsWRWlGSWpSXmKPExsWSoc9prLtT8FO
  swcbbghbzj5xjtTi86AWjxaqpO1ksbn76xmrxYddVZovWvUfYHdg8ds66y+6xaVUnm0f/XwOP
  z5vkAliiWDPzkvIrElgzWp6/Zi14aFSx514rSwNjj1EXIxcHo8BSZokDt56xQDjHWCRWzJwL5
  WxmlPjd+5MNxGEROMEsMf/UZbCMkMA0Jol7H16xQTgPGSVenrkOlOHkYBOwkJh84gEbiC0iEC
  9xfO5ZZpAiZoFvTBLdOxvBioSBEpNv/WSFKEqQeDN5FjOE7STR1nmFHcRmEVCVeH7oH1icVyB
  R4sHxTVCrvzFKzP0yG2wDp4CtxMPLvWBDGQVkJb40rgZrYBYQl7j1ZD4TiC0hICCxZM95Zghb
  VOLl43+sEPWpEiebbjBCxHUkzl5/AmUrScybewTKlpW4NL8byvaV+Dp5NRNM/aOuc1BxC4kl3
  a1AN3AA2SoS/w5VQoQLJDp2rGeBsNUkPj+9AnWCjMTOnm5wyEkIbGKRuPV3C/sERv1ZSM6eBT
  SKWUBTYv0uqLCixJTuh+yzwEEhKHFy5hOWBYwsqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tLXU
  NLUz0Eqt0k/RSS3XLU4tLdA31EsuL9Yorc5NzUvTyUks2MQLTVUrB8R07GI9+fat3iFGSg0lJ
  lHcCz6dYIb6k/JTKjMTijPii0pzU4kOMMhwcShK8dvxAOcGi1PTUirTMHGDqhElLcPAoifAKC
  gCleYsLEnOLM9MhUqcYjTkmvJy7iJnjyNyli5iFWPLy81KlxHn3gZQKgJRmlObBDYKl9EuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnTQKbwZOaVwO17BXQKE9ApnSnvQE4pSURISTUwCZr
  Ud66o/nb3GRfrjwrRCZxmBsd6uCbscGbge3u3Xlz9b0y5zZy0ANMMycUxPbrW+W82+R2083uV
  MYG5psTD6Mxj3ZVOk0T+nkqcoCO9gdOg98+c2EvTu1pX+vEEmJZ9On7RZr/hUW+zuZ9WOnS6t
  9134z8hnnMg+eDN4hvG8UcUr10JeCHJqLdggckR31O1ducUjWZ3zsxUeP5eRdL4Rt68QKb5Tx
  73BoQxrf1WqS82Ne9h1kozqb4bNVKCt1kiPdZ+d3g2N+qCrGGZWLT6Bi2hytni6pcXVXIlRWR
  y7/r8errTdd27WYes5l08qLsi7Q03V8jM1kff1R7KKSmq2JVrV/7xvy7jfj/lip0SS3FGoqEW
  c1FxIgCEbgGlZAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-7.tower-282.messagelabs.com!1576145336!266108!1
X-Originating-IP: [104.47.9.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1422 invoked from network); 12 Dec 2019 10:08:57 -0000
Received: from mail-ve1eur03lp2051.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.51)
  by server-7.tower-282.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2019 10:08:57 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTLxlalvXhZP7PgZqBKZuJB4W7hgxHXMUQKDvngi6A/4PQtJ6vRxY43MkeFEF3d+uGFXvX661gH/GjQpza2Q6BilG8s4f7CuPqLI3FAaT4QrWapVr9B0ck9Fqr4GhkvI0plB1jY3GCoGYY5GCWtWfSci9jtluMi/cJRPkEXN5BNHrkA0lR6Bgy4TRM3awpa/VYSQ12WrjhWjryqWsZRiKpAZgN5+1kqkFV5A6m/A4WwLilt3U8bMLI/VzuO5Jw5hYMcHYtqW8nfmfgkEztZFX7Y0pMBQ+8amwHAfg34tP0uLzqjX58ZRgVs0m5OVYuhFQSkZQRbqmottUTZ3yJr8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkmLAgDMhy2TDeARiEqAYq3RTGjFSvLjeaAIlqikXC8=;
 b=PXtduEqMtZ1jfWkb/B9t5JFYNmtW2U8iY8+jkSEf+pbEITCJfK0Ji9UacILW51/mDjsm6pbRDP2snIHBmlWopBtvEhP4NphzTldT5bAuZVtHvXu1wzgTCWdaqe8Z6zlGP699eofiAjIVa5HdTv5ufk8tgIN7mlj0kkf7Gu0QmuK454DRrpfjLyoN4Wp+mE2iK/binlQwxuhRRYl276VwUXB11BxDnDTk4v4RoP2lOMBS/fQlFSMYPvkiVWjx47uDc66L5GPLz3rAdZX3tuqklfb0+ehSA/DbOaw4SBtS6Owu4W9AvQ9mqGpVqlDjX4V0gdIoSkBnONtS/UsV4tKMeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkmLAgDMhy2TDeARiEqAYq3RTGjFSvLjeaAIlqikXC8=;
 b=tOOe+ZypFzJ6+CZ4RgEFwchVoN6YFhcWxb6gpnWTgqb1/Aj1AgNdRzW9lPZ9TfXaOXJCD4ED8W8v76y9r6XxJGEcPqOQw3eqDFnd7Y68LusM35GvgJSffrGze1DAzJd8ugNwVMy9fEM2jajPN5LpGcT4o6R/MwOVXpm8iHpDflY=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB0995.EURPRD10.PROD.OUTLOOK.COM (10.169.155.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 10:08:54 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2516.019; Thu, 12 Dec 2019
 10:08:54 +0000
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
Thread-Index: AQHVpSXRUU8r21ku9EatdfUM8rH4w6emv+kggAxdQYCAA0DDUA==
Date:   Thu, 12 Dec 2019 10:08:54 +0000
Message-ID: <AM5PR1001MB0994D38015B1799F3F3A7CF380550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191127132304.22924-1-m.felsch@pengutronix.de>
 <20191127132304.22924-4-m.felsch@pengutronix.de>
 <AM5PR1001MB099439FC20DAEBFC6584081280430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191210082759.2hf6ekuqgs2uzzm2@pengutronix.de>
In-Reply-To: <20191210082759.2hf6ekuqgs2uzzm2@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f544d9c-2471-4a8a-b478-08d77eeb4b7c
x-ms-traffictypediagnostic: AM5PR1001MB0995:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB0995C52B82B18A721E46675EA7550@AM5PR1001MB0995.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39850400004)(136003)(366004)(396003)(189003)(199004)(2906002)(54906003)(316002)(186003)(4326008)(8676002)(966005)(86362001)(110136005)(7696005)(26005)(71200400001)(81166006)(81156014)(66446008)(55236004)(64756008)(66476007)(66556008)(76116006)(66946007)(52536014)(5660300002)(8936002)(33656002)(478600001)(9686003)(6506007)(55016002)(53546011)(142933001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB0995;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nSEFGGtQJYOeWCbzRsUo4IztDj0MsNKAkUNOmkPSnQRwuLWPqYqcWZSxdErV3g/bPfwxoFCGVLY497h0RoMcwSVtQolqfUXwU2hgTHbnZpP17Xu1vUO4mpfeKzcH9PAzi8L061rD4FbxnsA8/s+sTOTkADU0PJZ8/z+U/7NKU1unmuG4dnbhcBUmdpK5OCOcYmplhwjxuzDxDDgJTKkzAk8NEgNSe7/C2/PMsQsLRPq1mf5hsMbc4sHdCNjz9RWtNyNpKA4rKtMzbVoWL8jerEI0rao376WwST/stvMjHNms7gr6CQoLv0qZIcEkpP8k+88Oxi17y8Q3j7PJbQsLfZj0p7OINtvsAnyyUq1O3GssBckgjOAx0NtODDrO1P3/rdUb3/CwAbXOaGZ6ptZRAMgJeqNY8J1poFvcQuoRiwKBQFgQKqwet9qEzk2jPe+ugfbRC3ZogzConOD4px0lLxpq3MQOhZ22gHBB5GDbD2n+5cEo7l8TTlfUd3chtaz/
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f544d9c-2471-4a8a-b478-08d77eeb4b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 10:08:54.3823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waRKBNCIHcLEkxdGRkZmcfEK0eeM+JbLerqTWQexy7cgELBH7PvdxnQh8YXFhS37M4vy8GdLgPP9DA0iWr2yhbDzH5y0WnNFZTUuXEK5Vro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0995
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMTAgRGVjZW1iZXIgMjAxOSAwODoyOCwgTWFyY28gRmVsc2NoIHdyb3RlOg0KDQo+IEhpIEFk
YW0sDQo+DQo+IE9uIDE5LTEyLTAyIDEyOjE1LCBBZGFtIFRob21zb24gd3JvdGU6DQo+ID4gT24g
MjcgTm92ZW1iZXIgMjAxOSAxMzoyMywgTWFyY28gRmVsc2NoIHdyb3RlOg0KPiA+DQo+ID4gPiBU
aGVyZSB3YXMgYSBidWcgd2l0aGluIHRoZSBkcml2ZXIgc2luY2UgY29tbWl0IGY4ODliZWFhYWIx
YyAoIklucHV0Og0KPiA+ID4gZGE5MDYzIC0gcmVwb3J0IEtFWV9QT1dFUiBpbnN0ZWFkIG9mIEtF
WV9TTEVFUCBkdXJpbmcgcG93ZXINCj4gPiA+IGtleS1wcmVzcyIpLiBTaW5jZSB3ZSBmaXhlZCB0
aGUgYnVnIHRoZSBLRVlfUE9XRVIgd2lsbCBiZSByZXBvcnRlZA0KPiA+ID4gYWx3YXlzIHNvIHdl
IG5lZWQgdG8gYWRhcHQgdGhlIGR0LWJpbmRpbmdzIHRvby4gTWFrZSB0aGUgZGVzY3JpcHRpb24N
Cj4gPiA+IG1vcmUgcHJlY2lzZSB3aGlsZSBvbiBpdC4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBNYXJjbyBGZWxzY2ggPG0uZmVsc2NoQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4gLS0tDQo+
ID4gPiB2MjoNCj4gPiA+IC0gY2hhbmdlIGRlc2NyaXB0aW9uIGFjY29yZGluZyBEbWl0cnkncyBz
dWdnZXN0aW9uLg0KPiA+ID4NCj4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW5wdXQvZGE5MDYyLW9ua2V5LnR4dCB8IDUgKystLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvZGE5MDYyLW9ua2V5
LnR4dA0KPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvZGE5
MDYyLW9ua2V5LnR4dA0KPiA+ID4gaW5kZXggMDAwNWIyYmRjZGQ3Li45Zjg5NTQ1NDE3OWQgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQv
ZGE5MDYyLW9ua2V5LnR4dA0KPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L2RhOTA2Mi1vbmtleS50eHQNCj4gPiA+IEBAIC0xNSw5ICsxNSw4IEBAIFJl
cXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gPg0KPiA+ID4gIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+
ID4gPg0KPiA+ID4gLS0gZGxnLGRpc2FibGUta2V5LXBvd2VyIDogRGlzYWJsZSBwb3dlci1kb3du
IHVzaW5nIGEgbG9uZyBrZXktcHJlc3MuIElmIHRoaXMNCj4gPiA+IC0gICAgZW50cnkgZXhpc3Rz
IHRoZSBPbktleSBkcml2ZXIgd2lsbCByZW1vdmUgc3VwcG9ydCBmb3IgdGhlIEtFWV9QT1dFUiBr
ZXkNCj4gPiA+IC0gICAgcHJlc3Mgd2hlbiB0cmlnZ2VyZWQgdXNpbmcgYSBsb25nIHByZXNzIG9m
IHRoZSBPbktleS4NCj4gPiA+ICstIGRsZyxkaXNhYmxlLWtleS1wb3dlciA6IElmIHRoaXMgcHJv
cGVydHkgaXMgcHJlc2VudCwgdGhlIGhvc3Qgd2lsbCBub3QgYmUNCj4gPiA+ICsgICAgaXNzdWlu
ZyBzaHV0ZG93biBjb21tYW5kIG92ZXIgSTJDIGluIHJlc3BvbnNlIHRvIGEgbG9uZyBrZXktcHJl
c3MuDQo+ID4NCj4gPiBUaGlzIGFsc28gY2hhbmdlcyBiZWhhdmlvdXIgb2YgYnV0dG9uIHByZXNz
IHJlcG9ydGluZyBhcyB0aGUgZHJpdmVyIHdpbGwgbm90DQo+ID4gcmVwb3J0IGEgbG9uZ2VyIHBy
ZXNzIChpLmUuIGEgYnV0dG9uIGhvbGQgd2hlcmUgdGhlIGRyaXZlciBwb2xscyBmb3IgcmVsZWFz
ZSkuDQo+ID4gSXQgd2lsbCBvbmx5IHJlcG9ydCBhIHNob3J0IGtleSBwcmVzcyB0byB1c2VyLXNw
YWNlIHdpdGggdGhpcyBwcm9wZXJ0eSBwcm92aWRlZC4NCj4gPg0KPiA+IFRoZSBxdWVzdGlvbiBo
ZXJlIGlzIGRvIHdlIHN0aWxsIHdhbnQgdG8gc3VwcG9ydCBsb25nIHByZXNzIHJlcG9ydGluZyBi
dXQNCj4gPiB3aXRob3V0IHRoZSBJMkMgc2VxdWVuY2UgZm9yIHNodXRkb3duPyBJZiBzbyB0aGUg
ZHJpdmVyIG5lZWRzIHRvIGJlIHVwZGF0ZWQNCj4gdG8NCj4gPiB3b3JrIHRoaXMgd2F5IGFzIHJp
Z2h0IG5vdyBpdCBkb2Vzbid0Lg0KPg0KPiBHb29kIHBvaW50LiBJIGNoZWNrZWQgdGhlIGRyaXZl
ciBhbmQgdGhlIGRvY3VtZW50YXRpb24gZm9yIHRoZQ0KPiBkYTkwNjIvMyBhZ2FpbiBhbmQgaXQg
c2VlbXMgdGhhdCB3ZSBpbnRlcnJ1cHQgdGhlIHBtaWMgaHcgYnkgZG9pbmcgdGhlDQo+IHNodXRk
b3duIGJ5IGl0c2VsZi4gQXMgdGhlIGRvY3VtZW50YXRpb24gc2F5czoNCj4NCj4gREE5MDYzOg0K
PiBJZiB0aGUgaGFyZHdhcmUgcmVzZXQgd2FzIGluaXRpYXRlZCBieSBhIChkZWJvdW5jZWQpIHBy
ZXNzIG9mIG5PTktFWSAob3INCj4gR1BJTzE0IGFuZCBHUElPMTUgdG9nZXRoZXIpIGxvbmdlciB0
aGFuIFNEX0RFTEFZLCB0aGUgREE5MDYzIGluaXRpYWxseQ0KPiBvbmx5IGFzc2VydHMgY29udHJv
bCBiaXQgS0VZX1JFU0VUIGluIHRoZSBmYXVsdCByZWdpc3RlciBhbmQgc2lnbmFscyBhDQo+IG5v
bi1tYXNrYWJsZSBpbnRlcnJ1cHQgYWxsb3dpbmcgdGhlIGhvc3QgdG8gY2xlYXIgdGhlIGFybWVk
IHJlc2V0DQo+IHNlcXVlbmNlIHdpdGhpbiAxIHMuIElmIHRoZSBob3N0IGRvZXMgbm90IGNsZWFy
IEtFWV9SRVNFVCB0aGVuIGENCj4gc2h1dGRvd24gdG8gUkVTRVQgbW9kZSBpcyBleGVjdXRlZC4g
S0VZX1NEX01PREUgZGV0ZXJtaW5lcyBpZiBub3JtYWwNCj4gcG93ZXIgc2VxdWVuY2UgdGltaW5n
IG9yIGEgZmFzdCBzaHV0ZG93biBpcyBpbXBsZW1lbnRlZC4NCj4NCj4gREE5MDYyOg0KPiBJZiB0
aGUgcmVzZXQgd2FzIGluaXRpYXRlZCBieSBhIHVzZXLigJlzIGxvbmcgcHJlc3Mgb2Ygbk9OS0VZ
LCBpbml0aWFsbHkNCj4gb25seSBLRVlfUkVTRVQgaXMgc2V0IGFuZCB0aGUgbklSUSBwb3J0IHdp
bGwgYmUgYXNzZXJ0ZWQuIEtFWV9SRVNFVA0KPiBzaWduYWxzIHRoZSBob3N0IHRoYXQgYSBzaHV0
ZG93biBzZXF1ZW5jZSBpcyBzdGFydGVkLiBJZiB0aGUgaG9zdCBkb2VzDQo+IG5vdCB0aGVuIGNs
ZWFyIEtFWV9SRVNFVCB3aXRoaW4gMSBzIGJ5IHdyaXRpbmcgYSAxIHRvIHRoZSByZWxhdGVkIGJp
dCBpbg0KPiByZWdpc3RlciBGQVVMVF9MT0csIHRoZSBzaHV0ZG93biBzZXF1ZW5jZSB3aWxsIGNv
bXBsZXRlLiBXaGVuIHRoZSByZXNldA0KPiBjb25kaXRpb24gaGFzIGRpc2FwcGVhcmVkLCBEQTkw
NjIgcmVxdWlyZXMgYSBzdXBwbHkgKFZTWVMgPg0KPiBWRERfRkFVTFRfVVBQRVIpIHRoYXQgcHJv
dmlkZXMgZW5vdWdoIHBvd2VyIHRvIHN0YXJ0LXVwIGZyb20gdGhlDQo+IFBPV0VSRE9XTiBtb2Rl
Lg0KPg0KPiBTbyB3ZSBkb24ndCBuZWVkIHRvIGNoZWNrIGZvciB0aGUgS0VZX1JFU0VUPyBUaGlz
IHdvdWxkIGNsZWFudXAgdGhlIGNvZGUNCj4gYSBiaXQuDQoNCldlIGNvdWxkIHJlbW92ZSB0aGF0
IGJ1dCBJIHRoaW5rIHRoZSBpbnRlbnRpb24gb3JpZ2luYWxseSB3YXMgdG8gaGF2ZSB0aGlzIGNv
ZGUNCnRoZXJlIGluIGNhc2UgdGhlcmUgd2FzIHNvbWUgd2F5IHRvIG1vcmUgZ3JhY2VmdWxseSBz
aHV0ZG93biB0aGUgc3lzdGVtIGluIHRoaXMNCnNjZW5hcmlvLiBSaWdodCBub3cgdGhhdCdzIG5v
dCB0aGUgY2FzZSBhcyB0aGUgY29kZSBzaW1wbHkgY2FsbHMgdG8gc2h1dGRvd24NCnRoZSBwbWlj
IHZpYSBhIG1hbnVhbCByZWdpc3RlciBjYWxsLCBidXQgbWF5YmUgaW4gdGhlIGZ1dHVyZSB0aGlz
IGNvdWxkIGJlIG1hZGUNCm1vcmUgZ3JhY2Z1bC4gQW5vdGhlciBzbGlnaHQgYWR2YW50YWdlIG9m
IGxlYXZpbmcgdGhhdCBjb2RlIGluIGlzIHRoYXQgd2UncmUNCm5vdCB3YWl0aW5nIGZvciBhbm90
aGVyIHNlY29uZCBkZWxheSBmb3IgdGhlIFBNSUMgdG8gcHVsbCB0aGUgcGx1Zy4NCg0KV2l0aCBy
ZWdhcmRzIHRvIHRoaXMgcGF0Y2ggYW5kIHRoZSBzdWJzZXF1ZW50IG9uZSB0byB1cGRhdGUgdGhl
IE9uS2V5IGRyaXZlciwgSQ0KdGhpbmsgd2Ugc2hvdWxkIGRlcHJlY2F0ZSB0aGlzIHByb3BlcnR5
LiBUaGUgT25LZXkgbW9kZSBiaW5kaW5nIHlvdSBhZGRlZCBpbg0KYSBkaWZmZXJlbnQgcGF0Y2gg
d2lsbCBjb25maWd1cmUgdGhlIE9uS2V5IGFjY29yZGluZyB0byBob3cgeW91IHdhbnQgaXQgdG8N
CmJlaGF2ZSBpbiBoYXJkd2FyZSBzbyBJIGRvbid0IHRoaW5rIHRoaXMgcHJvcGVydHkgbWFrZXMg
bXVjaCBzZW5zZSBhbnltb3JlLiBXZQ0KY2FuIHRoZW4gcmVtb3ZlIHRoZSBuZWVkIGZvciAna2V5
X3Bvd2VyJyB1c2FnZSBpbiB0aGUgZHJpdmVyLg0KDQo+DQo+IFJlZ2FyZHMsDQo+ICAgTWFyY28N
Cj4NCj4gPiA+DQo+ID4gPiAgLSBkbGcsa2V5LW9wbW9kZSA6IFNldCB0aGUgbk9OS0VZIGJlaGF2
aW91ci4gVGhpcyB2YWx1ZSBpcyBpbml0aWFsIHNldCBieSB0aGUNCj4gPiA+ICAgICAgb3RwIHZh
bHVlcy4gU2VlIG5PTktFWV9QSU4gcmVnaXN0ZXIgZGVzY3JpcHRpb24gZm9yIG1vcmUgaW5mb3Jt
YXRpb24uDQo+ID4gPiAtLQ0KPiA+ID4gMi4yMC4xDQo+ID4NCj4gPg0KPg0KPiAtLQ0KPiBQZW5n
dXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfA0KPiBTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAg
ICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfA0KPiAzMTEzNyBIaWxkZXNoZWltLCBH
ZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfA0K
PiBBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5
LTUxMjEtMjA2OTE3LTU1NTUgfA0K
