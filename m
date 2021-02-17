Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D019231E296
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 23:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhBQWim (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 17:38:42 -0500
Received: from chill.innovation.ch ([216.218.245.220]:46888 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbhBQWfq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 17:35:46 -0500
Date:   Wed, 17 Feb 2021 14:34:40 -0800
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch DD83B641387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1613601280;
        bh=hrCqOktxWH8gGcBmBtZ5Sz0GQaLvLl4sZU2pzZlHrWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QUCtJBALr8Xvqb80iRCFaYJiiuzl0DbLcpR+fFjP5B1dsUccr2yF8wyRm+LeCj23T
         eFs3AY5o60UNMKxJb5D5xxEgcFmKSXoHvTqp1qOnxyTJKNmgBVHxgjv6c97g1l6uJ+
         N5hmVvSfB2zbfOqFuFGU+kzp5jQNA5d6uEH9pBLEE9wrIVI43vjqO9FwlvitFCZMc+
         Za2ghMkqskOdIlIbmKp+HyEhZPmFUDkTF6VVcWTOWei4bMm0sCZcgnjtoOstWiJeb5
         0ZqpLdRy0PapYmYk1aZekztbHbzQx9ZSPbeYPouVwkK0PfqZdFYnOry6ywR1UuRVxX
         59VQMg95ZOPnQ==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: applespi: Add trace_event module param for
 early tracing.
Message-ID: <20210217223440.GC25685@innovation.ch>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <20210217190718.11035-3-ronald@innovation.ch>
 <YC176rlGQeyKuOpn@google.com>
 <20210217205257.GB25685@innovation.ch>
 <YC2FUwOdIoKKg1Ew@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YC2FUwOdIoKKg1Ew@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


  Hi Dmitry,

On Wed, Feb 17, 2021 at 01:06:27PM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 17, 2021 at 12:52:57PM -0800, Life is hard, and then you die wrote:
> > 
> > On Wed, Feb 17, 2021 at 12:26:18PM -0800, Dmitry Torokhov wrote:
> > > 
> > > On Wed, Feb 17, 2021 at 11:07:18AM -0800, Ronald Tschalär wrote:
> > > > The problem is that tracing can't be set via sysfs until the module is
> > > > loaded, at which point the keyboard and trackpad initialization commands
> > > > have already been run and hence tracing can't be used to debug problems
> > > > here.
> > > > 
> > > > Adding this param allows tracing to be enabled for messages sent and
> > > > received during module probing. It takes comma-separated list of events,
> > > > e.g.
> > > > 
> > > >   trace_event=applespi_tp_ini_cmd,applespi_bad_crc
> > > 
> > > You can unbind and rebind a device to a driver via sysfs as many times
> > > as needed (see bind and unbind driver sysfs attributes), so I believe

Ok yes, that works well, except for the boot-debug scenario.

> > Hmm, I'm going to have to play with that a bit, but one place it still
> > won't help I think is something we ran into in practise: init was
> > failing during boot, but was successfull later on.
> 
> Maybe compiling module as a built-in and then using kernel command line
> option to initiate the trace would work?

My personal issue with this is the fact that most folks reporting
issues are running their distro's standard kernel, which invariably
has this (and most others) compiled as a loadable module; and asking
folks to rebuild their kernel is actually quite a hurdle for them, in
particular compared to asking them to just add some boot params or
manipulating some sysfs entries. So I prefer to try to provide easy
ways for folks to be able to generate and report info back that work
and are enabled out-of-the-box on most distros.

> If this facility is really needed, it would be beneficial for other
> modules as well, and thus better implemented in the module loading code
> to activate desired tracing after loading the module but before invoking
> module init code.

I don't know if it rises to the level of "really needed" - I certainly
needed something like this to debug an issue and hence the module
param. And I figured if somebody adds/debugs additional init commands
they could find it useful too. But this may not be commonly needed
after all, or folks are using some other solution.

If there's interest, I might be able to take a stab a this in the near
future, but not sure.


  Cheers,

  Ronald

