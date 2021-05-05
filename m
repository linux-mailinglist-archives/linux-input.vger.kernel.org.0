Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21021373C77
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 15:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhEENhP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 09:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32367 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230159AbhEENhP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 09:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620221778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=paZri6DDJM/Db218sMumLdrBa5S8vl/6P+3gV0dtjqw=;
        b=Rl6Bp3P9WX7PCSzp3iLgItwLPGaY20RFoquMq8iBq2YwPAe/pGmsoSi5zmRxX6fYQhS75A
        HDUso8JSHDp3fUbSWiwSi8hGEX7nlZgsxEaz+VQ0GmAZm9NHuPk1L8MU1d+DCogYSR1UGx
        drHclICefim523fiF9IY9cYj1IavIoM=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-1SXE4DnNPciz-neI7IFLzQ-1; Wed, 05 May 2021 09:36:16 -0400
X-MC-Unique: 1SXE4DnNPciz-neI7IFLzQ-1
Received: by mail-pg1-f199.google.com with SMTP id r22-20020a63ec560000b029020eba8e44f7so1351215pgj.4
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 06:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paZri6DDJM/Db218sMumLdrBa5S8vl/6P+3gV0dtjqw=;
        b=EKI87zPKLITPw3L1snGfJvDAMNUEVAbS0D7S2tPK2wtgJTQfSEv6tmzmxIarWFQpNF
         /HzcaUTb13SlRSBk3rOhSgyMyJq6qF8RtW95btpuHe0PX92cECuDCSJkYXShgSFqz1LL
         uNyJ7LwHcRBRu5Sdxcy45olNuotDBlOJ8kSkmaELBIBDDI48a66Jm6yuXUwQJaB1Y1kS
         Q4NkFH0UzBEAuKmG5FRq+lcUU0yyNzyOPieLamjLJkOxMFTD1zkpHqXM1AR84ZhSmWBB
         bH1O8ttTOGRGurvyt7LobINm6k8XFGyaP1hopP9LQx50VAQyvcwcTV3MXT71kfIKIBaY
         FdGA==
X-Gm-Message-State: AOAM532ClXdZPsHdPI48+EesO36212sUiA27SWbrc72H++IRv4E2fh5C
        6NwaEN5w8DRJ/fFpsXTkuSo/vx1wOJ6CbVop4CHtnsP1uiYSHOQHibA5fjfz1c2TTCpFW16AXmw
        zWp7wN1EdS8M2fiMklMKfnWcZNaDkX/XxK3ss1s0=
X-Received: by 2002:a17:902:9898:b029:ee:9128:f53f with SMTP id s24-20020a1709029898b02900ee9128f53fmr31332462plp.32.1620221774778;
        Wed, 05 May 2021 06:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZN/t6C4n1Gy6DbK0LDWi+B1xQaWclHeHDN2IhwMpArrXVZS4MFIElAq9nemZPhsqXaI5XRX9d1v4w/kovASY=
X-Received: by 2002:a17:902:9898:b029:ee:9128:f53f with SMTP id
 s24-20020a1709029898b02900ee9128f53fmr31332442plp.32.1620221774552; Wed, 05
 May 2021 06:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210306133716.453447-1-hdegoede@redhat.com> <nycvar.YFH.7.76.2103311141060.12405@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2105051423470.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2105051423470.28378@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 5 May 2021 15:36:03 +0200
Message-ID: <CAO-hwJLsSuago7ZPMPjPi5HLFVH7kiJ-riM56EefABkMJjD2yA@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: asus: Cleanup Asus T101HA keyboard-dock handling
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 5, 2021 at 2:24 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 31 Mar 2021, Jiri Kosina wrote:
>
> > > There is no need to use a quirk and then return -ENODEV from the
> > > asus_probe() function to avoid that hid-asus binds to the hiddev
> > > for the USB-interface for the hid-multitouch touchpad.
> > >
> > > The hid-multitouch hiddev has a group of HID_GROUP_MULTITOUCH_WIN_8,
> > > so the same result can be achieved by making the hid_device_id entry
> > > for the dock in the asus_devices[] table only match on HID_GROUP_GENERIC
> > > instead of having it match HID_GROUP_ANY.
> >
> > Benjamin, could you please Ack this series, as it touches hid-multitouch,
> > please?
>
> Benjamin, friendly ping on this one.
>

Sorry for being such a bad co-maintainer... :(

This one completely fell through the cracks.

I have no objections for 1/3 and 2/3. I'll comment on 3/3.

Cheers,
Benjamin

