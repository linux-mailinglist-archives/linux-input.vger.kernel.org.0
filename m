Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1A61ABC40
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 11:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502829AbgDPJJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 05:09:47 -0400
Received: from mail-eopbgr1400058.outbound.protection.outlook.com ([40.107.140.58]:1883
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2503327AbgDPJJm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 05:09:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0oJnanGNDxjIxH1eQGLP/8z+YOQkMpptp6RvEwG0ZUQwmdG1Hkd95wJZG/5e1J11rv1dAU0lHL0uLhck/vA/Ui3leDxoo2deO9KGo6ceFTftyoJfSHZyAWG827J/QA+LYPNRzuPk+tR9ppvKGj+ADGWFk3MLNSOUx5wzSmJutJlRTk0CeXJhwmBkjS2+Bimb37m1l+eMmS1NydWkeLhh4GkEHEa/Ju5J499xWHW8DzvtIaTSabpSYUwCpjVEyym6VIrZcr77XZaGjqNGo79rA/7H5wlWVXfn9K5kGS4B88K9zACBp8uQ31KaWO2ym2qLXiAtw7FFCNVoKOmqCjFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGZ6+4REr0mAOknTMlxS8xkrAFiHVtSp5WzEkJlzzHw=;
 b=od2bSO+22cqFvhh2b5ogU3P9be0ObA1pFnNITnTJDgNZeQ/agLwJKXoxSkeDchGWUJ1BTLO/qJOzHkCGDLBBpWGx4SYB/JvIDKZ7mnQvS4FBw4MUEQL9GRn14Sc0UbQ+k13lUJYBAvEZ2TNsBAwSnwXAzAWumqqxScAwREw7wdMrfcWXqnEufLqxIDwqhG8s+abxaOVqkOfgw8dL/YGaf4yxigjC9wFCp2GzBYR0mV8t70/7m1H1qIcu0lNHi5smcvTLidEU+KQJiB/LtXMMaKNRbTYYhOJpL1XKQFefY/PEsQGCABOiA9lUJGDx7GYCMg+H8nNMlNu/tHOl4gImow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGZ6+4REr0mAOknTMlxS8xkrAFiHVtSp5WzEkJlzzHw=;
 b=sgr+zL9HddDj+sJwg1LJjlTHi2vBbClNkFvXkCu+0uTZKGqMvFZWRGbUufnbjXDfE/e4FKxuE+4a6sfkA0WZn2JK8SzL9B/hNAh65SgbWWyg2MbGqcFk+USYIWFHT5gcPrKdinm6GNx+t+q8WPgQD9SJaJfGVGTunUpPNG9gh5c=
Received: from TYAPR01MB3072.jpnprd01.prod.outlook.com (20.177.105.74) by
 TYAPR01MB3885.jpnprd01.prod.outlook.com (20.178.138.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25; Thu, 16 Apr 2020 08:52:07 +0000
Received: from TYAPR01MB3072.jpnprd01.prod.outlook.com
 ([fe80::913f:943e:46d4:6a74]) by TYAPR01MB3072.jpnprd01.prod.outlook.com
 ([fe80::913f:943e:46d4:6a74%6]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 08:52:07 +0000
From:   Xiaojian Cao <xiaojian.cao@cn.alps.com>
To:     Artem Borisov <dedsa2002@gmail.com>
CC:     Masaki Ota <masaki.ota@alpsalpine.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tetsuya Nomura <tetsuya.nomura@alpsalpine.com>,
        "vadim@cirque.com" <vadim@cirque.com>,
        "pod.alcht@cn.alps.com" <pod.alcht@cn.alps.com>
Subject: RE: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Topic: [PATCH 2/2] HID: alps: Refactor axis resolution logic
Thread-Index: AQHWDr0x2NbbGmh+BEarMrC/TfssrKhxZ8AAgAAQo0CAAA8hsIAADIzggAADu+CAB1VEgIAAlyTwgABrVQCAAADvYIAAD3mAgAF3bcA=
Date:   Thu, 16 Apr 2020 08:52:07 +0000
Message-ID: <TYAPR01MB3072BBC14F0F73BD0FCB3130C8D80@TYAPR01MB3072.jpnprd01.prod.outlook.com>
References: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
 <20200409230009.22551-1-dedsa2002@gmail.com>
 <TYAPR01MB3871E974EFE06EBF40074470ECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C2FB967974B98B224610C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <TYAPR01MB387100BC93864B0A93598BFBECDE0@TYAPR01MB3871.jpnprd01.prod.outlook.com>
 <OSAPR01MB3057C914C96A8DCC47925502C8DE0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxLXT2fMdhmnfj3ZH2Ptc50nvMVU0nAvW-3fw-wAKb9rYQ@mail.gmail.com>
 <OSAPR01MB305753C5B0DD35DE7001436DC8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxKfJBWb45PuA-1t=-ZysyUVZZmXJH=D2bSacoh2akJ0Zw@mail.gmail.com>
 <OSAPR01MB30571BF938FF882F7FB22853C8DB0@OSAPR01MB3057.jpnprd01.prod.outlook.com>
 <CAMr=fxJK3=Ytna5WuMOWc=nNJ3ZvwSJRx4-epoktw_vULBm0Tw@mail.gmail.com>
In-Reply-To: <CAMr=fxJK3=Ytna5WuMOWc=nNJ3ZvwSJRx4-epoktw_vULBm0Tw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaojian.cao@cn.alps.com; 
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 925ae631-81f3-4919-e1af-08d7e1e37160
x-ms-traffictypediagnostic: TYAPR01MB3885:
x-ld-processed: 57e76998-77bd-4b82-a424-198f46eb2254,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB3885286E4F33951819D5A53AC8D80@TYAPR01MB3885.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB3072.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(8676002)(7696005)(26005)(316002)(2906002)(54906003)(81156014)(86362001)(8936002)(6916009)(53546011)(6506007)(71200400001)(55016002)(9686003)(66556008)(186003)(66446008)(66946007)(107886003)(66476007)(4326008)(76116006)(5660300002)(85182001)(30864003)(52536014)(33656002)(64756008)(478600001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: cn.alps.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Ip4X4h3/IfCziod0Tze5vCer9Ors9eFZ/OZja9LjbkLhxJqPmkbLieElqTcOq2MMXjJQJgxfW44BC19KLrnxMBZ9MUt+QhgEK6kMJyDbbr+Di1Y4dLkKImccfjvfMP2K/LpsXzaudewv2HdzVuCt8AAul5/apWuTFGiI1RYXbSpB46DPbsGK8p/0YjpnIl4gsZFSMuBcRJRl1Q96oVWapOEQp+K8oFXsGbE2WXaTFfZbJURecgc/Yu8V0LI5o78oVq8rQvos7LxurqKp7NmmwQYm/GEh178oBL4C8G4BtcKNzbDFhTJCXRqqbkEcLyjMSA748CT1vt+0QsrPm4Zr3c7rHZxKwOGurUhQm8+OierC/kSlk2ejNBjfW7vzjHvSa0cE8l4IAjv4f+lYzO9hTFyGl5GsTO7iSOO9ETIJk3h5XarhyJlEW4ip0iQXoG1
x-ms-exchange-antispam-messagedata: uzL9uWQQqviFaKM1NzPTzTR5wecP6KfZF2MfHNs8yYtGQ4JQKZX4H92bLsbmODhEP5cf5fdtJ1Yt09Ev/zXTWOsd7Bqdt+C3bnzEdZztHLL5HEC3mWgMnXJiVWJ/XsZtXsxp7eN2+rdaWWEt/NSQFQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925ae631-81f3-4919-e1af-08d7e1e37160
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 08:52:07.0645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P17ETCP08LKZWzh+GjpcaIjy07oeUQA9newkyd+jgT5nwLWcuDTS+gRkJh2eyf9mdYmg2+nO+9rIAfkZSopcsLRcHwk/PuG3xrUNXehT0FE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3885
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgQXJ0ZW0sDQoNClllcywgb2YgY291cnNlLCB3ZSBhcmUgYWxzbyB0YWxraW5nIHdpdGggSmly
aS4NCkJUVzoNCglXaGF0J3MgeW91ciBqb2IgYW5kIHJlc3BvbnNpYmlsaXR5Pw0KDQoNCkJlc3Qg
UmVnYXJkcywNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Ckphc29uIENhbyjmm7nmmZPlu7opDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEFydGVtIEJvcmlzb3YgPGRlZHNhMjAwMkBnbWFpbC5jb20+IA0KU2VudDogV2VkbmVzZGF5
LCBBcHJpbCAxNSwgMjAyMCA2OjE1IFBNDQpUbzog5pu5IOabieW7uiBYaWFvamlhbiBDYW8gPHhp
YW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT4NCkNjOiDlpKrnlLAg55yf5ZacIE1hc2FraSBPdGEgPG1h
c2FraS5vdGFAYWxwc2FscGluZS5jb20+OyBqaWtvc0BrZXJuZWwub3JnOyBCZW5qYW1pbiBUaXNz
b2lyZXMgPGJlbmphbWluLnRpc3NvaXJlc0ByZWRoYXQuY29tPjsgSGVucmlrIFJ5ZGJlcmcgPHJ5
ZGJlcmdAYml0bWF0aC5vcmc+OyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOmHjuadkSDlk7Llk4kgVGV0c3V5YSBOb211cmEgPHRldHN1
eWEubm9tdXJhQGFscHNhbHBpbmUuY29tPjsgVmFkaW0gS2xpc2hrbyA8dmFkaW1AY2lycXVlLmNv
bT47ICNBTENIVF9NTF9QT0RfQ04gPHBvZC5hbGNodEBjbi5hbHBzLmNvbT4NClN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBISUQ6IGFscHM6IFJlZmFjdG9yIGF4aXMgcmVzb2x1dGlvbiBsb2dpYw0K
DQpXZWxsLCBhdCB0aGF0IHBvaW50IGl0J3Mgc29tZXRoaW5nIHlvdSBzaG91bGQgdGFsayB0byBo
aWQgbWFpbnRhaW5lcnMgYWJvdXQuIFRoZSBiYXNlIHBhdGNoIGlzIGFscmVhZHkgc3VibWl0dGVk
IGFuZCBzY2hlZHVsZWQgZm9yIDUuNyBhcyBpdCdzIGVub3VnaCB0byBtYWtlIHRoaXMgdG91Y2hw
YWQgd29yay4gVGhlIHNlY29uZCBvbmUgaXMgbWFpbmx5IG5lY2Vzc2FyeSB0byBmaXggdGhlIGRl
YWR6b25lcyBhcm91bmQgdGhlIGNvcm5lcnMgYW5kIHRoYXQgd2FzIHRoZSBvbmUgdG8gcmV2aWV3
LiBJZiB5b3UgcHJlZmVyIHRvIG5vdCBoYXZlIGFueSBtYWpvciByZWZhY3RvcmluZyB1bnRpbCB5
b3UgcHJlcGFyZSBhIGJldHRlciBwYXRjaCwgSSdtIG9rYXkgd2l0aCB0aGF0LCBzaW5jZSB3ZSBj
YW4gd29ya2Fyb3VuZCB0aGUgcmVzb2x1dGlvbiBpc3N1ZSB2aWEgbGliaW5wdXQgcXVpcmtzIGZv
ciBub3cuDQoNCtGB0YAsIDE1INCw0L/RgC4gMjAyMCDQsy4g0LIgMTM6NTQsIFhpYW9qaWFuIENh
byA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjoNCj4NCj4gSGkgQXJ0ZW0sDQo+DQo+IFRoYW5r
cyBmb3IgeW91ciBjaGVja2luZywgbXkgZmVlZGJhY2tzIGFyZSBhcyBiZWxvdzoNCj4gMS5JdCBp
cyBhYm91dCB0aGUgY29kaW5nIHN0eWxlIHRoYXQgd2Ugc2hvdWxkIG5vdCB1c2UgSFdJRCBpbiB0
aGUgc3RyaW5nICJISURfREVWSUNFX0lEX0FMUFNfMTY1NyIsIHRoZXJlIGFyZSBhIGxhcmdlIG51
bWJlciBvZiBIV0lEcyB1c2luZyB0aGlzIHRvdWNocGFkLiBXZSBzaG91bGQgdXNlIHRoZSBkZXZp
Y2UgdHlwZSBpbmZvcm1hdGlvbiBpbiB0aGlzIHN0cmluZywgc3VjaCBhcyAiVTFfVU5JQ09STl9M
RUdBQ1kiLg0KPiAyLlRoaXMgaXMgYWxzbyBhYm91dCB0aGUgY29kaW5nIHN0eWxlLCB3ZSdkIGJl
dHRlciBtYWtlIHN1cmUgdGhleSBhcmUgdGhlIHNhbWUgd2l0aCBlYWNoIG90aGVyLCBvciBqdXN0
IGxlYXZlIG9uZSBsaXN0IHRoZXJlLg0KPiAzLklmIHdlJ2QgbGlrZSB0byB1cGdyYWRlIHRoZSBt
YWluc3RyZWFtIGRyaXZlciBmb3Igb25seSB0aGlzIHByb2plY3QsIHRoZW4gaXQgd29ya3MsIGJ1
dCBmb3IgdGhlIG90aGVyIHByb2plY3RzLCBpdCBoYXMgcHJvYmxlbXMuIElmIHRoZXJlIGlzIGVu
b3VnaCB0aW1lLCB3ZSdkIGxpa2UgdG8gcHJlcGFyZSBhIGJldHRlciBwYXRjaCBmb3IgbW9zdCBv
ZiBvdXIgcHJvZHVjdHMuDQo+DQo+IFRoYW5rIHlvdSBmb3Igc2hhcmluZyB0aGUga2VybmVsIHZl
cnNpb24uIEkgdGhpbmssIHRoZSByZXZpZXcgcmVzdWx0IHdvdWxkIG5vdCBiZSByZWxpYWJsZSBp
ZiB3ZSBkb24ndCBoYXZlIHRoZSBjb3JyZWN0IHNvdXJjZSBjb2RlIG9mIHlvdXIga2VybmVsIHZl
cnNpb24uDQo+DQo+DQo+DQo+IEJlc3QgUmVnYXJkcywNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBKYXNvbiBDYW8o5pu55pmT5bu6KQ0KPg0KPg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBcnRlbSBCb3Jpc292IDxkZWRz
YTIwMDJAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDE1LCAyMDIwIDU6MTYg
UE0NCj4gVG86IOabuSDmm4nlu7ogWGlhb2ppYW4gQ2FvIDx4aWFvamlhbi5jYW9AY24uYWxwcy5j
b20+DQo+IENjOiDlpKrnlLAg55yf5ZacIE1hc2FraSBPdGEgPG1hc2FraS5vdGFAYWxwc2FscGlu
ZS5jb20+OyBqaWtvc0BrZXJuZWwub3JnOyANCj4gQmVuamFtaW4gVGlzc29pcmVzIDxiZW5qYW1p
bi50aXNzb2lyZXNAcmVkaGF0LmNvbT47IEhlbnJpayBSeWRiZXJnIA0KPiA8cnlkYmVyZ0BiaXRt
YXRoLm9yZz47IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IOmHjuadkSDlk7Llk4kgVGV0c3V5YSBOb211cmEgDQo+IDx0ZXRzdXlh
Lm5vbXVyYUBhbHBzYWxwaW5lLmNvbT47IFZhZGltIEtsaXNoa28gPHZhZGltQGNpcnF1ZS5jb20+
OyANCj4gI0FMQ0hUX01MX1BPRF9DTiA8cG9kLmFsY2h0QGNuLmFscHMuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDIvMl0gSElEOiBhbHBzOiBSZWZhY3RvciBheGlzIHJlc29sdXRpb24gbG9n
aWMNCj4NCj4gSGkuDQo+DQo+IEkgY2FuJ3QgcXVpdGUgdW5kZXJzdGFuZCB5b3VyIG9iamVjdGlv
bnMuDQo+IDEuIERvIHlvdSBtZWFuIHRoYXQgd2UgY2FuJ3QgdXNlIEFVSTE2NTcgYmVjYXVzZSB0
aGVyZSBhcmUgYWxyZWFkeSBkcml2ZXJzIHdoaWNoIGRvIHRoYXQgKGFuZCBJJ20gc3VyZSB0aGVy
ZSBhcmUgbm90KSBvciB0aGF0IHRoZXJlIGFyZSBtb3JlIGRldmljZXMgdXNpbmcgMHgxMjFFPw0K
PiAyLiBUaGUgc2Vjb25kIGluc3RhbmNlIG9mIHByb2R1Y3QgSUQgaXMgbm90IHVzZWQgYW55d2hl
cmUgaW4gdGhlIGNvZGUgYXQgbGVhc3QgZm9yIFUxIHNvIEkgZGlkbid0IHNlZSBhbnkgcG9pbnQg
dG8gYWRkIGFub3RoZXIgdW51c2VkIHZhbHVlIHRoYXQgcmVwbGljYXRlcyB0aGUgcHJldmlvdXMg
b25lLg0KPiAzLiBJIG9idmlvdXNseSBkb24ndCBoYXZlIGFueSBpbnRlcm5hbCBkb2N1bWVudGF0
aW9uIHRvIGFyZ3VlIHdpdGggdGhhdCwgYnV0IHlvdSBoYXZlIG1lbnRpb25lZCBhYm92ZSB0aGF0
IGF1aTE2NTcgaXMganVzdCBhbm90aGVyIHBhbmVsIGJhc2VkIG9uIFUxLCBBcGFydCBmcm9tIHRo
YXQsIHRoZSB0b3VjaHBhZCBpcyBmdWxseSBmdW5jdGlvbmFsIHdpdGggdGhlIGN1cnJlbnQgY29k
ZSBzdWJtaXR0ZWQgd2hpY2ggd291bGRuJ3QgbWFrZSBhbnkgc2Vuc2UgaWYgdGhlIHJlcG9ydCBJ
RHMgd2VyZSB3cm9uZy4NCj4NCj4gSSdtIHJ1bm5pbmcgQXJjaCB3aXRoIDUuNi4zIGtlcm5lbCwg
dGhvdWdoIEknbSBub3Qgc3VyZSBob3cgdGhhdCBpbmZvcm1hdGlvbiB3aWxsIGJlIHJlbGV2YW50
IHRvIHRoZSBwYXRjaC4NCj4NCj4gVGhhbmtzLg0KPg0KPg0KPiDRgdGALCAxNSDQsNC/0YAuIDIw
MjAg0LMuINCyIDEwOjQ3LCBYaWFvamlhbiBDYW8gPHhpYW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT46
DQo+ID4NCj4gPiBIaSBBcnRlbSwNCj4gPg0KPiA+DQo+ID4NCj4gPiBXZeKAmXZlIHJldmlld2Vk
IHlvdXIgbW9kaWZpY2F0aW9ucywgYW5kIGFscmVhZHkgZm91bmQgc29tZSBwcm9ibGVtcyBhcyBi
ZWxvdzoNCj4gPg0KPiA+IEl04oCZcyBub3Qgc3VpdGFibGUgdG8gdXNlIEhXSUQgQVVJMTY1NyBp
biB0aGUgc291cmNlIGNvZGUsIHdlIGJlY2F1c2UgdGhlcmUgYXJlIG1hbnkgcHJvamVjdHMgdXNp
bmcgdGhlIHNhbWUgdG91Y2hwYWQuIEl0IHdpbGwgY29uZnVzZSB0aGUgY29kZXIgaW4gdGhlIGZ1
dHVyZS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBUaGVyZSBhcmUgMiBwbGFjZXMgdGhhdCBtYWludGFp
biB0aGUgUHJvZHVjdCBJRC9EZXZpY2UgSUQgaW4gdGhlIG1haW5zdHJlYW0gZHJpdmVyLCBjdXJy
ZW50bHkgeW91ciBtb2RpZmljYXRpb25zIGp1c3QgbWFpbnRhaW5lZCBvbmUgb2YgdGhlbS4NCj4g
Pg0KPiA+DQo+ID4NCj4gPiBJZiB3ZSBuZWVkIHRvIHN1cHBvcnQgdGhlIG5ldyBQcm9kdWN0IElE
L0RldmljZSBJRCwgdGhlbiB0aGUgcmVwb3J0IElEcyB3aWxsIGFsc28gYmUgbW9kaWZpZWQuIEFs
cHMgQWxwaW5lIGhhdmUgZGlmZmVyZW50IHJlcG9ydCBJRCBsaXN0IGZvciBkaWZmZXJlbnQgcHJv
ZHVjdHMuDQo+ID4NCj4gPg0KPiA+DQo+ID4gQlRXLCB3aGF0IGlzIHlvdXIgT1MgdmVyc2lvbiBh
bmQgd2hhdOKAmXMgaXRzIExpbnV4IGtlcm5lbCB2ZXJzaW9uPw0KPiA+DQo+ID4NCj4gPg0KPiA+
IFRoYW5rIHlvdS4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0K
PiA+DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+DQo+ID4gSmFzb24gQ2FvKOabueaZk+W7uikNCj4gPg0KPiA+DQo+ID4NCj4gPiBGcm9tOiBB
cnRlbSBCb3Jpc292IDxkZWRzYTIwMDJAZ21haWwuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwg
QXByaWwgMTUsIDIwMjAgMTo1MSBBTQ0KPiA+IFRvOiDmm7kg5puJ5bu6IFhpYW9qaWFuIENhbyA8
eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPg0KPiA+IENjOiDlpKrnlLAg55yf5ZacIE1hc2FraSBP
dGEgPG1hc2FraS5vdGFAYWxwc2FscGluZS5jb20+OyBqaWtvc0BrZXJuZWwub3JnOyANCj4gPiBC
ZW5qYW1pbiBUaXNzb2lyZXMgPGJlbmphbWluLnRpc3NvaXJlc0ByZWRoYXQuY29tPjsgSGVucmlr
IFJ5ZGJlcmcgDQo+ID4gPHJ5ZGJlcmdAYml0bWF0aC5vcmc+OyBsaW51eC1pbnB1dEB2Z2VyLmtl
cm5lbC5vcmc7IA0KPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOmHjuadkSDlk7Ll
k4kgVGV0c3V5YSBOb211cmEgDQo+ID4gPHRldHN1eWEubm9tdXJhQGFscHNhbHBpbmUuY29tPjsg
VmFkaW0gS2xpc2hrbyA8dmFkaW1AY2lycXVlLmNvbT47IA0KPiA+ICNBTENIVF9NTF9QT0RfQ04g
PHBvZC5hbGNodEBjbi5hbHBzLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gSElE
OiBhbHBzOiBSZWZhY3RvciBheGlzIHJlc29sdXRpb24gbG9naWMNCj4gPg0KPiA+DQo+ID4NCj4g
PiBBbnkgdXBkYXRlcyBvbiB0aGF0IHlldD8NCj4gPg0KPiA+INC/0YIsIDEwINCw0L/RgC4gMjAy
MCDQsy4sIDA2OjI4IFhpYW9qaWFuIENhbyA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjoNCj4g
Pg0KPiA+IEhpIE90YS1zYW4sDQo+ID4NCj4gPiBJIG5lZWQgdG8gc3R1ZHkgdGhlIGJhY2tncm91
bmQgZmlyc3QsIHRoZW4gSSB3aWxsIHVwZGF0ZSBteSB1bmRlcnN0YW5kaW5nIGFib3V0IGl0Lg0K
PiA+DQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IEphc29uIENhbyjmm7nmmZPlu7opDQo+ID4NCj4g
Pg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog5aSq55SwIOecn+WW
nCBNYXNha2kgT3RhIDxtYXNha2kub3RhQGFscHNhbHBpbmUuY29tPg0KPiA+IFNlbnQ6IEZyaWRh
eSwgQXByaWwgMTAsIDIwMjAgOTo1MSBBTQ0KPiA+IFRvOiDmm7kg5puJ5bu6IFhpYW9qaWFuIENh
byA8eGlhb2ppYW4uY2FvQGNuLmFscHMuY29tPjsgQXJ0ZW0gQm9yaXNvdiANCj4gPiA8ZGVkc2Ey
MDAyQGdtYWlsLmNvbT4NCj4gPiBDYzogamlrb3NAa2VybmVsLm9yZzsgQmVuamFtaW4gVGlzc29p
cmVzIA0KPiA+IDxiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0LmNvbT47IEhlbnJpayBSeWRiZXJn
IA0KPiA+IDxyeWRiZXJnQGJpdG1hdGgub3JnPjsgbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3Jn
OyANCj4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4gU3ViamVjdDogUkU6IFtQ
QVRDSCAyLzJdIEhJRDogYWxwczogUmVmYWN0b3IgYXhpcyByZXNvbHV0aW9uIGxvZ2ljDQo+ID4N
Cj4gPiBIaSwgQ2FvLXNhbiwNCj4gPg0KPiA+IEkgZ290IGl0LiBJIGFsc28gY29uZmlybWVkIHRo
aXMgdG91Y2hwYWQgaXMgYSBzcGVjaWFsLg0KPiA+IFdoYXQgZG8geW91IHRoaW5rIHRoaXMgY29k
ZSBtb2RpZmljYXRpb24/DQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gTWFzYWtpIE90YQ0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog5pu5IOabieW7uiBYaWFv
amlhbiBDYW8gPHhpYW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIEFw
cmlsIDEwLCAyMDIwIDEwOjAzIEFNDQo+ID4gVG86IOWkqueUsCDnnJ/llpwgTWFzYWtpIE90YSA8
bWFzYWtpLm90YUBhbHBzYWxwaW5lLmNvbT47IEFydGVtIEJvcmlzb3YgDQo+ID4gPGRlZHNhMjAw
MkBnbWFpbC5jb20+DQo+ID4gQ2M6IGppa29zQGtlcm5lbC5vcmc7IEJlbmphbWluIFRpc3NvaXJl
cyANCj4gPiA8YmVuamFtaW4udGlzc29pcmVzQHJlZGhhdC5jb20+OyBIZW5yaWsgUnlkYmVyZyAN
Cj4gPiA8cnlkYmVyZ0BiaXRtYXRoLm9yZz47IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsg
DQo+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+IFN1YmplY3Q6IFJFOiBbUEFU
Q0ggMi8yXSBISUQ6IGFscHM6IFJlZmFjdG9yIGF4aXMgcmVzb2x1dGlvbiBsb2dpYw0KPiA+DQo+
ID4gSGkgT3RhLXNhbiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjaGVja2luZy4NCj4gPiBJ
biBmYWN0LCBzb21lIG9mIHRoZSBVMSBkZXZpY2VzIHdvcmsgYXMgbm9uLVBUUC4NCj4gPiBBVUkx
NjU3IGlzIHVzaW5nIFUxKEtHREJDSEEwMDRBKSB3aG9zZSBmaXJtd2FyZSBqdXN0IHN1cHBvcnRz
IG1vdXNlIG1vZGUgYW5kIGxlZ2FjeSBtb2RlLg0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiBKYXNv
biBDYW8o5pu55pmT5bu6KQ0KPiA+DQo+ID4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+IEZyb206IOWkqueUsCDnnJ/llpwgTWFzYWtpIE90YSA8bWFzYWtpLm90YUBhbHBzYWxw
aW5lLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDEwLCAyMDIwIDg6MjkgQU0NCj4gPiBU
bzog5pu5IOabieW7uiBYaWFvamlhbiBDYW8gPHhpYW9qaWFuLmNhb0Bjbi5hbHBzLmNvbT47IEFy
dGVtIEJvcmlzb3YgDQo+ID4gPGRlZHNhMjAwMkBnbWFpbC5jb20+DQo+ID4gQ2M6IGppa29zQGtl
cm5lbC5vcmc7IEJlbmphbWluIFRpc3NvaXJlcyANCj4gPiA8YmVuamFtaW4udGlzc29pcmVzQHJl
ZGhhdC5jb20+OyBIZW5yaWsgUnlkYmVyZyANCj4gPiA8cnlkYmVyZ0BiaXRtYXRoLm9yZz47IGxp
bnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMi8yXSBISUQ6IGFscHM6IFJlZmFjdG9yIGF4
aXMgcmVzb2x1dGlvbiBsb2dpYw0KPiA+DQo+ID4gSGksIENhby1zYW4sDQo+ID4NCj4gPiBEbyB5
b3Uga25vdyBBVUkxNjU3IGRldmljZT8gVGhpcyBkZXZpY2UgbG9va3MgVTEuDQo+ID4gSSB0aGlu
ayByZWNlbnQgYWxsIFUxIGRldmljZXMgd29yayBhcyBQVFAuDQo+ID4gTGludXggYWxzbyBzdXBw
b3J0cyBQVFAsIHNvIEkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBzb21ldGhpbmcgSUQgdG8gDQo+ID4g
TGludXggc291cmNlIGNvZGUuIChJIHJlbWVtYmVyIGEgc29tZXRoaW5nIGZsYWcgaXMgYWxyZWFk
eSBleGlzdC4pDQo+ID4NCj4gPiBCZXN0IFJlZ2FyZHMsDQo+ID4gTWFzYWtpIE90YQ0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQXJ0ZW0gQm9yaXNvdiA8ZGVkc2Ey
MDAyQGdtYWlsLmNvbT4NCj4gPiBTZW50OiBGcmlkYXksIEFwcmlsIDEwLCAyMDIwIDg6MDAgQU0N
Cj4gPiBDYzogamlrb3NAa2VybmVsLm9yZzsg5aSq55SwIOecn+WWnCBNYXNha2kgT3RhIDxtYXNh
a2kub3RhQGFscHNhbHBpbmUuY29tPjsgDQo+ID4gQXJ0ZW0gQm9yaXNvdiA8ZGVkc2EyMDAyQGdt
YWlsLmNvbT47IEJlbmphbWluIFRpc3NvaXJlcyANCj4gPiA8YmVuamFtaW4udGlzc29pcmVzQHJl
ZGhhdC5jb20+OyBIZW5yaWsgUnlkYmVyZyANCj4gPiA8cnlkYmVyZ0BiaXRtYXRoLm9yZz47IGxp
bnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgDQo+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KPiA+IFN1YmplY3Q6IFtQQVRDSCAyLzJdIEhJRDogYWxwczogUmVmYWN0b3IgYXhpcyBy
ZXNvbHV0aW9uIGxvZ2ljDQo+ID4NCj4gPiBBVUkxNjU3IGRvZXNuJ3QgZm9sbG93IHRoZSBzYW1l
IGxvZ2ljIGZvciByZXNvbHV0aW9uIGNhbGN1bGF0aW9uLCBzaW5jZSB0aGUgcmVzdWx0aW5nIHZh
bHVlcyBhcmUgaW5jb3JyZWN0LiBJbnN0ZWFkLCBpdCByZXBvcnRzIHRoZSBhY3R1YWwgcmVzb2x1
dGlvbiB2YWx1ZXMgaW4gcGxhY2Ugb2YgdGhlIHBpdGNoIG9uZXMuDQo+ID4gV2hpbGUgd2UncmUg
YXQgaXQsIGFsc28gcmVmYWN0b3IgdGhlIHdob2xlIHJlc29sdXRpb24gbG9naWMgdG8gbWFrZSBp
dCBtb3JlIGdlbmVyaWMgYW5kIHNlbnNpYmxlIGZvciBtdWx0aXBsZSBkZXZpY2Ugc3VwcG9ydC4N
Cj4gPg0KPiA+IFRoZXJlIGFyZSB0d28gbWFpbiBsb2dpY2FsIHByb2JsZW1zIHdpdGggdGhlIGN1
cnJlbnQgY29kZToNCj4gPiAxLiBhY3RpdmVfbGVuX21tIHZhbHVlcyBhcmUgb25seSB1c2VkIGZv
ciByZXNvbHV0aW9uIGNhbGN1bGF0aW9uIG9uIFUxLCB5ZXQgYXJlIGV4cG9zZWQgZ2xvYmFsbHkg
YXMgcGFydCBvZiBhbHBzX2RldiBzdHJ1Y3R1cmUuDQo+ID4gMi4gVGhlIHJlc29sdXRpb24gY2Fs
Y3VsYXRpb24gcHJvY2VzcyBoYXBwZW5zIGluIGFscHNfaW5wdXRfY29uZmlndXJlZCwgd2hpbGUg
ZXZlcnl0aGluZyBlbHNlIGlzIGNhbGN1bGF0ZWQgaW4gdTFfaW5pdCBmdW5jdGlvbi4NCj4gPg0K
PiA+IFRoZXNlIHByb2JsZW1zIGJlY29tZSBtb3JlIGFwcGFyZW50IHdoZW4gd2UgdHJ5IHRvIHN1
cHBvcnQgYSBkZXZpY2UgdGhhdCBkb2Vzbid0IGZvbGxvdyB0aGUgc2FtZSByZXNvbHV0aW9uIGNh
bGN1bGF0aW9uIGxvZ2ljIGFzIFUxLg0KPiA+IFNpbmNlIGFscHNfaW5wdXRfY29uZmlndXJlZCBp
cyBhIGRldmljZS1hZ25vc3RpYyBmdW5jdGlvbiwgd2Ugc2hvdWxkIGF2b2lkIGRvaW5nIGFueSBt
ZWFzdXJlbWVudHMgdGhlcmUgYW5kIGhhbmRsZSB0aGVtIGluIGRldmljZS1zcGVjaWZpYyBpbml0
IGZ1bmN0aW9ucyBsaWtlIHUxL1Q0X2luaXQgaW5zdGVhZC4NCj4gPg0KPiA+IFRvIGVsaW1pbmF0
ZSB0aGVzZSBwcm9ibGVtcyB3ZSBhZGQgZ2xvYmFsIHhfcmVzIGFuZCB5X3JlcyB2YWx1ZXMgYW5k
IHBvcHVsYXRlIHRoZW0gb24gYSBkZXZpY2Utc3BlY2lmaWMgYmFzaXMgaW4gdGhlIGFjY29yZGlu
ZyBpbml0IGZ1bmN0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFydGVtIEJvcmlzb3Yg
PGRlZHNhMjAwMkBnbWFpbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvaGlkL2hpZC1hbHBz
LmMgfCA0MSANCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWFscHMuYyBiL2RyaXZlcnMvaGlk
L2hpZC1hbHBzLmMgaW5kZXgNCj4gPiBjMmEyYmQ1Mjg4OTAuLjQ5NGMwOGNjYTY0NSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2hpZC9oaWQtYWxwcy5jDQo+ID4gKysrIGIvZHJpdmVycy9oaWQv
aGlkLWFscHMuYw0KPiA+IEBAIC04Myw4ICs4Myw4IEBAIGVudW0gZGV2X251bSB7DQo+ID4gICAq
IEBtYXhfZmluZ2VyczogdG90YWwgbnVtYmVyIG9mIGZpbmdlcnMNCj4gPiAgICogQGhhc19zcDog
Ym9vbGVhbiBvZiBzcCBleGlzdGVuc2UNCj4gPiAgICogQHNwX2J0bl9pbmZvOiBidXR0b24gaW5m
b3JtYXRpb24NCj4gPiAtICogQHhfYWN0aXZlX2xlbl9tbTogYWN0aXZlIGFyZWEgbGVuZ3RoIG9m
IFggKG1tKQ0KPiA+IC0gKiBAeV9hY3RpdmVfbGVuX21tOiBhY3RpdmUgYXJlYSBsZW5ndGggb2Yg
WSAobW0pDQo+ID4gKyAqIEB4X3JlczogcmVzb2x1dGlvbiBvZiBYDQo+ID4gKyAqIEB5X3Jlczog
cmVzb2x1dGlvbiBvZiBZDQo+ID4gICAqIEB4X21heDogbWF4aW11bSB4IGNvb3JkaW5hdGUgdmFs
dWUNCj4gPiAgICogQHlfbWF4OiBtYXhpbXVtIHkgY29vcmRpbmF0ZSB2YWx1ZQ0KPiA+ICAgKiBA
eF9taW46IG1pbmltdW0geCBjb29yZGluYXRlIHZhbHVlIEBAIC0xMDAsOSArMTAwLDEwIEBAIHN0
cnVjdCANCj4gPiBhbHBzX2RldiB7DQo+ID4gICAgICAgICBlbnVtIGRldl9udW0gZGV2X3R5cGU7
DQo+ID4gICAgICAgICB1OCAgbWF4X2ZpbmdlcnM7DQo+ID4gICAgICAgICB1OCAgaGFzX3NwOw0K
PiA+ICsgICAgICAgdTggIG5vX3BpdGNoOw0KPiA+ICAgICAgICAgdTggICAgICBzcF9idG5faW5m
bzsNCj4gPiAtICAgICAgIHUzMiAgICAgeF9hY3RpdmVfbGVuX21tOw0KPiA+IC0gICAgICAgdTMy
ICAgICB5X2FjdGl2ZV9sZW5fbW07DQo+ID4gKyAgICAgICB1MzIgICAgIHhfcmVzOw0KPiA+ICsg
ICAgICAgdTMyICAgICB5X3JlczsNCj4gPiAgICAgICAgIHUzMiAgICAgeF9tYXg7DQo+ID4gICAg
ICAgICB1MzIgICAgIHlfbWF4Ow0KPiA+ICAgICAgICAgdTMyICAgICB4X21pbjsNCj4gPiBAQCAt
NTUwLDEwICs1NTEsNiBAQCBzdGF0aWMgaW50IHUxX2luaXQoc3RydWN0IGhpZF9kZXZpY2UgKmhk
ZXYsIHN0cnVjdCBhbHBzX2RldiAqcHJpX2RhdGEpDQo+ID4gICAgICAgICAgICAgICAgIGRldl9l
cnIoJmhkZXYtPmRldiwgImZhaWxlZCBVMV9SRVNPX0RXTl9BQlMgKCVkKVxuIiwgcmV0KTsNCj4g
PiAgICAgICAgICAgICAgICAgZ290byBleGl0Ow0KPiA+ICAgICAgICAgfQ0KPiA+IC0gICAgICAg
cHJpX2RhdGEtPnhfYWN0aXZlX2xlbl9tbSA9DQo+ID4gLSAgICAgICAgICAgICAgIChwaXRjaF94
ICogKHNlbl9saW5lX251bV94IC0gMSkpIC8gMTA7DQo+ID4gLSAgICAgICBwcmlfZGF0YS0+eV9h
Y3RpdmVfbGVuX21tID0NCj4gPiAtICAgICAgICAgICAgICAgKHBpdGNoX3kgKiAoc2VuX2xpbmVf
bnVtX3kgLSAxKSkgLyAxMDsNCj4gPg0KPiA+ICAgICAgICAgcHJpX2RhdGEtPnhfbWF4ID0NCj4g
PiAgICAgICAgICAgICAgICAgKHJlc29sdXRpb24gPDwgMikgKiAoc2VuX2xpbmVfbnVtX3ggLSAx
KTsgQEAgLTU2Miw2ICs1NTksMTggQEAgc3RhdGljIGludCB1MV9pbml0KHN0cnVjdCBoaWRfZGV2
aWNlICpoZGV2LCBzdHJ1Y3QgYWxwc19kZXYgKnByaV9kYXRhKQ0KPiA+ICAgICAgICAgICAgICAg
ICAocmVzb2x1dGlvbiA8PCAyKSAqIChzZW5fbGluZV9udW1feSAtIDEpOw0KPiA+ICAgICAgICAg
cHJpX2RhdGEtPnlfbWluID0gMTsNCj4gPg0KPiA+ICsgICAgICAgaWYgKHByaV9kYXRhLT5ub19w
aXRjaCkgew0KPiA+ICsgICAgICAgICAgICAgICBwcmlfZGF0YS0+eF9yZXMgPSBwaXRjaF94Ow0K
PiA+ICsgICAgICAgICAgICAgICBwcmlfZGF0YS0+eV9yZXMgPSBwaXRjaF95Ow0KPiA+ICsgICAg
ICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgcHJpX2RhdGEtPnhfcmVzID0NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAocHJpX2RhdGEtPnhfbWF4IC0gMSkgLw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICgocGl0Y2hfeCAqIChzZW5fbGluZV9udW1feCAtIDEpKSAvIDEw
KTsNCj4gPiArICAgICAgICAgICAgICAgcHJpX2RhdGEtPnlfcmVzID0NCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAocHJpX2RhdGEtPnlfbWF4IC0gMSkgLw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICgocGl0Y2hfeSAqIChzZW5fbGluZV9udW1feSAtIDEpKSAvIDEwKTsNCj4gPiAr
ICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICByZXQgPSB1MV9yZWFkX3dyaXRlX3JlZ2lzdGVy
KGhkZXYsIEFERFJFU1NfVTFfUEFEX0JUTiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAm
dG1wLCAwLCB0cnVlKTsNCj4gPiAgICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gQEAgLTYyMiw3
ICs2MzEsNyBAQCBzdGF0aWMgaW50IFQ0X2luaXQoc3RydWN0IGhpZF9kZXZpY2UgKmhkZXYsIHN0
cnVjdCBhbHBzX2RldiAqcHJpX2RhdGEpDQo+ID4gICAgICAgICBwcmlfZGF0YS0+eF9taW4gPSBU
NF9DT1VOVF9QRVJfRUxFQ1RST0RFOw0KPiA+ICAgICAgICAgcHJpX2RhdGEtPnlfbWF4ID0gc2Vu
X2xpbmVfbnVtX3kgKiBUNF9DT1VOVF9QRVJfRUxFQ1RST0RFOw0KPiA+ICAgICAgICAgcHJpX2Rh
dGEtPnlfbWluID0gVDRfQ09VTlRfUEVSX0VMRUNUUk9ERTsNCj4gPiAtICAgICAgIHByaV9kYXRh
LT54X2FjdGl2ZV9sZW5fbW0gPSBwcmlfZGF0YS0+eV9hY3RpdmVfbGVuX21tID0gMDsNCj4gPiAr
ICAgICAgIHByaV9kYXRhLT54X3JlcyA9IHByaV9kYXRhLT55X3JlcyA9IDA7DQo+ID4gICAgICAg
ICBwcmlfZGF0YS0+YnRuX2NudCA9IDE7DQo+ID4NCj4gPiAgICAgICAgIHJldCA9IHQ0X3JlYWRf
d3JpdGVfcmVnaXN0ZXIoaGRldiwgUFJNX1NZU19DT05GSUdfMSwgJnRtcCwgMCwgdHJ1ZSk7IEBA
IC02NzUsNyArNjg0LDcgQEAgc3RhdGljIGludCBhbHBzX2lucHV0X2NvbmZpZ3VyZWQoc3RydWN0
IGhpZF9kZXZpY2UgKmhkZXYsIHN0cnVjdCBoaWRfaW5wdXQgKmhpKQ0KPiA+ICAgICAgICAgc3Ry
dWN0IGFscHNfZGV2ICpkYXRhID0gaGlkX2dldF9kcnZkYXRhKGhkZXYpOw0KPiA+ICAgICAgICAg
c3RydWN0IGlucHV0X2RldiAqaW5wdXQgPSBoaS0+aW5wdXQsICppbnB1dDI7DQo+ID4gICAgICAg
ICBpbnQgcmV0Ow0KPiA+IC0gICAgICAgaW50IHJlc194LCByZXNfeSwgaTsNCj4gPiArICAgICAg
IGludCBpOw0KPiA+DQo+ID4gICAgICAgICBkYXRhLT5pbnB1dCA9IGlucHV0Ow0KPiA+DQo+ID4g
QEAgLTcwNiwxMiArNzE1LDkgQEAgc3RhdGljIGludCBhbHBzX2lucHV0X2NvbmZpZ3VyZWQoc3Ry
dWN0IGhpZF9kZXZpY2UgKmhkZXYsIHN0cnVjdCBoaWRfaW5wdXQgKmhpKQ0KPiA+ICAgICAgICAg
aW5wdXRfc2V0X2Fic19wYXJhbXMoaW5wdXQsIEFCU19NVF9QT1NJVElPTl9ZLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnlfbWluLA0K
PiA+IGRhdGEtPnlfbWF4LCAwLCAwKTsNCj4gPg0KPiA+IC0gICAgICAgaWYgKGRhdGEtPnhfYWN0
aXZlX2xlbl9tbSAmJiBkYXRhLT55X2FjdGl2ZV9sZW5fbW0pIHsNCj4gPiAtICAgICAgICAgICAg
ICAgcmVzX3ggPSAoZGF0YS0+eF9tYXggLSAxKSAvIGRhdGEtPnhfYWN0aXZlX2xlbl9tbTsNCj4g
PiAtICAgICAgICAgICAgICAgcmVzX3kgPSAoZGF0YS0+eV9tYXggLSAxKSAvIGRhdGEtPnlfYWN0
aXZlX2xlbl9tbTsNCj4gPiAtDQo+ID4gLSAgICAgICAgICAgICAgIGlucHV0X2Fic19zZXRfcmVz
KGlucHV0LCBBQlNfTVRfUE9TSVRJT05fWCwgcmVzX3gpOw0KPiA+IC0gICAgICAgICAgICAgICBp
bnB1dF9hYnNfc2V0X3JlcyhpbnB1dCwgQUJTX01UX1BPU0lUSU9OX1ksIHJlc195KTsNCj4gPiAr
ICAgICAgIGlmIChkYXRhLT54X3JlcyAmJiBkYXRhLT55X3Jlcykgew0KPiA+ICsgICAgICAgICAg
ICAgICBpbnB1dF9hYnNfc2V0X3JlcyhpbnB1dCwgQUJTX01UX1BPU0lUSU9OX1gsIGRhdGEtPnhf
cmVzKTsNCj4gPiArICAgICAgICAgICAgICAgaW5wdXRfYWJzX3NldF9yZXMoaW5wdXQsIEFCU19N
VF9QT1NJVElPTl9ZLA0KPiA+ICsgZGF0YS0+eV9yZXMpOw0KPiA+ICAgICAgICAgfQ0KPiA+DQo+
ID4gICAgICAgICBpbnB1dF9zZXRfYWJzX3BhcmFtcyhpbnB1dCwgQUJTX01UX1BSRVNTVVJFLCAw
LCA2NCwgMCwgMCk7IEBAIC04MDIsOCArODA4LDExIEBAIHN0YXRpYyBpbnQgYWxwc19wcm9iZShz
dHJ1Y3QgaGlkX2RldmljZSAqaGRldiwgY29uc3Qgc3RydWN0IGhpZF9kZXZpY2VfaWQgKmlkKQ0K
PiA+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgIGNhc2UgSElEX0RFVklDRV9J
RF9BTFBTX1UxX0RVQUw6DQo+ID4gICAgICAgICBjYXNlIEhJRF9ERVZJQ0VfSURfQUxQU19VMToN
Cj4gPiArICAgICAgICAgICAgICAgZGF0YS0+ZGV2X3R5cGUgPSBVMTsNCj4gPiArICAgICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gICAgICAgICBjYXNlIEhJRF9ERVZJQ0VfSURfQUxQU18xNjU3Og0K
PiA+ICAgICAgICAgICAgICAgICBkYXRhLT5kZXZfdHlwZSA9IFUxOw0KPiA+ICsgICAgICAgICAg
ICAgICBkYXRhLT5ub19waXRjaCA9IDE7DQo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+
ICAgICAgICAgZGVmYXVsdDoNCj4gPiAgICAgICAgICAgICAgICAgZGF0YS0+ZGV2X3R5cGUgPSBV
TktOT1dOOw0KPiA+IC0tDQo+ID4gMi4yNi4wDQo=
