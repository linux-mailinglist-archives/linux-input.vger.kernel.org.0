Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97BA554E77
	for <lists+linux-input@lfdr.de>; Wed, 22 Jun 2022 17:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358861AbiFVPEP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jun 2022 11:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357130AbiFVPD7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jun 2022 11:03:59 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394563EA84
        for <linux-input@vger.kernel.org>; Wed, 22 Jun 2022 08:03:52 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-101d2e81bceso13987463fac.0
        for <linux-input@vger.kernel.org>; Wed, 22 Jun 2022 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=lmXhPRDXrnlbYClAFJkfHZYdowqXsf1nTuDLZnU/Y1W/T6TJ8ApbIv950i47frAtN/
         OtndHJQoWJG+weygm2GuosJduERMEzUHLtTF4oGKopzqXa+c5O1ob2p5JuwuGNaCZz0D
         0k2iO6ZG6gpeVsjTt5A+NLMvCH8qDkpG8Ex3xIMBpunG6BNJWrlCGLJYo7boJK6pvBIx
         W4x550ST0gVpK9sdxwL58OfMVVl7H7xG/39bSvJCxipLUGbdwSBY6WRzvY6hd28wfB/N
         vDKUfqITg8PxsgA4g6gEDGmS0K0dBg3KSntFmGDvcmLKkvSy/F4e+TYysqkO/txSQBCJ
         afFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=vhZEVnaGNBjosB86GDUW8b2wHjB/+QU31bPXl36TqFE=;
        b=muQGuz6AEViOOtH+0cIpwPZ8D49mz1KcP4dm0+RT/kOFVx4Xg/GGp2R5SX8lzZeoaA
         ARwVNJ5JKo9kJXTw7OPROB7KqPdDLbsdClzwWz/QVloQnL9C6b2lsRtPewiuZmY1xF3M
         IRdNZ+58eRCI/zAFtUAQAv35q22FCJtc9kll187Tp0veJ8nGOHvRqf3K/z+pmes+VjfD
         RZSjulxPnnm0L5gEndDoYehLh0azMr3tKxYkzjTKm6WPyH0xnlZuvHyEPXwuFB/AOUxe
         L6UyxAy1berC2LTDS8X7sX9ey8oJeTO6QbLt81m1NUHimiUfdK9OiP7nQKd9Xi1CnwKo
         rSZg==
X-Gm-Message-State: AJIora8n1CKsOvcK5g+s5GOCUysgzMIxRCYZE3Ijb5K43W/suMBhG4lu
        yHlzP8kO27PvbUx7Dg44fA4VpGbEB7J+831Aakd0te+snDrPRLJM
X-Google-Smtp-Source: AGRyM1ulxotWsDV/SS5wzW6q4zt5LXu3F658bS4StYWI/FgPuIBqBz38zqk7aydOTm9FXxU+wDfnf428k+eRTEG/aD8=
X-Received: by 2002:a17:90b:1988:b0:1ec:f52d:90d4 with SMTP id
 mv8-20020a17090b198800b001ecf52d90d4mr1796737pjb.70.1655910220864; Wed, 22
 Jun 2022 08:03:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:2308:b0:16a:1b3f:f74b with HTTP; Wed, 22 Jun 2022
 08:03:40 -0700 (PDT)
Reply-To: sales0212@asonmedsystemsinc.com
From:   Prasad Ronni <lerwickfinance7@gmail.com>
Date:   Wed, 22 Jun 2022 16:03:40 +0100
Message-ID: <CAFkto5vTxj70kORZJZdwOGowXjsZ399eo6DJj=8T==7paSuHTw@mail.gmail.com>
Subject: Service Needed.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hi,

Are you currently open to work as our executive company representative
on contractual basis working remotely? If yes, we will be happy to
share more details. Looking forward to your response.

Regards,
