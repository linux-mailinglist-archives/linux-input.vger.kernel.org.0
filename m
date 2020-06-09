Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8C61F4749
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 21:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389364AbgFITlh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 15:41:37 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:26360 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389350AbgFITlb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Jun 2020 15:41:31 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059JbPEW026700;
        Tue, 9 Jun 2020 15:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=T9irgzVCL7LJPLZqxd5NImvO9V7kKx0afgsKhA8gs4k=;
 b=uOh90i1BAfXCylHWQYysataPvYaeRSQPoQeKUgMJne9sl3xiMaz9XUw2DIaQ5lYNsjDl
 MjyKUirFkyIzPz4U1snqxKCyDY62Pe/JuhJjXnxKlQobV2QWbcQznY0rWjEDUrgPUG/7
 528ZBmcK1zBMHzFaRKwUD97po0fWgD5TmDT8RcWJ6cMfJXvqRGU16AdcJGPHJwZq4hPn
 Yxb6jqHfDkto3aXGlxcmMpBOSHxY1FbLEMIThQmKYvgdIw4WZpATu76KuMwCHBxajf0k
 4X82T6dGrgX7qKznA5U4n6N7+c6HrM/t8gTtK94bIDyz5rzKkagckz7AmOpkhdBqOP1X JA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 31g6yy2jht-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Jun 2020 15:41:22 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 059JX6ln167227;
        Tue, 9 Jun 2020 15:41:22 -0400
Received: from ausc60ps301.us.dell.com (ausc60ps301.us.dell.com [143.166.148.206])
        by mx0b-00154901.pphosted.com with ESMTP id 31g7xfxyqk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Jun 2020 15:41:22 -0400
X-LoopCount0: from 10.166.132.129
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; 
   d="scan'208";a="1450864496"
From:   <Mario.Limonciello@dell.com>
To:     <hdegoede@redhat.com>, <y.linux@paritcher.com>
CC:     <linux-kernel@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>, <mjg59@srcf.ucam.org>,
        <pali@kernel.org>, <linux-input@vger.kernel.org>
Subject: RE: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Thread-Topic: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Thread-Index: AQHWPUx5kZ6BCWcrZkepA13uOwTuTKjO2RsQgACifgD//7DjgIABQqkA///7V4CAAGDBgP//5M/A
Date:   Tue, 9 Jun 2020 19:41:20 +0000
Message-ID: <d9e3953bac9a4b4f8bf5b67add075368@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
 <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
 <79bd59ee-dd37-bdc5-f6b4-00f2c33fdcff@paritcher.com>
 <7f9f0410696141cfabb0237d33b7b529@AUSX13MPC105.AMER.DELL.COM>
 <137d8e69-a83f-6129-19e0-316ef0a51076@redhat.com>
 <ae45da27126d470888ef0d839665b9ed@AUSX13MPC105.AMER.DELL.COM>
 <10fcfbe7-cf2e-0911-334b-60be3336c990@redhat.com>
