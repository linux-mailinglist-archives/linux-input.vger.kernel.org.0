Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0252F6AEF83
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 19:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjCGSYE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 13:24:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjCGSXl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 13:23:41 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9D599279;
        Tue,  7 Mar 2023 10:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678213139; x=1709749139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nFwuVKlEFYxkn+RKgx+deVQ900M86V1Vs8uVL+ROafg=;
  b=kDAj7zUsZ4mIl+FdYQum5fUVb+TXMdmEn0afLUGKdTShlRZeK+FEfSlj
   VUmVW1i5R8cM+ncTKjhuLmo884bFfwye8n2HW4D0Y53Pu7hfXhjRGzMmT
   rtbeGNLdK5qNgmXTuVmk2oqe4HuVZU7MZ5FAbVD/G3gBlywyTZvnaod+V
   tUcr8J4wBvMZ9Sc+21uP1M9cBBh0WBuv1kZ8xUU/OmeL2gRkpFKdwHrvs
   1PHv0VJ8tTf8tFbPddsYYNGUAkV3kVGrzqF8PaNe7stMRWzHXUCO7oPfy
   H92ogZcjMmgZVSYVsSXATU/AUTE4JXCtidMVisv8dhzXukUknOcsWKyWh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="316332100"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="316332100"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 10:18:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="679042786"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="679042786"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 07 Mar 2023 10:18:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZbtm-00H3Hu-04;
        Tue, 07 Mar 2023 20:18:54 +0200
Date:   Tue, 7 Mar 2023 20:18:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
References: <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 07, 2023 at 03:48:52PM +0100, Benjamin Tissoires wrote:
> On Mar 07 2023, Daniel Kaehn wrote:

...

> So I can see that the device gets probed, and that all ACPI resources
> are tried to get the IRQ.
> Right now, I see that it's attempting to bind to the acpi resource in
> acpi_dev_resource_interrupt() (in file drivers/acpi/resources.c), but
> instead of having a ACPI_RESOURCE_TYPE_EXTENDED_IRQ I only get a
> ACPI_RESOURCE_TYPE_GPIO for the GpioInt() definition in the _CRS method.
> 
> So I am missing the proper transition from GpioInt to IRQ in the acpi.

I'm not sure I understand what this means.

The Linux kernel takes either Interrupt() resource (which is
IOxAPIC / GIC / etc) or GpioInt() (which is GPIO based).

In both cases I²C framework submits this into client's IRQ field.

-- 
With Best Regards,
Andy Shevchenko


