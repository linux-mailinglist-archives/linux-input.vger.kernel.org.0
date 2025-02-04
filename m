Return-Path: <linux-input+bounces-9743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B4A2682D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 01:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0DCF3A448E
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 00:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A154A11;
	Tue,  4 Feb 2025 00:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="T0Q5wbuy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40713C30
	for <linux-input@vger.kernel.org>; Tue,  4 Feb 2025 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627825; cv=none; b=fQf4EDquPyAAIRJ/EytklqeCCPZzDTLUCSOICxJ4f9Z7zKHft8J8fL8Pet9HwJGWMnZJNDJfWaQT9pzQKDmtxhyEVAya+EaP0bUTyWLzE3pvqXOxp4mmTIUn0lKbloDh7gNBlxdUxrJccNdtqwOf3wEwEJjUJ902BDaa2NbuKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627825; c=relaxed/simple;
	bh=K6zmE/fWE9rqBGnhMGQIyUJDWcAaekn0x8QOoHzL7XM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RgBFfsEjwlSbfQj5KTDqb/S+BE0SDUw7tU4n8vDm13IuYupOXEI8XpOIeW9veOOpcRhPxXot5CUTjKKCOqnsU6lureJZ/EP9QINyxT+GHv2+r18nRdN0yJIT7xDsfJw4/l08dvk/mhV4F5Quvq6qYkKO/SWjRFNmZLh/sMTR0WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=T0Q5wbuy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21effc750d2so4364425ad.3
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2025 16:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738627823; x=1739232623; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuyGdRde8JxT3NX3muUQ/qh+speuZ6I05sB/OdrefZ4=;
        b=T0Q5wbuytST3Tnt0aM6MLHlHZHiyp5tmt8yek5oclcFPhh1brF2wGdRbB12Xm532HK
         PRSvx+KQbwCBXRwFdoS448SwelN68BES0KGjZ7elGMNT90wq6Pdr7ngeRXZuAZHtmJyM
         n8uFOWYnQzLT3zCIrWdQICEsMz20mh6uqNDuREBEc9PV+WQBDlMjoQi/Bz0Ek0gsgSok
         WxUJyA6+lStMpxiKsy8+W7Whnr6B2WcWEab5Oe3pgunOT8Dj50U0lgms25nri/MSDbrp
         jPDeV5wHfyuJASMj96oqEMMFJyG6ELsBVsRKOJhSTRn6dYjPuUzSjIGjs5KGBjuJ4WSW
         DPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738627823; x=1739232623;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuyGdRde8JxT3NX3muUQ/qh+speuZ6I05sB/OdrefZ4=;
        b=MPDDFQLyjZmJumDfKF9J/Qnm0CaC7riG/YTvmlLD+jEUMhYLYX6imlsv6uR1ONEDSF
         5EGgVVpVo8s2jLumYlv17V9Ax96INq8gPBnxFN9T8c3GOfjNIZ97VN/4/Qn1Zw8dL9Aa
         T6/7bfoBR/4rXA3leX418MYH/vinRsOO3JS6R6vNInP4IQSQ8s+ugelemxMzigGpHwmp
         KFS3exTu70fmxwoksXWqwVoQ9/BgHVk+ruD64mfFSwM/tbUn1rrEemIFPc7QEwL5XCFh
         ilhBiO4fRQGvtkYe7RyuB/wARS4GEwQwbsXy+nBLaNd0gx/pUXy4CtWWQWOdGqpGu1FP
         Dfpw==
X-Forwarded-Encrypted: i=1; AJvYcCVbxWZTQW1GLczyeoQWGpAW/hahG3YjYABp5xjXtyzKXwDiWsswsGubkzwyb9t/pV9CR2ZjTvQsuYomNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTTI2NqdodNk1ZS7IJTYmVExEd/JuPyk2qDUDP6GdLJNZ80mGs
	ljsrZF8CLcDIBAM4eH+9VJ6AXJoEc295fQmqcE9g7HxqglpXK5ud9nBrXvx4Y4Q=
