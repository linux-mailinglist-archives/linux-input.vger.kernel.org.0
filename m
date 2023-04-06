Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB846D971E
	for <lists+linux-input@lfdr.de>; Thu,  6 Apr 2023 14:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbjDFMkI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Apr 2023 08:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbjDFMkG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Apr 2023 08:40:06 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657A476A9
        for <linux-input@vger.kernel.org>; Thu,  6 Apr 2023 05:39:59 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id o12so17302763iow.6
        for <linux-input@vger.kernel.org>; Thu, 06 Apr 2023 05:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680784798; x=1683376798;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=JvHQq6jDpjJvwT6PkJYmX6TmCq2EAfryhNRMWAJ3mTNA5mBvoSBF8SJDTZxK7dDU6p
         VjB2VxTNUBl1WEd4EtVxJi+gTdDuxneFWVTHczYHc75E2oIblKYn+XvVe/MFe8bFtjvZ
         GiTq9m5gEfNZRx0FqwPAcDTgOPY9OVGgAHAd8Xp0I6f5E9tcOraXeKS/SmdV1yiPol/D
         3DuA099tgBp8uVQvC7Gg9aQSifHOjaJ4wx2rrnQvIZ1cQlnwOIDYgcnVCQrnkhYbG6fd
         cVQzjOW1RSviUsxpZ0wS5zrME8U1jYvk3xmKD7f1q/SkUAPPxkscPwgtMGKKvWrCewjX
         erfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680784798; x=1683376798;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=nhA6ZW9cecC3olb5CFZZNQOUBD7yEuZwEifGzleTB3mwPlfDB2qRtyN00gZ0NY//PS
         q4dMRMd4qCxnq0xE/dbUnHKQz7ZQh+ZB+pw0IfzuNG0QZtHKD6DZlmVOxYP7AayXL/+k
         F3OTcN6l8XuL6lFp94oxzrWwOCTunaMlmTHRgO+vi2/tt6ETWJG9mGEef1WNNx254dZf
         Zan62PFQ9bP3ZzNTZeKMMAdS8iLE62eQWuFYclNuJgq0jbhYVsv8p7oN4xKd/fy/nvVa
         Xiu8pTeO8R6dNX1pEVRPAAAQbmEkhXgF44IPM6AxIv9YDGm+Zr9eRBMFm3pxh7OyYJ2v
         +IZw==
X-Gm-Message-State: AAQBX9frhFGQIoA2kmGL0FbcvQcd8WI4VqdPoO0gNWcOgjOgi3CyeB7k
        ffCT/DgE1cY00Ao4B5BTnC1TsHzSb35lJ6jTo48=
X-Google-Smtp-Source: AKy350YuKUhlMWV0qnquIGioH92ye+h4pdKwLAkubULyFMrtfjM42b2B1YJNs5Mdm81ERvcHs1aRsT/9TYphVSxt2n8=
X-Received: by 2002:a02:94af:0:b0:3c5:1971:1b7f with SMTP id
 x44-20020a0294af000000b003c519711b7fmr4985239jah.6.1680784798591; Thu, 06 Apr
 2023 05:39:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6638:61a:b0:40b:2d08:d1bc with HTTP; Thu, 6 Apr 2023
 05:39:58 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <wertew30@gmail.com>
Date:   Thu, 6 Apr 2023 05:39:58 -0700
Message-ID: <CAKBYrSfLP-WRTzq82Oxs+syYwavaKgu7BM1iLEqPSgkx_Q=YQQ@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
