Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E2F19AD5A
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732888AbgDAOFc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 10:05:32 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:28058 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732791AbgDAOFc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Apr 2020 10:05:32 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 031E0NXr016607;
        Wed, 1 Apr 2020 10:05:19 -0400
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
        by mx0b-00128a01.pphosted.com with ESMTP id 302wsq8h7h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Apr 2020 10:05:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1HDlPftv9A7pYmeiMFPxUsqBM/O89SSZaSgPIVhv4rKaKi3f2iZFKuKIXJNoHnK0zpF0XuXrVjnrBrfuSwM+O3rf9LCbEsE+xQHvR6K3OQCk9AQHi1Apv/0m92+MOb6gZXUBnMKNYmqjF4tDO6xsLiMF6HSOrDsPpotq4MnmREL9ckkjShyp2ddddPmzrslCEZjZOmSgkisCG+PLIKYTxU77gPOf26llbMNgDZ7EcjTp/RM+5s76Yw7qjKJbr8K2pIdKaQhnj/iLBLbmmhutN5Kg8YLdQ+RM5OTW0660Ra/H+KWbw6jRcIcNKP4usfqXhVDWlF5GfH7IzOMqoW8ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ntjdIKvp6NycPbgizn4YOEFmsqgCdaCSoOIXI9YKcA=;
 b=CG7FI1PMJZpVAw79o+/66Pv1ETwn2AGvAKSAyrIl17oC0TD+rNFh0TZTzLVqj5bQKqOXxEw4pUULFhLIgXudUY9U2cEBG2LcYQVo6lpSbGOxp80v5GaeFMlVmFa21ttKAHIER3surrcWdCnlAKSx4EFSiqvEvZqC7RVK9dXvPsGYlAUpj93erUd7GkwvdO+DToRAroLIxq4rqA2f2HzlaGcVBz9iBoXQGeuFDMUw/xR7fU3fU85d9hJEPztFnkvWr2gq1mDvwZi4DKvgYDMpyvRv94LAlb7DvyMT8ldxbW9rLch4xYhPEUI0cM+qJtv86adfaws0sCw7YF47h8AznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ntjdIKvp6NycPbgizn4YOEFmsqgCdaCSoOIXI9YKcA=;
 b=4rKfMTmB9ab/9O7BlpHGxtaVXQkKyiemvvrUlygOMstJosO/uRhTDkk0aecseO7zO2TIDo0yv+puR63lig4CQEYb5zELQAmp60rGysoDJ/SoZvjxCo/fcyS8claXPQC99cFn/D3fS7B8mKFcVwbvnlDiwuikDHeFJOEMGlx17yU=
