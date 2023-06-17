Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39485734251
	for <lists+linux-input@lfdr.de>; Sat, 17 Jun 2023 18:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbjFQQzK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Jun 2023 12:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjFQQzJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Jun 2023 12:55:09 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FC61999
        for <linux-input@vger.kernel.org>; Sat, 17 Jun 2023 09:55:06 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51a20138617so2718743a12.2
        for <linux-input@vger.kernel.org>; Sat, 17 Jun 2023 09:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687020905; x=1689612905;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=B7G7BepedhNo6t13ST6j2exw0x1ZwmPLVEEL3yxeHecRh038gzTrDkWWrtQmqVS3YY
         /TF2soaIOjayutNM5vRnbbrURmOkTvG32YHkiqOWlSlrgOt0PPfJfcsthvrEP0taYCRD
         gQlq1vPdNotdIXCMXJjmnfl2ndziy0omZ3xjLY/A8lmvOJCTX6mNudyTMnmGPXYlsNGa
         SFUlVFLDM9TDGIDCuURZ749AA75BYPM1yqy/zFBZM/bEBkNs/TzoywCUI9GBsl+7knrf
         ALRzVNGxJiZwybeZpbktw/E5jAWOAcdBl/UdW1eAcnu2hyYNRyekxtuBwVr/9vK1lvC8
         gWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687020905; x=1689612905;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=YnTmXMdSLZOnbfsvCb/tKsDsayaG2GQPS/P9DxJl/Y5jXhUvb7K9Auy9wQEIKXLQl5
         m3e2FeBWr6aggrmoEK7TVeOswfPQxaYlEOlkFnWII5RPPoTHvxqiVBFlrVebFxB9PjFz
         OrOjYmePDxNGfTreRX+pDtQQGujJvItTQm7FE1brUh1NYmbKA9D2CpmewZncyNLOAbVd
         PQjUdfWl1pwMztVG8Yn4mEdjR+rJXzeU2SB0vpf/Xy+fR+qAqHFLuaNFrppJ4gXZXwdN
         k+/ZQO5+2xQxLjvRCT4df7TUgOOAHLejDRYtCXf/SvpQ4RFejhLK+k0ywnv6xYWDLGc1
         3gMA==
X-Gm-Message-State: AC+VfDxshi+z4wAur5213W2C2uLLIUGvxgewMnmchTzJ11tBg6ZRZ1jq
        dc1GsNFCRa+idGqBjEh0RO/vktONNViswdq4jGs=
X-Google-Smtp-Source: ACHHUZ4vEX+inrtqwHd+bRSNE4Vl63pRotTdLXX6y1F+F4HxtrUIYCthBlskJGvNksHnytK6olEOfYgR6VPBeamEGlI=
X-Received: by 2002:a17:906:da8b:b0:982:26c5:6525 with SMTP id
 xh11-20020a170906da8b00b0098226c56525mr5401200ejb.60.1687020904881; Sat, 17
 Jun 2023 09:55:04 -0700 (PDT)
MIME-Version: 1.0
Sender: princeeminentunuebholo@gmail.com
Received: by 2002:a50:718d:0:b0:21d:e168:6561 with HTTP; Sat, 17 Jun 2023
 09:55:04 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sat, 17 Jun 2023 09:55:04 -0700
X-Google-Sender-Auth: EL0NkoyJdlUROZ0VFp0rOFL_6dY
Message-ID: <CAK0EZHQuR_Fh7-p5pqVzqbQd=4OLJtJJthAQUxoV08CqbXwgzw@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
