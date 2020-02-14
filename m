Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3E915D8C6
	for <lists+linux-input@lfdr.de>; Fri, 14 Feb 2020 14:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgBNNvQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Feb 2020 08:51:16 -0500
Received: from alln-iport-7.cisco.com ([173.37.142.94]:8766 "EHLO
        alln-iport-7.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbgBNNvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Feb 2020 08:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13704; q=dns/txt;
  s=iport; t=1581688275; x=1582897875;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yj8UAfFH7l+Q6wSKVhHakDXSE3nxNv66umDJC5oxbus=;
  b=HDC70S/vBDCPMSB978bZ5G18CLLBkR0LYrkxYWJ2TZwJrKmRSGXhsnsf
   YV/BXSfh0fOxAZJFkiI70VJeGBDcTJYMUT8TX9RSYCNyPNMgRiGXI85YG
   B5QvH9shaJP76zlfjrRe+az6CPTZQKEdivMPTWIGh3npj8/ppDJoqTKXQ
   s=;
IronPort-PHdr: =?us-ascii?q?9a23=3ACPE8UBGvmIUOIQolyErx8Z1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+efzpaDYhGslZfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AUAADlpEZe/5JdJa1mGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYFpAwEBAQELAYFTUAVsWCAECyqEFINGA4p4gl+?=
 =?us-ascii?q?JYoo1g3qBLhSBEANUCQEBAQwBAScGAgQBAYN7RQIXgWokNgcOAgMNAQEFAQE?=
 =?us-ascii?q?BAgEFBG2FNwyFZgEBAQECARIRBA0MAQEmBQwBBAsCAQgYAgImAgICHxEVEAI?=
 =?us-ascii?q?EDgUbB4MEAYJKAw4gAQIMolcCgTmIYnV/M4J/AQEFgS8Bg38NC4IMCYEOKgG?=
 =?us-ascii?q?MIxqBQT+BESeCbD5pgTJJBBqBFAESASEXgnmCXo1eBhoZgkaIMJYtRAqCOod?=
 =?us-ascii?q?NilSEKgYcgkmIFIRKi3EtlymCKpAWAgQCBAUCDgEBBYFZATFncXAVgycJCj0?=
 =?us-ascii?q?YDY4dDBeDUIUUhT90AgEBBwSBGox9gjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,440,1574121600"; 
   d="scan'208";a="428778338"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 14 Feb 2020 13:51:13 +0000
Received: from XCH-RCD-002.cisco.com (xch-rcd-002.cisco.com [173.37.102.12])
        by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 01EDpDCh011199
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Fri, 14 Feb 2020 13:51:13 GMT
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by XCH-RCD-002.cisco.com
 (173.37.102.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 07:51:13 -0600
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-rtp-002.cisco.com
 (64.101.210.229) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 08:51:11 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 14 Feb 2020 07:51:11 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Noi+34c9t4z4yDv7Lz/HYxez/q5MKlMgWPdUli0gYMy2hvw7kA0J22Yjot8JE15ekSVSQ2zK4oor76E/BLP0k37gPCpLK0K+VSiqxQpx4bNntRmMoFRFvH1BfjNx1azFTq67qRZXZ/8MQ+UNBJpKOmfyd9fFWIhtDAFjc5AFlgJuiK+1UPQKDpGSc1eIYbVMhy39GZtK0C/EEunYeucRUCKMF2LiCdHt/IgfMLkrKDz9eUKnnYWq2M8QxpeJYC95HSwl3Cq06wmvabj7YabM9lh6MMlvy7p4pMgbrCGbdmreY0ZWaXYXBNK1AW6Aob6kThdm8NEb8pjVYr0MjohW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj8UAfFH7l+Q6wSKVhHakDXSE3nxNv66umDJC5oxbus=;
 b=haly2EAUkf6wUVzMVHZ5HqmT6V1eoHvW3oShPogOreuew8Xy68CZCvzvq/TxnsGvPvINh8ibB1eC0wF55WR4jJbyirUqurF18FvZckcFeXtEbBt8bjx7muRfN6wxt1aT6XbK/t7dTr/BxLKmZ+9LGZHasOj+wGt0X0WtYdaSlbw39pGh6bSNQXdzCoGgJFGm5fESNkddp7qQn/T1RJ1azjv4DuXQSvJSudaT8Yhxx/H56MqMk/Tqn5RjfcNhfNeB0fpvoKgHxTp6qcPaweWhrocqnGkwptqRMTMksyJSaWgbUvpL1o09n1Uce3mpEWarcm5gllalGeQQ99dBLgnz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj8UAfFH7l+Q6wSKVhHakDXSE3nxNv66umDJC5oxbus=;
 b=wNhQ5QGO6v1Ks+c6HLp1j1pf5hrJC52kz7XslFRbfg9wPcTZRvoB5tR1yrkfvM+KvS0x1j/n+9ol+sZxBwv721CgoVHYim3W+pdjZ17IyRSwiF8sQlpJ2HWTe8oSBnwg9GX4Xg4bCwbzcwRDEVVB0CcFtyNJ913DBsR9onKkwbA=
Received: from DM6PR11MB2986.namprd11.prod.outlook.com (20.177.216.79) by
 DM6PR11MB4138.namprd11.prod.outlook.com (20.176.126.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 14 Feb 2020 13:51:10 +0000
Received: from DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e]) by DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e%6]) with mapi id 15.20.2729.025; Fri, 14 Feb 2020
 13:51:10 +0000
