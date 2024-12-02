Return-Path: <linux-input+bounces-8342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD69E0276
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 13:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7A8DB34015
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 12:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D741FECA9;
	Mon,  2 Dec 2024 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PO0F+usk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B522C1FECA2;
	Mon,  2 Dec 2024 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143356; cv=none; b=j0o0qD/hCeLBceveYBXVHME77WRTwPFoG4+eV1Byfy2FpoF2k6cnpLXWtNuiPEcOghV2KBbZv9BY7TKUSyFVntO2jxFZBGAScOJZ4tK7nKapcPPRblqmnTgWvwKniVluy+8N02YRo3nCRx6ZHEeRqKCI2rpcfLcreV8f22OqvxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143356; c=relaxed/simple;
	bh=2Uk3a9Qp8JSvHompwK90+THunNltHsmaEj5i1f6w6Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KqCSzc46rCmQR5JP7suLFsgJArGKIIftm7Ewk+a+jWY7dxEUQJrdxE0g8kpt0zV/lXAnoPcYz0h5JKmTY4/Fg1ZBBsc2z+DqdiQBpztubOs5JveuCZ/2OWdpQf75VjnhUMEOC2ZdbKfIGygzLhnF/6z2qdgBd1yrkA1VisY3k0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PO0F+usk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso35302355e9.2;
        Mon, 02 Dec 2024 04:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733143352; x=1733748152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwLFMhda36dQvX1H531xKM3kTIPOD8rkJEGrbxUbdrc=;
        b=PO0F+uskq0BHkG6+UFKLluhbgs1JvZvWoGpZ3t8tYKgQxvGO5rnLwb59Wf2ShMNjM2
         yegB5lqx4bCQR7jRKbAqXDc4B0rUg55IgPBRxSVZ6INIaIDuKb5yg04xAh7lTpjU3GOG
         s7ThIVYNAGzSviDcCI6tQKIvucMbcP5W5wmt2qx5A7iozXc4j6jByFltUJW6JPss9eao
         IaJDJ+H1lTk4nyZtLRezABIJk3/Nvd+1253n9M29ZDBE6W74QuVOgZ6adCAx5t1pnh9o
         0S+ajemgqguy+3AT0Ebx9zCq1TtqQybXFZKT6cVj6ZdZrop2GZtMSu/WBDbmut5KaMsr
         arpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143352; x=1733748152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwLFMhda36dQvX1H531xKM3kTIPOD8rkJEGrbxUbdrc=;
        b=igDc1cu0c54w7kgAeW8NCnDBOxZPoNuY9g7dwHz40BCa7dFDtND41gGJBpV7oZfV1m
         1r6FzLBcGx+rnEYtMcXznkCv7wHQ5K0IaEjROrwoFUpwecgPIX/c5acbaBAYszL+E7c5
         hrTOs1mkpg/KYyeiWSb8mzPlGqu7t6Hj+aIWO25EA6qsjSRdGowRRrJ7CnR4dRy91v/n
         68PuAfhXr35zXEXJLwSqUAaO2XITBogS5WzcPlzjsngMzHAo5WJJ233uPStTxNX+MY9N
         m9FDqowRUYEVYtCevhQM7gEnWLLN0hFOPE2P1GNAgMrnFk6VMFeqQVpkjxlNfWqJcRuO
         w/gw==
X-Forwarded-Encrypted: i=1; AJvYcCVS0YZ2nox++njhtdif29mwRvla4fLdzcJUmDZZHRq1nK2iHyYJVQF1DDWjmxcbMVwfm+IcQknEuZQRjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ23libB9auS4SSTTHPBV2q8NR2/1e/viRv6Jom3H1jEcmCRTk
	UFbcbU0tNwXkXs7lZyFMfNYO2FF6Q4awCpN73mHGCE02TH6WxcI144fEzUg+
X-Gm-Gg: ASbGncv4SGoHMIPDIoNU+k+c9DbHYA84BPfCsZsKgUCxja1x0hT54og7ol5/sB9XoOV
	W0cxC0mta7mQAgev+CwpgmO0n8EWyoHxLC5sEC6idxKRhHAJp895GC1WuGTeOQQc/w7+gy4wpsl
	s/mmT9EdcPwtiYZNLSJWB79RxO/a2DYmqdGeXxWWo5MdFMwjG2SGtPBmlo9NGMrYZlXDIYtd6Ba
	AiCFUQPfyS/dKhEuay6C/wU8/WG0c1uMK8Gkj5YGKnhIKWIV8CDWIFPsTkaNmOl1fdELX0=
X-Google-Smtp-Source: AGHT+IF7a67NO6W1aInZOOMFwkZtfAgoyWm0vDJFdPAA2uqNL+xMbJKaMXuf6eSmmfKvygHKtNKi6A==
X-Received: by 2002:a05:600c:4e93:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-434a9dc816fmr218135365e9.18.1733143352405;
        Mon, 02 Dec 2024 04:42:32 -0800 (PST)
Received: from localhost.localdomain ([90.173.102.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bc5asm150033785e9.2.2024.12.02.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:42:31 -0800 (PST)
From: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Guillermo=20Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 1/1] Input: evdev - fix wrong timestamp after SYN_DROPPED event
Date: Mon,  2 Dec 2024 13:42:20 +0100
Message-Id: <20241202124220.87481-1-guille.rodriguez@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241202123351.86957-1-guille.rodriguez@gmail.com>
References: <20241202123351.86957-1-guille.rodriguez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reset the input device's timestamp after generating a SYN_DROPPED
event, otherwise the next real event will use the same timestamp as
the SYN_DROPPED event itself.

Fixes: 3b51c44bd693 ("Input: allow drivers specify timestamp for input events")

Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>
---
 drivers/input/evdev.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index b5cbb57ee5f6..6ab38a611321 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -142,7 +142,8 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
 
 static void __evdev_queue_syn_dropped(struct evdev_client *client)
 {
-	ktime_t *ev_time = input_get_timestamp(client->evdev->handle.dev);
+	struct input_dev *input_dev = client->evdev->handle.dev;
+	ktime_t *ev_time = input_get_timestamp(input_dev);
 	struct timespec64 ts = ktime_to_timespec64(ev_time[client->clk_type]);
 	struct input_event ev;
 
@@ -160,6 +161,13 @@ static void __evdev_queue_syn_dropped(struct evdev_client *client)
 		client->tail = (client->head - 1) & (client->bufsize - 1);
 		client->packet_head = client->tail;
 	}
+
+	/*
+	 * Reset the timestamp; otherwise the next event will
+	 * have the same timestamp as this SYN_DROPPED event.
+	 * See input_handle_event.
+	 */
+	input_dev->timestamp[INPUT_CLK_MONO] = ktime_set(0, 0);
 }
 
 static void evdev_queue_syn_dropped(struct evdev_client *client)
-- 
2.25.1


