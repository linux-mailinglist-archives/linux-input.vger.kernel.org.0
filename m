Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3812F1A32CD
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 12:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDIKrn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 06:47:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:57235 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726559AbgDIKrm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 06:47:42 -0400
IronPort-SDR: Y1UEOrLCVmYvDaG/MNppZov89kzqJqtE1svbl+6rHvxk418nPw1BLzjbBm64Uwq385DOeJnWiU
 gZD2SsPv+W+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 03:47:42 -0700
IronPort-SDR: WQMY/5ppReI4p/JRsDKGmMphw95MaULPCDITwupZUPfLahQcir/fJ+YLZCXldF1b5iVKFm04Gf
 HP+96/paNd3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="240585768"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 09 Apr 2020 03:47:40 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMUil-00Gvxk-23; Thu, 09 Apr 2020 13:47:43 +0300
Date:   Thu, 9 Apr 2020 13:47:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Oliver Graute <oliver.graute@gmail.com>
Cc:     dmitry.torokhov@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - added case for EDT EP0110M09
Message-ID: <20200409104743.GX3676135@smile.fi.intel.com>
References: <1586424116-25739-1-git-send-email-oliver.graute@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586424116-25739-1-git-send-email-oliver.graute@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 09, 2020 at 11:21:52AM +0200, Oliver Graute wrote:
> From: Oliver Graute <oliver.graute@kococonnector.com>
> 
> Add Support for EP011M09 Firmware

Thank you for patches!

Two patches you sent should be in the series, otherwise it will be exactly a
state in the middle where users will get a big warning.

That said, this patch is second in the series, and the other one is the first.
(You need to address in the latter my concerns and add more information perhaps
 why it's not tolerating that call)

-- 
With Best Regards,
Andy Shevchenko


