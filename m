Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E0614648D
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 10:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAWJZy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 04:25:54 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:33486 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726099AbgAWJZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 04:25:54 -0500
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 483H272lQNz48B
        for <linux-input@vger.kernel.org>; Thu, 23 Jan 2020 10:25:51 +0100 (CET)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
        by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 483H260NSlz4f3lx0;
        Thu, 23 Jan 2020 10:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key2-intmail; t=1579771550;
        bh=GCmGtf90jaIxo1b6Wx/2s1cWGKuhrQooCKYDhGX2R38=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=L+mgSVPR8xFiHbiF+8zdHiWT7bfk1B8qWU3nuN2E1IAXB/dGhi3plI70WylXItfeE
         f47vOwtYH7wmbMzPa2XLs67XSG5eUaLARqOiwo5g/lTvsOuYhf+r5GDeuapZsPbNMo
         9FstwSr9nkqdq0F4dFKGg6gl0u9Ro3YZpuR/k9lE=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
        by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 483H2600RJz6Ps;
        Thu, 23 Jan 2020 10:25:49 +0100 (CET)
X-AuditID: 0a3aad12-e55ff700000045d7-c0-5e29669d3544
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id 1A.1A.17879.D96692E5; Thu, 23 Jan 2020 10:25:49 +0100 (CET)
Received: from FE-MBX2049.de.bosch.com (fe-mbx2049.de.bosch.com [10.3.231.59])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 483H255LH2zB0v;
        Thu, 23 Jan 2020 10:25:49 +0100 (CET)
