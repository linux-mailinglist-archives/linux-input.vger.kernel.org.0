Return-Path: <linux-input+bounces-5837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0195E1F2
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6952822F7
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8B7B3F3;
	Sun, 25 Aug 2024 05:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOjz1+lQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141CA770FB;
	Sun, 25 Aug 2024 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563010; cv=none; b=kXajDoxjpIkfILyNYtg/oto36gBJoysD1q7WFMpBXjtIRcyocMHYy4LV2a89VgH2xdbvsEVB3cECnTNS0T5ewUZuy3tmMROW4ERpbOzPXxqz/yYFeWql6ZyVokufUOpKjhmkmYVlu6P3B5wpwPQiTX8tAQyX5FpLjbuzBP8hKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563010; c=relaxed/simple;
	bh=HRlUPdt8MUpsxTDaTLTMeZFznZxtpdiNcTlI0W/hXq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJPA4w022Tsi7nuHSQWhp7KvamV4W15kzw2Dq7AAb3FTnS2OcEARfceNJnizfWsr5jxYOR5nvqmGlR5CRYJKshDWDZbmGuEsIzE5sNCpI3GaeScfHcv2D5zJGpynjF9oGu4mKsXqCP/YBYMaq9FTOTeQ6iC35hVgYcYkaUKNqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOjz1+lQ; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-709339c91f9so2653229a34.0;
        Sat, 24 Aug 2024 22:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563008; x=1725167808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eSvY1Wrp9wBfC4UTCsKK6UuziOLVmjJl+zbNYuZ+vM=;
        b=EOjz1+lQdqv2OeXLfxmb02AfprzBKOXK5joa8+5+Nr0s+N7UTZA15UdPqWEmEZy+9Q
         1rKb/kVRu8iRy7no3d8D0iCZAXXu/f1zcoAyhGsgGrMVhPQUYUhGR162ya6FnrRy14us
         rpnBgSUqS32hfsCt2Bc3+cbc2QoVv+YPNPBshe7a3o7G+jNiw7R/PTqpsVPrXbcKlS04
         Q9hkExDmpuI7FkkcMpr2zYWZ/NDJ+LCLY1JJahgrs+jewuUS7a++N9JpNXoEM6NXM8+c
         HrHn5ss/4eh5zvda+4Jiqm16gor0wU9JcvdNSteQPlXOCqZD4rPLj+BsFbYwr+o310dD
         1fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563008; x=1725167808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eSvY1Wrp9wBfC4UTCsKK6UuziOLVmjJl+zbNYuZ+vM=;
        b=ZccFw4LINflbfnhu6j6dC/AAOn/v3g7m8LmJHX2MYvnk/H+UDk5DdHE1vSZeBqkF58
         rj7JV8Ku6qXms0kEId4EuRZd3vPSP/rg5kxKBnHoHM+mx0ZxlZw6htE2cNdXI+/BKlR8
         wr87E4zfyFAOQ0hOe+0obwl8/FKOpU/Qdved1NvDn8qNlWhKb5tACSo3YQ7zZbikNr1c
         7u8dDUnMKYUQ7ynSXaMsfHShkUSwbIt4V1KvKs/uWZZlfMN7xFuecPuAJ6T9DFOtS1vI
         888gOAoCdunxhZTlZo5luZVCpxtj/6xYsMt12DNoLH5TjTqn0Ta0i86xpFq4yAhjXUWO
         vOmA==
X-Forwarded-Encrypted: i=1; AJvYcCUdnMT7tcTl8bpQmAzTk2orNnRYtJeNrpXumgocXl5fh6AZZH7Jkglg0Zz1i4JhztKYDj/uKC9RFswIsEo=@vger.kernel.org, AJvYcCW/PBKX2AmCTjU5zcO4ph4OEMWXoFrSy98Gf/bKNQPxh5DhmFhNLECm6e7zFkyBiUPZWZ+7YZuOH6q1Gek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQ3NZpeF/jQIEOy/JHlv9+CYH8Db2eG/Qkpp9/+W/EYZLzWhX
	wMo9hlwlJ10VwzFnIMpufR+R5LX791T8NysEPOdvW5bM3ihGry70nKL0MQ==
X-Google-Smtp-Source: AGHT+IFPvL2EwU0HTmfQ3cZEpHTEWkZdGY6KDfx96n7lf7JVGqj+9oNVagIFdpcxgTMQQpdCDsaEdQ==
X-Received: by 2002:a05:6808:302a:b0:3d9:2aa5:4077 with SMTP id 5614622812f47-3de2a8735e4mr7831127b6e.5.1724563007948;
        Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 07/17] Input: ipaq-micro-keys - use guard notation when acquiring mutex and spinlock
Date: Sat, 24 Aug 2024 22:16:11 -0700
Message-ID: <20240825051627.2848495-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ipaq-micro-keys.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/ipaq-micro-keys.c b/drivers/input/keyboard/ipaq-micro-keys.c
index 1d71dd79ffd2..58631bf7ce55 100644
--- a/drivers/input/keyboard/ipaq-micro-keys.c
+++ b/drivers/input/keyboard/ipaq-micro-keys.c
@@ -54,18 +54,18 @@ static void micro_key_receive(void *data, int len, unsigned char *msg)
 
 static void micro_key_start(struct ipaq_micro_keys *keys)
 {
-	spin_lock(&keys->micro->lock);
+	guard(spinlock)(&keys->micro->lock);
+
 	keys->micro->key = micro_key_receive;
 	keys->micro->key_data = keys;
-	spin_unlock(&keys->micro->lock);
 }
 
 static void micro_key_stop(struct ipaq_micro_keys *keys)
 {
-	spin_lock(&keys->micro->lock);
+	guard(spinlock)(&keys->micro->lock);
+
 	keys->micro->key = NULL;
 	keys->micro->key_data = NULL;
-	spin_unlock(&keys->micro->lock);
 }
 
 static int micro_key_open(struct input_dev *input)
@@ -141,13 +141,11 @@ static int micro_key_resume(struct device *dev)
 	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
 	struct input_dev *input = keys->input;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input))
 		micro_key_start(keys);
 
-	mutex_unlock(&input->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog


