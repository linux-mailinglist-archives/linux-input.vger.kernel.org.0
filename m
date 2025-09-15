Return-Path: <linux-input+bounces-14748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91706B585E8
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 22:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512E33B45C2
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 20:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC3A28DB76;
	Mon, 15 Sep 2025 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iCkFRapy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB527B356
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 20:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757967488; cv=none; b=OWzyQYn33HCJNnSPvcf7fRjIh3HPlbwkYO1MJql+mmcOXoq5NagEaVnKLugxalxQnhWnjmIx0dKMPVcQh4xDbHLHrfjEadvq78h88nzzI6h10NVLgdULt6vFynV4V08G+JSH8kVqtFkY89IUU1gijrPPilA2Vj7lM4+QZuk68EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757967488; c=relaxed/simple;
	bh=YXaaX3mBSOFz58cOFHytlBQDl2+gkOkHQg6V+LkPG0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chNzVZhu5RI49jYPXRsPlV8p1gXqB2sWBMBgKGQDoww34fxYAjejLnAbHBK8cDnw3tlk4xQ2KawaPkWuKrYBoQ7cegjg2B44b/i78mjmF0d0Nrrc7C4O8A9vXdw/sTOmuyTWbPlmym6ogMtQEVZeXwhWD+1IHsqrfrfmVf4LAnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iCkFRapy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b9814efbcso36273305e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757967484; x=1758572284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnyiKj9WXXr1bimeuPTNBfAohINHJ8FArmWULmp0E20=;
        b=iCkFRapy2GSOjfgYqfvVENJ0EZArICNGsREIL27ftogNW94N5Ams/SsDNmh6zGamXW
         CM26MF9T7x3XjSp8EeD7WdZcaWRnpVOhs8waXIrTNlBTzZQcFvvzkO5T2eVYwz00awMn
         DvaxZ80DwUG6Np4z7Lw6DxH2I0dwcX5sduDxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757967484; x=1758572284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnyiKj9WXXr1bimeuPTNBfAohINHJ8FArmWULmp0E20=;
        b=dmeZq4ZU64TFG/YEwZoh2dhLZVGw5p71N/8EtZV1ij360mnVFCGVs9ex1LSs4kRcmX
         LS9oFAcXJNz2jvqqZiaLOvI+RtH4z7H5/EYykmRpnafO/d1dxTAa/eehYF/NhsWe8bBe
         sR41EHws0eV4M6cshKfujs3dOGQLlzvTnQ7N6HA0Kyt1vZR8myExAl6CFmbcGqvzsRq9
         4kFiFxLpO0B2rluqRWe94mcgy8u85Us/Pr7H6UfbQlqmqtb7kVtUjnCmhdIlk68AISqj
         dlRkuif2d1ngVwIOjEcy08Fl7aCkDOn5SNvh5WffufEVKdKqAl29BJdG9BF3M/YS+XXd
         7NqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIV5fLGUIJ4fQb6bd2ey2QHDtgGrq7t13pmkeJg9Dy4lym0QXwBT1UXGD5Mtt4n9AY1lNzvhjB1nDrjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLC3qhO2dvGUvFELZXLM+0YhuC2jHcfTzgzrxsJ6vOdf8gYvmF
	UAsuAOUXYJB3woAm/D4Z81s8KSr/HR84HT6gq9yhH6IkBNupZ/Zv0WiyYfduzw+LuG0=
X-Gm-Gg: ASbGncuul19x+ndrVVxMIeTPJuH1k0EfYFV+Vi1vnR+xis40pgHidnLjIRZPZkNGL8L
	jI0wI6tEvxlMDQEUwSv8rTc//M8OfJG81QSykQAbxA32P8HCgJW1Te1cBEHK2qxpZ0P40E9pmTY
	6p2URFh68kQ/eOpxe5k6KHFTk1z2R95XCHGZYPrN9F/7uUxDaziIlS/Wuhv7nOCDC8oPY9abyF2
	34xmgxWj15lRLkHEwzHZlAjJ4b4z1KN5cP3ZsYq9vWM/J5UOIvJd4OLdeTzmspHVXTPA2f+AUUG
	Ekyd3t06MJLg5eulCGQV10E/uqaiim1FMEGFKFRdCq6ibo/EBo/qn9zHR8tBn2Cl/kABqrO7JSC
	yZ2DhUWqD/72oXQFXVkQ35FHr1P8EsHPH6UZGC2fQyPMSbrOiIRWvj7a+PNilDVg=
X-Google-Smtp-Source: AGHT+IGgz5/4PpeM2ZEskqCLV1CUsr/izY7yyFiGM+CZhKSCuokZSQ4DbBnIzkYpZQMuQl8ogknAVQ==
X-Received: by 2002:a05:6000:2887:b0:3ec:1b42:1fa4 with SMTP id ffacd0b85a97d-3ec1b422126mr1277877f8f.14.1757967484587;
        Mon, 15 Sep 2025 13:18:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d369ea3bsm13724160f8f.0.2025.09.15.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 13:18:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 2/2] Input: edt-ft5x06 - rename sysfs attribute report_rate to report_rate_hz
Date: Mon, 15 Sep 2025 22:16:32 +0200
Message-ID: <20250915201748.1712822-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915201748.1712822-1-dario.binacchi@amarulasolutions.com>
References: <20250915201748.1712822-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attribute has been renamed to report_rate_hz to match the
report-rate-hz property from device tree, making it clear that the same
parameter can be set via sysfs or device tree and behaves identically.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/input/touchscreen/edt-ft5x06.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d7a269a0528f..c23cf3817664 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -543,8 +543,8 @@ static int edt_ft5x06_report_rate_get(struct edt_ft5x06_ts_data *tsdata)
 	return 0;
 }
 
-static ssize_t report_rate_show(struct device *dev,
-				struct device_attribute *dattr, char *buf)
+static ssize_t report_rate_hz_show(struct device *dev,
+				   struct device_attribute *dattr, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
@@ -597,9 +597,9 @@ static int edt_ft5x06_report_rate_set(struct edt_ft5x06_ts_data *tsdata,
 			    val);
 }
 
-static ssize_t report_rate_store(struct device *dev,
-				 struct device_attribute *dattr,
-				 const char *buf, size_t count)
+static ssize_t report_rate_hz_store(struct device *dev,
+				    struct device_attribute *dattr,
+				    const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct edt_ft5x06_ts_data *tsdata = i2c_get_clientdata(client);
@@ -645,7 +645,7 @@ static ssize_t report_rate_store(struct device *dev,
 	return error ?: count;
 }
 
-static DEVICE_ATTR_RW(report_rate);
+static DEVICE_ATTR_RW(report_rate_hz);
 
 static ssize_t model_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -699,7 +699,7 @@ static struct attribute *edt_ft5x06_attrs[] = {
 	&edt_ft5x06_attr_offset_x.dattr.attr,
 	&edt_ft5x06_attr_offset_y.dattr.attr,
 	&edt_ft5x06_attr_threshold.dattr.attr,
-	&dev_attr_report_rate.attr,
+	&dev_attr_report_rate_hz.attr,
 	&dev_attr_model.attr,
 	&dev_attr_fw_version.attr,
 	&dev_attr_header_errors.attr,
-- 
2.43.0

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
branch: edt-ft5x06-report-rate

