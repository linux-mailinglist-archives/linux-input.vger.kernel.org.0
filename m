Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974EB715012
	for <lists+linux-input@lfdr.de>; Mon, 29 May 2023 21:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjE2TzR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 May 2023 15:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjE2TzO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 May 2023 15:55:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E97F1
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:08 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so3496386f8f.2
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685390107; x=1687982107;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBSONiyq8ZSgo95IwQOW+zN2QkXEPgex9gl6YgjWGRU=;
        b=nEr6mmv2rVEDCRQwGzIf5WvVB4UnG4rceoZaSoaDdH5mXhEwMU80fss55ueRL8/ici
         UVBZfYJf3l1hTAuyvHzQ+zDUuSt/3BiA3iTrVoiD2gfaWQhkue1/fxujqtOKmlxhi9O8
         Sf1z0Gv7/mteFlvHPByomUm+goX0P9NOUS7NM7BNiqU8yahk8F1aB8P/u3C6pZp1YG/q
         rBRCzK7aAA8lT8k0szfv2xjgxqSXDSI4fUuyh4/BnsgYE64CDDtpBHUogDVSk5TFMYBD
         MshAnCXd0FBW87puw1QKIJ0b6lDN14SlJ5xsNeBgaysuRzayV9ArL0V8wYaRRDoQO+Rs
         lDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685390107; x=1687982107;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBSONiyq8ZSgo95IwQOW+zN2QkXEPgex9gl6YgjWGRU=;
        b=KSqwWwlxw+KDBdNyD+fqPdcP7vio09jlmpW2a0RFaFfsitypL7K2LWLtlMIsiNxPKN
         Kb3IQ5puroyVyHn4+HRDFF7hIGRauFd9WnsniacDS63mr+HaPZtPMeRqnYixrcHvHvDA
         sNmb8h0cxF6XrheXZFT6feSvSUjOJ0cQmA5GXqLvz7MjyKqSDdHAfQEQi6IEjfPm4USN
         hXWoheH0ImM/WJJt3mFg3kr7QBOSdf0Rge8Ia2+YUDRS6ESXzl8fiTZnzawv+PAX3iy+
         ziAFG4fSJarlZMtWCVVgtyuUqKDsINv0uDGEU1E1Yi3/jaaAdFRR73gIPd3f5A57At9J
         DiQw==
X-Gm-Message-State: AC+VfDwtNU0voBgW2+aIHYSL9MEZFnXXNxjFRmr5uX/RQqhN+cxr8EJa
        K9jBUotjgrx9Eaoqo+HUaIx8EeAgXpzg+ZDXZ0gCjg==
X-Google-Smtp-Source: ACHHUZ5GfwpPYm/NfeFmfvtM5xuxflgHh9nfyUgpt+u1fKEzK1WlHnlXKSZKdnPUPz8OliWPbOFFfw==
X-Received: by 2002:a5d:45cf:0:b0:2fb:1d3a:93ff with SMTP id b15-20020a5d45cf000000b002fb1d3a93ffmr9131254wrs.61.1685390107241;
        Mon, 29 May 2023 12:55:07 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id t7-20020a5d4607000000b0030647449730sm887364wrq.74.2023.05.29.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 12:55:06 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH 0/2] Fix pm8941-pwrkey debounce programming
Date:   Mon, 29 May 2023 20:55:05 +0100
Message-Id: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkDdWQC/x2N2wrCMBAFf6XsswvdWC/xV8SHJD3aIE3Dxiul/
 27q4zAMM1OBRhQ6NTMpXrHEKVWQTUNhcOkGjn1lMq3ZtjtjOY9H2wnnt97x5R5+eqYAFpGDdb4
 TYE819q6AvboUhjUfXXlAV5EV1/j5H8+XZfkBMpZ/5IEAAAA=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=753;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=69Sxru6xrRyg5y8CAaJKdsYttoRQnjQieSGPqXGUZsw=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkdQMaUVI9IEWUIggm5Li94NSCWquclCVuQGzyb
 c6cYkK1IPmJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHUDGgAKCRAFgzErGV9k
 tlpsEACIUlS3bOWKb235EZw5kDYqF2Oon9gzdj2bO7KFTIMhqbOupk087Q1z+trLTgplc8BJOih
 w7XDzwY2iWQG8vardxKYnBd/s+OIQozhiRzbg61GHh/CC962KjXIln2wLobwy85zXL8Iq9GHhch
 BCakL0VCMvQSpiZZbJaY7WY9/FAew4WS0vM4Iw5ywy8XRyQCez/3fWmhEXVKVpsd/rFm58YK7gY
 68jCDZhVeb8AZ7Gz/Kl5xBSc27e72W/eLisP1qFPi4XzvLm90MAiKVGr5n6Sn+LWVUvXN2zYhLB
 lfIUjM0+qncxu0/dtfmz+gA2kyn65PQv67Pg0HC8LDsXTOT/OdlAwv+1Xt9Z/mE8FpxNeppN2TZ
 SUTNf/qellsGtB19dWRYBoVFZHFHvH5tCSPbuSO+/3qwv7jSjpdnouaLXydpX4lq/r22YLjhKed
 P3LHmYWe9C5hkoElp2aknca2H4eCfkHJVgOXERuWroZCFjgpcevBJkk38up6rmKjDBtXv+MG3Ji
 dG08wYUTb+IDaM/IZzskZTXWpDCm+TyhaOQggBgYQedjkpUN1PFZWH/x9vpI8kJuTTWZRpDfghd
 ONQYe/5QqOyofPBT2GpBEE4sCpkfSSTrebe7lBsmFJM9sSLsPU4m6xqNrZ2AAbsie4GS5rU5I1e
 nUNDtO1Sdd2ZFJg==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since PM8998 the pon debounce register was adjusted to support much
lower debounce times however the driver was never changed to reflect
this.

This resulted in the debounce time being set to the minimum ~62us on
PMICs from PM8998/PM660 up until PMk8350.

Set the shift and mask correctly, and adjust MAINTAINERS to include the
driver under Qualcomm support.

---
Caleb Connolly (2):
      MAINTAINERS: Adjust Qualcomm driver globbing
      Input: pm8941-powerkey - fix debounce on gen2+ PMICs

 MAINTAINERS                        |  2 +-
 drivers/input/misc/pm8941-pwrkey.c | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)
---
base-commit: 44c026a73be8038f03dbdeef028b642880cf1511

// Caleb (they/them)

