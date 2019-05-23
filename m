Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF3F28647
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 21:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731491AbfEWTHP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 15:07:15 -0400
Received: from knopi.disroot.org ([178.21.23.139]:35012 "EHLO
        knopi.disroot.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731464AbfEWTHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 15:07:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by disroot.org (Postfix) with ESMTP id 1DBEA31D51;
        Thu, 23 May 2019 21:07:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
        by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 73kF_Qb1l6j5; Thu, 23 May 2019 21:07:11 +0200 (CEST)
From:   Daniel Smith <danct12@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
        t=1558638431; bh=80tieOKqOyKyqCagUUFd4AVkjajAKOxE5qwgMUdCc58=;
        h=From:To:Cc:Subject:Date;
        b=Mey49fOAHRSXSrpxL2YMBQRq8r9++pUFZ5Huo1dDnMmXwlgzfb5n0Pb4WFYjUM+cL
         K40RF9kLyz2jJW3J9csP5eYf8XEElUxBerX3V8gc0usdGsTk+tH2V4OtHAIscUL+iZ
         HoNKURRjBBlXkAeFhYGIDsGuO0Py7D3vRs5Q2+3+DlHju8CvQBF9pO/8dUFc8nnScx
         EhRILEKT1y6dWoNee2m1YQpZC1MJfi3AApT2JDKXCMmDNCRRShGYkg9Ahcgu17LRps
         0EHUfRgSQVSD1EpVaJGus77rXpmlt6I/rkld0A3D1BVBs4YMa+6yXR/Nc06ikRee2Z
         0h4YX7mZnjlMA==
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Smith <danct12@disroot.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] input: silead: Add MSSL0017 to acpi_device_id.
Date:   Fri, 24 May 2019 02:06:59 +0700
Message-Id: <20190523190659.3117-1-danct12@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Chuwi Hi10 Plus, the Silead device id is MSSL0017.

Signed-off-by: Daniel Smith <danct12@disroot.org>
---
 drivers/input/touchscreen/silead.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 09241d4cdebc..06f0eb04a8fd 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -617,6 +617,7 @@ static const struct acpi_device_id silead_ts_acpi_match[] = {
 	{ "MSSL1680", 0 },
 	{ "MSSL0001", 0 },
 	{ "MSSL0002", 0 },
+	{ "MSSL0017", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, silead_ts_acpi_match);
-- 
2.21.0

