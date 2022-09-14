Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9CF5B90FD
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 01:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiINXhr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 19:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiINXhq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 19:37:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0659B3BC59
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:37:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u18so27650106lfo.8
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=ShE51VUQ4axb0Bz/NABdTBjNwA+Qofa4jx9r0eRkBes=;
        b=iwoV1reAgTrYjyidwwZRBvXFawUTJny2hO/DIx2G9WeQeBl3da6F0CPBNhLBFO62DI
         KX96yD/vcgkEDW1NLt6zV8Hj2QmOVmu4WWfYhFqDARoaeboT9nh/QKQ71mNolsDWpvSr
         JRfupmtb+O3VkalsGm92vxO2f8+iSNQzHqFdfJVTQuRrsbsi3eDFInNlGeMWJjtcH9aA
         +0MhF/qy/XiR+FekdPAV5wCbcvwvTpoHvsLL7ZBtcDZ6GhhK2C63VvD4UCr7r4m6YuWO
         UdGfzCRwM/VIvi6apTSajskTdxGNh4zGFWH3ccDfWmJ7NFgNqxUeu1+2FZBTl575G0Fp
         /JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ShE51VUQ4axb0Bz/NABdTBjNwA+Qofa4jx9r0eRkBes=;
        b=hyFP+nx/5T/icIy5e3tc7ANCINWMXFcrhA5pDw97D8U/olt3B5POj5k3n/Y420joDx
         972Q/IGSQV5bslKdZKFTv+1Up3PXXTw5tyCsIDARERHXlZUTRtPiDsG+JMi1QVjsnqbA
         mxQi2zyYvz1z+Z5LHQRT3mXUy/m5dovxxp+H2DyS0UzuO9MuDldPKFmFrEAj668wEY12
         V0Beh/mAXOluojOyZNRKw1gXz+qLHLgfRuH9pc+Cb3jY8V8gGjv+tbzVCgC5wfHAAZo1
         Pv6lzvJLGa9oevPuuzTB93v482QFK0kdayDNbv+jeyU0IwoEVNukfC8TREy4cLp3gEm5
         bfGw==
X-Gm-Message-State: ACgBeo3pm5n+vzfd2QCPhxiRheaRIqUiE3jVzyL2jGxT5QlcRelgJMEC
        pZN8xFv6/P9SZPPeTN2gIS7q965gkZIUedr7k0k=
X-Google-Smtp-Source: AA6agR4yNwl9pPy9erJfZOOcjbcJJzcmEzKSJrONnYrHsDvl+/v0gzLdgE47jlK2m0qg3ENdmwFl0jkVuRepNZxa33w=
X-Received: by 2002:a05:6512:3281:b0:496:f9b5:eb55 with SMTP id
 p1-20020a056512328100b00496f9b5eb55mr12938617lfe.279.1663198663305; Wed, 14
 Sep 2022 16:37:43 -0700 (PDT)
MIME-Version: 1.0
Sender: anselmenicki@gmail.com
Received: by 2002:a2e:a0c3:0:0:0:0:0 with HTTP; Wed, 14 Sep 2022 16:37:42
 -0700 (PDT)
From:   John Kumor <omaralaji51@gmail.com>
Date:   Wed, 14 Sep 2022 23:37:42 +0000
X-Google-Sender-Auth: uLfjCKS0_5CLsm-vIbfl2FTnJOw
Message-ID: <CANbcXbHWmHkZD76L7Huv6taX2qgFN0hd7KF7dz4niv7QF6Y5mw@mail.gmail.com>
Subject: It's urgent.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings!!
Did you receive my previous email?
Please reply back it=E2=80=99s urgent.
Regards,
Attorney John.
