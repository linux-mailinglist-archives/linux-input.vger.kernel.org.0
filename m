Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F803987C5
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 13:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhFBLRf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 07:17:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:44908 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhFBLRf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 07:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622632553; x=1654168553;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NCzE1Qta6l3+YehhcPLxvjdu1jhUHXEchzTrZR2Aagk=;
  b=2DoQ6VpajmE+q11XgLngMQgbeGLh8xLJjWMxQEo7Tp+uK41l6Pkx5Nb5
   VHyZylA7MzcTaBEAPEcNcoYyVIzyU48RyaI+yf19Kqw6xpHaonijnVVTk
   PJB6U68lKKJFxNXY7pGhckK+zPwoc9QCBJyeHFb1NcOYqmsSsoHoiECq+
   cxSbgM//Lo+rupxHDrUvEY9FqaVPEwHTQxQNDh+hX3zVGqv+s6/Vyb2/Z
   XDipKs0Fh1lfByWX3+M9QSqjKvhkwp7sK7fs6ZtkJ36rBj3vXAB7HlohG
   a6Lr6l6COuxQ9+oGiH65kY9f4Enky9jdvb358lWjeTdvmrf9GYIP92JqY
   w==;
IronPort-SDR: WE9oiV+9qc8XSr7s4iAAnrSwhgnVW8jDKMCV4/StY0Sd4F2DAd0O5slYh2aD9zper7BT6kxVmj
 6QkgvfcwBTMkMsX6bH4LpKf7rhhliguUITrGUwMcRcowhimoqy2gDn/IZ+TUuSIUv86BKqWD7Q
 86d8oJOJTlQHvCSVPLItcTV0dxCDignVlxc3UsD93PCjyxlT9dsGQ7Lt0aHJm+mRNkPhzUTZta
 r17FeSkm7uLCAGe5Mj0mvqSBNiQYeLKEDgPx4IshD+V2Ih8GQ7NX+jUt7RaP6NqERvv1j6puvJ
 wZ4=
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; 
   d="scan'208";a="123237471"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jun 2021 04:15:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 04:15:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 2 Jun 2021 04:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgBe7WzmAgR5tnSyb7+Dl7ZuEoK5NTDy/P2KDal3oam8nQEzY2Qu9xLee7i2yRG4PQDeDTQaKCo4r2Q1qiDn3dqZRVsRvkS5AvJnoiP0tdX8nDO9DgJFaNzkPYNG2mjY7LlUEKvM+ixk05aFF+xWaHDl8/U8MPySimxigRzqXLIUfgjup67QzBXBi8SGkeeXxY4OGIpx2vzkQGFnhmD+4bNDOfqF7rIWhW879QyQq3Pb/IAZ9fjksuRnuV7Uw+89ztNJM9f/09tzQ0pKr0R53cq7Ikk6kjxHzn+RN0wTrUADuN4wLFsjiwWfHH29P3232FrxiyfopH4y0nvbJeu8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCzE1Qta6l3+YehhcPLxvjdu1jhUHXEchzTrZR2Aagk=;
 b=jQ19VXhRE+QOrqCoN7mKuJmRCMQ1a+nEbo33PEOmwPF8jMzSBGaS1BUfT4LZKQwW8PqXiPIyvKosZnyKIdyXfpo92tgVVC3Q6CDPbgaygFadqaIRjWEj2lcubC3snc+33xEOIEpXxKaa4ygfCuW2nD6o2i/vAKEaTpCWXoZYtPsS3vVRb52GPvmYxmWTEFN37P4IzYitpnm+nSLYn6bmXkaeTERnJPXlhaL7wP6u72XAKBkntMYp0VukmvXHH1UXshq4oss0M/PU5rqSqycKzdiT8DFYC/U2zMglhw5uyV2iF+2sXJylmSCBMS5LZib3AQ3aMGhA0k3vycSB31Sx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCzE1Qta6l3+YehhcPLxvjdu1jhUHXEchzTrZR2Aagk=;
 b=dozF5PMe0ah63FnrpOpNt2gyFVExxNKshD+rkZZboD8/gaEQFuqCkLZpUha4cTL0kEE0hu45nopKC3XXKolKrC8qvDAO+6wlu/3Zyos0gLADSBhy2s4mwYjrAqdjUd6xIFM/Pyv04kB8G0xU4NyF+t+HkOmYd3Jcxo6SWB8Udhk=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB4113.namprd11.prod.outlook.com (2603:10b6:405:77::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 11:15:48 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::a830:4422:d5b3:d53f]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::a830:4422:d5b3:d53f%3]) with mapi id 15.20.4195.020; Wed, 2 Jun 2021
 11:15:47 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <o.rempel@pengutronix.de>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <Jonathan.Cameron@Huawei.com>
