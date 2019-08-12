Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D6A8A227
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 17:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfHLPUn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 11:20:43 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40554 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfHLPUj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 11:20:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id c34so20129684otb.7;
        Mon, 12 Aug 2019 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UMUwcjCxzqE/dmDLP1n/O3yo7MPYfXrBlS1+I6zzLWw=;
        b=PCGID3YGhe0d/4V+x61YoEJYzbSjJwEePHz4OktgEZ8vhUK8Rl3A33TbejSTHTtMhe
         xCgOnrBdkxB7lGH0UrRIyMwT6Q1Eed2lXvGS3wHNLrFQnZALxtHHHcpVZSTeUVQTil6H
         NshwoPebomZur99lH2uu8Q3yV1BNZzRFzF3lj6x03IAn54d4GMcwHZ1I7zsxMwBOK4Or
         r/83TrUz57EDH55AnrcJDlzUQSbEnKq77l5v2gVShb8Dw/+oFcXQi4Z2gIFW0DHLPvur
         S+mdaM6e0JDafW0TXqulK7HKRf2y4zrUVbwUaKNBCtsPfM103ajCLLA2C4juQ8lCRCp5
         yuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMUwcjCxzqE/dmDLP1n/O3yo7MPYfXrBlS1+I6zzLWw=;
        b=WNdFzfnn3nWTo9977ZDYTrWdesb9P5uGODCIbIxOuYfCyErljurPL00ZAMiJ2cV7ZG
         jXfppsgg9c2/j7ypa5CaF7jwf+cxEx8TJweozoFYbUJybq9u60xTIcHLv/BlQWuUJVt/
         HzgE2oPvA76iro3sXkR2Lmhoek5ij/CqIOTJsyGxVVNJuh4hb5fAE0+xWXXu3cG1Tqyt
         l7OSsjw6fZLe/RDqVvL04iyLyAk4k/BIqmWD3Od8Jq7ArGYLM6HoxdR+CAK/cQLAkMIa
         8PDDd9rfqYW4gQpgrjvEx0NZmIb84RBt/3lAmwxJtAtHT9TC+3SutK0QW2xEm8B0NdFM
         oJog==
X-Gm-Message-State: APjAAAWRsckHYa1zT7QKp/KF7Ee5t4lCld2tECrds+ugvhBjxiUq+pwm
        FgyWU8VW36jrYL8XKx9FhH4=
X-Google-Smtp-Source: APXvYqx1lLeXCgzc2FpM636zM2+o9xesZLHfAnev2Fugl/jUqoSv+Td3l5PwjbvgIZXRJoZI+5AaEw==
X-Received: by 2002:a9d:200c:: with SMTP id n12mr175723ota.334.1565623239026;
        Mon, 12 Aug 2019 08:20:39 -0700 (PDT)
Received: from localhost.localdomain ([65.154.66.198])
        by smtp.gmail.com with ESMTPSA id e10sm31792662oie.37.2019.08.12.08.20.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 08:20:38 -0700 (PDT)
From:   stillcompiling@gmail.com
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER),
        linux-kernel@vger.kernel.org (open list)
Cc:     Joe Perches <joe@perches.com>,
        Joshua Clayton <stillcompiling@gmail.com>
Subject: [PATCH v3 3/3] HID: core: fix dmesg flooding if report field larger than 32bit
Date:   Mon, 12 Aug 2019 09:20:22 -0600
Message-Id: <20190812152022.27963-4-stillcompiling@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812152022.27963-1-stillcompiling@gmail.com>
References: <20190812152022.27963-1-stillcompiling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua Clayton <stillcompiling@gmail.com>

Only warn once of oversize hid report value field

On HP spectre x360 convertible the message:
hid-sensor-hub 001F:8087:0AC2.0002: hid_field_extract() called with n (192) > 32! (kworker/1:2)
is continually printed many times per second, crowding out all else.
Protect dmesg by printing the warning only one time.

The size of the hid report field data structure should probably be increased.
The data structure is treated as a u32 in Linux, but an unlimited number
of bits in the USB hid spec, so there is some rearchitecture needed now that
devices are sending more than 32 bits.

Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 210b81a56e1a..3eaee2c37931 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1311,8 +1311,8 @@ u32 hid_field_extract(const struct hid_device *hid, u8 *report,
 			unsigned offset, unsigned n)
 {
 	if (n > 32) {
-		hid_warn(hid, "hid_field_extract() called with n (%d) > 32! (%s)\n",
-			 n, current->comm);
+		hid_warn_once(hid, "%s() called with n (%d) > 32! (%s)\n",
+			      __func__, n, current->comm);
 		n = 32;
 	}
 
-- 
2.21.0

