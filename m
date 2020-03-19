Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF5E18AAA1
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 03:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCSCXl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 22:23:41 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59757 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCSCXl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 22:23:41 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id B4164731;
        Wed, 18 Mar 2020 22:23:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Wed, 18 Mar 2020 22:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Q
        J6VgA9GCMrQDzsqr9+ykTR/nUPvG0fbwxidI4X0tLM=; b=FdtRg9aCnX1I9InM4
        VVdeu3YFDXCBgOJlO4nqW+gwggY/MxecYBZdk2a8cYRCwsVcWA1d518IZVcQ92dn
        2pzFvXAFEHF3uyer8vZJhW3xF9AX1DpLTVqLjtWmo3e+90vlebJeft/y6nnbWXBD
        CWZmcFUOwSscd4VuQXTQmMScQpF1Fw32FiYoPGXo8fMWaodyExy8EETUXdovh67p
        bC7gDoHaBKDE/aRuz6eTZGTp+aLFBsWbA5+PByMr10nQLZu0Quko9lMsVpHgUwsj
        a6kAkzbMt/75UfDfB0OIYx5wSjzKQu+h6i7zj3txtv9PY4JRiRd4Pi3/8m7+2IO5
        18M7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=QJ6VgA9GCMrQDzsqr9+ykTR/nUPvG0fbwxidI4X0t
        LM=; b=1ilLJKOHYLMFzD/cXAvNgy+EAXggg+angcm5t7egRpBPnG1TTr4EUlRZq
        LFgLGuqeLj601lVN4vRyyi2xzIToHx7U2GhZeOf6Ddhl5Cu45TIcqseoACv9w342
        OBF0ILomIA+f721pD5iZos4tUVaszRqTooL+ERdQFoGiDU5ybRNgcqVnSK7u+26/
        qw+EfZPE6IXf1YaxBkX4gb7kzOjo4WhliT9yD/Z6qIuFLfvpozuOqFJ7xVBjkYQx
        R2HVJLhZNa2O8qQfxQ4NcME51G3F2nTNxrcr/yRg3BgAL99fBxeCbqVcIlqNkPZo
        l0C6griq2aKZ4Tb8KD8Q6L9I4Zsew==
X-ME-Sender: <xms:qtdyXkPtRTT-401mCiXYbAgwZnkspmW6o1-mGW1y7cX714Su_w37FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefkedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucfkphepuddujedrvddtrdejuddruddtleenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhoh
    dqthdrnhgvth
X-ME-Proxy: <xmx:qtdyXmaFSjfk_wBQYjeYZ_AOLLKNCRvdtHZ_3Tc3HPLWpYoLrIBFqQ>
    <xmx:qtdyXuyDh3TjnyNtBZrsaLoeJH90SS3ZFqjtx7WfoCV0QV-SWf3c8g>
    <xmx:qtdyXhIa9r5gFnOPksFfEiBtNHvNGUiuLkzmVa24UNeCwjylberAcQ>
    <xmx:q9dyXo6ZfZrFnzD7jeQE4cBwoElB4ITuwjwq9jQhnlqlPHrJKyY4lA>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id ECC3F328005A;
        Wed, 18 Mar 2020 22:23:35 -0400 (EDT)
Date:   Thu, 19 Mar 2020 12:23:31 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mario Limonciello <superm1@gmail.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device
 connection
Message-ID: <20200319022331.GA2384843@jelly>
References: <20200318161906.3340959-1-lains@archlinux.org>
 <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com>
 <e8ea0c2e-445f-21e2-a248-3368f26bf391@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ea0c2e-445f-21e2-a248-3368f26bf391@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 18, 2020 at 06:20:03PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/18/20 6:15 PM, Mario Limonciello wrote:
> > On Wed, Mar 18, 2020 at 11:19 AM Filipe Laíns <lains@archlinux.org> wrote:
> > > 
> > > As discussed in the mailing list:
> > > 
> > > > Right now the hid-logitech-dj driver will export one node for each
> > > > connected device, even when the device is not connected. That causes
> > > > some trouble because in userspace we don't have have any way to know if
> > > > the device is connected or not, so when we try to communicate, if the
> > > > device is disconnected it will fail.
> > > 
> > > The solution reached to solve this issue is to trigger an udev change
> > > event when the device connects, this way userspace can just wait on
> > > those connections instead of trying to ping the device.
> > > 
> > > Signed-off-by: Filipe Laíns <lains@archlinux.org>
> > > ---
> > >   drivers/hid/hid-logitech-dj.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> > > index 48dff5d6b605..fcd481a0be1f 100644
> > > --- a/drivers/hid/hid-logitech-dj.c
> > > +++ b/drivers/hid/hid-logitech-dj.c
> > > @@ -1464,6 +1464,8 @@ static int logi_dj_dj_event(struct hid_device *hdev,
> > >                  if (dj_report->report_params[CONNECTION_STATUS_PARAM_STATUS] ==
> > >                      STATUS_LINKLOSS) {
> > >                          logi_dj_recv_forward_null_report(djrcv_dev, dj_report);
> > > +               } else {
> > > +                       kobject_uevent(&hdev->dev.kobj, KOBJ_CHANGE);
> > >                  }
> > >                  break;
> > >          default:
> > > --
> > > 2.25.1
> > 
> > The problem that will remain here is the transition period for
> > userspace to start to rely upon
> > this.  It will have no idea whether the kernel is expected to send
> > events or not.  What do you
> > think about adding a syfs attribute to indicate that events are being
> > sent?  Or something similar?
> 
> Then we would need to support that attribute forever. IMHO the best
> option is to just make a uname call and check the kernel version, with
> the code marked to be removed in the future when kernels older then
> $version are no longer something we want to support.

Also note that we may not have access to /sys.

Cheers,
   Peter
