Return-Path: <linux-input+bounces-9992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4BA325C8
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 13:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E553A82A6
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 12:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EBD20766F;
	Wed, 12 Feb 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7TIEy91"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8E271829;
	Wed, 12 Feb 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363058; cv=none; b=bgtJYKRC4/fP/GSMWDqk9zgsVBTJuFuJMpl4UVCmbDCHJPRNVrH2GKR5of4KPdRPyqwoscpbdkD9d75isxKknxewKgSiLBTEPbyBx4lZscoVgqhTGMhRNVL4uRvyIY4WlB85bhNiw79YLSowSEs+pjnwmK2usJLGsF/BB5FQHPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363058; c=relaxed/simple;
	bh=Lq92TNbdy7iFBABmyM4Tqt+wG4oPSZ8i+xhZzcRzluM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d5DpwIOnclcWy63giYbcxl6bwfOmwc9F/gF+LkfjexQK/TSqPSP3n+RXviAU3gN4++inE/yjAyXl0qRHblUCaNRpewh1SDC+rWfGuN7Bhd1pT/Ma1uZ2LIc7v7KH7l1qIHsn7Ooj1CZMHMEvVzBArCbM6AK0dC4xWz/1QTuS5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7TIEy91; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso3048493f8f.1;
        Wed, 12 Feb 2025 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739363055; x=1739967855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sf0fCUR6elaxXWiV1DtQUoY4//OKzn7UVKTG1pmy2mI=;
        b=Q7TIEy91dqspc1GfyVP2LW5nIr0EQyGh5ult+JXAmWIQGEBzR/JvhvRO15wksiUlpi
         IGaDkF7UmxrI7exudkypNKiPi7ZWiAwdIw9ulaGiz83D8fP5qZBzjAS/JxEKHMoRzSRT
         OxiUVX9Q5g76qwDKMoTUQAuklJA/PMlSm/kKs1hQEwDPFqKOZqcJGmFeUt/SETSfswJe
         0EY6P9zSiY6nZ0WPFSi48jEJLjG37WW8CkgQYRJxQFT3wy0QXDW5XAimvcYA9tGEc6nF
         MozRDUl8upjk3jYIauMueO8t/DYH4LgcKZQ9CUq+ABCgDsBGLsMF/oJvpKu6HBYRrTPy
         kRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363055; x=1739967855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf0fCUR6elaxXWiV1DtQUoY4//OKzn7UVKTG1pmy2mI=;
        b=eE2TSKXRVWelUlBzf3V3j902TeTn7jBpbDNGFwSbZjrgeVRy6rM5P7h3WLrDG8xj/P
         4tGrmXuKxJ6jKtte6rJpAiTSj6WjJ4wz3tszGizxREM/dtRBS+AsTIvn6TuTpZ6X3ds+
         RIZ3FQUjki+BCeiqdJbQxGT8UjOJmnbDTjO64Nr0Ennbtzg7Mw4oK2uYlp9G247JDJ3c
         qlhM6b2D5+XjGoDKcLkecqJMAQCircIPIyvyjGtql284YdlMVKZnWKW68UNv4rf8PSj8
         IvN8mEFZvFpJsMkHtQo1wpRIIxVv7gP4pYWeWLWfUvfBrNJO8fgchswNEMAoJ/1U+oni
         Y5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAsBasxL+48+JdT1e0l6ifS16j73eoGZO7FtuQdGKVlpI8ics9/oFe2hAm4mzgTo02g/6XZ6PjK9TYCA==@vger.kernel.org, AJvYcCWZY9NILNv82CiOwbtPJ/nuCqPerfOwOXD0mptAcmWIsBK0/3Bd6BqjAZ6oEzodG9Ki+fjLVq31Qs1/cAsK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt3OxhzS1rzM8o13RPLpvdJTOimPQyfhlnNiG50rNO1pypIwcG
	E3Eqii+HxekcRqoH6tJ6zIAL/pT3u9WVKbCSaB8I13h/0CDLlfKk8o3UmmBuhJoVAw==
X-Gm-Gg: ASbGncth9y1xIFaSUouT1/NEsUnZ6nzcDgNbeTPVNj9qzgfydgJ4Mfn452fRpebwV07
	p/CceLfg8odBkLIinUb0Q+qd03/euCBDFKP5eAhwIsF64j3ixKsLd43D3awWr2G6IR31Lw7s1K4
	MYRrSQdOCAljfX0ImqZ69G+u5+IrV2rElI2piUktyL5XXVjQXZ1yK0NV0k4QY8DNvraLpr19K8Y
	IV8ic40JtEPKEmrE4H748fR6kwZKLWfsB3GQd4T41NuMY7yG622NO1cEqTbJAlYY7tpCLGzamg9
	SNs5GrsDgaHYNLIL
X-Google-Smtp-Source: AGHT+IFB5hyOEVCQDsErW1G67bm7ykKDxXt7eMB6BeYyhuCNqMXc2bOwHBQPLVUhb2eJQCqpi7xn8g==
X-Received: by 2002:a5d:648d:0:b0:38d:c9da:d0d8 with SMTP id ffacd0b85a97d-38dea256ec3mr2407904f8f.9.1739363055332;
        Wed, 12 Feb 2025 04:24:15 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dd9a6153dsm9805592f8f.60.2025.02.12.04.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 04:24:15 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Oleg Makarenko <oleg@makarenk.ooo>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] HID: hid-universal-pidff: Fix spelling mistake "sucessfully" -> "successfully"
Date: Wed, 12 Feb 2025 12:23:47 +0000
Message-ID: <20250212122347.495701-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a hid_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-universal-pidff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 5b89ec7b5c26..001a0f5efb9d 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -104,7 +104,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
 		goto err;
 	}
 
-	hid_info(hdev, "Universal pidff driver loaded sucessfully!");
+	hid_info(hdev, "Universal pidff driver loaded successfully!");
 
 	return 0;
 err:
-- 
2.47.2


