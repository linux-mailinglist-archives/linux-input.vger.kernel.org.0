Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83C420A981
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 02:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgFZAEt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 20:04:49 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:35401 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725767AbgFZAEt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 20:04:49 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 076105C2;
        Thu, 25 Jun 2020 20:04:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 25 Jun 2020 20:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=YXHHLdVWLue1a90OYvvunJ/aSFi
        gm7A74sQtH6FEw74=; b=qKeCOJw4Bfz56TH27rhWGvW9No5TJbkrdRWMmKkFr4A
        TpnBWhzAo403xwrhM5izzGvmfKMxkcEg6IG95BhQqs6SgBAya3HdXiMJq6aytscN
        17ROq/g3OL9i+x3dJ5+CFuPAE1PVP6KuObrrvGuEYj0JvXqwjtMtYqnEPc3GkWBJ
        U/PbWCw4cUblOdgT4izH9wjJYJbxGzw8nLOn17hAPcFWaOOr/sLLyHoDVDsSsGbR
        zmEz/66KaUhn/0+J1V8bpCx9KwXuFGAYGJegZJgqEEhDMCXKlMmp4svjts6xyYgH
        TtQluPck++jATQlFAfZttpC0+HWgkpik8Knqj4vJoeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YXHHLd
        VWLue1a90OYvvunJ/aSFigm7A74sQtH6FEw74=; b=FYMJb1Z+eEvCn7inHvdogX
        djswW68jAQl7JAyWpMdBIdNR1NMoA7O9EAhlRSmgXf+FSQmqPZPh0KjngRUDudDO
        SamyazQa8HoLAlRfLVhUaZoFTU+wsM2kNoO2d79nmEJ/IL9/fhn0an9nFo9Yued2
        EyLI+NtgDgwG3xM1+dc7Ag234GAALGnJRh1xit6l+7SSLAefHn3kyglqPTSRy76M
        OvQDaKGtw6Vc4ljVVCd3+nKYv8YE27VR1qDm2Aqd0NnruhJt48wnhHbwSQcv4gTm
        vqmdhV6BX9XqaUto5/N6rLlWK5UxnMRVPU4+vMT3vWzYxMx643VpcBag4RYYgaxA
        ==
X-ME-Sender: <xms:njv1XkBKStrWAITu9GNXGq4ZQmq_fTdZ_fu3cI7gTWNQTqc3KbTI4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeltddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:njv1Xmg5TeuClvhj1NCwyPXodXO7fmom88Cqe4iEw4LdQJ9nZaKlDQ>
    <xmx:njv1Xnk5taTZlDvSdyQt_xN9-KZL4IzORUb8XXX1xbCkhTPfxUDG1A>
    <xmx:njv1XqyaOyFTt-VV368eEryQ8W6gm9YfM_-D4qq_mk0ZKCl_kZ8IuQ>
    <xmx:nzv1XrcIkQ0prQej0H103aNU-V5EdyZfhPDXJ5hXxniADW6l5mVvrQ>
Received: from koala (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 40440328005A;
        Thu, 25 Jun 2020 20:04:44 -0400 (EDT)
Date:   Fri, 26 Jun 2020 10:04:39 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200626000439.GA108136@koala>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
 <20200606181806.GR89269@dtor-ws>
 <20200612194619.0ac97cf2@primarylaptop.localdomain>
 <20200614235735.GA11069@koala>
 <20200623182540.0ed5de81@primarylaptop.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623182540.0ed5de81@primarylaptop.localdomain>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 23, 2020 at 06:25:45PM +0200, Denis 'GNUtoo' Carikli wrote:
> On Mon, 15 Jun 2020 09:57:35 +1000
> Peter Hutterer <peter.hutterer@who-t.net> wrote:
> > > > Event: time 1585880998.920994, type 3 (EV_ABS), code 57
> > > > (ABS_MT_TRACKING_ID), value 0 Event: time 1585880998.920994, type
> > > > 3 (EV_ABS), code 53 (ABS_MT_POSITION_X), value 400 Event: time
> > sorry, but this is completely unreadable. Please make sure it's in the
> > originally formatting that evtest/evemu/libinput record spit out.
> > Thanks.
> Indeed.
> 
> I'm sorry about that, I didn't see it while sending the mail.

thanks for the log. Basically - the problem is that ABS_MT_TOUCH_MAJOR and
ABS_PRESSURE are completely unrelated on the device and the latter has
apparently random values. 1585880999.248531 is an event where you go from
almost max pressure to 0 without changing touch major.

Since pressure is more common, you'll have to expect that userspace may
ignore major/minor and handle pressure instead where available. Doubly so
since historically the major/minor value range has been completely random
while pressure was at least somewhat predictable. In this sequence, your
touch major ranges from 4-14 despite the axis range being 0-255.

Historically, pressure has also been used as equivalent to touch size, so
decoupling touch size and pressure is tricky anyway. Speaking from
libinput's POV I would disable ABS_(MT_)PRESSURE in this device since it's
not reliable to detect a touch. But then we'd still need a quirk in place to
tell us what the possible touch major range could be to make sense of that
number.

Cheers,
   Peter

> Event: time 1585880999.248531, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 1210
> Event: time 1585880999.248531, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 14
> Event: time 1585880999.248531, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), value 244
> Event: time 1585880999.248531, type 3 (EV_ABS), code 1 (ABS_Y), value 1210
> Event: time 1585880999.248531, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 244
> Event: time 1585880999.248531, -------------- SYN_REPORT ------------
> Event: time 1585880999.259798, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 1208
> Event: time 1585880999.259798, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), value 0
> Event: time 1585880999.259798, type 3 (EV_ABS), code 1 (ABS_Y), value 1208
> Event: time 1585880999.259798, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 0
> Event: time 1585880999.259798, -------------- SYN_REPORT ------------
