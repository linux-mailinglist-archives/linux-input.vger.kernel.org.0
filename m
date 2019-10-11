Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C718D3D37
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 12:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfJKKVd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 06:21:33 -0400
Received: from mga02.intel.com ([134.134.136.20]:3286 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbfJKKVd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 06:21:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 03:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; 
   d="scan'208";a="207400881"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 11 Oct 2019 03:21:19 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 11 Oct 2019 13:21:18 +0300
Date:   Fri, 11 Oct 2019 13:21:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jiri Kosina <jikos@kernel.org>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: Remove runtime power management
Message-ID: <20191011102118.GD2819@lahna.fi.intel.com>
References: <20191008153829.24766-1-kai.heng.feng@canonical.com>
 <d096582b-c96b-69a2-bcc5-cba2984705e7@redhat.com>
 <CAO-hwJJoy3=a_m9V6ZseisGgWp=jJpYr3ub85SaLiQFiioZ7ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJoy3=a_m9V6ZseisGgWp=jJpYr3ub85SaLiQFiioZ7ew@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 11:27:10AM +0200, Benjamin Tissoires wrote:
> Hi,
> 
> [Adding Mika, who introduced runpm in i2c-hid]
> 
> few questions, remarks:
> 
> On Tue, Oct 8, 2019 at 10:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 08-10-2019 17:38, Kai-Heng Feng wrote:
> > > Runtime power management in i2c-hid brings lots of issues, such as:
> > > - When transitioning from display manager to desktop session, i2c-hid
> > > was closed and opened, so the device was set to SLEEP and ON in a short
> > > period. Vendors confirmed that their devices can't handle fast ON/SLEEP
> > > command because Windows doesn't have this behavior.
> > >
> > > - When rebooting, i2c-hid was closed, and the driver core put the device
> > > back to full power before shutdown. This behavior also triggers a quick
> > > SLEEP and ON commands that some devices can't handle, renders an
> > > unusable touchpad after reboot.
> > >
> > > - Runtime power management is only useful when i2c-hid isn't opened,
> > > i.e. a laptop without desktop session, which isn't that common.
> 
> There is also one GPM-like driver that uses libinput (can't remember
> from the top of my head), but you can have the i2c-hid device opened
> on a vt too (with 2 finger gestures for scrolling and what not) :)
> 
> And there is also the use case of a 2-in-1 when the laptop is in
> tablet mode. In some cases, the compositor will close the inputs to
> ignore the touchpad events.
> 
> Anyway, Mika, is there any drawbacks of not having runpm on i2c-hid
> devices? Maybe at the IRQ level?

Nothing comes to mind except that power consumption might increase if
the device is not used but if that's not an issue then no objections
from my side :)
