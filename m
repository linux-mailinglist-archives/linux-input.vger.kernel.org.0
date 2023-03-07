Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D830F6AEF1F
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 19:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjCGSUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 13:20:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjCGSUX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 13:20:23 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B67B9FE75;
        Tue,  7 Mar 2023 10:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678212867; x=1709748867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XSLmv6vdBKTEh+SkWsNtt/Lx6Hb1jscdzwOdWQXKyTk=;
  b=jcLR67r/uYhr2GwK5bDWO7ETkHZnwHElB0VhLjQH6EfHqggzbh34uBqb
   jweFCGrvTQvLHTnJd8MAg7lmwHLDzf93mX2Zg4L54A3uRpv74YSrCrrCS
   Iep/HsSv93mnmEBQ4QsH0glKoJlvrtOA03nYcdXk9u6EvpbV23bxCd8fm
   xwNPi2ZBRpPrTE40pHPkEEZYIQ1X3iHyorn9wCN+u/UYkbCbYFryeQsYK
   WBNSKSmK9KHtkA/OG5BS7iY3emo3hpz66p4Z7iZsfK9kPp3siViGVVafh
   YLMHvNy+B7/9kHLCoKFfaJjPVmb7ZNmTv+Xcd2ngm6vvmHLEr7bpfjF9F
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334643018"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="334643018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 10:14:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626629421"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="626629421"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 10:14:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZbpN-00H3Bp-25;
        Tue, 07 Mar 2023 20:14:21 +0200
Date:   Tue, 7 Mar 2023 20:14:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAd+/fHeQ3zuvoTN@smile.fi.intel.com>
References: <Y/9oO1AE6GK6CQmp@smile.fi.intel.com>
 <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 07, 2023 at 02:17:06PM +0100, Benjamin Tissoires wrote:
> On Mar 06 2023, Andy Shevchenko wrote:
> > On Mon, Mar 06, 2023 at 01:40:16PM -0600, Daniel Kaehn wrote:

...

> This almost works. Almost because the I2C device is correctly created,
> but I have an issue with the GpioInt call which is not properly set by
> the kernel and which returns -EDEFER. /o\ 

You can try to utilize _DEP method, but I dunno if it implemented that way in
the Linux that helps your case.

> > > With this all said -- I noticed iasl prints this statement when trying
> > > to create a node with a lowercase name:
> > > "At least one lower case letter found in NameSeg, ASL is case
> > > insensitive - converting to upper case (GPIO)"
> > 
> > Yes, because it should be in the upper case.
> > 
> > > I wonder if this suggests that adding a call to toupper() to
> > > acpi_fwnode_get_named_child_node would be
> > > an appropriate solution for the node name casing issue....
> > 
> > I dunno. You need to ask in the linux-acpi@ mailing list.
> > To me this is corner case that can't be easily solved
> > (because two different specifications treat it differently.
> > 
> > You also need to ask DT people about capital letters there.
> > And my guts tell me that it's probably also carved in the spec
> > as "must be lower case" or alike.
> 
> FWIW while trying to enable this, at some point I named the I2C and the
> GPIO entries "I2C0" and "GPI0" (with the number '0', not the letter
> 'o'), and it was not working as you would expect.
> 
> It is commonly accepted in the ACPI world that the names do not carry
> meaning AFAICT, and so I think I agree with Andy's initial comment
> regarding using indexes, not names to also fetch the I2C and GPIO nodes.
> You can probably have a fallback mechanism for when "i2c" is not
> present, or simply check if you are in DT or not and use the names only
> if we are in DT.

The solution is to provide in the main node the list of cell names, that way
you will always know the indices:

  Device (DEV) {
	  _DSD
		  "cell-names" { "i2c", "gpio" } // index of the name is the
						 // index of the cell

	Device (I2C0) {
	}

	Device (GPI0) {
	}
  }

Problem solved.

> Thanks a lot to both of you, this will be tremendously helpful to me.

You're welcome!

> [1] https://www.kernel.org/doc/html/latest/admin-guide/acpi/ssdt-overlays.html#loading-acpi-ssdts-from-initrd

-- 
With Best Regards,
Andy Shevchenko


