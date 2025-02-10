Return-Path: <linux-input+bounces-9904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B69A2F142
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 16:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D362F18851BC
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 15:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC49237188;
	Mon, 10 Feb 2025 15:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W57kOeYB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0576220485F;
	Mon, 10 Feb 2025 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200683; cv=none; b=Ok1vjJEaUDdVjEYVdJyOLl3tmDNaXQMUbo2Qd9XCSjWLiQkvtCCbUJTDSK0k/Vu1y2iKq+synH2ExW/RmV8iNgQex1zfQtVuaOy9wa1ONM48vo6SN/esCpm8gYxx+GrgxG0/nN/HJWHf0mxT1LzLoLpU/wCOCxkVy8HmmRz12PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200683; c=relaxed/simple;
	bh=UWXrf7WRGjQt+teMGQjTFxcuMT0+nwb9fGdcN/5Iv4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpRU2+HyW+dIX/vNmoAcSpbm/lMQ9go0y4Ulf2zdT03bDJICOTwCPth1iSV4415vY+qUxbtQhFNPANYInPAOqX2Tu6zFUlR1mvWzCiooQFu0rP2LpdjtrE7Z48/AWTY7O28C5SF2Axbrt/o34fHUCHlnpQybXI4voJ7NwTfJz4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W57kOeYB; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-307de92bce2so3643001fa.3;
        Mon, 10 Feb 2025 07:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200680; x=1739805480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qTyscYdIMBi+D+hFlA5BfNGHhqpENIsWeUFDb9bmok=;
        b=W57kOeYBU/zbnApOQl67ocRuNh1wTmBBVos6UdqH0VBK2UWo4nQz2CuyD7+HVv+RUu
         xRwCmIv+ogYRH5Rp8D6pSpVFNaYlgRHo2yAYE+VDBtfm1GGOU7jYLzUSifUi4lAEYB8n
         k1OXaF2Ye27cNLYXBrLI0ZrBg7zT/wI4xrYX2/O3UIAIjInvNREzcBRsJAQCM7jS1mMR
         UP38SVsgGQQjt8H4TkMt8/p80Hjng66jHULdR2k1Gnq6Hxlx/KHFF1q1WKKl3tagF97X
         0fDNG+TCcCTOPd42g5QdKVKRHPpJdOvSLjpG5TYtIqEwd3w1jiXdOyYR4MzsAMAS+M0Y
         GlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200680; x=1739805480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qTyscYdIMBi+D+hFlA5BfNGHhqpENIsWeUFDb9bmok=;
        b=b7vfjMVd6lUH/2ZK6jigqJf2xiMDAr2y6xIBXwQKcZzeCDvkJWOIId2KhHUv6JLju+
         aRNN4qZziVa21LgrhN44ConUlbo7ba6YBTYfQTGkMMH2Z3Y1SBhvcR/wCrtgG3Wb/wG+
         QMowBYsBI33PTlh9sk+LoBrHlQB9UUaaDQhPnSa7wCclBFAwUfOV1mtEh6x91dCWMKZ+
         meLFIDIc4KJfs+YP1sDZ0rubAWA+XvIQoUhesD/3FfH6mMOcCjFUJyk8HSqIvIdVauv9
         DlcMPGk/GdNbEgNa7NWpyEgDpGTV7S5LB5eVHPOOKloTISkSx/VHBL8LLAUbC/AIgnMM
         ciwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE2hiGjM0+kL+ijrGA+yRpp7i1syfTBy6RKuOSrsCrFrU4UvfAPDFfDxeLgNR4BvuGbnCln55R2XAO@vger.kernel.org, AJvYcCUrUeJUJguQWOe0SpD2mCToOnQeqsVOBnzRN6ZXnDvHESB2QuFj/TsUP7a0A4Oa0lOwIv3lcQvhCEvvKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Xxlc5jNs8CVtewoHhy+AgsULn2I3B6LZYoDeiO8ik0AdMEdL
	pyRSoyXcsNvTUdRwU8yTvj5TVFATMEWbZIMPlEcslDhOrKBNfcpf
X-Gm-Gg: ASbGncsnCBkoUd0AQEr/o4poatrQ52hKeQprkRiO+4TgQjPKoFktryQv+CZo2K5Jgjs
	rWOw1it1mlcoyTpH10J17EKtToM2JsRGSSezJ363g3pvR2MU5tFz32OLQT9hdgPH7zfS6eDJ7Ko
	s/If+5iWzldI96zEQP3YMzVQkuTCT0FxC20/YoFAKvkhoToe5jVFmNjxEeAIjPFmIEU+KfZXMvH
	fy9IHmlqkHE4xA5wiWQR7h9Nk7hZJoRuhI4TbRBr8P94Ww6fXBc0cA0Fo8/L34YJxeUclTu2i8x
	YWB9iKYEm0aZz9qX6X+zO9NaRd5l7BsHCQzumIJeX8q7tXZVuOZmP+3kx7nSJQ==
X-Google-Smtp-Source: AGHT+IEE8BmQ+rgd8T/Zk/DGc/J8RquLoY/M9tzcBuWqY08uADI1yJBh3T+e+FGrJVf7wGQ7/bBS8A==
X-Received: by 2002:a05:651c:1503:b0:300:c10:7c33 with SMTP id 38308e7fff4ca-307e5a88818mr22115271fa.7.1739200679762;
        Mon, 10 Feb 2025 07:17:59 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178201sm12090561fa.16.2025.02.10.07.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:17:59 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 1/6] MAINTAINERS: Update hid-universal-pidff entry
Date: Mon, 10 Feb 2025 16:17:49 +0100
Message-ID: <20250210151754.368530-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250210151754.368530-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Makarenko Oleg as co-maintainer

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c37bb8f083..174d25d87371 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10258,9 +10258,10 @@ F:	include/linux/hid-sensor-*
 
 HID UNIVERSAL PIDFF DRIVER
 M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+M:	Makarenko Oleg <oleg.makarenk.ooo>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+B:	https://github.com/JacKeTUs/universal-pidff/issues
 F:	drivers/hid/hid-universal-pidff.c
 
 HID VRC-2 CAR CONTROLLER DRIVER
-- 
2.48.1


