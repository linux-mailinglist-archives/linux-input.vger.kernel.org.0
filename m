Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF0429FCBD
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 05:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJ3EjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 00:39:24 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:23522 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgJ3EjY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 00:39:24 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201030043918epoutp02190609a1101677cf07d300aa6d5bf01f~Cq0uIc_sJ2271122711epoutp02i
        for <linux-input@vger.kernel.org>; Fri, 30 Oct 2020 04:39:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201030043918epoutp02190609a1101677cf07d300aa6d5bf01f~Cq0uIc_sJ2271122711epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604032758;
        bh=HRNy5pAcF2VN3IV+cdTmvAeL0atJHSQDZjYTp1ETCjE=;
        h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
        b=MZZM56dcDwmSUXdDh1rZjJ6EOU1Fk2SLlvSxgjVpMtboGxww3YsDehvZ49PzHZUrD
         mlKobNFY0MZaMZoytsG7iW6r5O1AjFzYPnF8+sxm3l4Oe1js+KJiLtCaNB9IeBghUH
         2YIpoLz8FfMoAuyDsuNhq1aY2Q6K/JVtH8GwOJEo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201030043917epcas1p3f2091c28dd4dfa244ba5055351dbe703~Cq0ttEvlg3156431564epcas1p34;
        Fri, 30 Oct 2020 04:39:17 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.161]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CMqMm53t8zMqYkl; Fri, 30 Oct
        2020 04:39:16 +0000 (GMT)
X-AuditID: b6c32a35-c23ff70000010972-c6-5f9b98f49b0e
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        04.51.02418.4F89B9F5; Fri, 30 Oct 2020 13:39:16 +0900 (KST)
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2] input: add 2 kind of switch
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        HyungJae Im <hj2.im@samsung.com>
CC:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20201029135715.GB3470996@kroah.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
Date:   Fri, 30 Oct 2020 13:39:16 +0900
X-CMS-MailID: 20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdlhTX/fLjNnxBr+OqVg0L17PZrFgup3F
        4W0TmCxufvrGanF51xw2i7stnawWJ75NY3Jg9/i86hWrx51re9g89s9dw+7Rt2UVo8fnTXIB
        rFE5NhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAVygp
        lCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCgwNCvSKE3OLS/PS9ZLzc60MDQyMTIEq
        E3Iy5kz0KvgSUbHt63zmBsZ9YV2MnBwSAiYS7w6vYO9i5OIQEtjBKLFo8jTmLkYODl4BQYm/
        O4RBaoQFzCQ2bp4IFhYSkJHo2mMEEdaQWNrymRHEZhNQk/i9Zg8biC0ikCixYfosMJtZYB6T
        xLe1thCreCVmtD9lgbClJbYv3wrWyylgKHG08xMTRFxU4ubqt+ww9vtj8xkhbBGJ1ntnmSFs
        QYkHP3czwsxZemUxE8j5EgLtjBIXb/5ihXBaGCUWLD3MBlGlL3GlfybYBl4BX4kPv6+BxVkE
        VCX2P57OClHjIvG14wITxNXaEssWvgZ7mFlAU2L9Ln2IEkWJnb/nMkKU8Em8+9rDCvPYjnlP
        oB5QkNi46BPUWjGJWfNuQz3sIbG2+R00nPcwSiw79491AqPCLERQz0KyeRbC5gWMzKsYxVIL
        inPTU4sNCwyRI3cTIzhFapnuYJz49oPeIUYmDsZDjBIczEoivC8EZ8YL8aYkVlalFuXHF5Xm
        pBYfYjQF+nkis5Rocj4wSeeVxBuaGhkbG1uYmJmbmRorifP+0e6IFxJITyxJzU5NLUgtgulj
        4uCUamDiDKvM/VLf46Ul1XYja5/hnqQ/bVGSEQ9+fEp9JVGjXV86uUrIpXehhsAiGa/XL3sX
        l4jMWthzYSXHjbwDoT9yprqkWQbtFXq2ZamlzH/z66tkZX+sEJdlnXpEgel3+D3fObekmt/z
        cTGuuM73Xbrp1JWnvA2uH2dLxSnFbwn02Z6xZdKFK2e2n5hm6bPW+Oe9Y0zNEd5zhOr3hp7a
        mOrNfu5dstwNvZQciz83Ta/2qf7k122qiCtT3hb+dfuF2I2yDTJ1KwREFl7xTbmdv92t5nhi
        /KTCjuftngIvgp9VKIcI6WxMbzu3ND+sxDhYb4Hs2razv/pZ2+x103jnnCjkTZFwMg/nbSxL
        eZzfqcRSnJFoqMVcVJwIAJBg0cQaBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf
