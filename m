Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6321B32CE52
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 09:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236573AbhCDIWV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 03:22:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:8184 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235802AbhCDIWK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 03:22:10 -0500
IronPort-SDR: h/AZN0XsGLgD729fL568E73zRMBTl/PxrMgf5V0W84KXoYtJipWAQswLzmAHP4rnAIotYJ97mJ
 7o49+IX53atw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="166625125"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="166625125"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 00:20:25 -0800
IronPort-SDR: KtnJIZJxOwEy5iAWkXc/uy11mqntPRYTwvWunItyldZyge//csYiVPDM+6biih0zU8lGQ2K/V5
 xk0yPNP0bG5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="507271929"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2021 00:20:23 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Handle device properties with software node API
Date:   Thu,  4 Mar 2021 11:20:23 +0300
Message-Id: <20210304082023.17689-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The old device property API (device_add_properties()) is
going to be removed. Replacing the it with the software node
API equivalent, device_create_managed_software_node().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index c44a6e8dceb8c..45203e333f578 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1355,7 +1355,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
 
 	if (has_acpi_companion(dev) &&
 	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
-		error = device_add_properties(dev, ts_data->properties);
+		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
 		if (error)
 			dev_err(dev, "failed to add properties: %d\n", error);
 	}
-- 
2.30.1

