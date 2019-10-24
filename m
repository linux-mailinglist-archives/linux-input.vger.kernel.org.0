Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3417DE2D2C
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 11:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389891AbfJXJY1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 05:24:27 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:22758 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389413AbfJXJY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 05:24:27 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9O9Mngm021691;
        Thu, 24 Oct 2019 05:24:14 -0400
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vt9t25vss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Oct 2019 05:24:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWJPAduIL+yQ0Qv+JWqT6QPkVIm05Bx4JdxAbNrv3VcY6OmOlLpTZHdKBI9SAhTlrLg7j6G4f3VgTRiXOOyMP0QumADnOd/drzYcmgCTR+r1uvcn+vcyzlDaE0iH6UrRE0msFhLpkXtra9G2lcIDtBjua8FQ+ZZ7RQhlO13ZyXFWbaLOz0PlQ57SRhF5Qu4v3rSxXoO6ZUHzIHLNwUNx52MYVo1RiJxpwhter2s3pyDOLnmAP+heBthzJdG9odRf/5miAuU4azlwg6CsTl5SkqlwKuy6RVQTmRtsOzr06qR8BEH23WibjZmyhgaGpMPcPRnTATypwunhiDKoHZwA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H79tMLkA9q8wQla9C65sDt7MDu2/MlTC/HIybxCS2a4=;
 b=dy058UBETGR5Ne9oZEI0oH313NQoWRbddImYiTinm9uGP5R5aH38m+7vM2A6a1v798JRhO84Tqk+S0LV12E6cP3VRiH6v2yCD5ulX5Tu5EHWNhEDbj7cjw4wnOotvEM351pYsgam6tAlUJT1+mHkulh0pI6+gX968JO1mwZzpNjkU4usmGSX5YpqMDR+eIKE6+0/o0T9KP0k5sQIqpY9t17wivpSUpBfxe+gxhbpj9KYe2FJRqrN1bJDqwjDn/HtMJWQ2fYbdcphveFYlKlX/cLmbId3WnZcDV2d83NmNDbF9wVqOgt3yNT74z8QGrgU0RAVupwzhGifFfGaYr44Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H79tMLkA9q8wQla9C65sDt7MDu2/MlTC/HIybxCS2a4=;
 b=T8csUtbZQ+id1B3z8Vx9eAihnvDWbe/sciNtI09PIC2ckn/vGZHbpQ5PHKCbBvXJGxyRTqH3EfElnKmbz8wn51KT39TZjXAtsMLa26BCW62FGELRRjqAxsj8mmb/w+pzF8eUDWoe2vl+QtNPhyrNjJZtWMRtUEP8VlK0OGTp25k=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5367.namprd03.prod.outlook.com (20.180.15.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Thu, 24 Oct 2019 09:24:12 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c%3]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 09:24:12 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lars@metafoo.de" <lars@metafoo.de>
Subject: Re: [PATCH][RESEND] input: adp5589: Make keypad support optional
Thread-Topic: [PATCH][RESEND] input: adp5589: Make keypad support optional
Thread-Index: AQHVdTB/9bT079D2QUiejuyXt5dvjadn9i6AgAEKiYCAAK6hAA==
Date:   Thu, 24 Oct 2019 09:24:11 +0000
Message-ID: <7d18d2b4f7bbb151072032013352104c426cce04.camel@analog.com>
References: <20190927123836.28047-1-alexandru.ardelean@analog.com>
         <20191023070541.13940-1-alexandru.ardelean@analog.com>
         <20191023225939.GA35946@dtor-ws>
