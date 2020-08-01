Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11FE23543B
	for <lists+linux-input@lfdr.de>; Sat,  1 Aug 2020 22:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgHAUIY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Aug 2020 16:08:24 -0400
Received: from mx07-001d1705.pphosted.com ([185.132.183.11]:53700 "EHLO
        mx07-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbgHAUIX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 1 Aug 2020 16:08:23 -0400
X-Greylist: delayed 532 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Aug 2020 16:08:21 EDT
Received: from pps.filterd (m0209328.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 071JxHi8002232;
        Sat, 1 Aug 2020 19:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=XQzSP/1icbtr3Olwfx0WeRp80VeO80edtC7lmHFDChw=;
 b=PmiAvuN9DK3nmKGgSXCe/Ktk6cJbx5iFarE4zhUiXbZ2Ncc8+B9JYhzGPo0ncNg0eyZJ
 nnkvRaG6a6dDkE5M93Y9kRayW44XckpHlWsLUhn0ZCBBlDaJejdpN442OezBn9r53O93
 CiALXlXZiY6LB73ldkjU1Wg1VjvazuoBO7wvDpCSmvAqHAZIke8JDU8rp2KuEKWCHXxK
 Jmvm3GHaLSoGcr35kmdLX3av2NvJuCBJzquxJccvQ2JK4XZlQGXMbGkAS2A6Ga5uzx+w
 zO/MQgnN5kDjlRgvH29Mm+lGNpBQtX56d/Bwd6R06dfdXrYC/t7VnroTXJuYefMhpOZb 8Q== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2054.outbound.protection.outlook.com [104.47.38.54])
        by mx08-001d1705.pphosted.com with ESMTP id 32n8g3r39r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 01 Aug 2020 19:59:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr15/Wd1DwG/TCCTTwKLpLmScE7jF0q6+I8Rr/fu7/f2XnrfpPm2FL7kruIxMrpDETloq91oxgPt7NzjP2NrKXKuj/A74ygEyZDFuQPFplulppIYr9ZbhZ8DXcgGQUiql6kpiSnY4uNrul9JoFispPJ+7GtFk1v2m/lMS7ssCUhnYuvYBei8BPpO9PvGMsWo90AdztELjYbXqhKldTUgSS8MENDsDCFMkDRf3nAjZBZKUMaEOVra2UfxKgEqmetjCi0yiKehMWjeSSuVeLQN/8s/0edfgOyk3+Ju8/s/XSzBy8C4aYef1R2GUiWHZQfjm4oz4qbkkPNb0MHgqFmz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQzSP/1icbtr3Olwfx0WeRp80VeO80edtC7lmHFDChw=;
 b=IlfwO9qJoi2Ok2KJk2xTSLsfat4rKSxRp3YTMMAEOxu7s4Nyig/O1se2eTlL61WivyKmwD2fFqtZk5cmrpEC9dGZyDUR7xkMVSVPG1hDS85nEPSVuPrG5NMlslKeoq1RkxbUt1l7mcWy7gmnjTXVDqO4MGzUhpi0iK08E5plXn0kDnrEU/rMmiBdhy2IgCvigWon7VAprEc9z6m7N2trVdQfGx3eaCI/OZc2Z7xrbvD/HDunGbL0QoJMKNjKJ6sFZe4q/bxPuWA9Z4+4IXFgxW14ZBGu/WCQkitxtqBLTn01d+6rjWR4c4L+GTxzJn/23lIUBBa9gRodHEGK/987XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BY5PR13MB3826.namprd13.prod.outlook.com (2603:10b6:a03:22d::24)
 by BY5PR13MB3080.namprd13.prod.outlook.com (2603:10b6:a03:18f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9; Sat, 1 Aug
 2020 19:59:11 +0000
Received: from BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::4844:3fc0:d7ca:b3b6]) by BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::4844:3fc0:d7ca:b3b6%8]) with mapi id 15.20.3261.013; Sat, 1 Aug 2020
 19:59:11 +0000
From:   "Colenbrander, Roderick" <Roderick.Colenbrander@sony.com>
To:     Daniel Ogorchock <djogorchock@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
CC:     Bastien Nocera <hadess@hadess.net>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Siarhei Vishniakou <svv@google.com>,
        "s.jegen@gmail.com" <s.jegen@gmail.com>,
        Carl Mueller <carmueller@gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
Thread-Topic: [PATCH v11 00/11] HID: nintendo
Thread-Index: AQHV/AybxoPmxYlC10ipMhQTxaG4VaiKC0OAgAITDgCAAAkMgIAAFVgAgACusgCAJ/YPAIBf2W0AgAAICICAD77jyQ==
Date:   Sat, 1 Aug 2020 19:59:11 +0000
Message-ID: <BY5PR13MB382682A947A8FB72720AA718984F0@BY5PR13MB3826.namprd13.prod.outlook.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
 <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
 <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
 <59a550594ac3824532a667c668bf1dcb80747599.camel@hadess.net>
 <CAEc3jaDsSmCB0-AQDrh4_Cw3WjAavfXSy6G_A+bEtBF0U5ydkQ@mail.gmail.com>
 <703dfd7eeeb0839a34f8668c3a0d79c1ffd3ed59.camel@hadess.net>
 <CAEVj2tnXNF0BCSdH46DmNRtxPRO7oHkjdmvJuCmiRz4t4pFWuA@mail.gmail.com>
 <292d45aa-cd32-3348-ce32-965281a52b20@valvesoftware.com>,<CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
