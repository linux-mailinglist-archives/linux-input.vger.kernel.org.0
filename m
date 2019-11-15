Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA7EFE4C9
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 19:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfKOSSM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 13:18:12 -0500
Received: from mail-eopbgr740074.outbound.protection.outlook.com ([40.107.74.74]:55869
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbfKOSSL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 13:18:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMgYyGw4cdfEj+SVcqKgFvAWcdj4HiNWYo1xiqLMvC5r6BF5wHz82GTHN998BQF4OuxvpRjRsZlVA+hbMDIgYmNCEPS6MPDZS8ohRHt+W6dk7ijaoTcKLAdYNIj7yHWt3kk0JKNcGdUAgKLOLmb0S7EZ3aXpWxezsLRFjgZaXhqfl0tOBY+p12v1i6ERjhSz8Cd1zt6IgCs1aPx2NDiMYG1epCOZI3KoEN0756pNguux+DQeDqzr3pVYDm+7HgTFSoLpfle5oGoJeINfHAKOhuMxTUda+M/5LiKZ6xvON869bBFulYUv48oqG4athgmuNLnxUAYQvN/lzMCEfeHVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHCg1bWmog4P7dTsXlgHFUelS7KBCYbjQ8FINGZt1rg=;
 b=VUMYuP6UyM4HdAWEAoutpY5GqMA9KXvWqyFa8UmEPsEpDdxkvzebn+sZhQ8wo74e/Jjj3PKP7fbvNblMlpK9AYvrH6MtN3xfEmArJkxbXw+hFmJdIw+lGR7i7goKvNJNvciBw45K6BeGWq+XmixIqvLVi52vvH/hbz3g7+PgzMRk7uDkEy3G/pMesdVNlowyJJXwqNOTQSPN6k4o7OqXolOvA8unKz++8Ab2jPPViNzo/7UmIMUF5jzEnyXJ0vl8tF6Ss4HYIOXo0Fu/DShskifTjMePcGb1ye7Ds5LMak8eDCmKaB/B7gI20BUeizQBquA5GXWYbiPQZqoQkd+OHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHCg1bWmog4P7dTsXlgHFUelS7KBCYbjQ8FINGZt1rg=;
 b=m/WdvZut2ceXvf3zBQzc8P/Pb0pRILpdL3Oco1FS794TUN6Wm3dnM8FuxHBQoNFElz3UDzzksduZSNLCsHwQN1GKnuQvVWRt0ZYc9ABl5ewz4stKaI5WuuxMTOmJDY6ju17WkwbCPjCv3iWBmMWRF28aWCT0moKOan+rksuKvHo=
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4102.namprd03.prod.outlook.com (20.177.184.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.28; Fri, 15 Nov 2019 18:18:05 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::1c9c:d382:1308:515c%7]) with mapi id 15.20.2451.024; Fri, 15 Nov 2019
 18:18:05 +0000
From:   Andrew Duggan <aduggan@synaptics.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Federico Cerutti <federico@ceres-c.it>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] HID: rmi: Check that the RMI_STARTED bit is set before
 unregistering the RMI transport device
Thread-Topic: [PATCH] HID: rmi: Check that the RMI_STARTED bit is set before
 unregistering the RMI transport device
Thread-Index: AQHViUCO+DvinpbczkaNw8YBbxu2f6eMf6eAgAAv4gA=
Date:   Fri, 15 Nov 2019 18:18:05 +0000
Message-ID: <6931c116-78fb-9ad9-aab1-f15799118c82@synaptics.com>
References: <20191023012344.20998-1-aduggan@synaptics.com>
 <nycvar.YFH.7.76.1911151626120.1799@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1911151626120.1799@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.147.44.15]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: BY5PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::27) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1f5310c-aef9-4935-89f3-08d769f8288b
