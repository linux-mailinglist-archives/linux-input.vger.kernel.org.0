Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F957B8CB0
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 21:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244649AbjJDTUB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Oct 2023 15:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245335AbjJDTTw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Oct 2023 15:19:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D745710C3
        for <linux-input@vger.kernel.org>; Wed,  4 Oct 2023 12:19:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA6C433C7;
        Wed,  4 Oct 2023 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696447176;
        bh=3FSaKmNcY/KBGWB3S3OAjq3HyyrsmZGvQ4iT5ol/e2A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=I6V8Lkh2j371BNP0lxDe7p6kKh50JfAlGQpqd6GvNI9vjATW+D6fWqdabeoYB2ZcZ
         H3wOWPidLs8V01jQJxBz97iiUaOM1rMo25xr+eS+UW9Gcz0LovgL4k+PidEe99zeBo
         HaXDmT3TT8ljaWz+WiQ4E1BXjlWxLCaZSOU94VNROw++Fh+vGu4bZGNcv+C3KvrxTY
         7DoHXm79QY4zPwnEEBbxA4GuV/lQGVum4GvN3umOPgUa/OVi/x1IF97807SbR2695s
         21SdgZ52mSt0eby+RwdX8/0EsZYM7QNNPZREFps9zvG7mpbZyrntFFczdLW4EiVlxi
         EscjG+VsFq75w==
Date:   Wed, 4 Oct 2023 21:19:32 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
cc:     Danny Kaehn <Danny.Kaehn@plexus.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Ethan Twardy <Ethan.Twardy@plexus.com>
Subject: Re: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
In-Reply-To: <ZQwQDZD3Yj9JFgMz@smile.fi.intel.com>
Message-ID: <nycvar.YFH.7.76.2310042118370.3534@cbobk.fhfr.pm>
References: <20230919212245.483646-1-danny.kaehn@plexus.com> <ZQrt6k/usVXlB223@smile.fi.intel.com> <216f73660b7c55ab247345120468d0cd9463e622.camel@plexus.com> <ZQwQDZD3Yj9JFgMz@smile.fi.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 21 Sep 2023, andriy.shevchenko@linux.intel.com wrote:

> On Wed, Sep 20, 2023 at 07:10:15PM +0000, Danny Kaehn wrote:
> > On Wed, 2023-09-20 at 16:04 +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 19, 2023 at 04:22:45PM -0500, Danny Kaehn wrote:
> > > > Previously the cp2112 driver called INIT_DELAYED_WORK within
> > > > cp2112_gpio_irq_startup, resulting in duplicate initilizations of the
> > > > workqueue on subsequent IRQ startups following an initial request. This
> > > > resulted in a warning in set_work_data in workqueue.c, as well as a rare
> > > > NULL dereference within process_one_work in workqueue.c.
> > > > 
> > > > Initialize the workqueue within _probe instead.

I have applied the patch now, thanks.

> > > Does it deserve a Fixes tag?
> > 
> > I'm not sure -- it does technically fix 13de9cca514ed63604263cad87ca8cb36e9b6489
> > (HID: cp2112: add IRQ chip handling), but does not apply cleanly to that
> > revision (a.e. with git am)

From my very own direct experience I can assure you, that the Fixes: tag 
is being heavily used outside of -stable process: e.g. by distros who 
don't base on -stable on purpose.

Thanks,

-- 
Jiri Kosina
SUSE Labs

