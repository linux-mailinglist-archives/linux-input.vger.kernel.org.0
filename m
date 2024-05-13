Return-Path: <linux-input+bounces-3693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ABC8C40CA
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 14:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59F91B21F14
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4CD50279;
	Mon, 13 May 2024 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEZJY/jg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDCA3F;
	Mon, 13 May 2024 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603714; cv=none; b=FQoRBcEsXP29jj0vhHvgsaZyJa7dm7lJmANaHs5ABdez3QZrqi+yEwNl6O0oWPIcd2OnnohTDYYMMI7r9QbOeztxmLPj88EtrG27LUyZpZVUKim+DrTQC7IqmmHjy3WrCuriz3TvXpLkN55otnazlIUWcN94aSktPUQ3GoNDvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603714; c=relaxed/simple;
	bh=cjeQKrVkv+Zhp90jWWZ5I7C4LSmzBH0xZnYwJOUJQGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aq3qlLfwhV5eyhQDNK3ge3TNlJ6HcOvoXUTaswzTMlZ0eFv2iXgKhvJhKrInYd8S8yXfojN/DBzi4kSA8ZnvrDg736Z8N+BUl09h0q8cIFCz2Xp/MHxw5PqSMpU7zsmzT/6HniTf6Ba5vDS2h3R5Wc+mMurdKQAGM3vzbr/6JUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEZJY/jg; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ee0132a6f3so30114395ad.0;
        Mon, 13 May 2024 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715603713; x=1716208513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2awmImDoe4T4DYFZtkqeuwzm3pCI0HjrYFzG4AoZIc=;
        b=WEZJY/jgCKHEyaD/ARnyi4eYfdx7XA23xx2Mm57IhCBRh4ohJ8iae5Celr9d1IzfnD
         gmITs1ESDZNopPwkF9rvZ0iuNhNYl9IVWFy7qn8g3gvAGJCzhXWgj0To6oynXG5AITUy
         ykhmNlJqy7PQqX4G0HEZJ00ewerHfjqHqGnL7qW28yQBLBeUb02aWu68nS+s2WPJiLeI
         XOF+U2NpKL+u3uG4JfEA6CTk04b6A5DnGx9twNSV28h0zsSud1w9FIY2nCd/rIwO7DAu
         CUXPj2jOvaxfYka2nhsverRbjLtokcRCRreS27mkZFoPG+FT5Myjc0j96o5NUWCwq+B/
         eKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715603713; x=1716208513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2awmImDoe4T4DYFZtkqeuwzm3pCI0HjrYFzG4AoZIc=;
        b=g9en0hf6c/M2TVc2OG/8ccKeNAJbtSytpa6HvbIA3WwzOKoHLua2Dw1N48obOu+pq1
         oUbofvq37aiuryk+DIU08Q+AYBPjr9LDP1RqkdtktuCgnUgxs+AL1Da5McYC1aWXSVEr
         Ol1U1N6g4zKkmiqPRcmGtoByJf3q8apGpt09iAYoPHDhB6361xevfltYZdH9ys225+pe
         nrVo9VE7csap1CYkWBoi0Oy7MPyq8npRTSFeI4nlj6sGzMAKSSIsVmmN6RYjCImIXs3J
         EMIlZnzw5VDPouUHtDJXjyfbMSUCotesohE3mYD4GdwYnE3dNVd6oNHJeaB3hoc2aBy3
         rhbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkKaN6Z1YhW1oWD8ISRBLXOXgOJfSjqwZyJ6qppmiFEH9OeaZMIk53chOTQLL3D87/Yx393Ui+SZr7jGKlKqlBILoAd7N67wH0HprHm3JP19+7ZDZfZje6hsVm4+n8qcLlfCbXN9pN3IQ=
X-Gm-Message-State: AOJu0YyAoGCVZ7+JkZrKIPK99W4J6/aemPvh3YemvknmCwoCe6clmVfZ
	U3RwUBzVn+bS9UIQa/ToCaYGwBFqqSwBWKP13k1QxBzfamI5aSJi
X-Google-Smtp-Source: AGHT+IFp/9otqbRAdO3cQELTRe/Gb082fLF3vKJ9nFD4SguBI3xd1gQ1iOB8C1RTIyDy6TmdRBl7eg==
X-Received: by 2002:a17:902:7c03:b0:1e6:6bba:7c70 with SMTP id d9443c01a7336-1ef43e233b3mr80264375ad.36.1715603712374;
        Mon, 13 May 2024 05:35:12 -0700 (PDT)
