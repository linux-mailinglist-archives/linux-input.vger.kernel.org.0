Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D717D2002DA
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 09:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgFSHnP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 03:43:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729548AbgFSHnP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 03:43:15 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C27742073E;
        Fri, 19 Jun 2020 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592552594;
        bh=igD+XH9+v5JkWSf/ZVPl/nrnFrjVmI77x+1KYy2Hk3c=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WSJqxw3yD55O+KDsVUnbhyTSDHFOt68q5n15ICp61DnemstIKpFwc3gcqC+4VOdkm
         aB4utH+/LYo+Y+y0E0SHgcZH+RX3NnHF/huUt5D2va+LbRe4+2UlJI2SUfTtViTb1G
         nGO3MJoerV+4W716YskGvo0FFSatmWK4g700DJzc=
Date:   Fri, 19 Jun 2020 09:43:11 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>, Even Xu <even.xu@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Song Hongyan <hongyan.song@intel.com>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: intel-ish-hid: Replace PCI_DEV_FLAGS_NO_D3 with
 pci_save_state
In-Reply-To: <68C336BB-C2E1-4DE4-8137-18F7FBEF140C@canonical.com>
Message-ID: <nycvar.YFH.7.76.2006190942170.13242@cbobk.fhfr.pm>
References: <20200505131730.22118-1-kai.heng.feng@canonical.com> <dd8033a053be145fd178a89dc362a25a22e17a42.camel@linux.intel.com> <7E88D4A8-8056-4E12-8B2C-27307A7C5E7D@canonical.com> <68C336BB-C2E1-4DE4-8137-18F7FBEF140C@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 12 Jun 2020, Kai-Heng Feng wrote:

> >>> PCI_DEV_FLAGS_NO_D3 should not be used outside of PCI core.
> >>> 
> >>> Instead, we can use pci_save_state() to hint PCI core that the device
> >>> should stay at D0 during suspend.
> >> 
> >> Your changes are doing more than just changing the flag. Can you
> >> explain more about the other changes?
> > 
> > By using pci_save_state(), in addition to keep itself stay at D0, the parent bridge will also stay at D0.
> > So it's a better approach to achieve the same thing.
> > 
> >> Also make sure that you test on both platforms which has regular S3 and
> >> S0ix (modern standby system).
> > 
> > Actually I don't have any physical hardware to test the patch, I found the issue when I search for D3 quirks through the source code.
> > 
> > Can you guys do a quick smoketest for this patch?
> 
> Tested this patch on an S2idle system with intel-ish (Latitude 9510) and 
> it works fine. Please consider merging this patch, thanks!

Thanks for testing.

Could you please resubmit v2 with the updated changelog (explaining the 
relationship to the parent bridge mode and the related changes your code 
is doing), and resubmit so that I can queue it in hid.git?

Thanks.

-- 
Jiri Kosina
SUSE Labs

