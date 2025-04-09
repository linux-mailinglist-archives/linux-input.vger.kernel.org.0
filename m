Return-Path: <linux-input+bounces-11575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE6A82488
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 14:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F6D2169E7F
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 12:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A663A25EF80;
	Wed,  9 Apr 2025 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2vDAyU7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FE725E81F;
	Wed,  9 Apr 2025 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201307; cv=none; b=SUDKNRyQz3y6VmL7hgAN9Jq4FOB7fdNATDLpwzJiofctui8j3r1gkY5/4z0w7gJwMSQYrLujwfdTBlbXqzxU4fNRPmkdh35H6xOx6B420ijmYw6mVKLFTr/9FpjVrwNGA/xOiLq6cgLOtbA2dm8UmdskI5GERRsrRCx4e8ybloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201307; c=relaxed/simple;
	bh=4t4Wq5bMUS44d/UJ61XjcweeMUI0dgxkR3h8v0acrhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=CTPo6uEaasCSxvc/gAR1uubigatZrjckVd3QJ9L1QN5mzpOmYTpLWa8AvIdZ+cHavbRu8ZUqfnFYezwa+YnVFy6sRBWqHY5WmmNStTN6b0sYv9kf9D8U8Gv9QuMgqSB9Fd+ba97FacsFSgrzu6nQwa0Osm/81eCk1eMYfUVElVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2vDAyU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74ABC4CEE3;
	Wed,  9 Apr 2025 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201306;
	bh=4t4Wq5bMUS44d/UJ61XjcweeMUI0dgxkR3h8v0acrhI=;
	h=From:To:Cc:Subject:Date:From;
	b=l2vDAyU7JVulITVyTZqYR1Pj8WUo/5DgHVTiooGnrvirjqxu+CDAVux+rqjtFMR5j
	 vFcg9KmzA8x7AUxwcZcdmYUTnbugXXdYK5A9Ebq06Rdr5fy3jnnM7rK1lYd5t93rru
	 F+BY7RbPTG13EpGd3f1bEOnoLqra8nmNXresuF90QazZARU+OlsiJt33DsgcfsUEyr
	 CxB6rYRae5Hv5vXHqY1gnkks/fS5k04Aa5NY873rE/NUyIqjo1ADwxEwktbxJAjzFO
	 diLG3vQwwIE8ZZlCATWo+T16oYgxm2kF85ifEqATMlwVhDeB7gbS2XG+i4LYHkHq7E
	 sl9g4tGHgM3Ag==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Kosina <jikos@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Rosin <peda@axentia.se>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	iommu@lists.linux.dev
Subject: [PATCH 00/10] -Wunused-const-variable warning fixes
Date: Wed,  9 Apr 2025 14:21:31 +0200
Message-Id: <20250409122131.2766719-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Most patches I sent during the previous kernel cycle have made it in, these 
ten still remain for the moment. Please apply.

Arnd Bergmann (10):
  drm/imagination: avoid unused-const-variable warning
  [v2] clocksource: atmel_tcb: fix kconfig dependency
  [v2] Input: stmpe-ts - use module alias instead of device table
  [RESEND] mux: adg792a: remove incorrect of_match_ptr annotation
  [RESEND] sched: open-code max_rt_runtime definition
  [RESEND] lockdep: change 'static const' variables to enum values
  [RESEND] ARM: fixmap: make __end_of_early_ioremap_region an enum value
  [RESEND 2] comedi: ni_atmio: avoid warning for unused device_ids[] table
  [RESEND 2] apm-emulation: hide an unused variable
  [RESEND 3] dma/contiguous: avoid warning about unused size_bytes

 arch/arm/include/asm/fixmap.h              |  9 ++++-----
 drivers/char/apm-emulation.c               |  5 ++---
 drivers/clocksource/Kconfig                |  4 ++--
 drivers/comedi/drivers/ni_atmio.c          |  2 +-
 drivers/gpu/drm/imagination/pvr_fw_trace.c |  8 ++++----
 drivers/gpu/drm/imagination/pvr_fw_trace.h |  2 --
 drivers/input/touchscreen/stmpe-ts.c       |  7 +------
 drivers/mux/adg792a.c                      |  2 +-
 kernel/dma/contiguous.c                    |  3 +--
 kernel/locking/lockdep_internals.h         | 18 ++++++++++--------
 kernel/sched/rt.c                          |  6 ++----
 11 files changed, 28 insertions(+), 38 deletions(-)

