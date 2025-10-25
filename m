Return-Path: <linux-input+bounces-15716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C127C086B0
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 02:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0326C18830FF
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 00:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88671A9F93;
	Sat, 25 Oct 2025 00:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr1KreK6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EBC18DB2A
	for <linux-input@vger.kernel.org>; Sat, 25 Oct 2025 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351949; cv=none; b=qH7Iqd9HsS8a8ZBYdvUUzQAfZju5LbIZt9Uqosx6bvZJJbICGmeYnwVbQJ9fpI1Lfpl0yi1T4Ph5rJvPKfT9PLVNHtFVTzutv1w34Wn+dFf3TpR5j2FiuJmXhzDFHvGt+hoPQom/I1yXygeLcXbDVVBYDM7ehXj7f5H3foAwc8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351949; c=relaxed/simple;
	bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LV281+07quwFy8z5/SLmsJsNyj6FVCn8LHxEYeAKbRbZAO12peNHtb+ct0PbjXaeoO15YTjoPyfTdTn/U8C/4nSCDLRz7uYXR2ruvMs1U3nC8diEgb1Lo+80pmTjU2FU4MwjRo1tBQ43+Q7fqxxBennyuX4EYPIVXWDs+2k5WCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr1KreK6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso2540668a12.3
        for <linux-input@vger.kernel.org>; Fri, 24 Oct 2025 17:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351947; x=1761956747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=nr1KreK6axEXyVC73WTwFJTGtK33UrYo4xZYW/eqhFqFnUxcVxba/IEtJO+g1pEmIh
         ak3NIV1pVy+Yqz+osd1NxfvDcnqKTb2CFelydd2ET3xabHuRXLbAsNI07EPMt4bfpBkE
         2jkENDtCc7zlF4zMNqokX+l7Rt8UEke433ts1qKPTvYjHqHIC3lilN9WXJXvu1ahhF4s
         ZkN1SYR7BibKOhbK32kYuyuJ7HM7L+T7rrcDfj0FjKGstYwRO00mMYjT+RsWGCdIbTyR
         MUyeT6chfa/9b6AbQu6nyycgB89rCNNfSZ6vPMj31FVr2S4+vdm8hd7MCx3Tuylt9Ysx
         Va9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351947; x=1761956747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfRZW1u7QrD8wKs/E/qokjfPak76+Jqb1NI8oZKYmR8=;
        b=W2KOy/hdE85xZ59BYDDNE7Mr0I1AWT1RgrPbs+iumZSlkpnje6IBS9PrgbBwiVZFah
         dJeoGbWNlAoLAjfqnScNH3eAflazkpLQSreW4rBrF5lM4IMrS0qy6JY7sbG1+Y+4RlTb
         uEJsa+5ufUUSyIBkt7rK0ClsCN2ojxPXLwJ/f89HVhTuXmQF2fc6ZVgRcSXD2YpDgC9v
         +FK+lLZQYmxBwwjL/xpw93r701piteKCknlsKR211Vb73nuPZ5vg5qMFDcKfemQ4FJYI
         +VhW8ZVYEGHLrKyC3sbZwjuPw6u/DViT4HogTwrdiIYz9YlLohgXY2L2xfj1dlPBcUk9
         3hxA==
X-Forwarded-Encrypted: i=1; AJvYcCWY/xERj1ApljSDBf1YCsQcOQ7fTvPD2hDoGL2yAK+Gq3YkPrbuaVGJgcepz8Oo3reU5etBl/SF1xd6BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bmuTLPT6tz3137rVNEHH9ZWFuqMfgjyA3rWg7858WhybVfVw
	gSQYgJPyRTC/WZ386b5UT2iMSCtw4rj6qvvB0ATvibAWl+i+kkoBdIjE
X-Gm-Gg: ASbGncuf4HWQsWZIN/Q2ejp1NIVMXaveqyf5Z2S9a6aL+krFfeH0rch/RS+26ET/tFP
	53h+64Yiw/GwXaN14QQJ5htmxbaqe8mgx+HGDr9Nj7FN75F8eTiKE/R6scu4fbwsvCNJMxuat0f
	WunRSsvky4lUpDKVxnp4VxtHtK780qf2TnJslqxT+DFjzvgAqvXdFtkOGIqhej5qdsf5nuYpsS1
	0wMYxz9lY4rkgwry0rwyl1UKF6Cdov+W6slboElHdP+lMI4X+uiwe6Pr5dM5yS6NqG7Ck5LAWd9
	CTOa6tBWuPHwHsyLaIna4wE5qcFlTL3cK0c3HzvvWh9QIFRYCY0+vx5PhUg/PkceG2WEYNPHx2U
	xjU2JhYt/5w4nkOhHEGKNPSuI478+n2hwv79WIvAVJ2R/jdryjvSRa7cssZ5U4kQ8UVOyg0AfSV
	NYOzGOZg2jDOYu6OTN0YX+K4AJZhXaQhGi71ZXzMFYZOL4/uN47FVyJMSOqpvDKGqyZOKZKhTcA
	Ugdb+SyFWzs19ze72W6uLYlM2/MT6pZtbIYq+Xwy6TOdV8hFD0sB1yCVTcB6gGu
X-Google-Smtp-Source: AGHT+IE7b7WlJg8PMfCez4BRWP01L89M03XHDqmXIAUdqR0o0INVIyz4n2FlGNeMHwcTEVAj8jvj0A==
X-Received: by 2002:a17:902:ce12:b0:267:a55a:8684 with SMTP id d9443c01a7336-290c9c93abbmr330781785ad.2.1761351947512;
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:38 +1000
Subject: [PATCH v4 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-7-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=EBXsHgi+TPtnux5Mjfvq3s8Tobe6+wN+A1W9K6WofCg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM7tvHxyY2mQfvkOj2Ou1b+lL5wt2qeuPnvBRX51B
 rNbl1QLOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNdv5aR4VLggrKHBVUNC5VEVaVC98ZfZxOt6Jh45+IVmwlNsr23dRj+Z+7eV7D
 x+NRGVakE1ehjKc+n716bd2HBjQL/Jt/QqBk9XAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.0


