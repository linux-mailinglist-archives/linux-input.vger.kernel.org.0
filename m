Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31F8F6B0757
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 13:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbjCHMl6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 07:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbjCHMl4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 07:41:56 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73FE92F0A;
        Wed,  8 Mar 2023 04:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678279315; x=1709815315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jXrDc9gNsWI8KLn79ljHwNkDe73LmLA89EgUGtpcKp4=;
  b=S5KncCHbcCNwbBuMK9ZPBYjy/VbBlvYOjhu53W2yML+9ZTwEY1KELKs2
   LVUmXhVyPWhPfXuj9CyDwydznwIj6E6V8TlheZMkmaR7LiuRm86qKfgev
   knlZHgnRefQDCvertKWmpmkpAxEXajJq4U0Itue0Rbub3AQ1w1mvLEJPY
   x7GSuYt3KGUX76u8SdSsHYwHTeLrXmE0fqLmqZOkiRG7OOmHO0kp4iiYM
   i45180AAZJ2GoxHxyUNML1Uoc719ldNoxQK11Ye5Gg5VkZjST9llriCw8
   vDsjNrOUcJWJphwXIe+ZmwqDrIjpPLkxqcrSo2NstrkHF130xNVJJSCwl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337659731"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="337659731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 04:41:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765980675"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="765980675"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 04:41:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZt76-00HQQT-22;
        Wed, 08 Mar 2023 14:41:48 +0200
Date:   Wed, 8 Mar 2023 14:41:48 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAiCjBWhEE/dENOJ@smile.fi.intel.com>
References: <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <ZAd+/fHeQ3zuvoTN@smile.fi.intel.com>
 <CAP+ZCCe6mdtNmg0QEtQKFCKMyhM9xRffFoMHtxHEGnjNOEAedg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCe6mdtNmg0QEtQKFCKMyhM9xRffFoMHtxHEGnjNOEAedg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 07, 2023 at 01:57:27PM -0600, Daniel Kaehn wrote:
> On Tue, Mar 7, 2023 at 12:14 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Mar 07, 2023 at 02:17:06PM +0100, Benjamin Tissoires wrote:
> > > On Mar 06 2023, Andy Shevchenko wrote:

...

> > > It is commonly accepted in the ACPI world that the names do not carry
> > > meaning AFAICT, and so I think I agree with Andy's initial comment
> > > regarding using indexes, not names to also fetch the I2C and GPIO nodes.
> > > You can probably have a fallback mechanism for when "i2c" is not
> > > present, or simply check if you are in DT or not and use the names only
> > > if we are in DT.
> >
> > The solution is to provide in the main node the list of cell names, that way
> > you will always know the indices:
> >
> >   Device (DEV) {
> >           _DSD
> >                   "cell-names" { "i2c", "gpio" } // index of the name is the
> >                                                  // index of the cell
> >
> >         Device (I2C0) {
> >         }
> >
> >         Device (GPI0) {
> >         }
> >   }
> >
> > Problem solved.
> 
> Just to make sure I'm understanding you correctly:
> 
> Are you proposing that specifically this driver directly reads "cell-names"
> from the ACPI DSD to implement this indexing? Or are you proposing a
> kernel-wide mechanism of "overriding" a fwnode name with ACPI?
> (assuming this doesn't exist already, and I'm not just missing it in
> the kernel source)
> 
> Or are you proposing something else entirely?
> (apologies if this should be obvious -- throwing up the ACPI newbie
> card again here :) )

Out of the three listed above I'm proposing the first one.
(Maybe it can be called 'reg-names', but it depends on the hardware)

Also look into hierarchical _DSD (it is similar to the children
of the device node without being separate devices).

> In any case, would this be something I should post to the email chain
> with DT and ACPI
> folks for opinions before I start to implement it?

May be, the -names approach is already used widely for clock, interrupt, reset,
phy and nvmem. So it's something we know about.

-- 
With Best Regards,
Andy Shevchenko


