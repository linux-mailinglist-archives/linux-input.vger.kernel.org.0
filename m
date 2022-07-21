Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D034C57CF7A
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 17:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiGUPha (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 11:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbiGUPhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 11:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B8DA888755
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658417806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sacPSbtHxPkvSU7XP0J7Ei2CUrY8a0FAjmE7NV33lFk=;
        b=DUn26p962oPyKE8Jj7PbXY2xP4TGnzS/vzKqWGmDoKJYyAQOfNIoQ9C/59S9GvstH213p+
        cyryRZcfTj+318OMPxUCjV/fEf3Me4Tp9+IWYaPoATitl9FzCdFsIkLWRCbczXD1oEoAw/
        t4oFINd1X4lHQ34w94TRbA7GxTuLJCA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-1DhWE6ZgOHuTRd5QbahEWw-1; Thu, 21 Jul 2022 11:36:42 -0400
X-MC-Unique: 1DhWE6ZgOHuTRd5QbahEWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDFDB2804061;
        Thu, 21 Jul 2022 15:36:41 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.194.200])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 758E82166B26;
        Thu, 21 Jul 2022 15:36:38 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>
Cc:     Tero Kristo <tero.kristo@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH bpf-next v7 03/24] bpf/verifier: do not clear meta in check_mem_size
Date:   Thu, 21 Jul 2022 17:36:04 +0200
Message-Id: <20220721153625.1282007-4-benjamin.tissoires@redhat.com>
In-Reply-To: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
References: <20220721153625.1282007-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The purpose of this clear is to prevent meta->raw_mode to be evaluated
at true, but this also prevents to forward any other data to the other
callees.

Only switch back raw_mode to false so we don't entirely clear meta.

Acked-by: Yonghong Song <yhs@fb.com>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

---

no changes in v7

new in v6
---
 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index d5fe7e618c52..92714299831c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -5282,7 +5282,7 @@ static int check_mem_size_reg(struct bpf_verifier_env *env,
 		 * initialize all the memory that the helper could
 		 * just partially fill up.
 		 */
-		meta = NULL;
+		meta->raw_mode = false;
 
 	if (reg->smin_value < 0) {
 		verbose(env, "R%d min value is negative, either use unsigned or 'var &= const'\n",
-- 
2.36.1

