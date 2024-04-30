Return-Path: <linux-input+bounces-3331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB988B833E
	for <lists+linux-input@lfdr.de>; Wed,  1 May 2024 01:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB836283F66
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2024 23:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6684B1C9EBA;
	Tue, 30 Apr 2024 23:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckLL+yi9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126321C9EAE
	for <linux-input@vger.kernel.org>; Tue, 30 Apr 2024 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714521090; cv=none; b=nKUcQAhy0kcMXlmKPjiqEceFM1qIvN6vZxwHuMSBSq4aKLf9n4uhJ6dhpPDzttcIQDdsEgT7dsI+Q9803EStDEABhx0QGH3aNatC6TYaHPBhzgZEINNzmWQLcYckIuQWHQjYIbVSlJhJ58fLtILHDe4AyovvbL9ofYUcZiMXwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714521090; c=relaxed/simple;
	bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u/1PMIiaxB8AD7vijY3KOxnUR73fIvD5e55+iyg9FlHuNH7VNm5omybdOv31FJWkRK+jbD3Bry3FySX5vZ2tzQbb6nX6J8mO21FNe6dGFIu6Qw6HzSbA6kJv78tdEIJtkQVEMGUWli+2u+7Am4O5yP2/CpCANEJxEPZ5vjaPSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckLL+yi9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1ec48e36217so9966555ad.3
        for <linux-input@vger.kernel.org>; Tue, 30 Apr 2024 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714521088; x=1715125888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=ckLL+yi9rIZvpky/0YOzu/iCUml5oJ095EDOY2GFeVA3ZS/B0Yvy9ljyyKagzlZu/E
         zWfMYHDP8isZ5t8eRVrUer+buWyO15PpcvkfxvJxXdFAdyDu7tzqqT7J8gzCU8E360BP
         XGQQTPdxpzxQEAn9s+M0sm0gBkYbxgM9EEinCSZh508V3n7ftLZ9Zi9dxDPAAfa/gImy
         WiMHpdJaIm6kBBTwUrPO7e/zKlN2WmJtP+OZK4P/NXZFxcxCTn445CPIsdAKUm4m+H/Z
         ODyPltbvq8jlm7LIoXgefy3g1Top6wefCrXBM9zSf0qAhVXRhRkYjB6ZSwbOZF/d0l1J
         Wlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521088; x=1715125888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sLsMn+75D63ePKL84qIUrZuVTfpP4Y9iFVCYDx6ZoM=;
        b=QZtkRR64eLmkNMqiRVWyhYl3RjGp+4JbGXhp8IDTuWAZPZ/DCCXg6wxP05KC+vtQ50
         8CrO1UtHtM8o4ugSaU4mqEUPr6L8BZR77Olovn1pDoEHsudrk8L6udxLEZJim9jugbns
         J8nFObQUw03EY7tlJi1QPvB8FTGV8TMq3JT9EZP9SZcw4oDCL9wg3Br+YapI7pOrzyT8
         sEHbISlTl2DTXZNPUt7I31wrY8dz8xB75yt2SgjoC9aP++rtTMMqKIhFKNXSuKAzJcbw
         LQajRqgsUbzKgV1vJgxDT+2FNMXRcTQMkTmJ84Vf0ybYrGNfJbI5ODzonrcYChj/0Rr0
         2Mxg==
X-Forwarded-Encrypted: i=1; AJvYcCU736eqVdpbOgbCu8Z19od1+9xQi3bfk55Me+DbvWSn/mqzdtImXJ+Gzxnij0LlODDYHl4soMRDd1m+ErMtGa5XgBwWhZ50KC6DSBE=
X-Gm-Message-State: AOJu0Yy3mwIUeo5SqYZr6qsXosJSaddCQBN6ZNNxobpdgUbDI3TsKxku
	qMB7Jr6tf+bY1/S9wT4x7+uJIdtJBnnkhLhOXOd/gQ8YL6lbX7SoOsj7y2325u8PLY4KdMYwb/7
	KHA==
X-Google-Smtp-Source: AGHT+IFtSHl2ws+41HKA57TwcS7ukKljLv0iJvc43sJuHvghYmCWKqHkqlRowkQ3pfhszR/h4a+oHj0mSuE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:dacc:b0:1dd:cc3f:6510 with SMTP id
 q12-20020a170902dacc00b001ddcc3f6510mr6327plx.3.1714521088265; Tue, 30 Apr
 2024 16:51:28 -0700 (PDT)
Date: Tue, 30 Apr 2024 23:50:12 +0000
In-Reply-To: <20240430235057.1351993-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430235057.1351993-4-edliaw@google.com>
Subject: [PATCH v1 03/10] selftests/hid: Compile with -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/hid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
index 2b5ea18bde38..33170d23315b 100644
--- a/tools/testing/selftests/hid/Makefile
+++ b/tools/testing/selftests/hid/Makefile
@@ -21,7 +21,7 @@ CXX ?= $(CROSS_COMPILE)g++

 HOSTPKG_CONFIG := pkg-config

-CFLAGS += -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
+CFLAGS += -g -O0 -rdynamic -Wall -Werror -D_GNU_SOURCE -I$(OUTPUT)
 CFLAGS += -I$(OUTPUT)/tools/include

 LDLIBS += -lelf -lz -lrt -lpthread
--
2.45.0.rc0.197.gbae5840b3b-goog


