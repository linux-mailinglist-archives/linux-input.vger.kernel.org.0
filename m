Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2538C7C5B83
	for <lists+linux-input@lfdr.de>; Wed, 11 Oct 2023 20:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjJKSpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Oct 2023 14:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbjJKSpI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Oct 2023 14:45:08 -0400
Received: from gcc-spam-ims-004.plexus.com (gcc-spam-ims-004.plexus.com [206.209.244.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3300794
        for <linux-input@vger.kernel.org>; Wed, 11 Oct 2023 11:45:07 -0700 (PDT)
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 18360100F6;
        Wed, 11 Oct 2023 13:45:05 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1697049905; bh=Uy8ZtMCIqIeo9fXzjqW05FihYJadBDt0SZup7ria5KQ=;
        h=From:To:Date;
        b=qCNAJFsA80Suv2CW8W9gKlinGLvP1oXccjuNofB8gWtopFkKhyXX1YSEM+b4SQSXS
         5UF7mKJXcGCLD2QpJdxZCX7vyESJDmSGG9G5O3/M6bI0PlDpwtEt7Jig9JAQyGFhSS
         jsDZgYfQHEHrGIlpbuZ/jYpkQHJ/oZPvUS4fKv8NHU/3TcPvUAwo7jLd+GhBf+SAGD
         XKOu50ihN3kPvHJOYDKOeebu9+GNIvqkZGte6zyXjf0KVFf7/fPy5ae/RkbJRbPyjL
         Av5/rnwtDFtiCLipDD4/HzfT9m/Nchs8WEVMBF0fjS73QsjhsRAFfZnKT1JlywHLSJ
         P0gvsOwpbrZpg==
Received: from gcc-spam-ims-004.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B4771008E;
        Wed, 11 Oct 2023 13:45:05 -0500 (CDT)
Received: from gcc-mail-mx-004.na.plexus.com (unknown [10.255.51.224])
        by gcc-spam-ims-004.plexus.com (Postfix) with ESMTPS;
        Wed, 11 Oct 2023 13:45:05 -0500 (CDT)
Received: from gcc-mail-mx-003.Na.Plexus.com (10.255.51.222) by
 gcc-mail-mx-004.na.plexus.com (10.255.51.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:45:04 +0000
Received: from gcc-mail-mx-003.Na.Plexus.com ([10.255.51.222]) by
 gcc-mail-mx-003.na.plexus.com ([10.255.51.222]) with mapi id 15.01.2507.032;
 Wed, 11 Oct 2023 18:45:04 +0000
From:   Danny Kaehn <Danny.Kaehn@plexus.com>
To:     "jikos@kernel.org" <jikos@kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH v2] hid: cp2112: Fix IRQ shutdown stopping polling for all
 IRQs on chip
Thread-Topic: [PATCH v2] hid: cp2112: Fix IRQ shutdown stopping polling for
 all IRQs on chip
Thread-Index: AQHZ/HDX95ZpENVhiU2m8BI20+NtpbBE654A
Date:   Wed, 11 Oct 2023 18:45:04 +0000
Message-ID: <8d3e037374c3e16b03a7edcb8b7aa960cdc9a794.camel@plexus.com>
References: <20231011182317.1053344-1-danny.kaehn@plexus.com>
In-Reply-To: <20231011182317.1053344-1-danny.kaehn@plexus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.48.203]
x-tm-snts-smtp: B5FF47AA42A0D2FAC2B7A0DA3656D4AD4D58A79D1355596F238EA1A980DFB1542000:8
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E08295593B6064A823A868ED54F577F@plexus.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27930.001
X-TM-AS-Result: No--9.365-3.0-31-10
X-imss-scan-details: No--9.365-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27930.001
X-TMASE-Result: 10--9.364900-10.000000
X-TMASE-MatchedRID: mkWxfOVwCPbxcwVccMqxMD6Ad0tqtE+g/sernTRzvzCqFx2c/3V5ceq0
        4IwIzM5hmyiLZetSf8n5kvmj69FXvJj9/HNwzYskAlNT0X/aNrM6wG/ANEEkZvoLR4+zsDTtFEA
        kLaTcFnq6T/9aHjKUbDVsXHfDq+9q9AGjMcLGIxGGLd6jrCNC+Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

QXBvbG9naWVzIGZvciB0aGUgZHVwbGljYXRlIGVtYWlsLCByZWFsaXplZCB0b28gbGF0ZSB0aGF0
DQp0aGlzIHNob3VsZCBsaWtlbHkgYWxzbyBpbmNsdWRlIGEgRml4ZXMgdGFnLg0KDQpGaXhlczog
MTNkZTljY2E1MTRlICgiSElEOiBjcDIxMTI6IGFkZCBJUlEgY2hpcCBoYW5kbGluZyIpDQo=