References: <20201029135715.GB3470996@kroah.com>
        <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
        <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p3>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, This is Hyungjae Im from Samsung Electronics.
Let me answer your questions inline.

>On=C2=A0Thu,=C2=A0Oct=C2=A029,=C2=A02020=C2=A0at=C2=A010:27:47PM=C2=A0+090=
0,=C2=A0HyungJae=C2=A0Im=C2=A0wrote:=0D=0A>>=C2=A0From:=C2=A0=22hj2.im=22=
=C2=A0<hj2.im=40samsung.com>=0D=0A>>=C2=A0Date:=C2=A0Thu,=C2=A029=C2=A0Oct=
=C2=A02020=C2=A022:11:24=C2=A0+0900=0D=0A>>=C2=A0Subject:=C2=A0=5BPATCH=C2=
=A0v2=5D=C2=A0input:=C2=A0add=C2=A02=C2=A0kind=C2=A0of=C2=A0switch=0D=0A>=
=C2=A0=0D=0A>Why=C2=A0is=C2=A0this=C2=A0in=C2=A0the=C2=A0body=C2=A0of=C2=A0=
that=C2=A0patch?=0D=0A=0D=0AI=20read=20=22how=20to=20send=20your=20first=20=
kernel=20patch=22,=20but=20still=20making=20so=20many=20mistakes.=0D=0AI=20=
will=20be=20cautious=20with=20this.=0D=0A=C2=A0=0D=0A>>=C2=A0=0D=0A>>=C2=A0=
We=C2=A0need=C2=A0support=C2=A0to=C2=A0various=C2=A0accessories=C2=A0on=C2=
=A0the=C2=A0device,=0D=0A>>=C2=A0some=C2=A0switch=C2=A0does=C2=A0not=C2=A0e=
xist=C2=A0in=C2=A0switch=C2=A0list.=0D=0A>>=C2=A0So=C2=A0added=C2=A0switch=
=C2=A0for=C2=A0the=C2=A0following=C2=A0purpose.=0D=0A>>=C2=A0=0D=0A>>=C2=A0=
SW_COVER_ATTACHED=C2=A0is=C2=A0for=C2=A0the=C2=A0checking=C2=A0the=C2=A0cov=
er=0D=0A>>=C2=A0attached=C2=A0or=C2=A0not=C2=A0on=C2=A0the=C2=A0device.=C2=
=A0SW_EXT_PEN_ATTACHED=C2=A0is=C2=A0for=C2=A0the=0D=0A>>=C2=A0checking=C2=
=A0the=C2=A0external=C2=A0pen=C2=A0attached=C2=A0or=C2=A0not=C2=A0on=C2=A0t=
he=C2=A0device=0D=0A>=C2=A0=0D=0A>You=C2=A0didn't=C2=A0answer=C2=A0the=C2=
=A0previous=C2=A0question=C2=A0as=C2=A0to=C2=A0why=C2=A0the=C2=A0existing=
=C2=A0values=C2=A0do=0D=0A>not=C2=A0work=C2=A0for=C2=A0you=C2=A0instead=C2=
=A0of=C2=A0having=C2=A0to=C2=A0create=C2=A0new=C2=A0ones?=0D=0A=0D=0A=C2=A0=
I=20think=20I=20should=20clarify=20this=20part=20the=20most=20for=20this=20=
review.=0D=0A=20As=20you=20know,=20new=20added=20events=20both=20has=20simi=
lar=20existing=20events,=0D=0A=20but=20it=20has=20to=20operate=20separately=
.=0D=0A=0D=0A=20First,=20SW_COVER_ATTACHED=20is=20similar=20with=20SW_MACHI=
NE_COVER.=0D=0A=20We=20need=20two=20events=20for=20our=20cover=20interactio=
n.=0D=0A=20One=20is=20to=20detect=20if=20flip=20cover=20is=20open/closed(co=
vers=20screen=20or=20not),=0D=0A=20and=20one=20is=20for=20detecting=20if=20=
cover=20is=20attached(detect=20if=20device=20is=20put=20into=20cover).=0D=
=0A=20With=20the=20second=20event,=20we=20send=20event=20for=20attachment=
=20and=20start=20authentication=0D=0A=20distinguishing=20if=20it=20was=20Sa=
msung=20made=20cover.=0D=0A=0D=0A=20Second,=20SW_EXT_PEN_ATTACHED=20detects=
=20if=20pen=20is=20attached=20externally=20on=20tablet=20models.=0D=0A=20It=
=20is=20different=20with=20SW_PEN_INSERTED=20since=20this=20is=20detecting=
=20pens=20like=20our=20NOTE=20series.=0D=0A=20SW_EXT_PEN_ATTACHED=20has=20a=
n=20unique=20role=20to=20set=20wacom=20tuning=20table=20differently=0D=0A=
=20while=20pen=20is=20attached/detached.=0D=0A=0D=0A=C2=A0=0D=0A>>=C2=A0=0D=
=0A>>=C2=A0Signed-off-by:=C2=A0Hyungjae=C2=A0Im=C2=A0<hj2.im=40samsung.com>=
=0D=0A>>=C2=A0---=0D=0A>>=C2=A0=C2=A0drivers/input/Kconfig=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=7C=C2=A0=C2=A020=C2=A0++=0D=0A>>=C2=A0=C2=A0drivers/inpu=
t/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A0=C2=A0=C2=A03=C2=A0+=0D=0A>=
>=C2=A0=C2=A0drivers/input/cover_detect.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A0242=C2=A0++++++++++++++++++++++++=
=0D=0A>>=C2=A0=C2=A0drivers/input/ext_pen_detect.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A0243=C2=A0+++++++++++++++++++++++++=
=0D=0A>>=C2=A0=C2=A0include/linux/mod_devicetable.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A0=C2=A0=C2=A02=C2=A0+-=0D=0A>>=C2=A0=C2=A0i=
nclude/uapi/linux/input-event-codes.h=C2=A0=7C=C2=A0=C2=A0=C2=A04=C2=A0+-=
=0D=0A>>=C2=A0=C2=A06=C2=A0files=C2=A0changed,=C2=A0512=C2=A0insertions(+),=
=C2=A02=C2=A0deletions(-)=0D=0A>>=C2=A0=C2=A0create=C2=A0mode=C2=A0100644=
=C2=A0drivers/input/cover_detect.c=0D=0A>>=C2=A0=C2=A0create=C2=A0mode=C2=
=A0100644=C2=A0drivers/input/ext_pen_detect.c=0D=0A=C2=A0=0D=0A>If=C2=A0thi=
s=C2=A0is=C2=A0v2,=C2=A0what=C2=A0changed=C2=A0from=C2=A0v1?=0D=0A>=C2=A0=
=0D=0A>And=C2=A0this=C2=A0is=C2=A02=C2=A0different=C2=A0drivers,=C2=A0it=C2=
=A0should=C2=A0be=C2=A02=C2=A0different=C2=A0patches=C2=A0at=C2=A0the=0D=0A=
>least,=C2=A0right?>=0D=0A=0D=0AV2=20has=20additional=20submit=20for=20driv=
ers=20using=20SW=20events.=0D=0AI=20will=20separate=20these=20two=20drivers=
=20and=20submit=20it=20separately.=0D=0A=C2=A0=0D=0A>>=C2=A0=0D=0A>>=C2=A0d=
iff=C2=A0--git=C2=A0a/drivers/input/Kconfig=C2=A0b/drivers/input/Kconfig=0D=
=0A>>=C2=A0index=C2=A01efd3154b68d..df902f4a549e=C2=A0100644=0D=0A>>=C2=A0-=
--=C2=A0a/drivers/input/Kconfig=0D=0A>>=C2=A0+++=C2=A0b/drivers/input/Kconf=
ig=0D=0A>>=C2=A0=40=40=C2=A0-185,6=C2=A0+185,26=C2=A0=40=40=C2=A0config=C2=
=A0INPUT_APMPOWER=0D=0A>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0To=C2=A0compile=C2=A0this=C2=A0driver=C2=A0as=C2=A0=
a=C2=A0module,=C2=A0choose=C2=A0M=C2=A0here:=C2=A0the=0D=0A>>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0module=C2=A0wil=
l=C2=A0be=C2=A0called=C2=A0apm-power.=0D=0A>>=C2=A0=C2=A0=0D=0A>>=C2=A0+con=
fig=C2=A0COVER_DETECT=0D=0A=C2=A0=0D=0A>INPUT_COVER_DETECT?=0D=0A=0D=0A=20W=
ill=20change=20feature=20name=20to=20INPUT_COVER_DETECT.=0D=0A=C2=A0=0D=0A>=
>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate=C2=A0=22En=
able=C2=A0cover=C2=A0attach=C2=A0detection=22=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default=C2=A0n=0D=0A=C2=A0=0D=0A>=22defaul=
t=C2=A0n=22=C2=A0is=C2=A0always=C2=A0the=C2=A0default,=C2=A0no=C2=A0need=C2=
=A0for=C2=A0this=C2=A0here.=0D=0A=0D=0A=20Thanks=20for=20comment.=20I=20wil=
l=20erase=20it.=0D=0A=C2=A0=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0help=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Say=C2=A0Y=C2=A0here=C2=A0to=C2=A0enable=C2=A0cover=C2=
=A0attach=C2=A0detection=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0and=C2=A0send=C2=A0a=C2=A0event=C2=A0when=C2=A0cove=
r=C2=A0is=C2=A0attached/detached.=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Active=C2=A0gpio=C2=A0state=C2=A0is=C2=A0l=
ow=C2=A0and=C2=A0active=C2=A0event=C2=A0value=C2=A0is=C2=A00.=0D=0A>>=C2=A0=
+=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0If=C2=A0unsure,=C2=A0say=C2=A0N.=0D=0A=C2=A0=0D=0A>What=C2=A0is=C2=A0the=
=C2=A0module=C2=A0name?=0D=0A=0D=0A=20I=20will=20add=20additional=20explana=
tion=20for=20module=20name=0D=0A=C2=A0=0D=0A>>=C2=A0+=0D=0A>>=C2=A0+config=
=C2=A0EXT_PEN_DETECT=0D=0A=C2=A0=0D=0A>INPUT_EXT_PEN_DETECT?=0D=0A=C2=A0=0D=
=0A>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tristate=C2=A0=
=22Enable=C2=A0external=C2=A0pen=C2=A0attach=C2=A0detection=22=0D=0A>=C2=A0=
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default=C2=A0n=0D=0A=C2=A0=
=0D=0A>No=C2=A0default=C2=A0n.=0D=0A=C2=A0=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Say=C2=A0Y=C2=A0here=C2=A0to=C2=A0enabl=
e=C2=A0external=C2=A0pen=C2=A0attach=C2=A0detection=0D=0A>>=C2=A0+=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0and=C2=A0send=C2=A0a=C2=
=A0event=C2=A0when=C2=A0external=C2=A0pen=C2=A0is=C2=A0attached/detached.=
=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
Active=C2=A0gpio=C2=A0state=C2=A0is=C2=A0low=C2=A0and=C2=A0active=C2=A0even=
t=C2=A0value=C2=A0is=C2=A00.=0D=0A>>=C2=A0+=0D=0A>>=C2=A0+=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0If=C2=A0unsure,=C2=A0say=C2=A0=
N.=0D=0A=C2=A0=0D=0A>What=C2=A0is=C2=A0the=C2=A0module=C2=A0name?=0D=0A=C2=
=A0=0D=0A>>=C2=A0+=0D=0A>>=C2=A0=C2=A0comment=C2=A0=22Input=C2=A0Device=C2=
=A0Drivers=22=0D=0A>>=C2=A0=C2=A0=0D=0A>>=C2=A0=C2=A0source=C2=A0=22drivers=
/input/keyboard/Kconfig=22=0D=0A>>=C2=A0diff=C2=A0--git=C2=A0a/drivers/inpu=
t/Makefile=C2=A0b/drivers/input/Makefile=0D=0A>>=C2=A0index=C2=A0e356509303=
71..31ee1f2d2e21=C2=A0100644=0D=0A>>=C2=A0---=C2=A0a/drivers/input/Makefile=
=0D=0A>>=C2=A0+++=C2=A0b/drivers/input/Makefile=0D=0A>>=C2=A0=40=40=C2=A0-2=
9,3=C2=A0+29,6=C2=A0=40=40=C2=A0obj-=24(CONFIG_INPUT_MISC)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D=C2=A0misc/=0D=0A>>=C2=A0=C2=A0obj-=24=
(CONFIG_INPUT_APMPOWER)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D=
=C2=A0apm-power.o=0D=0A>>=C2=A0=C2=A0=0D=0A>>=C2=A0=C2=A0obj-=24(CONFIG_RMI=
4_CORE)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D=C2=A0rmi4/=0D=0A>>=C2=A0+=0D=0A>>=C2=A0+=
obj-=24(CONFIG_COVER_DETECT)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0+=3D=C2=A0cover_detect.o=0D=0A>>=C2=A0+obj-=24(CONFIG_EXT_PEN_DETECT)=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=3D=C2=A0ext_pen_detect.o=0D=
=0A>>=C2=A0diff=C2=A0--git=C2=A0a/drivers/input/cover_detect.c=C2=A0b/drive=
rs/input/cover_detect.c=0D=0A>>=C2=A0new=C2=A0file=C2=A0mode=C2=A0100644=0D=
=0A>>=C2=A0index=C2=A0000000000000..4d3d68c616ec=0D=0A>>=C2=A0---=C2=A0/dev=
/null=0D=0A>>=C2=A0+++=C2=A0b/drivers/input/cover_detect.c=0D=0A>>=C2=A0=40=
=40=C2=A0-0,0=C2=A0+1,242=C2=A0=40=40=0D=0A>>=C2=A0+/*=0D=0A>>=C2=A0+=C2=A0=
*=C2=A0Copyright=C2=A0(C)=C2=A02015=C2=A0Samsung=C2=A0Electronics=C2=A0Co.=
=C2=A0Ltd.=C2=A0All=C2=A0Rights=C2=A0Reserved.=0D=0A=C2=A0=0D=0A>Please=C2=
=A0use=C2=A0a=C2=A0SPDX=C2=A0line,=C2=A0and=C2=A0no=C2=A0need=C2=A0for=C2=
=A0this:=0D=0A=C2=A0=0D=0A>>=C2=A0+=C2=A0*=0D=0A>>=C2=A0+=C2=A0*=C2=A0This=
=C2=A0software=C2=A0is=C2=A0licensed=C2=A0under=C2=A0the=C2=A0terms=C2=A0of=
=C2=A0the=C2=A0GNU=C2=A0General=C2=A0Public=0D=0A>>=C2=A0+=C2=A0*=C2=A0Lice=
nse=C2=A0version=C2=A02,=C2=A0as=C2=A0published=C2=A0by=C2=A0the=C2=A0Free=
=C2=A0Software=C2=A0Foundation,=C2=A0and=0D=0A>>=C2=A0+=C2=A0*=C2=A0may=C2=
=A0be=C2=A0copied,=C2=A0distributed,=C2=A0and=C2=A0modified=C2=A0under=C2=
=A0those=C2=A0terms.=0D=0A>>=C2=A0+=C2=A0*=0D=0A>>=C2=A0+=C2=A0*=C2=A0This=
=C2=A0program=C2=A0is=C2=A0distributed=C2=A0in=C2=A0the=C2=A0hope=C2=A0that=
=C2=A0it=C2=A0will=C2=A0be=C2=A0useful,=0D=0A>>=C2=A0+=C2=A0*=C2=A0but=C2=
=A0WITHOUT=C2=A0ANY=C2=A0WARRANTY;=C2=A0without=C2=A0even=C2=A0the=C2=A0imp=
lied=C2=A0warranty=C2=A0of=0D=0A>>=C2=A0+=C2=A0*=C2=A0MERCHANTABILITY=C2=A0=
or=C2=A0FITNESS=C2=A0FOR=C2=A0A=C2=A0PARTICULAR=C2=A0PURPOSE.=C2=A0=C2=A0Se=
e=C2=A0the=0D=0A>>=C2=A0+=C2=A0*=C2=A0GNU=C2=A0General=C2=A0Public=C2=A0Lic=
ense=C2=A0for=C2=A0more=C2=A0details.=0D=0A=C2=A0=0D=0A>That=C2=A0can=C2=A0=
be=C2=A0removed.=0D=0A=C2=A0=0D=0A>Also=C2=A0your=C2=A0copyright=C2=A0line=
=C2=A0is=C2=A0wrong,=C2=A0unless=C2=A0you=C2=A0really=C2=A0have=C2=A0not=C2=
=A0touched=0D=0A>this=C2=A0file=C2=A0in=C2=A05=C2=A0years.=0D=0A=C2=A0=0D=
=0A>Same=C2=A0comments=C2=A0on=C2=A0the=C2=A0other=C2=A0file.=0D=0A=C2=A0=
=0D=0A>thanks,=0D=0A=C2=A0=0D=0A>greg=C2=A0k-h=0D=0A=C2=A0=0D=0A=20I=20will=
=20change=20it.=20Thanks=0D=0A=0D=0Abest=20regard,=0D=0AHJ
