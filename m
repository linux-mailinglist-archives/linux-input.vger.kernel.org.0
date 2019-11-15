Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6964FFD9E1
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 10:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfKOJvQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 04:51:16 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38527 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOJuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 04:50:35 -0500
Received: by mail-pf1-f194.google.com with SMTP id c13so6371492pfp.5
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2019 01:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q/zS7LIA/gAJ7ALKgbKIx/DtzP4PBNkkZFmoo4J/Xcw=;
        b=oUWF3k2Yg6H98pIn3oKzqU+yM8RpGFNqOvbgdj3N8JnGrK2kekMgeCbQQmqyazQ2AD
         empifS2PgK8+WrrujNzVaoYbHCC4Q0K1cU+6EEpZND4yrCc4PJOEvFmD9xHlEuGLCxXh
         OIMq6jPtaBwimTDUTAFrj/guN4QZgPBKuSV3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q/zS7LIA/gAJ7ALKgbKIx/DtzP4PBNkkZFmoo4J/Xcw=;
        b=YAOCt0O45D1Ds8/6zdwFgKSNaXPxWwyiIiU/NT/KBkUiYY54YJRbNxEiLjVo7vUy0O
         hEA3rPs8xuTFKcm6xfkuxv3DL0vq2IMHJsMq32Ii1jWPNzTuYa8SdAEWKTmmvyoBoiyq
         8c4thThxYPPcmG7b5uxMiTqdcjSvXITLYhN4ChowGxgGoGQQRJ8es9OodjDPjCZZ1Bc2
         w8LeVB38ixUbqujWKtRLm9YcgrJuRsevRddHFLjuLp3CKulpr8Us+GPUp2gkmLTOm22w
         wR+KdKBcz92436dRsFF1DXEt+f3e2oZnlhzJBIWRjO5iJ+9oSGO6vF2nhUOFfQeG/eOw
         axdA==
X-Gm-Message-State: APjAAAXlpSyszF27NjZdqD+vCZl+v2r/CHIqmqukMHc5MLFagxf+ZflC
        MLnZG255jdJIUn0Ro1QUkrDTgg==
X-Google-Smtp-Source: APXvYqxpem5LuPx2W7ijK0Zxh/n/d1MWfJFA0LttZuKt+NfyE9sr+/HGCOIjjVU3MbM/9FaUlBmOaQ==
X-Received: by 2002:a62:170b:: with SMTP id 11mr16359373pfx.85.1573811434914;
        Fri, 15 Nov 2019 01:50:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
        by smtp.gmail.com with ESMTPSA id 83sm9517342pgh.86.2019.11.15.01.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 01:50:34 -0800 (PST)
From:   Gwendal Grignou <gwendal@chromium.org>
To:     dmitry.torokhov@gmail.com, groeck@chromium.org,
        briannorris@chromium.org, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, lee.jones@linaro.org,
        bleung@chromium.org, enric.balletbo@collabora.com,
        dianders@chromium.org, fabien.lahoudere@collabora.com
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Gwendal Grignou <gwendal@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 10/18] platform: chrome: sensorhub: Add code to spread timestmap
Date:   Fri, 15 Nov 2019 01:34:04 -0800
Message-Id: <20191115093412.144922-11-gwendal@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
In-Reply-To: <20191115093412.144922-1-gwendal@chromium.org>
References: <20191115093412.144922-1-gwendal@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

EC FIFO can send sensor events in batch. Spread them based on
previous (TSa) and currnet timestamp (TSb)

  EC FIFO                             iio events
+-----------+
| TSa       |
+-----------+             +---------------------------------------+
| event 1   |             | event 1 | TSb - (TSb - TSa)/n * (n-1) |
+-----------+             +---------------------------------------+
| event 2   |             | event 2 | TSb - (TSb - TSa)/n * (n-2) |
+-----------+             +---------------------------------------+
|  ...      |  ------>    |  ....   |                             |
+-----------+             +---------------------------------------+
| event n-1 |             | event 2 | TSb - (TSb - TSa)/n         |
+-----------+             +---------------------------------------+
| event n   |             | event 2 | TSb                         |
+-----------+             +---------------------------------------+
| TSb       |
+-----------+

Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
Changes in v5:
  Added ack.
