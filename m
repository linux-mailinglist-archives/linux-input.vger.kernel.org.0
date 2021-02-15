Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7A731B3B5
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 01:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBOAtN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Feb 2021 19:49:13 -0500
Received: from mx07-001d1705.pphosted.com ([185.132.183.11]:1451 "EHLO
        mx07-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229899AbhBOAtM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Feb 2021 19:49:12 -0500
X-Greylist: delayed 857 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Feb 2021 19:49:11 EST
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11F0XgJS018186;
        Mon, 15 Feb 2021 00:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=S1; bh=oWB51eXJpKAfCuyfBkx3blXtyteFfBm4Er0cic8Wy/8=;
 b=MNsFcirPxM1V8J8Arn+RsM7J2KqOWhmvo04LcOsdizHi+flKctxZ8x0AV7umuXN3TIrz
 SXq7oP7FS7Szqnb7K6JbsHeTuipTnhJKLU8QtmUFJaAup+5dxf35AxQADsmYwCjQNzFZ
 5Da7eOLstHbMrzqNEGVQ3uM4ZZHQIe4cf8ufTDr4Bo1exDNToUh+h0MKG7FIMgpYMs9f
 zU/lNLzbDiMc1b37hxQ+OCkFCMLTUG1V5jX4BB8FIKbIdEqr+o7Mum2HdnTRbY/PXTos
 NG68iNKbcUQo2mktsUc8kAcARnR/mW5/ZWqp/lu6/T9L2YtpcEq74lAH9F56yrkeQnxe sw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by mx08-001d1705.pphosted.com with ESMTP id 36p5n18s8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Feb 2021 00:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcOuf0b87a3fhHQqa/8z/swH9vtgDNSNkDSd3XJQSTT3aOGtPztHTDd/jE104QU+1jEE/OrVBrvm8O5exksx9dQM1ZfuN5PugzMXL56THRDrfATHW2Oi1UvYYrunpCDZOaGPAAI3NAHDhlNyuvElrpWwSU2sg0n5a4o6oX5d6t6Zaw7AytvAmcAiMTx7zAZdHhcBN68GtMvpSiS9GCyWRzhQw2hrm5xhRBJv2KPSGxaT0kje+FEl5xLs2bwExb/YQcojCEk66eOT4fHV5EPoFU9/Xze/9m4MDBm5HtWo+DHfZ7zOupFa8OCKZMRe3N85qxEJh8/CfBqe6RHZe86HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWB51eXJpKAfCuyfBkx3blXtyteFfBm4Er0cic8Wy/8=;
 b=MqddESGdUzH1dUMqvA/ERbkSbKmvnUS4K3eb+UoWj0LV56J048hOrtadX7prsEauNsrESxLBC7Efekv2v/ccsgnj8WHs1PGS0KDrKU8rCzcnd7cdPV5hK6Lx1QpgBEmHlUgeZw2dic1CYH9OIntlMf0CzZ6H//MsonHz4EkjIoWaOoIEd56Ar0McRtVu+6OQrW5kNsj0u+InRdSjR+MnVdgilHd9MlNIpjjWExymLMzidpkiCixMGHWAH2bB1FVZOOhmc8aRXBJdnFPsPY3rwP4nIxUnol8/PHFLsFJAfOhnvUNbFCTSIQ7Z4njSe45Dq2fG5rvIpfGFCJLtCs88BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BY5PR13MB3826.namprd13.prod.outlook.com (2603:10b6:a03:22d::24)
 by BYAPR13MB2567.namprd13.prod.outlook.com (2603:10b6:a02:c8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.15; Mon, 15 Feb
 2021 00:33:48 +0000
Received: from BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::112:f1ee:38fe:9be3]) by BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::112:f1ee:38fe:9be3%6]) with mapi id 15.20.3868.020; Mon, 15 Feb 2021
 00:33:48 +0000
From:   <Roderick.Colenbrander@sony.com>
To:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>, <marek.behun@nic.cz>,
        <pobrn@protonmail.com>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <linux-input@vger.kernel.org>
