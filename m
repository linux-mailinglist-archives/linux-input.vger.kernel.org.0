Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05AE5AD491
	for <lists+linux-input@lfdr.de>; Mon,  5 Sep 2022 16:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237156AbiIEOPx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Sep 2022 10:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237199AbiIEOPp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Sep 2022 10:15:45 -0400
Received: from mail-yw1-x1144.google.com (mail-yw1-x1144.google.com [IPv6:2607:f8b0:4864:20::1144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790D627B33
        for <linux-input@vger.kernel.org>; Mon,  5 Sep 2022 07:15:44 -0700 (PDT)
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-32a09b909f6so71949337b3.0
        for <linux-input@vger.kernel.org>; Mon, 05 Sep 2022 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=f8+wkscY0Mz9WNFd9ZPJmFW4bAcsP+7zRqQ/fyjtbFrj9O0NHuDG+8Xo6YRqoedIqv
         0vVnvFx3DmOSvCT3n0b8La5scXT4lG7JrkuAs1euKuVYBLFvUCqCUSzAN8MGSSh7zLiz
         7xeuVLzzWymd9vX9L1QInNsEMkrEEMB/9cWWibMrThxBeKZuELSK9iBPbWDv9LzNRBYY
         OaeqPflnVnpf4WCnIO0UEG/5u/legpk7bx8Fc3J43t7xdFwpdWGo/cCSJlPBYBxSnEN0
         oH8ge2+J20ELaYe1YwJngTfgXIEidu3s17Tbaa1EoYTCIJyXSIfXWnJlqqu4MroXKtnF
         U7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=lnm8Xr2aC8s/u1qpQ7kQ/3gRYsLWmFjwrrJy0DZI6zeVrDeL2rvS9BFEwgqUB9EyPL
         G1HRpBZO1IOf+wD3/ts+AB1HnKJpFhKz1VAu7U9mRvkUn672q8oGAPNVmSrqHyOUn4Ai
         K6Ot7KRZce3AMHtVY927hjoeIxJf9SErVO0CdAx/t+/HSb9smOWB61YZDBhDEiRzNGlZ
         6GSi6e7LCP4IgDu4cWUP/T5yzE7mMt1+SZ6DTeqp5jBWAf27rYKvbduBVtIGhM5Z8weh
         5m7DonQP1pYBXqLQKG1BKDxfJs+VqgLPcN7CSOlSFCNd8d7363MrK3lZEf21Rx03d3ta
         rELA==
X-Gm-Message-State: ACgBeo3nglgq3TpGxX23shJCrA+NGeZJtX+NlraMdGqvRIbZctZMBWTJ
        81sxPSRbPlX0PrM+8kZwIyA3k4w1zSCf1G8I7Qw=
X-Google-Smtp-Source: AA6agR5QY2I/2to+GpJC+yxgLLCYsS7mbQv3EEJ5EwtnDQqpnV8MVQYgqVfc44Ne/IApaAhXzmOnzgcdrMEAbTm9/Us=
X-Received: by 2002:a81:c0a:0:b0:341:44bb:d640 with SMTP id
 10-20020a810c0a000000b0034144bbd640mr31149360ywm.372.1662387343771; Mon, 05
 Sep 2022 07:15:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:fb0c:0:0:0:0:0 with HTTP; Mon, 5 Sep 2022 07:15:43 -0700 (PDT)
Reply-To: maryalbert00045@gmail.com
From:   Mary Albert <ourogounimouhamed@gmail.com>
Date:   Mon, 5 Sep 2022 15:15:43 +0100
Message-ID: <CAHwLVq6UdCwjD8Xojx1wAOMKrrCBPyof5CtyU5KhzUOA-Ma65g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
