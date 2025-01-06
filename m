Return-Path: <linux-input+bounces-8975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B5A032EF
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1AC31626BA
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8151DF993;
	Mon,  6 Jan 2025 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJXsW8sC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BB21DE4EB
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204099; cv=none; b=qQlYAIX/EwMNnhY9vcfLptk5JU1vMd/APXJBswxHWG+HV3oq2ZdjUVUT6xxvd3elD8yDnxNLsDWXWV2vCAZs35oiVccvjLtcWCgD3iJhMzp6/UR6iO7se9vyv7LzQ7P65d2hzkhWvIO6fHbIYemunv9YgxUlJEZ7gWI/0YyT/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204099; c=relaxed/simple;
	bh=PYkpndLghyIqImLV4tfMkW2YDKNk+7UerwgGFbcgWgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOkAq6vHyS1CrFpdfdELDuatlIMv+AxrE+FKfqV7ulynTvd1wnpETyTRGYXFoU0mXgL4bjrfgedl/8rndLbfh62v2NJb2RpmxubI5qn412eWIQfNDYRF2zowhpG3owHRiiUo4QQ8MIEHDtxdea2QUnNPdZ3lLZO5G5clfAmOyMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJXsW8sC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43621d27adeso103323445e9.2
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204096; x=1736808896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYLpdHh4E3mL3Yn0cu92Bsjy+0bTJ73f3oV0tyORGVM=;
        b=WJXsW8sCP3lSR43g/Jl33iHz31Shd9PTyOPLQJS1EkeqVHCXAXo1872Kfs8rsCmsbV
         tFjEf8JxB+anhO4yDqP/PnyOlfFnufc7Lg75HljmGL03/ee9gmox+e0OKKCFcY4hJeHQ
         5ODlC7OexZU8W10or/JFosRZGskbjGwSpR9TAe6Yg8IkDIoin3vXHqAqOurjwDwUOYYZ
         HmYFtQTRVWt0CGcqC0bC4K9AWWbYo1AMm3JJhaQcFlQmRUhnPqa1eCT5iat/EwM6LDAu
         Sl/6HXA1jRhGu9g2OlUf2CXLd1hINmEDfMzKX1Ue2lp7Osw3/N6J5WaVvTMS1o4RIX9A
         REJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204096; x=1736808896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYLpdHh4E3mL3Yn0cu92Bsjy+0bTJ73f3oV0tyORGVM=;
        b=r4rXCUsDX/w+iSG3/oaWjvTQ4hfpcw3ltIzO1XRxhVKTzLlCsDNCyEGLy/VAXutxbX
         gkszVkodO9kcy6KXqB3F42f76I16J4KOlVGKpgU7VSmH0P3xi4rhvtzOfNKV27KVejHh
         F7oo6pSImJLywgQ8G/SICMhlLctdE1AOlaMj8fQqtYYXI/tpHArm+k3SI/HFAOobZOHQ
         xvfiqnY9ZeAYUqyxrYi/yVec7ppZRdkIwJwcn0GxVndU41dvMMlg4ArvVVJeYit8NDuL
         gz1gSqIyVq656jjtL9OIlMOSL6djTDyKxQfoq0SIKwQrZt+lZguopPo0AlbtA6ebkTk4
         C5Bw==
X-Gm-Message-State: AOJu0YykGd5Q10c5EGfgC0RZaTnT8HCCBeGZLKcp1Rzok5bc3nQYo2gK
	k2N1zoTlnz/vzUi+o+BnY4ME09r6yfMXlweVRxnhEUw18ot0dVUIwuyf6EKWN25XcA==
X-Gm-Gg: ASbGncsLgekJfdp+IGg4JPDjUQKD5i9mW7fT5Cw3Ollfa6NyrmggHqMCB+IlsNoEo6K
	m62kfJ4QMGWv8scULbZ61QYiFco+qKr573pzASERvRQhcpGFGwyZ8HYK0y81lBwtAnjLNWAw4PH
	vXgct+Fj9W2Jkz3B3VJcjxqXOWwbE+MnG+7JTV6E/8kvXHq4iMan9uYaOhaGy92LTpArDqhHM57
	QQxb6jZuKtHJcoQFMbvo0UfnYprRMtaLwZiwbdyQnlAPjQ2Uldh7iqiLHNCPEAXl2PK
X-Google-Smtp-Source: AGHT+IGbyKgfGB7cZv6e5iT3Vwf7ETRjvoVxdBLDBH4BnsedpSmKWJUxtgmtYicPtHZelA/11lr/uQ==
X-Received: by 2002:a5d:47c9:0:b0:38a:6161:2854 with SMTP id ffacd0b85a97d-38a61612856mr15351033f8f.1.1736204095618;
        Mon, 06 Jan 2025 14:54:55 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:55 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jack Greiner <jack@emoss.org>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 02/10] Input: xpad - add support for wooting two he (arm)
Date: Mon,  6 Jan 2025 23:54:29 +0100
Message-ID: <20250106225437.211312-3-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106225437.211312-1-rojtberg@gmail.com>
References: <20250106225437.211312-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Greiner <jack@emoss.org>

Signed-off-by: Jack Greiner <jack@emoss.org>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8a02b9a5ef79..ceb08c541b18 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -380,6 +380,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1220, "Wooting Two HE", 0, XTYPE_XBOX360 },
+	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
-- 
2.43.0


