Return-Path: <linux-input+bounces-10025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB1A35051
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 22:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44F38188D0CA
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 21:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB9C269830;
	Thu, 13 Feb 2025 21:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="L1MGpphz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4F2266B7C
	for <linux-input@vger.kernel.org>; Thu, 13 Feb 2025 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739481155; cv=none; b=JKzLiUoGEjdBhcQUyc1SkL45rBwhr50rM3ynh+XUYnBHDQ8wfTTUm2JrF03i6F7LOefx8NSatwOsroz2YTk7wWNQoh2hv96ldeAacmNEjpZJmppdIH8zxRuZHvU6nOde3UQsC5FfFvgdPj1BoLI2nSf1w1wkkVCHE3yb7NyFBcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739481155; c=relaxed/simple;
	bh=9A/kZVqH9ZLgVSRCFxgFLT3GwQqa+NDq97pn8qQ0Iuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SU9T1xQdypyYi5KBwU4i1/+As1z3yWoxVfmu251nUaW4FN4clKZlLQ/MLNZLA1jyWtDBZORKIQG0Zu3ThZpKhamX9JDdNwutufXm6OuyS812RiiMK8c++f3p5oeLLbh5csjUWEST2pFzoTmtAOnR6NlYYkkQgWIe+sUINqImoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=L1MGpphz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220ca204d04so17776075ad.0
        for <linux-input@vger.kernel.org>; Thu, 13 Feb 2025 13:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739481152; x=1740085952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TiMXc28g+QG9n19FwYu5HbjQ/8rWGAlU2xpZZhaQ6U=;
        b=L1MGpphzrJJV3GTBD5UdwOVVn6sDNfyQ6LQ4QUD2xK2g2DOq6ab51bdafbMFTpq3kp
         wG440h/piyh16aUgAsP+XD9/e7OByyyKUKoU6OWf0R4S1n4jLE6dPxlV0mQufIWZOe0w
         RgTvQriMmcJvtcBczeAyeDrRqVHFrxqnsy5Ns3SDB6jcDANER8ESvuwmvRN+u8FJ6VWr
         nxhemMfHHf11cRcvRXXq5qntmB1K0sT5gV4J4KQg4N4jhAEJBOlnFdmMktMM78LriSH3
         nshjrkSFvf6MUe/Vr0Ehi3TRS2Boxs/AqKaQ5zlY2cQ9GSSs/n12SM5+zMmGddD9U0D4
         nwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739481152; x=1740085952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TiMXc28g+QG9n19FwYu5HbjQ/8rWGAlU2xpZZhaQ6U=;
        b=pkOZMWYx/VKJeSrtnsBjRPY16bWI7I/tfjBX8jUrqzIy+DbeXBSlP2V4Srl7B8MAnX
         jTDBdNQsNi+78JSqIt+K2OuNIXph59N2XrPhDnDTT0wMlvY98iDXWTVoqEQ/kwpUFXHU
         hmCmesI92eZANVk2owRB9s5nRi+JDuqXfXR6kt5T5T+DoYt/P+yTBKvbgyB+DscdzkWc
         z3X2Zv7xhIZcVI7+h6xa0ee6eAt/NptSkq+L39kfOEJXwya9s95TOC/iMw3W1iBqmNuA
         kJxntsiox5rlb22lCtDHn6WwTcxr8219DIzU4Kg7LLl/mYbcbgLGyC5CovU6bz3mqWcP
         uiWg==
X-Forwarded-Encrypted: i=1; AJvYcCWse4iTysc+PxPepO+jVtHYz4Rkewvv02dlJ+jL0wxrNwogfucUZfyHGNiG4hHP1/A8udUpwTKKogA83w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdny+eHrObV35mf7WogEAncYAidlt9BOXOQaQ74m3X1wVn9Op5
	pq75qNcShvuA8v2ehIFiE5qCWGMGvRLZ+mG1KnSLijHFN8drj8o7TYgfNIY2XYg=
X-Gm-Gg: ASbGnctlqK5xhwcePXQTWlnVZ0c+Y5iL77HPK26RAdASAT17ZRCWebGX0RPQPM2h44l
	E3kpPw+4TO29xVui54QcyGjyTl9FlEmoFBCIRsZGv6QPWg0dunzBQyaqDp28Ni51tMe8MiN+0Ga
	1q3iGXPdbBdET3z/Jwn6qUbRNTv/ZcfViPGcIWmDcsVK6ZabdzUvKyD1sF5Yzy7D+nbkqVl3Q38
	I+yx0BxMCjciWu6cJF/RhAW0AtX5wyUTo6sUmY8yeCrLLXw8Js9+n8MBVp9jyw6HCWOoYhOOAJb
	8YrHZ1Mnill5r5kxzJlcgqhwgdBsrhk=
X-Google-Smtp-Source: AGHT+IFqsu2nx6CoLWExyydaLJ08nJGI7e2Qb8oJXzvEG9l8nFFlQt4FaQdvigyWe8khyD725QNZrw==
X-Received: by 2002:a05:6a00:2da7:b0:730:7885:d903 with SMTP id d2e1a72fcca58-7322c3768fbmr12517521b3a.5.1739481152297;
        Thu, 13 Feb 2025 13:12:32 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324257fdd6sm1758072b3a.76.2025.02.13.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:12:31 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 13 Feb 2025 13:06:21 -0800
