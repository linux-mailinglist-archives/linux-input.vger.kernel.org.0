Return-Path: <linux-input+bounces-10307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A9A4321D
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 01:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB9B3A8DDE
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 00:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2936D63CB;
	Tue, 25 Feb 2025 00:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuqQrvKh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8A13A27B;
	Tue, 25 Feb 2025 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740444784; cv=none; b=PJBWOQuv9/so8Lp9WE2EyYOYJ9c6+zuJs/He4xZ3On/Ylmlj5BqAy+bAqgbYzbYCsjooraxnsjeofBAR7VPTusJiu7ARUJb+cvLKwJJDzHeDd+3TnvIlHehnBd4VtbBZI9nZ9PigawiJHei58u3wDwaoz86UnUpQODNRegQFe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740444784; c=relaxed/simple;
	bh=6Eqh1u8ZeHsCE0wX4nbaCoJEd0C+Yput5YmMDMIcWbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJmN7gNJHBHO/jXPHH6EdV9qZ5zq+51jG8kMZfuQHrFDX9vn0OHZdmqQGdTB/J/Ag4Yo25XRI7YHoXs4bDTe4Bioxb5clz15TZ4Q+f65ZCmnAR+PlhifmyuML1x4mdF9BdxM/W0dOFiH9hYNk94DyNfOIqXHME7bdhIIHg0BnEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuqQrvKh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2230c74c8b6so1934625ad.0;
        Mon, 24 Feb 2025 16:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740444781; x=1741049581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ni16q3lUg55hroWQM+WeY1LNmMBQAc6C68Nk7KUZcug=;
        b=JuqQrvKhVL1lZyTLIO1Wg+SNlb+481a8A2aRS3TXiJIBpqDWjm4TQC0S2p1hjSOPTA
         rSKYF2YWI8VSajMPSH+5ANuNLIv7/gkh/E7yyZ+hh1/CTGGhRzl3ZjLCExK5PXqlPyeR
         6UVigyfOSWO7l9L9PlhZBLdijupeQjqpjxrPptT1Wjs6CEDSIiKxxJxe8en2htQXpraf
         1+C3/kOohVSxAFhIFOG11sY8iNY0Pd2HXWJlXNSpbSQmnrWlSkHjS9IwkeRPIZ46OueZ
         4wB7wCjsnKcwbEXH+Du4yd5/tCamh8L4CAEllvUvZkbAH4K8bddkFIUPnkAsb20/Qqgx
         wfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740444781; x=1741049581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ni16q3lUg55hroWQM+WeY1LNmMBQAc6C68Nk7KUZcug=;
        b=FybRcrKUEvCY1oXGb2UR9oMyyvrwyzc19YPbbXAlUOFSifRCrInBxXt1SIRrJhnBA6
         HwJD8lVIbCvChVL500IQcTkJfcVkQuQlT/zUVfY7btZbzVVpwInGT4S7SB5/rt+0a6n0
         dcWuaVIG11TyVsOvUaGnftil+WC4QWoJP8y94ScRSpQRvJOa0m6vkaZvZXdVQaaoY34b
         EJkmUfh3G8kCtZRxQGoP/BjVMEIarkmf67Av6Usch8AxnkzhP1PAT+8B34A8V1D06wuh
         nuYlr3LLN7KDUuIDPq47XxK0auALxQovYO3Tr74Z6mvgNyJxGLrgd51ntkn3kQ9LcclY
         vL1g==
X-Forwarded-Encrypted: i=1; AJvYcCUsYL0yKjbRVVVWaPY4DWtF0+jugdTIhEQv5uupKdkB8o7xvpZZqLbag/c+nOye+h/sZigbMwOAFfOgqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIXamIG3/N9T12wg/m76QX+R4gPJmcCAmFAPeYMOlA8NhJbBN0
	i+47DjTCCvByujr/h8WioXng+WxVk6RtwFcb7rqYtCxVVuUPgjfP
X-Gm-Gg: ASbGncux/78sNDvVBSa886rGcEdCF5n7jQBS60SlZn8ibszB2eAuOBntTlC6jm9Pl6W
	Hykz2z94Y3DLyymkSgS4ZD2pnWNQZlD99VdmhVgV3WByGaoWy6SkJrGtK3TYbs0IVYQ87P1CTVr
	bsMrWv14Ahy5pzT3H9H13HloUjkRgmUApRvXhEAghb5yB6Usgcfr5kNo9P36t18V49ozaCGHLGs
	5IYVhTt0lxwnX8VgyP+PY6+7ufw6LfTqKXRwwrgizna4j/J+xfgTg+KpaI6ssxEpkC4JoFCAlgX
	g+a6dALgbJmqijDL3dyQG7AENQY=
