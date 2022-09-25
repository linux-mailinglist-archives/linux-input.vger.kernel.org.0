Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23375E911C
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 07:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiIYFSj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 01:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiIYFSi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 01:18:38 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A8D40573
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:18:37 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id w2so3816201pfb.0
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=iPoGtFSh7Ltq5Ia1/nMaOny0QlO7kAzvCvozXPR+PTI=;
        b=H9BHY5koSS0NHD4tioOPZV+CgOh0oPWueIoRAKcZYMyAQUrdmuUUEmcWqd48P8rsaF
         MRNTgoymqZKWOMFOSqi2W8xYzZG0WAmlFKuYcF2lkFjWDVioaOSMBfiXCAsxV19mlY/P
         dEpfQbR8fcf50l6zG8g58ZdWQgJfOhkRYbWx040uKGLyxwhuDc88QZNl+EuWWB7Sc/fK
         BSN8NU3mfEmA9Xj2PqOo0OC9HiRzCIxFQdigWvnfdKkNqTZzImQbAG25OZ2qILZguD/m
         eNROiubKLx9ZM2xxm61pD9aJEMXDARv+7MzA5fFDT2S1elzqqUVeC0JTaRuX2nnJdwHQ
         6+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=iPoGtFSh7Ltq5Ia1/nMaOny0QlO7kAzvCvozXPR+PTI=;
        b=bgH2a3mOog2dnknxv9Ll4ZEyOLV4hDpFoBG6Vs25C+0nE2sA5RaSMsZqYVxoaM1Rr2
         mklhzpcCK2f/laN0imPk+Ien80x2qw3C+Exg1xUGb9n31xe3zBQzISIAV9En4EfJ4boV
         s43U0h/Nva3PNHMTfXHwd4WXfwxNMIMPGp96EFBPvml6momsm+8T3Nza6oHklA1w3kTz
         q/xnYIaWjszXCvv9YlcBm3wtymgeWWWdZ0JKbOSTjksjeqXq5PTr+dtTPkK9VYqAQdqf
         BNRAMYQ7VLGl5UBCtR3X1pc4nJl7RATMwJok2QdHqcer9xDRocIREFaVFvb2AEziw72E
         F3pg==
X-Gm-Message-State: ACrzQf2BRbTDnOr+hNynTXNJXB2NUXaHLsaxFNcfW+1iVNXUGkPcJTKY
        6RsjKNBQ9AZpxX+5xJmNX+R118J3MQE=
X-Google-Smtp-Source: AMsMyM6KqInhpGatOUum5maM0BQjfRO7W7mTFRQitqvcHLzu+rpmFdxu9AgDnaTawf+Ym3FzCZ6XIA==
X-Received: by 2002:a65:464a:0:b0:434:883:ea21 with SMTP id k10-20020a65464a000000b004340883ea21mr15194404pgr.152.1664083117095;
        Sat, 24 Sep 2022 22:18:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:37c:3916:9a45:14cc])
        by smtp.gmail.com with ESMTPSA id 62-20020a621941000000b005500172034asm9219341pfz.131.2022.09.24.22.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 22:18:36 -0700 (PDT)
Date:   Sat, 24 Sep 2022 22:18:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs62x-keys - drop unused device node references
Message-ID: <Yy/kqhQxyY9QLR6P@google.com>
References: <YyYbYvlkq5cy55dc@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyYbYvlkq5cy55dc@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 17, 2022 at 02:09:22PM -0500, Jeff LaBundy wrote:
> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
> 
> Currently, the driver never calls fwnode_handle_put(). This patch
> adds the missing calls.
> 
> Fixes: ce1cb0eec85b ("input: keyboard: Add support for Azoteq IQS620A/621/622/624/625")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
