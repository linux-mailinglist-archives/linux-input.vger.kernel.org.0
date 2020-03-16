Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0ED7186D54
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 15:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731652AbgCPOkU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 10:40:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:27653 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731572AbgCPOkU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 10:40:20 -0400
IronPort-SDR: vSOJE6taa8UyrczVPRa0OBrubDNnRZXxLfMQExXBS8lGIaOSuw9P0w9YVKXMqoIAhx+OcHUJly
 wAQzikzp8kiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 07:40:19 -0700
IronPort-SDR: bMGLbIcmGqh2S0p47k+nya3eXYfE//Kvn6GKONNjdyiMMbyURlK86sVpLFQtzK1qyYp+VzZyIV
 jVXsvGUxysKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,560,1574150400"; 
   d="scan'208";a="445141887"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2020 07:40:18 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jDqui-00A5YZ-Ez; Mon, 16 Mar 2020 16:40:20 +0200
Date:   Mon, 16 Mar 2020 16:40:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        mylene.josserand@bootlin.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - add fw_version debugfs file to read
Message-ID: <20200316144020.GN1922688@smile.fi.intel.com>
References: <20200316142756.25344-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200316142756.25344-1-martin.kepplinger@puri.sm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 16, 2020 at 03:27:56PM +0100, Martin Kepplinger wrote:
> Add simple fw_version file in debugfs to read the value from 0xa6
> which is the firmware version.


If you switch to regmap I²C API you will get this for free for all defined
registers.

So, I highly recommend to consider above.

-- 
With Best Regards,
Andy Shevchenko


