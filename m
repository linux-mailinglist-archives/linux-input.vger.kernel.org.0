Return-Path: <linux-input+bounces-7937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F39BFED7
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976FC1C2350B
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D0A194ACA;
	Thu,  7 Nov 2024 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3tU7V3p"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B702194A64;
	Thu,  7 Nov 2024 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963749; cv=none; b=c1YXoXj49sDv7ufzDFNadPC6BHR5NaKvfM2cH3i8P3WQqhnd6fSmapQrgzDgpBGQWnLx8syfZmItoEl+J/OZdyeThs37mlkJav8gRRd9azXfXC6va9cNbzGYe4p0zqGDw5Bea8M/46bV7oZkPhccntZOgwljsq6Xi65DHjgeIwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963749; c=relaxed/simple;
	bh=StPZtgZrP3cfKw2LuXqc0yvM8XpGu3Oxa61WVWaKkag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pIA3e4ZL8Px56FkoHoJtWDAQIenRCS1I+8qYc1QRakwRiajQH5kpPbskpOQmZqXPA1JLH64gG2OdOcxArSlxOLSid080AYM7IyiWfhKCZ2LkwL5pn+Pt9GRhSg3QpvNjbRu1xSYYmdyQHNlzXjUQIRUiSzjwlL4RxddUcflPhM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3tU7V3p; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20ce65c8e13so7174965ad.1;
        Wed, 06 Nov 2024 23:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963748; x=1731568548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XugANlrRJoc5imX6IFY4wDLf6acAC376qU8Czox1DSQ=;
        b=K3tU7V3pZvSOQrPURNReSPNtc+IJvxbPkRaF/kei2qywzM1B3geu9am4WqJx5wA948
         D4FCtOqdjxfglBVbvJrSUveVmAl5wKT4XGh81PrRmLmPnJZGpVqbh6VSO5Jwq1/pt8Up
         aNCCtO6URpDNXvQppFQrSEY22+S/JFbhp3qA5lWqS9XkKvQAhjtMxIsSPhoydNwbtLs5
         dJjR3cEq65UwUhUcOG2veBTqxIOC7m3WC1EQ6EPeQY9NELiD5C8n5rmDzvwxnvaK7lCU
         qB6khkSeQ0Xd/c3+MOzT7HMjGPni9O/AnLjwNMzneVZ0oySw0WAteeoHeyGbg/hR9f6M
         zYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963748; x=1731568548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XugANlrRJoc5imX6IFY4wDLf6acAC376qU8Czox1DSQ=;
        b=O25NXiCFQuIwgQwmeqgMijAvyKZobguiJDw2fbzyx44xiVYJ0JtXEktBMxW1g9wGO9
         gHaRA14mmL9SgIEwUI/2b/vJD9IsVLL3lfwdYhdn4DDEetqPTc24lZJK5eeDJ+RV9nh5
         K9nEz5HIcQggvL7wtiMtiIDeULkVi8P/btsORXHEmpX8Yp0gcL2tYjWOkJtzjgiBfqYR
         FVoAv1XOD7zW8QiXdcg4eoWXbabR5hkhZM2YQvudbkfTJUdzXGrfp1X6GKnbLV7zf+fR
         anDR179R9r1jCgmVc/EnF6izYRQFAS/7tCVMEgkGjTIIZLb2hjes0+9MAYvOR4mMs+s4
         X82A==
X-Forwarded-Encrypted: i=1; AJvYcCU3vXga2otXbhc9dOP4rbwZ5wuVvRGd8UUpU+2eTCRXJM6YAYQDlrXlkz/YJ6Dk8eJGgha3NPKyVyI9wcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYXEv41l19zBNdJ9k8GUt8KsfAyeOdtSwmtkVlH+xTKVfX4kq
	ykwfEbecJ5JD9R4m5uYSDpunKkrApLRbXQXAo0cFj9A5jH4wX8yC2ciRyQ==
X-Google-Smtp-Source: AGHT+IHLw+GXDSYTNFcCkdKn6c8KnFpvjXYThYkaoRtOZ/7dap08vunrXRuKf0iaCSxWYLuoismaPg==
X-Received: by 2002:a17:903:1246:b0:20c:5cdd:aa7 with SMTP id d9443c01a7336-2117d2ee568mr159035ad.43.1730963747719;
        Wed, 06 Nov 2024 23:15:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:47 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Convert input core to use new cleanup facilities
Date: Wed,  6 Nov 2024 23:15:27 -0800
Message-ID: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts input core (but not input handlers such as evdev,
joydev, etc) to use new __free() and guard() cleanup facilities that
simplify the code and ensure that all resources are released
appropriately.

Input handlers will be converted separately later.

Thanks!

Dmitry Torokhov (8):
  Input: ff-core - convert locking to guard notation
  Input: ff-core - make use of __free() cleanup facility
  Input: ff-memless - convert locking to guard notation
  Input: ff-memless - make use of __free() cleanup facility
  Input: mt - convert locking to guard notation
  Input: mt - make use of __free() cleanup facility
  Input: poller - convert locking to guard notation
  Input: use guard notation in input core

 drivers/input/ff-core.c      |  90 ++++------
 drivers/input/ff-memless.c   |  17 +-
 drivers/input/input-mt.c     |  34 ++--
 drivers/input/input-poller.c |   4 +-
 drivers/input/input.c        | 339 ++++++++++++++---------------------
 5 files changed, 184 insertions(+), 300 deletions(-)

-- 
Dmitry