Received: from FE-MBX2049.de.bosch.com (10.3.231.59) by
 FE-MBX2049.de.bosch.com (10.3.231.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Thu, 23 Jan 2020 10:25:49 +0100
Received: from FE-MBX2049.de.bosch.com ([fe80::5a:9ae6:ade4:e95c]) by
 FE-MBX2049.de.bosch.com ([fe80::5a:9ae6:ade4:e95c%6]) with mapi id
 15.01.1847.005; Thu, 23 Jan 2020 10:25:49 +0100
From:   "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC:     =?iso-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Benjamin Tissoires" <benjamin.tissoires@gmail.com>
Subject: RE: [RFC] linux-input alps - loosing precision
Thread-Topic: [RFC] linux-input alps - loosing precision
Thread-Index: AQHVzRpj/Q0ya5wZcUiddTbqrWAn0af1mjWAgAAh4wCAABjcgIABxMOAgABezCA=
Date:   Thu, 23 Jan 2020 09:25:49 +0000
Message-ID: <03fd616f969247d8afaa79d6f26a5c7e@de.bosch.com>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
 <20200117094206.xu47p6ybxmsf5ne2@pali> <20200121213441.GO47797@dtor-ws>
 <20200121233558.GA399961@jelly> <20200122010457.GA110084@dtor-ws>
 <20200123040527.GA408658@jelly>
In-Reply-To: <20200123040527.GA408658@jelly>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.42.180.11]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA22TbUxbZRTHee69bZ9WLrmUVY64TtNEzBhDxlCrGJ1GE+Ib6hJNzMSVcWkb
        +kJ628GIycrCNkcz2WAbpQtlgHOLm5OB26AycBVmAaFfBgOG6KAyYIgOxiRxM97LhbUf/HJz
        cv7/3znnOc9zMak8gxOw0WJnbRadSSNVUIoXv1FvrMlbn506WJ6mvdt+HWl/rJ9C2uH5exLt
        4d5/CO2RxquyLZLMVs8vssyFpnWZF3vmpO+RHyteymVNxp2s7ZmXtysMN8b6UEFdWpH7Xj/p
        RC2JZUiOgUmHSveQTIiVTBUB9+eIMqTgYx+Cq3vcpCj8gWBif6EotCHwNPTyBMZS5lWo7UoS
        PGsYA9SWdJOCh2TOIfj8QhUShDjmeTg/USsTTVo4fmdeKsbvwlzHD8seinkKnBVTUqEmzWRA
        5eHNYq/bCKp9AxLBI2eS4bvWX5dZxKihsTG4PBzJxMNIqJYQT8PAl21iHhgVTE/8KxHjJ6Hz
        r3JC9KfA0NEjUjHeAF/V3V7200wsdFeHqEMo3hNR1hOBeCIQTwRyAlFfIxVnTN1pTn8uPS3F
        lsNyxambUnZYzU1IvD9lCzo/mOdHBEZ+9CwmNCpa+8b6bGVMjjV3l0HHGT61OUwsp0mgd88e
        +EQZ9zDNOXLMRo4zWi1+BJjUrKHRhzxH5+p2FbM2q4j50eOY0sTTepy1TcnodXY2n2ULWNuq
        moGxBuiOXB6MtbF6tijPaLKvyho1jaKiopSPRiqRbQks96PNOJrvjVmhN1egM3NG/Qr+mIgr
        V7NhtAdl4UPTNfUkvtLl5b/NNSfrSSVlsVrYhHh6q1CLESiDw/JwmoS19Mz+xGylKkIIV5xB
        wwgjTRx9S4Cj+Z8kPAfQTmF1sSvJMJR2kmeY2XXg7qxDMPTzJf5xzg8g8LaPIlgIlBDQ4Zoj
        YObPuwScGykjYSnkIuGM8ywJgaEqCkYf9FNw+s40BRevtUjgQEWJDMYq98ig+kSLDFr9SzJw
        VfyEYXGkH0OoZBTD996DcphdaJbD0mC3HKbGgnJwN1xSQIXrNwU0t7segc6m8mgY/tsXDUsD
        PTQsnX1Az/BLJvglFyYnCku26+z/s+SVbPh0CU6kXrjfu/H9jFNPXE46/vTe0uDi3sxg/lv5
        MduvfDb45vjQeBE1c2qrbzylcLf5uuSVxbaQ9Fqd11y57yNfMa0pjRu7kDzxwbbJWXVXw+m1
        G251L/S9kHFwX9/kzd+3mG4k16neyY4JNvTueO2Lt18PeI/GBPSerNLJyyjl21p8zBG46XVo
        KM6g25RE2jjdf4dNLzK+BAAA
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> From: Peter Hutterer <peter.hutterer@who-t.net>
> Sent: Donnerstag, 23. Januar 2020 05:05
>=20
> On Tue, Jan 21, 2020 at 05:04:57PM -0800, dmitry.torokhov@gmail.com
> wrote:
> > On Wed, Jan 22, 2020 at 09:35:58AM +1000, Peter Hutterer wrote:
> > > On Tue, Jan 21, 2020 at 01:34:41PM -0800, dmitry.torokhov@gmail.com
> wrote:
> > > > Hi Pali,
> > > >
> > > > On Fri, Jan 17, 2020 at 10:42:06AM +0100, Pali Roh=E1r wrote:
> > > > > On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1)
> wrote:
> > > > > > Hello,
> > > > > >
> > > > > > At the file
> > > > > > https://github.com/torvalds/linux/blob/master/drivers/input/mo
> > > > > > use/alps.c I've seen that values coming from the
> > > > > > trackpoint/trackstick are divided at some devices, which result=
s in a
> loss of precision.
> > > > > >
> > > > > > As I was not lucky with the behavior of the trackpoint of my
> > > > > > computer I've made a fork of libinput
> > > > > > https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> > > > > > where I changed  src/filter-trackpoint.c . With this change, th=
e
> values from lib evdev are multiplied by a factor (dpToFac_au16 []). The a=
rray
> element used from dpToFac_au16 [] is also the value received by evdev.
> > > > > >
> > > > > > At higher forces I use a factor much higher than 1, so the undi=
vided
> value from the device would be the best for me.
> > > > > >
> > > > > > In order not to change the behavior for other users, it might b=
e
> possible to change the divider at runtime via the sys- file system - like=
 it is at
