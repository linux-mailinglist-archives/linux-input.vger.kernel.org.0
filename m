Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5985A7C2FC
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 15:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388173AbfGaNKu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 09:10:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38618 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387696AbfGaNKu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 09:10:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so31861676pfn.5;
        Wed, 31 Jul 2019 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rt+guMwNhJRHRn5IfYwFQ/sgOXInz6KxTo8lw7aiy5o=;
        b=gs78//H7LNShCsnjSw8NmM/oTXR89tctjqExwGarNFR1HPDda39C7FVxzEan5zMHdK
         6cB24JjcjAbQy8XtUkZodo4u6df686F71Mv/q7oDld/FoFf/tUwpH8Ya396ePXCTfD0o
         Dvgu62a6MeZYYZInpUcG3Fb+JTJxaZenxvpq3gvsy/xll4qitJKWbPeGlVPtgYnCNQLR
         EPlshKNhjkQhbqyB0pQFFls299RawuFj12qdOUx2n+J0Ko7JvNfb1x0RR0EIG+LYodIQ
         anMWP0EuZVFFnYgh1OC+Xwui/N0TFC1OY/jUToGF5CcotzxoYJGX807D8jgfAJdSfeIG
         A3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rt+guMwNhJRHRn5IfYwFQ/sgOXInz6KxTo8lw7aiy5o=;
        b=AKNGKz1NtvTBgOAbu8I2A5LswhiiCsbRGQo1k0WuPz+zduq/1J1WGhxG+qAQ2JUqR2
         MXI+EiUVYJo62eLJ1gc1oJECx1+16LeD+WaUc/JV5bETsTRQiawmw6J2wt5GihJI/7gf
         R2UaYKegKDa9K6jkhHx2HwJX+1J7X/9+Wzg6XCSdWDXWGYx+pbO/ji+2P4hMRIDTe8QS
         8bCoRqhdfVzhnxipUpOCv7davMDbPNEmYNxKTzJ4UBaPS0vVvye8IDwgNGcImndr8RsU
         SETIypH1VSr0BMQ9lS1oRaaoyFVSMJVub8rhkKdW/39EZb7jjLmy49rWZpzAVCU08CXz
         0/DQ==
X-Gm-Message-State: APjAAAWSYtsBZ7sJmtWhURZmTWbNtCJf6wkbjZybXoEHSsXcze9ImAfQ
        IhWEXnlpSBiAuY4+qBC5fTQ=
X-Google-Smtp-Source: APXvYqw6zrs3C36FlP+BQfVYwpgNJ/uT+OXNK7FouVI0RYpGcs21O7mEWzL/gYHEOWg9kiuYl3v9Hg==
X-Received: by 2002:a17:90a:b908:: with SMTP id p8mr2967626pjr.94.1564578649195;
        Wed, 31 Jul 2019 06:10:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r12sm47427239pgb.73.2019.07.31.06.10.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 06:10:48 -0700 (PDT)
Date:   Wed, 31 Jul 2019 06:10:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Richard Gong <richard.gong@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups
 easily
Message-ID: <20190731131045.GB147138@dtor-ws>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 31, 2019 at 02:43:39PM +0200, Greg Kroah-Hartman wrote:
> This patch originally started out just as a way for platform drivers to
> easily add a sysfs group in a race-free way, but thanks to Dmitry's
> patch, this series now is for all drivers in the kernel (hey, a unified
> driver model works!!!)
> 
> I've only converted a few platform drivers here in this series to show
> how it works, but other busses can be converted after the first patch
> goes into the tree.
> 
> Here's the original 00 message, for people to get an idea of what is
> going on here:
> 
> If a platform driver wants to add a sysfs group, it has to do so in a
> racy way, adding it after the driver is bound.  To resolve this issue,
> have the platform driver core do this for the driver, making the
> individual drivers logic smaller and simpler, and solving the race at
> the same time.
> 
> All of these patches depend on the first patch.  I'll take the first one
> through my driver-core tree, and any subsystem maintainer can either ack
> their individul patch and I will be glad to also merge it, or they can
> wait until after 5.4-rc1 when the core patch hits Linus's tree and then
> take it, it's up to them.

Maybe make an immutable branch off 5.2 with just patch 1/10 so that
subsystems (and the driver core tree itself) could pull it in at their
leisure into their "*-next" branches and did not have to wait till 5.4
or risk merge clashes?

Thanks.

-- 
Dmitry
