Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA9A6C1280
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 14:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjCTNAm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 09:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbjCTNAd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 09:00:33 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329EF16309;
        Mon, 20 Mar 2023 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679317226; x=1710853226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VIjJPJO/7ZtLy4pvhz1nqqvXEA9yRbCBrn9viPhUIgs=;
  b=C/OMu0JC2MkfspPlYzu96R8QcBZKJL9wBZddMdSWa7cc2ZfqUyt+od5z
   4Ppzf8MdlfrAoJ9pQ5XUPCu9Zm7sDdoIRJAAe95L4UOeChqXdgbdIScs0
   zpQ7rvBtqMFgAx0N2RpQve3nHLDIyVK23Gz5DossAhf4nOdvw8GmDjjQF
   NdVTxiyvjeoESQS0e7AlNS88cA/kNtRvoaJO0fSO8irm9okNt+qeJALW6
   GBFfBCFqISUaDt0cdad9wkZyioBIZXpyhw/SpwXg0cjtzsjuGck5H3P5j
   OBISIhosQIWa0inZhjcnZFrxdfhkBNLfQtiqidncZjQTOx86uDtXTkY12
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366370775"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="366370775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 06:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="713551019"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="713551019"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 06:00:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1peF7c-006GwX-1s;
        Mon, 20 Mar 2023 15:00:20 +0200
Date:   Mon, 20 Mar 2023 15:00:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
 <20230319204802.1364-4-kaehndan@gmail.com>
 <ZBhYXwjPeRiZwxMT@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBhYXwjPeRiZwxMT@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko wrote:
> On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:

...

> > +	device_for_each_child_node(&hdev->dev, child) {
> > +		name = fwnode_get_name(child);
> > +		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > +
> > +		if ((name && strcmp("i2c", name) == 0) || (!ret && addr == 0))
> > +			device_set_node(&dev->adap.dev, child);
> > +		else if ((name && strcmp("gpio", name)) == 0 ||
> > +					(!ret && addr == 1))
> > +			dev->gc.fwnode = child;
> > +	}
> 
> Please, make addresses defined explicitly. You may also do it with node naming
> schema:
> 
> #define CP2112_I2C_ADR		0
> #define CP2112_GPIO_ADR		1
> 
> static const char * const cp2112_cell_names[] = {
> 	[CP2112_I2C_ADR]	= "i2c",
> 	[CP2112_GPIO_ADR]	= "gpio",
> };
> 
> 	device_for_each_child_node(&hdev->dev, child) {
> 		name = fwnode_get_name(child);
> 		if (name) {
> 			ret = match_string(cp2112_cell_names, ARRAY_SIZE(cp2112_cell_names), name);
> 			if (ret >= 0)
> 				addr = ret;
> 		} else
> 			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> 		if (ret < 0)
> 			...error handling if needed...
> 
> 		switch (addr) {
> 		case CP2112_I2C_ADR:
> 			device_set_node(&dev->adap.dev, child);
> 			break;
> 		case CP2112_GPIO_ADR:
> 			dev->gc.fwnode = child;
> 			break;
> 		default:
> 			...error handling...
> 		}
> 	}

Btw, don't you use "reg" property for the child nodes? It would be better from
de facto used patterns (we have a couple of mode drivers that have a common
code to read "reg" or _ADR() and that code can be split into a helper and used
here).

-- 
With Best Regards,
Andy Shevchenko


