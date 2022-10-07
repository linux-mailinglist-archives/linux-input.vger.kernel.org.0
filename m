Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C375F7D5E
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 20:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiJGSa3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 14:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJGSaW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 14:30:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69558C5132
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 11:30:19 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id p26-20020a7bcc9a000000b003c384e59047so1087720wma.4
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKC52XlIlH735cslPfUrYxygdtrY6mzDY7jHX6I0Dr8=;
        b=onCVtizQqS24clBBpDwECLJHkh3NX9WiWTUaqxR9e44Y4KCf0+kw4/1jkL4bnKXvtG
         Dw2tPKmSv1nLL2kNoaX7yHhHxAJM6pLzOYKY4xzn/vANNvphnzwdLOKv5704kMmwnnrn
         9APyJAFBHIqLuV8y10ZAxNuthVLdJiTkrWClCdnnnFrV9L8oNTh6cy9k1+8utWL3Pa10
         Y0WgORaOSgSWLm/vQzZ15s2IFD94/CYhYE0hADBpKY11LtF/WhUya3GlmYGvi/QypVOB
         E6wZQ8kEBxLgNi/CIc6bVO21tkajMtoU0Ua7xewkPoRwn0ZTsH99MvvP4Lx5Xcq8gG8W
         lAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKC52XlIlH735cslPfUrYxygdtrY6mzDY7jHX6I0Dr8=;
        b=yAlM3+AZRDJ2xeRJBDnmm3l69X94phYtghVhsK8AvY3rss9ioSwij0iakfbfFdTytK
         0vnZRtteh8fVLw0fkRbUY6uXlTH/9airKDda4UttUDpWLLkpLFQYYQLgufLU11kmb7A+
         qu+e8Y8kSgzaR2jNocMl/1yrEonnG1gH4SLdKWJc6CQhIS/cO985+q8SucL0p2nPasWf
         wh6Ue+f6RD7AOSbuCL0XSXnKHCUQhOGy1o2k/mRMTMttpvbiQzPIzmYep/YGbo9c8W7O
         dlCOeHOAPJtLCjOilY8nW2pLRIX4/UXOWyAJnsr0X/G8ux577zH3obzM/kuYE231+yHJ
         c/9w==
X-Gm-Message-State: ACrzQf0zwve4d5E3EAabjM5wbm5OIt1cIz3gAbWRQ0KQpciA5q/fRI8t
        I1ve9wg57ofgVPLSaCc2+eeuMwhfgHEizGgH
X-Google-Smtp-Source: AMsMyM6yX4B+6p0TDKI5ppG81GR7iyhZuz+VKd5QGinEqvew26sBWh0+4cSV1dn2Jr7yKot7c6+++Q==
X-Received: by 2002:a05:600c:348c:b0:3b4:85b6:e7c5 with SMTP id a12-20020a05600c348c00b003b485b6e7c5mr4268112wmq.45.1665167417739;
        Fri, 07 Oct 2022 11:30:17 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (230.213.79.34.bc.googleusercontent.com. [34.79.213.230])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600012ca00b002258235bda3sm2573627wrx.61.2022.10.07.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:30:17 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v4 08/17] HID: input: calculate resolution for pressure
Date:   Fri,  7 Oct 2022 18:29:36 +0000
Message-Id: <20221007182945.1654046-9-acz@semihalf.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221007182945.1654046-1-acz@semihalf.com>
References: <20221007182945.1654046-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Assume that if the pressure is given in newtons it should be normalized
to grams. If the pressure has no unit do not calculate resolution.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---
 drivers/hid/hid-input.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c60cee4bb6aa6..151823ad29166 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -303,6 +303,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
 		}
 		break;
 
+	case ABS_PRESSURE:
+	case ABS_MT_PRESSURE:
+		if (field->unit == HID_UNIT_NEWTON) {
+			/* Convert to grams, 1 newton is 101.97 grams */
+			prev = physical_extents;
+			physical_extents *= 10197;
+			if (physical_extents < prev)
+				return 0;
+			unit_exponent -= 2;
+		} else if (field->unit != HID_UNIT_GRAM) {
+			return 0;
+		}
+		break;
 	default:
 		return 0;
 	}
-- 
2.38.0.rc1.362.ged0d419d3c-goog

