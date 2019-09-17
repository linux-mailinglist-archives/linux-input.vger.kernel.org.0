Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFEA1B52F8
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729300AbfIQQcU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:32:20 -0400
Received: from mga07.intel.com ([134.134.136.100]:3161 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727788AbfIQQcU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:32:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 09:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; 
   d="scan'208";a="201865770"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2019 09:32:16 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iAGOl-0001TI-6P; Tue, 17 Sep 2019 19:32:15 +0300
Date:   Tue, 17 Sep 2019 19:32:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 3/6] Input: edt-ft5x06 - add support to disable the
 wakeup-source
Message-ID: <20190917163215.GH2680@smile.fi.intel.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917155808.27818-4-m.felsch@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 05:58:05PM +0200, Marco Felsch wrote:
> Since day one the touch controller acts as wakeup-source. This seems to
> be wrong since the device supports deep-sleep mechanism [1] which
> requires a reset to leave it. Also some designs won't use the
> touchscreen as wakeup-source.
> 
> Add a firmware property to address this. The common 'wakeup-source'
> property can't be used for that because the driver must be backward
> compatible with old firmwares which may assume the default on
> wakeup-source behaviour. So we need to go the other way by explicit
> disable the wakeup-source capability.
> 

> [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
>     FT5x26.pdf

Please, don't split URLs

>  	int error;
>  	char fw_version[EDT_NAME_LEN];

> +	bool en_wakeup;

Perhaps wakeup_en?

-- 
With Best Regards,
Andy Shevchenko


