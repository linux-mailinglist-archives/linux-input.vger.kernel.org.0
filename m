Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7C52A039D
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 12:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgJ3LDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 07:03:05 -0400
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:57003
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726095AbgJ3LDE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 07:03:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWeuHRZYgwZUMCz8TiWcaruPqqwmoBywVGls60QSggeGoogzv0FxUOyZXiwFG8rWqrZTiBdg+K/YAFlZNcYF6MVf2AV4ge4zPqBkgBU204pMvVI0GPXfiSqsc38LOlxgij0nBDfy/zx4lP7TIyYVeiFe/HP1BAyzqZCdFBfGz5qvMXcwIanghvfvjZfZhhhAD1pGKl74SoM7/MLYp9RE7Qns/SYoZr1jazRp9OrVHSkVGGgLcty+ShHi5o6p0FT5yNZQAsz4GdM31r3O4lk9ItjZaLnU/pzCTm9Z9JvTGxfRwToEmGp0pFvyD472VkWh2rfbcunDHU6QiaRuAFsTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHguuO2rgbzES3+do6+Jfg9aWKji6g9t5bAIYtsIH80=;
 b=IfzTmRKn8UaxCNGZFDbNxn1yUunrqWpHXXdfJginaJjBnm7Rc6pFBP32SOT1cJQjvo3NXz3+AMdiFKd1Aw2PWxiYd3Z9110pqv+KSHEgmNXxGNegMEuWMbcfQHwCKium/mnku64fKRmFWw5ukmJKNcjEeeEY7aW8wRZrCODwrDrHBh2uz4XKPuiDLDiCmD3+ug1yvuie2Cx0F5TxiLa4QkWxed6pmG7h6ohS6ejt6dzdCHJgtM1t0We1jF+lq6dRo2Wh9WdDVqK2GaQjoXjZP/bXviIJoHRtpQm5vhqXP5aJD41tcXBZL0T/fd3C2JWw287mqp2ZQ2NX8RNBf+aOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHguuO2rgbzES3+do6+Jfg9aWKji6g9t5bAIYtsIH80=;
 b=oGMp39ux2oELE4eq2Z5ObL/YoDaVOEYesPmOxxUxlWYG0tohHE+P+UPK7TFTzMUoghrloDHsaUFn7pFVCOEA0i69aI4yae7AUv3gmS+78+TsSEPWbMtk7yULVld2+gX/rdHNFg0Zi1n4LzllcZZM70Gcy6Q8sn6x9rB6jx38L2Q=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB7PR10MB2073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:5:3::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.28; Fri, 30 Oct 2020 11:02:58 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4%3]) with mapi id 15.20.3499.029; Fri, 30 Oct 2020
 11:02:58 +0000
From:   "Valek, Andrej" <andrej.valek@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "nick@shmanahar.org" <nick@shmanahar.org>,
        "hadess@hadess.net" <hadess@hadess.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Thread-Topic: [PATCH 1/3] Input: goodix - add option to disable firmware
 loading
Thread-Index: AQHWrqLqMLnptYxPakOG3laEf6V3eKmv95bg
Date:   Fri, 30 Oct 2020 11:02:58 +0000
Message-ID: <DB8PR10MB3977770B9D7BF21130A4D95592150@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201029170313.25529-2-andrej.valek@siemens.com>
 <20201029203608.GE2547185@dtor-ws>
 <a5964429-a472-6b78-e53c-69b4cb115b94@redhat.com>
