Return-Path: <linux-input+bounces-5064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ADF93343B
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 00:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C408A1F21532
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 22:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BD41E480;
	Tue, 16 Jul 2024 22:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOpAB1eA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7C14A84
	for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721169065; cv=none; b=X8SSxCxAidSW0bqBC7uFAanFDmVRoZgqX+DIkmFI/71xW/FIjyaOojBMwIm/6xZSGVOv4ZU8hKkvAPT6qbXIFdriEouh5Lt3T9B0tQs3T5uFUal0Fpxp8Z3zYsBfC037Yd/Y7DHbpy/br7aQfykUSH4dnqhMAK0jswIA+WJxg20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721169065; c=relaxed/simple;
	bh=/h6+Ma2h2WukpUm8DA1AfVehF4qj2KzM69cAiuTDCY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHfqr8AsY099BJgAz+oObPeieRxEDIYxRlwXKEEm9iXOI9kxato8IEHqagqIO2qKxNQohRckAPH6MrsMZ7GSo999QGrQT1ciABThZ1AA40n+yLWEv3NXWHH9/jCiiGbp8zzaNC4f2Fc1OrcsajWXS4ep4w/TDkqj1LhW8bQOHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOpAB1eA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso45360025e9.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jul 2024 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721169062; x=1721773862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9GZmNK1vhhaaSzTt30fSOp8pt/lo9mfZ8xUnCqXHys=;
        b=kOpAB1eAwirDBYuPLBrHPJtSRj8+ykHfZOHJ5e+VSd3T7dshnA0McVKpZdqheWj5Ja
         ckQkXdA3nxQfPaUiwYyaibm5MvC5bd3RFJyRSCzA8trhAHDPC/vgF4t1Ia0GITQW1E9k
         yk4dqMGf5hwj1KkOp0UgMODJLSi5IuwiZYc7Wl3N6n0JGBzAATS8ErLc64iAr7fS5uU2
         BjuqIC1yj958xjAAAwutJqDVgUXgkG5mpzUsQUWyFmJ/8m4JfZc3GaCCCmALh3tOrpT5
         niPYfosorWdxfO4wd0kSQGstaeL2aMsU3hNUBe23Ct+eL7jv+La5edK0/7DaEksUjQEl
         B0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721169062; x=1721773862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9GZmNK1vhhaaSzTt30fSOp8pt/lo9mfZ8xUnCqXHys=;
        b=l1F4zZ9JzqB5B6RMu8eBdNlYvGnbm0dofDx9VyobanNZDzTDMSpQdf/aWbrjGhE7E5
         nUKAEsghKyoEaevg4k8TgCiRjRsLBnVbOHx9LvrxM/ABSsYudg8HiO6y4r6sGU+dPF23
         9SpvAEC/TtExJbV2LbD/SHzy4FOVdy4Kh1wx4gNcZjDajPZxxtnsIhNWVCvbA2lr1ieL
         C8FPNIqOJuQ/OKC1mDBCLrbtYoVIPw5Km5uzj+62D+Qm+PoTPVkAiorF7E3i8J77m4+5
         9TPDqSDCHAtj8m1sqr2fuydVfzfnGpTDDUfLotoRjKeer+da3w+vF5IMH0V/zZ05knN/
         sD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoU31K1llbfV8zld+id04rcqlp6YSXkKBRAmD63Y5QEWWX8oPV/xYrQH7l3CvYLNSPvmYUecaA+GR8M/OLkqu0q2lMKYuiZPVISi4=
X-Gm-Message-State: AOJu0YyIhF3hMhMLPxHzPpFLkhWLBytvHIa8DfJaIVfBfwltJC7ED7m1
	wzkxUpLEATenm+EVsa/X+WWAQhZNdhZ/vzT5ch1Z0/amD5SArz3h
X-Google-Smtp-Source: AGHT+IH9DpQHrllL2eXUfyD83BSVh7/+UuR03iJla6VoLozb3rwuKQmck5yYcT96ZjouA+MrVTlexw==
X-Received: by 2002:a05:600c:4e4a:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-427ba701d25mr21380795e9.26.1721169061594;
        Tue, 16 Jul 2024 15:31:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:c010:c300:105d:dc14:8157:17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef57aesm141827885e9.45.2024.07.16.15.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:31:01 -0700 (PDT)
From: Dmitry Savin <envelsavinds@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: terry.wong2@yahoo.com,
	Dmitry Savin <envelsavinds@gmail.com>
Subject: [PATCH 0/1] Enable touchpad for Lenovo 13x ThinkBook Gen 4 (GT7868Q)
Date: Tue, 16 Jul 2024 23:27:56 +0100
Message-ID: <20240716222757.22931-1-envelsavinds@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
This patch adds Goodix GT7868Q device support to hid-multitouch.
The device is used on Lenovo ThinkBook 13x Gen 4 series of laptops
and have incorrect descriptor that hid-parse fails to parse
hence device is not working.

Terry Wong made a driver (fixup) that uses report_fixup to correct
the values in the descriptor. This is mostly re-using hid-multitouch
code. With his permission, I added the fixup to the driver itself.

Open to the feedback if there's a better approach to solving
the issue.

https://github.com/ty2/goodix-gt7868q-linux-driver/blob/main/goodix-gt7868q.c

Dmitry Savin (1):
  HID: multitouch: Add support for GT7868Q

 drivers/hid/hid-ids.h        |  2 ++
 drivers/hid/hid-multitouch.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.45.2


