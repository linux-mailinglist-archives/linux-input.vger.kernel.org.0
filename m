Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0282A0419
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 12:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgJ3L2W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 07:28:22 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:12694 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgJ3L2S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 07:28:18 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20201030112814epoutp0108a4adc360d25c623cd43359da037ac3~CwZxfZIBw0260202602epoutp01A
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 11:28:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20201030112814epoutp0108a4adc360d25c623cd43359da037ac3~CwZxfZIBw0260202602epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604057294;
        bh=il0/K9QehEL2XKwBps/MSEKj9sOYbUPU6Al3545uJwQ=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=fX/JPAMWSzdwz5dLIV9uXfrvUntOZTkmGeuuuMekOyltL2FxYCK0VqFxCAGKqYJHb
         USb30wJ5SIj5xrOnv/WCUkSjB2U2rtdqs/8xxhN3u0A94Z9pUCT1EdAfzf637ckjh3
         uYo03+U3hHwk30jjurJIbn9rOEy6qmMFcmdoYItU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201030112814epcas1p4c42423678e23fac6429339468fe146fe~CwZxGfT2h1187111871epcas1p4K;
        Fri, 30 Oct 2020 11:28:14 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.160]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4CN0Rd01mfzMqYkZ; Fri, 30 Oct
        2020 11:28:13 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-eb-5f9bf8cc5bfe
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        42.C3.63458.CC8FB9F5; Fri, 30 Oct 2020 20:28:12 +0900 (KST)
Mime-Version: 1.0
Subject: Re: (3) [PATCH v2] input: add 2 kind of switch
Reply-To: jryu.kim@samsung.com
Sender: Jungrae Kim <jryu.kim@samsung.com>
From:   Jungrae Kim <jryu.kim@samsung.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        HyungJae Im <hj2.im@samsung.com>
CC:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20201030104628.GB2395528@kroah.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
Date:   Fri, 30 Oct 2020 20:28:12 +0900
X-CMS-MailID: 20201030112812epcms1p7d031bb4949b319135e48dfac9409743b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTV/fMj9nxBnc2Wlo0L17PZrFgup3F
        4W0TmCxufvrGanF51xw2i7stnawWJ75NY3Jg9/i86hWrx51re9g89s9dw+7Rt2UVo8fnTXIB
        rFE5NhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCgwNCvSKE3OLS/PS9ZLzc60MDQyMTIEq
        E3IyvkzexlhwQ6rifatzA2OPZBcjJ4eEgInEuXU3mbsYuTiEBHYwSnyduIK1i5GDg1dAUOLv
        DmGQGmEBc4lj0w4zgdhCAnISC+ecYoSIa0ns2zuZHcRmE9CQ+LryLAuILSKQKLFh+iw2EJtZ
        YB6TxLe1thC7eCVmtD9lgbClJbYv3wo2h1PAUGJh0zyouKjEzdVv2WHs98fmM0LYIhKt984y
        Q9iCEg9+7mYEORNkzufpOSDnSwj0M0p0fDzEDOH0MEq8az7DBtGgL3GlfybYA7wCvhLTJy1l
        BbFZBFQl3m36xQRR4yKxqnEjO8TR2hLLFr5mBlnALKApsX6XPkSJosTO33MZIUr4JN597WGF
        +WvHvCdQY5QktnYthrIlJB5NvQT1i4fE2uZ37JBwXs4k8XTzC9YJjAqzEEE9C8nmWQibFzAy
        r2IUSy0ozk1PLTYsMEKO3E2M4BSpZbaDcdLbD3qHGJk4GA8xSnAwK4nw/j87O16INyWxsiq1
        KD++qDQntfgQoynQzxOZpUST84FJOq8k3tDUyNjY2MLEzNzM1FhJnPePdke8kEB6Yklqdmpq
        QWoRTB8TB6dUAxOnQKLcKZ1P+W4si+SF+Cd3yB8/u2tu6M7gJ7u0itgjznN8udfW+jTceN+3
        2ylPnwi94DSV7Zvdslb5fHnk2zrDxEsZH/IrtbOE+9f9eCYc9ex83oKayhlFIXtU6kM7Ohs/
        cv10k4qw2BGwnuOtzoVvYfpzBNt6HdSOnF2yNXMe0+sJAZXS/rIs+2+E8k9JZJjykrn2nkGW
        d/ca9XMr+LQzQgO5f393b/++X3wOw8HOr9ySmcJ8XyxPXvHeeqOUz/Mdz9KsDXs6W3/wLbx5
        tcP6h0pxsMGPu0o+SbOOfdvesM3WOXbPSf1o3cddC/M+n/u+/9sB9f6Dliln+MJeW0Wb6dxe
        476U5+KjBXw2x5VYijMSDbWYi4oTAZN+XK4aBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <20201030104628.GB2395528@kroah.com>
        <20201029135715.GB3470996@kroah.com>
        <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
        <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
        <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p7>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Fri, Oct 30, 2020 at 01:39:16PM +0900, HyungJae Im wrote:
> > Hello, This is Hyungjae Im from Samsung Electronics.
> > Let me answer your questions inline.
> >=20
> > >On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> > >> From: =22hj2.im=22 <hj2.im=40samsung.com>
> > >> Date: Thu, 29 Oct 2020 22:11:24 +0900
> > >> Subject: =5BPATCH v2=5D input: add 2 kind of switch
> > >=20
> > >Why is this in the body of that patch?
> >=20
> > I read =22how to send your first kernel patch=22, but still making so m=
any mistakes.
> > I will be cautious with this.
> >=C2=A0=20=0D=0A>=20>=20>>=20=0D=0A>=20>=20>>=20We=20need=20support=20to=
=20various=20accessories=20on=20the=20device,=0D=0A>=20>=20>>=20some=20swit=
ch=20does=20not=20exist=20in=20switch=20list.=0D=0A>=20>=20>>=20So=20added=
=20switch=20for=20the=20following=20purpose.=0D=0A>=20>=20>>=20=0D=0A>=20>=
=20>>=20SW_COVER_ATTACHED=20is=20for=20the=20checking=20the=20cover=0D=0A>=
=20>=20>>=20attached=20or=20not=20on=20the=20device.=20SW_EXT_PEN_ATTACHED=
=20is=20for=20the=0D=0A>=20>=20>>=20checking=20the=20external=20pen=20attac=
hed=20or=20not=20on=20the=20device=0D=0A>=20>=20>=20=0D=0A>=20>=20>You=20di=
dn't=20answer=20the=20previous=20question=20as=20to=20why=20the=20existing=
=20values=20do=0D=0A>=20>=20>not=20work=20for=20you=20instead=20of=20having=
=20to=20create=20new=20ones?=0D=0A>=20>=20=0D=0A>=20>=C2=A0=20I=20think=20I=
=20should=20clarify=20this=20part=20the=20most=20for=20this=20review.=0D=0A=
>=20>=C2=A0=20As=20you=20know,=20new=20added=20events=20both=20has=20simila=
r=20existing=20events,=0D=0A>=20>=C2=A0=20but=20it=20has=20to=20operate=20s=
eparately.=0D=0A>=20>=20=0D=0A>=20>=C2=A0=20First,=20SW_COVER_ATTACHED=20is=
=20similar=20with=20SW_MACHINE_COVER.=0D=0A>=20>=C2=A0=20We=20need=20two=20=
events=20for=20our=20cover=20interaction.=0D=0A>=20>=C2=A0=20One=20is=20to=
=20detect=20if=20flip=20cover=20is=20open/closed(covers=20screen=20or=20not=
),=0D=0A>=20>=C2=A0=20and=20one=20is=20for=20detecting=20if=20cover=20is=20=
attached(detect=20if=20device=20is=20put=20into=20cover).=0D=0A>=20>=C2=A0=
=20With=20the=20second=20event,=20we=20send=20event=20for=20attachment=20an=
d=20start=20authentication=0D=0A>=20>=C2=A0=20distinguishing=20if=20it=20wa=
s=20Samsung=20made=20cover.=0D=0A>=20>=20=0D=0A>=20>=C2=A0=20Second,=20SW_E=
XT_PEN_ATTACHED=20detects=20if=20pen=20is=20attached=20externally=20on=20ta=
blet=20models.=0D=0A>=20>=C2=A0=20It=20is=20different=20with=20SW_PEN_INSER=
TED=20since=20this=20is=20detecting=20pens=20like=20our=20NOTE=20series.=0D=
=0A>=20>=C2=A0=20SW_EXT_PEN_ATTACHED=20has=20an=20unique=20role=20to=20set=
=20wacom=20tuning=20table=20differently=0D=0A>=20>=C2=A0=20while=20pen=20is=
=20attached/detached.=0D=0A>=C2=A0=20=0D=0A>=20All=20of=20that=20needs=20to=
=20go=20in=20the=20changelog=20text=20for=20the=20individual=20patches=0D=
=0A>=20when=20you=20submit=20them.=0D=0A>=C2=A0=20=0D=0A>=20But=20as=20Dmit=
ry=20pointed=20out,=20it=20doesn't=20look=20like=20either=20of=20these=20dr=
ivers=0D=0A>=20are=20needed=20at=20all,=20just=20use=20the=20gpio-keys=20dr=
iver=20instead.=0D=0A>=C2=A0=20=0D=0A>=20thanks,=0D=0A>=C2=A0=20=0D=0A>=20g=
reg=20k-h=0D=0A=C2=A0=0D=0ACan=20you=20accept=20V1=20patch?=20or=20need=20t=
o=20add=20a=20change=20of=20device=20tree?=0D=0APlease=20let=20me=20know=20=
what=20do=20I=20do=20now.=C2=A0
