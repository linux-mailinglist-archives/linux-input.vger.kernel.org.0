Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAAF1E8A28
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 14:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388453AbfJ2N5S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 09:57:18 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:63042 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388294AbfJ2N5S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 09:57:18 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9TDlq21032045;
        Tue, 29 Oct 2019 09:57:05 -0400
Received: from nam03-co1-obe.outbound.protection.outlook.com (mail-co1nam03lp2050.outbound.protection.outlook.com [104.47.40.50])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vvjs67ran-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 29 Oct 2019 09:57:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HckpPdxGoJSW0zD1QNISBYGkOT5prQkucobA2JMLJmIQofmuyUlJqC3SOQ2CtD+W6E/aHmgv8yuCwOFbcR055y9E+xAt9jpxnjNHdx6wuAREiX1+dYWoLE88vsiURnC1ElTItfBrtPiSNUH1HicfDj2CIlrMftCyZ2BJ5NXMtBi+ksP52qGAIDduTjOgDrs4/0gSd/H9rgHg7kHqm4ciPXavmqre5JsoYxQK9PZLL+wSoLOylh5vwXkDtXNDYPpHClKN3VGazT2jp09bz/IcXhCDI8yDPatyvRkzO9W+49xd5uRn/uq9KbFZMrbOPgfwb47rxnvQw3HxBR4msaOlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNB7ztnaq5+XhmGPvdtkzOE01FYiN2TVnlteExXiORQ=;
 b=K5bDVtzB+RMgy29cbHbHaPRcmd3QTJD4gdWsfEIUVt0OGwi4nOS0E38PGuDdh5zW4/6A0bY6XiULicbL0HEIGSY4Mj1ZVGh3Dax6OQYy8e6CmK27+tafhVGQfBpbWQhhZ6DD3cnHpakjF16mRYKAWrP+gRWoHchUZuA3gLe9N19OIF9p43dRUlxsbIMeB6nGuO/sEiLMubMbETGVH4G5BpJlpDDFVh4+OpVQMTwfATIhoQp/QluJg8nxeF4I7m8/Jfx2otZOx71iJOoEdXUgdg56MkB8qp02Xi12hdbmbns5DkdRFE0gCJi1z0CIJ99XvJD+qzBo7iS8R2C/fZnXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNB7ztnaq5+XhmGPvdtkzOE01FYiN2TVnlteExXiORQ=;
 b=kLuFyTz4VohFA7Vbm+m/LX3w2TD4z/cwy9SUNMcDwEJ3uY5fcUxsxU9Ga3zxQDu0ak3xX29M+y4PiJFXHi/7zyBAa1zIxSDVh7gRvOt/87MvMReinGJn1zWG0rSM0rD10Q9Hkbvhr7UQ7PJ6CCQQkpZKfuOh1uXzp18Suxr+UPI=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Tue, 29 Oct 2019 13:57:03 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::99:71f2:a588:977c%3]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 13:57:03 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "lars@metafoo.de" <lars@metafoo.de>