From:   "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     js <sym.i.nem@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Armando Visconti <armando.visconti@st.com>
Subject: Re: [PATCH v2] HID: truncate hid reports exceeding
 HID_MAX_BUFFER_SIZE
Thread-Topic: [PATCH v2] HID: truncate hid reports exceeding
 HID_MAX_BUFFER_SIZE
Thread-Index: AQHV21bW96a5CLcTuU+d/r/+DJ/0lqgLRQ2AgA9NJ4CAADK9gA==
Date:   Fri, 14 Feb 2020 13:51:10 +0000
Message-ID: <5d60a963-c2f7-8c64-61f0-a69ccaeefce3@cisco.com>
References: <CAKsRvPOyPqxLaUx+gemCARq+gVeOO94iqyVMWspUEKXk==_wZg@mail.gmail.com>
 <7c767187-38a2-f3a7-faef-8e3d445607d9@cisco.com>
 <CAO-hwJJsaB3XK631OMvTiPHz8MTHpCfj0zX98+6EpkbD5W2dQQ@mail.gmail.com>
In-Reply-To: <CAO-hwJJsaB3XK631OMvTiPHz8MTHpCfj0zX98+6EpkbD5W2dQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
x-originating-ip: [2001:420:44c1:2576:5a2f:415d:31e3:2554]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb0ef2b9-d88a-453b-93d2-08d7b154f2a5
x-ms-traffictypediagnostic: DM6PR11MB4138:
x-microsoft-antispam-prvs: <DM6PR11MB4138FC2BB3268F419A7D95F0D7150@DM6PR11MB4138.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03137AC81E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(189003)(199004)(31696002)(186003)(2616005)(316002)(66446008)(86362001)(66476007)(66556008)(54906003)(53546011)(6506007)(91956017)(76116006)(64756008)(71200400001)(66946007)(2906002)(8936002)(966005)(45080400002)(6512007)(6486002)(31686004)(5660300002)(6916009)(81156014)(4326008)(8676002)(36756003)(478600001)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB4138;H:DM6PR11MB2986.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pHUEWLVyprKn02or147msXr+aWfr2Mi8Fw1550HbKTHmh47ps5qABTYv9RWIrXN9Q8ZijdA02byQGVDEi99PBQrbFQbxTnDZPEbvr4f6JliYuLa31cG7FHaey3u+ylzkW4KwsvpkD2KbCJOOyeySwBNtW0SeCRzGUvbHiu7yiUx+xEL3OV0GKE407B6Dyh+OY/TLkpmxasdxwggNWUkHKhWZFECM7ump1ZfMM9AMgWNo7yOnxDp6YhKMeRkiQ0GQf8i2k7SvLezo9GkwHPKceQ9gyGn9Sedsq/eB3dZaL3reLGwVGmnmrzb0bkZRIUMI7O63dkhFzVMRsMjoeArLQBWrUf5YhOQ0GR6xoAgLH1TSIZ/F0R3Q4T8ObRbBwCFMYF4Yf83wGIlmhclJj5LXjBmm4u10JYG/uKYMuOPYygwRrimdQvt528Rv2tCHpP8z+aF6wN0vC8fcoF5wwxEW8DiN0WZyeSr5qeF18P+9Jdb6VBRBHieC12UCycyHqd6u4tBQeeZ98iieilsOtu/BUQ==
x-ms-exchange-antispam-messagedata: YCq6BKeljlZixYgGJMwhqP/jQsxRkYcQ1OdUnZjul1GMa1+uWRf3SkZI7cWELT67rMcenbc/DS5AV2WJ2zMvFSxgRmrO7yV75rk/0+v3A18wRrUo0ny84xBbmATfXOX13lI6abb37+h1ynKp6015I9FIcT2ji+IPzRAJg4x3KxJ9icu/eQPs0UbR94B8qflYabBBl0y69D+CrAnxM463SA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD26DC5C1EB4C343A61798C808E10997@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0ef2b9-d88a-453b-93d2-08d7b154f2a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2020 13:51:10.1252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 165MCNeAaqlFeSBkE/GMoQ4FIL1A/KbJNe/RkWNSL9y2xkBBeCBIgwU7tal6ipuvHeKntAMjX9jkKyrABnN9WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4138
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.12, xch-rcd-002.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gMi8xNC8yMCAxMTo0OSBBTSwgQmVuamFtaW4gVGlzc29pcmVzIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiA0LCAyMDIwIGF0IDY6MTAgUE0gSm9oYW4gS29yc25lcyAoamtvcnNuZXMpDQo+IDxqa29y
c25lc0BjaXNjby5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDIvNC8yMCAxOjI4IFBNLCBqcyB3cm90
ZToNCj4+PiBDb21taXQgOGVjMzIxZTk2ZTA1ICgiSElEOiBGaXggc2xhYi1vdXQtb2YtYm91bmRz
IHJlYWQgaW4NCj4+PiBoaWRfZmllbGRfZXh0cmFjdCIpIGludHJvZHVjZWQgYSByZWdyZXNzaW9u
IGJ1ZyB0aGF0IGJyb2tlDQo+Pj4gaGFyZHdhcmUgcHJvYmVzIHdoaWNoIHJlcXVlc3QgbGFyZ2Ug
cmVwb3J0IHNpemVzLg0KPj4+DQo+Pj4gQW4gZXhhbXBsZSBvZiB0aGlzIGhhcmR3YXJlIGlzIHRo
ZSBFTE9OOTAzOCBkaWdpdGl6ZXIgb24gdGhlDQo+Pj4gTWljcm9zb2Z0IFN1cmZhY2UgR28gYXMg
cGVyIGJ1ZyBpZCAyMDYyNTkuDQo+Pj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3df
YnVnLmNnaT9pZD0yMDYyNTkNCj4+Pg0KPj4+IFRvIGVsaW1pbmF0ZSB0aGUgcmVncmVzc2lvbiwg
cmV0dXJuIDAgaW5zdGVhZCBvZiAtMSB3aGVuIGENCj4+PiBsYXJnZSByZXBvcnQgc2l6ZSBpcyBy
ZXF1ZXN0ZWQsIGFsbG93aW5nIHRoZSBoYXJkd2FyZSB0bw0KPj4+IHByb2JlIHByb3Blcmx5IHdo
aWxlIHNpemUgZXJyb3IgaXMgb3V0cHV0IHRvIGtlcm5lbCBsb2cuDQo+Pj4NCj4+PiBDb21taXQg
OGVjMzIxZTk2ZTA1IGRvZXMgbm90IGVuZm9yY2UgYnVmZmVyIHNpemUgbGltaXRhdGlvbg0KPj4+
IG9uIHRoZSBzaXplIG9mIHRoZSBpbmNvbWluZyByZXBvcnQuDQo+Pj4gQWRkZWQgZW5mb3JjZW1l
bnQgYnkgdHJ1bmNhdGlvbiB0byBwcmV2ZW50IGJ1ZmZlciBvdmVyZmxvdyBpbg0KPj4+IGhpZF9y
ZXBvcnRfcmF3X2V2ZW50KCkuDQo+Pj4NCj4+PiBGaXhlczogOGVjMzIxZTk2ZTA1ICgiSElEOiBG
aXggc2xhYi1vdXQtb2YtYm91bmRzIHJlYWQgaW4gaGlkX2ZpZWxkX2V4dHJhY3QiKQ0KPj4+IFJl
cG9ydGVkLWFuZC10ZXN0ZWQtYnk6IEphbWVzIFNtaXRoIDxzeW0uaS5uZW1AZ21haWwuY29tPg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFNtaXRoIDxzeW0uaS5uZW1AZ21haWwuY29tPg0KPj4+
IENjOiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pg0KPj4+IENjOiBBcm1h
bmRvIFZpc2NvbnRpIDxhcm1hbmRvLnZpc2NvbnRpQHN0LmNvbT4NCj4+PiBDYzogSmlyaSBLb3Np
bmEgPGprb3NpbmFAc3VzZS5jej4NCj4+PiBDYzogSm9oYW4gS29yc25lcyA8amtvcnNuZXNAY2lz
Y28uY29tPg0KPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+Pj4gLS0tDQo+Pj4gU29y
cnkgYWJvdXQgbXkgZWFybGllciBlbWFpbCwgSSdtIG5ldyB0byB0aGlzIGZvcnVtIGFuZCBhbSBz
dGlsbA0KPj4+IGxlYXJuaW5nIHRoZSBjb252ZW50aW9ucy4NCj4+Pg0KPj4+IEF0IHlvdXIgc3Vn
Z2VzdGlvbiwgSSBleGFtaW5lZCB0aGUgY29kZSBtb3JlIGNhcmVmdWxseSBhbmQgSSB0aGluaw0K
Pj4+IHRoYXQgdGhlIHByZXZpb3VzIHBhdGNoIChjb21taXQgOGVjMzIxZTk2ZTA1KSBkaWQgbm90
IHNvbHZlIHRoZSBidWZmZXINCj4+PiBvdmVyZmxvdyBhdCBhbGwsIGl0IGp1c3Qga2lsbGVkIGEg
dHJhbmNoZSBvZiBoYXJkd2FyZSBvZiB1bmtub3duIHNpemUNCj4+PiB3aGljaCByZXF1ZXN0cyBy
ZXBvcnQgc2l6ZXMgZXhjZWVkaW5nIDRLLg0KPj4+DQo+Pj4gVGhlIHByb2JsZW0sIGFuZCB3aHkg
dGhlIHByZXZpb3VzIHBhdGNoIGRpZG4ndCByZWFsbHkgYWRkcmVzcyB0aGUNCj4+PiBpc3N1ZSwg
aXMgdGhhdCB0aGUgZW5mb3JjZW1lbnQgb2NjdXJzIGF0IGEgZGVjbGFyYXRpdmUgcG9pbnQgaW4g
dGhlDQo+Pj4gY29kZSwgd2hpY2ggaXMgdG8gc2F5LCB0aGUgZGV2aWNlIGlzIGp1c3QgZGVzY3Jp
YmluZyBpdHNlbGYsIGl0IGlzIG5vdA0KPj4+IGFjdHVhbGx5IHJlcXVlc3RpbmcgbWVtb3J5IG9y
IGdlbmVyYXRpbmcgYSByZXBvcnQuIEEgbWFsaWNpb3VzIGRldmljZQ0KPj4+IGNvdWxkIGVhc2ls
eSBkZXNjcmliZSBpdHNlbGYgaW5jb3JyZWN0bHkgdGhlbiBnZW5lcmF0ZSBhIHJlcG9ydA0KPj4+
IGV4Y2VlZGluZyBib3RoIHRoZSBzaXplIGl0IGluZGljYXRlZCBpbiBoaWRfYWRkX2ZpZWxkKCkg
YW5kDQo+Pj4gSElEX01BWF9CVUZGRVJfU0laRSwgb3ZlcmZsb3dpbmcgdGhlIGJ1ZmZlciBhbmQg
Y2F1c2luZyB1bmludGVuZGVkDQo+Pj4gYmVoYXZpb3IuDQo+Pj4NCj4+PiBUaGUgY29ycmVjdCBw
b2ludCB0byBlbmZvcmNlIGEgYnVmZmVyIHNpemUgY29uc3RyYWludCBpcyB0aGUgcG9pbnQNCj4+
PiB3aGVyZSB0aGUgcmVwb3J0IGlzIHRha2VuIGZyb20gdGhlIGRldmljZSBhbmQgY29waWVkIGlu
dG8gdGhlIGhpZA0KPj4+IGhhbmRsaW5nIGxheWVyLiBGcm9tIG15IGV4YW1pbmF0aW9uIG9mIHRo
ZSBjb2RlLCB0aGlzIHNlZW1zIHRvIGJlIGluDQo+Pj4gaGlkX3JlcG9ydF9yYXdfZXZlbnQoKS4g
VGh1cywgSSBwbGFjZWQgYW4gZW5mb3JjZW1lbnQgY29uc3RyYWludCBvbg0KPj4+IHRoZSByZXBv
cnQgc2l6ZSBpbiB0aGF0IG1ldGhvZCwgdG9vayBvdXQgdGhlIGVuZm9yY2VtZW50IGNvbnN0cmFp
bnQgaW4NCj4+PiBoaWRfYWRkX2ZpZWxkKCksIGJlY2F1c2UgaXQgd2FzIGNhdXNpbmcgYSBoYXJk
d2FyZSByZWdyZXNzaW9uIGFuZCBub3QNCj4+PiBwcm9wZXJseSBlbmZvcmNpbmcgdGhlIGJvdW5k
YXJ5IGNvbnN0cmFpbnQsIGFuZCBhZGRlZCB1c2VyLWZhY2luZw0KPj4+IHdhcm5pbmdzIHRvIG5v
dGlmeSB3aGVuIGhhcmR3YXJlIGlzIGdvaW5nIHRvIGJlIGFmZmVjdGVkIGJ5IHRoZQ0KPj4+IGlu
dHJvZHVjZWQgYm91bmRhcnkgY29uc3RyYWludHMuDQo+Pj4NCj4+PiBJIGFsc28gQ2MnZCBKb2hh
biBLb3JzbmVzIGJlY2F1c2UgaGUgc3VibWl0dGVkIGEgcGF0Y2ggZm9yIGEgcmVsYXRlZCBwcm9i
bGVtLg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+DQo+Pj4ganMNCj4+PiAtLS0NCj4+Pg0KPj4+IC0t
LSBhL2RyaXZlcnMvaGlkL2hpZC1jb3JlLmMgIDIwMjAtMDEtMjggMDI6MDQ6NTguOTE4MzA5OTAw
ICswMDAwDQo+Pj4gKysrIGIvZHJpdmVycy9oaWQvaGlkLWNvcmUuYyAgMjAyMC0wMS0yOSAwNjoz
NzoyMi44NjExOTA5ODYgKzAwMDANCj4+PiBAQCAtMjkwLDggKzI5MCwxMiBAQCBzdGF0aWMgaW50
IGhpZF9hZGRfZmllbGQoc3RydWN0IGhpZF9wYXJzDQo+Pj4NCj4+PiAgIC8qIFRvdGFsIHNpemUg
Y2hlY2s6IEFsbG93IGZvciBwb3NzaWJsZSByZXBvcnQgaW5kZXggYnl0ZSAqLw0KPj4+ICAgaWYg
KHJlcG9ydC0+c2l6ZSA+IChISURfTUFYX0JVRkZFUl9TSVpFIC0gMSkgPDwgMykgew0KPj4+IC0g
ICBoaWRfZXJyKHBhcnNlci0+ZGV2aWNlLCAicmVwb3J0IGlzIHRvbyBsb25nXG4iKTsNCj4+PiAt
ICAgcmV0dXJuIC0xOw0KPj4+ICsgICBoaWRfd2FybihwYXJzZXItPmRldmljZSwNCj4+PiArICAg
ICAgICJyZXBvcnQgaXMgdG9vIGxvbmcgYW5kIHdpbGwgYmUgdHJ1bmNhdGVkOiAlZCA+ICVkXG4i
LA0KPj4+ICsgICAgICAgcmVwb3J0LT5zaXplLA0KPj4+ICsgICAgICAgKEhJRF9NQVhfQlVGRkVS
X1NJWkUgLSAxKSA8PCAzKTsNCj4+PiArICAgcGFyc2VyLT5nbG9iYWwucmVwb3J0X3NpemUgPSBy
ZXBvcnQtPnNpemUgPQ0KPj4+ICsgICAgIChISURfTUFYX0JVRkZFUl9TSVpFIC0gMSkgPDwgMzsN
Cj4+PiAgIH0NCj4+Pg0KPj4+ICAgaWYgKCFwYXJzZXItPmxvY2FsLnVzYWdlX2luZGV4KSAvKiBJ
Z25vcmUgcGFkZGluZyBmaWVsZHMgKi8NCj4+PiBAQCAtMTc0OCw2ICsxNzUyLDEwIEBAIGludCBo
aWRfcmVwb3J0X3Jhd19ldmVudChzdHJ1Y3QgaGlkX2RldmkNCj4+PiAgICAgZGJnX2hpZCgicmVw
b3J0ICVkIGlzIHRvbyBzaG9ydCwgKCVkIDwgJWQpXG4iLCByZXBvcnQtPmlkLA0KPj4+ICAgICAg
ICAgY3NpemUsIHJzaXplKTsNCj4+PiAgICAgbWVtc2V0KGNkYXRhICsgY3NpemUsIDAsIHJzaXpl
IC0gY3NpemUpOw0KPj4NCj4+IFdpdGggeW91ciBwYXRjaCBJIGFzc3VtZSB3ZSdyZSBzdGlsbCB2
dWxuZXJhYmxlIHRvIHRoZSBvZmYtYnktb25lDQo+PiBtZW1zZXQoKSBmb3Igd2hpY2ggSSBwcm9w
b3NlZCBhIGZpeFswXS4gSWYgc28sIEkgc3VnZ2VzdCBteSBwYXRjaCBpcw0KPj4gYXBwbGllZCBm
aXJzdCwgb3Igc2ltcGx5IG1lcmdlZCB3aXRoIHRoaXMgcGF0Y2guIFdpdGggeW91ciBwYXRjaCB3
ZSBubw0KPj4gbG9uZ2VyIGFib3J0IGF0IHByb2JlIGlmIGEgcmVwb3J0IGlzIHRvbyBsb25nLiBX
ZSBhcmUgdGhlcmVmb3JlIG1vcmUNCj4+IGxpa2VseSB0byBlbmQgdXAgd2l0aCBhIGtlcm5lbCBP
b3BzIGFuZCBlbnN1aW5nIGNyYXNoIGlmIHdlIHJlY2VpdmUgYQ0KPj4gcmVwb3J0IHdpdGggc2l6
ZSBncmVhdGVyIHRoYW4gSElEX01BWF9CVUZGRVJfU0laRS4NCj4+DQo+PiBbMF0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzIwMjAwMTE3MTIwODM2LjIzNTQ5NjYtMS1qa29yc25l
c0BjaXNjby5jb20vDQo+IA0KPiBIaSBKb2hhbiwNCj4gDQo+IGNhbiB5b3UgcGxlYXNlIGZpeCB5
b3VyIHByb2Nlc3MgdG8gYWxzbyBpbmNsdWRlIHRoZSBsaW51eC1pbnB1dCBNTCBhbmQNCj4gbXlz
ZWxmIHRvIEhJRCByZWxhdGVkIHBhdGNoZXM/DQo+IA0KDQpIaSBCZW5qYW1pbiwNCg0KU29ycnkg
YWJvdXQgdGhhdCAtLSBJIHNob3VsZCBoYXZlIHJ1biBnZXRfbWFpbnRhaW5lci5wbC4NCg0KPiBJ
dCBkb2Vzbid0IG1hdHRlciBmb3IgdGhpcyBvbmUsIGFzIEkgc2VlIGl0IGluIHRoZSBISUQgdHJl
ZSwgYnV0IEkNCj4gd2Fzbid0IGF3YXJlIG9mIGl0IG5vciB0aGUgb3RoZXIgb25lICgiSElEOiBj
b3JlOiBpbmNyZWFzZSBISUQgcmVwb3J0DQo+IGJ1ZmZlciBzaXplIHRvIDhLaUIiKS4gQW5kIEkg
bGlrZSBiZWluZyBhd2FyZSBvZiBISUQgcGF0Y2hlcyA6KQ0KPiANCj4gVGhlIG1haW4gcmVhc29u
IGlzIHRoYXQgd2hlbmV2ZXIgYSBwYXRjaCBoaXQgbGludXgtaW5wdXQsIEkgcnVuIGENCj4gc2Vy
aWVzIG9mIHRlc3Qgd2l0aCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGliZXZkZXYv
aGlkLXRvb2xzLA0KPiBhbmQgdGhlIDIgZml4ZXMgeW91IHNlbnQgYXJlIHNvbWUgdmVyeSBzdHJv
bmcgY2FuZGlkYXRlcyBmb3INCj4gcmVncmVzc2lvbiB0ZXN0cy4NCj4gDQoNCkFic29sdXRlbHks
IHRoYXQgbWFrZXMgc2Vuc2UuDQoNCj4gQ2FuIHlvdSBzZW5kIG1lIHlvdXIgcmVwb3J0IGRlc2Ny
aXB0b3JzIHdpdGggdGhlIGBoaWQtcmVjb3JkZXJgIHRvb2wNCj4gaW4gdGhlIGhpZC10b29scyBw
cm9qZWN0LCBhbmQgSSdsbCBhZGQgeW91ciBkZXZpY2UgaW4gdGhlIHRlc3Qgc3VpdGU/DQo+IA0K
DQpUaGFuayB5b3UgZm9yIHRoZSBvZmZlcjsgSSB0aGluayBpdCB3b3VsZCBiZSBncmVhdCB0byBo
YXZlIHRoaXMgcHJvZHVjdA0KaW4gdGhlIHRlc3Qgc3VpdGUuIEkndmUgc2VudCBhbiBlbWFpbCB0
byB0aGUgbWFudWZhY3R1cmVyIHRvZGF5IHdoZXJlIEkNCmFzayBmb3IgcGVybWlzc2lvbiB0byBz
aGFyZSByZXBvcnQgZGVzY3JpcHRvciwgVklEIGFuZCBQSUQuIEkgd2lsbCBsZXQNCnlvdSBrbm93
IGFzIHNvb24gYXMgSSBnZXQgYSByZXBseS4NCg0KSm9oYW4NCg0KPiBDaGVlcnMsDQo+IEJlbmph
bWluDQo+IA0KPj4NCj4+IEpvaGFuDQo+Pg0KPj4+ICsgfSBlbHNlIGlmIChjc2l6ZSA+IHJzaXpl
KSB7DQo+Pj4gKyAgIGhpZF93YXJuKGhpZCwgInJlcG9ydCAlZCBpcyB0b28gbG9uZywgdHJ1bmNh
dGluZyAoJWQgPiAlZClcbiIsDQo+Pj4gKyAgICAgICByZXBvcnQtPmlkLCBjc2l6ZSwgcnNpemUp
Ow0KPj4+ICsgICByZXBvcnQtPnNpemUgPSBzaXplID0gcnNpemU7DQo+Pj4gICB9DQo+Pj4NCj4+
PiAgIGlmICgoaGlkLT5jbGFpbWVkICYgSElEX0NMQUlNRURfSElEREVWKSAmJiBoaWQtPmhpZGRl
dl9yZXBvcnRfZXZlbnQpDQo+Pj4NCj4+Pg0KPj4+IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDEy
OjQ0IEFNIEJlbmphbWluIFRpc3NvaXJlcw0KPj4+IDxiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0
LmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBPbiBNb24sIEphbiAyNywg
MjAyMCBhdCA5OjQxIFBNIGpzIDxzeW0uaS5uZW1AZ21haWwuY29tPiB3cm90ZToNCj4+Pj4+DQo+
Pj4+PiBpJ20gYnVtcGluZyB0aGlzIGJ1ZyBiZWNhdXNlIGkgaGF2ZW4ndCBoZWFyZCBhbnl0aGlu
ZyBmcm9tIHRoZQ0KPj4+Pj4gbWFpbnRhaW5lcnMgZm9yIGEgd2Vlay4NCj4+Pj4NCj4+Pj4gQXBv
bG9naWVzIGZvciB0aGUgZGVsYXkuIEkgaGF2ZSBiZWVuIGluIGEgY29uZmVyZW5jZSB0aGUgcGFz
dCAyIHdlZWtzDQo+Pj4+IGluIEF1c3RyYWxpYSwgc28gY291bGRuJ3QgaGFuZGxlIG11Y2ggb2Yg
dXBzdHJlYW0uDQo+Pj4+IEZ1cnRoZXJtb3JlLCB3ZSBhcmUgY3VycmVudGx5IGluIHRoZSBtZXJn
ZSB3aW5kb3csIHdoaWNoIG1lYW5zIHdlDQo+Pj4+IHNob3VsZCBub3QgcHVzaCBwYXRjaGVzIHRv
IGxpbnV4LW5leHQgdW5sZXNzIHRoZXkgYXJlIGFic29sdXRlbHkNCj4+Pj4gbmVlZGVkLg0KPj4+
Pg0KPj4+Pj4gdGhlcmUncyBiZWVuIG5vIGNoYW5nZSBpbiB0aGUgZ2l0IGVpdGhlci4NCj4+Pj4+
IHdoYXQncyBnb2luZyBvbiBndXlzPyB0aGlzIGlzIGEgdGlueSBwYXRjaCBmb3IgYSB2ZXJ5IHNp
bXBsZSBidWcuDQo+Pj4+PiBpdCBzaG91bGQgYmUgYSBmYXN0IHJldmlldyBhbmQgY29tbWl0IHRv
IHRoZSBrZXJuZWwgdHJlZS4NCj4+Pj4NCj4+Pj4gTm9wZSwgdGhhdCBpcyBub3QgdGhhdCBzaW1w
bGU6DQo+Pj4+DQo+Pj4+IC0gcGxlYXNlIHN1Ym1pdCB5b3VyIHBhdGNoZXMgZm9sbG93aW5nDQo+
Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZh
bGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNo
ZXMucnN0I24zNDANCj4+Pj4gT3VyIHRvb2xzIHJlcXVpcmUgdGhlIHBhdGNoZXMgdG8gbm90IGJl
IGF0dGFjaGVkIGluIGFuIGVtYWlsIHNvIHdlIGNhbg0KPj4+PiBwcm9jZXNzIHRoZW0NCj4+Pj4g
LSB0aGlzIHBhdGNoIGFmZmVjdHMgdGhlIGNvcmUgb2YgdGhlIEhJRCBzdWJzeXN0ZW0sIHdoaWNo
IG1lYW5zIHdlDQo+Pj4+IHNob3VsZCB0YWtlIGV4dHJhIGNhcmUgd2hlbiBkZWFsaW5nIHdpdGgg
aXQgdG8gbm90IGJyZWFrIG90aGVyIHN5c3RlbXMNCj4+Pj4gLSB0aGlzIHBhdGNoIHNlZW1zIHRv
IHBhcGVyIG92ZXIgYSBzZWN1cml0eSBwYXRjaA0KPj4+PiAoOGVjMzIxZTk2ZTA1NmRlODQwMjJj
MDMyZmZlYTI1MzQzMWE4M2MzYykgYnkgY2hhbmdpbmcgdGhlIHJldHVybg0KPj4+PiB2YWx1ZSBm
cm9tIGFuIGVycm9yIHRvICJ5ZWFoLCB0aGF0J3MgZmluZSIuIFNvIHVubGVzcyB0aGVyZSBpcyBh
IHByb29mDQo+Pj4+IHRoYXQgdGhpcyBpcyB0aGUgY29ycmVjdCB3YXksIGl0J3MgZ29pbmcgdG8g
YmUgYSBuYWNrIGZyb20gbWUgdW50aWwNCj4+Pj4gcHJvdmVuIG90aGVyd2lzZQ0KPj4+PiAtIHRo
aXMgcGF0Y2ggYWZmZWN0cyBpbiB0aGUgZW5kIGhpZC1tdWx0aXRvdWNoLCBhbmQgYXMgbWVudGlv
bmVkIGluDQo+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmMj
bjI2DQo+Pj4+IEknZCBsaWtlIHRvIGhhdmUgYSByZXByb2R1Y2VyIGluDQo+Pj4+IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJldmRldi9oaWQtdG9vbHMgc28gd2UgZG8gbm90IGJy
ZWFrDQo+Pj4+IHRob3NlIGRldmljZXMgaW4gdGhlIGZ1dHVyZS4NCj4+Pj4NCj4+Pj4gU28gSSB1
bmRlcnN0YW5kIHRoZSBmcnVzdHJhdGlvbiBvZiBoYXZpbmcgYSBIVyByZWdyZXNzaW9uLCBidXQg
dGhpcw0KPj4+PiBwYXRjaCBpcyBjbGVhcmx5IG5vdCB0aGUgY29ycmVjdCBzb2x1dGlvbiBnaXZl
biB3aGF0IEkgaGF2ZSBoZXJlLCBzbyBJDQo+Pj4+IGNhbiBub3QgcHVzaCBpdCByaWdodCBub3cu
DQo+Pj4+DQo+Pj4+IENoZWVycywNCj4+Pj4gQmVuamFtaW4NCj4+Pj4NCj4+Pj4+DQo+Pj4+PiBq
cw0KPj4+Pj4NCj4+Pj4+IE9uIFN1biwgSmFuIDE5LCAyMDIwIGF0IDE6MTQgUE0ganMgPHN5bS5p
Lm5lbUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4gaSBwb3N0ZWQgdGhpcyBidWcg
dG8gYnVnemlsbGEgd2l0aCB0aGUgYXR0YWNoZWQgcGF0Y2guDQo+Pj4+Pj4gdGhpcyBlbWFpbCBp
cyB0byBub3RpZnkgdGhlIG1haW50YWluZXJzLg0KPj4+Pj4+IGh0dHBzOi8vYnVnemlsbGEua2Vy
bmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA2MjU5DQo+Pj4+Pj4NCj4+Pj4+PiB0aGFua3MhDQo+
Pj4+Pj4NCj4+Pj4+PiBqcw0KPj4+Pj4+IC0tLS0NCj4+Pj4+Pg0KPj4+Pj4+IEVMQU4gaTJjIGRp
Z2l0aXplciBvbiBtaWNyb3NvZnQgc3VyZmFjZSBnbyBmYWlscyB0byBpbml0aWFsaXplIGFuZA0K
Pj4+Pj4+IGRldmljZSBpcyBub24tZnVuY3Rpb25hbA0KPj4+Pj4+DQo+Pj4+Pj4gaW5pdGlhbGl6
YXRpb24gZmFpbHMgb24gNC4xOS45NjoNCj4+Pj4+PiAtLS0tDQo+Pj4+Pj4gWyAgICA1LjUwNzI0
NV0gaGlkLWdlbmVyaWMgMDAxODowNEYzOjI2MUEuMDAwNTogcmVwb3J0IGlzIHRvbyBsb25nDQo+
Pj4+Pj4gWyAgICA1LjUwNzI1Nl0gaGlkLWdlbmVyaWMgMDAxODowNEYzOjI2MUEuMDAwNTogaXRl
bSAwIDEgMCA4IHBhcnNpbmcgZmFpbGVkDQo+Pj4+Pj4gWyAgICA1LjUwNzI5MF0gaGlkLWdlbmVy
aWM6IHByb2JlIG9mIDAwMTg6MDRGMzoyNjFBLjAwMDUgZmFpbGVkIHdpdGggZXJyb3IgLTIyDQo+
Pj4+Pj4gWyAgICA1LjU1NjQwOV0gaGlkLW11bHRpdG91Y2ggMDAxODowNEYzOjI2MUEuMDAwNTog
cmVwb3J0IGlzIHRvbyBsb25nDQo+Pj4+Pj4gWyAgICA1LjU4MTY0MV0gaGlkLW11bHRpdG91Y2gg
MDAxODowNEYzOjI2MUEuMDAwNTogaXRlbSAwIDEgMCA4IHBhcnNpbmcgZmFpbGVkDQo+Pj4+Pj4g
WyAgICA1LjYxODQ5NV0gaGlkLW11bHRpdG91Y2g6IHByb2JlIG9mIDAwMTg6MDRGMzoyNjFBLjAw
MDUgZmFpbGVkDQo+Pj4+Pj4gd2l0aCBlcnJvciAtMjINCj4+Pj4+Pg0KPj4+Pj4+IGluaXRpYWxp
emF0aW9uIHN1Y2NlZWRzIG9uIDQuMTkuOTU6DQo+Pj4+Pj4gLS0tLQ0KPj4+Pj4+IFsgICAgNy4x
NTA4ODddIGhpZC1nZW5lcmljIDAwMTg6MDRGMzoyNjFBLjAwMDE6IGlucHV0LGhpZHJhdzI6IEky
QyBISUQNCj4+Pj4+PiB2MS4wMCBEZXZpY2UgW0VMQU45MDM4OjAwIDA0RjM6MjYxQV0gb24gaTJj
LUVMQU45MDM4OjAwDQo+Pj4+Pj4gWyAgICA4LjI1MzA3N10gaW5wdXQ6IEVMQU45MDM4OjAwIDA0
RjM6MjYxQSBhcw0KPj4+Pj4+IC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxNS4xL2kyY19k
ZXNpZ253YXJlLjEvaTJjLTEvaTJjLUVMQU45MDM4OjAwLzAwMTg6MDRGMzoyNjFBLjAwMDEvaW5w
dXQvaW5wdXQyMA0KPj4+Pj4+IFsgICAgOC4yNTMyMTldIGlucHV0OiBFTEFOOTAzODowMCAwNEYz
OjI2MUEgUGVuIGFzDQo+Pj4+Pj4gL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjEvaTJj
X2Rlc2lnbndhcmUuMS9pMmMtMS9pMmMtRUxBTjkwMzg6MDAvMDAxODowNEYzOjI2MUEuMDAwMS9p
bnB1dC9pbnB1dDIzDQo+Pj4+Pj4gWyAgICA4LjI1MzMzMF0gaGlkLW11bHRpdG91Y2ggMDAxODow
NEYzOjI2MUEuMDAwMTogaW5wdXQsaGlkcmF3MDogSTJDDQo+Pj4+Pj4gSElEIHYxLjAwIERldmlj
ZSBbRUxBTjkwMzg6MDAgMDRGMzoyNjFBXSBvbiBpMmMtRUxBTjkwMzg6MDANCj4+Pj4+Pg0KPj4+
Pj4+IHByb2JsZW0gc2VlbXMgdG8gYmUgZHVlIHRvIHRoaXMgY29tbWl0Og0KPj4+Pj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5n
aXQvY29tbWl0Lz9oPWxpbnV4LTQuMTkueSZpZD0zMWQwNmNjOGU3Y2FlYzM2YmVkZWI0ZjkwNDQ0
OTIwNDMxNDYyZjYxDQo+Pj4+Pg0KPj4+Pg0KPj4NCj4gDQoNCg==
