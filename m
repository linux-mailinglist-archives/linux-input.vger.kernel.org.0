Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C386B187E8C
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 11:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgCQKmY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 06:42:24 -0400
Received: from mga06.intel.com ([134.134.136.31]:23878 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgCQKmY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 06:42:24 -0400
IronPort-SDR: AplRtMpY1kl8eiwXbK0UGW6Z5Klcs4VAZUqkAn5xJBqnHEVYJAo78Dk2ZfSdhxkXR7BkXH0gsV
 sGSecrkZi1JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2020 03:42:24 -0700
IronPort-SDR: avYLoU5oKBnNWle2OyBEP5KMiCsT95QvG44wtlSDfOOZGq/StK1wl4Z0n2rgcUh84/QMi5Ky/K
 Rz5B6/MDFc3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; 
   d="scan'208";a="244439354"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 03:42:21 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jE9fz-00AQrU-OA; Tue, 17 Mar 2020 12:42:23 +0200
Date:   Tue, 17 Mar 2020 12:42:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     dmitry.torokhov@gmail.com, m.felsch@pengutronix.de,
        mylene.josserand@bootlin.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: edt-ft5x06 - add fw_version debugfs file to read
Message-ID: <20200317104223.GA1922688@smile.fi.intel.com>
References: <20200316142756.25344-1-martin.kepplinger@puri.sm>
 <20200316144020.GN1922688@smile.fi.intel.com>
 <40d823d7-5873-2a3c-9f49-87fdb7428061@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40d823d7-5873-2a3c-9f49-87fdb7428061@puri.sm>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 17, 2020 at 11:25:39AM +0100, Martin Kepplinger wrote:
> On 16.03.20 15:40, Andy Shevchenko wrote:
> > On Mon, Mar 16, 2020 at 03:27:56PM +0100, Martin Kepplinger wrote:
> >> Add simple fw_version file in debugfs to read the value from 0xa6
> >> which is the firmware version.
> > 
> > 
> > If you switch to regmap I²C API you will get this for free for all defined
> > registers.
> > 
> > So, I highly recommend to consider above.
> > 
> 
> I don't know all the devices and modes well enough if the current raw
> read/write buffers always translate to (only) buf[0] being the register
> address.
> 
> If you tell me I can assume just that, I'm happy to do a larger change
> that completely does aways with the current raw buffers.

I have only one device at hand, so, I can't tell for all neither.
Maybe Dmitry has an opinion on this?

> Otherwise:
> 
> Does is make sense to *add* just a few regmap calls but keep the current
> i2c_transfer in place for the calls I'm not sure about? I could do that
> in any case.

I think it's way to the opposite direction, i.e. increasing burden
(for maintainability) and technical debt.

-- 
With Best Regards,
Andy Shevchenko


