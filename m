Return-Path: <linux-input+bounces-16562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C009CBBB2A
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 14:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DB5130062E7
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 13:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C6F231C91;
	Sun, 14 Dec 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz04vidV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D619C566
	for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 13:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765719454; cv=none; b=OPmDMq0Dpm5DtpLzKFMvanDHPdp72c35t4QzSn71FYi4slaKdzBxqhGIsaDnMJrzSirFloIYbNkIH50bACG4RnWThDzvLKq2i6s+kibFk9WyUGOyZh9QMtuWpkRO0Z6s4eP2MPJzH3Yqkz2EMbqQFSCyacKJEP7jmS0pci2ugcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765719454; c=relaxed/simple;
	bh=bkeU2pcY+ABuCWsd/tRYFRxOCDFE7QrQP/NmLecEyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUoSqUHawX6b3FAs51vDUnLxZr24eA6KeoWJ+25MsnDR5UD4Oj0XN//UB7L32b9F9l0PYi8VEZgUdt1JN9qLW1Nr2rCRdonDNfpKdCd+vSEq1I1eDmOAUxMnlfmkHjW+VmaIu7raX3X4ZV/syS6q9/jaCus//DAVzGzXwhCunLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz04vidV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b72b495aa81so477120566b.2
        for <linux-input@vger.kernel.org>; Sun, 14 Dec 2025 05:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765719451; x=1766324251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bkeU2pcY+ABuCWsd/tRYFRxOCDFE7QrQP/NmLecEyFY=;
        b=hz04vidVhctNtgc6F6iqrQzACWHOdT7ahVmMe2jkR1Pz7jUCxsHFbqdRBRQi90E3SQ
         6B05JcC4cQgMEhdJiHaSPzymoN7h7ln+Szw6lks2Yrd6+pb4gCR2UX5cqb0K7YJfTK+i
         /fsNmMGXCmdyRJSncNGlBRigiWB90G5JCOpsxdQSgXQoD6iOReo/eQBXajMAaREiDDwR
         SlO5CQ4Ifk3MiSUqFhpYt08eET+4TzsgeQ1JcRZ2NdMXvNevqYJvLmcY4wRWm28KfnWo
         3DZKEgl/ogmy63cN9I2A1F6w2usZwksCuf9Vah8RgSGqiHHQGnNhqlyKT5m64Ek609yB
         kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765719451; x=1766324251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkeU2pcY+ABuCWsd/tRYFRxOCDFE7QrQP/NmLecEyFY=;
        b=CUAw+/9LnBia0L2HF1gkkGdxJg3FjeK7f8hW0E5HplA5UMtEIWpDyOE6+XZOJAGlmb
         viokhTimg5piiuug+6D/MFULV0f23LibO7Fihl+9o6ee3NdPWIqQzA8iZL+W5kvN3I7j
         bLrk2ei3UYLgbNDu9ypLB+xkt1tSw2E7FCf7dSzAFCDVx548ENpHxN4YrxYb/af+/F0l
         55SNjyzmzv5wwYQ1a4cChwrnyxJ2kNsahT5jvk5YTplnhIpgf4pO+89j9SVXKhAgs85j
         UkpgcsqsO+Q9xHjZCnfgEb/TVRQmxDgVkMUqRWQh1j3gaGUB6+72fNpHqgfflRQnGacc
         jHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVavhXBCe8FOVjscNrS7b0e1Sy7q/q7/tJmcDMLi3PB7X5EyAHvaJmVPualNeJsuOrutIol2KbKWqqtGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyztDitQlHnVBSXU1pDKgr51evgZ3LkFtSRy1TjAFYS8HPNX7AN
	j6srvudr5rCEUdnilhPX1cuhdrs3r3EHMAaoMQ9SARP6F0+rRBkzxcluUVcQEg5Ddxk=
X-Gm-Gg: AY/fxX5gML1NgyjKAYZSP6Cih+t3Pxk2C4r38O8hOjtdzaqQxVhHdpIXCLBXWj4zfLe
	xBj6Gev3mHfQulGiULFcyuic26qsya96IS54WlevsTR9jBYlzkI3IY7gkpE6uIRTmJOXyaegK/3
	ByYleo6OW5+GOJwLSG9tJkKG5YLmAWDPjjiybksWSSZrwrartcaQ9aZyO6g1VVZ18CFy23xkSh1
	/hd/qHKW59cS1RDtsG9c4Kjx3YME0ESle9KE7mbjNad7B3bsiHk5vUNLN4VJ8Pt5kcgmVSwXpHT
	OLjt+oEfAwrFfOnk+AvegHmO+NqQNotYwHye02dsv+sU2BXF5KwBdhwmozg+XEMF3lNjhUbd0tm
	5BEAg4O6c/9RfPX5ScFmZrDLz0jvcBLc4hbwiRtkdhdSu43gOm+pYwC46TkSdpN4dXbEL6Pt7RL
	lBbu1ZrNn4reo=
X-Google-Smtp-Source: AGHT+IHehAmfofHGYFTbFqjVY+/CGxCTfqLPgfJKfXQQ1v45fHzLXouKxqoKc2TF4X6rJ0/VNH1uNQ==
X-Received: by 2002:a17:907:d19:b0:b76:23b0:7d70 with SMTP id a640c23a62f3a-b7d23ad8414mr953158666b.39.1765719450477;
        Sun, 14 Dec 2025 05:37:30 -0800 (PST)
Received: from daytoncl ([109.245.167.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56c1b6sm1133979166b.48.2025.12.14.05.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 05:37:29 -0800 (PST)
From: DaytonCL <artem749507@gmail.com>
To: benjamin.tissoires@redhat.com
Cc: jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
Date: Sun, 14 Dec 2025 14:34:35 +0100
Message-ID: <20251214133648.307106-1-artem749507@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

Thank you very much for your help on the libinput GitLab issue tracker [1].
Your suggestion to apply MT_QUIRK_STICKY_FINGERS to the VTL class was exactly
what was needed.

This patch fixes the intermittent stuck two-finger scrolling and false
right-clicks that occur on some VTL-class touchpads, specifically my
TOPS0102:00 35CC:0104 device.
The fix has been tested thoroughly on my laptop and works perfectly.
[1] https://gitlab.freedesktop.org/libinput/libinput/-/issues/1225
Best regards,
Artem


