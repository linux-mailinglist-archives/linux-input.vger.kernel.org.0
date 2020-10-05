Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7428B282F33
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 06:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgJEEHs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Oct 2020 00:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725844AbgJEEHs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Oct 2020 00:07:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEA2C0613A6;
        Sun,  4 Oct 2020 21:07:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y14so5142864pgf.12;
        Sun, 04 Oct 2020 21:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kR14db6Ki5aihI8usj3ZmbgmzWosbU7rqzy9hS9hMQg=;
        b=lyffoknSw5PBKePgYqy/rffojx8eMHQbUamKEQMVfWodEcSV0KocKRhzqkZBKfBV7i
         08UsBBLfqqrEnvoR7sB94CADgBc6MOSM0FqRn1kirij/0bV6vv/0eYG6lqzCGk3Yj+Xh
         MffdN6t6RYa7x/HrIfXzL4oTqLtcV19fYtF3ns+uixO4BaB4ACMt2umufMIBYsWdHGzq
         BiUZC/bPO+A14mG72+LjlqbEOUM+5KPVX2Uy1fj0x2FKQ43Pi+wNsFitfIf9fzExrK0z
         I7fhFM3RnqlVOahrz0jPczoom3GbLCcvjqlf3Bh5NbuFfwhrVKwFp0RtnfymKmmVl1WV
         9iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kR14db6Ki5aihI8usj3ZmbgmzWosbU7rqzy9hS9hMQg=;
        b=FJdk+iKpaLh5Codl9KAyDktrQ5Mkn6/3NLdE2GKmLgwZfibLppY0cDkwUWQ6OHDbVw
         4wyvVygTnAFVyZDo1dJYrgk/iz1UNONWkQaaWc4BkekD9Djyu0XKef8xxgJMhBpeuzxn
         h48PsVDR3B684uwg6VbhLnOY7RXNMLWPYrxx/EIU4KtgmkPf8iqav+qgRmxUlgodYvld
         t09IkXO1K20Ek8tlLo88naWsxdf3Wj2NQvFGcJyXvbNNw2R/+gFGg6gpI8mXShqIRPf/
         MGzXtDl7rDFoplww+p32T/jBP/CpSnlna4t9QP/KsyPqIrqC1ji9hrWXvXW8AVlirTyo
         Wppw==
X-Gm-Message-State: AOAM5309Y/+gmd8G4sU6fF8PR8IQJuuNvoWxDUrM1nl643p6xAUDHmA6
        e9k4BoBlwqed4eF7orkOW/0=
X-Google-Smtp-Source: ABdhPJyZCBvYuuJGpF4w0tC9WlE3yjY1sXSQX+rnSwaYy3cxdFZdkYLZlkS4vydGJkiCx99lvuedPA==
X-Received: by 2002:a62:e404:0:b029:150:7d36:cd88 with SMTP id r4-20020a62e4040000b02901507d36cd88mr14939471pfh.24.1601870852233;
        Sun, 04 Oct 2020 21:07:32 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t15sm21767139pjq.3.2020.10.04.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 21:07:31 -0700 (PDT)
Date:   Sun, 4 Oct 2020 21:07:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     michael.srba@seznam.cz
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Paul Burton <paulburton@kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: input/touchscreen: add bindings for
 zinitix
Message-ID: <20201005040729.GF1009802@dtor-ws>
References: <20201001122949.16846-1-michael.srba@seznam.cz>
 <20201001122949.16846-2-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001122949.16846-2-michael.srba@seznam.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 01, 2020 at 02:29:49PM +0200, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds dts bindings for the zinitix bt541 touchscreen.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
