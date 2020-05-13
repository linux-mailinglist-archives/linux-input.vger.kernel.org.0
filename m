Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A4A1D21E5
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 00:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731177AbgEMWU7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 18:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730064AbgEMWU7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 18:20:59 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAA3C061A0C;
        Wed, 13 May 2020 15:20:58 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id z1so772387vsn.11;
        Wed, 13 May 2020 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Febjjj5+WWTqUCbI65lFaOFBjwVkcmzD8E9a3lP4Uv4=;
        b=MdNrrrwcMt5bs37DshmUmoyIMjjh7CB+k9Wk9SQHhdVkyuYOcacp3SASS2JGHQkFZW
         6P6GOR6UyQqrQRzKsmKoQSVSn7Da1sS+IwByJS+VlE4ZThLUdat3cJX4oYY+x1vwVDhw
         NmSmxRfrdXNGNnbQoAWb8hoQ2cIcKtJQ1wkp7+KFnJyqi23qBsaYS/ixGdP3ELSYcwwX
         s3ql3bAdCqGCUM/QoI9AMgSpIlwTlRO9nzyXflHlPNHCw0QL3jewdGahAjnXxpi6JuVJ
         r1cotSeMPSwWva2uv4VGiN7NKdQlUDyGwkvenaCmnDDpOr3mIi1vo8nCILZTJWYz4Zy8
         b4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Febjjj5+WWTqUCbI65lFaOFBjwVkcmzD8E9a3lP4Uv4=;
        b=ZSJJa2Wxr2YUUC3seEXJRfWgApKBKO2GjUOcS3DzLAGDfoHa3t7VD1cwemQ/aoVuDl
         MgNJIMcQ7w+vJPbJcxcRxIJmXs1Lv01Cf8Z9mgUxt/euyKy/ekVtbBE5HQFwY5kskO3a
         +SrE0stTLGmDxRyWuArxst80z4foz06qYas/kyR6NqwafI8USv+Mq1NJqyBh4/L5DMzO
         2OrTmfQxuXv77OEFsWwza5Do750Et/syU+59MZn1dDkZmcS301b8/bx49Xvp670JKGJb
         89bb1/UtFd+Ws2l0XpZs/X6hmhBZvYo5jp0lU7PwsA8muwe3TYH3qiiVD7Tx3+8VrPmg
         jl4g==
X-Gm-Message-State: AOAM532E593tGVK3t4vv5Z2RXvuQAnp7hLVws5T2Z0AFwcanDSXtJLQX
        enCrZKAQ32ot6MnWoj3/MzsR4TRfgr14xoA8YoM=
X-Google-Smtp-Source: ABdhPJxo9EuLqhoKWxflAPUvXZF3mOIP4Fla676O86ZIxPbhYie0qT8N7NxiarKZvsbsx8aJvfTXSAykTIcU6rJym2E=
X-Received: by 2002:a67:c482:: with SMTP id d2mr1227981vsk.37.1589408457816;
 Wed, 13 May 2020 15:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws> <20190802104633.GA14823@kroah.com>
In-Reply-To: <20190802104633.GA14823@kroah.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 13 May 2020 23:18:15 +0100
Message-ID: <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, x86@kernel.org,
        linux-input@vger.kernel.org,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        platform-driver-x86@vger.kernel.org,
        Tony Prisk <linux@prisktech.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Gong <richard.gong@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Greg,

On Fri, 2 Aug 2019 at 11:46, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

>
> I have now done this with patch 1/10.  Here's the pull info if any
> subsystem maintainer wants to suck this into their tree to provide the
> ability for drivers to add/remove attribute groups easily.
>
> This is part of my driver-core tree now, and will go to Linus for
> 5.4-rc1, along with a few platform drivers that have been acked by their
> various subsystem maintainers that convert them to use this new
> functionality.
>
> If anyone has any questions about this, please let me know.
>
> thanks,
>
> greg k-h
>
> -------------------
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers
>
> for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:
>
>   driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)
>
> ----------------------------------------------------------------
> dev_groups added to struct driver
>
> Persistent tag for others to pull this branch from
>
> This is the first patch in a longer series that adds the ability for the
> driver core to create and remove a list of attribute groups
> automatically when the device is bound/unbound from a specific driver.
>
> See:
>         https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> for details on this patch, and examples of how to use it in other
> drivers.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       driver core: add dev_groups to all drivers
>
>  drivers/base/dd.c      | 14 ++++++++++++++
>  include/linux/device.h |  3 +++
>  2 files changed, 17 insertions(+)
> _______________________________________________

Was planning to re-spin DRM a series which uses .dev_groups, although
I cannot see the core patch.
Did the it get reverted or simply fell though the cracks?

-Emil
