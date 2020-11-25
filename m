Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1870E2C38B1
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 06:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgKYF32 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 00:29:28 -0500
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:4792 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725835AbgKYF31 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 00:29:27 -0500
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0AP5KB61031058;
        Wed, 25 Nov 2020 00:29:14 -0500
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by mx0b-00128a01.pphosted.com with ESMTP id 34y0fha404-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Nov 2020 00:29:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwYQJ8rCRQbeXe5WG180WpIRHgN5C0x7j3vIW5gIaJs6G57fBlUN6cSRNCI90XO2em9LLvXvqK4o0YwHnMq/R/jc8YV950t44LKKELtTmTwqn1mRIHtvUlPsSCTqqxQOnbJYE79Wz3dKtCqL6H47Vlj9KnQ07FzsRB8YESRqL30ZWo+XlxlOE/NbqMvUyOglnHuK1x7bBt/t6w4vR783Jd+LgsAEIQeQtWPxwO0hD7uKEhJwy5cbg4NAaPxjsXrIT/4fOp9IUy2fDIbJMXGIPdRW1XHIswahwvCisCdX2KcgGMgp6yZO68GItaou0MSvYNlvZpzB6LdzhmPKTIxrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx6qlA20VddG0nuEtI6xDDuYNyb7Rq+rjFTnvXxplnQ=;
 b=P9erDktQGmlONSdKL9bd/s9u3aDyegN9poVF3k45IdEH8z4HIow8w4vbS2FD7Qr9AesEh1bJ3McxmA1EteT28MgZ1lorOWWsXzcf88zcNWLekUOW3ySI1JXnax9EVC8QpOsjcO/kzwXnB8A9KOjkfGPFMtihn4SQaAUF6BltB07Ticn8JAXhZKvmDhj4IYcNqyDJcXidWM1IRZNqDgZCbbvPwxAF5K94PSecFapX5o2PBc1rWC40SlEz25nYVg/zJO+xML47s3fKz8/aC+8uWhgs3CxiUhniJqSlPOb9bC1EgoT7UoQYJwJ8lOTmfcX0Lep6owLbWocyt96Dn90OpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx6qlA20VddG0nuEtI6xDDuYNyb7Rq+rjFTnvXxplnQ=;
 b=rEtbOBguwJil9rwvRnFg5Dr9bR34liXYKDIhPywP88ef4fVN+ORGreJF6A3GinCJuUhsCE6kr7Ys3iSToN1Mfly75wU1ErvpGkbZhDNMbPncxbIicFgJ3/wsuVi8HUHn68RdepElNkRetlQf7B90iAEtXQ58sjUSyTU2zmtArM0=
Received: from BYAPR03MB4407.namprd03.prod.outlook.com (2603:10b6:a03:c5::24)
 by BYAPR03MB4342.namprd03.prod.outlook.com (2603:10b6:a03:cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Wed, 25 Nov
 2020 05:29:11 +0000
Received: from BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::50d3:f695:143d:f7e]) by BYAPR03MB4407.namprd03.prod.outlook.com
 ([fe80::50d3:f695:143d:f7e%3]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 05:29:11 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v2 3/3] Input: adp5589-keys - add basic devicetree support
Thread-Topic: [PATCH v2 3/3] Input: adp5589-keys - add basic devicetree
 support
Thread-Index: AQHWwjxG8JNO1CUuEUqS0Ip5j5vMIKnW9y6AgAFcC6A=
Date:   Wed, 25 Nov 2020 05:29:10 +0000
Message-ID: <BYAPR03MB4407F1A7F8558054DA37255BF9FA0@BYAPR03MB4407.namprd03.prod.outlook.com>
References: <20201124082255.13427-1-alexandru.ardelean@analog.com>
 <20201124082255.13427-3-alexandru.ardelean@analog.com>
 <d8265d12-0269-a7ed-1f02-ee5679ee1db2@metafoo.de>
