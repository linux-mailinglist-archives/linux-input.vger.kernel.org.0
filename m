Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F026C1279
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 13:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbjCTM73 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 08:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbjCTM7I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 08:59:08 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FED10400;
        Mon, 20 Mar 2023 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679317139; x=1710853139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8SV2irE2pQGlkBG89eqsKeZRRukdH3jolsJL0WVMQYs=;
  b=F5ghox+6Obne6aCzlEjpBhiYToqHUIgOHLFm0/hKr3+An0H+D1ja/qoS
   vzQjKIaEbOmBKkjc0kWFo58V1WqVD7uKjb/THPWs0j8SyhOglbblsQeb3
   HFy02amYa3QHMobFX7KW6Go0yQQ2lJZ62EBPbbYVf9Cd0G9wwuB/h3alM
   BHBtl0XiKba9mU3Jlw4ZoYUNeg5y4HjSY1ejSRF98BmDlUPfvrzGTH/KM
   ilqFFVGJSRx8tpXHYaXSH14jQuZ/bxOSKFxTcVMGG4zYwPMc8ap853XSu
   lnmyzzKUc3lH1cpn4Fqa5dZE/mJ4ZdltIUec2J1zavXhpxK135LIZ1wKY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="366370254"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="366370254"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 05:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="855274301"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="855274301"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2023 05:58:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1peF5T-006GuW-1R;
        Mon, 20 Mar 2023 14:58:07 +0200
Date:   Mon, 20 Mar 2023 14:58:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZBhYXwjPeRiZwxMT@smile.fi.intel.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
 <20230319204802.1364-4-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319204802.1364-4-kaehndan@gmail.com>
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

On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:
> Support describing the CP2112's I2C and GPIO interfaces in firmware.
> 
> I2C and GPIO child nodes can either be children with names "i2c" and
> "gpio", or, for ACPI, device nodes with _ADR Zero and One,
> respectively.
> 
> Additionally, support configuring the I2C bus speed from the
> clock-frequency device property.

Thank you for the update, my comments below.

...

> +	struct i2c_timings timings;
> +	struct fwnode_handle *child;

Longer line first easier to read.

> +	u32 addr;
> +	const char *name;

Ditto.

...

> +	device_for_each_child_node(&hdev->dev, child) {
> +		name = fwnode_get_name(child);
> +		ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> +
> +		if ((name && strcmp("i2c", name) == 0) || (!ret && addr == 0))
> +			device_set_node(&dev->adap.dev, child);
> +		else if ((name && strcmp("gpio", name)) == 0 ||
> +					(!ret && addr == 1))
> +			dev->gc.fwnode = child;
> +	}

Please, make addresses defined explicitly. You may also do it with node naming
schema:

#define CP2112_I2C_ADR		0
#define CP2112_GPIO_ADR		1

static const char * const cp2112_cell_names[] = {
	[CP2112_I2C_ADR]	= "i2c",
	[CP2112_GPIO_ADR]	= "gpio",
};

	device_for_each_child_node(&hdev->dev, child) {
		name = fwnode_get_name(child);
		if (name) {
			ret = match_string(cp2112_cell_names, ARRAY_SIZE(cp2112_cell_names), name);
			if (ret >= 0)
				addr = ret;
		} else
			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
		if (ret < 0)
			...error handling if needed...

		switch (addr) {
		case CP2112_I2C_ADR:
			device_set_node(&dev->adap.dev, child);
			break;
		case CP2112_GPIO_ADR:
			dev->gc.fwnode = child;
			break;
		default:
			...error handling...
		}
	}

-- 
With Best Regards,
Andy Shevchenko


