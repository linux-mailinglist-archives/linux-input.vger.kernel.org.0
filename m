Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D7028899E
	for <lists+linux-input@lfdr.de>; Fri,  9 Oct 2020 15:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732900AbgJINNf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Oct 2020 09:13:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:9293 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732547AbgJINNf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Oct 2020 09:13:35 -0400
IronPort-SDR: 1JOz9M0VXMuEu8EF0aUKfwDyHu+pmr8w5Kv7yBf4kbYsv1NmbHzrsN+cLRyLeQQTgyKTaqSVcY
 eqHwHbEuPD0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="162843785"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="162843785"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 06:13:33 -0700
IronPort-SDR: yWMZqYqTe/cQ54Fz9xylgSkrK5lTPKTArwS9MGzjhDIhuDL8S/Sig5RNWFaI/AHHx1hBn4MoG3
 36ibH73cvk6w==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="343821053"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 06:13:32 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kQsEF-002ciD-1x; Fri, 09 Oct 2020 16:14:35 +0300
Date:   Fri, 9 Oct 2020 16:14:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Luke D Jones <luke@ljones.dev>, benjamin.tissoires@redhat.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key keyboard
Message-ID: <20201009131435.GF4077@smile.fi.intel.com>
References: <20200923215633.209724-1-luke@ljones.dev>
 <nycvar.YFH.7.76.2010091137510.3336@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2010091137510.3336@cbobk.fhfr.pm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 09, 2020 at 11:38:55AM +0200, Jiri Kosina wrote:
> On Thu, 24 Sep 2020, Luke D Jones wrote:
> 
> > The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> > almost all modern ASUS gaming laptops with slight changes to the
> > firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> > brightness control, and notify asus-wmi to toggle "fan-mode".
> > 
> > The keyboard has many of the same key outputs as the existing G752
> > keyboard including a few extras, and varies a little between laptop
> > models. The key-sets have been split and sub-grouped so that there
> > will not be conflict between key event codes used.
> > 
> > An existing key event used across some keyboards for "Mic Toggle"
> > has been changed to emit "F20" as this is what all the main
> > desktop environments are using.
> > 
> > Additionally this keyboard requires the LED interface to be
> > intitialised before such things as keyboard backlight control work.
> > 
> > Misc changes in scope: update some hardcoded comparisons to use an
> > available define.
> > 
> > Signed-off-by: Luke D Jones <luke@ljones.dev>
> 
> Thanks for the patch. Looks good to me in general, one small nit before 
> this can be merged as a whole ...
> 
> > ---
> >  drivers/hid/hid-asus.c                     | 188 ++++++++++++++++++---
> >  drivers/hid/hid-ids.h                      |   1 +
> >  include/linux/platform_data/x86/asus-wmi.h |   2 +
> 
> ... I'd like to get Ack from Andy (CCing) on the addition below to 
> asus-wmi.h.

There is a new sheriff in town (Hans and Mark).
My personal opinion it is good to go.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> [ ... snip ... ]
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 897b8332a39f..05253cfe786c 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -27,6 +27,8 @@
> >  #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
> >  #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
> > 
> > +#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method ?? */
> > +
> >  #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> > 
> >  /* Wireless */

-- 
With Best Regards,
Andy Shevchenko


