Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEF52D4C38
	for <lists+linux-input@lfdr.de>; Wed,  9 Dec 2020 21:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbgLIUxC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 15:53:02 -0500
Received: from mga09.intel.com ([134.134.136.24]:62069 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgLIUxC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Dec 2020 15:53:02 -0500
IronPort-SDR: F0n1/AFzeVnO7cmwwxuEwfmyRjACOBmtYG1AmxOULun97tTmfUmzhxhBSrXnTrIVwSBhFxp1NI
 1bCjkt6Ysc8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174292826"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="174292826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 12:51:16 -0800
IronPort-SDR: PssP7pHizVTbcdxJ9bdTDFxtWRRJ/pbOeKBQ+rLmMjuKIEz/BfzVK6gAJ6nUpO/vetOkgL5Szs
 wupDDGePyC4g==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="318501774"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2020 12:51:15 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kn6Rd-00DEJZ-Ap; Wed, 09 Dec 2020 22:52:17 +0200
Date:   Wed, 9 Dec 2020 22:52:17 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: edt-ft5x06 - use U16_MAX instead of -1
Message-ID: <20201209205217.GX4077@smile.fi.intel.com>
References: <20201026174126.19449-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026174126.19449-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 26, 2020 at 07:41:26PM +0200, Andy Shevchenko wrote:
> Explicitly show what the value we supply for the touchscreen resolution
> when it can't be detected. -1 is hard to compare with when unsigned short
> type is in use. The change will help to avoid signed vs. unsigned error
> prone comparisons.

Any comments on this?


-- 
With Best Regards,
Andy Shevchenko


