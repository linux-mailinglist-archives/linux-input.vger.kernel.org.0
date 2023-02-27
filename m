Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDE26A4F82
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 00:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjB0XHm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 18:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjB0XHl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 18:07:41 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A6F1E1D1;
        Mon, 27 Feb 2023 15:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677539260; x=1709075260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dTd4MnC9/IhUBjoSUJk3q6uKh0ORunfmI4hX7cyMlNk=;
  b=D4uv+1+62TEzduRBHHh+ADrU1Y38LnY2gvGX6zUgfNDUySMfX9HxeLty
   fm8jAea1OBm80v1z+AkGqRBUBcoA7J0RSId90zyOsEkJ6SHw4h57ff2WH
   K4ngFmYuTJEiEu/lIOhBRsCwwBQWn/OtHW+SvZH5wtJ8LCLigpdMBANSD
   N49VCKP0rl8Ngrs98CkdM5hkEN/A15Rky/ZouEcN+wMVgxEYXI5N76GV4
   59ljGQmrmb4f498FLD+GETEUHYNE520udWa68XQQPZz9qz+v0hSNOEgzX
   aDEPJzzT+r0uKG8szfDAFDpLAN42yQcsWZc51CveNdZuwP20y7BevR3TK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361550516"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="361550516"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 15:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="676055548"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="676055548"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 15:07:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pWmal-00D2N0-0e;
        Tue, 28 Feb 2023 01:07:35 +0200
Date:   Tue, 28 Feb 2023 01:07:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <Y/03to4XFXPwkGH1@smile.fi.intel.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
 <20230227140758.1575-4-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227140758.1575-4-kaehndan@gmail.com>
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

On Mon, Feb 27, 2023 at 08:07:58AM -0600, Danny Kaehn wrote:
> Bind I2C and GPIO interfaces to subnodes with names
> "i2c" and "gpio" if they exist, respectively. This
> allows the GPIO and I2C controllers to be described
> in firmware as usual. Additionally, support configuring the
> I2C bus speed from the clock-frequency device property.

A bit shorten indentation...

Nevertheless what I realized now is that this change, despite being OF
independent by used APIs, still OF-only.

Would it be possible to allow indexed access to child nodes as well, so if
there are no names, we may still be able to use firmware nodes from the correct
children?

P.S. The problem with ACPI is that "name" of the child node will be in capital
letters as it's in accordance with the specification.

-- 
With Best Regards,
Andy Shevchenko


