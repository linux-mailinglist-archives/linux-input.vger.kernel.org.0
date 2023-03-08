Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE40D6B0E75
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 17:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjCHQUV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 11:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjCHQUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 11:20:20 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA15A95E31;
        Wed,  8 Mar 2023 08:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678292417; x=1709828417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KaRXDKgDDpk42pcltBEdLV1zi5EgDCozOeHY9dCVqeE=;
  b=COS3/S3m4gMbP4fQtCiIm4fYDQ621M/75H2LioRcKpPt+j7oXH5xn4wF
   3KEXWgsh1BFRX3kq3dd/9RfDBBzCTWkNjS/7+1eEmSmpewBaJP3WSozwK
   /Eop2LdB98JVrrrC0Yd+ZlPJ7gKkXxeFmcjemjUh7X2iutpVi885ykRqL
   07I/6rlf6DxoTOdih23Dl4MR7WBSXifxnJa1jT+YzL4Yq+DrSXNWLuw56
   t+vbQGQ0vVuq63t+0NIasrFlo1iS4yM1gY+qmkUcPApk2IMCO5zIQ7m3v
   0n8/BCFdOGQb5dGcwSTH2fkUpEAdnU13qjwHkXLftSWoH42qT4Aqp5fI3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="320028278"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="320028278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="741182234"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="741182234"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 08 Mar 2023 08:20:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZwWQ-00HVYI-0n;
        Wed, 08 Mar 2023 18:20:10 +0200
Date:   Wed, 8 Mar 2023 18:20:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAi1uZCnZjBD96t0@smile.fi.intel.com>
References: <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 08, 2023 at 04:26:11PM +0100, Benjamin Tissoires wrote:
> On Mar 07 2023, Andy Shevchenko wrote:
> > On Tue, Mar 07, 2023 at 03:48:52PM +0100, Benjamin Tissoires wrote:
> > > On Mar 07 2023, Daniel Kaehn wrote:

...

> So I wonder if the cp2112 driver is correctly assigning the gc->parent
> field.

Seems it needs custom fwnode

	gc->fwnode = child_of_cp_which_is_gpio;

-- 
With Best Regards,
Andy Shevchenko


