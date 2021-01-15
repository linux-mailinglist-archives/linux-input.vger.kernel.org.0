Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3A32F719C
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 05:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733024AbhAOEbU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 23:31:20 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36961 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727301AbhAOEbU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 23:31:20 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 17F2C5C0126;
        Thu, 14 Jan 2021 23:30:34 -0500 (EST)
Received: from imap22 ([10.202.2.72])
  by compute2.internal (MEProxy); Thu, 14 Jan 2021 23:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mxxn.io; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=yqeuM
        fv2IOExgFErm1xJcX2x/HvIci2Xu4LJOGreuUk=; b=SiccvwxoDNXSxzZV9bhHE
        atq3vMoFSVrp6EWJywLlw6NlRDuI5LRiag8N4klWxkWyNDKvNsb11cV01orBHqK4
        2C/kEuGsCJt8Zu3y1Z0nYYntzN+VxKf/+LWajFtZEZiUd1YaVRXTDS4ftkMxCE8/
        TYvduSXYnh7lrkoubyqSylKK2Q9PchZFvoffjtuh+OiZDD9vKZ91DDsjbWB1OzvX
        9GNWjiJ5cuZrrvzlLi66KH3gBIbb9+3I79LRaXTduQLBO766udI1paQh9msBHgct
        7QTnpGMDyOpsjMMZkrdSJPujfCG23yU4wsBYAN5oCJn1fc90SzM6ayoMTku9cqeW
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=yqeuMfv2IOExgFErm1xJcX2x/HvIci2Xu4LJOGreu
        Uk=; b=r4pau40ufO4DtKPMC/TYcmbD/XK4uRx82G/rROc0oAG+P8r5ialJHbjF8
        /swmpdPvIDJ9vLSF0KNv3gLpxtKM60zp/mKBtc/tDn71A/NXBshzTqR6O8U/9xra
        BExp9Uju5BGoh45vcRXnzlGmPGqguxOEnkqFCDTNupfTDeaSbWA9K2kxZ+7yPMhX
        DbD4m6O8mXlo043jab/tolehfrV6nAuPDFFZACS3WNTPZRgv6iXKDjz1vh6ICp9D
        t4pHP8urPP/ewVJHN/vb5ZL5feBPPV8Ru2p9K1VpID22q+Hhd8qFRNMcsYK/Uyp0
        h4hpNjwImMAD1LVcES8bQ1A0SuIyA==
X-ME-Sender: <xms:aRoBYDves1za6WBUf40-PDUVIwvgVpnjCW5ETejsegujAsTMoiB8cw>
    <xme:aRoBYEe9mGImx5TvAdez9cxsXIyfrgbS_g7FHpn1_iCv-GOkCk0KVvSAGe-wWHvqf
    YEFwa6RBA4K2fZ_hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepuehlrgkk
    pgfjrhgrshhtnhhikhcuoegslhgriiesmhiggihnrdhioheqnecuggftrfgrthhtvghrnh
    epueetveelffduheefgeeftdfgvedttefhgfekhfekgfdtvdffvefhieetvdefudevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghlrgiise
    hmgiignhdrihho
X-ME-Proxy: <xmx:aRoBYGy56jtlDIPl2MuGjtY93APF8mZx0T8iemmM1jla0aQv87zR2g>
    <xmx:aRoBYCNn-0Gnh-hITa1PB9v-SdZFyRMWL1id3_QC770A5slZDw-bWg>
    <xmx:aRoBYD8gPKFHjkkV9sSB7fQxctGyMUUoUZLHK-pD0X3451Zjaq4PjA>
    <xmx:ahoBYAEYVYuM8B-PDDj6E1XzwogsVMzyzOKzyG5VhWMYCWz1WB2Czg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A564162A0065; Thu, 14 Jan 2021 23:30:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <91a7cedf-ea95-4fc3-8c89-5f8699656399@www.fastmail.com>
In-Reply-To: <CAO-hwJ+iA2vMMVEukDFGg_L6RPSRVfEhnB71yaTf-yPgkxLLNg@mail.gmail.com>
References: <2b4c5881-2047-407f-8bb4-623d9bd167c7@www.fastmail.com>
 <CAO-hwJ+iA2vMMVEukDFGg_L6RPSRVfEhnB71yaTf-yPgkxLLNg@mail.gmail.com>
Date:   Fri, 15 Jan 2021 13:27:26 +0900
From:   =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
To:     "Benjamin Tissoires" <benjamin.tissoires@redhat.com>
Cc:     "Jiri Kosina" <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: HID: multitouch: Set to high latency mode on suspend.
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Just a couple of quick questions, do you have any reason to implement
> this besides just trying to match the specification?

On the Surface Laptop 3 touchpad and the keyboard are provided by a sepa=
rate embedded controller that also handles various other components. I t=
hink setting the latency mode could improve battery efficiency during su=
spend. The same should be true for touchpads configured as wake-up sourc=
es.

Bla=C5=BE

On Fri, 15 Jan 2021, at 01:55, Benjamin Tissoires wrote:
> Hi Bla=C5=BE,
>=20
> On Sat, Dec 19, 2020 at 5:55 AM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrot=
e:
> >
> > Per Windows Precision Touchpad guidelines:
> >
> > > The latency mode feature report is sent by the host to a Windows
> > > Precision Touchpad to indicate when high latency is desirable for
> > > power savings and, conversely, when normal latency is desired for
> > > operation.
> > >
> > > For USB-connected Windows Precision Touchpads, this enables the de=
vice
> > > to disambiguate between being suspended for inactivity (runtime ID=
LE)
> > > and being suspended because the system is entering S3 or Connected=

> > > Standby.
> >
> > The current implementation would set the latency to normal on device=
 initialization,
> > but we didn't set the device to high latency on suspend.
>=20
> Just a couple of quick questions, do you have any reason to implement
> this besides just trying to match the specification?
>=20
> Have you checked if Windows is doing the same thing?
>=20
> Cheers,
> Benjamin
>=20
>=20
>=20
> >
> > Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
> > ---
> >  drivers/hid/hid-multitouch.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitou=
ch.c
> > index d670bcd57..28bac0f39 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -1746,6 +1746,13 @@ static int mt_probe(struct hid_device *hdev, =
const struct hid_device_id *id)
> >  }
> >
> >  #ifdef CONFIG_PM
> > +static int mt_suspend(struct hid_device *hdev, pm_message_t state)
> > +{
> > +       /* High latency is desirable for power savings during S3/S0i=
x */
> > +       mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> > +       return 0;
> > +}
> > +
> >  static int mt_reset_resume(struct hid_device *hdev)
> >  {
> >         mt_release_contacts(hdev);
> > @@ -1761,6 +1768,8 @@ static int mt_resume(struct hid_device *hdev)
> >
> >         hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
> >
> > +       mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> > +
> >         return 0;
> >  }
> >  #endif
> > @@ -2150,6 +2159,7 @@ static struct hid_driver mt_driver =3D {
> >         .event =3D mt_event,
> >         .report =3D mt_report,
> >  #ifdef CONFIG_PM
> > +       .suspend =3D mt_suspend,
> >         .reset_resume =3D mt_reset_resume,
> >         .resume =3D mt_resume,
> >  #endif
> > --
> > 2.29.2
> >
>=20
>
