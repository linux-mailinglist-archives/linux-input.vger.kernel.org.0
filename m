Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FE32A04DE
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 12:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgJ3L70 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 07:59:26 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:43940 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgJ3L7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 07:59:25 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201030115921epoutp045996fa2c1b6c72ab0d2de9313ae2df89~Cw08diEl72718827188epoutp04f
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 11:59:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201030115921epoutp045996fa2c1b6c72ab0d2de9313ae2df89~Cw08diEl72718827188epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604059161;
        bh=1wvbqTBrPLfTYh6JtjHwDqZiotPEWlqyQeKGGtwn83U=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=BkW7kqw1meVWePJsZQGKLE0ridci5TkCymRGBqZQGXLsyuZJK643f7WqE3Z1njlqk
         hrSP4Qhrb3fkdgz3/ERizHtm8m/toS33f6Oonn7umF4r3qr2IDanHgvXYuQLvt9M0+
         hC9uCGWaJdqdg9AXMa6qpZfny6CrJLdCopUg/4Vw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201030115920epcas1p29d1e484a762015ef583ae9f9066ecc19~Cw07Eqtrm1284112841epcas1p2b;
        Fri, 30 Oct 2020 11:59:20 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.164]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CN17W3MK2zMqYkV; Fri, 30 Oct
        2020 11:59:19 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-bd-5f9c00160dc1
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        53.DC.09577.6100C9F5; Fri, 30 Oct 2020 20:59:18 +0900 (KST)
Mime-Version: 1.0
Subject: RE: Re: (3) [PATCH v2] input: add 2 kind of switch
Reply-To: jryu.kim@samsung.com
Sender: Jungrae Kim <jryu.kim@samsung.com>
From:   Jungrae Kim <jryu.kim@samsung.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jungrae Kim <jryu.kim@samsung.com>
CC:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20201030114142.GA2409436@kroah.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb@epcms1p4>
Date:   Fri, 30 Oct 2020 20:59:18 +0900
X-CMS-MailID: 20201030115918epcms1p4aaae97a4549a1b3e505709fed3d91ecb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTQFeMYU68Qct/KYvmxevZLBZMt7M4
        vG0Ck8XNT99YLS7vmsNmcbelk9XixLdpTA7sHp9XvWL1uHNtD5vH/rlr2D36tqxi9Pi8SS6A
        NSrHJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoCiWF
        ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgaFBgV5xYm5xaV66XnJ+rpWhgYGRKVBl
        Qk5Gd7NbQYdKxdQXU9kaGL8rdjFyckgImEgs/9bH2sXIxSEksINR4uumxcxdjBwcvAKCEn93
        CIPUCAtYS7T+nMkEYgsJyEksnHOKESKuJbFv72R2EJtNQEPi68qzLCC2iECyxLKudWAzmQVm
        MUlM/bmUCWIZr8SM9qcsELa0xPblW8EGcQoYSjw7+xgqLipxc/Vbdhj7/bH5jBC2iETrvbPM
        ELagxIOfuxlB7gSZ83l6DsguCYF+RomOj4eYIZweRol3zWfYIBr0Ja70g3wA8pivxL/9OSBh
        FgFViRm/rkPtdZHY/nU3WDmzgLbEsoWvweHALKApsX6XPkSJosTO33MZIUr4JN597WGFeWvH
        vCdQLypJbO1aDGVLSDyaegnqFQ+Jtc3v2CHhPIFZ4sriC8wTGBVmIYJ6FpLNsxA2L2BkXsUo
        llpQnJueWmxYYIocuZsYwSlSy3IH4/S3H/QOMTJxMB5ilOBgVhLh/X92drwQb0piZVVqUX58
        UWlOavEhRlOgnycyS4km5wOTdF5JvKGpkbGxsYWJmbmZqbGSOO8f7Y54IYH0xJLU7NTUgtQi
        mD4mDk6pBqYEQ55/73uSOOZ2qWoF/6i+OV3viFfaqu2KtR6L4j4FTXzkuX5lnaPFsWdhGzXf
        BWn+vSK03etoqmGJ/jZT27mKn59GaK0PC7l/pDi4tJdZKiKSva9/9xzWEFYHZd+yiBsnONTm
        39ix1M1lscSukmohRv8XJ/ZnqnV+P3viWPH29u7XPdnbTsSs/F7wP96dy0QhaLl8xRP/K+e2
        L+Lun/FsQbDfOreinQcnf/fxPHdq9etcg2CZI6knD207ImV9VdOHYXOAOMN9O3W3B492X/17
        hJH/W9PpvOu2p6xZTk57H/rzbsdNE0dt3bKUQselCk5/bOzjP7H6COmHVpxJ2Gr1clcTw6KW
        FsEP4jn5vUosxRmJhlrMRcWJAAw1aqYaBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <20201030114142.GA2409436@kroah.com>
        <20201030104628.GB2395528@kroah.com> <20201029135715.GB3470996@kroah.com>
        <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
        <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
        <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
        <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p4>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> On Fri, Oct 30, 2020 at 08:28:12PM +0900, Jungrae Kim wrote:
