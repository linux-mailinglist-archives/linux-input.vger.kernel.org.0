Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41452B071
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 10:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfE0Ikz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 04:40:55 -0400
Received: from mail-eopbgr760088.outbound.protection.outlook.com ([40.107.76.88]:49024
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbfE0Ikz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 04:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8ZvCx+T1wMnC8/oennqyW3ZnlrtzQySiwKoQsyb35E=;
 b=PJuE0qqYCqp4LmqE4ctgebKzry+wPxlnDmZq9NsAiPYir+erxRpYYxrKLBVNHOApRZQVhy/LL1gisZBc7lanU/FEryen+uvOfZ92dEm0h/XwZwWcpR+hL1xA+znm+Q+3vvkIYV/Y3wjHEtzzwEOXkk6gUGvXY8H1Wvkm7es9Ys0=
Received: from CY4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:903:33::24)
 by BL2PR03MB547.namprd03.prod.outlook.com (2a01:111:e400:c23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.16; Mon, 27 May
 2019 08:40:51 +0000
Received: from SN1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::205) by CY4PR03CA0014.outlook.office365.com
 (2603:10b6:903:33::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 08:40:50 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.57)
 smtp.mailfrom=analog.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT057.mail.protection.outlook.com (10.152.73.105) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1922.16
 via Frontend Transport; Mon, 27 May 2019 08:40:50 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x4R8en6h020953
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 27 May 2019 01:40:49 -0700
Received: from DRMBX2.ad.analog.com ([fe80::5144:bea8:5329:bcd]) by
 NWD2HUBCAS7.ad.analog.com ([fe80::595b:ced1:cc03:539d%12]) with mapi id
 14.03.0415.000; Mon, 27 May 2019 04:40:49 -0400
From:   "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>
Subject: Re: [PATCH RESEND] input: adp5589: Add gpio_set_multiple interface
Thread-Topic: [PATCH RESEND] input: adp5589: Add gpio_set_multiple interface
Thread-Index: AQHVD7DDf4PJjwOqak6f3+dxzj0T7qZ4kxIAgAZgXgA=
Date:   Mon, 27 May 2019 08:40:48 +0000
Message-ID: <8c1a16638b0ca97dcfd97b5473215a9eecbca7a0.camel@analog.com>
References: <20190415122525.2576-1-bogdan.togorean@analog.com>
         <20190521083821.26540-1-bogdan.togorean@analog.com>
         <20190523071820.GA121292@dtor-ws>
