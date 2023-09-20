Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5F97A8C79
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 21:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjITTNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 15:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjITTNP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 15:13:15 -0400
Received: from gcc-spam-ims-004.plexus.com (gcc-spam-ims-004.plexus.com [206.209.244.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFBAE71
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 12:12:45 -0700 (PDT)
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6600B1015F;
        Wed, 20 Sep 2023 14:12:44 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1695237164; bh=N1wVrTrApGYBmXUaI+pjWIiJwe5jryxiDwpZ+4GT7/A=;
        h=From:To:Date;
        b=DoNslpVBYyCRSzdigZbUsOpdFZ2XqdXIDYAbdlTut7TfNkmV7Xk+oJ2YmCXURzKZO
         JkyH0DeDfT7x52QVTu0jQSWM2lU0C8O07FXvw5WTED5b6uJFBX/8TC2oDuVM7Ft7MB
         asMzxKa9a45rwNFLts5uXCkrzJfVu8guRKIoSW2mFXV2mRHvEsIMzyBI/Jl74kgqlY
         j/gH9U1thRv8fsrNP5jp43aqdY4U60kIpp5sAuyhQqe9NbbC8id3KdYYHz0GHaCMNE
         i/GOjSJwJFAcAezNwqxNkTne3XUnpvWKj/mZ6s4wfxBDJe7pHfZEiIT9rCILXZOg1e
         1NRB7pbPwVVRg==
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5960C1015E;
        Wed, 20 Sep 2023 14:12:44 -0500 (CDT)
Received: from gcc-mail-mx-002.na.plexus.com (unknown [10.255.51.221])
        by gcc-spam-ims-004.plexus.com (Postfix) with ESMTPS;
        Wed, 20 Sep 2023 14:12:44 -0500 (CDT)
Received: from gcc-mail-mx-003.Na.Plexus.com (10.255.51.222) by
 gcc-mail-mx-002.na.plexus.com (10.255.51.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 19:12:43 +0000
Received: from gcc-mail-mx-003.Na.Plexus.com ([10.255.51.222]) by
 gcc-mail-mx-003.na.plexus.com ([10.255.51.222]) with mapi id 15.01.2507.032;
 Wed, 20 Sep 2023 19:12:43 +0000
From:   Danny Kaehn <Danny.Kaehn@plexus.com>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH] hid: cp2112: Fix IRQ shutdown stopping polling for all
 IRQs on chip
Thread-Topic: [PATCH] hid: cp2112: Fix IRQ shutdown stopping polling for all
 IRQs on chip
Thread-Index: AQHZ60BKS7P5ZoiF/kO0/lJI4pDbUbAjt5uAgABdggA=
Date:   Wed, 20 Sep 2023 19:12:43 +0000
Message-ID: <0f247ab41b6fc0a5968b43e354fc1a140219a41f.camel@plexus.com>
References: <20230919212426.489637-1-danny.kaehn@plexus.com>
         <ZQr0r3Ux/rkWQ8N5@smile.fi.intel.com>
In-Reply-To: <ZQr0r3Ux/rkWQ8N5@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.48.203]
x-tm-snts-smtp: E8C3BD74A30F058A4F5632D52DE57CCACFF08199262074227A8EB06C114B7A232000:8
Content-Type: text/plain; charset="utf-8"
Content-ID: <21ED45E8B608DA4DB60E3C85C4DF3E1C@plexus.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27888.001
X-TM-AS-Result: No--20.399-3.0-31-10
X-imss-scan-details: No--20.399-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27888.001
X-TMASE-Result: 10--20.399000-10.000000
X-TMASE-MatchedRID: P9IPSxB8xL0T9JmGV/VwoiSc4ah4hDOWKJd/YZnhHHeAO0kpgKezRDFc
        f92WG8u/6hUULKzHRgTCUcSg1GQtKJytBOG1WZxWqJf8Iy3dLA0j5/iH9rzNmZ4CIKY/Hg3AwWu
        lRtvvYxRlgn288nW9IMLQF1IYnOnS5MIx11wv+COQZS2ujCtcuA==
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gV2VkLCAyMDIzLTA5LTIwIGF0IDE2OjMzICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDA0OjI0OjI2UE0gLTA1MDAsIERhbm55IEthZWhu
IHdyb3RlOg0KPiA+IFByZXZpb3VzbHkgY3AyMTEyX2dwaW9faXJxX3NodXRkb3duIGFsd2F5cyBj
YW5jZWxsZWQgdGhlDQo+IA0KPiBjcDIxMTJfZ3Bpb19pcnFfc2h1dGRvd24oKQ0KDQo+ID4gX3Jl
bW92ZSBvY2N1cnJlZCAoYS5lLiB0aGUgY3AyMTEyIGlzIHVucGx1Z2dlZCBvciBzeXN0ZW0gcmVi
b290ZWQpLg0KPiANCj4gX3JlbW92ZSgpDQo+IA0KPiA+ICsJaWYgKCFkZXYtPmlycV9tYXNrKQ0K
PiA+ICsJew0KPiANCj4gVGhlIHN0eWxlIHRlbGxzIHRvIHVzZSB0aGVzZSBvbiBhIHNpbmdsZSBs
aW5lLg0KDQpBQ0sgLS0gd2lsbCBmaXggYWxsIGluIHYyLiBUaGFua3MgZm9yIHRoZSBjb21tZW50
cy4NCg0KRGFubnkgS2FlaG4NCg==