In-Reply-To: <a5964429-a472-6b78-e53c-69b4cb115b94@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-10-30T11:02:56Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=e7605d4a-674a-49d0-887b-2689631340c3;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a4e06a7d-6a17-4a72-6eb4-08d87cc35c78
x-ms-traffictypediagnostic: DB7PR10MB2073:
x-microsoft-antispam-prvs: <DB7PR10MB2073B23197D0B3505E8DA79A92150@DB7PR10MB2073.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JFyB879gTfXBydtX9pldDaPZ04tR5aYcIl/cRF4ane5TkK5jZPyafZIuFlj8HSriAlRrRmYK83HwaaEt1ooJzaRsMouYGMNHk1Kzfb4pqTg6VP/dvKsXvX2Ut6/eHe2knvXRXbIEU53BNEagiGQDj/CFfYFq55K67m6jOHnGPaFd8hMz3vnNeVS+7fVz1e7CGEqM/G7tSh1RHd5+eO6VRvgReGdbbD9nyTG84z7s+Tp5haPwzx/fKauB/3hk756VN88x996PljLY6BCBTX2RByJPNkeFYVDXZeIR1Z9GCzsN1jk8zXtiagnUgrMmMpq6GyM0FNWgqEcigFPoQUtUyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(55236004)(76116006)(83380400001)(6506007)(186003)(5660300002)(8936002)(52536014)(4326008)(54906003)(33656002)(8676002)(66446008)(316002)(71200400001)(478600001)(55016002)(53546011)(2906002)(64756008)(110136005)(7696005)(66556008)(26005)(86362001)(66476007)(66946007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OLITOm7YiD1OwrJsZ5QPtggGaQHtY20rblhf1W+LN8sLf0Am5zLXBITEhIPHztSFIYHLB/pNS9D2cT59fyPOcd6/8Qx95D66H003MnKzLYSOA8pofrP91+JMcP8CfjFfau/qMrSTalYqeP4lErJffMro3n7Je7zyfKD7ikMZkxeHM74QuXcxf8D2YCW3bcqoFZnxgVHUksFBZeRYxqM+X9iHT/dCiptdjroJaMux3426Tt0BHtPbeTJ7V2RmHUxWy1kyIHNGtZWnN8zj7HXihQv/aaRva/AycieukcGMPrQvx8Trws9u+K6SGtYDP7kFY/1/37LaTgLJLDvAGSmQDdmycyJW3SweXx2Wo85lzBD6woIYfAYXVo+yXglcdElHvwNNroV3TH9ZdgYRiLBuvOSanPeHptVPO2EZCmbNv/IwVFanYUjbEAJCrBcrDlgTqobqUAnh9UamsdJR/ym8GsMPfrQvd5IkZQhjeOqGwMt0WbeTKVcFs1oI7+8hZs8vHzIFKSyBM/DLWOYfzf/q8h/p2A6N/mrq5c13saWoMTf67YiavHp2dsSn54RNlqngWYkxtM9JMAPeWAITBIDTI0Lbc6AP3N93Vs5rFHQ1mbUp3q8GqrZ3uS3yTgJ5iFYDTpAxNS7ccQwzUBnqzLElGQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e06a7d-6a17-4a72-6eb4-08d87cc35c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 11:02:58.3076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfV2PO7wmp1891K5iGaIYIsusPcu+k1YPLAH2gd/j9SwYMR2iKoy4YHIVgfedn81W5qA+Cyhq3Y6JVRRmOYPRW1HXEmLRWgohol+tx1tnDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2073
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgSGFucywNCg0KSSBhbSBub3Qgc2F5aW5nLCB0aGF0IGp1c3QgY29uZmlndXJhdGlvbiBsb2Fk
aW5nIHRvb2sgc3VjaCBhIGxvbmcgdGltZS4gVGh1IGZ1bGwgcHJvY2VzcyBpbmNsdWRpbmcgY29u
ZmlndXJhdGlvbiBhbmQgRlcgbG9hZGluZyB0YWtlcyBpdC4gDQoNCk1lYW5zIHRoYXQgSSB3b3Vs
ZCBsaWtlIHRvIHByZXZlbnQgdGhpcyBzaXR1YXRpb24sIGJ1dCBrZWVwIHRoZSBvbGQgc2NlbmFy
aW8gYXMgYSBkZWZhdWx0IGJlaGF2aW9yLg0KDQpSZWdhcmRzLA0KQW5kcmVqDQoNCj4gSGksDQo+
DQo+IE9uIDEwLzI5LzIwIDk6MzYgUE0sIERtaXRyeSBUb3Jva2hvdiB3cm90ZToNCj4+IEhpIEFu
ZHJlaiwNCj4+IA0KPiBPbiBUaHUsIE9jdCAyOSwgMjAyMCBhdCAwNjowMzoxMVBNICswMTAwLCBB
bmRyZWogVmFsZWsgd3JvdGU6DQo+Pj4gRmlybXdhcmUgZmlsZSBsb2FkaW5kIGZvciBHVDkxMSBj
b250cm9sbGVyIHRha2VzIHRvbyBtdWNoIHRpbWUgKH42MHMpLg0KPj4+IFRoZXJlIGlzIG5vIGNo
ZWNrIHRoYXQgY29uZmlndXJhdGlvbiBpcyB0aGUgc2FtZSB3aGljaCBpcyBhbHJlYWR5IHByZXNl
bnQuDQo+Pj4gVGhpcyBoYXBwZW5zIGFsd2F5cyBkdXJpbmcgYm9vdCwgd2hpY2ggbWFrZXMgdG91
Y2hzY3JlZW4gdW51c2FibGUuDQo+Pj4NCj4+PiBBZGQgdGhlcmUgYW4gb3B0aW9uIHRvIHByZXZl
bnQgZmlybXdhcmUgZmlsZSBsb2FkaW5nLCBidXQga2VlcCBpdCANCj4+PiBlbmFibGVkIGJ5IGRl
ZmF1bHQuDQo+PiANCj4+IEkgdGhvdWdodCB0aGF0IEdvb2RpeCB3YXMgbG9zaW5nIGZpcm13YXJl
IGxvYWRpbmcgYXQgcG93ZXJvZmYuIElzIHRoaXMgDQo+PiBub3QgdGhlIGNhc2Ugd2l0aCB0aGlz
IG1vZGVsPw0KPg0KPiBTbyBmaXJzdCBvZiBhbGwgdGhlcmUgYXJlIDIgc29ydHMgb2YgZmlybXdh
cmUgaW52b2x2ZWQgd2l0aCB0aGUgR29vZGl4IHRvdWNoc2NyZWVuIGNvbnRyb2xsZXJzLCB0aGUg
YWN0dWFsIGZpcm13YXJlIGFuZCBhID4gYmxvY2sgb2YgY29uZmlnIGRhdGEgZm9yIHRoYXQgZmly
bXdhcmUgd2hpY2ggSSBwcmVzdW1lIGFkanVzdHMgaXQgZm9yIHRoZSBzcGVjaWZpYyAobW9kZWwg
b2YpIHRoZSBkaWdpdGl6ZXIgd2hpY2ggaXMgYXR0YWNoZWQuDQo+DQo+IEFUTSB0aGUgbWFpbmxp
bmUgTGludXggZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgbW9kZWxzIHdoZXJlIHRoZSBhY3R1YWwg
ZmlybXdhcmUgaXRzZWxmIG5lZWRzIHRvIGJlIGxvYWRlZCAoYmVjYXVzZSB0aGV5IG9ubHkgaGF2
ZSBSQU0sIHNvIHRoZXkgY29tZSB1cCB3aXRob3V0IGZpcm13YXJlKS4NCj4NCj4gSSBkbyBoYXZl
IG9uZSBtb2RlbCB0YWJsZXQgd2l0aCBhIFJPTS1sZXNzIGdvb2RpeCB0b3VjaHBhZCBjb250cm9s
bGVyLCBzbyBpZiBJIGV2ZXIgZmluZCB0aGUgdGltZSBJIG1pZ2h0IGFkZCBzdXBwb3J0IGZvciBs
b2FkaW5nIHRoZSBhY3R1YWwgZmlybXdhcmUuDQo+DQo+IFNvIHdoYXQgd2UgYXJlIHRhbGtpbmcg
YWJvdXQgaGVyZSBpcyBqdXN0IGxvYWRpbmcgdGhlIGNvbmZpZyBkYXRhIGFuZCBJJ20gYSBiaXQg
c3VycHJpc2VkIHRoYXQgdGhpcyB0YWtlIHNvIGxvbmcuDQo+DQo+PiBBZGRpbmcgSGFucyBhcyBo
ZSB3YXMgd29ya2luZyB3aXRoIHRoaXMgZHJpdmVyL2NvZGUuDQo+DQo+IFdpdGggYWxsIHRoYXQg
c2FpZCBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIHRoaXMgY2hhbmdlLg0KPg0KPiBSZWdhcmRzLA0K
Pg0KPiBIYW5zDQo+DQo+DQo+DQo+PiANCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaiBW
YWxlayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPg0KPj4+IC0tLQ0KPj4+ICBkcml2ZXJzL2lu
cHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIHwgNCArKystDQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIA0KPj4+IGIvZHJpdmVycy9pbnB1dC90b3Vj
aHNjcmVlbi9nb29kaXguYw0KPj4+IGluZGV4IDAyYzc1ZWEzODVlMDguLjQ0MzM2ZWNkMmFjZGYg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9nb29kaXguYw0KPj4+
ICsrKyBiL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMNCj4+PiBAQCAtOTQxLDcg
Kzk0MSw5IEBAIHN0YXRpYyBpbnQgZ29vZGl4X2dldF9ncGlvX2NvbmZpZyhzdHJ1Y3QgZ29vZGl4
X3RzX2RhdGEgKnRzKQ0KPj4+ICAJZGVmYXVsdDoNCj4+PiAgCQlpZiAodHMtPmdwaW9kX2ludCAm
JiB0cy0+Z3Bpb2RfcnN0KSB7DQo+Pj4gIAkJCXRzLT5yZXNldF9jb250cm9sbGVyX2F0X3Byb2Jl
ID0gdHJ1ZTsNCj4+PiAtCQkJdHMtPmxvYWRfY2ZnX2Zyb21fZGlzayA9IHRydWU7DQo+Pj4gKwkJ
CS8qIFByZXZlbnQgY2ZnIGxvYWRpbmcgZm9yIGVhY2ggc3RhcnQgKi8NCj4+PiArCQkJdHMtPmxv
YWRfY2ZnX2Zyb21fZGlzayA9ICFkZXZpY2VfcHJvcGVydHlfcmVhZF9ib29sKGRldiwNCj4+PiAr
CQkJCQkJICJ0b3VjaHNjcmVlbi1kby1ub3QtbG9hZC1mdyIpOw0KPj4+ICAJCQl0cy0+aXJxX3Bp
bl9hY2Nlc3NfbWV0aG9kID0gSVJRX1BJTl9BQ0NFU1NfR1BJTzsNCj4+PiAgCQl9DQo+Pj4gIAl9
DQo+Pj4gLS0NCj4+PiAyLjIwLjENCj4+Pg0KPj4gDQo+PiBUaGFua3MuDQo+PiANCg0K
