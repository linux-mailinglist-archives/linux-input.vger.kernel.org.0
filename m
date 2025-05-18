Return-Path: <linux-input+bounces-12417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1931ABAE7C
	for <lists+linux-input@lfdr.de>; Sun, 18 May 2025 09:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68B313B0E7D
	for <lists+linux-input@lfdr.de>; Sun, 18 May 2025 07:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86464156C40;
	Sun, 18 May 2025 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hluIhPiL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9CBD2FB
	for <linux-input@vger.kernel.org>; Sun, 18 May 2025 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747553652; cv=none; b=bPadU9ynU6kmxKiwaoRH3qDkGPX4Sm3TSUynVyMO9jMhcrXk0raShJab2hTC2VqCjYa2mqht2jMvrIcblrdJHLeOLKp21X1uAT2+ZzUi2rgGANqnA/x1YcQWFpbgbbHcxaJFxLaYln/0cy/5nWHLRqxqZRP29yFXzNkGzrNPsGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747553652; c=relaxed/simple;
	bh=9IjJq0eLpQP5KjFLt5gkjsvOnlAA5icT9O2HwZUZ0Hk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m+Mc+zTC7F9LQMwDCVrm0TA54bJjPO/9l8WP/OhNm5FAgJ1GRZxcBU1WTRCRZr7ijN2aM2+7gg3eus4XJ0aT76AOD++fmJuTZ456lcPUvwip1zqZp+AWx4V+eMl3Aq9STaNUbA3b45F+8bphAZ+2Flg3njgjmglR8NE7ufL4IAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hluIhPiL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e87549254so2652688a91.2
        for <linux-input@vger.kernel.org>; Sun, 18 May 2025 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747553650; x=1748158450; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kwomIGbvTkP0CRRfZPwbuNztpCuTUx1IXvzEgtBpYyM=;
        b=hluIhPiL9O/CliH71RAnGaOLuNfLd/2Uv9RtITQVsUb3Yg77/TTQAOdf3YTfHA/+1k
         YJVrozbOcQb//rHYlPSs4wDChugXbZP3FWgmLFYnU1w9qFq0tmMXDj5Aw6eOlSM+VQfA
         p1tOeNlSLxns3PjK1+kBawPrIAL/Q6VCyeNVLZGSbEKja6DipQZsEC2vRkIPrjwf9Aa+
         HdPdZLWNclxhH3T3qlBGU+MFhW4TIo2ApyeSQ5YrCI6czP+vF2AiYGiLlxnldfrurHJe
         /QOmER45bSdwe9DE1oJZYR/fIdGACi1/9eZ6z7qAPgLhTppvEFoe9WKKRyg3PHkj4Fo9
         5fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747553650; x=1748158450;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwomIGbvTkP0CRRfZPwbuNztpCuTUx1IXvzEgtBpYyM=;
        b=MflKDTilk38LSyogfh5Gl4gIjfYrc1dPlEPRdOurCqwVkSFY3VRnkx01Ey/ccYIrp0
         rorG/GE6cV4FkIfj3KZvhklZKLcGMnaZol7S0xn7YMVeZpW7CUj2lnC2Ssb/gbmYAeHn
         2rvZK7/vps6yIf+I7LT6ZvT1cL4ZXCYNNzAqjf50+bTeqajHKnHOrEI2mgdpevmuOkeS
         wYq9VtHerwSnzuRElAg7/Yl4dKHOlPs/PZSvEnWQAcfjoma78xMn446ukOxZSm4APTFA
         1igiP+U38OxGtR8JLe2aWqgelM4d2qfguCqgtgNOLL8RN3+WfSEA3WedJb/5u/KhwcpJ
         Ml1A==
X-Gm-Message-State: AOJu0Yyny9rPxlGIKZ+wivb7ENEt1pG+vrNLGHWAe5Xtpo+mbxELdpr1
	yX6fKp8I+wIteECYCKFzVe4POb1wU/dL9KKBc4CIFq9X1GSHBZUPg/NkageKG+emcNnqcfM25ty
	BXaHZEjPfiDGvrlIkSZVsHBqo4nb1V+N31pydjaA=
X-Gm-Gg: ASbGnct16xcbpxF4dHcX+foEthlGfiNGaZUQs1dbRgQHjANw1X7OL70hRkEpT558Q2R
	HUKR/zu9mn2d1MPlPGxLETaSE1pkUsBT/HT7thlbi3C9UkbwOBd47e8heEaUesIv15eGKfSxW2a
	6MF+a7hQPmQOzAWX16hcPZq2BHmEtHJXXLaWT0RxfyBuFrp+9JC0uxvHiE8cyqReCGKQ==
X-Google-Smtp-Source: AGHT+IHtbvDoW177Kee0W5z0uDdcqRTEWNVB5psib+DfHZDiHRLoEyy3tPYsAA4pKHMYyQxRPBOP2KuaSCJdDYehY7M=
X-Received: by 2002:a17:90b:3c08:b0:30e:6a10:bb41 with SMTP id
 98e67ed59e1d1-30e7d5a85c1mr13654109a91.27.1747553650283; Sun, 18 May 2025
 00:34:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ioannis Barkas <jnyb.de@gmail.com>
Date: Sun, 18 May 2025 10:33:57 +0300
X-Gm-Features: AX0GCFum1rVO8YSwAkvpIH8vWJtXW4T0A23OVomr4bGCU2JC2yk8tUM5aJo6fdw
Message-ID: <CADUzMVbe=9YgXfMtSDL-XAKhYnjuo-L6_s4pGiN1g1ibU-_G9A@mail.gmail.com>
Subject: HID apple error with A1243 keyboard
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello guys,

I am getting a wrong print with the A1243 wired keyboard:
[  339.368030] usb 1-3.3.1.2: new low-speed USB device number 8 using xhci_hcd
[  339.460199] usb 1-3.3.1.2: New USB device found, idVendor=05ac,
idProduct=0250, bcdDevice= 0.74
[  339.460217] usb 1-3.3.1.2: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
[  339.460218] usb 1-3.3.1.2: Product: Apple Keyboard
[  339.460219] usb 1-3.3.1.2: Manufacturer: Apple Inc.
[  339.469425] input: Apple Inc. Apple Keyboard as
/devices/pci0000:00/0000:00:14.0/usb1/1-3/1-3.3/1-3.3.1/1-3.3.1.2/1-3.3.1.2:1.0/0003:05AC:0250.000F/input/input18
[  339.556178] apple 0003:05AC:0250.000F: input,hidraw12: USB HID
v1.11 Keyboard [Apple Inc. Apple Keyboard] on
usb-0000:00:14.0-3.3.1.2/input0
[  339.558624] apple 0003:05AC:0250.0010: Fn key not found (Apple
Wireless Keyboard clone?), disabling Fn key handling

I get this with kernel 6.14. Fn key is present for sure and it is
definitely not disabled since it works fine! Same applies to the
onboard Fn key of the laptop.

Looks like the detection logic needs some adjustment.

Best regards,
Ioannis

