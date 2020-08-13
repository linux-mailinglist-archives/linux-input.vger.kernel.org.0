Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCD02431DB
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 02:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMA5W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 20:57:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:41031 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726615AbgHMA5I (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 20:57:08 -0400
IronPort-SDR: 2RMATZ0g7LVTtPUCCfJBLweYPmnNQ4MUDwRKlLQl73mAEARcuDUShybx0GhHa2HDJZpR27rVzs
 soOLkT9YpvcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="155260405"
X-IronPort-AV: E=Sophos;i="5.76,306,1592895600"; 
   d="scan'208";a="155260405"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 17:57:06 -0700
IronPort-SDR: VjWjXekWGu3e6iSwzLhuySzDCmL181erhxsKWC4zlbYHMFezB+gecwOdwJ2F2FSNicHzvnOr7c
 yZgqepBVo9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,306,1592895600"; 
   d="scan'208";a="369439810"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Aug 2020 17:57:04 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k61YF-0000LY-BC; Thu, 13 Aug 2020 00:57:03 +0000
Date:   Thu, 13 Aug 2020 08:56:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] coccinelle: api: fix device_attr_show.cocci warnings
Message-ID: <20200813005610.GA85132@8851f5375e5a>
References: <202008130840.TWLDLwLA%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008130840.TWLDLwLA%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: kernel test robot <lkp@intel.com>

drivers/hid/hid-roccat-kone.c:406:8-16: WARNING: use scnprintf or sprintf
drivers/hid/hid-roccat-kone.c:397:8-16: WARNING: use scnprintf or sprintf
drivers/hid/hid-roccat-kone.c:438:8-16: WARNING: use scnprintf or sprintf
drivers/hid/hid-roccat-kone.c:550:8-16: WARNING: use scnprintf or sprintf
drivers/hid/hid-roccat-kone.c:448:8-16: WARNING: use scnprintf or sprintf
drivers/hid/hid-roccat-kone.c:429:8-16: WARNING: use scnprintf or sprintf


 From Documentation/filesystems/sysfs.txt:
  show() must not use snprintf() when formatting the value to be
  returned to user space. If you can guarantee that an overflow
  will never happen you can use sprintf() otherwise you must use
  scnprintf().

Generated by: scripts/coccinelle/api/device_attr_show.cocci

Fixes: abfc19ff202d ("coccinelle: api: add device_attr_show script")
CC: Denis Efremov <efremov@linux.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c2a69f610e64c8dec6a06a66e721f4ce1dd783a
commit: abfc19ff202d287742483e15fd478ddd6ada2187 coccinelle: api: add device_attr_show script

Please take the patch only if it's a positive warning. Thanks!

 hid-roccat-kone.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -394,7 +394,7 @@ static ssize_t kone_sysfs_show_actual_pr
 {
 	struct kone_device *kone =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_profile);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", kone->actual_profile);
 }
 static DEVICE_ATTR(actual_profile, 0440, kone_sysfs_show_actual_profile, NULL);
 
@@ -403,7 +403,7 @@ static ssize_t kone_sysfs_show_actual_dp
 {
 	struct kone_device *kone =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", kone->actual_dpi);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", kone->actual_dpi);
 }
 static DEVICE_ATTR(actual_dpi, 0440, kone_sysfs_show_actual_dpi, NULL);
 
@@ -426,7 +426,7 @@ static ssize_t kone_sysfs_show_weight(st
 
 	if (retval)
 		return retval;
-	return snprintf(buf, PAGE_SIZE, "%d\n", weight);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", weight);
 }
 static DEVICE_ATTR(weight, 0440, kone_sysfs_show_weight, NULL);
 
@@ -435,7 +435,7 @@ static ssize_t kone_sysfs_show_firmware_
 {
 	struct kone_device *kone =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", kone->firmware_version);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", kone->firmware_version);
 }
 static DEVICE_ATTR(firmware_version, 0440, kone_sysfs_show_firmware_version,
 		   NULL);
@@ -445,7 +445,7 @@ static ssize_t kone_sysfs_show_tcu(struc
 {
 	struct kone_device *kone =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.tcu);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", kone->settings.tcu);
 }
 
 static int kone_tcu_command(struct usb_device *usb_dev, int number)
@@ -547,7 +547,7 @@ static ssize_t kone_sysfs_show_startup_p
 {
 	struct kone_device *kone =
 			hid_get_drvdata(dev_get_drvdata(dev->parent->parent));
-	return snprintf(buf, PAGE_SIZE, "%d\n", kone->settings.startup_profile);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", kone->settings.startup_profile);
 }
 
 static ssize_t kone_sysfs_set_startup_profile(struct device *dev,
