Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF362D2EF0
	for <lists+linux-input@lfdr.de>; Tue,  8 Dec 2020 17:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbgLHQBS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Dec 2020 11:01:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:51714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729929AbgLHQBS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 8 Dec 2020 11:01:18 -0500
Date:   Tue, 8 Dec 2020 16:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607443237;
        bh=rgEunstMpibfhWp7GUnqRGdLLMgBZwXcZaxMILL0EII=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=pIKqcHzTM1UvXwH8uSjPdHgySB79HwWsQFruel6Dt5/oB4Bnmx0SZwzHcM57S8WNr
         YvNeQC0ScX+PX2j6S4DxYz06eZJEyydRDkvGrcAo2LEl7QdHB7X17Src/kmQw3znzn
         5CTSkV/aXTZYsuq9mMp/Cxqopzb1mKQWNgb8ILrwCNDFhqMiWDbx/5bDpC1wapl81u
         YvYQ7gg8jS/SBwwsfND4MrUA6+2P0Lbp2yN79dn5kXzj+yOqeAG9V+6fekSbQgJq6I
         cu661oYFIZ5qbqy/GTQUOtM5vBipbHFHiSF01AfN9T+U4JWTlQZyIRKbrqmtSUbCiU
         tirCf7gj/WmOQ==
From:   Will Deacon <will@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Rob Herring <robh+dt@kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <jikos@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Olof Johansson <olof@lixom.net>, Pavel Balan <admin@kryma.net>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/4] HID: i2c-hid: Reorganize to allow supporting
 goodix,gt7375p
Message-ID: <20201208160029.GA6461@willie-the-truck>
References: <20201112004130.17290-1-dianders@chromium.org>
 <CAD=FV=W122aWPbg7Fo=zg+QmK7DHBcYTQ6CjPawLhucd4Rtw9A@mail.gmail.com>
 <CAO-hwJ+amboty_wKzP3n11mHLfssGz8Npzdfu9QrcipEvu3VHA@mail.gmail.com>
 <CAD=FV=VkyF8B9stozXv_Xt7a-Od4-1f2h6QS5DDekiZCQhXjgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VkyF8B9stozXv_Xt7a-Od4-1f2h6QS5DDekiZCQhXjgw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 02, 2020 at 07:54:40AM -0800, Doug Anderson wrote:
> On Wed, Dec 2, 2020 at 7:20 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > On Tue, Dec 1, 2020 at 10:12 PM Doug Anderson <dianders@chromium.org> wrote:
> > > On Wed, Nov 11, 2020 at 4:41 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >  .../bindings/input/goodix,gt7375p.yaml        |  65 +++++
> > > >  arch/arm64/configs/defconfig                  |   3 +-
> > > >  drivers/hid/Makefile                          |   2 +-
> > > >  drivers/hid/i2c-hid/Kconfig                   |  47 +++-
> > > >  drivers/hid/i2c-hid/Makefile                  |   6 +-
> > > >  drivers/hid/i2c-hid/i2c-hid-acpi.c            | 159 +++++++++++
> > > >  drivers/hid/i2c-hid/i2c-hid-core.c            | 254 +++---------------
> > > >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 116 ++++++++
> > > >  drivers/hid/i2c-hid/i2c-hid-of.c              | 143 ++++++++++
> > > >  drivers/hid/i2c-hid/i2c-hid.h                 |  22 ++
> > > >  include/linux/platform_data/i2c-hid.h         |  41 ---
> > > >  11 files changed, 596 insertions(+), 262 deletions(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-acpi.c
> > > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > > >  create mode 100644 drivers/hid/i2c-hid/i2c-hid-of.c
> > > >  delete mode 100644 include/linux/platform_data/i2c-hid.h
> > >
> > > Are there any additional changes that folks would like with this
> > > series?  It's not crazy urgent to get it in, but it touches enough
> > > lines of code that it'd be nice to get it in before other patches land
> > > and it gets merge conflicts.
> >
> > Sorry for the delay. I was having an internal deadline last week. I
> > just re-read the code, and I am quite happy with it. I also just
> > tested it on the i2c-hid w/ acpi machine I have here, and it seems OK.
> >
> > So other than that, do we need to have approvals for patch 2/4
> > (arch/arm64/configs/defconfig)? I can easily take that in the HID
> > tree, but I prefer having the approval from the maintainers first.
> > Catalin, Will?
> 
> From my past knowledge of the arm64 defconfig, I think it's a bit of a
> free-for-all, sort of like updates to the "MAINTAINERS" file.  Doing a
> "git log" on it I see commits happen from every corner and very few of
> them have Acks.  I think many (but not all) of the commits to this
> file go through trees that feed into the SoC tree (Arnd and Olof)
> because those maintainers care about enabling drivers for boards that
> they're supporting, but changes come from elsewhere too.
> 
> Obviously an Ack wouldn't hurt, though.  Since get_maintainer points
> at Will and Catalin I wouldn't say no if one of them wanted to Ack
> patch #2 in the series.  ;-)

For the avoidance of doubt:

Acked-by: Will Deacon <will@kernel.org>

on patch 2. But yes, although there are a few things I really care about
in defconfig (e.g. things like page size!), generally speaking we don't
need to Ack everything that changes in there.

That said, might be worth checking whether arm-soc have any defconfig
changes queued in -next so you don't end up with conflicts.

Will
