Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51141FE32D
	for <lists+linux-input@lfdr.de>; Thu, 18 Jun 2020 04:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbgFRCHL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 22:07:11 -0400
Received: from mail-eopbgr1400059.outbound.protection.outlook.com ([40.107.140.59]:32896
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730734AbgFRBWZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 21:22:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFgsC1hNb+AbAYWPgZ45+mQTtCBGdtoPNFNOmtDwO70b2v5sJnjYTm4St9h0E1H1/Mf3CgHNMQ6mQ+V6qjmd3OdWjbWluX3eFG+HQr3bTD+d3RaSXLvEWI5ZY6IUzMcqeZ0z5Qa9yT7ET/Bz5CZAS5hcgj1ECBA+Z6t1Gca3x6UvVQtdqMdqxNhZfDJEtf07f1ayGzju2hEKdphdYy/kX/uo6Eg8coRU/yg7U7/TTK25Eb6KpeRR5dB7VTSb1LZl/OTxvjLI59SO9zarsVeeXouLj+b5AZIpReaCzhlmiiTyCTWBM5t3p2Vu/drkQ/HGwyX8algIMGP7LHX/szoDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mZpdzX0R9NptvUBIlK5Sd+M5LC3nbB0BRCaNAc3WVY=;
 b=jirxmLME+c1avfb5bNNiwrmiI4zNsUc0gSaEtEmq+A4juTeDIPJ/gofuP8oI6ERyalnIqckWjPG1AEGsJJlvwFZgvOYVyebD0nv6XUIAfDboCEcqUjxbo8Giqv8p1dC/h0VimIGok0nCspLhXZA3sKt869g75NMPjHB6fSjKN8OS8GLodx8xS3yYQrFIkBXpom3Qgty1wHdgh2lN7W8Ar6jOWAys9bYh2FPOnBwSTGuiO7wkCQHFSGzUbJt0KD2Ntas1FsSyqAuBw7C8lbiQBLLgOO4c42TsOi070UgSUYJ3sRhXrBCxSt81NMBOz5Luu4835HFTsd0QnslR4OHTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cn.alps.com; dmarc=pass action=none header.from=cn.alps.com;
 dkim=pass header.d=cn.alps.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alpsgroup.onmicrosoft.com; s=selector2-alpsgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mZpdzX0R9NptvUBIlK5Sd+M5LC3nbB0BRCaNAc3WVY=;
 b=dijFN4cAQ/Uln6EBbpnH2MloNbW098/xYYF1TGyhSpXleNs7R9V5bM2dMa0JYOQlBjgMTUHHrEmG4ZP1AIlHk/lVYV2xlLJHBrBtd5tJ5LGdmyKCiTmfMFzU2dhJuPjsbbrzMeIKiDTfgKwmXHuGzwje8oMKNB1tyrWoOIWW5Ys=
Received: from OSBPR01MB3766.jpnprd01.prod.outlook.com (2603:1096:604:44::17)
 by OSBPR01MB3109.jpnprd01.prod.outlook.com (2603:1096:604:1f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Thu, 18 Jun
 2020 01:22:22 +0000
Received: from OSBPR01MB3766.jpnprd01.prod.outlook.com
 ([fe80::192b:cd5e:dd7:5d3e]) by OSBPR01MB3766.jpnprd01.prod.outlook.com
 ([fe80::192b:cd5e:dd7:5d3e%5]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 01:22:22 +0000
From:   Caiyuan Xie <caiyuan.xie@cn.alps.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     Caiyuan Xie <shirleyxcy@gmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIXSBhZGQgYWxwcyBkZXZpY2VzIHRvIHRoZSBo?=
 =?gb2312?Q?id-ids.h?=
Thread-Topic: =?gb2312?B?u9i4tDogW1BBVENIXSBhZGQgYWxwcyBkZXZpY2VzIHRvIHRoZSBoaWQtaWRz?=
 =?gb2312?Q?.h?=
Thread-Index: AQHWMBjIiU7dtv62ik2vnO8UbqXJFajbhpUAgACvC+CAAPO2gIAAlA4A
Date:   Thu, 18 Jun 2020 01:22:22 +0000
Message-ID: <OSBPR01MB3766EB1DA2916F81EB1BC64FAA9B0@OSBPR01MB3766.jpnprd01.prod.outlook.com>
References: <20200522090937.5917-1-Shirleyxcy@gmail.com>
 <nycvar.YFH.7.76.2006161732010.13242@cbobk.fhfr.pm>
 <OSBPR01MB37662B2DBBD8261763E4820CAA9A0@OSBPR01MB3766.jpnprd01.prod.outlook.com>
 <nycvar.YFH.7.76.2006171830560.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006171830560.13242@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cn.alps.com;
x-originating-ip: [58.247.0.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f2c54ba-a720-4b0d-f05e-08d813260d44
x-ms-traffictypediagnostic: OSBPR01MB3109:
x-microsoft-antispam-prvs: <OSBPR01MB31093CBF91271B03A8E6DFCAAA9B0@OSBPR01MB3109.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CJm36EBU6R/pADNQZQnTZD7n2hfaCMCdBtx4ooBJwtXET/eLybna/NkNa5vSVDUmWzJfvt3ms43YqfjzTVkaOjFdAtYLmHuRdCb5Ak0SZgibwsb5Gnff2oMAxXuDgOOUqbmRzpkARlazAKwP01IzH/kfzlptTWo5NBUZwUyCYA6KTkk2DCE9Me+i8DxdY0fX+ZkQXuHon9SxYMNkA3pDc5TQ/HXqy9j4lixYGCiS2Zw20TB2KoU4206W3fmWVR/hG892UccPdBYyRMMdfIIns7/pRBtYTo9FbtkCZog9stNHn1DAI1Xa760oT6GEgrYo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3766.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(54906003)(83380400001)(8936002)(33656002)(7696005)(5660300002)(52536014)(316002)(76116006)(2906002)(6506007)(478600001)(86362001)(55016002)(71200400001)(4326008)(224303003)(186003)(85182001)(26005)(66946007)(64756008)(6916009)(4744005)(66556008)(66446008)(66476007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ecmsw3gCQ3P7TEQYopLOZRip6il7X15mYMpFi36u0yUW63pnUIMeE3u0Y0b5W7V/AOFS2p60t2wXQUuimcxg9ukZkHkRW0PUn91gRT0G38i1DvEIf95NVM6OGJR2rOf+P6Xc09lB3nwaldmYLq1/qgJsLtXEqkp6TGa9f/936NvteZC82lOzyDoIJOznRLbA8YB4Gfq4/0OGzJm/z1LV5N/atDCdUoc7uAGLJcneHUR+tyMZgo24zDg3RlotgBBCwGErS5/pQxDqFHgr90KQFLEI/BYHjBFrjqPv4LaDIv7Sc9Myc/IfL6X36hpSQKEcurRCa5TCO9uOLzgqZALtCeFk8zw1JoWZTVm1mV02vFQm/k+2RzonphOY5CaW1O93So7FJ8wg7ZCDKsE3vWjTPMYLp7OEQlzsN4sdNTdYhyop+qqOECsC21kqff3UuorOn+CAKHWhYsqQDUQ5iKlwWaUcKjiI8/PiYrWhjJx0wyk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cn.alps.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2c54ba-a720-4b0d-f05e-08d813260d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 01:22:22.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 57e76998-77bd-4b82-a424-198f46eb2254
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3pNz30f/Ralt+vY6UzwJP/m8v9NoRx+2IYqSfXRg7dbg/MSRgLUU9gYqe8whcjpU5LZJ9mVX5R0vWwEcdgM6yBFCViLrsOCgRjH5rHu67Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3109
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

SGkgSmlyaSwNCg0KR290IGl0LiANClRoYW5rc34NCg0KQmVzdCBSZWdhcmRzDQpTaGlybGV5DQoN
Ci0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBKaXJpIEtvc2luYSA8amlrb3NAa2VybmVsLm9y
Zz4gDQq3osvNyrG85DogMjAyMMTqNtTCMTjI1SAwOjMyDQrK1bz+yMs6INZ4ILLKiEEgQ2FpeXVh
biBYaWUgPGNhaXl1YW4ueGllQGNuLmFscHMuY29tPg0Ks63LzTogQ2FpeXVhbiBYaWUgPHNoaXJs
ZXl4Y3lAZ21haWwuY29tPjsgYmVuamFtaW4udGlzc29pcmVzQHJlZGhhdC5jb207IGxpbnV4LWlu
cHV0QHZnZXIua2VybmVsLm9yZw0K1vfM4jogUmU6ILvYuLQ6IFtQQVRDSF0gYWRkIGFscHMgZGV2
aWNlcyB0byB0aGUgaGlkLWlkcy5oDQoNCk9uIFdlZCwgMTcgSnVuIDIwMjAsIENhaXl1YW4gWGll
IHdyb3RlOg0KDQo+IFRoYW5rcyBmb3IgeW91ciBjaGVjay4gV2Ugd2lsbCBuZWVkIHRvIHN1cHBv
cnQgdGhvc2UgZGV2aWNlIElEcyBpbiANCj4gZnV0dXJlLCBzbyB3ZSBhZGRlZCB0aGVtIGZvciBm
dXR1cmUgdXNlLg0KDQpQbGVhc2UgYWRkIHRoZW0gb25jZSB5b3UgaGF2ZSBjb2RlIG1ha2luZyBh
Y3R1YWwgdXNlIG9mIHRoZW0gaW4gdGhlIGRyaXZlciwgb3RoZXJ3aXNlIGl0J3MgYSBiaXQgcG9p
bnRsZXNzIHRvIG1haW50YWluIHN1Y2ggdW51c2VkIGxpc3QgaW4gdGhlIGtlcm5lbCBoZWFkZXJz
Lg0KDQpUaGFua3MgYWdhaW4sDQoNCi0tDQpKaXJpIEtvc2luYQ0KU1VTRSBMYWJzDQoNCg==
