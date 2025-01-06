Return-Path: <linux-input+bounces-8973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A883A032EE
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 23:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00C118843AF
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 22:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB441D61AA;
	Mon,  6 Jan 2025 22:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJRMWC13"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7B1E87B
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 22:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204097; cv=none; b=idspzq/xn04Qte7LL3wuyodtvPPtBssZYby9UAnwoY2czeHP53Tje17VeHEvYkSiKDBkpoA0eFc+P1d6tJS2VK2SJ9k0DI5Lr17d1Kt5W+r2ISS08EZukYhJTYH3NYqnQv2NCQmiXGcsWy8G8UnHvClrk3b6UVPwdU2jB4Odlr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204097; c=relaxed/simple;
	bh=l19203LNaBNafhd2Ua/fc3WAvWEP+Kp3cVYbkDCXS4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzjZMhqpQKC5sg/dgex0Y6xhWrX6pAUrjFO/Lu/tKl7TV4/+x6UxIRBbsyef3ia5eowQEQ0MCcRukI9cO4nKTugxB/3Wj5cvNqNSWvIsbWRZC8UUhl37M6trYAmzbrVJo4r7dkFkfcRJHPZHCQYxuGYCUmpXOF6E0CdbYZhwFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJRMWC13; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436345cc17bso107910985e9.0
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 14:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736204093; x=1736808893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rdwuiQzpWuwQk36H2KyO4S3wh22TuBLL7SYQ4hcE36A=;
        b=CJRMWC13K4ztTC1tgDjayi35mgy+i18C6Y4m1wEjGRzk6uHboJ9opnQwudKT5sMvjo
         HqYwfE/erJlieU05byrf5o1Hlu4IdRzW1jnQiEn/ZSGg10psanAq+USOER1zgIOniKHJ
         TFyDiVyRtb6OMyygmeaMAKbGnuKiQYnq8810fOKTDufJcsaalzxUOZioeesmui4uj4IS
         lu3ffozjiifyhGm5Vntpj3wkB3jAEtA5C0zapNmVzbEPsHhuFjikdwuKl4nL/LD2R0Nf
         3Lv0DFDbz3nR+t7v5gV0HSH6GYoUCqdxy0dEFQ7Ao5zsiSmVsbQ/uaS0AGYANAMwcubg
         Nl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204093; x=1736808893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdwuiQzpWuwQk36H2KyO4S3wh22TuBLL7SYQ4hcE36A=;
        b=rv5QQDbN2PKqtq8E2BtY4YwLEp4nhPmsST+TljojWf5CEqWeUYKsFks2S5FgNLpbYi
         2DwEnN3UpEZsESmq1snrsf6TohuRKq4LyXIA+Up3w6lelTybrHf3HegngkbPd6rYpVpF
         9t7coH9ndA9HquEy+z4YnRpEHR+jq3x6MnvWLgJEIW6I8EDx0OYoZNf87YT8s9VpeKwn
         b++h0N336nc4c36q0AfFGz+uCTRAx6vhiYb738ikwaTVLti0d3g4kOv1h1DuFk1/lS5Q
         MiMjpfF/Bk5JbsQfxrxOFXY9MuuUpb0cwoS7eyD0j+6XFUblpadqXY/roRMlk6p4zYZC
         /0bA==
X-Gm-Message-State: AOJu0YySr0MLGfCCT1b3DCVywAXKrPlE3E6baGuwe7aUqvtjR6MOWX8n
	XgPoBrp73KgSRL+aZfQe3+d+CQ17HvtZuujR0vVNCd/qtCRjqKlV9VGjDE4DgWDBog==
X-Gm-Gg: ASbGnctThZ8iQJ+KLqP/Nil3X7dVrAON7rO6piXp3CxaUnEGRZ/azWPgRcOwdn8ukHL
	tFCWfFtfkSoqzyLnvqHlFFC5kuZdNoYibq0ALXmWKKpHHEBVUTtM4K11dpmIzSk5Q0XTZhGWh5f
	zs8pJDKYFImsYaO9xkx0GRpfP5oAxj/qKoeZMHcwFZKXnFIxslwTjx+BK/5N3y5vdfkGMI7kS7V
	4PEA6Bt2vOAuuWlFNUlRWFfRjbV8s6tDDEBfJbnSOPZCWc7UD02rL64Oq3CklHDuc/P
X-Google-Smtp-Source: AGHT+IFAtx8qLYrWIsYmaHmtVrrJ/ZAZOH0zc2Yt3CamsIL7F1+IC9S5+I+E1UHFejNCad5FdKUWWw==
X-Received: by 2002:a05:600c:3150:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-43668547374mr394141575e9.1.1736204093077;
        Mon, 06 Jan 2025 14:54:53 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b48c:8600:daac:3967:7eaf:8e73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm586000725e9.6.2025.01.06.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:54:52 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 00/10] Input: xpad - sync with github fork
Date: Mon,  6 Jan 2025 23:54:27 +0100
Message-ID: <20250106225437.211312-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Rojtberg <rojtberg@gmail.com>

This updates the list of supported devices as contributed on github.
Compared to v1 bouncing patches were merged into one with me as the author.

Fernando Petros (1):
  Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING

Greg Savage (1):
  Input: xpad - add support for PDP Mirror's Edge controller

Jack Greiner (1):
  Input: xpad - add support for wooting two he (arm)

Jocelyne Jones (1):
  Input: xpad - add support for SCUF Instinct

Leonardo Brondani Schenkel (1):
  Input: xpad - improve name of 8BitDo controller 2dc8:3106

Martin Stolpe (1):
  Input: xpad - add USB ID for Nacon Revolution5 Pro

Matheos Mattsson (1):
  Input: xpad - add support for Nacon Evol-X Xbox One Controller

Nilton Perim Neto (1):
  Input: xpad - added unofficial Xbox 360 wireless receiver clone

Pavel Rojtberg (1):
  Input: xpad - add multiple supported devices

Thijs Reus (1):
  Input: xpad - added Turtle Beach Recon support

 drivers/input/joystick/xpad.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.43.0


