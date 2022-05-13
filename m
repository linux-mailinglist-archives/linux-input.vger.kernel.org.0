Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6268E525F0C
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379105AbiEMJj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 05:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379108AbiEMJjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 05:39:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFFD2A5E9D
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so10611534wrg.12
        for <linux-input@vger.kernel.org>; Fri, 13 May 2022 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5sHT1hvhkDQhIBW03xv/+oQei1z39Nj9aJXqgHfxZbg=;
        b=KMDXpfW3VFcom+1r3ChXyr95fAMzmpNyob2pnDZl2sulCSAEfHOaT2RSzW0TYjk37d
         V2UhH8D5C7Dtpdjt+bAL/+ns1n1AhTrGnxCCVnjM9jgxNRVweHRPdUtBgqd2o/JkLHAV
         0KHbFu3+oWa23UFQcZiifMsacX9gPs8QbLE6Ap116ad6fLXga7ZOl+lnua56UAyxdTtB
         jlRfOo3W/WMPxhq3mhum/dYVZJG4v9oWl+mtOpBXyb+WU7P+IsT0ncAk9zDprmgML6vs
         S04cyiBMVZHJ9mjGne2YspEvtXRavpMKL5IRiG7c0iqwE6gkWcQzbA4n8NFiHZknH7t5
         RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5sHT1hvhkDQhIBW03xv/+oQei1z39Nj9aJXqgHfxZbg=;
        b=eGkZ0KOnBPAWkimbJvnApqfCB9fCoP82hMTpgTgCxLCAYh3GuY2c5ZP4t19O9DrKBZ
         Ktmbwogw1YmgWJDn137993pMHfB4XkuBDcdEfLKiXikkKkLuSC8XtOybVqJl1RUyi8zR
         HhBQ6fhIdj8PBaJ+qLbTfGJqkiWjfpmk8XfTH2L4ipMF+iTL9HoOMlZCUqdOL/Fvy/+5
         gOEs5JjPDND1mRygTBBX6O2xhONmn7SmkVmaytxkofOQuxR+ANNsiqOgAbnXo2ylTl7r
         hRcWHB/YDePszZ+wz9f3VX+REaTK/oMhc6l9mdNkgWhGZiixACr+MC5fEA+7KWfckR9Q
         74WQ==
X-Gm-Message-State: AOAM533jGJj6b9BM/YIQXB1xU5kkQjFedm2Mgudf4QsmN/wTOAa7TykI
        XHTRoryzv0LKN8TU/BMXpI4mWY21unGvOlli5lc=
X-Google-Smtp-Source: ABdhPJy3e+fZ99h27WpNLYKA0IXYlGTWCulPyUV/TE+ISHIMZ2oVnnSNdJ2NS0rlyua0L+vhYeN4og==
X-Received: by 2002:a05:6000:186d:b0:20c:6b74:f31a with SMTP id d13-20020a056000186d00b0020c6b74f31amr3203853wri.286.1652434789331;
        Fri, 13 May 2022 02:39:49 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id l5-20020adfa385000000b0020ce015ed48sm1631404wrb.103.2022.05.13.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:39:49 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v3 08/17] HID: input: calculate resolution for pressure
Date:   Fri, 13 May 2022 09:39:18 +0000
Message-Id: <20220513093927.1632262-9-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513093927.1632262-1-acz@semihalf.com>
References: <20220513093927.1632262-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
index 77f2930f78f5..c9f8405c0522 100644
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
2.36.0.550.gb090851708-goog

