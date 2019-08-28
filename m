Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C71A0320
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 15:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfH1NZg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 09:25:36 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:5682 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726440AbfH1NZg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 09:25:36 -0400
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7SDK58e016915;
        Wed, 28 Aug 2019 09:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=M4H2MeVozN6OSEVuKFagj5g9cUAem7017Zcwzvn7ORM=;
 b=tFZUT4SapLiU1PIflnKZ6scK0F+WxVCtjWfILgXIfKyKXC5qFzAlreVQAJg1F20pby7l
 MaF1LKeSdCWbD8YQzc85sMu5tk8OYP9t2Bg3ezIqmFhegwVs8XEPXcZkd5HHDPbnPuPt
 fKdqBPNo8F2pwjzJzrDM/T9HX6A62H90OvVEBXEA79cmDYYG4EVzIVFvms3l9nphNJNd
 ewjdcbXsep6uPg30JvmJb5l4cFG/d38zPI+yAeUwkW0llgL9D1osA/3KZLHYoVtEw1xc
 CMP1nmKughK6Dk+mvel9EWAA7D7UYW0i95C4AaZ6vYdnrdREY1QipgF/QftKI0ZwKe8V NA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 2uk2rb12fh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Aug 2019 09:25:34 -0400
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x7SDIbKM189580;
        Wed, 28 Aug 2019 09:25:33 -0400
Received: from ausxippc110.us.dell.com (AUSXIPPC110.us.dell.com [143.166.85.200])
        by mx0b-00154901.pphosted.com with ESMTP id 2un5xnhuc3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Aug 2019 09:25:33 -0400
X-LoopCount0: from 10.166.132.130
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; 
   d="scan'208";a="849141483"
From:   <Mario.Limonciello@dell.com>
To:     <kai.heng.feng@canonical.com>, <xiaojian.cao@cn.alps.com>
CC:     <masaki.ota@alpsalpine.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <naoki.saito@alpsalpine.com>
Subject: RE: Alps touchpad generates IRQ storm after S3
Thread-Topic: Alps touchpad generates IRQ storm after S3
Thread-Index: AQHVXWj6J4YtFH+tbUKrj18edFzHtKcQboCAgAAEigCAAAHfAIAAFVNg
Date:   Wed, 28 Aug 2019 13:25:31 +0000
Message-ID: <39b2e63e339447e8b09b2601abf3d1ba@AUSX13MPC101.AMER.DELL.COM>
References: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
 <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
 <TYXPR01MB1470902D804A47EE72013006C8A30@TYXPR01MB1470.jpnprd01.prod.outlook.com>
 <A118551C-A0D9-485F-91F7-44A5BE228B99@canonical.com>
In-Reply-To: <A118551C-A0D9-485F-91F7-44A5BE228B99@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-28T13:25:30.8198278Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-08-28_06:2019-08-28,2019-08-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 mlxlogscore=868 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908280143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 clxscore=1011 malwarescore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1908280143
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

