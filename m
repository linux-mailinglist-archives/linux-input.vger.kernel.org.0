Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAD434BAE6
	for <lists+linux-input@lfdr.de>; Sun, 28 Mar 2021 06:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhC1EmI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Mar 2021 00:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhC1Elu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Mar 2021 00:41:50 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CD8C061762
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 21:41:50 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 33so1409652pgy.4
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 21:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hsbRU4/3vJGfRJWOoeha09zfTNkNDsAnkj310IbJoAw=;
        b=Fl5mR2R1u6RI4TeDh5FoCtexDYB1D18fRThhhB7WVRYFqRB1d8WBIWUjkdkx/b6WsO
         ttdEUQjQsx+M0abuCVWPA7C7uYdEcEeB9jdoVKNkxT6yMkeThlwLAw7aR1xBC6oJun8k
         2T5KK+4YrucG8RhSq6AsKl+TCLmdvNhYB7XBdmObjvQfuOJ6hW6HofiPZXh5S1cP6Cq/
         oCRbdC5Uam5sQoNJyyQZeqlfRhZhJL5fE1cndKGOyQqPFlyPNcDjRywYreUnWWQXvehr
         Hj8E/x+8Q1cNao0tPiHhH9qGz8TJIrWS1HQ5rXx27EnVMCwgSOb1BP5DFcD19LXMTLE2
         dO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hsbRU4/3vJGfRJWOoeha09zfTNkNDsAnkj310IbJoAw=;
        b=UorMUn3ZGvoRUShcXChsIO0uPou8FMI91XQkvbrmNwy2zd3zNS4gl/SBffQm8lFH2u
         NZV5uhSJEBP3G00QaTAi6O9EFWEhLjgQd4bqn8Rp+dYO4aWHxr/SH32Z5j1kxrrxHBtb
         CYIcLQltzS6+MbrxRyrbeXfPOxmiic9akmUVnXocoHo+qcI4BtIGiC9Lnc1/L3PVCeoA
         hNDE7i/5G1FX0+m3S6mihtg559pxW9kXK7MgYjW+A/k4cY1FE8KS15H2xUwXYvsZjmtp
         oq09cvEJ8Sbs3wCZ59ATN+bhv9ZPbhNm0ob7KFbsowdN5S/wdW1ILrHWnN7ebnYTyKBV
         lIIQ==
X-Gm-Message-State: AOAM533/HWRdiO52M3mFW7SZOrHnuYpcC5LGJk5St4dgNMG2zAkTd/kS
        RRH52xEqryzm/EtyITa+Ohc=
X-Google-Smtp-Source: ABdhPJxxEUb593yrgYANJUak22tUoI+JIvgjtNPM7P2F+P2vhT8Y2DJxBBfFu8Ax0POR4oiycVzVDQ==
X-Received: by 2002:a63:a10a:: with SMTP id b10mr18416764pgf.121.1616906509460;
        Sat, 27 Mar 2021 21:41:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:583b:ffbb:e0ea:e126])
        by smtp.gmail.com with ESMTPSA id i7sm13723268pfq.184.2021.03.27.21.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 21:41:48 -0700 (PDT)
Date:   Sat, 27 Mar 2021 21:41:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v3] Input: imx_keypad - convert to a DT-only driver
Message-ID: <YGAJCutUK72zaqjc@google.com>
References: <20210327194307.541248-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327194307.541248-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 27, 2021 at 04:43:07PM -0300, Fabio Estevam wrote:
> i.MX has been converted to a DT-only platform, so make the
> adjustments to the driver to convert it to a DT-only driver.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thank you.

-- 
Dmitry
