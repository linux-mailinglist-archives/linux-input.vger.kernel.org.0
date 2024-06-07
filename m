Return-Path: <linux-input+bounces-4226-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36D900AF2
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0D528644D
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59ED219B595;
	Fri,  7 Jun 2024 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cJL4nH9A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7D19ADBF
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717779823; cv=none; b=pEYFb6ZPdTzKgAB5NvS+9my0vptyn/QEGkiesbEw9rPpMLeL6QR8rTLTC0511ePzuIcqrUZvEARBV7cI2nZp+7npHFLlGJUis0b5DbDgpYW4jFOQN5bWf6IXTjbkZ1GBImnpLE1WOiiVc8vDtxdu1WBBiEi9gkgE+IAElqfYQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717779823; c=relaxed/simple;
	bh=qQ216A7Cu3X95KjC96oChuTYwL6nPl5HT7+Ubx2VE4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxp0kZVRCYHB74b+DcpBnuNpL/IryttFTjMfxQYuL9GtmoW0DEhCJyVWyZyH/fogfokTUEvQ1njzjJ2atvV7jYHkMj7poaPghK5wJJggpqIHMM2Q5GbV0TmA0RcDEdzv35/+ps5OGnVlmO9/4yygrg4mL8jLXaxMi6jS7uMRF2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cJL4nH9A; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70109d34a16so2193264b3a.2
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717779820; x=1718384620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbUvxHBzQ3FTw0LHwYR3I6ZzDjqDjsM/1Nz1IUatQIk=;
        b=cJL4nH9ATXJHbAGi2noEZp+RLFlSQqz0I19DWcS4DyhXo1dgkB+WuHrYi+bX6Yf1yJ
         F8rMQbHShMwHh7AQgjs9fdCWb7+mJCDt6OiAtSCaM7Dd8XkUMB+CTJ04ObBl3AU5Cep2
         M/8wVYVrlVgWjx89KeoxvjHp4hW4r9YjxPoAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717779820; x=1718384620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbUvxHBzQ3FTw0LHwYR3I6ZzDjqDjsM/1Nz1IUatQIk=;
        b=bsbClWRBph/g5AZHrlThUeI4kTFSf2v2G1hqtu4F9bUPZVNRDlqo7Deg0j/IDLYwmI
         0OHNMDdWuC6t8naN1G5EbVcVua8yG+QRILd0ZJzZdl2GJ2xXbtWspzr1w+8rqEPQvlkI
         RfpBdWldtK9sZc6jfU4zRNcDojiwHVx6MeGAXxNvtdxrjJBwDUUvAO1ogov8bwTHpWem
         xnUJUNtTt9IM/GkeNYgRiTwWY/e6Y8hyikreZfT4YVlhKwbDcnO70UYid8VpS+8GS+Jb
         8SPJXaZChVLNaSCBPZLUEhz1XQIizh4DB3hJj9mVX6vq681VyIuRu85AxdrfgcbmhVYB
         NaTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwGywcOErQ4LrbOZ24Ln1yXmqIBaGxDtkL15oyNj/viI+m9S1WBbsH6nVdZpeqXp6Ncgj1ZETKxUKxSlFl+EIOAKOG9wlAy4eyKM4=
X-Gm-Message-State: AOJu0YwuqbaQoUSyB9/Zppf1Yk7iaqKevEC1U/NMEjwHUE63J2Wkiu/0
	484MXmo3orN3HmpIs2jIElIJLsIZiEZu4WtTwb5u5lVv5913JeWOrWiwzDlCYg==
X-Google-Smtp-Source: AGHT+IEdA5kp7t1XvWKS+zkWei2a8yjfOnxAKsHea0vAv89VwNFG4rUF5tJpBHRQuCe9qOTHVWsntw==
X-Received: by 2002:a05:6a20:d043:b0:1b4:4568:4c40 with SMTP id adf61e73a8af0-1b445684d58mr1419765637.12.1717779819908;
        Fri, 07 Jun 2024 10:03:39 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:98ef:4953:160:1c67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e439d12cf5sm970705a12.67.2024.06.07.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:03:39 -0700 (PDT)
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
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 2/3] platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
Date: Fri,  7 Jun 2024 10:02:57 -0700
Message-ID: <fc7575a55163bf3b4eb570a3f32524755c4195a0.1717779167.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <cover.1717779167.git.dnojiri@chromium.org>
References: <cover.1717779167.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upgrade EC_CMD_GET_NEXT_EVENT to version 3.

The max supported version will be v3. So, we speak v3 even if the EC
says it supports v4+.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 drivers/platform/chrome/cros_ec_proto.c     | 27 ++++++++++++++-------
 include/linux/platform_data/cros_ec_proto.h |  2 +-
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 945b1b15a04c..df257ab12968 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -686,7 +686,7 @@ EXPORT_SYMBOL(cros_ec_cmd_xfer_status);
 
 static int get_next_event_xfer(struct cros_ec_device *ec_dev,
 			       struct cros_ec_command *msg,
-			       struct ec_response_get_next_event_v1 *event,
+			       struct ec_response_get_next_event_v3 *event,
 			       int version, uint32_t size)
 {
 	int ret;
@@ -709,11 +709,12 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 {
 	struct {
 		struct cros_ec_command msg;
-		struct ec_response_get_next_event_v1 event;
+		struct ec_response_get_next_event_v3 event;
 	} __packed buf;
 	struct cros_ec_command *msg = &buf.msg;
-	struct ec_response_get_next_event_v1 *event = &buf.event;
-	const int cmd_version = ec_dev->mkbp_event_supported - 1;
+	struct ec_response_get_next_event_v3 *event = &buf.event;
+	int cmd_version = ec_dev->mkbp_event_supported - 1;
+	uint32_t size;
 
 	memset(msg, 0, sizeof(*msg));
 	if (ec_dev->suspended) {
@@ -721,12 +722,20 @@ static int get_next_event(struct cros_ec_device *ec_dev)
 		return -EHOSTDOWN;
 	}
 
-	if (cmd_version == 0)
-		return get_next_event_xfer(ec_dev, msg, event, 0,
-				  sizeof(struct ec_response_get_next_event));
+	if (cmd_version == 0) {
+		size = sizeof(struct ec_response_get_next_event);
+	} else if (cmd_version < 3) {
+		size = sizeof(struct ec_response_get_next_event_v1);
+	} else {
+		/*
+		 * The max version we support is v3. So, we speak v3 even if the
+		 * EC says it supports v4+.
+		 */
+		cmd_version = 3;
+		size = sizeof(struct ec_response_get_next_event_v3);
+	}
 
-	return get_next_event_xfer(ec_dev, msg, event, cmd_version,
-				sizeof(struct ec_response_get_next_event_v1));
+	return get_next_event_xfer(ec_dev, msg, event, cmd_version, size);
 }
 
 static int get_keyboard_state_event(struct cros_ec_device *ec_dev)
diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
index 8865e350c12a..dbfd38b3becd 100644
--- a/include/linux/platform_data/cros_ec_proto.h
+++ b/include/linux/platform_data/cros_ec_proto.h
@@ -185,7 +185,7 @@ struct cros_ec_device {
 	bool host_sleep_v1;
 	struct blocking_notifier_head event_notifier;
 
-	struct ec_response_get_next_event_v1 event_data;
+	struct ec_response_get_next_event_v3 event_data;
 	int event_size;
 	u32 host_event_wake_mask;
 	u32 last_resume_result;
-- 
2.45.2.505.gda0bf45e8d-goog


