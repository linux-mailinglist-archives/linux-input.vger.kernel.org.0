Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EADA302156
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbhAYEov (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbhAYEoa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:44:30 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91221C06174A
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:43:50 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id f63so7677955pfa.13
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4WSv8w3kEmYtQO9zSLp4XJyY+bRlWxxiWBnpNSreq1o=;
        b=GA1HRNmtm8VeiXy3gtEXiP5J+ewYBPBT7YYr7A06lenidKx/sX5vCXRdZP6q4J+oYH
         rdRhPej7WTEorQ7x3bwt1jdrH8Dl6Hxg8d8YFxXakEtJRnc+rHFAPwEapZnV+j2pLHhe
         P/4cHZedGdbJet7MQ/Wkb7Ee7TcjqtRLPU2/hY9e3TVRz3gfR+/tn3E70+V7PmbGd1zz
         WBzOxK2d5hOspIfhnqlFPqLKWHaemSQ4c9pYpxc3O9ZVUJ1XuRFW4fqKHRlnnkDBHnqU
         /M22p/TKuWfmjLLkq97VlrFpYwxvP0zv0wXPiIA0orwwEeHM7/xm6yobL3RiNUrXlF34
         QxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4WSv8w3kEmYtQO9zSLp4XJyY+bRlWxxiWBnpNSreq1o=;
        b=Oj4Frfuf6xih/TLw6vTNnR44V6vPz9OJ42nZvXTr+L1Lslqah8lzm+VF8lsWymdQQ4
         Y1o49EqLtUFjw6E3yV70HH8AK7DIixk8q7olDbmvC2XGZ2A5p5xumVKBlh7DEWmbsAF0
         az3mQ78QyuEl32QF/jM2Z7EH9CKjzCGaLw6yji7TV89s/a3JytgoPYMIrjLHcrpWgQR5
         408rui3MYviF2ckKzbnlXoZBXQRWiRLSwLmJihsXpMrBxT4Ma+TUF69gI3FxRtidy7AQ
         Nrp6FYwx1B8dW8J5op2hK9mHoxlT5NiQ/gFVB9rNqVaHBzXQtYxkfVJjQyqjmUFokhz+
         Q4Eg==
X-Gm-Message-State: AOAM530282XUL+lvB3fsPT5ilv0Tw1hN2dVPacByyohgGlyGuCqCwzGe
        IsydOiXIdZVCiBos1htUjCw=
X-Google-Smtp-Source: ABdhPJzoDQiYhXWGzesMrxFc6OP+zL1MgiCUUqwcVEBw/TxiXBgkYst3a2ZrnY0L8icnd0M1phsN0A==
X-Received: by 2002:a63:5d4b:: with SMTP id o11mr138948pgm.354.1611549829976;
        Sun, 24 Jan 2021 20:43:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z29sm14858477pfk.67.2021.01.24.20.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:43:49 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:43:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 09/10] input: iqs5xx: Make reset GPIO optional
Message-ID: <YA5Mgtct6WFsxFVi@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-10-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-10-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:45PM -0600, Jeff LaBundy wrote:
> The device's hardware reset pin is only required if the platform
> must be able to update the device's firmware on the fly.
> 
> As such, demote the reset GPIO to optional in support of devices
> that ship with pre-programmed firmware and don't route the reset
> pin back to the SOC.
> 
> If user space attempts to push updated firmware which would rely
> upon the reset pin to wake the bootloader, attempts to reach the
> bootloader are simply NAK'd and the device resumes normally.

Can we maybe make the firmware attribute invisible in this case? Or
return early instead of failing to enter bootloader mode?

Thanks.

-- 
Dmitry
