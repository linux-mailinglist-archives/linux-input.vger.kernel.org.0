Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 195852CF866
	for <lists+linux-input@lfdr.de>; Sat,  5 Dec 2020 02:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbgLEAtZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 19:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgLEAtZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 19:49:25 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CA7C0613D1
        for <linux-input@vger.kernel.org>; Fri,  4 Dec 2020 16:48:59 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id b4so4167007plr.15
        for <linux-input@vger.kernel.org>; Fri, 04 Dec 2020 16:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=OOLjFNMS8tQywl7ilpHmrUE6lso3cAuK5mUQnXiUclI=;
        b=kR2WLgq1MjNAkDBZQFZSynjHMN96/QuHMTkFzTnuxjVXyVDh/WXr4AgVCPNNzHbetd
         AkQu5IKFyahjMnccYJHPeuyxuALF4ICetGAGJf3VNwyeKaRhf3WjJsl/B8pem3mb87zR
         ismFqiJo+Vbo0/rEcxnnoAIfwkJkW7GfECKqhPvGKyGWnpoxTFIpUnHnPqoXJLfn3584
         +/0MpSUHaIvLsQ43PUH1FOR2CzsPq1NTWnlvNFQJJH+EU1zp6XJypFMEUj/BSOlh0SaH
         /vnENeWNpn2WDXHJWk707/ckVlbasTScQ8mL68lcaCACqtI8i18/zeRG73fmj4nUL8BL
         i2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=OOLjFNMS8tQywl7ilpHmrUE6lso3cAuK5mUQnXiUclI=;
        b=Zkl9zIt6A8bbGNjk71/AF5kC41zcGyUZuD/ynSkGU6GHuiFurFcEA+VpDFCd65Nwu9
         aX0pJb/X93YSdY0L92guaHY6ELxsaG14ghD7ZGVhYSVhAXUQFFRgisK2NbC+D1iDo/X/
         LLigQSvO3wMfQkmT6yDMXb9iC1Snhf+LQ5xdW+y644ZIQNqwRNO5cVAy4yOIZ9DuTR+O
         hqfya6b4nwAjy6AE7Dt6EPhIbqXqkcmiKQpe7kIPhTwLUelOGM3UcjhQmG/15w/KNYzu
         +PW+brfsXUhV923z1Zn6ZIQBrYNWmgPi2wiK9uJCUVsO1j9OFzIGPtOHa9dNx5kXgmD6
         uahw==
X-Gm-Message-State: AOAM530tLbbgZ5+ZkIx3YdGAgoX4Qz4O+bmJSck+ZtvIIv/QBFLPQoh3
        H9NsjY7ZjmcxmyOXMqiCVWrIvEMEiyt1vnx9MsM=
X-Google-Smtp-Source: ABdhPJxnEJgVSEKtlx0et017hyd4/HEojDJykyW5iVIE9P448AvF1NwP0M5Z88V5XnCcS2IFNFMKbj4QNe2Y7lgBmBY=
Sender: "willmcvicker via sendgmr" <willmcvicker@willmcvicker.c.googlers.com>
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:56a:b029:d7:ced2:60eb with
 SMTP id 97-20020a170902056ab02900d7ced260ebmr6156221plf.24.1607129338929;
 Fri, 04 Dec 2020 16:48:58 -0800 (PST)
Date:   Sat,  5 Dec 2020 00:48:48 +0000
Message-Id: <20201205004848.2541215-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v1] HID: make arrays usage and value to be the same
From:   Will McVicker <willmcvicker@google.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Will Coster <willcoster@google.com>,
        Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HID subsystem allows an "HID report field" to have a different
number of "values" and "usages" when it is allocated. When a field
struct is created, the size of the usage array is guaranteed to be at
least as large as the values array, but it may be larger. This leads to
a potential out-of-bounds write in
__hidinput_change_resolution_multipliers() and an out-of-bounds read in
hidinput_count_leds().

To fix this, let's make sure that both the usage and value arrays are
the same size.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/hid/hid-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 56172fe6995c..8a8b2b982f83 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -90,7 +90,7 @@ EXPORT_SYMBOL_GPL(hid_register_report);
  * Register a new field for this report.
  */
 
-static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages, unsigned values)
+static struct hid_field *hid_register_field(struct hid_report *report, unsigned usages)
 {
 	struct hid_field *field;
 
@@ -101,7 +101,7 @@ static struct hid_field *hid_register_field(struct hid_report *report, unsigned
 
 	field = kzalloc((sizeof(struct hid_field) +
 			 usages * sizeof(struct hid_usage) +
-			 values * sizeof(unsigned)), GFP_KERNEL);
+			 usages * sizeof(unsigned)), GFP_KERNEL);
 	if (!field)
 		return NULL;
 
@@ -300,7 +300,7 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
 	usages = max_t(unsigned, parser->local.usage_index,
 				 parser->global.report_count);
 
-	field = hid_register_field(report, usages, parser->global.report_count);
+	field = hid_register_field(report, usages);
 	if (!field)
 		return 0;
 
-- 
2.29.2.576.ga3fc446d84-goog

