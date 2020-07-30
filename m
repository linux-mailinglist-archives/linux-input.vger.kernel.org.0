Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D63232A2E
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 04:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgG3C4Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 22:56:24 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:43701 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726774AbgG3C4X (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 22:56:23 -0400
X-UUID: e98c061da58f451d9abf26f70a8de1b2-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=i0bupk3lA9+XOW/dVZ3V8pmhPwEwozZV30mSX3eVTBE=;
        b=gus/bIxR97sic2KSYq4C211n4bNFr6LC/1SOT3AFItXePExvS5Ua+mZte16FsNfodUt297N+21hHzmx48+IkZ5SJkorBDkHMM23ffU4jO14fry9grdLBrXm4WXhJyW7IpOF6odwOWeVVsdJwR4kq8oZUmvX2lxkNAWShuYZD4Qs=;
X-UUID: e98c061da58f451d9abf26f70a8de1b2-20200730
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1447122656; Thu, 30 Jul 2020 10:56:13 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS32DR.mediatek.inc (172.27.6.104) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 10:56:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 10:56:08 +0800
Message-ID: <1596077771.11024.18.camel@mtksdaap41>
Subject: Re: [PATCH v16 1/3] dt-bindings: Add keypad devicetree documentation
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        "Mattijs Korpershoek" <mkorpershoek@baylibre.com>,
        <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Date:   Thu, 30 Jul 2020 10:56:11 +0800
In-Reply-To: <20200727114504.28536-2-fengping.yu@mediatek.com>
References: <20200727114504.28536-1-fengping.yu@mediatek.com>
         <20200727114504.28536-2-fengping.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5B7D66D4661DBC9931269635E8730C67D7D08F06E0F3BA34AF7139FCD2B3F232000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksDQoNClN1bW1hcnkgc2hvdWxkIHNwZWNpZmllZCB0aGlzIHBhdGNoIGlzIGZvciBNZWRpYVRl
azoNCg0KZHQtYmluZGluZ3M6IGFkZCBNZWRpYVRlayBrZXlwYWQgZGV2aWNldHJlZSBkb2N1bWVu
dGF0aW9uDQoNCg0KT24gTW9uLCAyMDIwLTA3LTI3IGF0IDE5OjQ1ICswODAwLCBGZW5ncGluZyBZ
dSB3cm90ZToNCj4gRnJvbTogImZlbmdwaW5nLnl1IiA8ZmVuZ3BpbmcueXVAbWVkaWF0ZWsuY29t
Pg0KDQo+IEFkZCBNZWRpYXRlayBtYXRyaXgga2V5cGFkIGR0LWJpbmRpbmdzIGRvYyBhcyB5YW1s
IHNjaGVtYS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IGZlbmdwaW5nLnl1IDxmZW5ncGluZy55dUBt
ZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRr
LWtwZC55YW1sICAgIHwgOTYgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDk2IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zYmYwOWU3Mzk1ZDANCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW5wdXQvbXRrLWtwZC55YW1sDQo+IEBAIC0wLDAgKzEsOTYgQEANCj4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICt2ZXJzaW9uOiAx
DQo+ICsNCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaW5wdXQvbXRrLWtl
eXBhZC55YW1sIw0KPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjDQo+ICsNCj4gK3RpdGxlOiBNZWRpYXRlaydzIEtleXBhZCBDb250cm9sbGVy
IGRldmljZSB0cmVlIGJpbmRpbmdzDQo+ICsNCj4gK21haW50YWluZXI6DQo+ICsgIC0gRmVuZ3Bp
bmcgWXUgPGZlbmdwaW5nLnl1QG1lZGlhdGVrLmNvbT4NCj4gKw0KPiArZGVzY3JpcHRpb246IHwN
Cj4gKyAgTWVkaWF0ZWsncyBLZXlwYWQgY29udHJvbGxlciBpcyB1c2VkIHRvIGludGVyZmFjZSBh
IFNvQyB3aXRoIGEgbWF0cml4LXR5cGUNCj4gKyAga2V5cGFkIGRldmljZS4gVGhlIGtleXBhZCBj
b250cm9sbGVyIHN1cHBvcnRzIG11bHRpcGxlIHJvdyBhbmQgY29sdW1uIGxpbmVzLg0KPiArICBB
IGtleSBjYW4gYmUgcGxhY2VkIGF0IGVhY2ggaW50ZXJzZWN0aW9uIG9mIGEgdW5pcXVlIHJvdyBh
bmQgYSB1bmlxdWUgY29sdW1uLg0KPiArICBUaGUga2V5cGFkIGNvbnRyb2xsZXIgY2FuIHNlbnNl
IGEga2V5LXByZXNzIGFuZCBrZXktcmVsZWFzZSBhbmQgcmVwb3J0IHRoZQ0KPiArICBldmVudCB1
c2luZyBhIGludGVycnVwdCB0byB0aGUgY3B1Lg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBj
b21wYXRpYmxlOg0KPiArICAgIG9uZU9mOg0KPiArICAgICAgLSBjb25zdDogIm1lZGlhdGVrLG10
Njc3OS1rZXlwYWQiDQo+ICsgICAgICAtIGNvbnN0OiAibWVkaWF0ZWssbXQ2ODczLWtleXBhZCIN
Cj4gKw0KPiArICBjbG9jay1uYW1lczoNCj4gKyAgICBkZXNjcmlwdGlvbjogTmFtZXMgb2YgdGhl
IGNsb2NrcyBsaXN0ZWQgaW4gY2xvY2tzIHByb3BlcnR5IGluIHRoZSBzYW1lIG9yZGVyDQo+ICsg
ICAgbWF4SXRlbXM6IDENCg0KUGxlYXNlIGxpc3QgdGhlIGNsb2NrLW5hbWVzIHJlcXVpcmVkLiBJ
biB0aGlzIGNhc2UsICdrcGQnDQoNCg0KPiArDQo+ICsgIGNsb2NrczoNCj4gKyAgICBkZXNjcmlw
dGlvbjogTXVzdCBjb250YWluIG9uZSBlbnRyeSwgZm9yIHRoZSBtb2R1bGUgY2xvY2sNCj4gKyAg
ICByZWZzOiBkZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2Nrcy9jbG9jay1iaW5kaW5ncy50eHQgZm9y
IGRldGFpbHMuDQo+ICsNCj4gKyAgaW50ZXJydXB0czoNCj4gKyAgICBkZXNjcmlwdGlvbjogQSBz
aW5nbGUgaW50ZXJydXB0IHNwZWNpZmllcg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAg
bGludXgsa2V5bWFwOg0KPiArICAgIGRlc2NyaXB0aW9uOiBUaGUga2V5bWFwIGZvciBrZXlzIGFz
IGRlc2NyaWJlZCBpbiB0aGUgYmluZGluZyBkb2N1bWVudA0KPiArICAgIHJlZnM6IGRldmljZXRy
ZWUvYmluZGluZ3MvaW5wdXQvbWF0cml4LWtleW1hcC50eHQNCj4gKyAgICBtaW5JdGVtczogMQ0K
PiArICAgIG1heEl0ZW1zOiAxNg0KDQpXaHkgaXMgdGhpcyBtYXggYXQgMTY/DQoNCg0KPiArDQo+
ICsgIHBpbmN0cmwtMDoNCj4gKyAgICBkZXNjcmlwdGlvbjogU3BlY2lmeSBwaW4gY29udHJvbCBn
cm91cHMgdXNlZCBmb3IgdGhpcyBjb250cm9sbGVyDQo+ICsgICAgcmVmczogZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtYmluZGluZ3MudHh0DQo+ICsNCj4gKyAgcGluY3RybC1u
YW1lczoNCj4gKyAgICBkZXNjcmlwdGlvbjogTmFtZXMgZm9yIG9wdGlvbmFsIHBpbiBtb2Rlcw0K
PiArICAgIG1heEl0ZW1zOiAxDQoNCkknbSBub3Qgc3VyZSB3ZSBzaG91bGQgbGlzdCBwaW5jdHJs
IGhlcmUuIA0KDQoNCj4gKw0KPiArICByZWc6DQo+ICsgICAgZGVzY3JpcHRpb246IFRoZSBiYXNl
IGFkZHJlc3Mgb2YgdGhlIEtleXBhZCByZWdpc3RlciBiYW5rDQo+ICsgICAgbWF4SXRlbXM6IDEN
Cj4gKw0KPiArICB3YWtldXAtc291cmNlOg0KPiArICAgIGRlc2NyaXB0aW9uOiB1c2UgYW55IGV2
ZW50IG9uIGtleXBhZCBhcyB3YWtldXAgZXZlbnQNCj4gKyAgICB0eXBlOiBib29sZWFuDQo+ICsN
Cj4gKyAga2V5cGFkLG51bS1jb2x1bW5zOg0KPiArICAgIGRlc2NyaXB0aW9uOiBOdW1iZXIgb2Yg
Y29sdW1uIGxpbmVzIGNvbm5lY3RlZCB0byB0aGUga2V5cGFkIGNvbnRyb2xsZXIsDQo+ICsgICAg
aXQgaXMgbm90IGVxdWFsIHRvIFBDQiBjb2x1bW5zIG51bWJlciwgaW5zdGVhZCB5b3Ugc2hvdWxk
IGFkZCByZXF1aXJlZCB2YWx1ZQ0KPiArICAgIGZvciBlYWNoIElDDQo+ICsNCj4gKyAga2V5cGFk
LG51bS1yb3dzOg0KPiArICAgIGRlc2NyaXB0aW9uOiBOdW1iZXIgb2Ygcm93IGxpbmVzIGNvbm5l
Y3RlZCB0byB0aGUga2V5cGFkIGNvbnRyb2xsZXIsIGl0IGlzDQo+ICsgICAgbm90IGVxdWFsIHRv
IFBDQiByb3dzIG51bWJlciwgaW5zdGVhZCB5b3Ugc2hvdWxkIGFkZCByZXF1aXJlZCB2YWx1ZSBm
b3IgZWFjaCBJQw0KDQpTbyB0aGUgdmFsdWVzIGRlcGVuZCBvbiBJQyBIVy4gVGhlc2UgYXJlIG5v
dCBsaXN0ZWQgYXMgcmVxdWlyZWQuIENhbg0KeW91ciBkcml2ZXIgd29ya3Mgd2l0aG91dCB0aGVt
PyBEZWZhdWx0IHZhbHVlPw0KDQo+ICsNCj4gKyAgbWVkaWF0ZWssZGVib3VuY2UtdXM6DQo+ICsg
ICAgZGVzY3JpcHRpb246IERlYm91bmNlIGludGVydmFsIGluIG1pY3Jvc2Vjb25kcywgaWYgbm90
IHNwZWNpZmllZCwgdGhlIGRlZmF1bHQNCj4gKyAgICB2YWx1ZSBpcyAxNjAwMA0KPiArICAgIG1h
eGltdW06IDI1NjAwMA0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsg
IC0gcmVnDQo+ICsgIC0gaW50ZXJydXB0cw0KPiArICAtIGxpbnV4LGtleW1hcA0KPiArICAtIHBp
bmN0cmwNCj4gKyAgLSBjbG9ja3MNCj4gKyAgLSBjbG9jay1uYW1lcw0KPiArDQo+ICtleGFtcGxl
czoNCj4gKyAgLSB8DQo+ICsNCj4gKyAga2V5cGFkOiBrcEAxMDAxMDAwMCB7DQoNClRoaXMgc2hv
dWxkIGJlICdrZXlwYWQnIG9yIGluc3RlYWQgb2Yga3AuDQoNCkpvZS5DDQoNCj4gKyAgICBjb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1rZXlwYWQiOw0KPiArICAgIHJlZyA9IDwwIDB4MTAw
MTAwMDAgMCAweDEwMDA+Ow0KPiArICAgIGxpbnV4LGtleW1hcCA9IDwgTUFUUklYX0tFWSgweDAw
LCAweDAwLCBLRVlfVk9MVU1FRE9XTikgPjsNCj4gKyAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
NzUgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gKyAgICBjbG9ja3MgPSA8JmNsazI2bT47DQo+
ICsgICAgY2xvY2stbmFtZXMgPSAia3BkIjsNCj4gKyAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOw0KPiArICAgIHBpbmN0cmwtMCA9IDwma3BkX2dwaW9zX2RlZl9jZmc+Ow0KPiArICB9Ow0K
DQo=

