Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC34B29F257
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 17:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ2Q4p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 12:56:45 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:21580 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgJ2Q4o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 12:56:44 -0400
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TGqQsE018992;
        Thu, 29 Oct 2020 12:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=YpX9UNZg4X3rNvlAJ1CDX0Z0iyKnMN9FugZjW45F+Y4=;
 b=WiFvxpyzLk30+yWf3wJZYpMsXNNbS9Di/wVjK3pT3ThIjIBDBLGnlecTCdi6PGLS7NKO
 pfAE6H8w3Oj65/XSiXud+ViYeMuEVgic3QZh+3lN3FSmdZaEvSxC0w7r1P5maBC+iWwT
 RFIws9LOEOkdRzVnI6RPAtdI/7CqqTgN6QIPZ5TzaTSLf/Q08Rt74UdduLQ9zo2iLrqp
 QIW1b3lvorzXKY+XeG3561O0WeWpVWbKUFLDKgvllbIW0CYdr0R9r+1KpP1PNhsJsjJK
 EC8VZzbO/HxPDHmtutpS+DmksaDUBXOi/qTWZoa/v1KgNMZWei5sQgcPs6LEHtSJzw++ hA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 34cfkhucp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Oct 2020 12:56:37 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09TGlF2G020103;
        Thu, 29 Oct 2020 12:56:36 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by mx0b-00154901.pphosted.com with ESMTP id 34fyy5u2bg-5
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Oct 2020 12:56:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoJ4FRdlad0cpNlKRr9YmQTqD2M9JSN9VG0wKxYtixEMxPNlZYiz+0xMKFq1XroWB7/P5TKO9Bb0GI4xCDhJJwgFriXPqM9AsTNzvqxxpNp/ROcJJKie682hOYXRdoot93JQfWdFHEZHQIPypASKZ0Bmzzc0e8pzJkK1xsmVU1cyKo5FBf6DyaVivlBzOyH6cOocoJKzhKpegA5b5YyllCfHsVjLIlgaLfGyqsKb1szOC1E3HLOk85tQWkx4Sb/7MII8QNuhCwgorCjwe0OFNe26F3PVuAM3bxw4McqA7y6JnFltaSE1IZELRJY10ZGkY67ttCon0cupKlOc/zzckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpX9UNZg4X3rNvlAJ1CDX0Z0iyKnMN9FugZjW45F+Y4=;
 b=hoKIiE/jEmyn2Vt2KXhuRNe4uLtsMhgaGQ/wSKz1YQXnl14yWeId3qsgoGhq5dLTXUXCoGgzwqZDsfpWJV2gYdt+pSAWp+ihnKdZWX/RdyqN1oviHc7XZG6ka9XM1RG6S3Gmrur8Kfh0rt7lxPJItg/swws6m4kE6ibrIfEVm48U7mjq+ynQPmQYS/EXQjE5hZFW5xlRkkNp+wEsJUpeyxIK5+dWP9OpBcoywboo8G1g9DgPmYcE+RBZNs6JsG3Seb4+Zwka2SrBoIESrCJXDTUuEePJ10TmFBDCM3GNTbCAv5vnTHx7KFq2SVFbxFz7aLX1SSxOQfdf+9re2Bloxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpX9UNZg4X3rNvlAJ1CDX0Z0iyKnMN9FugZjW45F+Y4=;
 b=h/yv3q1JFeJpAyv7H6XUtmQU8GlKyLlsoRuONaoJbMAdj9GUQFEBy35g6Vy3ehsTPOxIW4fpMWoPXxJ6sdKXwBxQ66YuuKgpu4KnWNsnLLIFg33/4od05dZ0nWC+Ax5C6VvulLApJoasrXaCzI9cNlWtwlMT4Z4klJBc/WYh3xE=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3257.namprd19.prod.outlook.com (2603:10b6:5:19e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 16:56:32 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 16:56:32 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
CC:     "it+linux-input@molgen.mpg.de" <it+linux-input@molgen.mpg.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports different bus
Thread-Topic: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports different bus
Thread-Index: AQHWrhMlXGAje/NaDUeXfMgFv108NqmuzFQg
Date:   Thu, 29 Oct 2020 16:56:32 +0000
Message-ID: <DM6PR19MB263610B7F0F75E946F84422EFA140@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <22fc1c31-3fcc-c029-1fc5-26859a68da0d@molgen.mpg.de>
 <DM6PR19MB26367B8BBE1FE7912ABABC14FA140@DM6PR19MB2636.namprd19.prod.outlook.com>
 <d9c42be7-8678-d4e7-48f3-533aef54c829@molgen.mpg.de>
In-Reply-To: <d9c42be7-8678-d4e7-48f3-533aef54c829@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-29T16:56:29.7058733Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=caf49ab8-1829-4e5a-aa8d-70499c91bd87;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ad80bef-0b01-4db0-fa3a-08d87c2b96be
x-ms-traffictypediagnostic: DM6PR19MB3257:
x-microsoft-antispam-prvs: <DM6PR19MB325745D42E3730A5FEEB28B7FA140@DM6PR19MB3257.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5vdoiYICa2gxWWGiY43ZzHJKCu8s/8gRQwtRkPf1dZvqsP+eclSWH9uEyGpsmj1iQy9JXyfCSOdiRnAk4Z0NczyN6cjg1bQP+5esrm52NuiGvYalqIuOKyNsUbenc6H5CpBR5+vLcdbTLpVXa4z5+ifUWHolkOuZq45tqBUIExi1YKXTAT36HsEjbBCE8HqMk9Y3vF3n+FR9RQPt8nF7jRk9P8Q2bS3w1ylgZCXx27TP+94buV3XhK3b5tpUeZXLZb2c7EWolup5LYZXiGhiBHBqQXnaGS/4KZ6dgKzvGTgvi9ylqdusFBZWmocr48cH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6916009)(8936002)(83380400001)(2906002)(71200400001)(9686003)(4326008)(26005)(55016002)(186003)(33656002)(498600001)(52536014)(54906003)(66946007)(66446008)(64756008)(76116006)(66476007)(66556008)(5660300002)(7696005)(6506007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: e2619c8nwd9XrNBrnn5zUGydkpcM38ATjl8BMnrNoF4x/o6wowacqzRFI044rmNOyc3GbEqMWoiSsqcZYT5npUkIg9DmVdVZpbvxN1of5DCaHX4dbomzepzxtSEyZbx2C4uSliHZaVnQYn3YOwfWP3qjXIMd7jbSVUD5uUhGsL54FJZhJik0NhrwmCMWAMHuO56wjh0vVm3raa/GYsB3andkVRNCsVrMk/+2x6FXr7ACNyYXjy4ch9hWYKtaVJLwcrCHqgS5cnoCEnmTRUhMjhfX/4R9ZvzQ0z8M+Omv7h1IFCz+IyXPWRO5eMqCvBxa5eXEdWCp4ccHjmk1LTMnO60sZ8y4xkylhWRkwrIw3ZFjeKhcpPPdhW0JNIYiPXToLwROHUgKKNP5Ror30213qznq9NKYP7NK/v8Z/4IKsaAtoAOT/gfqibnXIezkAe6dY2GT22ZGzK3PA3+9Sl06fFGt0ePCOHdp1vocucaJ3ggFf9916g6rbiosBw21cShSU4jBSDblYNPeg/wWe4kbHVarYmsGS5QtuEKVJ7/59U4w+k849OkJzybsPKoCSeJbcYJ8whoHkoHGStzRmiQkxnye6K3sOJbQXRiDZu1jj8rdd48TjDRbSR2KTqDY3tgPA2GvB7cvhTqTzy8cruYAYg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad80bef-0b01-4db0-fa3a-08d87c2b96be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 16:56:32.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ODe0iSxKVZQ568DrRR6ag+1x1uLjAdF4uiJDzq7b2tMQ9C7vuVZUh0A+i4hB/JHHizzw/KfC71Tax0sQaz5uVSaNZq1gZ0Oc7jKiVhXccZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3257
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-10-29_10:2020-10-29,2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290116
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290117
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiA+PiBPbiBhIERlbGwgWFBTIDEzIDkzMTAsIExpbnV4IDUuOS4xIGZyb20gRGViaWFuIFNpZC91
bnN0YWJsZSBkaXNwbGF5cyB0aGUNCj4gPj4gbWVzc2FnZSBiZWxvdy4NCj4gPj4NCj4gPj4gICAg
ICAgWyAgICAyLjIxODYxNF0gcHNtb3VzZSBzZXJpbzE6IHN5bmFwdGljczogWW91ciB0b3VjaHBh
ZCAoUE5QOiBETEwwOTkxDQo+IFBOUDBmMTMpIHNheXMgaXQgY2FuIHN1cHBvcnQgYSBkaWZmZXJl
bnQgYnVzLiBJZiBpMmMtaGlkIGFuZCBoaWQtcm1pIGFyZSBub3QNCj4gdXNlZCwgeW91IG1pZ2h0
IHdhbnQgdG8gdHJ5IHNldHRpbmcgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaCB0byAxIGFu
ZA0KPiByZXBvcnQgdGhpcyB0byBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmcuDQo+ID4+DQo+
ID4+IEkgYW0gZ29pbmcgdG8gYXNrIHRoZSB1c2VyIGZvciBhIHRlc3Qgb2YNCj4gPj4gYHBzbW91
c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MWAsIHNvIHRoZSBJRCBjYW4gYmUgYWRkZWQgdG8gdGhl
IGZvcmNlDQo+ID4+IGxpc3QsIGJ1dCB1bnRpbCBrbm93IG5vIERlbGwgRExMWFhYWCBpZHMgc2hv
dyB1cCB0aGVyZS4NCj4gPg0KPiA+IEkgaGFwcGVuIHRvIGhhdmUgb25lIG9mIHRoZXNlIG9uIG15
IGRlc2sgYW5kIG9uIDUuMTAtcmMxIEkgZG9uJ3Qgc2VlIHRoaXMNCj4gYmVoYXZpb3I6DQo+ID4N
Cj4gPiAkIHN1ZG8gZG1lc2cgfCBncmVwIERMTDA5NDUNCj4gPiBbICAgIDEuMjQ0MTY1XSBpMmNf
aGlkIGkyYy1ETEwwOTQ1OjAwOiBzdXBwbHkgdmRkIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkNCj4g
cmVndWxhdG9yDQo+ID4gWyAgICAxLjI0NDIwMV0gaTJjX2hpZCBpMmMtRExMMDk0NTowMDogc3Vw
cGx5IHZkZGwgbm90IGZvdW5kLCB1c2luZyBkdW1teQ0KPiByZWd1bGF0b3INCj4gPiBbICAgIDEu
NDA0MDUzXSBpbnB1dDogRExMMDk0NTowMCAwNkNCOkNERTYgTW91c2UgYXMNCj4gL2RldmljZXMv
cGNpMDAwMDowMC8wMDAwOjAwOjE1LjEvaTJjX2Rlc2lnbndhcmUuMS9pMmMtMi9pMmMtDQo+IERM
TDA5NDU6MDAvMDAxODowNkNCOkNERTYuMDAwMS9pbnB1dC9pbnB1dDYNCj4gPiBbICAgIDEuNDA0
MTM0XSBpbnB1dDogRExMMDk0NTowMCAwNkNCOkNERTYgVG91Y2hwYWQgYXMNCj4gL2RldmljZXMv
cGNpMDAwMDowMC8wMDAwOjAwOjE1LjEvaTJjX2Rlc2lnbndhcmUuMS9pMmMtMi9pMmMtDQo+IERM
TDA5NDU6MDAvMDAxODowNkNCOkNERTYuMDAwMS9pbnB1dC9pbnB1dDcNCj4gPiBbICAgIDEuNDA0
MTk2XSBoaWQtZ2VuZXJpYyAwMDE4OjA2Q0I6Q0RFNi4wMDAxOiBpbnB1dCxoaWRyYXcwOiBJMkMg
SElEIHYxLjAwDQo+IE1vdXNlIFtETEwwOTQ1OjAwIDA2Q0I6Q0RFNl0gb24gaTJjLURMTDA5NA0K
PiA+IDowMA0KPiA+IFsgICA0Mi45NzExNDhdIGlucHV0OiBETEwwOTQ1OjAwIDA2Q0I6Q0RFNiBN
b3VzZSBhcw0KPiAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMS9pMmNfZGVzaWdud2Fy
ZS4xL2kyYy0yL2kyYy0NCj4gRExMMDk0NTowMC8wMDE4OjA2Q0I6Q0RFNi4wMDAxL2lucHV0L2lu
cHV0MTINCj4gPiBbICAgNDIuOTcyMDczXSBpbnB1dDogRExMMDk0NTowMCAwNkNCOkNERTYgVG91
Y2hwYWQgYXMNCj4gL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjEvaTJjX2Rlc2lnbndh
cmUuMS9pMmMtMi9pMmMtDQo+IERMTDA5NDU6MDAvMDAxODowNkNCOkNERTYuMDAwMS9pbnB1dC9p
bnB1dDEzDQo+ID4gWyAgIDQyLjk3MjE4Ml0gaGlkLW11bHRpdG91Y2ggMDAxODowNkNCOkNERTYu
MDAwMTogaW5wdXQsaGlkcmF3MDogSTJDIEhJRA0KPiB2MS4wMCBNb3VzZSBbRExMMDk0NTowMCAw
NkNCOkNERTZdIG9uIGkyYy1ETEwwOTQ1OjAwDQo+ID4NCj4gPiBDYW4geW91IHBsZWFzZSBtYWtl
IHN1cmUgdGhhdCBwaW5jdHJsX3RpZ2VybGFrZSBpcyBsb2FkZWQ/DQo+IA0KPiBEZWJpYW7igJlz
IExpbnV4IGNvbmZpZ3VyYXRpb24gZG9lcyBub3QgYnVpbGQgdGhlIGRyaXZlci4NCj4gDQo+ICAg
ICAgIyBDT05GSUdfUElOQ1RSTF9USUdFUkxBS0UgaXMgbm90IHNldA0KPiANCj4gSSByZXBvcnRl
ZCBidWcgKmxpbnV4OiBTZWxlY3QgUElOQ1RSTF9USUdFUkxBS0UgdG8gc3VwcG9ydCBjdXJyZW50
DQo+IGhhcmR3YXJlKiB0byBEZWJpYW4gYnVnIHRyYWNraW5nIHN5c3RlbSBbMV0uDQo+IA0KDQpH
bGFkIHlvdSBnb3QgdG8gdGhlIGJvdHRvbSBvZiB0aGF0LiAgQXMgYSB0aG91Z2h0IHRvIGdlbmVy
YWxseSBpbXByb3ZlIHRoaW5ncw0KZm9yIHN1Y2ggbmV3IGhhcmR3YXJlLCB3b3VsZCB5b3UgY29u
c2lkZXIgZGlmZmluZyB0aGUgY29uZmlncyBiZXR3ZWVuIFVidW50dQ0KYW5kIERlYmlhbj8gIEkg
d29uZGVyIGlmIHRoZXJlIGlzIGFueXRoaW5nIGVsc2UgbWlzc2luZy4NCg==
