Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450372EA0BA
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbhADXX2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:23:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbhADXX2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:23:28 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC371C061793
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 15:22:47 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id l200so34028094oig.9
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 15:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=C+d3lVLuLz38tDIxau41wBeg41R+BcYwPRZlK40hjJo=;
        b=Hka4cwDLqs3f+SKN6iFVgm5aVQTghhg9o7KINp715TeM2pd1EdLIqXso3boEgpSgFW
         dSKF9kkCDaFtADeHAUcsFIEEpoKTF3pT45L+DLFFrJjL4XQGSosrMrHzKv7QmQbJT6CN
         b9DOcbqKH5gNMjh7GaRAGbWbg339mzsoyta0ri0gRM7HPz1Z7l/Kq7+S1vEH3WqWmv8C
         3l7je3OtH9fSlYhRdNoBX7svKcvS8JJ3IbJSiEL0r37n6ByKqXe3bifMk4fsvCZRXDrk
         M/DMvxM8GIFjzqo4GlXfvNh1poZ+gCN+aihMPyC4RWcNWx6H+VzgT6AY869K7Qt5k4Un
         sDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C+d3lVLuLz38tDIxau41wBeg41R+BcYwPRZlK40hjJo=;
        b=FU+CVWOtN6evTPyt7MG16XzNrbTIPbAp6KuwdxpIUCxLr5oAYwN9LjtR7ZOusGNDke
         6QcMrUnL2Dkhxm893CDCVXDMQx9LE2mCZvjljVFp5rgQjyZvotg+Rt0KQySlY0ghy1Tl
         TDtgQz3cwbDtfgBFFT9Mc1VJF4cqfeR6jkemTUfqv8ovODYTbw/1c1cPwk0WYP/vL9ra
         QPdKXfXuqeafDsnwQsOyf1u3fnYYu3YE3jZxwn9PwRKjEL7shb68aTW7TwmL5hP1Flfr
         BZjwlX/JUfd5RRNC1qQMfo6xq8w2/XkIgeV/rsbILLtHq7YeN+QpXtVPqFj59Ja2j0Oe
         8UFA==
X-Gm-Message-State: AOAM530bIoPcB0sSLyj9gRjxNTKkdFW7y/u49g12egcllMiX07OBVbwa
        R9Tj3N+GVFI7zfvqbhiQyMZHGK6DXJU=
X-Google-Smtp-Source: ABdhPJxy+zMp4ayab3Fh09mwTJVXcb7Ho5ctmgh3RFu9SDDZMddjTkd6XbgwNpbjfOfCtnkMRof80Q==
X-Received: by 2002:a17:90a:5894:: with SMTP id j20mr1060956pji.107.1609800999423;
        Mon, 04 Jan 2021 14:56:39 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h11sm370687pjg.46.2021.01.04.14.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 14:56:38 -0800 (PST)
Date:   Mon, 4 Jan 2021 14:56:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     linux-input@vger.kernel.org, po-hsu.lin@canonical.com
Subject: Re: [PATCH] input, i8042: unbreak Pegatron C15B
Message-ID: <X/OdJKIXDajVTnyA@google.com>
References: <20201228072335.GA27766@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201228072335.GA27766@localhost.localdomain>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 28, 2020 at 10:23:35AM +0300, Alexey Dobriyan wrote:
> g++ reports
> 
> 	drivers/input/serio/i8042-x86ia64io.h:225:3: error: ‘.matches’ designator used multiple times in the same initializer list
> 
> C99 semantics is that last duplicated initialiser wins,
> so DMI entry gets overwritten.
> 
> Fixes: a48491c65b51 ("Input: i8042 - add ByteSpeed touchpad to noloop table")
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Applied, thank you.

-- 
Dmitry