S0gsDQoNCkp1c3QgbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBkZXRhaWxzLg0KDQo+IENvbW1pdCAi
SElEOiBpMmMtaGlkOiBEb24ndCByZXNldCBkZXZpY2UgdXBvbiBzeXN0ZW0gcmVzdW1lDQoNCklm
IHlvdSByZXZlcnQgdGhpcyBpdCdzIGZpeGVkIG9uIHRoaXMgc3lzdGVtPw0KDQpJbiB0aGF0IGNv
bW1pdCB5b3UgaGFkIG1lbnRpb25lZCBpZiB0aGlzIGNhdXNlcyBwcm9ibGVtcyBpdCBtaWdodCBi
ZSB3b3J0aA0KcXVpcmtpbmcganVzdCBSYXlkaXVtIGJ1dCBjb21taXQgYWZiYjExNjllZDViNThj
ZmNhMDE3ZTM2OGI1M2UwMTljZjI4NTg1Mw0KY29uZmlybWVkIHRoYXQgaXQgaGVscGVkIHNldmVy
YWwgb3RoZXIgc3lzdGVtcyB0b28uDQoNCklmIHRoZSBjb25jbHVzaW9uIGZyb20gdGhpcyBpbnZl
c3RpZ2F0aW9uIHRoaXMgaXMgb25seSBmaXhhYmxlIHZpYSB0b3VjaHBhZCBGVyB1cGRhdGUNCml0
IG1pZ2h0IGJlIHdvcnRoIHF1aXJraW5nIHRoaXMgdG91Y2hwYWQvdG91Y2hwYWQgRlcvc3lzdGVt
IGNvbWJpbmF0aW9uLg0KDQo+IEFsc28gQ2MgTWFyaW8gYmVjYXVzZSB0aGlzIGNvdWxkIHJlbGF0
ZSB0byBCSU9TLg0KDQpBbHNvIEkgYXNzdW1lIHRoaXMgaXMgb24gY3VycmVudCBzdGFibGUgQklP
Uy9FQyByZWxlYXNlLCByaWdodD8NCg0KVGhhbmtzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjgsIDIwMTkgMTo1OCBBTQ0KPiBUbzogWGlh
b2ppYW4gQ2FvDQo+IENjOiBNYXNha2kgT3RhOyBMaW1vbmNpZWxsbywgTWFyaW87IG9wZW4gbGlz
dDpISUQgQ09SRSBMQVlFUjsgTGludXggS2VybmVsDQo+IE1haWxpbmcgTGlzdDsgTmFva2kgU2Fp
dG8NCj4gU3ViamVjdDogUmU6IEFscHMgdG91Y2hwYWQgZ2VuZXJhdGVzIElSUSBzdG9ybSBhZnRl
ciBTMw0KPiANCj4gDQo+IFtFWFRFUk5BTCBFTUFJTF0NCj4gDQo+IEhpIFhpYW9qaWFuLA0KPiAN
Cj4gYXQgMTQ6NTEsIFhpYW9qaWFuIENhbyA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPiB3cm90
ZToNCj4gDQo+ID4gSGkgT3RhLXNhbiwNCj4gPg0KPiA+IE9LLCB3ZSB3aWxsIGxvb2sgaW50byBp
dC4NCj4gPg0KPiA+DQo+ID4gSGkgS2FpLUhlbmcsDQo+ID4NCj4gPiBXZSB3aWxsIHRyeSB0byBy
ZXByb2R1Y2UgdGhpcyBpc3N1ZSBmaXJzdCwgY291bGQgeW91IHBsZWFzZSB0ZWxsIG1lIHRoZQ0K
PiA+IHRhcmdldCBVYnVudHUgdmVyc2lvbj8NCj4gDQo+IEl04oCZcyBkaXN0cm8tYWdub3N0aWMs
IGFueSBkaXN0cm8gd2l0aCBtYWlubGluZSBMaW51eCBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZS4N
Cj4gDQo+IEthaS1IZW5nDQo+IA0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IEphc29uDQo+
ID4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IOWkqueUsCDnnJ/l
lpwgTWFzYWtpIE90YSA8bWFzYWtpLm90YUBhbHBzYWxwaW5lLmNvbT4NCj4gPiBTZW50OiBXZWRu
ZXNkYXksIEF1Z3VzdCAyOCwgMjAxOSAyOjM1IFBNDQo+ID4gVG86IOabuSDmm4nlu7ogWGlhb2pp
YW4gQ2FvIDx4aWFvamlhbi5jYW9AY24uYWxwcy5jb20+OyBLYWktSGVuZyBGZW5nDQo+ID4gPGth
aS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4NCj4gPiBDYzogTWFyaW8gTGltb25jaWVsbG8gPG1h
cmlvLmxpbW9uY2llbGxvQGRlbGwuY29tPjsgb3BlbiBsaXN0OkhJRCBDT1JFDQo+ID4gTEFZRVIg
PGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QN
Cj4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IOaWieiXpCDnm7TmqLkgTmFva2kg
U2FpdG8NCj4gPiA8bmFva2kuc2FpdG9AYWxwc2FscGluZS5jb20+DQo+ID4gU3ViamVjdDogUkU6
IEFscHMgdG91Y2hwYWQgZ2VuZXJhdGVzIElSUSBzdG9ybSBhZnRlciBTMw0KPiA+DQo+ID4gSGks
IEthaS1IZW5nLA0KPiA+DQo+ID4gU29ycnksIEknbSBub3QgaW4gY2hhcmdlIG9mIExpbnV4IHRh
c2sgbm93Lg0KPiA+DQo+ID4gSGksIFhpYW9KaWFuLA0KPiA+DQo+ID4gUGxlYXNlIGNoZWNrIHRo
ZSBmb2xsb3dpbmcgbWFpbC4NCj4gPiBJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb24sIHBsZWFzZSBh
c2sgS2FpLUhlbmcuDQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gTWFzYWtpIE90YQ0KPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogS2FpLUhlbmcgRmVuZyA8a2Fp
LmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI4
LCAyMDE5IDM6MjIgUE0NCj4gPiBUbzog5aSq55SwIOecn+WWnCBNYXNha2kgT3RhIDxtYXNha2ku
b3RhQGFscHNhbHBpbmUuY29tPg0KPiA+IENjOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGlt
b25jaWVsbG9AZGVsbC5jb20+OyBvcGVuIGxpc3Q6SElEIENPUkUNCj4gPiBMQVlFUiA8bGludXgt
aW5wdXRAdmdlci5rZXJuZWwub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdA0KPiA+IDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KPiA+IFN1YmplY3Q6IEFscHMgdG91Y2hwYWQg
Z2VuZXJhdGVzIElSUSBzdG9ybSBhZnRlciBTMw0KPiA+DQo+ID4gSGkgTWFzYWtpLA0KPiA+DQo+
ID4gVGhlIEFscHMgdG91Y2hwYWQgKDA0NEU6MTIyMCkgb24gRGVsbCBQcmVjaXNpb24gNzUzMCBj
YXVzZXMgSVJRIHN0b3JtDQo+ID4gYWZ0ZXIgc3lzdGVtIHN1c3BlbmQgKFMzKS4NCj4gPiBDb21t
aXQgIkhJRDogaTJjLWhpZDogRG9uJ3QgcmVzZXQgZGV2aWNlIHVwb24gc3lzdGVtIHJlc3VtZeKA
nSB3aGljaCBzb2x2ZXMNCj4gPiB0aGUgc2FtZSBpc3N1ZSBmb3Igb3RoZXIgdmVuZG9ycywgY2F1
c2UgdGhlIGlzc3VlIG9uIEFscHMgdG91Y2hwYWQuDQo+ID4gU28gSeKAmWQgbGlrZSB0byBrbm93
IHRoZSBjb3JyZWN0IGNvbW1hbmQgQWxwcyB0b3VjaHBhZCBleHBlY3RzIGFmdGVyDQo+ID4gc3lz
dGVtIHJlc3VtZS4NCj4gPg0KPiA+IEFsc28gQ2MgTWFyaW8gYmVjYXVzZSB0aGlzIGNvdWxkIHJl
bGF0ZSB0byBCSU9TLg0KPiA+DQo+ID4gS2FpLUhlbmcNCj4gDQoNCg==