> trackpoint.c and take the currently used divider as default value.
> > > > > >
> > > > > > Positions at source code were I see the division:
> > > > > >
> > > > > > alps_process_trackstick_packet_v3()
> > > > > > /*
> > > > > > * The x and y values tend to be quite large, and when used
> > > > > > * alone the trackstick is difficult to use. Scale them down
> > > > > > * to compensate.
> > > > > > */
> > > > > > x /=3D 8;
> > > > > > y /=3D 8;
> > > > > >
> > > > > > alps_process_packet_v6()
> > > > > > /* Divide 4 since trackpoint's speed is too fast */
> > > > > > input_report_rel(dev2, REL_X, (char)x / 4);
> > > > > > input_report_rel(dev2, REL_Y, -((char)y / 4));
> > > > >
> > > > > Hello Dmitry!
> > > > >
> > > > > This problem is about fact that alps.c for some ALPS devices
> > > > > already truncate precision of trackpoint movement.
> > > > >
> > > > > Tobias is unhappy with this fact and would like to get all bits
> > > > > of movement information, not just some high.
> > > > >
> > > > > But existing userspace application expects that for these
> > > > > devices kernel already truncate precision and process truncated d=
ata
> from kernel.
> > > > >
> > > > > Now question is: Are we able to send to userspace input data
> > > > > without doing truncation and without breaking existing applicatio=
ns?
> > > > >
> > > > > It looks like that for such thing we need some userspace <-->
> > > > > kernel API which disable truncating of precision.
> > > > >
> > > > > Have you been solving similar issue for other other drivers or
> > > > > in other area of input code?
> > > >
> > > > Unfortunately I do not think we can automatically "recover" the
> > > > lost precision without help of libinput, which would need to tweak
> > > > the trackpoint [sysfs] property letting kernel know that it should
> > > > send original data.
> > >
> > > Right, so the problem here is simply: we don't have write access to
> > > sysfs and most of libinput's users don't either. For evdev devices
> > > it's fine thanks to logind but that won't apply for anything else.
> > > Which means that sysfs is no-go unless you want to shell-script your =
way
> around it.
> >
> > I wonder if we can do this via udev rule that [newer] libinput package
> > would install? I do not think we need to support multiple input stacks
> > on the same system at the same time, so system-wide config could work..=
.
>=20
> good point and yes, that would work. and we already do something similar
> with the fuzz handling anyway. reading sysfs is usually not an issue and =
worst
> case we can set a udev property to get around that.
>=20

From a maintainability point of view (and also in terms of runtime), it may=
 be best to just remove the divider. In this case, users need to make the a=
daption, but they could do so, if desired, with respect to the Linux kernel=
 version.

In case of libinput I think this could be done through the device quirks. h=
ttps://wayland.freedesktop.org/libinput/doc/latest/device-quirks.html

Thanks,
Tobias

> >
> > >
> > > It's been a while since I looked at the trackpoint code but from
> > > what I remember it's a historical mess of inter-dependencies. The
> > > kernel driver did something, then userspace adjusted based on that,
> > > then the kernel driver couldn't fix anything because of userspace, an=
d
> that looped 3-4 times.
> > >
> > > libinput has the magic trackpoint multiplier quirk to work around
> > > this deadlock but multiplying doesn't give you precision back. As an
> > > immediate brain fart, maybe we need a "subpixel" REL_X_FRACTION
> axis?
> > > Not ideal, since every relative device other than trackpoints just
> > > pass on device units and rely on userspace to make sense of it, so
> > > the trackpoints will likely stay the only users of it.
> > >
> > > Alternatively - add the sysfs file, make libinput read it and adjust
> > > its behaviour and then eventually toggle the default. Less breakage
> > > that way but now you're talking about a multi-year inertia. And you
> > > rely on userspace updating with the kernel.
> > >
> > > Or introduce a resolution field for the EV_REL scope. Not sure how
> > > to do that either and let's be honest, it wouldn't really be set by
> > > the kernel for most devices anyway because it doesn't scale well
> > > (would've come in useful for the various dpi settings on mice though)=
.
> > >
> > > That's all I can think of right now. For any solution - the libinput
> > > bits are the easy ones, it's the inertia and possible other input
> > > stacks that are the killer here.
> >
> > Yeah, none of the above options with new resolution, or event code
> > appeal to me too much.
> >
> > Thanks.
> >
> > --
> > Dmitry
