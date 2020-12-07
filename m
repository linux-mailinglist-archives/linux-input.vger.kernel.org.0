Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62DD2D17E2
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 18:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgLGRvL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 12:51:11 -0500
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:42818 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725877AbgLGRvK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Dec 2020 12:51:10 -0500
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7HllQG012074;
        Mon, 7 Dec 2020 12:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=NJoKJsak3Xl29yEBVIo3+ahGKs2Gd7/jneJHcG7PNTg=;
 b=Hdx+sp3tmq5Omk/0DOjXPyK/gLz5s7bGCyuwYvkCpkO81ctAVoow3L5uT3avFgB3RiXj
 MpRMBYDUXcxJxfK4EZsGGOG3WlymrmwX3Nc+kV1stO3lTILprqmxhcPWBt2w3EHkx85x
 sq1CvdSvbjxGHWk4RJOErhePQ4O2xEVPvBhgLCsZN4K3RvUplYCExUq5F0fOV4qujEqQ
 174s0OytQ//1mjEMU0Hp6ZB4xXTJbN8Y8iFXjB5jsr1r/LnPZnGrykeqFQPblglOwr3z
 RElGn5cJMV+zbJk2euVN7KB8+nSF6cMABeNTXBWzxt/Mu0g3Assj0knjNjcwmhlJmWh8 EA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 3587vypmau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Dec 2020 12:50:16 -0500
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B7HliPC042132;
        Mon, 7 Dec 2020 12:50:16 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by mx0a-00154901.pphosted.com with ESMTP id 359pf6b719-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Dec 2020 12:50:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Es5n0D4KErY1lWp1Hul0GvZZhh0Pm9qTX5d4YGHC3pW2DZqCc26JPjAUpImACTGEI8akAn7xoOKLEnDP5p7xoyasphIcKQRUMdCOWeRE+iqvken+cGtJvJznWdr1DHk3ulH8VLs7IKCBZEaSeKQvGvq8KduER8/HNJLc4f9bZdcebHTTiQd2+VsiAyanYd1mucXWm5FaR4A7bN0zuqgKwEoqa5KRBA3cjy8pkUE4Ay+CGBAuVo4OvW8JFP92kWmftXzv0eE4toLpUKeJkaAPhEDgy7qxzO1fpszMTI9j5Va9D/fnsV65dqxzp+cvFP/rPUmUW9b4vNv9z08pwyD0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJoKJsak3Xl29yEBVIo3+ahGKs2Gd7/jneJHcG7PNTg=;
 b=hkl25JzWpbzqmlA8t6gGRXFcVI3+pKEjOOEH53lbQ4R+/QS6mQE8VSSryHsgtYHPGGEP2KHw6Y/g62QvLSvzNR50GLuVvc855/xjVfdYkHgwsZyhRUF7IIziwTdere0WOJOssfk5aHMj7hN4NDIUZrPpH+kGf7Gu1iahiYBu+2YBAdkmbM5nHMDk+5FHoVO9SXzsSu74Jno28Jdsb73lu2HOBiJKPb9M4EL6LTuz/5UnglG0x1rytBCICS89iOIF2hxxB29Ck0pdrjmd3d1Jh5t6luHRUOrEQCprWq4rdBlX4dwb4Q8eusDKcF7ZA7BdWOqh7VgM+zBdiHLzu14tuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJoKJsak3Xl29yEBVIo3+ahGKs2Gd7/jneJHcG7PNTg=;
 b=Ab6ndwmhfaXTXGjCQub10k2fnhOxlmxvSpu2ZNvvkG6PnPnj5P6Oo+NoToHilaNkNdgNQtyKDRENDm8mZsSoI0tSawT7F1WLAUTsU6b7aomj3jSwHVb2/XTfu1IH5J/tyjb+EW71QIiyAduSd8zt6WRErdG85iAZO99U75Uj7zU=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3260.namprd19.prod.outlook.com (2603:10b6:5:199::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 17:40:12 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::8a8:3eb2:917f:3914%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:40:12 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
Thread-Topic: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
Thread-Index: AQHWzL+VPiwW+b1+DESWgz73ZEs9XKnr5ijg
Date:   Mon, 7 Dec 2020 17:40:12 +0000
Message-ID: <DM6PR19MB2636B859754CFACE88F5652BFACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <a075a4f7-21f6-54cf-8d97-af7f55ff4b91@molgen.mpg.de>
In-Reply-To: <a075a4f7-21f6-54cf-8d97-af7f55ff4b91@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-12-07T17:39:47.6458076Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=70c1b6b1-df62-4741-9ffe-3f5157ba968e;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eefc2b70-fd7d-48f1-8c7b-08d89ad72669
x-ms-traffictypediagnostic: DM6PR19MB3260:
x-microsoft-antispam-prvs: <DM6PR19MB326028E38C806BE3F6EF96B5FACE0@DM6PR19MB3260.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Yrj2sLtat9sV+YkFDy7r5f00iDcQO6EPtRYh/jZoZtCTfaivwItiL8Zg9Lvkij4d+2tb/penXdC/rURvnAp+HD9FSUFFfFFkw6k7jha9QES58M6ZmTD1xa7bTW7XiSFLq4idEi3rCGCuOV2Ev7iPxk4FCu46NL4wMIltx6fp1IFFywsjjEV4f3TqE0kAMwY/obqP9XaIz3oTOq6PEeRyfbwZZP3nvw6IazVEV+QaJ6wDRRdlj/Oqz/0VaHtiTdcR/U2KVsQcocsmS5BtSjb8aAV6S27Ao7Wm8cnsHMmDsCxBNHHW6x6SLVD/vD2GpZf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(55016002)(9686003)(316002)(186003)(2906002)(26005)(110136005)(53546011)(8676002)(786003)(64756008)(52536014)(4326008)(8936002)(33656002)(66946007)(76116006)(86362001)(66556008)(478600001)(66476007)(6506007)(83380400001)(5660300002)(71200400001)(7696005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a0JHYk93clFqYmFWTVAzRy9Vc3p6NUh2WVl6N2R2dUkvTjBjdS9FcHlYTUpK?=
 =?utf-8?B?OUt4SUVnUVJLT0RDODhsK054MDNodXNqZm5tNDI3UmNxWmNqZ0M2YjRWQnNl?=
 =?utf-8?B?L3B3OS9xOXRjRFhyRFBraFFxY1ZiVFNJT3dwVmVGWEYvZ1N0UzBsRDM0YnRK?=
 =?utf-8?B?bGx2QUtUd21mVUgxYXZjMEgrOG02Q3dJMkJpYnI3NFg3TXp6WVVuQ1I3TjFJ?=
 =?utf-8?B?czNaaHZ5L2t0NUlYUGZWMjc5VnE3ZHZ0NUkyWTBKcllVc01qalU4U3dZRWNv?=
 =?utf-8?B?Nm4yWXdJbWN1ek1OSTIvUk5pQ2lLK2kwRnlZL0lhY1FoaHloNmJtMzZkS3ZH?=
 =?utf-8?B?MVdKenc1Zi9sSWpNT2c5V1pWVENhL1hHbnNxZW11WUNSVStqV2Mva3oyc2g0?=
 =?utf-8?B?dldibFBJWGkxSFZhZU9zR1JCWWpVdHBBS3daTWJuN1JQTkMzMjFsbm04bjhq?=
 =?utf-8?B?RUhyRE8zVnppRUY3Si9mTFU1bjZGRWRPU3QremZjdDVCSkE3eXhCWml6MUxO?=
 =?utf-8?B?cG1xWGZrYzlkRkJrYnlqQlkyZXl2YlNoaE5POEpXcnlhSGVGTm9kZ04xcVBC?=
 =?utf-8?B?N0xwbXJqOGVzSXZmZUhxc1NHcW5ldmZpVmpnTk5Lcld2Y2RCYUlvQWx3dzJS?=
 =?utf-8?B?SkJTSjFHRE94bjRVT0FaVkFWcXA4YmZnejlzVUgvUmNVb29naWg2b09IS0Fp?=
 =?utf-8?B?YVg0cnZHRDBFVDVFMkxNZFpabXB5ZUR0SXNXdCtmWlZrTy8yeGoxeUNRNTl4?=
 =?utf-8?B?alJNRDNWNmVqMTIvMHI3S1RvZGRmMmxQTk1HenRZZjVDNlE3WHFmUFFmZFds?=
 =?utf-8?B?Z1B1NVcxd2xqZWhrVHR2N1lUT2dlcjRlOVF0TVN3MG82TEphK0NFaU1hRDVC?=
 =?utf-8?B?djlzTWRNcUtXV1VDMkpEbSt0RDdiUjlLNVdNb2lTTFc2SkJMekgvd3l6eFJs?=
 =?utf-8?B?SHByRU41RWVnTW1KSTA3TTVLcDRXRXpMU1hLTUhFQnlkZHF5VlZ0NmpQQzh4?=
 =?utf-8?B?Tkp6NjZVUnpnK3Y4bnRxWUx3L3lHM1lsZHkrU3RsSTdKclIxSTgwK1BzUXdR?=
 =?utf-8?B?d2w0S1ZDZ3Q1N3lrK204TmZvT0NEbDM5RzgrMndsa3YydHBnWEFuY29FYk14?=
 =?utf-8?B?Z1NPc3lhNENvenVvbkdlWW5HQmd1ZncvaU03SWUvTnZFS1JEdk54b2M5OEti?=
 =?utf-8?B?Qm1QTXd0c3FuNVl2TEZuMExBSm5hbExGcEtHaHVjVTlLWmVsY1kxdk9Hb2dG?=
 =?utf-8?B?ZERWVDdkZHZPRDk1ZkZ6czYwWjIvNjdwNXIwcDZIS25WWVIzdlZ4ZFFaS2pl?=
 =?utf-8?Q?E8fpy3aqkDSjs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefc2b70-fd7d-48f1-8c7b-08d89ad72669
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:40:12.5672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GnG4EErumIQONKQyFJwrwiEK96HjgM2LKUuAtBaWUhEndCUXm9faf/xkjz/Wwdb6T6jSq7nBGvkSmPaoC41NbC0C+YO9BRA2AMnDQJpQjX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3260
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-07_16:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070115
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070115
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnpl
bEBtb2xnZW4ubXBnLmRlPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDcsIDIwMjAgMTE6MzIN
Cj4gVG86IERtaXRyeSBUb3Jva2hvdg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3Jn
OyBMaW1vbmNpZWxsbywgTWFyaW8NCj4gU3ViamVjdDogRGVsbCBYUFMgMTMgOTMxMCAyLWluLTE6
IHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFVuYWJsZSB0byBxdWVyeQ0KPiBkZXZpY2U6IC01
DQo+IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gRGVhciBMaW51eCBmb2xrcywNCj4g
DQo+IA0KPiBPbiB0aGUgRGVsbCBYUFMgMTMgOTMxMCAyLWluLTEvMDJQNTVKLCBCSU9TIDEuMC4z
IDEwLzA1LzIwMjAgd2l0aCBEZWJpYW4NCj4gc2lkL3Vuc3RhYmxlIExpbnV4IDUuOS4xMSByZXBv
cnRzIHRoZSBlcnJvciBiZWxvdyAoZmlyc3QgbGluZSkuDQo+IA0KPiAgICAgIFsgICAgNS44MzUw
NzhdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFVuYWJsZSB0byBxdWVyeSBkZXZpY2U6IC01
DQo+ICAgICAgWyAgIDExLjMzMTE3Nl0gaW5wdXQ6IFBTLzIgU3luYXB0aWNzIFRvdWNoUGFkIGFz
DQo+IC9kZXZpY2VzL3BsYXRmb3JtL2k4MDQyL3NlcmlvMS9pbnB1dC9pbnB1dDINCj4gDQo+IFBs
ZWFzZSBmaW5kIHRoZSBmdWxsIGxvZyBhdHRhY2hlZC4NCj4gDQo+IEl0IGxvb2tzIGxpa2Ugc29t
ZSB0aW1lb3V0LiBNYXliZSByZWxhdGVkIHRvIHRoZSBlbWJlZGRlZCBjb250cm9sbGVyIChFQyk/
DQo+IA0KPiANCj4gS2luZCByZWdhcmRzLA0KPiANCj4gUGF1bCBNZW56ZWwNCg0KUGF1bCwNCg0K
VGhlIG1lc3NhZ2VzIHlvdSdyZSBzZWVpbmcgYXJlIGhhcm1sZXNzIGluIHRoaXMgbGFwdG9wLg0K
DQpUaGUgbGFwdG9wIGlucHV0IGlzIHN1cHBvcnRlZCB1c2luZyB0aGUgaGlkLW11bHRpdG91Y2gg
YW5kIGkyYy1oaWQgZHJpdmVycyBhcw0Kbm90ZWQgaW4geW91ciBtZXNzYWdlcy4NCg0KWyAgMzkz
LjI4MDExNV0gaW5wdXQ6IERMTDA5RkY6MDEgMDZDQjpDRTM5IFRvdWNocGFkIGFzIC9kZXZpY2Vz
L3BjaTAwMDA6MDAvMDAwMDowMDoxNS4xL2kyY19kZXNpZ253YXJlLjEvaTJjLTIvaTJjLURMTDA5
RkY6MDEvMDAxODowNkNCOkNFMzkuMDAwMi9pbnB1dC9pbnB1dDIxDQpbICAzOTMuMjgwMjIxXSBo
aWQtbXVsdGl0b3VjaCAwMDE4OjA2Q0I6Q0UzOS4wMDAyOiBpbnB1dCxoaWRyYXcxOiBJMkMgSElE
IHYxLjAwIE1vdXNlIFtETEwwOUZGOjAxIDA2Q0I6Q0UzOV0gb24gaTJjLURMTDA5RkY6MDENCg0K