Subject: [PATCH v3 1/2] tools: Unify top-level quiet infrastructure
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-quiet_tools-v3-1-07de4482a581@rivosinc.com>
References: <20250213-quiet_tools-v3-0-07de4482a581@rivosinc.com>
In-Reply-To: <20250213-quiet_tools-v3-0-07de4482a581@rivosinc.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Quentin Monnet <qmo@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=9A/kZVqH9ZLgVSRCFxgFLT3GwQqa+NDq97pn8qQ0Iuk=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/q6BKt7Sy+cd1odsVT56km9xI8pwls+LGJhFq+Z/j/e4
 2fM1z3xHSUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEykoJiRYeb0bR+4OpSFH584
 f/MtC4fXrM/vt6QFcGvutXTtP9OwOp/hx9mIfdkbwmLbHI9+n3fqy9XKf79kYs5Vdl+78+j0+pI
 5rAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Commit f2868b1a66d4 ("perf tools: Expose quiet/verbose variables in
Makefile.perf") moved the quiet infrastructure out of
tools/build/Makefile.build and into the top-level Makefile.perf file so
that the quiet infrastructure could be used throughout perf and not just
in Makefile.build.

Extract out the quiet infrastructure into Makefile.include so that it
can be leveraged outside of perf.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: f2868b1a66d4 ("perf tools: Expose quiet/verbose variables in Makefile.perf")
---
 tools/build/Makefile           |  8 +-------
 tools/perf/Makefile.perf       | 41 -----------------------------------------
 tools/scripts/Makefile.include | 30 ++++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 48 deletions(-)

diff --git a/tools/build/Makefile b/tools/build/Makefile
index 18ad131f6ea74aebfc3fd6aa6dddfdc00634b66c..63ef2187876169d8daaeed6f7a4ff27e4b610271 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -17,13 +17,7 @@ $(call allow-override,LD,$(CROSS_COMPILE)ld)
 
 export HOSTCC HOSTLD HOSTAR
 
-ifeq ($(V),1)
-  Q =
-else
-  Q = @
-endif
-
-export Q srctree CC LD
+export srctree CC LD
 
 MAKEFLAGS := --no-print-directory
 build     := -f $(srctree)/tools/build/Makefile.build dir=. obj
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 55d6ce9ea52fb2a57b8632cc6d0ddc501e29cbfc..05c083bb11220486e3246896af4fa0051f048832 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -161,47 +161,6 @@ export VPATH
 SOURCE := $(shell ln -sf $(srctree)/tools/perf $(OUTPUT)/source)
 endif
 
-# Beautify output
-# ---------------------------------------------------------------------------
-#
-# Most of build commands in Kbuild start with "cmd_". You can optionally define
-# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
-# that command is printed by default.
-#
-# e.g.)
-#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
-#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
-#
-# A simple variant is to prefix commands with $(Q) - that's useful
-# for commands that shall be hidden in non-verbose mode.
-#
-#    $(Q)$(MAKE) $(build)=scripts/basic
-#
-# To put more focus on warnings, be less verbose as default
-# Use 'make V=1' to see the full commands
-
-ifeq ($(V),1)
-  quiet =
-  Q =
-else
-  quiet=quiet_
-  Q=@
-endif
-
-# If the user is running make -s (silent mode), suppress echoing of commands
-# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
-ifeq ($(filter 3.%,$(MAKE_VERSION)),)
-short-opts := $(firstword -$(MAKEFLAGS))
-else
-short-opts := $(filter-out --%,$(MAKEFLAGS))
-endif
-
-ifneq ($(findstring s,$(short-opts)),)
-  quiet=silent_
-endif
-
-export quiet Q
-
 # Do not use make's built-in rules
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0aa4005017c72f10bb7c5e47bc78ec81718c47ef..45f4abef706405a0f865d04790518da45dc047ef 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -136,6 +136,33 @@ else
 NO_SUBDIR = :
 endif
 
+# Beautify output
+# ---------------------------------------------------------------------------
+#
+# Most of build commands in Kbuild start with "cmd_". You can optionally define
+# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
+# that command is printed by default.
+#
+# e.g.)
+#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
+#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
+#
+# A simple variant is to prefix commands with $(Q) - that's useful
+# for commands that shall be hidden in non-verbose mode.
+#
+#    $(Q)$(MAKE) $(build)=scripts/basic
+#
+# To put more focus on warnings, be less verbose as default
+# Use 'make V=1' to see the full commands
+
+ifeq ($(V),1)
+  quiet =
+  Q =
+else
+  quiet = quiet_
+  Q = @
+endif
+
 # If the user is running make -s (silent mode), suppress echoing of commands
 # make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
 ifeq ($(filter 3.%,$(MAKE_VERSION)),)
@@ -146,8 +173,11 @@ endif
 
 ifneq ($(findstring s,$(short-opts)),)
   silent=1
+  quiet=silent_
 endif
 
+export quiet Q
+
 #
 # Define a callable command for descending to a new directory
 #

-- 
2.43.0


