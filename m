Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBB9C74BBFA
	for <lists+linux-input@lfdr.de>; Sat,  8 Jul 2023 07:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbjGHFYa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Jul 2023 01:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGHFY3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Jul 2023 01:24:29 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E266C1FEC
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 22:24:28 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-991ef0b464cso722720466b.0
        for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688793867; x=1691385867;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdhXbbQIXT97vDa3bu5xKes8lN4bZY7OZGIP2YANSqQ=;
        b=i/tDGw3IUlp/+ZJZ1maN+lNa4J9QAfkhY6l191RSsijP7CcCA3byuT1q/WoaNT8vIL
         hgDI2SMDzWn85wbFt/yZkWoFHyJUxBjV4S7adx+WvoAhsD6Y6cLWEmOfi1p1BEyAnVKv
         EyKscSsYzqWSWPpwaDd+dRZG/WrfbqlQ7KBRLyR2GszNcDdk4/DZ7EkvkQy9FfDxXHzi
         do3tkFmW/HHjKT27dziPfgIyvyKXYJbavv1+JRj08JLj6nfBHYCBACYjgBmil6qpLxnb
         0dhLA4xyRM7iK1CZo280TyATt5iQcZ9WKwWRKKeK88E4X7QhtplyUVPibFaxFOqBNnZT
         MYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688793867; x=1691385867;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdhXbbQIXT97vDa3bu5xKes8lN4bZY7OZGIP2YANSqQ=;
        b=akf/6KpwTn/YJpBwAhP7vjwHbeicJnNUV9ChXR2B4LY5/gYPhtNIdLLtNNhagJ3jaI
         XBQwm74G3APQreU09q0EvP8+khvNok9aZZFYnjedtqaFtqKQpZn2+Ybj/MV3G8aPzDDK
         EiZ8GRNIYykn7vGrdb3xCfzdThXyuoqBhRNherlmkQsAaxoOJUdnMnIaWCQ52GiFlRsd
         IIQlf4uGnVH7rCjfG/RwNdFIfQDBh3ziYU7qOqsreoSwfZbFRFMzIRDPovm6y5bO6EDm
         cR1yCcuNmEIwqRRrYdQj7gvcy753FPkGgssKBNolMYuCvfRk/iCWZZkzb6PQ7fP51JXL
         yxDw==
X-Gm-Message-State: ABy/qLYaaJELGZGPOPxh8u0v8o1PH1WbTykgq9DFpGgMUdlIAdnvMh7j
        /7H3QBfnejQgEeS1sVKPVtz9/gXgmAGoHNeEuWg=
X-Google-Smtp-Source: APBJJlGeqoDayeNy0C5oPjoh2vLHp+EGrxdwNEeEHnb3A640PgJRu6PTBfWTGz/176aRQRYd04yMkVht2R0i0x3AyXc=
X-Received: by 2002:a17:907:940d:b0:989:6749:d61 with SMTP id
 dk13-20020a170907940d00b0098967490d61mr9432511ejc.19.1688793866845; Fri, 07
 Jul 2023 22:24:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:b60e:0:b0:1ce:9c66:3a64 with HTTP; Fri, 7 Jul 2023
 22:24:25 -0700 (PDT)
Reply-To: katerynamudrik01@gmail.com
From:   kateryna mudrik <ihseig538@gmail.com>
Date:   Fri, 7 Jul 2023 22:24:25 -0700
Message-ID: <CAKbtL7De4DDgPAdM6pnE0GuS--9u=-jWN=J1ocCOmyGmZq7d+Q@mail.gmail.com>
Subject: Good morning
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, good day to you.
I hope this email finds you well. My name is Kateryna Mudrik and I
come from Mariupol in Donetsk Oblast, Eastern Ukraine. I am contacting
you due to the crisis in my country Ukraine, we may have been
humiliated by the Russian invasion of Ukraine, but I still believe
that we Ukrainians can always get help from good people like you who
understand and feel our pains of how the devastating crisis has put
the entire people of Ukraine.
Now, time won't allow me to say much, but I'll tell you more about
myself when I get your reply.
With kind regards
