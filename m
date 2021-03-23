Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F27346B26
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 22:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbhCWVey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 17:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbhCWVeg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 17:34:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD9CC061574;
        Tue, 23 Mar 2021 14:34:36 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id s21so10687418pjq.1;
        Tue, 23 Mar 2021 14:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XzV5iTFFRxwiIThTNNC9D1IR/At6zFkZ2wYh9lkF1SU=;
        b=Jy7FC4M+wnWAOhFPxob1iQf1L5XGBjCj2qlrDLgjeDXvk/+kWeFghSYsmlkG7Hxoc1
         0i+aCswR0sETqik3aTEuE2u8aVoeo8vNhT++VHXoHdy2tmBNvWh9jCRzGGo3WRS3yzPl
         4fr3+OiPEjWDDZPc64/yV0yw6RSOLtsWBWgBnhVJMTPRihCcR021Eu1oGqHmxuRheq5/
         1afh6TzMB4XOb27SZiZ38lL9Tk9hEVz+O1lkhNIauMRAn3u9XsPjNGQpLvJBop2FhbtW
         Zhec0LJ1YgzXqOn2XNb/NXXnVPhjy6x9dvnDSSl24RBQZ8b26qK71rPHyjzISo9Uiv2a
         G7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XzV5iTFFRxwiIThTNNC9D1IR/At6zFkZ2wYh9lkF1SU=;
        b=Zwmi3aqKpYzEUg4XvqsyznCaVkRYu3BJw9E5BbqkVtKSy5Cvt8opTVW77izKneZgI+
         IWvujZarmfU6lf4s/7aq+eL3+eF0EABNi4MD3HPApMoLkAYXrMSJgAMSEQ7P8qgLnoIy
         m+8w5mUePSNCq4hio/3sFMMEoZZWGOUvu0+Uyf+CDd5xpgdFkELvufTHyA68lS9alPPi
         m5pJpMBxudqQMOsHhkcql4wYTpJCuMKb/4ND1WBvbNcS+vdMid5g69WpBq58Z8lbIeTW
         YZIiKuMDIdFDqEXtYr0F4YC8NxAtcFHmMM8Un09n1iaBtqTnN8tEuwX1NHCiE8iQrj5y
         skuw==
X-Gm-Message-State: AOAM530TYnFmfbS7wOw0jYd+dPC60eRt8QtwDg0JLnggiaA95Lw+QA3+
        B5369HV64RedWX7VmK5Fmps=
X-Google-Smtp-Source: ABdhPJxnJuEj+5k+aUzVsbSogIKDPj/wR4O+N2VxzAw3EG9nN5IHRwdA8kcnRDebzLc4ENgYQxZJ3g==
X-Received: by 2002:a17:90a:a503:: with SMTP id a3mr104638pjq.235.1616535276278;
        Tue, 23 Mar 2021 14:34:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id a22sm146699pgw.52.2021.03.23.14.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:34:35 -0700 (PDT)
Date:   Tue, 23 Mar 2021 14:34:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] input: gpio-keys: Use hrtimer for software
 debounce, if possible
Message-ID: <YFpe6EhydawiMjHB@google.com>
References: <20210307222240.380583-1-paul@crapouillou.net>
 <20210307222240.380583-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307222240.380583-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 07, 2021 at 10:22:40PM +0000, Paul Cercueil wrote:
> We want to be able to report the input event as soon as the debounce
> delay elapsed. However, the current code does not really ensure that,
> as it uses the jiffies-based schedule_delayed_work() API. With a small
> enough HZ value (HZ <= 100), this results in some input events being
> lost, when a key is quickly pressed then released (on a human's time
> scale).
> 
> Switching to hrtimers fixes this issue, and will work even on extremely
> low HZ values (tested at HZ=24). This is however only possible if
> reading the GPIO is possible without sleeping. If this condition is not
> met, the previous approach of using a jiffies-based timer is taken.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied with minor edits to make more use of debounce_use_hrtimer flag.

Thanks.

-- 
Dmitry