X-Gm-Gg: ASbGncuqkkRXVaS3tWhEyn0bi2atVoAoEV2HLleIiGG/IoYtUNhWtXbqRP33gvKafKB
	khEeQ1YGxvdmpymUgNeZLa6d6o66laN5MCz7asEi/4hixLCYEG30Tgq2b+7kSDiV/hgFSigA1gn
	PMmgN1FuWNicnpW6NLNqq4NZsJgJP9UFNHNq0LvSzdMMH9Vva463JXX7syob/JOQpECE7o0Hy+W
	DOvcTeqCuTUdR3vOHhTHzVefiWDl7LHQDwZPPb18GbHg+mulnYTu+2PI8jNhrPpm4N3Q+AW6iIM
	1jLb5hQwOAeNaG7qo+12HX7C3VxSJn0=
X-Google-Smtp-Source: AGHT+IGmLl3yOBW8I/lwD6Ds9guvitdeNlqBdE+Y7Df/AmcItEuICpZxRHgz8VDHwoquWJ5TmiSLqw==
X-Received: by 2002:a05:6a21:998c:b0:1e0:d8c1:cfe2 with SMTP id adf61e73a8af0-1ed7a5c7af2mr47992777637.34.1738627822775;
        Mon, 03 Feb 2025 16:10:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe85656bsm7279199a12.36.2025.02.03.16.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 16:10:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] tools: Unify top-level quiet infrastructure
Date: Mon, 03 Feb 2025 16:10:06 -0800
Message-Id: <20250203-quiet_tools-v1-0-d25c8956e59a@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9aoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3cLSzNSS+JL8/JxiXctEs9REyxQz00RDSyWgjoKi1LTMCrBp0bG
 1tQBCJ0t5XQAAAA==
X-Change-ID: 20250203-quiet_tools-9a6ea9d65a19
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=K6zmE/fWE9rqBGnhMGQIyUJDWcAaekn0x8QOoHzL7XM=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rCqCfHJkx0zJPYHJdgtnHv4tAp2vuiWB5+352k//aDx
 MfQ+U6/OkpZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIxy+MDG/8l+tVqm41lHx/
 peeW8XQltlX8ZX0Su2UqtEofpvt6GzL8Uzy+4aRpcMzz0qfPuC8GSL2svJX2+Jzy9wiDpMrrvEv
 eMAAA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

The quiet infrastructure was moved out of Makefile.build to accomidate
the new syscall table generation scripts in perf. Syscall table
generation wanted to also be able to be quiet, so instead of again
copying the code to set the quiet variables, the code was moved into
Makefile.perf to be used globally. This was not the right solution. It
should have been moved even further upwards in the call chain.
Makefile.include is imported in many files so this seems like a proper
place to put it.

To: 

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      tools: Unify top-level quiet infrastructure
      tools: Remove redundant quiet setup

 tools/arch/arm64/tools/Makefile           |  6 -----
 tools/bpf/Makefile                        |  6 -----
 tools/bpf/bpftool/Documentation/Makefile  |  6 -----
 tools/bpf/bpftool/Makefile                |  6 -----
 tools/bpf/resolve_btfids/Makefile         |  2 --
 tools/bpf/runqslower/Makefile             |  5 +---
 tools/build/Makefile                      |  8 +-----
 tools/lib/bpf/Makefile                    | 13 ----------
 tools/lib/perf/Makefile                   | 13 ----------
 tools/lib/thermal/Makefile                | 13 ----------
 tools/objtool/Makefile                    |  6 -----
 tools/perf/Makefile.perf                  | 41 -------------------------------
 tools/scripts/Makefile.include            | 31 ++++++++++++++++++++++-
 tools/testing/selftests/bpf/Makefile.docs |  6 -----
 tools/testing/selftests/hid/Makefile      |  2 --
 tools/thermal/lib/Makefile                | 13 ----------
 tools/tracing/latency/Makefile            |  6 -----
 tools/tracing/rtla/Makefile               |  6 -----
 tools/verification/rv/Makefile            |  6 -----
 19 files changed, 32 insertions(+), 163 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-quiet_tools-9a6ea9d65a19
-- 
- Charlie


