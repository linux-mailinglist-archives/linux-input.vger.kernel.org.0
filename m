Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B193312CE
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 17:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhCHQEL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 11:04:11 -0500
Received: from mga14.intel.com ([192.55.52.115]:16665 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhCHQEE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 11:04:04 -0500
IronPort-SDR: AnMju5dDiFZXcLyIPB/Y7tMn/8OTRnMtADhh6yBu1ynM+SqBI8hoGdeBgQbIB3Iz1S0JCy4Qiz
 sd5UrQ9BVbyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="187417777"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="187417777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:04:03 -0800
IronPort-SDR: oArg1YrvPkI/vKbk+xDakXU2Chg+VproKHC99GVZyEv8tK9wp+Rs+d1CKXUVeDrF2vkrBA1aBL
 HAMj/zUlf68Q==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="385895120"
Received: from arohrbax-mobl.amr.corp.intel.com ([10.209.91.130])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:03:49 -0800
Message-ID: <31028f589e27e246bb3b4b693caeb0b8eae3a285.camel@linux.intel.com>
Subject: Re: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always
 false condition
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 08 Mar 2021 08:03:49 -0800
In-Reply-To: <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm>
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
         <nycvar.YFH.7.76.2103081107250.12405@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-03-08 at 11:07 +0100, Jiri Kosina wrote:
> On Sat, 6 Feb 2021, Uwe Kleine-König wrote:
> 
> > A remove callback is only ever called for a bound device. So there
> > is no
> > need to check for device or driver being NULL.
> 
> Srinivas, any objections to this patchset? The cleanups look good to
> me. 
Sorry, I missed this series.
No objection for taking these patches.

Thanks,
Srinivas


> Thanks,
> 