CC:     <kernel@pengutronix.de>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <david@protonic.nl>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 0/4] add z1 and z2 channels support for
 resistive-adc-touch driver
Thread-Topic: [PATCH v6 0/4] add z1 and z2 channels support for
 resistive-adc-touch driver
Thread-Index: AQHXUSlmJhWZ13ph/ESwP8e5v80BDqsAnvYA
Date:   Wed, 2 Jun 2021 11:15:47 +0000
Message-ID: <88b91dc3-efbf-51f5-51cf-3e865c0988ff@microchip.com>
References: <20210525054634.9134-1-o.rempel@pengutronix.de>
In-Reply-To: <20210525054634.9134-1-o.rempel@pengutronix.de>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b9462c5-073e-48e2-a2c8-08d925b7c5e6
x-ms-traffictypediagnostic: BN6PR11MB4113:
x-microsoft-antispam-prvs: <BN6PR11MB41136951BA651F2E4C41C30AE83D9@BN6PR11MB4113.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4vfOUMr3+koYBu607A6bfslB+CSHQwgCyBD3uzGBRPr4VC3kI+IRAsIB4Uj2kq+GiPqi9Us6XahWPkEnxipjlThK20nZoEKMLfo4e0HNyMKeaaZy3zzBpNAFY1D9IaJ1fhKqIsRtEcnlNLnYJSxm5afDVk7X8oLfZJloTYYnyvgEDznDNvovxJ9oUWbO2EDz4JcUWzHogn8SxaN11Xmlrhj5PwpdZPW6K0a7k5l8i3IkgDKwj2E0KgrVKHhZlFT3bd0/VxCjOyPK5g8C5NZxgqLMMWb4jGqPiW5vEJ+Pfayy1jE3LTUWw1N0GhlB4y/6l9HhcWMKY9NFkqh4IYM1HYAxPwKwL+ZGf4Geod/pEZ9RCV71JT0B8cnn18zu/g9NPnPKNSs0+3GoW4ybW1Gjx+cRa2CIYMgDOz2kHCe4c87RYwAKntrpULHXWXt37NpWcHNouDvDp2aHC3y/NbJ/N7HdJBdYAa/UPNiNnoZ4vqJVMoLtMR0kMbnAkKhytPj9aEOWdF8p2ngnOuShG06zNhZnMi4qHqjByZzlrEIGSRtlCQz9SeyTSU/jF0Xu0D+fTpPmCd7SDtvnPT+TV53UVFQkGssPURAGtaXSlsnjdzmKUe5kY0nF9iyAKSnwrrc1QT9R2yV90Niuisu39LFoWdb/mvwa5054Iwk9iO8TxswRLi3w2/5H6nocCjOvzJJi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(31686004)(86362001)(31696002)(2906002)(6486002)(66946007)(478600001)(91956017)(76116006)(36756003)(6512007)(186003)(66446008)(122000001)(66556008)(8676002)(66476007)(316002)(83380400001)(38100700002)(2616005)(110136005)(54906003)(5660300002)(64756008)(71200400001)(53546011)(8936002)(26005)(6506007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UG92aStmOTJLenJXai9xNzhRNWlzeE5oeFYwWEszQ0paR3QyamxvRjZ0b24v?=
 =?utf-8?B?WVZSVkZJV1I3eHNleGQ1YVIrak4vK1RzTXg0ZnA3eUdQcTNSaTJsenNKbXpZ?=
 =?utf-8?B?bTZaSkUvcEFGMnJKaVJzVkc4YU84WWZINnZiMlJEaytLb01PY3YwVklEam1P?=
 =?utf-8?B?MVNOSHE1aHVDK0ZrVnJRQ1BGT25UcmFVNzNOWGVRcWlLb2xVYVVYbkM0UE83?=
 =?utf-8?B?SkhKb3A5WGhhckVmVTRFditTV20zaStRSUJ4KzZ4OTUwN3NDcnBBa2Vma1pG?=
 =?utf-8?B?dGVVb0ZRcDYrMU5vVm4rR01VSStzeHVFS280emg3RS9jM0lhY044cUhqcjJT?=
 =?utf-8?B?V1dWbWdHa014bjE4ejdvd0tmTXlka2RqVmgvVmZRd1JmeHF4QkJJREFVVWR4?=
 =?utf-8?B?SXFzNzNxbVhLbHZNaEcrTk5OaHlMZlhsdHJ2dzZHQU5pbGZOUlpheExEZ2c2?=
 =?utf-8?B?WTU3ZmFRV2I0OERyMlFyTGRFckhFalgwZmxYM2dEaUYyYVdKK05JQlpBZ3g4?=
 =?utf-8?B?TnMvaHJEWnlUa0k1Y2ZFQjFMeVhaK2QyWThPRHNMZWI5cGVsTFQ4Sy9lblJ1?=
 =?utf-8?B?MFprWE5lU3g4UVVLOGZRSGZ1T3M1Nm9DaXkzdjlGbnBuc2JGSFljRThYSXVp?=
 =?utf-8?B?aTY5UEYyMG5iTHdzdFFzaWhnelcyelBjN2tjY1dsWXVQbFFsdkdwcVRCQXBY?=
 =?utf-8?B?R2JFZmExOS92UTRnT0hDM2JTRnYrSmRxMExHVThWbk0zN0hQREpYdDRpRDF6?=
 =?utf-8?B?UEJDYmRnSkN5T2dQTkFCMUlqeTFZMS9mTEtjWWxhWDcrTTBzNzNLMmNxTkt3?=
 =?utf-8?B?QVpNb2hmSjhsREpRcElrNlVyQkptNXlvbmhHNVZFUDVKWmZheHllUGNGaFdD?=
 =?utf-8?B?QTBKdVRSTDc1anMrVk05V0RPbmt6S3lvUHpqNGhKblpTSzd5cVlER0FhNWw3?=
 =?utf-8?B?WHpsa09aa255bCtzWi9neEdEQ1NRaHhLenI3NUw0OUtGaDFjMUp1YUpnUzlZ?=
 =?utf-8?B?d25IVHNjY3ZhcnV1UzBpbE1UTS8remRnaXFjNmNnYTBqakFVeUVEN092REZn?=
 =?utf-8?B?UmZ1aGRXU01SWU5sTk54ODNaNDdBYlAraVBBNGxWejF5NkhOR1dBS08zcG5B?=
 =?utf-8?B?clZaSU9xQjVhdWlGYmNyTzVFN2VpczAwN3ZHaitFSm93VFhMRk4yUUh5dzNU?=
 =?utf-8?B?bjBrWDdGanp5Z3JNZ2I0V0g1MWpuRW5QUFlSeTFPYWNpWmx3Q0ZTRmtXdDY5?=
 =?utf-8?B?cDdld0NQcUFJanhVL0w0K1o4ejYzcUcwemQyQ1hVck05K0JOVHRMMlpISXJ6?=
 =?utf-8?B?Vk1Iemd3T3lCVUxLdi9MdldmNFpoY3Y1Y2dBVHkxejF2aHlvQmp1eXFOZDhQ?=
 =?utf-8?B?YXgzUkgxc0FQaXhpNE9VVVVTQ1MrM2NXaVhGMXBNRFRjY0NsUkVBQTVkUWZS?=
 =?utf-8?B?RWx4QmVZeDljUUNjNDZrUFJYT3ZXWDRxUG1FTFpVaEhEdEU4YUlyaXU1Lzky?=
 =?utf-8?B?Rkc0K053b3V6d2hENmd6UVc3SVRhZkFIVHNkUllMTm9DVHViSFdHdlE2Qm0y?=
 =?utf-8?B?ckVxaCtabFQrYk0raEZYd20reSs1OXZyVGErZTE4L1dFZFM4QjBrY05lbzBL?=
 =?utf-8?B?SFlsbElJYmdHdnlGTEUweXFNM09MYTR4OVRzYVp6SHArU3FNbXJOUWRuS3RX?=
 =?utf-8?B?eERZVVpHUHI3L3hIWCtSamtMZmdFYkhuRXdsTVVpdDF6dkxQMEJiekZMV3Ri?=
 =?utf-8?Q?yEdo7P/IiRdHkc4nFA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <69317FE9DA9EB64BBFB01373611108B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9462c5-073e-48e2-a2c8-08d925b7c5e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 11:15:47.7283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+rouqCKC1hjMS5s7kx+Rhtx7UO30gJL1l3nvky8I1HgfFHjp68b3i9GjiXpRt0DGZStIu8OlsKoHMLtd+S/bj5QnGEvTi4nMGSDk1v7IGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4113
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gNS8yNS8yMSA4OjQ2IEFNLCBPbGVrc2lqIFJlbXBlbCB3cm90ZToNCj4gY2hhbmdlcyB2NjoN
Cj4gLSBkcm9wIG90aGVyIERUIGNoYW5nZXMNCj4gLSBhZGQgbW9yZSBSZXZpZXdlZC1ieSB0YWdz
DQo+IC0gcmVtb3ZlIHJlZHVuZGFudCBHUlRTX0NIX05PTkUgY2hlY2sNCj4gDQo+IGNoYW5nZXMg
djU6DQo+IC0gZml4IHZhbGlkYXRlIGZvciBvdGhlciBEVCBleGFtcGxlcy4NCj4gLSBhZGQgUmV2
aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHRvIHNvbWUgb2YgdGhlIHBh
dGNoZXMNCj4gDQo+IGNoYW5nZXMgdjQ6DQo+IC0gcmVzaXN0aXZlLWFkYy10b3VjaDogcmVtb3Zl
IHVudXNlZCB2YXJpYWJsZQ0KPiANCj4gY2hhbmdlcyB2MzoNCj4gLSB5YW1sOiBmaXggdmFsaWRh
dGlvbiBmb3IgY2hhbm5lbCBuYW1lcw0KPiAtIHlhbWw6IGFkZCBub2RlbmFtZSB2YWxpZGF0aW9u
DQo+IA0KPiBjaGFuZ2VzIHYyOg0KPiAtIGFkZCB5YW1sIGNvbnZlcnNpb24gcGF0Y2ggdG8gdGhp
cyBzZXJpZXMNCj4gLSByZXdvcmQgY29tbWl0IG1lc3NhZ2UgZm9yIHRoZSBsYXN0IHBhdGNoDQo+
IC0gZml4IHBvc3NpYmxlIG92ZXJmbG93IG9uIHRoZSBidWZmZXIgZGlzcGF0Y2hlcg0KPiANCj4g
T2xla3NpaiBSZW1wZWwgKDQpOg0KPiAgICBkdC1iaW5kaW5nczogdG91Y2hzY3JlZW46IENvbnZl
cnQgcmVzaXN0aXZlLWFkYy10b3VjaCBiaW5kaW5nIHRvIGpzb24NCj4gICAgICBzY2hlbWENCj4g
ICAgZHQtYmluZGluZ3M6IHRvdWNoc2NyZWVuOiBhZGQgdG91Y2hzY3JlZW4teC95LXBsYXRlLW9o
bXMgcHJvcGVydHkNCj4gICAgZHQtYmluZGluZ3M6IHRvdWNoc2NyZWVuOiByZXNpc3RpdmUtYWRj
LXRvdWNoOiBhZGQgc3VwcG9ydCBmb3IgejEgYW5kDQo+ICAgICAgejIgY2hhbm5lbHMNCj4gICAg
SW5wdXQ6IHJlc2lzdGl2ZS1hZGMtdG91Y2g6IGFkZCBzdXBwb3J0IGZvciB6MSBhbmQgejIgY2hh
bm5lbHMNCj4gDQo+ICAgLi4uL2lucHV0L3RvdWNoc2NyZWVuL3Jlc2lzdGl2ZS1hZGMtdG91Y2gu
dHh0IHwgIDMzIC0tLS0tDQo+ICAgLi4uL3RvdWNoc2NyZWVuL3Jlc2lzdGl2ZS1hZGMtdG91Y2gu
eWFtbCAgICAgIHwgIDg2ICsrKysrKysrKysrDQo+ICAgLi4uL2lucHV0L3RvdWNoc2NyZWVuL3Rv
dWNoc2NyZWVuLnlhbWwgICAgICAgIHwgICA2ICsNCj4gICAuLi4vaW5wdXQvdG91Y2hzY3JlZW4v
cmVzaXN0aXZlLWFkYy10b3VjaC5jICAgfCAxNDAgKysrKysrKysrKysrKysrKy0tDQo+ICAgNCBm
aWxlcyBjaGFuZ2VkLCAyMTggaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pDQo+ICAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC90
b3VjaHNjcmVlbi9yZXNpc3RpdmUtYWRjLXRvdWNoLnR4dA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvdG91Y2hzY3JlZW4vcmVz
aXN0aXZlLWFkYy10b3VjaC55YW1sDQo+IA0KPiAtLQ0KPiAyLjI5LjINCj4gDQoNCg0KDQpIZWxs
byBPbGVrc2lqLA0KDQpBcyBJIGFtIGxpc3RlZCBpbiB0aGUgTUFJTlRBSU5FUlMgZmlsZSBmb3Ig
dGhpcyBkcml2ZXIsIHdoeSBJIGFtIG5vdCANCmV2ZW4gQ0MtZWQgdG8gdGhpcyBwYXRjaCBzZXJp
ZXMgPw0KQXQgbGVhc3Qgd2hhdCBJIGNvdWxkIGhhdmUgZG9uZSBpcyB0ZXN0IHRoaXMgc2VyaWVz
IG9uIG15IGJvYXJkIHVzaW5nIA0KdGhpcyBkcml2ZXIuDQoNCkV1Z2VuDQo=
