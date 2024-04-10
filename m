Return-Path: <linux-input+bounces-2908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA28A0270
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 23:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BFB41C21D5C
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 21:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7351019069F;
	Wed, 10 Apr 2024 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vs+sGN5v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC6184138
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786091; cv=none; b=VMyFw0nP2VaFL0OpaaM9I51XsopWD9FQh4LMgjmWSmkrSXMI8OPWfriY7/azfbafTK4dmoxdWNxN97ND2teAndem5Mwe0aBejCTmvLtnHABF/HjYs8NL7IMpRIXAw//4I/dSJJjym6kI68n4eb+mZ1gLS4r+ORJE5hZFCIKOF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786091; c=relaxed/simple;
	bh=XZj893oOgJO+TuxebqQUH7FBZLqRq2EAjtnxNCWS4dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRb5KQjrEXMkuAz2rr27flOW9yhf5Vc28QM6AB2ZjFQkZP7mUYTLTgtzLXEELKHoMSFUiDgeil9UOes3R2wpTJxcajr+JSD0gywesVwXZ7qwkTmGBAUzO203yIaenEujpTr/RCast0HYFaCwuYxf6Cnp+xcWpqsuA0Id3985pSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vs+sGN5v; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c5ec0c5696so768524b6e.1
        for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786088; x=1713390888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udjeys4Odih0ujJKT10PCL6WQWBbIkHJU3t+XfW9ZzY=;
        b=Vs+sGN5vS13k1kK+yHJoP7NFOtTQvWYNPAxMOSPndIMYRuZCnvxeQ971u1t3HaGgP+
         e+pVM4yEd0+Bx4d6FmTo4b5uGugVI+5VgouOza5n1VqgGF9Kqr2UBuJpmO0iOsWsV8Zh
         pDzRWsTnqMA0mqLTUpkq7yJQXUSsYmz2qxP8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786088; x=1713390888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udjeys4Odih0ujJKT10PCL6WQWBbIkHJU3t+XfW9ZzY=;
        b=vM+oJeyjs6I7TO5RkVNBV72O7EeZS4erqWRI2V9yIRqS9504VW52YqflzNi22aKwKf
         ehaOsjBIMmCXn9bEzo6iKmlPct6zMGAnC/w5XkGMxCjuMvnTFIkFIf9glkKIJbqkXnao
         EW1waNvb/ctnbJsjty/2uDCkncTiTjF7i7VEKFyFr2FXbJD8ld+QV0Z6dUzFY8ORJ8Kg
         onv6f1oEwzbXEDACqrpxA1Ern332bs1YMdgC/6ssO+Ujm3C0Vbz0SSGEgXz1V2gZDjgq
         39FjVoDmHQJp3m49dFNvBHi1VwJVfmPAI9EJVYCyADdEau35jOSMq3tVXe0ZCPzRv7jc
         RLbA==
X-Forwarded-Encrypted: i=1; AJvYcCWuzHuArP4jEFJeKusjUAsEhVt8ttL5UcEbcU6EMP4/3r/Jr1+FNgw3Btfm4+pFriM/m4hefA9bLCxlA9dDt07lpw10j0rOrV9R6rA=
X-Gm-Message-State: AOJu0Yx3e/82gDVHLVlLZSiN6yUEzM+Ec8BxiRd4WyS3YX3L6f4B9zO6
	qQ1QDHagfT9ahmLaUZtPp3M2WahbduuoZFL6JDgIVUUuTuDWPebkfb/ULQNetQ==
X-Google-Smtp-Source: AGHT+IHR53mUa7EISt68wfOzVTMhiwwKLj8khagoL81qi8dkm725vDXUVJ8C3dvMoDM7Stak1r7Z3w==
X-Received: by 2002:a05:6808:b10:b0:3c6:1412:3541 with SMTP id s16-20020a0568080b1000b003c614123541mr424100oij.34.1712786088631;
        Wed, 10 Apr 2024 14:54:48 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 21:54:41 +0000
Subject: [PATCH 4/6] media: v4l2-ctrls-core.c: Do not use iterator outside
 loop
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-smatch-v1-4-785d009a852b@chromium.org>
References: <20240410-smatch-v1-0-785d009a852b@chromium.org>
In-Reply-To: <20240410-smatch-v1-0-785d009a852b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Simplify a bit the code introducing a new variable for iterating through
the control list.

It also makes smatch happy:

drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c | 33 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d9a422017bd9d..42b7a45bfa79c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1052,35 +1052,40 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
 		if (id >= node2id(hdl->ctrl_refs.prev)) {
 			ref = NULL; /* Yes, so there is no next control */
 		} else if (ref) {
+			struct v4l2_ctrl_ref *pos  = ref;
+
 			/*
 			 * We found a control with the given ID, so just get
 			 * the next valid one in the list.
 			 */
-			list_for_each_entry_continue(ref, &hdl->ctrl_refs, node) {
-				is_compound = ref->ctrl->is_array ||
-					ref->ctrl->type >= V4L2_CTRL_COMPOUND_TYPES;
-				if (id < ref->ctrl->id &&
-				    (is_compound & mask) == match)
+			ref = NULL;
+			list_for_each_entry_continue(pos, &hdl->ctrl_refs, node) {
+				is_compound = pos->ctrl->is_array ||
+					pos->ctrl->type >= V4L2_CTRL_COMPOUND_TYPES;
+				if (id < pos->ctrl->id &&
+				    (is_compound & mask) == match) {
+					ref = pos;
 					break;
+				}
 			}
-			if (&ref->node == &hdl->ctrl_refs)
-				ref = NULL;
 		} else {
+			struct v4l2_ctrl_ref *pos;
+
 			/*
 			 * No control with the given ID exists, so start
 			 * searching for the next largest ID. We know there
 			 * is one, otherwise the first 'if' above would have
 			 * been true.
 			 */
-			list_for_each_entry(ref, &hdl->ctrl_refs, node) {
-				is_compound = ref->ctrl->is_array ||
-					ref->ctrl->type >= V4L2_CTRL_COMPOUND_TYPES;
-				if (id < ref->ctrl->id &&
-				    (is_compound & mask) == match)
+			list_for_each_entry(pos, &hdl->ctrl_refs, node) {
+				is_compound = pos->ctrl->is_array ||
+					pos->ctrl->type >= V4L2_CTRL_COMPOUND_TYPES;
+				if (id < pos->ctrl->id &&
+				    (is_compound & mask) == match) {
+					ref = pos;
 					break;
+				}
 			}
-			if (&ref->node == &hdl->ctrl_refs)
-				ref = NULL;
 		}
 	}
 	mutex_unlock(hdl->lock);

-- 
2.44.0.478.gd926399ef9-goog


