Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10292E99E5
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 17:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbhADQEe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 11:04:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:37709 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbhADQDv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 11:03:51 -0500
IronPort-SDR: ZNpJmlhBpH7YiHYRn0WVx+CCN9Ms4iTUzdyjj0QL6mE/nbbUpkptBvXZ77p1vProMiUS6JCNbe
 yHNLLn5m8qgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="177125364"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="177125364"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 08:01:42 -0800
IronPort-SDR: Sat210pARWhhFDSGQ38Z9H/iJxxb+L7jzty0m3qiqd2GtmdR42YkGYraJgERu63QGl5LaKf1B7
 UBpmRy8lO1QQ==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="345939499"
Received: from hnanjund-mobl.amr.corp.intel.com ([10.254.115.148])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 08:01:40 -0800
Message-ID: <7430c8b52fd49ded844da06b51056cb490cd7cfe.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] hid: intel-ish-hid: ipc: enable OOB support for EHL
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jiri Kosina <jikos@kernel.org>, Zhang Lixu <lixu.zhang@intel.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Date:   Mon, 04 Jan 2021 08:01:36 -0800
In-Reply-To: <nycvar.YFH.7.76.2101041612290.13752@cbobk.fhfr.pm>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
         <nycvar.YFH.7.76.2101041612290.13752@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-01-04 at 16:12 +0100, Jiri Kosina wrote:
> On Wed, 16 Dec 2020, Zhang Lixu wrote:
> 
> > The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
> > service, which allows wakup device when the system is in S5 (Soft-
> > Off
> > state). This OOB service can be enabled/disabled from BIOS
> > settings.
> > 
> > These two patches is to enable this feature for EHL platform.
> > 
> > We have tested these patches on both ISH platforms and EHL
> > platforms,
> > it works fine.
> > 
> > Zhang Lixu (2):
> >   hid: intel-ish-hid: ipc: finish power flow for EHL OOB
> >   hid: intel-ish-hid: ipc: Address EHL Sx resume issues
> > 
> >  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
> >  drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++
> >  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 54
> > ++++++++++++++++++++++++-
> >  3 files changed, 81 insertions(+), 1 deletion(-)
> 
> Srinivas, can I please get your Acked-by / Reviewed-by for this?
Acked on individual patches.

Thanks,
Srinivas


> Thanks,
> 


