Return-Path: <linux-input+bounces-14464-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4951B426C7
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852343AFEE4
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE51E2D23A8;
	Wed,  3 Sep 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbt3shGZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053112D0636;
	Wed,  3 Sep 2025 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916619; cv=none; b=WhzBZqEW7r4fsdfAeUkLBEnSpl7NWv7IMkLnHPNyIhbUQW6eTabdufozFcPYP4FdRStGW5W0H5+oFNhq3bXQ9SnDORMCftlqDOTXfPrUWb4eQTpaswuTN3QI/rUakbxcKhJB+U7vKQhuPWk6kBOSdJP0KGC5ee5gdkLedruAXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916619; c=relaxed/simple;
	bh=Kt96tEsvNPNOjY+g1sxHxiuoh/475QUX+lSsCNRnQas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t+HekquwrQl4Ms2PUfkuBNsegcPHtmkWm5PzmyH/toAHuQ8tV2Wn0VZ91kEAEt5z1lnvL6JQLhr5exuHmijzkJKKPs00ZIZ11zCxRE+1HDLjprrCETlA9tZ33QAkLrDacvgZRr/XsBZt4bc4Aig1SQgDh/J6x5r+uStsPUV8lnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbt3shGZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f92a69d4so338281fa.2;
        Wed, 03 Sep 2025 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916615; x=1757521415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb9evFrTQGBrXC/a6b4VX+Lj11KItL9NSFD24NgEz+I=;
        b=Rbt3shGZm9vPoLYWdDPWqhNS+bbZ+XVdJONrMpasLemXz6rMs+WpOprhlubQppbEgt
         VNUvGDz7LATUwwLkbF/MSRpkl2mYMYii2a6vUWydjtuVxrQLPuSLkw1Xt6pf/c+F4U8v
         Cu16RT2EBNwpqLprs4H4EFgHK4EQXXwrIFi9TRcLy4dTBXPu1zOlebBdnsrMJxdfZhqH
         cIkMIx+XCNvSOYt5QQGb7z1tXhhYhJDzTMUObe/WghEI2yiK/QpYjJGJ4QVho191tNfS
         UURcKNt3OUx4sQQhHsqU7P9u58i2TScUMmrunQjjskgXWEboyasN8lDhal8c6Iftncjs
         /SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916615; x=1757521415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rb9evFrTQGBrXC/a6b4VX+Lj11KItL9NSFD24NgEz+I=;
        b=q5aXyjtRnnoEPiXZK2d2apJ4EhyxefmT/DapmvBJ1OmUU/DYefBe7WqH1IypdZWKX2
         Jboy4aNnWr08E1iwp2aqgmoOi9rSzyWLNj6lILO1K6YzO2dzxwt8oVxqy3t+niuRZNvT
         SRUta6RnzMJhU9n8IVbg+IBddTJ/2PeFiPw7dIiyNYx7M2InZeUA3EDrbuaXZ0YqpaXt
         j8GXcLnXHAOxsihSY7SZQ/lfz0r8h9iNsdqloEh3peHtC7uopmLZ2OsTwr0qrI7QNzbc
         IapeT5EGwWt6jqhuLnZbD9uDy81PUTWlnrh3QqZxhZ2QBK3HkVjlCPj+1bAapv4tAf3+
         j63Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYrRSdKiLj525T/ucL2K5y8oXhuO2bMuQRZrhy7KaeFmbv2m/oXLrkR5rmzLLMHTBOiar8gLbMj0H+Zxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHL/SnAqEml3ZGjSsZTzuTw44hmEoxz/F4awkjk3AjadoEWSnu
	o+URGLnv/lh6dt1plxEym+gtCGu2ug+FHS/Lmr91W4NiSGJcLPYzDPdk6C9x0w==
X-Gm-Gg: ASbGnctHLf9ryJ2TWQ2JoiIg+Jc2yB0r0uar6bsqFDe5p1RmZKKC8KOMsMjXTcomBYu
	FS9ehw8yj85ZPrFGypI5y4pZMWmXIyu3ZplFDuY0s43EPs4phMjjWCBgeDuc3zjDTTmvE3ZSEGS
	QfUbw+SAMzO5nLdf+gEc5Ox2KSdVv9ZGQVipgFXKJ6yZJb0oTMgZNBAf8LObC1ITODojB+dj6WZ
	N85RnTaMe342HANi0WOiDwGx5BPkvay/R+NtycuVp5KcWzeMtG3fdoQh9L3cY+dFzcfd5wEaLCT
	qew1goR7o5n4Wh9gWNP7GPeDbZ87t3tIYxxTcS2MPTN7eLha6DnE4WKNVzE2ye83+8MI1aDh6SW
	Az7usPIwg3KQrWxVq/iQdYqeC
X-Google-Smtp-Source: AGHT+IGOK/VUsUpvWclVJ4jHlzmJOtnW1cQMooinJr+riB3tGMXW3ZFFPzMBpZnxHZm0YXO7HJywhg==
X-Received: by 2002:a2e:a549:0:b0:338:875:bed3 with SMTP id 38308e7fff4ca-3380875c73amr8259511fa.36.1756916615146;
        Wed, 03 Sep 2025 09:23:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f508fb9esm10472361fa.56.2025.09.03.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:23:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] input: touchscreen: atmel_mxt_ts: add support for generic touchscreen configurations
Date: Wed,  3 Sep 2025 19:23:26 +0300
Message-ID: <20250903162327.109538-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides support for generic touchscreen configuration options like
swapped-x-y, min-x, min-y, size-x, size-y, etc.

Svyatoslav Ryhel (1):
  input: touchscreen: atmel_mxt_ts: add support for generic touchscreen
    configurations

 drivers/input/touchscreen/atmel_mxt_ts.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.48.1


