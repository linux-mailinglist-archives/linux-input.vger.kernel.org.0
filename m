Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1641E5454
	for <lists+linux-input@lfdr.de>; Thu, 28 May 2020 05:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgE1DEA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 23:04:00 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48319 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726530AbgE1DD7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 23:03:59 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 9C4EF5C016C;
        Wed, 27 May 2020 23:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 27 May 2020 23:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=v4S0KlXll/cWurYTU2NvUK6SpeA
        jUc7WZ3aOtil5gxE=; b=R+7o3wANr3lMVrj7ilYh+I97ItOdjeqRaLqMe3GIJ+B
        hq6TsmEkOOppfqa3Z9USNUFq9j7B+y+4bnAc3ofGkAuH3LBUl5tTzR2idGsLtv27
        YZzEE6OL9Vxw2EG+Pi4Wq57fY8Cb876eOKBPf/1zf4j+TAAvduNGPaIff2bjCvWE
        IoTzdSUtiy6o+DV/OntQhvtiYo1bkBRy88kZCqG3vVNV98Tf002vdHkHpluow3TG
        sXXWmrEOMfBuEvhbsqXeRNNapgzTIvAEKScQdwdaGl+L7pgSPTSchv6X9GjDqkl4
        ToEDJDezxsQwg01i4mIqXH2c9uJeJ5ku+wUIoVo7/fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=v4S0Kl
        Xll/cWurYTU2NvUK6SpeAjUc7WZ3aOtil5gxE=; b=oXOkyYneOtu0mqGaWjalUY
        rx2INz+6KAvBiE4dD7DJb/Fjr9l/+M038X6TEm9zRGIkl9rvgPLwgwR3b12ajKPi
        s0tDOPt6OIiWNF8GTk+JDEKyK1JZ6yiYLbILHsr3MHjaTpmWgoA1ZJ/GYPloMvyv
        hnDLg1mxioxv3zrY75GlYfK0wVqoKP3fYWLB8SmfQarAgKEd8BU5PsFhrzkD/AFM
        9QwdnJcrD7l2sOVPisf7LgPbVdhiJFBFlSlowu2/k55b/sifzkZ/R9BcjlDDNWJ8
        zxAdrOIGKKzHgfkePf68jUsXO1yAVA8aE/0r8Omn3Ul0s6tUgD011VaGqn9D6+eA
        ==
X-ME-Sender: <xms:HSrPXuLqdPJp4ywMzRioteSH6qGIu55LO-_yE2kAMTRyZzjquU-i6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvhedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:HSrPXmIqHRPO4L7ALBogaB0I8HIo89Bxh8VJp-_CdBi26UiBzbYITg>
    <xmx:HSrPXutvN12PpvcX-5_VSuaF_vlwnD29vHnAjUcroAhi0ZLKIKbNZg>
    <xmx:HSrPXjY1r7q9aUZa-hJRqWZbrxNk66OnE1hWszX8NPRadLsRe_TiyQ>
    <xmx:HirPXmB_7LyI-NZ2EIxGlTb7ofM304GVRkc5kEgvbPenHCdgSfQPeA>
Received: from koala (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id EB05A328005A;
        Wed, 27 May 2020 23:03:55 -0400 (EDT)
Date:   Thu, 28 May 2020 13:03:51 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, Wen He <wen.he_1@nxp.com>
Subject: Re: [PATCH RESEND] HID: input: do not run GET_REPORT unless there's
 a Resolution Multiplier
Message-ID: <20200528030351.GA564029@koala>
References: <CAO-hwJJjoEyoKokK6DS_Kb0su2bkC2wzMx-gzaWQcG+dn5vVdw@mail.gmail.com>
 <20200514224929.GA1026616@jelly>
 <CAO-hwJ+FbXu2X7j3tCuKDtVp7UAmSz6m8nipZX4Je1CQf2TdQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+FbXu2X7j3tCuKDtVp7UAmSz6m8nipZX4Je1CQf2TdQQ@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 15, 2020 at 09:48:18AM +0200, Benjamin Tissoires wrote:
> Hi Peter,
> 
> On Fri, May 15, 2020 at 12:49 AM Peter Hutterer
> <peter.hutterer@who-t.net> wrote:
> >
> > hid-multitouch currently runs GET_REPORT for Contact Max and again to
> > retrieve the Win8 blob. If both are within the same report, the
> > Resolution Multiplier code calls GET_FEATURE again and this time,
> > possibly due to timing, it causes the ILITEK-TP device interpret the
> > GET_FEATURE as an instruction to change the mode and effectively stop
> > the device from functioning as expected.
> >
> > Notably: the device doesn't even have a Resolution Multiplier so it
> > shouldn't be affected by any of this at all.
> >
> > Fix this by making sure we only execute GET_REPORT if there is
> > a Resolution Multiplier in the respective report.
> >
> > Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > Tested-by: Wen He <wen.he_1@nxp.com>
> > ---
> > Same patch as before, but this time with diff.noprefix set to false again.
> > Too bad that setting messes up format-patch :( Apologies for the broken
> > one.
> 
> Thanks for the quick respin. I was about to apply it, and then I
> realized that something was off (see inlined)
> 
> >
> >  drivers/hid/hid-input.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index dea9cc65bf80..a54824d451bf 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -1560,21 +1560,12 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
> >  {
> >         struct hid_usage *usage;
> >         bool update_needed = false;
> > +       bool get_report_completed = false;
> >         int i, j;
> >
> >         if (report->maxfield == 0)
> >                 return false;
> >
> > -       /*
> > -        * If we have more than one feature within this report we
> > -        * need to fill in the bits from the others before we can
> > -        * overwrite the ones for the Resolution Multiplier.
> > -        */
> > -       if (report->maxfield > 1) {
> > -               hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> > -               hid_hw_wait(hid);
> > -       }
> > -
> >         for (i = 0; i < report->maxfield; i++) {
> >                 __s32 value = use_logical_max ?
> >                               report->field[i]->logical_maximum :
> > @@ -1593,6 +1584,17 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
> >                         if (usage->hid != HID_GD_RESOLUTION_MULTIPLIER)
> >                                 continue;
> >
> > +                       /*
> > +                        * If we have more than one feature within this report we
> > +                        * need to fill in the bits from the others before we can
> > +                        * overwrite the ones for the Resolution Multiplier.
> > +                        */
> > +                       if (!get_report_completed && report->maxfield > 1) {
> > +                               hid_hw_request(hid, report, HID_REQ_GET_REPORT);
> 
> I think here we said that the reading of this particular feature was
> mandatory by Microsoft, but what if a device doesn't like it.
> I wonder if we should not guard this against HID_QUIRK_NO_INIT_REPORTS
> too, in the event we need to quirk a particular device.

just to clarify: "I wonder if" means "please add this" here? :)

tbh I don't see how a device could function if one cannot read the report
with the RM - Windows reads and sets it unconditionally so that device would
break under Windows. Which, presumably, is motivation enough for a vendor to
fix it.

I'm not even sure there are devices where this is ever triggered now, having
two unrelated features in the same report seems a bit of a niche case.
We can easily add the check but whether it'll ever be needed is doubtful.

Cheers,
   Peter

