Return-Path: <linux-input+bounces-10210-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE4A3DAE7
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 14:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8361418993B7
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 13:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889331F7545;
	Thu, 20 Feb 2025 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/Kf5ZHb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877161F7076;
	Thu, 20 Feb 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057000; cv=none; b=ZXc2PubfEm99HkUBmBwgkeZpNeF69qsRoAd42FeETvD6PRytH9QBbZZqGBKF3loDx/YNseZHf3djs/PKWIEhaiC4EzlH1JDEw+MqiUK9jqArURgl10N4H5QPD+wVSV0PjPu9xi4i0ErovXU1wYD4pcw5QB7GWoOYNgMoQHBnn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057000; c=relaxed/simple;
	bh=FuyaBFCtVG8QDfo2+uDDqvYUgSY8Zj4Vf6m3km7K6XA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BU8lWIVgOyFsLqnmyegMc/VBXeXvzc6GDYnVa9DhgNdLYJt5MH+4De2NBMI9ByczFQ0SWHVQzsEAW99uY2aXXoP0K7ZEhZ8DzleD2lW2B4pCMWLzFNHzvajcIS09J+tmhn9299zjyuR3d91cA0S7qaZG9y6TPvm7KlUXPZ14ulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/Kf5ZHb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30762598511so8518021fa.0;
        Thu, 20 Feb 2025 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056996; x=1740661796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3a6wLnxZzyaVT9CGz7P1ZX4RPkOR4DtkW51/j2nfMA=;
        b=U/Kf5ZHboBzNemelyTO0xkmi1FJH+b6hV86gfIJy1lPTcck1IB+gQ4H1Ml307gY6KU
         nHBQmJ6/rb8qNHoxt7Ipz/ehcVxHfgDLXh81Ii/c2/WL9lABvCcNfaB6hsWrwa1TPPKc
         I3ttf7W2HQ3UsHQUfKrpuSAgST5R3FAQ9xxa/sKF2V9gO6qiu2FT8xBaYBrw4X8Wqzzr
         UUtYpI8HU8M1hvFmIMHcF+88t9wpD1JNzNtr76NCisWu1Dwjqu7JKCBNzpmEMwet5Qth
         0FLaGkg8DuEJj3+rnmQL/Xq+BbrPgszxoduPXmyqHzydEPvWCSvZmw6sg/eVShNWMlQk
         l1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056996; x=1740661796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3a6wLnxZzyaVT9CGz7P1ZX4RPkOR4DtkW51/j2nfMA=;
        b=dJLpPbmN/ZURn0FKHBoD77rqsYyPftQ8u2+C1tg+d5sg1/JFRHKkdH2VChSwV/mJ75
         5U1VMc0Y85Wgf64ElOz76gVqVLH43udUPZzcWJJQW9nwuG6m6iW7zSqlWR8XodpQezjG
         SfEvXVKP34V2ATb2Tjb1ns8aG8Sj5hPora5JTni85Nn2vZYU2BNPRYA4rdDlHwXqqHnF
         aLFCBEWucgKg6ft6CQMDmw5riB2T88VZxVNbULeNn2UFHrkVVK+7Ke/NxZKUhY6yHmV/
         wy7ulJ8JechR4ODIzsSHcv3ENzNmmQV3qlQTvGpzJPu6EeO13O5IwTqq7lnRXcoATCFm
         46BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKSdR1qbDWKSFlTNNdFYJxWEYdpf19dSVm+SGsd3N07vUGPrXHVD2gHsKCwsQ8qIjeiosTW4MlFSgOXftU@vger.kernel.org, AJvYcCVjUwW22+O/dGE9+n+zZ3YH0uUfdZ8VHi963TRQasJaCL/yu7WolX4uRDp0K7SYFg2b6OYW+1odiY/fgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFWKBon9Eeb7IGPuUB7UnUXyv7qfqBHPC/sqIjDZYVsNXrXgo5
	A8fnjM/OGsHfoOCeJykCWieeUYGLSbUA85OgAWO0Zt++6n8uKMld
