Return-Path: <linux-input+bounces-9422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F545A1859B
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCC10164C26
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 19:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278DC1F03D8;
	Tue, 21 Jan 2025 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iciZsCeK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A9186294;
	Tue, 21 Jan 2025 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737487516; cv=none; b=aMPk+knnZrCACw0ZUrQIPTwy6Jf9WB7tL2d9GrgBP2r/m1fE5UcwrbSS1Puvlntx7631+hds/6gXuYKzTqt/twKE3gf/vDN6UxjgNjnhOKKYcEME3dyfAThe7RRXkVOvxvpfMuylFkU1iH/3CVcZKjkRhsJjg/FCeN8/leZcbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737487516; c=relaxed/simple;
	bh=naLqzMyaZwZaY02L4srUt0PcUhtTlWHBIkMMtOxSXnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cezdfVIkKVcOc5PCaThLcGKSsRkYLXfpcJs4E6g8KdELd8t8ZOPRXeGqsYabKiU27SgKtHjgomkkfsoXF5HJkyU8zlN74DOQpheDJdjQo4cP1K/cn5v02vQnA1q/Fb0H95LE5xesSRyIdw4+WQ6Nbg7ExUz0zNWknVimffJVXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iciZsCeK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43621d27adeso41852725e9.2;
        Tue, 21 Jan 2025 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737487512; x=1738092312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ue81GTmg7nTlA1opCERyfOrNH87tg3qp5Bx7ADaUro=;
        b=iciZsCeKJTxmCH0ERWzYnIbGB826fOtAZI78tg5DPq/7tkpmTWKF0p5P4NavHMVlVA
         k9IhKZ30R23Ctei52Fy3Wp+qPIFvQVa5L/VXOnhnh6byq6+IAjDRV+mmuRRaGBAk7X3Q
         dy3GCbsRASLlQ4qOcZ0+unkYJ7LRyL/qaHYDaYSGtD/SlZn3vrirFLS/0JXeRzY89gse
         nFQ2v0AH6DmYnzVr7gJ7wu3PMP6ohFbmQm4m8zWqVxz/xDd9HFHeMajaErEm8bK/kZCO
         m1oIgouul/+AsbxGHXalF2R+tOcoU1LzcnotxpSV6wLzCOf9rYr3icOJyqenvkIjK1oQ
         Pj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737487512; x=1738092312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ue81GTmg7nTlA1opCERyfOrNH87tg3qp5Bx7ADaUro=;
        b=dguWPet+cMnaSpQgI9qxlhJ9rv0Jsop3VFZ0UzcCsAOM2SFKBJWVqIvI9jIOv5TYoh
         Na8px1cCDl3SwHxOFCLf/s7uuxaP4pMFInuRLeqVKKPFcPPDUu2RxDj/4JYJKp2JFPr2
         /4K0zg5R6ovNTmt23X78bpJxm58bYw5F1l7lj7n0a6J/kmrowImKUlhfcIpTIx+N4P+B
         e7Pfq+h8Q4HUic2uLCXZ2vl3jr9QBTZH6XUuo3CO53O0JoJ0xyqWMuSGm+mUVNky6Nv5
         Xjw6bSF1XsmaPCv2rG2RPkkHtPsOBcjtjyRWj+zZ4Cyn39LIA/zLDrpYkR1WrT5tgrah
         Bl1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2FxNEu/tI0FB+XwuUlp1uYIBtIX0x2IY5YikpttviXfvjAxB5O7TtTW37jjpxb4q671X+c2SCttdiYA==@vger.kernel.org, AJvYcCXb8EQhSJ8ojBXCMwfNxCCNfMYC4u0qXG1FPUkXt7HCyU6fUg77Q1AL7JFterST9WhF0ZXiA9Py@vger.kernel.org
X-Gm-Message-State: AOJu0YzZM4w4DK2qdDZBzhXGPde5wo+PWRJM+bV54KJzkiQkC0LkQJLG
	ADrqC38yqoAbIJeqtr/zq4UWBq+Gg1Hiko3y88BE0xgM7M3VPStYrcTUmyo3
X-Gm-Gg: ASbGnctCQBFYnhEW3kvzmGTWBKLIUgR9g0SMLQYOorrRyvJZUXuOhW04hzaqbTMLcYB
	aXbf7NxisXyn0JPui3FYJuU913bUH7od1ePSAAWxYIYQtzplB7t2ayyijXHkgjZI7Sgrk8beZy5
	QVFGOds5I5FSa1+6X+9LREAXkduTE3oLMXI00rQtNa67jzfJXZjFOeEVRprRaLhcCml1kSF53k7
	fdPN55kUyXoSBwNFSK/SULiHuiKXXoA0MPhISTcKwz9L+lf9r8u0C3sg6xhIRGgnUUc+CIWWDe1
	gycOhhnTYqCGdMa6WA==
X-Google-Smtp-Source: AGHT+IGHeJ3U/mCR6kigY5m4DkdqnDxOfqalXe4ehgXrkGcebUR3D9Jt7XgeNxjx2RDUrkVX0WPhFA==
X-Received: by 2002:a05:6000:ec1:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38bf566f575mr12314481f8f.26.1737487511789;
        Tue, 21 Jan 2025 11:25:11 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm14004086f8f.89.2025.01.21.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:25:11 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
	YAN KANG <kangyan91@outlook.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] HID: corsair-void: Fix various memory issues
Date: Tue, 21 Jan 2025 19:24:40 +0000
Message-ID: <20250121192444.31127-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a use-after-free and a struct without an initialiser

Attempt 2, since apparently I messed up the command the first time

Stuart Hayhurst (2):
  HID: corsair-void: Add missing delayed work cancel for headset status
  HID: corsair-void: Initialise memory for psy_cfg

 drivers/hid/hid-corsair-void.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.47.1