In-Reply-To: <CAEVj2t=Az1G6X9Kj050aXVetW+PX==LgoEM9C3ES886NsYygcw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=sony.com;
x-originating-ip: [76.87.77.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8cd1a57-79a3-4d1e-b578-08d836555be7
x-ms-traffictypediagnostic: BY5PR13MB3080:
x-microsoft-antispam-prvs: <BY5PR13MB308007919DDB9060EE97999F984F0@BY5PR13MB3080.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 625IhqNsRkydunaso2R6UMz5qbNDUh41bVYS3GCj5dkwrwFGr8svluOkuNBFWCAxrDPel8PHeNIWP64JZnU7JbpthX3v58SjNaygBUrZ1q73xeUW4jVJ2REBAFt7si8VxioTHOdJ+xD+uNfk6uzpXJgNWcDuSEvZWeGj3XjojRhsjpLlncjw/mbOjwM+ne9npAzQrBdUcNtoR2ov7x3UQ6wdPACYJvI/HML4JVAbrJdA3LvY0eRcHb+O01rJPed9kq/y7Nm8Or4itPsjDND0gPawaM4nloHARsVPUvMdF4BRlwowMFlXpOOgR1K4a4nvAaqIM7Y+NswRnmZspijJxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB3826.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(8676002)(5660300002)(86362001)(4326008)(186003)(6506007)(66946007)(71200400001)(83380400001)(26005)(66446008)(64756008)(66556008)(66476007)(33656002)(76116006)(2906002)(7696005)(52536014)(7416002)(316002)(8936002)(110136005)(54906003)(55016002)(478600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ZVoCbE52x+l6Mgs7o3AxmhE4oL+LRpBCgNkNHEMRK+lNyxer83o3f3I62+SKFijaQLMlgObqYBNC+cPDGk/02f72BGNMZcDzOkgjepJV2WmnDSnSDVvaoT/pYpp9HalD+yApWqJCBWM04FLM3W3jaPq/5ionumWvf6572Q/Hr85K55Sthf5DWf3D4QkAbi02JniGAQripwWGpqe+7bljwfgz9SI7MLIWUzZfol1R0QD9WWfM5FdHiAHCtMQiva89rBiwggsyFdCz53LUFAvUAcPpnjU8FN/RtYqUrVA2qyHqOirvKRgKq1DqqBBfMNRAYXMh7TVr96TgHcbUe/5YSCLBXZTh5YBTYiAMf/+me7cl8N+owxgIOaG9AY8OaTmknwQetmF6gD/i4bUxx+b9oRz+D6raeHzWoSTBlX6Bpu8gUaEA02NZ2ZZrfhBYif6GB4q+uPOKCw0+ZX1C3vS60WFwqffZUTB9iN6NN39n+Io9ppDxlkq7v0hte37hegGoPZVpy91HdyvLHoY4inH4ag9SYuVFsxalEe2oIomknJa4frsuhC4wTR8MeWRiIb3r2K0FQ9yCR3ZsqllU6XGy48g0DaCCZMGgX9Xh4+hlP4a5dvjA0iEBxNWk0r4D9vv0Xu1Fh8zSbb0/pJGco8EYJg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB3826.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cd1a57-79a3-4d1e-b578-08d836555be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2020 19:59:11.3782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EzjNgIiXvSmqZd6je1OPCQieoUbt4SYYyUB4DMpj14wnJWVLFA33uatMbQ9vtqTTkLlfbGTqAwYdqBUDdSbtuYzeamWWhyR946AfNvfAbl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3080
X-Sony-Outbound-GUID: VvQl8GAZSNtEOi307ShsZ-EDratHkNaQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-01_15:2020-07-31,2020-08-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008010157
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> I'd been telling people to use firejail as a temporary workaround to prev=
ent=0A=
> steam from seeing the hidraw device. Note that hid-nintendo sets the most=
=0A=
> significant bit of the evdev's version number to allow userspace applicat=
ions=0A=
> to discern it from the default hid device. There's no current mechanism i=
n=0A=
> the driver to yield to userspace using hidraw, but I can look at what=0A=
> hid-steam is currently doing to accomplish that.=0A=
> =0A=
> I guess the downside to that method is that any other process listening t=
o=0A=
> the controller's evdev events would cease to receive them (maybe a voice=
=0A=
> chat program using one of the buttons as a push-to-talk hotkey or somethi=
ng=0A=
> similar).=0A=
=0A=
> Does steam use hidraw for the sony dualshock controllers as well? If so, =
is=0A=
> hid-sony doing anything special for that usecase?=0A=
=0A=
In hid-sony we are not doing anything like hid-steam is doing (no virtual e=
xtra hidraw device).=0A=
=0A=
I just don't know how I feel about mixing of evdev and hidraw. It just mean=
s userspace drivers are doing things behind the back of the real driver (un=
less you add a virtual hidraw driver like hid-steam). For Sony devices I'm =
not a big fan as our devices are very complex. Our devices tend to use a si=
ngle output report (same report id) for rumble, audio and other types of da=
ta. When we will expose audio properly, a user space application doing hidr=
aw will mess up audio streams and other behavior (e.g. power settings are a=
lso in the same hid report).=0A=
=0A=
I don't know a good way yet. Has the usage of EVIOCGRAB been explored? If I=
 recall it was intended to claim exclusive access to a device at least for =
input. It is a way of avoiding of some of the issues for simpler devices.=
=0A=
=0A=
Virtual devices could work too, but I really dislike the extra complexity t=
o hid drivers. Just in Sony case our driver for future devices will already=
 be quite complex. If we really want virtual device support, I don't think =
it would scale to add it to every driver. Maybe there would be a generic wa=
y in the HID driver in which drivers can blacklist certain reports or hook =
into just certain requests or so.=0A=
=0A=
Thanks,=0A=
Roderick=