X-Gm-Gg: ASbGnct6roV9GhkRjMiQib43imL/U1jMzKVuintrt2DkPw0o3wQNhk2Y6x9LeMzPc0w
	yUCvAo/IKZVvn2LRiPVxlAuEMl41sv3LnVtEFMeHUZAcvDVTITZY9rPeMMJzGQtbnfAZ54LzfYt
	TZr4qiFGjyloE9+wEKA29DIMbPEOAgsreUxeNv/QItVgU9QlIYNLjD5Iet4LUOFLTg/sA/JFh4Z
	DArrYFcxt2YjBeoRqIKny3ITW4KS/NeO2DXTb9UwGwDdjImuMMcLZlp6zztZVmcNBWCn+IDUJRf
	sCg3/NNLn5AApZfe5dsiLboYckzyfY0eniQicazr
X-Google-Smtp-Source: AGHT+IFpiHbMgPYRkK3amTIIC6/fQP/OElyD8DSkv9bft3f92vAok+DKDJ/dHYRbJWovBP7pvPpoWA==
X-Received: by 2002:a2e:9a89:0:b0:308:ed4d:629f with SMTP id 38308e7fff4ca-30927ad512fmr65367321fa.27.1740056995903;
        Thu, 20 Feb 2025 05:09:55 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b75esm25510721fa.103.2025.02.20.05.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:09:55 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: job@noorman.info,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	felix@kaechele.ca
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH 1/2] Input: of_touchscreen - support device-properties with other prefixes
Date: Thu, 20 Feb 2025 16:09:39 +0300
Message-Id: <20250220130940.2019784-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce touchscreen_parse_properties_prefix() function, that can parse
device-properties with given prefix. E.g. both touchscreen-swapped-x-y
and pen-swapped-x-y may be parsed.
Some touchscreens may have different pen axis orientation,
and that should be set in the device tree. Separate set of
device-properties with prefix "pen-" or "stylus-" will be used to set
pen resolution and axis orientation.

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/input/touchscreen.c       | 83 +++++++++++++++++++------------
 include/linux/input/touchscreen.h |  3 ++
 2 files changed, 54 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index 4620e20d0190..0ed6b85b1ded 100644
