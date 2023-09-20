Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B36A7A8C48
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 21:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjITTKY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 15:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjITTKY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 15:10:24 -0400
Received: from gcc-spam-ims-004.plexus.com (gcc-spam-ims-004.plexus.com [206.209.244.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91FF8F
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 12:10:17 -0700 (PDT)
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 979921015F;
        Wed, 20 Sep 2023 14:10:16 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1695237017; bh=HnFC1c2VOfNrPJN6oMRDdjJ+9QelRJJXDbAYGOU9WPQ=;
        h=From:To:Date;
        b=DYxpp5gYTqtv88VTWbJJaLkCUht0ENNlv4A5Z5Gji1GPgObrJs00IrLQQzuHbFDcT
         oibegXOX0lxN+puEU0iGtKGw6FNwjmyk30aazchQwchJdx5uSHoCtVRnmhJuuWjCl7
         0PPeQRnKGqRMtJLY+dv3VbDZeTnWyVxO6RcHopbiE78aKWBFD3pZLOrtcDn+T4vCU8
         3xWwIcXotdcnZMiJCAu22jeMhSXKMO7ApYN6/zftXtW6quGWUv7uBVNZwMJIadm3gr
         wZNS9hbHis+sTfNp749uqonJJBTnIINm/q1giPdN//bseMHgwwTuxzfKhbt56mTYPG
         1uK+ES8U6+5EA==
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 89A8C1015E;
        Wed, 20 Sep 2023 14:10:16 -0500 (CDT)
Received: from gcc-mail-mx-002.na.plexus.com (unknown [10.255.51.221])
        by gcc-spam-ims-004.plexus.com (Postfix) with ESMTPS;
        Wed, 20 Sep 2023 14:10:16 -0500 (CDT)
Received: from gcc-mail-mx-003.Na.Plexus.com (10.255.51.222) by
 gcc-mail-mx-002.na.plexus.com (10.255.51.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 19:10:16 +0000
Received: from gcc-mail-mx-003.Na.Plexus.com ([10.255.51.222]) by
 gcc-mail-mx-003.na.plexus.com ([10.255.51.222]) with mapi id 15.01.2507.032;
 Wed, 20 Sep 2023 19:10:16 +0000
From:   Danny Kaehn <Danny.Kaehn@plexus.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
Thread-Topic: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
Thread-Index: AQHZ60AZq3DBs8ll4kyZ7yyHA8a3BrAjr4kAgABk5AA=
Date:   Wed, 20 Sep 2023 19:10:15 +0000
Message-ID: <216f73660b7c55ab247345120468d0cd9463e622.camel@plexus.com>
References: <20230919212245.483646-1-danny.kaehn@plexus.com>
         <ZQrt6k/usVXlB223@smile.fi.intel.com>
In-Reply-To: <ZQrt6k/usVXlB223@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.48.203]
x-tm-snts-smtp: D2AEDC3A8A0D71D2A82FC6BF4E1FCCC57AA5E12E55534D69538A14B8E83B47732000:8
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C233C38B3A18B419D655333ED423E86@plexus.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27888.001
X-TM-AS-Result: No--22.622-3.0-31-10
X-imss-scan-details: No--22.622-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27888.001
X-TMASE-Result: 10--22.622200-10.000000
X-TMASE-MatchedRID: 3OnHKS+pL/QT9JmGV/VwoiSc4ah4hDOWKJd/YZnhHHf+xRIVoKNMvAEd
        5z4hpRvay8MAu/9vTsXLNAPDnIdPQf2ZulIDzVJ6oJ/A9BSp0TLGmZ4YIxsd+9splnBzc8xMG24
        YVeuZGmNQKAQSutQYXFYMJR3dIrh2X0YtBF1zzirurXGSE4GB1+yOHSHOZwIcjrVn4cme+w7xHb
        XnJn8rjkJv2xLgykjPo8WMkQWv6iUVR7DQWX/WkSAtDqHg/4Qm0C1sQRfQzEHEQdG7H66TyKsQd
        9qPXhnJVWgRcrSEFLc=
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDE2OjA0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDA0OjIyOjQ1UE0gLTA1MDAsIERhbm55IEthZWhu
IHdyb3RlOg0KPiA+IFByZXZpb3VzbHkgdGhlIGNwMjExMiBkcml2ZXIgY2FsbGVkIElOSVRfREVM
QVlFRF9XT1JLIHdpdGhpbg0KPiA+IGNwMjExMl9ncGlvX2lycV9zdGFydHVwLCByZXN1bHRpbmcg
aW4gZHVwbGljYXRlIGluaXRpbGl6YXRpb25zIG9mIHRoZQ0KPiA+IHdvcmtxdWV1ZSBvbiBzdWJz
ZXF1ZW50IElSUSBzdGFydHVwcyBmb2xsb3dpbmcgYW4gaW5pdGlhbCByZXF1ZXN0LiBUaGlzDQo+
ID4gcmVzdWx0ZWQgaW4gYSB3YXJuaW5nIGluIHNldF93b3JrX2RhdGEgaW4gd29ya3F1ZXVlLmMs
IGFzIHdlbGwgYXMgYSByYXJlDQo+ID4gTlVMTCBkZXJlZmVyZW5jZSB3aXRoaW4gcHJvY2Vzc19v
bmVfd29yayBpbiB3b3JrcXVldWUuYy4NCj4gPiANCj4gPiBJbml0aWFsaXplIHRoZSB3b3JrcXVl
dWUgd2l0aGluIF9wcm9iZSBpbnN0ZWFkLg0KPiANCj4gRG9lcyBpdCBkZXNlcnZlIGEgRml4ZXMg
dGFnPw0KDQpJJ20gbm90IHN1cmUgLS0gaXQgZG9lcyB0ZWNobmljYWxseSBmaXggMTNkZTljY2E1
MTRlZDYzNjA0MjYzY2FkODdjYThjYjM2ZTliNjQ4OQ0KKEhJRDogY3AyMTEyOiBhZGQgSVJRIGNo
aXAgaGFuZGxpbmcpLCBidXQgZG9lcyBub3QgYXBwbHkgY2xlYW5seSB0byB0aGF0DQpyZXZpc2lv
biAoYS5lLiB3aXRoIGdpdCBhbSkNCg0KKG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCAnRml4ZXMn
IGlzIHVzZWQgZm9yIHN0YWJsZSBrZXJuZWwgbWFpbnRlbmFuY2U/KQ0KDQpUaGFua3MsDQoNCkRh
bm55IEthZWhuDQo=
