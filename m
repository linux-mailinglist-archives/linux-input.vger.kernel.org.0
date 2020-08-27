Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0350225494D
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 17:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0PXs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 11:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgH0PXf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 11:23:35 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E44FC061264
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 08:23:35 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id i129so3017145vsi.3
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VkbmFMAUu/OBHoxa4cBZaCInutsLnd8auOuEwVf5FtQ=;
        b=vLEfuEQlfZFQoED91Ogcn7Z0Cc0RkZWR7n4LDtG8boqgSMAKe6vCSNOdKpfRHmkFWZ
         UGJ5s/UThdg4QgDJ7Vs5dfOrUeKuVZPC2RbLNmmX4gQANxt5uH+RlGg53GX60pL7jn/4
         YtB/mK8eNedJRYw0xzywP41fzBWhq19S6KsIxgiOVA76OqDC73evGc96is2II9QxJ24n
         qt7ixCDZlpN+htJqS15F5PZyjknQuEObQJbEcSJKHfXS80y8PZ2ztYhY6FtsTRBF7QCf
         XcIq82JMfSB7bmByYD/mkYFDIpVo8mEvdKaVHoWtjwGakC+Eo7EERR0mn/G79y4Ww9Oy
         sFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VkbmFMAUu/OBHoxa4cBZaCInutsLnd8auOuEwVf5FtQ=;
        b=G9rDEDWqc6ubyVB9mPA8/ih3WSrOQfZGy9cty6bCEvpN7YnfMp/dV6BxR8eqo5Cbfl
         HXWOTCsTMjHT7dnD0UW/uAsQ9QtQ/GdcNKEp2LQfW1LIT9qYhGIKtUgwR+hNeJsFhCCw
         t2Ug0n7F6R4OgHHJbL77T+4GW6POu+DyUEQ/6+f8/fnmR/TIXtI2BG0XK9OcuOKU8HiU
         /gi02PicMtuM5BRJ9nZ4pxL+aJmw5UexitGkSNx4GhJCv9C/Dg1SEGkjv3OyKRSdwUrC
         UbX/6hjHF31SVT2HJlCELVEI4RsI9iOO9mtRgYy2DSzr1Zqtn09E2kczXc8MfOMXeyDR
         XO6Q==
X-Gm-Message-State: AOAM532UsdEw5m7yrL1DL5VdSH305dH1+SJqQsR/ipAEkx7yuZF3pWnM
        Mb2VkIdeOkT/Y90NM/5SsJaErdSboG/t0MBYyLk=
X-Google-Smtp-Source: ABdhPJxmMneToADfBHuU3dCg/lsXxlzmk1UpcgfkB2gzkjMYlbAwYOSdiHh2pQecc7z1ZPlGZCw6Y5aD3pDgXBWz2X4=
X-Received: by 2002:a67:f696:: with SMTP id n22mr12115600vso.48.1598541813921;
 Thu, 27 Aug 2020 08:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200823044157.339677-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2008271121150.27422@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2008271121150.27422@cbobk.fhfr.pm>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Thu, 27 Aug 2020 10:23:22 -0500
Message-ID: <CAEVj2tmgHg1zL4yAJKhcSmZZDw=odyvrxKAwKYOCC4zg-JMZwQ@mail.gmail.com>
Subject: Re: [PATCH v12 00/14] HID: nintendo
To:     Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <thunderbird2k@gmail.com>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Bastien Nocera <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>
> Could you please elaborate a little bit better about this conflict?
> hid-steam and hid-nintendo seem to be supporting different VID/PID
> combinations, so that's not the conflict I guess.
>
> Is Steam implementing some (proprietary?) userspace driver for conflicting
> VID/PID with hid-nintendo, using hidraw?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Hi Jiri,

Yes, Steam implements its own userspace driver using hidraw for the
nintendo switch pro controller. As things stand now, this can lead to
issues when running Steam while the hid-nintendo driver is in use,
where userspace and the kernel can be both sending reports to the
controller. My understanding is that hid-steam uses a virtual hidraw
device to workaround a similar issue with the steam controller
(backing off and not sending reports when it sees hidraw in use).

hid-nintendo does set the most significant bit of the the hid device's
version to allow userspace to distinguish from the standard hid driver
(same thing hid-sony does for things like libSDL mappings). Maybe that
will be sufficient for applications to choose whether to use their own
userspace driver or not. I'm not sure if that's considered acceptable
in the spirit of trying not to break userspace functionality.

Thanks,
Daniel
