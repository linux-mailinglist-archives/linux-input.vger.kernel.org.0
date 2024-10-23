Return-Path: <linux-input+bounces-7666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F89AD438
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 20:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6486BB244A7
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 18:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1EE1D1F46;
	Wed, 23 Oct 2024 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IofE27Ek"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C31D049A;
	Wed, 23 Oct 2024 18:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709130; cv=none; b=jq3OgnVr7BCFB99uQMV1tb8YB/1Qh/JNiPETlhI1puPZ8SK2vIsDDnSANMWLZ9wzEJM4FEF+knofF7MlWKMiBQTTxx+2frYxXr1lnE0zM8FPD6+TYrUAinzKfRGUIvqAHE91j0Kx6KgTRqjXCp+P6gqB4PPfPUYaK6uDeZxGt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709130; c=relaxed/simple;
	bh=6nUgEdTr+tzSukKurFYskrMjyhTFHfwqugC64agyt+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CY724EHvzw7LdI9U9jAcDBRvDjSwRwa0srsyxaVRj5iNShJAhA701hdhP8qU0gHN2qSjoimBed4cnOaCJaqg1+Vf6ma8b3NnWLEy8NWL5rGQkE5OnfPiNv4dGV48ZVqeWQp9/FxmuUciF9Z4FRVOzs9eQuxtJmI5sY9/mOVHCYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IofE27Ek; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e59746062fso133233a91.2;
        Wed, 23 Oct 2024 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729709128; x=1730313928; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ov2xAXMB6p30jTkaVMNKHZxZEIOcYKxnx7FzrQpE6GE=;
        b=IofE27EkJQBbHdSNC/bnyCPI4D/nzV65xFTeVRkJo7JSaMk+ONC7UJB8kSLaXVrp91
         ur+ez0zvgra9WPgOZVWLVQ61yKtii46iCYfCo2eBixmwkwqRwl6nbUuBWNvHO07SCCbY
         awyjOo87xraXTk7/0x0zDIiT42WLGP0AG/ygeF8LXwqhGy1uQQ9CbwekGOwmrdPmewYH
         BCcS2/KIC/nFqwZDQprt3ZuWv/DHVyusnDNy2SPoN8zzPx2oes00/noH+d44zPCway9p
         gnCbdfdSKRkMQi4dcgZrZCf1GSWOgz9NoPv3h5jZwwvHnY9eVb2f7zI+T1GUahy8cQ+g
         6B4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709128; x=1730313928;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov2xAXMB6p30jTkaVMNKHZxZEIOcYKxnx7FzrQpE6GE=;
        b=kNyD8Qcp/zNUjYELdY0YdlzMtA5t0o1EOOpX9L0ojN+jl7GSN1SiEPKyiH3RMg412R
         NinVDYM935GHSC1+ir8w9nmlhk0tRll40fv+IMDhCMF1t8Bn5AoSdj/MUcVKrycdZSM0
         GulXFKbJvANNpxOYbppur5uROdMfbx1WBfFF5wR+WdNf0MuEZwiWPj05cNl0X7ifEeE5
         hMFCv8Ft8yBptFOEMUu6EMyoWwWE2EmmptVzslFturHBkgwIhungbSS7lrN0iiH5hCLE
         8NN0nQfIl3DoPrnlSXx8wOJeIBDDG48/fJ/XdqmJOooX5cMI76AL7dCqXRGxjkWHeb3x
         XRwA==
X-Forwarded-Encrypted: i=1; AJvYcCUz2GiWk9EiQ923DvCRZdR0SOVVaaKD2d+EKj0BYEXVgl/GlI0COlfiBe2Mn4xFFJrknnrm2jZfC5/nbDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbpI1IatpE/vIH+0lX7/J6BTQfZGhueVNKgi4mdcw6TIDu/Lt
	0eweGniXKms4ObRaVGWEFAigYifSa5qAyqRHIBaydA5H/6u5Ib9G
X-Google-Smtp-Source: AGHT+IG4l64bzbzLLU+UIi8xMJh/O3V1IttypIFpwfkTAisoWEZ99kL1wFcEcs7j980J8mn/qefubQ==
X-Received: by 2002:a17:90a:17aa:b0:2e0:a47a:5eb0 with SMTP id 98e67ed59e1d1-2e76b72189bmr3551829a91.38.1729709128122;
        Wed, 23 Oct 2024 11:45:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:84b7:953b:674b:513c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e059423sm1783133a91.43.2024.10.23.11.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:45:27 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:45:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Linux Input <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] Input: introduce notion of passive observers for input
 handlers
Message-ID: <ZxlEROX7bMo5cbZP@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sometimes it is useful to observe (and maybe modify) data coming from
an input device, but only do that if there are other users of such input
device. An example is touchpad switching functionality on Lenovo IdeaPad
Z570 where it is desirable to suppress events coming from the touchpad
if user toggles touchpad on/off button (on this laptop the firmware does
not stop the device).

Introduce notion of passive observers for input handlers to solve this
issue. An input handler marked as passive observer behaves exactly like
any other input handler or filter, but with one exception: it does not
open/start underlying input device when attaching to it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 v2: fix incorrect handling in input_close_device() - we still need to
     decrement handle's open count and ensure that no more events will
     come through the handle even if the handler is an observer.
 v1: original posting:
     https://lore.kernel.org/all/ZteiClP9jabjHFkG@google.com

Maxim, I did not add "tested-by" by you because this version is
different from V1.

Thanks!

 drivers/input/input.c | 15 ++++++++++-----
 include/linux/input.h |  5 +++++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3c321671793f..3b1e88ead97e 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -605,6 +605,9 @@ int input_open_device(struct input_handle *handle)
 
 	handle->open++;
 
+	if (handle->handler->passive_observer)
+		goto out;
+
 	if (dev->users++ || dev->inhibited) {
 		/*
 		 * Device is already opened and/or inhibited,
@@ -668,11 +671,13 @@ void input_close_device(struct input_handle *handle)
 
 	__input_release_device(handle);
 
-	if (!--dev->users && !dev->inhibited) {
-		if (dev->poller)
-			input_dev_poller_stop(dev->poller);
-		if (dev->close)
-			dev->close(dev);
+	if (!handle->handler->passive_observer) {
+		if (!--dev->users && !dev->inhibited) {
+			if (dev->poller)
+				input_dev_poller_stop(dev->poller);
+			if (dev->close)
+				dev->close(dev);
+		}
 	}
 
 	if (!--handle->open) {
diff --git a/include/linux/input.h b/include/linux/input.h
index 89a0be6ee0e2..6437c35f0796 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -286,6 +286,10 @@ struct input_handle;
  * @start: starts handler for given handle. This function is called by
  *	input core right after connect() method and also when a process
  *	that "grabbed" a device releases it
+ * @passive_observer: set to %true by drivers only interested in observing
+ *	data stream from devices if there are other users present. Such
+ *	drivers will not result in starting underlying hardware device
+ *	when input_open_device() is called for their handles
  * @legacy_minors: set to %true by drivers using legacy minor ranges
  * @minor: beginning of range of 32 legacy minors for devices this driver
  *	can provide
@@ -321,6 +325,7 @@ struct input_handler {
 	void (*disconnect)(struct input_handle *handle);
 	void (*start)(struct input_handle *handle);
 
+	bool passive_observer;
 	bool legacy_minors;
 	int minor;
 	const char *name;
-- 
2.47.0.105.g07ac214952-goog


-- 
Dmitry

