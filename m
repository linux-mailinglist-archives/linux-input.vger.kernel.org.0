Return-Path: <linux-input+bounces-6916-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C12E98B3E8
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 07:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A8A2830D2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 05:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CABD1A4F2B;
	Tue,  1 Oct 2024 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQdSH5W1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1956736AF8
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761900; cv=none; b=YBijHwxo80s7Iv9dQO3gKuPleDy+2gVQ005BXFq560GOyxLdMIlPN9pF8D+itKPSJNfITSY9htBp0VKtUMXFZwyBWXWvhqHvMtDLZA2TP6hR15tjJhQR2kzAPmWGhlnY+pzEnbclReHAzZVLEFQVcZ+MdTvxum87iaif1pM7qfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761900; c=relaxed/simple;
	bh=HBenTlUzAAfTdce3800VvQ01rfnX1fweOatQmtG06E0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DY0Comc8FGp6OgyWu8cLsZIh2BcIwYxW9mhpCiQED2XnXrdd97zlfHHYGLMbNnzHEOidGCtuNce7l2KGW1SsrgE821of5/RYtulXkobLGdidfyAP3C+eDEZs+xtD+D6YrQQET1c5JLZlbZSdLzkBEj6I0SODaTKtZvIkE4IA204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQdSH5W1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-718da0821cbso4030154b3a.0
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2024 22:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727761898; x=1728366698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7x9YBqXmkSYQ8gjj/KkGj2dWMgs4miED5aYPfXv2ZM=;
        b=aQdSH5W1BLFQbZUtsk7/XpM+uU3uDdmIlKA75bjBF7qZNyH7aYGZAYXIX3XAeDbndq
         HzyaOBiZ7iH6No6Gv8+pDlxZJa1R7Lvc+e+W8k+6QzB9rj1hkjKzD2N+7ri51IbGElQR
         L1/ErKDkVdLFJDl5BzWBnNtjD9HvFQiQlQtWJAR4cm8bDcF2zzL+6qqgEI+Tl9eMFwsz
         CLm2jJsjDpEvtjaMxgKkbJFY3fb7ap8hANf76dvL+8FsoxEP2MaO1B5TyHXS0BbNfHXZ
         vR9KUApw0b0+Gp++V96vMh6HbxWGS9KQHop4aVsE5FRIshtK/8ZL2nlLb2Ex/LJm8zNh
         pQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727761898; x=1728366698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7x9YBqXmkSYQ8gjj/KkGj2dWMgs4miED5aYPfXv2ZM=;
        b=EiNy8R9UbbaprH0EPK3ryztg6pR5pMF5Az+yCP1EaNqNLIycNU6dyzpFg82C0kwIgx
         k4WUN38xi4TyMzI5UNczUAbgwzcDdE5pYUGlF5CNzSgH3a4uu6zPo+89pM2ow+6sxUgz
         GOZEs/PKeGtOn2rgFPkhPixmjZTSoVr4CF+NbR+VyJH7RyYyseT4R8HSN68lTGfo3Q1N
         kxH8uUz8vBrSFt26vS+ZGqHu/0ayKeEvm+R6g9SOlDqLx5DlkCuDn4vFQjM6vMqCWPcp
         grUOR3rBMJ/jVCgnA1YpEDABkiV1Vb2b5F3aJ1W2v7hiSEyikC8jqcfWE8RfX5ICk09n
         aH7g==
X-Gm-Message-State: AOJu0YyVm25l/UpBxfGeWn33pMhtyiogndnwZkXJ19oU5+cH1lNL8ofS
	Bkp4XfmvEpqv9AiETuI75hLtqxLNYU3luGMGEHKTCgjgJOGsI3cA1F4svg==
X-Google-Smtp-Source: AGHT+IHGTYPHQO9p6Y/l1CmymnIQEX/1SZeYC13Cag/SOhxm3N8QII/y43Q4PBqpIMs0ny6cc4xO6w==
X-Received: by 2002:a05:6a20:d525:b0:1d0:3a32:c3f8 with SMTP id adf61e73a8af0-1d4fa78fd40mr18091253637.39.1727761897939;
        Mon, 30 Sep 2024 22:51:37 -0700 (PDT)
Received: from panther.lan ([2607:fa18:92fe:92b::47f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649bed5sm7232788b3a.24.2024.09.30.22.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 22:51:37 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-input@vger.kernel.org,
	jkosina@suse.cz
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] HID: apple: fix up the F6 key on the Omoton KB066 keyboard
Date: Mon, 30 Sep 2024 23:51:14 -0600
Message-ID: <20241001055146.543800-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
key is held. But unlike its Apple exemplar, when the Omoton's F6 key is
pressed without Fn, it sends the usage code 0xC0301 from the reserved
section of the consumer page instead of the standard F6 usage code
0x7003F from the keyboard page. The nonstandard code is translated to
KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
popular keyboard, judging from its 28,932 reviews on Amazon at time of
writing, so let's account for its quirk to make it more usable.

By the way, it would be nice if we could automatically set fnmode to 0
for Omoton keyboards because they handle the Fn key internally and the
kernel's Fn key handling creates undesirable side effects such as making
F1 and F2 always Brightness Up and Brightness Down in fnmode=1 (the
default) or always F1 and F2 in fnmode=2. Unfortunately I don't think
there's a way to identify Bluetooth keyboards more specifically than the
HID product code which is obviously inaccurate. Users of Omoton
keyboards will just have to set fnmode to 0 manually to get full Fn key
functionality.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 7e1ae2a2bcc2..9767d17941d0 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -545,6 +545,9 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
+	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
+		code = KEY_F6;
+
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
-- 
2.46.2