In-Reply-To: <20190523071820.GA121292@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.7.153]
x-adiroutedonprem: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CAECFF4E14DF646822FAC05EAF64317@analog.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(2980300002)(199004)(189003)(54094003)(4326008)(76176011)(2501003)(7696005)(5660300002)(2486003)(23676004)(356004)(229853002)(36756003)(102836004)(6246003)(14444005)(11346002)(2616005)(476003)(336012)(486006)(126002)(6116002)(3846002)(426003)(316002)(436003)(446003)(1361003)(70206006)(246002)(2351001)(14454004)(5640700003)(186003)(70586007)(6916009)(50466002)(47776003)(118296001)(7736002)(478600001)(72206003)(26005)(8936002)(8676002)(106002)(305945005)(2906002)(86362001)(54906003)(7636002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL2PR03MB547;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66bae7b9-ab5f-4aae-9290-08d6e27f05e8
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709054)(1401327)(2017052603328)(7193020);SRVR:BL2PR03MB547;
X-MS-TrafficTypeDiagnostic: BL2PR03MB547:
X-Microsoft-Antispam-PRVS: <BL2PR03MB547F847EECD9ADFCB928FFF9B1D0@BL2PR03MB547.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: aIw5BjHZnDH5eszZZQDz+nDV52WkPxE7531/UVzo1TnKKMYuMW7SKpFhpNCsG5lgn1Sxsif3mnqndNo5vrLVYTXQeK3LsIX/V+m9EsAT04pzt+u1+g4kYo0M8/o8G8z72naH7FF/iAGFHD+7vtCdlO3S6aJcF+Qm/SFp5iknpdqm+nOL4DR0cZI2slAvWsToYTNFU8zKHxSAfMATFPWU65Sq7sQZTCJzLruBDOOi/thtqXkD3p+0/rMyC+fE2AsDUcj3qXBflK9hgu5WspsU24AOvAB23slCBJmc446N+Np6Wacid+K/ybm7F4tEHg7gpExtT62VEhGjfraBJlJ0WyduH8reJsTnfecxevCjSB5WVO3uUNzFnVel2Mod2ihN8pvtbv0x+5TJw4hNuIAPnY9WTvt33FiH/0387qKkmZg=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 08:40:50.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bae7b9-ab5f-4aae-9290-08d6e27f05e8
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB547
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3DQoNCk9uIFRodSwgMjAxOS0w
NS0yMyBhdCAwMDoxOCAtMDcwMCwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOg0KPiBbRXh0ZXJuYWxd
DQo+IA0KPiANCj4gSGkgQm9nZGFuLA0KPiANCj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMTE6
Mzg6MjJBTSArMDMwMCwgQm9nZGFuIFRvZ29yZWFuIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggaW1w
bGVtZW50cyB0aGUgZ3Bpb19zZXRfbXVsdGlwbGUgaW50ZXJmYWNlIGZvciBBRFA1NTh4DQo+ID4g
Y2hpcC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCb2dkYW4gVG9nb3JlYW4gPGJvZ2Rhbi50
b2dvcmVhbkBhbmFsb2cuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2lucHV0L2tleWJvYXJk
L2FkcDU1ODkta2V5cy5jIHwgMjUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gPiBiL2RyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvYWRwNTU4OS1rZXlzLmMNCj4gPiBpbmRleCAyODM1ZmJhNzFjMzMuLjE0Mzg3
MWJkNjBlZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODkt
a2V5cy5jDQo+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg5LWtleXMuYw0K
PiA+IEBAIC00MTYsNiArNDE2LDMwIEBAIHN0YXRpYyB2b2lkIGFkcDU1ODlfZ3Bpb19zZXRfdmFs
dWUoc3RydWN0DQo+ID4gZ3Bpb19jaGlwICpjaGlwLA0KPiA+ICAgICAgIG11dGV4X3VubG9jaygm
a3BhZC0+Z3Bpb19sb2NrKTsNCj4gPiAgfQ0KPiA+IA0KPiA+ICtzdGF0aWMgdm9pZCBhZHA1NTg5
X2dwaW9fc2V0X211bHRpcGxlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqbWFzaywgdW5zaWduZWQN
Cj4gPiBsb25nICpiaXRzKQ0KPiA+ICt7DQo+ID4gKyAgICAgc3RydWN0IGFkcDU1ODlfa3BhZCAq
a3BhZCA9IGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QNCj4gPiBhZHA1NTg5X2twYWQsIGdjKTsN
Cj4gPiArICAgICB1OCBiYW5rLCByZWdfbWFzaywgcmVnX2JpdHM7DQo+ID4gKw0KPiA+ICsgICAg
IG11dGV4X2xvY2soJmtwYWQtPmdwaW9fbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoYmFu
ayA9IDA7IGJhbmsgPD0ga3BhZC0+dmFyLT5iYW5rKGtwYWQtPnZhci0+bWF4Z3Bpbyk7DQo+ID4g
YmFuaysrKSB7DQo+ID4gKyAgICAgICAgICAgICBpZiAoYmFuayA+IGtwYWQtPnZhci0+YmFuayhn
ZXRfYml0bWFza19vcmRlcigqbWFzaykgLQ0KPiA+IDEpKQ0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBicmVhazsNCj4gDQo+IEkgd29uZGVyIGlmIHdlIHNob3VsZCBoYXZlOg0KPiANCj4gICAg
ICAgICBsYXN0X2dwaW8gPSBtaW4oa3BhZC0+dmFyLT5tYXhncGlvLCBnZXRfYml0bWFza19vcmRl
cigqbWFzaykNCj4gLSAxKTsNCj4gICAgICAgICBsYXN0X2JhbmsgPSBrcGFkLT52YXItPmJhbmso
bGFzdF9iYW5rKTsNCj4gICAgICAgICBmb3IgKGJhbmsgPSAwOyBiYW5rIDw9IGxhc3RfYmFuazsg
YmFuaysrKSB7DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gICAgICAgICB9DQpJIGFncmVlIHRo
aXMgY2FuIGJlIG1hZGUgbW9yZSBjbGVhciBpbiB0aGUgd2F5IHlvdSBwcm9wb3NlZC4NCj4gDQo+
ID4gKyAgICAgICAgICAgICByZWdfbWFzayA9IG1hc2tbYmFuayAvIHNpemVvZigqbWFzayldID4+
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICgoYmFuayAlIHNpemVvZigqbWFzaykpICog
QklUU19QRVJfQllURSk7DQo+ID4gKyAgICAgICAgICAgICByZWdfYml0cyA9IGJpdHNbYmFuayAv
IHNpemVvZigqYml0cyldID4+DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICgoYmFuayAl
IHNpemVvZigqYml0cykpICogQklUU19QRVJfQllURSk7DQo+IA0KPiBUaGlzIHMgcmVhbGx5IGhh
cmQgdG8gcGFyc2UuIFdlIGtub3cgdGhhdCAiYmFuayIgaXMgYSBieXRlLCBhbmQgbWFzaw0KPiBp
cw0KPiBsb25nLCB3ZSBkbyBub3QgaGF2ZSB0byBiZSB0aGlzIHJvdW5kYWJvdXQgaXQuDQpIZXJl
IG1haW4gcmVhc29ucyBmb3IgZG9pbmcgdGhpcyBjb21wbGV4aXR5IHdlcmUgdG8gc3VwcG9ydCA2
NGJpdC8zMmJpdA0KYXJjaGl0ZWN0dXJlcyAoZGlmZmVyZXQgbG9uZyBzaXplKSBhbmQgdG8gYXZv
aWQgdXNlIG9mIG1hZ2ljIHZhbHVlcw0KKEJJVFNfUEVSX0JZVEUpDQo+IA0KPiA+ICsgICAgICAg
ICAgICAga3BhZC0+ZGF0X291dFtiYW5rXSAmPSB+cmVnX21hc2s7DQo+ID4gKyAgICAgICAgICAg
ICBrcGFkLT5kYXRfb3V0W2JhbmtdIHw9IHJlZ19iaXRzICYgcmVnX21hc2s7DQo+ID4gKyAgICAg
ICAgICAgICBhZHA1NTg5X3dyaXRlKGtwYWQtPmNsaWVudCwga3BhZC0+dmFyLQ0KPiA+ID5yZWco
QURQNTU4OV9HUE9fREFUQV9PVVRfQSkgKyBiYW5rLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBrcGFkLT5kYXRfb3V0W2JhbmtdKTsNCj4gPiArICAgICB9DQo+IA0KPiBIb3dldmVy
IHRoZSBiaWdnZXN0IGlzc3VlIGlzIHRoYXQgdGhpcyBpbXBsZW1lbnRhdGlvbiBzZWVtcyB0byBp
Z25vcmUNCj4gdGhlIGtwYWQtPmdwaW9tYXAgdGhhdCB0cmFuc2xhdGVzIEdQSU8gbnVtYmVycyBh
cyBzZWVuIGJ5IGdwaW9saWIgdG8NCj4gR1BJTyBudW1iZXJzIHVzZWQgYnkgdGhlIGNoaXAuIFlv
dSBuZWVkIHRvIHJlc2h1ZmZsZSB0aGUgbWFzayBhbmQNCj4gYml0cywNCj4gYW5kIG9ubHkgdGhl
biBkbyB0aGUgd3JpdGVzLg0KPiANCj4gR2l2ZW4gdGhlIGNvbXBsZXhpdGllcywgZG9lcyBzZXRf
bXVsdGlwbGUgcmVhbGx5IHNhdmUgYW55dGhpbmc/DQo+IA0KV2UgaGF2ZSBhIGNyaXRpY2FsIGFw
cGxpY2F0aW9uIHdoZXJlIHdlIG5lZWQgdG8gc2V0IG11bHRpcGxlIEdQSU9zIHRoYXQNCmFyZSBv
biB0aGUgc2FtZSBiYW5rIHNpbXVsdGFuZW91c2x5LiBObyBkZWxheSBhY2NlcHRlZC4gU28gdGhp
cyB3YXMgdGhlDQp1c2VjYXNlIHdoaWNoIGxlZCB0byBpbXBsZW1lbnRhdGlvbiBvZiBzZXRfbXVs
dGlwbGVfaW50ZXJmYWNlIGZvciB0aGlzDQpjaGlwLg0KPiBUaGFua3MuDQo+IA0KPiAtLQ0KPiBE
bWl0cnkNClRoYW5rIHlvdSwNCkJvZ2Rhbg0KDQo=
