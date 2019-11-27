Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19EE10B432
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 18:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfK0RPB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 12:15:01 -0500
Received: from mga18.intel.com ([134.134.136.126]:9555 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbfK0RPB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 12:15:01 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 09:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="206831043"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 27 Nov 2019 09:14:57 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ia0u0-0004ah-PY; Wed, 27 Nov 2019 19:14:56 +0200
Date:   Wed, 27 Nov 2019 19:14:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com, bparrot@ti.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        mripard@kernel.org, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/5] EDT-FT5x06 improvements
Message-ID: <20191127171456.GR32742@smile.fi.intel.com>
References: <20191127120948.22251-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127120948.22251-1-m.felsch@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 01:09:43PM +0100, Marco Felsch wrote:
> Hi,
> 
> this v2 address all comments made on [1]. See the patch based changelog
> for further information.
> 
> During the discussion we all agreed to use the common wakeup-src device
> property but I added all users of this driver again. So they can provide
> their ack-tag.
> 

Independently on the decision on patch 5, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Regards,
>   Marco
> 
> [1] https://patchwork.kernel.org/cover/11149039/
> 
> Marco Felsch (4):
>   Input: edt-ft5x06 - alphabetical include reorder
>   dt-bindings: Input: edt-ft5x06 - document wakeup-source capability
>   Input: edt-ft5x06 - make wakeup-source switchable
>   Input: edt-ft5x06 - improve power management operations
> 
> Philipp Zabel (1):
>   Input: edt-ft5x06: work around first register access error
> 
>  .../bindings/input/touchscreen/edt-ft5x06.txt |  2 +
>  drivers/input/touchscreen/edt-ft5x06.c        | 85 ++++++++++++++++---
>  2 files changed, 73 insertions(+), 14 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


