Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853961F3F7C
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 17:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730831AbgFIPhD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 11:37:03 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:49124 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728944AbgFIPhC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Jun 2020 11:37:02 -0400
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059FC8Hh013046;
        Tue, 9 Jun 2020 11:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=tbtv1WgpHHLB/mHT3vpty0LawTJAtK3KSytMBVURAWo=;
 b=UUYZbKZBfTGaGgf3kNlqPLFoea6T+rZzYRSIw5laqZ5IT7OOtFE8DODIX46sHtMrPuBL
 TtuHwTa1gpRfscoTUTpmTg5+lrXF5c1nL0C2D9U+rkMBzmJFumV3XcIlhoTeqSQwPus8
 jd1vPcBoZVapJt0r4iijLF4mBhpau/EtRezk4qwQkZHsGx7bua8ZMChnSprfP1bF8qsN
 nEgdmB1EVx1q+uv68whfaTOWEDdbYwqT7opuhT1FIU/+lOYG9yPmlaBW1GhT6WU4zzvM
 +EHSrsdem49FfTH/5cMSqflB3RjwHhkMhtMoMjl6ZJpbXPQ8eVVmPqzbDPjJR1de0G33 Tg== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 31gy5jqskt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 11:36:59 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059FHqqK047561;
        Tue, 9 Jun 2020 11:36:59 -0400
Received: from ausxippc101.us.dell.com (ausxippc101.us.dell.com [143.166.85.207])
        by mx0a-00154901.pphosted.com with ESMTP id 31jbqe23dg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Jun 2020 11:36:58 -0400
X-LoopCount0: from 10.166.132.131
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,346,1549951200"; 
   d="scan'208";a="1395941334"
From:   <Mario.Limonciello@dell.com>
To:     <hdegoede@redhat.com>, <y.linux@paritcher.com>
CC:     <linux-kernel@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>, <mjg59@srcf.ucam.org>,
        <pali@kernel.org>, <linux-input@vger.kernel.org>
