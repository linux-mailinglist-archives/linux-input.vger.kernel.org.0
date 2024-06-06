Return-Path: <linux-input+bounces-4171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EF58FF11E
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 17:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1A301F24A1B
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 15:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14DF198858;
	Thu,  6 Jun 2024 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="dlg4ab1r"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614319883C;
	Thu,  6 Jun 2024 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717688843; cv=none; b=ruUltO+cBl5Rt5NpaCDB/uNL0XdOxP5reFn7uwa9hT5+m6jBBmMBl9my5faZ2SfT0wJN2N+xZ8QSY+0OWltG5epbXGanRqUG3GeLc7CRZL77GoSXxVxp/uDTl0qS/i0Jh8Ucexebix7h62YXEN23PYF2jrOFATymwxWrCegDnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717688843; c=relaxed/simple;
	bh=nZJ9eKkbz9CtT9LG4MjPbjUib+gu8tJbVllu7/uan10=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PoN3D8YKbAKDMCKC3qmBH5g7SZF0f7dfHgpDzOcS5iD9FHJTPcYCf1YXDePfMLMvhB1A7EXRGn0p0h2jxY7oGE/2ZaD5XcyMFtXF6XrVrUjZ+Mz991AqI6xYYTYwLuNB1YWPlP+M5UXYhHv7lElukaZQcKE5SiVUbSbfk/eJrGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=dlg4ab1r; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456CCjIF015214;
	Thu, 6 Jun 2024 10:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pps1; bh=nZJ9eKkbz9CtT9LG4MjPbjUib+gu8tJbVllu7/uan10=; b=dlg4ab1
	r3qj922yQRxUey5MzWyHohXveJGBmJcph/t/5hb90irj9sfkgyDJtDSRH5MNh+w3
	Ea7YEyUCRPLEsH6RMINVnV7Qt1VlomAo6QI3UvxgeGb0RZiI/0aankxIQrnesMYP
	Gv570G3s6E/3rqH8NDFDKH26dGnXaED48ogJaU9fZwmrJrOWkSXCr/V/8f0ChghN
	XdH6LHGHBmh3mvedhfxgFjWZw8GQgItAPkxfSR0hxaDmPHJv+hIXzUCkq6McSxS+
	0ZbMJuLB13j/0nAuIZ0uY/xIa14KAsbVKU3WJ6gEKKPbl6DgI0ltl7gasrxw6Wh7
	mnkvQfLsk32Mamw==
