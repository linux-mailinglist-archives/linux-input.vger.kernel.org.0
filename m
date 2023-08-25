Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391C7788E9B
	for <lists+linux-input@lfdr.de>; Fri, 25 Aug 2023 20:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjHYSXr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Aug 2023 14:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbjHYSXi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Aug 2023 14:23:38 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B1C270F
        for <linux-input@vger.kernel.org>; Fri, 25 Aug 2023 11:23:21 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-34ca1aadce9so4379805ab.1
        for <linux-input@vger.kernel.org>; Fri, 25 Aug 2023 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692987800; x=1693592600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uemtBlWK9rkaEGTDArBGM1rxtMvvs952rnMKGpZNgc=;
        b=qjxkUm8IeMTvcWnFAG9ky4z9+aWcGSYpB2vRLxLvDF8AWoufIDj8n2S0Xmd4Xhw/rf
         zD0MlUaBCyu43va5i/c4ND2zauhSavpfcHqC+v31wlCeVbYoznsTgb/5olONvwTkWhOz
         lVidrD37z+OL3rVBgOjmJ5UaeE8TFMJvtbzGCC7S7IwI5H170NRn+Civvi2RQRCx/6d0
         kh1apcjSlGjRhqyQYqyxwWMc5wTDBzr3WhrxNyVYE/ygXlGI7P0DtbYkc7GxStop1ihP
         DucpNWJYPVD6VUNxiEzRR8b3JMOOcdUul18t6X2G8JL/I4Bx1d01V2kOEgCwdr/jqusO
         Sg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987800; x=1693592600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uemtBlWK9rkaEGTDArBGM1rxtMvvs952rnMKGpZNgc=;
        b=OZy1kbtHmE0aI/KKNqcnw+cIfvftYe01qRSMQF/dW2xW+yUHb6gzTbmAyx9i1dhsra
         nXF02YCBMkzbmK33o3WF4R+rhID15doJl+Yrkb5yRAiXidThNHzKxpNM+BeJQsFeEz9R
         Wy67DxFl99rbM/Ql3D4yT/wZOEDNnE6HhyItiZIWK1SdqKKprxlZavJRGWvV7sWyl+eg
         v7iSwT3qNFPzXwluNBqmrcnEh0F5mivTeUznWkN7PxwbCKyAd3MACsFrpYYhPcCa20C6
         QnquUIOZb+WcHHGNcCqKBrN5mnkxyk3LsHHU0I+oZv7ZfOqHOJ+Kvcg5Yic2jeyU1ZT3
         BUMA==
X-Gm-Message-State: AOJu0Yw0K2VvMmfNiNlyCqtzJdjKmQStsNnNloxm/pzDU3oIIUwPBzXH
        0xRjK0WerGbmrrIv5EK2A7s5tQ==
X-Google-Smtp-Source: AGHT+IFcAVvQPKWzqhcVnjKVq9+7EyDOWK0X/+bObEJDSn6zObhqwCHknKvskbTimwfI6VQcPa5C/g==
X-Received: by 2002:a05:6e02:20c3:b0:349:862e:a863 with SMTP id 3-20020a056e0220c300b00349862ea863mr11937012ilq.15.1692987800519;
        Fri, 25 Aug 2023 11:23:20 -0700 (PDT)
Received: from google.com (161.74.123.34.bc.googleusercontent.com. [34.123.74.161])
        by smtp.gmail.com with ESMTPSA id q8-20020a92d408000000b0032b72b5c1c3sm677826ilm.9.2023.08.25.11.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:23:19 -0700 (PDT)
