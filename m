Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63624E8F67
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 19:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbfJ2SkR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 14:40:17 -0400
Received: from mail-eopbgr790073.outbound.protection.outlook.com ([40.107.79.73]:36640
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725962AbfJ2SkR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 14:40:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FX2Iv/tMnu6NBDYqsYYsbCZ3PKYdsVBic67bGVavG5uiL62ABI+mZejJQ65EfE9rZm63Hkl4VU85B4hfeQn2Tb2i0wGsLuM24hSxqXxZ3SBS9eK/hMQ1XdtqjveFSnYg0wUYYmuTcrBMafvnahyavNR0Jbt/NWRG9puZemE7i1nf4g9036I4tCy8iHZtNyjqSO80Rf3hcnxhp9Tvb2ODLS/DoppFZ0qegQKKHH7pcJpcQzodhWcB+Ue48e96HN4KP4gfmUCylmajHcrwfijlmspjK0G3kZZKlBfCi9UhzIYYrW8ME0av/vgR882I4g2a5RiGn1Qc2fifXZ1Gs+eQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCh0UaJgxjpqxFFmbeWFE5rljKj5VvwEDYHwHbcd4TQ=;
 b=IFlwZEAHf7E0QHnAq3sF8d/o5oJAMj74UgxdvwoOONEvAmahlx0olx2qV3rNzD2nyChns64mWZV4B0tZJcCXuso1Hha2twBbm4xLTl6Kvu9CxA4x4wyoVl//omhnw8TmpFtJnkIDa/ABB5vHS/OrHvgDy1M1lUrnAucE97uKdZZH0mujOMNvbW+Vc5NAmcHmevrPs1J3+mR7aZrqKvdj697DI4Retg66DSdbNLKVHaUzDYFaDqLPi1vCt/W3Bx4d/i1vopwG9ZXEe/EwtSnxEEZ7HuAWuBq893Qwgwv/yB8iMSkJqNKxnEzSafJfHvEsSac80VMrKs6wBE6GQAfZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCh0UaJgxjpqxFFmbeWFE5rljKj5VvwEDYHwHbcd4TQ=;
 b=fZWr/vZluQlHLWW+tZRNIZT6J756GQei0mlbYc69e8mVsLkzahwWWeiwoLL6Ncng1kYhvAbp/MkpeswQ3vrIlNz0rVa3kK64xkCNrsttVBsw6qQTBfJgbBCAcWQSd80Wcuo5oTNBImoLxxv0gcXEKnDzml2V9ruFnYgWrzjcQGQ=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4552.namprd03.prod.outlook.com (20.178.50.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 18:40:13 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c%7]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 18:40:13 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - validate that the rmi_dev pointer
 is set before dereferencing it
Thread-Topic: [PATCH] Input: synaptics-rmi4 - validate that the rmi_dev
 pointer is set before dereferencing it
Thread-Index: AQHViUCPzjLAumaXX06BfCvuoJBvvKdxDbGAgADwZIA=
Date:   Tue, 29 Oct 2019 18:40:13 +0000
Message-ID: <04107127-63fb-51c9-03d4-0e8e39d19546@synaptics.com>
References: <20191023012344.20998-1-aduggan@synaptics.com>
 <20191023012344.20998-2-aduggan@synaptics.com>
 <20191029041947.GG57214@dtor-ws>
In-Reply-To: <20191029041947.GG57214@dtor-ws>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: BY5PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:180::42) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eae31109-ffcd-4957-f390-08d75c9f6f01
x-ms-traffictypediagnostic: BYAPR03MB4552:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB45529448ADA57C94A8CE7772B2610@BYAPR03MB4552.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(366004)(396003)(39860400002)(346002)(51914003)(199004)(189003)(65956001)(107886003)(66066001)(81166006)(8676002)(256004)(2616005)(186003)(11346002)(81156014)(6916009)(26005)(36756003)(6246003)(102836004)(65806001)(86362001)(6512007)(5660300002)(6506007)(52116002)(486006)(53546011)(386003)(6306002)(76176011)(4326008)(446003)(5024004)(25786009)(305945005)(7736002)(31696002)(476003)(31686004)(58126008)(99286004)(316002)(8936002)(6116002)(478600001)(54906003)(71190400001)(71200400001)(66556008)(66946007)(66476007)(66446008)(6486002)(64756008)(966005)(3846002)(14454004)(229853002)(2906002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4552;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:3;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iP2gb254y4xEnsSqwFCt8a/cMOILtBlo80091J3wyf1WQa1c8KCL4eEuoyolg76yqcaOv2V2ZnBfk/DEEQoKf1A+jdGdeEB7/PlQOFMLUWPKg9cUQMI+B92ZIA3a4NIOuQr+P/TfdsMjOfJpJZQOyb9uIIBK+qaVAc288o7VZ0Ao0mFsYhw0bZ5R06xqRDXbvqRwa46YHJ2HGNNAZtzBnF5QjCJXLCiNTey84ZFKChf8w5CsJfXpr71kwL8gwfE7ztbIxS3QzVnM9EVUpN46+zvJdnL0VwEelFKSySM5q3BJ1Eup3nEhnfmQ8IdpOHLoVzdGPCLq9E7lDCvbSyyxZr/AXN/mli9DXIonXpco7EDIWnNFlBw5MKPeXADmWYinnN+qxOT64Q/r8awItk8erjPONRbEOVEQffYt3PbMndaKSvenpNA8i1m4gpna/P7zXZPVo0W7ylbws32ITsyoJshSWGi4olYG68M9Stc076E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64CF6EFEBD64344BA2611F95EE681224@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae31109-ffcd-4957-f390-08d75c9f6f01
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 18:40:13.1236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ll/o1I18Lir8Eorb1xAJVZgnQuhXTa2RyDwT/IfrmPQBNe/2KaOa4qZgRIF6fl26Uc/0aboVWmYXqVPLEpdm3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgRG1pdHJ5LA0KDQpPbiAxMC8yOC8xOSA5OjE5IFBNLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
DQo+IENBVVRJT046IEVtYWlsIG9yaWdpbmF0ZWQgZXh0ZXJuYWxseSwgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBh
bmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBIaSBBbmRyZXcsDQo+DQo+IE9u
IFdlZCwgT2N0IDIzLCAyMDE5IGF0IDAxOjI0OjA1QU0gKzAwMDAsIEFuZHJldyBEdWdnYW4gd3Jv
dGU6DQo+PiBBIGJ1ZyBpbiBoaWQtcm1pIHdhcyBjYXVzaW5nIHJtaV91bnJlZ2lzdGVyX3RyYW5z
cG9ydF9kZXZpY2UoKSB0byBiZQ0KPj4gY2FsbGVkIGV2ZW4gaWYgdGhlIGNhbGwgdG8gcm1pX3Jl
Z2lzdGVyX3RyYW5zcG9ydF9kZXZpY2UoKSBmYWlsZWQgdG8NCj4+IGFsbG9jYXRlIHRoZSBybWkg
ZGV2aWNlLiBBIHBhdGNoIGhhcyBiZWVuIHN1Ym1pdHRlZCB0byBmaXggdGhlIGlzc3VlIGluDQo+
PiBoaWQtcm1pLiBUaGlzIHBhdGNoIHdpbGwgZW5zdXJlIHRoYXQgc2hvdWxkIGEgc2ltaWFsciBz
aXR1YXRpb24NCj4+IG9jY3VyIHRoZW4gdGhlIHJtaSBkcml2ZXIgd2lsbCBub3QgZGVyZWZlcmVu
Y2UgYSBOVUxMIHBvaW50ZXIuDQo+IFRoaXMgbG9va3MgbGlrZSAiZ2FyYmFnZSBpbiwgZ2FyYmFn
ZSBvdXQiIHByb2JsZW0gd2hlcmUgd2Ugc2hvdWxkIG5vdCBiZQ0KPiBjYWxsaW5nIHVucmVnaXN0
ZXIgaW4gdGhlIGZpcnN0IHBsYWNlLiBJJ2QgcmF0aGVyIG5vdCBhcHBseSB0aGlzLg0KDQpUaGF0
J3MgZmluZSwgbGlrZSBJIHNhaWQgdGhlIGFjdHVhbCBmaXggdG8gcHJldmVudCANCnJtaV91bnJl
Z2lzdGVyX3RyYW5zcG9ydF9kZXZpY2UoKSBmcm9tIGJlaW5nIGNhbGxlZCBpbmFwcHJvcHJpYXRl
bHkgaXMgDQppbiB0aGUgaGlkLXJtaSBkcml2ZXIuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWlucHV0LzIwMTkxMDIzMDEyMzQ0LjIwOTk4LTEtYWR1Z2dhbkBzeW5hcHRpY3MuY29t
Lw0KDQpJIHdhcyBvbiB0aGUgZmVuY2Ugb24gd2hldGhlciBvciBub3QgaXQgd2FzIGJldHRlciB0
byBwcmV2ZW50IHRoZSBOVUxMIA0KcG9pbnRlciBkZXJlZmVyZW5jZSBldmVuIGF0IHRoZSBleHBl
bnNlIG9mIG1hc2tpbmcgYnVncyBsaWtlIHRoZSBvbmUgaW4gDQp0aGUgaGlkLXJtaSBkcml2ZXIu
DQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLA0KDQpBbmRyZXcNCg0KDQo+IFRoYW5rcy4NCj4N
Cj4gLS0NCj4gRG1pdHJ5DQo=
