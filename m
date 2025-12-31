Return-Path: <linux-input+bounces-16748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C150CEC179
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 15:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 304513028D81
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 14:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D9F26C39F;
	Wed, 31 Dec 2025 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BEgwypps"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1982737F2
	for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 14:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191748; cv=none; b=oaUq+s+K8P+TPtvw20nGmDlhlLu4WF6EvlpKc9/X4Mi/BPEE5UBMamLrFssh65ZSVXbw4fcviS97rlR5NbyIv0nuvGfwpzzxgvMntFa5Tw+5O4PWrIxFsJXfNuWi1jk5p0SmLE0rGIWG/cyfAvlRSHnNY1pyPsh0G5pUH0ExIos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191748; c=relaxed/simple;
	bh=1vH4KrFv8xvMv8rpRWUougXl8BcRT5RLGVtAo9ej2xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxWCfakAFmQ2GPpqXefD1+0d6OUltGWZV0uxVStWfFvJmVIfsYXll+U8KmuxKMZOT4JsdiaCVjN+hrlEAeKRL7T9Ismx076dZ6/4DzpQgg+TMcmlxsCSnyPB5nrUEGu9lUrIR7P8c1s/k2PILJTv9YVaodiR751savpTS7PWN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BEgwypps; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso67807055e9.1
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 06:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191744; x=1767796544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34pYk6l1cH16LeyZVvdM/XV6wo+Nk0j+m4GLCKEWRwU=;
        b=BEgwyppsTO/ChZlahFILnUfRCD3bUMzIHos/mixzW184xMmpqdJ0JITUQb6QX+owhW
         nbuaLfFmuzPJ+An09DnY41cPAGMPtBvIrfQpzrVvz0q1I8RBAbtPXD55JR7IRqvjtUCP
         csZWWjfj65RpaLurWldrumjwUW/nC3Rx1GUM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191744; x=1767796544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=34pYk6l1cH16LeyZVvdM/XV6wo+Nk0j+m4GLCKEWRwU=;
        b=U2UECayMlNK1cjGicENfQJAgfOoOddrhgINp5sBxU+7ttv/su+IQoyuoxiNgQmTtXN
         UAK16tjBmYeVe6ICtz+UjtxRwvhCrsBDadw/P5NqFWV42AUfvUfmdsp6a/qvdAYYm2EC
         HCDUjdLtSprqhONpJox71+PIsRyRVjU+zta6qyeNfbG+ku7ty+vZGHX1v68QYJbC1sCq
         NNIwLBwKd6s/hhEFfZ8/mW5YvuxpEGS93oHRfpJkmu+mF9uMMK9eyE/Vdx7Cxmjlm59V
         +f6C9YMQRNU76M1Ntjg8QUky9Eti+hqAokocKFwPyTXWXvTtVJW7IdleNoPTfjXGJDh8
         TTHg==
X-Forwarded-Encrypted: i=1; AJvYcCWdWfsPJsJ5ORZX92khq1tGOxIMxzeeprXAEP+Ln/rWk0p+O69Qf+yIU/BTrxSNE0TI3Azu/c/yPGzuFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDIpJuzR2nt2hZPffI5GpM9fLZo9ySwQ/AM7dUhmnxz2ADvYMs
	AAK55d7+RF4x6JsQZel6AZCNSrWlydh1aVq62ibaOuIa30vz8MYWp8HnvQ3ObTHakA==
X-Gm-Gg: AY/fxX6bF8OkhOGi8XKSq6mzeHkAXlaLNytHdnvMVRHmpN3XE9PiitPQOlH7NL4cwmX
	JTJEQIKxxv7DTTauxUzjEF7a4Ej7uVs4G2GgWPyFcu0NTH/xhzvKi++8QkOEPMBg06ZjtygghCg
	H6kspvWqvJJc0Hy/cbbvp3cQgw41oP1/IcAaxOHsEqT5+QTSJGdV2vvKC+0lV6lZNCBXHOh4Mvi
	cJ3/nGbBjKo6Qjfh1U1b/BJEI1QzpK4WrZTx51Hb9O9vz0wq7C2Xn1aeWRxvyYsOUanpx7/HJIj
	Kl6ykL6zmRsTY/hfgs9HLacJ5mrzcV7fAfvM4pnI4oWMQsOd+BMSI0HiEVCNZnqCtvN80U+72pz
	qCCqyBRnrkVzuJFIFc2zYDkhV9rT0M9k0Tb+1t2muOXMkcogr9tsJacv34uun+Uumc7X2c1+hmP
	7Atsj7yY6iM7Q+gzgRtK8z19hUQA==
X-Google-Smtp-Source: AGHT+IEiRq6V4CAH/S2a6MvgduONiJuKUV1PONniN7Ix1f5FJkAX+d5WlgDqPZJkgHzRkh3uELoZxg==
X-Received: by 2002:a05:600c:470a:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-47d1958e43emr342849195e9.37.1767191744550;
        Wed, 31 Dec 2025 06:35:44 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:44 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: google,cros-ec-keyb: add has-fn-map prop
Date: Wed, 31 Dec 2025 14:35:37 +0000
Message-ID: <20251231143538.37483-2-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251231143538.37483-1-fabiobaltieri@chromium.org>
References: <20251231143538.37483-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the has-fn-map property.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../devicetree/bindings/input/google,cros-ec-keyb.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..fa24b1cbc788 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,14 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  google,has-fn-map:
+    description: |
+      The keymap has function key layer. This allows defining an extra set of
+      codes that are sent if a key is pressed while the KEY_FN is held pressed
+      as well. The function codes have to be defined in the linux,keymap
+      property with an offset of keypad,num-rows from the normal ones.
+    type: boolean
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
-- 
2.52.0.351.gbe84eed79e-goog


