Return-Path: <linux-input+bounces-772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0A3812073
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 22:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 081281C21260
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 21:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D91A7E794;
	Wed, 13 Dec 2023 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H79pj4jK"
X-Original-To: linux-input@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDA4E8;
	Wed, 13 Dec 2023 13:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwUuH6UYPLtMJYptIqfvWi+QTHSiyBrL8IKCbqx2TF0Dog/2IE/vsU6J37g0k9MsXOv2YJkOPwC71myhszYH6J6+ZNwFmE1Xf3qsVBKeVEmXaXnhzgvk/bjozey7Z4/ddUucdBXFSvGKTySQVehR4MRhv6yKjvinoN5kCaGGgMm5h3X/ovb/G3RIxLw33Ij58uyQ4AP+zCvSLFze1R8Lxui9KtzT9Jd4IzvoBKnf0/NtP6ILUcRc1VoKgMfnPvAYsbxvvLD49/ckvgD4n6gcKLn7dYn8CJZhICtqjPLFUGeH2/YnsnH5NYPlRdhtb2k0DcPYtzpNK4b6bUjCGeqtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yZNN7RH8RDBxXCu3YJxZ7wcESOwLde++IqQTi1yJH8=;
 b=f9efcj5lk3iBCWgYW75wTMP5iSR6ET1gYbZp6N9e+f5K37m6fgn24nxEuipfJ+aHNNNM3Yi912j2Eiq6kncUx2Dk3EVQz32CCHSQ6ear66/TZkYVcQ1ffS5NzycpBZJiIaxHNCa7ZHi5ZeTBC4GqQPIBVuIbHEgKz4eydsYfg6J4C+/ErbvfITzWIKGNwJxzx/U1dliCeLr3tkjlixQloYqAHxGDYH1zsoDQxJ/kcCr3OOgjn4lWO4h2OBU5C7wYVzUZRlOYNHmrdka5GAs0qV9Kl3u4NV7ZkPXQy2maVu/ltiTYX8DfFbk0prI3H2WJXrUwX0futzglRsqKoDYj7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yZNN7RH8RDBxXCu3YJxZ7wcESOwLde++IqQTi1yJH8=;
 b=H79pj4jKviT28r1Mmehq7fAAAkkynZFajlLo7LK5qjU4D74T0sY4Eco0YN7YFN0uJTcQFDB9V5cAFs2aDPR7rJg7E77hg2kuLwXx13IJzj42oQX+QsI9rxEDCuCwZdxtaXwZz9aqKu7SYgEp/ldDE2OP8/QJdpuJ/YUNdeDL+JA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB6165.jpnprd01.prod.outlook.com
 (2603:1096:604:d1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.8; Wed, 13 Dec
 2023 21:09:50 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.008; Wed, 13 Dec 2023
 21:09:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Support Opensource <support.opensource@diasemi.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Topic: [PATCH 2/3] Input: da9063 - Use dev_err_probe()
Thread-Index: AQHaLFMbdcpDY7K7Gkyzrof7UGihELClSkSAgAAPDLCAAAk+gIACUEaAgAADQ+A=
Date: Wed, 13 Dec 2023 21:09:47 +0000
Message-ID:
 <TYCPR01MB1126911604912279C74C70792868DA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231211165708.161808-1-biju.das.jz@bp.renesas.com>
 <20231211165708.161808-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWEH274CJTpMVY1c7rL0BrpHcjWDp0Acb5evDHotBEzTg@mail.gmail.com>
 <TYCPR01MB112699325FAC71E81546D258B868EA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdV6sPuRp3=5T43Ruu2P3mMB5C5w4=QS_GVVxT8GuwRDpA@mail.gmail.com>
 <1784A867-E5BA-47BC-AC3C-5B5EAB2A056B@gmail.com>
In-Reply-To: <1784A867-E5BA-47BC-AC3C-5B5EAB2A056B@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB6165:EE_
x-ms-office365-filtering-correlation-id: 27dbd2a0-c395-44f4-b930-08dbfc1fd63e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ikwya6E4JQmjKJsMyeuIQBEqwPwFkcnZLhmLofQF1Jkv86naBg025JkPtvXCIQ+nyb+tQGTYthFU5V3jcZqJFaozb0umLq0n4Q4eJCxyNo5UU8eM8WjLSaWi/9QpaCW/KAwV/S5WihwnjzWER7/ZANyqxPLl8XubbPxASCk8+dQ59q+PpoBPYZViwwBKUHWjl80SFx99hbMC3HsopHxdZ6rQXM7TR1OEk11XLqXDfW0mtOZdZ4Smb9LMqPUybfHsxujbpet7kiV6qZTzx3N/+pIY+rXyh/L94rM6UzWtRUGJWeAIoCS05kn2S3shhheesC0t6bZJVsHQEAw6k83iqtE9X4JyW7odGiyyYnnuSOiqWa6VtvN7DiEQMrXfmnfgrcXYN8hy93soIdw4q7BKMjVUFqMHpCpwFsnb7KpXwX0vC6BQ9kdOyf673RMGQEfBuPk0K/HdiM/bfiEKZhLjb526NsGYZ+1noznu6YCh7A37TJ9PXWJ6f+F2NO5wnJCXYlDJW13fpdlEBPxOB2QxcrNNVzt8By4wLOmk2cpL1FnGHAOBAZtX9DRTtr/Qasv7uAQ4h6ia7gcxWzbRSH63+uz7drYzWRUgig3bqVj/sgUQEfM8TEEiH4mXe+y2vaVj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(83380400001)(53546011)(7696005)(71200400001)(6506007)(316002)(4326008)(8676002)(8936002)(52536014)(86362001)(38100700002)(64756008)(54906003)(110136005)(66556008)(66946007)(76116006)(66446008)(66476007)(55016003)(478600001)(9686003)(26005)(5660300002)(33656002)(38070700009)(41300700001)(122000001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWszOXRHTmlIbko3SWVUa2VEc3grcys0aTFFUXEybGRjbXdzQUp2dlJ4WGd4?=
 =?utf-8?B?SUlxTnh1MnY3U2JIckVHYlVkaDNPWWlMamsvOFhOeXNsc3NWQ0Y2U0RQc3J5?=
 =?utf-8?B?ZWFwbit3Z0N2VWJmQ21FVG5ocHQ3TVBVcU12WG0yeGQvY0NoNHVhMTJoejFI?=
 =?utf-8?B?aWYvYzJ0R3FDdWdic21rcWMwV1JOZU5Da3MvTkE5UVJlSlpZRG1odkNTVWVQ?=
 =?utf-8?B?NS9seDdzSThKRGFRSGlnYWl1QU9WZEZKQ2YxcEs0clEzRzV6MjJxOVd2VENo?=
 =?utf-8?B?VUN5OGFZb3N6TUhNYWN0d0NOWHJ2U2E5Q3JMMkpRZ0paMSthN2t2S3JqQ00w?=
 =?utf-8?B?TDhXemM5bVpJc1YwMk52ZXBPdE5naUU2UUdqeG5NZHFxaTRXT04xMEdDaU5y?=
 =?utf-8?B?T2tyVjE0S1JtL3o0elBUSFNxY2UrMmNkelJoUy9lQ1hwbmxVR0N2TG9BbjZK?=
 =?utf-8?B?NUR2ZGVJSUxIUzNSWDUxdzZqRGdjYi96REttQzBNUmhqZFB5TUJEdnl5NEVY?=
 =?utf-8?B?cnh6TXdVclIydkg1N0k0TVhja2w4aktuTzlTaDhEbDI3RUpTVXVCa0RvSzNU?=
 =?utf-8?B?Z1Y2YldQcWxRTG8zY3BsTHN2bkNJZDRRWkxxT3dqWXUva0hPQVNtQWRSRmE4?=
 =?utf-8?B?MWR3NDBoN0FWYTFFVktyWk9qNkpFTzMycHYzY0NqK25DUnBYak5BV3JDMGhp?=
 =?utf-8?B?UlI3blR3WDlaU25PQnJvN2JrWVZIeGZJVEN0dGVUVVppMzloMkpJVmUzMXhL?=
 =?utf-8?B?ZXQvWWdFMGt6SnRKcnIybDYwYmNWRFZLbWNseXBhZ1NLUktsbGRsTVpTRjdq?=
 =?utf-8?B?MTk5RmFTN3YvSFNma1ZaVStJNnNzZEZuZUt2by80aVc5cEdEQ3E4bnExL2Q4?=
 =?utf-8?B?ZTJRRGplSktDK3ZzbUZUSzRGcERWRFdkaFBTeGNYSW9obzg0NmptWHlhVjhO?=
 =?utf-8?B?YzFFWGxRek1jazF4RThpWk5XU0I4R0V0NUZDUEFtWWQxYmhmazRVSW1mVEZu?=
 =?utf-8?B?WFMzclZxTDZ3cG9SRnRtTkNkMFRRcGIwNUJqRE9zUGVHK0VlL1RMMFh5ZDVu?=
 =?utf-8?B?OWprTytLVHVyK2JNNHBITzF4WWxuN1dldit5MDNPQ3JwdG04MmhZS2pOOXU2?=
 =?utf-8?B?L3p6RDdoSGVPS2M3TE0vL0JOb0lPUG9Hd1FUTEo4dWNqRXJ1S2U2dUdnbGdh?=
 =?utf-8?B?WVZBbTQwU0x1REltYi82UzZkWEpWL2M1STlBK0g4T1I4WEY0cGNRNW1wMExH?=
 =?utf-8?B?elRKVVJocWs3WGhtb2F2YlZGeGd6bDBRdURhQm5IUmh5MlNXRkh5QkpVS3F6?=
 =?utf-8?B?c2tXanZja0tXK3RxL0lNQ0g5Ulk0VGREaDI1VzZTSTZOTXZnMVdQN25Da2FS?=
 =?utf-8?B?QWZSc0hzQWlCdnl6WHlQZ3dRYnBJeGlEeG1VeXo2K3c0Z2pidGFpaytENlMr?=
 =?utf-8?B?dUQrNjN3eEFPajVibkxxRTQ5L0pCT1RxeXpmOFdkM3dPa1R5dUtXb3k3aHp1?=
 =?utf-8?B?NWljKzFzcFkzaTR1UXU3ZVUzRkJ2N3VXbXNpWkpvRmFoZmdka2o1cDE1OTlU?=
 =?utf-8?B?ZHoyQmNTeHNBclVtSXZneGF6WHRBRnBzbDFHUGtWRHpObTJiNmdrdGlGaHQw?=
 =?utf-8?B?WU1iR3BlY2lQL2hBZ0hiSWN5SG5HU2phdjVUZXFwR0pxak5iZDNQNlpiYmps?=
 =?utf-8?B?bFpwbVpOUXRpTHJLVVdBL3E5Sm8yUzRhbzBaRjVaTVZTNUxzaVAzSC9LbWVM?=
 =?utf-8?B?aWg2RXhkZEJTOHhPc28vR282NUpiemxxdWNMbzJSRWtWNmtPS1MxTDFneW90?=
 =?utf-8?B?cW9mM3puS3VmVExuRTdnT0JTVy9WQzFJNHgwc3JiVDhWRGkrV1p1QmMvcWQx?=
 =?utf-8?B?L2oxaHpEMzJmVTU1a0lxa0Ywcnd4UjdreXFaeDNyemljYlo0cG40OVBGUm9S?=
 =?utf-8?B?aGh2SWZVUVpPNnF4ZnFjSGUvOURuSWhNT1hVQXhkenpIUTN1RzJOQUFQakJp?=
 =?utf-8?B?WmFwb2JTN083SnRsT0RKZm1uL2pOVDRMdEVzUDlwN0ZxQkttQlN2ZGJaMU1F?=
 =?utf-8?B?S090UnpEeEpCNzQ3TGpTaStlUEw3QXlGR2g4bzJLT0NrNS9GSVo2SEZmeGhi?=
 =?utf-8?B?Nm4wY09ReDZNbk15VGpsMTlEZHovZWJHam85UHNnT3FYSFNyY0gwZnFOV1hB?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27dbd2a0-c395-44f4-b930-08dbfc1fd63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 21:09:47.1135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HoO80vRXv4heIJXs50TNtHnfg8D9w9xzUqSh4LT7EsFKjxHdqkjoWeO3H4TbF3nPbnRiaWu7Yrnx7cZLOSMqTP9+NhrvYeTsYbjgQya21rA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6165

SGkgRG1pdHJ5IFRvcm9raG92LA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50
b3Jva2hvdkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgMTMsIDIwMjMg
ODo0OSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gSW5wdXQ6IGRhOTA2MyAtIFVzZSBk
ZXZfZXJyX3Byb2JlKCkNCj4gDQo+IE9uIERlY2VtYmVyIDEyLCAyMDIzIDg6Mjg6NDUgUE0gR01U
KzExOjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90
ZToNCj4gPkhpIEJpanUsDQo+ID4NCj4gPk9uIFR1ZSwgRGVjIDEyLCAyMDIzIGF0IDEwOjAz4oCv
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPj4g
PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBNb24s
IERlYyAxMSwNCj4gPj4gPiAyMDIzIGF0IDU6NTfigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4+ID4gd3JvdGU6DQo+ID4+ID4gPiBSZXBsYWNlIGRldl9lcnIo
KS0+ZGV2X2Vycl9wcm9iZSgpIHRvIHNpbXBpbGZ5IHByb2JlKCkuDQo+ID4+ID4gPg0KPiA+PiA+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+DQo+ID4+IE9LLCBJIHdpbGwgc2VuZA0KPiA+Pg0KPiA+PiAxKSBzZXBhcmF0ZSBwYXRjaCBm
b3IgZHJvcHBpbmcgdW5uZWVkZWQgcHJpbnRzIHJlbGF0ZWQgdG8gT09NDQo+ID4+IDIpIEEgcGF0
Y2ggZm9yIHJlcGxhY2luZyBkZXZfZXJyKCktPmRldl9lcnJfcHJvYmUoKSArIFVwZGF0ZSBlcnJv
cg0KPiA+PiBtZXNzYWdlIGZvciBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCkNCj4gPj4gMykg
c2VwYXJhdGUgcGF0Y2ggZm9yIGRyb3BwaW5nIHByaW50IG1lc3NhZ2UgZm9yDQo+ID4+IGlucHV0
X3JlZ2lzdGVyX2RldmljZSgpOw0KPiA+Pg0KPiA+PiBJcyBpdCBvaz8NCj4gPg0KPiA+UGVyc29u
YWxseSwgSSdkIGJlIGZpbmUgd2l0aCBqdXN0IGEgc2luZ2xlICJjbGVhbnVwIGVycm9yIHByaW50
aW5nIg0KPiBwYXRjaC4NCj4gPkJ1dCBEbWl0cnkgaGFzIHRoZSBmaW5hbCBzYXkuDQo+IA0KPiBJ
J20gZmluZSB3aXRoIGEgc2luZ2xlIHBhdGNoIHVubGVzcyB5b3UgZmVlbCBzdHJvbmdseSBhYm91
dCBzcGxpdHRpbmcgaXQNCj4gaW4gMi4NCg0KSSB3aWxsIHNwbGl0IGludG8gMiwNCg0KMSkgRmly
c3QgcGF0Y2ggZm9yIGRyb3BwaW5nIHJlZHVuZGFudCBwcmludCBtZXNzYWdlcy4NCjIpIFJlcGxh
Y2UgZGV2X2VycigpLT5kZXZfZXJyX3Byb2JlKCkNCg0KDQpDaGVlcnMsDQpCaWp1DQo=

