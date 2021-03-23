Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C04346B1E
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 22:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhCWVdn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 17:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbhCWVdl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 17:33:41 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17526C061574;
        Tue, 23 Mar 2021 14:33:40 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id h25so13073602pgm.3;
        Tue, 23 Mar 2021 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9uLSI7pCauYi75mP6B+G3pQEjSzmPOH6dlya9xeGJqY=;
        b=i/sZnzjYVXP0+mVX1OPKfr3eKHCWZVGzMAwYOby/cIW70xW+OZtdzPvtJMWOYJHApw
         hEbcipYtoPLGULtt9VRpJHp+aE6ogCCFGAqqlj/U1kaATZeEUxNrJ//BQ8PCUXAhEQc6
         UOTOSioL5hZPRPGSm8Fm6kBzCiI0oPfbRANOZ6yLTMeDF64COnhk2OVgXqd5Z1mxJwy7
         unoiGudUfljx+7cLIxAF3vN590SovV3hK5h81ZRm/mgSih5yWJ8HF6+GXdDAxIDMenrB
         V6/OgEI7eyByW62UvWYtcNQrFEhThB9Ykk5eKj0HRCmQn84lyIeLAfJTZqnAhxZQP3Bl
         i7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9uLSI7pCauYi75mP6B+G3pQEjSzmPOH6dlya9xeGJqY=;
        b=T7tFh3jHKK30SwfEy+zLsXb6aRUUKkTAdXrqp9nq5DBUxam1C/sEcuYXyRM2IKpidG
         Erk1DVUOP5qYM6K3Py5UWkqtq8wge1JCQrIqwKoRU2Y9xJSjJ8sHBGwBfUqgNkaEZcax
         nPda0WAaTnM7Rtgb8bG6xPRrBJZI93MGCtDbMjKpXTRDWF37EpoTgpojqexSb2MH+Ywt
         FmGNi4HdzZ+gDXD9n8MRGbsIr7wMERwpijX/XlSX7EV3hyQUrGHJMzpYDXwyUPntRkAg
         Tz5ZGIQZ7jIf4NEVjtJcP6DHWeHJLnVJ5cF6AHGNyW5IssHaYskIMbGrNm48C+b6yhZP
         yT2Q==
X-Gm-Message-State: AOAM530c/heB+upajTFuhhadJwt8FMyMp48zdUfeKx4f0qxVJ6PWBC5Z
        pRpynukszSmteaPRK+/AfPc=
X-Google-Smtp-Source: ABdhPJzwiz7qFqyGSIaYVN7KrD7z/f4/ecOcVGSQQTpZ4hMMdRdk3vWpyaHpCo1gmS5bZe6h0EUcTQ==
X-Received: by 2002:a17:902:bd4b:b029:e6:a4a1:9d8b with SMTP id b11-20020a170902bd4bb02900e6a4a19d8bmr300291plx.56.1616535219673;
        Tue, 23 Mar 2021 14:33:39 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id z8sm118351pjr.57.2021.03.23.14.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:33:38 -0700 (PDT)
Date:   Tue, 23 Mar 2021 14:33:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] input: gpio-keys: Use hrtimer for release timer
Message-ID: <YFpesNC3mjqqLf8v@google.com>
References: <20210307222240.380583-1-paul@crapouillou.net>
 <20210307222240.380583-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307222240.380583-2-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 07, 2021 at 10:22:39PM +0000, Paul Cercueil wrote:
> Dealing with input, timing is important; if the button should be
> released in one millisecond, then it should be done in one millisecond
> and not a hundred milliseconds.
> 
> Therefore, the standard timer API is not really suitable for this task.
> 
> Convert the gpio-keys driver to use a hrtimer instead of the standard
> timer to address this issue.
> 
> Note that by using a hard IRQ for the hrtimer callback, we can get rid
> of the spin_lock_irqsave() and spin_unlock_irqrestore().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied, thank you.

-- 
Dmitry
