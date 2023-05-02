Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD0E26F41B7
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 12:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbjEBKfd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 06:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233846AbjEBKek (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 06:34:40 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94B349FA
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 03:34:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso21128725e9.1
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683023659; x=1685615659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuOjRmgjtLhSlTYCy2tb4/lYCbxRspWajmTs/M9Mi5o=;
        b=kCk2ro6a6YQX9+tLrqSnk2dY0vqPBD7XtM6X7zlR7e6aO8TX8mHsbm9ij8O3z6T9LZ
         +CosefXJJij23PSJfFdeb4YvWiu1Y74TIZGHqygaG1JT74s3wjtumzVFUj0VFzGi3qVA
         XOxqkvw3yEKx08Q2ua61LBfY+gcUsOj/qic1XTGva4Zw4vrZILrB7MGxPnNu/NC9Uz2L
         jKfgofFg7AP556IKUGSC+aM6R+gy6NNTZE6+HAqYzuZqtRu+w+aJoxtRtBYqmqgl2Qy4
         8sOo6pnaDmf3NgP5uB6tDXhKxY/P9NHsN5IsVBMZ4FOUGMOlW08Dar51dnzxlYQRoIHe
         kiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023659; x=1685615659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuOjRmgjtLhSlTYCy2tb4/lYCbxRspWajmTs/M9Mi5o=;
        b=M92Vyq/LEhELXCR6me5pziGqInLq4zvEjRT505UUIYu+uQvRkAU6svE2Av5cpe5+/X
         s0WwFYzWbGiKf7ti8Gc7JtcDfft/CQ6Snao3/nKpLrBY0nHdh7NTEo12K5p3G9sk6803
         MKQ4NzHk4cYv9EEay8b3CMr1gUzmGn0b1R7u8xPkXWnMSEUp/FXaY1B2CHBBfH6gw4RX
         GiiW9MFj9wHZJ+escuIQ7KUEefvWsZ4amaRlQHIpJKaNSpqIamo+vZGQAmFe39x3W3V+
         KU1q28bomCGcxta3Dncp2GZVR1WM95QlgytkriDB4dtd5Ev+nxk9FBZscFC03YntU43Y
         JiKA==
X-Gm-Message-State: AC+VfDySwWrx5Y29zD6rQwZACGO2c4Gcu861c4Gq5UYUuYe2KqCp3nIi
        0Bid79SKGd5VDGndc8Hx2CKrkg==
X-Google-Smtp-Source: ACHHUZ6ZiPvrIz6K4tB6CuVEa8QYxHChq5vidOfq3eJKi3df1TSayp6eW6FGNotvbq1v9eD8ZGAIcQ==
X-Received: by 2002:adf:ec4e:0:b0:2ef:ba4f:c821 with SMTP id w14-20020adfec4e000000b002efba4fc821mr12223707wrn.36.1683023659238;
        Tue, 02 May 2023 03:34:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b002cde25fba30sm30764590wrt.1.2023.05.02.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 03:34:17 -0700 (PDT)
Date:   Tue, 2 May 2023 13:34:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dongliang Mu <dzm91@hust.edu.cn>, smatch@vger.kernel.org
Cc:     Dan Carpenter <error27@gmail.com>, Vicki Pfau <vi@endrift.com>,
        kernel-janitors@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>,
        Nate Yocom <nate@yocom.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        John Butler <radon86dev@gmail.com>,
        Matthias Benkmann <matthias.benkmann@gmail.com>,
        Christopher Crockett <chaorace@gmail.com>,
        Santosh De Massari <s.demassari@gmail.com>,
        hust-os-kernel-patches@googlegroups.com,
        syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - fix GPF in xpad_probe
Message-ID: <f103fc8e-8cf5-435a-92db-56691c8164fe@kili.mountain>
References: <20230414125603.686123-1-dzm91@hust.edu.cn>
 <c3e0823b-2b03-4dab-b7cb-a8bc5151f0b1@kili.mountain>
 <011c00e7-c351-4331-8be4-1c184d5773e1@kili.mountain>
 <3ccc85bd-0541-4ffb-a207-dfc533a2c0aa@kili.mountain>
 <d49bb5a2-ed78-4b16-b7ea-b9c7748ca0e4@kili.mountain>
 <f71f3012-916c-5271-b908-feeee5a85a46@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f71f3012-916c-5271-b908-feeee5a85a46@hust.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 23, 2023 at 10:33:29AM +0800, Dongliang Mu wrote:
> BTW, do you have any plans to improve the code readability, directory
> orgranization, documentation etc. of Smatch? It's hard even for senior
> students to start with.

I have created some documentation.  Read the following blogs in order:

https://staticthinking.wordpress.com/2023/04/24/smatch-data-types/
https://staticthinking.wordpress.com/2023/04/25/first-smatch-check/
https://staticthinking.wordpress.com/2023/04/25/merging-states/
https://staticthinking.wordpress.com/2023/05/02/the-cross-function-db/
https://staticthinking.wordpress.com/2023/05/02/the-param-key-api/
https://staticthinking.wordpress.com/2023/05/02/smatch-hooks-and-modules/
https://staticthinking.wordpress.com/2023/05/02/debugging-smatch-checks/

Email the smatch@vger.kernel.org mailing list with any questions.

regards,
dan carpenter

