Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433CD27F566
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 00:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731638AbgI3WrR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 18:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730981AbgI3WrR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 18:47:17 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603D4C061755
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 15:47:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gm14so758340pjb.2
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=P7Z//DzoNIop38KYf8jZGfqkJhjyG6AkBDv2O6eJ1cc=;
        b=XKJTTey0+ga69SRVnuORt+gXuU8hAEqVAltVITFW33adEmgUYhAum6F9aPd3E2OKpc
         R4EJjOIMAttQY7OSXOsG0Sifqkjm5K8Ap1dCdCHh/TVcwrPXyMudTlpxrG/ZgXDJPKR+
         faXxB7mun8JbAJHuqQw1TiAazKa6ib2ZZRKdKo11qzJbTLgaIUDnXK4+HPrF9uqAg5eY
         O6zGOLqRGzeKYFuAkODu+DpDJQHuXoywS8HSg86/Se3T15zIdnx5NWJta5yjxyuNnTZX
         AvqyzR3ftAtxymI80uz78lwgYypatuIdhG2/gz24Ed4PBR35WngIIYCDBTYrqlfqkxH0
         4hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=P7Z//DzoNIop38KYf8jZGfqkJhjyG6AkBDv2O6eJ1cc=;
        b=E58NMc8xOTMUq9gImn4VdEe9HwoColWd/Ui3oFZj8W+aib2jPpj2tD/mDGAv/7SApb
         SqbLOoVPKdXpjW7IPmT6ywScMLZ1CigvcztFquftNhmUNhrvceo5gzZfY0hF9cjmZ5fB
         mNhBknrCDScW75FRbmb9GN5llBr4L+sDnGbo7kaP890BxPD2bDbygcakLyM9wNlPghyo
         W8MsCD9k/LJ0MMac6YoupvcIhtwwnaqk0HDYmqEuhHtb2AjzPU/j2Pqn5BMd4AgdFLRm
         yD4EXGqkYEQjRi8l2yhcjEzCwcEEMfGC40svqVVQ1/ciy+5Bj53LjlB9meMqxZzmaUu1
         1c4w==
X-Gm-Message-State: AOAM532REhr0F0mGlk/7QX0fyaHj3+lnGkjhaupevVQ+OWFPy6RNGtNP
        YniGMsr0QzEsukuCOFE1Fl8=
X-Google-Smtp-Source: ABdhPJzEYqrGezs9GGry5JTg5rRUvmAduVumL65um+yldvlhZhG3oVGPnJ6tbOUYK5+mX57lmxdO+g==
X-Received: by 2002:a17:90b:4b8e:: with SMTP id lr14mr4524172pjb.100.1601506036819;
        Wed, 30 Sep 2020 15:47:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m5sm3194071pjn.19.2020.09.30.15.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:47:15 -0700 (PDT)
Date:   Wed, 30 Sep 2020 15:47:13 -0700
From:   dmitry.torokhov@gmail.com
To:     Jiri Kosina <jikos@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Johan Korsnes <jkorsnes@cisco.com>,
        linux-input@vger.kernel.org,
        Kenneth Albanowski <kenalba@google.com>
Subject: [PATCH] HID: hid-input: occasionally report stylus battery even if
 not changed
Message-ID: <20200930224713.GA88246@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are styluses that only report their battery status when they are
touching the touchscreen; additionally we currently suppress battery
reports if capacity has not changed. To help userspace recognize how long
ago the device reported battery status, let's send the change event through
if either capacity has changed, or at least 30 seconds have passed since
last report we've let through.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is a bit of RFC. Another option would be to mark the power supply
as either offline or not present when stylus leaves the surface instead
of saying it is online... Sebastian, any ideas/suggestions?

 drivers/hid/hid-input.c | 5 ++++-
 include/linux/hid.h     | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 5da631d2ec9b..92b4c9bb6619 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -534,9 +534,12 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 	capacity = hidinput_scale_battery_capacity(dev, value);
 
 	if (dev->battery_status != HID_BATTERY_REPORTED ||
-	    capacity != dev->battery_capacity) {
+	    capacity != dev->battery_capacity ||
+	    ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
 		dev->battery_capacity = capacity;
 		dev->battery_status = HID_BATTERY_REPORTED;
+		dev->battery_ratelimit_time =
+			ktime_add_ms(ktime_get_coarse(), 30 * 1000);
 		power_supply_changed(dev->battery);
 	}
 }
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 875f71132b14..c76a18f88262 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -583,6 +583,7 @@ struct hid_device {							/* device report descriptor */
 	__s32 battery_report_id;
 	enum hid_battery_status battery_status;
 	bool battery_avoid_query;
+	ktime_t battery_ratelimit_time;
 #endif
 
 	unsigned long status;						/* see STAT flags above */
-- 
2.28.0.709.gb0816b6eb0-goog


-- 
Dmitry
