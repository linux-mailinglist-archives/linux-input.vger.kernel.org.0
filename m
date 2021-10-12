Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63696429B27
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhJLBu5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhJLBu4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:50:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B442BC061570
        for <linux-input@vger.kernel.org>; Mon, 11 Oct 2021 18:48:55 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id x8so12438399plv.8
        for <linux-input@vger.kernel.org>; Mon, 11 Oct 2021 18:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CIWsSi//+ezEn/g//CKWQFqHu6PLQYaoQOQkZ4Kd09A=;
        b=Six/kuNhLfq8B+j/V4JbTfSjehukRbnFSEWDotY6nlv+1tGRfUT5jG55vw672d7TnW
         NoYBFrNKf5zgARHTLX9DAc1m5uO1hYBGCNxa1Df98eheS5Ftv0sqz1f5RZb6UnjiAWjp
         EVhDmzTci4ajPuKX1mYLRj+Dd07hn/Z9MBtr8oF2NoY/WvRF4JKQeODhFFRnO73lugvU
         KWsKA33CpC6qY1dCBXOddx3i6Oq/DqZsLcBZbdJyAFys7v9uvsThWa0JG4mmuDLzFfco
         VBTbmnyFd92+berge4E1MCAX19B0uOvDO0hneOCS53iItOl3WyykQ3eQMAXGvay746vQ
         1LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CIWsSi//+ezEn/g//CKWQFqHu6PLQYaoQOQkZ4Kd09A=;
        b=zjtKYzevoGpYQDX0UydDjo3ykHhZ/vAFdp1XuIwVthB6b3WGd/6iqNnnH5LQkLIUu3
         a9qYSzjWynEy+4Nzb4LgN1K1xUyoAjp+bHAINmu2Xnvavs3x/TYbKGOao3EwdUwRdpgA
         eZG3eIrzbEiGmN+RkS3Cr/RtjpAH5txc03oXDs2hEnMgTfGFmmjgTa5CtGv/AuqHX4cb
         s5c1A3ulfQYsSAiFgc/IYlWKehIxTJqzRfIdrMQOrEGgsuDXKSoLLfPtohrN3MUic9An
         S4yf17PWR+7F+fquD0KGibQn2kvM/hEaTi4+CcUd1V+26ugkhPiQOUOR0mRXqzd0qvx7
         KWCQ==
X-Gm-Message-State: AOAM532xvff/BAlO+wSTva8Vn3zHrTCwuod/VtJYm3PV4ryx94K/jeGr
        1gQ9XvncILK+HKdjupE7I/kGN44WHrk=
X-Google-Smtp-Source: ABdhPJy7s70jSlfwOv28tiqdj3hPC/vKjala+lIW/aqkNTeQHHkT9qEpRo1/mU/wWS4vkAc8xX4zVg==
X-Received: by 2002:a17:90b:1e4b:: with SMTP id pi11mr2830952pjb.179.1634003334709;
        Mon, 11 Oct 2021 18:48:54 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id j4sm9639392pfu.94.2021.10.11.18.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:48:53 -0700 (PDT)
Date:   Mon, 11 Oct 2021 18:48:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: snvs_pwrkey - Add clk handling
Message-ID: <YWTpg35wyYS1uoFZ@google.com>
References: <20210922094300.354227-1-u.kleine-koenig@pengutronix.de>
 <20211005200005.bau4trn26wu23bpw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005200005.bau4trn26wu23bpw@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Tue, Oct 05, 2021 at 10:00:05PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Sep 22, 2021 at 11:43:00AM +0200, Uwe Kleine-König wrote:
> > On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> > associated clock. Accessing the registers requires that this clock is
> > enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
> > having the clock enabled results in a complete hang of the machine.
> > (This usually only happens if snvs_pwrkey is built as a module and the
> > rtc-snvs driver isn't already bound because at bootup the required clk
> > is on and only gets disabled when the clk framework disables unused clks
> > late during boot.)
> > 
> > This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
> > snvs clock to pwrkey").
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This patch fixes a hard machine hang that occurs on an i.MX8MP based
> machine in ~10% of the boot ups. In my eyes it's suitable to be applied
> before v5.14 even.
> 
> Any feedback on it?

Sorry for the delay. As you may know I strongly dislike dev_err_probe()
as it conflates the 2 issue - error printing and noting the deferral
event that should be implemented by the resource providers (and I
believe Rob had WIP patches to push this reporting down too providers).

Could you p lease resubmit with "normal" dev_err()/dev_warn()/etc and I
will be happy to apply.

Thanks.

-- 
Dmitry
