Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBA4ECFB7
	for <lists+linux-input@lfdr.de>; Thu, 31 Mar 2022 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350557AbiC3Wbl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Mar 2022 18:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbiC3Wbk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Mar 2022 18:31:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7BF5BD30
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 15:29:55 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l9-20020a05600c4f0900b0038ccd1b8642so1309982wmq.0
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=tq/rii9bwPogdxxMLbUAn5HigKUuxkH/ZVV+GB29QQY=;
        b=lfokdsiH3ee1//vtoSqkBvQkNXfvip6EX5SMGVKCMaUXsoHdVFABOg4kwsNxaW7RA7
         ki08LpMxP7VI6jRvYA1/dU5o2v0TIvu1q6yQWPrqlI9fAOtrC6ZWOhdLzZqCoXZ2xAXG
         gWmY5XXwXQJk5rLKT6jYW+c/qfF7kqfbZk+2JHnldJV+WA1daEXDDG7SXFP3tezQtuux
         c/s1kDTZEoh5vMdvxwEHD81gfNB7+k/D9kmcG84d8TLyFbwVIZF5qbNEECXUgv1CjUZp
         8RJ8U0EIItL/ATo4Vr/lFbU0yL/EDryAcsg4OYvsmoTOnO9g/iar5SH4itR+HEy6+bKn
         VSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=tq/rii9bwPogdxxMLbUAn5HigKUuxkH/ZVV+GB29QQY=;
        b=GUXaVab6RGjoWNmfjMiY/0WEsLSSkooAl30ueO+nuIrG9xqZLjNwyB059ErPRkALa7
         Pyoc1Sf/i6kmLTSGCs5OPX4Yv5U5CsNn4O+qWM0rQ3qg2teCaKHOc5wnzbRlGkMoP61U
         Ife0KnHBVFLwJBBUkbq+CKWNnH1RR/kZ/PfyzGQKP6O98s75qyMhgneRy9qtgzMOnmNB
         FQfRfMAmGNw0RIA0BsB6oY8CEqtHM8Hy6JAUIaddvoZZiN/m3jmX3iF7EGQ9M6dQCAo1
         zxlhyKCfxecyd/yMW7l1EjXBT41mHorunlSx2fEK/+4Qdmb8g/3cbR6V/zCjfovKG19M
         ch0g==
X-Gm-Message-State: AOAM533b4tOVJncwCfsRb79dbk9DjADtNNBmfqX+hwzoR/rQQkgKbOQc
        oXTPmsctexzvoQKpeRcfC7lBjVyYvQSqWinn
X-Google-Smtp-Source: ABdhPJwYCd22Af55eB29uvJNxJt0PAT2YlLZBw+Ols0Ld8wvhrlt53oyTA62FzFRjm+i+3DGi2ep2Q==
X-Received: by 2002:a7b:ce04:0:b0:38c:6c34:9aac with SMTP id m4-20020a7bce04000000b0038c6c349aacmr1740036wmc.142.1648679393719;
        Wed, 30 Mar 2022 15:29:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:6d40:29d:ba85:78f8:3d80:548? ([2a02:810d:6d40:29d:ba85:78f8:3d80:548])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d6da7000000b00203d9d1875bsm21259750wrs.73.2022.03.30.15.29.52
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 15:29:52 -0700 (PDT)
Message-ID: <941a793a-d2f7-9c2c-59be-b3930e1acfec@gmail.com>
Date:   Thu, 31 Mar 2022 00:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Stefan Berzl <stefanberzl@gmail.com>
Subject: Status on hid xppen patch
Content-Type: text/plain; charset=UTF-8
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

Hello everynyan!

A while ago I sent in a patch to add support for newer Xp-pen tablets 
that even made it into patchwork:

https://patchwork.kernel.org/project/linux-input/patch/b401e453-9c66-15e3-1a1d-21f33b7a64e8@gmail.com/

I have never actually gotten any feedback on it though and am wondering 
if everything is to your liking. Anyway it doesn't build against the 
current tree anymore. Assuming there is any value it, should I rewrite 
it against hid master or hid uclogic?

Many thanks

Stefan Berzl


P.S.: Also sorry for leaving the header fields in the message body.