In-Reply-To: <d8265d12-0269-a7ed-1f02-ee5679ee1db2@metafoo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jWVdGeVpHVnNaV0ZjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB5TXpNeVlqZ3hNeTB5WldSbUxURXhaV0l0WVRWalpTMDBNVFUy?=
 =?utf-8?B?TkRVd01EQXdNekJjWVcxbExYUmxjM1JjTWpNek1tSTRNVFV0TW1Wa1ppMHhN?=
 =?utf-8?B?V1ZpTFdFMVkyVXROREUxTmpRMU1EQXdNRE13WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhNamMzSWlCMFBTSXhNekkxTURjMU5UYzBOemd4T1RrMU1UY2lJR2c5SW1o?=
 =?utf-8?B?cU5YSkRiakY1T0dwVVJtTmpRV1pQUlZoRVZWSkRLMm94WnowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUkdRNFNYSnNOamhNVjBGVFRUbDFUMEpzWW5GM1VF?=
 =?utf-8?B?bDZNalEwUjFaMWNrRTRSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlozTldNRFJSUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
authentication-results: metafoo.de; dkim=none (message not signed)
 header.d=none;metafoo.de; dmarc=none action=none header.from=analog.com;
x-originating-ip: [188.27.128.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8bdd22b-1e30-4f2e-62db-08d891030a04
x-ms-traffictypediagnostic: BYAPR03MB4342:
x-microsoft-antispam-prvs: <BYAPR03MB434286C97DE4CAE0D227AB16F9FA0@BYAPR03MB4342.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: adSFun8b6LlL9rj3yVVvFF7QP1KyLiiv+//qjr7TGv0pRDQQNgt1mb3KxMX7gNiCDkZ6MunFsg2S3HMPU3ef42RGWLcNt2dlwPBbn/NdbxjMij8ygMmArCWEED2j57A2wQUOohx/odmt1VkY/O+ytwW9BOC3j3eGg2qLiqOCaixf54u0tIQwoBhB/s5IxF+A3YqfvDaZmyXLr8hBgCwODPC2Oze/TSSdmJA+lP1c3QPDt1CSt2GiZnS/dB8dRtIqn+IQlxwRgciPY7+MeZrKk0dbqp9uQRy6WiVDcRpza5bFcaZNT16jLRk6xL9RHQHRd+rxBvTDaIDNAYMP/YFA4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4407.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(4326008)(83380400001)(66446008)(2906002)(55016002)(478600001)(76116006)(66946007)(7696005)(8676002)(64756008)(66476007)(186003)(86362001)(5660300002)(71200400001)(26005)(66556008)(8936002)(9686003)(110136005)(33656002)(316002)(52536014)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /OvtRd23hWTyU1hRki00VbIBKxrYAApqN/7fo2mbeE9PYBbTgybflqa+tf8+TAZqliBaFePNCFaS9LRv8q/qdVMsFvrkwqwwX4LQy1h3fQspyeGbhM11LYO0UCnM4hotZ63pXwVXF3OrO7+RQbwHRy4F16fKbkwQV/2zEdj4Kf6aIk+5QeOgd9Wh7791SMIbBqFqtwhlZZ0BN1xMesidRvJe/zsnluxmniCj7Xfw+a7oyGea6sAJp5EfoKlwJPPS/V7Ph19WDKkmLX3veZfxncFJyc3AAtfPGdWhgII/SF2a8BHznAPgMJZ/nAzlpHs9hi3AWRhc4crFbZj1ATD2B70zrKJa9qGCaUt7aOvvDyty3N2P8RLrvQrjDZdRxAmy+zhbdvYFRPAiNu6zG/ipKXYpjyyOGhWtdLWKtHuoVou5VOwld+eBcjoHgdKIowbBYDjt9RPLF9uY/jkvD71mbNGv3zRsaYYzU0UBzC+IreJBGRzA5SJI2McAKFR+IzCWgMl3yLdBEaBdu0crv814eBDHUMyhVrsbLPy9YkVw7oXruGUEExCwCKKfhb8SvQQ7Htxc3k69WOgWBra+9C5myy/hWoJWkF/E7GaYBsYhmO+ObOCAL8ouJTWysmit8FedwiPKeAzeu7zwiTaetTv4ZKfw2vnUFAl0kZCO/oqw1ABbUC01K0VjRjeLxDSS8hnR90bPZdKRytGW4NWhBoJ5ugI4cmQ/SW0qYZjnZXe/N/rQ7NAZ2FUjPNgf0PA5S6eENTE+embKx9IJu4gC/opN7+XlyL9lYc+xmszv8o8GsTlcivnhdmMO3/MKmqVFMaSTtbpUjEfqj0s/Kl3g9ecEDq+tOtOOQ/5O7KImTyUihey+bXHMU4RpD2cHNSwdlnJgEpPaHxjYQCWn64JJZDlO9A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4407.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bdd22b-1e30-4f2e-62db-08d891030a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 05:29:11.0844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hkV12TkFfY2zN2sBPUikCDlvJp9+VEYH1miN032lz9655ljdx/aVnC0DXFrRmkJ3quvhEKjc9igdEVrlqCxmqvgI7U/m6kS1s04LnYoegB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4342
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-25_02:2020-11-25,2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250032
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFycy1QZXRlciBDbGF1
c2VuIDxsYXJzQG1ldGFmb28uZGU+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI0LCAyMDIw
IDEwOjQzIEFNDQo+IFRvOiBBcmRlbGVhbiwgQWxleGFuZHJ1IDxhbGV4YW5kcnUuQXJkZWxlYW5A
YW5hbG9nLmNvbT47IGxpbnV4LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAzLzNdIElucHV0OiBhZHA1NTg5LWtleXMgLSBhZGQgYmFzaWMg
ZGV2aWNldHJlZSBzdXBwb3J0DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAxMS8yNC8yMCA5
OjIyIEFNLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6DQo+ID4gICAJZXJyb3IgPSBkZXZtX2Fk
ZF9hY3Rpb25fb3JfcmVzZXQoJmNsaWVudC0+ZGV2LA0KPiA+IGFkcDU1ODlfY2xlYXJfY29uZmln
LCBAQCAtMTA3OCw2ICsxMDk4LDEzIEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQNCj4gPiBh
ZHA1NTg5X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4NCj4gPiAgIHN0YXRpYyBTSU1Q
TEVfREVWX1BNX09QUyhhZHA1NTg5X2Rldl9wbV9vcHMsIGFkcDU1ODlfc3VzcGVuZCwNCj4gPiBh
ZHA1NTg5X3Jlc3VtZSk7DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgYWRwNTU4OV9vZl9tYXRjaFtdID0gew0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJhZGksYWRw
NTU4NSIsIC5kYXRhID0NCj4gJmFkcDU1ODlfY2hpcF9pbmZvX3RibFtBRFA1NTg1XzAxXSB9LA0K
PiA+ICsJeyAuY29tcGF0aWJsZSA9ICJhZGksYWRwNTU4NS0wMiIsIC5kYXRhID0NCj4gJmFkcDU1
ODlfY2hpcF9pbmZvX3RibFtBRFA1NTg1XzAyXSB9LA0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJh
ZGksYWRwNTU4OSIsIC5kYXRhID0NCj4gPiArJmFkcDU1ODlfY2hpcF9pbmZvX3RibFtBRFA1NTg5
XSB9LA0KPiANCj4gSSB0aGluayB3ZSBuZWVkIHRvIGFkZCB0aGVzZSB0bw0KPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwNCj4gDQoNCkFjaw0K
V2lsbCBzZW5kIGEgVjMgaW4gdGhlIG5leHQgZmV3IGRheXMuDQo=
