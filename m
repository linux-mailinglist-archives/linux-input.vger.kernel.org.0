Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71ED0751243
	for <lists+linux-input@lfdr.de>; Wed, 12 Jul 2023 23:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjGLVLj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 17:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbjGLVLi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 17:11:38 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5A71FCD
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 14:11:29 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6686c74183cso33397b3a.1
        for <linux-input@vger.kernel.org>; Wed, 12 Jul 2023 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689196288; x=1691788288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mEISEtXVLCnOqtjDWmoSzJcHSEwCtQ7AljaMITB2Ek=;
        b=SJPS2We8PmC5g3ecCYJWv0lsuJOhRRlY3MQOASyWDo3ZHWRxh0Hhf5w2XLOyfLmOiQ
         QyIixbG4dpqaNq3B1qRJI39i5kH0ohMCI/SlxSDiDjBVqvSB/O70pLwqeZ0Ck16D1nEL
         2/7MczQNJYcAU7U9j8t78axZQmsQjaKcxp657/+zzuqKjiH1SIPATceRr+p98UapJQqj
         xP6M9C4EUCg5/Xcg8BZZC0VhjD+2Bndyv6p+DcscYUOPE/d1Xz3wjTRQ4CziEaFA838d
         BHINi4XQSsyguKvFALr8wAZKu9ymGjcuwtFHsDYNmVWIkoJlzxlz12lafFEdv9U9kPuB
         yUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689196288; x=1691788288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mEISEtXVLCnOqtjDWmoSzJcHSEwCtQ7AljaMITB2Ek=;
        b=Bf7MGKGMUvv+T+1eZ5rjjq3OoFsz/KHNPwcfR8BQ57+yAqMNsb1zvPdMuZTkg+LZmc
         Xb2JHJUr3EdBdUhpbxWqE2BdCMJ98q0HlYSfpOZa1+IufBcj9r/m+WhOkwR+Ai7GoRxg
         fSzAoafAnBbywVUfnyNNiUvD98Kb7zP8tg0XdzgbCkI9Tljjn8VLNUezGh8pKG9cMlpd
         GJ3EChCHAD4Tx13iXpg4XC7a/h08j10SHUuUFUvRZELry3B6+RGdqjNzUZ+9qjGQODWi
         Gv1DJ+jZLVpIdRGGeF7TgS+zZIxhctDnA1H0+ET+OcXY7gE2fJfV2KbLbO5T13s6S3DF
         VLoA==
X-Gm-Message-State: ABy/qLbkf4fxGAMiB3IahBAby5shmwO17fKms+rnrudCMWEKUd+5atam
        09nFdf98ncMNWnctS01Guvc=
X-Google-Smtp-Source: APBJJlEykMxvp6PI0/SYYBKbGAU/tFDtjhh9bajsEu5Nm1KmdhuXwP6EkZNos1xkd/PkI1OxeMONBQ==
X-Received: by 2002:a05:6a20:8c07:b0:12e:5017:ad3a with SMTP id j7-20020a056a208c0700b0012e5017ad3amr18318968pzh.23.1689196288501;
        Wed, 12 Jul 2023 14:11:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a606:1b1e:7f66:3ee0])
        by smtp.gmail.com with ESMTPSA id j9-20020a62b609000000b00678afd4824asm4108768pff.175.2023.07.12.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 14:11:28 -0700 (PDT)
Date:   Wed, 12 Jul 2023 14:11:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Roi L <roeilev321_@outlook.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: rotary_encoder - don't double assign
 input->dev.parent
Message-ID: <ZK8W/QvLwnVrSYMV@google.com>
References: <PH0P220MB0460B69CA018F5515F5FACDDDD53A@PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0P220MB0460B69CA018F5515F5FACDDDD53A@PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 07, 2023 at 12:10:40PM +0300, Roi L wrote:
> devm_input_allocate_device() already assigns the @dev.parent field of the
> input device/structure, so there's no need to reassign input->dev.parent
> to dev.
> 
> Signed-off-by: Roi L <roeilev321_@outlook.com>

Applied, thank you.

-- 
Dmitry
