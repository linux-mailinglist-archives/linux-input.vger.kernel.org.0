Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2E2113CE8
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 09:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbfLEIQR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 03:16:17 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:19816 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725974AbfLEIQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Dec 2019 03:16:17 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB58DGsu026389;
        Thu, 5 Dec 2019 03:16:04 -0500
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
        by mx0a-00128a01.pphosted.com with ESMTP id 2wkk57wr7w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Dec 2019 03:16:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSTmAZ1WPcV/Oz0D7soKT8XbGDvs9u+dz5h7tbB1SQ4vtu2GZOckBrTkKv3cZn0plITGczRfn0+7Q/BN21AcyqSNUXG6LfrafOZBv8g5YRLr2wA+G+HrwNYkNnaPwsyYBIH2pqRDQWgQHHhT7k7yDZz1gIUbjdTFc1bZYG31rq3TEX7KtKCzhl5nQ+p4vQVe41Hla6jJTAc+MFppF3zvkrFt9ai47/YnFO8sxTwe1sdEt1RyAqpS8y4LUfym7hWpz5wR/XSo9UfZ5Rx1JVcZkVjy5STrNFWtJb2f32i6RZetwTqWs4B3Q68nFvdfGRsuJznAm8UDC2tb8d/GR03FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht9yTWirxG9Kf4peobvjQd9R9VL6LZTCzrZIWIZbcH8=;
 b=CxAiBsZTqWvCyGHBzKfUH258ayOLNRi5vSnxYN/UvKyYNMJ9sdbMJ4ptmaxXUyehe54WbEVigT9ZcrsD5F4T+8PlvHXth9ZkDH24q3PwhqktLhZ4ALlPk6mKZ9wCCyMvpf00brCTvgkwxq4VpazN1mctXnVvEcg5bOECQ168XDKoTAkn9KYHHtOacyhFgAg87IrzA/x9rTmB4QwOWbElwqXgmILfReU8ThINhqlEkwydLDF/WoHLYwW0gSyxLZY5ZLPSI2R5vQhkG3FSLDiHOv4rCBrWk3hymva1RjzyuNPsDyTY2WrmB1t7QECOMq63Z24bCHGbJxQ8/7rugTq3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht9yTWirxG9Kf4peobvjQd9R9VL6LZTCzrZIWIZbcH8=;
 b=BxRDpYOsIPSOepB8gRWU4UM+Z/JPEq43EoBWSLNwugijsF+Lp/Nro3R4kvPcSKw6mrR/AYdz1OOJmGT+k2hWAdpxi1V5dh2E8Lws9IDRJK6zJVRAOG1yCmfdNQjAs8FwrsNPzdGP3DO9YzmqrGkt6ouq7Dl3Yjbfel8qsUGB6tc=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5208.namprd03.prod.outlook.com (20.180.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 5 Dec 2019 08:16:02 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c%5]) with mapi id 15.20.2516.014; Thu, 5 Dec 2019
 08:16:02 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "lars@metafoo.de" <lars@metafoo.de>
