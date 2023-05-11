Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2544E6FFBCE
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 23:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238452AbjEKVWg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 May 2023 17:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238254AbjEKVWW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 May 2023 17:22:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CAE1992
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 14:22:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d58b3efbso186555f8f.0
        for <linux-input@vger.kernel.org>; Thu, 11 May 2023 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683840135; x=1686432135;
        h=content-transfer-encoding:content-language:to:subject:from
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFxpKCsnCVqJTCkJKl13fpfrFkIdoOr7ThMZwIONZ9M=;
        b=kluJPGNWXL66E2bnjD1CJjA1pWCLlIGUcE/SkbXUTsXtKjcN36xXh4fBVoH4ntzD6i
         1WG3h1FWNdbnTmBldKBxPgwUjStaJbXkvhBAdfgNfGKOimS/mLHgw/Q0Oj4BJx3Ky+d7
         Djq57SQVIqH1IxFOo0R18/1x0y1Ml1mp0/EtZcuosSXHqlIwM1U6ZqJ71Lt69WuLp+mj
         60h0zMknxuugH4vvPsuuFRuqYxp1/UhG4jBbqHnWieH+22+YL89lzImb9nHBU4T9Tf6n
         8EesKwkaSrCxAQJmIpkkF0YqTvIH9oka3YvXLTkjQKVmvW+6XvQpu0aVeMjbgqavjXVc
         xLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840135; x=1686432135;
        h=content-transfer-encoding:content-language:to:subject:from
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wFxpKCsnCVqJTCkJKl13fpfrFkIdoOr7ThMZwIONZ9M=;
        b=lT/cle8YYJyhPrTs6kY4VmP5M7qygpe2Hq6ecTWDKrsCiWX7mSxNv3mRwOZfmNHkp5
         VHM1XyecuOWEhey4VjWc264gJsAYG5HtEDWSQnJXj5fPTk/7NRD5pU4+iBwmNpZJxz87
         qfX0zQkADf0Kw2M1qGs4dZnBro0aDK3jhmn1U2UUHmGvhk1OK2lZbjvjb1TB0L7YytWP
         FurVjXtvTe8FDDkMKN5nYJ3kzq8Ckp2uaFTJf/p+G8NINKwGWnLo1Xvv/YBzr+b/xGJN
         htTJye5ssmXhnAjygICXmoCyRcZuN4Q6BN55T+O3jSitS7MBiSsMt0IgfOjIw0MMo2zz
         3g6g==
X-Gm-Message-State: AC+VfDwZlkiSCjPCaIc56m0hla+SCiuUmjvkG62X+XgNdjV4o3FdY7dr
        fMXa2wYLomY+BkLa/X+EXM4ud4Ld+w9j
X-Google-Smtp-Source: ACHHUZ4gQGa7UrIfwKbJMmP7BdFpUtinyoj+6vQwl2yuP6KXOiU2kJ+Ie0Pm7yqY+jIozXFQXVf75w==
X-Received: by 2002:a5d:4c85:0:b0:307:904b:29e1 with SMTP id z5-20020a5d4c85000000b00307904b29e1mr11407196wrs.20.1683840135417;
        Thu, 11 May 2023 14:22:15 -0700 (PDT)
Received: from localhost (170.red-80-39-255.dynamicip.rima-tde.net. [80.39.255.170])
        by smtp.gmail.com with ESMTPSA id q15-20020adff94f000000b003078b3e2845sm17224685wrr.31.2023.05.11.14.22.14
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 14:22:15 -0700 (PDT)
Message-ID: <eeb19342-3499-a1fb-388f-d4670472b16c@gmail.com>
Date:   Thu, 11 May 2023 23:22:13 +0200
MIME-Version: 1.0
From:   Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [BUG: 6.3 kernel] Logitech Trackball M575 misidentified
To:     linux-input@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

6.3.2 kernel identifies "Logitech" "ERGO M575" as "Logitech" "(\xc9_O\x04)",
6.2.15 works fine.


6.2.15 boot log:
input: Logitech ERGO M575 as /devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.3/3-1.3:1.2/0003:046D:C52B.0003/0003:046D:4096.0005/input/input15
logitech-hidpp-device 0003:046D:4096.0005: input,hidraw1: USB HID v1.11 Mouse [Logitech ERGO M575] on usb-0000:00:1a.0-1.3/input2:1

6.3.2 boot log:
input: Logitech \xc9_O\x04 as /devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.3/3-1.3:1.2/0003:046D:C52B.0003/0003:046D:4096.0005/input/input15
logitech-hidpp-device 0003:046D:4096.0005: input,hidraw2: USB HID v1.11 Mouse [Logitech \xc9_O\x04] on usb-0000:00:1a.0-1.3/input2:1


Thanks.
