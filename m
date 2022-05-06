Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584EF51D722
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 13:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391568AbiEFMBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 08:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391558AbiEFMBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 08:01:49 -0400
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDD758E6D
        for <linux-input@vger.kernel.org>; Fri,  6 May 2022 04:58:06 -0700 (PDT)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246AesK3031298;
        Fri, 6 May 2022 07:57:59 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3frxvbgwyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 May 2022 07:57:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E75ov7qKQk6eRWp6o6/rPSEYRPtYuuyOxaKK7/jbmrLaGBEPNT26uw7HHQYu0AmVMnVwieTGr9w/k6CoLBvj/BhEvdoDeKJ8PwVkM0sm1NdnzHRLdc2Ky+4BphtPhB+IFnezvFd2jaQJ+s1/XfZm3YO/FweJiq+h5sb2ivJ6o0d1tuq07iGCwTzsy9AhjUOZ+T0t/WErCqC5Y1RvpEPWtTO9hx4BMk/yM6YqwLaOrpAeUtWNeJszpvdPeUXlv1mZ63sbnq3BfUkuA8Dn2DOIDm6TwjW8ylsHJnZc1Gl9TNOErrXlUvmPTOPt7r5ABSepCvZxjjJ3R6rVL1a8lC/whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JOdEcKsvZOr25uiqIZX4IGCs4ffQ2I9j1B3+NPf4HE=;
 b=NXWgRgpA+b2K8X5sXRhoUBKFshmpM+PHe+ofjt6gOm7xD7SYlYX6n/LWbXVCIvBDl03arhtyZHIQJZ7+UQatfC/BywiUO/h4nXBK8185TCY8lcDgX1zZxwsNWL7ctAKULU2XQ0crLa91vHFaqRDxN8hJ8BRABtAmi3xwOcKBXSwWKRau51eRKG9akAppO3BP5fdXvmxswqri57ZJxHV8FjUGklrH2bmjWpdytbJRtETsZwVBb8jztbzDrfDhQ2Cf0iTK3YOrcOYa5CUsUVFJtZ/PFjiyBVtBWobdZDDCyXDW3IuoHMI+RFI1j5xWREzCEaHUDs7huNNOX/manVUj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JOdEcKsvZOr25uiqIZX4IGCs4ffQ2I9j1B3+NPf4HE=;
 b=ncxtoLOAIU1CiOXCCeNqbharGM4R6XjZb5BWCYYIXJFqb9/uvTo/cAaa9oQEDgyRuhq5NMYOufj3zn7z6nUgwid+A6cGRGqhpcFNZPfdkuR1xk7FSeBGEzB9dLmfYgLeVBhULxoCRqU3+xJqaZI63zj0j9pWt0acqBhsHi0BgHQ=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by DM6PR03MB4683.namprd03.prod.outlook.com (2603:10b6:5:184::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 11:57:57 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::81cf:38ee:b416:f359]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::81cf:38ee:b416:f359%9]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 11:57:57 +0000
From:   "Hennerich, Michael" <Michael.Hennerich@analog.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>, Arnd Bergmann <arnd@arndb.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] Input: adp5588-keys: Remove unused driver
Thread-Topic: [PATCH] Input: adp5588-keys: Remove unused driver
Thread-Index: AQHYX5OWMHq42+1B8EyK6hudoMqJqa0PzmBAgAAb5QCAAdLV0A==
Date:   Fri, 6 May 2022 11:57:57 +0000
Message-ID: <SJ0PR03MB6253FC31665D4ADA31A0A5458EC59@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20220504084617.36844-1-u.kleine-koenig@pengutronix.de>
 <SJ0PR03MB6253FB12C55E309BA438BF918EC29@SJ0PR03MB6253.namprd03.prod.outlook.com>
 <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