Subject: RE: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Thread-Topic: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Thread-Index: AQHWPUx5kZ6BCWcrZkepA13uOwTuTKjO2RsQgACifgD//7DjgIABQqkA///7V4A=
Date:   Tue, 9 Jun 2020 15:36:54 +0000
Message-ID: <ae45da27126d470888ef0d839665b9ed@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <137d8e69-a83f-6129-19e0-316ef0a51076@redhat.com>
In-Reply-To: <137d8e69-a83f-6129-19e0-316ef0a51076@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-06-09T15:28:46.9025927Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=b0518c3f-df1c-47f8-bdd1-be31e3037197;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [143.166.24.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-09_09:2020-06-09,2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 cotscore=-2147483648 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006090117
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006090117
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

TG9vcCBsaW51eC1pbnB1dCBtYWlsaW5nIGxpc3QgYW5kIHRyaW0gdG8gdGhlIHJlbGV2YW50IGNv
bnZlcnNhdGlvbi4NCg0KPiA+IENhbiB5b3UgcGxlYXNlIGNvbW1lbnQgaGVyZSBob3cgeW91IHdv
dWxkIGxpa2UgdG8gc2VlIGV2ZW50cyBsaWtlIHRoaXMNCj4gc2hvdWxkIGNvbWUNCj4gPiB0aHJv
dWdoIHRvIHVzZXJzcGFjZT8NCj4gPg0KPiA+ICogV3JvbmcgcG93ZXIgYWRhcHRlciAoeW91IGhh
dmUgWCBhbmQgc2hvdWxkIGhhdmUgWSkNCj4gPiAqIFlvdSBoYXZlIHBsdWdnZWQgYSBkb2NrIGlu
dG8gdGhlIHdyb25nIHBvcnQNCj4gPiAqIEZuLWxvY2sgbW9kZQ0KPiANCj4gTm90ZSBqdXN0IHRo
aW5raW5nIG91dCBsb3VkIGhlcmUuDQo+IA0KPiBJJ20gdGhpbmtpbmcgd2UganVzdCBuZWVkIGEg
bWVjaGFuaXNtIHRvIHNob3cgYSAidXNlciBub3RpZmljYXRpb24iLiBUaGlzDQo+IHdvdWxkDQo+
IGJlIGp1c3QgYSBwbGFpbiB0ZXh0IHN0cmluZyBwYXNzZWQgZnJvbSB0aGUga2VybmVsIHRvIHVz
ZXJzcGFjZS4gSSBndWVzcyB3ZQ0KPiBtYXkgYWxzbyB3YW50IHNvbWUgbWVjaGFuaXNtIHRvIGJ1
aWxkIChvbiB0aGUga2VybmVsIHNpZGUpIGEgc21hbGwgZmlsZQ0KPiB3aXRoIGFsbCBwb3NzaWJs
ZSBtZXNzYWdlcyBmb3IgdHJhbnNsYXRpb24gZnJvbSBVUyBFbmdsaXNoIHRvIG90aGVyDQo+IGxh
bmd1YWdlcy4NCg0KVGhlIHBhcnQgdGhhdCBmYWxscyBhcGFydCBoZXJlIGlzIHRoYXQgc29tZSBz
dHJpbmdzIGhhdmUgZHluYW1pYyBkYXRhIGFkZGVkIHRvDQp0aGVtLiAgRm9yIGV4YW1wbGUgaW4g
dGhlIGNhc2UgSSBzYWlkIHdyb25nIHBvd2VyIGFkYXB0ZXIgdGhlcmUgd2lsbCBiZSBzb21lIG51
bWJlcnMNCnB1dCBpbnRvIHRoZSBzdHJpbmcgYmFzZWQgb24gd2hhdCBjb21lcyBpbnRvIHRoZSBi
dWZmZXIuICBTbyBob3cgd2lsbCB5b3UgdHJhbnNsYXRlDQp0aGVzZT8NCg0KSSBndWVzcyB5b3Ug
Y2FuIGRyYXcgYSBsaW5lIGluIHRoZSBzYW5kIGFuZCBzYXkgYWxsIHN0cmluZ3MgdGhhdCBjYW4g
YmUgZW1pdHRlZCBtdXN0DQpiZSAic3RhdGljIGFuZCBnZW5lcmljIi4NCg0KPiANCj4gU28gdGhl
IGlkZWEgd291bGQgYmUgdGhhdCBlLmcuIGdub21lLXNoZWxsIGNhbiBsaXN0ZW4gZm9yIHRoZXNl
IGluIHNvbWUgd2F5DQo+IGFuZCB0aGVuIHNob3cgYSBub3RpZmljYXRpb24gaW4gaXRzIG5vdGlm
aWNhdGlvbiBtZWNoYW5pc20gd2l0aCB0aGUNCj4gbWVzc2FnZSwNCj4gbGlrZSBob3cgaXQgZG9l
cyBmb3Igd2hlbiBzb2Z0d2FyZSB1cGRhdGVzIGFyZSBhdmFpbGFibGUgZm9yIGV4YW1wbGUuDQo+
IA0KPiBJIHRoaW5rIHdlIGNhbiBtYWtlIHRoaXMgYXMgc2ltcGxlIGFzIHVzaW5nIHRoZSBub3Jt
YWwgcHJpbnRrIGJ1ZmZlciBmb3INCj4gdGhpcw0KPiBhbmQgcHJlZml4aW5nIHRoZSBtZXNzYWdl
cyB3aXRoICJVU0VSIE5PVElGWSIsIHdlIGFscmVhZHkgaGF2ZSBzb21lDQo+IG1lc3NhZ2VzDQo+
IGluIHRoZSBrZXJuZWwgd2hpY2ggd291bGQgcXVhbGlmeSBmb3IgdGhpcywgZS5nLiBpbiB0aGUg
VVNCIGNvcmUgd2UgaGF2ZToNCj4gDQo+ICAgICAgICAgICAgICAgICAgZGV2X2luZm8oJnVkZXYt
PmRldiwgIm5vdCBydW5uaW5nIGF0IHRvcCBzcGVlZDsgIg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgImNvbm5lY3QgdG8gYSBoaWdoIHNwZWVkIGh1YlxuIik7DQo+IA0KPiBUaGlzIG9uZSBp
cyBhYm91dCBVU0IxIHZzIFVTQjIgcG9ydHMsIGJ1dCB3ZSBoYXZlIGEgc2ltaWxhciBvbmUgc29t
ZXdoZXJlDQo+IGZvciBVU0IyIHZzIFVTQjMgcG9ydHMgKEkgdGhpbmspIHdoaWNoIHdvdWxkIGFs
c28gYmUgYW4gaW50ZXJlc3RpbmcgbWVzc2FnZQ0KPiB0byBhY3R1YWxseSBzaG93IHRvIHRoZSB1
c2VyIGluc2lkZSB0aGUgZGVza3RvcCBlbnZpcm9ubWVudC4NCj4gDQo+IFNvIHN0aWNraW5nIHdp
dGggdGhlIGFib3ZlIGV4YW1wbGUsIHdlIGNvdWxkIGNoYW5nZSB0aGF0IHRvDQo+IA0KPiAjZGVm
aW5lIFVTRVJfTk9USUZZICJVU0VSIE5PVElGWTogIg0KPiANCj4gZGV2X2luZm8oJnVkZXYtPmRl
diwgVVNFUl9OT1RJRlkgIm5vdCBydW5uaW5nIGF0IHRvcCBzcGVlZDsgY29ubmVjdCB0byBhDQo+
IGhpZ2ggc3BlZWQgaHViXG4iKTsNCj4gDQo+IEFuZCB0aGVuIHVzZXJzcGFjZSB3b3VsZCB0cmln
Z2VyIG9uIHRoZSAiVVNFUiBOT1RJRlk6ICIgcGFydCwga2VlcCB0aGUNCj4gYml0IGJlZm9yZSBp
dCAod2hpY2ggZGVzY3JpYmVzIHRoZSBkZXZpY2UpIGFzIGlzLCB0cnkgdG8gdHJhbnNsYXRlDQo+
IHRoZSB0ZXh0IGFmdGVyIGl0IGFuZCB0aGVuIGNvbWJpbmUgdGhlIHRleHQgYmVmb3JlIGl0ICsg
dGhlIHBvc3NpYmx5DQo+IHRyYW5zbGF0ZWQgdGV4dCBhZnRlciBpdCBhbmQgc2hvdyB0aGF0IGFz
IGEgbm90aWZpY2F0aW9uLg0KPiANCj4gVGhlIHJlYXNvbiBmb3IgKGFiKXVzaW5nIHRoZSBwcmlu
dGsgcmluZy1idWZmZXIgZm9yIHRoaXMgaXMgdGhhdA0KPiB3ZSB3aWxsIHN0aWxsIHdhbnQgdG8g
aGF2ZSB0aGVzZSBtZXNzYWdlcyBpbiBkbWVzZyB0b28gYW55d2F5cywNCj4gc28gd2h5IGFkZCBh
IG5ldyBtZWNoYW5pc20gYW5kIHNlbmQgdGhlIHNhbWUgbWVzc2FnZSB0d2ljZSBpZg0KPiB3ZSBj
YW4ganVzdCB0YWcgdGhlIG1lc3NhZ2VzIGluc2lkZSB0aGUgcHJpbnRrIHJpbmctYnVmZmVyID8N
Cj4gDQo+IE5vdGUgdGhlIGRldl9pbmZvIGFib3ZlIHdvdWxkIGxpa2VseSBiZSByZXBsYWNlZCB3
aXRoIHNvbWUgbmV3DQo+IGhlbHBlciB3aGljaCBhbHNvIGRvZXMgc29tZSBtYWdpYyB0byBoZWxw
IHdpdGggZ2F0aGVyaW5nIGENCj4gbGlzdCBvZiBzdHJpbmdzIHRvIHRyYW5zbGF0ZS4NCj4gDQo+
IEFnYWluIGp1c3QgdGhpbmtpbmcgb3V0IGxvdWQgaGVyZS4gSWYgYW55b25lIGhhcyBhbnkgaW5p
dGlhbA0KPiByZWFjdGlvbiB0byB0aGlzIHBsZWFzZSBsZXQgbWUga25vdy4uLg0KPiANCg0KQXMg
YSBnZW5lcmFsIGNvbW1lbnQsIEkgdGhpbmsgaXQgY2FwdHVyZXMgdmVyeSB3ZWxsIHRoZSBwb3Nz
aWJpbGl0eQ0KdGhhdCB0aGUga2VybmVsIGhhcyBtb3JlIGluZm9ybWF0aW9uIHRoYW4gdXNlcnNw
YWNlIGFib3V0IHRoZSBjaXJjdW1zdGFuY2VzDQpvZiBzb21ldGhpbmcgdGhhdCBhIHVzZXIgc2hv
dWxkIGJlIG5vdGlmaWVkLiAgRGVmaW5pdGVseSB0aGF0J3MgdGhlDQpjYXNlIGZvciB0aGVzZSBX
TUkvQUNQSSBldmVudHMsIGFuZCBJIHdvdWxkIHRoaW5rIHNpbWlsYXIgY2lyY3Vtc3RhbmNlcw0K
Y2FuIGFwcGx5IHRvIG90aGVyIHN1YnN5c3RlbSB0b28uDQoNCj4gUmVnYXJkcywNCj4gDQo+IEhh
bnMNCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gDQo+ID4NCj4gPj4+Pg0K
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFkgUGFyaXRjaGVyIDx5LmxpbnV4QHBhcml0Y2hlci5jb20+
DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsLXdtaS5jIHwg
MTcgKysrKysrKysrKysrKysrKysNCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYv
ZGVsbC13bWkuYw0KPiA+PiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2RlbGwtDQo+ID4+Pj4gd21p
LmMNCj4gPj4+PiBpbmRleCAwYjRmNzJmOTIzY2QuLmYzN2U3ZTkwOTNjMiAxMDA2NDQNCj4gPj4+
PiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9kZWxsLXdtaS5jDQo+ID4+Pj4gKysrIGIvZHJp
dmVycy9wbGF0Zm9ybS94ODYvZGVsbC13bWkuYw0KPiA+Pj4+IEBAIC0zMzQsNiArMzM0LDE0IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2V5X2VudHJ5DQo+ID4+Pj4gZGVsbF93bWlfa2V5bWFwX3R5
cGVfMDAxMVtdID0gew0KPiA+Pj4+ICAgCXsgS0VfSUdOT1JFLCBLQkRfTEVEX0FVVE9fMTAwX1RP
S0VOLCB7IEtFWV9SRVNFUlZFRCB9IH0sDQo+ID4+Pj4gICB9Ow0KPiA+Pj4+DQo+ID4+Pj4gKy8q
DQo+ID4+Pj4gKyAqIEtleW1hcCBmb3IgV01JIGV2ZW50cyBvZiB0eXBlIDB4MDAxMg0KPiA+Pj4+
ICsgKi8NCj4gPj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBrZXlfZW50cnkgZGVsbF93bWlfa2V5
bWFwX3R5cGVfMDAxMltdID0gew0KPiA+Pj4+ICsJLyogRm4tbG9jayBidXR0b24gcHJlc3NlZCAq
Lw0KPiA+Pj4+ICsJeyBLRV9JR05PUkUsIDB4ZTAzNSwgeyBLRVlfUkVTRVJWRUQgfSB9LA0KPiA+
Pj4+ICt9Ow0KPiA+Pj4+ICsNCj4gPj4+PiAgIHN0YXRpYyB2b2lkIGRlbGxfd21pX3Byb2Nlc3Nf
a2V5KHN0cnVjdCB3bWlfZGV2aWNlICp3ZGV2LCBpbnQgdHlwZSwNCj4gaW50DQo+ID4+Pj4gY29k
ZSkNCj4gPj4+PiAgIHsNCj4gPj4+PiAgIAlzdHJ1Y3QgZGVsbF93bWlfcHJpdiAqcHJpdiA9IGRl
dl9nZXRfZHJ2ZGF0YSgmd2Rldi0+ZGV2KTsNCj4gPj4+PiBAQCAtNDI1LDYgKzQzMyw3IEBAIHN0
YXRpYyB2b2lkIGRlbGxfd21pX25vdGlmeShzdHJ1Y3Qgd21pX2RldmljZQ0KPiAqd2RldiwNCj4g
Pj4+PiAgIAkJCWJyZWFrOw0KPiA+Pj4+ICAgCQljYXNlIDB4MDAxMDogLyogU2VxdWVuY2Ugb2Yg
a2V5cyBwcmVzc2VkICovDQo+ID4+Pj4gICAJCWNhc2UgMHgwMDExOiAvKiBTZXF1ZW5jZSBvZiBl
dmVudHMgb2NjdXJyZWQgKi8NCj4gPj4+PiArCQljYXNlIDB4MDAxMjogLyogU2VxdWVuY2Ugb2Yg
ZXZlbnRzIG9jY3VycmVkICovDQo+ID4+Pj4gICAJCQlmb3IgKGkgPSAyOyBpIDwgbGVuOyArK2kp
DQo+ID4+Pj4gICAJCQkJZGVsbF93bWlfcHJvY2Vzc19rZXkod2RldiwgYnVmZmVyX2VudHJ5WzFd
LA0KPiA+Pj4+ICAgCQkJCQkJICAgICBidWZmZXJfZW50cnlbaV0pOw0KPiA+Pj4+IEBAIC01NTYs
NiArNTY1LDcgQEAgc3RhdGljIGludCBkZWxsX3dtaV9pbnB1dF9zZXR1cChzdHJ1Y3Qgd21pX2Rl
dmljZQ0KPiA+Pj4+ICp3ZGV2KQ0KPiA+Pj4+ICAgCQkJIEFSUkFZX1NJWkUoZGVsbF93bWlfa2V5
bWFwX3R5cGVfMDAwMCkgKw0KPiA+Pj4+ICAgCQkJIEFSUkFZX1NJWkUoZGVsbF93bWlfa2V5bWFw
X3R5cGVfMDAxMCkgKw0KPiA+Pj4+ICAgCQkJIEFSUkFZX1NJWkUoZGVsbF93bWlfa2V5bWFwX3R5
cGVfMDAxMSkgKw0KPiA+Pj4+ICsJCQkgQVJSQVlfU0laRShkZWxsX3dtaV9rZXltYXBfdHlwZV8w
MDEyKSArDQo+ID4+Pj4gICAJCQkgMSwNCj4gPj4+PiAgIAkJCSBzaXplb2Yoc3RydWN0IGtleV9l
bnRyeSksIEdGUF9LRVJORUwpOw0KPiA+Pj4+ICAgCWlmICgha2V5bWFwKSB7DQo+ID4+Pj4gQEAg
LTYwMCw2ICs2MTAsMTMgQEAgc3RhdGljIGludCBkZWxsX3dtaV9pbnB1dF9zZXR1cChzdHJ1Y3Qg
d21pX2RldmljZQ0KPiA+Pj4+ICp3ZGV2KQ0KPiA+Pj4+ICAgCQlwb3MrKzsNCj4gPj4+PiAgIAl9
DQo+ID4+Pj4NCj4gPj4+PiArCS8qIEFwcGVuZCB0YWJsZSB3aXRoIGV2ZW50cyBvZiB0eXBlIDB4
MDAxMiAqLw0KPiA+Pj4+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGVsbF93bWlfa2V5
bWFwX3R5cGVfMDAxMik7IGkrKykgew0KPiA+Pj4+ICsJCWtleW1hcFtwb3NdID0gZGVsbF93bWlf
a2V5bWFwX3R5cGVfMDAxMltpXTsNCj4gPj4+PiArCQlrZXltYXBbcG9zXS5jb2RlIHw9ICgweDAw
MTIgPDwgMTYpOw0KPiA+Pj4+ICsJCXBvcysrOw0KPiA+Pj4+ICsJfQ0KPiA+Pj4+ICsNCj4gPj4+
PiAgIAkvKg0KPiA+Pj4+ICAgCSAqIE5vdyBhcHBlbmQgYWxzbyB0YWJsZSB3aXRoICJsZWdhY3ki
IGV2ZW50cyBvZiB0eXBlIDB4MDAwMC4NCj4gU29tZSBvZg0KPiA+Pj4+ICAgCSAqIHRoZW0gYXJl
IHJlcG9ydGVkIGFsc28gb24gbGFwdG9wcyB3aGljaCBoYXZlIHNjYW5jb2RlcyBpbiBETUkuDQo+
ID4+Pj4gLS0NCj4gPj4+PiAyLjI3LjANCj4gPj4+DQoNCg==
