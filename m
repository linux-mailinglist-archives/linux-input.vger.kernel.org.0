Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DFAB5319
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 18:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbfIQQfl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 12:35:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:10201 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730457AbfIQQfk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 12:35:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 09:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; 
   d="scan'208";a="216631750"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2019 09:35:37 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iAGS0-0001VI-0r; Tue, 17 Sep 2019 19:35:36 +0300
Date:   Tue, 17 Sep 2019 19:35:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 6/6] Input: edt-ft5x06 - add supply voltage support
Message-ID: <20190917163536.GI2680@smile.fi.intel.com>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-7-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917155808.27818-7-m.felsch@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 05:58:08PM +0200, Marco Felsch wrote:
> Currently the driver do not care about the regulator which supplies the
> controller. This can lead into problems since we support (deep-)sleep
> because the regulator can be turned off before we send the (deep-)sleep
> command to the controller. Using a own regulator improves the power
> consumption during sleep even more.

> +	tsdata->vdd = devm_regulator_get(&client->dev, "vdd");
> +	if (IS_ERR(tsdata->vdd)) {
> +		error = PTR_ERR(tsdata->vdd);
> +		if (error == -EPROBE_DEFER)
> +			return error;

Before it worked w/o regulator. You have to make it optional.

> +		dev_err(&client->dev,
> +			"Failed to request vdd-supply, error %d\n", error);
> +		return error;
> +	}
> +
> +	error = regulator_enable(tsdata->vdd);
> +	if (error) {
> +		dev_err(&client->dev,
> +			"Failed to enable vdd-supply, error %d\n", error);
> +		return error;
> +	}

-- 
With Best Regards,
Andy Shevchenko


