Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5351FC3F6
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 04:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgFQCFc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jun 2020 22:05:32 -0400
Received: from mail-eopbgr1400078.outbound.protection.outlook.com ([40.107.140.78]:25310
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbgFQCFb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jun 2020 22:05:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=My5/ZIbFFh7qbW3s8RGHoAf0ID6usQKzhWsLVjga1wBU4KKcnQVfZ4TxbMa+HB16ZbeJ1bSEas7JUgJ9CDmywJvTutkxsuhh5CFPBfyYqB1d+Fke7/mV1MOqmzfIfXJIv7L1PORoqDWCRMmbzYtuRO06yfPO9CemvOQFEKpBovkIAIx02AAO8xdwsX0zvj7auVBLTDKI/A8lvEPdH6NdelHFS6CUI4Ib8faTFfM17WuSt0C4qmFkJTM21jpT0Ud9qG5kTPsSjwKcNw07b+bxdg3JHtPRawGppQfapCop9TLU1vloGrjILh/lxnBAdjo2NpeKaMkHypdRvVD4zI6Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFasf4W8HtvR1UdhoT9D0199vY5PnuuYpFk3Y1SWbB8=;
 b=QKND1CAuZbi3F0Ww5Zd5x18+XpaD3D2Aq4RokvyLWKFa50V9co8HAQLzh/iuy/sDMTw6c4F2Au+T6PwwZSjizvP/9CnGx+1U0Bg6OOr/o5qKsiWMtyyTljBRKdDIedSeveHPb5IfShN3hPdZpOLVlOrfpqXmsOd9JvU8W/RqI6XGNl8t7UJX7HQeZ5p5/aARWBS2uK+SwGpBgudwo1aFtWLpSqs+pDOcXm8Ju5Dbn+e6MSuvxhAYaMQJjnLCRG7EEqgJ67ZdfbiZNZDua6JenH7roOGYnAHW2QnQMeqNLW8+ES2F9c28sTh76VSll6bRRV23hMaCXwbEPShyCjIItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFasf4W8HtvR1UdhoT9D0199vY5PnuuYpFk3Y1SWbB8=;
 b=BUmf5/PA1oJTASzJdBgm5yAFYZWXOg1kPOhiA9/F2NlLwH1IHgrkW+hhxJdViJIwkl0HvecHitp6aZAH2gFDRDzLq5D4S6pzxXgj7R0bNpUXIf5GKPbBmOGZgnpVlXpPrIbKif94E3hrPA26z6WHdYpuWAPGv/4Pk2i/+iRPw90=
Received: from OSBPR01MB3766.jpnprd01.prod.outlook.com (2603:1096:604:44::17)
 by OSBPR01MB4038.jpnprd01.prod.outlook.com (2603:1096:604:40::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 17 Jun
 2020 02:05:28 +0000
Received: from OSBPR01MB3766.jpnprd01.prod.outlook.com
 ([fe80::192b:cd5e:dd7:5d3e]) by OSBPR01MB3766.jpnprd01.prod.outlook.com
 ([fe80::192b:cd5e:dd7:5d3e%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 02:05:28 +0000
From:   Caiyuan Xie <caiyuan.xie@cn.alps.com>
To:     Jiri Kosina <jikos@kernel.org>, Caiyuan Xie <shirleyxcy@gmail.com>
CC:     "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBzdXBwb3J0IG90aGVyIGRldmljZSB3aGljaCByZXBv?=
 =?gb2312?Q?rt_id_is_2?=
Thread-Topic: [PATCH] support other device which report id is 2
Thread-Index: AQHWMBhVlXymzaHn70i+cLR71dSNhajbhisAgACv7uA=
Date:   Wed, 17 Jun 2020 02:05:26 +0000
Message-ID: <OSBPR01MB37660339EB6F506E1D576196AA9A0@OSBPR01MB3766.jpnprd01.prod.outlook.com>
References: <20200522090610.5856-1-Shirleyxcy@gmail.com>
 <nycvar.YFH.7.76.2006161730310.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006161730310.13242@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cn.alps.com;
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e2bd4492-5787-4499-6961-08d81262e86e
x-ms-traffictypediagnostic: OSBPR01MB4038:
x-microsoft-antispam-prvs: <OSBPR01MB4038E6AEA76BDFA06A78133DAA9A0@OSBPR01MB4038.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 04371797A5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbTncO3Gx2E/mTZRo0uQ1e8ofpl21Ie89KcgZG4JkI87QTlcbvIRGA01Vy+ETAkW4Nuh6P1AHSuSTsZtqJo4hC29DaMxHwNtqvTEHfXHz8zMog7eV+qUVoTG/g3/djh9l0dSy5nZbmLGTF1whpTU0ZamkNFuupunghuLyGlLTTHtvSKvC4YJevO3grd3GE5jJZCHp5yTXAPwqJvuEXCWMzCCG31DngEMvclnipkVlsP0b/Q5bBrPea3lnQXg65ICfmb4sjkjlHLSJ6gxfS2MgFb8+f3B9hbtzSzQ3FJpKlIb+Xz/r8rQOjchuiSAP5NSucbMK0eOJVRc3fmRb8537A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3766.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(52536014)(9686003)(55016002)(85182001)(26005)(478600001)(4744005)(6506007)(5660300002)(4326008)(7696005)(110136005)(54906003)(8936002)(86362001)(316002)(224303003)(66946007)(186003)(66476007)(76116006)(66556008)(83380400001)(33656002)(64756008)(66446008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: LVdkcV40hOYh031EuvlfPD6ezYJRcvtT2hEPjQ0ezAvRNoSNShKumxpEgVeteJi11ps6Nj5h1bTz9gVsSgIdw5al/k5Tc+D/KGdLFyVozQIVhiw87aYmlxJK0/uL+PnbS6CdfNfUHrqMke1QZymZisWgq95iGTD4diS2OrpulG+u/t5OfgobwBBeQaGFcvcB2Y+GdLXKyyfzkLxvAGu0+s621Hqn3ryH/HeO0/mgrXgafiFtQfsYR7BEpWY04Mxm/5eybku62HUZi0W8Q1n7cC1fsgpcjVp5nzTlfK9HD9fMVXcfe2ul6Y1bHmSC8Qj1chC4I8LcpZh1ncTNhyVZbEcnYAnOUTt+DTv4o8AnEx60/m0XwTit4fW0zsnHekylJmtCBEW/CjCw26urcPKqW5CchTVr/fx89HY48MvyLIFxa6/52L5Q80Y5JIlgUZn837P2dqqCWolYF6HTGIbqWttpOQPeAr/iXhGIXgiAADY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bd4492-5787-4499-6961-08d81262e86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2020 02:05:28.5541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oh667S/roGCkYO79DssSqQX3qb702D/geFOCtFR0NLSt1+vJGG68/ScMnl0nYiutqNmDpYaG+1OEgI3Ezc0mDzPrGs3/Fs6yaxtBqmOF0es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4038
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQpIaSBKaXJpLA0KDQpUaGFua3MgZm9yIGdyZWF0IHN1cHBvcnQuDQpJIHdpbGwgY2hlY2sgdGhl
IGNvbW1pdCBzdHlsZS4NCg0KQmVzdCBSZWdhcmRzDQpTaGlybGV5DQoNCi0tLS0t08q8/tStvP4t
LS0tLQ0Kt6K8/sjLOiBKaXJpIEtvc2luYSA8amlrb3NAa2VybmVsLm9yZz4gDQq3osvNyrG85Dog
MjAyMMTqNtTCMTbI1SAyMzozMQ0KytW8/sjLOiBDYWl5dWFuIFhpZSA8c2hpcmxleXhjeUBnbWFp
bC5jb20+DQqzrcvNOiBiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0LmNvbTsgbGludXgtaW5wdXRA
dmdlci5rZXJuZWwub3JnOyDWeCCyyohBIENhaXl1YW4gWGllIDxjYWl5dWFuLnhpZUBjbi5hbHBz
LmNvbT4NCtb3zOI6IFJlOiBbUEFUQ0hdIHN1cHBvcnQgb3RoZXIgZGV2aWNlIHdoaWNoIHJlcG9y
dCBpZCBpcyAyDQoNCk9uIEZyaSwgMjIgTWF5IDIwMjAsIENhaXl1YW4gWGllIHdyb3RlOg0KDQo+
IEZyb206IENhaXl1YW4gWGllIDxjYWl5dWFuLnhpZUBjbi5hbHBzLmNvbT4NCj4gDQo+IDxDaGFu
Z2UgbGlzdD4NCj4gLXN1cHBvcnQgb3RoZXIgZGV2aWNlIHdoaWNoIHJlcG9ydCBpZCBpcyAyLg0K
DQpJJ3ZlIGNoYW5nZWQgdGhlIHBhdGNoIHRpdGxlIGFuZCBjaGFuZ2Vsb2cgYSBsaXR0bGUgYml0
IHNvIHRoYXQgaXQncyBpbiBsaW5lIHdpdGggdGhlIGdlbmVyYWwga2VybmVsIGNoYW5nZWxvZyBz
dHlsZSwgYW5kIGFwcGxpZWQuDQoNClBsZWFzZSBjaGVjayBob3cgaXQgbG9va3MgbGlrZSBmb3Ig
dGhlIGNvbW1pdCwgYW5kIHRyeSB0byBnZXQgY2xvc2VyIHRvIGl0IHdpdGggYW55IGZ1dHVyZSBz
dWJtaXNzaW9ucy4NCg0KVGhhbmtzIQ0KDQotLQ0KSmlyaSBLb3NpbmENClNVU0UgTGFicw0KDQo=
