Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF221661A5
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2020 16:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgBTP7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Feb 2020 10:59:20 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47586 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgBTP7U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Feb 2020 10:59:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id EC9B428E68F
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
        bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org,
        pmalani@chromium.org, Enrico Granata <egranata@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Ting Shen <phoenixshen@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Evan Green <evgreen@chromium.org>, linux-input@vger.kernel.org
Subject: [PATCH 0/8] Migrate all cros_ec_cmd_xfer() calls to cros_ec_cmd_xfer_status()
Date:   Thu, 20 Feb 2020 16:58:51 +0100
Message-Id: <20200220155859.906647-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear all,

The purpose of this series is get rid of the remaining places where the
cros_ec_cmd_xfer() function is used in favour of the
cros_ec_cmd_xfer_status() helper. This allows us to make the
cros_ec_cmd_xfer() function private and only expose to the users a
single way to send commands to the Embedded Controller.

With these changes we also want to help future improvements in the
interface, like the Prashant's series (i.e [1]) to introduce a
cros_ec_cmd() that will allow us to remove more duplicated code in
different places.

Best regards,
 Enric

Note: Prashant, looks like you should fix your sendmail as the patches
      are not threaded.

[1] https://lkml.org/lkml/2020/2/5/614

Enric Balletbo i Serra (8):
  platform/chrome: cros_ec_proto: Report command not supported
  Input: cros_ec_keyb: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec_vbc: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec_chardev: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec_sysfs: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec_lightbar: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec: Use cros_ec_cmd_xfer_status helper
  platform/chrome: cros_ec_proto: Do not export cros_ec_cmd_xfer()

 drivers/input/keyboard/cros_ec_keyb.c       | 14 +++---
 drivers/platform/chrome/cros_ec.c           |  2 +-
 drivers/platform/chrome/cros_ec_chardev.c   |  2 +-
 drivers/platform/chrome/cros_ec_lightbar.c  | 50 ++++++---------------
 drivers/platform/chrome/cros_ec_proto.c     | 14 ++++--
 drivers/platform/chrome/cros_ec_sysfs.c     | 36 +++++++--------
 drivers/platform/chrome/cros_ec_vbc.c       |  4 +-
 include/linux/platform_data/cros_ec_proto.h |  3 --
 8 files changed, 50 insertions(+), 75 deletions(-)

-- 
2.25.0

