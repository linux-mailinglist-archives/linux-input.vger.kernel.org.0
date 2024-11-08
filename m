Return-Path: <linux-input+bounces-7982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED969C1C95
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9472B2219D
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 12:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0A41E7655;
	Fri,  8 Nov 2024 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHLYVjV4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AA1E570A;
	Fri,  8 Nov 2024 12:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731067416; cv=none; b=nDZfLoxgXVBvfvErt4XPJ/a5p0Th1jOIHLM+Qfw9soolfrrvieqjrQIsvELPlj3iFQbDqvG2MES2VLX0Ghr6QKa1WYCfBhANkNK5Gr+JnKFHmu7PMPpZ6WgWYibzgPZy/Uwl99ygXyf5QoSqw0x5tkekyWloGHyydAe8TXaQjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731067416; c=relaxed/simple;
	bh=ChBYcsymTV1V2mzS78DD/EMvOHeZnX/SWf2LKR2jUG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tc6lhsrKXkcV8lUxyf4CeJ8GdOlY/GKO4qA8/Ooh2/cTRONilrfRoHig2N1ePE/5ikFLWZTmqVVh0NRlD2qGozxQeHHlYPk+AI/1nh4BQTQGHAz26gow9ooPssyVfGmktt6kktIHTbA7m86wVxweqMQPUetIlUJQrE/WYdwAFC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHLYVjV4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so1715434b3a.3;
        Fri, 08 Nov 2024 04:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731067414; x=1731672214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikksqLJ4EA+Xck83QqUeUsYVlDqNhdNWvuB3gGEYssM=;
        b=gHLYVjV4cxFVubE7HNRQZg3JiW11dLTGUvONZfQU3xDliAC+lqnoIeZNGOkoOHsJ4B
         YwOv+jwHc/x+xdT61g9+7kJg4mkQ/ClejSFseHMGbSeyrRAdQC376Ix9fwwaIOApU7fk
         FZJuTmzxHH8nhpUsnwsAIQEmfhnEg/GhPXZ6gjsA4wtAuqVG3f6GrV3Wdye90JfvIo1J
         WDGih1q/QDSZw1NG/liI8c5kSvgRjdEZd2I8SXy3xKVMgubyCAlXdfw9Gzlz2unoCioT
         eadAoveQWVwMYJOe3/lbqT0Tu7YozHVAuETQieEsIhx6rYhY/yLTXJ4zFPMUBwfScekE
         xMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731067414; x=1731672214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikksqLJ4EA+Xck83QqUeUsYVlDqNhdNWvuB3gGEYssM=;
        b=LXIfEtG0L8v+SVTy8uLA4DZVAV6vGKUIx4hJUmkvNDNH2nfNwZFzcQW8bV0QExeRoK
         dFH/1de47kqXgliR2XUeOirW0mVcRETH9Dg2P45m+uB7VoXWky9BajY58mwomHp2NqMg
         Y+JWCd4/X7SzpMl58fTtxUd9YaNj8o2fI4WnzpAvMXGMqc+gOT35OqJ27Idq7wzJFb8+
         alzKAYgSzfE4OqAzDgprtJqvG2CZ4O+ljFCYRdyFLddIGamXJ9dysTid+oqHCn1HyBCV
         +4TMHvSFGLyCC9qXWOzOqjXtnvgzb5cuHzSN1UcTV4DOdgLVzB6CIHqRp6bwQwleUVgi
         SmxA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ruo33bz41v4zdp2T/rHKwKnGCULea3BmCMOaVRHQNyKQK2F6HNvwGmAKyyIGv1JHrh6vQD8OoXg7@vger.kernel.org, AJvYcCUrsYAzDG6YP/xw99jU32+U8drR7aEBEzbvzS47Zl+dWuexcSQyHLOv/SUqYe7lp4lL5SmPPUpIOaYARQ4=@vger.kernel.org, AJvYcCW9jWvP1zi5gqJzZq9W9dgwfeUk3IpTyRseruw1vVaYVAK1RqRnHnAHQ+SJuKkJ6/Dy5YQHpbYLPL7qcj6F@vger.kernel.org
X-Gm-Message-State: AOJu0YykPj3oIxRuWbPRdCgHw2ye+RaEt9Ci8jkGnDXdDezPt8mWes7m
	3octuCiJ3ZksFkVhLHzg4vMblTH3y1Y/HaRsjkXfP4+JGkujL6lO
X-Google-Smtp-Source: AGHT+IEg8uT2/01qFIz2nHpe00coD7q2mrHMZHOIwgHUHZoLVfNAQyBU+biUvKI+sNcFRxnq3EEfIw==
X-Received: by 2002:a05:6a21:7891:b0:1db:dc58:8058 with SMTP id adf61e73a8af0-1dc22b5363cmr3197155637.31.1731067414362;
        Fri, 08 Nov 2024 04:03:34 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a403fsm3579656b3a.105.2024.11.08.04.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:03:33 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: input: gt7986u-spifw: Remove hid-report-addr property
Date: Fri,  8 Nov 2024 20:03:11 +0800
Message-ID: <20241108120311.87795-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108120311.87795-1-charles.goodix@gmail.com>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since all boards use the same address, drop the goodix,hid-report-addr
property and hardcode it in the driver as a default value.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 .../devicetree/bindings/input/goodix,gt7986u-spifw.yaml    | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
index 8105b9ce2..c9e346a60 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
@@ -36,11 +36,6 @@ properties:
   reset-gpios:
     maxItems: 1
 
-  goodix,hid-report-addr:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      The register address for retrieving HID report data.
-
   spi-max-frequency: true
 
 required:
@@ -48,7 +43,6 @@ required:
   - reg
   - interrupts
   - reset-gpios
-  - goodix,hid-report-addr
 
 unevaluatedProperties: false
 
@@ -68,7 +62,6 @@ examples:
         interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
         reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
         spi-max-frequency = <10000000>;
-        goodix,hid-report-addr = <0x22c8c>;
       };
     };
 
-- 
2.43.0


