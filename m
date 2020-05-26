Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DA51E1A2D
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 06:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgEZERY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 00:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgEZERW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 00:17:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF93C061A0E;
        Mon, 25 May 2020 21:17:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu7so666476pjb.0;
        Mon, 25 May 2020 21:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6o/o+Jv3gwNHSfvO0tkT6qW0FWSl9BT2+HXVVh3U+D0=;
        b=BHI6H2w15Aqi5jiqB4PePC819f5X/HN8LSauSUa1/yx5dye2yFOlcsiHT2tKpBtnDW
         NMvajpNLn56HX70Z2MCK1ut6clYudn3Fs/whhGOtaeXe8rq+z0be4czEFgfNbpE61DrS
         wN/LN4Rfkk/xhR438yyd+jfEMXH0Epb0yjuiVlfgrnRgbyItnwY3FkMgYYwJ8TnhCXUS
         +2TQirueZYRuYqTTcP0Sy2As6vwwxrCSs3yoh2ezmg4LDTo3Q67pnyT3oV+jmvCYacIK
         SXuJmHB94c8jCfAKQeqcd+UHWjcC9Mlp9SjPCCZXT7lgnxulpl0c79auw/XobOyVRvDO
         FXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6o/o+Jv3gwNHSfvO0tkT6qW0FWSl9BT2+HXVVh3U+D0=;
        b=SIUKnPNIFvD3PPxSs7IFWURRH5Du51dk20aFLP7HXnKI5iG0fgTbybaKwJroDl9krH
         rcgkcqW0lp6oqn9NqcHG6jkpKwdIG5q+MPVh8aQkhImA6MwWDoiYCQy6G+KQdcMedbcu
         YgIQ11bgjL/i1QLBv3tY9gjFuCUbwuDsvfAm9WkOlk+f+sHAdqJ5+gdWGsNURCqYBWaj
         27m+Y4gEHYATJalThYqRqocfXnIz7J+c6ddvU63ryyow9lCQ6rCSsutS+U3xxtvIlw6X
         elPaxg+z4n9/sejaJG3Ygy53aB/XVi3sTabNpLB8Sq+Cio96WJoxAWpLdcJSgkDTcCYd
         hpbA==
X-Gm-Message-State: AOAM531PceIu6WFWvn5EabfsfeNVkum27tdsTABWR7808EBnjXMXl0eL
        hC4Yp9Sox5RJkPAzD9bR1wQ=
X-Google-Smtp-Source: ABdhPJznqcK2/wo1dTuzvWcN7qrBYgqKOYix74k5a+mmoQVAuraoW75+CsDhQ3JkxsSgKqRXUjUJPw==
X-Received: by 2002:a17:902:7885:: with SMTP id q5mr31302825pll.320.1590466641982;
        Mon, 25 May 2020 21:17:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id j24sm12892058pga.51.2020.05.25.21.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 21:17:21 -0700 (PDT)
Date:   Mon, 25 May 2020 21:17:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Jingle.Wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw
Subject: Re: [PATCH] Input: elantech - Remove read/write registers in attr.
Message-ID: <20200526041719.GH89269@dtor-ws>
References: <20200526022246.4542-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526022246.4542-1-jingle.wu@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Tue, May 26, 2020 at 10:22:46AM +0800, Jingle.Wu wrote:
> New Elan IC would not be accessed with the specific regiters.

What about older Elaan parts? We can't simply drop compatibility with
older chips in newer kernels.

Thanks.

-- 
Dmitry
