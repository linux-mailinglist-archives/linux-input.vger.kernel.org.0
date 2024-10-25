Return-Path: <linux-input+bounces-7708-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F0A9B12E8
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2024 00:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDC21F23617
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 22:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FDA21312B;
	Fri, 25 Oct 2024 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACW+GFeq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D842213121;
	Fri, 25 Oct 2024 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895931; cv=none; b=Dml2UxV/pqA9GQDkfD561awgzEeEu9B4A8xUG6znonOximfaEEftooOzjIJaWCFsvTED87D72IAMVpkBc+Nlwmsk3JuY+D0+97VICIPGg98UHGZfal8XLHR0jj6Unm1ej/xP+DjQYRqwXoqYABlSN1COaNI4116urt41C5mYXwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895931; c=relaxed/simple;
	bh=+VzCTeiXyFsTl6w9pt0ZC2YOO3LE0GgGj2QtoCkSeV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m62DtYujH9YRLFhpukxcdcwl3LiH1SVmJiNeyKM4zwYYzDQbUdOedPMvReO2aUs00lWumi0PCPi3eoxmJbA9eXKMyzNstNPogsbhHt3V2ZocRUc3LgE6VSxo4D5JClPz27TCFUdVByu5vZAQHhHxRPXOp4TEwgPLQrC21cra3OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACW+GFeq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cdbe608b3so20346385ad.1;
        Fri, 25 Oct 2024 15:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729895928; x=1730500728; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NULZcaj8cQO9ZbMWMTzwSb1Lf67gGwzP4dkkLG3k3yI=;
        b=ACW+GFeqo14aRZ6EeERbjV6dcxF7VIDRrI/wpy/4jGc8Z2XhPYAjwXr8RFt1eTEFIW
         2/ofXGcd9MkLCABVf81tVGnshMwyDcjHAc39BjLv5y1tvj4w6pAYhgxMQ+GN8eW8dekY
         JlUGXA5D9BR13G0MLlEqSBae1Mts+ndDjxxYyppZc45mSg3aENOWqS8wr8fqfbC/00hR
         hL8Vaos5rXYJERjmSOapWeNieKMeTcGe6AbJpiVwwOsly/sXEbeKC1h3YEW5NLqHqLeb
         D9fc8MLJAcGaiY6ZC7W/OMI9qzsu2Y8kJg69f4L2l0BTKT/G88QT8NuAh8D9kMZLeg0R
         YLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729895928; x=1730500728;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NULZcaj8cQO9ZbMWMTzwSb1Lf67gGwzP4dkkLG3k3yI=;
        b=N2+0NjbSaEWupf1/HuNQ39+Em0j4ULTswxug2L2JOGs17juPR8PlsP7/hMwuYY+2Kj
         7zSNkmoMF+MPZEtozo0OsEZiHHdOU1mCqDbZVOw+7pCE1NXeQDH4/qj2VRZJqkwPY5Ag
         K9D2rlcIyrPm6yiPwkYF7L2i3zsGZKHb9oQdNJNXk0AMv6w+KPR3oqXD82yHvyewTnJc
         XF8WSJqKJublMLedt5lMBZ22tD/7FqAKWDD/2+JRGEPMFOXFaR8ImJgOXqmeSUw9OpGZ
         3YoKyHo/tA14BraMgU7UEi1UH+4FHOIB7/pEIZzcm5lRtLOfV9YADks7ED4nXl8ubjgw
         6XZA==
X-Gm-Message-State: AOJu0YytFTJPmjQsfu6Uy5SSd5SRwsY8Ve3t2WgwWsGG6AveGDbP2h1/
	skmIb0vVLg0fC3ksB7GVgNl8L+JK+evSp7DD/65Lb432ytZ86Ak4c4uvig==
