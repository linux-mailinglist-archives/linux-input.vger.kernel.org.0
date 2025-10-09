Return-Path: <linux-input+bounces-15350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE7BCAFBF
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 23:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A1184E3748
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 21:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1B82820B2;
	Thu,  9 Oct 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd6tSyeD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A8923E347
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760046859; cv=none; b=Tqxr3esanBb97TiWJyy40z7Kq64m71X9IuEV2PjXiGOQciVaOHwtjnXkp2SfXQiBXJidQenpkrSMAFEYSoCOYljG0hUv+cVKj8k9XkW9HbVp/O7O78myAfC84JpRkvI20yeKILKpT1KK2NlctB6pBx6cEmFqszjSIz7DDhXWS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760046859; c=relaxed/simple;
	bh=gXBDywjGeq9LlC2t9UMC0FW0a5wxk7ApsIrs5Nl8D5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9kwc8uSZZk1qCGwJi9uA8aO4IYSe7B0fp7Vy2aTG3KYR4t5s54i8qOeNMcQOl6AOAm43vqpaulv1V7MNOFRIhxJEf+guWD+8hfoCs6uOJ9RBM/FTX8Kb1+x79XIxcyzcGpi9F96XQaLNMcPbeobQnZUrFo+926Ynj9/dJZz/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd6tSyeD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3f0308469a4so896639f8f.0
        for <linux-input@vger.kernel.org>; Thu, 09 Oct 2025 14:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760046856; x=1760651656; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYrLT5+YL7SchreZQtNmxDKTeAuZvInpUXa240RkuDo=;
        b=nd6tSyeDuUagZLiFzjIwXmjH7z00uN+H2v/ZXoSY4MZfhaOkg/FyO8mwsmiB5YffDN
         elpKoNKJEQeS5hzyBsU/3/G+rNLQHvV4BAvizrECqXQIRxqBveChouNwxrl8yRQGlfcc
         cdmwlFmmoF1K2nM0EbcaQrIuTt69XVamS0uVD9fCJ5PjzdRhsoxJec4dtlaSfC+nvjX8
         6xc6nsaTB29282tdB+oKYNcnKpgvUdFGKoaKTDvjCjJuwNFoLlZLvDOsABuNAeDQdENv
         FshVyiVSYgEa/en0qOzUwQd1LB90gu/jcX2C/eq9K5k7S5S9BPTEfvZAMSFZ4BXQdb4F
         d7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760046856; x=1760651656;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYrLT5+YL7SchreZQtNmxDKTeAuZvInpUXa240RkuDo=;
        b=f2uzM+ED0aGCl7sUjER5HRxrbM+WS2lPuIAVT2EPt7raOjHUyperPVH2kp8lbFJ5O2
         CL+yRqPZZnpslqmwiRbG0yZzBHKmK5f4r+6V8+r2dBKRUnG5WMbeNV9JixsClDYnUzwW
         pVCZ0tHuyLd9+LNIcOteJyoiOqrlJ0Wx43NZqWJWJl6Als4mbL4HUSxxSYF8krbdmRjs
         ccDXEsfZvMp2+PymCqer0kqwQD2u+3ApUYT3TDRBQBPlVQANII8nrPq/uTaiXbG17isd
         dQ7Pm47g6Ihw2y5CGme7z01FtElI2Avjl409D3lcrXReL9yTQGfYzbwprKdK2VacUK2y
         9cmQ==
X-Gm-Message-State: AOJu0YxF8vIywCgRLOFIzHImxXap0M4bIdUbVs/6bTwO65Ap2zrYzh/3
	ho9NLV7UaFYlbAOvaEygoMXGQWL5zmSxP3Jyb1TFudkU4HTlwgC8DWJ7/LMsFenqj7o=
X-Gm-Gg: ASbGnctpALyLH0m1yJkdtQHIl3JqtqRAPvI2fjhb/EQaQzGEnn1l1HDSomkRAYuksuC
	eQ8HX6L+bm4wOfbPXDr3iHuu71SaKIq2fUQ/8Ko8NramkqAfMjhPDYbCMEQbNDsXg1dowPu5v64
	fx6oBGwPfGwbPkxhJkrWA2VmU8OlD0RsyN04PVxYwkCJ2ehPIhCW0RyfIFWDXFSOaCMpm4QGQM1
	Y9qkf5ttR5PcKFQfn1zHJ7Bb2miUvS6Ny8mMhHTOEl/B3N9cUcJfM8fr8YukDXQFWcSoDASD4lU
	+ey7MwSySCTwq+Xld0TBxFIMsFltoBfch4oRvC0E20jMVR6l476yXZ8Y4tZ5SonqyI2O32dITpS
	1144ngaGzNHKOutwXfFi2p5MA3m91kBTcdE8wYTjsDq2K3Hfe9vj5kSCXn8Y6f2WPmk/Bv9W8M4
	D6rCwaS/1zwnmsPqk5zsxxYZ74CjUSirmk7/coUA==
X-Google-Smtp-Source: AGHT+IH6unq3fwJStyKxb3aYNyoIrs1tVaFUGtChCu+P7SFVmKYeQyqAUUSgg/3j49+m5bGmrEg8Cw==
X-Received: by 2002:a05:6000:1861:b0:415:b650:a775 with SMTP id ffacd0b85a97d-4265ef6bda9mr4981364f8f.0.1760046856351;
        Thu, 09 Oct 2025 14:54:16 -0700 (PDT)
Received: from ARSENIURE.localdomain (lfbn-tou-1-1184-225.w90-76.abo.wanadoo.fr. [90.76.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc0esm970986f8f.6.2025.10.09.14.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:54:15 -0700 (PDT)
Date: Thu, 9 Oct 2025 23:54:11 +0200
From: Lucas GISSOT <lucas.gissot.pro@gmail.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org
Subject: HID_HAPTIC=m prevents from linking
Message-ID: <aOgvA8Jiofcnk2xb@ARSENIURE.localdomain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I played with `make randconfig` and I managed to have a link error with
CONFIG_HID_HAPTIC=m
CONFIG_HID_MULTITOUCH=y

This is my first mail I send to this domain name, so I might do
something wrong, but it seems to me that the
#if IS_ENABLED(CONFIG_HID_HAPTIC)
in hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
Kconfig updated.

This is the ld error:
  LD      .tmp_vmlinux1
ld: vmlinux.o: in function `mt_feature_mapping':
hid-multitouch.c:(.text+0xbfe86a): undefined reference to `hid_haptic_feature_mapping'
ld: vmlinux.o: in function `mt_input_configured':
hid-multitouch.c:(.text+0xbfeffa): undefined reference to `hid_haptic_input_configured'
ld: vmlinux.o: in function `mt_probe':
hid-multitouch.c:(.text+0xbff996): undefined reference to `hid_haptic_init'
ld: vmlinux.o: in function `mt_report':
hid-multitouch.c:(.text+0xc001a3): undefined reference to `hid_haptic_pressure_increase'
ld: hid-multitouch.c:(.text+0xc003bf): undefined reference to `hid_haptic_pressure_reset'
ld: vmlinux.o: in function `mt_input_mapping':
hid-multitouch.c:(.text+0xc00607): undefined reference to `hid_haptic_input_mapping'
ld: hid-multitouch.c:(.text+0xc00853): undefined reference to `hid_haptic_check_pressure_unit'
make[2]: *** [scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1

I tested from a defaultconfig for x86_64 plus the changed on HID_HAPTIC
and HID_MULTITOUCH above

Please let me know if I made something wrong in the Cc or else.

Kind regards,

Lucas GISSOT
.