-- 
2.39.5

Cc: Russell King <linux@armlinux.org.uk> (maintainer:ARM PORT)
Cc: Jiri Kosina <jikos@kernel.org> (maintainer:APM DRIVER)
Cc: Arnd Bergmann <arnd@arndb.de> (maintainer:CHAR and MISC DRIVERS,commit_signer:2/2=100%,authored:2/2=100%,added_lines:8/8=100%,removed_lines:10/10=100%,commit_signer:2/3=67%,authored:2/3=67%,added_lines:2/11=18%,removed_lines:2/2=100%,commit_signer:2/4=50%,blamed_fixes:1/1=100%)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:CHAR and MISC DRIVERS,commit_signer:1/3=33%)
Cc: Daniel Lezcano <daniel.lezcano@linaro.org> (maintainer:CLOCKSOURCE, CLOCKEVENT DRIVERS)
Cc: Thomas Gleixner <tglx@linutronix.de> (maintainer:CLOCKSOURCE, CLOCKEVENT DRIVERS)
Cc: Ian Abbott <abbotti@mev.co.uk> (maintainer:COMEDI DRIVERS,commit_signer:1/3=33%,authored:1/3=33%,added_lines:9/11=82%)
Cc: H Hartley Sweeten <hsweeten@visionengravers.com> (maintainer:COMEDI DRIVERS)
Cc: Frank Binns <frank.binns@imgtec.com> (maintainer:IMGTEC POWERVR DRM DRIVER)
Cc: Matt Coster <matt.coster@imgtec.com> (maintainer:IMGTEC POWERVR DRM DRIVER)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
Cc: Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
Cc: Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
Cc: David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
Cc: Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com> (maintainer:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...,commit_signer:2/4=50%)
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com> (maintainer:ARM/STM32 ARCHITECTURE)
Cc: Peter Rosin <peda@axentia.se> (maintainer:MULTIPLEXER SUBSYSTEM)
Cc: Marek Szyprowski <m.szyprowski@samsung.com> (maintainer:DMA MAPPING HELPERS,blamed_fixes:1/1=100%)
Cc: Robin Murphy <robin.murphy@arm.com> (reviewer:DMA MAPPING HELPERS)
Cc: Peter Zijlstra <peterz@infradead.org> (maintainer:LOCKING PRIMITIVES)
Cc: Ingo Molnar <mingo@redhat.com> (maintainer:LOCKING PRIMITIVES)
Cc: Will Deacon <will@kernel.org> (maintainer:LOCKING PRIMITIVES)
Cc: Boqun Feng <boqun.feng@gmail.com> (maintainer:LOCKING PRIMITIVES)
Cc: Waiman Long <longman@redhat.com> (reviewer:LOCKING PRIMITIVES)
Cc: Juri Lelli <juri.lelli@redhat.com> (maintainer:SCHEDULER)
Cc: Vincent Guittot <vincent.guittot@linaro.org> (maintainer:SCHEDULER)
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com> (reviewer:SCHEDULER)
Cc: Steven Rostedt <rostedt@goodmis.org> (reviewer:SCHEDULER)
Cc: Ben Segall <bsegall@google.com> (reviewer:SCHEDULER)
Cc: Mel Gorman <mgorman@suse.de> (reviewer:SCHEDULER)
Cc: Valentin Schneider <vschneid@redhat.com> (reviewer:SCHEDULER)
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (commit_signer:2/4=50%,authored:2/4=50%,added_lines:2/5=40%,removed_lines:2/5=40%)
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT)
Cc: linux-kernel@vger.kernel.org (open list)
Cc: dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Cc: linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...)
Cc: linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)