Date:   Fri, 25 Aug 2023 18:23:16 +0000
From:   Justin Stitt <justinstitt@google.com>
To:     Benjamin Tissoires <bentiss@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH 4/3] selftests/hid: more fixes to build with older kernel
Message-ID: <20230825182316.m2ksjoxe4s7dsapn@google.com>
References: <20230825-wip-selftests-v1-0-c862769020a8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-wip-selftests-v1-0-c862769020a8@kernel.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 25, 2023 at 10:36:30AM +0200, Benjamin Tissoires wrote:
> These fixes have been triggered by [0]:
> basically, if you do not recompile the kernel first, and are
> running on an old kernel, vmlinux.h doesn't have the required
> symbols and the compilation fails.
>
> The tests will fail if you run them on that very same machine,
> of course, but the binary should compile.
>
> And while I was sorting out why it was failing, I realized I
> could do a couple of improvements on the Makefile.
>
> [0] https://lore.kernel.org/linux-input/56ba8125-2c6f-a9c9-d498-0ca1c153dcb2@redhat.com/T/#t
>
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> Benjamin Tissoires (3):
>       selftests/hid: ensure we can compile the tests on kernels pre-6.3
>       selftests/hid: do not manually call headers_install
>       selftests/hid: force using our compiled libbpf headers
>
>  tools/testing/selftests/hid/Makefile                | 10 ++++------
>  tools/testing/selftests/hid/progs/hid.c             |  3 ---
>  tools/testing/selftests/hid/progs/hid_bpf_helpers.h | 20 ++++++++++++++++++++
>  3 files changed, 24 insertions(+), 9 deletions(-)
> ---
> base-commit: 1d7546042f8fdc4bc39ab91ec966203e2d64f8bd
> change-id: 20230825-wip-selftests-9a7502b56542
>
> Best regards,
> --
> Benjamin Tissoires <bentiss@kernel.org>
>

Benjamin, thanks for the work here. Your series fixed up _some_ of the
errors I had while building on my 6.3.11 kernel. I'm proposing a single
patch that should be applied on top of your series that fully fixes
_all_ of the build errors I'm experiencing.

Can you let me know if it works and potentially formulate a new series
so that `b4 shazam` applies it cleanly?

PATCH BELOW
---
From 5378d70e1b3f7f75656332f9bff65a37122bb288 Mon Sep 17 00:00:00 2001
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 25 Aug 2023 18:10:33 +0000
Subject: [PATCH 4/3] selftests/hid: more fixes to build with older kernel

I had to use the clever trick [1] on some other symbols to get my builds
working.

Apply this patch on top of Benjamin's series [2].

This is now a n=4 patch series which has fixed my builds when running:
| $ make LLVM=1 -j128 ARCH=x86_64 mrproper headers
| $ make LLVM=1 -j128 ARCH=x86_64 -C tools/testing/selftests TARGETS=hid

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/bpf/progs/bpf_iter.h#n3
[2]: https://lore.kernel.org/all/20230825-wip-selftests-v1-0-c862769020a8@kernel.org/
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 .../selftests/hid/progs/hid_bpf_helpers.h     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/hid/progs/hid_bpf_helpers.h b/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
index 749097f8f4d9..e2eace2c0029 100644
--- a/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
+++ b/tools/testing/selftests/hid/progs/hid_bpf_helpers.h
@@ -7,12 +7,26 @@

 /* "undefine" structs in vmlinux.h, because we "override" them below */
 #define hid_bpf_ctx hid_bpf_ctx___not_used
+#define hid_report_type hid_report_type___not_used
+#define hid_class_request hid_class_request___not_used
+#define hid_bpf_attach_flags hid_bpf_attach_flags___not_used
 #include "vmlinux.h"
 #undef hid_bpf_ctx
+#undef hid_report_type
+#undef hid_class_request
+#undef hid_bpf_attach_flags

 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
+#include <linux/const.h>

+enum hid_report_type {
+	HID_INPUT_REPORT		= 0,
+	HID_OUTPUT_REPORT		= 1,
+	HID_FEATURE_REPORT		= 2,
+
+	HID_REPORT_TYPES,
+};

 struct hid_bpf_ctx {
 	__u32 index;
@@ -25,6 +39,21 @@ struct hid_bpf_ctx {
 	};
 };

+enum hid_class_request {
+	HID_REQ_GET_REPORT		= 0x01,
+	HID_REQ_GET_IDLE		= 0x02,
+	HID_REQ_GET_PROTOCOL		= 0x03,
+	HID_REQ_SET_REPORT		= 0x09,
+	HID_REQ_SET_IDLE		= 0x0A,
+	HID_REQ_SET_PROTOCOL		= 0x0B,
+};
+
+enum hid_bpf_attach_flags {
+	HID_BPF_FLAG_NONE = 0,
+	HID_BPF_FLAG_INSERT_HEAD = _BITUL(0),
+	HID_BPF_FLAG_MAX,
+};
+
 /* following are kfuncs exported by HID for HID-BPF */
 extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
 			      unsigned int offset,
--
2.42.0.rc1.204.g551eb34607-goog
