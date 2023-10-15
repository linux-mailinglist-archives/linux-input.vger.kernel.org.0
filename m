Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2872D7C9BBE
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 23:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjJOVMH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 17:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjJOVMH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F188C1
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:05 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3296b3f03e5so3388833f8f.2
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404324; x=1698009124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Huhh/OlwpXkMpXKcwHwnmwV8YpnbusYc64GlhC06k=;
        b=DRf658wDkUo/Cq3RXKfR4B3lt8c95B7YfnB3NEWGf/S0audpENPlvJqHwK7ZACJeOX
         UN+QixYdjK85RDnRmTeBcejdT1lDkINEikr6t+1hlRzHkvf3qUeiPdKKVfW/JCWhzNOj
         vmrBECazML6dGWjNxQpuwfB7yBh16I3IsU9zJWoCpqaSTdE9W+wD8jLmChSdUOqiyDyT
         lKVS5HicDrEYAukl9mfqn5WOMRW1WAyYyxGQ8jk4cZYAyaKHlNxDKzyamynBbSiA16FC
         hM2U3uXPzyePbjNMRdUmkVGLMfhoscwRcnyXDgvtwTvM4N3Wd6lqfKZny/LfkVamqoga
         atuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404324; x=1698009124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Huhh/OlwpXkMpXKcwHwnmwV8YpnbusYc64GlhC06k=;
        b=V7LOeqBXEWn9Tq3vzN79kUyqbUMO9TOzAgsYnjllVOMgEGSkf5jP6xbxXOFcsHD+BX
         DxXJ6dHWKUzHz7NFiwy1qGdl0MD/kooqpk9fPufOkJj5p+do6XglryCA4plUoH1w4+Ps
         WzDKTXGK5tGA3rZj23EcuxdL+AuH/SWltszhGTc923hP8HrIukdP38ZO3TwArh7sUnil
         5uhL92Xap8AbrNyXDn6S/g4nQrKlHXLxXXuRxwHFlvqF3gXfuwIB6UOfD5z/lBXE7Ic3
         K6NWoaKCshxUDrQXDSL+2rzMRKX5J52E1U6MDWmkteLGjdllSYmh9Q7rFMDbuEdgwrNv
         AjsA==
X-Gm-Message-State: AOJu0YzaIa3mlds+fPxp7WcXOZhc7x4mPioo6vkW3KxlDsXmbcFLBEX+
        WwWHZ2z/iVWm/YmuOZ+xXvVABQ==
X-Google-Smtp-Source: AGHT+IFd5LFspYZaIAwsfZI36kiOt4XmrUk4/kAFw3O4e0aQmvqumoqek4alpFIfgO52WOmTe1xs3g==
X-Received: by 2002:a5d:4534:0:b0:32d:a3a0:e927 with SMTP id j20-20020a5d4534000000b0032da3a0e927mr3677866wra.58.1697404323892;
        Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:12:03 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Sun, 15 Oct 2023 22:11:54 +0100
Subject: [PATCH v2 6/7] Input: synaptics-rmi4 - read product ID on
 aftermarket touch ICs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-caleb-rmi4-quirks-v2-6-b227ac498d88@linaro.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=pgIIB7OL7EFg+Qrqe6fqxDg+RErXXrlo3Ql+ExoD2SI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0Lk//jQ0Xbyaa3CypEZL7anF1UdBe6VEuVdE3KhV8
 hZvidbqKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABOZ1MDwT/ns7u3z5vvXcLwR
 m/XI/XzZGh5Hvm/lVduMb8sa/xbs2MjI0Pd8GevCNU7HPP5pd6bOiteqEUgW1K1++kp1gtpFg/V
 l0wA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: methanal <baclofen@tuta.io>

Some replacement displays include third-party touch ICs which do not
report the product ID correctly unless we read directly from the
product ID register. Add a check and a fallback read to handle this.

Signed-off-by: methanal <baclofen@tuta.io>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/input/rmi4/rmi_f01.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/rmi4/rmi_f01.c b/drivers/input/rmi4/rmi_f01.c
index d7603c50f864..4aee30d2dcde 100644
--- a/drivers/input/rmi4/rmi_f01.c
+++ b/drivers/input/rmi4/rmi_f01.c
@@ -250,6 +250,20 @@ static int rmi_f01_read_properties(struct rmi_device *rmi_dev,
 		}
 	}
 
+	/*
+	 * Some aftermarket ICs put garbage into the product id field unless
+	 * we read directly from the product id register.
+	 */
+	if (props->product_id[0] < 0x20) {
+		ret = rmi_read_block(rmi_dev, query_base_addr + 11,
+				       props->product_id, RMI_PRODUCT_ID_LENGTH);
+		if (ret) {
+			dev_err(&rmi_dev->dev,
+				"Failed to read product id: %d\n", ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.42.0