X-Google-Smtp-Source: AGHT+IHeeI88NajexuIR9appPZ/TdMLLXOXQqlAuAA+eSd9GwIET0fAx3xwSUK8GuPSm2oOBMhC5lg==
X-Received: by 2002:a17:902:d50a:b0:20c:6399:d637 with SMTP id d9443c01a7336-22307e65a63mr23441015ad.40.1740444781281;
        Mon, 24 Feb 2025 16:53:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0217e7sm2314505ad.104.2025.02.24.16.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 16:53:00 -0800 (PST)
Date: Mon, 24 Feb 2025 16:52:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guillermo =?iso-8859-1?Q?Rodr=EDguez?= <guille.rodriguez@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/1] Input: evdev - fix wrong timestamp after SYN_DROPPED
Message-ID: <Z70UagY4hxDwUDHv@google.com>
References: <20241202123351.86957-1-guille.rodriguez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241202123351.86957-1-guille.rodriguez@gmail.com>

Hi Guillermo,

On Mon, Dec 02, 2024 at 01:33:50PM +0100, Guillermo Rodríguez wrote:
> Hi all,
> 
> We are seeing an issue with gpio_keys where the first event after
> a SYN_DROPPED has the same timestamp as the SYN_DROPPED event itself.
> After some investigation it looks like this is an issue with evdev
> and not specific to gpio_keys.
> 
> The issue was originally introduced in commit 3b51c44 ("Input: allow
> drivers specify timestamp for input events").
> 
> This commit introduced input_set_timestamp and input_get_timestamp.
> The latter (despite the name) actually generates and stores a timestamp
> in dev->timestamp if the driver did not set one itself. This timestamp
> needs to be reset when events are flushed; otherwise the next event
> will use a stale timestamp. A partial fix was implemented in 4370b23
> ("Input: reset device timestamp on sync"), but this does not cover the
> case of SYN_DROPPED.
> 
> If a SYN_DROPPED is generated (currently only done by evdev), the
> following happens:
> 
> - evdev calls input_get_timestamp to generate a timestamp for the
>   SYN_DROPPED event.
> - input_get_timestamp generates a timestamp and stores it in
>   dev->timestamp
> - When the next real event is reported (in evdev_events), evdev
>   calls input_get_timestamp, which uses the timestamp already
>   stored in dev->timestamp, which corresponds to the SYN_DROPPED event
>
> How to fix:
>
> - When a SYN_DROPPED is generated, after calling input_get_timestamp,
>   the timestamp stored in dev->timestamp should be reset (same as is
>   currently done in input_handle_event). The attached patch does that.

So this happens after you change clock type of a client, right?

I do dot think having one client affecting timestamp for everyone is a
good idea. Instead I think __evdev_queue_syn_dropped() should either:

- use "now" time for SYN_DROPPED generated when user requests clock
  change or reads device's current state, or

- check if input device has timestamp set and use it or use "now". This
  option is needed if we are concerned about timestamps potentially
  going backwards if clock change happens in a middle of delivering
  input packet.

>
> (Perhaps the underlying problem is that it is not expected that a
> function called input_get_timestamp will have side effects. The
> commit history of input.c shows that this has actually caused a
> few issues since 3b51c44.)

Yes, maybe something like below will work better. It does not address
the keeping timestamp for SYN_DROPPED though.

Thanks.

-- 
Dmitry


diff --git a/drivers/input/input.c b/drivers/input/input.c
index 54d35c1a2a24..954c5104a1c1 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -61,6 +61,66 @@ static const unsigned int input_max_code[EV_CNT] = {
 	[EV_FF] = FF_MAX,
 };
 
+/**
+ * input_set_timestamp - set timestamp for input events
+ * @dev: input device to set timestamp for
+ * @timestamp: the time at which the event has occurred
+ *   in CLOCK_MONOTONIC
+ *
+ * This function is intended to provide to the input system a more
+ * accurate time of when an event actually occurred. The driver should
+ * call this function as soon as a timestamp is acquired ensuring
+ * clock conversions in input_set_timestamp are done correctly.
+ *
+ * The system entering suspend state between timestamp acquisition and
+ * calling input_set_timestamp can result in inaccurate conversions.
+ */
+void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
+{
+	dev->timestamp[INPUT_CLK_MONO] = timestamp;
+	dev->timestamp[INPUT_CLK_REAL] = ktime_mono_to_real(timestamp);
+	dev->timestamp[INPUT_CLK_BOOT] = ktime_mono_to_any(timestamp,
+							   TK_OFFS_BOOT);
+}
+EXPORT_SYMBOL(input_set_timestamp);
+
+/**
+ * input_get_timestamp - get timestamp for input events
+ * @dev: input device to get timestamp from
+ *
+ * A valid timestamp is a timestamp of non-zero value.
+ */
+ktime_t *input_get_timestamp(struct input_dev *dev)
+{
+	bool have_timestamp;
+
+	/* TODO: remove setting of the timestamp in a few releases. */
+	have_timestamp = ktime_compare(dev->timestamp[INPUT_CLK_MONO],
+				       ktime_set(0, 0));
+	if (WARN_ON_ONCE(!have_timestamp))
+		input_set_timestamp(dev, ktime_get());
+
+	return dev->timestamp;
+}
+EXPORT_SYMBOL(input_get_timestamp);
+
+static bool input_is_timestamp_set(struct input_dev *dev)
+{
+	return ktime_compare(dev->timestamp[INPUT_CLK_MONO], ktime_set(0, 0));
+}
+
+/*
+ * Reset timestamp for an input device so that next input event will get
+ * a new one.
+ *
+ * Note we only need to reset the monolithic one as we use its presence when
+ * deciding whether to generate a synthetic timestamp.
+ */
+static void input_reset_timestamp(struct input_dev *dev)
+{
+	dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
+}
+
 static inline int is_event_supported(unsigned int code,
 				     unsigned long *bm, unsigned int max)
 {
@@ -342,11 +402,9 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
 		dev->num_vals = 0;
 		/*
 		 * Reset the timestamp on flush so we won't end up
-		 * with a stale one. Note we only need to reset the
-		 * monolithic one as we use its presence when deciding
-		 * whether to generate a synthetic timestamp.
+		 * with a stale one in the next event packet.
 		 */
-		dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
+		input_reset_timestamp(dev);
 	} else if (dev->num_vals >= dev->max_vals - 2) {
 		dev->vals[dev->num_vals++] = input_value_sync;
 		input_pass_values(dev, dev->vals, dev->num_vals);
@@ -366,6 +424,9 @@ void input_handle_event(struct input_dev *dev,
 		if (type != EV_SYN)
 			add_input_randomness(type, code, value);
 
+		if (!input_is_timestamp_set(dev))
+			input_set_timestamp(dev, ktime_get());
+
 		input_event_dispose(dev, disposition, type, code, value);
 	}
 }
@@ -2053,46 +2114,6 @@ void input_free_device(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_free_device);
 
-/**
- * input_set_timestamp - set timestamp for input events
- * @dev: input device to set timestamp for
- * @timestamp: the time at which the event has occurred
- *   in CLOCK_MONOTONIC
- *
- * This function is intended to provide to the input system a more
- * accurate time of when an event actually occurred. The driver should
- * call this function as soon as a timestamp is acquired ensuring
- * clock conversions in input_set_timestamp are done correctly.
- *
- * The system entering suspend state between timestamp acquisition and
- * calling input_set_timestamp can result in inaccurate conversions.
- */
-void input_set_timestamp(struct input_dev *dev, ktime_t timestamp)
-{
-	dev->timestamp[INPUT_CLK_MONO] = timestamp;
-	dev->timestamp[INPUT_CLK_REAL] = ktime_mono_to_real(timestamp);
-	dev->timestamp[INPUT_CLK_BOOT] = ktime_mono_to_any(timestamp,
-							   TK_OFFS_BOOT);
-}
-EXPORT_SYMBOL(input_set_timestamp);
-
-/**
- * input_get_timestamp - get timestamp for input events
- * @dev: input device to get timestamp from
- *
- * A valid timestamp is a timestamp of non-zero value.
- */
-ktime_t *input_get_timestamp(struct input_dev *dev)
-{
-	const ktime_t invalid_timestamp = ktime_set(0, 0);
-
-	if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
-		input_set_timestamp(dev, ktime_get());
-
-	return dev->timestamp;
-}
-EXPORT_SYMBOL(input_get_timestamp);
-
 /**
  * input_set_capability - mark device as capable of a certain event
  * @dev: device that is capable of emitting or accepting event

