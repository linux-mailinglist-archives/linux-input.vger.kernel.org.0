Return-Path: <linux-input+bounces-4685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9191B2FD
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 01:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 013512817D1
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 23:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846D71A38CE;
	Thu, 27 Jun 2024 23:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Si5Lb3Xh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619091A2FCF
	for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 23:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532439; cv=none; b=EdNKrmd41J6snsMCP+QZF2HAVSEEw3ZV3q+ed5TcUIGWq52i6jc+2nwlQx2f2QLrerbvvSnhwyd1JrPSupN7NQtwy0ohY2lmy4wdofP1wFxpuF8zm4J4z/t9eMFTX2XlVM16UYqtu9JH5lti2SuT45p88wklINgt8xdtkSVHvVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532439; c=relaxed/simple;
	bh=+MkSknPEAqqjUaY5k5jJEdYG6RDoEon+9UKGF9CYlpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1vy2onduncrF7H1ZbZ56PA8KqUW0GJukcDzcudMrSptiQ217A4f9hQ5IKo6iwyMfuTA0mRaWvuF3S5Kq98rwOQfTsdx1KwaDzT4LwMqy/uXH3r/bn460UT5Yw/dTDHiKZqG6Jh9GKqnHdhrkcw41uI0IV/Fu+wsh8LT39Qc7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Si5Lb3Xh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fa55dbf2e7so8925ad.2
        for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 16:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719532436; x=1720137236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0t3zZaJBUN3PLJmCz77S8k31xe8bvzplrXd7ftlq5c=;
        b=Si5Lb3Xhw8a7r7hLUWRbn46sLQxLGrm2uQ/S7I6on3j3h3ExhulvsayL4ax1uh7O7C
         3Y8OuNocH0X3P4/M6tFgMiHKS/qhvB52XA8RdG8n0GJJ7b6htzjs7qj1KWP1t/pGg0wo
         KNNx/nA0wW0lXGS9XwfuM0fmdL4eRkLtJbn74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532436; x=1720137236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0t3zZaJBUN3PLJmCz77S8k31xe8bvzplrXd7ftlq5c=;
        b=fFL+eg5fYnZctNw2aJkT5lIEU21fum+/fXqk2+ei/FdB8JT/rgHuB/gA/YAqx7lD6K
         7sFb5i0IFMXoU3lQe1JvKaobwVV4HIiWsZczPUmZ8DAsJ6WXg0XSm52em3vIsIQ4LPo9
         p99o13O9/ul0QW2rbuvKKMH3N7fZjwm4F6pvo1iTMA4sV5GY71ExjIPvWppeB0NpMmT8
         tf9grtG6VZ7KJdgfjhq6aaEgZtiNwT27kiccNFvjTmB7thk19O9gCOYHuud3NW6xRmLd
         yn4+BJRDZUTOtnNyRr72INtcEB85Bco+frrqd+shz57MPhOYjVjeUBg0SLoDVZSMg63i
         HNjA==
X-Forwarded-Encrypted: i=1; AJvYcCVcRx0wbRAoPDKuN9qlq2u6IWtzLr0Mszm4lMj/bcQtt70cNSTrK8OvmixRxzqBK5HnkeoO1tbW9BKRvEYQlu5HutmvjP8Qu8HDnNo=
X-Gm-Message-State: AOJu0Yxf/X0y2R6mkHgFK0DwSHl1Jr0NpbLylNYgBBfp7wVTYzwsbjFQ
	vneY7dduIbzwc5PjJvXkD3aXT9euKbnhJ6QrQ4HuXDyI7v/Fac2NntIi61gMoA==
X-Google-Smtp-Source: AGHT+IF2Pj7LKt2106lccDErPzwWRz3ComfRGxrxTvIekxCIfDZ26W10wiBXzjP5JceH/T+LG9fZDg==
X-Received: by 2002:a17:902:a385:b0:1fa:9149:6b17 with SMTP id d9443c01a7336-1fa9149796dmr37858365ad.68.1719532435693;
        Thu, 27 Jun 2024 16:53:55 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:cf5d:cb26:248e:ee00])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8cd2sm3366595ad.107.2024.06.27.16.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:53:55 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 1/2] cros_ec_proto: Consolidate ec_response_get_next_event
Date: Thu, 27 Jun 2024 16:53:07 -0700
Message-ID: <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <cover.1719531519.git.dnojiri@chromium.org>
References: <cover.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate struct ec_response_get_next_event_v*.

Let X->Y indicate kernel X sending EC_CMD_GET_NEXT_EVENT to FW Y.

