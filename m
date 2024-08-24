Return-Path: <linux-input+bounces-5810-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56595DBFC
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32634283E9D
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D843114F13E;
	Sat, 24 Aug 2024 05:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dhoya9XO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740907E575;
	Sat, 24 Aug 2024 05:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478660; cv=none; b=N//YvwvnX9kLJpOElTmsOQ/2a0Liq802jNU5vyJ96/9UTLI6sIhe5OvVhjpVBCU2VzwNgdCUeoemg6k8UR5zJhefl6FK0uAwftm/tItoOnH7LJRQfhKWhuZ2NJQz+bGHq43+PFZSC+fMpgPEWAk517dFyPqCts8Y7c9tsYjuN1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478660; c=relaxed/simple;
	bh=qrTTEVet9DVf+P8WZVnNHtg3K773zFUw5LoxWudGN60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHmisSqAgrZP9ADd1Rd4ktnakj2424ONumlKYLFy1OhNuGF1nciHY852zbf06uZAmpjK7cmqbqvXdpKGofkviO57+lCqAEJB4kxNWJLHfIIa49rLULMIwlQmJ9w9aulH9Id0+ub50WnqiuEFXt3FhhEN3XuqZFMx65Eo6kyQdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dhoya9XO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-714302e7285so2292248b3a.2;
        Fri, 23 Aug 2024 22:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478659; x=1725083459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6sQ34F+nnm4L9xEfmuQS9U4eeZQJzK8r1tJDoiW5xw=;
        b=Dhoya9XOlivE+PXBBUbFXJFB5/clopstq8Kd4rUv2PnxVWn0tZ3Not+0ysg0l9Kb1F
         buFVuPWjSfJ41qz+BoHpkkHYU8c41q40Vdy6VKP+dTSQ3JnYth80T8EjKfKy7wZp22cb
         7HAdF9cKocCCUmCljeXPmJm0/eaZrmG5YmuBqyXyA7ebuKj9QXObtZp+rJu1cyPH03b9
         XklWBPuDrmSE9LuSn2hZdjWRONl5Rmk2C9891vaVYWDffIeetTtsqntMS921eYjR+wGx
         EQLxN1vP+VtXjExkJRzFPtPTXt7R/hLM9Nlp1YQOvgPVx/0rwtTKVrrPnnpuJKG/H4ov
         6T6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478659; x=1725083459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6sQ34F+nnm4L9xEfmuQS9U4eeZQJzK8r1tJDoiW5xw=;
        b=IAfJb9UJJ7rO5PYLNRzBhVlPP8K3yie0tsyqNamihohgh2YJ2uGkmq8ET9FtNwdHGK
         dHRJ++RTX1j4hOq8OWKOoEweta6q0hwCA32g2qcUcC6L2Lgn0wJW6YiFWp1QLwfP6L+f
         2b83R47GPPQMHbhIzk+4EKbpoPK6wway66zFcUqJVDWdWjisuBsSNp1U5oTDxnzv0skb
         zm2g499PayhNt7KPK7k7rfe+V9J2kQP6JthoEfVVGN6P8A/6vsiX03egDBs5Wf/ee6WV
         usNYN+q9sQOaOHT3T9pw5P84Rfoh93F71GULc6VWxUAaCn02pgx8W8tyVDs8QmRCAjPt
         AVVw==
X-Forwarded-Encrypted: i=1; AJvYcCXAiaFb0S36vf1joC0lDc72xcJcE5S6m+eAY7QL4OQL8FnTGCpXMggWbjb+WjmDRu0aKLM7HHJcE1cGmA==@vger.kernel.org, AJvYcCXvfK0u8qUC7RS1kSALf5cuv4+T20zBL0c9eQHUetHPRowP4YMyM0yH/WBprdT11GCHFM6YiyVfk5QYtEpW@vger.kernel.org
X-Gm-Message-State: AOJu0YySfKLWMPZC8MEysWz13P9ZhST9jEDa0C3a3gPKMmOj8DUnqWdU
	//sBSeXIlTN5pD8jLaDlJy7+LThOmTQETjQZXaQyCDEr6mCkA0PH
X-Google-Smtp-Source: AGHT+IEuageBihitbZVQb5egC8OVLS4HRZZx1QLZ91t+LxMSexOw/6w8CRcQ7tCS+Vs8xmG2LiICIw==
X-Received: by 2002:a05:6a20:c793:b0:1be:c929:e269 with SMTP id adf61e73a8af0-1cc89ee5437mr5747576637.34.1724478658526;
        Fri, 23 Aug 2024 22:50:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:50:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] Input: zforce_ts - simplify reporting of slot state
Date: Fri, 23 Aug 2024 22:50:26 -0700
Message-ID: <20240824055047.1706392-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

input_mt_report_slot_state() returns true if slot is active, so we can
combine checks for point.state != STATE_UP.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index ffbd55c6e1d4..350cec8508a3 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -386,10 +386,8 @@ static int zforce_touch_event(struct zforce_ts *ts, u8 *payload)
 		/* the zforce id starts with "1", so needs to be decreased */
 		input_mt_slot(ts->input, point.id - 1);
 
-		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
-						point.state != STATE_UP);
-
-		if (point.state != STATE_UP) {
+		if (input_mt_report_slot_state(ts->input, MT_TOOL_FINGER,
+					       point.state != STATE_UP)) {
 			touchscreen_report_pos(ts->input, &ts->prop,
 					       point.coord_x, point.coord_y,
 					       true);
-- 
2.46.0.295.g3b9ea8a38a-goog


