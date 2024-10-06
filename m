Return-Path: <linux-input+bounces-7103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA633991D1C
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 10:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 700C2282B89
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 08:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED15879D1;
	Sun,  6 Oct 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nH5PECIz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C90615A85E
	for <linux-input@vger.kernel.org>; Sun,  6 Oct 2024 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728202364; cv=none; b=CwHS04otVyJkQvtIBDMkS67EuCkBCxdPhD6mYnhm8/0Te27mhtcxbNpN8knIX4GGygXQkJRZGi0w9Mn1/jbudnKxX09u3mimFgQdwt6wY5bQpBuyej0/qtthBa2Z9Pbo9KcW3+K+TbI0BXnf0/RhQ/5Nx7Mwh9zhHNYsU1KrbCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728202364; c=relaxed/simple;
	bh=KD7UHE9mz88zfmNXNjlGzqnTCABN4J6sPdgUTXbn4xo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lzI/pD9BwELfgUkHllGLR3zM1Ct8zrIbT4Dj+3zk+WZr8B0UrRcQxys/Gx8DJyLSQrbifFLPcMVUGYPN8CzOk3EA8zfiIfr5FYipYbkIaD0CHV/Q34pzM2KwujdLf0ORE4pDJYej0KywtwBqW1QVfSzKTnda66uSgE0sY4U71zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH5PECIz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbface8d6so44443665e9.3
        for <linux-input@vger.kernel.org>; Sun, 06 Oct 2024 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728202361; x=1728807161; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUzIAr4QJbEJmQTNXTBARxjvnFV0LoOo5q5XpEHeoIM=;
        b=nH5PECIzopDRPOK3sMx8v44jk2oFoyQo4UsYAU2EArAJWGbCmeM/6SrjtTtFYh082c
         mQXt6r2+Ktz0Xr4lj4gZKGXfXSBHIhmVmwMFAcHDV69ypch4bpyNptuucd3zROy4m/1y
         j1ZIIc78S3LNm3/Se4kbWY8jBLa6Ba3E9QUBgdwKvoo42uLhNl78/t0MJpQv3Zc1bSX5
         3Di4/08RwF1Jh/88TGeW3ehDBRLiU7r7v4I0e/3YgPF1P917eXm7zffkZppBwdp95pLc
         2+YLAHAMt9oY8j/gl+DTGHr+KywICn0/M7MEVDN+f2k0tbsRfZFm6Cs79wAms8xMZ2Ud
         Zk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728202361; x=1728807161;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mUzIAr4QJbEJmQTNXTBARxjvnFV0LoOo5q5XpEHeoIM=;
        b=JTaj3drIQGGmznPLroBY6cfmls9sb9dWxrKqCUEY+/h3QD766189OgPjUmO6F6fNS6
         P4/Ia52dGLXT8TFoxMCkfr0n1M5urZLxUhEjB1oLK2C9ULBwmIvRNfPKxJrQYmNkw64j
         4ORexRxGPZBq16qr3f4sB1xvvrdra1bnZ84OoZ5GCFsD+x/ZxTrhRQd5FU9jUvTPDMTz
         IyqqsvU8u7OYQ40YANbpySQJzPnwIiBEz20AcM+8fchZXd/mxfumWxmm1AhM5KVzd8TF
         sxWzI+nkQPzlpNB1Ne/72JfKjMtHqUV0YGfypdGRtvla4Lcm4TTs8YN3Mydik98JMBzr
         oVWg==
X-Gm-Message-State: AOJu0Yxt1uQuahrhMDJ/PfVmTwst2IPiuLgIZgCa1yGgT5oh0aoK2YQ+
	SRj9kkIpLaSS/UjcB1oilIeQ6Bg5E8Qt+9y1iQ6txJu2b7TYvuiU
X-Google-Smtp-Source: AGHT+IHOnCtNSOdRD5emktb51pbsKhcaPBE8LnWXpPBMWGQ58+6JJpdAEG+LiC6RI7Usy3xsJiy/ig==
X-Received: by 2002:a05:600c:1f96:b0:42c:bbd5:727b with SMTP id 5b1f17b1804b1-42f85ae974emr80177505e9.25.1728202361289;
        Sun, 06 Oct 2024 01:12:41 -0700 (PDT)
Received: from [192.168.178.62] (p5b3cf506.dip0.t-ipconnect.de. [91.60.245.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e89624sm40852055e9.12.2024.10.06.01.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 01:12:40 -0700 (PDT)
Message-ID: <1917062e-1c6e-43bd-b33a-5d40eb5c261c@gmail.com>
Date: Sun, 6 Oct 2024 10:12:23 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org
From: Stefan Blum <stefanblum2004@gmail.com>
Subject: [PATCH] HID: multitouch: Add support for B2402FVA track point
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

By default the track point does not work on the Asus Expertbook B2402FVA.

From libinput record i got the ID of the track point device:
  evdev:
    # Name: ASUE1201:00 04F3:32AE
    # ID: bus 0x18 vendor 0x4f3 product 0x32ae version 0x100

I found that the track point is functional, when i set the MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU class for the reported device.

With kind regards,

Stefan

Signed-off-by: Stefan Blum <stefan.blum@gmail.com>

---
 drivers/hultitouch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..3f93c5ef6 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1992,6 +1992,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x3148) },
 
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ELAN, 0x32ae) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
-- 
2.39.5

