Return-Path: <linux-input+bounces-1304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D5831529
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 09:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B5EF1F239AA
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 08:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AF31BC55;
	Thu, 18 Jan 2024 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eoaQ1rq7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F541173D
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568090; cv=none; b=gyI+93REmOllWdsdJug59rnBVKK2PFVW4+JqKdVpwqx07bQj94qe+cNUv5RkVhSiPO3ABkBkz+wuKF83IWIoI7x2GKjvUKZBaLt9SDc2MYfcavbKoRP+EnLun6+SOZkAsgG3G/Dsdqg35Rc2ljN+Beb1ML0oFFuDBPTBEG4x5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568090; c=relaxed/simple;
	bh=MCxZ8z07WUK2BsrAfJ6Bu00FMqAk5lxvFXxpvD9oRSk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=PRWvZsVEEoUux8zOn2Bkprpi0gmjmwh2k37eokT1fCPJYsavup3ao8JzHd1BQsC8ELqLWWuXKv8KxfRhGqRg0uqZt4pid4RoM1NyNjaHaM0hSr6SxJhisvU1nwvrpGxQvq7CEppts4WZEYQg1ef1KzVn+iWJUVGYoO4Y1bWunvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eoaQ1rq7; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d5e004f592so14484485ad.3
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705568088; x=1706172888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oz9mVOu+ad9eAvvgLiXYxdC8+oSkbRkyUjyWQjx33yM=;
        b=eoaQ1rq78eTtzh0wFOS9Tz2aySgv13PGt+7LqbFZ58CqGGbyLnBm/JLNfMTa+fnqaj
         UkoqWg0ZR5VQdEGutJsZNYQMt2hKnQgbYSo//p5u0QIhXYnGv4hHZIxnH5r5Vw8BFaFM
         b4FV9RVa5L7OM8934MXFkCgDfeN9Wakj4eduM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705568088; x=1706172888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oz9mVOu+ad9eAvvgLiXYxdC8+oSkbRkyUjyWQjx33yM=;
        b=xLvHTojJ/jdmJ3LGSjLujH80wTQmiUkBVvLHAJ/oLrbbUaWEwmRVWcFsTDlsIa8enA
         S+LLNuimdy99uiATDWTPA2O981P9aVA2lDNszOfJAQXfK+6U8IYx6iiytd0uk0OKMQen
         OOw4CvzyBBn3dgVbP2NNX4K4rGpuUafuNPlt/sCd1Oem+dM3cAEO3l6+sbZ23eA4YcBl
         PtMnylW0pffftQVGlRyKGSHZZbdgA1z5EFy8dNPLFv4hKSE5yUJYSGkmmsAecNm8Tn+7
         zZAmQ6t6ZqiOFFAH04Vl45dpisW2Ttu65zh13vXAFEGI8tqpBHYt7qypFFx1oQeBOipj
         nF8Q==
X-Gm-Message-State: AOJu0YwS667MyGRXoA+/gPJ4kGEoylnERVJehOr4u+f/0uzxvpnSGKT+
	GBVreDYaeBvnYEAQoqKUTFMC1a7kyOUcsk6kFbjrLcKVWCPzB+JMA/PN7ukGrg==
X-Google-Smtp-Source: AGHT+IHLBlmDFJj4oPMADbmRUKL9nH9CY9T4nkMaGF60d4eQZV9wC6gpHKuBd5hsyMwfFMYc1IoExw==
X-Received: by 2002:a17:902:8606:b0:1d5:845:da16 with SMTP id f6-20020a170902860600b001d50845da16mr467559plo.126.1705568087823;
        Thu, 18 Jan 2024 00:54:47 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:6a83:9579:c455:9664])
        by smtp.gmail.com with UTF8SMTPSA id kf13-20020a17090305cd00b001d0ca40158dsm912379plb.280.2024.01.18.00.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 00:54:47 -0800 (PST)
From: Ting Shen <phoenixshen@chromium.org>
X-Google-Original-From: Ting Shen <phoenixshen@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?joewu=20=28=E5=90=B3=E4=BB=B2=E6=8C=AF=29?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: cros_ec_keyb: add support for base attached event
Date: Thu, 18 Jan 2024 16:52:43 +0800
Message-ID: <20240118085310.1139545-1-phoenixshen@google.com>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,
to allow userspace detect that a keyboard is attached to the
detachable device.

Signed-off-by: Ting Shen <phoenixshen@google.com>
---

 drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 30678a34cf647..d2e0d89d4ffdf 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -128,6 +128,11 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= SW_TABLET_MODE,
 		.bit		= EC_MKBP_TABLET_MODE,
 	},
+	{
+		.ev_type	= EV_SW,
+		.code		= SW_DOCK,
+		.bit		= EC_MKBP_BASE_ATTACHED,
+	},
 };
 
 /*
-- 
2.43.0.381.gb435a96ce8-goog


