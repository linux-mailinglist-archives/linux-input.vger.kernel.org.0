Return-Path: <linux-input+bounces-5100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A33937C0D
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 20:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A472D282B03
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 18:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB24145A09;
	Fri, 19 Jul 2024 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wpjMpk1K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376F2746B
	for <linux-input@vger.kernel.org>; Fri, 19 Jul 2024 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721412398; cv=none; b=rU58EiOiYevjHaKdOBaaos1K9zmO5hwwACgJ72tf1XrUpp4dvQhpSy2p5SCCSL4VNwun72+f1P068ymEK8W2IEyNqR9w/5EgJ6DX6lQ2gc9b8NXWGAzxGgEB8HynzUiJ5DFAp9NTgUldllgTdZYucjHjAZ09osXj4WS5NeQBdII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721412398; c=relaxed/simple;
	bh=3JxKCWFIJO1l5j07YlTQzhG4WIh9B48kwEXBnpUCFmY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IFSIgR6qEUPL5X0mooauB6MqLHbkFUdEdzzbSUwUylJkx+/YRMebaUfK4aHlMqwo+bK8aP5At2OJH+FhbLTTu57hYfIfodnuiOb/vdWctzfAxQRvsbdHHDlsRcfdFiVPDt1Nz7f5GtpVWCN6yXkFnvbL7cdYzHJOWzDChvpfupM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wpjMpk1K; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-39858681a32so10739465ab.2
        for <linux-input@vger.kernel.org>; Fri, 19 Jul 2024 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721412395; x=1722017195; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKoiDVkQ6yJoRSxu2Az1hfMJ9PYb+MfDy6ZbgIGOeQ8=;
        b=wpjMpk1Ku0YeRzPdNwOGUL+dTUjUUGh/XVQn2HYLblQBfJBitfgza9VsL6j1WpOM3K
         HNNfiBy7nfPPA/B3QAStab5PviOLxThc8QRI/qLyDgIIzV2i32PKkGwNsHaORW2NC2fS
         tq2lcG3ePNkZ/EzNnCMQQr/+ZWzj5Qw5y1Z9XyZdR4+B1RoKRiCtvpxrrY39Mm+BOKWA
         13c6mB+9Xl87atK1dOWDgcGBr94gGo9ApjOnY6unPHnQ6rM5R/eYAT2Tqwa2xJ10FNDg
         r9BWq9+h2GHqQBEkmzbWHWTP/FXoe/5FM30Q8xeuSa1MKTw1EmwG2rYd8JBHue5VYhVc
         OGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412395; x=1722017195;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKoiDVkQ6yJoRSxu2Az1hfMJ9PYb+MfDy6ZbgIGOeQ8=;
        b=uSKF5voexOTW7awQcFX/04fyZxXO5dfzUs+Uu7gM/HDMJ/qWPuer10QxkQkrO+Bgi0
         nMckV0c8268v2wWKQJCkRCf+9AIPAD3d+gsHtXyrRqBOPuU/z0NtxtOO9RrZ6xcoLbPK
         Xjf9VX18TehcHJYPjrC6PxT1HbPMTa+QyTt1HGFgtFYmYkUN9xCzUfJ0Vb8UU4tnF4KZ
         x5UZRt23biz3EQJyHwHVItkH8Dl+atmeOrifdXYuabjmUZDYr9M3IW94Tpm324tStKWJ
         ACOnek/6khjGDZ9oQl9soYVQM4qw0eooY6mzgeQoaDOkOPYa4uyqSCCIYxW49r5t0msc
         qjyw==
X-Forwarded-Encrypted: i=1; AJvYcCVRl++WA/UHAGB7u53qWW+UV/7dwJ+muK4s+Co623LF5ugakReDV8BQttfba/JRsir8HdkXwodDByVv5DtbpN8GKWrlaV14vS+mKzw=
X-Gm-Message-State: AOJu0Yw3kftlkybWlE+b2stsCHlu7fHJzvIiaBSu1qa+J/F0zK/eyRqT
	OGQtRmeR4vQnoCy+qrbgLlyXdB7+vmOp9K7yFKJkOFvHukOaPCNG03p7Omxc9xVfkxqDdghJ6bv
	u62xQsA==
X-Google-Smtp-Source: AGHT+IFVTUFvNALMgY3b9kcnWsE89uLmyXszuB6EAU/KaJQ5m1VY84UAMpSmm+EP8KMJBYzhbB/2Z2Zq74qG
X-Received: from dynamight.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:17a])
 (user=jdenose job=sendgmr) by 2002:a05:6e02:1fef:b0:380:fd76:29e4 with SMTP
 id e9e14a558f8ab-398e706f258mr245725ab.4.1721412395708; Fri, 19 Jul 2024
 11:06:35 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:06:15 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240719180612.1.Ib652dd808c274076f32cd7fc6c1160d2cf71753b@changeid>
Subject: [PATCH] Input: synaptics - enable SMBus for HP Elitebook 840 G2
From: Jonathan Denose <jdenose@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jonathan Denose <jdenose@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jeffery Miller <jefferymiller@google.com>, 
	"=?UTF-8?q?Jos=C3=A9=20Pekkarinen?=" <jose.pekkarinen@foxhound.fi>, Sasha Levin <sashal@kernel.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The kernel reports that the touchpad for this device can support a
different bus.

With SMBus enabled the touchpad movement is smoother and three-finger
gestures are recognized.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 7a303a9d6bf72..9df0224867649 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -193,6 +193,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
 	"SYN3257", /* HP Envy 13-ad105ng */
+	"SYN3015", /* HP EliteBook 840 G2 */
 	NULL
 };
 
-- 
2.45.2.1089.g2a221341d9-goog


