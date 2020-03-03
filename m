Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FF81770EE
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 09:18:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgCCISB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 03:18:01 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15776 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727552AbgCCISB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Mar 2020 03:18:01 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0238F3Ks001886;
        Tue, 3 Mar 2020 09:17:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jhH8NQY/O6KsfWpqiJBepS9qR9cjfgHFALzMCurSOuQ=;
 b=fIWNqECBf7EGFrRz/lQgos400oQmay/egNjIy19uCd4GNa8X0PtZ9D+AStpm+/mIeSTt
 ssNa3PKRAtXYLQX6THtAeqh+qZbKkHRkU5S1bL9Sba0DDayURY5RRDsC8IEu2jsLEMhX
 UDQWwBWR+Z+WMqOeIB215AkbwFsbmwYB6cZMZRC8C7fSB2+9I1hubdJ375AsotrroXUC
 w7f/fu2wtjxPBxVXkxrtEB9gXkG7wSfvm1SdSL3k+fR+VNCmOtk8KR9KzXINouw+CIqU
 +8Pm6bSLQcrmvq8cpox38tPUyZqV1nmc5VVvN1DXJcacTiQa42Ow/TPTS5H5T7+0s0Rr ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfdycrxba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Mar 2020 09:17:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A530100034;
        Tue,  3 Mar 2020 09:17:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 815D721CA90;
        Tue,  3 Mar 2020 09:17:23 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Mar
 2020 09:17:23 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 3 Mar 2020 09:17:23 +0100
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Rob Herring <robh@kernel.org>
CC:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "Pascal PAILLET-LME" <p.paillet@st.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v4] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Thread-Topic: [PATCH v4] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Thread-Index: AQHV7iX42B2A7UsLZEK+lK/6a8v3/6g2DCyAgABvGAA=
Date:   Tue, 3 Mar 2020 08:17:22 +0000
Message-ID: <d54e7799-a092-63d5-01f1-907a9999a776@st.com>
References: <20200228105809.23254-1-benjamin.gaignard@st.com>
 <20200303013945.GA8727@bogus>
