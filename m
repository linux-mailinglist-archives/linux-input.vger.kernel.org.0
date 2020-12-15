Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253FE2DAAFE
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 11:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgLOKgz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 05:36:55 -0500
Received: from mail-eopbgr20046.outbound.protection.outlook.com ([40.107.2.46]:40002
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728236AbgLOKgq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 05:36:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyCDeTPdmx3rNDtJsyR/leV7Dp/HKXmwkpDXBR1q88IXTD21QSjzBWuUGv2m4DQ7ji5NWuwQkLda1cwxzmWWdHQ65cpr58KpVEdBhsAavL/2BV9zO0+clwIdPIGRUH9/iahg/fDI0CNMt+VKZ1W+jwMTSbfmSQ8OXTuI3E1d9Y4w5PHz6p5S/7U5HTYnR6aqgq2F+bhIZH4fpCGMQpW5inZRERDfN2WiK0s/L7iHeEG1cufp4Kxfwj68DoTW4QzcQU35gZI3yASKDFswL2PjSCCo+LxbFNCCTAlZ1vARyEEnxzZ7GL2xPbpKtHIrRuuTq5mfcI78/jCLqxK/N9iLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EBRl+c16FGJOdFezI0vvI8el9pz8a6HZ0hK/eR63QE=;
 b=LQmALB2ktcM2njKlza2Wgc8htgD91YwbN1V5ui1AOWuT8T3jS6Ya+Q5QxZ2UKQQMTM02unnNHZzK3mnlteH9EDkebck5cVuppCuKjY6xMvJk9MXv5QD4q3IMmml6UBIVLQM6EJ9zMCC3tqVYk9EeV5t8zfe7K2530DyB2y8atosK+tZ9lvghqOYSihlFPCgNJ0feMS2MOOamRgrBwguYbyRrKvyN2vhRLHN/e15osX9ksI+vk9TBVac2QkpMgYm2lSQULZJw+nD2BpLMg2Rios8hk6xPX0y4/GL6xpa5AYqVX8doYG7QRWRJgHadPwSPor1+3EewFYCjdIFfYZwOlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EBRl+c16FGJOdFezI0vvI8el9pz8a6HZ0hK/eR63QE=;
 b=RdmtwXgh7O/bFfjDVOgqIzDRLvJid3YWUN9e010lm7mROxDemy1hXyLWy7xNy5xCFnZaLzx+RWElHnRMI5twXccWGiBjUyZIKBpVERukFU0wwR11AyolJMBsugaxiH4g0Htgruych93O6a5oMWACR08oM/+iZSSIMIEKcC4B8xI=
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:35::12)
 by AM6PR10MB1989.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 10:35:56 +0000
Received: from AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052]) by AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8805:7516:b929:e052%7]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 10:35:56 +0000
From:   Roy Im <roy.im.opensource@diasemi.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Colin King <colin.king@canonical.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] Input: da7280: fix spelling mistake "sequemce" ->
 "sequence"
Thread-Topic: [PATCH][next] Input: da7280: fix spelling mistake "sequemce" ->
 "sequence"
