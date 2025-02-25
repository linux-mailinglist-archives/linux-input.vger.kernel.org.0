Return-Path: <linux-input+bounces-10309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D710CA4333C
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 03:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DEB03B30B7
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 02:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD931494DD;
	Tue, 25 Feb 2025 02:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbtOWqjN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6CA2D627;
	Tue, 25 Feb 2025 02:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740451471; cv=none; b=HP3noZWUOkyzPd87xuX79/imlOorSJnxudDc3uTxWreniR06AUsmLfzj2QlZH3b8kXrza/NIiE4D8fZ4qWMCkJPiv81bONGvHileBn26C0W6ApflFcyB+aMhieslIiIULtCyhnhAHtFaWr4vLWKdrn7e8iQH+fp49SOXwuQdR+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740451471; c=relaxed/simple;
	bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kOQsPMns9TfgcQnckEZEaCRE8tHF8porxocAVdyieV6jj17jQ09zlfDksqvhhzdP4ebfZKb421MkURmrLqLuifwK8SfBoMFipCPrO48jjZn9l7kH9wppr4E9IZyoJB+wRx7Nz9U6BL3K2PYx8TOwb15DRZR1AcVAfzIvNZ5ZT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbtOWqjN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220d132f16dso78538005ad.0;
        Mon, 24 Feb 2025 18:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740451469; x=1741056269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
        b=BbtOWqjNuXnaW63GAulbFVKN94bm6Edh+XAJA+1CmmM/AGqMweoXdwQJ9XvVMKbWVP
         /XK9fkMbYDv5snLvqOMUfzqHBO5e1MSMH4aawE3ZNzNO5tSwV4PEVs3w+1u2srDrJML1
         qrXl1wns/ZxjfK/L5U3BeEoPQ6cLjdIsPy0oHl9CmDaEdyBBb9ZYXNklcVJmEb06gjVi
         zlm7VI5w/dIePDDPW3f0with+VZrB64Gmau104lfSvAolZ3QUYeKbIGSN7EQXPYPeH8W
         vbnbEC1ZOEGsX/xFGJgUn5Q5LzJk5lNJs13hBhymzCGnfbb+o4kp3mU7lKdbFERg3Ngr
         kZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740451469; x=1741056269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kt9ywlOUWtxl3bNCRJlN+hKgBBWWnsihbbxIcbkZT4Q=;
        b=jPS6uZuRgtHkWgqB4SZ+X6pOOaDb9v3cyw9V3SCMzwdwi+/FeuiU/muPyBmGwXElHS
         rCAEO3ykw/MuQ0o7ZVQF/0TfRhhCX0woocOoe/0uImXESKOa6jgDcPNqM4Z5Dz2nl+3n
         S3yqemcKwYNHiiLfqParRYJUhHTI4VKQhVT00BQPKui0sjDvObycxC6G4h7Hscszy6t/
         eJhiRBxmeEb9K5rXfythL/r2bU9j2yRYy3KrdhKu3KZcRjQoLtVMS6+Own0Cs9P/iLGD
         4OX9HGuqJTTc/BYrpZVh1JuQVEsFRd+T+lNejRF9zkRU3n1HLY2EV/V/XY7HFT0LxuvS
         T6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0FQ7UHThttc8GD2YjHJSqJWj/6X6K36vIjCMfmG+A4f1MYnpJJEekrug/A6SSUaO9xRXkiI5visiH1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPk7jyMMIq2PjaAFDXraeO/zgEBRPpdeKsVCZx8BZWFq4hqbZ
	6fCHdtJgbPGUkMAswfj7gNQIw+En6UTPabNyVahiRiM6xLUoSNAlKhZ/Re17MUs=
X-Gm-Gg: ASbGnctyH3mNLkAqEkroZXRUZgczbT5eys5HXxgiIJ0eRjmX1kC7uvDqhclSfeU1pLg
	U85dSYkm4mjlsI2qzO1aBNKvVDt1nVLawSaU4raYfWlOBEH53QCT22l4Ebs/ZRcuVXluP1ebUu9
	1YrtcG+n2tuDjujxxFlAUHXsy4bRrjvh1ZZM1FrwvxpQKAc0Z4X9T0rtfljnZVo1jthTtt4Ng7I
	Z21pJR+hrkk5R8+NIOmggXerbscL2ma3dHMqA7lF5MYVbgzkHVZancSA/uHWlHIGUKeqYHcdpqQ
	YksSUed+PYAyaaapFHEwfylduIBN75/SIIcoZQunZZizYGqY0w==
X-Google-Smtp-Source: AGHT+IEQzrnRKbiZSHTCztWNwHBGF1FfWrC2aI6gd0YY9GFnSvYTDIQw9204wvyjM5oOdQSbY9iOIA==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr28626408b3a.3.1740451469577;
        Mon, 24 Feb 2025 18:44:29 -0800 (PST)
Received: from localhost.localdomain ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f9aafsm356943b3a.105.2025.02.24.18.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 18:44:29 -0800 (PST)
From: Weikang Guo <guoweikang.kernel@gmail.com>
To: Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	guoweikang.kernel@gmail.com
Subject: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen Driver
Date: Tue, 25 Feb 2025 10:44:09 +0800
Message-Id: <20250225024409.1467040-1-guoweikang.kernel@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bastien, Hans, Dmitry,

I am currently working on the Ayaneo Flip DS device, which I insalled Kali
Linux with kernel version 6.8.11-amd. This device has two touchscreens,
but only one is functional. After investigating, I found that the second
touchscreen has the device ID GDIX1003(confirmed by exporting thre results
through acpidump), and upon comparing with the current driver, I noticed
that only GDIX1001, GDIX1002, and GDX9110 are supported.

I would like to inquire about the following:

Is there any ongoing development or plans to add support for the GDIX1003
touchscreen in the Goodix driver?

Are there any patches or workarounds currently being developed or available
to support this device?

I have also reviewed the ACPI description and can provide the details if
needed. Any guidance or updates on this would be greatly appreciated.

Best regards,

WeiKang

