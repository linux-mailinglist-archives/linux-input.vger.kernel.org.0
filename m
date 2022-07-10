Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6E256D096
	for <lists+linux-input@lfdr.de>; Sun, 10 Jul 2022 19:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiGJRvL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jul 2022 13:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGJRvK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jul 2022 13:51:10 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62BE1055C;
        Sun, 10 Jul 2022 10:51:09 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id bu1so3206929wrb.9;
        Sun, 10 Jul 2022 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wWGxzBq7d096NmGQIRlEAESUfIaZSZDvClyvvT8wMEU=;
        b=Dx+ajK78Sq1CgRyyBMZ1JyBenaTfBQj6qXO6E5nOb+DDCw1ZGFkZwT69H9x8JHbXhp
         1M40cjWHhezzvmmZ09PWl814ZKVs1AG+gIRJaZtrRLwqWBnpswsL641EQGQpDBHqPLbv
         VSvacqypAER6/5qPR6z4dV/7BBYkA/9A1iTeQmt3MXojVVZJAeuxbvkH6AtejzF80K5e
         peR3nJ/kJc5pZiQxnXwrfK1NWSQMrjJTRPn0sTqlwbt5OkCGC0KOdPaadgkiErz6D5O/
         dPE3+qIicR5wlw7ZdHntZj5/NPeH8C5TsbcTFRhh1a2TyaNbAEcw6URwbFs6X9nIoI4V
         +uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wWGxzBq7d096NmGQIRlEAESUfIaZSZDvClyvvT8wMEU=;
        b=fQpiYdgyOtGdeZNkIPCsFXWJNY/W8hTT7kV7f4bGGTeqqBuTS24dcnJZjcPWazOM/G
         FIsmmjb77rRiedJjf8Q4L6g0vrazSU90MZeVmHVRzhF9KtAvix+0V0zroE5wPB4BuvwI
         gPbvXuI4Q1MSJNHMlG/UrSY/FH0D1v1RkDwyQFV0iSsKCtT3MB0iLz2IxtqperXDwVN8
         eHdVh7VdUY0bzEMGkVn3HQsuRrcx2svLCg1py80xtmb+2Q2jKoS9xibJsCrzjK5JDjIK
         wlSVopzMwAgbBBQ752dfU9rl/AWinf2/+qZFZIDxxQSY2M8VnihbQJXcp7q3LrNI6B08
         dx9A==
X-Gm-Message-State: AJIora8b98ixTv7GEGGC8uOQHW9EtddmPTL/7OZQw+fUY4GPm7ZaCa8A
        q81t6RtZrENC6T7Du7BKNMM=
X-Google-Smtp-Source: AGRyM1ti/luxA6bUlRWtR05hi9NNDyHu7qvBqqUDaE29w6OmclNICWaWfVHYJrBp6JBcZroqRUm+Hw==
X-Received: by 2002:adf:a51a:0:b0:21d:86b9:f41e with SMTP id i26-20020adfa51a000000b0021d86b9f41emr13372859wrb.217.1657475468244;
        Sun, 10 Jul 2022 10:51:08 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.185])
        by smtp.gmail.com with ESMTPSA id l23-20020a1ced17000000b003a03ae64f57sm4523495wmh.8.2022.07.10.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 10:51:07 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, spbnick@gmail.com,
        j.witteveen@gmail.com, stefanberzl@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/7] HID: uclogic: KUnit best practices and naming conventions
Date:   Sun, 10 Jul 2022 19:50:37 +0200
Message-Id: <20220710175043.192901-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710175043.192901-1-jose.exposito89@gmail.com>
References: <20220710175043.192901-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The KUnit documentation [1] suggests allowing build tests as a module.

In addition, it is recommended [2] to use snake case names for
kunit_suite and test cases.

Change the Kconfig entry from bool to tristate and stick to the naming
conventions to avoid style issues with future tests.

Link: https://docs.kernel.org/dev-tools/kunit/style.html#test-kconfig-entries  [1]
Link: https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html  [2]
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/Kconfig                  |  2 +-
 drivers/hid/Makefile                 |  3 ++-
 drivers/hid/hid-uclogic-rdesc-test.c | 22 +++++++++++-----------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 6ce92830b5d1..36a17958493f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1307,7 +1307,7 @@ config HID_MCP2221
 	will be called hid-mcp2221.ko.
 
 config HID_KUNIT_TEST
-	bool "KUnit tests for HID" if !KUNIT_ALL_TESTS
+	tristate "KUnit tests for HID" if !KUNIT_ALL_TESTS
 	depends on KUNIT=y
 	depends on HID_UCLOGIC
 	default KUNIT_ALL_TESTS
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index b0bef8098139..82d8fd97d96c 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -144,8 +144,9 @@ obj-$(CONFIG_HID_WIIMOTE)	+= hid-wiimote.o
 obj-$(CONFIG_HID_SENSOR_HUB)	+= hid-sensor-hub.o
 obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR)	+= hid-sensor-custom.o
 
-obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-rdesc.o \
+hid-uclogic-test-objs		:= hid-uclogic-rdesc.o \
 				   hid-uclogic-rdesc-test.o
+obj-$(CONFIG_HID_KUNIT_TEST)	+= hid-uclogic-test.o
 
 obj-$(CONFIG_USB_HID)		+= usbhid/
 obj-$(CONFIG_USB_MOUSE)		+= usbhid/
diff --git a/drivers/hid/hid-uclogic-rdesc-test.c b/drivers/hid/hid-uclogic-rdesc-test.c
index ebebffef5f8a..3971a0854c3e 100644
--- a/drivers/hid/hid-uclogic-rdesc-test.c
+++ b/drivers/hid/hid-uclogic-rdesc-test.c
@@ -97,7 +97,7 @@ static const __u8 template_params_none[] = {
 
 static struct uclogic_template_case uclogic_template_cases[] = {
 	{
-		.name = "Empty template",
+		.name = "empty_template",
 		.template = template_empty,
 		.template_size = sizeof(template_empty),
 		.param_list = params_pen_all,
@@ -105,7 +105,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = template_empty,
 	},
 	{
-		.name = "Template smaller than the placeholder",
+		.name = "template_smaller_than_the_placeholder",
 		.template = template_small,
 		.template_size = sizeof(template_small),
 		.param_list = params_pen_all,
@@ -113,7 +113,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = template_small,
 	},
 	{
-		.name = "No placeholder",
+		.name = "no_placeholder",
 		.template = template_no_ph,
 		.template_size = sizeof(template_no_ph),
 		.param_list = params_pen_all,
@@ -121,7 +121,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = template_no_ph,
 	},
 	{
-		.name = "Pen placeholder at the end, without ID",
+		.name = "pen_placeholder_at_the_end_without_id",
 		.template = template_pen_ph_end,
 		.template_size = sizeof(template_pen_ph_end),
 		.param_list = params_pen_all,
@@ -129,7 +129,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = template_pen_ph_end,
 	},
 	{
-		.name = "Frame button placeholder at the end, without ID",
+		.name = "frame_button_placeholder_at_the_end_without_id",
 		.template = template_btn_ph_end,
 		.template_size = sizeof(template_btn_ph_end),
 		.param_list = params_frame_all,
@@ -137,7 +137,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = template_btn_ph_end,
 	},
 	{
-		.name = "All params present in the pen template",
+		.name = "all_params_present_in_the_pen_template",
 		.template = template_pen_all_params,
 		.template_size = sizeof(template_pen_all_params),
 		.param_list = params_pen_all,
@@ -145,7 +145,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = expected_pen_all_params,
 	},
 	{
-		.name = "All params present in the frame template",
+		.name = "all_params_present_in_the_frame_template",
 		.template = template_frame_all_params,
 		.template_size = sizeof(template_frame_all_params),
 		.param_list = params_frame_all,
@@ -153,7 +153,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = expected_frame_all_params,
 	},
 	{
-		.name = "Some params present in the pen template (complete param list)",
+		.name = "some_params_present_in_the_pen_template_with_complete_param_list",
 		.template = template_pen_some_params,
 		.template_size = sizeof(template_pen_some_params),
 		.param_list = params_pen_all,
@@ -161,7 +161,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = expected_pen_some_params,
 	},
 	{
-		.name = "Some params present in the pen template (incomplete param list)",
+		.name = "some_params_present_in_the_pen_template_with_incomplete_param_list",
 		.template = template_pen_some_params,
 		.template_size = sizeof(template_pen_some_params),
 		.param_list = params_pen_some,
@@ -169,7 +169,7 @@ static struct uclogic_template_case uclogic_template_cases[] = {
 		.expected = expected_pen_some_params,
 	},
 	{
-		.name = "No params present in the template",
+		.name = "no_params_present_in_the_template",
 		.template = template_params_none,
 		.template_size = sizeof(template_params_none),
 		.param_list = params_pen_some,
@@ -208,7 +208,7 @@ static struct kunit_case hid_uclogic_rdesc_test_cases[] = {
 };
 
 static struct kunit_suite hid_uclogic_rdesc_test_suite = {
-	.name = "hid-uclogic-rdesc-test",
+	.name = "hid_uclogic_rdesc_test",
 	.test_cases = hid_uclogic_rdesc_test_cases,
 };
 
-- 
2.25.1

