Return-Path: <linux-input+bounces-8484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD39EBB67
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 22:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87CB12840EC
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 21:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B747F22CBE7;
	Tue, 10 Dec 2024 21:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1drlFJP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DEF22CBF2
	for <linux-input@vger.kernel.org>; Tue, 10 Dec 2024 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864469; cv=none; b=As0M1y73bIZ+jKw5/RZDeRAHgngwgzjCn1MlHsE5rEIAyCKET8Pcdh/F2sqa+P3LF39AgN7/wL09JxtCPRDEz2nmMAma2QzIiFxfEDZcDAH82yuP01mx5gc+LBCxrQMgps55ITM86LcyatHsA81KeN7K1sZAENDNeDbm6+oym/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864469; c=relaxed/simple;
	bh=ItcyMlCLd+5cE0NmL8lYd39KFYD+l+56nRJiRSqL1eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+IoC8OdCYeDEtj3ZAhTw+YLcLKj9gBW5Ngte2wegXzHcpgQiu4NfPkI3od0TzeLaxzCzw+24/d5UQ4SUR6y63y5EgVNPEzICnEl/12X1NB8plVi0WvQZdNKfdzxbm0CbbuEtH8X1ahACvr324CRKxwi29avTFq8jzHN5/0nFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1drlFJP; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2163dc5155fso26132855ad.0
        for <linux-input@vger.kernel.org>; Tue, 10 Dec 2024 13:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864467; x=1734469267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkphP3HDfEfJV6jv71F7QkJUTS+/ikjohv4a3WH/Meo=;
        b=T1drlFJPAEdKB8cb6J9Drio/FDNE0rrlGCNl/1lLvWYXIW3+D7OS+1Lf6i8c9SR3xP
         uGr7hSWO5LPvRf6hTTiZHczVVtcaWOf2gg8s6HxKPz5ZwiNrzKWgSmgOE7VJvhCVzGWT
         /xSC/zVJJdrmvdhIM5m5pCwnrWMERbVrEKOtXvxlruWFifM1/C6yf6+ImhpWzBj/uHen
         vr2zCPq4QgXw+xSqw+9aDmM/JZ/p11G4bCxrFJZZKf2MDyToMqt2m07EWxLXC9vhhqF2
         G6CmR+7LG9bJEk4ug6L+PPp3HClpTVv/XHbFcCKzEB1t/w3k3kgUAfCcddeeEgteaUu6
         hpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864467; x=1734469267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkphP3HDfEfJV6jv71F7QkJUTS+/ikjohv4a3WH/Meo=;
        b=ghY372xWE/47UuOSmEPAQlu99ZlehmGk724abNaTx/W/zwkdjnPH0SlNwR1MkgXrX6
         RfTfn+jw27txcMo/Rz8QMS/sA9GFH5/J4nzLPbKT9kRBMG0XJn1qgHfLS8b8kTHt0/v1
         Xcot4X7M9mL8u2v8S5DHC/g+wsuUhnOWzE0dZU6PxAkd9103u2RXGgV40k06MuOInMpq
         zHts/WPDhu5XDYtOQ6sF8fd8HuxEk46lVpDWCzurA79VAjrCkrn803+Af1mbp8XnfzEL
         bzfFPZVKrkuY9ZJe7f16E/gkD9ExW6NRkvDZLnBsnJRmDyQZI961Vi5JA6ZTphLASOCD
         aTJA==
X-Gm-Message-State: AOJu0YxYcCGqcKZWGUO14GFPEyQD7GBzeKVqVgqKBxBhuWKxUXyfScTS
	7pI3ixRvmq0TGHX+iiTejdg7r+fU6XD6a+ribeGg5Y/RyRDNNaL+UmabaA==
X-Gm-Gg: ASbGncuik4Xf7tgyN2xYBv1pEc3syWxqG7ezE+cugpZKfVS+Gxaf5m35qMWG8nQ1ZWw
	Z6G9ZhChibXUQ32mBpipUFFuzIaSJsu++w95rDDmIaRjXeQMGt5H1m/NlMzpW52pLXH523MlvCk
	NtFHIhRlPv488a7YBXHM6+jQPytJeVqFrTZXaVCw7Een830SgOnQU84AAO94T/9yT75vr3hZhT8
	0DyocppDqnLk0yLx61AACuug/go5zaSPqGTEefU1VhL3z/Klov6N4XUP/DQmQj9IvRWzqL0WBsS
	Zk6CyJYkQJ9cikVawl06wdo0
X-Google-Smtp-Source: AGHT+IG/krV/UNRRjn/ZbjQ9g9pfameASGJ/Wg7Evzw/ATEB1o8MRgDF0QXgfjMuCy4DbS6Z5mh9FQ==
X-Received: by 2002:a17:902:d54a:b0:216:4c88:d939 with SMTP id d9443c01a7336-21778505a47mr9573445ad.38.1733864466621;
        Tue, 10 Dec 2024 13:01:06 -0800 (PST)
Received: from localhost.localdomain (75-164-192-68.ptld.qwest.net. [75.164.192.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164419d02dsm45530625ad.268.2024.12.10.13.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:01:06 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 2/2] HID: wacom: Status luminance properties should set brightness of all LEDs
Date: Tue, 10 Dec 2024 13:00:59 -0800
Message-ID: <20241210210059.87780-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210210059.87780-1-jason.gerecke@wacom.com>
References: <20241210210059.87780-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

The wacom driver has (deprecated) sysfs properties `status0_luminance`
and `status1_luminance` that are used to control the low- and high-
level brightness values (llv and hlv) of the status LEDs. These two
properties had an effect on /all/ of the status LEDs.

After our driver switched to exposing each status LED individually
through the LED class, this behavior changed. These controls started
having only a temporary effect on the currently-lit LED. If a trigger
changed the current LED, the driver would switch the brightness back
to the llv/hlv values stored per-LED. (The code's current behavior of
updating the "global" e.g. `wacom->led.llv` values has essentially no
effect because those values are only used at initialization time).

This commit restores the original behavior by ensuring these properties
update the per-LED brightness for all LEDs.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 5689bb6fcb264..8125383932ec7 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1084,6 +1084,17 @@ static ssize_t wacom_luminance_store(struct wacom *wacom, u8 *dest,
 	mutex_lock(&wacom->lock);
 
 	*dest = value & 0x7f;
+	for (unsigned int i = 0; i < wacom->led.count; i++) {
+		struct wacom_group_leds *group = &wacom->led.groups[i];
+
+		for (unsigned int j = 0; j < group->count; j++) {
+			if (dest == &wacom->led.llv)
+				group->leds[j].llv = *dest;
+			else if (dest == &wacom->led.hlv)
+				group->leds[j].hlv = *dest;
+		}
+	}
+
 	err = wacom_led_control(wacom);
 
 	mutex_unlock(&wacom->lock);
-- 
2.47.1