Changes in v4:
- Check patch with --strict option
    Alignement
No changes in v3.
Changes in v2:
- Use CROS_EC_SENSOR_LAST_TS instead of LAST_TS to avoid name colisions.

 .../platform/chrome/cros_ec_sensorhub_ring.c  | 98 ++++++++++++++++++-
 1 file changed, 95 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 32333f67e26a..a0a778999f30 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -189,6 +189,96 @@ static bool cros_ec_ring_process_event(struct cros_ec_sensorhub *sensorhub,
 	return true;
 }
 
+/*
+ * cros_ec_ring_spread_add: Calculate proper timestamps then
+ * add to ringbuffer (legacy).
+ *
+ * If there is a sample with a proper timestamp
+ *                        timestamp | count
+ * older_unprocess_out --> TS1      | 1
+ *                         TS1      | 2
+ * out -->                 TS1      | 3
+ * next_out -->            TS2      |
+ * We spread time for the samples [older_unprocess_out .. out]
+ * between TS1 and TS2: [TS1+1/4, TS1+2/4, TS1+3/4, TS2].
+ *
+ * If we reach the end of the samples, we compare with the
+ * current timestamp:
+ *
+ * older_unprocess_out --> TS1      | 1
+ *                         TS1      | 2
+ * out -->                 TS1      | 3
+ * We know have [TS1+1/3, TS1+2/3, current timestamp]
+ */
+static void cros_ec_ring_spread_add(struct cros_ec_sensorhub *sensorhub,
+				unsigned long sensor_mask,
+				s64 current_timestamp,
+				struct cros_ec_sensors_ring_sample *last_out)
+{
+	struct cros_ec_sensors_ring_sample *out;
+	int i;
+
+	for_each_set_bit(i, &sensor_mask, BITS_PER_LONG) {
+		s64 older_timestamp;
+		s64 timestamp;
+		struct cros_ec_sensors_ring_sample *older_unprocess_out =
+			sensorhub->ring;
+		struct cros_ec_sensors_ring_sample *next_out;
+		int count = 1;
+
+		for (out = sensorhub->ring; out < last_out; out = next_out) {
+			s64 time_period;
+
+			next_out = out + 1;
+			if (out->sensor_id != i)
+				continue;
+
+			/* Timestamp to start with */
+			older_timestamp = out->timestamp;
+
+			/* find next sample */
+			while (next_out < last_out && next_out->sensor_id != i)
+				next_out++;
+
+			if (next_out >= last_out) {
+				timestamp = current_timestamp;
+			} else {
+				timestamp = next_out->timestamp;
+				if (timestamp == older_timestamp) {
+					count++;
+					continue;
+				}
+			}
+
+			/*
+			 * The next sample has a new timestamp,
+			 * spread the unprocessed samples.
+			 */
+			if (next_out < last_out)
+				count++;
+			time_period = div_s64(timestamp - older_timestamp,
+					      count);
+
+			for (; older_unprocess_out <= out;
+					older_unprocess_out++) {
+				if (older_unprocess_out->sensor_id != i)
+					continue;
+				older_timestamp += time_period;
+				older_unprocess_out->timestamp =
+					older_timestamp;
+			}
+			count = 1;
+			/* The next_out sample has a valid timestamp, skip. */
+			next_out++;
+			older_unprocess_out = next_out;
+		}
+	}
+
+	/* push the event into the kfifo */
+	for (out = sensorhub->ring; out < last_out; out++)
+		cros_sensorhub_send_sample(sensorhub, out);
+}
+
 /**
  * cros_ec_sensorhub_ring_handler() - the trigger handler function
  *
@@ -322,9 +412,11 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
 		}
 	}
 
-	/* push the event into the kfifo */
-	for (out = sensorhub->ring; out < last_out; out++)
-		cros_sensorhub_send_sample(sensorhub, out);
+	/*
+	 * Spread samples in case of batching, then add them to the ringbuffer.
+	 */
+	cros_ec_ring_spread_add(sensorhub, sensor_mask,
+			current_timestamp, last_out);
 
 ring_handler_end:
 	sensorhub->fifo_timestamp[CROS_EC_SENSOR_LAST_TS] = current_timestamp;
-- 
2.24.0.432.g9d3f5f5b63-goog

