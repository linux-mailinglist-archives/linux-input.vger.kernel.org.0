Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF99391928
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 15:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhEZNrT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 09:47:19 -0400
Received: from mga01.intel.com ([192.55.52.88]:25615 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231911AbhEZNrS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 09:47:18 -0400
IronPort-SDR: HAHd4OXYZGQZzsrlU5qfOetqzrxPObhNYPMr/+0GtvGL74/i0iOlrqxeJjPkjRvtqqQjW2oh1L
 bMcH+IvUivzw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223652118"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="223652118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 06:45:45 -0700
IronPort-SDR: Zq9E37eXXTtYgMWB1vskizc9BgvpiWuRfQIxI5rM4wQxDbZCvWfrE9h8Od1kp6N9HNL0hzazVM
 Vokq9syBnfIA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="547196605"
Received: from gnaderi-mobl.amr.corp.intel.com ([10.209.149.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 06:45:29 -0700
Message-ID: <e41df7ef5ae5f1e18e2fd6b641c8c7def52bc34e.camel@linux.intel.com>
Subject: Re: [PATCH v2] HID: intel_ish-hid: HBM: Use connected standby state
 bit during suspend/resume
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Date:   Wed, 26 May 2021 06:45:28 -0700
In-Reply-To: <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm>
References: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>
         <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
> > 	changed changelog to be more clear
> > 	Changed the name in the signed-off to match "From"
> > 
> >  drivers/hid/intel-ish-hid/ishtp/hbm.c | 6 +++---
> >  drivers/hid/intel-ish-hid/ishtp/hbm.h | 1 +
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Applied, thanks.

I don't see this patch in 5.13-rc3. But I see in linux-next. There are
other patches here which didn't make to 5.13-rc.

I see them in
https://kernel.googlesource.com/pub/scm/linux/kernel/git/hid/hid/+/refs/heads/for-5.13/intel-ish

Did you decide to postpone for 5.14? It will be fine to postpone.


Thanks,
Srinivas
 
> 