--- a/drivers/input/touchscreen.c
+++ b/drivers/input/touchscreen.c
@@ -64,12 +64,35 @@ static void touchscreen_set_params(struct input_dev *dev,
  */
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 				  struct touchscreen_properties *prop)
+{
+	touchscreen_parse_properties_prefix(input, multitouch, prop, "touchscreen");
+}
+EXPORT_SYMBOL(touchscreen_parse_properties);
+
+static char *prefix_prop(const char *property, const char *prefix, char *buf, size_t len)
+{
+	ssize_t n, ret;
+
+	n = strscpy(buf, prefix, len);
+	if (n > 0) {
+		ret = strscpy(buf + n, "-", len - n);
+		if (ret > 0) {
+			n += ret;
+			strscpy(buf + n, property, len - n);
+		}
+	}
+	return buf;
+}
+
+void touchscreen_parse_properties_prefix(struct input_dev *input, bool multitouch,
+					 struct touchscreen_properties *prop, const char *prefix)
 {
 	struct device *dev = input->dev.parent;
 	struct input_absinfo *absinfo;
 	unsigned int axis, axis_x, axis_y;
 	unsigned int minimum, maximum, fuzz;
 	bool data_present;
+	char buf[64];
 
 	input_alloc_absinfo(input);
 	if (!input->absinfo)
@@ -78,41 +101,37 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
 	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
-						input_abs_get_min(input, axis_x),
-						&minimum);
-	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
-						 input_abs_get_max(input,
-								   axis_x) + 1,
-						 &maximum);
-	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
-						 input_abs_get_fuzz(input, axis_x),
-						 &fuzz);
+	data_present =
+	    touchscreen_get_prop_u32(dev, prefix_prop("min-x", prefix, buf, sizeof(buf)),
+				     input_abs_get_min(input, axis_x), &minimum);
+	data_present |=
+	    touchscreen_get_prop_u32(dev, prefix_prop("size-x", prefix, buf, sizeof(buf)),
+				     input_abs_get_max(input, axis_x) + 1, &maximum);
+	data_present |=
+	    touchscreen_get_prop_u32(dev, prefix_prop("fuzz-x", prefix, buf, sizeof(buf)),
+				     input_abs_get_fuzz(input, axis_x), &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
 
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
-						input_abs_get_min(input, axis_y),
-						&minimum);
-	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
-						 input_abs_get_max(input,
-								   axis_y) + 1,
-						 &maximum);
-	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
-						 input_abs_get_fuzz(input, axis_y),
-						 &fuzz);
+	data_present =
+	    touchscreen_get_prop_u32(dev, prefix_prop("min-y", prefix, buf, sizeof(buf)),
+				     input_abs_get_min(input, axis_y), &minimum);
+	data_present |=
+	    touchscreen_get_prop_u32(dev, prefix_prop("size-y", prefix, buf, sizeof(buf)),
+				     input_abs_get_max(input, axis_y) + 1, &maximum);
+	data_present |=
+	    touchscreen_get_prop_u32(dev, prefix_prop("fuzz-y", prefix, buf, sizeof(buf)),
+				     input_abs_get_fuzz(input, axis_y), &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
 
 	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
-	data_present = touchscreen_get_prop_u32(dev,
-						"touchscreen-max-pressure",
-						input_abs_get_max(input, axis),
-						&maximum);
-	data_present |= touchscreen_get_prop_u32(dev,
-						 "touchscreen-fuzz-pressure",
-						 input_abs_get_fuzz(input, axis),
-						 &fuzz);
+	data_present =
+	    touchscreen_get_prop_u32(dev, prefix_prop("max-pressure", prefix, buf, sizeof(buf)),
+				     input_abs_get_max(input, axis), &maximum);
+	data_present |=
+	    touchscreen_get_prop_u32(dev, prefix_prop("fuzz-pressure", prefix, buf, sizeof(buf)),
+				     input_abs_get_fuzz(input, axis), &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis, 0, maximum, fuzz);
 
@@ -123,7 +142,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	prop->max_y = input_abs_get_max(input, axis_y);
 
 	prop->invert_x =
-		device_property_read_bool(dev, "touchscreen-inverted-x");
+	    device_property_read_bool(dev, prefix_prop("inverted-x", prefix, buf, sizeof(buf)));
 	if (prop->invert_x) {
 		absinfo = &input->absinfo[axis_x];
 		absinfo->maximum -= absinfo->minimum;
@@ -131,7 +150,7 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	}
 
 	prop->invert_y =
-		device_property_read_bool(dev, "touchscreen-inverted-y");
+	    device_property_read_bool(dev, prefix_prop("inverted-y", prefix, buf, sizeof(buf)));
 	if (prop->invert_y) {
 		absinfo = &input->absinfo[axis_y];
 		absinfo->maximum -= absinfo->minimum;
@@ -139,11 +158,11 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	}
 
 	prop->swap_x_y =
-		device_property_read_bool(dev, "touchscreen-swapped-x-y");
+	    device_property_read_bool(dev, prefix_prop("swapped-x-y", prefix, buf, sizeof(buf)));
 	if (prop->swap_x_y)
 		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
 }
-EXPORT_SYMBOL(touchscreen_parse_properties);
+EXPORT_SYMBOL(touchscreen_parse_properties_prefix);
 
 static void
 touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
diff --git a/include/linux/input/touchscreen.h b/include/linux/input/touchscreen.h
index fe66e2b58f62..42aed1ccc2cd 100644
--- a/include/linux/input/touchscreen.h
+++ b/include/linux/input/touchscreen.h
@@ -20,6 +20,9 @@ struct touchscreen_properties {
 void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 				  struct touchscreen_properties *prop);
 
+void touchscreen_parse_properties_prefix(struct input_dev *input, bool multitouch,
+					 struct touchscreen_properties *prop, const char *prefix);
+
 void touchscreen_set_mt_pos(struct input_mt_pos *pos,
 			    const struct touchscreen_properties *prop,
 			    unsigned int x, unsigned int y);
-- 
2.34.1