Subject: Re: [PATCH v3 1/2] input: adp5589: Add default platform data
Thread-Topic: [PATCH v3 1/2] input: adp5589: Add default platform data
Thread-Index: AQHVj8nzyziPqU0Gm0SKmj1h+IYWCqeraOGA
Date:   Thu, 5 Dec 2019 08:16:02 +0000
Message-ID: <bd3637b690b6b39d4230ce2259b50e269e8e4760.camel@analog.com>
References: <20191031090312.17205-1-alexandru.ardelean@analog.com>
In-Reply-To: <20191031090312.17205-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 00afee3c-8085-47ef-a4d7-08d7795b5e06
x-ms-traffictypediagnostic: CH2PR03MB5208:
x-microsoft-antispam-prvs: <CH2PR03MB5208548C883BA44278D47674F95C0@CH2PR03MB5208.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02426D11FE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(54534003)(199004)(11346002)(7736002)(2616005)(6436002)(102836004)(6486002)(2906002)(229853002)(186003)(26005)(76176011)(4001150100001)(6506007)(305945005)(25786009)(81166006)(66946007)(66446008)(76116006)(66476007)(81156014)(64756008)(66556008)(5660300002)(8676002)(8936002)(54906003)(86362001)(3846002)(6512007)(6116002)(110136005)(118296001)(4326008)(6246003)(71190400001)(71200400001)(2501003)(316002)(36756003)(14454004)(478600001)(99286004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5208;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: isY9MWtQMXy3GIxXi6KJnmihK+LSOQfWhFILOLk2/vrPjcRSHgkGO9OX6AcZBkP7ve4pUDS83o+tFdZKMJGVI3SFzSDQ8TsdWkcYZPL1wUwJglhf6k+cWR3/gnZOKSMn2SmgIT9A4ckbwFwYrB+/JtmBB9qdoPowKBxk3fGXn915hJhoTJC3FMQNOQ5HEdjxBcYIoGhNChwdsM6xQKvUJY80GCpbR4rFomUPdbtqiE34vlEZOfrBPo9egPmd2EnoZ4SsxqS1cWUYqndm3YaQ/wDNgyShFiGAdrmIAm+xp323LsCXa7/A9IgVYlmRUWzyVgIPrawAxyu1hAG2VnJbHTaUE+rbdnHKfwPbvBj6NtrZO+f4I24o60DrEN3tCsKYg4mX1bYj62K9cEBUdjdLFlBfFXmbqp8A46Z5e4ZE0Xd4DpuIJkwM/JY5nGFMmSbLq4FLjB5u3jk+YWzkp9OAA9cVoCw+S8DoLIHTfp9yqJSMfpb44hsQkwD+oL/OVSqP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <60CAF6A76200AD44B5E52C79B3FE6EAB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00afee3c-8085-47ef-a4d7-08d7795b5e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2019 08:16:02.1299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1L5i1FXZ1Z7Fwbkoovft+RW3DtqDc5FxahtHm2zZfUf+1Hr/c0HFNhTeN9NhLj826xmu3JfHGn61mo4nF/YrIHTwcR3DrlqdrxcwwKUmKHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5208
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_01:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912050066
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVGh1LCAyMDE5LTEwLTMxIGF0IDExOjAzICswMjAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+IEZyb206IExhcnMtUGV0ZXIgQ2xhdXNlbiA8bGFyc0BtZXRhZm9vLmRlPg0KPiANCj4g
SWYgbm8gcGxhdGZvcm0gZGF0YSBpcyBzdXBwbGllZCB1c2UgYSBkdW1teSBwbGF0Zm9ybSBkYXRh
IHRoYXQgY29uZmlndXJlcw0KPiB0aGUgZGV2aWNlIGluIEdQSU8gb25seSBtb2RlLiBUaGlzIGNo
YW5nZSBhZGRzIGEgYWRwNTU4OV9rcGFkX3BkYXRhX2dldCgpDQo+IGhlbHBlciB0aGF0IHJldHVy
bnMgdGhlIGRlZmF1bHQgcGxhdGZvcm0tZGF0YS4gVGhpcyBjYW4gYmUgbGF0ZXIgZXh0ZW5kZWQN
Cj4gdG8gbG9hZCBjb25maWd1cmF0aW9uIGZyb20gZGV2aWNlLXRyZWVzIG9yIEFDUEkuDQo+IA0K
DQpwaW5nIGhlcmUNCg0KPiBTaWduZWQtb2ZmLWJ5OiBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNA
bWV0YWZvby5kZT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhbGV4YW5k
cnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2Vsb2cgdjIgLT4gdjM6
DQo+ICogZml4IGAtV3BvaW50ZXItdG8taW50LWNhc3RgIHdhcm5pbmdzIGZvciBwYXRjaCBgaW5w
dXQ6IGFkcDU1ODk6IEFkZA0KPiBiYXNpYw0KPiAgIGRldmljZXRyZWUgc3VwcG9ydGAgOyB3YXJu
aW5ncyBzaG93cyB1cCBvbiA2NCBiaXQgQVJDSHMNCj4gDQo+IENoYW5nZWxvZyB2MSAtPiB2MjoN
Cj4gKiBhZGp1c3RlZCBwYXRjaCBgaW5wdXQ6IGFkcDU1ODk6IEFkZCBkZWZhdWx0IHBsYXRmb3Jt
IGRhdGFgIGJ5DQo+ICAgaW50cm9kdWN0aW5nIGEgYGFkcDU1ODlfa3BhZF9wZGF0YV9nZXQoKWAg
aGVscGVyLCB3aGljaCByZXR1cm5zIHRoZQ0KPiAgIHBsYXRmb3JtLWRhdGE7IHRoZSBwcmV2aW9z
IHBhdGNoIHdhcyBiYXNlZCBvbiBhbiBvbGRlciB2ZXJzaW9uIG9mIHRoZQ0KPiAgIGtlcm5lbCBm
cm9tIHRoZSBBREkga2VybmVsLXRyZWU7IHRoZSBkcml2ZXIgd2FzIHN5bmMtZWQgd2l0aCB0aGUN
Cj4gdXBzdHJlYW0NCj4gICB2ZXJzaW9uDQo+IA0KPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9h
ZHA1NTg5LWtleXMuYyB8IDM2ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gYi9kcml2ZXJz
L2lucHV0L2tleWJvYXJkL2FkcDU1ODkta2V5cy5jDQo+IGluZGV4IGU3ZDU4ZTdmMDI1Ny4uYzZh
ODAxYmNkZjkwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkt
a2V5cy5jDQo+ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4g
QEAgLTM2OSw2ICszNjksMjUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHBfY29uc3RhbnRzIGNv
bnN0X2FkcDU1ODUgPSB7DQo+ICAJLnJlZwkJCT0gYWRwNTU4NV9yZWcsDQo+ICB9Ow0KPiAgDQo+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFkcDU1ODlfZ3Bpb19wbGF0Zm9ybV9kYXRhDQo+IGFkcDU1
ODlfZGVmYXVsdF9ncGlvX3BkYXRhID0gew0KPiArCS5ncGlvX3N0YXJ0ID0gLTEsDQo+ICt9Ow0K
PiArDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhIGFk
cDU1ODlfZGVmYXVsdF9wZGF0YSA9IHsNCj4gKwkuZ3Bpb19kYXRhID0gJmFkcDU1ODlfZGVmYXVs
dF9ncGlvX3BkYXRhLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBhZHA1NTg5
X2twYWRfcGxhdGZvcm1fZGF0YSAqYWRwNTU4OV9rcGFkX3BkYXRhX2dldCgNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9y
bV9kYXRhICpwZGF0YSA9DQo+IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4gKw0KPiArCWlmICgh
cGRhdGEpDQo+ICsJCXBkYXRhID0gJmFkcDU1ODlfZGVmYXVsdF9wZGF0YTsNCj4gKw0KPiArCXJl
dHVybiBwZGF0YTsNCj4gK30NCj4gKw0KPiAgc3RhdGljIGludCBhZHA1NTg5X3JlYWQoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCwgdTggcmVnKQ0KPiAgew0KPiAgCWludCByZXQgPSBpMmNfc21i
dXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LCByZWcpOw0KPiBAQCAtNDk4LDcgKzUxNyw4IEBAIHN0
YXRpYyBpbnQgYWRwNTU4OV9idWlsZF9ncGlvbWFwKHN0cnVjdCBhZHA1NTg5X2twYWQNCj4gKmtw
YWQsDQo+ICBzdGF0aWMgaW50IGFkcDU1ODlfZ3Bpb19hZGQoc3RydWN0IGFkcDU1ODlfa3BhZCAq
a3BhZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAma3BhZC0+Y2xpZW50LT5kZXY7
DQo+IC0JY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9DQo+
IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4gKwljb25zdCBzdHJ1Y3QgYWRwNTU4OV9rcGFkX3Bs
YXRmb3JtX2RhdGEgKnBkYXRhID0NCj4gKwkJYWRwNTU4OV9rcGFkX3BkYXRhX2dldChkZXYpOw0K
PiAgCWNvbnN0IHN0cnVjdCBhZHA1NTg5X2dwaW9fcGxhdGZvcm1fZGF0YSAqZ3Bpb19kYXRhID0g
cGRhdGEtDQo+ID5ncGlvX2RhdGE7DQo+ICAJaW50IGksIGVycm9yOw0KPiAgDQo+IEBAIC01NTMs
NyArNTczLDggQEAgc3RhdGljIGludCBhZHA1NTg5X2dwaW9fYWRkKHN0cnVjdCBhZHA1NTg5X2tw
YWQNCj4gKmtwYWQpDQo+ICBzdGF0aWMgdm9pZCBhZHA1NTg5X2dwaW9fcmVtb3ZlKHN0cnVjdCBh
ZHA1NTg5X2twYWQgKmtwYWQpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJmtwYWQt
PmNsaWVudC0+ZGV2Ow0KPiAtCWNvbnN0IHN0cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1fZGF0
YSAqcGRhdGEgPQ0KPiBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+ICsJY29uc3Qgc3RydWN0IGFk
cDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRhICpwZGF0YSA9DQo+ICsJCWFkcDU1ODlfa3BhZF9wZGF0
YV9nZXQoZGV2KTsNCj4gIAljb25zdCBzdHJ1Y3QgYWRwNTU4OV9ncGlvX3BsYXRmb3JtX2RhdGEg
KmdwaW9fZGF0YSA9IHBkYXRhLQ0KPiA+Z3Bpb19kYXRhOw0KPiAgCWludCBlcnJvcjsNCj4gIA0K
PiBAQCAtNjU2LDcgKzY3Nyw3IEBAIHN0YXRpYyBpbnQgYWRwNTU4OV9zZXR1cChzdHJ1Y3QgYWRw
NTU4OV9rcGFkICprcGFkKQ0KPiAgew0KPiAgCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBr
cGFkLT5jbGllbnQ7DQo+ICAJY29uc3Qgc3RydWN0IGFkcDU1ODlfa3BhZF9wbGF0Zm9ybV9kYXRh
ICpwZGF0YSA9DQo+IC0JCWRldl9nZXRfcGxhdGRhdGEoJmNsaWVudC0+ZGV2KTsNCj4gKwkJYWRw
NTU4OV9rcGFkX3BkYXRhX2dldCgmY2xpZW50LT5kZXYpOw0KPiAgCXU4ICgqcmVnKSAodTgpID0g
a3BhZC0+dmFyLT5yZWc7DQo+ICAJdW5zaWduZWQgY2hhciBldnRfbW9kZTEgPSAwLCBldnRfbW9k
ZTIgPSAwLCBldnRfbW9kZTMgPSAwOw0KPiAgCXVuc2lnbmVkIGNoYXIgcHVsbF9tYXNrID0gMDsN
Cj4gQEAgLTg2MSw3ICs4ODIsNyBAQCBzdGF0aWMgaW50IGFkcDU1ODlfa2V5cGFkX2FkZChzdHJ1
Y3QgYWRwNTU4OV9rcGFkDQo+ICprcGFkLCB1bnNpZ25lZCBpbnQgcmV2aWQpDQo+ICB7DQo+ICAJ
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IGtwYWQtPmNsaWVudDsNCj4gIAljb25zdCBzdHJ1
Y3QgYWRwNTU4OV9rcGFkX3BsYXRmb3JtX2RhdGEgKnBkYXRhID0NCj4gLQkJZGV2X2dldF9wbGF0
ZGF0YSgmY2xpZW50LT5kZXYpOw0KPiArCQlhZHA1NTg5X2twYWRfcGRhdGFfZ2V0KCZjbGllbnQt
PmRldik7DQo+ICAJc3RydWN0IGlucHV0X2RldiAqaW5wdXQ7DQo+ICAJdW5zaWduZWQgaW50IGk7
DQo+ICAJaW50IGVycm9yOw0KPiBAQCAtOTkyLDcgKzEwMTMsNyBAQCBzdGF0aWMgaW50IGFkcDU1
ODlfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gIHsNCj4gIAlzdHJ1Y3QgYWRw
NTU4OV9rcGFkICprcGFkOw0KPiAgCWNvbnN0IHN0cnVjdCBhZHA1NTg5X2twYWRfcGxhdGZvcm1f
ZGF0YSAqcGRhdGEgPQ0KPiAtCQlkZXZfZ2V0X3BsYXRkYXRhKCZjbGllbnQtPmRldik7DQo+ICsJ
CWFkcDU1ODlfa3BhZF9wZGF0YV9nZXQoJmNsaWVudC0+ZGV2KTsNCj4gIAl1bnNpZ25lZCBpbnQg
cmV2aWQ7DQo+ICAJaW50IGVycm9yLCByZXQ7DQo+ICANCj4gQEAgLTEwMDIsMTEgKzEwMjMsNiBA
QCBzdGF0aWMgaW50IGFkcDU1ODlfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCwN
Cj4gIAkJcmV0dXJuIC1FSU87DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKCFwZGF0YSkgew0KPiAtCQlk
ZXZfZXJyKCZjbGllbnQtPmRldiwgIm5vIHBsYXRmb3JtIGRhdGE/XG4iKTsNCj4gLQkJcmV0dXJu
IC1FSU5WQUw7DQo+IC0JfQ0KPiAtDQo+ICAJa3BhZCA9IGt6YWxsb2Moc2l6ZW9mKCprcGFkKSwg
R0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFrcGFkKQ0KPiAgCQlyZXR1cm4gLUVOT01FTTsNCg==
