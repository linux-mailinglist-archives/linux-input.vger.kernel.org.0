Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38FE891B1C
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2019 04:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfHSCwY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Aug 2019 22:52:24 -0400
Received: from mga14.intel.com ([192.55.52.115]:34893 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbfHSCwY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Aug 2019 22:52:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Aug 2019 19:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="329242805"
Received: from spandruv-mobl3.jf.intel.com ([10.252.197.211])
  by orsmga004.jf.intel.com with ESMTP; 18 Aug 2019 19:52:23 -0700
Message-ID: <77a8df403934d85967dcdb221862c13e15c26112.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/3] HID: intel-ish-hid: support s2idle and s3 in
 ish_suspend()
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Zhang Lixu <lixu.zhang@intel.com>, linux-input@vger.kernel.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-kernel@vger.kernel.org
Date:   Sun, 18 Aug 2019 19:52:23 -0700
In-Reply-To: <20190808102113.27802-1-lixu.zhang@intel.com>
References: <20190808102113.27802-1-lixu.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-3.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2019-08-08 at 18:21 +0800, Zhang Lixu wrote:
> Currently, the NO_D3 flag is set in ish_probe(), the intel-ish-ipc
> driver
> puts the ISH into D0i3 when system enter both suspend-to-idle(S0ix)
> and
> suspend-to-mem(S3). These patches are to put the ISH into D3 when
> system
> enter S3 and put the ISH into D0i3 when system enter S0ix.
> 
> I tested these patches on the following platforms:
> ISH 5.2: ICL
> ISH 5.0: CNL CFL WHL CML
> ISH 4.0: GLK
> ISH 3.0: KBL
> 
> Test steps:
> * Run the IIO Sensor tool to read the accel_3d sensor data
> * Run cmd "echo mem > /sys/power/state" to suspend-to-mem
> * Press the keyboard to wake up OS.
> * Check if the tool can get the sensor data after OS resume.
> * Run cmd "echo freeze > /sys/power/state" to suspend-to-idle
> * Press the keyboard to wake up OS.
> * Check if the tool can get the sensor data after OS resume.
> 
> Test results:
> The tool can get the accel_3d sensor data after resuming from both
> suspend-to-mem and suspend-to-idle.
> 
> Changes from v1:
> * Fix the indentation issue
> * Elaborate the reason to remove the NO_D3 flag
> * Split the PATCH v1 to three changes, and try to minimize the lines
> change
> 
> Zhang Lixu (3):
>   HID: intel-ish-hid: ipc: set NO_D3 flag only when needed
>   HID: intel-ish-hid: ipc: make ish suspend paths clear
>   HID: intel-ish-hid: ipc: check the NO_D3 flag to distinguish resume
>     paths
> 

For the series:

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
>  drivers/hid/intel-ish-hid/ipc/ipc.c     |  2 +-
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 95 +++++++++++++++------
> ----
>  3 files changed, 61 insertions(+), 37 deletions(-)
> 