Subject: Re: HID: playstation: add DualSense lightbar support
Thread-Topic: HID: playstation: add DualSense lightbar support
Thread-Index: AQHXAzHlzM4hX00qhECz/bTCtvCqYA==
Date:   Mon, 15 Feb 2021 00:33:48 +0000
Message-ID: <BY5PR13MB38268F7B8098B174C721C10B98889@BY5PR13MB3826.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [76.87.77.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8d1890dc-c0a2-421b-4431-08d8d1495c85
x-ms-traffictypediagnostic: BYAPR13MB2567:
x-microsoft-antispam-prvs: <BYAPR13MB2567C57F8EA2A2D84255B2E198889@BYAPR13MB2567.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PgddimNLwkN/r4HcYjXo1Y3Fnsy6WYIpWB9+w2aIimoepOY8m8XWWvBQFBJ3y4UZYq2+bFZGbiHKbMjPRoO6eeAc2Tk43O+rbwtKQLRSOA2lOB/zPZqEbcBCQKysngbQ6LtOrzZ+H8rdVihtKQBz4TAhd9sF1ZZAPJS9yHArtpF9UYoVHrjimFcHNggxPFhuHwm219PxB2DqQu5O0D4J0M1k3dEY/90XMVsRsiloBHeKn8Lm7Sn0FZx+G8Ah/NKaEYWpOiFiHbkywDd17YG67rhy0r+1kOR137znkmp+njUdpOwu2ueGBVk3Uwl2hrTdj2zW6+3s46275HapiuIsijnk9bsR9G9UMHMvT3bCkY6+KLVc7rh9ntU5dvDNcqiBYkG91rR6qjTK/i0U0tE8FiRw37DMbTo4RXkZTcA3IF3V5CJ5b8KaEeIZU9Swx2HEQnCFQQCdniG15SaFyd1LWJjlTsnSEO/lp7yirpA2cCUR4qSB6XdbmEkHncLAS1QW2xxQYcQEE3NjJA8m3j0YvVdKsJu+8RKUvzhUaalJsjC3QdyOb1cGbwB5/S37ZET34Tw8shVUWRmCVASqBkHVEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB3826.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(64756008)(66446008)(66556008)(478600001)(76116006)(66476007)(26005)(316002)(33656002)(110136005)(71200400001)(5660300002)(55016002)(7696005)(8936002)(86362001)(966005)(53546011)(6506007)(4744005)(66946007)(8676002)(52536014)(2906002)(186003)(9686003)(45080400002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?C5FSxhJ3GhbJMo7x27v7VRXSWKsNBxVRGDDpp8FlUddiBX6yarn/Th6QwB?=
 =?iso-8859-1?Q?p3709OyefXNAGvzZcKsBhENSWNTeUBBHXjVo5iNk82V0oioWP+K2mpVfXb?=
 =?iso-8859-1?Q?AFIquBzfVBMiaCLdzAJpH0XAEompkKXUuuMe+G5PvkseAYnKVGANxHKluy?=
 =?iso-8859-1?Q?eJFVe2EYkPNabiGSivi8iduXyJhCUZT3vuAGhS5aLTgcLRTEHCWCzBEOXU?=
 =?iso-8859-1?Q?d9S/k1xEczebqJY0s5qQtVNHAKpqGzyMndMwudj/Ih+mEND4D2dQUvYrzD?=
 =?iso-8859-1?Q?hnJyiPODUi/VZO5wEraxVcA8ZmXOQlLtWQph+4VXkF2UbR3S7mJCzPtFBi?=
 =?iso-8859-1?Q?usm51xMSVg3eQ4I/j0aIOXmO/AazzMuJYjsoVRBgzOy9dPu9YgnSuVQoRX?=
 =?iso-8859-1?Q?TTrXtqflxdVTWXKpbUgMDXHVIkzasB+sMBjUElJR5NQxG/ET0Q05BA3T8y?=
 =?iso-8859-1?Q?HSoR/jpiuj2rD0ikcFk70CpYcXDYBbVa7JGm6g2wIyJlwwjspSC+qjyepa?=
 =?iso-8859-1?Q?KWE2+Iowvy8JLbvHua8B/VJxOy/xqj3OHokfl5RE+koR7CGs6I//MjvVM2?=
 =?iso-8859-1?Q?IukBO/CEY8ExfoprqVTPQiqQEOpjVGZDJ0V+GDzgM+wOP/PrXyygY4NfxM?=
 =?iso-8859-1?Q?lmlhLSNetQqPwcNOKSklq1Of6nIULKd7ZJEjAo79hhz99zUTMRDTwuFw4N?=
 =?iso-8859-1?Q?86ThqwttrhqlcrDVrlWqpGFGpDV8YtmZHcSuP6biLQJEcI+G3/vINZ8Eht?=
 =?iso-8859-1?Q?z40S9NzkBV7Ji794O/jL3QLIabiH4A5zdW7apeMPXSOES5E2PuT0oYMtcF?=
 =?iso-8859-1?Q?x4l9skaXwFPMzXd5DnwgAXhDfq1HBj8NCBeHvebHUh23TA3XSEqxDZW436?=
 =?iso-8859-1?Q?ibnqcrrBOP2wHwRyt25sxfFpjaoyWZSRD1h3o7Us8o0vWM1QOP8J3nzHbi?=
 =?iso-8859-1?Q?5S0j8YZ+idvupPvu6yoqE4tzpkalH3GXIY9kfNJEZXnReo6G+f4RolyNXo?=
 =?iso-8859-1?Q?8+vEvmslAj4QPz7j7kvLbI07XoUZt/ouNWAStPl/jLGpxdfrUIfTQbhGAM?=
 =?iso-8859-1?Q?1hr1rTdwR/bdeId35DESZoNOAITB09yjljvCMLj+NZ2ERWb3/d8m//mnG6?=
 =?iso-8859-1?Q?QJcNKNc5Xk71LyiaiQ7dZARB2oBYRCHf8WSB1vfdV/+QZ890wB1lI/ZIx1?=
 =?iso-8859-1?Q?19q9uNTQEOsAFVZk9+U05qZBLECSob21WzEanRQIJ3S5pGtfOuHeEWwHAu?=
 =?iso-8859-1?Q?E5OtkZy/pL7IHMK5EDCu5hYCRlucifKMabBt+LJmq+cQe6PCATEceK0053?=
 =?iso-8859-1?Q?FgeE4kRrm1RY92JzSnvj8RqmgowgSP5pK2vAkj+O1de7TTk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB3826.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1890dc-c0a2-421b-4431-08d8d1495c85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 00:33:48.7184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oH+YHJGJU8+aWTENaaX0QryeMlgU4dJcbrdQ4DrK7MpzWvsnnHj5m9oDtTuSH2ba282vvqqqtcQYRgHzt57WLUXAbNq/QzNmVUzWBUtdWng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2567
X-Sony-Outbound-GUID: -ZwQBAerjeefdGMan-bTkODaiEqbUtR3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-14_10:2021-02-12,2021-02-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=588 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2102150002
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,=0A=
=0A=
Thanks for reaching out. I will submit just the LED specific patches to the=
 LEDs list with some additional context. They will come from my Gaikai acco=
unt (we got acquired by Sony some time ago) as my regular Sony (outlook acc=
ount) is terrible for sending patches.=0A=
=0A=
Thanks,=0A=
Roderick       =0A=
           =0A=
=0A=
=0A=
            From: Pavel Machek=0A=
Sent: Sunday, February 14, 2021 10:21 AM=0A=
To: linux-leds@vger.kernel.org; marek.behun@nic.cz; Colenbrander, Roderick;=
 pobrn@protonmail.com; benjamin.tissoires@redhat.com; dmitry.torokhov@gmail=
.com; jikos@kernel.org; linux-input@vger.kernel.org=0A=
Subject: HID: playstation: add DualSense lightbar support=0A=
            =0A=
=0A=
=0A=
            =0A=
Hi!=0A=
=0A=
=0A=
=0A=
I noticed that there are LED patches in the -next that were not=0A=
=0A=
reviewed on the lists, such as "HID: playstation: add DualSense=0A=
=0A=
lightbar support".=0A=
=0A=
=0A=
=0A=
Could you get them posted on LED mailing lists for review, please?=0A=
=0A=
=0A=
=0A=
Thanks,=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 Pavel=0A=
=0A=
=0A=
=0A=
-- =0A=
=0A=
http://www.livejournal.com/~pavelmachek=0A=
=0A=
