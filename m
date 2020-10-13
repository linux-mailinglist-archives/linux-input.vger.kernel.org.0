Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3849C28CD43
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 13:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgJML61 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 07:58:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727614AbgJMLyp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:45 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29B0922475;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=ouT/IR50K1v6t5GtAH8QVbTfLficJqrmgVtdLLJX39w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N2OTkAfXMgbyN3y8gMzUYN07xE51r4Iv03aBSUQTMBWozZpPhVTvcLDPlYFuYQOMm
         03inbytb9y6xQ/YdwHPUApp+CJmXjUvOZ3rAQ6JHmkLerK3qEGjKO8XCMIQ2MbqCzC
         qw6eIFtOn0kE+W6sqFZ91+kze0XdVxECpj/3LoNE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CWY-PY; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 71/80] Input: sparse-keymap: add a description for @sw
Date:   Tue, 13 Oct 2020 13:54:26 +0200
Message-Id: <f2fdd9d54b8f1f814e90bca2b1458184763be179.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a description for it, in order to avoids this warning:

	./include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/input/sparse-keymap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/input/sparse-keymap.h b/include/linux/input/sparse-keymap.h
index d25d1452dc6e..d0dddc14ebc8 100644
--- a/include/linux/input/sparse-keymap.h
+++ b/include/linux/input/sparse-keymap.h
@@ -20,6 +20,7 @@
  *	private definitions.
  * @code: Device-specific data identifying the button/switch
  * @keycode: KEY_* code assigned to a key/button
+ * @sw: struct with code/value used by KE_SW and KE_VSW
  * @sw.code: SW_* code assigned to a switch
  * @sw.value: Value that should be sent in an input even when KE_SW
  *	switch is toggled. KE_VSW switches ignore this field and
-- 
2.26.2

