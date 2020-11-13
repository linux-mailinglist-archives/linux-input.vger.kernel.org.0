Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B7A2B1EBF
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 16:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgKMPcN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 10:32:13 -0500
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:44510 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgKMPcM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 10:32:12 -0500
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADFRMdq001103;
        Fri, 13 Nov 2020 10:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=LE9QGZZU3Sq4ijdh9KIWrBADKDv3IMRYx+Iryf08acs=;
 b=wxsaqvuEes1R6+/M07jMPfggo/HnCndf1YXPhN6sNkHbszpHTESfGtBmJHbr1ij9v0F9
 Ont2cfyoNZ68OhQCpaxbez2z+VlFPhqsFZVqpeAH6ya/KbRno6rZzrhUsqGs0wLxHRbn
 VtSCTsw9cZUiTTa05kpVQao4AnMOuAi7dWzmQgIwYhQpcLWy4QPh6l/G+1PFrXg61uaT
 vl0/Dz/Gqmg0c++QOK3b9uakjFEIN5w11KHMZckenrx47zcHqBdbNXhjS5MQkGm0fGo5
 4Zusf4xMyd5ux6F0lwGx++eFyar/kYN6vOr6l5x5A6pzZMKg3t8dEDA6GnhRhzJbo3kq fA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 34s74s5147-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Nov 2020 10:31:55 -0500
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ADFPxRo188351;
        Fri, 13 Nov 2020 10:31:55 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
        by mx0a-00154901.pphosted.com with ESMTP id 34ss3yukjy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Nov 2020 10:31:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeSwJNRQC1n5pbEu4I5sI63x5+83IjkC94vAWfCDpoQSZGRIHfedoudz0TmRe84hE6VFTw+/58qr5ek3dVEn4zHQ0F5hS+YKHelHBUojgTjK6JVcWIhL24V2oTNWMH0dMfdj2Y8W8UU9PU8zSnxefTfXunuw3yVFH1CJuzfb2WYdielILP1RNqIksjDlTL81ntOieBA4jQDnQU9rBG7+zube0c7aB/gzpWMJI2MmlNsZdtupxjKA5S/Px/2kuJShZJSWOcAzKtFT3uCg/63Q2L3zlCklI46lDAqW6t0wDH7jHp0x+a3sGJeKCjs4saD0f8+IWWh6B90khuVhS+3Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE9QGZZU3Sq4ijdh9KIWrBADKDv3IMRYx+Iryf08acs=;
 b=ZWWcAPUBY+H7mQHb0JYpwYx757Zzr/z2yAy7FlzEfspqBgOIbyOfFBapOHqOHEUgYR4HdsXifuQUeC7xmvAXcVzh21/m7LLTLsv3DrunsnUqCEQw036iFMmnrVspoHvu5get3W1oubszZZ05vCodnvqrondI4uAFkcWaL+YHTr4hCOB2rnGlfmxpcvI71h/2aG4SLgEyno6ITwCZGLIVdhGg3WXeWaEkCmoKu0VsVfiB8yIIRK1+pmqdMdjeLAyO0ITvmDRtfFMdZvqaGSygjobQFAPnFLHRMY+AQ2grY6RCT7NCIAiJjIJqXIFdM/HiEmKFoZ2UgtHwBjI8I7ZyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE9QGZZU3Sq4ijdh9KIWrBADKDv3IMRYx+Iryf08acs=;
 b=jdjYQb4PvkMB/uIneNdKFLMHNyw1jzs3ALFdt2rUQb2dJRCnpz2u8wnEKERDpe4LeoTkrmk3M+fs8FTnt+X7/9s1G5UXuQPAeb5gtyTuns39rZEPs0f3pOS19VYihz0a6RzMZak9kL5otv+sAVLv5xxffmzEtcHiNOX3iEGtIYw=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB1228.namprd19.prod.outlook.com (2603:10b6:3:b1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 15:31:52 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::a8ff:e803:ee80:e59a%3]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 15:31:51 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
