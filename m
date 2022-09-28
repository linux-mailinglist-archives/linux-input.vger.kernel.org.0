Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0EEF5EDB23
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbiI1LGu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 07:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbiI1LGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 07:06:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D01FAD9D
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 04:03:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n10so19158454wrw.12
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=hsfgwkohunj2bq+qokQjpwKuMUBKZOCzjqLYVUE9VjlDHQ0ttU9xn0OXOr5TQjcIbd
         pZUkZFNFrerNpyt/MUrqcb3uHJg+xsYfXWD3zIbmEi36726ik2CodcHZduVOPw2IadTG
         /XLxOwYhjUflJM0qYMREl8mT4NV2UbLp250UeB0y6h218TWa8CLpg8PDY6s0xDOjWUUD
         6VB1Iwmy5fwSrsY2oZSHdoESqpE32cpRPh2xpWyH8YsruCCDAuQu7zb0dlSsC05MInco
         BjvOOkeVVOMUMuBeQjYrDsHSj5DOFz063CB8rDd4ND0tNbVYzu13/Ye3ES/P4xkWKkbP
         Joug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=n45rzAkTZDTejlnJMZUEZrafAdgkwNi+wcUoBs3NIF/xu6XC3COYgtNYY+m7W+hShb
         s5rPz2YxE8V8F7QI2xnORLOsCLURRnHeJhFfF5pB6Bma19IXaXkVHofZHOCeYlfXIB7T
         TXYzg69EbRLNmX7WEznXTBZjtcoYKDy8ugv7vBqD0erPxmyKvH4NieNyltNiwsxytUAS
         55/CcM/OLIUVrpo2/Tcol50VwuKQZh/ryXlZiu4vYTkeOwt5ofZ4tY9zfdYZhF7jQ9tt
         siyAThbRrsGCjQNjWjilkkKW2JIasvHntMdgGxnDWtxZW/L3GBd8J+eUKCG+Yvwmn/Kf
         7gww==
X-Gm-Message-State: ACrzQf1FToBbvN8OF9J2+fCoWgEAg8wa9EJ6R8vu2YP6+m0eG3bmGQe7
        NrsIFnvr2jbzyi1befSpqobjxUeMx3VFoWUJxIA=
X-Google-Smtp-Source: AMsMyM63Y5YTDo/PDSCMK/uJ1s+dnS4eUnLjHedcGz8lbTTof7yKLNXyn/xlq4PeVWbJ5MrApHvoJQzUrk3pnEI0D7Y=
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id
 v4-20020a5d59c4000000b0022b237c3e23mr21002441wry.291.1664363007529; Wed, 28
 Sep 2022 04:03:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:e242:0:0:0:0:0 with HTTP; Wed, 28 Sep 2022 04:03:26
 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <edithbrown052@gmail.com>
Date:   Wed, 28 Sep 2022 12:03:26 +0100
Message-ID: <CAPGw1A69c24H-qjrvaj8ES-J7otOjgin+W=G++pNjVNLG0dh7Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:441 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4973]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [linadavid0089[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edithbrown052[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edithbrown052[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
