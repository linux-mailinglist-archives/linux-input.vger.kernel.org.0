Return-Path: <linux-input+bounces-15963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23FC448C6
	for <lists+linux-input@lfdr.de>; Sun, 09 Nov 2025 23:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A293E188BE4A
	for <lists+linux-input@lfdr.de>; Sun,  9 Nov 2025 22:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB74233D9C;
	Sun,  9 Nov 2025 22:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+F5H1cI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E22E63C
	for <linux-input@vger.kernel.org>; Sun,  9 Nov 2025 22:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762726342; cv=none; b=U2VHPiRffUfvfmMsgHQ9iER89K/0c5ZIKbCiM6hRP+fvKMvV11rLMPnIqLQm/4ZEM+l4ZLsdUZvLTTzh26UiMekYlH9UWzeo+icPj0cUO86bcc3hq6SqH0nsYoxl/lI0HIM6Ojb7A1in4QtSsUPOU6R8aROEfZRlCDQynPHfxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762726342; c=relaxed/simple;
	bh=Rwa1HbPJN67eY6r6jVf/kR/CdGG6MPx1KlADWgCTY6A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AEMhDiEjUlSKPAwuDo5fOMzXGUoBIyCEkLTMrd2VgsjaRonrncUVHyDkh93ATmY3bqo/GezD2qWdiNTlTvHC6AtKrV1alul0qOCXo1hpGH+LgBp/qyILuJ2S7n2kkwSj10D1UwmX1J2BR/GKum1as7kSfdue9n1SKOBpvZCar+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+F5H1cI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso1417962a91.3
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 14:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762726341; x=1763331141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DFsBETvXgqZ1T0X5UFRVFW6GxEeHjVXbMpngsT8Lpzw=;
        b=N+F5H1cIv3oKu5xKmHKFuVyeYTdrUYBi1t17y0JUBhhAw4q06RDbSKKLcE4SCmAbBe
         epZk/ia9j4CQHnhdUy2ejFQJP/6OeO1nmgcXBidEiuJfdAuLt+j6Z0o2JENofMOd3XAq
         eY3HNEEoDj8rH1PcSx9Z62byk0kznfE5xDHHsVRC52RjSvvH11IQ2O5wSujl//ojqU6i
         IMDOCxyzf37G1rD7TbHJ0mXSpHOdSj0IlIGubkokbMbgB9ebfows5/riaqG1sq0xg9sG
         kalMjeXEynsVcZ8TRM2+Ek+jPne+AEtUj9LnR9Vx06cyVq9uTuflWsR4oU2HJcugZJ5k
         pTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762726341; x=1763331141;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFsBETvXgqZ1T0X5UFRVFW6GxEeHjVXbMpngsT8Lpzw=;
        b=J37GezbVGDSq0VB70zdGultF5bAsQcwSKx1dmhXcEQigWBp4ze8zXm9Q6iSShegPpM
         DSc9UJ8mh9cYuD3gRziLSun7nZpT1SD2Qe7jsDySBTFFd/0QCurFiQOvuHGm9IFecwaj
         447OU8IOxavqCZqwVMhoMPrgc9NQcKEEVEOFbuh/mG2NjDqVvq4XXl7wZDPdgY0KfiQP
         99tTiCDFoEUJGs5NHF86BFYkh69WjsPqZTKGQ6dGKdssFkHrpMxBFJ+0Uh3AecHTxK31
         GH1uRKq/k2bT5BoKDRXzU3qgdtwTbTSOnni9l0ud6Twcbc4oR3bUs5YNg04gdhOSQNXi
         kV5Q==
X-Gm-Message-State: AOJu0Yxz43Ks9XkTRskY2CxL2PzEql9s7Nvjk+CHuvpY5yNNrHYvVFaH
	2Zw+cmzpy9KwyxaLGUObLayeQr2uACrrvBCT/Ji+oMrHmfxnh3soQIzm7ixHJ4rczrYrVvlXbjR
	ktBM/SICy8MSLFpdibgANISeo8MKtuIA=
X-Gm-Gg: ASbGnctv5vDzSSx7GVSb8AGvDI/8BaAhPpnrQ5dSW18VUB/y4Qrk2EEOV90OwTie1fP
	Nt0PwwcKRcwtioC33UHRuh+fTtwe0fqIrlgH+hNbJQbb52ag7XwNyD5ywhzYXrgNx3h3dnc5Nxd
	XdBeNzvpPDZjVoyeXfC8q+22f2KD+/VwewXl3jiEFTpRlum8WilGc3NxhKqWgDS4q3dqCbljVIr
	hfBY69kFQb+9X7TKWXamlExxoyItymFyhoHnnIm8XLkLXEFyKleoLYG+ApLxZv4CTht2A==
X-Google-Smtp-Source: AGHT+IHYT1Y3l3e0CbliEMc6+JSmR3GV531okxpdpp1oZRz+jUr48EgzUXlwtBcN8j3fd9xawAVXm4vtI36efSsIUso=
X-Received: by 2002:a17:90b:2d0d:b0:33b:c9b6:1cd with SMTP id
 98e67ed59e1d1-3436ccf9d96mr7997626a91.19.1762726340648; Sun, 09 Nov 2025
 14:12:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jon Moeller <jmoeller@gmail.com>
Date: Sun, 9 Nov 2025 14:12:09 -0800
X-Gm-Features: AWmQ_blDm---tojiSSK-FZc63nLB6724nh5cUvbCzNbt4k8Cp9pn0N_VcZB-xBU
Message-ID: <CABWf9sZuKy2=XjSo7WAB-9KanvDjhaXn-8P2J3_z2LgtcpwWDg@mail.gmail.com>
Subject: [PATCH] HID: multitouch: Add palm rejection quirks to HP Spectre Trackpad.
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch fixes an issue where palm rejection signals from the
ELAN trackpad in HP Spectre laptops are ignored, causing lots of
false touches.

Signed-off-by: Jon Moeller <jmoeller@gmail.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b5..cb5d80172131 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -229,6 +229,7 @@ static void mt_post_parse(struct mt_device *td,
struct mt_application *app);
 #define MT_CLS_RAZER_BLADE_STEALTH 0x0112
 #define MT_CLS_SMART_TECH 0x0113
 #define MT_CLS_APPLE_TOUCHBAR 0x0114
+#define MT_CLS_HP_SPECTRE_ELAN_HAPTIC 0x0115
 #define MT_CLS_SIS 0x0457

 #define MT_DEFAULT_MAXCONTACT 10
@@ -420,6 +421,13 @@ static const struct mt_class mt_classes[] = {
  MT_QUIRK_APPLE_TOUCHBAR,
  .maxcontacts = 11,
  },
+ { .name = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+ .quirks = MT_QUIRK_ALWAYS_VALID |
+ MT_QUIRK_SLOT_IS_CONTACTID |
+ MT_QUIRK_CONTACT_CNT_ACCURATE |
+ MT_QUIRK_CONFIDENCE |
+ MT_QUIRK_WIN8_PTP_BUTTONS,
+ },
  { .name = MT_CLS_SIS,
  .quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
  MT_QUIRK_ALWAYS_VALID |
@@ -2148,6 +2156,12 @@ static const struct hid_device_id mt_devices[] = {
  HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
  USB_VENDOR_ID_ELAN, 0x3148) },

+ { .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x32c8) },
+
+ { .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x310a) },
+
  { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
  HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
  USB_VENDOR_ID_ELAN, 0x32ae) },
-- 
2.51.1

