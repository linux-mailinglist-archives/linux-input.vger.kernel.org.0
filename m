Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D569288A3F
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388192AbgJIOCy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 10:02:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:13027 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733094AbgJIOCy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Oct 2020 10:02:54 -0400
IronPort-SDR: UutEvLR3JUtQIv25kQgoaCBms5nZVe4qRuyfC/jqqSWGH1c4iEIB/dlEvqBGwGb7A1rOokYZDa
 +KVKhHNkB7iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="162849315"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="162849315"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 07:02:53 -0700
IronPort-SDR: EazpoFCcRi80uPDcWICyeM9WQNoyxdt91PeQMKi8hcUG0fyssTX6k6X5v/WvqCqZmpbhfEK6L4
 VqC3E716LyDA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="312564410"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 07:02:51 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQszy-002eNI-P6; Fri, 09 Oct 2020 17:03:54 +0300
Date:   Fri, 9 Oct 2020 17:03:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Luke D Jones <luke@ljones.dev>,
        benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key keyboard
Message-ID: <20201009140354.GH4077@smile.fi.intel.com>
References: <20200923215633.209724-1-luke@ljones.dev>
 <nycvar.YFH.7.76.2010091137510.3336@cbobk.fhfr.pm>
 <20201009131435.GF4077@smile.fi.intel.com>
 <46e870fa-ff64-73ca-9979-32c8a1b5b12a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e870fa-ff64-73ca-9979-32c8a1b5b12a@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 09, 2020 at 03:37:20PM +0200, Hans de Goede wrote:
> On 10/9/20 3:14 PM, Andy Shevchenko wrote:
> > On Fri, Oct 09, 2020 at 11:38:55AM +0200, Jiri Kosina wrote:
> > > On Thu, 24 Sep 2020, Luke D Jones wrote:
> > > 
> > > > The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> > > > almost all modern ASUS gaming laptops with slight changes to the
> > > > firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> > > > brightness control, and notify asus-wmi to toggle "fan-mode".
> > > > 
> > > > The keyboard has many of the same key outputs as the existing G752
> > > > keyboard including a few extras, and varies a little between laptop
> > > > models. The key-sets have been split and sub-grouped so that there
> > > > will not be conflict between key event codes used.
> > > > 
> > > > An existing key event used across some keyboards for "Mic Toggle"
> > > > has been changed to emit "F20" as this is what all the main
> > > > desktop environments are using.
> > > > 
> > > > Additionally this keyboard requires the LED interface to be
> > > > intitialised before such things as keyboard backlight control work.
> > > > 
> > > > Misc changes in scope: update some hardcoded comparisons to use an
> > > > available define.
> > > > 
> > > > Signed-off-by: Luke D Jones <luke@ljones.dev>
> > > 
> > > Thanks for the patch. Looks good to me in general, one small nit before
> > > this can be merged as a whole ...
> > > 
> > > > ---
> > > >   drivers/hid/hid-asus.c                     | 188 ++++++++++++++++++---
> > > >   drivers/hid/hid-ids.h                      |   1 +
> > > >   include/linux/platform_data/x86/asus-wmi.h |   2 +
> > > 
> > > ... I'd like to get Ack from Andy (CCing) on the addition below to
> > > asus-wmi.h.
> > 
> > There is a new sheriff in town (Hans and Mark).
> > My personal opinion it is good to go.
> > 
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I'm afraid that a quick review by me has found multiple issues with
> this patch. I'm going to take a quick break now, I'll email a
> detailed review after that.

Thanks Hans.
I forgot to add that I reviewed only asus-wmi.h part. Sorry for the confusion.


> > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > > > index 897b8332a39f..05253cfe786c 100644
> > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > @@ -27,6 +27,8 @@
> > > >   #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
> > > >   #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
> > > > 
> > > > +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method ?? */
> > > > +
> > > >   #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> > > > 
> > > >   /* Wireless */
> > 
> 

-- 
With Best Regards,
Andy Shevchenko


