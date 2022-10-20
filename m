Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D8360648A
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 17:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiJTPax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 11:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbiJTPaf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 11:30:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB62D444AF
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:19 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id f8-20020a17090a664800b00212464cd49fso1851268pjm.4
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41e4i/Lbxe4Ir1JM6TF1zCPW/+WkkvZnCN7E4qinFjU=;
        b=Kl/poz9O11FWPjiRABuDUq7TTTSdmgV8bcd+q1hZzdNGv3icrj7AUavpDnMJCpOzyZ
         rF65IVulX3CYyiZuJfp66SbCA16xLIojjUM5jZuyoB+QCNyWEpALXHZi/UJdYMQjenkG
         bXx7Zoj+jtZQ1Arm/6/xYKgv7NuTkGWygoFLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41e4i/Lbxe4Ir1JM6TF1zCPW/+WkkvZnCN7E4qinFjU=;
        b=B8lng9gGiPlNhn6QErRl1B61yYJc0a6T9oVyK81rpV8OU1bgCJ6YnvAKeyUjCO7Ojd
         pomSvYOoylsfVXpsdCM+MChW6oqlxcmG1ZO8oAp66yZQGminM4R4M8TO+5Y8awcVZss8
         trYD+LQnB0A4avO1KVAxOjaYHp3v3KJGUyO6VH19cFa/E/RMzgzDbklslL2Bxh5hwQ1K
         HYFqKdL0inveDjDsiCvmnYzzUfwoZcnekEab4GCtHM2A0eKfIst/b2Xdnzw9NeuTScaS
         w89rfhTcNPX3qec8WUh37mMKaRL8HiqCUPJGJioILxZQ92X8NXqlX2l3mP1ufy3Vk2OL
         h9NQ==
X-Gm-Message-State: ACrzQf3CzOoa62JZY4Ahs5YtRxxggFOEGEyD9N/4oO6Gt4T7wbBvKBQN
        EtwUp6U5ZSEioCfqtBvki6ayng==
X-Google-Smtp-Source: AMsMyM4K81TnidnVKUiGlH1I/hXsaefbG4OAJZl5bUJRzfmVIwAJau3ZMKqZfRwTZ1YTtM9P0GKzeQ==
X-Received: by 2002:a17:902:d484:b0:17f:7437:565d with SMTP id c4-20020a170902d48400b0017f7437565dmr14435570plg.154.1666279809373;
        Thu, 20 Oct 2022 08:30:09 -0700 (PDT)
Received: from roguebox.lan ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b0016c50179b1esm12965573pli.152.2022.10.20.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:30:09 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jikos@kernel.org, jic23@kernel.org
Cc:     linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] HID: mcp2221: fix 'cast to restricted __le16' sparse warnings
Date:   Thu, 20 Oct 2022 23:29:59 +0800
Message-Id: <20221020153000.30874-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020153000.30874-1-matt.ranostay@konsulko.com>
References: <20221020153000.30874-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use (__force __le16) cast for adc_values le16_to_cpu conversion to correct following sparse
warnings:

drivers/hid/hid-mcp2221.c:950:32: sparse: sparse: cast to restricted __le16

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 960f9df7c620 ("HID: mcp2221: add ADC/DAC support via iio subsystem")
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index b3eaf170f0ec..3014932c8cef 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -950,7 +950,7 @@ static int mcp2221_read_raw(struct iio_dev *indio_dev,
 		ret = mcp_chk_last_cmd_status(mcp);
 
 		if (!ret) {
-			*val = le16_to_cpu(mcp->adc_values[channel->address]);
+			*val = le16_to_cpu((__force __le16) mcp->adc_values[channel->address]);
 			if (*val >= BIT(10))
 				ret =  -EINVAL;
 			else
-- 
2.30.2

