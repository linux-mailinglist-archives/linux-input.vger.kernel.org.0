Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C792EA371
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 03:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbhAECsA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 21:48:00 -0500
Received: from mga05.intel.com ([192.55.52.43]:19906 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbhAECsA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 4 Jan 2021 21:48:00 -0500
IronPort-SDR: v41PRKSodv2AniJ7BJ0/R1l+8yzIBEBrd/YpLnuzWRkZ4MUKQP6bDj1veEvfotRTNG83023rQC
 9DlCrdH4M8JQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="261805012"
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; 
   d="scan'208";a="261805012"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 18:47:19 -0800
IronPort-SDR: 6J7RaPnEGhExRe4I0EMLCZJOWXGABHQ9Yn/gnRN+UzkCyF6xm/oALLEkHtW+XP6uAmo1qjlVN6
 RnR+nDU5x5Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; 
   d="scan'208";a="349727292"
Received: from ipsg-l-lixuzha.sh.intel.com (HELO ipsg-l-lixuzha) ([10.239.153.22])
  by orsmga006.jf.intel.com with ESMTP; 04 Jan 2021 18:47:18 -0800
Date:   Tue, 5 Jan 2021 10:42:50 +0800
From:   "Zhang, Lixu" <lixu.zhang@intel.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/2] hid: intel-ish-hid: ipc: enable OOB support for EHL
Message-ID: <20210105024250.GA63988@ipsg-l-lixuzha>
References: <20201216063640.4086068-1-lixu.zhang@intel.com>
 <nycvar.YFH.7.76.2101041612290.13752@cbobk.fhfr.pm>
 <7430c8b52fd49ded844da06b51056cb490cd7cfe.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7430c8b52fd49ded844da06b51056cb490cd7cfe.camel@linux.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 04, 2021 at 08:01:36AM -0800, Srinivas Pandruvada wrote:
> On Mon, 2021-01-04 at 16:12 +0100, Jiri Kosina wrote:
> > On Wed, 16 Dec 2020, Zhang Lixu wrote:
> > 
> > > The EHL (Elkhart Lake) based platforms provide a OOB (Out of band)
> > > service, which allows wakup device when the system is in S5 (Soft-
> > > Off
> > > state). This OOB service can be enabled/disabled from BIOS
> > > settings.
> > > 
> > > These two patches is to enable this feature for EHL platform.
> > > 
> > > We have tested these patches on both ISH platforms and EHL
> > > platforms,
> > > it works fine.
> > > 
> > > Zhang Lixu (2):
> > >   hid: intel-ish-hid: ipc: finish power flow for EHL OOB
> > >   hid: intel-ish-hid: ipc: Address EHL Sx resume issues
> > > 
> > >  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
> > >  drivers/hid/intel-ish-hid/ipc/ipc.c     | 27 +++++++++++++
> > >  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 54
> > > ++++++++++++++++++++++++-
> > >  3 files changed, 81 insertions(+), 1 deletion(-)
> > 
> > Srinivas, can I please get your Acked-by / Reviewed-by for this?
> Acked on individual patches.
> 
> Thanks,
> Srinivas
> 
> 
> > Thanks,
> > 
> 
> 

Thanks.
