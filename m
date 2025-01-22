Return-Path: <linux-input+bounces-9469-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB4A19130
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 13:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 250667A163F
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 12:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EDD212B1A;
	Wed, 22 Jan 2025 12:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6pC8vfQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C9211A2B;
	Wed, 22 Jan 2025 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548019; cv=none; b=ZmymSX73iQyLwBCCFPfSIr0Is/jfnVpXQ36yTeS5uaaLUVgdD+a1LnvtpljiSjGl+tn6m/Dj08zV74ks8PYry+vyzGAjM/wJV3YTHj65ueGwXQfL6uX1d4EYhwGHLTuKtzI9vxkDQ1AC5ytuIHifCe0qoq/JT2LQuudWxB66H1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548019; c=relaxed/simple;
	bh=GoRzVFNtIoBQ4drmtsCmF21DmX2zF/5ZjzUguJdiIX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WlsWbXZZw6KIKpCG4KNRyKM/c4ZKssGGr2dxIoGe1bC9oD58eD1KD4NOzAK6ATPqlqS8U7WZwshM+MZjY3Xcb9ty34TkkTkg1JZyO4wCMoXz5UCOv49JGlJ3xQGuK9h4nIL1bZUI9+dZ838k7sZknN66GJeqZx/OqGt6DgFGJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6pC8vfQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30613802a04so70448561fa.2;
        Wed, 22 Jan 2025 04:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737548015; x=1738152815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDJVxc9xXuSUWKdhL40s5J+E9YFicjZq+w7RbdRGI4Y=;
        b=W6pC8vfQ7Jyza+Gk9QzqwbJAcKIB7fcZE1UkG2R9L92r6jmnE0a48V50rf14XNSD15
         zPqfrdQL8I5LOaXyHWZWxz9CgmaqwfSMimmrck2f/YekGrGOZhkRxlolSP1QoDBr8GIS
         8uU9+spK4TDKOaBS11JIYwhKDxyWI/vvN8i2dL1fDyzsMn/51iixZBvd7xXqcPHUPrBv
         BnwEw++TeifP3R8+v4/iKfCKulkFDDpZYHjs9eIbkmdtQdib2UYHJR6J6Xbf+P/E8UWw
         bqQXF8drz0/eoM6sd1PsCQ/LbnH0AWf49nfNLWjOnmvdkrXDBeTUwJ3Q2cAWrS7joeCM
         v5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737548015; x=1738152815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDJVxc9xXuSUWKdhL40s5J+E9YFicjZq+w7RbdRGI4Y=;
        b=cUYbrt3IwaCA4AR1h3N6AIHQ/NAyvdP3b0sFa4LizPSgVSoeQBJj/LILZOWqKC4P+N
         CzNkXy4hDS1i779I2SeqlvEQAYE6/tBrEiz9RoUmsAc9SkLKaM0O2Vo33t6E3WsxY91S
         yIa/d82qPqAdIvtcBa0fKft4W6OyuLpMsah7hmYdq4Jx352vpUwlYnvjT91D5N6GkXx5
         zUJPiYASp9Lrx0rM9mAoTlkG0KFe7FJB3gTIS6BYs9tibwMZ0jEQtEWPVm2TvyZRowtY
         BB5cekTVKSYmRBnk3FTOeWeNWyGvHijAJU2q44K0Z3HDNZVkxl4uiNulAZhkesDTXBcB
         jBuA==
X-Forwarded-Encrypted: i=1; AJvYcCUlGLge5SJBRFuWbh+95TmlR2qim6GQRpkM4IAtllTti2An4zdkFUJtlWFvRe+3052ZQ48GAtuRGFyI1qb5@vger.kernel.org, AJvYcCWiO/+thuuEbQXeGdUPKJtxqOLh4M6vNKq8BH48yOn5zE3Ik3sEihRtx0tum930+AMFglbFFtB8PZnS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjG87P2tI0CUqSJf4BqZK3F75RYUmGxjt4BPRxsO1GtR7RMUI
	H1zIZdP0eHENrS7saP8bQ/ZSrPR8rY5+VjOs+KZ9Mv4iHa7b3WYp
X-Gm-Gg: ASbGnctIkLTD9g9qTFuuRxRUQj+0kBaBNW9X7+TZLxlzBXrJaPBjV9TKJcIcc03B8bc
	C3L/kTNCxd0Xds3a0NfN2QmEVfpHrmz6GJ9QqBdjwY77jK0O+NAAskEmr5ROgl9ums9+ibnld3A
	KULls8JyL5+0SpadVTCp29zb/47+RZrAzp2Ep2ZfUVLqDsmgzEccBD3xqW4imvIvGo7/5wWAWkf
	Pu1k55za1Ypc6ymaVBCoYgzJ8aVESHOS39iBN2F6uccA6R77irfVSCxYvEseGMcTBmKhILVIHs1
	LZZ4wPgOnzYs+IJVCek=
X-Google-Smtp-Source: AGHT+IGXmRXyDPR4LU6/NFZ/M1JhIZBsl/k7uu8nAAmPd8+9NHJCmInOX5VyQ745dtGKZ3EToOrJuw==
X-Received: by 2002:ac2:5a59:0:b0:542:8d45:cb4f with SMTP id 2adb3069b0e04-5439c22cb19mr5448109e87.1.1737548014921;
        Wed, 22 Jan 2025 04:13:34 -0800 (PST)
Received: from NB-5917.corp.yadro.com (avpn01.yadro.com. [89.207.88.243])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e969sm2186026e87.85.2025.01.22.04.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:13:34 -0800 (PST)
From: Dmitry Mastykin <mastichi@gmail.com>
To: job@noorman.info,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	felix@kaechele.ca
Cc: Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH] Input: himax_hx83112b - add support for HX83102J
Date: Wed, 22 Jan 2025 15:13:18 +0300
Message-Id: <20250122121318.1367700-1-mastichi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on: Starry Electronic XR109IA2T LCM

Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 896a145ddb2b..31f18860dbd3 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -399,6 +399,12 @@ static const struct himax_chip hx83100a_chip = {
 	.read_events = hx83100a_read_events,
 };
 
+static const struct himax_chip hx83102j_chip = {
+	.id = 0x831029,
+	.check_id = himax_check_product_id,
+	.read_events = himax_read_events,
+};
+
 static const struct himax_chip hx83112b_chip = {
 	.id = 0x83112b,
 	.check_id = himax_check_product_id,
@@ -407,6 +413,7 @@ static const struct himax_chip hx83112b_chip = {
 
 static const struct i2c_device_id himax_ts_id[] = {
 	{ "hx83100a", (kernel_ulong_t)&hx83100a_chip },
+	{ "hx83102j", (kernel_ulong_t)&hx83102j_chip },
 	{ "hx83112b", (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
-- 
2.34.1


