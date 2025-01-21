Return-Path: <linux-input+bounces-9421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B229A18594
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF423AA0FB
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 19:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49325192B84;
	Tue, 21 Jan 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwFBL51H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911062E406;
	Tue, 21 Jan 2025 19:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737487188; cv=none; b=B42bcO1UyHq1Ydzjv/GzCL0ljX1IYPSfdz9ECQ5+Ns+lxIsXEjzz2xdWpES7wiP+0WSXgyFNlHUSyHS8/aKFAsV8O9DzvYatTXo91H800EG21+9GLojhqTdrkgywvl3D8YRToVLy/EzN3p3kTGLvidPRk4SHnGoDwghtJHDLZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737487188; c=relaxed/simple;
	bh=udVtSzrmp2enfG/++kxS6yUZUAIl8yFNCBmbb4W3epY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GkOVb74fWnO+12UPUxQmv3voLu3PhHjHam221t9niGD0uzrcBIHdMNlosNnczSJWosz9PcBEq+5GQbYt36B+LeSrsML6iZ1ZWyzjgt1b26JK0M2NhGfIpta6IKXC6wSDx3YfaNX1mSFeTTOv3mSit8BOdE6OEYEUkSE9rhDHr+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwFBL51H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436345cc17bso43792525e9.0;
        Tue, 21 Jan 2025 11:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737487184; x=1738091984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqaiEpvx7wWHCmqLEA4G6ojUqwSQVza09d7IJqwjf1s=;
        b=DwFBL51Hn6uL0nDaOFZV9PfhCtqDgtWk3itR0HUiWS1rDSAykls9KMpCA/U7xpX31l
         7ldkZJN7VFvn7telKP+wuTIvkt8TZf3XUicU8MO+8NLmTjGcGBOSiM24E0sseh6CmnPL
         o7eSL6Db21sOHFKYUSdiP4uH811p/JPWVAWLEElsrHiw0e3ey7+Og2Aa5AlRFmHpFF1i
         /fdvFyJ7zRFJOV66czVlA6qotAVZfXOzOrD389VjpETjVbUFDxttJhIPRH9wGcILdUOL
         Oyc5zY/k+heEw50q73VU2ZgSXoB5So+NqLM4vU+Q7j2tEVaZOS/ZtZhVMN4rrMIcMClX
         SP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737487184; x=1738091984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqaiEpvx7wWHCmqLEA4G6ojUqwSQVza09d7IJqwjf1s=;
        b=tvsaVE9hEl++jQ3OkbmCn8T97/x/qzMWEZ/1EIExEwX6vnQVXlEu24JjDvc/VzkGSf
         4SGyVCBBraarG1Uk1Q5kgn9Z9L9mFmX21SDMmX4aYEyKFVmDuckPt4Bmwssj01mO+QdD
         KwLjNHqiUMWwzQ2gfCnF0yzB7T7RE8Hhh35qjaiEm0uxi/yHPPiWlSI+hfVayt1Sku4w
         ly84CP5mFT2/rsErkPxHw5NCtILwBZwc1UW9XyDXpeIRNWldj/8gZ92OFN85VGhruTbM
         R40HPkgze4qO0aiex+HDoPAyDTIewHXyDtH92UBJQwPWO4ldHudMmf+8LsK97B/mKgF8
         xQSg==
X-Forwarded-Encrypted: i=1; AJvYcCUDmzl4ziDvgMXfOW7aZyJZpmfyuikkj1L0TwMuk+r08yLzpazWzhkE9N5CFwZFBRK+UnLss+l8UNJziA==@vger.kernel.org, AJvYcCXK4bWho/NTiSCqjVSiDqp51YC8h+7ghUCKQ0kXfaXMhs53phFE+Wi/c9bzINLK4IylYwyJpI/q@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4vHNMksHADq6TU//NJGvAsQr8QWW7w/N2/zqTIuoDysnPgQl
	2M3m8ogh8+OELVt5lufxc/KdkU7TxoN9w+0k5zNS1ryf/m/f2531Kz6JPLPL
X-Gm-Gg: ASbGncsI315IusICZyjIST60dZTc8Uy2HIrGrOFiwrLsOm6jN3rygWHCeNF/ACSWeqK
	Eubk8ry1WPMVgT1ZSWzbQ6Z2Rflc+4C74Kbq9D+WFQdSswPK3ExEf/U5fc/aaDZZvO/smRsTxuU
	K79sZfJtl3sHK167sfZSL+gkM8KaQGVsso/JAGETy0uPOSXySwpy5DYIav8uzX5PDmapJuwveoh
	DqUWKm67gHFiDgnniMycKcVL1P1/XKn2vnJw1HNxNDTu/sdYLBHByeplB539BdQAQ6zrBnTFQHF
	PpgG5tkDx7ErqNxvQw==
X-Google-Smtp-Source: AGHT+IEFhKKterX15tRV0XdvmjlkioXJnG+fG6fHLV32fEwR2g1Ori1cbYLBX8ox9ZbCDE4nTU3pWg==
X-Received: by 2002:a05:600c:46ca:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-438913dfd7fmr212393195e9.14.1737487184206;
        Tue, 21 Jan 2025 11:19:44 -0800 (PST)
Received: from localhost.localdomain ([109.175.243.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm13970256f8f.26.2025.01.21.11.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:19:43 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	"syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
	YAN KANG <kangyan91@outlook.com>,
	stable@vger.kernel.org
Subject: [PATCH 0/2] HID: corsair-void: Fix various memory issues
Date: Tue, 21 Jan 2025 19:17:58 +0000
Message-ID: <20250121191811.30717-4-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a use-after-free and a struct without an initialiser

Stuart Hayhurst (2):
  HID: corsair-void: Add missing delayed work cancel for headset status
  HID: corsair-void: Initialise memory for psy_cfg

 drivers/hid/hid-corsair-void.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.47.1


