Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145E61A3DED
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 04:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgDJCDh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 22:03:37 -0400
Received: from mail-eopbgr1400040.outbound.protection.outlook.com ([40.107.140.40]:19904
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726082AbgDJCDh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 22:03:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0EKxy16AHzGvyg0ElIpw1AikmjVr6rFAGLOJM0rCx6mK4A7LkX+4OC2WzIbAZJ5Le2UlrSKIpfx+ip6zvMFzxripngJc1fvTSZJGhPwybITyGruX/gIRRykfXk+hOhFBKeWhTdzig9x3EX977A6r9Rj4+nklTLsk8npr3wuYBb+4iwAKkxRfCjCPbQah/UbFlZUIyEBwiqODAjhbex7qQsPAY6pdd09OGu81mw7FMDUx7o4x2gyw/x4bh++hOOdHtv0AKwWyQUfMUlxbcKw7gEyg8wx2WVUZuc7XDBhLt5pPIOo32/53XQ91nYpsdpECybvh/yI0M/UP8kKIBG3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Yv54uSToHu3GXfl8o/Cbueuu8ycC+XZ4mfq2v44JiA=;
 b=i05BU8S5AS60KUCq0Y8pdANzfGe6wK+LrttkQHZk3yw9TFGjffCuL/BKed9jSA0Te1gXZlhntYO64mKBA2x53NJbVZBjOy+ZNL3XT37kwJ+kN0eaV7L74O3BmN4mDCa5GJJ+LnuLGMMuetDWJPbW3h9be0k5dGeii1AaZOImHSkUGtnWDuQjJlHeqcsas24itjjYGA+ICuqdfgBMzdicPk1nsE4vO1QJEdn38a2AGg7aMEJ/AM6ayQ9aMCMxOjgnbmvarcBPJ+chkdQHYtKNoNYUrYCRAkfjVUBU7AUvRyGtXoZITUneP5mbx6q2mwfO4s/7zM685YJg+FTTlU5W8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Yv54uSToHu3GXfl8o/Cbueuu8ycC+XZ4mfq2v44JiA=;
 b=L6MIVOTdc9ljSjdjYiKc1M5BrUbcCxh1DBkActR4wxtAvs15/mvspaqPb/QF4fiEMv0yWaATcHyFZ77x0O7eE/rUlrxdQdAkEQLqchRMbGfWEISEKChjzP/onGdVGBRlvYCepInaq9cqZgcLjDgdRJNHlmvJDDaQ/LTJX/WeeBs=
Received: from OSAPR01MB3057.jpnprd01.prod.outlook.com (52.134.248.141) by
 OSAPR01MB1955.jpnprd01.prod.outlook.com (52.134.235.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.17; Fri, 10 Apr 2020 02:03:34 +0000
Received: from OSAPR01MB3057.jpnprd01.prod.outlook.com
 ([fe80::c41b:4bf7:2ad1:6fc7]) by OSAPR01MB3057.jpnprd01.prod.outlook.com
 ([fe80::c41b:4bf7:2ad1:6fc7%3]) with mapi id 15.20.2900.015; Fri, 10 Apr 2020
 02:03:34 +0000
From:   Xiaojian Cao <xiaojian.cao@cn.alps.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Masaki Ota <masaki.ota@alpsalpine.com>
CC:     Artem Borisov <dedsa2002@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tetsuya Nomura <tetsuya.nomura@alpsalpine.com>,
        "vadim@cirque.com" <vadim@cirque.com>,
        "pod.alcht@cn.alps.com" <pod.alcht@cn.alps.com>
Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Topic: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Index: AQHWDr0x2NbbGmh+BEarMrC/TfssrKhxZ8AAgAAQo0CAAA1IgIAADdJg
Date:   Fri, 10 Apr 2020 02:03:33 +0000
Message-ID: <OSAPR01MB305721805C57AEC99D48F107C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com>
 <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <nycvar.YFH.7.76.2004100245260.19713@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2004100245260.19713@cbobk.fhfr.pm>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaojian.cao@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50ce6a8a-5e3e-46c2-65e4-08d7dcf35ff5
x-ms-traffictypediagnostic: OSAPR01MB1955:
x-ld-processed: 57e76998-77bd-4b82-a424-198f46eb2254,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB19553BAEB371A68EF9BD8F07C8DE0@OSAPR01MB1955.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3057.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(4326008)(55016002)(52536014)(76116006)(966005)(66946007)(86362001)(66476007)(71200400001)(107886003)(8936002)(64756008)(66556008)(66446008)(5660300002)(186003)(2906002)(26005)(54906003)(110136005)(7696005)(478600001)(9686003)(6506007)(316002)(53546011)(8676002)(85182001)(81156014)(33656002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1hWjIUCsWV29y2bjce9VRSl3lDHZx0b0637rhYmHI+xSlFpNYumnT73Fm0FzPFXHV0JKq26M9T7NVAT679fwo0eajTQbZlAiVHWnL5G2wUscWB1F49+Qa+KYy4MIDxkP7WWqRZKFZ916aeIfg6A0yhO0vk2GwcYu9ri8M/S1dwHdqtgc88JT3w60nCfLzckRKfCc2gQc10ReLzfGHV5tGUKVEUOZtjohemK/UGjk9JJmGzfQRfDC/BR8Ntpn56vJgL+KP3XzbXUGMmo4Cu3fWm1TwcPvK6pBqSrSIr9HHdhtRhaKUJT8bhWNXCXB+IMkCOIhvFerCRp05pj1mFeCvTHN5AvAOg+l5FhfqM6Tb1LPjKvCC3tvIuyY11kKiYl+HvZM1kueoCR4Mpo6wrGdfIrC0/cpWuzOTfhEoUxjoj9GVuzqV3qSZJA411LWEiICEhorPKOXWAQ6R1lsUojsmB6pQmS8j/I1aexVL1p/fJalPaCfxeVtS3KM+c42AsDtT+NEVcxcgcsGF+26qrDHA==
x-ms-exchange-antispam-messagedata: t82Aa5BEyr25orwuCh1Mv67UIwKoCPyAyOGbgXG+0o0vt+3v7sQoTf37L1dY8kg9Ea0SMGexGB2cIlU0zTMrkfQ5ZkRFHh1hw+1qPS6UsjCU2+6P/BvWknQIYfBYZ0nbn43UvFfSsw9j87hNQ4nExA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ce6a8a-5e3e-46c2-65e4-08d7dcf35ff5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 02:03:33.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eX//MJ6uopyVbXy6+GRTE55iMgOsOIhTrD5h7qeE0vGdik5um8JHDpMyOKI/rp03vM7MaO8YaalIIQBtey2nnv4Q/1DyOC+Vvgnc8cxPLLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1955
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgSmlyaS1zYW4sDQoNClRoYW5rcyBmb3IgeW91ciBpbmZvcm1hdGlvbi4gSSB3aWxsIGxvb2sg
aW50byBpdC4NCg0KQmVzdCBSZWdhcmRzLA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KSmFzb24gQ2FvKOabueaZk+W7uikNCg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5vcmc+IA0KU2Vu
dDogRnJpZGF5LCBBcHJpbCAxMCwgMjAyMCA4OjQ3IEFNDQpUbzog5aSq55SwIOecn+WWnCBNYXNh
a2kgT3RhIDxtYXNha2kub3RhQGFscHNhbHBpbmUuY29tPg0KQ2M6IOabuSDmm4nlu7ogWGlhb2pp
YW4gQ2FvIDx4aWFvamlhbi5jYW9AY24uYWxwcy5jb20+OyBBcnRlbSBCb3Jpc292IDxkZWRzYTIw
MDJAZ21haWwuY29tPjsgQmVuamFtaW4gVGlzc29pcmVzIDxiZW5qYW1pbi50aXNzb2lyZXNAcmVk
aGF0LmNvbT47IEhlbnJpayBSeWRiZXJnIDxyeWRiZXJnQGJpdG1hdGgub3JnPjsgbGludXgtaW5w
dXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0
OiBSRTogW1BBVENIIDIvMl0gSElEOiBhbHBzOiBSZWZhY3RvciBheGlzIHJlc29sdXRpb24gbG9n
aWMNCg0KT24gRnJpLCAxMCBBcHIgMjAyMCwgTWFzYWtpIE90YSB3cm90ZToNCg0KPiBIaSwgQ2Fv
LXNhbiwNCj4gDQo+IERvIHlvdSBrbm93IEFVSTE2NTcgZGV2aWNlPyBUaGlzIGRldmljZSBsb29r
cyBVMS4gSSB0aGluayByZWNlbnQgYWxsIA0KPiBVMSBkZXZpY2VzIHdvcmsgYXMgUFRQLiBMaW51
eCBhbHNvIHN1cHBvcnRzIFBUUCwgc28gSSB0aGluayB3ZSBzaG91bGQgDQo+IGFkZCBzb21ldGhp
bmcgSUQgdG8gTGludXggc291cmNlIGNvZGUuIChJIHJlbWVtYmVyIGEgc29tZXRoaW5nIGZsYWcg
aXMgDQo+IGFscmVhZHkgZXhpc3QuKQ0KDQpUaGF0J3MgYWN0dWFsbHkgcGFydGlhbGx5IGNvdmVy
ZWQgYnkgQXJ0ZW0ncyAxLzEgcGF0Y2ggeW91IGhhdmUgbm90IGJlZW4gQ0NlZCBvbiAtLSBwbGVh
c2Ugc2VlIGl0IGhlcmU6DQoNCglodHRwOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDA0MDUyMzU1
MTcuMTgyMDMtMS1kZWRzYTIwMDJAZ21haWwuY29tDQoNCklmIHRoaXMgY291bGQgYmUgbWFkZSBt
b3JlIGdlbmVyaWMgdG8gY292ZXIgYSBncm91cCBvZiBkZXZpY2VzIGFsbC1pbi1vbmUsIHRoYXQn
ZCBiZSBldmVuIGJldHRlciBvZiBjb3Vyc2UuDQoNClRoYW5rcywNCg0KLS0NCkppcmkgS29zaW5h
DQpTVVNFIExhYnMNCg0K
