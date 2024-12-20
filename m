Return-Path: <linux-input+bounces-8709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9E9F9A6D
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 20:27:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC0C1896DD8
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 19:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576FB221475;
	Fri, 20 Dec 2024 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="um99S4FE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3621A438
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722661; cv=none; b=Aq0EaQYDYbbwQkgDC6lxe0RknLArB//RpaiQbBA1JtFPLOtPAj83OUdjiQDzLZ3D3ReKZXYY+yIEz4GzSbJCr8ETUwDGUSRkb43tnDNOBRCd+h82KkAcF/Vk3FxJTxBa+7hKKx9e2anCpMK5yzCRGKkEVhTcvntJa6SDJ6P4erc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722661; c=relaxed/simple;
	bh=3vx5gYcelpaXM1Lk46Og0gQn9QMqtDZC5kvWxPoQ9Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DAxTq/IQMxREoOECq+d/krE47qRBs1leMNitwAycFE3RYG9PvVk9PzngeyXVUHVwBcoTZQREgipgQHdGlJJRriICAPFyqhYMB+ufgGdz8WsQ9l/jrLWOvK5JKaU5Vrax73vg9EmyOWSrOx/iBBU/n/7HEVIDfsKJ67dOYz2EfN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=um99S4FE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso18134525e9.1
        for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 11:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722658; x=1735327458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXBxF+uC8T5nZECP6w+qIgbRJ5DNVmfP/XFO3dbvFGk=;
        b=um99S4FEQxbYMmjxSdbBZjXoyYvMFRMlIGchcm7NxvmfJrS1NQ1+YXrsilLBMVd3Ux
         JZVit47EU3y4DYbsV7bl7i1xJswOReE9oKzSE5iPae0HG+eKqSHXgqIJUKJC2sp4CuI8
         xfm18ASsVuEqDEj4UEpVg9fLgFefs0Oy1Jh4IomFE/RoSHpwegbimaOrq8cxwIHA6bFF
         MtiGU+3b5GhZL4da8PHefTzJdWQQGFOFvkiNgweFyPDer7HoDbFtFveYwvd523r5aCgq
         Y1SBzef7mow6giliFeKNI6fzgnBxPrwRkHQIGUtxfoYFpjTjhCOSIvIYQRDI5WRxdly0
         6IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722658; x=1735327458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXBxF+uC8T5nZECP6w+qIgbRJ5DNVmfP/XFO3dbvFGk=;
        b=MpT+tLPc6RzdBfAZPrh1QJeXQFt1AFE+RipWnNVTPp9gD6vXK3kkwl1GwcJUNkcccr
         Vg7ZN2sYXvefIIOEETFJPKECgNQaNNYP7bvAZhnEfNEz5c0TfSfsvvNC8jeRLw+byejo
         MPE3U/jKwGUjiRL0v5Sh128Z1WaQxUJU1bP5VxW7bsaqDVLHRIHJ4pKjLM7iJXjPFfRg
         F/XbnMDtjWFIC+ff+lduopHCY/SWVH2ZhYMAR/pOtRIcwuFNdKuCtkjhpnXjTzR/PEdL
         ymy5crC5nOYycLW+FvTcbiu/MESVrDDwK2UaBY1pUIOg740C5ncAWo1HbTfUeMSe139D
         K+HA==
X-Forwarded-Encrypted: i=1; AJvYcCWR80RkXdbKWA3KZKl3h9NLuthGQVnCUvEErjObfnxJiN5xNAEaPK7HfveXOMnZwlR14ktith9qHj+o7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Io9kCkTh75VJ8dH9LazUhtXa+K+a/S0epIIYOEnPU7iYydWS
	uiQEXXWKRVaKmJN2P4WYUSlJpQspiVhL1QwX9GxE9ta1pt0P9+gvyhu2g6urU8M=
X-Gm-Gg: ASbGncttHsSxCJe/3afuEreDQVfQXcoJJv36zOMqiSAUK4NkIYGqVTduBdqA7JfXOrY
	tWYPZvNzMOxschuF1eUay6j81LmF8/+jSBstkH9vhFysP0+P3BGXK5IlSHKFlWRpO4yYSsvv0Pm
	cSg1H3HnIAD/ksr8kHL+4bO5DlASG2NhFWN3TMAZREQtcyrCqXv+ESCCyr2tXBS6q2YscbpzoCi
	4FYpoyxmA2vqB86g+CoHFP0HKMufjIK4KIUgBsK+jIGalwSv0PbGBz0OjFA+BYV3hGGdyXf0j9C
	IRI2w1skw9PpBg799WkHzGcFuIPuizmfdRYng1dIfGd37oYNuKEbYg5xiE/22xRL
X-Google-Smtp-Source: AGHT+IGbsj/mVtqUm8aGFN1a0RqXHJxcyv/clQmFPrh7+nKr5szJFfhpYPU5+6pNpJcbyjPe1s6CMA==
X-Received: by 2002:a05:600c:1d07:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-43668548986mr36502605e9.4.1734722657689;
        Fri, 20 Dec 2024 11:24:17 -0800 (PST)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-169014-cust557.vm26.cable.virginm.net. [82.47.146.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm4710745f8f.46.2024.12.20.11.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:24:17 -0800 (PST)
From: Terry Tritton <terry.tritton@linaro.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aseda Aboagye <aaboagye@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH RESEND 0/1] Do Not Disturb broke GD D-pad 
Date: Fri, 20 Dec 2024 19:23:17 +0000
Message-Id: <20241220192318.1174945-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, 
We noticed a breakage in the android test: CtsHardwareTestCases_cts_tests
android.hardware.input.cts.tests.GameviceGv186Test#testAllMotions

I bisected the issue to:
	commit 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
The cause is pretty clear there are 2 separate checks for:
	if ((usage->hid & 0xf0) == 0x90)
so the second one which handles the d-pad is getting skipped.

I've combined them both in the following patch which works for me.

Resending with reviewers tagged from previous discussion[1]

Thanks

[1] https://lore.kernel.org/linux-input/20241011195808.2201-1-terry.tritton@linaro.org/

Terry Tritton (1):
  input: fix generic desktop D-Pad controls

 drivers/hid/hid-input.c | 37 +++++++++++++++++--------------------
 include/linux/hid.h     |  1 +
 2 files changed, 18 insertions(+), 20 deletions(-)

-- 
2.39.5


