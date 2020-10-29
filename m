Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7C729F13F
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 17:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgJ2QWh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 12:22:37 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:10124 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726105AbgJ2QWg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 12:22:36 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TGCV57004777;
        Thu, 29 Oct 2020 12:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=WwAiTtBsDOcWIJaIKJmn4swcqeKwB40kjKix+zxabSI=;
 b=jjBqBYf9RWhUF6awmrr9vcX+7rjVyIwpGeFtB34gl9OU2H2p/7KN8Vg1BR4zb9n0b+2r
 wF1xv0ZN56Kb68rgl5ArqoN049Jmr2m7p01xsI4b/08rY2TYgs6CiXUXuN3/1Go0Axfk
 zDXOAjx2hbsWhATQn0Cot2Jz78d6u5DYATUuvVnEEI7ttcTKS3XFvCb5GcSQhxTYKY6Q
 yiKSo6mVoh9fDpj8up76JXXGFTp5DdQNbnuSGfWeYUdJDAW5rCvh6WCzA8lkuz63wnkP
 UxUjgGpDk9e4aZeG4XcpW/61AUOH5oQCMbVqHVU6SiNwrvD80gbDEl0JQXBSOsUqlj6e bw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 34cfkhu7d1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 12:21:58 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TGFAmO098140;
        Thu, 29 Oct 2020 12:21:57 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by mx0b-00154901.pphosted.com with ESMTP id 34fvdqxmcm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Oct 2020 12:21:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpcBoamDlNBYW/JTriX9x/OomSG37YKRid7rKdqSvpsHC4VpXF8Qs/Ov+HCWkkDTxZ9sNe/9SSZzoNvOZyBhNqHfA+tZPcw2lIesBZ3sjhYXPRwnRkKnXmm8Hzvi4jdx7zcNQ9FQCqjaZmtpt6KGH2zEu28B8D1w3E3ccVjxRe0UeH1yjcvW7d+fYfq8cAzCK1aCh4YA/ORukTPFDPntc1mADjqZKmZ8r3dRJ3hnqXrv3lpOJ2RhmFYPBlo6bGPfO2uPc4JzJmWwzp2q6o8tq1bRZqcIHEPxNk/Rq+vwEEBUBiEJ2kHxmRBR/lFGi4arCq2gmHMItoZBXKgQlVCZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwAiTtBsDOcWIJaIKJmn4swcqeKwB40kjKix+zxabSI=;
 b=AlXPDq0b100rbemGm/ChCyEMjBG6Khgc+5FJ2SOHeoW6iS6WZtjZ2VXNQcdamKyRMRFHfMFNyDNd/7DQK7vkUgiyFRTXX4vK/K0k9wdQv3qWCrj/dbpWf2cOnBHj8WQdgcmOtYpuUZ9aPrVKN3yRUK+U2o+TOI1Fbaj8ZYKqSgImljj0rQUNDraE2j4G2GOc1Vb/40/MwhJzkGshp4chMLUDAoRiMjXMD3qiSdlXbRhD7L6ytbwDOXZ7hxozjN8d6mIADiIaqbWg4S9n0AHATdepebqjMplxhfJAhTn2XnWir5wutaB/E0Vx7j/HBhWWmNspDcxN1gm8LpRLzByUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwAiTtBsDOcWIJaIKJmn4swcqeKwB40kjKix+zxabSI=;
 b=Q1wmHlDhewA9WnYGT77aYTKJfNcYG+8X3ff3YKRHnO3mZU4480amSwRey1+Zoda47n5L7pAQBDJFfHD36WgJlgux087kxkMnWbEgdyExdES/3vCKiuXNJPZLdMMBtszW6MvHfm8dvSvCcXUgwKJlgcVzMfQlSNoAcwPUiMUb8Eg=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB4168.namprd19.prod.outlook.com (2603:10b6:5:2b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 16:21:56 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 16:21:56 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
CC:     "it+linux-input@molgen.mpg.de" <it+linux-input@molgen.mpg.de>
Subject: RE: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports
Thread-Topic: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports
Thread-Index: AQHWrg7go0C7LJ5CVkiTU+LTP5XOnqmuwm9A
Date:   Thu, 29 Oct 2020 16:21:55 +0000
Message-ID: <DM6PR19MB26367B8BBE1FE7912ABABC14FA140@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <22fc1c31-3fcc-c029-1fc5-26859a68da0d@molgen.mpg.de>
In-Reply-To: <22fc1c31-3fcc-c029-1fc5-26859a68da0d@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-29T16:21:53.2136075Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=2ea7ce67-f4d0-44ef-bb63-09ccb84ab68b;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d5cef9f-39bc-4468-64dc-08d87c26c0f4
x-ms-traffictypediagnostic: DM6PR19MB4168:
x-microsoft-antispam-prvs: <DM6PR19MB41684C8F0DAF7B321E0CA737FA140@DM6PR19MB4168.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BdvN2Z/hsSexHtVagqwJipPdzPPmRmwa0ke6tgASxNa4kXUnPURV/2uZIJoZZGoVa4vGMXpks1OSVBcsHqay/vX216EqqxMVkb9NW7AHe8DA0yR9e+liFGNxj+4vH5cdtDUU9JJHToAg/jpI8xaRac9XHqlhFSzJLpVHrZNTDhotpRS7/Zpkl07IZdgt7PsD324cCQFbioL203Qk96KvSrJZsqbwuJ4dXaOOD4AqUlr8/ml4/Mj2KNXv3EF5Ec9XQ2gq2h8luuH/uqG4CGObc+an3X8cESKfp4NiyRJwyVZQmstJelbWcPe8yvh0SSf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(4326008)(64756008)(83380400001)(478600001)(55016002)(9686003)(71200400001)(33656002)(6506007)(5660300002)(53546011)(66946007)(8936002)(8676002)(66476007)(76116006)(52536014)(7696005)(66446008)(316002)(26005)(86362001)(110136005)(2906002)(186003)(66556008)(786003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: KdImOSdH5XIQZoOgLIr6aqHi6p/RmEkK8mRM6qmXaaa+PXIKLdkoOobyA2fYc8qu3RIb5bBYsKk1D18JsZficWZ7HeP9vzca3aj0HqTEec/GmRatcD5bgIjJ5CIL/j8XSvEGD1d6/pqRzMVFVy6yD1i6P1Y4TSDdJoxk6TDaGVgs0EVYgz2W1aFqj+DK6D1Q9ntBRWJAeOSiPBLT7jlhfQPMwKUe0dC5RI4RWKTIxaY3pzMnXfvaJBDBLzNvyL25J2WFJK6dOrNsYRUe9/REuwbYWEdyyEDbYmurGEnK/nJpZVchfESA8BKq16wcbGWy7bZL/U2sCq473y8Ttg8oiuJ0viCUYGU22fsONH+o4PqiazxviWCbhLHPM2jn5covGDFL3MYn93Ud/o9q9GY5dhSm1ns2z7IzrpbUvWonW7Tevghurt4moZCcY+mqbt3aotvgBOATHWl3I1WPjmO/m0XYpf3eASEM8iMmw5kR3C9AqtTLYWqXMT0NrGRy92Fw1Srncbz5iyWPwGr3BLAA3DLP/fs2UwuyLEfuoYd3HWDIw73udBCp/6FOpJNCkqegy//aOqkLMKDAHzz5OLalrAv6WsF5ETyvr6pHGgNHSiAlIBVXAOs2EGyG9+8MJnBapr/xrf4aVMDXo2v5fCKJzQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5cef9f-39bc-4468-64dc-08d87c26c0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 16:21:56.0209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cj5h39albpztbpo94+NSzfD0ARmNa5qnRpgl4rFnR6ODCdEfAieIkXGL5kg8aK9mePCCH+i6CJbfVIuLTDSf3wJKR8lfo+qMUd2mKHyE50M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4168
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_08:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=970
 lowpriorityscore=0 bulkscore=0 clxscore=1011 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290113
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnpl
bEBtb2xnZW4ubXBnLmRlPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyOSwgMjAyMCAxMTox
Ng0KPiBUbzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnDQo+IENjOiBpdCtsaW51eC1pbnB1
dEBtb2xnZW4ubXBnLmRlOyBMaW1vbmNpZWxsbywgTWFyaW8NCj4gU3ViamVjdDogRGVsbCBYUFMg
MTMgOTMxMDogUE5QOiBETEwwOTkxIFBOUDBmMTMgc3VwcG9ydHMNCj4gDQo+IA0KPiBbRVhURVJO
QUwgRU1BSUxdDQo+IA0KPiBEZWFyIExpbnV4IGZvbGtzLA0KPiANCj4gDQo+IE9uIGEgRGVsbCBY
UFMgMTMgOTMxMCwgTGludXggNS45LjEgZnJvbSBEZWJpYW4gU2lkL3Vuc3RhYmxlIGRpc3BsYXlz
IHRoZQ0KPiBtZXNzYWdlIGJlbG93Lg0KPiANCj4gICAgICBbICAgIDIuMjE4NjE0XSBwc21vdXNl
IHNlcmlvMTogc3luYXB0aWNzOiBZb3VyIHRvdWNocGFkIChQTlA6DQo+IERMTDA5OTEgUE5QMGYx
Mykgc2F5cyBpdCBjYW4gc3VwcG9ydCBhIGRpZmZlcmVudCBidXMuIElmIGkyYy1oaWQgYW5kDQo+
IGhpZC1ybWkgYXJlIG5vdCB1c2VkLCB5b3UgbWlnaHQgd2FudCB0byB0cnkgc2V0dGluZw0KPiBw
c21vdXNlLnN5bmFwdGljc19pbnRlcnRvdWNoIHRvIDEgYW5kIHJlcG9ydCB0aGlzIHRvDQo+IGxp
bnV4LWlucHV0QHZnZXIua2VybmVsLm9yZy4NCj4gDQo+IEkgYW0gZ29pbmcgdG8gYXNrIHRoZSB1
c2VyIGZvciBhIHRlc3Qgb2YNCj4gYHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MWAsIHNv
IHRoZSBJRCBjYW4gYmUgYWRkZWQgdG8gdGhlIGZvcmNlDQo+IGxpc3QsIGJ1dCB1bnRpbCBrbm93
IG5vIERlbGwgRExMWFhYWCBpZHMgc2hvdyB1cCB0aGVyZS4NCj4gDQo+IA0KDQpJIGhhcHBlbiB0
byBoYXZlIG9uZSBvZiB0aGVzZSBvbiBteSBkZXNrIGFuZCBvbiA1LjEwLXJjMSBJIGRvbid0IHNl
ZSB0aGlzIGJlaGF2aW9yOg0KDQokIHN1ZG8gZG1lc2cgfCBncmVwIERMTDA5NDUNClsgICAgMS4y
NDQxNjVdIGkyY19oaWQgaTJjLURMTDA5NDU6MDA6IHN1cHBseSB2ZGQgbm90IGZvdW5kLCB1c2lu
ZyBkdW1teSByZWd1bGF0b3INClsgICAgMS4yNDQyMDFdIGkyY19oaWQgaTJjLURMTDA5NDU6MDA6
IHN1cHBseSB2ZGRsIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yDQpbICAgIDEuNDA0
MDUzXSBpbnB1dDogRExMMDk0NTowMCAwNkNCOkNERTYgTW91c2UgYXMgL2RldmljZXMvcGNpMDAw
MDowMC8wMDAwOjAwOjE1LjEvaTJjX2Rlc2lnbndhcmUuMS9pMmMtMi9pMmMtRExMMDk0NTowMC8w
MDE4OjA2Q0I6Q0RFNi4wMDAxL2lucHV0L2lucHV0Ng0KWyAgICAxLjQwNDEzNF0gaW5wdXQ6IERM
TDA5NDU6MDAgMDZDQjpDREU2IFRvdWNocGFkIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDow
MDoxNS4xL2kyY19kZXNpZ253YXJlLjEvaTJjLTIvaTJjLURMTDA5NDU6MDAvMDAxODowNkNCOkNE
RTYuMDAwMS9pbnB1dC9pbnB1dDcNClsgICAgMS40MDQxOTZdIGhpZC1nZW5lcmljIDAwMTg6MDZD
QjpDREU2LjAwMDE6IGlucHV0LGhpZHJhdzA6IEkyQyBISUQgdjEuMDAgTW91c2UgW0RMTDA5NDU6
MDAgMDZDQjpDREU2XSBvbiBpMmMtRExMMDk0DQo6MDANClsgICA0Mi45NzExNDhdIGlucHV0OiBE
TEwwOTQ1OjAwIDA2Q0I6Q0RFNiBNb3VzZSBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6
MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy0yL2kyYy1ETEwwOTQ1OjAwLzAwMTg6MDZDQjpDREU2
LjAwMDEvaW5wdXQvaW5wdXQxMg0KWyAgIDQyLjk3MjA3M10gaW5wdXQ6IERMTDA5NDU6MDAgMDZD
QjpDREU2IFRvdWNocGFkIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxNS4xL2kyY19k
ZXNpZ253YXJlLjEvaTJjLTIvaTJjLURMTDA5NDU6MDAvMDAxODowNkNCOkNERTYuMDAwMS9pbnB1
dC9pbnB1dDEzDQpbICAgNDIuOTcyMTgyXSBoaWQtbXVsdGl0b3VjaCAwMDE4OjA2Q0I6Q0RFNi4w
MDAxOiBpbnB1dCxoaWRyYXcwOiBJMkMgSElEIHYxLjAwIE1vdXNlIFtETEwwOTQ1OjAwIDA2Q0I6
Q0RFNl0gb24gaTJjLURMTDA5NDU6MDANCg0KQ2FuIHlvdSBwbGVhc2UgbWFrZSBzdXJlIHRoYXQg
cGluY3RybF90aWdlcmxha2UgaXMgbG9hZGVkPw0KDQpUaGFua3MsDQo=