Received: from DM6PR03MB4411.namprd03.prod.outlook.com (2603:10b6:5:10f::14)
 by DM6PR03MB3436.namprd03.prod.outlook.com (2603:10b6:5:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 1 Apr
 2020 14:05:17 +0000
Received: from DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f]) by DM6PR03MB4411.namprd03.prod.outlook.com
 ([fe80::c47f:ceee:cfda:6a7f%3]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 14:05:17 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "lars@metafoo.de" <lars@metafoo.de>
Subject: Re: [PATCH v4 1/4] Input: adp5589: Add default platform data
Thread-Topic: [PATCH v4 1/4] Input: adp5589: Add default platform data
Thread-Index: AQHV8u+O7N5xfhZBlkOICFf8gFvLHKhkd0QA
Date:   Wed, 1 Apr 2020 14:05:17 +0000
Message-ID: <44fc70102430d4d13221907a3d5ccd2d8021b854.camel@analog.com>
References: <20200305131405.6598-1-alexandru.ardelean@analog.com>
In-Reply-To: <20200305131405.6598-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [188.27.135.58]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41ebee41-86c3-4add-90d7-08d7d645b523
x-ms-traffictypediagnostic: DM6PR03MB3436:
x-microsoft-antispam-prvs: <DM6PR03MB34362273E7705BCF23D8E260F9C90@DM6PR03MB3436.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4411.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(136003)(366004)(376002)(396003)(39860400002)(76116006)(186003)(6486002)(8936002)(26005)(2906002)(66946007)(316002)(71200400001)(5660300002)(66446008)(36756003)(4326008)(54906003)(66476007)(6506007)(66556008)(91956017)(86362001)(2616005)(64756008)(81166006)(81156014)(110136005)(6512007)(8676002)(478600001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S/9+q5eQYNHZBKQegHTpiM/Xpq3u0ixB0wIZwDp+OaocWDyjfnNWDVwY/VX6EuS9gl1Endmo0ltjPFtpjTkIecb2kUdpmYRjJG7Pc0cqvdubALAWUZU82Jc1SIOjT78Lux++vzgLUsjOmVt7G6mfs9IGbUeuiDuEc7UHRN4HXSsNPP8QYqlPTMHqVIGLygXTKwMa1EfQArZU4lUgo5UkgM3YopMDtZA/TybIZHclJFolER4X5LbbXpqOKomfLFND35l7yG8e3YKFs3RNd9dqlIFe2JQHSReyLIX6yqWZ2PSe3lu72eup5tDHgeeo5a1pXuhfV//kW6nBuOG16dXoHKPgG+2rWRcccfGcEzLgCGN9tdmYXQ/NK7TPHzBSWf0yQPrMXX0XdQmNCL/Cw2oSUjl6QOWpZJtgmGQCvZSonKO2PwJYiDH4tyjR3My1pQun
x-ms-exchange-antispam-messagedata: QjjifSh6f2FpTkPFgCFMgoePhhAa9J8Nvw3mkke/k6A0j06LIfDui994kZcYjP6yRXIBAgxlhUok4nOpAHlm7kHEiop2XSXK8Gkt7j9E5g9makrxwO00RqAQKifhdPEhV3TkbK1NQV5vfNa9xIlzkQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <62F85B7160BEF14ABB50E4D8538806A1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ebee41-86c3-4add-90d7-08d7d645b523
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 14:05:17.5709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCg1eTxEv6sjizV1Ay6yYyOe9ye1F5F81UxrOkLTEdI0z9JClGkKSV4C2CW3W0FfmEfl1xaArQs1aIJ2Yn3UIGITVhxMpA8UDy3VB3VQnO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3436
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-01_01:2020-03-31,2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010127
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVGh1LCAyMDIwLTAzLTA1IGF0IDE1OjE0ICswMjAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+IEZyb206IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiANCj4g
SWYgbm8gcGxhdGZvcm0gZGF0YSBpcyBzdXBwbGllZCB1c2UgYSBkdW1teSBwbGF0Zm9ybSBkYXRh
IHRoYXQgY29uZmlndXJlcw0KPiB0aGUgZGV2aWNlIGluIEdQSU8gb25seSBtb2RlLiBUaGlzIGNo
YW5nZSBhZGRzIGEgYWRwNTU4OV9rcGFkX3BkYXRhX2dldCgpDQo+IGhlbHBlciB0aGF0IHJldHVy
bnMgdGhlIGRlZmF1bHQgcGxhdGZvcm0tZGF0YS4gVGhpcyBjYW4gYmUgbGF0ZXIgZXh0ZW5kZWQN
Cj4gdG8gbG9hZCBjb25maWd1cmF0aW9uIGZyb20gZGV2aWNlLXRyZWVzIG9yIEFDUEkuDQoNCnBp
bmcNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGFycy1QZXRlciBDbGF1c2VuIDxsYXJzQG1ldGFm
b28uZGU+DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFy
ZGVsZWFuQGFuYWxvZy5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlbG9nIHYzIC0+IHY0Og0KPiAq
IEZpeGVkIHNtYXRjaCB3YXJuaW5ncyBhYm91dCBwb3RlbnRpYWwgbGVhayBiZWluZyBjcmVhdGVk
OyByZXN1bHRlZCBpbiAyDQo+ICAgbW9yZSBwYXRjaGVzOg0KPiAgIC0gSW5wdXQ6IGFkcDU1ODk6
IHVuaWZ5IHJldCAmIGVycm9yIHZhcmlhYmxlcw0KPiAgIC0gSW5wdXQ6IGFkcDU1ODk6IGZpeCBw
b3NzaWJsZSBtZW1sZWFrIG9mICdrcGFkJw0KPiANCj4gQ2hhbmdlbG9nIHYyIC0+IHYzOg0KPiAq
IGZpeCBgLVdwb2ludGVyLXRvLWludC1jYXN0YCB3YXJuaW5ncyBmb3IgcGF0Y2ggYGlucHV0OiBh
ZHA1NTg5OiBBZGQgYmFzaWMNCj4gICBkZXZpY2V0cmVlIHN1cHBvcnRgIDsgd2FybmluZ3Mgc2hv
d3MgdXAgb24gNjQgYml0IEFSQ0hzDQo+IA0KPiBDaGFuZ2Vsb2cgdjEgLT4gdjI6DQo+ICogYWRq
dXN0ZWQgcGF0Y2ggYGlucHV0OiBhZHA1NTg5OiBBZGQgZGVmYXVsdCBwbGF0Zm9ybSBkYXRhYCBi
eQ0KPiAgIGludHJvZHVjdGluZyBhIGBhZHA1NTg5X2twYWRfcGRhdGFfZ2V0KClgIGhlbHBlciwg
d2hpY2ggcmV0dXJucyB0aGUNCj4gICBwbGF0Zm9ybS1kYXRhOyB0aGUgcHJldmlvcyBwYXRjaCB3
YXMgYmFzZWQgb24gYW4gb2xkZXIgdmVyc2lvbiBvZiB0aGUNCj4gICBrZXJuZWwgZnJvbSB0aGUg
QURJIGtlcm5lbC10cmVlOyB0aGUgZHJpdmVyIHdhcyBzeW5jLWVkIHdpdGggdGhlIHVwc3RyZWFt
DQo+ICAgdmVyc2lvbg0KPiANCj4gIGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlz
LmMgfCAzNiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5cy5jDQo+IGIvZHJpdmVycy9pbnB1dC9rZXli
b2FyZC9hZHA1NTg5LWtleXMuYw0KPiBpbmRleCBlN2Q1OGU3ZjAyNTcuLmM2YTgwMWJjZGY5MCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtleXMuYw0KPiAr
KysgYi9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5cy5jDQo+IEBAIC0zNjksNiAr
MzY5LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYWRwX2NvbnN0YW50cyBjb25zdF9hZHA1NTg1
ID0gew0KPiAgCS5yZWcJCQk9IGFkcDU1ODVfcmVnLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBhZHA1NTg5X2dwaW9fcGxhdGZvcm1fZGF0YSBhZHA1NTg5X2RlZmF1bHRfZ3Bp
b19wZGF0YSA9IHsNCj4gKwkuZ3Bpb19zdGFydCA9IC0xLA0KPiArfTsNCj4gKw0KPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0YSBhZHA1NTg5X2RlZmF1bHRf
cGRhdGEgPSB7DQo+ICsJLmdwaW9fZGF0YSA9ICZhZHA1NTg5X2RlZmF1bHRfZ3Bpb19wZGF0YSwN
Cj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWRwNTU4OV9rcGFkX3BsYXRmb3Jt
X2RhdGEgKmFkcDU1ODlfa3BhZF9wZGF0YV9nZXQoDQo+ICsJc3RydWN0IGRldmljZSAqZGV2KQ0K
PiArew0KPiArCWNvbnN0IHN0cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0YSAqcGRhdGEg
PSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+ICsNCj4gKwlpZiAoIXBkYXRhKQ0KPiArCQlwZGF0
YSA9ICZhZHA1NTg5X2RlZmF1bHRfcGRhdGE7DQo+ICsNCj4gKwlyZXR1cm4gcGRhdGE7DQo+ICt9
DQo+ICsNCj4gIHN0YXRpYyBpbnQgYWRwNTU4OV9yZWFkKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQsIHU4IHJlZykNCj4gIHsNCj4gIAlpbnQgcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRh
KGNsaWVudCwgcmVnKTsNCj4gQEAgLTQ5OCw3ICs1MTcsOCBAQCBzdGF0aWMgaW50IGFkcDU1ODlf
YnVpbGRfZ3Bpb21hcChzdHJ1Y3QgYWRwNTU4OV9rcGFkDQo+ICprcGFkLA0KPiAgc3RhdGljIGlu
dCBhZHA1NTg5X2dwaW9fYWRkKHN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQpDQo+ICB7DQo+ICAJ
c3RydWN0IGRldmljZSAqZGV2ID0gJmtwYWQtPmNsaWVudC0+ZGV2Ow0KPiAtCWNvbnN0IHN0cnVj
dCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRhKGRl
dik7DQo+ICsJY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9
DQo+ICsJCWFkcDU1ODlfa3BhZF9wZGF0YV9nZXQoZGV2KTsNCj4gIAljb25zdCBzdHJ1Y3QgYWRw
NTU4OV9ncGlvX3BsYXRmb3JtX2RhdGEgKmdwaW9fZGF0YSA9IHBkYXRhLT5ncGlvX2RhdGE7DQo+
ICAJaW50IGksIGVycm9yOw0KPiAgDQo+IEBAIC01NTMsNyArNTczLDggQEAgc3RhdGljIGludCBh
ZHA1NTg5X2dwaW9fYWRkKHN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQpDQo+ICBzdGF0aWMgdm9p
ZCBhZHA1NTg5X2dwaW9fcmVtb3ZlKHN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQpDQo+ICB7DQo+
ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJmtwYWQtPmNsaWVudC0+ZGV2Ow0KPiAtCWNvbnN0IHN0
cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0YSAqcGRhdGEgPSBkZXZfZ2V0X3BsYXRkYXRh
KGRldik7DQo+ICsJY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0
YSA9DQo+ICsJCWFkcDU1ODlfa3BhZF9wZGF0YV9nZXQoZGV2KTsNCj4gIAljb25zdCBzdHJ1Y3Qg
YWRwNTU4OV9ncGlvX3BsYXRmb3JtX2RhdGEgKmdwaW9fZGF0YSA9IHBkYXRhLT5ncGlvX2RhdGE7
DQo+ICAJaW50IGVycm9yOw0KPiAgDQo+IEBAIC02NTYsNyArNjc3LDcgQEAgc3RhdGljIGludCBh
ZHA1NTg5X3NldHVwKHN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQpDQo+ICB7DQo+ICAJc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCA9IGtwYWQtPmNsaWVudDsNCj4gIAljb25zdCBzdHJ1Y3QgYWRw
NTU4OV9rcGFkX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0NCj4gLQkJZGV2X2dldF9wbGF0ZGF0YSgm
Y2xpZW50LT5kZXYpOw0KPiArCQlhZHA1NTg5X2twYWRfcGRhdGFfZ2V0KCZjbGllbnQtPmRldik7
DQo+ICAJdTggKCpyZWcpICh1OCkgPSBrcGFkLT52YXItPnJlZzsNCj4gIAl1bnNpZ25lZCBjaGFy
IGV2dF9tb2RlMSA9IDAsIGV2dF9tb2RlMiA9IDAsIGV2dF9tb2RlMyA9IDA7DQo+ICAJdW5zaWdu
ZWQgY2hhciBwdWxsX21hc2sgPSAwOw0KPiBAQCAtODYxLDcgKzg4Miw3IEBAIHN0YXRpYyBpbnQg
YWRwNTU4OV9rZXlwYWRfYWRkKHN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQsDQo+IHVuc2lnbmVk
IGludCByZXZpZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0ga3BhZC0+
Y2xpZW50Ow0KPiAgCWNvbnN0IHN0cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0YSAqcGRh
dGEgPQ0KPiAtCQlkZXZfZ2V0X3BsYXRkYXRhKCZjbGllbnQtPmRldik7DQo+ICsJCWFkcDU1ODlf
a3BhZF9wZGF0YV9nZXQoJmNsaWVudC0+ZGV2KTsNCj4gIAlzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1
dDsNCj4gIAl1bnNpZ25lZCBpbnQgaTsNCj4gIAlpbnQgZXJyb3I7DQo+IEBAIC05OTIsNyArMTAx
Myw3IEBAIHN0YXRpYyBpbnQgYWRwNTU4OV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LA0KPiAgew0KPiAgCXN0cnVjdCBhZHA1NTg5X2twYWQgKmtwYWQ7DQo+ICAJY29uc3Qgc3RydWN0
IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9DQo+IC0JCWRldl9nZXRfcGxhdGRh
dGEoJmNsaWVudC0+ZGV2KTsNCj4gKwkJYWRwNTU4OV9rcGFkX3BkYXRhX2dldCgmY2xpZW50LT5k
ZXYpOw0KPiAgCXVuc2lnbmVkIGludCByZXZpZDsNCj4gIAlpbnQgZXJyb3IsIHJldDsNCj4gIA0K
PiBAQCAtMTAwMiwxMSArMTAyMyw2IEBAIHN0YXRpYyBpbnQgYWRwNTU4OV9wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50LA0KPiAgCQlyZXR1cm4gLUVJTzsNCj4gIAl9DQo+ICANCj4gLQlp
ZiAoIXBkYXRhKSB7DQo+IC0JCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAibm8gcGxhdGZvcm0gZGF0
YT9cbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQl9DQo+IC0NCj4gIAlrcGFkID0ga3ph
bGxvYyhzaXplb2YoKmtwYWQpLCBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIWtwYWQpDQo+ICAJCXJl
dHVybiAtRU5PTUVNOw0K
