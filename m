Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA769B2DF
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 20:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbjBQTNs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 14:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjBQTNr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 14:13:47 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC149303FA;
        Fri, 17 Feb 2023 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676661227; x=1708197227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/DG8dDv5JQH3+DdWNOcDhRtu7djrvaGaHw6jtRRZAM=;
  b=WjHMybO5nqQQWPkGKDLa2JedOoFG9L7pK/ko6s2iR6wTE6IrfzUF0HSQ
   1i/heNyW2Dylp86TG/6P+UXceUrQ53LwoiKrtee7PJ9smP1Bzll5O3CIO
   HwR8D7isf/MGDXfbNQxP0vhyg1Zrjs/kVbRNB3Tbgu8vFhmuBsvgrcNzU
   978L/R5OOj21ipX17fW24AKERXOSnWU+Jwqu5jckPkI43Utg2Qpgqq3KZ
   5UmoBHbtnwQueHqre1eQStrRJI2SgjV6JyWZJgzuzshxho8p6HQw/Nl1c
   HTHBXzC2mYaLtmNcCCLuwUqUcFZSPTuxixFDqtId+0vutm0fB83n5P1Kt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="320171299"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="320171299"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 11:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813469631"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="813469631"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 11:13:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pT6Av-008Khi-2P;
        Fri, 17 Feb 2023 21:13:41 +0200
Date:   Fri, 17 Feb 2023 21:13:41 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v6 3/3] HID: cp2112: Fwnode Support
Message-ID: <Y+/R5W6zxY7kknmH@smile.fi.intel.com>
References: <20230217184904.1290-1-kaehndan@gmail.com>
 <20230217184904.1290-4-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217184904.1290-4-kaehndan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 17, 2023 at 12:49:04PM -0600, Danny Kaehn wrote:
> Bind i2c and gpio interfaces to subnodes with names

I2C
GPIO

> "i2c" and "gpio" if they exist, respectively. This
> allows the gpio and i2c controllers to be described

GPIO
I2C

> in firmware as usual. Additionally, support configuring the
> i2c bus speed from the clock-frequency device property.

I2C

...

> +err_free_i2c_of:
> +	fwnode_handle_put(dev->adap.dev.fwnode);

Please, use dev_fwnode(&dev->adap.dev)

...

> +	fwnode_handle_put(dev->adap.dev.fwnode);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