In-Reply-To: <20220505074956.gmgdxfgvod7k2ind@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWhlbm5lcm?=
 =?iso-8859-1?Q?lcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy1jMWRiNzkzMy1jZDMzLTExZWMtOTI4OS?=
 =?iso-8859-1?Q?00ODg5ZTc3Y2RkZWZcYW1lLXRlc3RcYzFkYjc5MzUtY2QzMy0xMWVjLTky?=
 =?iso-8859-1?Q?ODktNDg4OWU3N2NkZGVmYm9keS50eHQiIHN6PSIzNDUwIiB0PSIxMzI5Nj?=
 =?iso-8859-1?Q?MxMTg3MzE2NTMxMTEiIGg9Ikk0aE1FVkR2S2xoZVBxcnZidHowWTl2V1hv?=
 =?iso-8859-1?Q?MD0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBRDNienFFUUdIWUFlWW8wamp6QWlQMzVpalNPUE1DSS9j?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBVklFdm9RQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9dc55a7-34f1-41c6-8d8f-08da2f57a915
x-ms-traffictypediagnostic: DM6PR03MB4683:EE_
x-microsoft-antispam-prvs: <DM6PR03MB4683F6322EC1E53C3442B2738EC59@DM6PR03MB4683.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pn3AHCzYaB7JUIGQs7YzGEqGRX+X/rPfWhUBEhw4FolGE8uVM5GM9TCd9Jia7xTVmCm/62tm8ub1hDbMOcSe1mb70F6NXQQWTO5DDgeXRF3kUXoFobneYz/EcTTDH7BTJ57JVUaFUGSMd+HeHU1SnVAmam5U1gvFmxELRzA/pXr2PUdWGxrDK6No+d0pwRTUJGu7aCimTaKtvTKto2gNK6h5EdBddZlHKOY5vr6UdTDnw7BhLjkqQhN1nAKG7UYqmQ3fuFAeFZ8Se/u39hEoGIIFZatbL3gKGgpPPL4fDyEMIJgiea0zoEyNE94R+JDFACceTPujahgQXqL/dO024VMS6yyiwryQiaZtZWuuDT6UeURKSRuO/JFh5HLYHnGkzcHhcKEDUwBFpUGuxrcRkpiJahXWH7MWhBV7hvI7P3sgi863Jb8wNqFKgaZCyCkmymBrD8kqUnHMXAXWG0ZfrJTVwYHC44ttVTrUKUBHahIeul/MxoDQTi28CdnE9X2uMnPuaHrtFaeeE7r4tYZOQkfl/2LugRrQ3Ae4wr/CqkAa8exkcKs00v5Twl22CSpONUi/eln0NF0dOLZgzecTY55p65XWOYyAFYu9dPXcsTkf5RbORtXJXL1TUlxaRr0v9xyNEaot4yYS1B8pJ9VqPFfhG9j84YdCccIs+tl0cxpEhxTjfDVNJYEcN0hNfuwoVckU5qJ7pccUXMWS1xHI0tamN8x42irDIptTX/smOSvTYFBSZJcc+LCcvF0xFZUn6IPlnkdCGCLQZ5eSziQSaDxNWyafS9FVbJElQqyCTNkjEuSXwvlGziEeGZnJfkiz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6253.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(54906003)(83380400001)(966005)(52536014)(64756008)(66446008)(8936002)(71200400001)(66476007)(316002)(6916009)(8676002)(66556008)(4326008)(76116006)(66946007)(26005)(33656002)(66574015)(186003)(9686003)(6506007)(53546011)(7696005)(38100700002)(38070700005)(86362001)(55016003)(122000001)(2906002)(3714002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hToLKiVxNbDqoxFkLHoji6hb2bkec5R//sj+bCeRcmiPz0touTHOSHfHnr?=
 =?iso-8859-1?Q?zaHQajAxt+ni5fAljavR6f7tMHOyGEy9b4ww/kr4I1GjbATZB8ENKWOhrj?=
 =?iso-8859-1?Q?3SnrvdDv8Q7TLA1EBmSX09Ys+VLH+Nq8eKfxBViPx6fHxal6S+RiSYqo3o?=
 =?iso-8859-1?Q?XXZoRULRwmcz23R7q+a3P7JoXn+Q+uhnp7WYPPhE6G5qiguSv0BeJVqTkZ?=
 =?iso-8859-1?Q?cgM6TzMF68iZb950719IUhBwzryW5G/v6oLhjMwqugCPEQRMp048yfH0jn?=
 =?iso-8859-1?Q?hhtZvcLsZFzg/rX8HHBUZxZvUWrRu8r6G1IKqWaSsGkdmC0j1BIlirX4qk?=
 =?iso-8859-1?Q?aSp0A+nM2qTTnvr6UiR4bRMZz5GBy7PJ4j0mTznzQsL1p1U6P9dlqnD9Mm?=
 =?iso-8859-1?Q?gWYGBM+G5i5hVM5yDcv8J457K3zlog/k/FKOsQ2eDAaCPyqA1Jzqhep72e?=
 =?iso-8859-1?Q?ktGlQwIj+p1xillfivSKywp3qpNbcWBjV46fPn+qg+JF2BlqQN50l0cojf?=
 =?iso-8859-1?Q?i01cnAssd99M8lmIAlq1TCksy48R/sLDxiWQ01PSdz0L128M4iPqpXZ0Fz?=
 =?iso-8859-1?Q?Jr9bsRyiRhPBpZSnPZJ/lzFaZJWLXdqqeEnWlm9ZoVMW/NJeMakTqeW+I/?=
 =?iso-8859-1?Q?klCSiPtygO8smEyLBI972y6HtfFeMLLtQBG2oNYZuzBariiATY73qoVMbA?=
 =?iso-8859-1?Q?xlQwh6oibcFoJofBi0wLUx2nSRETWFH0TtJ31uG7Rvac94FkxaXcGjdD2u?=
 =?iso-8859-1?Q?En48IZB49/DjhfocaPUwXBD8grtvCYeFaa8H02NiaUc6bZAmS34yM//C3f?=
 =?iso-8859-1?Q?VbgIRGFIm0uSm+9IRqHBOAisj7GZwEqGJMB/ht66xAw2inHbjTObLYk8iq?=
 =?iso-8859-1?Q?JuhAycKZjlDYOUzouF5hCpgHHZYpI23QYDInh3KgOiYWb5V6ql4J7zrwcg?=
 =?iso-8859-1?Q?jmFKD2GwbLdvpKVCBPm5/3EkyNt23Q0IdeHG0BA7lDRyJ6uG18LKz8PaTa?=
 =?iso-8859-1?Q?7LjXhAqiUSUa+WPEZziyiqmXQEBoHP3V4By9XoT/2wE4CkRpgSK+w/ZgyP?=
 =?iso-8859-1?Q?V0nLOY/BsGekiA2mbUAGiHxlGQaMjncb9vzpnNNnWCkjSTaKPeBu4GtRJU?=
 =?iso-8859-1?Q?Ct3hdUJMJazqs/e43darcxE8YCTl85M7cH9okCpcw85N74LKtSQI59L0Ds?=
 =?iso-8859-1?Q?nOHJUd+HugLDKfTvpG42TUkuM3TPk4iGbaZ1kUy6S+QBcwaQneTj3m4IE1?=
 =?iso-8859-1?Q?8/+1/9l7MjTh99o49wrtQUBK7zidkvs8KYBKBfrEFCLLn77cYZPkYoQwcZ?=
 =?iso-8859-1?Q?ZhwNWJKAKa0PP2wLAH6CzUWL79nCMbpl+apwA71rSMsYmWFWkPm8NuSqSD?=
 =?iso-8859-1?Q?mmCSFxwVzktxoOl3M0M+1Ht5b1zx+Lv4On4A0MLyypBgYzuPeAWHJfSkjz?=
 =?iso-8859-1?Q?ccB7uWWxVgUT7QQkb5Ct6P9GGxyEmri5XGmT17QSIHwB+iv1WRClsCSFgg?=
 =?iso-8859-1?Q?jTJ95BEyGzlQle8u4jXy1U8z0K2t+ygNc+0Eb5jZHMDhlrCF+fJs1hr/vd?=
 =?iso-8859-1?Q?wkLLNb08adHbcVGNQ6VcHQY3+4As8K5uT0cHOJhabpTn9vb+IBrpFjc1RS?=
 =?iso-8859-1?Q?l7cT4BbhjM9Y5MtvmbzsxrX+DgKz8fwVaW/bIUn6ahe6k5AkCVm10jgmvT?=
 =?iso-8859-1?Q?QQXjaaNDqf6Wkkc5bX0jFpsqS1uoo7WgwVSm8HaMUQaIuXUqYPI7CKnRRe?=
 =?iso-8859-1?Q?0Bq+KKAdW/c/yu6msvwBSJ0c6FzNU8zA+bxYX2/ZmW46nCDS5FQrRMJfob?=
 =?iso-8859-1?Q?EBbQYKXAxSWBM7pZExtlnl897WIfu9Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dc55a7-34f1-41c6-8d8f-08da2f57a915
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2022 11:57:57.1143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DnsJbieqS3REHN7Wn4jRYDZSVVKb77vz2n1sa+HmeKXIxnkMUFMXKZiV5lcwPNh3/XWStOaHoZnQs4LqCsLVmm+yxOKBZeKDgHdpb+LEBUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-Proofpoint-ORIG-GUID: NCxL8yVpYoNTFNS0yaNri5ZZE6YIVhzo
X-Proofpoint-GUID: NCxL8yVpYoNTFNS0yaNri5ZZE6YIVhzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060067
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



> -----Original Message-----
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Sent: Donnerstag, 5. Mai 2022 09:50
> To: Hennerich, Michael <Michael.Hennerich@analog.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Bogdan, Dragos
> <Dragos.Bogdan@analog.com>; Sa, Nuno <Nuno.Sa@analog.com>; Arnd
> Bergmann <arnd@arndb.de>; kernel@pengutronix.de; linux-
> input@vger.kernel.org
> Subject: Re: [PATCH] Input: adp5588-keys: Remove unused driver
>=20
>=20
> Hello Michael,
>=20
> On Thu, May 05, 2022 at 06:20:22AM +0000, Hennerich, Michael wrote:
> > > -----Original Message-----
> > > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > Sent: Mittwoch, 4. Mai 2022 10:46
> > > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>; Hennerich, Michael
> > > <Michael.Hennerich@analog.com>
> > > Cc: linux-input@vger.kernel.org; kernel@pengutronix.de; Arnd
> > > Bergmann <arnd@arndb.de>
> > > Subject: [PATCH] Input: adp5588-keys: Remove unused driver
> > >
> > > The last user is gone since 2018 (commit 4ba66a976072 ("arch: remove
> > > blackfin port")). This is an i2c driver, so it could be used on a
> > > non-blackfin machine, but this driver requires platform data, so it
> > > cannot be bound using device tree.
> >
> > Hi Uwe,
> >
> > If we start removing drivers which obviously don't have a mainline
> > in-tree user, we would upset up many users of these drivers.
> > I agree on updating this driver to make platform data optional.
> > We could provide a patch in a few days.
>=20
> Just to add some background why I stumbled over this driver: On of my cur=
rent
> quests is to make i2c remove callbacks return void. As a preparation for =
that I
> work on updating all i2c drivers to return 0 in
> .remove() to make the change to void have no side effects.
>=20
> One of the offenders is drivers/gpio/gpio-adp5588.c, which in the presenc=
e of a
> pdata->teardown callback might return a non-zero value from .remove(). Wh=
ile
> looking at the pdata of possible devices I only found
> drivers/input/keyboard/adp5588-keys.c.
>=20
> So the options for my quest are in increasing impact order:
>=20
>  a) just warn if struct adp5588_gpio_platform_data::teardown fails and
>     still return 0 from .remove()
>  b) make struct adp5588_gpio_platform_data::teardown return void
>  c) drop teardown support from adp5588_gpio_platform_data
>  d) drop platform support from gpio-adp5588
>  e) drop gpio-adp5588
>=20
> Currently I'd go for at least d).
>=20
> Having said that I think e) has a net benefit. If there is no user left i=
t reduces
> maintainance burden. If there is a user left, they hopefully will tell us=
, we can
> restore the driver from git history and then at least know a tester for f=
uture
> cleanups and changes.

Hi Uwe,

Thanks for the explanation.

I know that there are users of this driver. But I admit, we should have ear=
lier
made platform_data support optional and also add proper dt bindings.
We're in progress doing so. And in the meanwhile, I would prefer a less
disruptive intermediate change. For example c) with the promise we're worki=
ng on d).

Best regards,
Michael

>=20
> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
