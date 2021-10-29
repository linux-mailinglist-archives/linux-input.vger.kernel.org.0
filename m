Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AF443FFAF
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 17:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhJ2Pj3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhJ2Pj3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 11:39:29 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AE4C061570;
        Fri, 29 Oct 2021 08:37:00 -0700 (PDT)
Received: by todd.t-8ch.de (Postfix, from userid 0)
        id 4A1953EDA3; Fri, 29 Oct 2021 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521818;
        bh=eeH9nLeGJVIiF8XXSqN2lYYeJNQSBTUuABif4FxVAEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bVcAWHahqE7PpbIVNmRFft8d5EJXuGUAHSC++3JNYzo5kFrgvJMGdbLQvgNGAWjnd
         5spI19iR+LsvzAiRGLgnUkjtiTXa1OmdbUE7XZwlM/OlPhIchsMLAl6Y3QITVwb6R8
         WPZ0zfXt7jZKoBLKrm5G5jh6qmyq0W/a5QxNP6eI=
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521527;
        bh=eeH9nLeGJVIiF8XXSqN2lYYeJNQSBTUuABif4FxVAEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fJacEtNtC0dpLHm84xfVbT8P8ZMXoVKwpdHojOaIydnFxKVy64TjeNKKx7T+GU/3L
         bsF8tfWxVhY5rJKcZGCu6gHJysxVV8vBRiTCDsn/5RgEd+nnYZe41Z8yfrJDb+u2YT
         5xIoJVOCmkU+dd3RRF7yaL6oaUK0fZbBdj9nhwH4=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/6] platform/x86: isthp_eclite: only load for matching devices
Date:   Fri, 29 Oct 2021 17:29:01 +0200
Message-Id: <20211029152901.297939-7-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-6-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
 <20211029152901.297939-2-linux@weissschuh.net>
 <20211029152901.297939-3-linux@weissschuh.net>
 <20211029152901.297939-4-linux@weissschuh.net>
 <20211029152901.297939-5-linux@weissschuh.net>
 <20211029152901.297939-6-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously it was loaded for all ISHTP devices.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <markgross@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/intel/ishtp_eclite.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
index 12fc98a48657..b9fb8f28fd63 100644
--- a/drivers/platform/x86/intel/ishtp_eclite.c
+++ b/drivers/platform/x86/intel/ishtp_eclite.c
@@ -681,6 +681,12 @@ static struct ishtp_cl_driver ecl_ishtp_cl_driver = {
 	.driver.pm = &ecl_ishtp_pm_ops,
 };
 
+static const struct ishtp_device_id ecl_ishtp_id_table[] = {
+	{ ecl_ishtp_guid },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
+
 static int __init ecl_ishtp_init(void)
 {
 	return ishtp_cl_driver_register(&ecl_ishtp_cl_driver, THIS_MODULE);
@@ -698,4 +704,3 @@ MODULE_DESCRIPTION("ISH ISHTP eclite client opregion driver");
 MODULE_AUTHOR("K Naduvalath, Sumesh <sumesh.k.naduvalath@intel.com>");
 
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("ishtp:*");
-- 
2.33.1

