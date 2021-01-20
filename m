Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DD42FCBF7
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 08:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbhATHq5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 02:46:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:29185 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729688AbhATHqw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 02:46:52 -0500
IronPort-SDR: MPPIAEUI//ToBht043lTU1mwebwoO+E57kQGPUwBwdOeiPa/DEm7rE109mv5zf/gLUB9yWyL3B
 umnsOkiqnA6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="178282821"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="178282821"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:46:09 -0800
IronPort-SDR: iqHtDWPKhr5bFRTexVioGGBKRT33hJqZYwC44hhpYtxZl5JqJqi1JBzQa1fdM3taDuy60lQpVu
 R14ZiDjkFlQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="466994276"
Received: from host.sh.intel.com ([10.239.154.115])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2021 23:46:07 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     jikos@kernel.org, jic23@kernel.org,
        srinivas.pandruvada@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH 3/3] hid-sensors: Add more data fields for sensitivity checking
Date:   Wed, 20 Jan 2021 15:47:06 +0800
Message-Id: <20210120074706.23199-4-xiang.ye@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120074706.23199-1-xiang.ye@intel.com>
References: <20210120074706.23199-1-xiang.ye@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before, when reading/writing the hysteresis of als, incli-3d, press, and
rotation sensor, we will get invalid argument error.

This patch add more sensitivity data fields for these sensors, so that
these sensors can get sensitivity index and return correct hysteresis
value.

Signed-off-by: Ye Xiang <xiang.ye@intel.com>
---
 drivers/iio/light/hid-sensor-als.c            | 1 +
 drivers/iio/orientation/hid-sensor-incl-3d.c  | 1 +
 drivers/iio/orientation/hid-sensor-rotation.c | 1 +
 drivers/iio/pressure/hid-sensor-press.c       | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/iio/light/hid-sensor-als.c b/drivers/iio/light/hid-sensor-als.c
index 8bf6e9e0a0e0..afcdb424bfb8 100644
--- a/drivers/iio/light/hid-sensor-als.c
+++ b/drivers/iio/light/hid-sensor-als.c
@@ -41,6 +41,7 @@ struct als_state {
 
 static const u32 als_sensitivity_addresses[] = {
 	HID_USAGE_SENSOR_DATA_LIGHT,
+	HID_USAGE_SENSOR_LIGHT_ILLUM,
 };
 
 /* Channel definitions */
diff --git a/drivers/iio/orientation/hid-sensor-incl-3d.c b/drivers/iio/orientation/hid-sensor-incl-3d.c
index 6e69f6e673cc..7af48d336285 100644
--- a/drivers/iio/orientation/hid-sensor-incl-3d.c
+++ b/drivers/iio/orientation/hid-sensor-incl-3d.c
@@ -49,6 +49,7 @@ static const u32 incl_3d_addresses[INCLI_3D_CHANNEL_MAX] = {
 
 static const u32 incl_3d_sensitivity_addresses[] = {
 	HID_USAGE_SENSOR_DATA_ORIENTATION,
+	HID_USAGE_SENSOR_ORIENT_TILT,
 };
 
 /* Channel definitions */
diff --git a/drivers/iio/orientation/hid-sensor-rotation.c b/drivers/iio/orientation/hid-sensor-rotation.c
index 03d2845a7b2c..b0245b3b7ffc 100644
--- a/drivers/iio/orientation/hid-sensor-rotation.c
+++ b/drivers/iio/orientation/hid-sensor-rotation.c
@@ -33,6 +33,7 @@ struct dev_rot_state {
 
 static const u32 rotation_sensitivity_addresses[] = {
 	HID_USAGE_SENSOR_DATA_ORIENTATION,
+	HID_USAGE_SENSOR_ORIENT_QUATERNION,
 };
 
 /* Channel definitions */
diff --git a/drivers/iio/pressure/hid-sensor-press.c b/drivers/iio/pressure/hid-sensor-press.c
index 8cac2c94e75a..c416d261e3e3 100644
--- a/drivers/iio/pressure/hid-sensor-press.c
+++ b/drivers/iio/pressure/hid-sensor-press.c
@@ -31,6 +31,7 @@ struct press_state {
 
 static const u32 press_sensitivity_addresses[] = {
 	HID_USAGE_SENSOR_DATA_ATMOSPHERIC_PRESSURE,
+	HID_USAGE_SENSOR_ATMOSPHERIC_PRESSURE
 };
 
 /* Channel definitions */
-- 
2.17.1