x-ms-traffictypediagnostic: BYAPR03MB4102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR03MB4102335D987479795638DC14B2700@BYAPR03MB4102.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(366004)(136003)(376002)(189003)(199004)(7736002)(6916009)(446003)(305945005)(6436002)(31686004)(71190400001)(71200400001)(3846002)(6116002)(2906002)(6486002)(26005)(102836004)(186003)(229853002)(99286004)(76176011)(14444005)(52116002)(54906003)(256004)(53546011)(6506007)(6306002)(386003)(6512007)(36756003)(81156014)(81166006)(31696002)(25786009)(8676002)(8936002)(5660300002)(64756008)(66556008)(58126008)(66946007)(66446008)(6246003)(66476007)(14454004)(66066001)(65956001)(65806001)(486006)(316002)(11346002)(2616005)(476003)(966005)(4326008)(478600001)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4102;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jx8oUhnbaTb9ZitLHct6MLRAotshroOs5pU511310Gqtj4/1Vg1R3pv+2VsDdLvJezBeXSDQ/UxOhUbbHZcbipfuiO4WHHKRjn80MrM8t+VzjgofehIO5VqkQARdC0d73lciblASObwNR7RsJ8XSOXBU0qXfMOmOFAVN7UgDhhIiwmULD2VgyfANH0NpzkXO3ZlleRrzz0IFZGJ16FDCE95pLt3VBtr0lb8MQeQGbeOx1qF2R2hFdDecVeqobk3NEWYyI/leAzgjzEIUHnxViQc4llAGkjcKWzjiHHDEoVtUkOlloXj56jqwJJoHsmGz1O642wenEkVolDYmWS5vX0i58xruFl6x+M8xKu+q7mszGlo+HbVx65i/b6GjdEifYGVU762VWf/4b/uJPrOblopktEWd1tW9CGpzyKaGfBRy7N34FT7hiwB6UhK/0TjG
Content-Type: text/plain; charset="utf-8"
Content-ID: <38554E44C9542540B972DAD2A5324127@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f5310c-aef9-4935-89f3-08d769f8288b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 18:18:05.2681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8ItCs5QQlZhXhEIdN03e7bOOmn1Sq/oUCreKedr/fsGv8BgGR+tUDQsOHReT9f7ydUBJHtqklyRZZs2p2IyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4102
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgSmlyaSwNCg0KT24gMTEvMTUvMTkgNzoyNiBBTSwgSmlyaSBLb3NpbmEgd3JvdGU6DQo+IE9u
IFdlZCwgMjMgT2N0IDIwMTksIEFuZHJldyBEdWdnYW4gd3JvdGU6DQo+DQo+PiBJbiB0aGUgZXZl
bnQgdGhhdCB0aGUgUk1JIGRldmljZSBpcyB1bnJlYWNoYWJsZSwgdGhlIGNhbGxzIHRvDQo+PiBy
bWlfc2V0X21vZGUoKSBvciBybWlfc2V0X3BhZ2UoKSB3aWxsIGZhaWwgYmVmb3JlIHJlZ2lzdGVy
aW5nIHRoZSBSTUkNCj4+IHRyYW5zcG9ydCBkZXZpY2UuIFdoZW4gdGhlIGRldmljZSBpcyByZW1v
dmVkLCBybWlfcmVtb3ZlKCkgd2lsbCBjYWxsDQo+PiBybWlfdW5yZWdpc3Rlcl90cmFuc3BvcnRf
ZGV2aWNlKCkgd2hpY2ggd2lsbCBhdHRlbXB0IHRvIGFjY2VzcyB0aGUNCj4+IHJtaV9kZXYgcG9p
bnRlciB3aGljaCB3YXMgbm90IHNldC4gVGhpcyBwYXRjaCBhZGRzIGEgY2hlY2sgb2YgdGhlDQo+
PiBSTUlfU1RBUlRFRCBiaXQgYmVmb3JlIGNhbGxpbmcgcm1pX3VucmVnaXN0ZXJfdHJhbnNwb3J0
X2RldmljZSgpLg0KPj4gVGhlIFJNSV9TVEFSVEVEIGJpdCBpcyBvbmx5IHNldCBhZnRlciBybWlf
cmVnaXN0ZXJfdHJhbnNwb3J0X2RldmljZSgpDQo+PiBjb21wbGV0ZXMgc3VjY2Vzc2Z1bGx5LiBB
IHN1YnNlcXVlbnQgcGF0Y2ggaW4gdGhlIFJNSSBjb3JlIHdpbGwgYWRkDQo+PiBjaGVja3MgdG8g
dmFsaWRhdGUgdGhlIHBvaW50ZXJzIGJlZm9yZSBhY2Nlc3NpbmcgdGhlbS4NCj4gQW5kcmV3LA0K
Pg0KPiBteSBtYWlsYm94IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIHRoYXQgJ3N1YnNlcXVlbnQgcGF0
Y2gnIC4uLiB3YXMgaXQgZXZlcg0KPiBzZW50IGFuZCBJIG1pc3NlZCBpdD8gSWYgc28sIGNvdWxk
IHlvdSBwbGVhc2UgcmVzZW5kIGl0Pw0KDQpUaGUgc3Vic2VxdWVudCBwYXRjaCB3aGljaCBJIHdh
cyByZWZlcnJpbmcgdG8gaXM6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlucHV0
LzIwMTkxMDIzMDEyMzQ0LjIwOTk4LTItYWR1Z2dhbkBzeW5hcHRpY3MuY29tLw0KDQpTaW5jZSB0
aGlzIHNlY29uZCBwYXRjaCB3YXMgZm9yIHRoZSBpbnB1dCBzdWJzeXN0ZW0gSSBkZWNpZGVkIHRv
IGp1c3QgDQptYWtlIHRoZW0gc2VwYXJhdGUgcGF0Y2hlcyBpbnN0ZWFkIG9mIGNyZWF0aW5nIGEg
c2VyaWVzLiBIb3dldmVyLCBiYXNlZCANCm9uIERtaXRyeSdzIGZlZWRiYWNrIGl0IHdhcyBkZXRl
cm1pbmVkIHRoYXQgdGhlIHNlY29uZCBwYXRjaCB3YXNuJ3QgYSANCmdvb2QgaWRlYSBhbmQgaXQg
d29uJ3QgYmUgYXBwbGllZC4gVGhpcyBmaXJzdCBwYXRjaCBpcyBlbm91Z2ggdG8gZml4IHRoZSAN
Cmlzc3VlIGJ5IHByZXZlbnRpbmcgdGhlIGNhbGwgdG8gcm1pX3VucmVnaXN0ZXJfdHJhbnNwb3J0
X2RldmljZSgpIGlmIHRoZSANCnN1YnNlcXVlbnQgY2FsbCB0byByZWdpc3RlciBmYWlsZWQuIFRo
ZSBvbmx5IGNoYW5nZSBJIHdvdWxkIG1ha2UgdG8gdGhpcyANCnBhdGNoIHdvdWxkIGJlIHRvIHJl
bW92ZSB0aGUgbGFzdCBzZW50ZW5jZSBvZiB0aGUgY29tbWVudC4gSWYgeW91IGNob29zZSANCnRv
IGFwcGx5IHRoYXQgcGF0Y2ggdGhlbiB3b3VsZCB0aGlzIGJlIGEgY2hhbmdlIHlvdSB3b3VsZCBt
YWtlPyBPciB3b3VsZCANCnlvdSBwcmVmZXIgSSBzdWJtaXQgYSB2MiB3aXRoIHRoaXMgdXBkYXRl
Pw0KDQpUaGFua3MsDQoNCkFuZHJldw0KDQoNCj4gVGhhbmtzLA0KPg0KPiAtLQ0KPiBKaXJpIEtv
c2luYQ0KPiBTVVNFIExhYnMNCj4NCg==
