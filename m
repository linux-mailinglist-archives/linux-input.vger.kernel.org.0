Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0CA6F3B73
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 02:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjEBAkC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 20:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEBAkB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 20:40:01 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FB9173D
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 17:40:00 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1a69f686345so23552905ad.2
        for <linux-input@vger.kernel.org>; Mon, 01 May 2023 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682988000; x=1685580000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dqhECkLBU2wNa4mfde7DdZnuIT07W4nSz8rErO3PJlU=;
        b=nV5kuJmjzMsmCBWB0cAwm9OMidp6xxODLVm6h5Y5kNCqqghbjEmBYFY5y/fGcUQ+5W
         93wpxw6BX9fOWBLZ2qzFhiF/Kk2PWLoAyfOi0FX2sik6Y/HMVsdsrAlcMdwatniKWi/2
         NJtXuCld+He0J+Gp6NLn8fX8yJJAFh77NYoBYoVDYiokGFwJGWcSENepej1KllXKARNf
         qDYC5Dnl7nMg1kTuOhw8cdShlsUx0lK0fCh0nGx0MXlvDS7pX1fYMLAf9UzlcNfV33QH
         OAo4r54pZlezNCBsFyf/D+NbWWxEd1neP8CKeOea+tRcYweNU/3qUjFI3HtwGZA5imOb
         7dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682988000; x=1685580000;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqhECkLBU2wNa4mfde7DdZnuIT07W4nSz8rErO3PJlU=;
        b=IQtWZ3pPqVyLVHRXLV967Rl8jsvJHlOExQdVt04bse+kKXmQo2xzs6/H6LD90VbUMy
         DjKcF9TzggcJIQnnb3UEjvvyAmxVbQmwn840Fo27MnruJfMGlrOg1zE4m3vRdEdWQCEU
         pQGv9GzgOjTFD7upDKDwSFw+kKB7tVo3rXTP44LlSlm6XOcCvrBFGP1aINplcduJqKw4
         UtWrCEkZuSPb+rh+Lk8dF+k8T2qy/yK51m1F7wovq4kV2/b1SInLhDNFKov6Cd1eCc3s
         uzNXwRh1cAen5lRZE5ixPywE6s0iXcioy9xnblg0MNj9QipRQcXRA4cXQHKqvw0faRKK
         5b9Q==
X-Gm-Message-State: AC+VfDztysaKkujiA1AS5Hi1scaB5KpdvYb19fKY+6v481cUDrpOJBwA
        DlCRcS4mpSkH+k+jH6whEiQ=
X-Google-Smtp-Source: ACHHUZ559frPHmxxznBU/GIOZZPsMSlY4TUik3xdu6BxgRbhWHAGe0B7JN/0AMNBI676hfD6jPW23A==
X-Received: by 2002:a17:902:c94d:b0:1a6:6fe3:df9e with SMTP id i13-20020a170902c94d00b001a66fe3df9emr19873976pla.47.1682988000129;
        Mon, 01 May 2023 17:40:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b6ce:736b:e4f7:adb])
        by smtp.gmail.com with ESMTPSA id bf9-20020a170902b90900b001a245b49731sm18426446plb.128.2023.05.01.17.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 17:39:59 -0700 (PDT)
Date:   Mon, 1 May 2023 17:39:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] i8042: add missing include
Message-ID: <ZFBb3IjgyDJIIokk@google.com>
References: <49fd4d400d1ab62095e5ed75a6637f883c0d071b.1682795105.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49fd4d400d1ab62095e5ed75a6637f883c0d071b.1682795105.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 29, 2023 at 09:06:49PM +0200, Michał Mirosław wrote:
> <linux/i8042.h> include uses ENODEV when included with
> !IS_ENABLED(CONFIG_SERIO_I8042) and so need to include it.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Applied, thank you.

-- 
Dmitry