X-Google-Smtp-Source: AGHT+IGOA7AvNQjZoH2zG9m/YtTfEUg+SeJnDJt337aQ82yBU9ApyruYvGyyQ3FIs6vKZhSPDBWpqA==
X-Received: by 2002:a17:903:32c4:b0:20c:b0c7:92c9 with SMTP id d9443c01a7336-210c6c1e37dmr9076655ad.34.1729895928257;
        Fri, 25 Oct 2024 15:38:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1691:2dbd:7c00:4e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf43324sm14176545ad.33.2024.10.25.15.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 15:38:47 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:38:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH] Input: synaptics-rmi4 - switch to using cleanup functions in
 F34
Message-ID: <Zxwd9c0njasZZoal@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Start using __free() and guard() primitives to simplify the code
and error handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/rmi4/rmi_f34.c | 37 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
index 3b3ac71e53dc..7a05ac00dce2 100644
--- a/drivers/input/rmi4/rmi_f34.c
+++ b/drivers/input/rmi4/rmi_f34.c
@@ -246,7 +246,6 @@ static int rmi_f34_update_firmware(struct f34_data *f34,
 				(const struct rmi_f34_firmware *)fw->data;
 	u32 image_size = le32_to_cpu(syn_fw->image_size);
 	u32 config_size = le32_to_cpu(syn_fw->config_size);
-	int ret;
 
 	BUILD_BUG_ON(offsetof(struct rmi_f34_firmware, data) !=
 			F34_FW_IMAGE_OFFSET);
@@ -267,8 +266,7 @@ static int rmi_f34_update_firmware(struct f34_data *f34,
 		dev_err(&f34->fn->dev,
 			"Bad firmware image: fw size %d, expected %d\n",
 			image_size, f34->v5.fw_blocks * f34->v5.block_size);
-		ret = -EILSEQ;
-		goto out;
+		return -EILSEQ;
 	}
 
 	if (config_size &&
@@ -277,25 +275,18 @@ static int rmi_f34_update_firmware(struct f34_data *f34,
 			"Bad firmware image: config size %d, expected %d\n",
 			config_size,
 			f34->v5.config_blocks * f34->v5.block_size);
-		ret = -EILSEQ;
-		goto out;
+		return -EILSEQ;
 	}
 
 	if (image_size && !config_size) {
 		dev_err(&f34->fn->dev, "Bad firmware image: no config data\n");
-		ret = -EILSEQ;
-		goto out;
+		return -EILSEQ;
 	}
 
 	dev_info(&f34->fn->dev, "Firmware image OK\n");
-	mutex_lock(&f34->v5.flash_mutex);
-
-	ret = rmi_f34_flash_firmware(f34, syn_fw);
 
-	mutex_unlock(&f34->v5.flash_mutex);
-
-out:
-	return ret;
+	guard(mutex)(&f34->v5.flash_mutex);
+	return rmi_f34_flash_firmware(f34, syn_fw);
 }
 
 static int rmi_f34_status(struct rmi_function *fn)
@@ -461,9 +452,8 @@ static ssize_t rmi_driver_update_fw_store(struct device *dev,
 {
 	struct rmi_driver_data *data = dev_get_drvdata(dev);
 	char fw_name[NAME_MAX];
-	const struct firmware *fw;
 	size_t copy_count = count;
-	int ret;
+	int error;
 
 	if (count == 0 || count >= NAME_MAX)
 		return -EINVAL;
@@ -474,17 +464,18 @@ static ssize_t rmi_driver_update_fw_store(struct device *dev,
 	memcpy(fw_name, buf, copy_count);
 	fw_name[copy_count] = '\0';
 
-	ret = request_firmware(&fw, fw_name, dev);
-	if (ret)
-		return ret;
+	const struct firmware *fw __free(firmware) = NULL;
+	error = request_firmware(&fw, fw_name, dev);
+	if (error)
+		return error;
 
 	dev_info(dev, "Flashing %s\n", fw_name);
 
-	ret = rmi_firmware_update(data, fw);
-
-	release_firmware(fw);
+	error = rmi_firmware_update(data, fw);
+	if (error)
+		return error;
 
-	return ret ?: count;
+	return count;
 }
 
 static DEVICE_ATTR(update_fw, 0200, NULL, rmi_driver_update_fw_store);
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