> > > On Fri, Oct 30, 2020 at 01:39:16PM +0900, HyungJae Im wrote:
> > > > Hello, This is Hyungjae Im from Samsung Electronics.
> > > > Let me answer your questions inline.
> > > >=20
> > > > >On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> > > > >> From: =22hj2.im=22 <hj2.im=40samsung.com>
> > > > >> Date: Thu, 29 Oct 2020 22:11:24 +0900
> > > > >> Subject: =5BPATCH v2=5D input: add 2 kind of switch
> > > > >=20
> > > > >Why is this in the body of that patch?
> > > >=20
> > > > I read =22how to send your first kernel patch=22, but still making =
so many mistakes.
> > > > I will be cautious with this.
> > > >=C2=A0=20=0D=0A>=20>=20>=20>=20>>=20=0D=0A>=20>=20>=20>=20>>=20We=20=
need=20support=20to=20various=20accessories=20on=20the=20device,=0D=0A>=20>=
=20>=20>=20>>=20some=20switch=20does=20not=20exist=20in=20switch=20list.=0D=
=0A>=20>=20>=20>=20>>=20So=20added=20switch=20for=20the=20following=20purpo=
se.=0D=0A>=20>=20>=20>=20>>=20=0D=0A>=20>=20>=20>=20>>=20SW_COVER_ATTACHED=
=20is=20for=20the=20checking=20the=20cover=0D=0A>=20>=20>=20>=20>>=20attach=
ed=20or=20not=20on=20the=20device.=20SW_EXT_PEN_ATTACHED=20is=20for=20the=
=0D=0A>=20>=20>=20>=20>>=20checking=20the=20external=20pen=20attached=20or=
=20not=20on=20the=20device=0D=0A>=20>=20>=20>=20>=20=0D=0A>=20>=20>=20>=20>=
You=20didn't=20answer=20the=20previous=20question=20as=20to=20why=20the=20e=
xisting=20values=20do=0D=0A>=20>=20>=20>=20>not=20work=20for=20you=20instea=
d=20of=20having=20to=20create=20new=20ones?=0D=0A>=20>=20>=20>=20=0D=0A>=20=
>=20>=20>=C2=A0=20I=20think=20I=20should=20clarify=20this=20part=20the=20mo=
st=20for=20this=20review.=0D=0A>=20>=20>=20>=C2=A0=20As=20you=20know,=20new=
=20added=20events=20both=20has=20similar=20existing=20events,=0D=0A>=20>=20=
>=20>=C2=A0=20but=20it=20has=20to=20operate=20separately.=0D=0A>=20>=20>=20=
>=20=0D=0A>=20>=20>=20>=C2=A0=20First,=20SW_COVER_ATTACHED=20is=20similar=
=20with=20SW_MACHINE_COVER.=0D=0A>=20>=20>=20>=C2=A0=20We=20need=20two=20ev=
ents=20for=20our=20cover=20interaction.=0D=0A>=20>=20>=20>=C2=A0=20One=20is=
=20to=20detect=20if=20flip=20cover=20is=20open/closed(covers=20screen=20or=
=20not),=0D=0A>=20>=20>=20>=C2=A0=20and=20one=20is=20for=20detecting=20if=
=20cover=20is=20attached(detect=20if=20device=20is=20put=20into=20cover).=
=0D=0A>=20>=20>=20>=C2=A0=20With=20the=20second=20event,=20we=20send=20even=
t=20for=20attachment=20and=20start=20authentication=0D=0A>=20>=20>=20>=C2=
=A0=20distinguishing=20if=20it=20was=20Samsung=20made=20cover.=0D=0A>=20>=
=20>=20>=20=0D=0A>=20>=20>=20>=C2=A0=20Second,=20SW_EXT_PEN_ATTACHED=20dete=
cts=20if=20pen=20is=20attached=20externally=20on=20tablet=20models.=0D=0A>=
=20>=20>=20>=C2=A0=20It=20is=20different=20with=20SW_PEN_INSERTED=20since=
=20this=20is=20detecting=20pens=20like=20our=20NOTE=20series.=0D=0A>=20>=20=
>=20>=C2=A0=20SW_EXT_PEN_ATTACHED=20has=20an=20unique=20role=20to=20set=20w=
acom=20tuning=20table=20differently=0D=0A>=20>=20>=20>=C2=A0=20while=20pen=
=20is=20attached/detached.=0D=0A>=20>=20>=C2=A0=20=0D=0A>=20>=20>=20All=20o=
f=20that=20needs=20to=20go=20in=20the=20changelog=20text=20for=20the=20indi=
vidual=20patches=0D=0A>=20>=20>=20when=20you=20submit=20them.=0D=0A>=20>=20=
>=C2=A0=20=0D=0A>=20>=20>=20But=20as=20Dmitry=20pointed=20out,=20it=20doesn=
't=20look=20like=20either=20of=20these=20drivers=0D=0A>=20>=20>=20are=20nee=
ded=20at=20all,=20just=20use=20the=20gpio-keys=20driver=20instead.=0D=0A>=
=20>=20>=C2=A0=20=0D=0A>=20>=20>=20thanks,=0D=0A>=20>=20>=C2=A0=20=0D=0A>=
=20>=20>=20greg=20k-h=0D=0A>=20>=C2=A0=20=0D=0A>=20>=20Can=20you=20accept=
=20V1=20patch?=20or=20need=20to=20add=20a=20change=20of=20device=20tree?=0D=
=0A>=20=0D=0A>=20What=20is=20=22v1=22=20patch?=C2=A0=20Do=20you=20have=20a=
=20pointer=20to=20it=20on=20lore.kernel.org?=0D=0A>=20=0D=0A>=20>=20Please=
=20let=20me=20know=20what=20do=20I=20do=20now.=20=0D=0A>=20=0D=0A>=20What=
=20is=20wrong=20with=20just=20using=20a=20device=20tree=20entry=20for=20the=
=20gpio-keys=0D=0A>=20driver=20instead?=0D=0A>=20=0D=0A>=20thanks,=0D=0A>=
=20=0D=0A>=20greg=20k-h=0D=0A=0D=0AV1=20Patch=20:=20https://lore.kernel.org=
/lkml/20201021031216epcms1p556d8d7d5d763ec47f67cd8cbe3972935=40epcms1p5/=0D=
=0A=0D=0AI=20think=20do=20not=20need=20modify=20gpio_keys.=20And=20I=60m=20=
not=20sure=20device=20tree=20need=20to=20added=20to=20patch.=0D=0A=0D=0APle=
ase=20let=20me=20know=20if=20you=20think=20need=20more=20fix=20than=20Patch=
=20v1.=0D=0A=0D=0AThanks=0D=0AJungrae=20Kim
