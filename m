Return-Path: <linux-input+bounces-15928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D87C40175
	for <lists+linux-input@lfdr.de>; Fri, 07 Nov 2025 14:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3DD189AB4E
	for <lists+linux-input@lfdr.de>; Fri,  7 Nov 2025 13:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BD02DBF5B;
	Fri,  7 Nov 2025 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="adeku6QE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054542D7DDA
	for <linux-input@vger.kernel.org>; Fri,  7 Nov 2025 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762521898; cv=none; b=sjYLKteSGvbycWTxwJ6N36ALG7w5/1Q0538MasrEoC73pU7bwOLhRlMxdg30BM5OJv6cHN7KS+zkj//1tfY167MA9ouAvdF/HYBR/FFvUvBfXblnr3Ct7qoC9LaG2dVuC+D4C2i0CmLnAt88k5hIqfOLt2jkf0i36sb+F8+qmg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762521898; c=relaxed/simple;
	bh=CorlC2x/QGbVc5MqkpMnq36sDBoV0+JfcYBM5ofKy0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EoR26G5HwDKj7zQwRCsj5C7fOuxr/LLufOnYGeJL2MC7Ej1zXRw29kmtNxWsmizJCC4nshrR3x2NAGobjhfGTz2jb9XS552hmZADanzIWThg0yADNWKhGaDqTYKboZl4HZIa8MVqzP/VIInTXk0bxqcWHqL8Gv32ysN0lnBOzxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=adeku6QE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42557c5cedcso454315f8f.0
        for <linux-input@vger.kernel.org>; Fri, 07 Nov 2025 05:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762521894; x=1763126694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fu0ShniKzlfX+F38wOCJrIRo+AA6QvYIzBpRF8Rn2q8=;
        b=adeku6QEJNy+FyB5nVeyk2cwAVgGmTZEPKcTMomE4xf0VO2AEdihnX9NNa7uzN9nEv
         EwcE9CDNo4dk8DGLi+ovZyahLKGBXQVCa3Ibi1S0LCWD/eHAk5u6+XOG6ezbL+Olmzu8
         k1zdFN9zVnV11LK9KQ1yGy82vqzA3Iy/pFlrGh40c/rFZhR6cL3OYnA71Pzy2q6xxC6M
         yaDTZyeuw/A+ri0CYeKwznXwzIp4NtHVa6c8xwNj6HCT+szY6N7Sf1AblIAfGpAfn+O4
         AJ1pH3ncEQ6nLa26LacKLcpzmYCcPMjhNLTK6j3Yv5I51tdKtiI+vbKlSsYAF9Cc07AN
         /9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762521894; x=1763126694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fu0ShniKzlfX+F38wOCJrIRo+AA6QvYIzBpRF8Rn2q8=;
        b=c39JlnF6EAF7v0Xba3L/Qh85QVb0QshvN8dWkmRbd/2vUGJ8Ic/wL6fHqNLIPg1SCc
         ZW+szJsqAT1+LrY7Z1mDdLvWhSlnxNma3TATceCb8TsCe31ozwGRY7eVGmYqkIRV9Myi
         vKme4+YynGwj9hhOR1K0zGKkYN4QR1WbxBoHy/tOdP65EmfT1zkzmbnq0fSJK+foIBPD
         9pbSCMFmSmi1K3clUAVR+9ZxjhMWiTRrEatQd5buPAgS6o6E5qPR5Z8XejlgzS/c1ufC
         i3c2REqh9CjJMeCHM0Uw1UK1cmRQLSy1kh6oVXDhi+pjcY+1xrWif7nMijrcXJh+Gfhp
         f4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1AGjx+UIGleybQZh1h1fIy5YjJfPralzZJ0fw1U6nu2d5+sm1SmJlxqRcMelxM+OH74fRVNe8AlCfpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/XE3g5xMb99BEnDoayiFwpqve/Sm9a4opPr3FKOZ8kJkHOyLu
	J9xSzmno9G7W90EAjLNDk07oVaxfiMIjP/TExXdtmZokhm0i+DFX6ca9vk3OIX+Br20=
X-Gm-Gg: ASbGncuirsO3zpflPCJr4GFWaLJwvQvfhbOJpQfs5zxaHMN1ZOXa3RCy8eHMYqUap3I
	M01gdG0QkNPv8HPU6dGYta5cvB4P0Q/3DiTG71W9sgF1qKRwtmA1qZtnOANcam03c3yW+YOXgZ8
	ZGzppmJ7a86W9mrBG4BpAKVNPG9kyv8jOlbxhrPlAEaKLk9NMkTF+GEqppez5CKgCk1jHr0PE89
	0DvFVShU8ps9kl6FVAdRGPoEu+TIG5DbtUzVe0MoncotACRzc/Gnsl93hATzN7T98AHiUUjPf39
	3H/nX+WzizhC6RnYT6UzcPkqShSSvi9vXHUJB9Vz9ym5Vv0o3hVXMS0xuNt3xNx1wI+yVKuz+F8
	fNi0ORrLcqRkNfHdbRzgOzDshMb/Lr1Db2ZcFq77Y2pNcYhqrkVXdYO4+1h4v+liBe9mDI2w761
	g4JeNEwcMj0eodiodWamWdnGg9
X-Google-Smtp-Source: AGHT+IFnon5300BScc7FhmG+zbAjkt82S2MuNCGlqr3ja2OS6GNjV+p26DWVXJNPI0pKBCpLjCtSng==
X-Received: by 2002:a05:6000:612:b0:429:9501:c9c1 with SMTP id ffacd0b85a97d-42ae5adfc80mr2760918f8f.46.1762521894289;
        Fri, 07 Nov 2025 05:24:54 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e126sm5323280f8f.16.2025.11.07.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:24:53 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	"Daniel J . Ogorchock" <djogorchock@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH] HID: nintendo: add WQ_PERCPU to alloc_workqueue users
Date: Fri,  7 Nov 2025 14:24:43 +0100
Message-ID: <20251107132443.180151-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.
This lack of consistency cannot be addressed without refactoring the API.

alloc_workqueue() treats all queues as per-CPU by default, while unbound
workqueues must opt-in via WQ_UNBOUND.

This default is suboptimal: most workloads benefit from unbound queues,
allowing the scheduler to place worker threads where they’re needed and
reducing noise when CPUs are isolated.

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/hid/hid-nintendo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c2849a541f65..bb088a066dd0 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2648,7 +2648,8 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	init_waitqueue_head(&ctlr->wait);
 	spin_lock_init(&ctlr->lock);
 	ctlr->rumble_queue = alloc_workqueue("hid-nintendo-rumble_wq",
-					     WQ_FREEZABLE | WQ_MEM_RECLAIM, 0);
+					     WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
+					     0);
 	if (!ctlr->rumble_queue) {
 		ret = -ENOMEM;
 		goto err;
-- 
2.51.1