Subject: Re: [PATCH 1/2] input: adp5589: Add default platform data
Thread-Topic: [PATCH 1/2] input: adp5589: Add default platform data
Thread-Index: AQHVjkwF/ninCoxxEkuyjM4FpApMQadxpOOA
Date:   Tue, 29 Oct 2019 13:57:03 +0000
Message-ID: <056ce7661ecf24049982d9f61bed836b4580d888.camel@analog.com>
References: <20191029112836.9188-1-alexandru.ardelean@analog.com>
In-Reply-To: <20191029112836.9188-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 53b86690-55af-4438-959c-08d75c77e0c2
x-ms-traffictypediagnostic: CH2PR03MB5192:
x-microsoft-antispam-prvs: <CH2PR03MB5192C94292E23C39166324E9F9610@CH2PR03MB5192.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(346002)(366004)(396003)(376002)(189003)(199004)(14444005)(3846002)(478600001)(256004)(11346002)(66476007)(66556008)(64756008)(66446008)(66946007)(6116002)(486006)(446003)(2616005)(476003)(2501003)(118296001)(5660300002)(76116006)(2906002)(110136005)(54906003)(8676002)(4001150100001)(81156014)(81166006)(6506007)(102836004)(26005)(186003)(99286004)(76176011)(36756003)(14454004)(86362001)(229853002)(66066001)(7736002)(6486002)(6512007)(25786009)(305945005)(6246003)(71190400001)(71200400001)(316002)(8936002)(4326008)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5192;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbmNsVp2x/hwjA4oGaWrn/t8nyJp7vHxmItVW/0hDnWawEUXY8BBEM0uDQGi1tRBe2lfYu7FRlZRtflN/Dicqv7/DglD/zBIBo3yHB2f21q9Te64LxK5vr0aCc8ijsVo8a1rCxV5zZst3I9/eCIInbopj69awRjdCXaKrMtyAzule0boUCnFeBwcOYKsjRaeBNAn6spk7lD1o4ugsooBehB/NjYeXx3jwOXx+F7YGHeLzjLpEuu4p8tjDX4o8qEwaTQUeg4jBnyYPT6oSknLyYQNSoPlZWM3FzutOb62rO69OgpLs13UBAcMMKvLKq8F7CxZDzXeWYMyb9P6u7JYccLhBcH16NLZSIo9q/Xz61IYJkwaXqkkT0BRtQBwLbVmWlmYkUn6bA4qXejbZbNq89MPWyN2HNcPJ+IIqWP/LpfbD3C1GL2ZstD8+XsXQbHh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D2CD8512CC73419AE9AA81D1F5AB23@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b86690-55af-4438-959c-08d75c77e0c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 13:57:03.6622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOJXNvVMVDsECpzTb+XW3IRHM26bQVvjRUe9/KAVSJ+6oId2Lh3DEgrlMPoTS405R7hVV2ljAPX8RpEJG2+cQhSx0Uw6EK9+vKsH1Ra2gD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5192
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-29_04:2019-10-28,2019-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910290136
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVHVlLCAyMDE5LTEwLTI5IGF0IDEzOjI4ICswMjAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+IEZyb206IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiANCg0K
RGlzcmVnYXJkIHRoaXMgc2VyaWVzLg0KSSBqdXN0IG5vdGljZWQgdGhhdCBpdCBuZWVkcyB0byBi
ZSByZS12aXNpdGVkLg0KU29tZSB0aGluZ3MgaGF2ZSBjaGFuZ2VkLCBhbmQgSSBkaWRuJ3Qgbm90
aWNlLg0KDQpBcG9sb2dpZXMgZm9yIHRoZSBub2lzZS4NCkFsZXgNCg0KDQo+IElmIG5vIHBsYXRm
b3JtIGRhdGEgaXMgc3VwcGxpZWQgdXNlIGEgZHVtbXkgcGxhdGZvcm0gZGF0YSB0aGF0IGNvbmZp
Z3VyZXMNCj4gdGhlIGRldmljZSBpbiBHUElPIG9ubHkgbW9kZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMgfCAxNCArKysrKysr
KysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtl
eXMuYw0KPiBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gaW5kZXgg
ZTdkNThlN2YwMjU3Li5lZDJjMTNiZWYxYjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaW5wdXQv
a2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9h
ZHA1NTg5LWtleXMuYw0KPiBAQCAtOTg3LDYgKzk4NywxNCBAQCBzdGF0aWMgdm9pZCBhZHA1NTg5
X2tleXBhZF9yZW1vdmUoc3RydWN0DQo+IGFkcDU1ODlfa3BhZCAqa3BhZCkNCj4gIAl9DQo+ICB9
DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWRwNTU4OV9ncGlvX3BsYXRmb3JtX2RhdGEN
Cj4gYWRwNTU4OV9kZWZhdWx0X2dwaW9fcGRhdGEgPSB7DQo+ICsJLmdwaW9fc3RhcnQgPSAtMSwN
Cj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWRwNTU4OV9rcGFkX3BsYXRmb3Jt
X2RhdGEgYWRwNTU4OV9kZWZhdWx0X3BkYXRhID0gew0KPiArCS5ncGlvX2RhdGEgPSAmYWRwNTU4
OV9kZWZhdWx0X2dwaW9fcGRhdGEsDQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW50IGFkcDU1ODlf
cHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gIAkJCSBjb25zdCBzdHJ1Y3QgaTJj
X2RldmljZV9pZCAqaWQpDQo+ICB7DQo+IEBAIC0xMDAyLDEwICsxMDEwLDggQEAgc3RhdGljIGlu
dCBhZHA1NTg5X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ICpjbGllbnQsDQo+ICAJCXJldHVy
biAtRUlPOw0KPiAgCX0NCj4gIA0KPiAtCWlmICghcGRhdGEpIHsNCj4gLQkJZGV2X2VycigmY2xp
ZW50LT5kZXYsICJubyBwbGF0Zm9ybSBkYXRhP1xuIik7DQo+IC0JCXJldHVybiAtRUlOVkFMOw0K
PiAtCX0NCj4gKwlpZiAoIXBkYXRhKQ0KPiArCQlwZGF0YSA9ICZhZHA1NTg5X2RlZmF1bHRfcGRh
dGE7DQo+ICANCj4gIAlrcGFkID0ga3phbGxvYyhzaXplb2YoKmtwYWQpLCBHRlBfS0VSTkVMKTsN
Cj4gIAlpZiAoIWtwYWQpDQo=
