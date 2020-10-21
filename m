Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A519C2946D9
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 05:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411519AbgJUDIp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Oct 2020 23:08:45 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:57354 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411540AbgJUDIp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Oct 2020 23:08:45 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201021030841epoutp038297252674e432cb98a28cb8a5f1e260~-4yCmUXKd2615826158epoutp03I
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 03:08:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201021030841epoutp038297252674e432cb98a28cb8a5f1e260~-4yCmUXKd2615826158epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603249721;
        bh=dGWDzHN40/9y1Tc3SrqhQOcihrlL2zahus5gYCyOmKA=;
        h=Subject:Reply-To:From:To:CC:Date:References:From;
        b=kS6/IPkUu7Ud0oLnO/p6D+u2wJ9fBqH6bWE79/bpKI86KO8WYHl59ArYtZ1+M1vvQ
         EQujfcJ3NxdhODnDhsYMxWUK2+j2IcdYlYfFgSvHDlFSDdi8ZLsFAb79NVpkPTUPSx
         nunnOQvlhDn7XPLMedLSgodxwABzew4cvQRxWeGg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201021030840epcas1p2d31dbc9561e598ecf7ef6728f05438fc~-4yBilE4C1647016470epcas1p2w;
        Wed, 21 Oct 2020 03:08:40 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.162]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CGFnM4Y8LzMqYlh; Wed, 21 Oct
        2020 03:08:39 +0000 (GMT)
X-AuditID: b6c32a36-713ff700000026be-01-5f8fa637f662
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4C.F8.09918.736AF8F5; Wed, 21 Oct 2020 12:08:39 +0900 (KST)
Mime-Version: 1.0
Subject: [PATCH] FROMLIST: input: add 2 kind of switch
Reply-To: hj2.im@samsung.com
Sender: HyungJae Im <hj2.im@samsung.com>
From:   HyungJae Im <hj2.im@samsung.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
CC:     HyungJae Im <hj2.im@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20201021030839epcms1p6ee42879aecfe15dd1b377e469397f598@epcms1p6>
Date:   Wed, 21 Oct 2020 12:08:39 +0900
X-CMS-MailID: 20201021030839epcms1p6ee42879aecfe15dd1b377e469397f598
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmnq75sv54g4N7FSwOL3rBaNG8eD2b
        xYLpdhY3P31jtbi8aw6bxd2WTlaLE9+mMTmwe3xe9YrVY+esu+wed67tYfPYP3cNu0ffllWM
        Hp83yQWwReXYZKQmpqQWKaTmJeenZOal2yp5B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl
        5gCdoqRQlphTChQKSCwuVtK3synKLy1JVcjILy6xVUotSMkpMDQo0CtOzC0uzUvXS87PtTI0
        MDAyBapMyMk4/OIRc8FL5YoDh+ewNTB+VOpi5OSQEDCRuHhwHksXIxeHkMAORolJsw6ydTFy
        cPAKCEr83SEMUiMsYCaxZsUhFpCwkICMRNceI4iwhsTSls+MIDabgJrE7zV72EDGiAh8YJK4
        uXw1K0iCWUBFom9TNyPELl6JGe1PWSBsaYnty7dCxUUlbq5+yw5jvz82HyouItF67ywzhC0o
        8eDnbkaY3qVXFjOBLJMQaGeUuHjzFyuE08IosWDpYTaIKn2JK/0zmUBsXgFfie3zjoBdxCKg
        KrGq/xc7yDcSAi4Sq684QByqLbFs4WtmkDCzgKbE+l36EFMUJXb+nssIUcIn8e5rDyvMLzvm
        PWGCsBUkNi76BLVVTGLWvNtQP3pIPH/1mRkSboESq846TWCUn4UI3FlI9s5C2LuAkXkVo1hq
        QXFuemqxYYERcnxuYgSnRC2zHYyT3n7QO8TIxMF4iFGCg1lJhHcCa1+8EG9KYmVValF+fFFp
        TmrxIUZToIcnMkuJJucDk3JeSbyhqZGxsbGFiZm5mamxkjjvH+2OeCGB9MSS1OzU1ILUIpg+
        Jg5OqQam6Uo+7RNq/FT2fone7LvofrbIzPKfoc9cLPp9fq48Y9WvfLdOg9Py9LTJ50r8Fihv
        ffFQ6eFmT+2yp9t/1Tzfbe+jlLb+k7HE1d03PTNil805vPzSlV8z9eRnJ8w5s9ec++t9jwnH
        lffJ3HKd7/FMbyObomlRYdnvJpvpZ6bcKVpQbitRx7N+yuw9E5cHdJdqVj20sHKTW+77hOFe
        fHumWcmMaUKG126KHFnkpWB1fUFsUuIlnRcLf+zYf/L2CmWWZ2LPIiVbvliWScy4Vie1y/u8
        gGOtrWfv55kuKpKLmNZuuXtabgfTeZWMu8UNT049cNnvH9a2vq+QSWrV9Bn7Ko8d3aX+zK9e
        +KC75szSECWW4oxEQy3mouJEALlraoESBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2
