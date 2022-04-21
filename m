Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB8509AA2
	for <lists+linux-input@lfdr.de>; Thu, 21 Apr 2022 10:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386648AbiDUI2u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Apr 2022 04:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386600AbiDUI2s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Apr 2022 04:28:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770E465EC
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 01:25:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DEE21B82145
        for <linux-input@vger.kernel.org>; Thu, 21 Apr 2022 08:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834B4C385A5;
        Thu, 21 Apr 2022 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650529556;
        bh=aKYDSu/PSrKRC+sI+qOLzCdKT5W2P/ahBSJfG5iv5nA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=n8Z0wmzDwsE3UAOvro29hYi/fkUSVCJ1f2xOV0cTfgL9GbhePHhPu0bFLYmLzZ2Yv
         MUjaRNRUnXaepPpVBnQJbFiSNuLhppZ5I/rF0XpVIe+VnEQk97ArwX9tlNCjAbxhmm
         QkPLTU78JWsHYV7RMKb6CHbLFIBsZqskVuIYk/PDprdMxjcwH0j/FeRRQrfikBkRR5
         j1/yLQuUC6NMaJsnqY70GVvFUrC48FnEDBr+nLOdrd3iHmJnWhDx0AWCQufR+OqY0Y
         SEVV1msgfzELVkWJH3PeO39cJq2GAl5Cmw997rXUx/P57CCdywxp6inAVs9G6mffSO
         qvvK6xCES0Zjg==
Date:   Thu, 21 Apr 2022 10:25:52 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     =?ISO-8859-2?Q?Marek_Ma=B6lanka?= <mm@semihalf.com>,
        linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v2] HID: multitouch: Add support for Google Whiskers
 Touchpad
In-Reply-To: <CAO-hwJKa5t3zaM5a_uLAj3v=uDORAdUqnxUTszNTgQ2wFgXJyw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2204211024490.30217@cbobk.fhfr.pm>
References: <17e7b7ad-1a5b-d813-888f-abea0aa099b1@semihalf.com> <nycvar.YFH.7.76.2204210945560.30217@cbobk.fhfr.pm> <CAO-hwJKa5t3zaM5a_uLAj3v=uDORAdUqnxUTszNTgQ2wFgXJyw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Apr 2022, Benjamin Tissoires wrote:

> > > The Google Whiskers touchpad does not work properly with the default
> > > multitouch configuration. Instead, use the same configuration as Google
> > > Rose.
> > >
> > > Signed-off-by: Marek Maslanka <mm@semihalf.com>
> > > ---
> > >
> > > Changes in v2:
> > >   - As a HID device group use HID_GROUP_MULTITOUCH_WIN_8.
> > >
> > >  drivers/hid/hid-multitouch.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > index 99eabfb4145b..87a92f2654c0 100644
> > > --- a/drivers/hid/hid-multitouch.c
> > > +++ b/drivers/hid/hid-multitouch.c
> > > @@ -2178,6 +2178,9 @@ static const struct hid_device_id mt_devices[] = {
> > >       { .driver_data = MT_CLS_GOOGLE,
> > >               HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
> > >                       USB_DEVICE_ID_GOOGLE_TOUCH_ROSE) },
> > > +     { .driver_data = MT_CLS_GOOGLE,
> > > +             HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
> > > USB_VENDOR_ID_GOOGLE,
> > > +                     USB_DEVICE_ID_GOOGLE_WHISKERS) },
> >
> > This device is already claimed by google-hammer driver though ... ?
> 
> See my answer at [0].
> 
> hid-google-hammer entry is using the group HID_GROUP_GENERIC, and here
> we use HID_GROUP_MULTITOUCH_WIN_8, so the 2 are not stepping on each
> other's toes.
> 
> FWIW:
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Cheers,
> Benjamin
> 
> [0] https://lore.kernel.org/linux-input/CAO-hwJ+18Ce_A8F-QVp=TJj2iu60r=f4MkrktYbou-rkXsj+mA@mail.gmail.com/

Gah, sorry, I missed that one. I've now applied the v2 patch.

-- 
Jiri Kosina
SUSE Labs

