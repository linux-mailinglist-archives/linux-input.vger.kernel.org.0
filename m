Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9DC9382AF6
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 13:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbhEQL2a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 07:28:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:46221 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236631AbhEQL2a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 07:28:30 -0400
IronPort-SDR: hPpG3EacrWi9vHjhWOGGNKDkSQYbrY2BiVN0TlwUcRl4R5gZUM+98qm7BGt/ngeS9F4ao1gaMT
 CPj+0YbVAPJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187564267"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187564267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:27:13 -0700
IronPort-SDR: sj1McuTa0gY8S7dUToTJtOhQsmNB0hPFxz3ZIHzt3DqJazarJdr2mX5EorRBCBf5mHUWBSPq+j
 WTZh/DQ5iafA==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="540381322"
Received: from btamaklo-mobl.amr.corp.intel.com ([10.209.149.190])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:27:10 -0700
Message-ID: <7418998adc91ab656aab783883bfd5ef96064e57.camel@linux.intel.com>
Subject: Re: [PATCH v2] HID: intel_ish-hid: HBM: Use connected standby state
 bit during suspend/resume
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Date:   Mon, 17 May 2021 04:27:06 -0700
In-Reply-To: <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm>
References: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>
         <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On Fri, 2021-03-19 at 14:35 +0100, Jiri Kosina wrote:
> On Tue, 16 Mar 2021, Srinivas Pandruvada wrote:
> 
> > From: Ye Xiang <xiang.ye@intel.com>
> > 
> > The individual sensor drivers implemented in the ISH firmware needs
> > capability to take special actions when there is a change in the
> > system
> > standby state. The ISH core firmware passes this notification to
> > individual sensor drivers in response to the OS request via
> > connected
> > standby bit in the SYSTEM_STATE_STATUS command.
> > 
> > This change sets CONNECTED_STANDBY_STATE_BIT bit to 1 during
> > suspend
> > callback and clears during resume callback.
> > 
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> > [srinivas.pandruvada@linux.intel.com: changelog rewrite]
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > ---
> > v2:
> >         changed changelog to be more clear
> >         Changed the name in the signed-off to match "From"
> > 
> >  drivers/hid/intel-ish-hid/ishtp/hbm.c | 6 +++---
> >  drivers/hid/intel-ish-hid/ishtp/hbm.h | 1 +
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Applied, thanks.

I was looking for this patch in 5.13-rc2. It is not there, Is there
some pull request pending?

Thanks,
Srinivas 


> 