CC:     "it+linux-input@molgen.mpg.de" <it+linux-input@molgen.mpg.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports different bus
Thread-Topic: Dell XPS 13 9310: PNP: DLL0991 PNP0f13 supports different bus
Thread-Index: AQHWrhMlXGAje/NaDUeXfMgFv108NqmuzFQggBcK/ACAAHAfsA==
Date:   Fri, 13 Nov 2020 15:31:51 +0000
Message-ID: <DM6PR19MB26367D3C8878C27ACDFFB051FAE60@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <22fc1c31-3fcc-c029-1fc5-26859a68da0d@molgen.mpg.de>
 <DM6PR19MB26367B8BBE1FE7912ABABC14FA140@DM6PR19MB2636.namprd19.prod.outlook.com>
 <d9c42be7-8678-d4e7-48f3-533aef54c829@molgen.mpg.de>
 <DM6PR19MB263610B7F0F75E946F84422EFA140@DM6PR19MB2636.namprd19.prod.outlook.com>
 <deedd856-a594-87ac-7a18-4d7dcde38b97@molgen.mpg.de>
In-Reply-To: <deedd856-a594-87ac-7a18-4d7dcde38b97@molgen.mpg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-11-13T15:31:49.8450272Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=e76abfb7-040a-461e-a2ca-0cad5329c38d;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 534221f0-593d-4443-cdc0-08d887e93e93
x-ms-traffictypediagnostic: DM5PR19MB1228:
x-microsoft-antispam-prvs: <DM5PR19MB1228A07F1D182D6766B1EED0FAE60@DM5PR19MB1228.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iqmt8D+fQ4FcY4jzuNa9F/032ucxVkplJbo7/xKdp0S68zxOsq+jrrBhCAvlPMolBdfGR4Z0nxMPKQUcogFGqqUcD4dICvpobDk69S39zVMFOCrNOTbRWPXmtILOlhyk0WvVhh0wFLjgQckqT+uO8WlQ1XgR4BdmI4K7zNNxtAEvAfCCyYBy8ypuFTRx7J6nuUz3x4vcmG0HcA5lV70/5F4zJmxdsdco4FU6Jgja7BSWCYrPV2P663B8ybIpZZFrfmSCB7lAShGHFJg44MSyP14rz3WsSNw2vkCGF/8VfESLb7bGVqu+iwP7JvXugrOQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(316002)(64756008)(66476007)(66556008)(54906003)(786003)(86362001)(6916009)(52536014)(9686003)(5660300002)(55016002)(66946007)(186003)(76116006)(66446008)(7696005)(478600001)(33656002)(8936002)(83380400001)(6506007)(71200400001)(8676002)(26005)(2906002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: HpyQXBOuW5pJkkrMzSakq4R2zzuuDEtcQi51aVOK8lOi6/knJjyfNMrzfqmQxQ/rGiwguTMSLLjnXhPtwiImTGgGfu1iDfDKNgLSoReEIKY5SALqClv9LCdc3xziVHBv3vb63+oZxVBkPLMrPe2hxTcLddmH3io7HnNqEnnj4VWY6+sBTftbzSRUZAjJq8ZHgnApe7c5XpzScVjvUxIn5nlXBIzIIDA4r4P5JoFWgUM21xPc5gw1xinb/yDUDfyp5IftZ2z1I432RcZOC/a/Wiwrxy72q35KZo6oo8eLjVaBIScmsAJhYNsHuCzylkHB1K1tnmJu/2GqObAOhYrcYdV2d9wvfcR9Usb2/7SoE4GoWUtNpcRHJrRSdJfPAMFrRtM4RBZ8n0GAv/8ONigAl2/UcyeQ1AtmiJBJxsW5c9RzTW0axV3cCIxKn5XGVWFNEhzZVCbHM8GzWowv93xPLJGQ2UFcil9ttRpHs4Ke+9qciXt5Zo735zOQIufA+SoSa8E4nV4iclzIHkylfLMACIgSldYOOUJYBd4UmRagSbIq6zP8M1SVax25EELxaHHuAMHs/uhmeaN2YDybFqQq5UvJT7MIjgHvtr8SDnfh5C1tmUm5IiPgOdQ3qqiuqoRFQ5gY+VPp9rE1m7h4xtWwKA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534221f0-593d-4443-cdc0-08d887e93e93
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 15:31:51.9159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qk91h/e6tQ9lXc5shdL9EjGCBmuGHPdVUl0hDcRzNqV38eD7Y1nlM7tSAsrYMIZ83hPWkgW2L/9wl1igzZrQzhlSGG/bj6EFwi/tD1OuZr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1228
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-13_10:2020-11-13,2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011130098
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130098
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PiANCj4gU28sIERlYmlhbuKAmXMgbGludXgtaW1hZ2UtNS45LjAtMi1hbWQ2NCBzZWxlY3RzIHRo
YXQgb3B0aW9uIG5vdy4NCj4gDQo+ICAgICAgJCBncmVwIFRJR0VSTEFLRSAvYm9vdC9jb25maWct
NS45LjAtMi1hbWQ2NA0KPiAgICAgIENPTkZJR19QSU5DVFJMX1RJR0VSTEFLRT15DQo+ICAgICAg
Q09ORklHX1NORF9TT0NfU09GX1RJR0VSTEFLRV9TVVBQT1JUPXkNCj4gICAgICBDT05GSUdfU05E
X1NPQ19TT0ZfVElHRVJMQUtFPW0NCj4gDQo+IFRoZXJlIGlzIG5vdGhpbmcgaW4gYGRtZXNnYCwg
YW5kIGFzIGl04oCZcyBidWlsdGluDQo+IA0KPiAgICAgICQgL3NiaW4vbW9kaW5mbyBwaW5jdHJs
X3RpZ2VybGFrZQ0KPiAgICAgIG5hbWU6ICAgICAgICAgICBwaW5jdHJsX3RpZ2VybGFrZQ0KPiAg
ICAgIGZpbGVuYW1lOiAgICAgICAoYnVpbHRpbikNCj4gICAgICBsaWNlbnNlOiAgICAgICAgR1BM
IHYyDQo+ICAgICAgZmlsZTogICAgICAgICAgIGRyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJs
LXRpZ2VybGFrZQ0KPiAgICAgIGRlc2NyaXB0aW9uOiAgICBJbnRlbCBUaWdlciBMYWtlIFBDSCBw
aW5jdHJsL0dQSU8gZHJpdmVyDQo+ICAgICAgW+KApl0NCj4gDQo+IHRoZXJlIGFyZSB0aGUgZmls
ZXMgYmVsb3cgaW4gL3N5c2ZzOg0KPiANCj4gICAgICAkIGxzIC9zeXMvYnVzL3BsYXRmb3JtL2Ry
aXZlcnMvdGlnZXJsYWtlLXBpbmN0cmwNCj4gICAgICBiaW5kICBJTlQzNEM1OjAwICB1ZXZlbnQg
IHVuYmluZA0KDQpMb29rcyBsaWtlIGl0J3Mgd29ya2luZyB0byBtZSBpbiB5b3VyIGxvZ3MuDQoN
ClsgICAxMC43MTcxMDZdIGlucHV0OiBETEwwOTQ1OjAwIDA2Q0I6Q0RFNiBNb3VzZSBhcyAvZGV2
aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy0xMC9pMmMt
RExMMDk0NTowMC8wMDE4OjA2Q0I6Q0RFNi4wMDAxL2lucHV0L2lucHV0MTENClsgICAxMC43MTcx
NTZdIGlucHV0OiBETEwwOTQ1OjAwIDA2Q0I6Q0RFNiBUb3VjaHBhZCBhcyAvZGV2aWNlcy9wY2kw
MDAwOjAwLzAwMDA6MDA6MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy0xMC9pMmMtRExMMDk0NTow
MC8wMDE4OjA2Q0I6Q0RFNi4wMDAxL2lucHV0L2lucHV0MTINClsgICAxMC43MTcxOTVdIGhpZC1n
ZW5lcmljIDAwMTg6MDZDQjpDREU2LjAwMDE6IGlucHV0LGhpZHJhdzA6IEkyQyBISUQgdjEuMDAg
TW91c2UgW0RMTDA5NDU6MDAgMDZDQjpDREU2XSBvbiBpMmMtRExMMDk0NTowMA0KWyAgIDEwLjc5
NTIwOF0gaXNoLWhpZCB7MzNBRUNENTgtQjY3OS00RTU0LTlCRDktQTA0RDM0RjBDMjI2fTogW2hp
ZC1pc2hdOiBlbnVtX2RldmljZXNfZG9uZSBPSywgbnVtX2hpZF9kZXZpY2VzPTENClsgICAxMC43
OTcwNzVdIGhpZC1nZW5lcmljIDAwMUY6ODA4NzowQUMyLjAwMDI6IGhpZHJhdzE6IDxVTktOT1dO
PiBISUQgdjIuMDAgRGV2aWNlIFtoaWQtaXNodHAgODA4NzowQUMyXSBvbiANClsgICAxMC44NDE4
MzRdIGlucHV0OiBETEwwOTQ1OjAwIDA2Q0I6Q0RFNiBNb3VzZSBhcyAvZGV2aWNlcy9wY2kwMDAw
OjAwLzAwMDA6MDA6MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy0xMC9pMmMtRExMMDk0NTowMC8w
MDE4OjA2Q0I6Q0RFNi4wMDAxL2lucHV0L2lucHV0MTQNClsgICAxMC44NDE4OTFdIGlucHV0OiBE
TEwwOTQ1OjAwIDA2Q0I6Q0RFNiBUb3VjaHBhZCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6
MDA6MTUuMS9pMmNfZGVzaWdud2FyZS4xL2kyYy0xMC9pMmMtRExMMDk0NTowMC8wMDE4OjA2Q0I6
Q0RFNi4wMDAxL2lucHV0L2lucHV0MTUNClsgICAxMC44NDE5NDZdIGhpZC1tdWx0aXRvdWNoIDAw
MTg6MDZDQjpDREU2LjAwMDE6IGlucHV0LGhpZHJhdzA6IEkyQyBISUQgdjEuMDAgTW91c2UgW0RM
TDA5NDU6MDAgMDZDQjpDREU2XSBvbiBpMmMtRExMMDk0NTowMA0KDQo+IA0KPiBCdXQgdGhlIHBz
bW91c2Uvc3luYXB0aWNzIG1lc3NhZ2UgaXMgc3RpbGwgdGhlcmU6DQo+IA0KPiA+IFsgICAgMS42
MTEwMDVdIHBzbW91c2Ugc2VyaW8xOiBzeW5hcHRpY3M6IFlvdXIgdG91Y2hwYWQgKFBOUDogRExM
MDk5MQ0KPiBQTlAwZjEzKSBzYXlzIGl0IGNhbiBzdXBwb3J0IGEgZGlmZmVyZW50IGJ1cy4gSWYg
aTJjLWhpZCBhbmQgaGlkLXJtaSBhcmUgbm90DQo+IHVzZWQsIHlvdSBtaWdodCB3YW50IHRvIHRy
eSBzZXR0aW5nIHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2ggdG8gMSBhbmQNCj4gcmVwb3J0
IHRoaXMgdG8gbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnLg0KDQpUaGlzIGlzIGV4cGVjdGVk
IGJlaGF2aW9yLiAgVGhlIGhhcmR3YXJlIHN1cHBvcnRzIDIgYnVzZXMuDQpUaGUgcHNtb3VzZSBk
cml2ZXIgZG9lc24ndCBrbm93IHdoZXRoZXIgb3Igbm90IHRoZSBvdGhlciBkcml2ZXJzIHdvcmtl
ZCBwcm9wZXJseS4NCg0KPiANCj4gUGxlYXNlIGZpbmQgdGhlIG91dHB1dCBvZiBgZG1lc2dgIGF0
dGFjaGVkLg0KPiANCj4gPiBBcyBhIHRob3VnaHQgdG8gZ2VuZXJhbGx5IGltcHJvdmUgdGhpbmdz
IGZvciBzdWNoIG5ldyBoYXJkd2FyZSwgd291bGQNCj4gPiB5b3UgY29uc2lkZXIgZGlmZmluZyB0
aGUgY29uZmlncyBiZXR3ZWVuIFVidW50dSBhbmQgRGViaWFuPyAgSSB3b25kZXINCj4gPiBpZiB0
aGVyZSBpcyBhbnl0aGluZyBlbHNlIG1pc3NpbmcuDQo+IFllcywgSeKAmWxsIGRvIHRoYXQgdG9v
Lg0KPiANCj4gDQo+IEtpbmQgcmVnYXJkcywNCj4gDQo+IFBhdWwNCg==