References: <CGME20201021030255epcms1p21924b35616dc666b7b6c04c2c5d8a1a2@epcms1p6>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From=C2=A0ec9859ee01b7bc0e04255971e0fe97348847dab7=C2=A0Mon=C2=A0Sep=C2=A01=
7=C2=A000:00:00=C2=A02001=0D=0AFrom:=C2=A0=22hj2.im=22=C2=A0<hj2.im=40samsu=
ng.com>=0D=0ADate:=C2=A0Tue,=C2=A020=C2=A0Oct=C2=A02020=C2=A016:57:04=C2=A0=
+0900=0D=0ASubject:=C2=A0=5BPATCH=5D=C2=A0FROMLIST:=C2=A0input:=C2=A0add=C2=
=A02=C2=A0kind=C2=A0of=C2=A0switch=0D=0A=C2=A0=0D=0AWe=C2=A0need=C2=A0suppo=
rt=C2=A0to=C2=A0various=C2=A0accessories=C2=A0on=C2=A0the=C2=A0device,=0D=
=0Asome=C2=A0switch=C2=A0does=C2=A0not=C2=A0exist=C2=A0in=C2=A0switch=C2=A0=
list.=0D=0ASo=C2=A0added=C2=A0switch=C2=A0for=C2=A0the=C2=A0following=C2=A0=
purpose.=0D=0A=C2=A0=0D=0ASW_COVER_ATTACHED=C2=A0is=C2=A0for=C2=A0the=C2=A0=
checking=C2=A0the=C2=A0cover=0D=0Aattached=C2=A0or=C2=A0not=C2=A0on=C2=A0th=
e=C2=A0device.=C2=A0SW_EXT_PEN_ATTACHED=C2=A0is=C2=A0for=C2=A0the=0D=0Achec=
king=C2=A0the=C2=A0external=C2=A0pen=C2=A0attached=C2=A0or=C2=A0not=C2=A0on=
=C2=A0the=C2=A0device=0D=0A=C2=A0=0D=0ASigned-off-by:=C2=A0hj2.im=C2=A0<hj2=
.im=40samsung.com>=0D=0A---=0D=0A=C2=A0include/linux/mod_devicetable.h=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=7C=C2=A02=C2=A0+-=0D=0A=C2=A0=
include/uapi/linux/input-event-codes.h=C2=A0=7C=C2=A04=C2=A0+++-=0D=0A=C2=
=A02=C2=A0files=C2=A0changed,=C2=A04=C2=A0insertions(+),=C2=A02=C2=A0deleti=
ons(-)=0D=0A=C2=A0=0D=0Adiff=C2=A0--git=C2=A0a/include/linux/mod_devicetabl=
e.h=C2=A0b/include/linux/mod_devicetable.h=0D=0Aindex=C2=A05b08a473cdba..89=
7f5a3e7721=C2=A0100644=0D=0A---=C2=A0a/include/linux/mod_devicetable.h=0D=
=0A+++=C2=A0b/include/linux/mod_devicetable.h=0D=0A=40=40=C2=A0-320,7=C2=A0=
+320,7=C2=A0=40=40=C2=A0struct=C2=A0pcmcia_device_id=C2=A0=7B=0D=0A=C2=A0=
=23define=C2=A0INPUT_DEVICE_ID_LED_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0f=0D=0A=C2=
=A0=23define=C2=A0INPUT_DEVICE_ID_SND_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x07=0D=0A=
=C2=A0=23define=C2=A0INPUT_DEVICE_ID_FF_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x7f=0D=
=0A-=23define=C2=A0INPUT_DEVICE_ID_SW_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x10=0D=0A+=
=23define=C2=A0INPUT_DEVICE_ID_SW_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x12=0D=0A=C2=
=A0=23define=C2=A0INPUT_DEVICE_ID_PROP_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1f=0D=0A=C2=A0=0D=0A=C2=A0=23define=C2=A0INPUT_DEVICE_ID_M=
ATCH_BUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01=0D=0Adiff=C2=A0--=
git=C2=A0a/include/uapi/linux/input-event-codes.h=C2=A0b/include/uapi/linux=
/input-event-codes.h=0D=0Aindex=C2=A00c2e27d28e0a..8ca2acee1f92=C2=A0100644=
=0D=0A---=C2=A0a/include/uapi/linux/input-event-codes.h=0D=0A+++=C2=A0b/inc=
lude/uapi/linux/input-event-codes.h=0D=0A=40=40=C2=A0-889,7=C2=A0+889,9=C2=
=A0=40=40=0D=0A=C2=A0=23define=C2=A0SW_MUTE_DEVICE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0=
e=C2=A0=C2=A0/*=C2=A0set=C2=A0=3D=C2=A0device=C2=A0disabled=C2=A0*/=0D=0A=
=C2=A0=23define=C2=A0SW_PEN_INSERTED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x0f=C2=A0=C2=A0/*=
=C2=A0set=C2=A0=3D=C2=A0pen=C2=A0inserted=C2=A0*/=0D=0A=C2=A0=23define=C2=
=A0SW_MACHINE_COVER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x10=C2=
=A0=C2=A0/*=C2=A0set=C2=A0=3D=C2=A0cover=C2=A0closed=C2=A0*/=0D=0A-=23defin=
e=C2=A0SW_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x10=0D=0A+=23define=C2=A0SW_COVER_ATTACHED=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A00x11=C2=A0=C2=A0/*=C2=A0set=C2=A0=3D=C2=A0cover=
=C2=A0attached=C2=A0*/=0D=0A+=23define=C2=A0SW_EXT_PEN_ATTACHED=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x12=C2=A0=C2=A0/*=C2=A0set=C2=A0=3D=C2=
=A0external=C2=A0pen=C2=A0attached=C2=A0*/=0D=0A+=23define=C2=A0SW_MAX=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x12=0D=
=0A=C2=A0=23define=C2=A0SW_CNT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0(SW_MAX+1)=0D=0A=C2=A0=0D=0A=C2=A0/*=0D=0A--=C2=A0=
=0D=0A2.11.0=0D=0A=C2=A0