In-Reply-To: <10fcfbe7-cf2e-0911-334b-60be3336c990@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-06-09T19:41:19.0527934Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=7475ca18-8a64-4486-b09d-f0463db4b82f;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [143.166.24.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-09_13:2020-06-09,2020-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=963 cotscore=-2147483648 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006090148
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006090149
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiBSaWdodCwgdGhhdCBpcyB3aGF0IEkgd2FzIHRoaW5raW5nLCBhbHRob3VnaCBmb3IgdGhlIHBv
d2VyIGFkYXB0ZXIgY2FzZQ0KPiBJIHdhcyB0aGlua2luZyB0aGVyZSBhcmUgbm90IHNvIG11Y2gg
dmFyaWFudHMgc28gd2UgY2FuIGp1c3QgZG8NCj4gYSBjb3VwbGUgb2YgZml4ZWQgc3RyaW5ncyBm
b3IgdGhlIGNvbWJvcywgb3IgbWF5YmUganVzdCBzYXQgdGhhdA0KPiB0aGUgYWRhcHRlciBkb2Vz
IG5vdCBkZWxpdmVycyBlbm91Z2ggcG93ZXIgYW5kIHRoYXQgYXQgbWluaW11bSBYIHdhdHRzDQo+
IGlzIG5lY2Vzc2FyeSIgdGhlbiB3ZSBvbmx5IGhhdmUgMSB2YXJpYWJsZSBhbmQgd2UgY2FuIHBy
b2JhYmx5IGVhc2lseQ0KPiBkbyBmaXhlZCBzdHJpbmdzIGZvciB0aGUgZmV3IGNhc2VzIG9mIFgu
DQoNCkkgd291bGQgcmF0aGVyIGhhdmUgYSBnZW5lcmljIGZpeGVkIHN0cmluZyBvciBmaXhlZCBz
dHJpbmdzIHdpdGggYSBzaW5nbGUNCnRoYW4gYW4gYXJyYXkuICBCdXQgdGhlIHByb2JsZW0gdGhl
biBpcyB0aGF0IHRoZSBudW1iZXJzIGFyZSBub3QgZGlzY292ZXJhYmxlDQpmcm9tIGFueXdoZXJl
IGFuZCB3b3VsZCBuZWVkIHRvIGJlIGhhcmRjb2RlZC4gIFNvIGluIHRoYXQgcmVnYXJkIEkgdGhp
bmsgZ2VuZXJpYw0KZml4ZWQgc3RyaW5ncyBpcyB0aGUgb25seSB3YXkgdGhpcyBjYW4gd29yay4N
Cg0KPiANCj4gT3Igd2UgY291bGQgZ2V0IGZhbmN5IGFuZCBkbyBzb21lIGdlbmVyaWMgbm90aWZp
Y2F0aW9uIG1lY2hhbmlzbSBvdXRzaWRlDQo+IG9mIHByaW50ay9kbWVzZyB3aGVyZSB3ZSBwdXNo
IGEgZm9ybWF0IHN0cmluZyArIHBhcmFtZXRlcnMgdG8gdGhlIGZvcm1hdA0KPiBzdHJpbmcgdG8g
dXNlcnNwYWNlLiBTbyB0aGF0IHRoZSB0cmFuc2xhdGlvbiBjYW4gYmUgZG9uZSBvbiB0aGUgZm9y
bWF0DQo+IHN0cmluZyByYXRoZXIgdGhlbiBvbiB0aGUgZW5kIHJlc3VsdC4gSSdtIG5vdCBzdXJl
IHdlIG5lZWQgdG8gbWFrZSB0aGluZ3MNCj4gdGhhdCBjb21wbGljYXRlZCB0aG91Z2guDQo+IA0K
PiA+PiBTbyB0aGUgaWRlYSB3b3VsZCBiZSB0aGF0IGUuZy4gZ25vbWUtc2hlbGwgY2FuIGxpc3Rl
biBmb3IgdGhlc2UgaW4gc29tZQ0KPiB3YXkNCj4gPj4gYW5kIHRoZW4gc2hvdyBhIG5vdGlmaWNh
dGlvbiBpbiBpdHMgbm90aWZpY2F0aW9uIG1lY2hhbmlzbSB3aXRoIHRoZQ0KPiA+PiBtZXNzYWdl
LA0KPiA+PiBsaWtlIGhvdyBpdCBkb2VzIGZvciB3aGVuIHNvZnR3YXJlIHVwZGF0ZXMgYXJlIGF2
YWlsYWJsZSBmb3IgZXhhbXBsZS4NCj4gPj4NCj4gPj4gSSB0aGluayB3ZSBjYW4gbWFrZSB0aGlz
IGFzIHNpbXBsZSBhcyB1c2luZyB0aGUgbm9ybWFsIHByaW50ayBidWZmZXIgZm9yDQo+ID4+IHRo
aXMNCj4gPj4gYW5kIHByZWZpeGluZyB0aGUgbWVzc2FnZXMgd2l0aCAiVVNFUiBOT1RJRlkiLCB3
ZSBhbHJlYWR5IGhhdmUgc29tZQ0KPiA+PiBtZXNzYWdlcw0KPiA+PiBpbiB0aGUga2VybmVsIHdo
aWNoIHdvdWxkIHF1YWxpZnkgZm9yIHRoaXMsIGUuZy4gaW4gdGhlIFVTQiBjb3JlIHdlDQo+IGhh
dmU6DQo+ID4+DQo+ID4+ICAgICAgICAgICAgICAgICAgIGRldl9pbmZvKCZ1ZGV2LT5kZXYsICJu
b3QgcnVubmluZyBhdCB0b3Agc3BlZWQ7ICINCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAiY29ubmVjdCB0byBhIGhpZ2ggc3BlZWQgaHViXG4iKTsNCj4gPj4NCj4gPj4gVGhpcyBvbmUg
aXMgYWJvdXQgVVNCMSB2cyBVU0IyIHBvcnRzLCBidXQgd2UgaGF2ZSBhIHNpbWlsYXIgb25lDQo+
IHNvbWV3aGVyZQ0KPiA+PiBmb3IgVVNCMiB2cyBVU0IzIHBvcnRzIChJIHRoaW5rKSB3aGljaCB3
b3VsZCBhbHNvIGJlIGFuIGludGVyZXN0aW5nDQo+IG1lc3NhZ2UNCj4gPj4gdG8gYWN0dWFsbHkg
c2hvdyB0byB0aGUgdXNlciBpbnNpZGUgdGhlIGRlc2t0b3AgZW52aXJvbm1lbnQuDQo+ID4+DQo+
ID4+IFNvIHN0aWNraW5nIHdpdGggdGhlIGFib3ZlIGV4YW1wbGUsIHdlIGNvdWxkIGNoYW5nZSB0
aGF0IHRvDQo+ID4+DQo+ID4+ICNkZWZpbmUgVVNFUl9OT1RJRlkgIlVTRVIgTk9USUZZOiAiDQo+
ID4+DQo+ID4+IGRldl9pbmZvKCZ1ZGV2LT5kZXYsIFVTRVJfTk9USUZZICJub3QgcnVubmluZyBh
dCB0b3Agc3BlZWQ7IGNvbm5lY3QgdG8gYQ0KPiA+PiBoaWdoIHNwZWVkIGh1YlxuIik7DQo+ID4+
DQo+ID4+IEFuZCB0aGVuIHVzZXJzcGFjZSB3b3VsZCB0cmlnZ2VyIG9uIHRoZSAiVVNFUiBOT1RJ
Rlk6ICIgcGFydCwga2VlcCB0aGUNCj4gPj4gYml0IGJlZm9yZSBpdCAod2hpY2ggZGVzY3JpYmVz
IHRoZSBkZXZpY2UpIGFzIGlzLCB0cnkgdG8gdHJhbnNsYXRlDQo+ID4+IHRoZSB0ZXh0IGFmdGVy
IGl0IGFuZCB0aGVuIGNvbWJpbmUgdGhlIHRleHQgYmVmb3JlIGl0ICsgdGhlIHBvc3NpYmx5DQo+
ID4+IHRyYW5zbGF0ZWQgdGV4dCBhZnRlciBpdCBhbmQgc2hvdyB0aGF0IGFzIGEgbm90aWZpY2F0
aW9uLg0KPiA+Pg0KPiA+PiBUaGUgcmVhc29uIGZvciAoYWIpdXNpbmcgdGhlIHByaW50ayByaW5n
LWJ1ZmZlciBmb3IgdGhpcyBpcyB0aGF0DQo+ID4+IHdlIHdpbGwgc3RpbGwgd2FudCB0byBoYXZl
IHRoZXNlIG1lc3NhZ2VzIGluIGRtZXNnIHRvbyBhbnl3YXlzLA0KPiA+PiBzbyB3aHkgYWRkIGEg
bmV3IG1lY2hhbmlzbSBhbmQgc2VuZCB0aGUgc2FtZSBtZXNzYWdlIHR3aWNlIGlmDQo+ID4+IHdl
IGNhbiBqdXN0IHRhZyB0aGUgbWVzc2FnZXMgaW5zaWRlIHRoZSBwcmludGsgcmluZy1idWZmZXIg
Pw0KPiA+Pg0KPiA+PiBOb3RlIHRoZSBkZXZfaW5mbyBhYm92ZSB3b3VsZCBsaWtlbHkgYmUgcmVw
bGFjZWQgd2l0aCBzb21lIG5ldw0KPiA+PiBoZWxwZXIgd2hpY2ggYWxzbyBkb2VzIHNvbWUgbWFn
aWMgdG8gaGVscCB3aXRoIGdhdGhlcmluZyBhDQo+ID4+IGxpc3Qgb2Ygc3RyaW5ncyB0byB0cmFu
c2xhdGUuDQo+ID4+DQo+ID4+IEFnYWluIGp1c3QgdGhpbmtpbmcgb3V0IGxvdWQgaGVyZS4gSWYg
YW55b25lIGhhcyBhbnkgaW5pdGlhbA0KPiA+PiByZWFjdGlvbiB0byB0aGlzIHBsZWFzZSBsZXQg
bWUga25vdy4uLg0KPiA+Pg0KPiA+DQo+ID4gQXMgYSBnZW5lcmFsIGNvbW1lbnQsIEkgdGhpbmsg
aXQgY2FwdHVyZXMgdmVyeSB3ZWxsIHRoZSBwb3NzaWJpbGl0eQ0KPiA+IHRoYXQgdGhlIGtlcm5l
bCBoYXMgbW9yZSBpbmZvcm1hdGlvbiB0aGFuIHVzZXJzcGFjZSBhYm91dCB0aGUNCj4gY2lyY3Vt
c3RhbmNlcw0KPiA+IG9mIHNvbWV0aGluZyB0aGF0IGEgdXNlciBzaG91bGQgYmUgbm90aWZpZWQu
ICBEZWZpbml0ZWx5IHRoYXQncyB0aGUNCj4gPiBjYXNlIGZvciB0aGVzZSBXTUkvQUNQSSBldmVu
dHMsIGFuZCBJIHdvdWxkIHRoaW5rIHNpbWlsYXIgY2lyY3Vtc3RhbmNlcw0KPiA+IGNhbiBhcHBs
eSB0byBvdGhlciBzdWJzeXN0ZW0gdG9vLg0KPiANCj4gUmlnaHQsIHRoYXQgd2FzIG15IGlkZWEg
YmVoaW5kIGhhdmluZyBhIGdlbmVyaWMgbm90aWZpY2F0aW9uIG1lY2hhbmlzbS4NCj4gDQo+IFJl
Z2FyZHMsDQo+IA0KPiBIYW5zDQoNCg==
