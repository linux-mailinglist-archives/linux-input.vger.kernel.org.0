Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1F85814
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 04:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfHHCW1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Aug 2019 22:22:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:53450 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727999AbfHHCW1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Aug 2019 22:22:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 19:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; 
   d="scan'208";a="168832617"
Received: from ipsg-l-lixuzha.sh.intel.com ([10.239.153.20])
  by orsmga008.jf.intel.com with ESMTP; 07 Aug 2019 19:21:50 -0700
From:   Zhang Lixu <lixu.zhang@intel.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     srinivas.pandruvada@linux.intel.com, linux-kernel@vger.kernel.org,
        lixu.zhang@intel.com
Subject: [PATCH v2 0/3] HID: intel-ish-hid: support s2idle and s3 in ish_suspend()
Date:   Thu,  8 Aug 2019 18:21:10 +0800
Message-Id: <20190808102113.27802-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, the NO_D3 flag is set in ish_probe(), the intel-ish-ipc driver
puts the ISH into D0i3 when system enter both suspend-to-idle(S0ix) and
suspend-to-mem(S3). These patches are to put the ISH into D3 when system
enter S3 and put the ISH into D0i3 when system enter S0ix.

I tested these patches on the following platforms:
ISH 5.2: ICL
ISH 5.0: CNL CFL WHL CML
ISH 4.0: GLK
ISH 3.0: KBL

Test steps:
* Run the IIO Sensor tool to read the accel_3d sensor data
* Run cmd "echo mem > /sys/power/state" to suspend-to-mem
* Press the keyboard to wake up OS.
* Check if the tool can get the sensor data after OS resume.
* Run cmd "echo freeze > /sys/power/state" to suspend-to-idle
* Press the keyboard to wake up OS.
* Check if the tool can get the sensor data after OS resume.

Test results:
The tool can get the accel_3d sensor data after resuming from both
suspend-to-mem and suspend-to-idle.

Changes from v1:
* Fix the indentation issue
* Elaborate the reason to remove the NO_D3 flag
* Split the PATCH v1 to three changes, and try to minimize the lines change

Zhang Lixu (3):
  HID: intel-ish-hid: ipc: set NO_D3 flag only when needed
  HID: intel-ish-hid: ipc: make ish suspend paths clear
  HID: intel-ish-hid: ipc: check the NO_D3 flag to distinguish resume
    paths

 drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
 drivers/hid/intel-ish-hid/ipc/ipc.c     |  2 +-
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 95 +++++++++++++++----------
 3 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.17.1

