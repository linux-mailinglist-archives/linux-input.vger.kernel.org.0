Return-Path: <linux-input+bounces-15976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD0C4848C
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 18:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2C0D4F69E7
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 17:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1FE2989BC;
	Mon, 10 Nov 2025 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="Zhf5Arc0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34922957CD
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 17:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762794975; cv=none; b=KAY9SqSgX03YuWhqwqMizj2XtAZLM2aVGX+1bt0/3bT0/hZQ6jk2BtJUY43uil0ANNQbDwZp1bbHWpduKiwUmkqp9yU17RQC3R9rkQ2HFliB+t1HQHx4hMSGVzoJjyWU/+QpKHKfvTnIvGOy9xc7UkjVyLtQ1eFLgX3/GXcoPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762794975; c=relaxed/simple;
	bh=bbQpKVYp7X3/PiJvnTi8GcsVaQwcsDS13rMuUKdQLgg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fmzmh0mg1IhLmpXEeZMiwLcJv1QIhLLpwr0OZ2tlRlKENJ6tZkr9xfZLhPzpOgp/qKuTZ36X8nGyumeDkWcfeqqxmW+NJo+LI55n3bjc7jGE8+kvakPAAMikC1aPn2oPlNNx4dVVeVFz4oy8/YJwKOvCSPUi2ciQ0Ylm6cI9uDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=Zhf5Arc0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34182b1c64bso1980192a91.3
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 09:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1762794972; x=1763399772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OevTstuzEDUvJLGaVqEbCkP6tz6C+EDWu87XVAJ0E1w=;
        b=Zhf5Arc0IehhU989ka9QToX87mez1z6C5lpdNaq1+RWgVZStXUALgVbW6qgLcC3xq2
         9Rzt8ozXpg54MwnnNjrWFvwBPDa1cmNSMdNiHilZ4gvbmsU/McXdxHF5uYHfTYIevxdJ
         ebpqGiebpPro6LyKTtGjj5Y2yUS1yDqItiIv+BXlj9IhPn4AcH0gPY6gm79sa/KMyHtz
         I6dUniJkLCmDGqSUZfCl3sagr2hlU12gObaNZmq+8wRg1pyLnGCADExxMnaqjITMKPFx
         KuOZtXdtpg8rB0jTNK60+80nyN0w8QLv4kvuz4dR2mA23liIOUz50RqL39C48XkDpXXQ
         U31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762794972; x=1763399772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OevTstuzEDUvJLGaVqEbCkP6tz6C+EDWu87XVAJ0E1w=;
        b=Xlek0ScioNrLx2ZA3nl7HChQrKpxDASN62eG8lwAZFdf3QXp4fBSOp4JGdr67M5EQk
         2hUtf+z1DslLUwyn4kVgomVJXPzEOFvB3uwU23uZPex1Le7ly5ujyTYRWwkNtJD+dIyL
         Dz6sEKtzUl8NiaqXjY11SUV11j8txThuTne01Fsq+PN/sQdAgEr2ZqgAA90nQ8WN1r1O
         FL/LhxANmtFpbrEv1zc52h/0ERrO5t4DOCCRbrVfDiiDFAIMK1sX2yhr5TEh8TNPRfuf
         xuBC6vIKEEMrHOnRxJFh/7EbKag/APIf0bTLL1SJvistggad360BA9FHqEq9mFUupmCR
         kIGw==
X-Forwarded-Encrypted: i=1; AJvYcCUrsW7hFBwjAdhsmfd1k8nNbClMAs4nuM+mH/qS5V7wLGaYTxk7TNhllV684WFk4l7Tl7w46Vwx8E9fiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEU7iYyJ+g0TbjsImNGrXotAEz6dFybuTC+ldHTP67yzI4Qtu
	jMQDTcQd9aiOooZNOgbaKe9yIcZg1r2r7Ndrh6VRfx2IjeRF6oN75L2ZtlwiQXnoCpEdb5tRqYd
	bE/AcGVY=
X-Gm-Gg: ASbGncvyomSaG18rKOtfLChjPFnGaNCx5aqMAwIfc5j19gTQsCIj0YO5lStHRqwLDQZ
	thih0+HdIn/vQhXgtIujGqwO0Qwof9hYatdl89oGw814fbn+HLO/CWO4yYbM02NCZbpTvPo4JGx
	0pz+4sHvG6K9XX1PsOR5NuHnP+Bxb9TQJD4O2wMRMZOGB3ofxRqCmKqtZ1mxkoCXIILFT2fugev
	aN+0fHb0hk4CIkY0qaJu+Y98XHsYhKocxRXitoUXY17jqeLJRw8HXEUi4b5gRAWrCE3JXSuxijB
	Z4ut7nYlYAsYbrvjhbbA5H3YucYdB2OzXNAMa5iPU6TBDDQe9NgkjEa3BhIpqN7E998XPe1mqtL
	ZHZPcikQOsvw4MnJWRxgXJSW6tBHPgYIObyAdOJkK5cE0XLomsRoLnA6UZKdOIHz9U4dCbgbHet
	laZnU4kMfVhIPR8aczAZfuYtWS
X-Google-Smtp-Source: AGHT+IEB2oBIa5nzIY4RXeZf3q6fmMvbRvpS0LMepjfTmdjnn56m//cKySPgfNyCyPbgC3K4kj+Fxw==
X-Received: by 2002:a17:90b:3b84:b0:343:66e2:5fa8 with SMTP id 98e67ed59e1d1-3436cbf608emr10357651a91.21.1762794971385;
        Mon, 10 Nov 2025 09:16:11 -0800 (PST)
Received: from localhost.localdomain ([49.37.219.248])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-bb0b958af47sm7011717a12.22.2025.11.10.09.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:16:10 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: roderick.colenbrander@sony.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: playstation: Fix memory leak in dualshock4_get_calibration_data()
Date: Mon, 10 Nov 2025 22:45:50 +0530
Message-ID: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for buf is not freed in the error paths when
ps_get_report() fails. Free buf before jumping to transfer_failed label

Fixes: 947992c7fa9e ("HID: playstation: DS4: Fix calibration workaround for clone devices")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Found using static analysis.

 drivers/hid/hid-playstation.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 63f6eb9030d1..128aa6abd10b 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1942,6 +1942,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 					 "Failed to retrieve DualShock4 calibration info: %d\n",
 					 ret);
 				ret = -EILSEQ;
+				kfree(buf);
 				goto transfer_failed;
 			} else {
 				break;
@@ -1959,6 +1960,7 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 
 		if (ret) {
 			hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+			kfree(buf);
 			goto transfer_failed;
 		}
 	}
-- 
2.43.0


