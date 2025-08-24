Return-Path: <linux-input+bounces-14277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD78B32EAB
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 11:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F98D3A738F
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 09:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C46B24E00F;
	Sun, 24 Aug 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8c8cagX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A5221FC8;
	Sun, 24 Aug 2025 09:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756027194; cv=none; b=OHi3DCufmovyNz3oTSlwdC4htXgm1UA2mlTehXAETOVZ4vPzVV4MxVIe1nf5E19kYmLvcWYUU/ZfELXmSM4gnUSZ9pIdQZpUHcUAwUFtU8tEHhKuD0lx3dO4OLAY4c0HxtbXuPN5KtWT2PgwsfClzE7NIAlRYGvDrGMvohplsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756027194; c=relaxed/simple;
	bh=Xc0rFLtXnERzBghwNqjwjIWQ3Jz2QFIxiamdTT3BRr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E2hvQQV7+c3lKiv1+LSepn0xxyz9hiJ3oYmGaEK2MmSf/5o7ZjNHks+YsCU54jBT+BCg5HxUAd1yXCAU8Nw15DI7+rQkTFraM13UWHeX4QsIyYPqw+mtStKPeEXAeQsCc/b41UmwpRZvxw0waWGhxQDpu3ViqPe0RpuGadzkEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8c8cagX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61c325a4d18so1831538a12.0;
        Sun, 24 Aug 2025 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756027191; x=1756631991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwr3CagSoS9NORMuiYNSzeUajjdGZr7+Rut9vr3Cp58=;
        b=i8c8cagXCYI7g54rZ7dqx+4jfjAaHAzt7V+onHmiJfgbzQLTXswKzA/WgNVGqBN4RW
         4FPQMb973XA/k3NZC/LGIxYbl3wmdv1dJsNYeVZJtSJO64myx0epCZFqWGJCzu3XKrZQ
         XlgQ2DYtKn/b58NkLj+6+JYy0XxDeDL2rTufU1x4NjuMmnWSi9RWx95UfGb58sQxUamT
         g2p9CUEpnQBiJ7CGJ6utuYLjRSe1aJdxsLLhA3D2cSiHsBYk2gs0ASMrurquGXLTqdui
         cn1E0eroLUS8bQHXLt1yEt9yGf8sJpummYPdZBPszQdnM18757l7yWzSU1L5T+dygyGm
         K5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756027191; x=1756631991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwr3CagSoS9NORMuiYNSzeUajjdGZr7+Rut9vr3Cp58=;
        b=t5D0qMJ2Y6lyWuwHS7R+2psuiztavIBqxc3m4evVM/+dQ8li8YqeI8rF5ckVOja2Be
         4cgPyEOfCFAnTnHosuEAOj2Cfy9asREu2nq9bsvpykFUhG77bO96uAzxXcRWpM+JNUYP
         W/jGT2T2whcPAMin2Gg7SPcD24TpgFLQ+9X86Sy5AfK260qJ1ibClxZo0GN+NtngX2pp
         mse7ltmUrwECZ0fDea/O9X5mh3CMzn/5uYa5UDMlVJytAwyRu/sGXCmYoQ4gX83sKJYn
         BePRKtGr1Z+aSAFC9omibEbz9peNiydJOFOwzExO4iWVFlbilfqQPa2OiM42n5ptWuH3
         NBvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRMiodT6PJLl+yxW3FLf7fzMH9/9myvxTqICatNxb40wWwCH8gJVjwpT7rdCc3ZSimcy20gIqFayaj6Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gX7UxDVEcaxdRSbvd2R/L48SQYfJNSVS7Qfrx6vc6SqG+f4p
	nalauVIqUnc5koXXY8kH9qAUFTyuM6t/96ejPEhZVATY/LBXj7rK22eZ
X-Gm-Gg: ASbGnctCq7UF9i4j2IJQ29u67m8ytBobGhWSELrNm0FbajEITUawAyHbPRNRK9tZyiM
	5d1p0RGZ7JVPskCyKGG329wZoDfqj+SfVfv7BI3tyySCby7AjAwTZNxEDaHcyZZXb40YJUCrmZt
	rJkL7/hTQOGzQrArJUD4otqU9F8BFF1P0LU4rGoLiJtkB79OcrpgHLeixYVy2Vdg73QkeRXqcTv
	ZfqQDrHPUBT2WPRMjF4lGJjmNB5gW+OhX7YdZKNMl15qgYFdFnEdBViYom0OlBU8GLVYFlOEvSS
	PtYD2eePF5xqijWYZOnTuaiG7E+DWIbfwtGg3P7Tb//DPwxHe5fBt0RbJywoIJ1VYnNxYUxi0j4
	T8WaRTuMdOiADpg==
X-Google-Smtp-Source: AGHT+IGa/WGupyYOl/LtSn8uDCWCLmPH1dC11IF+NzOdLEyQIg8InISz7SXQoB2IZHxOahNNY6jPeA==
X-Received: by 2002:a05:6402:4401:b0:618:1250:ac54 with SMTP id 4fb4d7f45d1cf-61c1b6e498fmr7881849a12.21.1756027191097;
        Sun, 24 Aug 2025 02:19:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c30cf22d5sm2970156a12.0.2025.08.24.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:19:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2 RESEND] input: touchcreen: tsc2007: make interrupt optional
Date: Sun, 24 Aug 2025 12:19:25 +0300
Message-ID: <20250824091927.105121-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case tsc2007 is used as an ADC sensor there will be no interrupt
provided at all, so set up an interrupt only if one is present and
remove associated warning.

---
Changes in v2:
- commit spit into making interrupt optional and changing message typefrom
  warn to dbg
---

Svyatoslav Ryhel (2):
  input: touchcreen: tsc2007: change warning to debug message if pen
    GPIO is not defined
  input: touchcreen: tsc2007: make interrupt optional

 drivers/input/touchscreen/tsc2007_core.c | 30 ++++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

-- 
2.43.0