Thread-Index: AQHW0mjUtOSDIaprAUu0lPFsYADybqn39Kxg
Date:   Tue, 15 Dec 2020 10:35:55 +0000
Message-ID: <AM6PR10MB192611F04C6472367F349E7285C60@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
References: <20201214223109.82924-1-colin.king@canonical.com>
In-Reply-To: <20201214223109.82924-1-colin.king@canonical.com>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [1.230.217.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36dc06b1-c56e-4154-d600-08d8a0e5347c
x-ms-traffictypediagnostic: AM6PR10MB1989:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB1989294ECF857D8B96082D2FA2C60@AM6PR10MB1989.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4QRotpdmGVv2MsPTr/ZnJZKYL69xvyqUCTtf8y9vc+b62SnXuGeK8hzgj9wk8S8H8iLHwrTHBcDssWn0LOZoH6ecHKy8l9PfREfNZFlXRLanln0QL4XMxQtFbfWW+/UmBiksVX7eBbnpdfk8yRxWsY9Ah+gEDbA5H4kA9VH8lSaVOsaK3aBVzbnQVNCJxPfDYCnnm2Ci81/aVcQAstzS7Ro3CUccjBg4E+xoZ6EWfxYEHxKdmiBjP3oNv6Zel8h/JhWRU+L5VNkG1PYiV8G3F7k1o6y4ivp1JYGQzJMoVtUz0VnWvQfIC7V8JRApOnpNrj9piTfWuquc/fgNbrbf7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(558084003)(71200400001)(4326008)(52536014)(110136005)(26005)(55016002)(7696005)(54906003)(2906002)(76116006)(33656002)(9686003)(498600001)(5660300002)(66946007)(6506007)(86362001)(186003)(8676002)(66476007)(83380400001)(8936002)(64756008)(66446008)(66556008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M2J3WWNYZjZid2pSaFFwVG9oMnNjbEp5MkloUGlkTTlIYzZ5NndlMnQrOEZZ?=
 =?utf-8?B?bG1MQkdONWRlZ0NMMmNINzF1SS9uaGQ1WkhmY2hNY2hieE01VkVqK2Q5aVVs?=
 =?utf-8?B?TUhUUlRGNmtvUDcvRFd5US9qV1FIekRCTEN5cjgwV0krRHdiY1Rzb2l5eElp?=
 =?utf-8?B?TDd6a3FHMnhnbEpTWVlVZ0J6aG9yc0ZBZVIyZWZsY0lSWFpOSDdMVjMwWTMw?=
 =?utf-8?B?MkFoTWZlaWNRWGFGWFpMV2IrdHJ5Y0ZWU0sxeXJWeTVGeDJBWlI0ZVRiVjc5?=
 =?utf-8?B?a2UzMUpDZkNGNlowVlJQYlNwTGdMZWdjWUhmc1dsV2Y2Qnd6RnZNeXFEdGVq?=
 =?utf-8?B?RXUxV1IrdXVpSmE0TTFSUkxWdEIwUS9rYy9mSEU4REUya2cvYTNaVk5FcFNT?=
 =?utf-8?B?ZWJmd0ZXUmxwVWp3MmFuWWE1VWtvdWVZQm0zTEJ3ZWtBMGFTNWh6bWNValBh?=
 =?utf-8?B?ejVqN1dHQ3ZlSEUvejduWUlWYTh5cytNWWRiMmF4YjNtdXM1VDNVWm9aV1R5?=
 =?utf-8?B?USszcHEwTG1pYXEyTUxkZnhKVzNmUmRUSUFib1RjTkdCWS9qZ3lDK0RQdG10?=
 =?utf-8?B?MVpJb3N2eU05RkZKVzRBaUpobmU5OXg5RlBxdkhaTXlnZ0VJaU5ocHUrZWJk?=
 =?utf-8?B?WUpuT204ZnpubG9HQTE4bDdiMld6OWY4WjFBT3NnY2tiL3hHZXQrSCtaaVdX?=
 =?utf-8?B?Y0lWa1VUQUw2QmZxd3lRVVJ6em9BZENiZGhJUWhPbjlYMnFJS3Q4SW5CZVZD?=
 =?utf-8?B?ODRiS3FXVmI0WDlsNDEydWZzWGpwdkpLU3d2TVQ5Vm96d04yd2RGKzZQRjc5?=
 =?utf-8?B?dFROS1RJbEk5OWpyMGNMTFJtaTdCMlJxSm02ejRQQ3pjOHNzN0xvY2Rpb28v?=
 =?utf-8?B?a0l5dXArUDhiWkE5ZTV0M1ZJZlh0V3RZSWZPY1VGS2R4QXV1WG5VdWgxdHpl?=
 =?utf-8?B?Yng0VVpNdXd5RWszbEF2TWtMay8wYURSa1JienJoK0ZHRklzTlk0akdBR3Q0?=
 =?utf-8?B?RmpWUHEyMUNmdEtUang5TUxUSDQrSXhxcE95T0VEV2d2ZmdQS2FHWUJqands?=
 =?utf-8?B?SnE5Y0ZCOXNwN2pPYzdsQzFkNmxyVGFLbExod0c4MmNrblVlY0UwVEp0S1pQ?=
 =?utf-8?B?V25VQnhxYk1WZ0s0MU8vSHY3cmZRZ1FOckFpRzB1TlpYblZiVG9tWUlqbjFV?=
 =?utf-8?B?QnlkY0Q4R1A4ZVJodkZtL29UZGVWRk43R3E2Q055Z0tJcks3ekdFNjFvZ3JN?=
 =?utf-8?B?bFJ5ZEY3eW5LWkdmMTBvVHlScjdmWENKTzN1MXNZOWhvWUFQdFlGODRNa1Zs?=
 =?utf-8?Q?y8moBdYGhl3Ho=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36dc06b1-c56e-4154-d600-08d8a0e5347c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 10:35:56.0177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRNDix7i+IcCBNdRIcldR9o+0l2qrsQTcvbPMrK9fzG7bVscyrEc+X2NQfuHW+trwiRP1rKjFYK9bkw/3zFlxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB1989
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

T24gVHVlc2RheSwgRGVjZW1iZXIgMTUsIDIwMjAgNzozMSBBTSwgT24gQ29saW4gS2luZyB3cm90
ZToNCg0KPiBUaGVyZSBpcyBhIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBkZXZfZXJyIG1lc3NhZ2Uu
IEZpeCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAtCQkJCSJGYWlsZWQgdG8gdXBkYXRlIEdQSSBzZXF1
ZW1jZTogJWRcbiIsIGVycm9yKTsNCj4gKwkJCQkiRmFpbGVkIHRvIHVwZGF0ZSBHUEkgc2VxdWVu
Y2U6ICVkXG4iLCBlcnJvcik7DQoNCllvdSBhcmUgcmlnaHQuDQoNClJldmlld2VkLWJ5OiBSb3kg
SW0gPFJveS5JbS5PcGVuc291cmNlQGRpYXNlbWkuY29tPg0K
