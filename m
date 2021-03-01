Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1082D32835F
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 17:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237702AbhCAQRB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 11:17:01 -0500
Received: from mga07.intel.com ([134.134.136.100]:17862 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237711AbhCAQQq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 11:16:46 -0500
IronPort-SDR: t4fjTksnBDKJ1ph33VmwF5Ksx3wyOS7H69HTCVyfmHOky8IVEpOFDOSJFoTzofUCinLz3ScikL
 G24GWIL4WYoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="250563396"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="250563396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 08:14:41 -0800
IronPort-SDR: HzQaJm9eeK4W/urB5M8RAw/tPfIcmkMZr1w2Q6JtbPibE7PInLIL5HnGyj6Hs+PPcWD3bz/mV7
 fAwWikIHtdlg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="366755699"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 08:14:40 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lGlBt-009BNW-LW; Mon, 01 Mar 2021 18:14:37 +0200
Date:   Mon, 1 Mar 2021 18:14:37 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] HID: i2c-hid: acpi: Drop redundant ACPI_PTR()
Message-ID: <YD0S7U9CKHf5rKr6@smile.fi.intel.com>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
 <20210226193225.47129-4-andriy.shevchenko@linux.intel.com>
 <CAO-hwJLWbsj4kDkn3TKdEW0mDv6XdafQEaheCCC0Nyq3=YaOYQ@mail.gmail.com>
 <nycvar.YFH.7.76.2103011633490.12405@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2103011633490.12405@cbobk.fhfr.pm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 01, 2021 at 04:34:41PM +0100, Jiri Kosina wrote:
> On Mon, 1 Mar 2021, Benjamin Tissoires wrote:
> > On Fri, Feb 26, 2021 at 8:34 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > The driver depends on ACPI, ACPI_PTR() resolution is always the same.
> > > Otherwise a compiler may produce a warning.
> > >
> > > That said, the rule of thumb either ugly ifdeffery with ACPI_PTR or
> > > none should be used in a driver.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > Thanks a lot for the series. This indeed cleans things up.
> 
> Indeed, thanks.
> 
> > For the series:
> > Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > 
> > Jiri, I wonder where we want to land this one. This is not strictly
> > bug fixes, but we could definitively sneak this one in 5.12-rc1.
> > Well, I should probably run the series on an acpi laptop here before
> > merging, but I'd like to know if delaying to 5.13 is OK or if we need
> > this in 5.12.
> 
> I'd like to do it the standard way and have it bake in for-next to see if 
> it really doesn't break anything, so unless there are convicing arguments 
> for 5.12-rcX, I'd rathre queue this for 5.13.

For the record, I'm not in hurry with this, up to you how to proceed.
Thanks!

-- 
With Best Regards,
Andy Shevchenko


