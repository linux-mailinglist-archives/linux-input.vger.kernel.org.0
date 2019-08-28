Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FB79FA91
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 08:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfH1GfT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 02:35:19 -0400
Received: from mail-eopbgr1410088.outbound.protection.outlook.com ([40.107.141.88]:28275
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbfH1GfS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 02:35:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/eiBScGosncdkqTbi+MTrx/66yZlTfNuNLIDOQFGq3cgXgZA17bTuBSqL7hUxKv/ZZFkbA9fbd7NjfoPUyRntNnvuaeYmwSbjQg7bqcOs88+vLlRWFLHPuOeFptCz38kQZ6+E7jXfti9uwsU50SzCwcEWgTIwM7KGSDFmjlGq8byptS+fZ439eHIEn1Cj7Iq56vUC5ovfuDNBLAM7YH46WPlUI7deZdXcgkC99JKYurBentnrUjVI54D/bt+SHpHbAc8TwqQKpM4oEt7CXfobUkoiMlUUPPW+F2DLDSRV54gX7Rs8c8k43hkh1zYOAFIwAjlcKlTL8PS8hD5CbfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26LLCclJbkhO93ZI4E5hRs80MVEzb0qqRzECJSJVvjg=;
 b=UFsZ1KpFHbybSOQf9GbFeEDs+kETwnio2c8ASfcVbK1+cREIL090uXumYq99jN7EBzlZ+93KHkEklMaNJjN9CuUQlwtvMIGhqjVC+k6Oe0s1+fIOowCFenEuPZdRO9tXFr+bTRz/47JEZduFwZwskUqE0jxFisErEtuNQN0feB65vNjdL9TvO9YE2QhdbNnBxyV0aNNi+7LrY5fYH5jGwyEmDNHyudzIFdQXzk2sH+jvYTxJ1TbRuHo5tikTl/MWd/eoi4ed3+tdbiDmcKUHZFAHPdHU3M6Pwn31QQaA/h3M9lM2c7jz0p90JIujnhwsc8/A5GfHlI/gPMFiESl1SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=alpsalpine.com; dmarc=pass action=none
 header.from=alpsalpine.com; dkim=pass header.d=alpsalpine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26LLCclJbkhO93ZI4E5hRs80MVEzb0qqRzECJSJVvjg=;
 b=uoXjhGe06NWPM3Gx5yoL848zS/W8GgwyWPhelPbTjWadkWni71j+DO+6y1hVsLp4GuPBNi1o90wxrslnxhXbAvLUgVLnWottFfRAmkMKNuj62+doetSFh0I/PHkPM6W931sUNvgZ+SngxKCK8WLrrIyMvWPZTa7eYeeMppBm2Kw=
Received: from TYAPR01MB3022.jpnprd01.prod.outlook.com (20.177.102.201) by
 TYAPR01MB3021.jpnprd01.prod.outlook.com (20.177.101.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Wed, 28 Aug 2019 06:35:15 +0000
Received: from TYAPR01MB3022.jpnprd01.prod.outlook.com
 ([fe80::6dc6:12ba:f9df:233b]) by TYAPR01MB3022.jpnprd01.prod.outlook.com
 ([fe80::6dc6:12ba:f9df:233b%4]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 06:35:15 +0000
From:   Masaki Ota <masaki.ota@alpsalpine.com>
To:     Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
CC:     Mario Limonciello <mario.limonciello@dell.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Subject: RE: Alps touchpad generates IRQ storm after S3
Thread-Topic: Alps touchpad generates IRQ storm after S3
Thread-Index: AQHVXWj4yiA/dCbgb0asvogI8mRWOKcQF8vA
Date:   Wed, 28 Aug 2019 06:35:15 +0000
Message-ID: <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
References: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
In-Reply-To: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=masaki.ota@alpsalpine.com; 
x-originating-ip: [106.184.109.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01accf6-4e71-4599-5be7-08d72b81e2ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3021;
x-ms-traffictypediagnostic: TYAPR01MB3021:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3021C1E2106958F82EE618DAECA30@TYAPR01MB3021.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(39850400004)(396003)(189003)(199004)(13464003)(4744005)(85182001)(102836004)(71190400001)(86362001)(26005)(14444005)(256004)(186003)(6506007)(76116006)(52536014)(486006)(66476007)(4326008)(64756008)(66556008)(446003)(53546011)(229853002)(5660300002)(66946007)(11346002)(6116002)(14454004)(54906003)(3846002)(81156014)(81166006)(53936002)(99286004)(9686003)(8936002)(6436002)(7696005)(33656002)(107886003)(76176011)(55016002)(8676002)(476003)(66446008)(478600001)(316002)(7736002)(71200400001)(110136005)(6246003)(305945005)(74316002)(2906002)(66066001)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:TYAPR01MB3021;H:TYAPR01MB3022.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: alpsalpine.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2Db9hek4QMKL+hBTPwmJJ1ELm+aFzzPxpPLND2o4VTou4LdKqrIRVq88CiGkG1pnr7sKgHN1kLKp5wtrfkQRrc3sn8aZAasExh5pv9BzC9Ejmc44LVYeaB8HthtPoFhbpKeso/O5ufHRFXdn7UhNFdT9QhVYRo6u1PMdMnA3WRM4IHAIZio5i4cgPLwFF5Xza43VgoPypII9DsJjB31OzvcdoM0eQNQsb83381R6SyLkv/xO+Moo8iSVApHAJztO051w0iINAXcw/Ck7rwQWR5FL+qrVpf57b5VQ95YY+pKeSUH9reW6le2KCP89iNZOPgChT5ZY8fKBZKwL6HOhZ2ZV2PFs+H7OqKDnA3FGLJSXFTvu85Ua3Dj/C6XxfKC1ZpMp0nMAWW8KO6JQh+rtCMjxAFtTt03Vs9is2G4FadU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: alpsalpine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01accf6-4e71-4599-5be7-08d72b81e2ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 06:35:15.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C8YCzTvmlvV/CS476kFYcVYpqsylXgLZYxtCYtVf21fbTGgvJ8Kb0X8uJ2mHcb3Cy9HVGp5z5k6Z9PLSxHaRa5blwCHf/9cjGf3AwpCc3WY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3021
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGksIEthaS1IZW5nLA0KDQpTb3JyeSwgSSdtIG5vdCBpbiBjaGFyZ2Ugb2YgTGludXggdGFzayBu
b3cuDQoNCkhpLCBYaWFvSmlhbiwNCg0KUGxlYXNlIGNoZWNrIHRoZSBmb2xsb3dpbmcgbWFpbC4N
CklmIHlvdSBoYXZlIGFueSBxdWVzdGlvbiwgcGxlYXNlIGFzayBLYWktSGVuZy4NCg0KQmVzdCBS
ZWdhcmRzLA0KTWFzYWtpIE90YQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEth
aS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gDQpTZW50OiBXZWRuZXNk
YXksIEF1Z3VzdCAyOCwgMjAxOSAzOjIyIFBNDQpUbzog5aSq55SwIOecn+WWnCBNYXNha2kgT3Rh
IDxtYXNha2kub3RhQGFscHNhbHBpbmUuY29tPg0KQ2M6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJp
by5saW1vbmNpZWxsb0BkZWxsLmNvbT47IG9wZW4gbGlzdDpISUQgQ09SRSBMQVlFUiA8bGludXgt
aW5wdXRAdmdlci5rZXJuZWwub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4NClN1YmplY3Q6IEFscHMgdG91Y2hwYWQgZ2VuZXJhdGVz
IElSUSBzdG9ybSBhZnRlciBTMw0KDQpIaSBNYXNha2ksDQoNClRoZSBBbHBzIHRvdWNocGFkICgw
NDRFOjEyMjApIG9uIERlbGwgUHJlY2lzaW9uIDc1MzAgY2F1c2VzIElSUSBzdG9ybSBhZnRlciBz
eXN0ZW0gc3VzcGVuZCAoUzMpLg0KQ29tbWl0ICJISUQ6IGkyYy1oaWQ6IERvbid0IHJlc2V0IGRl
dmljZSB1cG9uIHN5c3RlbSByZXN1bWXigJ0gd2hpY2ggc29sdmVzIHRoZSBzYW1lIGlzc3VlIGZv
ciBvdGhlciB2ZW5kb3JzLCBjYXVzZSB0aGUgaXNzdWUgb24gQWxwcyB0b3VjaHBhZC4NClNvIEni
gJlkIGxpa2UgdG8ga25vdyB0aGUgY29ycmVjdCBjb21tYW5kIEFscHMgdG91Y2hwYWQgZXhwZWN0
cyBhZnRlciBzeXN0ZW0gcmVzdW1lLg0KDQpBbHNvIENjIE1hcmlvIGJlY2F1c2UgdGhpcyBjb3Vs
ZCByZWxhdGUgdG8gQklPUy4NCg0KS2FpLUhlbmcNCg==
