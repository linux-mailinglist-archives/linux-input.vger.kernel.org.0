Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4D633E43
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 07:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfFDFUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 01:20:02 -0400
Received: from mail-eopbgr710070.outbound.protection.outlook.com ([40.107.71.70]:5472
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726410AbfFDFUC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jun 2019 01:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector1-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaFggC1qeq29/gDWrBuhdqleJ/H57oZmTO8dc//QVTE=;
 b=cr4uhYPLKKNV/0fPXHVMDnhOcLx0znsMo62AaDdW0RTMuthgG+DhJMVRitWjIOE86wU5Go1bUvtUz7yFLZzgPY7pHU+J1Xj5eT5j93BjVBwnWgO9esv/JDKLykYzH7OLpTlSkENUdhV3l0dinOkX6Erh8bzucjeA9V+IOwXz1gA=
Received: from DM6PR03MB4713.namprd03.prod.outlook.com (20.179.104.87) by
 DM6PR03MB3753.namprd03.prod.outlook.com (20.176.114.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 05:19:59 +0000
Received: from DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::2dcf:b826:c4ec:20f2]) by DM6PR03MB4713.namprd03.prod.outlook.com
 ([fe80::2dcf:b826:c4ec:20f2%4]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 05:19:59 +0000
From:   Christopher Heiny <Cheiny@synaptics.com>
To:     Aaron Ma <aaron.ma@canonical.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
Thread-Topic: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
Thread-Index: AQHUyTs5Qp0btHE2q0GPqsqH5pp/nqYB8HQAgAEjw4CAHbD4gIAIh1MAgAFryICAYLRCgIAAK7YA
Date:   Tue, 4 Jun 2019 05:19:59 +0000
Message-ID: <580b73847333fa1866caaccc959bf8735b4f7524.camel@synaptics.com>
References: <20190220164200.31044-1-aaron.ma@canonical.com>
         <17cd420ea32a9787c56ba25e36e7661541c2f65f.camel@synaptics.com>
         <a0f21198-5715-8858-8368-51e43092181e@canonical.com>
         <acd07f4d-1602-46c5-c486-c917f1868b59@canonical.com>
         <f4f7265d9ad06726bb2ef12ab6b7529d2fb06165.camel@synaptics.com>
         <9321df87-5bc5-0c75-2815-f8602ecf9d86@canonical.com>
         <2995b27a-9ec8-eebe-78b6-2d3bf5098af8@canonical.com>
In-Reply-To: <2995b27a-9ec8-eebe-78b6-2d3bf5098af8@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [166.137.178.9]
x-clientproxiedby: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To DM6PR03MB4713.namprd03.prod.outlook.com
 (2603:10b6:5:181::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Cheiny@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bdfe471-b135-48da-c809-08d6e8ac49a9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM6PR03MB3753;
x-ms-traffictypediagnostic: DM6PR03MB3753:
x-microsoft-antispam-prvs: <DM6PR03MB3753C04B4C4D4BCCB3AA76D7DD150@DM6PR03MB3753.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(189003)(66946007)(73956011)(66476007)(305945005)(486006)(81156014)(81166006)(476003)(7736002)(6436002)(386003)(6506007)(53546011)(8676002)(86362001)(53936002)(118296001)(66446008)(11346002)(71200400001)(2616005)(446003)(229853002)(2201001)(71190400001)(66066001)(6486002)(36756003)(66556008)(3846002)(256004)(6116002)(76176011)(99286004)(6246003)(14454004)(25786009)(52116002)(72206003)(110136005)(316002)(102836004)(64756008)(2501003)(5660300002)(6512007)(8936002)(186003)(26005)(50226002)(478600001)(68736007)(80792005)(2906002)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR03MB3753;H:DM6PR03MB4713.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8DN3nofztWYMvkD0JsDNGpjYOUvwq+/N24Ie+rwS0TfZtdhCcVBXRiBQ9Cq8lDurvQutF9HbB0hGS4ByuQULgkfyqHXOHPryNlsEX3xlG2dMMc9WqzEr2gtrcN/mqKCOQTGj8U7mxnjN+O9Ur1EkvYUdWC2d02A//biZcEeWBvKt4+EicpaiQ08UpeZo7xyaNxhWeQbeVZzun3qJWkdtEDOrkJox7pPnmOvx6IQM4f7KN+Dz8TO/fSGdH5F646cEgAcfI6vCBXmltw6si6yEYddxh5IlyZwP8ZcjTIzf8umlY5R8c8Pcmn9FwFZn6oHxDzaFixxvSRCFJMSw/gbyrfP/YfUZussE3i83+Y65TBPhHMZvCRro4w+H3/cwjWB6YmCUbAIfniWmvj0n8ZDXd06E3UzfyDE+fQf2Ns4TML0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <638EC2AFA5D20F40A4D2594806E4675A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdfe471-b135-48da-c809-08d6e8ac49a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 05:19:59.2233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cheiny@synaptics.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3753
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDEwOjQ1ICswODAwLCBBYXJvbiBNYSB3cm90ZToNCj4gSGkg
Q2hyaXN0b3BoZXI6DQo+IA0KPiBIYXZlIGdvdCB0aW1lIHRvIHJldmlldyB0aGVzZSAyIHBhdGNo
ZXM/DQo+IFVzZXJzIHJlcG9ydGVkIGl0IHdvcmtzIGZpbmUgc2luY2UgSSBzZW50IG91dCB0aGlz
IHBhdGNoLg0KDQpIaSBBYXJvbiwNCg0KSSd2ZSBiZWVuIHBva2luZyBhcm91bmQgd2l0aCB0aGlz
IG9mZiBhbmQgb24uICBVbmZvcnR1bmF0ZWx5LCBtb3JlIG9mZg0KdGhhbiBvbiA6LSggYnV0IGhl
cmUncyBteSBjdXJyZW50IHRha2U6DQoNCnJtaV9kcml2ZXJfc2V0X2lycV9iaXRzKCkgaXNuJ3Qg
Z29pbmcgdG8gYmUgY2FsbGVkIGFsbCB0aGF0IG9mdGVuLCBhbmQNCml0J3Mgbm90IGdvaW5nIHRv
IGJlIGNhbGxlZCBhdCBhbGwgZHVyaW5nIG5vcm1hbCBvcGVyYXRpb24sIHdoaWNoIGlzDQp3aGVy
ZSB0aGUgbW9zdCBzZXJpb3VzIHByb2JsZW0gd291bGQgb2NjdXIuDQoNCkkgaGF2ZW4ndCBlbnRp
cmVseSBjb252aW5jZWQgbXlzZWxmIHRoYXQgdGhlcmUgY291bGRuJ3QgYmUgYSBwcm9ibGVtDQpk
dXJpbmcgcmVwZWF0ZWQgc3BvbnRhbmVvdXMgZGV2aWNlIHJlc2V0cyAoZm9yIGV4YW1wbGUsIGR1
ZSB0byBFU0QsIGENCmRvZGd5IGNoYXJnZXIsIG9yIGZpcm13YXJlIGJ1ZywgYW1vbmcgb3RoZXIg
dGhpbmdzKS4gIE9uIHRoZSBvdGhlcg0KaGFuZCwgYWxsIHRoZSBzY2VuYXJpb3MgSSBoYXZlIGNv
bWUgdXAgd2l0aCBhcmUgYm90aCB1bmxpa2VseSBhbmQgc28NCmNvbnRyaXZlZCB0aGF0IHRoZSBz
eXN0ZW0gaXMgcHJvYmFibHkgaG9zZWQgcmVnYXJkbGVzcyBvZiB3aGF0IHdlIGRvIGluDQp0aGUg
ZHJpdmVyLg0KDQpHaXZlbiB0aGF0LCBJJ20gd2lsbGluZyB0byBhY2NlcHQgdGhlIHBhdGNoIGFz
IGlzLg0KDQoJCQkJCUNoZWVycywNCgkJCQkJCUNocmlzDQoNCg0KDQoNCg0KDQoNCj4gDQo+IFRo
YW5rcywNCj4gQWFyb24NCj4gDQo+IE9uIDQvMy8xOSA5OjU4IFBNLCBBYXJvbiBNYSB3cm90ZToN
Cj4gPiBTdXJlLCB0YWtlIHlvdXIgdGltZSwgaWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBsZXQg
bWUga25vdyBwbGVhc2UuDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IEFhcm9uDQoNCg0K
