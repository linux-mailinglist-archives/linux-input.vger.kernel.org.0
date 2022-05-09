Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FE951F548
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 09:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiEIH1j (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 03:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236040AbiEIHHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 03:07:02 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A24916608E
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 00:03:07 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e2so18027455wrh.7
        for <linux-input@vger.kernel.org>; Mon, 09 May 2022 00:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDNqkNPvjbe6zVP0Q3qqImGdWfcyYOSPxA9V1iED1qM=;
        b=goq61AK+FbDfYrnQ9DIsE+JSwNfxf19G6nTxhGv8LjH9q1KYJpXgTL5gJjyQasa066
         tacvyK71Ne8M30jiORVo+X5l8UjXBcpYjW28LQ/SS0KPVcfO4j7Xs+NbBPzuRfSrdikW
         FxxWboMRW9caVejY5qLNiBQ65qNxf/VcnwmD22x1eoTjH5h8ZqAt4L1guX5ymMaEwl9N
         IBzw9L7JDJUdrqE1ed7rJsJregvq00lzfmw2acnUB/PQURaNiMZXb8vWslt4tKLR+DqH
         5KCl//BWF5ZQZmq5/tg1VFFs8MbH2iCnueBZZYI8crCnqK+q/Hk5Cfj5qtcQAfWxRRfO
         obpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDNqkNPvjbe6zVP0Q3qqImGdWfcyYOSPxA9V1iED1qM=;
        b=oiLM550pPN8EOyovVakyOpY53iJBdSDpSeWN1VREbON2grFTLrCnlquJPjlF0a3p6K
         mIBte5dzrPM/OhDODP8vYyNKNdkgtcppbgpD9nCvhfgV081et5NIVn/b1u/1M3N9timh
         OeMOmv48h0pbFjki62elDTbl0rVZEX/AX4VwKINtPtLhtrqKgaQqqw96emi6qHBIVXY3
         92+tDzxzdy4QUb2s2VrVooERJpFivXdscqGF1ANCNtP8R5gTW6sCvXNXJ82+HNnQTeMk
         rumZlKuKycN0znH91wyV6K675Nt3rpFKv3sNed0gsF6IN7vyOtcZAXv2sBHu1sPCt9ZH
         aHrw==
X-Gm-Message-State: AOAM530lD9HR1SygApTfXkAAZiuqHN4YdQHhrLEaLbhV2rf3Ak6ZB8zx
        YkTUVL1Fc9B5mdqFRgUzgSYam4Whupc=
X-Google-Smtp-Source: ABdhPJz1tVk1DKSaJaMFEWmRhKvsKIPaCZvFQGeTF3hpCBBVlid9xbLo8PawHz/Ls3yicuK7+wcdrA==
X-Received: by 2002:a05:6000:719:b0:20c:7894:22e1 with SMTP id bs25-20020a056000071900b0020c789422e1mr12527652wrb.93.1652079774894;
        Mon, 09 May 2022 00:02:54 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
        by smtp.gmail.com with ESMTPSA id ay34-20020a05600c1e2200b003947b59dfdesm10187691wmb.36.2022.05.09.00.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 00:02:54 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     bryancain3@gmail.com
Cc:     benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 0/1] HID: apple: Properly handle function keys on Keychron keyboards
Date:   Mon,  9 May 2022 09:02:10 +0200
Message-Id: <20220509070209.5223-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505191221.36172-1-bryancain3@gmail.com>
References: <20220505191221.36172-1-bryancain3@gmail.com>
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

On Thu, 2022-05-05 at 13:12 -0600, Bryan Cain wrote:
> [...] Also, I don't have an Apple keyboard on hand
> to test with, so I'd appreciate if someone could test my patch with one to
> verify that their function key behavior is unchanged.

Tested with a Magic Keyboard 2015 and a Magic Keyboard 2021 with and
without fingerprint reader. It works as expected :)

Tested-by: José Expósito <jose.exposito89@gmail.com>