In-Reply-To: <20200303013945.GA8727@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C36ABBE8E0F8E41A1BD36AC755EF47E@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-03_02:2020-03-03,2020-03-03 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCk9uIDMvMy8yMCAyOjM5IEFNLCBSb2IgSGVycmluZyB3cm90ZToNCj4gT24gRnJpLCBGZWIg
MjgsIDIwMjAgYXQgMTE6NTg6MDlBTSArMDEwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+
PiBDb252ZXJ0IHN0cG1pYzEgYmluZGluZ3MgdG8ganNvbi1zY2hlbWEuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4NCj4+
IC0tLQ0KPj4gdmVyc2lvbiA0Og0KPj4gLSBtb3ZlIG9uIHVwcGRlciBub2RlICRyZWY6IC4uL3Jl
Z3VsYXRvci9yZWd1bGF0b3IueWFtbA0KPj4gLSBtb3ZlIGZpeGVkIHN0cmluZ3MgdW5kZXIgcHJv
cGVydGllcyBmaWVsZA0KPj4gLSByZW1vdmUgdW5uZWVkZWQgKCkgaW4gcGF0dGVyblByb3BlcnRp
ZXMNCj4+IC0ga2VlcCBsZG8zIHNlcGFyYXRlIGZyb20gb3RoZXIgbGRvIHByb3BlcnRpZXMNCj4+
IE5vdGU6DQo+PiAtICdzdCxtYXNrLXJlc2V0JyBwcm9wZXJ0eSBzdGF5IGluIGVhY2ggc3Vibm9k
ZSwgSSBkb24ndCBmaW5kDQo+PiAgICB0aGUgc3ludGF4IHRvIGF2b2lkIGR1cGxpcXVhdGUgaXQu
DQo+PiAtIGxkbzYtc3VwcGx5IGFuZCBhbGwgcG9zc2libGUgKi1zdXBwbHkgYXJlIGRlc2NyaWJl
IGJ5IHRoaXMgcmVndWxhcg0KPj4gICAgZXhwcmVzc2lvbjogXihidWNrWzEtNF18bGRvWzEtNl18
Ym9vc3R8cHdyX3N3WzEtMl0pLXN1cHBseSQiOg0KPj4NCj4+IHZlcnNpb24gMzoNCj4+IC0gcHV0
ICRyZWYgdW5kZXIgYWxsT2Yga2V5d29yZA0KPj4gLSBmb3IgZWFjaCByZWd1bGF0b3Igbm9kZSBh
ZGQgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHJlZ3VsYXRvciBwcm9wZXJ0aWVzDQo+Pg0KPj4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9zdCxzdHBtaWMxLW9ua2V5LnR4dCB8ICAyOCAt
LQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS50eHQgICAgICAg
ICB8ICA2MSAtLS0tDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdHBtaWMx
LnlhbWwgICAgICAgIHwgMzM4ICsrKysrKysrKysrKysrKysrKysrKw0KPj4gICAuLi4vYmluZGlu
Z3MvcmVndWxhdG9yL3N0LHN0cG1pYzEtcmVndWxhdG9yLnR4dCAgICB8ICA2NCAtLS0tDQo+PiAg
IC4uLi9iaW5kaW5ncy93YXRjaGRvZy9zdCxzdHBtaWMxLXdkdC50eHQgICAgICAgICAgIHwgIDEx
IC0NCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzMzggaW5zZXJ0aW9ucygrKSwgMTY0IGRlbGV0aW9u
cygtKQ0KPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L3N0LHN0cG1pYzEtb25rZXkudHh0DQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0cG1pYzEudHh0DQo+
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3N0LHN0cG1pYzEueWFtbA0KPj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9zdCxzdHBtaWMxLXJlZ3VsYXRvci50eHQN
Cj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy93YXRjaGRvZy9zdCxzdHBtaWMxLXdkdC50eHQNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3N0LHN0cG1pYzEtb25rZXkudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L3N0LHN0cG1pYzEtb25rZXku
dHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IGViOGU4MzczNmMwMi4u
MDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW5wdXQvc3Qsc3RwbWljMS1vbmtleS50eHQNCj4+ICsrKyAvZGV2L251bGwNCj4+IEBAIC0xLDI4
ICswLDAgQEANCj4+IC1TVE1pY3JvZWxlY3Ryb25pY3MgU1RQTUlDMSBPbmtleQ0KPj4gLQ0KPj4g
LVJlcXVpcmVkIHByb3BlcnRpZXM6DQo+PiAtDQo+PiAtLSBjb21wYXRpYmxlID0gInN0LHN0cG1p
YzEtb25rZXkiOw0KPj4gLS0gaW50ZXJydXB0czogaW50ZXJydXB0IGxpbmUgdG8gdXNlDQo+PiAt
LSBpbnRlcnJ1cHQtbmFtZXMgPSAib25rZXktZmFsbGluZyIsICJvbmtleS1yaXNpbmciDQo+PiAt
CW9ua2V5LWZhbGxpbmc6IGhhcHBlbnMgd2hlbiBvbmtleSBpcyBwcmVzc2VkOyBJVF9QT05LRVlf
RiBvZiBwbWljDQo+PiAtCW9ua2V5LXJpc2luZzogaGFwcGVucyB3aGVuIG9ua2V5IGlzIHJlbGVh
c2VkOyBJVF9QT05LRVlfUiBvZiBwbWljDQo+PiAtDQo+PiAtT3B0aW9uYWwgcHJvcGVydGllczoN
Cj4+IC0NCj4+IC0tIHN0LG9ua2V5LWNsZWFyLWNjLWZsYWc6IG9ua2V5IGlzIGFibGUgcG93ZXIg
b24gYWZ0ZXIgYW4NCj4+IC0gIG92ZXItY3VycmVudCBzaHV0ZG93biBldmVudC4NCj4+IC0tIHN0
LG9ua2V5LXB1LWluYWN0aXZlOiBvbmtleSBwdWxsIHVwIGlzIG5vdCBhY3RpdmUNCj4+IC0tIHBv
d2VyLW9mZi10aW1lLXNlYzogRHVyYXRpb24gaW4gc2Vjb25kcyB3aGljaCB0aGUga2V5IHNob3Vs
ZCBiZSBrZXB0DQo+PiAtICAgICAgICBwcmVzc2VkIGZvciBkZXZpY2UgdG8gcG93ZXIgb2ZmIGF1
dG9tYXRpY2FsbHkgKGZyb20gMSB0byAxNiBzZWNvbmRzKS4NCj4+IC0gICAgICAgIHNlZSBTZWUg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2lucHV0LnlhbWwNCj4+IC0N
Cj4+IC1FeGFtcGxlOg0KPj4gLQ0KPj4gLW9ua2V5IHsNCj4+IC0JY29tcGF0aWJsZSA9ICJzdCxz
dHBtaWMxLW9ua2V5IjsNCj4+IC0JaW50ZXJydXB0LXBhcmVudCA9IDwmcG1pYz47DQo+PiAtCWlu
dGVycnVwdHMgPSA8SVRfUE9OS0VZX0YgMD4sPElUX1BPTktFWV9SIDE+Ow0KPj4gLQlpbnRlcnJ1
cHQtbmFtZXMgPSAib25rZXktZmFsbGluZyIsICJvbmtleS1yaXNpbmciOw0KPj4gLQlwb3dlci1v
ZmYtdGltZS1zZWMgPSA8MTA+Ow0KPj4gLX07DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdHBtaWMxLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS50eHQNCj4+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NA0KPj4gaW5kZXggYWZkNDVjMDg5NTg1Li4wMDAwMDAwMDAwMDANCj4+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS50eHQNCj4+
ICsrKyAvZGV2L251bGwNCj4+IEBAIC0xLDYxICswLDAgQEANCj4+IC0qIFNUTWljcm9lbGVjdHJv
bmljcyBTVFBNSUMxIFBvd2VyIE1hbmFnZW1lbnQgSUMNCj4+IC0NCj4+IC1SZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPj4gLS0gY29tcGF0aWJsZToJCTogInN0LHN0cG1pYzEiDQo+PiAtLSByZWc6CQkJ
OiBUaGUgSTJDIHNsYXZlIGFkZHJlc3MgZm9yIHRoZSBTVFBNSUMxIGNoaXAuDQo+PiAtLSBpbnRl
cnJ1cHRzOgkJOiBUaGUgaW50ZXJydXB0IGxpbmUgdGhlIGRldmljZSBpcyBjb25uZWN0ZWQgdG8u
DQo+PiAtLSAjaW50ZXJydXB0LWNlbGxzOgk6IFNob3VsZCBiZSAxLg0KPj4gLS0gaW50ZXJydXB0
LWNvbnRyb2xsZXI6CTogTWFya3MgdGhlIGRldmljZSBub2RlIGFzIGFuIGludGVycnVwdCBjb250
cm9sbGVyLg0KPj4gLQkJCSAgICBJbnRlcnJ1cHQgbnVtYmVycyBhcmUgZGVmaW5lZCBhdA0KPj4g
LQkJCSAgICBkdC1iaW5kaW5ncy9tZmQvc3Qsc3RwbWljMS5oLg0KPj4gLQ0KPj4gLVNUUE1JQzEg
Y29uc2lzdHMgaW4gYSB2YXJpZWQgZ3JvdXAgb2Ygc3ViLWRldmljZXMuDQo+PiAtRWFjaCBzdWIt
ZGV2aWNlIGJpbmRpbmcgaXMgYmUgZGVzY3JpYmVkIGluIG93biBkb2N1bWVudGF0aW9uIGZpbGUu
DQo+PiAtDQo+PiAtRGV2aWNlCQkJIERlc2NyaXB0aW9uDQo+PiAtLS0tLS0tCQkJLS0tLS0tLS0t
LS0tDQo+PiAtc3Qsc3RwbWljMS1vbmtleQk6IFBvd2VyIG9uIGtleSwgc2VlIC4uL2lucHV0L3N0
LHN0cG1pYzEtb25rZXkudHh0DQo+PiAtc3Qsc3RwbWljMS1yZWd1bGF0b3JzCTogUmVndWxhdG9y
cywgc2VlIC4uL3JlZ3VsYXRvci9zdCxzdHBtaWMxLXJlZ3VsYXRvci50eHQNCj4+IC1zdCxzdHBt
aWMxLXdkdAkJOiBXYXRjaGRvZywgc2VlIC4uL3dhdGNoZG9nL3N0LHN0cG1pYzEtd2R0LnR4dA0K
Pj4gLQ0KPj4gLUV4YW1wbGU6DQo+PiAtDQo+PiAtI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21mZC9z
dCxzdHBtaWMxLmg+DQo+PiAtDQo+PiAtcG1pYzogcG1pY0AzMyB7DQo+PiAtCWNvbXBhdGlibGUg
PSAic3Qsc3RwbWljMSI7DQo+PiAtCXJlZyA9IDwweDMzPjsNCj4+IC0JaW50ZXJydXB0LXBhcmVu
dCA9IDwmZ3Bpb2E+Ow0KPj4gLQlpbnRlcnJ1cHRzID0gPDAgMj47DQo+PiAtDQo+PiAtCWludGVy
cnVwdC1jb250cm9sbGVyOw0KPj4gLQkjaW50ZXJydXB0LWNlbGxzID0gPDI+Ow0KPj4gLQ0KPj4g
LQlvbmtleSB7DQo+PiAtCQljb21wYXRpYmxlID0gInN0LHN0cG1pYzEtb25rZXkiOw0KPj4gLQkJ
aW50ZXJydXB0cyA9IDxJVF9QT05LRVlfRiAwPiw8SVRfUE9OS0VZX1IgMT47DQo+PiAtCQlpbnRl
cnJ1cHQtbmFtZXMgPSAib25rZXktZmFsbGluZyIsICJvbmtleS1yaXNpbmciOw0KPj4gLQkJcG93
ZXItb2ZmLXRpbWUtc2VjID0gPDEwPjsNCj4+IC0JfTsNCj4+IC0NCj4+IC0Jd2F0Y2hkb2cgew0K
Pj4gLQkJY29tcGF0aWJsZSA9ICJzdCxzdHBtaWMxLXdkdCI7DQo+PiAtCX07DQo+PiAtDQo+PiAt
CXJlZ3VsYXRvcnMgew0KPj4gLQkJY29tcGF0aWJsZSA9ICJzdCxzdHBtaWMxLXJlZ3VsYXRvcnMi
Ow0KPj4gLQ0KPj4gLQkJdmRkX2NvcmU6IGJ1Y2sxIHsNCj4+IC0JCQlyZWd1bGF0b3ItbmFtZSA9
ICJ2ZGRfY29yZSI7DQo+PiAtCQkJcmVndWxhdG9yLWJvb3Qtb247DQo+PiAtCQkJcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8NzAwMDAwPjsNCj4+IC0JCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9IDwxMjAwMDAwPjsNCj4+IC0JCX07DQo+PiAtCQl2ZGQ6IGJ1Y2szIHsNCj4+IC0JCQlyZWd1
bGF0b3ItbmFtZSA9ICJ2ZGQiOw0KPj4gLQkJCXJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDMz
MDAwMDA+Ow0KPj4gLQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPj4g
LQkJCXJlZ3VsYXRvci1ib290LW9uOw0KPj4gLQkJCXJlZ3VsYXRvci1wdWxsLWRvd247DQo+PiAt
CQl9Ow0KPj4gLQl9Ow0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3Qsc3RwbWljMS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9zdCxzdHBtaWMxLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLmU5YWRjZDA0YTQ4ZA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdHBtaWMxLnlhbWwN
Cj4+IEBAIC0wLDAgKzEsMzM4IEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZmQvc3Qsc3RwbWljMS55YW1sIw0K
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPj4gKw0KPj4gK3RpdGxlOiBTVE1pY3JvZWxlY3RvbmljcyBTVFBNSUMxIFBvd2VyIE1hbmFn
ZW1lbnQgSUMgYmluZGluZ3MNCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjogU1RNaWNyb2VsZWN0cm9u
aWNzIFNUUE1JQzEgUG93ZXIgTWFuYWdlbWVudCBJQw0KPj4gKw0KPj4gK21haW50YWluZXJzOg0K
Pj4gKyAgLSBwYXNjYWwgUGFpbGxldCA8cC5wYWlsbGV0QHN0LmNvbT4NCj4+ICsNCj4+ICtwcm9w
ZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgY29uc3Q6IHN0LHN0cG1pYzENCj4+
ICsNCj4+ICsgIHJlZzoNCj4+ICsgICAgY29uc3Q6IDB4MzMNCj4+ICsNCj4+ICsgIGludGVycnVw
dHM6DQo+PiArICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICAiI2ludGVycnVwdC1jZWxscyI6
DQo+PiArICAgIGNvbnN0OiAyDQo+PiArDQo+PiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1
ZQ0KPj4gKw0KPj4gKyAgb25rZXk6DQo+PiArICAgIHR5cGU6IG9iamVjdA0KPj4gKw0KPj4gKyAg
ICBhbGxPZjoNCj4+ICsgICAgICAtICRyZWY6IC4uL2lucHV0L2lucHV0LnlhbWwNCj4+ICsNCj4+
ICsgICAgcHJvcGVydGllczoNCj4+ICsgICAgICBjb21wYXRpYmxlOg0KPj4gKyAgICAgICAgY29u
c3Q6IHN0LHN0cG1pYzEtb25rZXkNCj4+ICsNCj4+ICsgICAgICBpbnRlcnJ1cHRzOg0KPj4gKyAg
ICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IG9ua2V5LWZhbGxpbmcs
IGhhcHBlbnMgd2hlbiBvbmtleSBpcyBwcmVzc2VkLiBJVF9QT05LRVlfRiBvZiBwbWljDQo+PiAr
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IG9ua2V5LXJpc2luZywgaGFwcGVucyB3aGVuIG9ua2V5
IGlzIHJlbGVhc2VkLiBJVF9QT05LRVlfUiBvZiBwbWljDQo+PiArDQo+PiArICAgICAgaW50ZXJy
dXB0LW5hbWVzOg0KPj4gKyAgICAgICAgaXRlbXM6DQo+PiArICAgICAgICAgIC0gY29uc3Q6IG9u
a2V5LWZhbGxpbmcNCj4+ICsgICAgICAgICAgLSBjb25zdDogb25rZXktcmlzaW5nDQo+PiArDQo+
PiArICAgICAgc3Qsb25rZXktY2xlYXItY2MtZmxhZzoNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9u
OiBvbmtleSBpcyBhYmxlIHBvd2VyIG9uIGFmdGVyIGFuIG92ZXItY3VycmVudCBzaHV0ZG93biBl
dmVudC4NCj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L2ZsYWcNCj4+ICsNCj4+ICsgICAgICBzdCxvbmtleS1wdS1pbmFjdGl2ZToNCj4+ICsgICAgICAg
IGRlc2NyaXB0aW9uOiBvbmtleSBwdWxsIHVwIGlzIG5vdCBhY3RpdmUNCj4+ICsgICAgICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4+ICsNCj4+ICsgICAg
ICBwb3dlci1vZmYtdGltZS1zZWM6DQo+PiArICAgICAgICBtaW5pbXVtOiAxDQo+PiArICAgICAg
ICBtYXhpbXVtOiAxNg0KPj4gKw0KPj4gKyAgICByZXF1aXJlZDoNCj4+ICsgICAgICAtIGNvbXBh
dGlibGUNCj4+ICsgICAgICAtIGludGVycnVwdHMNCj4+ICsgICAgICAtIGludGVycnVwdC1uYW1l
cw0KPj4gKw0KPj4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICsg
IHdhdGNoZG9nOg0KPj4gKyAgICB0eXBlOiBvYmplY3QNCj4+ICsNCj4+ICsgICAgYWxsT2Y6DQo+
PiArICAgICAgLSAkcmVmOiAuLi93YXRjaGRvZy93YXRjaGRvZy55YW1sDQo+PiArDQo+PiArICAg
IHByb3BlcnRpZXM6DQo+PiArICAgICAgY29tcGF0aWJsZToNCj4+ICsgICAgICAgIGNvbnN0OiBz
dCxzdHBtaWMxLXdkdA0KPj4gKw0KPj4gKyAgICAgIHRpbWVvdXQtc2VjOiB0cnVlDQo+PiArDQo+
PiArICAgIHJlcXVpcmVkOg0KPj4gKyAgICAgIC0gY29tcGF0aWJsZQ0KPj4gKw0KPj4gKyAgICBh
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICsgIHJlZ3VsYXRvcnM6DQo+PiAr
ICAgIHR5cGU6IG9iamVjdA0KPj4gKw0KPj4gKyAgICBhbGxPZjoNCj4+ICsgICAgICAtICRyZWY6
IC4uL3JlZ3VsYXRvci9yZWd1bGF0b3IueWFtbA0KPiBTaWdoLiBIYXZlbid0IEkgYWxyZWFkeSBz
YWlkIHRoaXMgd2FzIGF0IHRoZSB3cm9uZyBsZXZlbCBvbmNlIGJlZm9yZT8NCj4NCj4gTXkgc3Vn
Z2VzdGlvbiB3YXMgdG8gcHV0IHRoaXMgdW5kZXINCj4gIl4oYnVja1sxLTRdfGxkb1sxLTZdfGJv
b3N0fHB3cl9zd1sxLTJdKS1zdXBwbHkkIi4NClllcyBidXQgIl4oYnVja1sxLTRdfGxkb1sxLTZd
fGJvb3N0fHB3cl9zd1sxLTJdKS1zdXBwbHkkIiBub2RlIGRvZXNuJ3QgDQpuZWVkIHJlZ3VsYXRv
cnMgcHJvcGVydGllcy4NCk9ubHkgdGhlIG5vZGVzIHdpdGhvdXQgJy1zdXBwbHknIG5lZWQgdGhl
c2UgcHJvcGVydGllcyBhbmQgdGhleSBhcmUgYXQgDQp0aGUgc2FtZSBsZXZlbCB0aGFuIHRoZSAt
c3VwcGx5IG5vZGVzLg0KSSBoYXZlIHB1dCB0aGUgcmVmZXJlbmNlIHRvIHRoZSByZWd1bGF0b3Ig
dXBwZXIgYXMgSSBjYW4uDQoNCj4NCj4+ICsNCj4+ICsgICAgZGVzY3JpcHRpb246IHwNCj4+ICsg
ICAgICBBdmFpbGFibGUgUmVndWxhdG9ycyBpbiBTVFBNSUMxIGRldmljZSBhcmU6DQo+PiArICAg
ICAgICAtIGJ1Y2sxIGZvciBCdWNrIEJVQ0sxDQo+PiArICAgICAgICAtIGJ1Y2syIGZvciBCdWNr
IEJVQ0syDQo+PiArICAgICAgICAtIGJ1Y2szIGZvciBCdWNrIEJVQ0szDQo+PiArICAgICAgICAt
IGJ1Y2s0IGZvciBCdWNrIEJVQ0s0DQo+PiArICAgICAgICAtIGxkbzEgZm9yIExETyBMRE8xDQo+
PiArICAgICAgICAtIGxkbzIgZm9yIExETyBMRE8yDQo+PiArICAgICAgICAtIGxkbzMgZm9yIExE
TyBMRE8zDQo+PiArICAgICAgICAtIGxkbzQgZm9yIExETyBMRE80DQo+PiArICAgICAgICAtIGxk
bzUgZm9yIExETyBMRE81DQo+PiArICAgICAgICAtIGxkbzYgZm9yIExETyBMRE82DQo+PiArICAg
ICAgICAtIHZyZWZfZGRyIGZvciBMRE8gVnJlZiBERFINCj4+ICsgICAgICAgIC0gYm9vc3QgZm9y
IEJ1Y2sgQk9PU1QNCj4+ICsgICAgICAgIC0gcHdyX3N3MSBmb3IgVkJVU19PVEcgc3dpdGNoDQo+
PiArICAgICAgICAtIHB3cl9zdzIgZm9yIFNXX09VVCBzd2l0Y2gNCj4+ICsgICAgICBTd2l0Y2hl
cyBhcmUgZml4ZWQgdm9sdGFnZSByZWd1bGF0b3JzIHdpdGggb25seSBlbmFibGUvZGlzYWJsZSBj
YXBhYmlsaXR5Lg0KPj4gKw0KPj4gKyAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgIGNvbXBhdGli
bGU6DQo+PiArICAgICAgICBjb25zdDogc3Qsc3RwbWljMS1yZWd1bGF0b3JzDQo+PiArDQo+PiAr
ICAgICAgbGRvMzoNCj4+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPj4gKw0KPj4gKyAgICAgICAg
cHJvcGVydGllczoNCj4+ICsgICAgICAgICAgaW50ZXJydXB0czoNCj4+ICsgICAgICAgICAgICBt
YXhJdGVtczogMQ0KPj4gKw0KPj4gKyAgICAgICAgICBzdCxtYXNrLXJlc2V0Og0KPj4gKyAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOiBtYXNrIHJlc2V0IGZvciB0aGlzIHJlZ3VsYXRvciwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHJlZ3VsYXRvciBjb25maWd1cmF0aW9uIGlzIG1h
aW50YWluZWQgZHVyaW5nIHBtaWMgcmVzZXQuDQo+PiArICAgICAgICAgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0KPj4gKw0KPj4gKyAgICAgICAgICByZWd1
bGF0b3ItbmFtZTogdHJ1ZQ0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItYm9vdC1vbjogdHJ1ZQ0K
Pj4gKyAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOiB0cnVlDQo+PiArICAgICAgICAgIHJl
Z3VsYXRvci1taW4tbWljcm92b2x0OiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1tYXgt
bWljcm92b2x0OiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1hbGxvdy1ieXBhc3M6IHRy
dWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLW92ZXItY3VycmVudC1wcm90ZWN0aW9uOiB0cnVl
DQo+PiArDQo+PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+
ICsgICAgICBsZG80Og0KPj4gKyAgICAgICAgdHlwZTogb2JqZWN0DQo+PiArDQo+PiArICAgICAg
ICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICAgICBpbnRlcnJ1cHRzOg0KPj4gKyAgICAgICAgICAg
IG1heEl0ZW1zOiAxDQo+PiArDQo+PiArICAgICAgICAgIHN0LG1hc2stcmVzZXQ6DQo+PiArICAg
ICAgICAgICAgZGVzY3JpcHRpb246IG1hc2sgcmVzZXQgZm9yIHRoaXMgcmVndWxhdG9yLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICB0aGUgcmVndWxhdG9yIGNvbmZpZ3VyYXRpb24gaXMg
bWFpbnRhaW5lZCBkdXJpbmcgcG1pYyByZXNldC4NCj4+ICsgICAgICAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFnDQo+PiArDQo+PiArICAgICAgICAgIHJl
Z3VsYXRvci1uYW1lOiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOiB0cnVl
DQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1hbHdheXMtb246IHRydWUNCj4+ICsgICAgICAgICAg
cmVndWxhdG9yLW92ZXItY3VycmVudC1wcm90ZWN0aW9uOiB0cnVlDQo+PiArDQo+PiArICAgICAg
ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICsgICAgcGF0dGVyblByb3Bl
cnRpZXM6DQo+PiArICAgICAgIl4oYnVja1sxLTRdfGxkb1sxLTZdfGJvb3N0fHB3cl9zd1sxLTJd
KS1zdXBwbHkkIjoNCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBTVFBNSUMxIHZvbHRhZ2UgcmVn
dWxhdG9ycyBzdXBwbGllcw0KPj4gKw0KPj4gKyAgICAgICJebGRvWzEtMiw1LTZdJCI6DQo+PiAr
ICAgICAgICB0eXBlOiBvYmplY3QNCj4+ICsNCj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+PiAr
ICAgICAgICAgIGludGVycnVwdHM6DQo+PiArICAgICAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsN
Cj4+ICsgICAgICAgICAgc3QsbWFzay1yZXNldDoNCj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlv
bjogbWFzayByZXNldCBmb3IgdGhpcyByZWd1bGF0b3IsDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIHRoZSByZWd1bGF0b3IgY29uZmlndXJhdGlvbiBpcyBtYWludGFpbmVkIGR1cmluZyBw
bWljIHJlc2V0Lg0KPj4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL2ZsYWcNCj4gTW92ZSBhbGwgdGhlc2UgdG8gYSBzaW5nbGUgZGVmaW5pdGlvbiB1
bmRlcg0KPiAiXihidWNrWzEtNF18bGRvWzEtNl18Ym9vc3R8cHdyX3N3WzEtMl0pLXN1cHBseSQi
IGFuZCBqdXN0IGRvDQo+ICdzdCxtYXNrLXJlc2V0OiB0cnVlJyBoZXJlLg0KU2FtZSBoZXJlLg0K
Pg0KPj4gKw0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItbmFtZTogdHJ1ZQ0KPj4gKyAgICAgICAg
ICByZWd1bGF0b3ItYm9vdC1vbjogdHJ1ZQ0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItYWx3YXlz
LW9uOiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0OiB0cnVlDQo+
PiArICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0OiB0cnVlDQo+PiArICAgICAgICAg
IHJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJvdGVjdGlvbjogdHJ1ZQ0KPj4gKyAgICAgICAgICBy
ZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXk6IHRydWUNCj4+ICsNCj4+ICsgICAgICAgIGFkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gKyAgICAgICJeYnVja1sxLTRdJCI6DQo+
PiArICAgICAgICB0eXBlOiBvYmplY3QNCj4+ICsNCj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+
PiArICAgICAgICAgIGludGVycnVwdHM6DQo+PiArICAgICAgICAgICAgbWF4SXRlbXM6IDENCj4+
ICsNCj4+ICsgICAgICAgICAgc3QsbWFzay1yZXNldDoNCj4+ICsgICAgICAgICAgICBkZXNjcmlw
dGlvbjogbWFzayByZXNldCBmb3IgdGhpcyByZWd1bGF0b3IsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgIHRoZSByZWd1bGF0b3IgY29uZmlndXJhdGlvbiBpcyBtYWludGFpbmVkIGR1cmlu
ZyBwbWljIHJlc2V0Lg0KPj4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL2ZsYWcNCj4+ICsNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLW5hbWU6IHRy
dWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb246IHRydWUNCj4+ICsgICAgICAgICAg
cmVndWxhdG9yLWFsd2F5cy1vbjogdHJ1ZQ0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdDogdHJ1ZQ0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdDogdHJ1
ZQ0KPj4gKyAgICAgICAgICByZWd1bGF0b3ItaW5pdGlhbC1tb2RlOiB0cnVlDQo+PiArICAgICAg
ICAgIHJlZ3VsYXRvci1wdWxsLWRvd246IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLW92
ZXItY3VycmVudC1wcm90ZWN0aW9uOiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1lbmFi
bGUtcmFtcC1kZWxheTogdHJ1ZQ0KPj4gKw0KPj4gKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRp
ZXM6IGZhbHNlDQo+PiArDQo+PiArICAgICAgIl52cmVmX2RkciQiOg0KPiBOb3QgYSBwYXR0ZXJu
Lg0KSSB3aWxsIGZpeCB0aGF0IGluIHY1DQo+DQo+PiArICAgICAgICB0eXBlOiBvYmplY3QNCj4+
ICsNCj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAgICAgIGludGVycnVwdHM6DQo+
PiArICAgICAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICAgICAgICAgc3QsbWFzay1y
ZXNldDoNCj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogbWFzayByZXNldCBmb3IgdGhpcyBy
ZWd1bGF0b3IsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgIHRoZSByZWd1bGF0b3IgY29u
ZmlndXJhdGlvbiBpcyBtYWludGFpbmVkIGR1cmluZyBwbWljIHJlc2V0Lg0KPj4gKyAgICAgICAg
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4+ICsNCj4+
ICsgICAgICAgICAgcmVndWxhdG9yLW5hbWU6IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9y
LWJvb3Qtb246IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjogdHJ1ZQ0K
Pj4gKw0KPj4gKyAgICAgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiAr
ICAgICAgIl5ib29zdCQiOg0KPiBBbmQgbmVpdGhlciBpcyB0aGlzLi4uDQpPaw0KPg0KPj4gKyAg
ICAgICAgdHlwZTogb2JqZWN0DQo+PiArDQo+PiArICAgICAgICBwcm9wZXJ0aWVzOg0KPj4gKyAg
ICAgICAgICBpbnRlcnJ1cHRzOg0KPj4gKyAgICAgICAgICAgIG1heEl0ZW1zOiAxDQo+PiArDQo+
PiArICAgICAgICAgIHN0LG1hc2stcmVzZXQ6DQo+PiArICAgICAgICAgICAgZGVzY3JpcHRpb246
IG1hc2sgcmVzZXQgZm9yIHRoaXMgcmVndWxhdG9yLA0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICB0aGUgcmVndWxhdG9yIGNvbmZpZ3VyYXRpb24gaXMgbWFpbnRhaW5lZCBkdXJpbmcgcG1p
YyByZXNldC4NCj4+ICsgICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy9mbGFnDQo+PiArDQo+PiArICAgICAgICAgIHJlZ3VsYXRvci1uYW1lOiB0cnVlDQo+
PiArICAgICAgICAgIHJlZ3VsYXRvci1ib290LW9uOiB0cnVlDQo+PiArICAgICAgICAgIHJlZ3Vs
YXRvci1hbHdheXMtb246IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLW92ZXItY3VycmVu
dC1wcm90ZWN0aW9uOiB0cnVlDQo+PiArDQo+PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UNCj4+ICsNCj4+ICsgICAgICAiXnB3cl9zd1sxLTJdJCI6DQo+PiArICAgICAgICB0
eXBlOiBvYmplY3QNCj4+ICsNCj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+PiArICAgICAgICAg
IGludGVycnVwdHM6DQo+PiArICAgICAgICAgICAgbWF4SXRlbXM6IDENCj4+ICsNCj4+ICsgICAg
ICAgICAgcmVndWxhdG9yLW5hbWU6IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLWJvb3Qt
b246IHRydWUNCj4+ICsgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjogdHJ1ZQ0KPj4gKyAg
ICAgICAgICByZWd1bGF0b3Itb3Zlci1jdXJyZW50LXByb3RlY3Rpb246IHRydWUNCj4+ICsgICAg
ICAgICAgcmVndWxhdG9yLWFjdGl2ZS1kaXNjaGFyZ2U6IHRydWUNCj4+ICsNCj4+ICsgICAgICAg
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4gKw0KPj4gKyAgICByZXF1aXJlZDoNCj4+
ICsgICAgICAtIGNvbXBhdGlibGUNCj4+ICsNCj4+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+PiArDQo+PiArICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+
ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsg
IC0gY29tcGF0aWJsZQ0KPj4gKyAgLSByZWcNCj4+ICsgIC0gaW50ZXJydXB0cw0KPj4gKyAgLSAi
I2ludGVycnVwdC1jZWxscyINCj4+ICsgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXINCj4+ICsNCj4+
ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbWZk
L3N0LHN0cG1pYzEuaD4NCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2FybS1naWMuaD4NCj4+ICsgICAgaTJjQDAgew0KPj4gKyAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKyAgICAgIHBt
aWNAMzMgew0KPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdHBtaWMxIjsNCj4+ICsgICAg
ICAgIHJlZyA9IDwweDMzPjsNCj4+ICsgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwaW9h
PjsNCj4+ICsgICAgICAgIGludGVycnVwdHMgPSA8MCAyPjsNCj4+ICsNCj4+ICsgICAgICAgIGlu
dGVycnVwdC1jb250cm9sbGVyOw0KPj4gKyAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsN
Cj4+ICsNCj4+ICsgICAgICAgIG9ua2V5IHsNCj4+ICsgICAgICAgICAgY29tcGF0aWJsZSA9ICJz
dCxzdHBtaWMxLW9ua2V5IjsNCj4+ICsgICAgICAgICAgaW50ZXJydXB0cyA9IDxJVF9QT05LRVlf
RiAwPiw8SVRfUE9OS0VZX1IgMT47DQo+PiArICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJv
bmtleS1mYWxsaW5nIiwgIm9ua2V5LXJpc2luZyI7DQo+PiArICAgICAgICAgIHBvd2VyLW9mZi10
aW1lLXNlYyA9IDwxMD47DQo+PiArICAgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgICAgd2F0Y2hk
b2cgew0KPj4gKyAgICAgICAgICBjb21wYXRpYmxlID0gInN0LHN0cG1pYzEtd2R0IjsNCj4+ICsg
ICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICByZWd1bGF0b3JzIHsNCj4+ICsgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJzdCxzdHBtaWMxLXJlZ3VsYXRvcnMiOw0KPj4gKw0KPj4gKyAgICAgICAg
ICBsZG82LXN1cHBseSA9IDwmdjN2Mz47DQo+PiArDQo+PiArICAgICAgICAgIGJ1Y2sxIHsNCj4+
ICsgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2ZGRfY29yZSI7DQo+PiArICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDxJVF9DVVJMSU1fQlVDSzEgMD47DQo+PiArICAgICAgICAgICAgc3Qs
bWFzay1yZXNldDsNCj4+ICsgICAgICAgICAgICByZWd1bGF0b3ItYm9vdC1vbjsNCj4+ICsgICAg
ICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw3MDAwMDA+Ow0KPj4gKyAgICAgICAg
ICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDEyMDAwMDA+Ow0KPj4gKyAgICAgICAgICB9
Ow0KPj4gKw0KPj4gKyAgICAgICAgICBidWNrMyB7DQo+PiArICAgICAgICAgICAgcmVndWxhdG9y
LW5hbWUgPSAidmRkIjsNCj4+ICsgICAgICAgICAgICByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9
IDwzMzAwMDAwPjsNCj4+ICsgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwz
MzAwMDAwPjsNCj4+ICsgICAgICAgICAgICByZWd1bGF0b3ItYm9vdC1vbjsNCj4+ICsgICAgICAg
ICAgICByZWd1bGF0b3ItcHVsbC1kb3duOw0KPj4gKyAgICAgICAgICB9Ow0KPj4gKw0KPj4gKyAg
ICAgICAgICBidWNrNCB7DQo+PiArICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAidjN2MyI7
DQo+PiArICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxJVF9DVVJMSU1fQlVDSzQgMD47DQo+PiAr
ICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+PiArICAg
ICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+PiArICAgICAg
ICAgIH07DQo+PiArDQo+PiArICAgICAgICAgIGxkbzYgew0KPj4gKyAgICAgICAgICAgIHJlZ3Vs
YXRvci1uYW1lID0gInYxdjgiOw0KPj4gKyAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92
b2x0ID0gPDE4MDAwMDA+Ow0KPj4gKyAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0
ID0gPDE4MDAwMDA+Ow0KPj4gKyAgICAgICAgICAgIHJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJv
dGVjdGlvbjsNCj4+ICsgICAgICAgICAgfTsNCj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsN
Cj4+ICsgICAgfTsNCj4+ICsNCj4+ICsuLi4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL3N0LHN0cG1pYzEtcmVndWxhdG9yLnR4dCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Ivc3Qsc3RwbWljMS1y
ZWd1bGF0b3IudHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDYxODlk
ZjcxZWE5OC4uMDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVndWxhdG9yL3N0LHN0cG1pYzEtcmVndWxhdG9yLnR4dA0KPj4gKysrIC9kZXYv
bnVsbA0KPj4gQEAgLTEsNjQgKzAsMCBAQA0KPj4gLVNUTWljcm9lbGVjdHJvbmljcyBTVFBNSUMx
IFZvbHRhZ2UgcmVndWxhdG9ycw0KPj4gLQ0KPj4gLVJlZ3VsYXRvciBOb2RlcyBhcmUgb3B0aW9u
YWwgZGVwZW5kaW5nIG9uIG5lZWRzLg0KPj4gLQ0KPj4gLUF2YWlsYWJsZSBSZWd1bGF0b3JzIGlu
IFNUUE1JQzEgZGV2aWNlIGFyZToNCj4+IC0gIC0gYnVjazEgZm9yIEJ1Y2sgQlVDSzENCj4+IC0g
IC0gYnVjazIgZm9yIEJ1Y2sgQlVDSzINCj4+IC0gIC0gYnVjazMgZm9yIEJ1Y2sgQlVDSzMNCj4+
IC0gIC0gYnVjazQgZm9yIEJ1Y2sgQlVDSzQNCj4+IC0gIC0gbGRvMSBmb3IgTERPIExETzENCj4+
IC0gIC0gbGRvMiBmb3IgTERPIExETzINCj4+IC0gIC0gbGRvMyBmb3IgTERPIExETzMNCj4+IC0g
IC0gbGRvNCBmb3IgTERPIExETzQNCj4+IC0gIC0gbGRvNSBmb3IgTERPIExETzUNCj4+IC0gIC0g
bGRvNiBmb3IgTERPIExETzYNCj4+IC0gIC0gdnJlZl9kZHIgZm9yIExETyBWcmVmIEREUg0KPj4g
LSAgLSBib29zdCBmb3IgQnVjayBCT09TVA0KPj4gLSAgLSBwd3Jfc3cxIGZvciBWQlVTX09URyBz
d2l0Y2gNCj4+IC0gIC0gcHdyX3N3MiBmb3IgU1dfT1VUIHN3aXRjaA0KPj4gLQ0KPj4gLVN3aXRj
aGVzIGFyZSBmaXhlZCB2b2x0YWdlIHJlZ3VsYXRvcnMgd2l0aCBvbmx5IGVuYWJsZS9kaXNhYmxl
IGNhcGFiaWxpdHkuDQo+PiAtDQo+PiAtT3B0aW9uYWwgcHJvcGVydGllczoNCj4+IC0tIHN0LG1h
c2stcmVzZXQ6IG1hc2sgcmVzZXQgZm9yIHRoaXMgcmVndWxhdG9yOiB0aGUgcmVndWxhdG9yIGNv
bmZpZ3VyYXRpb24NCj4+IC0gIGlzIG1haW50YWluZWQgZHVyaW5nIHBtaWMgcmVzZXQuDQo+PiAt
LSByZWd1bGF0b3Itb3Zlci1jdXJyZW50LXByb3RlY3Rpb246DQo+PiAtICAgIGlmIHNldCwgYWxs
IHJlZ3VsYXRvcnMgYXJlIHN3aXRjaGVkIG9mZiBpbiBjYXNlIG9mIG92ZXItY3VycmVudCBkZXRl
Y3Rpb24NCj4+IC0gICAgb24gdGhpcyByZWd1bGF0b3IsDQo+PiAtICAgIGlmIG5vdCBzZXQsIHRo
ZSBkcml2ZXIgb25seSBzZW5kcyBhbiBvdmVyLWN1cnJlbnQgZXZlbnQuDQo+PiAtLSBpbnRlcnJ1
cHRzOiBpbmRleCBvZiBjdXJyZW50IGxpbWl0IGRldGVjdGlvbiBpbnRlcnJ1cHQNCj4+IC0tIDxy
ZWd1bGF0b3I+LXN1cHBseTogcGhhbmRsZSB0byB0aGUgcGFyZW50IHN1cHBseS9yZWd1bGF0b3Ig
bm9kZQ0KPj4gLQllYWNoIHJlZ3VsYXRvciBzdXBwbHkgY2FuIGJlIGRlc2NyaWJlZCBleGNlcHQg
dnJlZl9kZHIuDQo+PiAtLSByZWd1bGF0b3ItYWN0aXZlLWRpc2NoYXJnZTogY2FuIGJlIHVzZWQg
b24gcHdyX3N3MSBhbmQgcHdyX3N3Mi4NCj4+IC0NCj4+IC1FeGFtcGxlOg0KPj4gLXJlZ3VsYXRv
cnMgew0KPj4gLQljb21wYXRpYmxlID0gInN0LHN0cG1pYzEtcmVndWxhdG9ycyI7DQo+PiAtDQo+
PiAtCWxkbzYtc3VwcGx5ID0gPCZ2M3YzPjsNCj4+IC0NCj4+IC0JdmRkX2NvcmU6IGJ1Y2sxIHsN
Cj4+IC0JCXJlZ3VsYXRvci1uYW1lID0gInZkZF9jb3JlIjsNCj4+IC0JCWludGVycnVwdHMgPSA8
SVRfQ1VSTElNX0JVQ0sxIDA+Ow0KPj4gLQkJc3QsbWFzay1yZXNldDsNCj4+IC0JCXJlZ3VsYXRv
ci1wdWxsLWRvd247DQo+PiAtCQlyZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw3MDAwMDA+Ow0K
Pj4gLQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIwMDAwMD47DQo+PiAtCX07DQo+PiAt
DQo+PiAtCXYzdjM6IGJ1Y2s0IHsNCj4+IC0JCXJlZ3VsYXRvci1uYW1lID0gInYzdjMiOw0KPj4g
LQkJaW50ZXJydXB0cyA9IDxJVF9DVVJMSU1fQlVDSzQgMD47DQo+PiAtDQo+PiAtCQlyZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4+IC0JCXJlZ3VsYXRvci1tYXgtbWljcm92
b2x0ID0gPDMzMDAwMDA+Ow0KPj4gLQl9Ow0KPj4gLQ0KPj4gLQl2MXY4OiBsZG82IHsNCj4+IC0J
CXJlZ3VsYXRvci1uYW1lID0gInYxdjgiOw0KPj4gLQkJcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PSA8MTgwMDAwMD47DQo+PiAtCQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwxODAwMDAwPjsN
Cj4+IC0JCXJlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJvdGVjdGlvbjsNCj4+IC0JfTsNCj4+IC19
Ow0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy93YXRj
aGRvZy9zdCxzdHBtaWMxLXdkdC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvd2F0Y2hkb2cvc3Qsc3RwbWljMS13ZHQudHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQNCj4+IGluZGV4IDdjYzE0MDdmMTVjYi4uMDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvc3Qsc3RwbWljMS13ZHQudHh0DQo+
PiArKysgL2Rldi9udWxsDQo+PiBAQCAtMSwxMSArMCwwIEBADQo+PiAtU1RNaWNyb2VsZWN0cm9u
aWNzIFNUUE1JQzEgV2F0Y2hkb2cNCj4+IC0NCj4+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPj4g
LQ0KPj4gLS0gY29tcGF0aWJsZSA6IHNob3VsZCBiZSAic3Qsc3RwbWljMS13ZHQiDQo+PiAtDQo+
PiAtRXhhbXBsZToNCj4+IC0NCj4+IC13YXRjaGRvZyB7DQo+PiAtCWNvbXBhdGlibGUgPSAic3Qs
c3RwbWljMS13ZHQiOw0KPj4gLX07DQo+PiAtLSANCj4+IDIuMTUuMA0KPj4NCg==
