Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B3B2D1BC3
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 22:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbgLGVKx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 16:10:53 -0500
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:40350 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726370AbgLGVKw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Dec 2020 16:10:52 -0500
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7L71Fb011977;
        Mon, 7 Dec 2020 16:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Bg428h0RVIEjyXRRz4JVn3Jb6Z9lvM9xbsotV5DmCnQ=;
 b=iMeJSrkCySyYLkxJzPMx+h5o0VWuCNHxoPkvUvLgj9tj1Izq0m4SgFebycytnG+AAxCr
 WJ2QZc1PyUTHs92OIcTOAFY0r7sgZNsxf7v1Eqzm9A5sf2AoRfSIwTTgbF4RSvIz0yS1
 aVXwTSpWi7+ir5sJ5wb2KXKf4RRYGT3Kf5b9WdDTLfzvq4Qr5SZvECUM3sM+Z0w/D66v
 iPbc/nmmhGdz4j66+sqMJN1BSS3KkZ7bd/kbaJw74FVaID8+gAIxzlt4Hvwb9rs3Oa5v
 RK0LPzuXvOd4kJNq5Bt/CDz4qhbk6hc8piSiUyvKCBcfK9mHq5kbgaSNerF4zdDuVG6t sw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3587sufe3h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Dec 2020 16:09:59 -0500
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7L0JaY170185;
        Mon, 7 Dec 2020 16:09:58 -0500
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2057.outbound.protection.outlook.com [104.47.37.57])
        by mx0b-00154901.pphosted.com with ESMTP id 359qrvm77r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Dec 2020 16:09:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5N8XrwmfP7XnOLfhoDrRqihcGWgCh1Dexox3owLhS+ga9zi+EHyHcGXkZ+9Mv12jEqRvpFzy0GZIna276a0S+MxIIKonMliwKKA68rUHCZrnde1GV8I78CXHNimO+1FeFjznH4xihWGqon1u7UKThNO8EqUmJJdfDOPQUt9vU8GpbAJp37pLsvrt/eeQ8d9TmJwvFJhmDyDYi95Sey8Xqzb1UHZX3n0hDNTvAlYZbSmmwad6K/Sz3BUTLRVzPsX6odYV+3YmCfDqsX++7XshY1Vy64w1CA2i0+8l0yB9GtdjB4RJl1bl7PF/saen/Q+GlSHlwYLYYP9on6x5UqXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg428h0RVIEjyXRRz4JVn3Jb6Z9lvM9xbsotV5DmCnQ=;
 b=A5dR8yA8S4xzVIS8vzDK5AhK8LwdO41e1wNkqyu2+ssppBfWyFzXYr398SIzZY6fuBnlCjxNnb4LSyx9kMaRyVR0cX61FOmQPEOrJHRb9lcBAHCSmvDuPEuuhLAerTystyCbuUKnw9ohwgEzWkRvdcN5KW2rBcHmIIkT2YaTZPTFU0H0NgATNShPpxMtBMNA0hr6rweg26BFdhWFPlzfrRWcd8HAk0WbEC7JvZ7bJ6hfxf1DjIiNFFGvZ9NXqUSC+k8AAhHkO0ArLKCiHH5m/HxFf3Gn60u8q/zYTQS6CWA6PVNFgx+0VdzksRw1fCe0PcAEpqoPhIQhgDZOU6EYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg428h0RVIEjyXRRz4JVn3Jb6Z9lvM9xbsotV5DmCnQ=;
 b=KtyLIgm3C6WC9udwLkW+YKgy7CEaHbQYkuAYL9EV16ackV5pnNrUq/KmlerQydkK8MxHxZi+XvhCPw6zMjCeoGHgKxcLZdUQB5y0U+GtMpBpN5dCiEs1rcH9grv63iWrATyrsJLqq01tcet5EXWDnrh32TAt5tqjh2ms1kSKGCY=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DS7PR19MB4568.namprd19.prod.outlook.com (2603:10b6:5:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 21:09:56 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 21:09:56 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
Thread-Topic: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
Thread-Index: AQHWzL+VPiwW+b1+DESWgz73ZEs9XKnr5ijggAA2BoCAAABNoA==
Date:   Mon, 7 Dec 2020 21:09:56 +0000
Message-ID: <DM6PR19MB2636B8F9DB38079722EA0397FACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <a075a4f7-21f6-54cf-8d97-af7f55ff4b91@molgen.mpg.de>
 <DM6PR19MB2636B859754CFACE88F5652BFACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1fe43de4-61e1-82ac-2a17-fe2adfea252a@molgen.mpg.de>
In-Reply-To: <1fe43de4-61e1-82ac-2a17-fe2adfea252a@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-12-07T21:09:53.5618682Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=531ee698-6942-4ddd-bb6b-aba609886e1b;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c80d0816-646e-4944-df2a-08d89af4730f
x-ms-traffictypediagnostic: DS7PR19MB4568:
x-microsoft-antispam-prvs: <DS7PR19MB45687173B2509868094EC52FFACE0@DS7PR19MB4568.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BmwVAWxQnwNz9fqtFqU1yrrLEjhV+nPBHaM4UJlCi11OoQfbcdG8ZX/XN0IowSKFUwaYBVH5+4fJwhKxus+nezmyQeRucQbFtIppTbMBhalUfYB9TTXZMXuConcmWsUsGK9TyFjZOxhK7JgnhF8ayx4zzzy6Yxbk9zSiNSZ7R4oVdF4k1sIQJ6JaqYev4o4jvWGAFTTxiZYr+P3GglbnoyJxRajg42XaMZPIigiix0QLDhkW3x+ZPxOOpgLQddtcLHO2dcOgim7woGj+dUlyRQo222IOOFSk2B/cBZb9YQgckLNpYZH5dpMtUlHaCpd/KWVmtFdN/B4fH3PAXUBpXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(7696005)(8936002)(66446008)(66556008)(66946007)(76116006)(5660300002)(71200400001)(9686003)(2906002)(4326008)(6916009)(8676002)(33656002)(64756008)(26005)(66476007)(86362001)(55016002)(316002)(186003)(478600001)(83380400001)(786003)(52536014)(6506007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TENCRkt3QThZODhhaGxEbzZzYXhhbWdlWi9TOW02UUpESUxWZGdYSHJncW9J?=
 =?utf-8?B?L3VKZVJuOGlsNGdyeE42VHVOWFdPWHBaZ3E0TGtwUkpQVlBKb1k3eVhnVGt0?=
 =?utf-8?B?MHo1dVNzK2ZhZktvZm9ZbGxVVUdXUWpRZ09Wdk1iQUg2L2xqN25FR2djSWEv?=
 =?utf-8?B?cGlQRXdXZ2poMEVLdVVSQVQxa0haQ211a0IrazMyN3krNFRmbmtOUmdKakRK?=
 =?utf-8?B?a3V3WGVQUERIOGNkZnVRMmhQMzkzTkh4Q2dITDh0bm0wWk5mQXhVSW41dnNQ?=
 =?utf-8?B?U1lYR09wamZVUFBUbTlsd09paFI4Y29FblJTY3dUV0ZyeDl6S2QxaVh6NEda?=
 =?utf-8?B?UlRaa3MrSFZBcWJRSEhqNHozVER0b3ZGcFV2UDlwWm9lTkM1UmVSZC9sTDAy?=
 =?utf-8?B?eExCazRLWGJ6ME96M3BzcUUrTEJ2cmlpOS9QWHF1dlVWSmNnWHMxVHc0UU1v?=
 =?utf-8?B?L0hpd0ZZY0orQ0NscCt3L1RwS0o5YWxZRkZodXZIRWhaK1pyNm04MXNPMGg2?=
 =?utf-8?B?NXladVJnbGFYc3ZFczIrcE44dXZ5S2hRazA5YTF5cm5nYVhnS3hWQVJSdHpp?=
 =?utf-8?B?UHlON1kyZ0w3SEpQZmVkMStHUUNHS1JjVlNFM2FaUDhrVmN0NzJwSGpuMGNq?=
 =?utf-8?B?TksyR3IzN3pYNVd6VzVQSGExRTJ1REl3czBuM09GSHQ0T2k0S2RkRkFWQnNX?=
 =?utf-8?B?UU5SWkxpS1lIbFNpcUJMR05WN2sxSVl0QWdqa2l4MHRBTUxvazhPT3F6TUpr?=
 =?utf-8?B?cDZ0alVTK25OaVdmeU9tOGN1eUhXRnJPU016bCtTeTVrVFlTa3F6TjZaZUsy?=
 =?utf-8?B?dSs1WEdwTUZ1NkJYMnUyTmZHaURxUWZEQzQ2bnlzODlHUEM2TFZ5UVN1Z1Zz?=
 =?utf-8?B?VVJkc21WNmNLUTlON2tVd2RhNE03a1BCUUExaDJOei9FUlBTbE9mZk5td2h2?=
 =?utf-8?B?TGh3Vi9rSnVDbHU5bjdnaU1pWjUzbmN4UW41RktxN3FYWXBPc1lLb3lDNllE?=
 =?utf-8?B?OUFrS21kNzJZUGJOWWlPTThjcGtiWkkyQ2xzazJuVnRNYzN5ZHpIcGU1bDc2?=
 =?utf-8?B?QVdZczhuZG15MjFkWENORlhaR2tOS0pjaHBTSVM1djVLNHV2aUJNbkpwSEFL?=
 =?utf-8?B?RisyWEdvRi9Ed2p0M0NWeXMwWklNQ3k0anZqNlpaN0hCaXZTZUszMmM1Z3Bm?=
 =?utf-8?B?T2FDOE5JbWpwYjZ1dENNaFFpemdBSXNSYWVXYVY3MCttU3YrMFlCZ2ZHeFF4?=
 =?utf-8?B?eWJWcFpvZmlFT05TOXMveEZKcmozUWxvRXg0S05EV1cwUGxhcndLekFFeGp2?=
 =?utf-8?Q?2Gwvz/K/HPbMk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80d0816-646e-4944-df2a-08d89af4730f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 21:09:56.5193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YoEIXIwzuxNlv1SEqviY/UhibMVxWKihZXmtQPzX8077/tuiYbpzZubRPfSv6/ldEQ3k48epRkmwAHGvFhOAO6FVcRaqdMHp1mFP4jTKc7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4568
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-07_16:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070136
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070137
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DQoNCj4gRGVhciBNYXJpbywNCj4gDQo+IA0KPiBBcyBhbHdheXMgdGhhbmsgeW91IGZvciB5b3Vy
IHF1aWNrIHJlcGx5Lg0KDQrwn5iKDQoNCj4gDQo+ID4gVGhlIG1lc3NhZ2VzIHlvdSdyZSBzZWVp
bmcgYXJlIGhhcm1sZXNzIGluIHRoaXMgbGFwdG9wLg0KPiA+DQo+ID4gVGhlIGxhcHRvcCBpbnB1
dCBpcyBzdXBwb3J0ZWQgdXNpbmcgdGhlIGhpZC1tdWx0aXRvdWNoIGFuZCBpMmMtaGlkIGRyaXZl
cnMgYXMNCj4gPiBub3RlZCBpbiB5b3VyIG1lc3NhZ2VzLg0KPiA+DQo+ID4gWyAgMzkzLjI4MDEx
NV0gaW5wdXQ6IERMTDA5RkY6MDEgMDZDQjpDRTM5IFRvdWNocGFkIGFzDQo+IC9kZXZpY2VzL3Bj
aTAwMDA6MDAvMDAwMDowMDoxNS4xL2kyY19kZXNpZ253YXJlLjEvaTJjLTIvaTJjLQ0KPiBETEww
OUZGOjAxLzAwMTg6MDZDQjpDRTM5LjAwMDIvaW5wdXQvaW5wdXQyMQ0KPiA+IFsgIDM5My4yODAy
MjFdIGhpZC1tdWx0aXRvdWNoIDAwMTg6MDZDQjpDRTM5LjAwMDI6IGlucHV0LGhpZHJhdzE6IEky
QyBISUQNCj4gdjEuMDAgTW91c2UgW0RMTDA5RkY6MDEgMDZDQjpDRTM5XSBvbiBpMmMtRExMMDlG
RjowMQ0KPiANCj4gV2hlcmUgaXMNCj4gDQo+ICAgICAgaW5wdXQ6IFBTLzIgU3luYXB0aWNzIFRv
dWNoUGFkIGFzDQo+IC9kZXZpY2VzL3BsYXRmb3JtL2k4MDQyL3NlcmlvMS9pbnB1dC9pbnB1dDIN
Cj4gDQo+IGNvbWluZyBmcm9tIHRoZW4sIGFuZCB3aGF0IHRvdWNocGFkIGlzIHRoYXQgc3VwcG9z
ZWQgdG8gYmU/DQo+IA0KPiBJZiBpdOKAmXMgaGFybWxlc3MsIHNob3VsZCB0aGUgbG9nIGxldmVs
IGJlIGRlY3JlYXNlZCBmcm9tIGVycm9yIHRvIGRlYnVnPw0KPiANCg0KVGhlcmUgYXJlIHR3byBj
b21tb24gc2NlbmFyaW9zIHRoYXQgaGFwcGVuIG9uIERlbGwncyBsYXB0b3BzLg0KMSkgVG91Y2hw
YWRzIGFyZSBjb25uZWN0ZWQgdG8gMiBidXNlcy4gIFN1Y2ggYXMgUFMyIGFuZCBpMmMuDQoyKSBU
b3VjaHBhZHMgYXJlIGNvbm5lY3RlZCBvbmx5IHRvIDEgYnVzLCBidXQgdGhlIEVDIGNhbiBlbXVs
YXRlDQphIFBTLzIgdG91Y2hwYWQgaW4gdGhlIFBTLzIgYnVzIHVudGlsIE9TIGRyaXZlcnMgaGF2
ZSBzdGFydGVkIHVwLg0KVGhpcyBhbGxvd3MgdXNpbmcgaXQgaW4gQklPUyBzZXR1cCBmb3IgZXhh
bXBsZSB3aXRob3V0IGFuIFVFRkkgRFhFDQpkcml2ZXIgZm9yIEkyQy4gIEl0J3Mgbm90IGdlbmVy
YWxseSBzYWZlIGZvciB1c2luZyBpdCB0aGlzIHdheSBpbg0KYSBnZW5lcmFsIHB1cnBvc2Ugb3Bl
cmF0aW5nIHN5c3RlbS4NCg0KSSBkb24ndCBoYXZlIHRoZSBzY2hlbWF0aWNzIGZvciB0aGUgbW9k
ZWwgeW91IHJlZmVycmVkIHRvIGNvbmZpcm0gaXQsDQpidXQgSSBzdXNwZWN0IGl0J3MgbGlrZWx5
IHRoZSBzZWNvbmQgY2FzZS4gIEluIHRoZSBmaXJzdCBjYXNlIHlvdSBzaG91bGQNCnNlZSBzb21l
IHNvcnQgb2YgbWVzc2FnZSBhbG9uZyB0aGUgbGluZXMgdGhhdCB0aGUgdG91Y2hwYWQgc3VwcG9y
dHMNCmFub3RoZXIgYnVzLCB5b3Ugc2hvdWxkIG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aG9zZSBkcml2
ZXJzIGVuYWJsZWQuDQoNClRoZSBrZXkgaG93ZXZlciBpcyB0aGF0IHRoZSBQUy8yIGRyaXZlciBh
bmQgaTJjLWhpZCBkcml2ZXJzIGRvbid0IGhhdmUNCmFueSBoYW5kc2hha2UgaGVyZSB3aGF0c29l
dmVyIGFib3V0IHdoYXQgaGFwcGVuZWQuICBUaGlzIGhhcyBjb21lDQp1cCBzZXZlcmFsIHRpbWVz
IG92ZXIgdGhlIHllYXJzLCBidXQgYmVjYXVzZSB0aGVyZSBpcyAibm8gbmVnYXRpdmUNCmltcGFj
dCIgdG8gYSBnaG9zdCB0b3VjaHBhZCBkZXZpY2UgdGhlcmUgaGFzIGJlZW4gbm8gZWZmb3J0IGJ5
DQphbnlvbmUgdG8gZml4IGl0LiAgWW91IGNhbiBjb21waWxlIHlvdXIga2VybmVsIHdpdGhvdXQg
cHNtb3VzZSBhbmQgaXQNCnNob3VsZCB0aGVuIG5vdCBiZSBwcmVzZW50Lg0KDQpJbiBzeXN0ZW1z
IHdpdGggdGhlIGZpcnN0IHNjZW5hcmlvIHByZXR0eSBtdWNoIHdoZW4gdGhlIEkyQyBkcml2ZXIN
CnN0YXJ0cyB1cCwgdGhlIFBTLzIgbW9kZSBpcyB0dXJuZWQgb2ZmIGFuZCB5b3Ugd29uJ3QgZ2V0
IHRyYWZmaWMgb24NCnRoZSBidXMuIEJlY2F1c2Ugb2Yga2VybmVsIHByb2Jpbmcgb3JkZXIgeW91
IHdvdWxkIGVuZCB1cCB3aXRoIHBzbW91c2UNCm1lbnRpb25pbmcgaXQncyBzdXBwb3J0ZWQgYnkg
YW5vdGhlciBidXMgcHJvYmFibHksIGFuZCB0aGVuIGxhdGVyIGluDQpzdGFydHVwIHRoZSBpMmMg
b25lIHN0YXJ0cyB1cC4gIFRoZSBJMkMgZHJpdmVyIGNhbid0IGp1c3Qgbm90aWZ5IHBzbW91c2UN
Cml0J3Mgc3VwcG9ydGluZyBzb21ldGhpbmcgYmVjYXVzZSBpdCBjYW4ndCBwcm92ZSB0aGUgZGV2
aWNlIGl0IHN1cHBvcnRzDQpub3cgaXMgdGhlIHNhbWUgb25lIHRoYXQgd2FzIHN1cHBvcnRlZCBi
eSBwc21vdXNlLg0KDQpJbiB0aGUgc2Vjb25kIHNjZW5hcmlvIHlvdSdyZSB0YWxraW5nIGFib3V0
IGEgdmlydHVhbCBkZXZpY2UgZnJvbSB0aGUgRUMNCmFuZCBhIHJlYWwgZGV2aWNlIG9uIHRoZSBJ
MkMgYnVzLiAgU28gdGhlIG5vdGlmaWNhdGlvbiBmbG93IGlzIGV2ZW4gbW9yZQ0KY29uZnVzaW5n
Lg0KDQpIZXJlJ3MgbXkgdHdvIGxvdyBlZmZvcnQgaWRlYXM6DQoxKSBBZGp1c3QgdGhpcyBzbyB3
aGVuIGtlcm5lbCBpcyBjb21waWxlZCB3aXRoIHRoZSBzdXBwb3J0IGZvciBib3RoIGNhbiB3ZQ0K
bWFrZSBwc21vdXNlIHdhaXQgdG8gaW5pdGlhbGl6ZSB1bnRpbCBhZnRlciBpMmMtaGlkIGFuZCBo
aWQtbXVsdGl0b3VjaA0KaGF2ZSBmaW5pc2hlZD8gIFRoaXMgaXMgcHJvYmFibHkgYSBxdWVzdGlv
biBmb3IgQmVuamFtaW4gaWYgdGhhdCB3b3VsZA0KYWN0dWFsbHkgd29yayBhbmQgaXQncyBhcyBs
b3cgZWZmb3J0IGFzIEkgdGhpbmsgaXQgd291bGQgYmUuDQoNCjIpIERvd25ncmFkZSBhbGwgcHNt
b3VzZSBtZXNzYWdpbmcgdG8gZGVidWcuIFJlYWxpc3RpY2FsbHkgbW9kZXJuDQptYWNoaW5lcyBh
cmUgbm8gbG9uZ2VyIHVzaW5nIHBzbW91c2UgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGUgbWVzc2Fn
aW5nDQpiZW5lZml0cyBubyBvbmUgZXhjZXB0IHRob3NlIHRoYXQgaGF2ZSBhIHByb2JsZW0gd2l0
aCBvbGRlciBoYXJkd2FyZSwNCndoaWNoIGNhbiB0aGVuIGJlIHRvbGQgdG8gYm9vdCB3aXRoIGR5
bmRlYnVnIHR1cm5lZCBvbiBmb3IgcHNtb3VzZS4NCg0K
