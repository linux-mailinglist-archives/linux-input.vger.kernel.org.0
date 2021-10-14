Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6500B42E302
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 22:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhJNVAS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 17:00:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:50964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhJNVAS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 17:00:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86DDA60F9E;
        Thu, 14 Oct 2021 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634245092;
        bh=q0dwlCNGa/Hxh5HuJwhdsfDhhj1HIkksM3XfYlf7fZU=;
        h=From:To:Cc:Subject:Date:From;
        b=LyJrl9V7d4APSJLu0NY7Bz4az0bKYR1A982hZ3Zlz0xzKs/aiT+qGErYJHm56/WTF
         EBZNLtwc1TJE4UgFR7zu/fSvU49U81lYSPFYHrqXjq7xOH1OvXQXdQqyHh+W5h7umu
         vpm2Jb91JREz5GeoSSWaOlSsakP1JP8OhA8sr1VH8N/RkRfXNbXdUZQAQA/iFYQR/s
         RRSEsLekKq2rhO4mxxua7W3wrosuJNRJP+tiXpuwN2cdcXQK3cZ8PojKHDo++qdYwa
         tjKt5XT3LLBPhUrDVTJ54ZThVKz8/nTou/hK2E1t37VVIwpESV+YPdXDOwV3lk4Rx1
         GgltfH0r8Twig==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] Input: touchscreen - Avoid bitwise vs logical OR warning
Date:   Thu, 14 Oct 2021 13:57:57 -0700
Message-Id: <20211014205757.3474635-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.1.637.gf443b226ca
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A new warning in clang points out a few places in this driver where a
bitwise OR is being used with boolean types:

drivers/input/touchscreen.c:81:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This use of a bitwise OR is intentional, as bitwise operations do not
short circuit, which allows all the calls to touchscreen_get_prop_u32()
to happen so that the last parameter is initialized while coalescing the
results of the calls to make a decision after they are all evaluated.

To make this clearer to the compiler, use the '|=' operator to assign
the result of each touchscreen_get_prop_u32() call to data_present,
which keeps the meaning of the code the same but makes it obvious that
every one of these calls is expected to happen.

Link: https://github.com/ClangBuiltLinux/linux/issues/1472
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/input/touchscreen.c | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
index dd18cb917c4d..4620e20d0190 100644
--- a/drivers/input/touchscreen.c
+++ b/drivers/input/touchscreen.c
@@ -80,27 +80,27 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
 						input_abs_get_min(input, axis_x),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
-						input_abs_get_max(input,
-								  axis_x) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
-						input_abs_get_fuzz(input, axis_x),
-						&fuzz);
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						 input_abs_get_max(input,
+								   axis_x) + 1,
+						 &maximum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
+						 input_abs_get_fuzz(input, axis_x),
+						 &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
 
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
 						input_abs_get_min(input, axis_y),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
-						input_abs_get_max(input,
-								  axis_y) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
-						input_abs_get_fuzz(input, axis_y),
-						&fuzz);
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						 input_abs_get_max(input,
+								   axis_y) + 1,
+						 &maximum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
+						 input_abs_get_fuzz(input, axis_y),
+						 &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
 
@@ -108,11 +108,11 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	data_present = touchscreen_get_prop_u32(dev,
 						"touchscreen-max-pressure",
 						input_abs_get_max(input, axis),
-						&maximum) |
-		       touchscreen_get_prop_u32(dev,
-						"touchscreen-fuzz-pressure",
-						input_abs_get_fuzz(input, axis),
-						&fuzz);
+						&maximum);
+	data_present |= touchscreen_get_prop_u32(dev,
+						 "touchscreen-fuzz-pressure",
+						 input_abs_get_fuzz(input, axis),
+						 &fuzz);
 	if (data_present)
 		touchscreen_set_params(input, axis, 0, maximum, fuzz);
 

base-commit: a41392e0877a271007e9209e63c34cab7527eb43
-- 
2.33.1.637.gf443b226ca

