Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2C12414A1
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 03:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgHKBsZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 21:48:25 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:38721 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727985AbgHKBsY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 21:48:24 -0400
X-UUID: e0bcfdbec32f4749bb90bb0cdf6668f2-20200811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wWsrLG80qkuNgSA4gGuAfus81URferVVdJm10Q2FyI0=;
        b=D5xe5xHA5gYU4RjvI4svlu2vpiIEvWNSbxoNBMxV6fsBFEh7XUnCIzEhcxit2gjbmLb/SoG7QG199yCWvAiQ6iuLaXw/n65SADtIe80VB8oBog3MAKzSvAg1ncAtGNYPi5ZUkRBevl/4QRRai+erZaaYa1TFh1sXUnrG2mKdBK8=;
X-UUID: e0bcfdbec32f4749bb90bb0cdf6668f2-20200811
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yingjoe.chen@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 855901188; Tue, 11 Aug 2020 09:48:21 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS32N1.mediatek.inc (172.27.4.71) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Aug 2020 09:48:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Aug 2020 09:47:23 +0800
Message-ID: <1597110443.22273.5.camel@mtksdaap41>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
From:   Yingjoe Chen <yingjoe.chen@mediatek.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Date:   Tue, 11 Aug 2020 09:47:23 +0800
In-Reply-To: <20200810064058.6467-2-fengping.yu@mediatek.com>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
         <20200810064058.6467-2-fengping.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2CD043487BC2843B3826AD6DB0F9EC3DC55BA7D3B4D9836D2D5FCFBC9953D792000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksDQoNCg0KT24gTW9uLCAyMDIwLTA4LTEwIGF0IDE0OjQwICswODAwLCBGZW5ncGluZyBZdSB3
cm90ZToNCj4gRnJvbTogImZlbmdwaW5nLnl1IiA8ZmVuZ3BpbmcueXVAbWVkaWF0ZWsuY29tPg0K
PiANCj4gVGhpcyBwYXRjaCBhZGQgZGV2aWNldHJlZSBiaW5kaW5ncyBmb3IgTWVkaWF0ZWsgbWF0
cml4IGtleXBhZCBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBmZW5ncGluZy55dSA8ZmVu
Z3BpbmcueXVAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lucHV0L210ay1rcGQueWFtbCAgICB8IDg3ICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L210ay1rcGQueWFtbA0KPiANCj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9tdGsta3Bk
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvbXRrLWtwZC55
YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDc0ZGQ4
YTZmYmRlDQoNCjwuLi4+DQoNCg0KPiArICBrZXlwYWQsbnVtLWNvbHVtbnM6DQo+ICsgICAgZGVz
Y3JpcHRpb246IE51bWJlciBvZiBjb2x1bW4gbGluZXMgY29ubmVjdGVkIHRvIHRoZSBrZXlwYWQg
Y29udHJvbGxlciwNCj4gKyAgICBpdCBpcyBub3QgZXF1YWwgdG8gUENCIGNvbHVtbnMgbnVtYmVy
LCBpbnN0ZWFkIHlvdSBzaG91bGQgYWRkIHJlcXVpcmVkIHZhbHVlDQo+ICsgICAgZm9yIGVhY2gg
SUMuIElmIG5vdCBzcGVjaWZpZWQsIHRoZSBkZWZhdWx0IHZhbHVlIGlzIDEuDQo+ICsNCj4gKyAg
a2V5cGFkLG51bS1yb3dzOg0KPiArICAgIGRlc2NyaXB0aW9uOiBOdW1iZXIgb2Ygcm93IGxpbmVz
IGNvbm5lY3RlZCB0byB0aGUga2V5cGFkIGNvbnRyb2xsZXIsIGl0IGlzDQo+ICsgICAgbm90IGVx
dWFsIHRvIFBDQiByb3dzIG51bWJlciwgaW5zdGVhZCB5b3Ugc2hvdWxkIGFkZCByZXF1aXJlZCB2
YWx1ZSBmb3IgZWFjaCBJQy4NCj4gKyAgICBJZiBub3Qgc3BlY2lmaWVkLCB0aGUgZGVmYXVsdCB2
YWx1ZSBpcyAxLg0KDQpZb3VyIHNvdXJjZSBjb2RlIGNhbid0IHJlYWxseSBoYW5kbGUgZHRzIHdp
dGhvdXQgcm93cy9jb2x1bW5zDQpwcm9wZXJ0aWVzLiBBbHNvLCB0aGUgZGVmYXVsdCB2YWx1ZSBk
b2Vzbid0IG1ha2UgYW55IHNlbnNlLiBObyBJQyB3aWxsDQpoYXZlIHJvd3Mgb3IgY29sdW1ucyBz
ZXQgdG8gMS4NCg0KU2luY2UgdGhlc2UgYXJlIElDIHNwZWNpZmllZCwgbm90IGJvYXJkIHNwZWNp
ZmllZCwgSSB0aGluayB5b3Ugc2hvdWxkDQpqdXN0IGhhdmUgdGhlIGNvcnJlY3QgbnVtYmVycyBp
biBkcml2ZXIuDQoNCkpvZS5DDQoNCg==

