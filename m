Return-Path: <linux-input+bounces-11170-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BDA6EF3A
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4A83B9064
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1240025485A;
	Tue, 25 Mar 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiUhWRSr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3233EC;
	Tue, 25 Mar 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900891; cv=none; b=L/e0eqVvJrMPAMFja1TzoYhL9GsX+oqxGSu1Q6OuMW+ajqye1lJvjEQ4mAY+Z0Q1YvPK/c+1a3kbd6DAREdMhOcFQ8krM8jPS9bWZ1ke3nVAy+iXbEwZF+y3YsSJtl//aX853tUbnGK6NbI1JoJtpyWG4aokbIeCxKqkNM1KElA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900891; c=relaxed/simple;
	bh=1leBs/bX2B0XxpfXHTI97dfYMsqqtVRt/b/L2y/JfpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvLpBmEqYr9Gx0VxVH9y7EXETHPQ0OrtlM7HJVkH3rAAmMS20RyLZS18hLAsHHJs39NwkW1xLEd3UP9UHf61PxI9BDcwmQ+7dWPVEMD6x9m8XsgJ5oklTpTLYAapGBUHmudjBU8RUPzW+sXdLGVK2vAT6RSFg1QJmkExbqnaWEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiUhWRSr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224100e9a5cso104342425ad.2;
        Tue, 25 Mar 2025 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900889; x=1743505689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSR/yPgdo5mQOxkKr8mGXCvJKjsFs1WMt3KgBUjYaes=;
        b=QiUhWRSrArII4QKX4Xxldy4lAETGU7BZOO/Bcv5/5BjxrEZu3xt0roTmL9LbjgxUzs
         84MNuyk/bZp7U18yDVCbMF8WE7wIjyEJjmWduSTqY/DOP4s2bybdAV/04wVVY2lcYgHo
         Ct0WblozQTyZHgf5I3cuzSDAWVlFXTQ9zQAHDHnN+bY+Cm9GvbW1AAZIHa6v8pAZlMXf
         R3MYb3EAMuXiRSCBucju5yJTz6PKQGTGDjEwWByKJhrtTXeu5G8LWaOKqj1O3GIIGjFL
         Xpz/dOgdHgdYbABbB0JDvgRLXNE5lmZtcidAHdGexXZH2rA2Q6X+DzUQCfVlgh+f9xJ4
         hUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900889; x=1743505689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSR/yPgdo5mQOxkKr8mGXCvJKjsFs1WMt3KgBUjYaes=;
        b=GOIO2WXEgECUOZPJ8XeRGp7PBbZ4VpmrqhYTGOlldLG2i14/h6qun0mMG11aULlskz
         nHmlx9o2kKm1XKSAOXkVDx68F/NdBZIFq1G4YaTUIdxxOm8EnLkTUFM9XSOKZFi0l5ok
         VSXxyVcNix6xO/HNqseLkABtDtvHi4vsOkJrmQw46oxKTZO6nsp2tPtjYQ36MQfqt7PD
         IcFu6fE/BIXiGtXzQPCpFwCjCCrvWGzayTxqOkTfeOcHMfg27T1XEdn5mCAvIw1pqyX8
         /mDxIJbNct9lFRwbm3vHK665HPOCaHT+1EqFNhoITuzt4nZIaxclFVdeC3BASmyXcNEf
         g0/w==
X-Forwarded-Encrypted: i=1; AJvYcCVaVSKLTPTfiEulCqwFe3TldBCg/n0sxQmKp/sSqqafDQy4fu/rcID0/HAVO3q2pNOrBZD2lPr3eysuEFVj@vger.kernel.org, AJvYcCXfEx1+muk/WXzrBb+ljahsO/dTvDNHTO6Hxk36MSDmY+PQBtw+/psxXe1wciKAgIneMhUivicALXYJQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYw/ljGZHIWU6KRfb6WR4yP83xVlX+cdBJUIaqmbz1DBA+3n7V
	y33bOWfxylsowftKZRmRPJAJByVayklxurd/uy1a0HaTuvJluIzaFmoul+SKTNE=
X-Gm-Gg: ASbGncv/UxJSJVGz7BNkIrIKnhin3VpyaLYDUWgl9X8gpl3r6Rstyt8XKRjaSAJOmms
	pIpzXvz6oxODzV5RxVU/FXCKImJJjkdfbDuSZcwc6nW0HAYM2z1hdLPOnxlPJgnig6dm7+94jaI
	/7u/am8zQDXLU1BbNC2Q+wYfPp7VtFYY1po8uPv4x9Bl+pzeLuJM0bKgTsvPd1i0BTHZLRANCFy
	iHiciOjjqPvKN4aj8ov1iZLnqm6LEMwqQrDSqq6OXJyeU+WIIf8OEaIjfYdNbqWyCkvQyilRFhw
	FnB1ZJaw2DQGW7SJcipvC6/OyG8RON10uR02xjTVKEi53g4u3wUTORKofN1MVCPpWhPdosjKTWT
	0Xxh+41sZ+X8D+R86oyIfuPpU0iToSVUPOJ6iKEl8jNIAXA==
X-Google-Smtp-Source: AGHT+IG2pbHI1zE4oRLp+osnSlEnI00wGUlzgaRI+ptz0gqLuL38ocDmiLc9fUG6aWyqesPCLozXbw==
X-Received: by 2002:a05:6a00:1784:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7390598dd8emr23943228b3a.1.1742900888533;
        Tue, 25 Mar 2025 04:08:08 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:08 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 0/5] HID: apple: combine patch series for all patches recently sent upstream
Date: Tue, 25 Mar 2025 11:05:22 +0000
Message-ID: <20250325110754.28359-1-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last 2 patches add Apple Magic Keyboard A3118 and A3119 USB-C support.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard

Aditya Garg (4):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
  HID: apple: Add Apple Magic Keyboard A3119 USB-C support

Grigorii Sokolik (1):
  HID: apple: Add Apple Magic Keyboard A3118 USB-C support

 drivers/hid/hid-apple.c | 126 +++++++++++++++++++++++-----------------
 drivers/hid/hid-ids.h   |  10 ++--
 2 files changed, 78 insertions(+), 58 deletions(-)

-- 
2.49.0