Received: from gcc-mail-mx-004.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3ykcwv8jse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 06 Jun 2024 10:12:05 -0500 (CDT)
Received: from gcc-mail-mx-003.Na.Plexus.com (10.255.51.222) by
 gcc-mail-mx-004.na.plexus.com (10.255.51.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 6 Jun 2024 15:12:04 +0000
Received: from gcc-mail-mx-003.Na.Plexus.com ([10.255.51.222]) by
 gcc-mail-mx-003.na.plexus.com ([10.255.51.222]) with mapi id 15.01.2507.037;
 Thu, 6 Jun 2024 15:12:03 +0000
From: Danny Kaehn <Danny.Kaehn@plexus.com>
To: "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "bentiss@kernel.org" <bentiss@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "bartosz.golaszewski@linaro.org"
	<bartosz.golaszewski@linaro.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com"
	<dmitry.torokhov@gmail.com>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Thread-Topic: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Thread-Index: AQHat56UThrpG8Y4kkS6ZQ8gIObWW7G6RkYAgACR7IA=
Date: Thu, 6 Jun 2024 15:12:03 +0000
Message-ID: <52de7f01a8d0cefbc9ad828d3d93f16ba0d0201c.camel@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
	 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
	 <e183c4ab-e48e-4c9f-be31-13b16ad466b6@kernel.org>
In-Reply-To: <e183c4ab-e48e-4c9f-be31-13b16ad466b6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0C048B2B20C59418FCA8CF3CDCFE188@plexus.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: lWIead_DJSk7YDIUs49X6pq4rK9QKqfV
X-Proofpoint-ORIG-GUID: lWIead_DJSk7YDIUs49X6pq4rK9QKqfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=842 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060108

T24gVGh1LCAyMDI0LTA2LTA2IGF0IDA4OjI4ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBQTEVYVVMgU0VDVVJJVFkgV0FSTklORw0KPiBZb3UgaGF2ZSBub3QgcHJldmlvdXNs
eSBjb3JyZXNwb25kZWQgd2l0aCB0aGlzIHNlbmRlci4gICAgICAgDQo+IE9uIDA2LzA2LzIwMjQg
MDE6MTIsIERhbm55IEthZWhuIHdyb3RlOg0KPiA+IFRoaXMgaXMgYSBVU0IgSElEIGRldmljZSB3
aGljaCBpbmNsdWRlcyBhbiBJMkMgY29udHJvbGxlciBhbmQgOA0KPiBHUElPIHBpbnMuDQo+ID4g
DQo+ID4gVGhlIGJpbmRpbmcgYWxsb3dzIGRlc2NyaWJpbmcgdGhlIGNoaXAncyBncGlvIGFuZCBp
MmMgY29udHJvbGxlciBpbg0KPiBEVA0KPiA+IHVzaW5nIHRoZSBzdWJub2RlcyBuYW1lZCAiZ3Bp
byIgYW5kICJpMmMiLCByZXNwZWN0aXZlbHkuIFRoaXMgaXMNCj4gPiBpbnRlbmRlZCB0byBiZSB1
c2VkIGluIGNvbmZpZ3VyYXRpb25zIHdoZXJlIHRoZSBDUDIxMTIgaXMNCj4gcGVybWFuZW50bHkN
Cj4gPiBjb25uZWN0ZWQgaW4gaGFyZHdhcmUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRGFu
bnkgS2FlaG4gPGRhbm55LmthZWhuQHBsZXh1cy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9zaWxhYnMsY3AyMTEyLnlhbWwgICAgIHwgMTA1DQo+ICsrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA1IGluc2VydGlvbnMoKykN
Cj4gDQo+IFNvIHRoaXMgaXMgdjExIGJ1dCB3YXMgbmV2ZXIgdGVzdGVkPw0KDQpNeSBhcG9sb2dp
ZXMgLS0gaW5pdGlhbGx5IGBEVF9TQ0hFTUFfRklMRVM9c2lsYWJzLGNwMjExMi55YW1sIG1ha2UN
CmR0X2JpbmRpbmdfY2hlY2tgIHdhcyBjb21wbGV0aW5nIHdpdGhvdXQgYW55IG91dHB1dCAoYW5k
IEkgYXNzdW1lZA0Kc3VjY2VzcyksIGJ1dCBhZnRlciBhIGNsZWFuLCBJIGdldCBtYWtlIGVycm9y
cywgZWl0aGVyIHJlbGF0aW5nIHRvICJubw0KcnVsZSB0byBtYWtlIC4uLiAqLmV4YW1wbGUuZHRi
Iiwgb3IgeWFtbGxpbnQgdXNhZ2UgZXJyb3JzLiBIYXZlIHRyaWVkDQp1cGRhdGluZyBkdHNjaGVt
YSBhbmQvb3IgcmVpbnN0YWxsaW5nLCBhbmQgYWxzbyBzdGFydGVkIGZyb20gc2NyYXRjaCBvbg0K
YSBkaWZmZXJlbnQgc3lzdGVtIHdpdGggdGhlIHNhbWUgaXNzdWVzLiBJIHdpbGwgZ2V0IHRoaXMg
d29ya2luZyBhbmQNCnJ1biB0aGlzIGJlZm9yZSBzdWJtaXR0aW5nIGFkZGl0aW9uYWwgcmV2aXNp
b25zLCBhcG9sb2dpZXMgYWdhaW4hDQooYW5kIEkgd2lsbCBvZiBjb3Vyc2UgZml4IHRoZSBpc3N1
ZSByZXBvcnRlZCBieSB0aGUgYm90KQ0KPiANCj4gQ2hhbmdlbG9nIGRvZXMgbm90IGhlbHAgbWUg
dW5kZXJzdGFuZGluZyB3aGF0IGhhcHBlbmVkIHdpdGggdGhpcw0KPiBiaW5kaW5nLi4uDQoNCkkn
bGwga2VlcCBpbiBtaW5kIGJldHRlciBzcGVjaWZ5aW5nIGNoYW5nZXMgdG8gdGhlIGJpbmRpbmcg
aW4gdGhlDQpjaGFuZ2Vsb2chDQoNClNpbmNlIHY2LCB3aGVyZSBSb2IgYWRkZWQgaGlzIHJldmll
dyB0YWcgWzFdLCB0aGUgb25seSBjaGFuZ2VzIHdlcmUNCmVsaW1pbmF0aW5nIHRoZSBncGlvIHN1
Ym5vZGUgYW5kIGNvbWJpbmluZyBpdCB3aXRoIHRoZSBwYXJlbnQsIGFuZA0KdXBkYXRpbmcgbXkg
ZW1haWwgYWRkcmVzcy4NCg0KU2luY2UgdjQsIHdoZXJlIHlvdSBoYWQgYWRkZWQgeW91ciByZXZp
ZXcgdGFnIFsyXSwgSSBhZGRyZXNzZWQgUm9iJ3MNCmNvbW1lbnRzIGluIFszXSwgaW5jbHVkaW5n
Og0KLSBSZW1vdmluZyB0aGUgbmdwaW9zIHByb3BlcnR5DQotIENvbnN0cmFpbmluZyB0aGUgaG9n
IHBhdHRlcm4gbW9yZSB0byBhIHNpbmdsZSBuYW1pbmcgc2NoZW1lDQotIFJlbW92aW5nIHVubmVl
ZGVkIHByb3BlcnRpZXMgZnJvbSB0aGUgaG9nIHdoaWNoIGFyZSBwcm92aWRlZCBieSB0aGUNCnBh
cmVudCBzY2hlbWENCi0gQWRkaW5nIGFuIGV4YW1wbGUgb2YgdGhlIGhvZyB0byB0ZXN0IHRoZSBz
Y2hlbWENCg0KQWRkaXRpb25hbGx5LCBJIGFkZGVkIHNkYS1ncGlvcyBhbmQgc2NsLWdwaW9zIHRv
IHRoZSBpMmMgbm9kZSBhcyB3ZWxsDQphcyB1c2FnZSBvZiBpdCBpbiB0aGUgZXhhbXBsZSBkdHMu
IFRoaXMgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBmb3IgYnVzDQpyZWNvdmVyeSBHUElPcyAobm90
IHlldCBpbmNsdWRlZCBpbiB0aGUga2VybmVsIGRyaXZlcnMpDQoNClsxXTogDQpodHRwczovL3Bh
dGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIz
MDIxNzE4NDkwNC4xMjkwLTIta2FlaG5kYW5AZ21haWwuY29tLw0KDQpbMl06IA0KaHR0cHM6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAy
MzAyMDYxMzUwMTYuNjczNy0yLWthZWhuZGFuQGdtYWlsLmNvbS8NCg0KWzNdOiANCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIw
MjMwMjA1MTQ1NDUwLjMzOTYtMi1rYWVobmRhbkBnbWFpbC5jb20vIzMwNTE5MzINCg0KVGhhbmtz
LA0KDQpEYW5ueSBLYWVobg0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0K