Old->New:
   Existing kernels send a smaller container (e.g.
   ec_response_get_next_data) which may or may not fit the last few
   bytes. The FW copies as many bytes as possible to the container. The
   kernel processes as many leading bytes as it can understand.

New->Old:
   New kernels send a bigger container. Existing FW copies as many bytes
   as it wants, leaving the last few bytes empty. The kernel knows it
   didn't receive full size data from the returned data length.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 drivers/platform/chrome/cros_ec_proto.c       | 16 ++++-----
 .../linux/platform_data/cros_ec_commands.h    | 34 +------------------
 include/linux/platform_data/cros_ec_proto.h   |  2 +-
 3 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 945b1b15a04c..a849c29f125b 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer_status);
 
 static int get_next_event_xfer(struct cros_ec_device *ec_dev,
 			       struct cros_ec_command *msg,
-			       struct ec_response_get_next_event_v1 *event,
+			       struct ec_response_get_next_event *event,
 			       int version, uint32_t size)
 {
 	int ret;
@@ -709,11 +709,11 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 {
 	struct {
 		struct cros_ec_command msg;
-		struct ec_response_get_next_event_v1 event;
+		struct ec_response_get_next_event event;
 	} __packed buf;
 	struct cros_ec_command *msg = &buf.msg;
-	struct ec_response_get_next_event_v1 *event = &buf.event;
-	const int cmd_version = ec_dev->mkbp_event_supported - 1;
+	struct ec_response_get_next_event *event = &buf.event;
+	int cmd_version = ec_dev->mkbp_event_supported - 1;
 
 	memset(msg, 0, sizeof(*msg));
 	if (ec_dev->suspended) {
@@ -721,12 +721,12 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 		return -EHOSTDOWN;
 	}
 
-	if (cmd_version == 0)
-		return get_next_event_xfer(ec_dev, msg, event, 0,
-				  sizeof(struct ec_response_get_next_event));
+	/* The max version we support is v3 */
+	if (cmd_version > 3)
+		cmd_version = 3;
 
 	return get_next_event_xfer(ec_dev, msg, event, cmd_version,
-				sizeof(struct ec_response_get_next_event_v1));
+				   sizeof(*event));
 }
 
 static int get_keyboard_state_event(struct cros_ec_device *ec_dev)
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 070e49c5381e..00c06c130dd5 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3475,32 +3475,7 @@ enum ec_mkbp_event {
 BUILD_ASSERT(EC_MKBP_EVENT_COUNT <= EC_MKBP_EVENT_TYPE_MASK);
 
 union __ec_align_offset1 ec_response_get_next_data {
-	uint8_t key_matrix[13];
-
-	/* Unaligned */
-	uint32_t host_event;
-	uint64_t host_event64;
-
-	struct __ec_todo_unpacked {
-		/* For aligning the fifo_info */
-		uint8_t reserved[3];
-		struct ec_response_motion_sense_fifo_info info;
-	} sensor_fifo;
-
-	uint32_t buttons;
-
-	uint32_t switches;
-
-	uint32_t fp_events;
-
-	uint32_t sysrq;
-
-	/* CEC events from enum mkbp_cec_event */
-	uint32_t cec_events;
-};
-
-union __ec_align_offset1 ec_response_get_next_data_v1 {
-	uint8_t key_matrix[16];
+	uint8_t key_matrix[18];
 
 	/* Unaligned */
 	uint32_t host_event;
@@ -3525,7 +3500,6 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
 
 	uint8_t cec_message[16];
 };
-BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
 
 struct ec_response_get_next_event {
 	uint8_t event_type;
@@ -3533,12 +3507,6 @@ struct ec_response_get_next_event {
 	union ec_response_get_next_data data;
 } __ec_align1;
 
-struct ec_response_get_next_event_v1 {
-	uint8_t event_type;
-	/* Followed by event data if any */
-	union ec_response_get_next_data_v1 data;
-} __ec_align1;
-
 /* Bit indices for buttons and switches.*/
 /* Buttons */
 #define EC_MKBP_POWER_BUTTON	0
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 8865e350c12a..a795fe260a38 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -185,7 +185,7 @@ struct cros_ec_device {
 	bool host_sleep_v1;
 	struct blocking_notifier_head event_notifier;
 
-	struct ec_response_get_next_event_v1 event_data;
+	struct ec_response_get_next_event event_data;
 	int event_size;
 	u32 host_event_wake_mask;
 	u32 last_resume_result;
-- 
2.45.2.803.g4e1b14247a-goog