In-Reply-To: <20191023225939.GA35946@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9987d719-b748-4709-369b-08d75863ee6a
x-ms-traffictypediagnostic: CH2PR03MB5367:
x-microsoft-antispam-prvs: <CH2PR03MB5367E0D8BF65E02243EEF39BF96A0@CH2PR03MB5367.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(396003)(366004)(39860400002)(199004)(189003)(14454004)(6486002)(6116002)(6246003)(3846002)(102836004)(76176011)(256004)(2351001)(71200400001)(71190400001)(6506007)(26005)(118296001)(7736002)(305945005)(486006)(186003)(446003)(11346002)(86362001)(2906002)(99286004)(2616005)(476003)(229853002)(91956017)(66946007)(5660300002)(66446008)(64756008)(66556008)(66476007)(36756003)(6436002)(6916009)(76116006)(5640700003)(66066001)(4326008)(1361003)(81166006)(81156014)(8676002)(478600001)(25786009)(8936002)(316002)(54906003)(6512007)(2501003)(4001150100001)(334744003);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5367;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yEf1Ojv83VFKhp3SWmixfOAyHvMWBvFpt5GXOYsP2av7TOhKPCT4TXNYGCcViWwEWFy4jCZRwZ//YBGP4e3j470cyyxfRpxWjjzjdFVxuO/Yot1ekirzrX5H4vnzePzFpTymDr1fD0e0jj9w9XGSeUeTW19ssR+1zpi7XpD5PTUg21Rm6J0/rf3QjTJb/EK8Qmyp4uxRbDpISTFgpUXrv3fv/yS/D19NtR8JdRJTdfKAXNkzKgZ/IMTBm2+ACeSlOpIn+Fd7kPa7OO+epMPkZ14qTKnGerjYQ9fsml7ChUcWARrdvr/GfRqq9Wz8IX3fsHn8zZ5HSndMC5YLVrBqI4uyhLI9nHU4cclXgpsUqM3NmY98vheOwjpp7xrLWnfw6YjrDib56cjsCgCHGewxmK9TuIhn5fmxkWf9+pt8/T2mwqMA5BVtQ0fe7/a8ijVv
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <23420C449811BD4AAB0ED75610205465@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9987d719-b748-4709-369b-08d75863ee6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 09:24:11.8162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VTOAzNaHmwpcPiDp35+qPPoh9MREzjfK7gqBhRV4Uuz//44R+HA43fqjhHhuA5Ml28iVmksCDCmT6ZzVQuIkXUDnFijeAwCGvLmKXyMiSYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5367
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-24_06:2019-10-23,2019-10-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=958 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910240092
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDE5LTEwLTIzIGF0IDE1OjU5IC0wNzAwLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
DQo+IFtFeHRlcm5hbF0NCj4gDQo+IEhpIEFsZXhhbmRydSwNCj4gDQo+IE9uIFdlZCwgT2N0IDIz
LCAyMDE5IGF0IDEwOjA1OjQxQU0gKzAzMDAsIEFsZXhhbmRydSBBcmRlbGVhbiB3cm90ZToNCj4g
PiBGcm9tOiBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0YWZvby5kZT4NCj4gPiANCj4gPiBP
biBzb21lIHBsYXRmb3JtcyB0aGUgYWRwNTU4OSBpcyB1c2VkIGluIEdQSU8gb25seSBtb2RlLiBP
biB0aGVzZQ0KPiA+IHBsYXRmb3Jtcw0KPiA+IHdlIGRvIG5vdCB3YW50IHRvIHJlZ2lzdGVyIGEg
aW5wdXQgZGV2aWNlLCBzbyBtYWtlIHRoYXQgb3B0aW9uYWwgYW5kDQo+ID4gb25seQ0KPiA+IGNy
ZWF0ZSB0aGUgaW5wdXQgZGV2aWNlIGlmIGEga2V5bWFwIGlzIHN1cHBsaWVkLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFu
YWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1r
ZXlzLmMgfCAxOTcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDExMSBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtleXMuYw0KPiA+IGIvZHJpdmVy
cy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtleXMuYw0KPiA+IGluZGV4IDRmOTZhNGE5OWU1Yi4u
MDhiZmE4YjIxM2U4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRw
NTU4OS1rZXlzLmMNCj4gPiArKysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5
cy5jDQo+ID4gQEAgLTQ5NSwxMCArNDk1LDEwIEBAIHN0YXRpYyBpbnQgYWRwNTU4OV9idWlsZF9n
cGlvbWFwKHN0cnVjdA0KPiA+IGFkcDU1ODlfa3BhZCAqa3BhZCwNCj4gPiAgCXJldHVybiBuX3Vu
dXNlZDsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtc3RhdGljIGludCBhZHA1NTg5X2dwaW9fYWRkKHN0
cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQpDQo+ID4gK3N0YXRpYyBpbnQgYWRwNTU4OV9ncGlvX2Fk
ZChzdHJ1Y3QgYWRwNTU4OV9rcGFkICprcGFkLA0KPiA+ICsJY29uc3Qgc3RydWN0IGFkcDU1ODlf
a3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSkNCj4gPiAgew0KPiA+ICAJc3RydWN0IGRldmljZSAq
ZGV2ID0gJmtwYWQtPmNsaWVudC0+ZGV2Ow0KPiA+IC0JY29uc3Qgc3RydWN0IGFkcDU1ODlfa3Bh
ZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9DQo+ID4gZGV2X2dldF9wbGF0ZGF0YShkZXYpOw0KPiA+
ICAJY29uc3Qgc3RydWN0IGFkcDU1ODlfZ3Bpb19wbGF0Zm9ybV9kYXRhICpncGlvX2RhdGEgPSBw
ZGF0YS0NCj4gPiA+Z3Bpb19kYXRhOw0KPiA+ICAJaW50IGksIGVycm9yOw0KPiA+ICANCj4gDQo+
IEFsbCB0aGVzZSBjaGFuZ2VzIHBhc3NpbmcgcGRhdGEgdG8gdmFyaW91cyBmdW5jdGlvbnMgYXJl
IG5vdCByZWFsbHkNCj4gbmVlZGVkIGZvciB0aGlzIHBhdGNoLiBJIGRyb3BwZWQgdGhlbSBhbmQg
YXBwbGllZC4NCg0KQWNrLg0KVGhhbmsgeW91Lg0KDQo+IA0KPiBTb3JyeSBmb3IgdGhlIGRlbGF5
Lg0KDQpObyB3b3JyaWVzICYgdGhhbmsgeW91IGFnYWluIDopDQo+IA0K
