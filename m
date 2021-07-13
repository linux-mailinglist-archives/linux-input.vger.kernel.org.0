Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6423C6E0F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jul 2021 11:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235143AbhGMJ7i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jul 2021 05:59:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:32093 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235118AbhGMJ7h (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jul 2021 05:59:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="197319996"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="197319996"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 02:56:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; 
   d="scan'208";a="429989777"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2021 02:56:35 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m3F9S-00CY0s-Es; Tue, 13 Jul 2021 12:56:30 +0300
Date:   Tue, 13 Jul 2021 12:56:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v1 1/1] Input: parkbd - switch to use
 module_parport_driver()
Message-ID: <YO1jTvW7BhWx2Udx@smile.fi.intel.com>
References: <20210616140432.39406-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616140432.39406-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 16, 2021 at 05:04:32PM +0300, Andy Shevchenko wrote:
> Switch to use module_parport_driver() to reduce boilerplate code.

Any comments on this?

-- 
With Best Regards,
Andy Shevchenko


