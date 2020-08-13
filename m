Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C4C243377
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 07:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgHMFCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Aug 2020 01:02:37 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:3853 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725829AbgHMFCh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 01:02:37 -0400
X-UUID: 6e10a722735d46e29184642ae826d270-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vc0/8bE6UotQMHbyr5S0xQjHvklXp5WypDibcqFMXHo=;
        b=nQIRT8+HQ0fCRyWTUobaV1i5dmltDjpkPegt6WMx47+4xcaROz9Qo0leU+Fk6FsLqoMObf8bnARUmtk2XFN8XM4XYnxmQ+o7NF5Yn8ndkmV1wz7x2rjSGn6iASl6RvwLWIPfsKjWQbhGQzmzM0Ls5aMmAoriPP+oci/VCMAI7qY=;
X-UUID: 6e10a722735d46e29184642ae826d270-20200813
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1345128821; Thu, 13 Aug 2020 13:02:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32DR.mediatek.inc (172.27.6.104) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 13:02:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 13:02:24 +0800
Message-ID: <1597294944.31472.2.camel@mtksdaap41>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     Fengping Yu <fengping.yu@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Thu, 13 Aug 2020 13:02:24 +0800
In-Reply-To: <20200812221357.GS1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
         <20200810064058.6467-2-fengping.yu@mediatek.com>
         <1597110443.22273.5.camel@mtksdaap41> <20200812221357.GS1665100@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA401CDDF3393E80B94BDC4FC2C3180630F59DD1B08243174249AEA12A760DA12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDIwLTA4LTEyIGF0IDE1OjEzIC0wNzAwLCBEbWl0cnkgVG9yb2tob3Ygd3JvdGU6
DQo+IEhpLA0KPiANCj4gT24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDk6NDc6MjNBTSArMDgwMCwg
WWluZ2pvZSBDaGVuIHdyb3RlOg0KPiA+IEhpLA0KPiA+IA0KPiA+IA0KPiA+IE9uIE1vbiwgMjAy
MC0wOC0xMCBhdCAxNDo0MCArMDgwMCwgRmVuZ3BpbmcgWXUgd3JvdGU6DQo+ID4gPiBGcm9tOiAi
ZmVuZ3BpbmcueXUiIDxmZW5ncGluZy55dUBtZWRpYXRlay5jb20+DQo+ID4gPiANCj4gPiA+IFRo
aXMgcGF0Y2ggYWRkIGRldmljZXRyZWUgYmluZGluZ3MgZm9yIE1lZGlhdGVrIG1hdHJpeCBrZXlw
YWQgZHJpdmVyLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBmZW5ncGluZy55dSA8ZmVu
Z3BpbmcueXVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sICAgIHwgODcgKysrKysrKysrKysrKysrKysrKw0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspDQo+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3Bk
LnlhbWwNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnB1dC9tdGsta3BkLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW5wdXQvbXRrLWtwZC55YW1sDQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5kNzRkZDhhNmZiZGUNCj4gPiANCj4gPiA8Li4uPg0K
PiA+IA0KPiA+IA0KPiA+ID4gKyAga2V5cGFkLG51bS1jb2x1bW5zOg0KPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjogTnVtYmVyIG9mIGNvbHVtbiBsaW5lcyBjb25uZWN0ZWQgdG8gdGhlIGtleXBhZCBj
b250cm9sbGVyLA0KPiA+ID4gKyAgICBpdCBpcyBub3QgZXF1YWwgdG8gUENCIGNvbHVtbnMgbnVt
YmVyLCBpbnN0ZWFkIHlvdSBzaG91bGQgYWRkIHJlcXVpcmVkIHZhbHVlDQo+ID4gPiArICAgIGZv
ciBlYWNoIElDLiBJZiBub3Qgc3BlY2lmaWVkLCB0aGUgZGVmYXVsdCB2YWx1ZSBpcyAxLg0KPiA+
ID4gKw0KPiA+ID4gKyAga2V5cGFkLG51bS1yb3dzOg0KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjog
TnVtYmVyIG9mIHJvdyBsaW5lcyBjb25uZWN0ZWQgdG8gdGhlIGtleXBhZCBjb250cm9sbGVyLCBp
dCBpcw0KPiA+ID4gKyAgICBub3QgZXF1YWwgdG8gUENCIHJvd3MgbnVtYmVyLCBpbnN0ZWFkIHlv
dSBzaG91bGQgYWRkIHJlcXVpcmVkIHZhbHVlIGZvciBlYWNoIElDLg0KPiA+ID4gKyAgICBJZiBu
b3Qgc3BlY2lmaWVkLCB0aGUgZGVmYXVsdCB2YWx1ZSBpcyAxLg0KPiA+IA0KPiA+IFlvdXIgc291
cmNlIGNvZGUgY2FuJ3QgcmVhbGx5IGhhbmRsZSBkdHMgd2l0aG91dCByb3dzL2NvbHVtbnMNCj4g
PiBwcm9wZXJ0aWVzLiBBbHNvLCB0aGUgZGVmYXVsdCB2YWx1ZSBkb2Vzbid0IG1ha2UgYW55IHNl
bnNlLiBObyBJQyB3aWxsDQo+ID4gaGF2ZSByb3dzIG9yIGNvbHVtbnMgc2V0IHRvIDEuDQo+ID4g
DQo+ID4gU2luY2UgdGhlc2UgYXJlIElDIHNwZWNpZmllZCwgbm90IGJvYXJkIHNwZWNpZmllZCwg
SSB0aGluayB5b3Ugc2hvdWxkDQo+ID4ganVzdCBoYXZlIHRoZSBjb3JyZWN0IG51bWJlcnMgaW4g
ZHJpdmVyLg0KPiANCj4gSXQgaXMgYWN0dWFsbHkgcHJvcGVydHkgb2YgYm9hcmQgdG8gZGVjaWRl
IGhvdyBtYW55IGtleXMgaXQgd2FudHMgdG8NCj4gd2lyZSB1cC4gSW4gZXh0cmVtZSBjYXNlIGl0
IHdpbGwgYmUgYSBzaW5nbGUga2V5LCBpLmUuIG51bWJlciBvZiByb3dzDQo+IGFuZCBjb2x1bW5z
IHdpbGwgaW5kZWVkIGJlIDEuDQo+IA0KPiBUaGFua3MuDQo+IA0KDQpGcm9tIHRoZSBiaW5kaW5n
ICJpdCBpcyBub3QgZXF1YWwgdG8gUENCIGNvbHVtbnMgbnVtYmVyLCBpbnN0ZWFkIHlvdQ0Kc2hv
dWxkIGFkZCByZXF1aXJlZCB2YWx1ZSBmb3IgZWFjaCBJQy4iDQpEcml2ZXIgY29kZSB1c2UgdGhp
cyB0byBjYWxjdWxhdGUgYml0IHBvc2l0aW9uIGluIHJlZ2lzdGVyLCB3aGljaCBpcyBJQw0KZGVw
ZW5kZW50Lg0KDQpKb2UuQw0KDQo=

