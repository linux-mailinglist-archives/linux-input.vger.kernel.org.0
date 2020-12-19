Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6442DF288
	for <lists+linux-input@lfdr.de>; Sun, 20 Dec 2020 01:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgLTAq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 19:46:58 -0500
Received: from mx08-001d1705.pphosted.com ([185.183.30.70]:5928 "EHLO
        mx08-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726771AbgLTAq5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 19:46:57 -0500
X-Greylist: delayed 7545 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Dec 2020 19:46:55 EST
Received: from pps.filterd (m0209323.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BJMeGJ1001921;
        Sat, 19 Dec 2020 22:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=f0Btc864+5wyftM4Wtvz3ulzFxbDrJCG5+9PT9acLFc=;
 b=CCsxorMs3PGXXcSjkAAZ9tjMj1cBuPRTwAHalUtLdW01TKPdqz3uZ/sPfub/CBgUPkoL
 blDWViwb0ADTnrXjl2Xy2DJmILBj04ZNshIazkmLpfuKJ1Eqyx2KbM8d5jhHTpHq5tBl
 BzKbF1+Yzyah93BY7wU3i7npo63mUtYxzoFOz0vQd1xm/l97Xw9FJPZTcjyNPuFVGW/Z
 l4vAXfUAD1YI6/zEspAopVVACb0ocxrZu22SYO+KSLE2ztYeXvdyh2F5x7XPjejMdX9w
 cUJUu8/R6vV4yoEFnFYoYEkSua2CJpEIgww21Z+fAnQrBG2AZ2jDoMbWh+D55XdvYpoT 3g== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
        by mx08-001d1705.pphosted.com with ESMTP id 35h8v10r0u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 19 Dec 2020 22:40:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/b5rSqRNqMjlKKFepgHtQZfmSt0z1lHuFk4uM9OQa5mHk58WUvdIM0dZrXVLFCZGBC3KPaxwbnF9OdMFMBvpm2U2XI+3VAetoS/6UN4wspP2vt3Ww1tukuMRotO1tpWu47rGaQcwQ/YBmeTkFRjbi49UAyEhfOTj7qI753DaKQ1MR/NVRne4DaQ9ZernRS77jyxQM9D2XekIQ0oZeicm1oxX4FdaDYFpag6sa23yjoYjTi/050A/xKuSvbzLF+3NhJm2pKBWCOMycm0QakAas4QrLnQp6Wq47w6azpaLt/t3t4n3pf/sNl9AdXzRyOScbymrgxFEXyHJ5ebvKnruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0Btc864+5wyftM4Wtvz3ulzFxbDrJCG5+9PT9acLFc=;
 b=VpymNV8YKNwoW7ZbgyVB7oOeWdkzcp4rfhos//FdnVv670xl3QJbwwEkJmXpukoWQEe33Ejv2E4297xdS0oEYbA9F1rhSC/ZArUNvheZutRORm2IAn71lLUG7mg9t3lET/lyqvPiW6baZUcbiYwFUB0zoRh7HVJijA2wM5PrqFG+72lht52UF8SQXiIpcC5bktv99JV51Uwou2Xdr90xPwU5zwpXZiPLAzCGF5pI+OSnRIulTtPg2EPwjhfn+esiq/btomVG31ue2bXGQGceKRrxdMElYWw4dvrDLcI+mhMieDR6wHGB+iShY+mL38FvZa1Av0dvXM9IuI8w9hEmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from BY5PR13MB3826.namprd13.prod.outlook.com (2603:10b6:a03:22d::24)
 by BY5PR13MB3016.namprd13.prod.outlook.com (2603:10b6:a03:186::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.19; Sat, 19 Dec
 2020 22:39:08 +0000
Received: from BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::112:f1ee:38fe:9be3]) by BY5PR13MB3826.namprd13.prod.outlook.com
 ([fe80::112:f1ee:38fe:9be3%5]) with mapi id 15.20.3700.019; Sat, 19 Dec 2020
 22:39:07 +0000
From:   <Roderick.Colenbrander@sony.com>
To:     <hadess@hadess.net>, <roderick@gaikai.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <lzye@google.com>
Subject: Re: [PATCH 00/13] HID: new driver for PS5 'DualSense' controller
Thread-Topic: [PATCH 00/13] HID: new driver for PS5 'DualSense' controller
Thread-Index: AQHW1c+Cr8M1s8uPZEaYzv150xrOjqn+GPKAgADfEPA=
Date:   Sat, 19 Dec 2020 22:39:07 +0000
Message-ID: <BY5PR13MB382659A203291542D7E469EB98C20@BY5PR13MB3826.namprd13.prod.outlook.com>
References: <20201219062336.72568-1-roderick@gaikai.com>,<780add5d3010039df5a8f639ca47816b39af7304.camel@hadess.net>
In-Reply-To: <780add5d3010039df5a8f639ca47816b39af7304.camel@hadess.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hadess.net; dkim=none (message not signed)
 header.d=none;hadess.net; dmarc=none action=none header.from=sony.com;
x-originating-ip: [76.87.77.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bb5c799a-a0f3-4a4e-a5ed-08d8a46ee5ad
x-ms-traffictypediagnostic: BY5PR13MB3016:
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-microsoft-antispam-prvs: <BY5PR13MB30161A6CAD5CE86BA823D29B98C20@BY5PR13MB3016.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f2qyVB7VP1mwz86rZMKeL/cBNOXKFK3T6J5mLxdFSd3ec+YYtzUG9nJwO/xAR5g5PIOvyTmWu1hXXacBU26c3+O6YDObUjwNxDwjQ5rqMLJupVjToz78ZIba7crFwmdxLoNJ2ZthVQMqMKzvdeWgY5jwkz3WYp36yDIiay3IW7Cue756RrA7mh+VVeH4+KRpsplFsgZOhbpso6kf0VXw9Q5NGAr9zQx6c7UosAuJr72JwlLZ+8rqB/ki5FYcu8Il8eXMIPWPazKePk7tO0TcaAuG3oq45LMXVPhu4IqQQNHPdjwFK0pqThKhZTRNOi7W8tiks6vj7ySjD9ieea1n/GjSdHyNGH1AnFY9Os+zIxxH5FT9n1p6MXCC+99FHwYP3odRbZ/qzxVVa8PkovURlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR13MB3826.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(66476007)(4326008)(66556008)(55016002)(53546011)(66946007)(9686003)(66446008)(316002)(6506007)(4001150100001)(54906003)(76116006)(110136005)(64756008)(33656002)(7696005)(8936002)(478600001)(2906002)(186003)(86362001)(52536014)(71200400001)(45080400002)(83380400001)(5660300002)(8676002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?yNLln6qI53T8V0+Mno3kBDTEw/wqeqL7r/n1yZbuZy0dCS3hX8TkYMnkjq?=
 =?iso-8859-1?Q?NTJYEBC+vmdDkpm0G+1PYiONFZTaVOGk6nglJOLVZdgdHahnzcfiK74F7K?=
 =?iso-8859-1?Q?g7Hybn5cNDk3+uLcFZRizqyps2wY2oZUkOJaGlTW2tp/7ivkRJYTmIxF/B?=
 =?iso-8859-1?Q?luk/ejYYNXbuK/zBRGDSusTQgFIuZLMIk2O0iI8UDI4czH76UTQFp0esDa?=
 =?iso-8859-1?Q?BVzvAFlgU11dVtw02MxIVcTffLEqG94OUBjpfMa7Ouxapgzb0D+BKK7/Ru?=
 =?iso-8859-1?Q?AsOS5mVMzyZGLRNgiF+r0cr2zLKCq/SVjVU3SGJvyuYGvcPDHMOPkzy1Lf?=
 =?iso-8859-1?Q?I/+30T1gyIlzhKkjYna+5feN91vxbSDX6R03dwRX28gfj4PuOrkdnPmb1d?=
 =?iso-8859-1?Q?C1x+VgP95o4rtdvQZwyBSCLDklzLYmWCgHJbcWSeRIWkbOQdTGqhLx1vGR?=
 =?iso-8859-1?Q?kkWUVdIjzrE8FoAwoHIaf+BYGHYqwg+V5kvEsNFIFFOYeV9calJYvGEqUg?=
 =?iso-8859-1?Q?puXHLHL6qfbki7ery0bEuxEWR4aCxf4cdQSzRu8DdqykWmtFj62Tk2ljge?=
 =?iso-8859-1?Q?PnSwkxAamDx8pfVcLdATeFk10YdcJ5asigNFOSkygykyPG6J2rsYS+T9u/?=
 =?iso-8859-1?Q?oJQUo94d4m0xi8Ip1S3dk0e90XQa2p/SZ3TEo1RXdJO0nQtjiw+Xh9lySD?=
 =?iso-8859-1?Q?wl79JcqBUwF+fSL6WfFuBuHmzXkomWSTLW2hbBWby6XEnw2UvRQs4UnYm8?=
 =?iso-8859-1?Q?t0sF3TNE9WJQbOhJ6OxqmidQMc+O1taH3ohwLlQ9lp6ErYMq57jfFLkZpI?=
 =?iso-8859-1?Q?1eedhqATxAZ92bRtqHkTm2LYhGj6tZJkBO+uJXwioqbHO+KWBpfTP4Fiji?=
 =?iso-8859-1?Q?5N0cQCsrxcZLK/otZPW7YdkAYsQsuvMCJwaLlcl38t55+w4MFGLcOWd6Nt?=
 =?iso-8859-1?Q?mWVziAIEHFLgagGyS0zZNtG72ZHeL1JwYXnwLZzl5WxSC0kUN2X0ClznOu?=
 =?iso-8859-1?Q?5ReDkG27nhv4O1EvI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB3826.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5c799a-a0f3-4a4e-a5ed-08d8a46ee5ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2020 22:39:07.8660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7pxclHIrYp998XxQ1aGffWSX+aQsyqoA5klqD/7TOJUqunaCcRIStq0QAUJ51I0+8y3pqhsX5qo262CU9ncq6HvK8RPlqbxn6I3y9gQsbdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3016
X-Sony-Outbound-GUID: jzX7VKzuHTgiwYknr_0PkVd2Li_D6rSO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-19_15:2020-12-19,2020-12-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012190170
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Bastian,=0A=
=0A=
> From: Bastien Nocera <hadess@hadess.net>=0A=
> Sent: Saturday, December 19, 2020 12:38 AM=0A=
> To: roderick@gaikai.com <roderick@gaikai.com>; Jiri Kosina <jikos@kernel.=
org>; Benjamin Tissoires <benjamin.tissoires@redhat.com>=0A=
> Cc: linux-input@vger.kernel.org <linux-input@vger.kernel.org>; Chris Ye <=
lzye@google.com>; Colenbrander, Roderick <Roderick.Colenbrander@sony.com>=
=0A=
> Subject: Re: [PATCH 00/13] HID: new driver for PS5 'DualSense' controller=
 =0A=
> =A0=0A=
> Hey Roderick,=0A=
> =0A=
> On Fri, 2020-12-18 at 22:23 -0800, Roderick Colenbrander wrote:=0A=
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>=0A=
> > =0A=
> > Hi,=0A=
> > =0A=
> > I am pleased to share a new Linux driver for the PlayStation 5=0A=
> > 'DualSense'=0A=
> > game controller. The driver supports the DualSense in both Bluetooth=0A=
> > and USB modes. Most controller features are supported including LEDs,=
=0A=
> > Touchpad, Motion Sensors and Rumble.=0A=
=0A=
> Excellent, this is a nice early holiday present :)=0A=
> I've just received a DualSense controller so I'll try to test this in=0A=
> the coming days.=0A=
=0A=
> > DualSense supported is implemented in a new 'hid-playstation' driver,=
=0A=
=0A=
> "hid-sony-playstation"? Not sure how much the input/hid tree=0A=
> maintainers will want to force this, but the same problem is going to=0A=
> show up for the hid-based XBox controller driver (hid-xbox, or hid-=0A=
> microsoft-xbox?) as hid-microsoft is as busy as hid-sony.=0A=
=0A=
I had some offline conversation prior with Jiri and Benjamin. I wanted to a=
void keeping PlayStation devices in hid-sony as Sony is a large group of co=
mpanies and as 'PlayStation' we don't have any authority over those devices=
. When discussing we felt that hid-playstation was the best name. Technical=
ly the PlayStation company is "Sony Interactive Entertainment", but a a "hi=
d-sie" wouldn't see any name recognition.=0A=
=0A=
Other crowded drivers at some point could use a split as well as having too=
 many devices in there can be a problem. Not just for maintenance, but also=
 for device integration (e.g. phones, TVs,..), though not a main worry for =
the open kernel. Just for context in such embedded devices you may only wan=
t to pull in the 'game controller' driver and not the full weight of a hid-=
microsoft or a hid-sony. In case of hid-sony for example there is support f=
or TV remotes as well, which cause collisions with whatever proprietary use=
r/kernel mode TV remote support the device already used.=0A=
=0A=
> > which=0A=
> > will be used for peripherals by 'Sony Interactive Entertainment'=0A=
> > (PlayStation).=0A=
> > Hid-sony will be used for devices for the larger Sony Group. We=0A=
> > intend to=0A=
> > migrate existing devices over time gradually to hid-playstation. We=0A=
> > do not=0A=
> > want to cause any regressions and maintain quality. As such moving=0A=
> > forward,=0A=
> > unit tests are important and we started by providing these through=0A=
> > 'hid-tools'=0A=
> including DualSense.=0A=
=0A=
> I know it's not your job to handle those, but be careful with not=0A=
> breaking the clone controllers. Plenty of folks use them, for better or=
=0A=
> for worse.=0A=
=0A=
Support for DualShock 4 is easy to migrate, but I'm really, really nervous =
about the DualShock 3 generation with many buggy clones. Some of it is due =
to broken HID reports (even though the practical reports must use the same =
byte layout as the DualShock 3). Not using the HID parser and parsing raw r=
eports directly may mitigate some of that (the HID report is fully with ven=
dor specific stuff anyway). But yeah it is a pain and I don't know if I wan=
t to dare trying DualShock 3... but will see where that goes. Normally it i=
s tricky for us to support clone devices, but if this migration happened we=
 would have to pay attention to it and perhaps get these devices on Ebay.=
=0A=
=0A=
> > =0A=
> > The Linux driver exposes DualSense functionality as a 'compositive=0A=
> > device'=0A=
> > similar to DualShock 4 in hid-sony, spanning multiple frameworks.=0A=
> > First,=0A=
> > it exposes 3 evdev nodes for respectively the 'gamepad', 'touchpad'=0A=
> > and=0A=
> > 'motion sensors'. The FF framework is used to provide basic rumble=0A=
> > features.=0A=
> > The leds-class is used to implement the Player indicator LEDs below=0A=
> > the=0A=
> > DualSense's touchpad, while the new 'leds-class-multicolor' is used=0A=
> > for=0A=
> > the lightbars next to the touchpad.=0A=
> > =0A=
> > Not yet supported are new unique features introduced by the DualSense=
=0A=
> > such as Adaptive Triggers and the VCM based Haptics. These features=0A=
> > require=0A=
> > a large amount of data and complex data structures. It is not clear=0A=
> > how to=0A=
> > expose these. The current Evdev and FF frameworks are too limiting.=0A=
> > We hope=0A=
> > to have a dialog on how to expose these over time in a generic way.=0A=
> > =0A=
> > Enjoy the new DualSense driver and let us know if you have any=0A=
> > questions=0A=
> > or feedback.=0A=
=0A=
> Is the audio jack on the controller already supported, or would that be=
=0A=
> part of the features that aren't supported yet?=0A=
=0A=
The answer is yes and no. In case of USB, there is some level of audio supp=
ort, though I am not yet sure if I like it.=0A=
=0A=
Basically the VCM haptics, microphone and speaker appears as a USB audio de=
vice. It means they kind of work. Though some of the audio control features=
 are HID managed, so they are not there (I haven't seen what audio controls=
 are native exposed through USB). I don't know if the headphone jack curren=
tly works or if that needs some MUXing logic through HID.=0A=
=0A=
Bluetooth is not supported at all. It is some custom protocol over HID of w=
hich I don't know the details.=0A=
=0A=
Provided we can contribute such support in the future, it is beyond complic=
ated. Just in the 'simple' USB audio case, some interop might be needed wit=
h the USB audio drivers for e.g. audio controls. Also the new VCM haptics s=
eem to be reported as audio channels on this device as well. Should haptics=
 really be audio? Or some new interface (a hypothetical EV_FF2)?=0A=
=0A=
> Do you think you might be able to share the information regarding how=0A=
> the cable pairing is done, so we can add this support to bluez? I'm=0A=
> fine with only sharing the implementation if you prefer to give me the=0A=
> details privately (or through my employer).=0A=
=0A=
> Cheers=0A=
=0A=
Thanks,=0A=
Roderick=
