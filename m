Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB31253170
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 16:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgHZOgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 10:36:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:23263 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgHZOfr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 10:35:47 -0400
IronPort-SDR: MN/NY1PSzHT0FMSWfpX14wA3epohMBYxMcbCNudZZhLK+VFeAvlqA0WJK67J4IfrTujnZgryL6
 8NB34j9E72ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157334197"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="157334197"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 07:35:46 -0700
IronPort-SDR: ERO3Vp223nHcwzMdJu2q8LBV95WtT65p2adjpKW7iXxrfjdtOKBAMMu135xURYqyiifn+VXH4+
 HA9aIRmjQBmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="403080252"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2020 07:35:44 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Aug 2020 17:35:43 +0300
Date:   Wed, 26 Aug 2020 17:35:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/5] Make gpio_keys accept board descriptors
Message-ID: <20200826143543.GC813478@kuha.fi.intel.com>
References: <20171124093045.5961-1-linus.walleij@linaro.org>
 <20171125233324.afdt4netamvkrkm2@dtor-ws>
 <CACRpkdb6kt8Bb0FnPoixw97R9oktK9h3uTS7JfdxoCKfLo4yhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb6kt8Bb0FnPoixw97R9oktK9h3uTS7JfdxoCKfLo4yhA@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 03:20:14PM +0200, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Sun, Nov 26, 2017 at 12:33 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Nov 24, 2017 at 10:30:40AM +0100, Linus Walleij wrote:
> 
> > > The goal I'm working toward is to rid the kernel of the global
> > > GPIO numberspace.
> > >
> > > This means GPIO lines should be references by the local offset
> > > on the GPIO chip.
> > >
> > > This patch set starts to move gpio_keys toward using GPIO
> > > look-up tables instead of global GPIO numbers to find their
> > > GPIOs.
> > >
> > > As an example I did (I think) the necessary patches to
> > > convert DaVinci and i.MX to use this. There are several users
> > > also x86 platform devices.
> (...)
> > I think this is a worthy goal, but I wonder if we could get static GPIO
> > descriptors work with fwnode_get_named_gpiod() so we could retire the
> > platform data parsing altogether. We'd need to extend static device
> > properties to have notion of children though.
> 
> Do we have this now? I've looked at Heikki's et al work
> on software nodes but I cannot see whether we are there now.
> 
> We have fwnode_create_software_node() and friends, but
> I haven't seen if this can be used with input and GPIO descriptors
> are still a bit on the side. I can create a lot of properties but
> not really add a descriptor table as a software node as far as
> I can tell. I'm also a bit lost on whether it will be possible
> to get there sadly :/

I'm sorry but I'm not completely sure what is this about? Are software
nodes still missing something that would prevent us from for example
using them to describe the GPIO information exactly the same way it is
described in DT? I don't know if that is what we want, but I'm just
trying to understand what is still missing? Dmitry?

If there is still something missing, then let's fix that.


thanks,

-- 
heikki