Received: from mb-board.. ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d3565sm77921685ad.30.2024.05.13.05.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:35:11 -0700 (PDT)
From: Charles Wang <charles.goodix@gmail.com>
To: hadess@hadess.net,
	hdegoede@redhat.com,
	dmitry.torokhov@gmail.com,
	neil.armstrong@linaro.org
Cc: hughsient@gmail.com,
	broonie@kernel.org,
	jeff@labundy.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	charles.goodix@gmail.com
Subject: [PATCH v2] Input: goodix-berlin - Add sysfs interface for reading and writing touch IC registers
Date: Mon, 13 May 2024 20:33:37 +0800
Message-ID: <20240513123444.11617-1-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export a sysfs interface that would allow reading and writing touchscreen
IC registers. With this interface many things can be done in usersapce
such as firmware updates. An example tool that utilizes this interface
for performing firmware updates can be found at [1].

[1] https://github.com/goodix/fwupdate_for_berlin_linux

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
Changes in v2:
- use dev_groups to manager device attributes.
- use dev_get_regmap to make show/store functions generic.
- v1: https://lore.kernel.org/all/20240506114752.47204-1-charles.goodix@gmail.com/
---
 drivers/input/touchscreen/goodix_berlin.h     |  1 +
 .../input/touchscreen/goodix_berlin_core.c    | 42 +++++++++++++++++++
 drivers/input/touchscreen/goodix_berlin_i2c.c |  1 +
 drivers/input/touchscreen/goodix_berlin_spi.c |  1 +
 4 files changed, 45 insertions(+)

diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
index 1fd77eb69..38b6f9ddb 100644
--- a/drivers/input/touchscreen/goodix_berlin.h
+++ b/drivers/input/touchscreen/goodix_berlin.h
@@ -20,5 +20,6 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap);
 
 extern const struct dev_pm_ops goodix_berlin_pm_ops;
+extern const struct attribute_group *goodix_berlin_groups[];
 
 #endif
diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index e7b41a926..e90fccfc4 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -672,6 +672,48 @@ static void goodix_berlin_power_off_act(void *data)
 	goodix_berlin_power_off(cd);
 }
 
+static ssize_t registers_read(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct regmap *regmap;
+	int error;
+
+	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
+	error = regmap_raw_read(regmap, (unsigned int)off,
+				buf, count);
+
+	return error ? error : count;
+}
+
+static ssize_t registers_write(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t count)
+{
+	struct regmap *regmap;
+	int error;
+
+	regmap = dev_get_regmap(kobj_to_dev(kobj), NULL);
+	error = regmap_raw_write(regmap, (unsigned int)off,
+				 buf, count);
+
+	return error ? error : count;
+}
+
+BIN_ATTR_RW(registers, 0);
+
+static struct bin_attribute *goodix_berlin_bin_attrs[] = {
+	&bin_attr_registers,
+	NULL,
+};
+
+static const struct attribute_group goodix_berlin_attr_group = {
+	.bin_attrs = goodix_berlin_bin_attrs,
+};
+
+const struct attribute_group *goodix_berlin_groups[] = {
+	&goodix_berlin_attr_group,
+	NULL,
+};
+
 int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
 			struct regmap *regmap)
 {
diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
index 6ed9aa808..b5f48315c 100644
--- a/drivers/input/touchscreen/goodix_berlin_i2c.c
+++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
@@ -64,6 +64,7 @@ static struct i2c_driver goodix_berlin_i2c_driver = {
 		.name = "goodix-berlin-i2c",
 		.of_match_table = goodix_berlin_i2c_of_match,
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+		.dev_groups = goodix_berlin_groups,
 	},
 	.probe = goodix_berlin_i2c_probe,
 	.id_table = goodix_berlin_i2c_id,
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index 4cc557da0..fe5739097 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -167,6 +167,7 @@ static struct spi_driver goodix_berlin_spi_driver = {
 		.name = "goodix-berlin-spi",
 		.of_match_table = goodix_berlin_spi_of_match,
 		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+		.dev_groups = goodix_berlin_groups,
 	},
 	.probe = goodix_berlin_spi_probe,
 	.id_table = goodix_berlin_spi_ids,
-- 
2.43.0


